Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77ABD20B386
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Jun 2020 16:27:13 +0200 (CEST)
Received: from localhost ([::1]:48528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jopJw-0001fw-AJ
	for lists+qemu-devel@lfdr.de; Fri, 26 Jun 2020 10:27:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1jopJ2-0000ix-2h; Fri, 26 Jun 2020 10:26:16 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:54816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1jopIv-0001va-9a; Fri, 26 Jun 2020 10:26:15 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 16D45745712;
 Fri, 26 Jun 2020 16:26:06 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id CDF9D745702; Fri, 26 Jun 2020 16:26:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id CC32D7456F8;
 Fri, 26 Jun 2020 16:26:05 +0200 (CEST)
Date: Fri, 26 Jun 2020 16:26:05 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [RFC PATCH 1/3] hw/i2c/smbus_eeprom: Set QOM parent
In-Reply-To: <4825239e-1e75-a401-2068-a8c14c38f60b@amsat.org>
Message-ID: <alpine.BSF.2.22.395.2006261622590.63331@zero.eik.bme.hu>
References: <20200626102744.15053-1-f4bug@amsat.org>
 <20200626102744.15053-2-f4bug@amsat.org>
 <alpine.BSF.2.22.395.2006261240500.94870@zero.eik.bme.hu>
 <alpine.BSF.2.22.395.2006261251480.94870@zero.eik.bme.hu>
 <f7da6118-a27a-a09d-9c8f-92cbf2eca96f@amsat.org>
 <alpine.BSF.2.22.395.2006261557050.56498@zero.eik.bme.hu>
 <4825239e-1e75-a401-2068-a8c14c38f60b@amsat.org>
User-Agent: Alpine 2.22 (BSF 395 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-531737789-1593181565=:63331"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/26 10:26:06
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Corey Minyard <cminyard@mvista.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Markus Armbruster <armbru@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 qemu-devel@nongnu.org, Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 qemu-ppc@nongnu.org, =?ISO-8859-15?Q?C=E9dric_Le_Goater?= <clg@kaod.org>,
 Huacai Chen <chenhc@lemote.com>, Fred Konrad <konrad@adacore.com>,
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-531737789-1593181565=:63331
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Fri, 26 Jun 2020, Philippe Mathieu-Daudé wrote:
> On 6/26/20 4:03 PM, BALATON Zoltan wrote:
>> On Fri, 26 Jun 2020, Philippe Mathieu-Daudé wrote:
>>> + Eduardo / Mark / Edgard / Alistair / Fred for QOM design.
>>>
>>> On 6/26/20 12:54 PM, BALATON Zoltan wrote:
>>>> On Fri, 26 Jun 2020, BALATON Zoltan wrote:
>>>>> On Fri, 26 Jun 2020, Philippe Mathieu-Daudé wrote:
>>>>>> Suggested-by: Markus Armbruster <armbru@redhat.com>
>>>>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>>>>> ---
>>>>>> Aspeed change pending latest ARM pull-request, so meanwhile sending
>>>>>> as RFC.
>>>>>> ---
>>>>>> include/hw/i2c/smbus_eeprom.h |  9 ++++++---
>>>>>> hw/i2c/smbus_eeprom.c         | 13 ++++++++++---
>>>>>> hw/mips/fuloong2e.c           |  2 +-
>>>>>> hw/ppc/sam460ex.c             |  2 +-
>>>>>> 4 files changed, 18 insertions(+), 8 deletions(-)
>>>>>>
>>>>>> diff --git a/include/hw/i2c/smbus_eeprom.h
>>>>>> b/include/hw/i2c/smbus_eeprom.h
>>>>>> index 68b0063ab6..037612bbbb 100644
>>>>>> --- a/include/hw/i2c/smbus_eeprom.h
>>>>>> +++ b/include/hw/i2c/smbus_eeprom.h
>>>>>> @@ -26,9 +26,12 @@
>>>>>> #include "exec/cpu-common.h"
>>>>>> #include "hw/i2c/i2c.h"
>>>>>>
>>>>>> -void smbus_eeprom_init_one(I2CBus *bus, uint8_t address, uint8_t
>>>>>> *eeprom_buf);
>>>>>> -void smbus_eeprom_init(I2CBus *bus, int nb_eeprom,
>>>>>> -                       const uint8_t *eeprom_spd, int size);
>>>>>> +void smbus_eeprom_init_one(Object *parent_obj, const char
>>>>>> *child_name,
>>>>>> +                           I2CBus *smbus, uint8_t address,
>>>>>> +                           uint8_t *eeprom_buf);
>>>>>> +void smbus_eeprom_init(Object *parent_obj, const char
>>>>>> *child_name_prefix,
>>>>>> +                       I2CBus *smbus, int nb_eeprom,
>>>>>> +                       const uint8_t *eeprom_spd, int
>>>>>> eeprom_spd_size);
>>>>>
>>>>> Keeping I2CBus *smbus and uint8_t address as first parameters before
>>>>> parent_obj and name looks better to me. These functions still operate
>>>>> on an I2Cbus so could be regarded as methods of I2CBus therefore first
>>>>> parameter should be that.
>>>>
>>>> Also isn't parent_obj is the I2Cbus itself? Why is that need to be
>>>> passed? The i2c_init_bus() also takes parent and name params so both
>>>> I2Cbus and it's parent should be available as parents of the new I2C
>>>> device here without more parameters. What am I missing here?
>>>
>>> This is where I'm confused too and what I want to resolve with this
>>> RFC series :)
>>>
>>> The SPD EEPROM is soldered on the DIMM module. The DIMM exposes the
>>> memory address/data pins and the i2c pins. We plug DIMMs on a
>>> (mother)board.
>>>
>>> I see the DIMM module being the parent. As we don't model it in QOM,
>>> I used the MemoryRegion (which is what the SPD is describing).
>>>
>>> We could represent the DIMM as a container of DRAM + SPD EEPROM, but
>>> it makes the modeling slightly more complex. The only benefit is a
>>> clearer modeling.
>>>
>>> I'm not sure why the I2C bus is expected to be the parent. Maybe an
>>> old wrong assumption?
>>
>> I guess it's a question of what the parent should mean? Is it parent of
>> the object in which case it's the I2CBus (which is kind of logical view
>> of the object tree modelling the machine) or the parent of the thing
>> modelled in the machine (which is physical view of the machine
>> components) then it should be the RAM module. The confusion probably
>> comes from this question not answered. Also the DIMM module is not
>> modelled so when you assign SPD eeproms to memory region it could be
>> multiple SPD eeproms will be parented by a single RAM memory region
>> (possibly not covering it fully as in the mac_oldworld or sam460ex case
>> discussed in another thread). This does not seem too intuitive.
>
> From the bus perspective, requests are sent hoping for a device to
> answer to the requested address ("Hello, do I have children? Hello?
> Anybody here?"), if nobody is here, the request timeouts.
> So there is not really a strong family relationship here.
>
> If you unplug a DIMM, you remove both the MemoryRegion and the EEPROM.
> This is how I understand the QOM parent relationship so far (if you
> remove a parent, you also remove its children).

OK but what if we don't have a DIMM object as that is not modelled? Should 
you set parent to the board in that case? Or is it still modelled as an 
I2C device that is plugged in an I2C bus. Does it need to have a parent in 
this case at all or is it a case for an unattached device (becuase its 
physical parent is not modelled)?

Regards,
BALATON Zoltan
--3866299591-531737789-1593181565=:63331--

