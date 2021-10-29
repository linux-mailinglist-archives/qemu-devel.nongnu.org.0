Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B5E43FD91
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 15:47:44 +0200 (CEST)
Received: from localhost ([::1]:34902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgSER-0004OM-1w
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 09:47:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mgSBt-0003Qq-Ci
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 09:45:05 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:52077)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mgSBo-0006WG-MR
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 09:45:04 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id B29D2748F57;
 Fri, 29 Oct 2021 15:44:55 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 7528D746333; Fri, 29 Oct 2021 15:44:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 72AFB7462D3;
 Fri, 29 Oct 2021 15:44:55 +0200 (CEST)
Date: Fri, 29 Oct 2021 15:44:55 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH v4 06/23] hw/char/sh_serial: QOM-ify
In-Reply-To: <571d2e30-ad0a-b225-e3aa-ee96d847daa9@amsat.org>
Message-ID: <6ef8d5f6-53b2-e942-6582-ef8176a68c3@eik.bme.hu>
References: <cover.1635449225.git.balaton@eik.bme.hu>
 <3208b60a33e3452b832089aecd5c1aed800eb6bc.1635449225.git.balaton@eik.bme.hu>
 <3a630845-7f67-7b45-db14-c72dc67c5b26@amsat.org>
 <4198235-e93d-ddde-fb63-edfe9bd422f4@eik.bme.hu>
 <571d2e30-ad0a-b225-e3aa-ee96d847daa9@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-405428266-1635515095=:74125"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>, qemu-devel@nongnu.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-405428266-1635515095=:74125
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Fri, 29 Oct 2021, Philippe Mathieu-Daudé wrote:
> On 10/29/21 14:15, BALATON Zoltan wrote:
>> On Fri, 29 Oct 2021, Philippe Mathieu-Daudé wrote:
>>> On 10/28/21 21:27, BALATON Zoltan wrote:
>>>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>>>> ---
>>>>  hw/char/sh_serial.c | 107 +++++++++++++++++++++++++++-----------------
>>>>  hw/sh4/sh7750.c     |  62 ++++++++++++++++++-------
>>>>  include/hw/sh4/sh.h |   9 +---
>>>>  3 files changed, 114 insertions(+), 64 deletions(-)
>>>
>>>> +OBJECT_DECLARE_SIMPLE_TYPE(SHSerialState, SH_SERIAL)
>>>> +
>>>> +struct SHSerialState {
>>>> +    SysBusDevice parent;
>>> [...]
>>>> -} SHSerialState;
>>>> +};
>>>> +
>>>> +typedef struct {} SHSerialStateClass;
>>>
>>> OBJECT_DECLARE_TYPE()?
>>
>> From include/qom/object.h:
>>  * OBJECT_DECLARE_SIMPLE_TYPE:
>> [...]
>>  * This does the same as OBJECT_DECLARE_TYPE(), but with no class struct
>>  * declared.
>>  *
>>  * This macro should be used unless the class struct needs to have
>>  * virtual methods declared.
>>
>> I think we're rather missing OBJECT_DEFINE_SIMPLE_TYPE. A lot of current
>> object definitions are open coded because of that and could be replaced
>> if we had that simple variant but we don't, so this is the shortest way
>> for now.
>>
>>>> -void sh_serial_init(MemoryRegion *sysmem,
>>>> -                    hwaddr base, int feat,
>>>> -                    uint32_t freq, Chardev *chr,
>>>> -                    qemu_irq eri_source,
>>>> -                    qemu_irq rxi_source,
>>>> -                    qemu_irq txi_source,
>>>> -                    qemu_irq tei_source,
>>>> -                    qemu_irq bri_source)
>>>> +static void sh_serial_reset(DeviceState *dev)
>>>
>>> Can you extract sh_serial_reset() in a previous patch?
>>
>> I could.
>>
>>>>  {
>>>> -    SHSerialState *s = g_malloc0(sizeof(*s));
>>>> +    SHSerialState *s = SH_SERIAL(dev);
>>>>
>>>> -    s->feat = feat;
>>>>      s->flags = SH_SERIAL_FLAG_TEND | SH_SERIAL_FLAG_TDE;
>>>>      s->rtrg = 1;
>>>>
>>>> @@ -397,38 +396,64 @@ void sh_serial_init(MemoryRegion *sysmem,
>>>>      s->scr = 1 << 5; /* pretend that TX is enabled so early printk
>>>> works */
>>>>      s->sptr = 0;
>>>>
>>>> -    if (feat & SH_SERIAL_FEAT_SCIF) {
>>>> +    if (s->feat & SH_SERIAL_FEAT_SCIF) {
>>>>          s->fcr = 0;
>>>>      } else {
>>>>          s->dr = 0xff;
>>>>      }
>>>>
>>>>      sh_serial_clear_fifo(s);
>>>> +}
>>>>
>>>> -    memory_region_init_io(&s->iomem, NULL, &sh_serial_ops, s,
>>>> -                          "serial", 0x100000000ULL);
>>>
>>> Keep that, ...
>>>
>>>> -    memory_region_init_alias(&s->iomem_p4, NULL, "serial-p4",
>>>> &s->iomem,
>>>> -                             0, 0x28);
>>>> -    memory_region_add_subregion(sysmem, P4ADDR(base), &s->iomem_p4);
>>>> -
>>>> -    memory_region_init_alias(&s->iomem_a7, NULL, "serial-a7",
>>>> &s->iomem,
>>>> -                             0, 0x28);
>>>> -    memory_region_add_subregion(sysmem, A7ADDR(base), &s->iomem_a7);
>>>
>>> ... and these lines become one single sysbus_init_mmio() ...
>>
>> Not sure about that. The device doesn't really have two io regions, they
>> just appear twice due to how the CPU maps them. So I'd keep a single
>> MMIO region here but could map one directly and use only one alias for
>> the other instead. (That would get rid of either serial-a7 or serial-p4
>> with the other just called serial or actually sci/scif after this series).
>
> Looking at the current mapping:
>
> memory-region: system
>  0000000000000000-ffffffffffffffff (prio 0, i/o): system
>    0000000000000000-0000000000ffffff (prio 0, romd): r2d.flash
>    0000000004000000-000000000400003f (prio 0, i/o): r2d-fpga
>    000000000c000000-000000000fffffff (prio 0, ram): r2d.sdram
>    0000000010000000-00000000107fffff (prio 0, ram): sm501.local
>    0000000013e00000-0000000013ffffff (prio 0, i/o): sm501.mmio
>      0000000013e00000-0000000013e0006b (prio 0, i/o): sm501-system-config
>      0000000013e10040-0000000013e10053 (prio 0, i/o): sm501-i2c
>      0000000013e30000-0000000013e3001f (prio 0, i/o): serial
>      0000000013e40000-0000000013e400ff (prio 0, i/o): ohci
>      0000000013e80000-0000000013e80fff (prio 0, i/o): sm501-disp-ctrl
>      0000000013f00000-0000000013f00053 (prio 0, i/o): sm501-2d-engine
>    000000001400080c-000000001400080f (prio 0, i/o): ide-mmio.2
>    0000000014001000-000000001400101f (prio 0, i/o): ide-mmio.1
>    000000001e080000-000000001e080003 (prio 0, i/o): alias
> interrupt-controller-prio-set-a7 @interrupt-controller
> 000000001e080000-000000001e080003
>    000000001e080040-000000001e080043 (prio 0, i/o): alias
> interrupt-controller-mask-set-a7 @interrupt-controller
> 000000001e080040-000000001e080043
>    000000001e080060-000000001e080063 (prio 0, i/o): alias
> interrupt-controller-mask-clr-a7 @interrupt-controller
> 000000001e080060-000000001e080063
>    000000001e100000-000000001e100fff (prio 0, i/o): alias timer-a7
> @timer 0000000000000000-0000000000000fff
>    000000001e200000-000000001e200223 (prio 0, i/o): alias sh_pci.2
> @sh_pci 0000000000000000-0000000000000223
>    000000001f000000-000000001f000fff (prio 0, i/o): alias memory-1f0
> @memory 000000001f000000-000000001f000fff
>    000000001f800000-000000001f800fff (prio 0, i/o): alias memory-1f8
> @memory 000000001f800000-000000001f800fff
>    000000001fc00000-000000001fc00fff (prio 0, i/o): alias memory-1fc
> @memory 000000001fc00000-000000001fc00fff
>    000000001fd00004-000000001fd00007 (prio 0, i/o): alias
> interrupt-controller-prio-set-a7 @interrupt-controller
> 000000001fd00004-000000001fd00007
>    000000001fd00008-000000001fd0000b (prio 0, i/o): alias
> interrupt-controller-prio-set-a7 @interrupt-controller
> 000000001fd00008-000000001fd0000b
>    000000001fd0000c-000000001fd0000f (prio 0, i/o): alias
> interrupt-controller-prio-set-a7 @interrupt-controller
> 000000001fd0000c-000000001fd0000f
>    000000001fd00010-000000001fd00013 (prio 0, i/o): alias
> interrupt-controller-prio-set-a7 @interrupt-controller
> 000000001fd00010-000000001fd00013
>    000000001fd80000-000000001fd80fff (prio 0, i/o): alias timer-a7
> @timer 0000000000000000-0000000000000fff
>    000000001fe00000-000000001fe00027 (prio 0, i/o): alias serial-a7
> @serial 0000000000000000-0000000000000027
>    000000001fe80000-000000001fe80027 (prio 0, i/o): alias serial-a7
> @serial 0000000000000000-0000000000000027
>    00000000f0000000-00000000f7ffffff (prio 0, i/o): cache-and-tlb
>    00000000fe080000-00000000fe080003 (prio 0, i/o): alias
> interrupt-controller-prio-set-p4 @interrupt-controller
> 000000001e080000-000000001e080003
>    00000000fe080040-00000000fe080043 (prio 0, i/o): alias
> interrupt-controller-mask-set-p4 @interrupt-controller
> 000000001e080040-000000001e080043
>    00000000fe080060-00000000fe080063 (prio 0, i/o): alias
> interrupt-controller-mask-clr-p4 @interrupt-controller
> 000000001e080060-000000001e080063
>    00000000fe100000-00000000fe100fff (prio 0, i/o): alias timer-p4
> @timer 0000000000000000-0000000000000fff
>    00000000fe200000-00000000fe200223 (prio 0, i/o): sh_pci
>    00000000fe240000-00000000fe27ffff (prio 0, i/o): alias sh_pci.isa
> @io 0000000000000000-000000000003ffff
>    00000000ff000000-00000000ff000fff (prio 0, i/o): alias memory-ff0
> @memory 000000001f000000-000000001f000fff
>    00000000ff800000-00000000ff800fff (prio 0, i/o): alias memory-ff8
> @memory 000000001f800000-000000001f800fff
>    00000000ffc00000-00000000ffc00fff (prio 0, i/o): alias memory-ffc
> @memory 000000001fc00000-000000001fc00fff
>    00000000ffd00004-00000000ffd00007 (prio 0, i/o): alias
> interrupt-controller-prio-set-p4 @interrupt-controller
> 000000001fd00004-000000001fd00007
>    00000000ffd00008-00000000ffd0000b (prio 0, i/o): alias
> interrupt-controller-prio-set-p4 @interrupt-controller
> 000000001fd00008-000000001fd0000b
>    00000000ffd0000c-00000000ffd0000f (prio 0, i/o): alias
> interrupt-controller-prio-set-p4 @interrupt-controller
> 000000001fd0000c-000000001fd0000f
>    00000000ffd00010-00000000ffd00013 (prio 0, i/o): alias
> interrupt-controller-prio-set-p4 @interrupt-controller
> 000000001fd00010-000000001fd00013
>    00000000ffd80000-00000000ffd80fff (prio 0, i/o): alias timer-p4
> @timer 0000000000000000-0000000000000fff
>    00000000ffe00000-00000000ffe00027 (prio 0, i/o): alias serial-p4
> @serial 0000000000000000-0000000000000027
>    00000000ffe80000-00000000ffe80027 (prio 0, i/o): alias serial-p4
> @serial 0000000000000000-0000000000000027
>
> It seems the 32MiB container region in 0x1e000000-0x1fffffff is
> aliased to 0xfe000000-0xffffffff. But I haven't looked at the
> datasheet (and don't have time until next week).

All regs are available at two addresses. The P regions are similar to 
MIPS' ksegs, the A7 is only accessible via MMU while P4 is I think only in 
protected mode but I also don't know all the details so I'd just leave it 
as it is for now. This could be cleaned up later in separete patches, I 
think there will be more clean ups needed as I've also found missing 
functionality that I plan to look at later but I'd like the clean ups 
merged before the freeze at least so I have less patches to roll in my 
tree.

Regards,
BALATON Zoltan
--3866299591-405428266-1635515095=:74125--

