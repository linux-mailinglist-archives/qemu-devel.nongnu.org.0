Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B8A414632
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 12:30:17 +0200 (CEST)
Received: from localhost ([::1]:52252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSzW4-0007Vm-DR
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 06:30:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mSzUb-0006P1-3M
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 06:28:45 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:47086
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mSzUZ-0002Ak-Jw
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 06:28:44 -0400
Received: from [2a00:23c4:8b9d:4100:5d98:71b5:90ca:dad1]
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mSzUP-0009Zy-AK; Wed, 22 Sep 2021 11:28:37 +0100
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20210917075057.20924-1-mark.cave-ayland@ilande.co.uk>
 <20210917075057.20924-10-mark.cave-ayland@ilande.co.uk>
 <a65fbc89-681c-22b5-87d4-31d37de15559@vivier.eu>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <85fd0aef-31cb-cc34-250a-ca7f1e74d1e9@ilande.co.uk>
Date: Wed, 22 Sep 2021 11:28:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <a65fbc89-681c-22b5-87d4-31d37de15559@vivier.eu>
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
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/09/2021 21:01, Laurent Vivier wrote:

> Le 17/09/2021 à 09:50, Mark Cave-Ayland a écrit :
>> The macfb device is an on-board framebuffer and so is initialised by the
>> system declaration ROM included within the MacOS toolbox ROM.
>>
>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>> ---
>>   hw/display/macfb.c | 6 ------
>>   1 file changed, 6 deletions(-)
>>
>> diff --git a/hw/display/macfb.c b/hw/display/macfb.c
>> index d8183b9bbd..76808b69cc 100644
>> --- a/hw/display/macfb.c
>> +++ b/hw/display/macfb.c
>> @@ -383,10 +383,6 @@ static void macfb_sysbus_realize(DeviceState *dev, Error **errp)
>>       sysbus_init_mmio(SYS_BUS_DEVICE(s), &ms->mem_vram);
>>   }
>>   
>> -const uint8_t macfb_rom[] = {
>> -    255, 0, 0, 0,
>> -};
>> -
>>   static void macfb_nubus_realize(DeviceState *dev, Error **errp)
>>   {
>>       NubusDevice *nd = NUBUS_DEVICE(dev);
>> @@ -399,8 +395,6 @@ static void macfb_nubus_realize(DeviceState *dev, Error **errp)
>>       macfb_common_realize(dev, ms, errp);
>>       memory_region_add_subregion(&nd->slot_mem, DAFB_BASE, &ms->mem_ctrl);
>>       memory_region_add_subregion(&nd->slot_mem, VIDEO_BASE, &ms->mem_vram);
>> -
>> -    nubus_register_rom(nd, macfb_rom, sizeof(macfb_rom), 1, 9, 0xf);
>>   }
>>   
>>   static void macfb_sysbus_reset(DeviceState *d)
>>
> 
> Will macfb continue to work with "-kernel" and without providing any MacOS ROM?

Yes indeed, since on the Quadra 800 the declaration ROM for the framebuffer is 
embedded within the MacOS toolbox ROM.


ATB,

Mark.

