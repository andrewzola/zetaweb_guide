# Баннеры

В системе Zeta Web встречаются два вида баннеров:

* Динамические баннеры, созданные с помощью контрола
* Статические баннеры

## Статические баннеры

Статические баннеры добавлены на страницу как код html, не управляются контролом и редактируются силами пользователя. 

![&#x41F;&#x440;&#x438;&#x43C;&#x435;&#x440; &#x432;&#x435;&#x440;&#x441;&#x442;&#x43A;&#x438; &#x431;&#x430;&#x43D;&#x43D;&#x435;&#x440;&#x43E;&#x432;](../../.gitbook/assets/image%20%2856%29.png)

```markup
<div class="banners__container">
	<div class="banners__row">
		<div class="banners__item banners__item_x1">
			<a class="banners__inner banners__inner_border" href="">
				<img width="215" height="215" class="banners__img" src="/i/banner-6.png?imgw=215&amp;imgh=215" alt="" title="">
				<div class="banners__link banners__link-rectangle banners__link-rectangle_top">Аккумуляторы</div>
			</a>
		</div>
		
		<div class="banners__item banners__item_x1">
			<a class="banners__inner banners__inner_border" href="">
				<img width="215" height="215" class="banners__img" src="/i/banner-6.png?imgw=215&amp;imgh=215" alt="" title="">
				<div class="banners__link banners__link-rectangle banners__link-rectangle_top">Аккумуляторы</div>
			</a>
		</div>
		
		<div class="banners__item banners__item_x1">
			<a class="banners__inner banners__inner_border" href="">
				<img width="215" height="215" class="banners__img" src="/i/banner-6.png?imgw=215&amp;imgh=215" alt="" title="">
				<div class="banners__link banners__link-rectangle banners__link-rectangle_top">Аккумуляторы</div>
			</a>
		</div>
		
		<div class="banners__item banners__item_x1">
			<a class="banners__inner banners__inner_border" href="">
				<img width="215" height="215" class="banners__img" src="/i/banner-6.png?imgw=215&amp;imgh=215" alt="" title="">
				<div class="banners__link banners__link-rectangle banners__link-rectangle_top">Аккумуляторы</div>
			</a>
		</div>
	</div>
</div>
```

* Структура блока баннера

```markup
<div class="banners__container"><!-- контейнер для баннеров -->	
    <div class="banners__row"><!-- строка баннеров --> 
    
        <!-- баннер -->
        <!-- .banners__item - класс блока баннера
             .banners__item_w1 - баннер найменьшей ширины
             .banners__item_h1 - баннер найменьшей высоты
             .banners__inner - обертка
             .banners__img - изображение баннера
             .banners__link.banners__link-rectangle - заголовок в виде полосы
         -->  
         <div class="banners__item banners__item_w1 banners__item_h1"> 
 		    <a class="banners__inner" href="">
 			    <img width="215" height="215" class="banners__img" src="/i/banner-6.png?imgw=215&amp;imgh=215" alt="" title="">
 			    <div class="banners__link banners__link-rectangle banners__link-rectangle_top">Аккумуляторы</div>
 		    </a>
 	    </div>
        <!-- конец баннера -->
 
    </div>
</div>
```

* Строка баннеров **.banners\_\_row** должна быть вложена в контейнер **.banners\_\_container**.
* В одну строку может поместиться 4 баннера наименьшего размера.
* Классы управления размерами баннера:

| Класс | Максимальная ширина |
| :--- | :--- |
| .banners\_\_item\_w1 | max-width: 215px; |
| .banners\_\_item\_w2 | max-width: 430px; |
| .banners\_\_item\_w3 | max-width: 646px; |
| .banners\_\_item\_w4 | max-width: 861px; |

| Класс | Максимальная высота |
| :--- | :--- |
| .banners\_\_item\_h1 | max-height: 215px; |
| .banners\_\_item\_h2 | max-height: 430px; |
| .banners\_\_item\_h3 | max-height: 646px; |
| .banners\_\_item\_h4 | max-height: 861px; |

* Необходимо использовать оба размера баннера: и ширину, и высоту. 

![&#x41F;&#x440;&#x438;&#x43C;&#x435;&#x440; &#x438;&#x441;&#x43F;&#x43E;&#x43B;&#x44C;&#x437;&#x43E;&#x432;&#x430;&#x43D;&#x438;&#x44F; &#x431;&#x430;&#x43D;&#x43D;&#x435;&#x440;&#x43E;&#x432; &#x440;&#x430;&#x437;&#x43D;&#x43E;&#x439; &#x448;&#x438;&#x440;&#x438;&#x43D;&#x44B;](../../.gitbook/assets/image%20%28267%29.png)

```markup
<div class="banners__item banners__item_w2 banners__item_h1">
    <a class="banners__inner" href="">
        <img class="banners__img" src="/i/banner-5.png?imgw=430&amp;imgh=215" width="430" height="215" alt="" title="">
    </a>
</div>
```

* Если баннер квадратный, используйте следующие классы:

| Класс | Максимальная ширина | Максимальная высота |
| :--- | :--- | :--- |
| .banners\_\_item\_x1 | max-width: 215px;  | max-height: 215px; |
| .banners\_\_item\_x2 | max-width: 430px;  | max-height: 430px; |
| .banners\_\_item\_x3 | max-width: 646px;  | max-height: 646px; |
| .banners\_\_item\_x4 | max-width: 861px;  | max-height: 861px; |

* Если баннер по высоте занимает более одной строки, используйте дополнительный класс для задания высоты баннера с учетом отступа между строк баннеров.

| Класс | Максимальная высота |
| :--- | :--- |
| .banners\_\_item\_r2 | max-height: 445px; |
| .banners\_\_item\_r3 | max-height: 661px; |
| .banners\_\_item\_r4 | max-height: 876px; |

* Баннеру можно задать заголовок. Для использования заголовка в форме эллипса используйте классы: **.banners\_\_link-ellipse** и .**banners\_\_link-ellipse\_top** или **.banners\_\_link-ellipse\_bottom**.



![&#x41F;&#x440;&#x438;&#x43C;&#x435;&#x440; &#x438;&#x441;&#x43F;&#x43E;&#x43B;&#x44C;&#x437;&#x43E;&#x432;&#x430;&#x43D;&#x438;&#x44F; &#x43A;&#x43B;&#x430;&#x441;&#x441;&#x43E;&#x432; .banners\_\_link-ellipse .banners\_\_link-ellipse\_bottom](../../.gitbook/assets/image%20%28191%29.png)

```markup
<div class="banners__item banners__item_x2 banners__item_r2">
	<a class="banners__inner" href="">
		<img width="430" height="445" title="Баннер 1" class="banners__img" alt="Баннер 1" src="/i/banner-1.png?imgw=430&amp;imgh=445">
		<div class="banners__link banners__link-ellipse banners__link-ellipse_bottom">
			Подробнее
			<span class="icon-015 banners__icon"></span>
		</div>
	</a>
</div>
```

* Для использования заголовка в виде полосы используйте классы **.banners\_\_link-rectangle** и **.banners\_\_link-rectangle\_bottom** или **.banners\_\_link-rectangle\_top**

![&#x41F;&#x440;&#x438;&#x43C;&#x435;&#x440; &#x437;&#x430;&#x433;&#x43E;&#x43B;&#x43E;&#x432;&#x43A;&#x43E;&#x432; &#x432; &#x432;&#x438;&#x434;&#x435; &#x43F;&#x43E;&#x43B;&#x43E;&#x441;&#x44B;](../../.gitbook/assets/image%20%28115%29.png)

```markup
<div class="banners__item banners__item_x1">
	<a class="banners__inner banners__inner_border" href="">
		<img width="215" height="215" class="banners__img" src="/i/banner-6.png?imgw=215&amp;imgh=215" alt="" title="">
		<div class="banners__link banners__link-rectangle banners__link-rectangle_bottom">Аккумуляторы</div>
	</a>
</div>

<div class="banners__item banners__item_x1">
	<a class="banners__inner banners__inner_border" href="">
		<img width="215" height="215" class="banners__img" src="/i/banner-7.png?imgw=215&amp;imgh=215" alt="" title="">
		<div class="banners__link banners__link-rectangle banners__link-rectangle_top">-10% на автохимию</div>
	</a>
</div>
```

* Для добавления границы для баннера используйте класс **.banners\_\_inner\_border** вместе с **.banners\_\_inner**

```markup
<div class="banners__item banners__item_x1">
    <a class="banners__inner banners__inner_border" href="">
	   <img width="215" height="215" class="banners__img" src="/i/banner-6.png?imgw=215&amp;imgh=215" alt="" title="">
	   <div class="banners__link banners__link-rectangle banners__link-rectangle_top">Аккумуляторы</div>
	</a>
</div>
```

* Изображения для баннеров добавляются средствами 1с. В Форме выбора изображения укажите класс css **.banners\_\_img**,  а также размеры самого изображения согласно выбранным классам ширины и высоты.

![&#x424;&#x43E;&#x440;&#x43C;&#x430; &#x432;&#x44B;&#x431;&#x43E;&#x440;&#x430; &#x438;&#x437;&#x43E;&#x431;&#x440;&#x430;&#x436;&#x435;&#x43D;&#x438;&#x44F;](../../.gitbook/assets/image%20%28218%29.png)

### Статические баннеры в типовом дизайне

![&#x411;&#x430;&#x43D;&#x43D;&#x435;&#x440;&#x44B; &#x442;&#x438;&#x43F;&#x43E;&#x432;&#x43E;&#x433;&#x43E; &#x434;&#x438;&#x437;&#x430;&#x439;&#x43D;&#x430;](../../.gitbook/assets/image%20%2826%29.png)

{% hint style="info" %}
Для типового дизайна рекомендуются следующие размеры 430px x 445px, 215px x 215px, 430px x 215px.
{% endhint %}

Для верстки баннеров типового дизайна был использован дополнительный контейнер **.banner-group** для группировки баннеров в колонки с шириной 50%. Используйте собственные классы для построения необходимой сетки. 

В 1С баннеры размещены в переменных banner-1 - banner-7 и собраны в переменную banner. Переменная banners размещена на главной странице.

![&#x421;&#x442;&#x440;&#x430;&#x43D;&#x438;&#x446;&#x44B;/&#x41F;&#x435;&#x440;&#x435;&#x43C;&#x435;&#x43D;&#x43D;&#x44B;&#x435; - &#x41F;&#x435;&#x440;&#x435;&#x43C;&#x435;&#x43D;&#x43D;&#x44B;&#x435; - banners ](../../.gitbook/assets/image%20%28111%29.png)



