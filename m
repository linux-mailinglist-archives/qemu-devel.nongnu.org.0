Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF9C23B42D2
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 14:03:19 +0200 (CEST)
Received: from localhost ([::1]:34620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwkYJ-0008Hl-2P
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 08:03:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lwkX0-0007Kk-RM
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 08:01:58 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:59480
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lwkWz-0000hT-0f
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 08:01:58 -0400
Received: from host109-153-84-9.range109-153.btcentralplus.com ([109.153.84.9]
 helo=[192.168.1.65]) by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lwkWW-0008Od-Ee; Fri, 25 Jun 2021 13:01:32 +0100
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, hpoussin@reactos.org, aleksandar.rikalo@syrmia.com,
 aurelien@aurel32.net, jiaxun.yang@flygoat.com, jasowang@redhat.com,
 fthain@telegraphics.com.au, laurent@vivier.eu
References: <20210625065401.30170-1-mark.cave-ayland@ilande.co.uk>
 <20210625065401.30170-11-mark.cave-ayland@ilande.co.uk>
 <425f2517-808d-c046-42a4-8ff617a456f3@amsat.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <a2c650d2-d92c-787f-00fd-552f2c32b07c@ilande.co.uk>
Date: Fri, 25 Jun 2021 13:01:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <425f2517-808d-c046-42a4-8ff617a456f3@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 109.153.84.9
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v2 10/10] hw/mips/jazz: specify correct endian for dp8393x
 device
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

On 25/06/2021 09:51, Philippe Mathieu-Daudé wrote:
> On 6/25/21 8:54 AM, Mark Cave-Ayland wrote:
>> The MIPS magnum machines are available in both big endian (mips64) and little
>> endian (mips64el) configurations. Ensure that the dp893x big_endian property
>> is set accordingly using logic similar to that used for the MIPS malta
>> machines.
>>
>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>> ---
>>   hw/mips/jazz.c | 9 ++++++++-
>>   1 file changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/mips/jazz.c b/hw/mips/jazz.c
>> index 89ca8bb910..ee1789183e 100644
>> --- a/hw/mips/jazz.c
>> +++ b/hw/mips/jazz.c
>> @@ -126,7 +126,7 @@ static void mips_jazz_init(MachineState *machine,
>>   {
>>       MemoryRegion *address_space = get_system_memory();
>>       char *filename;
>> -    int bios_size, n;
>> +    int bios_size, n, big_endian;
> 
> Why not use a boolean directly?

Good point. I grepped the codebase for an existing example for using DEFINE_PROP_BOOL 
and setting the value using qdev_prop_set_bit(), and the first hit was in 
hw/arm/allwinner-h3.c for the "start-powered-off" property. The existing MIPS Malta 
code also used an integer variable to store the current endian and so that's what I 
went with.

I wonder why we don't have a qdev_prop_set_bool() to match DEFINE_PROP_BOOL?

>>       Clock *cpuclk;
>>       MIPSCPU *cpu;
>>       MIPSCPUClass *mcc;
>> @@ -158,6 +158,12 @@ static void mips_jazz_init(MachineState *machine,
>>           [JAZZ_PICA61] = {33333333, 4},
>>       };
>>   
>> +#ifdef TARGET_WORDS_BIGENDIAN
>> +    big_endian = 1;
>> +#else
>> +    big_endian = 0;
>> +#endif
>> +
>>       if (machine->ram_size > 256 * MiB) {
>>           error_report("RAM size more than 256Mb is not supported");
>>           exit(EXIT_FAILURE);
>> @@ -290,6 +296,7 @@ static void mips_jazz_init(MachineState *machine,
>>               dev = qdev_new("dp8393x");
>>               qdev_set_nic_properties(dev, nd);
>>               qdev_prop_set_uint8(dev, "it_shift", 2);
>> +            qdev_prop_set_bit(dev, "big_endian", big_endian > 0);
>>               object_property_set_link(OBJECT(dev), "dma_mr",
>>                                        OBJECT(rc4030_dma_mr), &error_abort);
>>               sysbus = SYS_BUS_DEVICE(dev);
>>


ATB,

Mark.

