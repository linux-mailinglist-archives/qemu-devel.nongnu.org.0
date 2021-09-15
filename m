Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2032140C483
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 13:45:45 +0200 (CEST)
Received: from localhost ([::1]:35594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQTMG-0000tS-4d
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 07:45:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mQTIn-0007pZ-CM
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 07:42:09 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:39234
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mQTIk-0004Ns-2I
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 07:42:07 -0400
Received: from host109-153-76-56.range109-153.btcentralplus.com
 ([109.153.76.56] helo=[192.168.50.176])
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mQTIb-0005ot-9v; Wed, 15 Sep 2021 12:42:01 +0100
To: BALATON Zoltan <balaton@eik.bme.hu>
References: <20210915101026.25174-1-mark.cave-ayland@ilande.co.uk>
 <20210915101026.25174-21-mark.cave-ayland@ilande.co.uk>
 <34dbcdd0-c328-b6e5-c6da-dcc22cdb58f0@eik.bme.hu>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <7983271c-c4f6-5e19-b8c2-3a97096cf055@ilande.co.uk>
Date: Wed, 15 Sep 2021 12:41:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <34dbcdd0-c328-b6e5-c6da-dcc22cdb58f0@eik.bme.hu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 109.153.76.56
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v2 20/20] q800: configure nubus available slots for Quadra
 800
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.698,
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
Cc: qemu-devel@nongnu.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15/09/2021 11:50, BALATON Zoltan wrote:

> On Wed, 15 Sep 2021, Mark Cave-Ayland wrote:
>> Slot 0x9 is reserved for use by the in-built framebuffer whilst only slots
>> 0xc, 0xd and 0xe physically exist on the Quadra 800.
>>
>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>> ---
>> hw/m68k/q800.c | 9 +++++++++
>> 1 file changed, 9 insertions(+)
>>
>> diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
>> index fbc45a301f..65c80421c6 100644
>> --- a/hw/m68k/q800.c
>> +++ b/hw/m68k/q800.c
>> @@ -78,6 +78,13 @@
>>
>> #define MAC_CLOCK  3686418
>>
>> +/*
>> + * Slot 0x9 is reserved for use by the in-built framebuffer whilst only
>> + * slots 0xc, 0xd and 0xe physically exist on the Quadra 800
>> + */
>> +#define Q800_NUBUS_SLOTS_AVAILABLE    ((1UL << 0x9) | (1UL << 0xc) | \
>> +                                       (1UL << 0xd) | (1UL << 0xe))
> 
> There is a BIT(x) macro for these kind of constants that I find more readable as 
> there would be less < signs and perenthesis but I don't insist on using it just note 
> for consideration in case you need another respin for other reasons. (That macro 
> could also be used to shorten the ~(1UL << nr_bits)
> values in other patches.)
> 
> Regards.
> BALATON Zoltan

Good point. I need to head out for a few hours now, but I'll try this and incorporate 
it into a v3 patchset later (along with any other feedback from v2).

>> +
>> /*
>>  * The GLUE (General Logic Unit) is an Apple custom integrated circuit chip
>>  * that performs a variety of functions (RAM management, clock generation, ...).
>> @@ -392,6 +399,8 @@ static void q800_init(MachineState *machine)
>>     /* NuBus */
>>
>>     dev = qdev_new(TYPE_MAC_NUBUS_BRIDGE);
>> +    qdev_prop_set_uint32(dev, "slot-available-mask",
>> +                         Q800_NUBUS_SLOTS_AVAILABLE);
>>     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
>>     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, 9 * NUBUS_SUPER_SLOT_SIZE);
>>     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 1, NUBUS_SLOT_BASE +


ATB,

Mark.

