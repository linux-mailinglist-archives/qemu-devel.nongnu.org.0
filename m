Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9D34AA841
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Feb 2022 12:04:45 +0100 (CET)
Received: from localhost ([::1]:42568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGIs0-0005X8-5o
	for lists+qemu-devel@lfdr.de; Sat, 05 Feb 2022 06:04:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nGIps-0004Vb-Tb
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 06:02:35 -0500
Received: from [2001:41c9:1:41f::167] (port=48614
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nGIpq-0007eu-DB
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 06:02:32 -0500
Received: from [2a00:23c4:8ba0:ca00:d4eb:dbd5:5a41:aefe]
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nGIpH-00094M-Hs; Sat, 05 Feb 2022 11:01:59 +0000
Message-ID: <c420951b-1162-ffc0-a967-a66d797f0c0f@ilande.co.uk>
Date: Sat, 5 Feb 2022 11:02:21 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org
References: <20210705123721.65BDC745708@zero.eik.bme.hu>
 <dc5e448d-e964-817d-013-6dea2be32a5d@eik.bme.hu>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <dc5e448d-e964-817d-013-6dea2be32a5d@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba0:ca00:d4eb:dbd5:5a41:aefe
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH] input/adb: Only include where needed
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:41c9:1:41f::167
 (failed)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 27/01/2022 23:39, BALATON Zoltan wrote:

> On Mon, 5 Jul 2021, BALATON Zoltan wrote:
>> The header hw/input/adb.h is included by some files that don't need
>> it. Clean it up and include only where necessary.
> 
> When you're touching mos6522, I've also have this patch that cleans up includes 
> that's somewhat related to mos6522 so you could consider it to be included in your 
> series. I haven't checked but it should still apply. At least I got no problem with 
> rebasing so at least with --3way should probably work but if not I can resend just 
> let me know.

I have a vague memory that someone was advocating a while back for the opposite of 
this patch in the way it uses headers i.e. the .c file should contain the include for 
the header as well as the .h file, so I'm not sure what the recommendation is here.

The parts related to tidying up the mos6522.c and mos6522.h includes look correct 
though, as they shouldn't be referencing any ADB headers.


ATB,

Mark.

>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>> ---
>> hw/misc/macio/cuda.c         | 2 --
>> hw/misc/macio/pmu.c          | 3 ---
>> hw/misc/mos6522.c            | 1 -
>> hw/ppc/mac.h                 | 2 --
>> include/hw/misc/mac_via.h    | 1 +
>> include/hw/misc/macio/cuda.h | 1 +
>> include/hw/misc/macio/pmu.h  | 1 +
>> include/hw/misc/mos6522.h    | 3 +--
>> 8 files changed, 4 insertions(+), 10 deletions(-)
>>
>> diff --git a/hw/misc/macio/cuda.c b/hw/misc/macio/cuda.c
>> index edbd4186b2..584d81dc22 100644
>> --- a/hw/misc/macio/cuda.c
>> +++ b/hw/misc/macio/cuda.c
>> @@ -28,8 +28,6 @@
>> #include "hw/ppc/mac.h"
>> #include "hw/qdev-properties.h"
>> #include "migration/vmstate.h"
>> -#include "hw/input/adb.h"
>> -#include "hw/misc/mos6522.h"
>> #include "hw/misc/macio/cuda.h"
>> #include "qapi/error.h"
>> #include "qemu/timer.h"
>> diff --git a/hw/misc/macio/pmu.c b/hw/misc/macio/pmu.c
>> index 71924d4768..eb746aee34 100644
>> --- a/hw/misc/macio/pmu.c
>> +++ b/hw/misc/macio/pmu.c
>> @@ -33,10 +33,7 @@
>> #include "hw/ppc/mac.h"
>> #include "hw/qdev-properties.h"
>> #include "migration/vmstate.h"
>> -#include "hw/input/adb.h"
>> #include "hw/irq.h"
>> -#include "hw/misc/mos6522.h"
>> -#include "hw/misc/macio/gpio.h"
>> #include "hw/misc/macio/pmu.h"
>> #include "qapi/error.h"
>> #include "qemu/timer.h"
>> diff --git a/hw/misc/mos6522.c b/hw/misc/mos6522.c
>> index 1c57332b40..359bd64dea 100644
>> --- a/hw/misc/mos6522.c
>> +++ b/hw/misc/mos6522.c
>> @@ -25,7 +25,6 @@
>>  */
>>
>> #include "qemu/osdep.h"
>> -#include "hw/input/adb.h"
>> #include "hw/irq.h"
>> #include "hw/misc/mos6522.h"
>> #include "hw/qdev-properties.h"
>> diff --git a/hw/ppc/mac.h b/hw/ppc/mac.h
>> index 22c8408078..3fad371701 100644
>> --- a/hw/ppc/mac.h
>> +++ b/hw/ppc/mac.h
>> @@ -30,8 +30,6 @@
>> #include "exec/memory.h"
>> #include "hw/boards.h"
>> #include "hw/sysbus.h"
>> -#include "hw/input/adb.h"
>> -#include "hw/misc/mos6522.h"
>> #include "hw/pci/pci_host.h"
>> #include "hw/pci-host/uninorth.h"
>> #include "qom/object.h"
>> diff --git a/include/hw/misc/mac_via.h b/include/hw/misc/mac_via.h
>> index 3058b30685..ada338eff1 100644
>> --- a/include/hw/misc/mac_via.h
>> +++ b/include/hw/misc/mac_via.h
>> @@ -12,6 +12,7 @@
>> #include "exec/memory.h"
>> #include "hw/sysbus.h"
>> #include "hw/misc/mos6522.h"
>> +#include "hw/input/adb.h"
>> #include "qom/object.h"
>>
>>
>> diff --git a/include/hw/misc/macio/cuda.h b/include/hw/misc/macio/cuda.h
>> index a71deec968..8a6678c749 100644
>> --- a/include/hw/misc/macio/cuda.h
>> +++ b/include/hw/misc/macio/cuda.h
>> @@ -26,6 +26,7 @@
>> #ifndef CUDA_H
>> #define CUDA_H
>>
>> +#include "hw/input/adb.h"
>> #include "hw/misc/mos6522.h"
>> #include "qom/object.h"
>>
>> diff --git a/include/hw/misc/macio/pmu.h b/include/hw/misc/macio/pmu.h
>> index 78237d99a2..306e59ba6e 100644
>> --- a/include/hw/misc/macio/pmu.h
>> +++ b/include/hw/misc/macio/pmu.h
>> @@ -10,6 +10,7 @@
>> #ifndef PMU_H
>> #define PMU_H
>>
>> +#include "hw/input/adb.h"
>> #include "hw/misc/mos6522.h"
>> #include "hw/misc/macio/gpio.h"
>> #include "qom/object.h"
>> diff --git a/include/hw/misc/mos6522.h b/include/hw/misc/mos6522.h
>> index fc95d22b0f..862b3f5642 100644
>> --- a/include/hw/misc/mos6522.h
>> +++ b/include/hw/misc/mos6522.h
>> @@ -27,9 +27,8 @@
>> #ifndef MOS6522_H
>> #define MOS6522_H
>>
>> -#include "exec/memory.h"
>> +#include "exec/hwaddr.h"
>> #include "hw/sysbus.h"
>> -#include "hw/input/adb.h"
>> #include "qom/object.h"
>>
>> /* Bits in ACR */
>>


