# Наполнение слайдера на главной странице

## Инструкция по наполнению контентом слайдера на главной странице

### Общая характеристика

Верстка карусели на главной странице  находится в переменной "**slider-in-home-page"**.

&#x20;

#### Zeta Web 2.x

**Zeta Web → Панель управления сайтом →** вкладка **Наполнение сайта** → вкладка **Страницы/Переменные** → **Переменные.**

#### Zeta Web 3.x

**Zeta Web →Панель управления "Контент" → Сайты HTML.**



![](<../../.gitbook/assets/image (9).png>)

В типовом дизайне представлены 5 изображений:

* _с_ областью для названия или описания слайда;&#x20;
* с кнопкой, при клике на которую осуществляется переход на нужную вам страницу;&#x20;
* также верстка подразумевает переход на необходимую страницу через клик на любую часть области слайда - для этого, каждому элементу с классом "carousel\_\_item\_link", требуется присвоить значение аттрибута "href" - указать адрес страницы.&#x20;

{% hint style="info" %}
В верстке слайдера (на примере типового дизайна) каждый элемент с определенным классом встречается 5 раз - по количеству слайдов. \
Все, что находится внутри одного элемента с классом "carousel\_\_item" - относится к одному слайду.&#x20;
{% endhint %}

![](<../../.gitbook/assets/image (393).png>)

Размеры блока-контейнера - **848\*480 px**.

Соответственно, если вы хотите, чтобы изображение занимало всю отведенную ей область, выбирайте картинки или фото не меньше, указанных выше параметров.&#x20;

В слайдере **типового дизайна** используются картинки меньшего размера, чем родительский контейнер. Такое размещение тоже допустимо, изображения при этом будут центрироваться.&#x20;

_На примере ниже: синяя рамка - область внешнего контейнера и допустимого максимального размера изображения (848\*480 px). Красная рамка показывает реальные размеры текущей картинки._&#x20;

![](<../../.gitbook/assets/image (378).png>)

### Редактирование слайдера

Для изменения количества слайдов требуется, выделенную ниже на скриншоте, область -удалить или скопировать, и вставить в верстку, согласно порядку слайдов, наполнить необходимым текстовым контентом и добавить изображение.&#x20;

![](<../../.gitbook/assets/image (383).png>)

### Добавление изображения на слайд

Добавление изображения на слайдер осуществляется в следующем порядке:

* Прежде всего, необходимо добавить изображения слайдера в 1С. \
  Для этого переходим в раздел "**Картинки и файлы**": выбираем или создаем папку, в которой будут храниться картинки слайдов. Добавление реализуется через клик на одноименную кнопку.&#x20;
* После того как картинки загружены в 1С, включим их в переменную **slider-in-home-page.**

{% hint style="info" %}
_Описан порядок добавления изображения на примере Zeta Web 2.x_
{% endhint %}

1. Через кнопку "**Редактировать наполнение**" переходим к **визуальному редактору html:**

![](<../../.gitbook/assets/image (89).png>)

2\.  Во вкладке "**Визуальный редактор HTML**" кликаем сначала по изображению, которое нужно заменить, далее через клик на кнопку с зеленым карандашом, переходим к непосредственному выбору новой картинки.&#x20;

![](<../../.gitbook/assets/image (452).png>)

3\. В окне "**Картинки (ZetaWeb)**" нажимаем на кнопку с тремя точками и выбираем ранее загруженное в 1С изображение слайдера в окне "**Файлы Zeta Web**". \
В поле **класс** - выбираем класс **.img-responsive**. \
Ширину и высоту картинки оставляем незаполненной, так как все необходимые стили и свойства уже заданы элементу, с указанным выше классом.&#x20;

![](<../../.gitbook/assets/image (310).png>)

4\. Сохраняем результат, обмениваемся с сайтом.&#x20;

### Добавление слайдера на страницу

Добавление слайдера на страницу включает следующие этапы:

#### Zeta Web 2.x&#x20;

По ссылке меню **Zeta Web → Панель управления сайтом** →  вкладка **Наполнение сайта** → вкладка **Страницы / Переменные**.

* Откройте окно редактирования наполнения страниц;
* Выберите необходимую страницу и нажмите "Редактировать наполнение";

![](<../../.gitbook/assets/image (426).png>)

* В окне Визуального редактора HTML, через правую область нужно найти переменную **slider-home-page** и добавить перед переменной banners, если хотите, чтобы слайдер отображался выше баннеров (на примере типового дизайна), и, соответственно, под переменной - для отображения после.&#x20;

{% hint style="info" %}
Рекомендуем сначала выделять(например, цифрами "1") во вкладке **р**едактора текста html ту область , в которую будет устанавливаться переменная, чтобы избежать ошибок верстки. После размещения переменной вспомогательные выделения (цифры) - удалить.
{% endhint %}

![](<../../.gitbook/assets/image (244).png>)

![Описанная верстка в редакторе html](<../../.gitbook/assets/image (238).png>)

* В завершении, удалите метки с цифрой "1", сохраните результат и обменяйтесь с сайтом.

#### Zeta Web 3.x

По ссылке меню **Zeta Web →Панель управления "Контент"** →вкладка **Наполнение сайта** → **Тексты HTML.**

* Выберите необходимую страницу и нажмите "Редактировать текст HTML";
* В открывшемся окне повторно кликните на кнопку "Редактировать";
* Далее следует через правую область найти переменную **slider-home-page** и перетянууть ее перед переменной banners, если хотите, чтобы слайдер отображался выше баннеров (на примере типового дизайна), и, соответственно, под переменной - для отображения после.&#x20;

![](<../../.gitbook/assets/Image 60.png>)

* В завершении, сохраните результат и обменяйтесь с сайтом.



На главной странице баннер будет выглядеть следующим образом:

![](<../../.gitbook/assets/image (543).png>)
