Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24CAC701C55
	for <lists+qemu-devel@lfdr.de>; Sun, 14 May 2023 10:31:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1py77C-0005tq-Oq; Sun, 14 May 2023 04:30:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mrolnik@gmail.com>) id 1py779-0005th-PC
 for qemu-devel@nongnu.org; Sun, 14 May 2023 04:29:59 -0400
Received: from mail-vk1-xa36.google.com ([2607:f8b0:4864:20::a36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mrolnik@gmail.com>) id 1py777-000303-8s
 for qemu-devel@nongnu.org; Sun, 14 May 2023 04:29:59 -0400
Received: by mail-vk1-xa36.google.com with SMTP id
 71dfb90a1353d-44fd6c24d5aso4150712e0c.3
 for <qemu-devel@nongnu.org>; Sun, 14 May 2023 01:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684052996; x=1686644996;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1FogmRf9TaOjrpVbgyrYCy77K+AFZhmIFgTqtApbppw=;
 b=NPH9WHDfsSIedeoc8fhwnXMTvmn9sIk5lge+ZtjtZ1jb/xh0Qj57GFoQPlRK2lDYh4
 fx3u7eIQqYJ7VLhy3OYVfYcU3m6Mbb8cUp5Kw/Ji9izLBEEHDxlaHAzx/UjXGcaXcYcT
 Ri0tDvpz+r9mAbplrO0/ebpZ97CK1MVqy0lw3uIvZhWUGgUfSpcRyx18x94zzRc2JDy6
 TErTNF4wKrasbvPLXgB66tRuaQT9ZJn8q8uAdZyS+5RupsxwzU2OwlsGY20a+szgrlUx
 zjxq3D41DBwiV4u3TmVu4kHPjVxQbLbuO0aCBxtQNHV6KAz4TPs2SxWsdFVKHlc11sMN
 YJGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684052996; x=1686644996;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1FogmRf9TaOjrpVbgyrYCy77K+AFZhmIFgTqtApbppw=;
 b=iAUWBeJP30yB6piCP27LRM2XL2WdnLxA/SeGwYDX1UBw1n0nLk6FGdXsfXm8ejrLiw
 umxgNnQG4fzN4ZgO7jPoVqB8NPXiOT4eWVEKnue8XqQXkD2WWT4Ag2H1RHmOi8S/+a7z
 BcPmkqMDpsDLnU7lPJFezsToh9zc2jMXVMgEkGxXFyKr6mWov4nKhMh0ZRP7+KRBpNaJ
 /zCDWwcYw2jEf35MM8NPMWm7R+7Kp5xhx/rBLywTZ2cvsH6WEnchJHUoRFb2bIEsMCQL
 vPXG1YnqOHXdGmeXvkADfREYVwfLLEBoeLKs4lASJAisdklz5q4+6Ay3EwPyEg6SFmbC
 mwnQ==
X-Gm-Message-State: AC+VfDy8hX0S/PIp6uw/ZYJncgc9DkhrHrb8yI3IW04V435t9wxVaEdh
 H9gIDweoImCw8wyAPDY/yOSYvrXh2Np+f5SWFCk/Lac6teWB9Q==
X-Google-Smtp-Source: ACHHUZ5pDM2SjjVIgLxqkBr/NFFq7ZZOA0U8XNhpOos2q1/YA8V2j6NBEyAK4Wut/Q1Mi0ChWf1872JmzJdicBv3ibY=
X-Received: by 2002:a1f:dd42:0:b0:43f:e52f:b221 with SMTP id
 u63-20020a1fdd42000000b0043fe52fb221mr9347108vkg.5.1684052995706; Sun, 14 May
 2023 01:29:55 -0700 (PDT)
MIME-Version: 1.0
References: <168401486673.12341.14012259683871048547-0@git.sr.ht>
In-Reply-To: <168401486673.12341.14012259683871048547-0@git.sr.ht>
From: Michael Rolnik <mrolnik@gmail.com>
Date: Sun, 14 May 2023 11:29:19 +0300
Message-ID: <CAK4993iwmBui1Z--4kKKMHrSXmxZLw19qfh1FHhSGFbRsUKkBw@mail.gmail.com>
Subject: Re: [PATCH qemu] hw: add ATmega16u4 and ATmega32u4 MCUs
To: "~rmsyn" <synchlsrm@proton.me>
Cc: Qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000009793f405fba32480"
Received-SPF: pass client-ip=2607:f8b0:4864:20::a36;
 envelope-from=mrolnik@gmail.com; helo=mail-vk1-xa36.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--0000000000009793f405fba32480
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Michael Rolnik <mrolnik@gmail.com>

On Sun, May 14, 2023 at 12:54=E2=80=AFAM ~rmsyn <rmsyn@git.sr.ht> wrote:

> From: rmsyn <rmsynchls@gmail.com>
>
> Adds support for ATmega16u4 and ATmega32u4 MCU definitions.
>
> Defines interrupts, memory layout, and machine types for generic
> ATmega16u4 and ATmega32u4 MCUs.
>
> Signed-off-by: rmsyn <rmsynchls@gmail.com>
> ---
>  hw/avr/arduino.c |  36 ++++++++++++++
>  hw/avr/atmega.c  | 122 +++++++++++++++++++++++++++++++++++++++++++++++
>  hw/avr/atmega.h  |   2 +
>  3 files changed, 160 insertions(+)
>
> diff --git a/hw/avr/arduino.c b/hw/avr/arduino.c
> index 48ef478346..be04e412e6 100644
> --- a/hw/avr/arduino.c
> +++ b/hw/avr/arduino.c
> @@ -129,6 +129,34 @@ static void arduino_mega2560_class_init(ObjectClass
> *oc, void *data)
>      amc->xtal_hz    =3D 16 * 1000 * 1000; /* CSTCE16M0V53-R0 */
>  };
>
> +static void arduino_mega16u4_class_init(ObjectClass *oc, void *data)
> +{
> +    MachineClass *mc =3D MACHINE_CLASS(oc);
> +    ArduinoMachineClass *amc =3D ARDUINO_MACHINE_CLASS(oc);
> +
> +    /*
> +     *
> https://ww1.microchip.com/downloads/en/devicedoc/atmel-7766-8-bit-avr-atm=
ega16u4-32u4_datasheet.pdf
> +     */
> +    mc->desc        =3D "Arduino Mega 16u4 (ATmega16u4)";
> +    mc->alias       =3D "mega16u4";
> +    amc->mcu_type   =3D TYPE_ATMEGA16U4_MCU;
> +    amc->xtal_hz    =3D 16 * 1000 * 1000; /* CSTCE16M0V53-R0 */
> +};
> +
> +static void arduino_mega32u4_class_init(ObjectClass *oc, void *data)
> +{
> +    MachineClass *mc =3D MACHINE_CLASS(oc);
> +    ArduinoMachineClass *amc =3D ARDUINO_MACHINE_CLASS(oc);
> +
> +    /*
> +     *
> https://ww1.microchip.com/downloads/en/devicedoc/atmel-7766-8-bit-avr-atm=
ega16u4-32u4_datasheet.pdf
> +     */
> +    mc->desc        =3D "Arduino Mega 32u4 (ATmega32u4)";
> +    mc->alias       =3D "mega32u4";
> +    amc->mcu_type   =3D TYPE_ATMEGA32U4_MCU;
> +    amc->xtal_hz    =3D 16 * 1000 * 1000; /* CSTCE16M0V53-R0 */
> +};
> +
>  static const TypeInfo arduino_machine_types[] =3D {
>      {
>          .name          =3D MACHINE_TYPE_NAME("arduino-duemilanove"),
> @@ -146,6 +174,14 @@ static const TypeInfo arduino_machine_types[] =3D {
>          .name          =3D MACHINE_TYPE_NAME("arduino-mega-2560-v3"),
>          .parent        =3D TYPE_ARDUINO_MACHINE,
>          .class_init    =3D arduino_mega2560_class_init,
> +    }, {
> +        .name          =3D MACHINE_TYPE_NAME("arduino-mega-16u4"),
> +        .parent        =3D TYPE_ARDUINO_MACHINE,
> +        .class_init    =3D arduino_mega16u4_class_init,
> +    }, {
> +        .name          =3D MACHINE_TYPE_NAME("arduino-mega-32u4"),
> +        .parent        =3D TYPE_ARDUINO_MACHINE,
> +        .class_init    =3D arduino_mega32u4_class_init,
>      }, {
>          .name           =3D TYPE_ARDUINO_MACHINE,
>          .parent         =3D TYPE_MACHINE,
> diff --git a/hw/avr/atmega.c b/hw/avr/atmega.c
> index a34803e642..292ad9a447 100644
> --- a/hw/avr/atmega.c
> +++ b/hw/avr/atmega.c
> @@ -27,6 +27,17 @@ enum AtmegaPeripheral {
>      GPIOG, GPIOH, GPIOI, GPIOJ, GPIOK, GPIOL,
>      USART0, USART1, USART2, USART3,
>      TIMER0, TIMER1, TIMER2, TIMER3, TIMER4, TIMER5,
> +    RESET,
> +    INT0, INT1, INT2, INT3, INT4, INT5, INT6,
> +    PCINT0,
> +    USB_GEN, USB_EP,
> +    WDT,
> +    SPI,
> +    ANALOG_COMP,
> +    ADC,
> +    EE_READY,
> +    TWI,
> +    SPM_READY,
>      PERIFMAX
>  };
>
> @@ -98,6 +109,30 @@ static const peripheral_cfg dev168_328[PERIFMAX] =3D =
{
>      [GPIOC]         =3D {  0x26 },
>      [GPIOB]         =3D {  0x23 },
>      [GPIOA]         =3D {  0x20 },
> +}, dev16u4_32u4[PERIFMAX] =3D {
> +    [POWER1]        =3D {  0x65 },
> +    [POWER0]        =3D {  0x64 },
> +    [TIMER4]        =3D {  0x4c, POWER1, 4, 0x72, 0x39, true },
> +    [SPM_READY]     =3D {  0x4a },
> +    [TWI]           =3D {  0x48 },
> +    [TIMER3]        =3D {  0x3e, POWER1, 3, 0x71, 0x38, true },
> +    [EE_READY]      =3D {  0x3c },
> +    [ADC]           =3D {  0x3a },
> +    [ANALOG_COMP]   =3D {  0x38 },
> +    [USART1]        =3D {  0x32, POWER1, 0 },
> +    [SPI]           =3D {  0x30 },
> +    [TIMER0]        =3D {  0x2a, POWER0, 5, 0x6e, 0x35, true },
> +    [TIMER1]        =3D {  0x20, POWER0, 3, 0x6f, 0x36, true },
> +    [WDT]           =3D {  0x18 },
> +    [USB_GEN]       =3D {  0x14 },
> +    [USB_EP]        =3D {  0x16 },
> +    [PCINT0]        =3D {  0x12 },
> +    [INT6]          =3D {  0x0e },
> +    [INT3]          =3D {  0x08 },
> +    [INT2]          =3D {  0x06 },
> +    [INT1]          =3D {  0x04 },
> +    [INT0]          =3D {  0x02 },
> +    [RESET]         =3D {  0x00 },
>  };
>
>  enum AtmegaIrq {
> @@ -117,6 +152,17 @@ enum AtmegaIrq {
>          TIMER4_COMPC_IRQ, TIMER4_OVF_IRQ,
>      TIMER5_CAPT_IRQ, TIMER5_COMPA_IRQ, TIMER5_COMPB_IRQ,
>          TIMER5_COMPC_IRQ, TIMER5_OVF_IRQ,
> +    RESET_IRQ,
> +    INT0_IRQ, INT1_IRQ, INT2_IRQ, INT3_IRQ, INT4_IRQ, INT5_IRQ, INT6_IRQ=
,
> +    PCINT0_IRQ,
> +    USB_GEN_IRQ, USB_EP_IRQ,
> +    WDT_IRQ,
> +    SPI_IRQ,
> +    ANALOG_COMP_IRQ,
> +    ADC_IRQ,
> +    EE_READY_IRQ,
> +    TWI_IRQ,
> +    SPM_READY_IRQ,
>      IRQ_COUNT
>  };
>
> @@ -184,6 +230,44 @@ static const uint8_t irq168_328[IRQ_COUNT] =3D {
>      [USART3_RXC_IRQ]        =3D 55,
>      [USART3_DRE_IRQ]        =3D 56,
>      [USART3_TXC_IRQ]        =3D 57,
> +}, irq16u4_32u4[IRQ_COUNT] =3D {
> +    [RESET_IRQ]             =3D  1,
> +    [INT0_IRQ]              =3D  2,
> +    [INT1_IRQ]              =3D  3,
> +    [INT2_IRQ]              =3D  4,
> +    [INT3_IRQ]              =3D  5,
> +    [INT6_IRQ]              =3D  8,
> +    [PCINT0_IRQ]            =3D 10,
> +    [USB_GEN_IRQ]           =3D 11,
> +    [USB_EP_IRQ]            =3D 12,
> +    [WDT_IRQ]               =3D 13,
> +    [TIMER1_CAPT_IRQ]       =3D 17,
> +    [TIMER1_COMPA_IRQ]      =3D 18,
> +    [TIMER1_COMPB_IRQ]      =3D 19,
> +    [TIMER1_COMPC_IRQ]      =3D 20,
> +    [TIMER1_OVF_IRQ]        =3D 21,
> +    [TIMER0_COMPA_IRQ]      =3D 22,
> +    [TIMER0_COMPB_IRQ]      =3D 23,
> +    [TIMER0_OVF_IRQ]        =3D 24,
> +    [SPI_IRQ]               =3D 25,
> +    [USART0_RXC_IRQ]        =3D 26,
> +    [USART0_DRE_IRQ]        =3D 27,
> +    [USART0_TXC_IRQ]        =3D 28,
> +    [ANALOG_COMP]           =3D 29,
> +    [ADC_IRQ]               =3D 30,
> +    [EE_READY_IRQ]          =3D 31,
> +    [TIMER3_CAPT_IRQ]       =3D 32,
> +    [TIMER3_COMPA_IRQ]      =3D 33,
> +    [TIMER3_COMPB_IRQ]      =3D 34,
> +    [TIMER3_COMPC_IRQ]      =3D 35,
> +    [TIMER3_OVF_IRQ]        =3D 36,
> +    [TWI_IRQ]               =3D 37,
> +    [SPM_READY_IRQ]         =3D 38,
> +    [TIMER4_COMPA_IRQ]      =3D 39,
> +    [TIMER4_COMPB_IRQ]      =3D 40,
> +    [TIMER4_COMPC_IRQ]      =3D 41,
> +    [TIMER4_OVF_IRQ]        =3D 42,
> +    /*[TIMER4_FPF_IRQ]        =3D 43,*/
>  };
>
>  static void connect_peripheral_irq(const AtmegaMcuClass *k,
> @@ -427,6 +511,36 @@ static void atmega2560_class_init(ObjectClass *oc,
> void *data)
>      amc->dev =3D dev1280_2560;
>  };
>
> +static void atmega16u4_class_init(ObjectClass *oc, void *data)
> +{
> +    AtmegaMcuClass *amc =3D ATMEGA_MCU_CLASS(oc);
> +
> +    amc->cpu_type =3D AVR_CPU_TYPE_NAME("avr5");
> +    amc->flash_size =3D 16 * KiB;
> +    amc->eeprom_size =3D 512;
> +    amc->sram_size =3D KiB + 256;
> +    amc->io_size =3D 64;
> +    amc->gpio_count =3D 32;
> +    amc->adc_count =3D 12;
> +    amc->irq =3D irq16u4_32u4;
> +    amc->dev =3D dev16u4_32u4;
> +};
> +
> +static void atmega32u4_class_init(ObjectClass *oc, void *data)
> +{
> +    AtmegaMcuClass *amc =3D ATMEGA_MCU_CLASS(oc);
> +
> +    amc->cpu_type =3D AVR_CPU_TYPE_NAME("avr5");
> +    amc->flash_size =3D 32 * KiB;
> +    amc->eeprom_size =3D KiB;
> +    amc->sram_size =3D 2 * KiB + 512;
> +    amc->io_size =3D 64;
> +    amc->gpio_count =3D 32;
> +    amc->adc_count =3D 12;
> +    amc->irq =3D irq16u4_32u4;
> +    amc->dev =3D dev16u4_32u4;
> +};
> +
>  static const TypeInfo atmega_mcu_types[] =3D {
>      {
>          .name           =3D TYPE_ATMEGA168_MCU,
> @@ -444,6 +558,14 @@ static const TypeInfo atmega_mcu_types[] =3D {
>          .name           =3D TYPE_ATMEGA2560_MCU,
>          .parent         =3D TYPE_ATMEGA_MCU,
>          .class_init     =3D atmega2560_class_init,
> +    }, {
> +        .name           =3D TYPE_ATMEGA16U4_MCU,
> +        .parent         =3D TYPE_ATMEGA_MCU,
> +        .class_init     =3D atmega16u4_class_init,
> +    }, {
> +        .name           =3D TYPE_ATMEGA32U4_MCU,
> +        .parent         =3D TYPE_ATMEGA_MCU,
> +        .class_init     =3D atmega32u4_class_init,
>      }, {
>          .name           =3D TYPE_ATMEGA_MCU,
>          .parent         =3D TYPE_SYS_BUS_DEVICE,
> diff --git a/hw/avr/atmega.h b/hw/avr/atmega.h
> index a99ee15c7e..37d36b9b69 100644
> --- a/hw/avr/atmega.h
> +++ b/hw/avr/atmega.h
> @@ -22,6 +22,8 @@
>  #define TYPE_ATMEGA328_MCU  "ATmega328"
>  #define TYPE_ATMEGA1280_MCU "ATmega1280"
>  #define TYPE_ATMEGA2560_MCU "ATmega2560"
> +#define TYPE_ATMEGA16U4_MCU "ATmega16U4"
> +#define TYPE_ATMEGA32U4_MCU "ATmega32U4"
>
>  typedef struct AtmegaMcuState AtmegaMcuState;
>  DECLARE_INSTANCE_CHECKER(AtmegaMcuState, ATMEGA_MCU,
> --
> 2.38.4
>


--=20
Best Regards,
Michael Rolnik

--0000000000009793f405fba32480
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span class=3D"gmail-il">Reviewed</span>-<span class=3D"gm=
ail-il">by</span>: Michael Rolnik &lt;<a href=3D"mailto:mrolnik@gmail.com">=
mrolnik@gmail.com</a>&gt;</div><br><div class=3D"gmail_quote"><div dir=3D"l=
tr" class=3D"gmail_attr">On Sun, May 14, 2023 at 12:54=E2=80=AFAM ~rmsyn &l=
t;<a href=3D"mailto:rmsyn@git.sr.ht" target=3D"_blank">rmsyn@git.sr.ht</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From:=
 rmsyn &lt;<a href=3D"mailto:rmsynchls@gmail.com" target=3D"_blank">rmsynch=
ls@gmail.com</a>&gt;<br>
<br>
Adds support for ATmega16u4 and ATmega32u4 MCU definitions.<br>
<br>
Defines interrupts, memory layout, and machine types for generic<br>
ATmega16u4 and ATmega32u4 MCUs.<br>
<br>
Signed-off-by: rmsyn &lt;<a href=3D"mailto:rmsynchls@gmail.com" target=3D"_=
blank">rmsynchls@gmail.com</a>&gt;<br>
---<br>
=C2=A0hw/avr/arduino.c |=C2=A0 36 ++++++++++++++<br>
=C2=A0hw/avr/atmega.c=C2=A0 | 122 +++++++++++++++++++++++++++++++++++++++++=
++++++<br>
=C2=A0hw/avr/atmega.h=C2=A0 |=C2=A0 =C2=A02 +<br>
=C2=A03 files changed, 160 insertions(+)<br>
<br>
diff --git a/hw/avr/arduino.c b/hw/avr/arduino.c<br>
index 48ef478346..be04e412e6 100644<br>
--- a/hw/avr/arduino.c<br>
+++ b/hw/avr/arduino.c<br>
@@ -129,6 +129,34 @@ static void arduino_mega2560_class_init(ObjectClass *o=
c, void *data)<br>
=C2=A0 =C2=A0 =C2=A0amc-&gt;xtal_hz=C2=A0 =C2=A0 =3D 16 * 1000 * 1000; /* C=
STCE16M0V53-R0 */<br>
=C2=A0};<br>
<br>
+static void arduino_mega16u4_class_init(ObjectClass *oc, void *data)<br>
+{<br>
+=C2=A0 =C2=A0 MachineClass *mc =3D MACHINE_CLASS(oc);<br>
+=C2=A0 =C2=A0 ArduinoMachineClass *amc =3D ARDUINO_MACHINE_CLASS(oc);<br>
+<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* <a href=3D"https://ww1.microchip.com/downloads/en/de=
vicedoc/atmel-7766-8-bit-avr-atmega16u4-32u4_datasheet.pdf" rel=3D"noreferr=
er" target=3D"_blank">https://ww1.microchip.com/downloads/en/devicedoc/atme=
l-7766-8-bit-avr-atmega16u4-32u4_datasheet.pdf</a><br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 mc-&gt;desc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;Arduino Meg=
a 16u4 (ATmega16u4)&quot;;<br>
+=C2=A0 =C2=A0 mc-&gt;alias=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;mega16u4&qu=
ot;;<br>
+=C2=A0 =C2=A0 amc-&gt;mcu_type=C2=A0 =C2=A0=3D TYPE_ATMEGA16U4_MCU;<br>
+=C2=A0 =C2=A0 amc-&gt;xtal_hz=C2=A0 =C2=A0 =3D 16 * 1000 * 1000; /* CSTCE1=
6M0V53-R0 */<br>
+};<br>
+<br>
+static void arduino_mega32u4_class_init(ObjectClass *oc, void *data)<br>
+{<br>
+=C2=A0 =C2=A0 MachineClass *mc =3D MACHINE_CLASS(oc);<br>
+=C2=A0 =C2=A0 ArduinoMachineClass *amc =3D ARDUINO_MACHINE_CLASS(oc);<br>
+<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* <a href=3D"https://ww1.microchip.com/downloads/en/de=
vicedoc/atmel-7766-8-bit-avr-atmega16u4-32u4_datasheet.pdf" rel=3D"noreferr=
er" target=3D"_blank">https://ww1.microchip.com/downloads/en/devicedoc/atme=
l-7766-8-bit-avr-atmega16u4-32u4_datasheet.pdf</a><br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 mc-&gt;desc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;Arduino Meg=
a 32u4 (ATmega32u4)&quot;;<br>
+=C2=A0 =C2=A0 mc-&gt;alias=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;mega32u4&qu=
ot;;<br>
+=C2=A0 =C2=A0 amc-&gt;mcu_type=C2=A0 =C2=A0=3D TYPE_ATMEGA32U4_MCU;<br>
+=C2=A0 =C2=A0 amc-&gt;xtal_hz=C2=A0 =C2=A0 =3D 16 * 1000 * 1000; /* CSTCE1=
6M0V53-R0 */<br>
+};<br>
+<br>
=C2=A0static const TypeInfo arduino_machine_types[] =3D {<br>
=C2=A0 =C2=A0 =C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=3D MACHINE_TYPE_NAME(&quot;arduino-duemilanove&quot;),<br>
@@ -146,6 +174,14 @@ static const TypeInfo arduino_machine_types[] =3D {<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=3D MACHINE_TYPE_NAME(&quot;arduino-mega-2560-v3&quot;),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.parent=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TY=
PE_ARDUINO_MACHINE,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.class_init=C2=A0 =C2=A0 =3D arduino_mega=
2560_class_init,<br>
+=C2=A0 =C2=A0 }, {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D MA=
CHINE_TYPE_NAME(&quot;arduino-mega-16u4&quot;),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .parent=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_AR=
DUINO_MACHINE,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .class_init=C2=A0 =C2=A0 =3D arduino_mega16u4_=
class_init,<br>
+=C2=A0 =C2=A0 }, {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D MA=
CHINE_TYPE_NAME(&quot;arduino-mega-32u4&quot;),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .parent=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_AR=
DUINO_MACHINE,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .class_init=C2=A0 =C2=A0 =3D arduino_mega32u4_=
class_init,<br>
=C2=A0 =C2=A0 =C2=A0}, {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0=3D TYPE_ARDUINO_MACHINE,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.parent=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D TYPE_MACHINE,<br>
diff --git a/hw/avr/atmega.c b/hw/avr/atmega.c<br>
index a34803e642..292ad9a447 100644<br>
--- a/hw/avr/atmega.c<br>
+++ b/hw/avr/atmega.c<br>
@@ -27,6 +27,17 @@ enum AtmegaPeripheral {<br>
=C2=A0 =C2=A0 =C2=A0GPIOG, GPIOH, GPIOI, GPIOJ, GPIOK, GPIOL,<br>
=C2=A0 =C2=A0 =C2=A0USART0, USART1, USART2, USART3,<br>
=C2=A0 =C2=A0 =C2=A0TIMER0, TIMER1, TIMER2, TIMER3, TIMER4, TIMER5,<br>
+=C2=A0 =C2=A0 RESET,<br>
+=C2=A0 =C2=A0 INT0, INT1, INT2, INT3, INT4, INT5, INT6,<br>
+=C2=A0 =C2=A0 PCINT0,<br>
+=C2=A0 =C2=A0 USB_GEN, USB_EP,<br>
+=C2=A0 =C2=A0 WDT,<br>
+=C2=A0 =C2=A0 SPI,<br>
+=C2=A0 =C2=A0 ANALOG_COMP,<br>
+=C2=A0 =C2=A0 ADC,<br>
+=C2=A0 =C2=A0 EE_READY,<br>
+=C2=A0 =C2=A0 TWI,<br>
+=C2=A0 =C2=A0 SPM_READY,<br>
=C2=A0 =C2=A0 =C2=A0PERIFMAX<br>
=C2=A0};<br>
<br>
@@ -98,6 +109,30 @@ static const peripheral_cfg dev168_328[PERIFMAX] =3D {<=
br>
=C2=A0 =C2=A0 =C2=A0[GPIOC]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D {=C2=A0 0x=
26 },<br>
=C2=A0 =C2=A0 =C2=A0[GPIOB]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D {=C2=A0 0x=
23 },<br>
=C2=A0 =C2=A0 =C2=A0[GPIOA]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D {=C2=A0 0x=
20 },<br>
+}, dev16u4_32u4[PERIFMAX] =3D {<br>
+=C2=A0 =C2=A0 [POWER1]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D {=C2=A0 0x65 },<br>
+=C2=A0 =C2=A0 [POWER0]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D {=C2=A0 0x64 },<br>
+=C2=A0 =C2=A0 [TIMER4]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D {=C2=A0 0x4c, POWER1=
, 4, 0x72, 0x39, true }, <br>
+=C2=A0 =C2=A0 [SPM_READY]=C2=A0 =C2=A0 =C2=A0=3D {=C2=A0 0x4a },<br>
+=C2=A0 =C2=A0 [TWI]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D {=C2=A0 0x=
48 },<br>
+=C2=A0 =C2=A0 [TIMER3]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D {=C2=A0 0x3e, POWER1=
, 3, 0x71, 0x38, true },<br>
+=C2=A0 =C2=A0 [EE_READY]=C2=A0 =C2=A0 =C2=A0 =3D {=C2=A0 0x3c },<br>
+=C2=A0 =C2=A0 [ADC]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D {=C2=A0 0x=
3a },<br>
+=C2=A0 =C2=A0 [ANALOG_COMP]=C2=A0 =C2=A0=3D {=C2=A0 0x38 },<br>
+=C2=A0 =C2=A0 [USART1]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D {=C2=A0 0x32, POWER1=
, 0 },<br>
+=C2=A0 =C2=A0 [SPI]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D {=C2=A0 0x=
30 },<br>
+=C2=A0 =C2=A0 [TIMER0]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D {=C2=A0 0x2a, POWER0=
, 5, 0x6e, 0x35, true },<br>
+=C2=A0 =C2=A0 [TIMER1]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D {=C2=A0 0x20, POWER0=
, 3, 0x6f, 0x36, true },<br>
+=C2=A0 =C2=A0 [WDT]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D {=C2=A0 0x=
18 },<br>
+=C2=A0 =C2=A0 [USB_GEN]=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D {=C2=A0 0x14 },<br>
+=C2=A0 =C2=A0 [USB_EP]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D {=C2=A0 0x16 },<br>
+=C2=A0 =C2=A0 [PCINT0]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D {=C2=A0 0x12 },<br>
+=C2=A0 =C2=A0 [INT6]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D {=C2=A0 0x0e },=
<br>
+=C2=A0 =C2=A0 [INT3]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D {=C2=A0 0x08 },=
<br>
+=C2=A0 =C2=A0 [INT2]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D {=C2=A0 0x06 },=
<br>
+=C2=A0 =C2=A0 [INT1]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D {=C2=A0 0x04 },=
<br>
+=C2=A0 =C2=A0 [INT0]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D {=C2=A0 0x02 },=
<br>
+=C2=A0 =C2=A0 [RESET]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D {=C2=A0 0x00 },=
<br>
=C2=A0};<br>
<br>
=C2=A0enum AtmegaIrq {<br>
@@ -117,6 +152,17 @@ enum AtmegaIrq {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TIMER4_COMPC_IRQ, TIMER4_OVF_IRQ,<br>
=C2=A0 =C2=A0 =C2=A0TIMER5_CAPT_IRQ, TIMER5_COMPA_IRQ, TIMER5_COMPB_IRQ,<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TIMER5_COMPC_IRQ, TIMER5_OVF_IRQ,<br>
+=C2=A0 =C2=A0 RESET_IRQ,<br>
+=C2=A0 =C2=A0 INT0_IRQ, INT1_IRQ, INT2_IRQ, INT3_IRQ, INT4_IRQ, INT5_IRQ, =
INT6_IRQ,<br>
+=C2=A0 =C2=A0 PCINT0_IRQ,<br>
+=C2=A0 =C2=A0 USB_GEN_IRQ, USB_EP_IRQ,<br>
+=C2=A0 =C2=A0 WDT_IRQ,<br>
+=C2=A0 =C2=A0 SPI_IRQ,<br>
+=C2=A0 =C2=A0 ANALOG_COMP_IRQ,<br>
+=C2=A0 =C2=A0 ADC_IRQ,<br>
+=C2=A0 =C2=A0 EE_READY_IRQ,<br>
+=C2=A0 =C2=A0 TWI_IRQ,<br>
+=C2=A0 =C2=A0 SPM_READY_IRQ,<br>
=C2=A0 =C2=A0 =C2=A0IRQ_COUNT<br>
=C2=A0};<br>
<br>
@@ -184,6 +230,44 @@ static const uint8_t irq168_328[IRQ_COUNT] =3D {<br>
=C2=A0 =C2=A0 =C2=A0[USART3_RXC_IRQ]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D 55,<br>
=C2=A0 =C2=A0 =C2=A0[USART3_DRE_IRQ]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D 56,<br>
=C2=A0 =C2=A0 =C2=A0[USART3_TXC_IRQ]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D 57,<br>
+}, irq16u4_32u4[IRQ_COUNT] =3D {<br>
+=C2=A0 =C2=A0 [RESET_IRQ]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D=C2=A0 1,<br>
+=C2=A0 =C2=A0 [INT0_IRQ]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=3D=C2=A0 2,<br>
+=C2=A0 =C2=A0 [INT1_IRQ]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=3D=C2=A0 3,<br>
+=C2=A0 =C2=A0 [INT2_IRQ]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=3D=C2=A0 4,<br>
+=C2=A0 =C2=A0 [INT3_IRQ]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=3D=C2=A0 5,<br>
+=C2=A0 =C2=A0 [INT6_IRQ]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=3D=C2=A0 8,<br>
+=C2=A0 =C2=A0 [PCINT0_IRQ]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D 10=
,<br>
+=C2=A0 =C2=A0 [USB_GEN_IRQ]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 11=
,<br>
+=C2=A0 =C2=A0 [USB_EP_IRQ]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D 12=
,<br>
+=C2=A0 =C2=A0 [WDT_IRQ]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0=3D 13,<br>
+=C2=A0 =C2=A0 [TIMER1_CAPT_IRQ]=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 17,<br>
+=C2=A0 =C2=A0 [TIMER1_COMPA_IRQ]=C2=A0 =C2=A0 =C2=A0 =3D 18,<br>
+=C2=A0 =C2=A0 [TIMER1_COMPB_IRQ]=C2=A0 =C2=A0 =C2=A0 =3D 19,<br>
+=C2=A0 =C2=A0 [TIMER1_COMPC_IRQ]=C2=A0 =C2=A0 =C2=A0 =3D 20,<br>
+=C2=A0 =C2=A0 [TIMER1_OVF_IRQ]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D 21,<br>
+=C2=A0 =C2=A0 [TIMER0_COMPA_IRQ]=C2=A0 =C2=A0 =C2=A0 =3D 22,<br>
+=C2=A0 =C2=A0 [TIMER0_COMPB_IRQ]=C2=A0 =C2=A0 =C2=A0 =3D 23,<br>
+=C2=A0 =C2=A0 [TIMER0_OVF_IRQ]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D 24,<br>
+=C2=A0 =C2=A0 [SPI_IRQ]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0=3D 25,<br>
+=C2=A0 =C2=A0 [USART0_RXC_IRQ]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D 26,<br>
+=C2=A0 =C2=A0 [USART0_DRE_IRQ]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D 27,<br>
+=C2=A0 =C2=A0 [USART0_TXC_IRQ]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D 28,<br>
+=C2=A0 =C2=A0 [ANALOG_COMP]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 29=
,<br>
+=C2=A0 =C2=A0 [ADC_IRQ]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0=3D 30,<br>
+=C2=A0 =C2=A0 [EE_READY_IRQ]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D 31,<br>
+=C2=A0 =C2=A0 [TIMER3_CAPT_IRQ]=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 32,<br>
+=C2=A0 =C2=A0 [TIMER3_COMPA_IRQ]=C2=A0 =C2=A0 =C2=A0 =3D 33,<br>
+=C2=A0 =C2=A0 [TIMER3_COMPB_IRQ]=C2=A0 =C2=A0 =C2=A0 =3D 34,<br>
+=C2=A0 =C2=A0 [TIMER3_COMPC_IRQ]=C2=A0 =C2=A0 =C2=A0 =3D 35,<br>
+=C2=A0 =C2=A0 [TIMER3_OVF_IRQ]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D 36,<br>
+=C2=A0 =C2=A0 [TWI_IRQ]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0=3D 37,<br>
+=C2=A0 =C2=A0 [SPM_READY_IRQ]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 38,<br>
+=C2=A0 =C2=A0 [TIMER4_COMPA_IRQ]=C2=A0 =C2=A0 =C2=A0 =3D 39,<br>
+=C2=A0 =C2=A0 [TIMER4_COMPB_IRQ]=C2=A0 =C2=A0 =C2=A0 =3D 40,<br>
+=C2=A0 =C2=A0 [TIMER4_COMPC_IRQ]=C2=A0 =C2=A0 =C2=A0 =3D 41,<br>
+=C2=A0 =C2=A0 [TIMER4_OVF_IRQ]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D 42,<br>
+=C2=A0 =C2=A0 /*[TIMER4_FPF_IRQ]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D 43,*/<br>
=C2=A0};<br>
<br>
=C2=A0static void connect_peripheral_irq(const AtmegaMcuClass *k,<br>
@@ -427,6 +511,36 @@ static void atmega2560_class_init(ObjectClass *oc, voi=
d *data)<br>
=C2=A0 =C2=A0 =C2=A0amc-&gt;dev =3D dev1280_2560;<br>
=C2=A0};<br>
<br>
+static void atmega16u4_class_init(ObjectClass *oc, void *data)<br>
+{<br>
+=C2=A0 =C2=A0 AtmegaMcuClass *amc =3D ATMEGA_MCU_CLASS(oc);<br>
+<br>
+=C2=A0 =C2=A0 amc-&gt;cpu_type =3D AVR_CPU_TYPE_NAME(&quot;avr5&quot;);<br=
>
+=C2=A0 =C2=A0 amc-&gt;flash_size =3D 16 * KiB;<br>
+=C2=A0 =C2=A0 amc-&gt;eeprom_size =3D 512;<br>
+=C2=A0 =C2=A0 amc-&gt;sram_size =3D KiB + 256;<br>
+=C2=A0 =C2=A0 amc-&gt;io_size =3D 64;<br>
+=C2=A0 =C2=A0 amc-&gt;gpio_count =3D 32;<br>
+=C2=A0 =C2=A0 amc-&gt;adc_count =3D 12;<br>
+=C2=A0 =C2=A0 amc-&gt;irq =3D irq16u4_32u4;<br>
+=C2=A0 =C2=A0 amc-&gt;dev =3D dev16u4_32u4;<br>
+};<br>
+<br>
+static void atmega32u4_class_init(ObjectClass *oc, void *data)<br>
+{<br>
+=C2=A0 =C2=A0 AtmegaMcuClass *amc =3D ATMEGA_MCU_CLASS(oc);<br>
+<br>
+=C2=A0 =C2=A0 amc-&gt;cpu_type =3D AVR_CPU_TYPE_NAME(&quot;avr5&quot;);<br=
>
+=C2=A0 =C2=A0 amc-&gt;flash_size =3D 32 * KiB;<br>
+=C2=A0 =C2=A0 amc-&gt;eeprom_size =3D KiB;<br>
+=C2=A0 =C2=A0 amc-&gt;sram_size =3D 2 * KiB + 512;<br>
+=C2=A0 =C2=A0 amc-&gt;io_size =3D 64;<br>
+=C2=A0 =C2=A0 amc-&gt;gpio_count =3D 32;<br>
+=C2=A0 =C2=A0 amc-&gt;adc_count =3D 12;<br>
+=C2=A0 =C2=A0 amc-&gt;irq =3D irq16u4_32u4;<br>
+=C2=A0 =C2=A0 amc-&gt;dev =3D dev16u4_32u4;<br>
+};<br>
+<br>
=C2=A0static const TypeInfo atmega_mcu_types[] =3D {<br>
=C2=A0 =C2=A0 =C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0=3D TYPE_ATMEGA168_MCU,<br>
@@ -444,6 +558,14 @@ static const TypeInfo atmega_mcu_types[] =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0=3D TYPE_ATMEGA2560_MCU,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.parent=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D TYPE_ATMEGA_MCU,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.class_init=C2=A0 =C2=A0 =C2=A0=3D atmega=
2560_class_init,<br>
+=C2=A0 =C2=A0 }, {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D TYPE_ATMEGA16U4_MCU,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .parent=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D T=
YPE_ATMEGA_MCU,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .class_init=C2=A0 =C2=A0 =C2=A0=3D atmega16u4_=
class_init,<br>
+=C2=A0 =C2=A0 }, {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D TYPE_ATMEGA32U4_MCU,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .parent=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D T=
YPE_ATMEGA_MCU,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .class_init=C2=A0 =C2=A0 =C2=A0=3D atmega32u4_=
class_init,<br>
=C2=A0 =C2=A0 =C2=A0}, {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0=3D TYPE_ATMEGA_MCU,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.parent=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D TYPE_SYS_BUS_DEVICE,<br>
diff --git a/hw/avr/atmega.h b/hw/avr/atmega.h<br>
index a99ee15c7e..37d36b9b69 100644<br>
--- a/hw/avr/atmega.h<br>
+++ b/hw/avr/atmega.h<br>
@@ -22,6 +22,8 @@<br>
=C2=A0#define TYPE_ATMEGA328_MCU=C2=A0 &quot;ATmega328&quot;<br>
=C2=A0#define TYPE_ATMEGA1280_MCU &quot;ATmega1280&quot;<br>
=C2=A0#define TYPE_ATMEGA2560_MCU &quot;ATmega2560&quot;<br>
+#define TYPE_ATMEGA16U4_MCU &quot;ATmega16U4&quot;<br>
+#define TYPE_ATMEGA32U4_MCU &quot;ATmega32U4&quot;<br>
<br>
=C2=A0typedef struct AtmegaMcuState AtmegaMcuState;<br>
=C2=A0DECLARE_INSTANCE_CHECKER(AtmegaMcuState, ATMEGA_MCU,<br>
-- <br>
2.38.4<br>
</blockquote></div><br clear=3D"all"><div><br></div><span>-- </span><br><di=
v dir=3D"ltr">Best Regards,<br>Michael Rolnik</div>

--0000000000009793f405fba32480--

