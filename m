Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C773B352B
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 20:04:08 +0200 (CEST)
Received: from localhost ([::1]:39502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwThu-00066m-QL
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 14:04:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lwTfp-0004nM-QH
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 14:01:57 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:46193)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lwTfl-0008Oo-SQ
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 14:01:57 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id A27F074570E;
 Thu, 24 Jun 2021 20:01:48 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 4D3CB7456E3; Thu, 24 Jun 2021 20:01:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 4B5357456B4;
 Thu, 24 Jun 2021 20:01:48 +0200 (CEST)
Date: Thu, 24 Jun 2021 20:01:48 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PULL 30/43] vt82c686: Fix SMBus IO base and configuration
 registers
In-Reply-To: <0e7d57aa-ba64-55d6-2496-56e0acd69a00@amsat.org>
Message-ID: <1fa09e8c-719-3a64-6f89-27246c20b3f0@eik.bme.hu>
References: <20210221143432.2468220-1-f4bug@amsat.org>
 <20210221143432.2468220-31-f4bug@amsat.org>
 <0c52a343-ed4c-92fa-fac0-0f32f37b0df2@amsat.org>
 <8aa3527b-0412-979f-ffb5-80b41004a4b6@amsat.org>
 <282f867e-2395-7fcb-b0df-12bcd99f0787@amsat.org>
 <77140305-bcab-31d8-e369-970ca3d26c27@amsat.org>
 <41499860-3e6d-677b-ae5c-564fc3b4e2f9@eik.bme.hu>
 <0e7d57aa-ba64-55d6-2496-56e0acd69a00@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 BOUNDARY="3866299591-1447722852-1624557465=:41362"
Content-ID: <7f7e96bf-deb5-5f7c-4166-957bca54f1@eik.bme.hu>
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paul Burton <paulburton@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1447722852-1624557465=:41362
Content-Type: text/plain; CHARSET=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT
Content-ID: <297012dc-61d3-a33c-37bd-bb6f3d237ebc@eik.bme.hu>

On Thu, 24 Jun 2021, Philippe Mathieu-Daudé wrote:
> On 6/24/21 7:00 PM, BALATON Zoltan wrote:
>> On Thu, 24 Jun 2021, Philippe Mathieu-Daudé wrote:
>>> On 6/24/21 6:16 PM, Philippe Mathieu-Daudé wrote:
>>>> On 6/24/21 6:01 PM, Philippe Mathieu-Daudé wrote:
>>>>> On 6/24/21 5:46 PM, Philippe Mathieu-Daudé wrote:
>>>>>> Hi Zoltan,
>>>>>>
>>>>>> On 2/21/21 3:34 PM, Philippe Mathieu-Daudé wrote:
>>>>>>> From: BALATON Zoltan <balaton@eik.bme.hu>
>>>>>>>
>>>>>>> The base address of the SMBus io ports and its enabled status is set
>>>>>>> by registers in the PCI config space but this was not correctly
>>>>>>> emulated. Instead the SMBus registers were mapped on realize to the
>>>>>>> base address set by a property to the address expected by fuloong2e
>>>>>>> firmware.
>>>>>>>
>>>>>>> Fix the base and config register handling to more closely model
>>>>>>> hardware which allows to remove the property and allows the guest to
>>>>>>> control this mapping. Do all this in reset instead of realize so it's
>>>>>>> correctly updated on reset.
>>>>>>
>>>>>> This commit broken running PMON on Fuloong2E:
>>>>>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg752605.html
>>>>>> console: PMON2000 MIPS Initializing. Standby...
>>>>>> console: ERRORPC=00000000 CONFIG=00030932
>>>>>> console: PRID=00006302
>>>>>> console: DIMM read
>>>>>> console: 000000ff
>>>>>> console: 000000ff
>>>>>> console: 000000ff
>>>>>> console: 000000ff
>>>>>> console: 000000ff
>>>>>> console: 000000ff
>>>>>> console: 000000ff
>>>>>> console: 000000ff
>>>>>> console: 000000ff
>>>>>> console: 000000ff
>>>>>> ...
>>>>>>
>>>>>> From here the console loops displaying this value...
>>>>>
>>>>> Tracing:
>
>>>> pci_cfg_write vt82c686b-pm 05:4 @0x90 <- 0xeee1
>>>
>>> Offset 93-90 – SMBus I/O Base ....................................... RW
>>> 15-4 I/O Base (16-byte I/O space)................ default = 00h
>>> pci_cfg_write vt82c686b-pm 05:4 @0x90 <- 0xeee1
>>>
>>>> pci_cfg_write vt82c686b-pm 05:4 @0xd0 <- 0x1
>>>
>>> Offset D2 – SMBus Host Configuration ......................... RW
>>> SMBus Host Controller Enable
>>> 0 Disable SMB controller functions ......... default
>>> 1 Enable SMB controller functions
>>> pci_cfg_write vt82c686b-pm 05:4 @0xd0 <- 0x1
>>>
>>> Hmm the datasheet indeed document 0xd2... why is the guest accessing
>>> 0xd0 to enable the function? It seems this is the problem, since if
>>> I replace d2 -> d0 PMON boots. See below [*].
>
>>>>>> Expected:
>>>>>>
>>>>>> console: PMON2000 MIPS Initializing. Standby...
>>>>>> console: ERRORPC=00000000 CONFIG=00030932
>>>>>> console: PRID=00006302
>>>>>> console: DIMM read
>>>>>> console: 00000080
>>>>>> console: read memory type
>>>>>> console: read number of rows
>>>>>> ...
>
>>>>>>>  static void pm_write_config(PCIDevice *d, uint32_t addr, uint32_t
>>>>>>> val, int len)
>>>>>>>  {
>>>>>>> +    VT686PMState *s = VT82C686B_PM(d);
>>>>>>> +
>>>>>>>      trace_via_pm_write(addr, val, len);
>>>>>>>      pci_default_write_config(d, addr, val, len);
>>>>>>> +    if (ranges_overlap(addr, len, 0x90, 4)) {
>>>>>>> +        uint32_t v = pci_get_long(s->dev.config + 0x90);
>>>>>>> +        pci_set_long(s->dev.config + 0x90, (v & 0xfff0UL) | 1);
>>>>>>> +    }
>>>>>>> +    if (range_covers_byte(addr, len, 0xd2)) {
>>>>>>> +        s->dev.config[0xd2] &= 0xf;
>>>>>>> +        smb_io_space_update(s);
>>>
>>> [*] So the guest writing at 0xd0, this block is skipped, the
>>> I/O region never enabled.
>>
>> Could it be it does word or dword i/o to access multiple addresses at
>> once. Wasn't there a recent change to memory regions that could break
>> this? Is adjusting valid access sizes to the mem region ops needed now
>> to have the memory region handle this?
>
> Do you mean it was buggy earlier, so to accept a guest write at 0xd0
> the code had to handle the 0xd2 address? 0xd2 is the address in the
> datasheet, so I doubt.

No, I meant that instead of writing a byte to 0xd2 the guest might write a 
dword to 0xd0 which also overlaps 0xd2 and would change that but it does 
not reach the device for some reason. But in your trace there was:

>> mr_ops_write mr 0x5583912b2e00 (south-bridge-pci-config) addr 0x1fe80490 value 0xeee1 size 4
>> mr_ops_write mr 0x5583912b2e00 (south-bridge-pci-config) addr 0x1fe804d2 value 0x1 size 2
>
> These are:
> pci_cfg_write vt82c686b-pm 05:4 @0x90 <- 0xeee1
> pci_cfg_write vt82c686b-pm 05:4 @0xd0 <- 0x1

Where size is 2 so it would not reach 0xd2 but the address part above is 
0x1fe804d2 which somehow comes out as 0xd0 in the PCI trace so looks like 
something strips the low bits within PCI code and the guest does intend to 
access 0xd2 but it's not passed on to the device as such.

Regards,
BALATON Zoltan
--3866299591-1447722852-1624557465=:41362--

