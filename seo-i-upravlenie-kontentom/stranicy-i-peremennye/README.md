# Страницы и переменные

{% hint style="success" %}
Администрирование и управление контентом CMS Zeta Web выполняется в программе 1С: Предприятие.
{% endhint %}

#### Zeta Web 2.x

Основные инструменты доступны в панели управления сайтом, которую можно открыть из меню **Zeta Web,** кликнув на соответствующий пункт меню **"Панель управления сайтом"**.

![](<../../.gitbook/assets/Image 6.png>)

#### Zeta Web 3.x

Основные инструменты доступны по ссылке меню **Инструменты Zeta Web** →**Панель управления "Контент"**.

![](<../../.gitbook/assets/Image 7.png>)

## Области, переменные, страницы

Разделение html-контента на области, страницы и переменные - условно.

Все контейнеры поддерживают хранение статического html-кода, контролов и вложенных контейнеров.

**Переменная** - это переиспользуемый контейнер, который может быть использован при верстке других переменных, областей и страниц.

**Область -** определяет контент в определенной части дизайна (шапка, подвал, левая и правая колонки).

**Страница -** определяет основной контент дизайна.

![Пример сетки дизайна](<../../.gitbook/assets/image (561).png>)

## Добавление нового html-контейнера

#### Zeta Web 2.x

Для добавления нового html-контента перейдите на вкладку **Наполнение сайта** и затем на вкладку **Страницы / Переменные**.

Выберите нужную группу (области, переменные или страницы) и нажмите **"Добавить".**

![](<../../.gitbook/assets/image (129).png>)

#### Zeta Web 3.x

![](<../../.gitbook/assets/Image 36 (2).png>)

Перейдите на вкладку **Основные** и заполните поле **Наименование**.\
Вы можете указать в поле **Имя в URL** свое значение, в противном случае в это поле будет подставлено значение из поля **Наименование** переведенное в транслит.&#x20;

Нажмите кнопку **"Записать"**.

![](<../../.gitbook/assets/image (435).png>)

{% hint style="warning" %}
Значение поля **Имя в URL** должно быть уникальным.&#x20;

В случае автоматической генерации - это правило соблюдается автоматически (к наименованию добавляется числовой суффикс).
{% endhint %}

{% hint style="info" %}
Для областей и переменных - значение этого поля не влияет на формирование URL и не участвует в конечном html-коде страницы.

Для страниц - значение из этого поля будет участвовать в формировании адреса данной страницы.
{% endhint %}

## Разграничение прав доступа к html-контейнеру

После записи вновь-созданного html-контейнера вы можете настраивать доступность этого контейнера различным группам пользователей.

Для настройки прав перейдите на вкладку **Доступ ролей**. Установите флажок напротив тех ролей, которым должен быть доступен html-контент и нажмите кнопку **Записать**.

![](<../../.gitbook/assets/image (271).png>)

{% hint style="warning" %}
Для html-контейнера, который установлен в качестве значения области в дизайне сайта не действует настройка разграничения прав при просмотре страницы, но правила работают в штатном режиме, если данный контейнер расположен в другом html-контейнере.
{% endhint %}

## Добавление контента

Для добавления/изменения контента нажмите на кнопку **Редактировать наполнение** или нажмите на окно предварительного просмотра html-контента.

![html-редактор](<../../.gitbook/assets/image (143).png>)

В визуальном редакторе доступны следующие действия:

* Ввод и редактирование текста
* Добавление / редактирование ссылки
* Добавление / редактирование  изображения
* Добавление вложенного html-контейнера
* Добавление контрола

В редакторе текста:

* Ввод и форматирование текста

### Ввод и редактирование текста в визуальном редакторе

Начните вводить текст непосредственно в окне редактора. Форматировании текста вам доступны быстрые комбинации клавиш, таких как **CTRL + B** (жирный), **CTRL + I** (курсив), **CTRL + U** (подчеркнутый), **CTRL + MouseScrol** (увеличение / уменьшение размера текста) и т.д.

![](<../../.gitbook/assets/image (338).png>)

{% hint style="info" %}
Мы не рекомендуем использовать визуальный редактор для полноценной верстки. С его помощью легко поправить опечатку или добавить картинку. Более правильно для других задач использовать "Редактор текста".
{% endhint %}

### Добавление / редактирование ссылки в визуальном редакторе

Вы можете добавить ссылку:

* На внутреннюю страницу
* На внешнюю страницу
* [На файл](https://help-zetaweb.zetasoft.ru/seo-i-upravlenie-kontentom/izobrazheniya-i-faily#razmeshenie-faila-na-stranice)

#### Добавление перетаскиванием

Перейдите не вкладку **HTML Элементы** и перетащите элемент **Ссылка** в окно визуального редактора.

![](<../../.gitbook/assets/image (563).png>)

В открывшемся окне выберите адрес назначения нажав на "...":

![](<../../.gitbook/assets/image (488).png>)

* **Строка** - добавление ссылки на внешний ресурс, например, https://google.ru
* **Картинка (Zeta Web)** -  добавление ссылки на [скачивание файла](https://help-zetaweb.zetasoft.ru/seo-i-upravlenie-kontentom/izobrazheniya-i-faily#razmeshenie-faila-na-stranice)
* **Страницы / переменные (Zeta Web)** - добавление ссылки на внутреннюю страницу.

Также, укажите текст / пиктограмму для ссылки в поле **Картинка / текст** нажав на "..."

![](<../../.gitbook/assets/image (395).png>)

* **Строка** - строковое представление ссылки
* **Картинка (Zeta Web)** - ссылка в виде изображения&#x20;

Значение полей **Подсказка**, **Класс** и **Targe**" добавится в атрибуты **title, class и target** соответственно для тега <**a>.**

#### **Быстрое добавление**

Выделите текст, который необходимо преобразовать в ссылку и нажмите на значок **Ссылка** в верхнем меню редактора. В результате откроется окно добавления новой ссылки с заполненным полем **Картинка / текст**

![](<../../.gitbook/assets/image (515).png>)

#### Быстрое удаление

Установите курсор мыши на ссылке и нажмите на значок **Удалить ссылку** в верхнем меню редактора.

![](<../../.gitbook/assets/image (429).png>)

#### Редактирование ссылки

Установите курсор мыши на ссылке и нажмите значок **Редактировать** в верхнем меню редактора. В результате откроется окно редактирования ссылки.

![](<../../.gitbook/assets/image (523).png>)

#### Пример сгенерированного html-кода

```markup
<a title="Переход на гоавную страницу" class="clearfix" href="#" zw="PABQAHIAbwBwAGUAcgB0AGkAZQBzAD4APABUAHkAcABlAEkARAA+AFQAQQBCAHAAQQBHADQAQQBhAHcAQQA9ADwALwBUAHkAcABlAEkARAA+ADwAQwBsAGEAcwBzAD4AWQB3AEIAcwBBAEcAVQBBAFkAUQBCAHkAQQBHAFkAQQBhAFEAQgA0AEEAQQA9AD0APAAvAEMAbABhAHMAcwA+ADwAVABhAHIAZwBlAHQAPgBYAHcAQgB6AEEARwBVAEEAYgBBAEIAbQBBAEEAPQA9ADwALwBUAGEAcgBnAGUAdAA+ADwAVABpAHQAbABlAD4ASAB3AFEAMQBCAEUAQQBFAE4AUQBSAEYAQgBEADQARQBOAEEAUQBnAEEARAAwAEUATQBBAFEAZwBBAEQATQBFAFAAZwBRAHcAQgBEAEkARQBQAFEAUgBEAEIARQA0AEUASQBBAEIAQgBCAEUASQBFAFEAQQBRAHcAQgBEADAARQBPAEEAUgBHAEIARQBNAEUAPAAvAFQAaQB0AGwAZQA+ADwASAByAGUAZgA+AE4AZwBBADAAQQBHAFkAQQBaAFEAQQB6AEEARABRAEEAWgBnAEEAegBBAEMAMABBAE4AUQBCAG0AQQBHAFEAQQBPAFEAQQB0AEEARABFAEEATQBRAEIAbABBAEQAWQBBAEwAUQBBADUAQQBEAFEAQQBaAGcAQQB3AEEAQwAwAEEATQBBAEEAdwBBAEQARQBBAE4AUQBBADEAQQBHAFEAQQBNAFEAQQAxAEEARwBVAEEATQB3AEEAeABBAEQAUQBBADwALwBIAHIAZQBmAD4APAAvAFAAcgBvAHAAZQByAHQAaQBlAHMAPgA=">
	На главную
</a>
```

{% hint style="info" %}
Атрибут **zw** является служебным атрибутом и будет убран из сгенерированного html-кода страницы в процессе ее обработки.
{% endhint %}

### Добавление / редактирование изображения в визуальном редакторе

#### Добавление

см. [размещение изображения](https://help-zetaweb.zetasoft.ru/seo-i-upravlenie-kontentom/izobrazheniya-i-faily#razmeshenie-izobrazheniya-na-stranice).

#### Редактирование

Выделите изображение курсором мыши и нажмите значок **Редактировать** в верхнем меню редактора. В результате откроется окно редактирования изображения.

![](<../../.gitbook/assets/image (29).png>)

#### Пример сгенерированного html-кода

```markup
<img width="100" height="100" title="Запасная часть" class="clearfix" alt="Запасная часть" src="C:\Users\tarasovna\AppData\Local\Temp\43bd86a8-c49e-11e9-8970-00155d153b1a" zw="PABQAHIAbwBwAGUAcgB0AGkAZQBzAD4APABUAHkAcABlAEkARAA+AFMAUQBCAHQAQQBHAEUAQQBaAHcAQgBsAEEAQQA9AD0APAAvAFQAeQBwAGUASQBEAD4APABDAGwAYQBzAHMAPgBZAHcAQgBzAEEARwBVAEEAWQBRAEIAeQBBAEcAWQBBAGEAUQBCADQAQQBBAD0APQA8AC8AQwBsAGEAcwBzAD4APABXAGkAZAB0AGgAPgBNAFEAQQB3AEEARABBAEEAPAAvAFcAaQBkAHQAaAA+ADwASABlAGkAZwBoAHQAPgBNAFEAQQB3AEEARABBAEEAPAAvAEgAZQBpAGcAaAB0AD4APABBAGwAdAA+AEYAdwBRAHcAQgBEADgARQBNAEEAUgBCAEIARAAwAEUATQBBAFIAUABCAEMAQQBBAFIAdwBRAHcAQgBFAEUARQBRAGcAUgBNAEIAQQA9AD0APAAvAEEAbAB0AD4APABUAGkAdABsAGUAPgBGAHcAUQB3AEIARAA4AEUATQBBAFIAQgBCAEQAMABFAE0AQQBSAFAAQgBDAEEAQQBSAHcAUQB3AEIARQBFAEUAUQBnAFIATQBCAEEAPQA9ADwALwBUAGkAdABsAGUAPgA8AFMAcgBjAD4ATgBBAEEAegBBAEcASQBBAFoAQQBBADQAQQBEAFkAQQBZAFEAQQA0AEEAQwAwAEEAWQB3AEEAMABBAEQAawBBAFoAUQBBAHQAQQBEAEUAQQBNAFEAQgBsAEEARABrAEEATABRAEEANABBAEQAawBBAE4AdwBBAHcAQQBDADAAQQBNAEEAQQB3AEEARABFAEEATgBRAEEAMQBBAEcAUQBBAE0AUQBBADEAQQBEAE0AQQBZAGcAQQB4AEEARwBFAEEAPAAvAFMAcgBjAD4APABGAG8AcgBtAGEAdAA+AEwAZwBCAHEAQQBIAEEAQQBaAHcAQQA9ADwALwBGAG8AcgBtAGEAdAA+ADwALwBQAHIAbwBwAGUAcgB0AGkAZQBzAD4A" />
```

{% hint style="info" %}
Атрибут **zw** является служебным атрибутом и будет убран из сгенерированного html-кода страницы в процессе ее обработки.
{% endhint %}

### Добавление вложенного html-контейнера в визуальном редакторе

Перейдите не вкладку **Переменные** и перетащите элемент **Ссылка** в окно визуального редактора.

![](<../../.gitbook/assets/image (547).png>)

{% hint style="danger" %}
Избегайте использование html-контейнера в самом себе (зацикливание).
{% endhint %}

{% hint style="info" %}
При изменении html-контента в переменной **header-logo** изменение текущего html-контейнера не требуется.
{% endhint %}

#### Пример сгенерированного html-кода

```markup
<div style="BORDER-TOP: rgb(198,198,198) 1px solid; BORDER-RIGHT: rgb(198,198,198) 1px solid; WIDTH: 150px; BORDER-BOTTOM: rgb(198,198,198) 1px solid; PADDING-BOTTOM: 5px; TEXT-ALIGN: center; PADDING-TOP: 5px; PADDING-LEFT: 5px; BORDER-LEFT: rgb(198,198,198) 1px solid; PADDING-RIGHT: 5px; BACKGROUND-COLOR: rgb(239,239,239)" zw="PABQAHIAbwBwAGUAcgB0AGkAZQBzAD4APABDAG8AbgB0AHIAbwBsAEkARAA+AE8AQQBCAGwAQQBHAEkAQQBaAEEAQgBoAEEARABRAEEATgBBAEIAaQBBAEMAMABBAE4AZwBBAHcAQQBEAFUAQQBPAFEAQQB0AEEARABFAEEATQBRAEIAbABBAEQAWQBBAEwAUQBBADUAQQBEAFEAQQBaAGcAQQB3AEEAQwAwAEEATQBBAEEAdwBBAEQARQBBAE4AUQBBADEAQQBHAFEAQQBNAFEAQQAxAEEARwBVAEEATQB3AEEAeABBAEQAUQBBADwALwBDAG8AbgB0AHIAbwBsAEkARAA+ADwAVAB5AHAAZQBJAEQAPgBWAGcAQgBoAEEASABJAEEAYQBRAEIAaABBAEcASQBBAGIAQQBCAGwAQQBBAD0APQA8AC8AVAB5AHAAZQBJAEQAPgA8AC8AUAByAG8AcABlAHIAdABpAGUAcwA+AA==">
	header-logo
</div>
```

{% hint style="info" %}
Все содержимое тега **div** с атрибутом **zw**, а также сам тег **div** будет заменен на значение html-контента использованного html-контейнера в сгенерированном html-коде страницы в процессе ее обработки
{% endhint %}

### Добавление контрола в визуальном редакторе

#### Добавление перетаскиванием

Перейдите не вкладку **Шабл. контр.**, выберите нужный контрол и  перетащите его в окно визуального редактора.

![](<../../.gitbook/assets/image (288).png>)

В результате откроется окно настройки параметров контрола.

{% hint style="info" %}
У каждого контрола индивидуальный набор параметров.\
Параметры бывают обязательные (отмечены галочкой) и общими (например, размер станицы выводимых контролом данных).
{% endhint %}

#### Редактирование параметров контрола

Выделите пиктограмму контрола курсором мыши и нажмите значок **Редактировать** в верхнем меню редактора. В результате откроется окно редактирования параметров контрола.

![](<../../.gitbook/assets/image (237).png>)

#### Пример кода

```markup
<img src="C:\Users\tarasovna\AppData\Local\Temp\ЗетаWEB_zw_ProductSearchByCodeOrText" zw="PABQAHIAbwBwAGUAcgB0AGkAZQBzAD4APABDAG8AbgB0AHIAbwBsAEkARAA+AGUAZwBCADMAQQBGADgAQQBVAEEAQgB5AEEARwA4AEEAWgBBAEIAMQBBAEcATQBBAGQAQQBCAFQAQQBHAFUAQQBZAFEAQgB5AEEARwBNAEEAYQBBAEIAQwBBAEgAawBBAFEAdwBCAHYAQQBHAFEAQQBaAFEAQgBQAEEASABJAEEAVgBBAEIAbABBAEgAZwBBAGQAQQBBAHUAQQBHAEUAQQBjAHcAQgBqAEEASABnAEEAPAAvAEMAbwBuAHQAcgBvAGwASQBEAD4APABUAHkAcABlAEkARAA+AFEAdwBCAHYAQQBHADQAQQBkAEEAQgB5AEEARwA4AEEAYgBBAEEAPQA8AC8AVAB5AHAAZQBJAEQAPgA8AEkAbgBzAHQAYQBuAGMAZQBJAEQAPgBNAEEAQQB3AEEARABBAEEATQBBAEEAdwBBAEQAQQBBAE0AQQBBAHcAQQBDADAAQQBNAEEAQQB3AEEARABBAEEATQBBAEEAdABBAEQAQQBBAE0AQQBBAHcAQQBEAEEAQQBMAFEAQQB3AEEARABBAEEATQBBAEEAdwBBAEMAMABBAE0AQQBBAHcAQQBEAEEAQQBNAEEAQQB3AEEARABBAEEATQBBAEEAdwBBAEQAQQBBAE0AQQBBAHcAQQBEAEEAQQA8AC8ASQBuAHMAdABhAG4AYwBlAEkARAA+ADwAUwBpAHQAZQBUAGUAbQBwAGwAYQB0AGUAcwBJAGQAPgBZAGcAQQA1AEEARwBVAEEATgBRAEIAbABBAEcAUQBBAE0AQQBBAHkAQQBDADAAQQBPAEEAQQA0AEEARABrAEEATgBnAEEAdABBAEQARQBBAE0AUQBCAGwAQQBEAGMAQQBMAFEAQQA0AEEARABnAEEAWQBRAEEAMwBBAEMAMABBAE0AQQBBAHcAQQBEAEUAQQBOAFEAQQAxAEEARwBRAEEATQBRAEEAMQBBAEQATQBBAFkAZwBBAHcAQQBEAE0AQQA8AC8AUwBpAHQAZQBUAGUAbQBwAGwAYQB0AGUAcwBJAGQAPgA8AEkAcwBQAHIAaQBtAGEAcgB5AD4AWgBnAEIAaABBAEcAdwBBAGMAdwBCAGwAQQBBAD0APQA8AC8ASQBzAFAAcgBpAG0AYQByAHkAPgA8AEgAaQBkAGUARgBvAHIAUgBlAGcAaQBzAHQAZQByAGUAZAA+AFoAZwBCAGgAQQBHAHcAQQBjAHcAQgBsAEEAQQA9AD0APAAvAEgAaQBkAGUARgBvAHIAUgBlAGcAaQBzAHQAZQByAGUAZAA+ADwASABpAGQAZQBGAG8AcgBBAG4AbwBuAHkAbQBvAHUAcwA+AFoAZwBCAGgAQQBHAHcAQQBjAHcAQgBsAEEAQQA9AD0APAAvAEgAaQBkAGUARgBvAHIAQQBuAG8AbgB5AG0AbwB1AHMAPgA8AEgAaQBkAGUAQwBvAG4AdAByAG8AbABJAGYARQBtAHAAdAB5AD4AWgBnAEIAaABBAEcAdwBBAGMAdwBCAGwAQQBBAD0APQA8AC8ASABpAGQAZQBDAG8AbgB0AHIAbwBsAEkAZgBFAG0AcAB0AHkAPgA8AEkAcwBTAGEAdgBlAFUAcwBlAHIAVgBhAGwAdQBlAHMAPgBaAGcAQgBoAEEARwB3AEEAYwB3AEIAbABBAEEAPQA9ADwALwBJAHMAUwBhAHYAZQBVAHMAZQByAFYAYQBsAHUAZQBzAD4APABJAHMAQQB1AHQAbwBDAGwAYQByAGkAZgB5AFcAaABlAG4ATwBuAGUAQgByAGEAbgBkAEYAbwB1AG4AZAA+AFoAZwBCAGgAQQBHAHcAQQBjAHcAQgBsAEEAQQA9AD0APAAvAEkAcwBBAHUAdABvAEMAbABhAHIAaQBmAHkAVwBoAGUAbgBPAG4AZQBCAHIAYQBuAGQARgBvAHUAbgBkAD4APABSAGUAbgBhAG0AZQBWAGUAbgBkAG8AcgBOAGEAbQBlAHMAVwBpAHQAaABXAHMAZwBWAGUAbgBkAG8AcgBOAGEAbQBlAHMAPgBaAGcAQgBoAEEARwB3AEEAYwB3AEIAbABBAEEAPQA9ADwALwBSAGUAbgBhAG0AZQBWAGUAbgBkAG8AcgBOAGEAbQBlAHMAVwBpAHQAaABXAHMAZwBWAGUAbgBkAG8AcgBOAGEAbQBlAHMAPgA8AEQAbwBOAG8AdABVAHMAZQBUAGUAYwBEAG8AYwBQAGEAcgB0AHMAPgBaAGcAQgBoAEEARwB3AEEAYwB3AEIAbABBAEEAPQA9ADwALwBEAG8ATgBvAHQAVQBzAGUAVABlAGMARABvAGMAUABhAHIAdABzAD4APABIAGkAZABlAFAAcgBvAGQAdQBjAHQAUwBlAGEAcgBjAGgAZQBkAEIAeQBVAHMAZQByAHMAQwBvAGQAZQBzAD4AWgBnAEIAaABBAEcAdwBBAGMAdwBCAGwAQQBBAD0APQA8AC8ASABpAGQAZQBQAHIAbwBkAHUAYwB0AFMAZQBhAHIAYwBoAGUAZABCAHkAVQBzAGUAcgBzAEMAbwBkAGUAcwA+ADwALwBQAHIAbwBwAGUAcgB0AGkAZQBzAD4A" new="new" />
```

{% hint style="info" %}
Тэг **img** с атрибутом **zw** будет заменен на тег **div** с набором служебных атрибутов (**cp\_...)**, содержимое которого будет сгенерировано в соответствии с указанным в параметрах шаблона.
{% endhint %}

### Ввод и форматирование текста в редакторе текста

В редакторе текста вы можете набирать html-код как вручную, так и вставив его из любого внешнего редактора.\
Для форматирования текста нажмите кнопку **Форматировать** в верхнем меню редактора.

![](<../../.gitbook/assets/image (519).png>)

```markup
<!-- неотформатированный текст -->
<table><tr><td>column 1</td><td> column 2</td></table>

<!-- отформатированный текст -->
<table>
	<tr>
		<td>
			column 1
		</td>
		<td>
			column 2
		</td>
	</tr>
</table>
```

## **Переопределение дизайна для конкретной страницы**

Если на сайте требуется сверстать страницу в новом дизайне, например, страницу-лендинг, вы можете воспользоваться опцией переопределения дизайна для конкретной страницы.

Для этого на вкладке **Основные** установите нужный дизайн в поле **Дизайн** и нажмите кнопку **Записать.**

![](<../../.gitbook/assets/image (432).png>)

См более подробную информацию о [дизайне](https://help-zetaweb.zetasoft.ru/seo-i-upravlenie-kontentom/dizain).

## **Переопределение содержимого области дизайна для конкретной страницы**

Для каждой страницы можно переопределить значение области дизайна, например, шапки, а также, очистить значение области. Для этого в дереве отображения значений областей измените / очистите значение html-контейнера и/или стиль.

![](<../../.gitbook/assets/image (500).png>)

