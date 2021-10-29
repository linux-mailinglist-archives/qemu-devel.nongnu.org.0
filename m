Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B372043FD50
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 15:26:43 +0200 (CEST)
Received: from localhost ([::1]:44276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgRu6-0007HC-Ry
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 09:26:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgRso-0005eP-Kk
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 09:25:22 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:54809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgRsm-000541-Am
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 09:25:22 -0400
Received: by mail-wm1-x32e.google.com with SMTP id 71so6556153wma.4
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 06:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rP/ts6IvNC30tDbT2Y9EXWecwvk99JjdznGbAoXRbCs=;
 b=qGd04MP+N7uAHqnntXcdYZiv36ano7LzeGxbPXq6XDaaAviFL9FntRtPu9YD/doa8t
 OB2mdSoESnV8RSP3qa6RPQXSXvFGkPswgGyLYBp1/Ux0Hs+/HePRIvWevT22YOzLf51i
 MvR1BQP7rcCev88LTMj3k7s+VUBeTesGp2VnoqBLa5p/Nre8Zj8LAXPMvXh6fFqpaFAZ
 a3psVkqMvhS5iadDVmKIxk69NKQ1GwM/tMA52+Rluem4Oyg1y+TME9QJk5XZpWdeTAlm
 tYLfWQ0n4G0ElpMHQ+nGsgLpDziBuqD53kPrbnCtFSwuQNid7G3hove5xkqwzfavJc4u
 CmfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rP/ts6IvNC30tDbT2Y9EXWecwvk99JjdznGbAoXRbCs=;
 b=AM7x0w66UAViNz6fZ9gJ8LXAVHBkLA56iAZwAqEwt3FLqL5n2vyXhkvIEKlpHuRuJH
 puYlYp9J4NpgJxPCBhQtFFZoU5besQI9IiM+mw5JdW8bsS8C6DVaL1N4Qjlnmzv7K4Ti
 5WkUJaDUi+2P9RuovN7YQMgfiaRC4OtdODodLrUKO5xeZDxXPqqAI+jq5Di3J/Vaz0Ys
 nyWs1uTUAryP/uw0Y8h4OrjR2J5yKW3EvPD7eclMOaZFmayda/9YbK89izKDJvVd8qRM
 mtDvmrbuuVfJ7Q63XKnv5QaidtjTApTrPa0zsgb3u/UQSpFogK+kg94yqQ0hvzsm17vl
 6jsw==
X-Gm-Message-State: AOAM530ywtw/3ShOqV3tuD+OYr4GiVRLcJcWUXFqYq9NXvJanaBY30+G
 DbofYGedtwHn6wAuc1l/x/g=
X-Google-Smtp-Source: ABdhPJwmryphLCxyP3ww/gz7JKgjxA4MYOwQDlbP8XIQsc/nyXO0AS9tsy5KdRtTG5ulW1ZOUI7TtQ==
X-Received: by 2002:a05:600c:4303:: with SMTP id
 p3mr8688606wme.128.1635513918661; 
 Fri, 29 Oct 2021 06:25:18 -0700 (PDT)
Received: from [192.168.20.130] (192.red-83-57-30.dynamicip.rima-tde.net.
 [83.57.30.192])
 by smtp.gmail.com with ESMTPSA id l124sm9343255wml.8.2021.10.29.06.25.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Oct 2021 06:25:18 -0700 (PDT)
Message-ID: <571d2e30-ad0a-b225-e3aa-ee96d847daa9@amsat.org>
Date: Fri, 29 Oct 2021 15:25:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 06/23] hw/char/sh_serial: QOM-ify
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>
References: <cover.1635449225.git.balaton@eik.bme.hu>
 <3208b60a33e3452b832089aecd5c1aed800eb6bc.1635449225.git.balaton@eik.bme.hu>
 <3a630845-7f67-7b45-db14-c72dc67c5b26@amsat.org>
 <4198235-e93d-ddde-fb63-edfe9bd422f4@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <4198235-e93d-ddde-fb63-edfe9bd422f4@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.512,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 10/29/21 14:15, BALATON Zoltan wrote:
> On Fri, 29 Oct 2021, Philippe Mathieu-Daudé wrote:
>> On 10/28/21 21:27, BALATON Zoltan wrote:
>>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>>> ---
>>>  hw/char/sh_serial.c | 107 +++++++++++++++++++++++++++-----------------
>>>  hw/sh4/sh7750.c     |  62 ++++++++++++++++++-------
>>>  include/hw/sh4/sh.h |   9 +---
>>>  3 files changed, 114 insertions(+), 64 deletions(-)
>>
>>> +OBJECT_DECLARE_SIMPLE_TYPE(SHSerialState, SH_SERIAL)
>>> +
>>> +struct SHSerialState {
>>> +    SysBusDevice parent;
>> [...]
>>> -} SHSerialState;
>>> +};
>>> +
>>> +typedef struct {} SHSerialStateClass;
>>
>> OBJECT_DECLARE_TYPE()?
> 
> From include/qom/object.h:
>  * OBJECT_DECLARE_SIMPLE_TYPE:
> [...]
>  * This does the same as OBJECT_DECLARE_TYPE(), but with no class struct
>  * declared.
>  *
>  * This macro should be used unless the class struct needs to have
>  * virtual methods declared.
> 
> I think we're rather missing OBJECT_DEFINE_SIMPLE_TYPE. A lot of current
> object definitions are open coded because of that and could be replaced
> if we had that simple variant but we don't, so this is the shortest way
> for now.
> 
>>> -void sh_serial_init(MemoryRegion *sysmem,
>>> -                    hwaddr base, int feat,
>>> -                    uint32_t freq, Chardev *chr,
>>> -                    qemu_irq eri_source,
>>> -                    qemu_irq rxi_source,
>>> -                    qemu_irq txi_source,
>>> -                    qemu_irq tei_source,
>>> -                    qemu_irq bri_source)
>>> +static void sh_serial_reset(DeviceState *dev)
>>
>> Can you extract sh_serial_reset() in a previous patch?
> 
> I could.
> 
>>>  {
>>> -    SHSerialState *s = g_malloc0(sizeof(*s));
>>> +    SHSerialState *s = SH_SERIAL(dev);
>>>
>>> -    s->feat = feat;
>>>      s->flags = SH_SERIAL_FLAG_TEND | SH_SERIAL_FLAG_TDE;
>>>      s->rtrg = 1;
>>>
>>> @@ -397,38 +396,64 @@ void sh_serial_init(MemoryRegion *sysmem,
>>>      s->scr = 1 << 5; /* pretend that TX is enabled so early printk
>>> works */
>>>      s->sptr = 0;
>>>
>>> -    if (feat & SH_SERIAL_FEAT_SCIF) {
>>> +    if (s->feat & SH_SERIAL_FEAT_SCIF) {
>>>          s->fcr = 0;
>>>      } else {
>>>          s->dr = 0xff;
>>>      }
>>>
>>>      sh_serial_clear_fifo(s);
>>> +}
>>>
>>> -    memory_region_init_io(&s->iomem, NULL, &sh_serial_ops, s,
>>> -                          "serial", 0x100000000ULL);
>>
>> Keep that, ...
>>
>>> -    memory_region_init_alias(&s->iomem_p4, NULL, "serial-p4",
>>> &s->iomem,
>>> -                             0, 0x28);
>>> -    memory_region_add_subregion(sysmem, P4ADDR(base), &s->iomem_p4);
>>> -
>>> -    memory_region_init_alias(&s->iomem_a7, NULL, "serial-a7",
>>> &s->iomem,
>>> -                             0, 0x28);
>>> -    memory_region_add_subregion(sysmem, A7ADDR(base), &s->iomem_a7);
>>
>> ... and these lines become one single sysbus_init_mmio() ...
> 
> Not sure about that. The device doesn't really have two io regions, they
> just appear twice due to how the CPU maps them. So I'd keep a single
> MMIO region here but could map one directly and use only one alias for
> the other instead. (That would get rid of either serial-a7 or serial-p4
> with the other just called serial or actually sci/scif after this series).

Looking at the current mapping:

memory-region: system
  0000000000000000-ffffffffffffffff (prio 0, i/o): system
    0000000000000000-0000000000ffffff (prio 0, romd): r2d.flash
    0000000004000000-000000000400003f (prio 0, i/o): r2d-fpga
    000000000c000000-000000000fffffff (prio 0, ram): r2d.sdram
    0000000010000000-00000000107fffff (prio 0, ram): sm501.local
    0000000013e00000-0000000013ffffff (prio 0, i/o): sm501.mmio
      0000000013e00000-0000000013e0006b (prio 0, i/o): sm501-system-config
      0000000013e10040-0000000013e10053 (prio 0, i/o): sm501-i2c
      0000000013e30000-0000000013e3001f (prio 0, i/o): serial
      0000000013e40000-0000000013e400ff (prio 0, i/o): ohci
      0000000013e80000-0000000013e80fff (prio 0, i/o): sm501-disp-ctrl
      0000000013f00000-0000000013f00053 (prio 0, i/o): sm501-2d-engine
    000000001400080c-000000001400080f (prio 0, i/o): ide-mmio.2
    0000000014001000-000000001400101f (prio 0, i/o): ide-mmio.1
    000000001e080000-000000001e080003 (prio 0, i/o): alias
interrupt-controller-prio-set-a7 @interrupt-controller
000000001e080000-000000001e080003
    000000001e080040-000000001e080043 (prio 0, i/o): alias
interrupt-controller-mask-set-a7 @interrupt-controller
000000001e080040-000000001e080043
    000000001e080060-000000001e080063 (prio 0, i/o): alias
interrupt-controller-mask-clr-a7 @interrupt-controller
000000001e080060-000000001e080063
    000000001e100000-000000001e100fff (prio 0, i/o): alias timer-a7
@timer 0000000000000000-0000000000000fff
    000000001e200000-000000001e200223 (prio 0, i/o): alias sh_pci.2
@sh_pci 0000000000000000-0000000000000223
    000000001f000000-000000001f000fff (prio 0, i/o): alias memory-1f0
@memory 000000001f000000-000000001f000fff
    000000001f800000-000000001f800fff (prio 0, i/o): alias memory-1f8
@memory 000000001f800000-000000001f800fff
    000000001fc00000-000000001fc00fff (prio 0, i/o): alias memory-1fc
@memory 000000001fc00000-000000001fc00fff
    000000001fd00004-000000001fd00007 (prio 0, i/o): alias
interrupt-controller-prio-set-a7 @interrupt-controller
000000001fd00004-000000001fd00007
    000000001fd00008-000000001fd0000b (prio 0, i/o): alias
interrupt-controller-prio-set-a7 @interrupt-controller
000000001fd00008-000000001fd0000b
    000000001fd0000c-000000001fd0000f (prio 0, i/o): alias
interrupt-controller-prio-set-a7 @interrupt-controller
000000001fd0000c-000000001fd0000f
    000000001fd00010-000000001fd00013 (prio 0, i/o): alias
interrupt-controller-prio-set-a7 @interrupt-controller
000000001fd00010-000000001fd00013
    000000001fd80000-000000001fd80fff (prio 0, i/o): alias timer-a7
@timer 0000000000000000-0000000000000fff
    000000001fe00000-000000001fe00027 (prio 0, i/o): alias serial-a7
@serial 0000000000000000-0000000000000027
    000000001fe80000-000000001fe80027 (prio 0, i/o): alias serial-a7
@serial 0000000000000000-0000000000000027
    00000000f0000000-00000000f7ffffff (prio 0, i/o): cache-and-tlb
    00000000fe080000-00000000fe080003 (prio 0, i/o): alias
interrupt-controller-prio-set-p4 @interrupt-controller
000000001e080000-000000001e080003
    00000000fe080040-00000000fe080043 (prio 0, i/o): alias
interrupt-controller-mask-set-p4 @interrupt-controller
000000001e080040-000000001e080043
    00000000fe080060-00000000fe080063 (prio 0, i/o): alias
interrupt-controller-mask-clr-p4 @interrupt-controller
000000001e080060-000000001e080063
    00000000fe100000-00000000fe100fff (prio 0, i/o): alias timer-p4
@timer 0000000000000000-0000000000000fff
    00000000fe200000-00000000fe200223 (prio 0, i/o): sh_pci
    00000000fe240000-00000000fe27ffff (prio 0, i/o): alias sh_pci.isa
@io 0000000000000000-000000000003ffff
    00000000ff000000-00000000ff000fff (prio 0, i/o): alias memory-ff0
@memory 000000001f000000-000000001f000fff
    00000000ff800000-00000000ff800fff (prio 0, i/o): alias memory-ff8
@memory 000000001f800000-000000001f800fff
    00000000ffc00000-00000000ffc00fff (prio 0, i/o): alias memory-ffc
@memory 000000001fc00000-000000001fc00fff
    00000000ffd00004-00000000ffd00007 (prio 0, i/o): alias
interrupt-controller-prio-set-p4 @interrupt-controller
000000001fd00004-000000001fd00007
    00000000ffd00008-00000000ffd0000b (prio 0, i/o): alias
interrupt-controller-prio-set-p4 @interrupt-controller
000000001fd00008-000000001fd0000b
    00000000ffd0000c-00000000ffd0000f (prio 0, i/o): alias
interrupt-controller-prio-set-p4 @interrupt-controller
000000001fd0000c-000000001fd0000f
    00000000ffd00010-00000000ffd00013 (prio 0, i/o): alias
interrupt-controller-prio-set-p4 @interrupt-controller
000000001fd00010-000000001fd00013
    00000000ffd80000-00000000ffd80fff (prio 0, i/o): alias timer-p4
@timer 0000000000000000-0000000000000fff
    00000000ffe00000-00000000ffe00027 (prio 0, i/o): alias serial-p4
@serial 0000000000000000-0000000000000027
    00000000ffe80000-00000000ffe80027 (prio 0, i/o): alias serial-p4
@serial 0000000000000000-0000000000000027

It seems the 32MiB container region in 0x1e000000-0x1fffffff is
aliased to 0xfe000000-0xffffffff. But I haven't looked at the
datasheet (and don't have time until next week).

