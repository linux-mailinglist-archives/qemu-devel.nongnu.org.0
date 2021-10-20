Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62ED5434C30
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 15:35:07 +0200 (CEST)
Received: from localhost ([::1]:54950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdBkI-0005Tx-GE
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 09:35:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mdBhf-0002bU-Uh
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 09:32:25 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:56374
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mdBhe-0002Su-8C
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 09:32:23 -0400
Received: from [2a00:23c4:8b9d:f500:9396:df17:737c:b32c]
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mdBhJ-0000yP-0o; Wed, 20 Oct 2021 14:32:01 +0100
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20211013212132.31519-1-mark.cave-ayland@ilande.co.uk>
 <20211013212132.31519-9-mark.cave-ayland@ilande.co.uk>
 <40098631-e3de-b334-43a7-e0e7ff2751c4@vivier.eu>
 <20e94c6d-99e7-2ecd-412d-20265ab43c97@ilande.co.uk>
 <e17830c6-2b0c-c42e-423d-a1008da8a82f@vivier.eu>
 <1e25bce7-4b37-0e42-7b99-6b173e255262@ilande.co.uk>
 <50238fee-e5ae-671a-59cd-b46b41d1f6ff@vivier.eu>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <af27fff4-c85d-55ae-067c-1b886ea2aab6@ilande.co.uk>
Date: Wed, 20 Oct 2021 14:32:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <50238fee-e5ae-671a-59cd-b46b41d1f6ff@vivier.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8b9d:f500:9396:df17:737c:b32c
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 8/8] q800: add NMI handler
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.267,
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

On 17/10/2021 17:56, Laurent Vivier wrote:

> Le 17/10/2021 à 12:00, Mark Cave-Ayland a écrit :
> ...
>> I've just tried this on Linux, and it seems to work okay although I get several copies of the
>> register dump on the console for a single invocation of "info nmi" e.g.
>>
>> [    4.610000] Non-Maskable Interrupt
>> [    4.610000] Modules linked in: mac_esp(+) esp_scsi macsonic
>> [    4.610000] PC: [<00002dc0>] arch_cpu_idle+0x4/0x6
>> [    4.610000] SR: 2000  SP: (ptrval)  a2: 00395314
>> [    4.610000] d0: 00000000    d1: 00000002    d2: 0004b492    d3: 00392000
>> [    4.610000] d4: 00000000    d5: 00000000    a0: 00392000    a1: 00395314
>> [    4.610000] Process swapper (pid: 0, task=(ptrval))
>> [    4.610000] Frame format=0
>> [    4.610000] Stack from 00393f9c:
>> [    4.610000]         0004b540 00000431 0040ee22 0004b4c4 0002bf6a 004005f0 00393ff8 0004b714
>> [    4.610000]         0003e23a 0029c518 000000c2 0040eb54 3dc1e5d0 00000000 0004ff74 0003efe2
>> [    4.610000]         003f4e92 00000000 00000040 00000000 00000000 00000000 0040ee22 00000000
>> [    4.610000]         003f3872
>> [    4.610000] Call Trace: [<0004b540>] do_idle+0x7c/0xd2
>> [    4.610000]  [<0004b4c4>] do_idle+0x0/0xd2
>> [    4.610000]  [<0002bf6a>] kernel_thread+0x0/0x26
>> [    4.610000]  [<004005f0>] __alloc_bootmem+0x0/0x38
>> [    4.610000]  [<0004b714>] cpu_startup_entry+0xe/0x12
>> [    4.610000]  [<0003e23a>] find_task_by_pid_ns+0x0/0x22
>> [    4.610000]  [<0029c518>] rest_init+0x78/0x82
>> [    4.610000]  [<0004ff74>] printk+0x0/0x18
>> [    4.610000]  [<0003efe2>] parse_args+0x0/0x2c2
>> [    4.610000]  [<003f4e92>] start_kernel+0x43e/0x448
>> [    4.610000]  [<003f3872>] _sinittext+0x872/0x11f8
>> [    4.610000] Code: bc00 0060 f210 f0ff 7001 60cc 4e72 2000 <4e75> 2079 003b fc6c 4a88 6702 4e90
>> 60fe 2079 003b fc68 4a88 6702 4e90 60fe 2f0c
>>
>> (repeated 7 or 8 times)
>>
>> MacsBug seems to handle this better: as soon as the NMI is triggered, MacsBug opens and displays
>> "NMI" both if the programmer switch GPIO is held active, or pulsed as implemented in the patch. When
>> using the above patch, subsequent NMI triggers do not display "NMI" or change MacsBug in any visible
>> way which suggests that once the NMI is triggered, the NMI is ignored until the programmers switch
>> GPIO is inactive once again.
>>
>> Do you see the repeated register output in Linux for a single press of the programmers switch on a
>> real Quadra 800? It may be that Linux could be improved by having similar logic.
> 
> In fact, register output is repeated while I keep the button pressed (5.14 kernel provided by Finn)
> 
> If I press and release one (or several) time(s) before the end of the first output I have only one
> output.

Thanks, that makes sense - my guess is that the repeated output in QEMU is just a 
symptom of the QEMU machine being much faster than the real one.


ATB,

Mark.

