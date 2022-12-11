Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D45AE6493DF
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Dec 2022 12:24:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4KPo-0000Ww-Mf; Sun, 11 Dec 2022 06:22:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1p4KPl-0000Wm-Qj
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 06:22:38 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1p4KPi-0002G7-AU
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 06:22:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Aezxf0a90pyR1mNfeMpc8caFqnzmg6XaJFOcDfz0NQE=; b=CEJ4HiLZGUdS4wMwznkWZwLCjs
 SeSZ4kjnkuH3LtTDVBgx92DpgFbgqjAjUS5bpREClgXX0NDACcUXKx8H2NgZo1Q8/Uy9FDP/U1a8S
 h534FrFBw+hTrKK0m5x1umsa5bN3EemHubJJL9fO9Ck8YAG1iM+iH37lZwkXnqRTSF0mpBwC5S/6r
 hwPknFv33cyhWO0V7Rzp+y84v8qiBnQ+8DtZ7qffifETeeebDiB0+kWcst5j3D8mVJOvLRf+5Nklz
 AdzZ/Ne6o6qnOn7h79QaRu6i2phNHA/TMPlvmV2Ix0Hf17UGqU/BYiGc4j+0qwawAxQvvc8nONWgj
 ntv3PELkdv0UtQEEzf7kgNf3nY0Vjch348XrxPMLG4xIQTN9d3RVZTUZ52bqHiu2QrDFuTQNhyiMN
 7dStcEs7hVJ8Ekg1UNtm6sB6afmFrfHxkdK6fQRrZrYEkt+IHfFPg5zP9w65wdMFSRLrMABmUEXSa
 tlRSCYgYZvoo8BTYnaOox8hdsHCUNc6D4OrRruI/0kRl1Scr1BfRcO2/XDO/OMtb73dSSn00gesf7
 lPbFcM1z4e0BxM0L6NXbo3QrQK+R7hSeRLZgb9r6/GOWtuKkN4mWiSrCyhO+PsavzW8jMaMpPbQwW
 LurhXAZz9KXsYP3JNWmB4CaT3XeYVZXOrh1GNVKRE=;
Received: from [2a00:23c4:8ba9:9200:322a:ac7b:c3c3:b65b]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1p4KPP-00061E-1k; Sun, 11 Dec 2022 11:22:19 +0000
Message-ID: <5cad967c-a33c-556f-dfad-1d83a1a31b6d@ilande.co.uk>
Date: Sun, 11 Dec 2022 11:22:18 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Michael S Tsirkin <mst@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
References: <20221206200641.339116-1-thuth@redhat.com>
 <8f0b1154-5d40-f098-ef1d-cd2a50145529@ilande.co.uk>
 <A57CC4A0-A141-4A4A-A49F-E5F0F7D4B52A@gmail.com>
 <d7942ee6-19c9-b06d-c74f-4d80d3cb1d00@ilande.co.uk>
 <D0F08E05-9C0A-41CE-8598-9953CA105E5C@gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <D0F08E05-9C0A-41CE-8598-9953CA105E5C@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba9:9200:322a:ac7b:c3c3:b65b
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH for-8.0] hw/rtc/mc146818rtc: Make this rtc device target
 independent
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.288,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 11/12/2022 10:27, Bernhard Beschow wrote:

> Am 7. Dezember 2022 17:47:48 UTC schrieb Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>:
>> On 07/12/2022 16:20, Bernhard Beschow wrote:
>>
>>> Am 7. Dezember 2022 15:29:00 UTC schrieb Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>:
>>>> On 06/12/2022 20:06, Thomas Huth wrote:
>>>>
>>>>> The only code that is really, really target dependent is the apic-related
>>>>> code in rtc_policy_slew_deliver_irq(). By moving this code into the hw/i386/
>>>>> folder (renamed to rtc_apic_policy_slew_deliver_irq()) and passing this
>>>>> function as parameter to mc146818_rtc_init(), we can make the RTC completely
>>>>> target-independent.
>>>>>
>>>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>>>> ---
>>>>>     include/hw/rtc/mc146818rtc.h |  7 +++++--
>>>>>     hw/alpha/dp264.c             |  2 +-
>>>>>     hw/hppa/machine.c            |  2 +-
>>>>>     hw/i386/microvm.c            |  3 ++-
>>>>>     hw/i386/pc.c                 | 10 +++++++++-
>>>>>     hw/mips/jazz.c               |  2 +-
>>>>>     hw/ppc/pnv.c                 |  2 +-
>>>>>     hw/rtc/mc146818rtc.c         | 34 +++++++++++-----------------------
>>>>>     hw/rtc/meson.build           |  3 +--
>>>>>     9 files changed, 32 insertions(+), 33 deletions(-)
>>>>>
>>>>> diff --git a/include/hw/rtc/mc146818rtc.h b/include/hw/rtc/mc146818rtc.h
>>>>> index 1db0fcee92..c687953cc4 100644
>>>>> --- a/include/hw/rtc/mc146818rtc.h
>>>>> +++ b/include/hw/rtc/mc146818rtc.h
>>>>> @@ -46,14 +46,17 @@ struct RTCState {
>>>>>         Notifier clock_reset_notifier;
>>>>>         LostTickPolicy lost_tick_policy;
>>>>>         Notifier suspend_notifier;
>>>>> +    bool (*policy_slew_deliver_irq)(RTCState *s);
>>>>>         QLIST_ENTRY(RTCState) link;
>>>>>     };
>>>>>       #define RTC_ISA_IRQ 8
>>>>>     -ISADevice *mc146818_rtc_init(ISABus *bus, int base_year,
>>>>> -                             qemu_irq intercept_irq);
>>>>> +ISADevice *mc146818_rtc_init(ISABus *bus, int base_year, qemu_irq intercept_irq,
>>>>> +                             bool (*policy_slew_deliver_irq)(RTCState *s));
>>>>>     void rtc_set_memory(ISADevice *dev, int addr, int val);
>>>>>     int rtc_get_memory(ISADevice *dev, int addr);
>>>>> +bool rtc_apic_policy_slew_deliver_irq(RTCState *s);
>>>>> +void qmp_rtc_reset_reinjection(Error **errp);
>>>>>       #endif /* HW_RTC_MC146818RTC_H */
>>>>> diff --git a/hw/alpha/dp264.c b/hw/alpha/dp264.c
>>>>> index c502c8c62a..8723942b52 100644
>>>>> --- a/hw/alpha/dp264.c
>>>>> +++ b/hw/alpha/dp264.c
>>>>> @@ -118,7 +118,7 @@ static void clipper_init(MachineState *machine)
>>>>>         qdev_connect_gpio_out(i82378_dev, 0, isa_irq);
>>>>>           /* Since we have an SRM-compatible PALcode, use the SRM epoch.  */
>>>>> -    mc146818_rtc_init(isa_bus, 1900, rtc_irq);
>>>>> +    mc146818_rtc_init(isa_bus, 1900, rtc_irq, NULL);
>>>>>           /* VGA setup.  Don't bother loading the bios.  */
>>>>>         pci_vga_init(pci_bus);
>>>>> diff --git a/hw/hppa/machine.c b/hw/hppa/machine.c
>>>>> index de1cc7ab71..311031714a 100644
>>>>> --- a/hw/hppa/machine.c
>>>>> +++ b/hw/hppa/machine.c
>>>>> @@ -232,7 +232,7 @@ static void machine_hppa_init(MachineState *machine)
>>>>>         assert(isa_bus);
>>>>>           /* Realtime clock, used by firmware for PDC_TOD call. */
>>>>> -    mc146818_rtc_init(isa_bus, 2000, NULL);
>>>>> +    mc146818_rtc_init(isa_bus, 2000, NULL, NULL);
>>>>>           /* Serial ports: Lasi and Dino use a 7.272727 MHz clock. */
>>>>>         serial_mm_init(addr_space, LASI_UART_HPA + 0x800, 0,
>>>>> diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
>>>>> index 170a331e3f..d0ed4dca50 100644
>>>>> --- a/hw/i386/microvm.c
>>>>> +++ b/hw/i386/microvm.c
>>>>> @@ -267,7 +267,8 @@ static void microvm_devices_init(MicrovmMachineState *mms)
>>>>>           if (mms->rtc == ON_OFF_AUTO_ON ||
>>>>>             (mms->rtc == ON_OFF_AUTO_AUTO && !kvm_enabled())) {
>>>>> -        rtc_state = mc146818_rtc_init(isa_bus, 2000, NULL);
>>>>> +        rtc_state = mc146818_rtc_init(isa_bus, 2000, NULL,
>>>>> +                                      rtc_apic_policy_slew_deliver_irq);
>>>>>             microvm_set_rtc(mms, rtc_state);
>>>>>         }
>>>>>     diff --git a/hw/i386/pc.c b/hw/i386/pc.c
>>>>> index 546b703cb4..650e7bc199 100644
>>>>> --- a/hw/i386/pc.c
>>>>> +++ b/hw/i386/pc.c
>>>>> @@ -1244,6 +1244,13 @@ static void pc_superio_init(ISABus *isa_bus, bool create_fdctrl,
>>>>>         g_free(a20_line);
>>>>>     }
>>>>>     +bool rtc_apic_policy_slew_deliver_irq(RTCState *s)
>>>>> +{
>>>>> +    apic_reset_irq_delivered();
>>>>> +    qemu_irq_raise(s->irq);
>>>>> +    return apic_get_irq_delivered();
>>>>> +}
>>>>> +
>>>>>     void pc_basic_device_init(struct PCMachineState *pcms,
>>>>>                               ISABus *isa_bus, qemu_irq *gsi,
>>>>>                               ISADevice **rtc_state,
>>>>> @@ -1299,7 +1306,8 @@ void pc_basic_device_init(struct PCMachineState *pcms,
>>>>>             pit_alt_irq = qdev_get_gpio_in(hpet, HPET_LEGACY_PIT_INT);
>>>>>             rtc_irq = qdev_get_gpio_in(hpet, HPET_LEGACY_RTC_INT);
>>>>>         }
>>>>> -    *rtc_state = mc146818_rtc_init(isa_bus, 2000, rtc_irq);
>>>>> +    *rtc_state = mc146818_rtc_init(isa_bus, 2000, rtc_irq,
>>>>> +                                   rtc_apic_policy_slew_deliver_irq);
>>>>>           qemu_register_boot_set(pc_boot_set, *rtc_state);
>>>>>     diff --git a/hw/mips/jazz.c b/hw/mips/jazz.c
>>>>> index 6aefe9a61b..50fbd57b23 100644
>>>>> --- a/hw/mips/jazz.c
>>>>> +++ b/hw/mips/jazz.c
>>>>> @@ -356,7 +356,7 @@ static void mips_jazz_init(MachineState *machine,
>>>>>         fdctrl_init_sysbus(qdev_get_gpio_in(rc4030, 1), 0x80003000, fds);
>>>>>           /* Real time clock */
>>>>> -    mc146818_rtc_init(isa_bus, 1980, NULL);
>>>>> +    mc146818_rtc_init(isa_bus, 1980, NULL, NULL);
>>>>>         memory_region_init_io(rtc, NULL, &rtc_ops, NULL, "rtc", 0x1000);
>>>>>         memory_region_add_subregion(address_space, 0x80004000, rtc);
>>>>>     diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
>>>>> index 3d01e26f84..c5482554b7 100644
>>>>> --- a/hw/ppc/pnv.c
>>>>> +++ b/hw/ppc/pnv.c
>>>>> @@ -992,7 +992,7 @@ static void pnv_init(MachineState *machine)
>>>>>         serial_hds_isa_init(pnv->isa_bus, 0, MAX_ISA_SERIAL_PORTS);
>>>>>           /* Create an RTC ISA device too */
>>>>> -    mc146818_rtc_init(pnv->isa_bus, 2000, NULL);
>>>>> +    mc146818_rtc_init(pnv->isa_bus, 2000, NULL, NULL);
>>>>>           /*
>>>>>          * Create the machine BMC simulator and the IPMI BT device for
>>>>> diff --git a/hw/rtc/mc146818rtc.c b/hw/rtc/mc146818rtc.c
>>>>> index 1ebb412479..9543ae0279 100644
>>>>> --- a/hw/rtc/mc146818rtc.c
>>>>> +++ b/hw/rtc/mc146818rtc.c
>>>>> @@ -44,11 +44,6 @@
>>>>>     #include "qapi/visitor.h"
>>>>>     #include "hw/rtc/mc146818rtc_regs.h"
>>>>>     -#ifdef TARGET_I386
>>>>> -#include "qapi/qapi-commands-misc-target.h"
>>>>> -#include "hw/i386/apic.h"
>>>>> -#endif
>>>>> -
>>>>>     //#define DEBUG_CMOS
>>>>>     //#define DEBUG_COALESCED
>>>>>     @@ -112,7 +107,6 @@ static void rtc_coalesced_timer_update(RTCState *s)
>>>>>     static QLIST_HEAD(, RTCState) rtc_devices =
>>>>>         QLIST_HEAD_INITIALIZER(rtc_devices);
>>>>>     -#ifdef TARGET_I386
>>>>>     void qmp_rtc_reset_reinjection(Error **errp)
>>>>>     {
>>>>>         RTCState *s;
>>>>> @@ -124,9 +118,8 @@ void qmp_rtc_reset_reinjection(Error **errp)
>>>>>       static bool rtc_policy_slew_deliver_irq(RTCState *s)
>>>>>     {
>>>>> -    apic_reset_irq_delivered();
>>>>> -    qemu_irq_raise(s->irq);
>>>>> -    return apic_get_irq_delivered();
>>>>> +    assert(s->policy_slew_deliver_irq);
>>>>> +    return s->policy_slew_deliver_irq(s);
>>>>>     }
>>>>>       static void rtc_coalesced_timer(void *opaque)
>>>>> @@ -145,13 +138,6 @@ static void rtc_coalesced_timer(void *opaque)
>>>>>           rtc_coalesced_timer_update(s);
>>>>>     }
>>>>> -#else
>>>>> -static bool rtc_policy_slew_deliver_irq(RTCState *s)
>>>>> -{
>>>>> -    assert(0);
>>>>> -    return false;
>>>>> -}
>>>>> -#endif
>>>>>       static uint32_t rtc_periodic_clock_ticks(RTCState *s)
>>>>>     {
>>>>> @@ -922,14 +908,14 @@ static void rtc_realizefn(DeviceState *dev, Error **errp)
>>>>>         rtc_set_date_from_host(isadev);
>>>>>           switch (s->lost_tick_policy) {
>>>>> -#ifdef TARGET_I386
>>>>> -    case LOST_TICK_POLICY_SLEW:
>>>>> -        s->coalesced_timer =
>>>>> -            timer_new_ns(rtc_clock, rtc_coalesced_timer, s);
>>>>> -        break;
>>>>> -#endif
>>>>>         case LOST_TICK_POLICY_DISCARD:
>>>>>             break;
>>>>> +    case LOST_TICK_POLICY_SLEW:
>>>>> +        if (s->policy_slew_deliver_irq) {
>>>>> +            s->coalesced_timer = timer_new_ns(rtc_clock, rtc_coalesced_timer, s);
>>>>> +            break;
>>>>> +        }
>>>>> +        /* fallthrough */
>>>>>         default:
>>>>>             error_setg(errp, "Invalid lost tick policy.");
>>>>>             return;
>>>>> @@ -960,7 +946,8 @@ static void rtc_realizefn(DeviceState *dev, Error **errp)
>>>>>         QLIST_INSERT_HEAD(&rtc_devices, s, link);
>>>>>     }
>>>>>     -ISADevice *mc146818_rtc_init(ISABus *bus, int base_year, qemu_irq intercept_irq)
>>>>> +ISADevice *mc146818_rtc_init(ISABus *bus, int base_year, qemu_irq intercept_irq,
>>>>> +                             bool (*policy_slew_deliver_irq)(RTCState *s))
>>>>>     {
>>>>>         DeviceState *dev;
>>>>>         ISADevice *isadev;
>>>>> @@ -969,6 +956,7 @@ ISADevice *mc146818_rtc_init(ISABus *bus, int base_year, qemu_irq intercept_irq)
>>>>>         isadev = isa_new(TYPE_MC146818_RTC);
>>>>>         dev = DEVICE(isadev);
>>>>>         s = MC146818_RTC(isadev);
>>>>> +    s->policy_slew_deliver_irq = policy_slew_deliver_irq;
>>>>>         qdev_prop_set_int32(dev, "base_year", base_year);
>>>>>         isa_realize_and_unref(isadev, bus, &error_fatal);
>>>>>         if (intercept_irq) {
>>>>> diff --git a/hw/rtc/meson.build b/hw/rtc/meson.build
>>>>> index dc33973384..34a4d316fa 100644
>>>>> --- a/hw/rtc/meson.build
>>>>> +++ b/hw/rtc/meson.build
>>>>> @@ -13,5 +13,4 @@ softmmu_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files('aspeed_rtc.c'))
>>>>>     softmmu_ss.add(when: 'CONFIG_GOLDFISH_RTC', if_true: files('goldfish_rtc.c'))
>>>>>     softmmu_ss.add(when: 'CONFIG_LS7A_RTC', if_true: files('ls7a_rtc.c'))
>>>>>     softmmu_ss.add(when: 'CONFIG_ALLWINNER_H3', if_true: files('allwinner-rtc.c'))
>>>>> -
>>>>> -specific_ss.add(when: 'CONFIG_MC146818RTC', if_true: files('mc146818rtc.c'))
>>>>> +softmmu_ss.add(when: 'CONFIG_MC146818RTC', if_true: files('mc146818rtc.c'))
>>>>
>>>> Ouch this is quite a nasty one :/
>>>>
>>>> These days we really should try and avoid setting function pointers outside of _init() and class_init() where possible. If I were looking to model this today I'd probably try an approach like this:
>>>>
>>>> - Move apic_irq_delivered into APICCommonState
>>>>
>>>> - Define apic_reset_irq_delivered() and apic_get_irq_delivered() as function pointers in APICCommonState and assign them to the current implementations in apic_common_initfn() adding an APICCommonState parameter as required
>>>>
>>>> - Grab a reference to APICCommonState in mc146818rtc.c's rtc_realizefn() using either an object property link or object_resolve_path_type("", TYPE_APIC_COMMON, NULL)
>>>
>>> AFAICS TYPE_APIC_COMMON is x86-specific which doesn't serve the point of the patch well ;)
>>
>> Well you'd have to keep the hw/i386/apic.h include for now, but this approach would move the APIC check from compile time to runtime so the RTC device should still work but without the slew functionality on non-x86 platforms.
> 
> I see. While this approach keeps the apic dependency it has the benefit to make the device target-agnostic.

Indeed, which should help Thomas achieve is goal. I'm sure with more work there could 
be a much better solution though.

>> This is really following on from the BoF session at KVM forum and the follow-up developers call (see https://lists.gnu.org/archive/html/qemu-devel/2022-11/msg04491.html) where discussions are ongoing about having a single QEMU binary that can attach and wire up any device to an empty machine via the monitor.
>>
>> In order for this to work the connections between devices needs to be done using QOM and qdev APIs which means that function pointer properties cannot be used. I believe someone (Markus?) went through the remaining function properties and removed them a while back, so we shouldn't be reintroducing them again here.
> 
> Right. This is why I wondered if this could be implemented by an IRQ handler in board code which would be accessible by QOM/qdev.

As you're not doubt already aware, the problem here is that the IRQ handlers don't 
return a value and that's why I was thinking one solution might be to use function 
methods on the APIC_COMMON object.

>>>> - Use "if (s->apic) { .. }" or similar in mc146818rtc.c to guard calling the apic_*() functions
>>>
>>> IMO mc146818rtc.c shouldn't make any assumptions outside of its scope, especially not about any target specifics like an APIC.
>>>
>>> I wonder if we could somehow wire up the APIC handling in the x86 IRQ handler.
>>
>> This may indeed be possible, please do let us know if you have any better ideas.
> 
> Not right now, unfortunately.
> 
> I've tried to get rid of the intercept_irq parameter from the init method a while back but I eventually gave up. This device model is really a beast...

Yeah. The problem here is that the gpio is handled differently depending upon whether 
the device is connected to an ISA bus or not, and that is mostly driven by the 
concept that only devices and not buses can have gpios.

My latest idea was to use something similar for ISA as I have done for Nubus which 
you can see at 
https://gitlab.com/qemu-project/qemu/-/blob/master/hw/nubus/nubus-bridge.c. Here a 
qdev bridge device is used which simply maps to the underlying bus IRQs onto gpios so 
they can be wired up using qdev.

IIRC for this to work for ISA it was necessary to ensure that all ISA buses 
instantiated via isa_bus_new() were only instantiated as part of a device, and not as 
a standalone bus. Some review of the code suggested that it wouldn't be to difficult 
to do this for PCI devices, since there is generally already a PCI-ISA bridge or PCI 
host bridge device around that can already be used.

Identifying the places where this needs to be done is easy, since they are the places 
where isa_bus_new() is called with a NULL first parameter. Once this been done the 
optional ISA bridge instantiation at 
https://gitlab.com/qemu-project/qemu/-/blob/master/hw/isa/isa-bus.c#L60 can be removed.

The next problem I found was that x86 machines didn't have a ISA bridge device, but 
that can easily be fixed: take the existing "isabus-bridge" device and formalise it 
into an X86_ISA_BRIDGE device which is explicitly instantiated for all the PC machines.

The above was done with just a few hours of tinkering: from memory the problem I hit 
next was to do with the PIC wiring at which point I gave up. However your pc-via 
series may help here, and indeed this approach may help allow for the removal of your 
proxy PIC device since this is effectively the same problem. And with this approach 
it should be easier to remove to global isa_bus reference and allow multiple ISA 
buses in a machine which was another goal you were trying to achieve.

I hope this gives you an idea as to the direction I think this should go. And I can 
only apologise that due to a change in life and work circumstances my QEMU time is 
currently limited in short term which is why I haven't been able to do a review of 
your pc-via series :/

>> I would add that the good work you've been doing on PIIX3 and PIIX4 means that you've got a much better understanding of how the PC world fits together compared to most people, so if you are interested in this I would definitely encourage you to contribute any ideas you may have and also join the next developers call.
> 
> With my PIIX3 and PIIX4 work and even more so with my pc-via branch [1] I'm basically doing a bottom-up approach and could probably share some thoughts and ideas. I'm already subscribed to the topic and joined the BOF at KVM forum remotely. I'm looking forward to the next one though I'd need at least a day in advance to notice the call ;)

That would be great! And yes, I was also unable to attend the call but I think the 
plan was for someone on the call to post a summary to the qemu-devel list afterwards?


ATB,

Mark.

