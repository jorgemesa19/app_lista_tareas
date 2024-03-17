Práctica lista de tareas:

Crear una aplicación de lista de tareas (ToDo List) donde los usuarios puedan agregar tareas, marcarlas como completadas o eliminarlas.

Requerimientos de la práctica:

1. Pantalla Principal:
        - Utiliza un Scaffold como el widget principal de la pantalla.
        - Agrega un AppBar con un título descriptivo como "Lista de Tareas".
        - Utiliza un ListView para mostrar la lista de tareas.

2. Widgets de Tareas:
        - Cada tarea debe representarse como un widget ListTile en el ListView.
        - Cada ListTile debe contener un texto descriptivo de la tarea.
        - Agrega un Checkbox para permitir a los usuarios marcar las tareas como completadas o incompletas.
        - Incluye un botón de eliminación en cada ListTile para que los usuarios puedan eliminar la tarea si así lo desean.

3. Agregar Nueva Tarea:
        - Incluye un botón de "Agregar Tarea" en la parte inferior de la pantalla.
        - Al presionar este botón, debe (Abrirse un cuadro de diálogo, una nueva pantalla o mostrar el formulario antes del ListView) donde los usuarios puedan ingresar el nombre de la nueva tarea.
        - Utiliza un TextField para que los usuarios ingresen el nombre de la nueva tarea.
        - Agrega botones "Cancelar" y "Aceptar" para permitir a los usuarios agregar o cancelar la creación de la tarea.

4. Estado de las Tareas:
        - Utiliza StatefulWidget para manejar el estado de las tareas.
        - Las tareas deben almacenarse en una lista dentro del StatefulWidget.
        - Al marcar una tarea como completada, su estado debe actualizarse en la lista de tareas.
        - Al eliminar una tarea, debe eliminarse de la lista de tareas.
        
5. Se debe de entregar en github o gitlab. Y se debe de evidenciar el progreso del trabajo con diferentes commits. Si el proyecto es privado me agrega como colaborador con el correo saurmo0108@gmail.com

6. Sugerencias Adicionales:
        - Puedes agregar funcionalidades adicionales, como la capacidad de editar tareas existentes, ordenar las tareas por prioridad o fecha de vencimiento, o filtrar las tareas completadas e incompletas.
        - Fomenta el uso de buenas prácticas de diseño de UI y UX para crear una experiencia de usuario intuitiva y agradable.
        - Recuerda usar MVC.
        - Realizar un código legible y mantenible evitando códigos muy largos. 