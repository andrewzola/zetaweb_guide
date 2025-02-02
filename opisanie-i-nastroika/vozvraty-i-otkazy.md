# Возвраты и отказы

{% hint style="info" %}
Система "**Возвраты и отказы**" - это дополнительный модуль для решения Zeta Web, предназначенный для работы со строками созданного заказа. \
Доступен для конфигурации 1С Управление торговлей ред. 10.3
{% endhint %}

Если пользователь уже оформил заказ на сайте, но затем ему необходимо отменить определенную позицию из заказа (например, неправильно выбрал товар, или указал неверное количество), то он может оформить заявку на отмену на сайте, со страницы Заказы – Журнал по заказам.

Также, если по заказу была оформлена реализация, пользователь может на сайте оформить заявку на возврат товаров.

## Работа пользователя на сайте

### Оформление заявки на отмену заказа

В стандартных настройках статусов отмена возможна, если строка заказа находится в статусах:\
**- «\_Сайт - Отправлен менеджеру» (В обработке),**\
**- «02. Приостановлен (ожидает оплаты)»,**\
**- «07. Зарезервирован на складе выдачи».**

Возможность делать заявки на отмену/возврат, из разных статусов заказов, настраивается в справочнике «**Статусы строки заказа (Zeta Web)**» (подробнее о ["Статусах строк заказов](statusy-strok-zakazov.md)").

![](<../.gitbook/assets/image (195).png>)

{% hint style="info" %}
На сайте оформляется не сама отмена строк, а ЗАЯВКА на отмену от пользователя.
{% endhint %}

Для создания заявки на отмену на странице «**Заказы**» в «**Журнале по заказам**» раскройте информацию о заказе.

![](<../.gitbook/assets/image (275).png>)

В детальных записях по заказу нажмите ссылку «**Отмена позиции из заказа**».&#x20;

_На скриншоте ниже пример отображения в дизайне (данный вариант используется в типовом дизайне)._

![](<../.gitbook/assets/image (400) (1).png>)

На странице «**Отмена позиции заказа**» укажите количество товара для отмены и комментарий (при необходимости).&#x20;

**Доступное количество** — это максимальное количество для отмены из заказа.&#x20;

Для оформления заявки на отмену нажмите кнопку «**Подать заявку**». &#x20;

![](<../.gitbook/assets/image (405).png>)

После создания заявки на отмену, Вы увидите сообщение об успешном добавлении заявки.

![](<../.gitbook/assets/image (194).png>)

В «**Журнале по заказам**» добавится информация об отмене позиции.

![](<../.gitbook/assets/image (372).png>)

### Оформление заявки на возврат товара&#xD;

В стандартных настройках статусов возврат возможен, если строка заказа находится в статусе «**10. Товар отгружен**». Возможность делать заявки на отмену/возврат из разных статусов заказов, настраивается в справочнике «**Статусы строки заказа (Zeta Web)**»

![](<../.gitbook/assets/image (361).png>)

Для оформления заявки на возврат на странице «**Заказы**» в «**Журнале по заказам**» раскройте информацию о заказе. В детальных записях по заказу нажмите ссылку «**Возврат позиции из заказа**».&#x20;

_На скриншоте ниже пример отображения в дизайне (данный вариант используется в типовом дизайне)._

![](<../.gitbook/assets/image (585).png>)

На странице «**Возврат позиции заказа**» укажите количество товара для возврата, а также выберите причину возврата и уточнение причины. Также вы можете прикрепить файл и написать комментарий для менеджера.

![](<../.gitbook/assets/image (542).png>)

Проверьте данные и нажмите кнопку «**Подать заявку**». После создания заявки пользователь будет перенаправлен на страницу «**Заказы**».

### Журнал возвратов&#xD;

На странице журнала возвратов вы можете просмотреть статусы заявок на отмену или возврат товара, скачать сопроводительную записку или прикреплённые файлы.

Для удобства вы можете воспользоваться фильтрами:

* По дате;
* По типу заявки;
* По статусу;
* По заказчику;
* По производителю;
* По артикулу;
* По наименованию.

Заполните поля и нажмите кнопку «**Отбор**».

![](<../.gitbook/assets/image (325).png>)

Работа менеджера в 1С


### Настройка в 1С

{% hint style="info" %}
Возврат  в строках не поддерживается с релиза 2.6.
{% endhint %}

#### Справочник «Статусы запроса на отмену строки (Zeta Web)»&#xD;

Выберите пункт меню **Zeta Web → Возвраты и отказы → Статусы запроса на отмену строки.**

![](<../.gitbook/assets/image (151).png>)

Для добавления нового статуса нажмите кнопку «**Добавить**».&#x20;

На форме создания новой записи заполните соответствующие поля:

* **Наименование;**
* **WEBЦвет статуса.**

А также установите/снимите флажок «**Доступен ввод на основании документов**». Если данный флаг установлен, то по заявке, находящейся в данном статусе, возможно создание соответствующего документа для отмены строк.

![](<../.gitbook/assets/image (256).png>)

Для сохранения нажмите кнопку «**ОК**».

#### Справочник «Статусы заявки на возврат товара (Zeta Web)».&#xD;

Выберите пункт меню **Zeta Web → Возвраты и отказы → Статусы заявки на возврат товара**.

![](<../.gitbook/assets/image (116).png>)

Для добавления нового статуса нажмите кнопку «**Добавить**».&#x20;

На форме создания новой записи заполните соответствующие поля:

* **Наименование;**
* **WEBЦвет статуса.**

А также установите/снимите флажок «**Доступен ввод на основании документов**». Если данный флаг установлен, то по заявке, находящейся в данном статусе, возможно создание соответствующего документа возврата.

Для сохранения нажмите кнопку «ОК».

#### Справочник «Причины возврата товаров (Zeta Web)»&#xD;

Выберите пункт меню **Zeta Web → Возвраты и отказы → Причины возврата товаров.**

&#x20;Для добавления новой причины нажмите кнопку «**Добавить**» и на форме создания записи укажите **наименование**. Для сохранения нажмите кнопку «**ОК**».

![](<../.gitbook/assets/image (485).png>)

#### Справочник «Дополнительные описания причины возврата товаров (Zeta Web)»&#xD;

Выберите пункт меню **Zeta Web → Возвраты и отказы → Дополнительные описания причин возврата товаров.**

Для добавления нового описания причины возврата нажмите кнопку «**Добавить**» и на форме создания записи заполните следующие поля:

* **Наименование;**
* **Владелец** (выбор из справочника причины возврата товаров).

&#x20;Для сохранения нажмите кнопку **ОК**.

![](<../.gitbook/assets/image (22).png>)

### Панель управления сайтом. Журнал заявок&#xD;

#### Zeta Web 2.x

Все заявки на отмену строк и/или возврат товара находятся в **панели управления сайтом** на закладке «**События**».

![](<../.gitbook/assets/image (217).png>)

#### Zeta Web 3.x

Пройдите по ссылке меню **Zeta Web → Панель управления "Монитор" →**закладка З**аявки на отмену или возврат.**



### Работа по заявке на отмену&#xD;

Откройте заявку на отмену для редактирования.

На форме редактирования заявки вы можете:

* Просмотреть **данные по товару** и заявленному количеству для отмены (поля Номенклатура, Количество, Цена, Размещение);
* Изменить **статус заявки;**
* Изменить **количество товара** для отмены (т.к. возможно есть причины, по которым заявка на может быть выполнена или может быть выполнена только частично) — заполнить поле **Количество отказ;**
* Оформить **документ** отмены строки заказа (документ корректировки заказа покупателя).

Для оформления документа по отмене строки заказа нажмите кнопку «**Ввести на основании**».

![](<../.gitbook/assets/image (512).png>)

На форме обработки по созданию документа проверьте данные по заявке и нажмите кнопку «**Создать документ**».

![](<../.gitbook/assets/image (153).png>)

После этого, будет открыта форма созданного документа.

![](<../.gitbook/assets/image (263).png>)

Для сохранения нажмите кнопку «**ОК**».

После этого измените **статус** заявки по отмене строк на «**Закрыта**».

{% hint style="info" %}
**Обратите внимание!**&#x20;

Для выполненных и закрытых заявок (согласно настройкам справочника статусов заявок на отмену строк) документы не создаются.&#x20;При попытке еще раз создать документ отмены строк, пользователю будет выдано сообщение об этом.


{% endhint %}

{% hint style="warning" %}
Функционал по отмене / возвратам в **Zeta Web 3.x** доступен по ссылке меню  **Zeta Web → Панель управления "Настройки" →**закладка **Заказы и статусы.**
{% endhint %}

### Работа по заявке на возврат&#xD;

Откройте заявку на возврат товара для редактирования.

На форме редактирования заявки вы можете:

* Просмотреть **данные по товару** и заявленному **количеству** для отмены (поля Номенклатура, Количество, Цена, Размещение);
* Изменить **статус** заявки;
* Изменить **количество товара** для отмены (т.к. возможно есть причины, по которым заявка на может быть выполнена или может быть выполнена только частично) — заполнить поле Количество отказ;
* Ввести свой **комментарий** для клиента (он будет отображен на сайте);
* Оформить **документ** возврата

Для оформления документа по возврату товара нажмите кнопку **«Ввести на основании»**.

![](<../.gitbook/assets/image (167).png>)

На форме обработки по созданию документа проверьте **данные по заявке** и нажмите кнопку «**Создать документ**».

После этого будет открыта форма созданного документа.

![](<../.gitbook/assets/image (332).png>)

Для сохранения нажмите кнопку «**ОК**».

После этого, измените **статус** заявки по возврату на «**Возврат принят**».

{% hint style="info" %}
**Обратите внимание!**&#x20;

Для выполненных и закрытых заявок (согласно настройкам справочника статусов заявок на отмену строк) документы не создаются.&#x20;При попытке еще раз создать документ возврата пользователю будет выдано сообщение об этом.
{% endhint %}

