Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB183102B47
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Nov 2019 18:58:32 +0100 (CET)
Received: from localhost ([::1]:48762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iX7ln-0006Ad-Ob
	for lists+qemu-devel@lfdr.de; Tue, 19 Nov 2019 12:58:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54312)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iX7kj-0005ef-Ba
 for qemu-devel@nongnu.org; Tue, 19 Nov 2019 12:57:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iX7kg-0006qO-NU
 for qemu-devel@nongnu.org; Tue, 19 Nov 2019 12:57:24 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:60571
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iX7kg-0006q9-J9
 for qemu-devel@nongnu.org; Tue, 19 Nov 2019 12:57:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574186241;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=en3Lm7igYDO8KQtJ9xK8FSriql8b9idQhOTE6syD70Y=;
 b=ZdW6AxBrwl4ODzglFQB819zM/3wURX1dUnYfLfCQ18OsNzcAUke9sJSlm8i1o41ZrgLprI
 YfjFWJexpLMCkRCgmonjYgtftOw+BW/8GhkzApcklldiEvpW8EQ/tOWGzotE/UEqglvq0g
 yYbaqIE1BWE3eAjI9+Sd/uh1hWop1t8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-159-xVQ58Q3XNFWOAjWwCMD-ww-1; Tue, 19 Nov 2019 12:57:19 -0500
Received: by mail-wm1-f69.google.com with SMTP id y133so2847392wmd.8
 for <qemu-devel@nongnu.org>; Tue, 19 Nov 2019 09:57:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gOmh8+HDZkLPTm1M+wWd2bclxfW2aiET6OmnJR/6X58=;
 b=b+qY2M5+BwMntTf6ZE8RVSfVQLzKHJa7+wI/dWME+YtZ6SxTKbiH0XOnIY2NUzd4bc
 hO13RHyMD3IW9mh1LpOTfMKDYGunzCNA78QNE1hxBK7zFYTnPX1khDVA9UC92W1y+I5X
 z0+JG+fXWkDv/9ZAzz6Hmcia/2m5UH+CymhnvVqlRbQTrkZ65bMC9eDulxkk64Du9PIX
 jqi9qV/dNb3nhZjKTAJZFdbJ+VaubmqvN/1M3osqfv8pr64YSeDv+dqJf8RKeuVVPgjW
 E9MuNiEoheTnCno4phaQt6vyQoFhHyPodEYToe58a/Y75w6bMpN1pCZQl017Yv7/qJzQ
 T5iw==
X-Gm-Message-State: APjAAAUrNlzBhLLjfuRwgYcf+xjUzTy4RUg0gDpMjMomghVXzoZYdxlW
 NfHru0DrTn1qq0vdXEfUMUbW1x5QTghF0rgFGF1JoRtkZmoidKn+n7CpXHjpSWdcXMdrDQ5fV5m
 orK1KQRlQuCm395M=
X-Received: by 2002:a1c:a548:: with SMTP id o69mr7086286wme.31.1574186238368; 
 Tue, 19 Nov 2019 09:57:18 -0800 (PST)
X-Google-Smtp-Source: APXvYqxtpXcH3Y15nrcFF72f6CLs406XX1s+91X+dk28L0HyEHAEQ8t90+Iu0PNfg6Y03Rz28Zb9hQ==
X-Received: by 2002:a1c:a548:: with SMTP id o69mr7086266wme.31.1574186238013; 
 Tue, 19 Nov 2019 09:57:18 -0800 (PST)
Received: from [192.168.1.35] (131.red-88-21-102.staticip.rima-tde.net.
 [88.21.102.131])
 by smtp.gmail.com with ESMTPSA id 62sm31279607wre.38.2019.11.19.09.57.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Nov 2019 09:57:17 -0800 (PST)
Subject: Re: [PATCH] misc/pca9552: Add qom set and get
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>, Peter Maydell <peter.maydell@linaro.org>
References: <20191118061757.52550-1-joel@jms.id.au>
 <42f378d5-e7ea-11ce-11d5-9589fe7194d2@kaod.org>
 <9f810374-97d4-8162-c92d-a1513c1a23a0@redhat.com>
 <817b83f1-f534-9886-2054-4de6cd04a899@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <c7dea2b9-376f-c7cf-fe2e-792e3d8a17c2@redhat.com>
Date: Tue, 19 Nov 2019 18:57:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <817b83f1-f534-9886-2054-4de6cd04a899@kaod.org>
Content-Language: en-US
X-MC-Unique: xVQ58Q3XNFWOAjWwCMD-ww-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Rashmica Gupta <rashmica.g@gmail.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/19/19 5:27 PM, C=C3=A9dric Le Goater wrote:
> On 18/11/2019 18:48, Philippe Mathieu-Daud=C3=A9 wrote:
>> Odd... I only received C=C3=A9dric answer, not Joel patch.
>>
>> On 11/18/19 11:00 AM, C=C3=A9dric Le Goater wrote:
>>> On 18/11/2019 07:17, Joel Stanley wrote:
>>>> Following the pattern of the work recently done with the ASPEED GPIO
>>>> model, this adds support for inspecting and modifying the PCA9552 LEDs
>>>> from the monitor.
>>>>
>>>>  =C2=A0 (qemu) qom-set=C2=A0 /machine/unattached/device[17] led0 on
>>>>  =C2=A0 (qemu) qom-get=C2=A0 /machine/unattached/device[17] led0
>>>>  =C2=A0 "on"
>>>>
>>>>  =C2=A0 (qemu) qom-set=C2=A0 /machine/unattached/device[17] led0 off
>>>>  =C2=A0 (qemu) qom-get=C2=A0 /machine/unattached/device[17] led0
>>>>  =C2=A0 "off"
>>>>
>>>>  =C2=A0 (qemu) qom-set=C2=A0 /machine/unattached/device[17] led0 pwm0
>>>>  =C2=A0 (qemu) qom-get=C2=A0 /machine/unattached/device[17] led0
>>>>  =C2=A0 "pwm0"
>>>>
>>>>  =C2=A0 (qemu) qom-set=C2=A0 /machine/unattached/device[17] led0 pwm1
>>>>  =C2=A0 (qemu) qom-get=C2=A0 /machine/unattached/device[17] led0
>>>>  =C2=A0 "pwm1"
>>>
>>> It would be nice to revive the QOM get patchset from David.
>>>
>>>  =C2=A0=C2=A0=C2=A0=C2=A0http://patchwork.ozlabs.org/patch/666458/
>>>
>>> Did we reach some consensus ?
>>>
>>>> Signed-off-by: Joel Stanley <joel@jms.id.au>
>>>
>>> Some comments below.
>>>
>>>> ---
>>>> The qom device in mainline qemu is a different path. Using the monitor
>>>> examine `info qom-tree /machine/unattached/` to discover it.
>>>>
>>>> This can be tested with a Witherspoon image.
>>>>
>>>> $ wget https://openpower.xyz/job/openbmc-build/distro=3Dubuntu,label=
=3Dbuilder,target=3Dwitherspoon/lastSuccessfulBuild/artifact/deploy/images/=
witherspoon/obmc-phosphor-image-witherspoon.ubi.mtd
>>>>
>>>> $ qemu-system-arm -M witherspoon-bmc -serial pty -monitor pty -nograph=
ic \
>>>>  =C2=A0 -drive file=3Dobmc-phosphor-image-witherspoon.ubi.mtd,format=
=3Draw,if=3Dmtd
>>>> char device redirected to /dev/pts/5 (label compat_monitor0)
>>>> char device redirected to /dev/pts/10 (label serial0)
>>>>
>>>> $ screen /dev/pts/5
>>>> QEMU 4.1.91 monitor - type 'help' for more information
>>>> (qemu) qom-get=C2=A0 /machine/unattached/device[17] led0
>>>> "off"
>>>>
>>>> $ screen /dev/pts/19
>>>> root@witherspoon:~# cd /sys/class/gpio/
>>>> root@witherspoon:/sys/class/gpio# echo 248 > export
>>>> root@witherspoon:/sys/class/gpio# cat gpio248/value
>>>> 0
>>>>
>>>> (qemu) qom-set=C2=A0 /machine/unattached/device[17] led0 on
>>>>
>>>> root@witherspoon:/sys/class/gpio# echo out > gpio248/direction
>>>> root@witherspoon:/sys/class/gpio# cat gpio248/value
>>>> 1
>>>>
>>>> (qemu) qom-get=C2=A0 /machine/unattached/device[17] led0
>>>> "on"
>>>>
>>>> (qemu) qom-set=C2=A0 /machine/unattached/device[17] led0 off
>>>> (qemu) qom-get=C2=A0 /machine/unattached/device[17] led0
>>>> "off"
>>>>
>>>> root@witherspoon:/sys/class/gpio# cat gpio248/value
>>>> 0
>>
>> I am assuming this is 5.0 material.
>>
>> This is a good starting point, and is useful.
>>
>> However this would be useful for other boards/devices too.
>>
>> What about defining a InterfaceInfo[] for external GPIOs?
>=20
> The code below is very specific to pca9552.

Yes, sorry if I was unclear, I don't want to delay this series, I was=20
just thinking about other uses.

> What kind of interface do you have in mind more precisely ?
> which handlers ?

Here we expose the devices GPIOs (as output) so they can be modified via=20
QMP.

A QMP client could subscribe to GPIOs input events (or IRQ triggered).

(The PCA9552 can also use the 16 lines as input, but Joel added a "input=20
line behaviour not modeled" comment below).

Maybe the PCA9552 isn't the best example for my generic use case,=20
because it is already "out of the soc/board" being on a bus.

I'm more concerned about a generic QMP way to access GPIOs from a SoC=20
exposed to a physical user of a board.

>> Shouldn't we use the qemu_irq type for that then?
>>
>>>>
>>>> Signed-off-by: Joel Stanley <joel@jms.id.au>
>>>> ---
>>>>  =C2=A0 hw/misc/pca9552.c | 91 +++++++++++++++++++++++++++++++++++++++=
++++++++
>>>>  =C2=A0 1 file changed, 91 insertions(+)
>>>>
>>>> diff --git a/hw/misc/pca9552.c b/hw/misc/pca9552.c
>>>> index 73be28d9369c..0362aac8c862 100644
>>>> --- a/hw/misc/pca9552.c
>>>> +++ b/hw/misc/pca9552.c
>>>> @@ -15,12 +15,16 @@
>>>>  =C2=A0 #include "hw/misc/pca9552.h"
>>>>  =C2=A0 #include "hw/misc/pca9552_regs.h"
>>>>  =C2=A0 #include "migration/vmstate.h"
>>>> +#include "qapi/error.h"
>>>> +#include "qapi/visitor.h"
>>>>  =C2=A0 =C2=A0 #define PCA9552_LED_ON=C2=A0=C2=A0 0x0
>>>>  =C2=A0 #define PCA9552_LED_OFF=C2=A0 0x1
>>>>  =C2=A0 #define PCA9552_LED_PWM0 0x2
>>>>  =C2=A0 #define PCA9552_LED_PWM1 0x3
>>>>  =C2=A0 +static const char *led_state[] =3D {"on", "off", "pwm0", "pwm=
1"};
>>
>> BTW "pwm0/pwm1" as "state" is confuse, but I understand this is how the =
PCA9552 datasheet describes it.
>>
>>>> +
>>>>  =C2=A0 static uint8_t pca9552_pin_get_config(PCA9552State *s, int pin=
)
>>>>  =C2=A0 {
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint8_t reg=C2=A0=C2=A0 =3D PCA9552_LS=
0 + (pin / 4);
>>>> @@ -169,6 +173,84 @@ static int pca9552_event(I2CSlave *i2c, enum i2c_=
event event)
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>>>  =C2=A0 }
>>>>  =C2=A0 +static void pca9552_get_led(Object *obj, Visitor *v, const ch=
ar *name,
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 void *opaque, Error **errp)
>>>> +{
>>>> +=C2=A0=C2=A0=C2=A0 PCA9552State *s =3D PCA9552(obj);
>>>> +=C2=A0=C2=A0=C2=A0 int led, rc, reg;
>>>> +=C2=A0=C2=A0=C2=A0 char *str;
>>>> +=C2=A0=C2=A0=C2=A0 uint8_t state;
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 rc =3D sscanf(name, "led%2d", &led);
>>>> +=C2=A0=C2=A0=C2=A0 if (rc !=3D 1) {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 error_setg(errp, "%s: erro=
r reading %s", __func__, name);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
>>>> +=C2=A0=C2=A0=C2=A0 }
>>>> +=C2=A0=C2=A0=C2=A0 if (led < 0 || led > s->nr_leds) {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 error_setg(errp, "%s inval=
id led %s", __func__, name);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
>>>> +=C2=A0=C2=A0=C2=A0 }
>>>> +=C2=A0=C2=A0=C2=A0 /*
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * Get the LSx register as the qom interface =
should expose the device
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * state, not the modeled 'input line' behavi=
our which would come from
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * reading the INPUTx reg
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 */
>>>> +=C2=A0=C2=A0=C2=A0 reg =3D PCA9552_LS0 + led / 4;
>>>> +=C2=A0=C2=A0=C2=A0 state =3D (pca9552_read(s, reg) >> (led % 8)) & 0x=
3;
>>>
>>> Could we add accessors to extract the register fields and to clarify
>>> the layout ?
>>>
>>>> +=C2=A0=C2=A0=C2=A0 str =3D g_strdup(led_state[state]);
>>>> +=C2=A0=C2=A0=C2=A0 visit_type_str(v, name, &str, errp);
>>>> +}
>>>> +
>>>> +/*
>>>> + * Return an LED selector register value based on an existing one, wi=
th
>>>> + * the appropriate 2-bit state value set for the given LED number (0-=
3).
>>>> + */
>>>> +static inline uint8_t pca955x_ledsel(uint8_t oldval, int led_num, int=
 state)
>>>> +{
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return (oldval & (~(0x3 <<=
 (led_num << 1)))) |
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 ((state & 0x3) << (led_num << 1));
>>>> +}
>>>> +
>>>> +static void pca9552_set_led(Object *obj, Visitor *v, const char *name=
,
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 void *opaque, Error **errp)
>>>> +{
>>>> +=C2=A0=C2=A0=C2=A0 PCA9552State *s =3D PCA9552(obj);
>>>> +=C2=A0=C2=A0=C2=A0 Error *local_err =3D NULL;
>>>> +=C2=A0=C2=A0=C2=A0 int led, rc, reg, val;
>>>> +=C2=A0=C2=A0=C2=A0 uint8_t state;
>>>> +=C2=A0=C2=A0=C2=A0 char *state_str;
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 visit_type_str(v, name, &state_str, &local_err);
>>>> +=C2=A0=C2=A0=C2=A0 if (local_err) {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 error_propagate(errp, loca=
l_err);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
>>>> +=C2=A0=C2=A0=C2=A0 }
>>>> +=C2=A0=C2=A0=C2=A0 rc =3D sscanf(name, "led%2d", &led);
>>>> +=C2=A0=C2=A0=C2=A0 if (rc !=3D 1) {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 error_setg(errp, "%s: erro=
r reading %s", __func__, name);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
>>>> +=C2=A0=C2=A0=C2=A0 }
>>>> +=C2=A0=C2=A0=C2=A0 if (led < 0 || led > s->nr_leds) {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 error_setg(errp, "%s inval=
id led %s", __func__, name);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
>>>> +=C2=A0=C2=A0=C2=A0 }
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 for (state =3D 0; state < ARRAY_SIZE(led_state); s=
tate++) {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!strcmp(state_str, led=
_state[state])) {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 br=
eak;
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>> +=C2=A0=C2=A0=C2=A0 }
>>>> +=C2=A0=C2=A0=C2=A0 if (state >=3D ARRAY_SIZE(led_state)) {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 error_setg(errp, "%s inval=
id led state %s", __func__, state_str);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
>>>> +=C2=A0=C2=A0=C2=A0 }
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 reg =3D PCA9552_LS0 + led / 4;
>>>> +=C2=A0=C2=A0=C2=A0 val =3D pca9552_read(s, reg);
>>>> +=C2=A0=C2=A0=C2=A0 val =3D pca955x_ledsel(val, led % 4, state);
>>>> +=C2=A0=C2=A0=C2=A0 pca9552_write(s, reg, val);
>>>> +}
>>>> +
>>>>  =C2=A0 static const VMStateDescription pca9552_vmstate =3D {
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .name =3D "PCA9552",
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .version_id =3D 0,
>>>> @@ -204,6 +286,7 @@ static void pca9552_reset(DeviceState *dev)
>>>>  =C2=A0 static void pca9552_initfn(Object *obj)
>>>>  =C2=A0 {
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PCA9552State *s =3D PCA9552(obj);
>>>> +=C2=A0=C2=A0=C2=A0 int led;
>>>>  =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* If support for the other PCA=
955X devices are implemented, these
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * constant values might be part =
of class structure describing the
>>>> @@ -211,6 +294,14 @@ static void pca9552_initfn(Object *obj)
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 s->max_reg =3D PCA9552_LS3;
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 s->nr_leds =3D 16;
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 for (led =3D 0; led < s->nr_leds; led++) {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 char *name;
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 name =3D g_strdup_printf("=
led%d", led);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 object_property_add(obj, n=
ame, "bool", pca9552_get_led, pca9552_set_led,
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 NULL, NULL, NULL);
>>>
>>> It misses a :
>>>
>>>  =C2=A0=C2=A0=C2=A0 g_free(name)
>>>
>>> C.
>>>
>>>> +=C2=A0=C2=A0=C2=A0 }
>>>>  =C2=A0 }
>>>>  =C2=A0 =C2=A0 static void pca9552_class_init(ObjectClass *klass, void=
 *data)
>>>>
>>>
>>>
>>
>=20


