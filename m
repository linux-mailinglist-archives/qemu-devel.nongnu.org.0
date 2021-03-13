Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC3C339F5C
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 18:10:23 +0100 (CET)
Received: from localhost ([::1]:52782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lL7mQ-0002Z7-Ej
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 12:10:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1lL7fg-0004za-Kk
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 12:03:24 -0500
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136]:45515)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1lL7fe-0005UB-KY
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 12:03:24 -0500
Received: by mail-il1-x136.google.com with SMTP id s1so5508049ilh.12
 for <qemu-devel@nongnu.org>; Sat, 13 Mar 2021 09:03:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OCLNk633EwkYj8+HjDZcPZa95u9bzj8BiBXCE/EhBvE=;
 b=qwt5TiyzJmLcplW2tk6ccBfm4CujAwO6xeBX3/wZQ+gPae7MiBtToTEGNYulJ8r9yh
 R0wAFoW6taEHni98L/sf66+pcqSvpYYt/Gd69ENXO7EM7BidFUlNJ5OXLIuY3i64+4RO
 nPbsvGioikAtaGP39DiojJHL/6woMYpQO51i2cLE5mi80Kt7HbOnKsLH0Lfr8dbIch2t
 6ydzn8qe1UR8TY3u7MW7X3YwqhuQO0kqGL1JQdMxzDE6VKubb14DXyLjYniKOhZ4q7zy
 BCgorE5RVwUCX91qFG628EKCuAVDt3nTMs2ixyxjvvYpc0vx/cQi+2LviD+v0fVLkN94
 SJMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OCLNk633EwkYj8+HjDZcPZa95u9bzj8BiBXCE/EhBvE=;
 b=N7FYluetuhCnC06/MjD4O7ULAKG7qK2QGIbKZBP/owvA05qn0/KJNqp8nyqkC1JUjc
 Dt2TkKRXZL5S6MOwG4gc1QJxgyly7hafqhZYqCrXdY1gXoFEwJf5fHEJaKzttGxa0ff9
 F/DCrsLPqcHFj/ieKDDGTZrao1+4rVAcyY8or9vfHV2MVjUSLe0eq6+y0cwVg1jtO+2V
 bUxMG5v/dApXbnZHQyu4O0CpCY46PLk7KbImWKmePATozaCN7V45wMtfbFXnfZhVDBi1
 2xviXj40Oewg78SrIZtb0vEA9KaO78gGi/7ftgl4uFCum85+OEpq19/kJClFNP+j/MAg
 /8aA==
X-Gm-Message-State: AOAM530jYw4SOcebERf5kU7eanAevOpJYNG8vsQQo3NUDGOeB1zYyzLp
 hDmamLPlde+fawcLz0cQ2LdtJfoySRssMa2sWno=
X-Google-Smtp-Source: ABdhPJxOWIQOzqd1/gg4IL4GPfkQJstpBOh4kHAjWA+bZ6pjJmMtkWKF1vMQYlxVT49YGpH5vYrclPIY497PyfOA5fc=
X-Received: by 2002:a92:cccb:: with SMTP id u11mr6572845ilq.44.1615655001197; 
 Sat, 13 Mar 2021 09:03:21 -0800 (PST)
MIME-Version: 1.0
References: <20210313165445.2113938-1-f4bug@amsat.org>
 <20210313165445.2113938-9-f4bug@amsat.org>
In-Reply-To: <20210313165445.2113938-9-f4bug@amsat.org>
From: "Niteesh G. S." <niteesh.gs@gmail.com>
Date: Sat, 13 Mar 2021 22:32:55 +0530
Message-ID: <CAN6ztm-oO-4=W-uRNw0cBtkXuF0+RCxsi7M+BYscu4R-twVxVA@mail.gmail.com>
Subject: Re: [PATCH 08/11] hw/avr/arduino: Add D13 LED
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="0000000000006d111c05bd6dfe65"
Received-SPF: pass client-ip=2607:f8b0:4864:20::136;
 envelope-from=niteesh.gs@gmail.com; helo=mail-il1-x136.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Michael Rolnik <mrolnik@gmail.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000006d111c05bd6dfe65
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hii Phil,

Just a few mins earlier than me :)

Thanks,
Niteesh

On Sat, Mar 13, 2021 at 10:25 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg>
wrote:

> From: G S Niteesh Babu <niteesh.gs@gmail.com>
>
> Signed-off-by: G S Niteesh Babu <niteesh.gs@gmail.com>
> Reviewed-by: Michael Rolnik <mrolnik@gmail.com>
> Message-Id: <20210311135539.10206-4-niteesh.gs@gmail.com>
> [PMD: Added ArduinoMachineClass::d13_led_portb_bit]
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/avr/arduino.c | 18 ++++++++++++++++++
>  hw/avr/Kconfig   |  1 +
>  2 files changed, 19 insertions(+)
>
> diff --git a/hw/avr/arduino.c b/hw/avr/arduino.c
> index 3ff31492fa6..73563a35d0d 100644
> --- a/hw/avr/arduino.c
> +++ b/hw/avr/arduino.c
> @@ -13,6 +13,7 @@
>  #include "qemu/osdep.h"
>  #include "qapi/error.h"
>  #include "hw/boards.h"
> +#include "hw/misc/led.h"
>  #include "atmega.h"
>  #include "boot.h"
>  #include "qom/object.h"
> @@ -22,6 +23,8 @@ struct ArduinoMachineState {
>      MachineState parent_obj;
>      /*< public >*/
>      AtmegaMcuState mcu;
> +
> +    LEDState *onboard_led;
>  };
>  typedef struct ArduinoMachineState ArduinoMachineState;
>
> @@ -31,6 +34,7 @@ struct ArduinoMachineClass {
>      /*< public >*/
>      const char *mcu_type;
>      uint64_t xtal_hz;
> +    unsigned d13_led_portb_bit; /* PORTB GPIO for D13 yellow LED */
>  };
>  typedef struct ArduinoMachineClass ArduinoMachineClass;
>
> @@ -49,6 +53,16 @@ static void arduino_machine_init(MachineState *machine=
)
>                               amc->xtal_hz, &error_abort);
>      sysbus_realize(SYS_BUS_DEVICE(&ams->mcu), &error_abort);
>
> +    /* Onboard led connected to digital header PIN 13 */
> +    ams->onboard_led =3D led_create_simple(OBJECT(ams),
> +                                         GPIO_POLARITY_ACTIVE_HIGH,
> +                                         LED_COLOR_YELLOW,
> +                                         "D13 LED");
> +
> +    qdev_connect_gpio_out(DEVICE(&ams->mcu.gpio[1]),
> +                          amc->d13_led_portb_bit,
> +                          qdev_get_gpio_in(DEVICE(ams->onboard_led), 0))=
;
> +
>      if (machine->firmware) {
>          if (!avr_load_firmware(&ams->mcu.cpu, machine,
>                                 &ams->mcu.flash, machine->firmware)) {
> @@ -83,6 +97,7 @@ static void arduino_duemilanove_class_init(ObjectClass
> *oc, void *data)
>      mc->alias       =3D "2009";
>      amc->mcu_type   =3D TYPE_ATMEGA168_MCU;
>      amc->xtal_hz    =3D 16 * 1000 * 1000;
> +    amc->d13_led_portb_bit =3D 5;
>  };
>
>  static void arduino_uno_class_init(ObjectClass *oc, void *data)
> @@ -98,6 +113,7 @@ static void arduino_uno_class_init(ObjectClass *oc,
> void *data)
>      mc->alias       =3D "uno";
>      amc->mcu_type   =3D TYPE_ATMEGA328_MCU;
>      amc->xtal_hz    =3D 16 * 1000 * 1000;
> +    amc->d13_led_portb_bit =3D 5;
>  };
>
>  static void arduino_mega_class_init(ObjectClass *oc, void *data)
> @@ -113,6 +129,7 @@ static void arduino_mega_class_init(ObjectClass *oc,
> void *data)
>      mc->alias       =3D "mega";
>      amc->mcu_type   =3D TYPE_ATMEGA1280_MCU;
>      amc->xtal_hz    =3D 16 * 1000 * 1000;
> +    amc->d13_led_portb_bit =3D 7;
>  };
>
>  static void arduino_mega2560_class_init(ObjectClass *oc, void *data)
> @@ -128,6 +145,7 @@ static void arduino_mega2560_class_init(ObjectClass
> *oc, void *data)
>      mc->alias       =3D "mega2560";
>      amc->mcu_type   =3D TYPE_ATMEGA2560_MCU;
>      amc->xtal_hz    =3D 16 * 1000 * 1000; /* CSTCE16M0V53-R0 */
> +    amc->d13_led_portb_bit =3D 7;
>  };
>
>  static const TypeInfo arduino_machine_types[] =3D {
> diff --git a/hw/avr/Kconfig b/hw/avr/Kconfig
> index 16a57ced11f..e0d4fc5537a 100644
> --- a/hw/avr/Kconfig
> +++ b/hw/avr/Kconfig
> @@ -8,3 +8,4 @@ config AVR_ATMEGA_MCU
>  config ARDUINO
>      select AVR_ATMEGA_MCU
>      select UNIMP
> +    select LED
> --
> 2.26.2
>
>

--0000000000006d111c05bd6dfe65
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">Hii=
 Phil,</div><div class=3D"gmail_default" style=3D"font-size:small"><br></di=
v><div class=3D"gmail_default" style=3D"font-size:small">Just a few mins ea=
rlier than me :)</div><div class=3D"gmail_default" style=3D"font-size:small=
"><br></div><div class=3D"gmail_default" style=3D"font-size:small">Thanks,<=
/div><div class=3D"gmail_default" style=3D"font-size:small">Niteesh</div></=
div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On=
 Sat, Mar 13, 2021 at 10:25 PM Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"m=
ailto:f4bug@amsat.org">f4bug@amsat.org</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">From: G S Niteesh Babu &lt;<a href=3D=
"mailto:niteesh.gs@gmail.com" target=3D"_blank">niteesh.gs@gmail.com</a>&gt=
;<br>
<br>
Signed-off-by: G S Niteesh Babu &lt;<a href=3D"mailto:niteesh.gs@gmail.com"=
 target=3D"_blank">niteesh.gs@gmail.com</a>&gt;<br>
Reviewed-by: Michael Rolnik &lt;<a href=3D"mailto:mrolnik@gmail.com" target=
=3D"_blank">mrolnik@gmail.com</a>&gt;<br>
Message-Id: &lt;<a href=3D"mailto:20210311135539.10206-4-niteesh.gs@gmail.c=
om" target=3D"_blank">20210311135539.10206-4-niteesh.gs@gmail.com</a>&gt;<b=
r>
[PMD: Added ArduinoMachineClass::d13_led_portb_bit]<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsa=
t.org" target=3D"_blank">f4bug@amsat.org</a>&gt;<br>
---<br>
=C2=A0hw/avr/arduino.c | 18 ++++++++++++++++++<br>
=C2=A0hw/avr/Kconfig=C2=A0 =C2=A0|=C2=A0 1 +<br>
=C2=A02 files changed, 19 insertions(+)<br>
<br>
diff --git a/hw/avr/arduino.c b/hw/avr/arduino.c<br>
index 3ff31492fa6..73563a35d0d 100644<br>
--- a/hw/avr/arduino.c<br>
+++ b/hw/avr/arduino.c<br>
@@ -13,6 +13,7 @@<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
=C2=A0#include &quot;qapi/error.h&quot;<br>
=C2=A0#include &quot;hw/boards.h&quot;<br>
+#include &quot;hw/misc/led.h&quot;<br>
=C2=A0#include &quot;atmega.h&quot;<br>
=C2=A0#include &quot;boot.h&quot;<br>
=C2=A0#include &quot;qom/object.h&quot;<br>
@@ -22,6 +23,8 @@ struct ArduinoMachineState {<br>
=C2=A0 =C2=A0 =C2=A0MachineState parent_obj;<br>
=C2=A0 =C2=A0 =C2=A0/*&lt; public &gt;*/<br>
=C2=A0 =C2=A0 =C2=A0AtmegaMcuState mcu;<br>
+<br>
+=C2=A0 =C2=A0 LEDState *onboard_led;<br>
=C2=A0};<br>
=C2=A0typedef struct ArduinoMachineState ArduinoMachineState;<br>
<br>
@@ -31,6 +34,7 @@ struct ArduinoMachineClass {<br>
=C2=A0 =C2=A0 =C2=A0/*&lt; public &gt;*/<br>
=C2=A0 =C2=A0 =C2=A0const char *mcu_type;<br>
=C2=A0 =C2=A0 =C2=A0uint64_t xtal_hz;<br>
+=C2=A0 =C2=A0 unsigned d13_led_portb_bit; /* PORTB GPIO for D13 yellow LED=
 */<br>
=C2=A0};<br>
=C2=A0typedef struct ArduinoMachineClass ArduinoMachineClass;<br>
<br>
@@ -49,6 +53,16 @@ static void arduino_machine_init(MachineState *machine)<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 amc-&gt;xtal_hz, &amp;error_abort);<br>
=C2=A0 =C2=A0 =C2=A0sysbus_realize(SYS_BUS_DEVICE(&amp;ams-&gt;mcu), &amp;e=
rror_abort);<br>
<br>
+=C2=A0 =C2=A0 /* Onboard led connected to digital header PIN 13 */<br>
+=C2=A0 =C2=A0 ams-&gt;onboard_led =3D led_create_simple(OBJECT(ams),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GP=
IO_POLARITY_ACTIVE_HIGH,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0LE=
D_COLOR_YELLOW,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&q=
uot;D13 LED&quot;);<br>
+<br>
+=C2=A0 =C2=A0 qdev_connect_gpio_out(DEVICE(&amp;ams-&gt;mcu.gpio[1]),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 amc-&gt;d13_led_portb_bit,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 qdev_get_gpio_in(DEVICE(ams-&gt;onboard_led), 0));<br>
+<br>
=C2=A0 =C2=A0 =C2=A0if (machine-&gt;firmware) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!avr_load_firmware(&amp;ams-&gt;mcu.c=
pu, machine,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;ams-&gt;mcu.flash, machine-&gt;=
firmware)) {<br>
@@ -83,6 +97,7 @@ static void arduino_duemilanove_class_init(ObjectClass *o=
c, void *data)<br>
=C2=A0 =C2=A0 =C2=A0mc-&gt;alias=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;2009&q=
uot;;<br>
=C2=A0 =C2=A0 =C2=A0amc-&gt;mcu_type=C2=A0 =C2=A0=3D TYPE_ATMEGA168_MCU;<br=
>
=C2=A0 =C2=A0 =C2=A0amc-&gt;xtal_hz=C2=A0 =C2=A0 =3D 16 * 1000 * 1000;<br>
+=C2=A0 =C2=A0 amc-&gt;d13_led_portb_bit =3D 5;<br>
=C2=A0};<br>
<br>
=C2=A0static void arduino_uno_class_init(ObjectClass *oc, void *data)<br>
@@ -98,6 +113,7 @@ static void arduino_uno_class_init(ObjectClass *oc, void=
 *data)<br>
=C2=A0 =C2=A0 =C2=A0mc-&gt;alias=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;uno&qu=
ot;;<br>
=C2=A0 =C2=A0 =C2=A0amc-&gt;mcu_type=C2=A0 =C2=A0=3D TYPE_ATMEGA328_MCU;<br=
>
=C2=A0 =C2=A0 =C2=A0amc-&gt;xtal_hz=C2=A0 =C2=A0 =3D 16 * 1000 * 1000;<br>
+=C2=A0 =C2=A0 amc-&gt;d13_led_portb_bit =3D 5;<br>
=C2=A0};<br>
<br>
=C2=A0static void arduino_mega_class_init(ObjectClass *oc, void *data)<br>
@@ -113,6 +129,7 @@ static void arduino_mega_class_init(ObjectClass *oc, vo=
id *data)<br>
=C2=A0 =C2=A0 =C2=A0mc-&gt;alias=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;mega&q=
uot;;<br>
=C2=A0 =C2=A0 =C2=A0amc-&gt;mcu_type=C2=A0 =C2=A0=3D TYPE_ATMEGA1280_MCU;<b=
r>
=C2=A0 =C2=A0 =C2=A0amc-&gt;xtal_hz=C2=A0 =C2=A0 =3D 16 * 1000 * 1000;<br>
+=C2=A0 =C2=A0 amc-&gt;d13_led_portb_bit =3D 7;<br>
=C2=A0};<br>
<br>
=C2=A0static void arduino_mega2560_class_init(ObjectClass *oc, void *data)<=
br>
@@ -128,6 +145,7 @@ static void arduino_mega2560_class_init(ObjectClass *oc=
, void *data)<br>
=C2=A0 =C2=A0 =C2=A0mc-&gt;alias=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;mega25=
60&quot;;<br>
=C2=A0 =C2=A0 =C2=A0amc-&gt;mcu_type=C2=A0 =C2=A0=3D TYPE_ATMEGA2560_MCU;<b=
r>
=C2=A0 =C2=A0 =C2=A0amc-&gt;xtal_hz=C2=A0 =C2=A0 =3D 16 * 1000 * 1000; /* C=
STCE16M0V53-R0 */<br>
+=C2=A0 =C2=A0 amc-&gt;d13_led_portb_bit =3D 7;<br>
=C2=A0};<br>
<br>
=C2=A0static const TypeInfo arduino_machine_types[] =3D {<br>
diff --git a/hw/avr/Kconfig b/hw/avr/Kconfig<br>
index 16a57ced11f..e0d4fc5537a 100644<br>
--- a/hw/avr/Kconfig<br>
+++ b/hw/avr/Kconfig<br>
@@ -8,3 +8,4 @@ config AVR_ATMEGA_MCU<br>
=C2=A0config ARDUINO<br>
=C2=A0 =C2=A0 =C2=A0select AVR_ATMEGA_MCU<br>
=C2=A0 =C2=A0 =C2=A0select UNIMP<br>
+=C2=A0 =C2=A0 select LED<br>
-- <br>
2.26.2<br>
<br>
</blockquote></div>

--0000000000006d111c05bd6dfe65--

