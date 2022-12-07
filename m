Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7B1645EA2
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Dec 2022 17:22:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2xAE-0006vU-FV; Wed, 07 Dec 2022 11:20:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1p2xA5-0006qq-B0
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 11:20:48 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1p2x9y-0002Xw-UU
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 11:20:42 -0500
Received: by mail-ed1-x52f.google.com with SMTP id m19so25575703edj.8
 for <qemu-devel@nongnu.org>; Wed, 07 Dec 2022 08:20:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SmVPUVTmR8ajggCisk5trSL8BZKPoAeUXvcQM2Zrn0I=;
 b=k7fpxt3/NYEcW3csfeq+v0AzUI/vfjtXw062a1v/ixmris5W9ygjoIOODZVoI2y6Ci
 9OarFsbrELXYpcVHjNpx/5ex2r5a6RJsmBs0lQDXxLErP0Fd3YT9SgxhSUg/305aAyL8
 IzK8QQiAW4ZgKbBOYNGwoCAxbHXYpVswBLCwkbQdMMd6SEhg/5amjGxMZn4HT/7eLjhW
 AZ4N63z0xOlz0MXDfSpMCIwjLq0BSQp2yE/UWvc7uvrfAQzDhfOFHeFA11K0yl0KoMBs
 gD07Lm8LjQNbnJ3mfVIYblI5oaqY8cUE6L/ky3Ong//IacNh5rQVGgWkP/+1u+kSKhe6
 XP3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SmVPUVTmR8ajggCisk5trSL8BZKPoAeUXvcQM2Zrn0I=;
 b=Gf3Lri4bD7hL4pciOZG8JmdHY2wNGaGnFL7CATeDrn+/btsFic6povkEnu7sL75Gb3
 obUPySVQkTgzqgh/LujfeG5prZxt+iaq/19bgFXg1N85ndLq/41h+LOveUDIWZJPlqt7
 F46Jj9JO3uaG9LayMuxiPTvU+lVx6aLobtp8Xvh+gEQJPM2aKzlS2+iIjKa7poMuuVGn
 0NXr/lAFO0CwY0AJPc2w/gnoFWvaUvVC3iDQ6f0d6K3hBovRgzI8Ay60PozLkdrfoQZx
 UXykG0FiTCHDYYbt7QWOrblwpWGV7d/cMxpJJ0k/8a8E05shzehUUpgXb4/5R1XCA9U0
 p5gg==
X-Gm-Message-State: ANoB5pmFFqptND8BwCeKduBKdcGQUZTE+u8gWZcobVp6EMTjSNtbHmBc
 yTWQNYhvj3d8Ordhsql3jK3nYxtLKnc=
X-Google-Smtp-Source: AA0mqf58cJHxDBDgDK7f9tzQDN7pYdYdA41827JIGDK2Oo6ksUgpT4o6qXBt50daUX4vXriEQL8YLQ==
X-Received: by 2002:aa7:cb15:0:b0:458:e9c0:3e6f with SMTP id
 s21-20020aa7cb15000000b00458e9c03e6fmr83658953edt.61.1670430025945; 
 Wed, 07 Dec 2022 08:20:25 -0800 (PST)
Received: from [127.0.0.1] (dynamic-077-011-181-051.77.11.pool.telefonica.de.
 [77.11.181.51]) by smtp.gmail.com with ESMTPSA id
 u15-20020aa7d0cf000000b0045ce419ecffsm2390540edo.58.2022.12.07.08.20.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Dec 2022 08:20:25 -0800 (PST)
Date: Wed, 07 Dec 2022 16:20:17 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
CC: Michael S Tsirkin <mst@redhat.com>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_for-8=2E0=5D_hw/rtc/mc146818rtc=3A?=
 =?US-ASCII?Q?_Make_this_rtc_device_target_independent?=
In-Reply-To: <8f0b1154-5d40-f098-ef1d-cd2a50145529@ilande.co.uk>
References: <20221206200641.339116-1-thuth@redhat.com>
 <8f0b1154-5d40-f098-ef1d-cd2a50145529@ilande.co.uk>
Message-ID: <A57CC4A0-A141-4A4A-A49F-E5F0F7D4B52A@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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



Am 7=2E Dezember 2022 15:29:00 UTC schrieb Mark Cave-Ayland <mark=2Ecave-a=
yland@ilande=2Eco=2Euk>:
>On 06/12/2022 20:06, Thomas Huth wrote:
>
>> The only code that is really, really target dependent is the apic-relat=
ed
>> code in rtc_policy_slew_deliver_irq()=2E By moving this code into the h=
w/i386/
>> folder (renamed to rtc_apic_policy_slew_deliver_irq()) and passing this
>> function as parameter to mc146818_rtc_init(), we can make the RTC compl=
etely
>> target-independent=2E
>>=20
>> Signed-off-by: Thomas Huth <thuth@redhat=2Ecom>
>> ---
>>   include/hw/rtc/mc146818rtc=2Eh |  7 +++++--
>>   hw/alpha/dp264=2Ec             |  2 +-
>>   hw/hppa/machine=2Ec            |  2 +-
>>   hw/i386/microvm=2Ec            |  3 ++-
>>   hw/i386/pc=2Ec                 | 10 +++++++++-
>>   hw/mips/jazz=2Ec               |  2 +-
>>   hw/ppc/pnv=2Ec                 |  2 +-
>>   hw/rtc/mc146818rtc=2Ec         | 34 +++++++++++----------------------=
-
>>   hw/rtc/meson=2Ebuild           |  3 +--
>>   9 files changed, 32 insertions(+), 33 deletions(-)
>>=20
>> diff --git a/include/hw/rtc/mc146818rtc=2Eh b/include/hw/rtc/mc146818rt=
c=2Eh
>> index 1db0fcee92=2E=2Ec687953cc4 100644
>> --- a/include/hw/rtc/mc146818rtc=2Eh
>> +++ b/include/hw/rtc/mc146818rtc=2Eh
>> @@ -46,14 +46,17 @@ struct RTCState {
>>       Notifier clock_reset_notifier;
>>       LostTickPolicy lost_tick_policy;
>>       Notifier suspend_notifier;
>> +    bool (*policy_slew_deliver_irq)(RTCState *s);
>>       QLIST_ENTRY(RTCState) link;
>>   };
>>     #define RTC_ISA_IRQ 8
>>   -ISADevice *mc146818_rtc_init(ISABus *bus, int base_year,
>> -                             qemu_irq intercept_irq);
>> +ISADevice *mc146818_rtc_init(ISABus *bus, int base_year, qemu_irq inte=
rcept_irq,
>> +                             bool (*policy_slew_deliver_irq)(RTCState =
*s));
>>   void rtc_set_memory(ISADevice *dev, int addr, int val);
>>   int rtc_get_memory(ISADevice *dev, int addr);
>> +bool rtc_apic_policy_slew_deliver_irq(RTCState *s);
>> +void qmp_rtc_reset_reinjection(Error **errp);
>>     #endif /* HW_RTC_MC146818RTC_H */
>> diff --git a/hw/alpha/dp264=2Ec b/hw/alpha/dp264=2Ec
>> index c502c8c62a=2E=2E8723942b52 100644
>> --- a/hw/alpha/dp264=2Ec
>> +++ b/hw/alpha/dp264=2Ec
>> @@ -118,7 +118,7 @@ static void clipper_init(MachineState *machine)
>>       qdev_connect_gpio_out(i82378_dev, 0, isa_irq);
>>         /* Since we have an SRM-compatible PALcode, use the SRM epoch=
=2E  */
>> -    mc146818_rtc_init(isa_bus, 1900, rtc_irq);
>> +    mc146818_rtc_init(isa_bus, 1900, rtc_irq, NULL);
>>         /* VGA setup=2E  Don't bother loading the bios=2E  */
>>       pci_vga_init(pci_bus);
>> diff --git a/hw/hppa/machine=2Ec b/hw/hppa/machine=2Ec
>> index de1cc7ab71=2E=2E311031714a 100644
>> --- a/hw/hppa/machine=2Ec
>> +++ b/hw/hppa/machine=2Ec
>> @@ -232,7 +232,7 @@ static void machine_hppa_init(MachineState *machine=
)
>>       assert(isa_bus);
>>         /* Realtime clock, used by firmware for PDC_TOD call=2E */
>> -    mc146818_rtc_init(isa_bus, 2000, NULL);
>> +    mc146818_rtc_init(isa_bus, 2000, NULL, NULL);
>>         /* Serial ports: Lasi and Dino use a 7=2E272727 MHz clock=2E */
>>       serial_mm_init(addr_space, LASI_UART_HPA + 0x800, 0,
>> diff --git a/hw/i386/microvm=2Ec b/hw/i386/microvm=2Ec
>> index 170a331e3f=2E=2Ed0ed4dca50 100644
>> --- a/hw/i386/microvm=2Ec
>> +++ b/hw/i386/microvm=2Ec
>> @@ -267,7 +267,8 @@ static void microvm_devices_init(MicrovmMachineStat=
e *mms)
>>         if (mms->rtc =3D=3D ON_OFF_AUTO_ON ||
>>           (mms->rtc =3D=3D ON_OFF_AUTO_AUTO && !kvm_enabled())) {
>> -        rtc_state =3D mc146818_rtc_init(isa_bus, 2000, NULL);
>> +        rtc_state =3D mc146818_rtc_init(isa_bus, 2000, NULL,
>> +                                      rtc_apic_policy_slew_deliver_irq=
);
>>           microvm_set_rtc(mms, rtc_state);
>>       }
>>   diff --git a/hw/i386/pc=2Ec b/hw/i386/pc=2Ec
>> index 546b703cb4=2E=2E650e7bc199 100644
>> --- a/hw/i386/pc=2Ec
>> +++ b/hw/i386/pc=2Ec
>> @@ -1244,6 +1244,13 @@ static void pc_superio_init(ISABus *isa_bus, boo=
l create_fdctrl,
>>       g_free(a20_line);
>>   }
>>   +bool rtc_apic_policy_slew_deliver_irq(RTCState *s)
>> +{
>> +    apic_reset_irq_delivered();
>> +    qemu_irq_raise(s->irq);
>> +    return apic_get_irq_delivered();
>> +}
>> +
>>   void pc_basic_device_init(struct PCMachineState *pcms,
>>                             ISABus *isa_bus, qemu_irq *gsi,
>>                             ISADevice **rtc_state,
>> @@ -1299,7 +1306,8 @@ void pc_basic_device_init(struct PCMachineState *=
pcms,
>>           pit_alt_irq =3D qdev_get_gpio_in(hpet, HPET_LEGACY_PIT_INT);
>>           rtc_irq =3D qdev_get_gpio_in(hpet, HPET_LEGACY_RTC_INT);
>>       }
>> -    *rtc_state =3D mc146818_rtc_init(isa_bus, 2000, rtc_irq);
>> +    *rtc_state =3D mc146818_rtc_init(isa_bus, 2000, rtc_irq,
>> +                                   rtc_apic_policy_slew_deliver_irq);
>>         qemu_register_boot_set(pc_boot_set, *rtc_state);
>>   diff --git a/hw/mips/jazz=2Ec b/hw/mips/jazz=2Ec
>> index 6aefe9a61b=2E=2E50fbd57b23 100644
>> --- a/hw/mips/jazz=2Ec
>> +++ b/hw/mips/jazz=2Ec
>> @@ -356,7 +356,7 @@ static void mips_jazz_init(MachineState *machine,
>>       fdctrl_init_sysbus(qdev_get_gpio_in(rc4030, 1), 0x80003000, fds);
>>         /* Real time clock */
>> -    mc146818_rtc_init(isa_bus, 1980, NULL);
>> +    mc146818_rtc_init(isa_bus, 1980, NULL, NULL);
>>       memory_region_init_io(rtc, NULL, &rtc_ops, NULL, "rtc", 0x1000);
>>       memory_region_add_subregion(address_space, 0x80004000, rtc);
>>   diff --git a/hw/ppc/pnv=2Ec b/hw/ppc/pnv=2Ec
>> index 3d01e26f84=2E=2Ec5482554b7 100644
>> --- a/hw/ppc/pnv=2Ec
>> +++ b/hw/ppc/pnv=2Ec
>> @@ -992,7 +992,7 @@ static void pnv_init(MachineState *machine)
>>       serial_hds_isa_init(pnv->isa_bus, 0, MAX_ISA_SERIAL_PORTS);
>>         /* Create an RTC ISA device too */
>> -    mc146818_rtc_init(pnv->isa_bus, 2000, NULL);
>> +    mc146818_rtc_init(pnv->isa_bus, 2000, NULL, NULL);
>>         /*
>>        * Create the machine BMC simulator and the IPMI BT device for
>> diff --git a/hw/rtc/mc146818rtc=2Ec b/hw/rtc/mc146818rtc=2Ec
>> index 1ebb412479=2E=2E9543ae0279 100644
>> --- a/hw/rtc/mc146818rtc=2Ec
>> +++ b/hw/rtc/mc146818rtc=2Ec
>> @@ -44,11 +44,6 @@
>>   #include "qapi/visitor=2Eh"
>>   #include "hw/rtc/mc146818rtc_regs=2Eh"
>>   -#ifdef TARGET_I386
>> -#include "qapi/qapi-commands-misc-target=2Eh"
>> -#include "hw/i386/apic=2Eh"
>> -#endif
>> -
>>   //#define DEBUG_CMOS
>>   //#define DEBUG_COALESCED
>>   @@ -112,7 +107,6 @@ static void rtc_coalesced_timer_update(RTCState *=
s)
>>   static QLIST_HEAD(, RTCState) rtc_devices =3D
>>       QLIST_HEAD_INITIALIZER(rtc_devices);
>>   -#ifdef TARGET_I386
>>   void qmp_rtc_reset_reinjection(Error **errp)
>>   {
>>       RTCState *s;
>> @@ -124,9 +118,8 @@ void qmp_rtc_reset_reinjection(Error **errp)
>>     static bool rtc_policy_slew_deliver_irq(RTCState *s)
>>   {
>> -    apic_reset_irq_delivered();
>> -    qemu_irq_raise(s->irq);
>> -    return apic_get_irq_delivered();
>> +    assert(s->policy_slew_deliver_irq);
>> +    return s->policy_slew_deliver_irq(s);
>>   }
>>     static void rtc_coalesced_timer(void *opaque)
>> @@ -145,13 +138,6 @@ static void rtc_coalesced_timer(void *opaque)
>>         rtc_coalesced_timer_update(s);
>>   }
>> -#else
>> -static bool rtc_policy_slew_deliver_irq(RTCState *s)
>> -{
>> -    assert(0);
>> -    return false;
>> -}
>> -#endif
>>     static uint32_t rtc_periodic_clock_ticks(RTCState *s)
>>   {
>> @@ -922,14 +908,14 @@ static void rtc_realizefn(DeviceState *dev, Error=
 **errp)
>>       rtc_set_date_from_host(isadev);
>>         switch (s->lost_tick_policy) {
>> -#ifdef TARGET_I386
>> -    case LOST_TICK_POLICY_SLEW:
>> -        s->coalesced_timer =3D
>> -            timer_new_ns(rtc_clock, rtc_coalesced_timer, s);
>> -        break;
>> -#endif
>>       case LOST_TICK_POLICY_DISCARD:
>>           break;
>> +    case LOST_TICK_POLICY_SLEW:
>> +        if (s->policy_slew_deliver_irq) {
>> +            s->coalesced_timer =3D timer_new_ns(rtc_clock, rtc_coalesc=
ed_timer, s);
>> +            break;
>> +        }
>> +        /* fallthrough */
>>       default:
>>           error_setg(errp, "Invalid lost tick policy=2E");
>>           return;
>> @@ -960,7 +946,8 @@ static void rtc_realizefn(DeviceState *dev, Error *=
*errp)
>>       QLIST_INSERT_HEAD(&rtc_devices, s, link);
>>   }
>>   -ISADevice *mc146818_rtc_init(ISABus *bus, int base_year, qemu_irq in=
tercept_irq)
>> +ISADevice *mc146818_rtc_init(ISABus *bus, int base_year, qemu_irq inte=
rcept_irq,
>> +                             bool (*policy_slew_deliver_irq)(RTCState =
*s))
>>   {
>>       DeviceState *dev;
>>       ISADevice *isadev;
>> @@ -969,6 +956,7 @@ ISADevice *mc146818_rtc_init(ISABus *bus, int base_=
year, qemu_irq intercept_irq)
>>       isadev =3D isa_new(TYPE_MC146818_RTC);
>>       dev =3D DEVICE(isadev);
>>       s =3D MC146818_RTC(isadev);
>> +    s->policy_slew_deliver_irq =3D policy_slew_deliver_irq;
>>       qdev_prop_set_int32(dev, "base_year", base_year);
>>       isa_realize_and_unref(isadev, bus, &error_fatal);
>>       if (intercept_irq) {
>> diff --git a/hw/rtc/meson=2Ebuild b/hw/rtc/meson=2Ebuild
>> index dc33973384=2E=2E34a4d316fa 100644
>> --- a/hw/rtc/meson=2Ebuild
>> +++ b/hw/rtc/meson=2Ebuild
>> @@ -13,5 +13,4 @@ softmmu_ss=2Eadd(when: 'CONFIG_ASPEED_SOC', if_true: =
files('aspeed_rtc=2Ec'))
>>   softmmu_ss=2Eadd(when: 'CONFIG_GOLDFISH_RTC', if_true: files('goldfis=
h_rtc=2Ec'))
>>   softmmu_ss=2Eadd(when: 'CONFIG_LS7A_RTC', if_true: files('ls7a_rtc=2E=
c'))
>>   softmmu_ss=2Eadd(when: 'CONFIG_ALLWINNER_H3', if_true: files('allwinn=
er-rtc=2Ec'))
>> -
>> -specific_ss=2Eadd(when: 'CONFIG_MC146818RTC', if_true: files('mc146818=
rtc=2Ec'))
>> +softmmu_ss=2Eadd(when: 'CONFIG_MC146818RTC', if_true: files('mc146818r=
tc=2Ec'))
>
>Ouch this is quite a nasty one :/
>
>These days we really should try and avoid setting function pointers outsi=
de of _init() and class_init() where possible=2E If I were looking to model=
 this today I'd probably try an approach like this:
>
>- Move apic_irq_delivered into APICCommonState
>
>- Define apic_reset_irq_delivered() and apic_get_irq_delivered() as funct=
ion pointers in APICCommonState and assign them to the current implementati=
ons in apic_common_initfn() adding an APICCommonState parameter as required
>
>- Grab a reference to APICCommonState in mc146818rtc=2Ec's rtc_realizefn(=
) using either an object property link or object_resolve_path_type("", TYPE=
_APIC_COMMON, NULL)

AFAICS TYPE_APIC_COMMON is x86-specific which doesn't serve the point of t=
he patch well ;)

>- Use "if (s->apic) { =2E=2E }" or similar in mc146818rtc=2Ec to guard ca=
lling the apic_*() functions

IMO mc146818rtc=2Ec shouldn't make any assumptions outside of its scope, e=
specially not about any target specifics like an APIC=2E

I wonder if we could somehow wire up the APIC handling in the x86 IRQ hand=
ler=2E

Best regards,
Bernhard

>Note that this is a good example as to why legacy global init functions s=
uch as mc146818_rtc_init() are a bad idea, since if you add a new optional =
parameter then you end up having to touch all function callers rather than =
just the places where you want to make use of the new parameter=2E
>
>
>ATB,
>
>Mark=2E
>

