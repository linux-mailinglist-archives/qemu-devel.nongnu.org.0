Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 426064147AD
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 13:19:14 +0200 (CEST)
Received: from localhost ([::1]:48884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT0HR-0002VD-9P
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 07:19:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mT0E7-0001el-9Z
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 07:15:49 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:20352)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mT0E3-0001Tt-3o
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 07:15:47 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id E43A7748F56;
 Wed, 22 Sep 2021 13:15:40 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id BD518748F53; Wed, 22 Sep 2021 13:15:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id BBC08748F52;
 Wed, 22 Sep 2021 13:15:40 +0200 (CEST)
Date: Wed, 22 Sep 2021 13:15:40 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: [PATCH v4 09/20] macfb: don't register declaration ROM
In-Reply-To: <85fd0aef-31cb-cc34-250a-ca7f1e74d1e9@ilande.co.uk>
Message-ID: <cccc3ca-7b95-d150-cbab-5d54416ce569@eik.bme.hu>
References: <20210917075057.20924-1-mark.cave-ayland@ilande.co.uk>
 <20210917075057.20924-10-mark.cave-ayland@ilande.co.uk>
 <a65fbc89-681c-22b5-87d4-31d37de15559@vivier.eu>
 <85fd0aef-31cb-cc34-250a-ca7f1e74d1e9@ilande.co.uk>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-353208698-1632309340=:99955"
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
Cc: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-353208698-1632309340=:99955
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Wed, 22 Sep 2021, Mark Cave-Ayland wrote:
> On 20/09/2021 21:01, Laurent Vivier wrote:
>> Le 17/09/2021 à 09:50, Mark Cave-Ayland a écrit :
>>> The macfb device is an on-board framebuffer and so is initialised by the
>>> system declaration ROM included within the MacOS toolbox ROM.
>>> 
>>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>>> ---
>>>   hw/display/macfb.c | 6 ------
>>>   1 file changed, 6 deletions(-)
>>> 
>>> diff --git a/hw/display/macfb.c b/hw/display/macfb.c
>>> index d8183b9bbd..76808b69cc 100644
>>> --- a/hw/display/macfb.c
>>> +++ b/hw/display/macfb.c
>>> @@ -383,10 +383,6 @@ static void macfb_sysbus_realize(DeviceState *dev, 
>>> Error **errp)
>>>       sysbus_init_mmio(SYS_BUS_DEVICE(s), &ms->mem_vram);
>>>   }
>>>   -const uint8_t macfb_rom[] = {
>>> -    255, 0, 0, 0,
>>> -};
>>> -
>>>   static void macfb_nubus_realize(DeviceState *dev, Error **errp)
>>>   {
>>>       NubusDevice *nd = NUBUS_DEVICE(dev);
>>> @@ -399,8 +395,6 @@ static void macfb_nubus_realize(DeviceState *dev, 
>>> Error **errp)
>>>       macfb_common_realize(dev, ms, errp);
>>>       memory_region_add_subregion(&nd->slot_mem, DAFB_BASE, 
>>> &ms->mem_ctrl);
>>>       memory_region_add_subregion(&nd->slot_mem, VIDEO_BASE, 
>>> &ms->mem_vram);
>>> -
>>> -    nubus_register_rom(nd, macfb_rom, sizeof(macfb_rom), 1, 9, 0xf);
>>>   }
>>>     static void macfb_sysbus_reset(DeviceState *d)
>>> 
>> 
>> Will macfb continue to work with "-kernel" and without providing any MacOS 
>> ROM?
>
> Yes indeed, since on the Quadra 800 the declaration ROM for the framebuffer 
> is embedded within the MacOS toolbox ROM.

Even if you want to boot Linux but have no toolbox ROM? (As the ROM is not 
free and thus not included with QEMU one can assume that's a common use 
case to boot Linux with -kernel but without -bios; I think that's what 
Laurent was asking about).

Regards,
BALATON Zoltan
--3866299591-353208698-1632309340=:99955--

