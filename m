Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B4E3B370C
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 21:31:28 +0200 (CEST)
Received: from localhost ([::1]:55298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwV4P-0001rr-PC
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 15:31:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lwV2J-00018A-AS
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 15:29:15 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:44967)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lwV2H-0001qa-Cm
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 15:29:15 -0400
Received: by mail-wr1-x42c.google.com with SMTP id u11so7875528wrw.11
 for <qemu-devel@nongnu.org>; Thu, 24 Jun 2021 12:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ygAORgIk3hoT+Qm0kL6/2PQgtKy1DXZgsJEEv6ZVjDw=;
 b=cQUKfNlVs+qq4KuXPjpdwpkY2iWtDO9vwnqzZOq1suQgCkQbPwncRKbnPlHX/sqyC1
 6YgKgKiVwf5QfvTjwXGeTu+xqgHsHmsfGl1WMxcqPWA/hoS3QhKMY8tReyMmvCVcCuCj
 rc7gtzqNUhze+t90huDM/iDiJcF6fUQomzKf6i4os632T6CQEXhTBKGaU+FjdJEh5DNp
 A/VDKmJiHrkPOWmA+kWL40rg+UyrabnGJhhgIEdY7oSLhXw3AallWL7BuWVkD9WbjHuo
 0ODKH264kVMNJ5Ct3T9s3/XFzDbtczU2U+H5Az/2bRF0iK/kUEAPKNalBDuHPTshGW32
 UwfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ygAORgIk3hoT+Qm0kL6/2PQgtKy1DXZgsJEEv6ZVjDw=;
 b=QcQaHaVgbcZ0NcNL0/73wnHoN5mDzghCIwQy/C5IOilTTWm+YpO0+8IgwdD2gr/3r6
 rpgBxu24ijCQ5zTPuug75AeYrgkyRl1IGlrEvLMR4r5C/a2CdEamnbZTL6GedwZ2FgVD
 xJlj1bOeDrx/w6COoZs5Dr+ri8jMSYFaZLTj28AQJhfrnD99AOIrRu4wiynxmZNpmhpe
 tX2O7bCsT0yX5zWDutrsqR85rvGPX4Ot6e73LYDz8bLoQ3EJx2HinjOGeLHspoMj7TFe
 TqjPhidxJeymCekgjVgZ3UIXQfEFg7Aj9Bw8b5XJoRy3ocz2TZNKY3uOI2svv4IuDPyz
 6M3g==
X-Gm-Message-State: AOAM533s8zaHXImwSJ71ZtQxQ8bAvdEOI07bWcqBqYQCaEX/Ue3exh3Y
 xEZ+lSSKM7F/3ksKE8bcy4k=
X-Google-Smtp-Source: ABdhPJxVvF9nOMUE/NoBkkQD9mTOH8By8nLjRSU7pVmiXDpZ5MVjam7zyYC6X1LzAFjV3FWaynW8+w==
X-Received: by 2002:a5d:4a02:: with SMTP id m2mr6424173wrq.332.1624562951319; 
 Thu, 24 Jun 2021 12:29:11 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id i18sm376467wrw.55.2021.06.24.12.29.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Jun 2021 12:29:10 -0700 (PDT)
Subject: Re: [PULL 30/43] vt82c686: Fix SMBus IO base and configuration
 registers
To: BALATON Zoltan <balaton@eik.bme.hu>
References: <20210221143432.2468220-1-f4bug@amsat.org>
 <20210221143432.2468220-31-f4bug@amsat.org>
 <0c52a343-ed4c-92fa-fac0-0f32f37b0df2@amsat.org>
 <8aa3527b-0412-979f-ffb5-80b41004a4b6@amsat.org>
 <282f867e-2395-7fcb-b0df-12bcd99f0787@amsat.org>
 <77140305-bcab-31d8-e369-970ca3d26c27@amsat.org>
 <41499860-3e6d-677b-ae5c-564fc3b4e2f9@eik.bme.hu>
 <0e7d57aa-ba64-55d6-2496-56e0acd69a00@amsat.org>
 <1fa09e8c-719-3a64-6f89-27246c20b3f0@eik.bme.hu>
 <916fc26-e790-657b-4227-c0d3dc9ed5c6@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <509c2810-f36b-557b-7dfd-0ccda1f6ae1d@amsat.org>
Date: Thu, 24 Jun 2021 21:29:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <916fc26-e790-657b-4227-c0d3dc9ed5c6@eik.bme.hu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
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
 Huacai Chen <chenhuacai@kernel.org>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/24/21 8:29 PM, BALATON Zoltan wrote:
> On Thu, 24 Jun 2021, BALATON Zoltan wrote:
>> On Thu, 24 Jun 2021, Philippe Mathieu-Daudé wrote:
>>> On 6/24/21 7:00 PM, BALATON Zoltan wrote:
>>>> On Thu, 24 Jun 2021, Philippe Mathieu-Daudé wrote:
>>>>> On 6/24/21 6:16 PM, Philippe Mathieu-Daudé wrote:
>>>>>> On 6/24/21 6:01 PM, Philippe Mathieu-Daudé wrote:
>>>>>>> On 6/24/21 5:46 PM, Philippe Mathieu-Daudé wrote:
>>>>>>>> Hi Zoltan,
>>>>>>>>
>>>>>>>> On 2/21/21 3:34 PM, Philippe Mathieu-Daudé wrote:
>>>>>>>>> From: BALATON Zoltan <balaton@eik.bme.hu>
>>>>>>>>>
>>>>>>>>> The base address of the SMBus io ports and its enabled status
>>>>>>>>> is set
>>>>>>>>> by registers in the PCI config space but this was not correctly
>>>>>>>>> emulated. Instead the SMBus registers were mapped on realize to
>>>>>>>>> the
>>>>>>>>> base address set by a property to the address expected by
>>>>>>>>> fuloong2e
>>>>>>>>> firmware.
>>>>>>>>>
>>>>>>>>> Fix the base and config register handling to more closely model
>>>>>>>>> hardware which allows to remove the property and allows the
>>>>>>>>> guest to
>>>>>>>>> control this mapping. Do all this in reset instead of realize
>>>>>>>>> so it's
>>>>>>>>> correctly updated on reset.
>>>>>>>>
>>>>>>>> This commit broken running PMON on Fuloong2E:
>>>>>>>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg752605.html
>>>>>>>> console: PMON2000 MIPS Initializing. Standby...
>>>>>>>> console: ERRORPC=00000000 CONFIG=00030932
>>>>>>>> console: PRID=00006302
>>>>>>>> console: DIMM read
>>>>>>>> console: 000000ff
>>>>>>>> console: 000000ff
>>>>>>>> console: 000000ff
>>>>>>>> console: 000000ff
>>>>>>>> console: 000000ff
>>>>>>>> console: 000000ff
>>>>>>>> console: 000000ff
>>>>>>>> console: 000000ff
>>>>>>>> console: 000000ff
>>>>>>>> console: 000000ff
>>>>>>>> ...
>>>>>>>>
>>>>>>>> From here the console loops displaying this value...
>>>>>>>
>>>>>>> Tracing:
>>>
>>>>>> pci_cfg_write vt82c686b-pm 05:4 @0x90 <- 0xeee1
>>>>>
>>>>> Offset 93-90 – SMBus I/O Base
>>>>> ....................................... RW
>>>>> 15-4 I/O Base (16-byte I/O space)................ default = 00h
>>>>> pci_cfg_write vt82c686b-pm 05:4 @0x90 <- 0xeee1
>>>>>
>>>>>> pci_cfg_write vt82c686b-pm 05:4 @0xd0 <- 0x1
>>>>>
>>>>> Offset D2 – SMBus Host Configuration ......................... RW
>>>>> SMBus Host Controller Enable
>>>>> 0 Disable SMB controller functions ......... default
>>>>> 1 Enable SMB controller functions
>>>>> pci_cfg_write vt82c686b-pm 05:4 @0xd0 <- 0x1
>>>>>
>>>>> Hmm the datasheet indeed document 0xd2... why is the guest accessing
>>>>> 0xd0 to enable the function? It seems this is the problem, since if
>>>>> I replace d2 -> d0 PMON boots. See below [*].
>>>
>>>>>>>> Expected:
>>>>>>>>
>>>>>>>> console: PMON2000 MIPS Initializing. Standby...
>>>>>>>> console: ERRORPC=00000000 CONFIG=00030932
>>>>>>>> console: PRID=00006302
>>>>>>>> console: DIMM read
>>>>>>>> console: 00000080
>>>>>>>> console: read memory type
>>>>>>>> console: read number of rows
>>>>>>>> ...
>>>
>>>>>>>>>  static void pm_write_config(PCIDevice *d, uint32_t addr, uint32_t
>>>>>>>>> val, int len)
>>>>>>>>>  {
>>>>>>>>> +    VT686PMState *s = VT82C686B_PM(d);
>>>>>>>>> +
>>>>>>>>>      trace_via_pm_write(addr, val, len);
>>>>>>>>>      pci_default_write_config(d, addr, val, len);
>>>>>>>>> +    if (ranges_overlap(addr, len, 0x90, 4)) {
>>>>>>>>> +        uint32_t v = pci_get_long(s->dev.config + 0x90);
>>>>>>>>> +        pci_set_long(s->dev.config + 0x90, (v & 0xfff0UL) | 1);
>>>>>>>>> +    }
>>>>>>>>> +    if (range_covers_byte(addr, len, 0xd2)) {
>>>>>>>>> +        s->dev.config[0xd2] &= 0xf;
>>>>>>>>> +        smb_io_space_update(s);
>>>>>
>>>>> [*] So the guest writing at 0xd0, this block is skipped, the
>>>>> I/O region never enabled.
>>>>
>>>> Could it be it does word or dword i/o to access multiple addresses at
>>>> once. Wasn't there a recent change to memory regions that could break
>>>> this? Is adjusting valid access sizes to the mem region ops needed now
>>>> to have the memory region handle this?
>>>
>>> Do you mean it was buggy earlier, so to accept a guest write at 0xd0
>>> the code had to handle the 0xd2 address? 0xd2 is the address in the
>>> datasheet, so I doubt.
>>
>> No, I meant that instead of writing a byte to 0xd2 the guest might
>> write a dword to 0xd0 which also overlaps 0xd2 and would change that
>> but it does not reach the device for some reason. But in your trace
>> there was:
>>
>>>> mr_ops_write mr 0x5583912b2e00 (south-bridge-pci-config) addr
>>>> 0x1fe80490 value 0xeee1 size 4
>>>> mr_ops_write mr 0x5583912b2e00 (south-bridge-pci-config) addr
>>>> 0x1fe804d2 value 0x1 size 2
>>>
>>> These are:
>>> pci_cfg_write vt82c686b-pm 05:4 @0x90 <- 0xeee1
>>> pci_cfg_write vt82c686b-pm 05:4 @0xd0 <- 0x1
>>
>> Where size is 2 so it would not reach 0xd2 but the address part above
>> is 0x1fe804d2 which somehow comes out as 0xd0 in the PCI trace so
>> looks like something strips the low bits within PCI code and the guest
>> does intend to access 0xd2 but it's not passed on to the device as such.
> 
> Now I remember I've seen this once:
> 
> https://lists.nongnu.org/archive/html/qemu-devel/2020-12/msg06299.html

Pffff... Déjà vu.

Using Jiaxun's patch also allows the following accesses
(which were previously discarded):

pci_cfg_read vt82c686b-isa 05:0 @0x81 -> 0x0
pci_cfg_write vt82c686b-isa 05:0 @0x81 <- 0x80
pci_cfg_write vt82c686b-isa 05:0 @0x83 <- 0x89
pci_cfg_write vt82c686b-isa 05:0 @0x85 <- 0x3
pci_cfg_write vt82c686b-isa 05:0 @0x5a <- 0x7
pci_cfg_write vt82c686b-isa 05:0 @0x85 <- 0x1

Good news is the machine boots.

