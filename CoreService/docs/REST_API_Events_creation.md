##REST спецификация для создания и получения событий

###1) Создание нового события:
####request :
   POST : /events
   <pre>body:
   {
   “name” : “some_name”,
   “description” : “some_description”,
   “link_ava” : “some_link”,
   “creator_id ” : “id_current_user”
   }</pre>
####response :
   1) Событие успешно создано:<br>
   HTTP response status CODE : 201
   <pre>body:
   {
   “event_id” : “id”
   }</pre>

###2) Просмотр события
####request :
   GET : /events/*id_of_event*
####response :
   1) Событие успешно получено:<br>
   HTTP response status CODE : 200
   <pre>body: 
   {
         {
         “event_name”: “name”,
         “event_description”“description”,
         “event_ava” : “link_ava”,
         “event_created” : “created_dt”,
         “event_last_update” : “updated_dt”
         } ,
         “event_category” : “categories.name”
   }</pre>
   2) Событие не найдено:<br>
   HTTP response status CODE : 404
   <pre>body:
   {
   “message” : “Event not found”
   }</pre>
