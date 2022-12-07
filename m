Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53199645DC3
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Dec 2022 16:40:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2wVi-0000EC-TF; Wed, 07 Dec 2022 10:39:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1p2wVg-0000Dp-PS
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 10:39:00 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1p2wVe-0006wF-U8
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 10:39:00 -0500
Received: by mail-ej1-x62f.google.com with SMTP id gh17so14918308ejb.6
 for <qemu-devel@nongnu.org>; Wed, 07 Dec 2022 07:38:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MtKDLSLWXyDOtQ7OIVKiD4UXAKw5U1ie47bdsE7kq0k=;
 b=eE2hB97Fp7gIiNgjdX4IzOi7ah+nl4Tx9qaXUKfDnJd0FF26D7Tz4SIk3cPDYnqzJ2
 sT9rRZfq1SPmNoPwKjBaTAwqdljPy9nIatJExHA0r8k8mdV8LrPD7NvLjCwPMlu955K6
 sOvvJ7i1RmCqzAR/EUTKoffw6U6OmXOmTlV0jSYr5x6xe6BnGuB7ntH3F+p38tSBpfY4
 hy7c4K3SQqS6oI68dq8LO9D6I9ssENOtzyKHRoWvOYK3aWnPlDkhEPrNB7sb1yuzQSi4
 vOgfYkTKqoiVFkc7BkChglzA4RkMFS2T2wma4MQGUnU0XwYJHn+iFIuCq6JGLRchAH7u
 AwFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MtKDLSLWXyDOtQ7OIVKiD4UXAKw5U1ie47bdsE7kq0k=;
 b=meugIn10Lg/E2G6Ec3al/NqZtf125FULQ0MiRy47ohfruqMmh1/40Yg9ddWhbu5EC8
 AVmy5YOxsssAJmUP3jO3J//VhY/ARDZDksu9NwcR0yYC0yHAX2CTs1RNSHahdgtT809s
 81favxyD2N5sqc66kh5PdFRNRMB//b4qM+mXXDEFZ9nHZHVtRhRjfiSW4x20+tXDSWZu
 2ASGVuvENmeBW2Wos686Ih3pJ9UQPWu23YtD2d78TwzLzm9jyAH1RiWfTIEvC1riDSI+
 N+A6LJJ3ufeIGHRynHZ0IPH10yjjcvaI1JDb+9rgU37bISogaoI/gV2hX371CW/xF/CZ
 F8Rw==
X-Gm-Message-State: ANoB5pnbX22u2vwsGyx/kxy8jT1u/mD5Kx/r6r1WxMKNZa0MUBfSS/ye
 t/ERpriDcooU/eRwQBF856Y=
X-Google-Smtp-Source: AA0mqf4Fafz48AZNCu6+Rny2rQ8J3tmFUMurJD+Bcj9q/DWmSafS5X+ZbvTUr3r1vhIfjU9xEjHAdQ==
X-Received: by 2002:a17:906:da0f:b0:7ad:95cf:726e with SMTP id
 fi15-20020a170906da0f00b007ad95cf726emr61694586ejb.60.1670427537136; 
 Wed, 07 Dec 2022 07:38:57 -0800 (PST)
Received: from [127.0.0.1] (dynamic-077-011-181-051.77.11.pool.telefonica.de.
 [77.11.181.51]) by smtp.gmail.com with ESMTPSA id
 9-20020a170906200900b007c0688a68cbsm8616801ejo.176.2022.12.07.07.38.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Dec 2022 07:38:56 -0800 (PST)
Date: Wed, 07 Dec 2022 15:38:48 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
CC: Michael S Tsirkin <mst@redhat.com>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_for-8=2E0=5D_hw/rtc/mc146818rtc=3A?=
 =?US-ASCII?Q?_Make_this_rtc_device_target_independent?=
In-Reply-To: <1e82a59e-6c02-68c4-946b-e710d8702d53@redhat.com>
References: <20221206200641.339116-1-thuth@redhat.com>
 <5365BEF1-658C-412D-8A95-C5E1A9A5AB7E@gmail.com>
 <1e82a59e-6c02-68c4-946b-e710d8702d53@redhat.com>
Message-ID: <48E3BFC9-112B-4FD2-A6F8-699D1776C55D@gmail.com>
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



Am 7=2E Dezember 2022 08:43:31 UTC schrieb Thomas Huth <thuth@redhat=2Ecom=
>:
>On 07/12/2022 00=2E38, Bernhard Beschow wrote:
>>=20
>>=20
>> Am 6=2E Dezember 2022 20:06:41 UTC schrieb Thomas Huth <thuth@redhat=2E=
com>:
>>> The only code that is really, really target dependent is the apic-rela=
ted
>>> code in rtc_policy_slew_deliver_irq()=2E By moving this code into the =
hw/i386/
>>> folder (renamed to rtc_apic_policy_slew_deliver_irq()) and passing thi=
s
>>> function as parameter to mc146818_rtc_init(), we can make the RTC comp=
letely
>>> target-independent=2E
>>>=20
>>> Signed-off-by: Thomas Huth <thuth@redhat=2Ecom>
>>> ---
>>> include/hw/rtc/mc146818rtc=2Eh |  7 +++++--
>>> hw/alpha/dp264=2Ec             |  2 +-
>>> hw/hppa/machine=2Ec            |  2 +-
>>> hw/i386/microvm=2Ec            |  3 ++-
>>> hw/i386/pc=2Ec                 | 10 +++++++++-
>>> hw/mips/jazz=2Ec               |  2 +-
>>> hw/ppc/pnv=2Ec                 |  2 +-
>>> hw/rtc/mc146818rtc=2Ec         | 34 +++++++++++-----------------------
>>> hw/rtc/meson=2Ebuild           |  3 +--
>>> 9 files changed, 32 insertions(+), 33 deletions(-)
>>>=20
>>> diff --git a/include/hw/rtc/mc146818rtc=2Eh b/include/hw/rtc/mc146818r=
tc=2Eh
>>> index 1db0fcee92=2E=2Ec687953cc4 100644
>>> --- a/include/hw/rtc/mc146818rtc=2Eh
>>> +++ b/include/hw/rtc/mc146818rtc=2Eh
>>> @@ -46,14 +46,17 @@ struct RTCState {
>>>      Notifier clock_reset_notifier;
>>>      LostTickPolicy lost_tick_policy;
>>>      Notifier suspend_notifier;
>>> +    bool (*policy_slew_deliver_irq)(RTCState *s);
>>>      QLIST_ENTRY(RTCState) link;
>>> };
>>>=20
>>> #define RTC_ISA_IRQ 8
>>>=20
>>> -ISADevice *mc146818_rtc_init(ISABus *bus, int base_year,
>>> -                             qemu_irq intercept_irq);
>>> +ISADevice *mc146818_rtc_init(ISABus *bus, int base_year, qemu_irq int=
ercept_irq,
>>> +                             bool (*policy_slew_deliver_irq)(RTCState=
 *s));
>>> void rtc_set_memory(ISADevice *dev, int addr, int val);
>>> int rtc_get_memory(ISADevice *dev, int addr);
>>> +bool rtc_apic_policy_slew_deliver_irq(RTCState *s);
>>> +void qmp_rtc_reset_reinjection(Error **errp);
>>>=20
>>> #endif /* HW_RTC_MC146818RTC_H */
>>> diff --git a/hw/alpha/dp264=2Ec b/hw/alpha/dp264=2Ec
>>> index c502c8c62a=2E=2E8723942b52 100644
>>> --- a/hw/alpha/dp264=2Ec
>>> +++ b/hw/alpha/dp264=2Ec
>>> @@ -118,7 +118,7 @@ static void clipper_init(MachineState *machine)
>>>      qdev_connect_gpio_out(i82378_dev, 0, isa_irq);
>>>=20
>>>      /* Since we have an SRM-compatible PALcode, use the SRM epoch=2E =
 */
>>> -    mc146818_rtc_init(isa_bus, 1900, rtc_irq);
>>> +    mc146818_rtc_init(isa_bus, 1900, rtc_irq, NULL);
>>>=20
>>>      /* VGA setup=2E  Don't bother loading the bios=2E  */
>>>      pci_vga_init(pci_bus);
>>> diff --git a/hw/hppa/machine=2Ec b/hw/hppa/machine=2Ec
>>> index de1cc7ab71=2E=2E311031714a 100644
>>> --- a/hw/hppa/machine=2Ec
>>> +++ b/hw/hppa/machine=2Ec
>>> @@ -232,7 +232,7 @@ static void machine_hppa_init(MachineState *machin=
e)
>>>      assert(isa_bus);
>>>=20
>>>      /* Realtime clock, used by firmware for PDC_TOD call=2E */
>>> -    mc146818_rtc_init(isa_bus, 2000, NULL);
>>> +    mc146818_rtc_init(isa_bus, 2000, NULL, NULL);
>>>=20
>>>      /* Serial ports: Lasi and Dino use a 7=2E272727 MHz clock=2E */
>>>      serial_mm_init(addr_space, LASI_UART_HPA + 0x800, 0,
>>> diff --git a/hw/i386/microvm=2Ec b/hw/i386/microvm=2Ec
>>> index 170a331e3f=2E=2Ed0ed4dca50 100644
>>> --- a/hw/i386/microvm=2Ec
>>> +++ b/hw/i386/microvm=2Ec
>>> @@ -267,7 +267,8 @@ static void microvm_devices_init(MicrovmMachineSta=
te *mms)
>>>=20
>>>      if (mms->rtc =3D=3D ON_OFF_AUTO_ON ||
>>>          (mms->rtc =3D=3D ON_OFF_AUTO_AUTO && !kvm_enabled())) {
>>> -        rtc_state =3D mc146818_rtc_init(isa_bus, 2000, NULL);
>>> +        rtc_state =3D mc146818_rtc_init(isa_bus, 2000, NULL,
>>> +                                      rtc_apic_policy_slew_deliver_ir=
q);
>>>          microvm_set_rtc(mms, rtc_state);
>>>      }
>>>=20
>>> diff --git a/hw/i386/pc=2Ec b/hw/i386/pc=2Ec
>>> index 546b703cb4=2E=2E650e7bc199 100644
>>> --- a/hw/i386/pc=2Ec
>>> +++ b/hw/i386/pc=2Ec
>>> @@ -1244,6 +1244,13 @@ static void pc_superio_init(ISABus *isa_bus, bo=
ol create_fdctrl,
>>>      g_free(a20_line);
>>> }
>>>=20
>>> +bool rtc_apic_policy_slew_deliver_irq(RTCState *s)
>>> +{
>>> +    apic_reset_irq_delivered();
>>> +    qemu_irq_raise(s->irq);
>>> +    return apic_get_irq_delivered();
>>> +}
>>> +
>>> void pc_basic_device_init(struct PCMachineState *pcms,
>>>                            ISABus *isa_bus, qemu_irq *gsi,
>>>                            ISADevice **rtc_state,
>>> @@ -1299,7 +1306,8 @@ void pc_basic_device_init(struct PCMachineState =
*pcms,
>>>          pit_alt_irq =3D qdev_get_gpio_in(hpet, HPET_LEGACY_PIT_INT);
>>>          rtc_irq =3D qdev_get_gpio_in(hpet, HPET_LEGACY_RTC_INT);
>>>      }
>>> -    *rtc_state =3D mc146818_rtc_init(isa_bus, 2000, rtc_irq);
>>> +    *rtc_state =3D mc146818_rtc_init(isa_bus, 2000, rtc_irq,
>>> +                                   rtc_apic_policy_slew_deliver_irq);
>>=20
>> In my PIIX consolidation series [1] I'm instantiating the RTC in the so=
uth bridges since embedding the struct in the host device is the preferred =
new way=2E In the end there is one initialization shared by both PIIX3 and =
-4=2E While PIIX3 (PC) will require rtc_apic_policy_slew_deliver_irq, PIIX4=
 (Malta) won't=2E Furthermore, my goal ist to reuse PIIX4 in the PC machine=
 to eliminate today's Frankenstein PIIX4 ACPI controller=2E Any idea how to=
 solve this?
>
>I assume that you could ignore this in the shared initialization code and=
 just add the pointer in the code that sets up the x86 boards=2E It's a lit=
tle bit ugly [*], but RTCState is public in
>include/hw/rtc/mc146818rtc=2Eh, so it should be doable=2E

Yeah, putting it in between new and realize of the south bridges might wor=
k indeed=2E Not nice, but doable=2E

I think this device model deserves quite some cleanup=2E So freeing it up =
from an x86-specific, implicit dependency to make it target agnostic looks =
like a step in the right direction!

Best regards,
Bernhard

>
> Thomas
>
>
>[*] Well, that whole driftfix=3Dslew thing is ugly=2E I'm also not very f=
amiliar with it and don't know whether this is still in wide use =2E=2E=2E =
does anybody know? Otherwise, we could could maybe also deprecate and final=
ly remove that driftfix=3Dslew stuff?
>

