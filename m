Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9E9463DFF
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Nov 2021 19:47:00 +0100 (CET)
Received: from localhost ([::1]:53682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ms89b-00089k-8C
	for lists+qemu-devel@lfdr.de; Tue, 30 Nov 2021 13:46:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ms878-0007JJ-2e
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 13:44:26 -0500
Received: from [2001:41c9:1:41f::167] (port=57798
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ms875-0007t2-Rz
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 13:44:25 -0500
Received: from [2a00:23c4:8b9f:4900:2b16:6388:bafb:d365]
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ms86q-0005r8-74; Tue, 30 Nov 2021 18:44:12 +0000
To: Peter Maydell <peter.maydell@linaro.org>
References: <32fd9815-11b1-686f-5c2b-9d31c72a64c6@ilande.co.uk>
 <CAFEAcA-4sA+xUkzxoFyXiw=LmEZkJRkBhCx+2YZ7x30Omr+new@mail.gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <cac74117-82d9-63c1-e107-39af293980f9@ilande.co.uk>
Date: Tue, 30 Nov 2021 18:44:10 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-4sA+xUkzxoFyXiw=LmEZkJRkBhCx+2YZ7x30Omr+new@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8b9f:4900:2b16:6388:bafb:d365
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: Odd square bracket encoding in QOM names
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:41c9:1:41f::167
 (failed)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.211,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 30/11/2021 16:41, Peter Maydell wrote:

> On Tue, 30 Nov 2021 at 08:36, Mark Cave-Ayland
> <mark.cave-ayland@ilande.co.uk> wrote:
>> Has there been a recent change as to how square brackets are encoded within QOM
>> names? I noticed that the output has changed here in the "info qom-tree" output in
>> qemu-system-m68k for the q800 machine.
>>
>> The q800 machine has a set of 256 memory region aliases that used to appear in the
>> "info qom-tree" output as:
>>
>>       /mac_m68k.io[100] (memory-region)
>>       /mac_m68k.io[101] (memory-region)
>>       /mac_m68k.io[102] (memory-region)
>>
>> but they now appear as:
>>
>>       /mac_m68k.io\x5b100\x5d[0] (memory-region)
>>       /mac_m68k.io\x5b101\x5d[0] (memory-region)
>>       /mac_m68k.io\x5b102\x5d[0] (memory-region)
> 
> I looked at info qom-tree for an Arm machine, and the [..] seem to be
> OK there. I tried to test with q800 but got stuck on finding a
> command line to get it to run. Do you have repro instructions?

A couple of tests this evening and I think I must have misremembered this - I tried a 
couple of older versions of my various q800 branches (one within the 6.0 dev cycle 
and another within 6.1) and both escape the QOM object name in "info qom-tree" the 
same way as above.

Easiest way to see this is to grab Finn's kernel from issue #611 like this:

$ wget 
https://gitlab.com/qemu-project/qemu/uploads/dead759323116fb22cf0f03b8cdbe15a/vmlinux-5.14-multi.xz
$ unxz vmlinux-5.14-multi.xz

And then start QEMU with this command line:

$ ./qemu-system-m68k -M q800 -kernel vmlinux-5.14-multi -monitor stdio -S

Obviously the cause is the use of square brackets within the memory region name as 
per https://gitlab.com/qemu-project/qemu/-/blob/master/hw/m68k/q800.c#L411, so given 
the escaping has been like this for some time then I guess everything is working as 
intended, and sorry for the noise.


ATB,

Mark.

