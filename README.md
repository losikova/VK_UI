# VK_UI

1. Создать приложение.

2. Добавить форму для входа.

3. Адаптировать форму для телефонов в альбомной ориентации, планшетов.

________________________________________________________________________________

1. Добавить в приложение UITabbarViewController, три UITableViewController и один UICollectionViewController.

2. После того, как пользователь ввел верные логин и пароль, перейти на UITabbarViewController.

3. Добавить две вкладки в UITabbarViewController.

4. На первой вкладке настроить переходы в следующем порядке: UINavigationController — UITableViewController — UICollectionViewController. Будущая вкладка для отображения друзей пользователя ВКонтакте и его фотографий. Переход с таблицы на коллекцию должен происходить по нажатию на ячейку.

5. На второй вкладке — в порядке: UINavigationController — UITableViewController — UITableViewController. Первый контроллер для отображения групп пользователя, второй для отображения глобального поиска групп, которые могут быть интересны пользователю. Для перехода с первой таблицы на вторую на NavigationBar необходимо создать Bar Button Item.

В этих цепочках UINavigationController не является отдельным экраном, он нужен для управления переходами.
