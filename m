Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 926094147D5
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 13:32:51 +0200 (CEST)
Received: from localhost ([::1]:58112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT0Uc-0000xw-K4
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 07:32:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mT0TM-0008OY-Vc
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 07:31:34 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:47148
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mT0TI-0006md-Sn
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 07:31:31 -0400
Received: from [2a00:23c4:8b9d:4100:5d98:71b5:90ca:dad1]
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mT0T6-0009r2-Fd; Wed, 22 Sep 2021 12:31:20 +0100
To: BALATON Zoltan <balaton@eik.bme.hu>
References: <20210917075057.20924-1-mark.cave-ayland@ilande.co.uk>
 <20210917075057.20924-10-mark.cave-ayland@ilande.co.uk>
 <a65fbc89-681c-22b5-87d4-31d37de15559@vivier.eu>
 <85fd0aef-31cb-cc34-250a-ca7f1e74d1e9@ilande.co.uk>
 <cccc3ca-7b95-d150-cbab-5d54416ce569@eik.bme.hu>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <eed3296c-7d23-41c2-e6fa-506d6feeab23@ilande.co.uk>
Date: Wed, 22 Sep 2021 12:31:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <cccc3ca-7b95-d150-cbab-5d54416ce569@eik.bme.hu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8b9d:4100:5d98:71b5:90ca:dad1
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v4 09/20] macfb: don't register declaration ROM
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: 0
X-Spam_score: -0.0
X-Spam_bar: /
X-Spam_report: (-0.0 / 5.0 requ) NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/09/2021 12:15, BALATON Zoltan wrote:

> On Wed, 22 Sep 2021, Mark Cave-Ayland wrote:
>> On 20/09/2021 21:01, Laurent Vivier wrote:
>>> Le 17/09/2021 à 09:50, Mark Cave-Ayland a écrit :
>>>> The macfb device is an on-board framebuffer and so is initialised by the
>>>> system declaration ROM included within the MacOS toolbox ROM.
>>>>
>>>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>>>> ---
>>>>   hw/display/macfb.c | 6 ------
>>>>   1 file changed, 6 deletions(-)
>>>>
>>>> diff --git a/hw/display/macfb.c b/hw/display/macfb.c
>>>> index d8183b9bbd..76808b69cc 100644
>>>> --- a/hw/display/macfb.c
>>>> +++ b/hw/display/macfb.c
>>>> @@ -383,10 +383,6 @@ static void macfb_sysbus_realize(DeviceState *dev, Error 
>>>> **errp)
>>>>       sysbus_init_mmio(SYS_BUS_DEVICE(s), &ms->mem_vram);
>>>>   }
>>>>   -const uint8_t macfb_rom[] = {
>>>> -    255, 0, 0, 0,
>>>> -};
>>>> -
>>>>   static void macfb_nubus_realize(DeviceState *dev, Error **errp)
>>>>   {
>>>>       NubusDevice *nd = NUBUS_DEVICE(dev);
>>>> @@ -399,8 +395,6 @@ static void macfb_nubus_realize(DeviceState *dev, Error **errp)
>>>>       macfb_common_realize(dev, ms, errp);
>>>>       memory_region_add_subregion(&nd->slot_mem, DAFB_BASE, &ms->mem_ctrl);
>>>>       memory_region_add_subregion(&nd->slot_mem, VIDEO_BASE, &ms->mem_vram);
>>>> -
>>>> -    nubus_register_rom(nd, macfb_rom, sizeof(macfb_rom), 1, 9, 0xf);
>>>>   }
>>>>     static void macfb_sysbus_reset(DeviceState *d)
>>>>
>>>
>>> Will macfb continue to work with "-kernel" and without providing any MacOS ROM?
>>
>> Yes indeed, since on the Quadra 800 the declaration ROM for the framebuffer is 
>> embedded within the MacOS toolbox ROM.
> 
> Even if you want to boot Linux but have no toolbox ROM? (As the ROM is not free and 
> thus not included with QEMU one can assume that's a common use case to boot Linux 
> with -kernel but without -bios; I think that's what Laurent was asking about).

Yes, correct. If you check earlier in the thread you can see Laurent confirms that no 
declaration ROM is present on a real Quadra 800. In the -kernel case all that happens 
is that the physical address of the framebuffer is passed to the kernel using 
bootinfo ready for use.


ATB,

Mark.

