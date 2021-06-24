Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C903B34A7
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 19:19:54 +0200 (CEST)
Received: from localhost ([::1]:57666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwT17-0003w6-QW
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 13:19:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lwT0D-0003Ey-Ot
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 13:18:57 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:37506)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lwT0A-0006jb-G5
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 13:18:57 -0400
Received: by mail-wr1-x434.google.com with SMTP id i94so7546076wri.4
 for <qemu-devel@nongnu.org>; Thu, 24 Jun 2021 10:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Nr6jon6I1vpUv/lq9nnu5o8RMQIXfDZ4fAEVcThAYbQ=;
 b=G+5c/gKjXHLQdCX1FLvVArSVgCt7lrKzumPptS2HpB2DRp4WwCrorRi7wL4GHq+I2s
 j1m0trWa+IV3PoyzCHFeNPVNX+MRp99jbiZ/1TzuA2F7L5INKrt0SkqZ9A4YFrPMwp64
 QjMQ7HNJdnnHz3m6BYwnPoNvmkTLsY0tORxy2/eDi/A5KprFgPMKNehfAO2fmHuNG5qp
 w9+905vuVeW25vwTFcwpBrEfmggf2FTzFjejQNUuEdWgyWqi15igwP0LVeImXuMyLfbl
 lUjKzZ+fPkpPcisuG88zUUy76Y2JJktGffyoePN/BxmDPnMDJdIy+obEHLQ9HWOZmMoR
 TUKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:from:to:cc:references:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Nr6jon6I1vpUv/lq9nnu5o8RMQIXfDZ4fAEVcThAYbQ=;
 b=RATMMR/kc6R3+ASjm5CSGjOSenK3cNV/R7SAX4hqx+Yrsl24RpabBsTU6uE7pw3Dg0
 JaVUvJ2rgBRMOEUKv7Th3aOCBTsLp4RPgSRApLMIDNTO0Hm8maW0qDaL+WSACw9ITmL5
 67BhxwczDgntpQ7sYi/DUx1kI89/d+mfJ6xSrKCvd3ze4eKjvuel9Fcxdp2c+c7UK9V2
 t+BkhKapsCT4L7dwI+5qp1syAGD1jFwbBwt7o7VQ+VtFBVXBeieK1/4DHRxxs82nDhkE
 UAHh+hMERGAjfhxag0qg0JgJGYlAA0sbU1M/2+gRvGiWV5jHaGGThYlSlyu+CvY1HMli
 l8zw==
X-Gm-Message-State: AOAM531Ct5VJGYClaSOnKRnsiojLiY1etsVJ4mLHvGuSj5LdBZPny3El
 8/wynH2gCyaQYt9aoThBzYQ=
X-Google-Smtp-Source: ABdhPJwa2hlA99olbDyT0UWhJ8KCG9eEG9XJKoyjPNgFlCftD4olHTXtmSD+z7mHfqOCCq6LuZgEvw==
X-Received: by 2002:a5d:410f:: with SMTP id l15mr5873375wrp.82.1624555132919; 
 Thu, 24 Jun 2021 10:18:52 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id g17sm4593473wrh.72.2021.06.24.10.18.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Jun 2021 10:18:52 -0700 (PDT)
Subject: Re: [PULL 30/43] vt82c686: Fix SMBus IO base and configuration
 registers
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>,
 Huacai Chen <chenhuacai@kernel.org>, Chenming <chenming@rdc.faw.com.cn>,
 Yajin <yajin@vm-kernel.org>
References: <20210221143432.2468220-1-f4bug@amsat.org>
 <20210221143432.2468220-31-f4bug@amsat.org>
 <0c52a343-ed4c-92fa-fac0-0f32f37b0df2@amsat.org>
 <8aa3527b-0412-979f-ffb5-80b41004a4b6@amsat.org>
 <282f867e-2395-7fcb-b0df-12bcd99f0787@amsat.org>
 <77140305-bcab-31d8-e369-970ca3d26c27@amsat.org>
Message-ID: <7f2db709-347b-a1e0-9c58-b7781ddb82b4@amsat.org>
Date: Thu, 24 Jun 2021 19:18:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <77140305-bcab-31d8-e369-970ca3d26c27@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paul Burton <paulburton@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+Yajin, Chenming

On 6/24/21 6:46 PM, Philippe Mathieu-Daudé wrote:
> On 6/24/21 6:16 PM, Philippe Mathieu-Daudé wrote:
>> On 6/24/21 6:01 PM, Philippe Mathieu-Daudé wrote:
>>> On 6/24/21 5:46 PM, Philippe Mathieu-Daudé wrote:
>>>> Hi Zoltan,
>>>>
>>>> On 2/21/21 3:34 PM, Philippe Mathieu-Daudé wrote:
>>>>> From: BALATON Zoltan <balaton@eik.bme.hu>
>>>>>
>>>>> The base address of the SMBus io ports and its enabled status is set
>>>>> by registers in the PCI config space but this was not correctly
>>>>> emulated. Instead the SMBus registers were mapped on realize to the
>>>>> base address set by a property to the address expected by fuloong2e
>>>>> firmware.
>>>>>
>>>>> Fix the base and config register handling to more closely model
>>>>> hardware which allows to remove the property and allows the guest to
>>>>> control this mapping. Do all this in reset instead of realize so it's
>>>>> correctly updated on reset.
>>>>
>>>> This commit broken running PMON on Fuloong2E:
>>>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg752605.html
>>>> console: PMON2000 MIPS Initializing. Standby...
>>>> console: ERRORPC=00000000 CONFIG=00030932
>>>> console: PRID=00006302
>>>> console: DIMM read
>>>> console: 000000ff
>>>> console: 000000ff
>>>> console: 000000ff
>>>> console: 000000ff
>>>> console: 000000ff
>>>> console: 000000ff
>>>> console: 000000ff
>>>> console: 000000ff
>>>> console: 000000ff
>>>> console: 000000ff
>>>> ...
>>>>
>>>> From here the console loops displaying this value...
>>>
>>> Tracing:

>> pci_cfg_write vt82c686b-pm 05:4 @0x90 <- 0xeee1
> 
> Offset 93-90 – SMBus I/O Base ....................................... RW
> 15-4 I/O Base (16-byte I/O space)................ default = 00h
> pci_cfg_write vt82c686b-pm 05:4 @0x90 <- 0xeee1
> 
>> pci_cfg_write vt82c686b-pm 05:4 @0xd0 <- 0x1
> 
> Offset D2 – SMBus Host Configuration ......................... RW
> SMBus Host Controller Enable
> 0 Disable SMB controller functions ......... default
> 1 Enable SMB controller functions
> pci_cfg_write vt82c686b-pm 05:4 @0xd0 <- 0x1
> 
> Hmm the datasheet indeed document 0xd2... why is the guest accessing
> 0xd0 to enable the function? It seems this is the problem, since if
> I replace d2 -> d0 PMON boots. See below [*].

>>>> Expected:
>>>>
>>>> console: PMON2000 MIPS Initializing. Standby...
>>>> console: ERRORPC=00000000 CONFIG=00030932
>>>> console: PRID=00006302
>>>> console: DIMM read
>>>> console: 00000080
>>>> console: read memory type
>>>> console: read number of rows
>>>> ...
>>>>
>>>>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>>>>> Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>>>>> Message-Id: <f2ca2ad5f08ba8cee07afd9d67b4e75cda21db09.1610223397.git.balaton@eik.bme.hu>
>>>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>>>> ---
>>>>>  hw/isa/vt82c686.c   | 49 +++++++++++++++++++++++++++++++++------------
>>>>>  hw/mips/fuloong2e.c |  4 +---
>>>>>  2 files changed, 37 insertions(+), 16 deletions(-)
>>>>>
>>>>> diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
>>>>> index fe8961b0573..9c4d1530225 100644
>>>>> --- a/hw/isa/vt82c686.c
>>>>> +++ b/hw/isa/vt82c686.c
>>>>> @@ -22,6 +22,7 @@
>>>>>  #include "hw/i2c/pm_smbus.h"
>>>>>  #include "qapi/error.h"
>>>>>  #include "qemu/module.h"
>>>>> +#include "qemu/range.h"
>>>>>  #include "qemu/timer.h"
>>>>>  #include "exec/address-spaces.h"
>>>>>  #include "trace.h"
>>>>> @@ -34,7 +35,6 @@ struct VT686PMState {
>>>>>      ACPIREGS ar;
>>>>>      APMState apm;
>>>>>      PMSMBus smb;
>>>>> -    uint32_t smb_io_base;
>>>>>  };
>>>>>  
>>>>>  static void pm_io_space_update(VT686PMState *s)
>>>>> @@ -50,11 +50,22 @@ static void pm_io_space_update(VT686PMState *s)
>>>>>      memory_region_transaction_commit();
>>>>>  }
>>>>>  
>>>>> +static void smb_io_space_update(VT686PMState *s)
>>>>> +{
>>>>> +    uint32_t smbase = pci_get_long(s->dev.config + 0x90) & 0xfff0UL;
>>>>> +
>>>>> +    memory_region_transaction_begin();
>>>>> +    memory_region_set_address(&s->smb.io, smbase);
>>>>> +    memory_region_set_enabled(&s->smb.io, s->dev.config[0xd2] & BIT(0));
>>>>> +    memory_region_transaction_commit();
>>>>> +}
>>>>> +
>>>>>  static int vmstate_acpi_post_load(void *opaque, int version_id)
>>>>>  {
>>>>>      VT686PMState *s = opaque;
>>>>>  
>>>>>      pm_io_space_update(s);
>>>>> +    smb_io_space_update(s);
>>>>>      return 0;
>>>>>  }
>>>>>  
>>>>> @@ -77,8 +88,18 @@ static const VMStateDescription vmstate_acpi = {
>>>>>  
>>>>>  static void pm_write_config(PCIDevice *d, uint32_t addr, uint32_t val, int len)
>>>>>  {
>>>>> +    VT686PMState *s = VT82C686B_PM(d);
>>>>> +
>>>>>      trace_via_pm_write(addr, val, len);
>>>>>      pci_default_write_config(d, addr, val, len);
>>>>> +    if (ranges_overlap(addr, len, 0x90, 4)) {
>>>>> +        uint32_t v = pci_get_long(s->dev.config + 0x90);
>>>>> +        pci_set_long(s->dev.config + 0x90, (v & 0xfff0UL) | 1);
>>>>> +    }
>>>>> +    if (range_covers_byte(addr, len, 0xd2)) {
>>>>> +        s->dev.config[0xd2] &= 0xf;
>>>>> +        smb_io_space_update(s);
> 
> [*] So the guest writing at 0xd0, this block is skipped, the
> I/O region never enabled.
> 
>>>>> +    }
>>>>>  }
>>>>>  
>>>>>  static void pm_update_sci(VT686PMState *s)
>>>>> @@ -103,6 +124,17 @@ static void pm_tmr_timer(ACPIREGS *ar)
>>>>>      pm_update_sci(s);
>>>>>  }
>>>>>  
>>>>> +static void vt82c686b_pm_reset(DeviceState *d)
>>>>> +{
>>>>> +    VT686PMState *s = VT82C686B_PM(d);
>>>>> +
>>>>> +    /* SMBus IO base */
>>>>> +    pci_set_long(s->dev.config + 0x90, 1);
>>>>> +    s->dev.config[0xd2] = 0;
>>>>> +
>>>>> +    smb_io_space_update(s);
>>>>> +}
>>>>> +
>>>>>  static void vt82c686b_pm_realize(PCIDevice *dev, Error **errp)
>>>>>  {
>>>>>      VT686PMState *s = VT82C686B_PM(dev);
>>>>> @@ -116,13 +148,9 @@ static void vt82c686b_pm_realize(PCIDevice *dev, Error **errp)
>>>>>      /* 0x48-0x4B is Power Management I/O Base */
>>>>>      pci_set_long(pci_conf + 0x48, 0x00000001);
>>>>>  
>>>>> -    /* SMB ports:0xeee0~0xeeef */
>>>>> -    s->smb_io_base = ((s->smb_io_base & 0xfff0) + 0x0);
>>>>> -    pci_conf[0x90] = s->smb_io_base | 1;
>>>>> -    pci_conf[0x91] = s->smb_io_base >> 8;
>>>>> -    pci_conf[0xd2] = 0x90;

This line hasn't been modified since its introduction in commit
edf79e66c02 ("Initial support of vt82686b south bridge used by
fulong mini pc"), so I am not sure it was used.
Beside, I don't understand 0x90; per the datasheet description
only bits 0-3 are defined.

Huacai, do you remember? =)

>>>>>      pm_smbus_init(DEVICE(s), &s->smb, false);
>>>>> -    memory_region_add_subregion(get_system_io(), s->smb_io_base, &s->smb.io);
>>>>> +    memory_region_add_subregion(pci_address_space_io(dev), 0, &s->smb.io);
>>>>> +    memory_region_set_enabled(&s->smb.io, false);
>>>>>  
>>>>>      apm_init(dev, &s->apm, NULL, s);
>>>>>  
>>>>> @@ -135,11 +163,6 @@ static void vt82c686b_pm_realize(PCIDevice *dev, Error **errp)
>>>>>      acpi_pm1_cnt_init(&s->ar, &s->io, false, false, 2);
>>>>>  }
>>>>>  
>>>>> -static Property via_pm_properties[] = {
>>>>> -    DEFINE_PROP_UINT32("smb_io_base", VT686PMState, smb_io_base, 0),
>>>>> -    DEFINE_PROP_END_OF_LIST(),
>>>>> -};
>>>>> -
>>>>>  static void via_pm_class_init(ObjectClass *klass, void *data)
>>>>>  {
>>>>>      DeviceClass *dc = DEVICE_CLASS(klass);
>>>>> @@ -151,10 +174,10 @@ static void via_pm_class_init(ObjectClass *klass, void *data)
>>>>>      k->device_id = PCI_DEVICE_ID_VIA_ACPI;
>>>>>      k->class_id = PCI_CLASS_BRIDGE_OTHER;
>>>>>      k->revision = 0x40;
>>>>> +    dc->reset = vt82c686b_pm_reset;
>>>>>      dc->desc = "PM";
>>>>>      dc->vmsd = &vmstate_acpi;
>>>>>      set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
>>>>> -    device_class_set_props(dc, via_pm_properties);
>>>>>  }
>>>>>  
>>>>>  static const TypeInfo via_pm_info = {
>>>>> diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
>>>>> index 1f3680fda3e..94f4718147f 100644
>>>>> --- a/hw/mips/fuloong2e.c
>>>>> +++ b/hw/mips/fuloong2e.c
>>>>> @@ -230,9 +230,7 @@ static void vt82c686b_southbridge_init(PCIBus *pci_bus, int slot, qemu_irq intc,
>>>>>      pci_create_simple(pci_bus, PCI_DEVFN(slot, 2), "vt82c686b-usb-uhci");
>>>>>      pci_create_simple(pci_bus, PCI_DEVFN(slot, 3), "vt82c686b-usb-uhci");
>>>>>  
>>>>> -    dev = pci_new(PCI_DEVFN(slot, 4), TYPE_VT82C686B_PM);
>>>>> -    qdev_prop_set_uint32(DEVICE(dev), "smb_io_base", 0xeee1);
>>>>> -    pci_realize_and_unref(dev, pci_bus, &error_fatal);
>>>>> +    dev = pci_create_simple(pci_bus, PCI_DEVFN(slot, 4), TYPE_VT82C686B_PM);
>>>>>      *i2c_bus = I2C_BUS(qdev_get_child_bus(DEVICE(dev), "i2c"));
>>>>>  
>>>>>      /* Audio support */
>>>>>
>>>>
>>>>
>>>
>>
> 

