Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C55407EB6
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Sep 2021 18:47:53 +0200 (CEST)
Received: from localhost ([::1]:35598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPSe0-0007Kx-Rx
	for lists+qemu-devel@lfdr.de; Sun, 12 Sep 2021 12:47:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mPScB-0006L3-Q0
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 12:45:59 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:35432
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mPScA-0001kv-CE
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 12:45:59 -0400
Received: from host109-153-76-56.range109-153.btcentralplus.com
 ([109.153.76.56] helo=[192.168.50.176])
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mPSc3-0006fO-6a; Sun, 12 Sep 2021 17:45:55 +0100
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, laurent@vivier.eu
References: <20210912074914.22048-1-mark.cave-ayland@ilande.co.uk>
 <20210912074914.22048-8-mark.cave-ayland@ilande.co.uk>
 <439e516b-baac-0334-ba61-87c21e666506@amsat.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <f7c0c60a-a35b-ac82-71d2-40ccb55a302e@ilande.co.uk>
Date: Sun, 12 Sep 2021 17:45:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <439e516b-baac-0334-ba61-87c21e666506@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 109.153.76.56
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 07/20] nubus: add trace-events for unassigned slot accesses
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.584,
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

On 12/09/2021 16:18, Philippe Mathieu-Daudé wrote:

> On 9/12/21 9:49 AM, Mark Cave-Ayland wrote:
>> These allow tracing of the Nubus enumeration process by the guest OS.
>>
>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>> ---
>>   hw/nubus/nubus-bus.c  | 10 +++++++---
>>   hw/nubus/trace-events |  7 +++++++
>>   hw/nubus/trace.h      |  1 +
>>   meson.build           |  1 +
>>   4 files changed, 16 insertions(+), 3 deletions(-)
>>   create mode 100644 hw/nubus/trace-events
>>   create mode 100644 hw/nubus/trace.h
> 
>> @@ -38,7 +40,7 @@ static const MemoryRegionOps nubus_slot_ops = {
>>       .endianness = DEVICE_BIG_ENDIAN,
>>       .valid = {
>>           .min_access_size = 1,
>> -        .max_access_size = 1,
>> +        .max_access_size = 4,
>>       },
>>   };
> 
> This patch does a bit more that what is described.

Ah oops - presumably one of the OSs I was testing was probing with 32-bit accesses 
instead of 8-bit accesses and I made the adjustment to ensure the bus enumeration for 
empty slots appeared in the trace events.

I'll update the commit message accordingly.

>> @@ -60,7 +64,7 @@ static const MemoryRegionOps nubus_super_slot_ops = {
>>       .endianness = DEVICE_BIG_ENDIAN,
>>       .valid = {
>>           .min_access_size = 1,
>> -        .max_access_size = 1,
>> +        .max_access_size = 4,
>>       },
>>   };


ATB,

Mark.

