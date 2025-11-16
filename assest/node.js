const { Client, GatewayIntentBits, REST, Routes, SlashCommandBuilder, EmbedBuilder, ButtonBuilder, ButtonStyle, ActionRowBuilder } = require('discord.js');
const fs = require('fs');
const path = require('path');

function validateToken(token) {
    
    const tokenRegex = /^[A-Za-z\d]{24,}\.[A-Za-z\d-_]{6,}\.[A-Za-z\d-_]{27,}$/;
    return tokenRegex.test(token);
}

const BOT_TOKENS = fs.readFileSync(path.join(__dirname, '..', 'tokens.txt'), 'utf8')
    .split('\n')
    .map(token => token.trim())
    .filter(token => {
        if (!token) return false;
        if (!validateToken(token)) {
            console.error(`Token con formato incorrecto: ${token.substring(0, 20)}...`);
            return false;
        }
        return true;
    });

if (BOT_TOKENS.length === 0) {
    console.error('\nError: No se encontraron tokens válidos en tokens.txt');
    console.error('Asegúrate de que los tokens estén en el formato correcto y cada uno en una línea nueva');
    console.error('Ejemplo de formato: MTQxNDAx...resto_del_token\n');
    process.exit(1);
}

const EXCLUDED_USER_IDS = [
    '1367946999969615906',
    '1395829010759417986',
    '1414017022181900358',
    '1377020329754628167',
    '1109916054194503741',
    '883917575917039616',
    '1306246360852594699',
    '1264381909316927581',
    '1340565825764986994',
    '1338011287103475753',
    '1207023285955600495',
    '1364634204897546320',
    '1364634204897546320',
    '848611343006564403',
    '1264969392790175746',
    '1264969392790175746',
    '1383460132427403284',
    '1383460132427403284',
    '773312579471802428',
    '865040838307348481'
    
];

let botsOnline = 0;
let botsFailed = 0;
const activeBots = [];
const failedBots = []; 

const DEFAULT_MESSAGE_COUNT = 50;

// **CONFIGURA AQUÍ EL TOKEN DEL BOT ADMIN**
// Reemplaza esto con el token del bot que quieres que sea el administrador
const ADMIN_BOT_TOKEN = 'EL_TOKEN_DEL_BOT_ADMIN_AQUI';

const command = new SlashCommandBuilder()
    .setName('enviar')
    .setDescription('Inicia spam masivo a un usuario')
    .addUserOption(option =>
        option.setName('usuario')
            .setDescription('Usuario objetivo')
            .setRequired(true));

function getRandomDelay(min, max) {
    return Math.floor(Math.random() * (100 - 10 + 1) + 10); 
}

function shuffleMessage(message) {
    const variants = [
        msg => msg,
        msg => msg + ' ᅠ',
        msg => 'ᅠ' + msg,
        msg => msg.split('').join('᥀'),
        msg => msg + ' ' + Math.random().toString(36).substring(7),
        msg => '᥀' + msg + '᥀',
        msg => msg.split('').reverse().join(''),
        msg => msg + ' ' + Date.now(),
        msg => msg + ' [' + Math.random().toString(36).substring(7) + ']',
        msg => '【' + msg + '】'
    ];
    return variants[Math.floor(Math.random() * variants.length)](message);
}

function createEmbed(message) {
    return new EmbedBuilder()
        .setColor('#FF0000')
        .setTitle('TODO HACK OFFICIAL 📌')
        .setDescription(message)
        .addFields(
            { name: 'BY', value: 'HANNIBAL THO', inline: true },
            { name: 'DISCORD', value: 'https://discord.gg/uPESr5v7yQ', inline: true },
            { name: 'DISCORD DE SP4M Y R4ID', value: 'https://discord.gg/tYepnaUbVT', inline: true }
        )
        .setTimestamp()
        .setFooter({ text: 'TODO HACK OFFICIAL', iconURL: 'https://i.imgur.com/AfFp7pu.png' });
}

function generateRandomString(length) {
    const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    return Array.from({length}, () => chars[Math.floor(Math.random() * chars.length)]).join('');
}

function getBypassDelay() {
    const delays = [5, 8, 10, 12, 15];  
    return delays[Math.floor(Math.random() * delays.length)];
}

function createBypassEmbed(message) {
    const randomEmojis = ['⚡', '🔥', '💫', '⭐', '🌟', '✨', '💥'];
    const emoji = randomEmojis[Math.floor(Math.random() * randomEmojis.length)];
    
    return new EmbedBuilder()
        .setColor(Math.floor(Math.random()*16777215).toString(16))
        .setTitle(`TODO HACK OFFICIAL ${emoji}`)
        .setDescription(message + '\n' + generateRandomString(5))
        .addFields(
            { name: 'BY ' + generateRandomString(3), value: 'HANNIBAL THO', inline: true },
            { name: 'DISCORD ' + generateRandomString(2), value: 'https://discord.gg/uPESr5v7yQ', inline: true },
            { name: 'SPAM SERVER ' + generateRandomString(2), value: 'https://discord.gg/tYepnaUbVT', inline: true }
        )
        .setTimestamp(Date.now() + Math.random() * 10000)
        .setFooter({ text: 'TODO HACK ' + generateRandomString(4), iconURL: 'https://i.imgur.com/AfFp7pu.png' });
}

const COMMAND_BOT_ID = '1414017022181900358';
const ALLOWED_CHANNEL_ID = '1414033806046007416';
const ALLOWED_CHANNEL_NAME = '☠️┆𝐓𝐇𝐎-𝐃𝐌-𝐀𝐋𝐋';

global.isSpamCancelled = false;

const botInstances = new Map();

function isExcludedUser(userId) {
    return EXCLUDED_USER_IDS.includes(userId);
}

async function initializeBot(token, index, isAdminBot = false) {
    const client = new Client({ 
        intents: [
            GatewayIntentBits.Guilds,
            GatewayIntentBits.GuildMembers
        ] 
    });

    client.on('ready', async () => {
        console.log(`Bot ${index + 1} (${client.user.tag}) está en línea`);
        if (isAdminBot) {
            console.log(`✅ ⭐ BOT ADMIN DETECTADO ⭐ - Este bot controlará a todos los demás`);
        }
        botsOnline++;
        activeBots.push(client.user.tag);
        
        botInstances.set(client.user.tag, client);

        if (isAdminBot) {
            try {
                const rest = new REST({ version: '10' }).setToken(token);
                await rest.put(
                    Routes.applicationCommands(client.user.id),
                    { body: [command.toJSON()] }
                );
                console.log(`✅ Comando /enviar registrado en el bot admin`);
            } catch (error) {
                console.error(`Error al registrar comandos para ${client.user.tag}:`, error);
            }
        }

        if ((botsOnline + botsFailed) === BOT_TOKENS.length) {
            console.log('\n=== RESUMEN DE BOTS ===');
            console.log(`Bots en línea: ${botsOnline}/${BOT_TOKENS.length}`);
            console.log('\nBots activos:');
            activeBots.forEach(bot => console.log(`✅ ${bot}`));
            
            if (botsFailed > 0) {
                console.log('\nBots que fallaron:');
                failedBots.forEach(bot => {
                    console.log(`❌ Bot ${bot.index} - Token: ${bot.token}`);
                    console.log(`   Error: ${bot.error}`);
                });
            }
            
            console.log('\nEstado final:');
            console.log(`✅ Activos: ${botsOnline}`);
            console.log(`❌ Fallidos: ${botsFailed}`);
            console.log('==================');
        }
    });

    client.on('interactionCreate', async interaction => {
        if (interaction.isButton() && interaction.customId === 'cancel_spam') {
            if (interaction.user.id !== global.spamInitiator) {
                await interaction.reply({
                    content: '❌ Solo el usuario que inició el spam puede cancelarlo',
                    flags: 64
                });
                return;
            }

            global.isSpamCancelled = true;
            await interaction.reply({
                content: '🛑 Spam cancelado.',
                flags: 64
            });
            return;
        }

        if (!interaction.isChatInputCommand()) return;
        
        if (interaction.commandName === 'enviar') {
            if (client.user.id !== COMMAND_BOT_ID) return;

            if (interaction.channelId !== ALLOWED_CHANNEL_ID) {
                await interaction.reply({
                    content: `❌ Este comando solo puede ser usado en el canal ${ALLOWED_CHANNEL_NAME}`,
                    flags: 64
                });
                return;
            }

            const usuario = interaction.options.getUser('usuario');
            
            if (isExcludedUser(usuario.id)) {
                await interaction.reply({
                    content: 'Este usuario está en la lista de exclusión y no puede recibir spam.',
                    flags: 64
                });
                return;
            }

            global.targetUser = usuario;
            global.isSpamming = true;
            global.spamInitiator = interaction.user.id;
            global.isSpamCancelled = false; 

            const cancelButton = new ButtonBuilder()
                .setCustomId('cancel_spam')
                .setLabel('Cancelar Spam')
                .setStyle(ButtonStyle.Danger);

            const row = new ActionRowBuilder()
                .addComponents(cancelButton);

            await interaction.reply({
                content: `Iniciando spam masivo a ${usuario.tag} usando ${botInstances.size} bots...`,
                components: [row],
                flags: 64
            });

            const allBots = Array.from(botInstances.entries());
            let totalSuccess = 0;

            let canSendMessages = false;
            for (const [botTag, botClient] of allBots) {
                try {
                    if (isExcludedUser(usuario.id)) continue;
                    const user = await botClient.users.fetch(usuario.id);
                    await user.send({ embeds: [createBypassEmbed(`Test ${generateRandomString(5)}`)] });
                    canSendMessages = true;
                    break;
                } catch (error) {
                    continue;
                }
            }
            if (!canSendMessages) {
                await interaction.editReply({
                    content: `❌ No es posible enviar mensajes a ${usuario.tag}. DMs completamente bloqueados.`,
                    components: [row],
                    flags: 64
                });
                return;
            }

            allBots.forEach(([botTag, botClient]) => {
                if (isExcludedUser(usuario.id)) return;
                (async function spamLoop() {
                    while (!global.isSpamCancelled) { 
                        try {
                            const baseMessage = `Ḧ̶́̅́̄A̵̿̀̈̒Ĉ̵K̶̨̰É̵́̅͒A̵D̅O ${generateRandomString(5)}`;
                            const uniqueMessage = shuffleMessage(baseMessage) + ' | ' + Date.now();
                            const embed = createBypassEmbed(uniqueMessage);
                            const user = await botClient.users.fetch(usuario.id);
                            await user.send({ embeds: [embed] });
                            totalSuccess++;
                            
                            if (totalSuccess % 20 === 0) {
                                try {
                                    await interaction.editReply({
                                        content: `🚀 Spam masivo en progreso\n📨 Mensajes enviados: ${totalSuccess}\n🤖 Bots activos: ${botInstances.size}\n⚡ Turbo`,
                                        components: [row],
                                        flags: 64
                                    });
                                } catch (e) {}
                            }
                        } catch (error) {
                            
                        }
                        
                    }
                })();
            });
        }
    });

    try {
        await client.login(token);
    } catch (error) {
        const errorMessage = error.code === 'TokenInvalid' ? 
            'Token inválido o revocado' : 
            error.message;

        console.error(`Error al iniciar el bot ${index + 1}: ${errorMessage}`);
        botsFailed++;
        
        failedBots.push({
            index: index + 1,
            token: token.substring(0, 20) + '...',
            error: errorMessage
        });
    }
}

BOT_TOKENS.forEach((token, index) => {
    const isAdminBot = token === ADMIN_BOT_TOKEN;
    initializeBot(token, index, isAdminBot);
});
