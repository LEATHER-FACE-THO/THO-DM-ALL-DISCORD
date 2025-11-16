# Configuración de Ejemplo - THO DM ALL DISCORD

Este archivo muestra cómo configurar correctamente el bot.

## 🔑 ADMIN_BOT_TOKEN

**Ubicación:** `assest/node.js` (línea ~50)

### Antes (INCORRECTO):
```javascript
const ADMIN_BOT_TOKEN = 'EL_TOKEN_DEL_BOT_ADMIN_AQUI';
```

### Después (CORRECTO):
```javascript
const ADMIN_BOT_TOKEN = 'MTQxNDAx.GqL5m1.abc123defgh456ijkl789mnopqrst';
```

**Ejemplo de token válido:**
```
MTQxNDAx.GqL5m1.abc123defgh456ijkl789mnopqrst
```

**Características:**
- Comienza con 24+ caracteres alfanuméricos
- Punto (.)
- 6+ caracteres (letras, números, guión, underscore)
- Punto (.)
- 27+ caracteres (letras, números, guión, underscore)

---

## 📋 tokens.txt (Bots Trabajadores)

**Ubicación:** `tokens.txt` (carpeta raíz)

### Formato Correcto:
```
MTA4NzE0MzY2NTAx.GqL5m2.xyz789abc123def456ghi789jklmno
MzU4NDc2NzE3MDU0.GqL5m3.pqr123stu456vwx789yz0abc123de
NzI5NDUyMTU5MDk3.GqL5m4.fgh456ijk789lmn012opq345rst
```

### Formato INCORRECTO:
```
MTA4NzE0MzY2NTAx.GqL5m2.xyz789abc123def456ghi789jklmno  <- No dejar ¡Espacios al final!
  MzU4NDc2NzE3MDU0.GqL5m3.pqr123stu456vwx789yz0abc123de <- No dejar ¡Espacios al inicio!

NzI5NDUyMTU5MDk3.GqL5m4.fgh456ijk789lmn012opq345rst     <- No dejar ¡Línea en blanco!
```

### Reglas:
✅ Un token por línea
✅ Sin espacios antes o después
✅ Sin líneas en blanco
✅ Sin caracteres especiales extras
✅ Puede haber varios tokens

---

## 🛡️ EXCLUDED_USER_IDS

**Ubicación:** `assest/node.js` (línea ~34)

### Ejemplo:
```javascript
const EXCLUDED_USER_IDS = [
    '1367946999969615906',    // Usuario que no recibirá spam
    '1395829010759417986',    // Otro usuario excluido
    '1414017022181900358',    // Otro más
];
```

**Para agregar más usuarios:**
1. Obtén el ID del usuario (click derecho → Copiar ID)
2. Agrégalo entre comillas simples: `'123456789012345678',`
3. Guarda el archivo

---

## 📍 ALLOWED_CHANNEL_ID y ALLOWED_CHANNEL_NAME

**Ubicación:** `assest/node.js` (línea ~175)

### Ejemplo:
```javascript
const COMMAND_BOT_ID = '1414017022181900358';        // ID del bot admin
const ALLOWED_CHANNEL_ID = '1414033806046007416';    // Canal donde funciona /enviar
const ALLOWED_CHANNEL_NAME = '☠️┆𝐓𝐇𝐎-𝐃𝐌-𝐀𝐋𝐋';   // Nombre del canal
```

**Cómo obtener estos valores:**

### ID del Bot Admin:
```javascript
// Aparece en consola cuando inicia
Bot 1 (AdminBot#1234) está en línea
✅ ⭐ BOT ADMIN DETECTADO ⭐
// El ID es la parte numérica después de #
```

### ID del Canal:
1. En Discord: Click derecho en el canal
2. Selecciona "Copiar ID del canal"
3. Reemplaza ALLOWED_CHANNEL_ID

### Nombre del Canal:
- Visible en el nombre del canal en Discord
- Puede tener emojis personalizados

---

## ✅ Checklist de Configuración

- [ ] Descargué Node.js v18+
- [ ] Ejecuté `install.bat` (Windows) o `bash install.sh` (Linux)
- [ ] Copié mi token de bot admin a `ADMIN_BOT_TOKEN`
- [ ] Agregué tokens de bots trabajadores a `tokens.txt`
- [ ] Ejecuté `start.bat` (Windows) o `bash start.sh` (Linux)
- [ ] Vi mensaje: "✅ Comando /enviar registrado en el bot admin"
- [ ] Probé el comando: `/enviar usuario: @Target` en Discord
- [ ] El spam comenzó correctamente

---

## 🔍 Verificación de Tokens

### En Windows (PowerShell):
```powershell
# Ver contenido de tokens.txt
Get-Content tokens.txt

# Ver línea de ADMIN_BOT_TOKEN en node.js
Select-String -Path assest/node.js -Pattern "ADMIN_BOT_TOKEN"
```

### En Linux/Kali:
```bash
# Ver contenido de tokens.txt
cat tokens.txt

# Ver línea de ADMIN_BOT_TOKEN en node.js
grep "ADMIN_BOT_TOKEN" assest/node.js
```

### En Termux:
```bash
cat tokens.txt
grep "ADMIN_BOT_TOKEN" assest/node.js
```

---

## 🚨 Problemas Comunes

### ❌ "No se encontraron tokens válidos en tokens.txt"
**Solución:**
1. Verifica que `tokens.txt` está en la carpeta raíz (no en `assest/`)
2. Revisa que cada línea tiene un token válido
3. Borra líneas en blanco
4. Guarda el archivo sin espacios extras

### ❌ "Token inválido o revocado"
**Solución:**
1. El token expiró
2. Ve a https://discord.com/developers/applications
3. Selecciona el bot
4. En "Bot", click "Regenerate" bajo el token
5. Copia el nuevo token
6. Actualiza el archivo y reinicia

### ❌ "ADMIN_BOT_TOKEN no funciona"
**Verificación:**
```javascript
// ❌ INCORRECTO (con comillas extras)
const ADMIN_BOT_TOKEN = "'EL_TOKEN_DEL_BOT_ADMIN_AQUI'";

// ✅ CORRECTO (sin comillas extras)
const ADMIN_BOT_TOKEN = 'EL_TOKEN_DEL_BOT_ADMIN_AQUI';

// ✅ CORRECTO (con token real)
const ADMIN_BOT_TOKEN = 'MTQxNDAx.GqL5m1.abc123...';
```

### ❌ "Comando /enviar no aparece en Discord"
**Soluciones:**
1. Recarga Discord completamente (Ctrl+R o Cmd+R)
2. Espera 5-10 minutos
3. Verifica que ADMIN_BOT_TOKEN está correcto
4. Verifica que el bot está en línea (consola debe decir "BOT ADMIN DETECTADO")
5. Reinicia el bot

---

## 📚 Referencias

- **Discord Developer Portal:** https://discord.com/developers/applications
- **discord.js Documentación:** https://discord.js.org
- **Node.js Documentación:** https://nodejs.org/docs

---

**Versión:** 2.0
**Última actualización:** Noviembre 2025

```
╔════════════════════════════════════════╗
║     Configuración correcta = Success   ║
║  Lee esta guía antes de ejecutar       ║
╚════════════════════════════════════════╝
```
