Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C2066493A1
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Dec 2022 11:29:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4JYi-0005Zf-PZ; Sun, 11 Dec 2022 05:27:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1p4JYg-0005ZV-LH
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 05:27:46 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1p4JYd-0001mT-W0
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 05:27:46 -0500
Received: by mail-ed1-x535.google.com with SMTP id a16so8974496edb.9
 for <qemu-devel@nongnu.org>; Sun, 11 Dec 2022 02:27:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LDvykqSeFPYr30U5dv2ifD/xoyLUELDr3ENKvtB2Pps=;
 b=YLsQ427/94iAcp7qbhArsoifQVfTBvsgeBBBcgii5tNI+tBinKgoNuy0SQP1E2+d+v
 y9tObySx/m0Klw4Num0+2w7NiwqMZefnv2xGirJukn3d6MlHbOSz8+h72PUOBV6dwEV7
 9lggqx3N6ofLSfBCezQ8r/FSEnncGrHZZf96WT+8TSvieFDL2wm7kH2DQg7WtuwMMEou
 YARPCdA7yYO4KISlaoka7O0QoKGMKphoeikTMOC/9Nkf0FvP8ubAmB3ifQz2gjrb1bZk
 RpEV76B0IVKOirq4XOnaY17qytFjHYEfLUgAtomhWkgf1QfMli4DyrX2HL+MycwIw5cz
 LDPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LDvykqSeFPYr30U5dv2ifD/xoyLUELDr3ENKvtB2Pps=;
 b=H0fdxoquls13Wt59w/HjxSPD3T72vKQYlYTyMJeClWRIZqO0biGz3mroAvd8uDjxd5
 7T/dlKLYz3bqoneiCMgd1W4D978YpFF3EreUYU/A/T15RnWq2rXRDfusWdlqc+qePsOp
 03sJjmcu4/PeT6NWz8iVVc/dgBRbcjQX48GpC/4/k/vS6oXf0JgX653xyjyvyO1KKb/V
 4BkxV8TKOxzDlsz0YAnhjLiCPgonztd30HSVqz1tFvBEC7A64EtQZk4VVi8tnvTuAPEv
 SozvCnfqqS3NgAG5NEV/rlGQ1UgFUkcHU+4wsVEW2/gGtHkkPY7Gv9Mt+A4QkZXMPJ8v
 bGqw==
X-Gm-Message-State: ANoB5pnobJbLKG+2dM8EWgbVCUkW3m2kZXB49dSal2WkrBT88qKK/7UN
 XvczLHYahufmlYUaIeo1u+k=
X-Google-Smtp-Source: AA0mqf6JTFYe7jyRx9gF3PcQfzKOQA96i0w5AqJwL24q4QZ7c7fe23/8SPjbQufIA+gJhyI47tQLdQ==
X-Received: by 2002:a05:6402:1491:b0:46c:e615:9f61 with SMTP id
 e17-20020a056402149100b0046ce6159f61mr11083892edv.25.1670754462369; 
 Sun, 11 Dec 2022 02:27:42 -0800 (PST)
Received: from ?IPv6:::1?
 (p200300faaf0bb200150f11b7b1e9e208.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:150f:11b7:b1e9:e208])
 by smtp.gmail.com with ESMTPSA id
 b10-20020a17090630ca00b0073dbaeb50f6sm1944478ejb.169.2022.12.11.02.27.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 11 Dec 2022 02:27:41 -0800 (PST)
Date: Sun, 11 Dec 2022 10:27:34 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
CC: Michael S Tsirkin <mst@redhat.com>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_for-8=2E0=5D_hw/rtc/mc146818rtc=3A?=
 =?US-ASCII?Q?_Make_this_rtc_device_target_independent?=
In-Reply-To: <d7942ee6-19c9-b06d-c74f-4d80d3cb1d00@ilande.co.uk>
References: <20221206200641.339116-1-thuth@redhat.com>
 <8f0b1154-5d40-f098-ef1d-cd2a50145529@ilande.co.uk>
 <A57CC4A0-A141-4A4A-A49F-E5F0F7D4B52A@gmail.com>
 <d7942ee6-19c9-b06d-c74f-4d80d3cb1d00@ilande.co.uk>
Message-ID: <D0F08E05-9C0A-41CE-8598-9953CA105E5C@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x535.google.com
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

Am 7=2E Dezember 2022 17:47:48 UTC schrieb Mark Cave-Ayland <mark=2Ecave-ay=
land@ilande=2Eco=2Euk>:
>On 07/12/2022 16:20, Bernhard Beschow wrote:
>
>> Am 7=2E Dezember 2022 15:29:00 UTC schrieb Mark Cave-Ayland <mark=2Ecav=
e-ayland@ilande=2Eco=2Euk>:
>>> On 06/12/2022 20:06, Thomas Huth wrote:
>>>=20
>>>> The only code that is really, really target dependent is the apic-rel=
ated
>>>> code in rtc_policy_slew_deliver_irq()=2E By moving this code into the=
 hw/i386/
>>>> folder (renamed to rtc_apic_policy_slew_deliver_irq()) and passing th=
is
>>>> function as parameter to mc146818_rtc_init(), we can make the RTC com=
pletely
>>>> target-independent=2E
>>>>=20
>>>> Signed-off-by: Thomas Huth <thuth@redhat=2Ecom>
>>>> ---
>>>>    include/hw/rtc/mc146818rtc=2Eh |  7 +++++--
>>>>    hw/alpha/dp264=2Ec             |  2 +-
>>>>    hw/hppa/machine=2Ec            |  2 +-
>>>>    hw/i386/microvm=2Ec            |  3 ++-
>>>>    hw/i386/pc=2Ec                 | 10 +++++++++-
>>>>    hw/mips/jazz=2Ec               |  2 +-
>>>>    hw/ppc/pnv=2Ec                 |  2 +-
>>>>    hw/rtc/mc146818rtc=2Ec         | 34 +++++++++++-------------------=
----
>>>>    hw/rtc/meson=2Ebuild           |  3 +--
>>>>    9 files changed, 32 insertions(+), 33 deletions(-)
>>>>=20
>>>> diff --git a/include/hw/rtc/mc146818rtc=2Eh b/include/hw/rtc/mc146818=
rtc=2Eh
>>>> index 1db0fcee92=2E=2Ec687953cc4 100644
>>>> --- a/include/hw/rtc/mc146818rtc=2Eh
>>>> +++ b/include/hw/rtc/mc146818rtc=2Eh
>>>> @@ -46,14 +46,17 @@ struct RTCState {
>>>>        Notifier clock_reset_notifier;
>>>>        LostTickPolicy lost_tick_policy;
>>>>        Notifier suspend_notifier;
>>>> +    bool (*policy_slew_deliver_irq)(RTCState *s);
>>>>        QLIST_ENTRY(RTCState) link;
>>>>    };
>>>>      #define RTC_ISA_IRQ 8
>>>>    -ISADevice *mc146818_rtc_init(ISABus *bus, int base_year,
>>>> -                             qemu_irq intercept_irq);
>>>> +ISADevice *mc146818_rtc_init(ISABus *bus, int base_year, qemu_irq in=
tercept_irq,
>>>> +                             bool (*policy_slew_deliver_irq)(RTCStat=
e *s));
>>>>    void rtc_set_memory(ISADevice *dev, int addr, int val);
>>>>    int rtc_get_memory(ISADevice *dev, int addr);
>>>> +bool rtc_apic_policy_slew_deliver_irq(RTCState *s);
>>>> +void qmp_rtc_reset_reinjection(Error **errp);
>>>>      #endif /* HW_RTC_MC146818RTC_H */
>>>> diff --git a/hw/alpha/dp264=2Ec b/hw/alpha/dp264=2Ec
>>>> index c502c8c62a=2E=2E8723942b52 100644
>>>> --- a/hw/alpha/dp264=2Ec
>>>> +++ b/hw/alpha/dp264=2Ec
>>>> @@ -118,7 +118,7 @@ static void clipper_init(MachineState *machine)
>>>>        qdev_connect_gpio_out(i82378_dev, 0, isa_irq);
>>>>          /* Since we have an SRM-compatible PALcode, use the SRM epoc=
h=2E  */
>>>> -    mc146818_rtc_init(isa_bus, 1900, rtc_irq);
>>>> +    mc146818_rtc_init(isa_bus, 1900, rtc_irq, NULL);
>>>>          /* VGA setup=2E  Don't bother loading the bios=2E  */
>>>>        pci_vga_init(pci_bus);
>>>> diff --git a/hw/hppa/machine=2Ec b/hw/hppa/machine=2Ec
>>>> index de1cc7ab71=2E=2E311031714a 100644
>>>> --- a/hw/hppa/machine=2Ec
>>>> +++ b/hw/hppa/machine=2Ec
>>>> @@ -232,7 +232,7 @@ static void machine_hppa_init(MachineState *machi=
ne)
>>>>        assert(isa_bus);
>>>>          /* Realtime clock, used by firmware for PDC_TOD call=2E */
>>>> -    mc146818_rtc_init(isa_bus, 2000, NULL);
>>>> +    mc146818_rtc_init(isa_bus, 2000, NULL, NULL);
>>>>          /* Serial ports: Lasi and Dino use a 7=2E272727 MHz clock=2E=
 */
>>>>        serial_mm_init(addr_space, LASI_UART_HPA + 0x800, 0,
>>>> diff --git a/hw/i386/microvm=2Ec b/hw/i386/microvm=2Ec
>>>> index 170a331e3f=2E=2Ed0ed4dca50 100644
>>>> --- a/hw/i386/microvm=2Ec
>>>> +++ b/hw/i386/microvm=2Ec
>>>> @@ -267,7 +267,8 @@ static void microvm_devices_init(MicrovmMachineSt=
ate *mms)
>>>>          if (mms->rtc =3D=3D ON_OFF_AUTO_ON ||
>>>>            (mms->rtc =3D=3D ON_OFF_AUTO_AUTO && !kvm_enabled())) {
>>>> -        rtc_state =3D mc146818_rtc_init(isa_bus, 2000, NULL);
>>>> +        rtc_state =3D mc146818_rtc_init(isa_bus, 2000, NULL,
>>>> +                                      rtc_apic_policy_slew_deliver_i=
rq);
>>>>            microvm_set_rtc(mms, rtc_state);
>>>>        }
>>>>    diff --git a/hw/i386/pc=2Ec b/hw/i386/pc=2Ec
>>>> index 546b703cb4=2E=2E650e7bc199 100644
>>>> --- a/hw/i386/pc=2Ec
>>>> +++ b/hw/i386/pc=2Ec
>>>> @@ -1244,6 +1244,13 @@ static void pc_superio_init(ISABus *isa_bus, b=
ool create_fdctrl,
>>>>        g_free(a20_line);
>>>>    }
>>>>    +bool rtc_apic_policy_slew_deliver_irq(RTCState *s)
>>>> +{
>>>> +    apic_reset_irq_delivered();
>>>> +    qemu_irq_raise(s->irq);
>>>> +    return apic_get_irq_delivered();
>>>> +}
>>>> +
>>>>    void pc_basic_device_init(struct PCMachineState *pcms,
>>>>                              ISABus *isa_bus, qemu_irq *gsi,
>>>>                              ISADevice **rtc_state,
>>>> @@ -1299,7 +1306,8 @@ void pc_basic_device_init(struct PCMachineState=
 *pcms,
>>>>            pit_alt_irq =3D qdev_get_gpio_in(hpet, HPET_LEGACY_PIT_INT=
);
>>>>            rtc_irq =3D qdev_get_gpio_in(hpet, HPET_LEGACY_RTC_INT);
>>>>        }
>>>> -    *rtc_state =3D mc146818_rtc_init(isa_bus, 2000, rtc_irq);
>>>> +    *rtc_state =3D mc146818_rtc_init(isa_bus, 2000, rtc_irq,
>>>> +                                   rtc_apic_policy_slew_deliver_irq)=
;
>>>>          qemu_register_boot_set(pc_boot_set, *rtc_state);
>>>>    diff --git a/hw/mips/jazz=2Ec b/hw/mips/jazz=2Ec
>>>> index 6aefe9a61b=2E=2E50fbd57b23 100644
>>>> --- a/hw/mips/jazz=2Ec
>>>> +++ b/hw/mips/jazz=2Ec
>>>> @@ -356,7 +356,7 @@ static void mips_jazz_init(MachineState *machine,
>>>>        fdctrl_init_sysbus(qdev_get_gpio_in(rc4030, 1), 0x80003000, fd=
s);
>>>>          /* Real time clock */
>>>> -    mc146818_rtc_init(isa_bus, 1980, NULL);
>>>> +    mc146818_rtc_init(isa_bus, 1980, NULL, NULL);
>>>>        memory_region_init_io(rtc, NULL, &rtc_ops, NULL, "rtc", 0x1000=
);
>>>>        memory_region_add_subregion(address_space, 0x80004000, rtc);
>>>>    diff --git a/hw/ppc/pnv=2Ec b/hw/ppc/pnv=2Ec
>>>> index 3d01e26f84=2E=2Ec5482554b7 100644
>>>> --- a/hw/ppc/pnv=2Ec
>>>> +++ b/hw/ppc/pnv=2Ec
>>>> @@ -992,7 +992,7 @@ static void pnv_init(MachineState *machine)
>>>>        serial_hds_isa_init(pnv->isa_bus, 0, MAX_ISA_SERIAL_PORTS);
>>>>          /* Create an RTC ISA device too */
>>>> -    mc146818_rtc_init(pnv->isa_bus, 2000, NULL);
>>>> +    mc146818_rtc_init(pnv->isa_bus, 2000, NULL, NULL);
>>>>          /*
>>>>         * Create the machine BMC simulator and the IPMI BT device for
>>>> diff --git a/hw/rtc/mc146818rtc=2Ec b/hw/rtc/mc146818rtc=2Ec
>>>> index 1ebb412479=2E=2E9543ae0279 100644
>>>> --- a/hw/rtc/mc146818rtc=2Ec
>>>> +++ b/hw/rtc/mc146818rtc=2Ec
>>>> @@ -44,11 +44,6 @@
>>>>    #include "qapi/visitor=2Eh"
>>>>    #include "hw/rtc/mc146818rtc_regs=2Eh"
>>>>    -#ifdef TARGET_I386
>>>> -#include "qapi/qapi-commands-misc-target=2Eh"
>>>> -#include "hw/i386/apic=2Eh"
>>>> -#endif
>>>> -
>>>>    //#define DEBUG_CMOS
>>>>    //#define DEBUG_COALESCED
>>>>    @@ -112,7 +107,6 @@ static void rtc_coalesced_timer_update(RTCStat=
e *s)
>>>>    static QLIST_HEAD(, RTCState) rtc_devices =3D
>>>>        QLIST_HEAD_INITIALIZER(rtc_devices);
>>>>    -#ifdef TARGET_I386
>>>>    void qmp_rtc_reset_reinjection(Error **errp)
>>>>    {
>>>>        RTCState *s;
>>>> @@ -124,9 +118,8 @@ void qmp_rtc_reset_reinjection(Error **errp)
>>>>      static bool rtc_policy_slew_deliver_irq(RTCState *s)
>>>>    {
>>>> -    apic_reset_irq_delivered();
>>>> -    qemu_irq_raise(s->irq);
>>>> -    return apic_get_irq_delivered();
>>>> +    assert(s->policy_slew_deliver_irq);
>>>> +    return s->policy_slew_deliver_irq(s);
>>>>    }
>>>>      static void rtc_coalesced_timer(void *opaque)
>>>> @@ -145,13 +138,6 @@ static void rtc_coalesced_timer(void *opaque)
>>>>          rtc_coalesced_timer_update(s);
>>>>    }
>>>> -#else
>>>> -static bool rtc_policy_slew_deliver_irq(RTCState *s)
>>>> -{
>>>> -    assert(0);
>>>> -    return false;
>>>> -}
>>>> -#endif
>>>>      static uint32_t rtc_periodic_clock_ticks(RTCState *s)
>>>>    {
>>>> @@ -922,14 +908,14 @@ static void rtc_realizefn(DeviceState *dev, Err=
or **errp)
>>>>        rtc_set_date_from_host(isadev);
>>>>          switch (s->lost_tick_policy) {
>>>> -#ifdef TARGET_I386
>>>> -    case LOST_TICK_POLICY_SLEW:
>>>> -        s->coalesced_timer =3D
>>>> -            timer_new_ns(rtc_clock, rtc_coalesced_timer, s);
>>>> -        break;
>>>> -#endif
>>>>        case LOST_TICK_POLICY_DISCARD:
>>>>            break;
>>>> +    case LOST_TICK_POLICY_SLEW:
>>>> +        if (s->policy_slew_deliver_irq) {
>>>> +            s->coalesced_timer =3D timer_new_ns(rtc_clock, rtc_coale=
sced_timer, s);
>>>> +            break;
>>>> +        }
>>>> +        /* fallthrough */
>>>>        default:
>>>>            error_setg(errp, "Invalid lost tick policy=2E");
>>>>            return;
>>>> @@ -960,7 +946,8 @@ static void rtc_realizefn(DeviceState *dev, Error=
 **errp)
>>>>        QLIST_INSERT_HEAD(&rtc_devices, s, link);
>>>>    }
>>>>    -ISADevice *mc146818_rtc_init(ISABus *bus, int base_year, qemu_irq=
 intercept_irq)
>>>> +ISADevice *mc146818_rtc_init(ISABus *bus, int base_year, qemu_irq in=
tercept_irq,
>>>> +                             bool (*policy_slew_deliver_irq)(RTCStat=
e *s))
>>>>    {
>>>>        DeviceState *dev;
>>>>        ISADevice *isadev;
>>>> @@ -969,6 +956,7 @@ ISADevice *mc146818_rtc_init(ISABus *bus, int bas=
e_year, qemu_irq intercept_irq)
>>>>        isadev =3D isa_new(TYPE_MC146818_RTC);
>>>>        dev =3D DEVICE(isadev);
>>>>        s =3D MC146818_RTC(isadev);
>>>> +    s->policy_slew_deliver_irq =3D policy_slew_deliver_irq;
>>>>        qdev_prop_set_int32(dev, "base_year", base_year);
>>>>        isa_realize_and_unref(isadev, bus, &error_fatal);
>>>>        if (intercept_irq) {
>>>> diff --git a/hw/rtc/meson=2Ebuild b/hw/rtc/meson=2Ebuild
>>>> index dc33973384=2E=2E34a4d316fa 100644
>>>> --- a/hw/rtc/meson=2Ebuild
>>>> +++ b/hw/rtc/meson=2Ebuild
>>>> @@ -13,5 +13,4 @@ softmmu_ss=2Eadd(when: 'CONFIG_ASPEED_SOC', if_true=
: files('aspeed_rtc=2Ec'))
>>>>    softmmu_ss=2Eadd(when: 'CONFIG_GOLDFISH_RTC', if_true: files('gold=
fish_rtc=2Ec'))
>>>>    softmmu_ss=2Eadd(when: 'CONFIG_LS7A_RTC', if_true: files('ls7a_rtc=
=2Ec'))
>>>>    softmmu_ss=2Eadd(when: 'CONFIG_ALLWINNER_H3', if_true: files('allw=
inner-rtc=2Ec'))
>>>> -
>>>> -specific_ss=2Eadd(when: 'CONFIG_MC146818RTC', if_true: files('mc1468=
18rtc=2Ec'))
>>>> +softmmu_ss=2Eadd(when: 'CONFIG_MC146818RTC', if_true: files('mc14681=
8rtc=2Ec'))
>>>=20
>>> Ouch this is quite a nasty one :/
>>>=20
>>> These days we really should try and avoid setting function pointers ou=
tside of _init() and class_init() where possible=2E If I were looking to mo=
del this today I'd probably try an approach like this:
>>>=20
>>> - Move apic_irq_delivered into APICCommonState
>>>=20
>>> - Define apic_reset_irq_delivered() and apic_get_irq_delivered() as fu=
nction pointers in APICCommonState and assign them to the current implement=
ations in apic_common_initfn() adding an APICCommonState parameter as requi=
red
>>>=20
>>> - Grab a reference to APICCommonState in mc146818rtc=2Ec's rtc_realize=
fn() using either an object property link or object_resolve_path_type("", T=
YPE_APIC_COMMON, NULL)
>>=20
>> AFAICS TYPE_APIC_COMMON is x86-specific which doesn't serve the point o=
f the patch well ;)
>
>Well you'd have to keep the hw/i386/apic=2Eh include for now, but this ap=
proach would move the APIC check from compile time to runtime so the RTC de=
vice should still work but without the slew functionality on non-x86 platfo=
rms=2E

I see=2E While this approach keeps the apic dependency it has the benefit =
to make the device target-agnostic=2E

>
>This is really following on from the BoF session at KVM forum and the fol=
low-up developers call (see https://lists=2Egnu=2Eorg/archive/html/qemu-dev=
el/2022-11/msg04491=2Ehtml) where discussions are ongoing about having a si=
ngle QEMU binary that can attach and wire up any device to an empty machine=
 via the monitor=2E
>
>In order for this to work the connections between devices needs to be don=
e using QOM and qdev APIs which means that function pointer properties cann=
ot be used=2E I believe someone (Markus?) went through the remaining functi=
on properties and removed them a while back, so we shouldn't be reintroduci=
ng them again here=2E

Right=2E This is why I wondered if this could be implemented by an IRQ han=
dler in board code which would be accessible by QOM/qdev=2E

>
>>> - Use "if (s->apic) { =2E=2E }" or similar in mc146818rtc=2Ec to guard=
 calling the apic_*() functions
>>=20
>> IMO mc146818rtc=2Ec shouldn't make any assumptions outside of its scope=
, especially not about any target specifics like an APIC=2E
>>=20
>> I wonder if we could somehow wire up the APIC handling in the x86 IRQ h=
andler=2E
>
>This may indeed be possible, please do let us know if you have any better=
 ideas=2E

Not right now, unfortunately=2E

I've tried to get rid of the intercept_irq parameter from the init method =
a while back but I eventually gave up=2E This device model is really a beas=
t=2E=2E=2E

> I would add that the good work you've been doing on PIIX3 and PIIX4 mean=
s that you've got a much better understanding of how the PC world fits toge=
ther compared to most people, so if you are interested in this I would defi=
nitely encourage you to contribute any ideas you may have and also join the=
 next developers call=2E

With my PIIX3 and PIIX4 work and even more so with my pc-via branch [1] I'=
m basically doing a bottom-up approach and could probably share some though=
ts and ideas=2E I'm already subscribed to the topic and joined the BOF at K=
VM forum remotely=2E I'm looking forward to the next one though I'd need at=
 least a day in advance to notice the call ;)

Best regards,
Bernhard

[1] https://github=2Ecom/shentok/qemu/commits/pc-via
>
>
>ATB,
>
>Mark=2E

