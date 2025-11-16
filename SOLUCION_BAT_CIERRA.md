# 🆘 SOLUCIÓN: Script .BAT Se Cierra Inmediatamente

## 🔴 PROBLEMA:
El archivo `start.bat` se abre y se cierra instantáneamente sin que los bots se inicien.

---

## ✅ SOLUCIÓN RÁPIDA (3 OPCIONES)

### **OPCIÓN 1: Usar el nuevo script mejorado (RECOMENDADO)**

Usa **`run.bat`** en lugar de `start.bat`:

```powershell
# En la carpeta del proyecto, ejecuta:
run.bat
```

**Ventajas:**
- ✅ Los bots se mantienen activos
- ✅ Puedes ver los mensajes de estado
- ✅ Muestra errores si los hay
- ✅ Mantiene la ventana abierta mientras funciona

---

### **OPCIÓN 2: Ejecutar en Segundo Plano (Sin Ventana)**

Usa **`run-background.bat`**:

```powershell
run-background.bat
```

**Ventajas:**
- ✅ Los bots siguen activos aunque cierres la ventana
- ✅ Se crea un archivo log para ver el progreso
- ✅ Continúa funcionando en background

**Para ver los logs:**
- Busca el archivo `bots.log` en la carpeta
- Abre con bloc de notas o editor

**Para detener los bots:**
1. Abre **Task Manager** (Ctrl+Shift+Esc)
2. Busca `node.exe`
3. Click derecho → "Finalizar tarea"

---

### **OPCIÓN 3: Ejecutar desde PowerShell (Para Depuración)**

Si necesitas ver los errores en tiempo real:

```powershell
# Abre PowerShell en la carpeta del proyecto y ejecuta:
cd "c:\Users\User\Desktop\THO DM ALL"
node assest/node.js
```

Esto mostrará todos los errores en tiempo real.

---

## 🔍 CAUSAS COMUNES

### ❌ Se cierra sin mostrar nada
**Causa:** Token inválido o `tokens.txt` vacío

**Solución:**
1. Abre `tokens.txt`
2. Verifica que tenga tokens válidos (uno por línea)
3. Usa `configurar.bat` para configurar automáticamente

### ❌ Error: "No se encontró assest/node.js"
**Causa:** El archivo está en otra ubicación

**Solución:**
1. Verifica que estés en la carpeta correcta
2. Haz doble clic en `run.bat` desde la carpeta raíz

### ❌ Error: "Node.js no está instalado"
**Causa:** Node.js no está en el PATH

**Solución:**
1. Ejecuta `install.bat` primero
2. Reinicia tu terminal
3. Vuelve a ejecutar `run.bat`

---

## 📋 ARCHIVOS DISPONIBLES

| Archivo | Uso | Resultado |
|---------|-----|-----------|
| **start.bat** | Ejecución simple | ⚠️ Se cierra rápido |
| **run.bat** | Ejecución mejorada | ✅ Se mantiene abierto |
| **run-background.bat** | Segundo plano | ✅ Sin ventana visible |
| **install.bat** | Instalación | ⚠️ Solo primera vez |

---

## 🚀 PASOS CORRECTOS

### 1. **Primera Vez (Instalación)**
```powershell
install.bat
```

### 2. **Configuración**
```powershell
configurar.bat
```

### 3. **Ejecución (Elige una)**

**Opción A: Ventana visible (Recomendado para ver estado)**
```powershell
run.bat
```

**Opción B: Segundo plano (Recomendado para dejar activo)**
```powershell
run-background.bat
```

---

## ✅ VERIFICACIÓN

### Los bots están funcionando si:

**En `run.bat`:**
```
✅ Verificaciones completadas
[*] Iniciando bots...
[*] Esperando conexión...
✅ BOT ADMIN DETECTADO
✅ Comando /enviar registrado
```

**En `run-background.bat`:**
```
✅ ¡BOTS INICIADOS CORRECTAMENTE!
[✓] Los bots están activos en segundo plano
```

---

## 🔧 TROUBLESHOOTING

### P: ¿Cómo sé que los bots están activos?
**R:** 
- Abre Discord
- En el servidor, verifica que los bots aparezcan como "En línea"
- En el chat, escribe `/enviar` (solo el bot admin lo mostrará)

### P: ¿Cómo cierro los bots?
**R:**
1. Si usas `run.bat`: Cierra la ventana o presiona Ctrl+C
2. Si usas `run-background.bat`: Abre Task Manager, busca `node.exe`, finaliza

### P: ¿Cómo veo qué está pasando?
**R:**
- Usa `run.bat` (ventana visible) para ver el estado en tiempo real
- O abre el archivo `bots.log` si usas `run-background.bat`

### P: Se cierra pero no veo errores
**R:** 
1. Usa PowerShell: `node assest/node.js`
2. Esto mostrará los errores en tiempo real
3. Verifica `tokens.txt` y `ADMIN_BOT_TOKEN`

---

## 📚 RESUMEN RÁPIDO

```
❌ ANTES (Sin funcionar):
   double-click start.bat → se cierra al instante

✅ DESPUÉS (Funcionando):
   double-click run.bat → ventana se queda abierta
   
✅ ALTERNATIVA (Segundo plano):
   double-click run-background.bat → inicia en background
```

---

**Versión:** 2.0
**Última actualización:** Noviembre 2025

```
╔════════════════════════════════════════════╗
║  ✅ Usa run.bat en lugar de start.bat     ║
║                                            ║
║  Los bots se mantendrán ACTIVOS          ║
║  mientras el script esté en ejecución     ║
╚════════════════════════════════════════════╝
```
