# THO DM ALL DISCORD - SPAMEA CON MAS DE 50 BOT A UN USUARIO EN DISCORD

![THO DM_ALL_DISCORD](https://i.imgur.com/TOITiyR.png)

## 📋 Descripción

**THO DM ALL DISCORD** es un bot de Discord que permite gestionar múltiples instancias de bots desde una única instancia administrativa. Solo el bot admin tiene acceso al comando `/enviar`, y controla automáticamente a los demás bots para ejecutar acciones masivas.

### Características
- ✅ Solo 1 bot admin con comando slash `/enviar`
- ✅ Los demás bots actúan como trabajadores controlados por el admin
- ✅ Sistema de exclusión de usuarios
- ✅ Botón de cancelación de spam en tiempo real
- ✅ Compatible con Windows, Linux (Kali, Termux) y macOS
- ✅ Validación automática de tokens
- ✅ Resumen de bots en línea/fallidos

---

## 📌 Requisitos Previos

### Todos los Sistemas
- **Node.js** v18.0.0 o superior
- **npm** (incluido con Node.js)
- **Tokens de Discord Bot** válidos
- **Terminal/CMD** acceso

### Windows
- Windows 10 o superior
- PowerShell o CMD
- Permiso de administrador (recomendado)

### Linux/Kali
- Linux kernel actualizado
- Acceso sudo (para permisos)
- curl o wget (preinstalados)

### Termux (Android)
- Termux instalado desde F-Droid (no Play Store)
- ~200MB espacio libre
- Conexión a internet estable

---

## 🔧 Instalación por Sistema Operativo

### 1️⃣ WINDOWS

#### Opción A: Instalación Manual
```powershell
# 1. Descargar e instalar Node.js desde https://nodejs.org/
# 2. Verificar instalación
node --version
npm --version

# 3. Navegar a la carpeta del proyecto
cd C:\Users\User\Desktop\THO DM ALL DISCORD

# 4. Instalar dependencias
npm install

# 5. Editar el archivo node.js y reemplazar:
# const ADMIN_BOT_TOKEN = 'EL_TOKEN_DEL_BOT_ADMIN_AQUI';
# Con tu token del bot admin

# 6. Ejecutar
npm start
```

#### Opción B: Ejecutable (install.bat)
```powershell
# Simplemente ejecutar:
install.bat
```

### 2️⃣ LINUX / KALI LINUX

#### Instalación de Node.js
```bash
# Actualizar sistema
sudo apt update && sudo apt upgrade -y

# Opción A: Instalación oficial de Node.js
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt install -y nodejs

# Opción B: Con nvm (recomendado)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
nvm install 18
nvm use 18
```

#### Instalación del Proyecto
```bash
# Navegar a la carpeta
cd ~/Desktop/THO\ DM\ ALL
# o
cd /path/to/THO\ DM\ ALL

# Instalar dependencias
npm install

# Editar el archivo node.js (reemplazar ADMIN_BOT_TOKEN)
nano assest/node.js
# o
vim assest/node.js

# Ejecutar
npm start
# o
node assest/node.js
```

### 3️⃣ TERMUX (Android)

#### Instalación Inicial
```bash
# 1. Actualizar Termux
apt update && apt upgrade -y

# 2. Instalar Node.js
apt install -y nodejs-lts

# 3. Verificar instalación
node --version
npm --version

# 4. Instalar utilidades (opcional pero recomendado)
apt install -y git nano wget
```

#### Instalación del Proyecto
```bash
# 1. Crear carpeta de proyectos (primera vez)
mkdir -p ~/projects
cd ~/projects

# 2. Descargar o copiar los archivos del proyecto
# Opción A: Copiar desde almacenamiento
cp -r /storage/emulated/0/Download/THO\ DM\ ALL .

# Opción B: Clonar de Git (si está disponible)
git clone <tu-repositorio>

# 3. Navegar a la carpeta
cd THO\ DM\ ALL

# 4. Instalar dependencias
npm install

# 5. Editar archivo (vi, nano o nano es más fácil)
nano assest/node.js

# Buscar y reemplazar:
# const ADMIN_BOT_TOKEN = 'EL_TOKEN_DEL_BOT_ADMIN_AQUI';

# 6. Ejecutar el script
npm start
```

---

## 🔐 Configuración de Tokens

### Obtener el Token del Bot Admin

1. **Ir a Discord Developer Portal**: https://discord.com/developers/applications
2. **Crear nuevo bot** o seleccionar existente
3. **Ir a "Bot"** en el menú lateral
4. **Click en "Copy Token"**
5. **Guardar en un lugar seguro**

### Configurar el Token Admin

**Editar el archivo `assest/node.js`:**

```javascript
// Línea 48-50 aprox.
// Antes:
const ADMIN_BOT_TOKEN = 'EL_TOKEN_DEL_BOT_ADMIN_AQUI';

// Después (reemplazar con tu token):
const ADMIN_BOT_TOKEN = 'MTQxNDAx...tu_token_completo_aqui...';
```

### Agregar Tokens de Bots Trabajadores

**Editar el archivo `tokens.txt`:**

```
MTA4NzE0MzY2...primer_token_completo...
MzU4NDc2NzE3...segundo_token_completo...
NzI5NDUyMTU5...tercer_token_completo...
```

> ⚠️ **Un token por línea**
> ⚠️ **Sin espacios al inicio/final**

---

## 🚀 Ejecución

### Windows
```powershell
# Opción 1: Script directo
npm start

# Opción 2: Script instalador
.\start.bat

# Opción 3: Directo con Node
node assest/node.js
```

### Linux/Kali
```bash
npm start
# o
node assest/node.js
# o
npm run dev
```

### Termux
```bash
npm start
# o
node assest/node.js

# Para ejecutar en background (opcional)
nohup node assest/node.js > output.log 2>&1 &
```

---

## 📊 Estructura de Archivos

```
THO DM ALL DISCORD/
│
├── assest/
│   └── node.js              # Script principal
│
├── tokens.txt               # Archivo con tokens de bots trabajadores
├── package.json             # Dependencias del proyecto
├── install.bat              # Script instalación (Windows)
├── start.bat                # Script ejecución (Windows)
└── README.md                # Este archivo
```

---

## 🎮 Cómo Usar

### 1. Iniciar el Bot
```bash
npm start
```

### 2. Verificar Conexión
Deberías ver en consola:
```
Bot 1 (AdminBot#1234) está en línea
✅ ⭐ BOT ADMIN DETECTADO ⭐ - Este bot controlará a todos los demás
Bot 2 (Bot1#5678) está en línea
Bot 3 (Bot2#9012) está en línea

✅ Comando /enviar registrado en el bot admin
```

### 3. Usar el Comando Slash
En Discord, en el canal permitido:
```
/enviar usuario: @TargetUser
```

### 4. Panel de Control
El bot admin mostrará:
- ✅ Bots en línea: X/Y
- 📨 Mensajes enviados: Z
- 🤖 Bots activos: W

### 5. Cancelar Spam
Click en botón **"Cancelar Spam"** para detener la operación

---

## 🛡️ Configuraciones Importantes

### Usuarios Excluidos
**Editar línea 34-53 de `node.js`:**

```javascript
const EXCLUDED_USER_IDS = [
    '1367946999969615906',  // Usuario 1
    '1395829010759417986',  // Usuario 2
    // Agregar más IDs aquí
];
```

### Canal Permitido
**Editar línea 175-177 de `node.js`:**

```javascript
const ALLOWED_CHANNEL_ID = '1414033806046007416';
const ALLOWED_CHANNEL_NAME = '☠️┆𝐓𝐇𝐎-𝐃𝐌-𝐀𝐋𝐋';
```

### Intentos de Reconexión
**Editar función `getBypassDelay()` línea 142:**

```javascript
function getBypassDelay() {
    const delays = [5, 8, 10, 12, 15];  // Segundos entre intentos
    return delays[Math.floor(Math.random() * delays.length)];
}
```

---

## ❌ Solución de Problemas

### Error: "No se encontraron tokens válidos"
- ✅ Verificar que `tokens.txt` está en la carpeta raíz
- ✅ Confirmar que los tokens están en formato correcto
- ✅ Asegurar que no haya espacios en blanco

### Error: "Token inválido o revocado"
- ✅ El token ha expirado, generar uno nuevo
- ✅ Ir a https://discord.com/developers/applications
- ✅ Regenerar token del bot

### Error: "ENOENT: no such file or directory"
- ✅ Asegurar que el archivo está en la carpeta correcta
- ✅ Verificar rutas de archivos
- ✅ Ejecutar desde la carpeta del proyecto

### No aparece el comando `/enviar`
- ✅ Solo el bot admin debe tenerlo
- ✅ Verificar que `ADMIN_BOT_TOKEN` está configurado correctamente
- ✅ Reiniciar Discord
- ✅ Esperar 5-10 minutos para que se actualice

### Los bots no envían mensajes
- ✅ Verificar que el usuario objetivo no tiene DMs bloqueados
- ✅ El usuario no debe estar en `EXCLUDED_USER_IDS`
- ✅ Los bots deben estar en línea (verificar en consola)

---

## 🔄 Actualizar Dependencias

```bash
# Windows
npm update

# Linux/Kali
npm update

# Termux
npm update
```

---

## 📱 Screenshots Esperados

### Consola de Inicio (Windows/Linux)
```
Bot 1 (AdminBot#1234) está en línea
✅ ⭐ BOT ADMIN DETECTADO ⭐
Bot 2 (Bot#5678) está en línea

=== RESUMEN DE BOTS ===
Bots en línea: 3/3
✅ Activos: 3
❌ Fallidos: 0
```

### Comando en Discord
```
/enviar usuario: @Target

→ Iniciando spam masivo a Target#1234 usando 3 bots...
  [Cancelar Spam] botón disponible
```

### Progreso
```
🚀 Spam masivo en progreso
📨 Mensajes enviados: 540
🤖 Bots activos: 3
⚡ Turbo
```

---

## 📝 Notas de Seguridad

⚠️ **ADVERTENCIA**: Este script está diseñado solo para propósitos educativos y de testing. 

- Nunca compartir tokens públicamente
- No usar contra cuentas de usuarios reales sin consentimiento
- Respetar los términos de servicio de Discord
- Los bots pueden ser baneados por abuso

---

## 📞 Soporte

Para problemas o preguntas:

1. **Revisar el log de consola**
2. **Verificar configuración de tokens**
3. **Asegurar Node.js v18+**
4. **Comprobar conexión a internet**

---

## 📄 Licencia

Diseñado para uso educativo y de testing.

---

**Última actualización**: Noviembre 2025
**Versión**: 2.0 (Multi-instancia optimizada)

```
╔════════════════════════════════════════╗
║           THO DM ALL DISCORD           ║
╚════════════════════════════════════════╝
```


