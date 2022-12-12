Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52AD3649774
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 01:49:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4WzY-0007AL-GZ; Sun, 11 Dec 2022 19:48:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1p4WzW-0007A6-J5
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 19:48:22 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1p4WzT-0004Xh-U5
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 19:48:22 -0500
Received: by mail-ej1-x62f.google.com with SMTP id bj12so24119269ejb.13
 for <qemu-devel@nongnu.org>; Sun, 11 Dec 2022 16:48:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9QcShLmwNGEwJYMPuSPqb6D13gCOxVP9eh7qeCslwBE=;
 b=okTW/f06QO07Y5vbs+daN1/D4ANeK2FW9t8pPxPLObG4jvGsiCXpcIK5n9aGb3kLg9
 Rw/FcHspRAdYySOC4HRGrcqJk+IGAvFvlcdzFNVvVP1p3ICXbOnOy5PEAPUD6S29Xw6Q
 Z6Mf/GzaYiVXd7V877T2zGHAPxOnetfc26BgmW4DIsTuFU70NwUpwR3k728o+hPFUhbH
 8MCa9LX3MDFy+82OdXuJLLFsz4D0spIUG7fMNQsJ5kqQ8ocbj3mvl21gNoNvFUcW/cd1
 3wNUcLCkXb71Wh4IYT3XkrSwfgfKZ7PrK5rXk2FXCNeJJxT/4hgnbiAnd9Ht0nwJ5mq/
 JudQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9QcShLmwNGEwJYMPuSPqb6D13gCOxVP9eh7qeCslwBE=;
 b=ObRbsQXBNSZlAYPg1foWMPiZstB89FrQ3eBtuJlmhVuV9FYWUvwA+JYCpDEqC2C/2e
 Derv4N0fivIE1ZK8V5gJY1GMvokKJ/RNc2HvD+ZmVUX7xMpE5Mq2gCYPDNMNIAaXsDv0
 dDkA1SIozCen5dB/a0ttCDudaZe0oDz9yy552ixUy8awd9lhTI6siqhQFUt2DRwA5wVU
 /kdBy+8sOXC/HnBcLnUM5pb9Chm1reM2KBAH9vV8ku6xgmzTKYXzqvlVLvosYPwlOHhh
 S2nVUcakoJQCU8FXXT2g/TpQlig173XNcUBwLhizblGh1kuLNHb2wzcNfJgx5wQyXU6Q
 4n/g==
X-Gm-Message-State: ANoB5pkskVDUsZU7b4V8qnxPr/HqmdVOeXKWuHvjw4WrFQJv1USLHyDx
 J8uD6IufpXtJDmGlb7yIbtQ=
X-Google-Smtp-Source: AA0mqf6ztIpojlKsi1rRxn0NCiZv0TqhGap/WHxx/b73NA88isGa7C0KRkJpeP/bs6ozvPkJ1wgwLA==
X-Received: by 2002:a17:907:b689:b0:7c1:7441:57f3 with SMTP id
 vm9-20020a170907b68900b007c1744157f3mr706302ejc.10.1670806098148; 
 Sun, 11 Dec 2022 16:48:18 -0800 (PST)
Received: from ?IPv6:::1?
 (p200300faaf0bb200150f11b7b1e9e208.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:150f:11b7:b1e9:e208])
 by smtp.gmail.com with ESMTPSA id
 a9-20020a17090640c900b0077205dd15basm2618270ejk.66.2022.12.11.16.48.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 11 Dec 2022 16:48:17 -0800 (PST)
Date: Mon, 12 Dec 2022 00:48:13 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org
CC: Michael S Tsirkin <mst@redhat.com>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 BALATON Zoltan <balaton@eik.bme.hu>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_for-8=2E0=5D_hw/rtc/mc146818rtc?=
 =?US-ASCII?Q?=3A_Make_this_rtc_device_target_independent?=
In-Reply-To: <a9e8d0ef-e4cb-2319-d8d3-f657e167c729@ilande.co.uk>
References: <20221209111556.110757-1-thuth@redhat.com>
 <a9e8d0ef-e4cb-2319-d8d3-f657e167c729@ilande.co.uk>
Message-ID: <A79863CA-7197-4742-A1B1-E5A4C75014CE@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62f.google.com
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



Am 10=2E Dezember 2022 13:48:00 UTC schrieb Mark Cave-Ayland <mark=2Ecave-=
ayland@ilande=2Eco=2Euk>:
>On 09/12/2022 11:15, Thomas Huth wrote:
>
>> The only reason for this code being target dependent is the apic-relate=
d
>> code in rtc_policy_slew_deliver_irq()=2E Since these apic functions are=
 rather
>> simple, we can easily move them into a new, separate file (apic_irqcoun=
t=2Ec)
>> which will always be compiled and linked if either APIC or the mc146818=
 device
>> are required=2E This way we can get rid of the #ifdef TARGET_I386 switc=
hes in
>> mc146818rtc=2Ec and declare it in the softmmu_ss instead of specific_ss=
, so
>> that the code only gets compiled once for all targets=2E
>
>> Signed-off-by: Thomas Huth <thuth@redhat=2Ecom>
>
>Looks much better!
>
>> ---
>>   v2: Move the apic functions into a separate file instead of using
>>       an ugly function pointer
>>=20
>>   include/hw/i386/apic=2Eh          |  1 +
>>   include/hw/i386/apic_internal=2Eh |  1 -
>>   include/hw/rtc/mc146818rtc=2Eh    |  1 +
>>   hw/intc/apic_common=2Ec           | 27 -----------------
>>   hw/intc/apic_irqcount=2Ec         | 53 ++++++++++++++++++++++++++++++=
+++
>>   hw/rtc/mc146818rtc=2Ec            | 25 +++++-----------
>>   hw/intc/meson=2Ebuild             |  6 +++-
>>   hw/rtc/meson=2Ebuild              |  3 +-
>>   8 files changed, 68 insertions(+), 49 deletions(-)
>>   create mode 100644 hw/intc/apic_irqcount=2Ec
>>=20
>> diff --git a/include/hw/i386/apic=2Eh b/include/hw/i386/apic=2Eh
>> index da1d2fe155=2E=2E96b9939425 100644
>> --- a/include/hw/i386/apic=2Eh
>> +++ b/include/hw/i386/apic=2Eh
>> @@ -9,6 +9,7 @@ int apic_accept_pic_intr(DeviceState *s);
>>   void apic_deliver_pic_intr(DeviceState *s, int level);
>>   void apic_deliver_nmi(DeviceState *d);
>>   int apic_get_interrupt(DeviceState *s);
>> +void apic_report_irq_delivered(int delivered);
>>   void apic_reset_irq_delivered(void);
>>   int apic_get_irq_delivered(void);
>>   void cpu_set_apic_base(DeviceState *s, uint64_t val);
>> diff --git a/include/hw/i386/apic_internal=2Eh b/include/hw/i386/apic_i=
nternal=2Eh
>> index c175e7e718=2E=2Ee61ad04769 100644
>> --- a/include/hw/i386/apic_internal=2Eh
>> +++ b/include/hw/i386/apic_internal=2Eh
>> @@ -199,7 +199,6 @@ typedef struct VAPICState {
>>     extern bool apic_report_tpr_access;
>>   -void apic_report_irq_delivered(int delivered);
>>   bool apic_next_timer(APICCommonState *s, int64_t current_time);
>>   void apic_enable_tpr_access_reporting(DeviceState *d, bool enable);
>>   void apic_enable_vapic(DeviceState *d, hwaddr paddr);
>> diff --git a/include/hw/rtc/mc146818rtc=2Eh b/include/hw/rtc/mc146818rt=
c=2Eh
>> index 1db0fcee92=2E=2E45bcd6f040 100644
>> --- a/include/hw/rtc/mc146818rtc=2Eh
>> +++ b/include/hw/rtc/mc146818rtc=2Eh
>> @@ -55,5 +55,6 @@ ISADevice *mc146818_rtc_init(ISABus *bus, int base_ye=
ar,
>>                                qemu_irq intercept_irq);
>>   void rtc_set_memory(ISADevice *dev, int addr, int val);
>>   int rtc_get_memory(ISADevice *dev, int addr);
>> +void qmp_rtc_reset_reinjection(Error **errp);
>>     #endif /* HW_RTC_MC146818RTC_H */
>> diff --git a/hw/intc/apic_common=2Ec b/hw/intc/apic_common=2Ec
>> index 2a20982066=2E=2Eb0f85f9384 100644
>> --- a/hw/intc/apic_common=2Ec
>> +++ b/hw/intc/apic_common=2Ec
>> @@ -33,7 +33,6 @@
>>   #include "hw/sysbus=2Eh"
>>   #include "migration/vmstate=2Eh"
>>   -static int apic_irq_delivered;
>>   bool apic_report_tpr_access;
>>     void cpu_set_apic_base(DeviceState *dev, uint64_t val)
>> @@ -122,32 +121,6 @@ void apic_handle_tpr_access_report(DeviceState *de=
v, target_ulong ip,
>>       vapic_report_tpr_access(s->vapic, CPU(s->cpu), ip, access);
>>   }
>>   -void apic_report_irq_delivered(int delivered)
>> -{
>> -    apic_irq_delivered +=3D delivered;
>> -
>> -    trace_apic_report_irq_delivered(apic_irq_delivered);
>> -}
>> -
>> -void apic_reset_irq_delivered(void)
>> -{
>> -    /* Copy this into a local variable to encourage gcc to emit a plai=
n
>> -     * register for a sys/sdt=2Eh marker=2E  For details on this worka=
round, see:
>> -     * https://sourceware=2Eorg/bugzilla/show_bug=2Ecgi?id=3D13296
>> -     */
>> -    volatile int a_i_d =3D apic_irq_delivered;
>> -    trace_apic_reset_irq_delivered(a_i_d);
>> -
>> -    apic_irq_delivered =3D 0;
>> -}
>> -
>> -int apic_get_irq_delivered(void)
>> -{
>> -    trace_apic_get_irq_delivered(apic_irq_delivered);
>> -
>> -    return apic_irq_delivered;
>> -}
>> -
>
>Just a comment whilst reviewing this patch: apic_irq_delivered is also us=
ed by hw/i386/kvm/i8259=2Ec which seems incorrect since it is a PIC rather =
than an APIC, but that's why it isn't immediately possible to move apic_irq=
_delivered into APICCommonState=2E
>
>I suspect what should happen is that PICCommonState should have its own K=
VM irq delivery count rather than relying on the APIC one, which might actu=
ally be the reason that this dependency between mc146818rtc and APIC exists=
 in the first place=2E Any x86 people care to comment?

What's more is that the non-KVM APIC also deals with the IRQ delivery coun=
t while the non-KVM PIC doesn't=2E This seems inconsistent to me=2E

Then there is the KVM PIT which offers various policies while the non-KVM =
PIT doesn't=2E

Is this perhaps a KVM-specific workaround [1]? Can we confine the workarou=
nd to KVM on x86 (while making the code itself target-agnostic)? Should the=
 new files be moved and renamed accordingly?

Best regards,
Bernhard

[1] https://bugzilla=2Eredhat=2Ecom/show_bug=2Ecgi?id=3D865315

>
>>   void apic_deliver_nmi(DeviceState *dev)
>>   {
>>       APICCommonState *s =3D APIC_COMMON(dev);
>> diff --git a/hw/intc/apic_irqcount=2Ec b/hw/intc/apic_irqcount=2Ec
>> new file mode 100644
>> index 0000000000=2E=2E0aadef1cb5
>> --- /dev/null
>> +++ b/hw/intc/apic_irqcount=2Ec
>> @@ -0,0 +1,53 @@
>> +/*
>> + * APIC support - functions for counting the delivered IRQs=2E
>> + * (this code is in a separate file since it is used from the
>> + * mc146818rtc code on targets without APIC, too)
>> + *
>> + *  Copyright (c) 2011      Jan Kiszka, Siemens AG
>> + *
>> + * This library is free software; you can redistribute it and/or
>> + * modify it under the terms of the GNU Lesser General Public
>> + * License as published by the Free Software Foundation; either
>> + * version 2=2E1 of the License, or (at your option) any later version=
=2E
>> + *
>> + * This library is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE=2E  See the GNU
>> + * Lesser General Public License for more details=2E
>> + *
>> + * You should have received a copy of the GNU Lesser General Public
>> + * License along with this library; if not, see <http://www=2Egnu=2Eor=
g/licenses/>
>> + */
>> +
>> +#include "qemu/osdep=2Eh"
>> +#include "hw/i386/apic=2Eh"
>> +#include "trace=2Eh"
>> +
>> +static int apic_irq_delivered;
>> +
>> +void apic_report_irq_delivered(int delivered)
>> +{
>> +    apic_irq_delivered +=3D delivered;
>> +
>> +    trace_apic_report_irq_delivered(apic_irq_delivered);
>> +}
>> +
>> +void apic_reset_irq_delivered(void)
>> +{
>> +    /*
>> +     * Copy this into a local variable to encourage gcc to emit a plai=
n
>> +     * register for a sys/sdt=2Eh marker=2E  For details on this worka=
round, see:
>> +     * https://sourceware=2Eorg/bugzilla/show_bug=2Ecgi?id=3D13296
>> +     */
>> +    volatile int a_i_d =3D apic_irq_delivered;
>> +    trace_apic_reset_irq_delivered(a_i_d);
>> +
>> +    apic_irq_delivered =3D 0;
>> +}
>> +
>> +int apic_get_irq_delivered(void)
>> +{
>> +    trace_apic_get_irq_delivered(apic_irq_delivered);
>> +
>> +    return apic_irq_delivered;
>> +}
>> diff --git a/hw/rtc/mc146818rtc=2Ec b/hw/rtc/mc146818rtc=2Ec
>> index 1ebb412479=2E=2Eafb1f385a3 100644
>> --- a/hw/rtc/mc146818rtc=2Ec
>> +++ b/hw/rtc/mc146818rtc=2Ec
>> @@ -43,11 +43,7 @@
>>   #include "qapi/qapi-events-misc=2Eh"
>>   #include "qapi/visitor=2Eh"
>>   #include "hw/rtc/mc146818rtc_regs=2Eh"
>> -
>> -#ifdef TARGET_I386
>> -#include "qapi/qapi-commands-misc-target=2Eh"
>>   #include "hw/i386/apic=2Eh"
>> -#endif
>>     //#define DEBUG_CMOS
>>   //#define DEBUG_COALESCED
>> @@ -112,7 +108,6 @@ static void rtc_coalesced_timer_update(RTCState *s)
>>   static QLIST_HEAD(, RTCState) rtc_devices =3D
>>       QLIST_HEAD_INITIALIZER(rtc_devices);
>>   -#ifdef TARGET_I386
>>   void qmp_rtc_reset_reinjection(Error **errp)
>>   {
>>       RTCState *s;
>> @@ -145,13 +140,6 @@ static void rtc_coalesced_timer(void *opaque)
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
>> @@ -922,14 +910,15 @@ static void rtc_realizefn(DeviceState *dev, Error=
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
>> +        /* Slew tick policy is only available if the machine has an AP=
IC */
>> +        if (object_resolve_path_type("", "apic-common", NULL) !=3D NUL=
L) {
>
>Hmmm=2E These days we should be using TYPE_APIC_COMMON, however it seems =
that APICCommonState is defined in apic_internal=2Eh rather than apic=2Eh w=
hich seems wrong (it prevents you from passing an APICCommonState as an obj=
ect link property as well as from using TYPE_APIC_COMMON)=2E
>
>> +            s->coalesced_timer =3D timer_new_ns(rtc_clock, rtc_coalesc=
ed_timer, s);
>> +            break;
>> +        }
>> +        /* fallthrough */
>>       default:
>>           error_setg(errp, "Invalid lost tick policy=2E");
>>           return;
>> diff --git a/hw/intc/meson=2Ebuild b/hw/intc/meson=2Ebuild
>> index bcbf22ff51=2E=2E036ad1936b 100644
>> --- a/hw/intc/meson=2Ebuild
>> +++ b/hw/intc/meson=2Ebuild
>> @@ -25,8 +25,12 @@ softmmu_ss=2Eadd(when: 'CONFIG_XILINX', if_true: fil=
es('xilinx_intc=2Ec'))
>>   softmmu_ss=2Eadd(when: 'CONFIG_XLNX_ZYNQMP', if_true: files('xlnx-zyn=
qmp-ipi=2Ec'))
>>   softmmu_ss=2Eadd(when: 'CONFIG_XLNX_ZYNQMP_PMU', if_true: files('xlnx=
-pmu-iomod-intc=2Ec'))
>>   -specific_ss=2Eadd(when: 'CONFIG_ALLWINNER_A10_PIC', if_true: files('=
allwinner-a10-pic=2Ec'))
>> +if config_all_devices=2Ehas_key('CONFIG_APIC') or config_all_devices=
=2Ehas_key('CONFIG_MC146818RTC')
>> +    softmmu_ss=2Eadd(files('apic_irqcount=2Ec'))
>> +endif
>>   specific_ss=2Eadd(when: 'CONFIG_APIC', if_true: files('apic=2Ec', 'ap=
ic_common=2Ec'))
>> +
>> +specific_ss=2Eadd(when: 'CONFIG_ALLWINNER_A10_PIC', if_true: files('al=
lwinner-a10-pic=2Ec'))
>>   specific_ss=2Eadd(when: 'CONFIG_ARM_GIC', if_true: files('arm_gicv3_c=
puif_common=2Ec'))
>>   specific_ss=2Eadd(when: 'CONFIG_ARM_GICV3_TCG', if_true: files('arm_g=
icv3_cpuif=2Ec'))
>>   specific_ss=2Eadd(when: 'CONFIG_ARM_GIC_KVM', if_true: files('arm_gic=
_kvm=2Ec'))
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
>Fixing up the headers to allow TYPE_APIC_COMMON rather than hard-coding "=
apic-common" would be my preference, however there is a lot of legacy code =
here and the fear would be that once you pull on that string then more will=
 keep unravelling=2E=2E=2E so if that isn't something you can easily get to=
 work I'm inclined to give a:
>
>Reviewed-by: Mark Cave-Ayland <mark=2Ecave-ayland@ilande=2Eco=2Euk>
>
>regardless since it nudges things in the right direction until we can get=
 some guidance from more knowledgeable x86 people=2E
>
>
>ATB,
>
>Mark=2E

