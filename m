Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3AAC4075D0
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Sep 2021 11:32:10 +0200 (CEST)
Received: from localhost ([::1]:35126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOzMn-0005wX-NX
	for lists+qemu-devel@lfdr.de; Sat, 11 Sep 2021 05:32:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mOzLI-0004VJ-GW
 for qemu-devel@nongnu.org; Sat, 11 Sep 2021 05:30:36 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:34520
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mOzLG-0006y8-Hj
 for qemu-devel@nongnu.org; Sat, 11 Sep 2021 05:30:36 -0400
Received: from host86-140-11-91.range86-140.btcentralplus.com ([86.140.11.91]
 helo=[192.168.50.176])
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mOzL6-0009Kk-OF; Sat, 11 Sep 2021 10:30:28 +0100
To: Helge Konetzka <hk@zapateado.de>, Howard Spoelstra <hsp.cat7@gmail.com>
References: <6755edb6-f953-4ca2-a4b6-31e4566e9842@zapateado.de>
 <af33f36e-e319-e95c-36bc-9c77f4ad81b8@redhat.com>
 <e7df1647-439a-9bda-5c7b-30ab0290d587@zapateado.de>
 <CABLmASEuNT2WVocMwakuhhYDvVBB0YdFueP24ULRFQ1Z35eKPg@mail.gmail.com>
 <6ae0c8d0-4601-4c2c-c0cd-590f2a86a104@ilande.co.uk>
 <43043204-cb7a-5726-ecfc-9dad504f6aa3@zapateado.de>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <3e6ea8d1-b275-206c-1888-eb3cfc2c7ebe@ilande.co.uk>
Date: Sat, 11 Sep 2021 10:30:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <43043204-cb7a-5726-ecfc-9dad504f6aa3@zapateado.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.140.11.91
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [qemu-web PATCH] Fix link to Windows page in Wiki
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.349,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/09/2021 10:17, Helge Konetzka wrote:

> Am 11.09.21 um 11:03 schrieb Mark Cave-Ayland:
> 
>> So the question is: what has changed? I find it hard to believe that MSYS2/MingW64 
>> is configured out-of-the-box to break a standard "./configure && make" build 
>> incantation.
>>
> 
> On my last attempt to build qemu without --cross-prefix=x86_64-w64-mingw32- 
> (qemu-6.1.0.tar.xz) for building target soft-mmu-x86_64 I received
> 
> make[1]: *** No rule to make target 'multiboot.bin', needed by 'all'.  Stop.
> make: *** [Makefile:189: pc-bios/optionrom/all] Error 2
> make: *** Waiting for unfinished jobs....
> ...
> [1599/1599] Generating QAPI rST doc reference newline-sanitized with a custom command 
> (wrapped by meson to capture output)
> ==> ERROR: A failure occurred in build().
>      Aborting...

Ah the multiboot.bin failure is a known issue with symlinks - see 
https://www.mail-archive.com/qemu-devel@nongnu.org/msg750968.html and unfortunately 
the wiki didn't get updated accordingly :(

Helge, can you test and see if this fixes your build issue?


ATB,

Mark.

