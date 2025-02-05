# Выполнение тестового задания

## Чистка багов, подготовка к рефакторингу

Начав выполнение задания с первого пункта, с рефакторинга, увидел наличие большого количества багов в предоставленном коде и принял решение сначала сделать приложение и покрыть тестами success path. Этот пункт выполнил в ветке `feature/prepare`, в ветке `step-1` привёл код интерактора в рабочий вид и добился работы тестов интерактора и контроллера

Баги выловленные на шаге `step-1`:

* исправлены ассоциации с `has_many` на `habtm` и созданы джойн таблицы для связей интересты-пользователи и скилы-пользователи (в соответствии с логикой прописанной в интеракторе)
* исправлена опечатка `!= female` на `!= 'female'`
* исправлена опечатка `Intereset` на `Interest`
* исправлена логическая ошибка `return if params['gender'] != 'male' or params['gender'] != female` на `return if params['gender'] != 'male' and params['gender'] != female`
* исправлена логическая ошибка `return if User.where(email: params['email'])` на `return if User.where(email: params['email']).first`
* исправлена синтаксическая ошибка `user = User.create(user_params.merge(user_full_name))` на `user = User.create(user_params.merge(full_name: user_full_name))`
* исправлена синтаксическая ошибка `skil = Skil.find(name: skil)` на `skil = Skil.find_by(name: skil)`

В итоге, получили работающий код интерактора, переключаемся на ветку `step-2`


