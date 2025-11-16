# 🚀 GUÍA RÁPIDA - THO DM ALL DISCORD

## ⚡ Inicio Rápido

### Windows
```powershell
# 1. Primera vez
install.bat

# 2. Editar archivo node.js y agregar token admin
# 3. Luego ejecutar
start.bat
```

### Linux/Kali
```bash
# 1. Primera vez
chmod +x install.sh
bash install.sh

# 2. Editar archivo node.js y agregar token admin
# 3. Luego ejecutar
bash start.sh
```

### Termux (Android)
```bash
# 1. Primera vez
bash install-termux.sh

# 2. Editar archivo node.js y agregar token admin
# 3. Luego ejecutar
bash start-termux.sh
```

---

## 🔑 Configuración Esencial

### 1. Token del Bot Admin
**Archivo:** `assest/node.js` (línea ~50)

Antes:
```javascript
const ADMIN_BOT_TOKEN = 'EL_TOKEN_DEL_BOT_ADMIN_AQUI';
```

Después:
```javascript
const ADMIN_BOT_TOKEN = 'MTQxNDAx...tu_token_completo...';
```

### 2. Tokens de Bots Trabajadores
**Archivo:** `tokens.txt`

```
MTA4NzE0MzY2NTAx.G1w2a....token_bot_1...
MzU4NDc2NzE3MDU0.G2x3b....token_bot_2...
NzI5NDUyMTU5MDk3.G3y4c.token_bot_3...
```

**Reglas:**
- Un token por línea
- Sin espacios al inicio/final
- Sin líneas en blanco

---

## ✅ Verificación

### Los bots están en línea si ves:
```
Bot 1 (AdminBot#1234) está en línea
✅ ⭐ BOT ADMIN DETECTADO ⭐
Bot 2 (Bot#5678) está en línea
Bot 3 (Bot#9012) está en línea

=== RESUMEN DE BOTS ===
✅ Activos: 3
❌ Fallidos: 0
```

### El comando está registrado si ves:
```
✅ Comando /enviar registrado en el bot admin
```

---

## 🎮 Uso

En Discord (en el canal permitido):
```
/enviar usuario: @TargetUser
```

El bot admin mostrará:
- Bots activos en operación
- Contador de mensajes enviados
- Botón para cancelar en cualquier momento

---

## ❌ Errores Comunes

| Error | Solución |
|-------|----------|
| "No se encontraron tokens válidos" | Verifica `tokens.txt` en carpeta raíz |
| "Token inválido o revocado" | Regenera el token en https://discord.com/developers |
| "Comando /enviar no aparece" | Recarga Discord, espera 10 min, verifica ADMIN_BOT_TOKEN |
| "No puedo enviar mensajes" | El usuario tiene DMs bloqueados o está en EXCLUDED_USER_IDS |

---

## 📊 Estructura de Carpetas

```
THO DM ALL DISCORD/
├── assest/
│   └── node.js          ← Editar aquí el token admin
├── tokens.txt           ← Editar aquí tokens de trabajadores
├── package.json
├── README.md
├── install.bat          ← Windows instalación
├── start.bat            ← Windows ejecución
├── install.sh           ← Linux/Kali instalación
├── start.sh             ← Linux/Kali ejecución
├── install-termux.sh    ← Termux instalación
└── start-termux.sh      ← Termux ejecución
```

---

## 🛡️ Configuraciones Avanzadas

### Usuarios Excluidos
**Archivo:** `assest/node.js` (línea ~34)

```javascript
const EXCLUDED_USER_IDS = [
    '1367946999969615906',  // Agregar IDs aquí
    '1395829010759417986',
    '1414017022181900358',
];
```

### Canal Permitido
**Archivo:** `assest/node.js` (línea ~175)

```javascript
const ALLOWED_CHANNEL_ID = '1414033806046007416';
const ALLOWED_CHANNEL_NAME = '☠️┆𝐓𝐇𝐎-𝐃𝐌-𝐀𝐋𝐋';
```

---

## 🔄 Actualizar

```bash
npm update
```

---

## 📱 Obtener Tokens

1. **Discord Developer Portal:** https://discord.com/developers/applications
2. Selecciona o crea un bot
3. Ir a "Bot" en el menú
4. Click en "Copy Token" bajo USERNAME

**Token Admin:** El del bot que controlará a los demás
**Tokens Trabajadores:** El resto de bots

---

## 🚨 IMPORTANTE

⚠️ **NUNCA** compartir tokens públicamente
⚠️ **NUNCA** usar sin consentimiento
⚠️ Respeta Términos de Servicio de Discord
⚠️ Los bots pueden ser baneados por abuso

---

**Versión:** 2.0 - Noviembre 2025

```
╔════════════════════════════════════════╗
║          THO DM ALL DISCORD            ║
║      Multi-Bot Instance Manager        ║
╚════════════════════════════════════════╝
```
