Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E5C6D892F
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 23:03:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkAGg-0007JW-1K; Wed, 05 Apr 2023 17:02:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pkAGc-0007JC-L1
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 17:02:06 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pkAGZ-0002Xl-D1
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 17:02:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Aw20wDkzuV0QVQ7CHVvmFxZ8aKmFM4PkVcG/xn24lSk=; b=RIubAwr07XvXQLMAO6onbyBys1
 34q5AoDHx6ANgAdIu5+tQ8VRHoOHECEGqJkl4CcPnrc3Kx5t/7sUnTumeWXDonKh4nAzvPqb/J5U5
 r4CHpz45WduyBHUne01Tbh/9Gx/ALHeVQQUdycE+JDrs2GbPEGMGR1Od+uw8gAXRitq9PlMie5wWB
 atnTBL6WjjhxOo17o3KxO8U7llbGHCODiOEeXP9JMge6Z1X7RLstQ+VNuWPQo2XwLY//9NS66wI2b
 xp+JfslFsp5UnP9YuUB3AVyYNYKzS1VDaTS5RDinJ0G9zIMrCCGk/Xn98IJ8VDEzhtyeTpRi6ED7e
 Nvn5QlJ4i45U0EkOjfbnCTAGZSOz9NfEfzy+leCfumyKLrjvLq/CqlTezZOpW7Ov8J9wbcoudS11U
 mcMET14iIAIB9Ylt4tvGpBCTYFlpJDibT7rY1BLzQpNjBgysNqT/IktHEWGFKkAhk3uSKsHWuY4KQ
 ODXwod+7ibQuyMioY84UkZJ+BLlK9RDQjZcVwo2HdzCbq3SihGZTjcfKWfj4pomrQRpjcwDzSGeqY
 VjL7kUgiZ7GjMMmPh6upy/JhziFHcMXxw8UPvBEtK/zOFwK9trN4ecdZoapbHYyRo0WTzragvI79H
 r9ogN8ExEcEb/Wd5xnIDu9b66B4P+N0IBXdSeXdW0=;
Received: from [2a00:23c4:8bac:6900:b726:cf58:4c12:f013]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pkAFb-00033y-Ll; Wed, 05 Apr 2023 22:01:04 +0100
Message-ID: <1cfdad4a-0868-a9aa-4afb-af22c6aa7f93@ilande.co.uk>
Date: Wed, 5 Apr 2023 22:01:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Cedric Le Goater <clegoate@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, libvir-list@redhat.com,
 Paolo Bonzini <pbonzini@redhat.com>, Reinoud Zandijk <reinoud@netbsd.org>,
 Ryo ONODERA <ryoon@netbsd.org>, Brad Smith <brad@comstyle.com>,
 Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org
References: <20230130114428.1297295-1-thuth@redhat.com>
 <CAFEAcA89Onb9Dg4zJXQ0Ys-0kJ2-hz5KYRPXMCE7PWDDxVzDyQ@mail.gmail.com>
 <Y9exrDWT2NUoinu1@redhat.com> <87h6w7694t.fsf@linaro.org>
 <dbc8b2f6-3e9e-65d7-998f-568b6376d25c@ilande.co.uk>
 <4e42ea6b-0f9b-69e0-1593-c3288712d13c@redhat.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <4e42ea6b-0f9b-69e0-1593-c3288712d13c@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8bac:6900:b726:cf58:4c12:f013
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [RFC PATCH] docs/about/deprecated: Deprecate 32-bit host systems
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.355,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 04/04/2023 15:00, Thomas Huth wrote:

> On 05/02/2023 23.12, Mark Cave-Ayland wrote:
>> On 30/01/2023 20:45, Alex Bennée wrote:
>>
>>> Daniel P. Berrangé <berrange@redhat.com> writes:
>>>
>>>> On Mon, Jan 30, 2023 at 11:47:02AM +0000, Peter Maydell wrote:
>>>>> On Mon, 30 Jan 2023 at 11:44, Thomas Huth <thuth@redhat.com> wrote:
>>>>>>
>>>>>> Testing 32-bit host OS support takes a lot of precious time during the QEMU
>>>>>> contiguous integration tests, and considering that many OS vendors stopped
>>>>>> shipping 32-bit variants of their OS distributions and most hardware from
>>>>>> the past >10 years is capable of 64-bit
>>>>>
>>>>> True for x86, not necessarily true for other architectures.
>>>>> Are you proposing to deprecate x86 32-bit, or all 32-bit?
>>>>> I'm not entirely sure about whether we're yet at a point where
>>>>> I'd want to deprecate-and-drop 32-bit arm host support.
>>>>
>>>> Do we have a feeling on which aspects of 32-bit cause us the support
>>>> burden ? The boring stuff like compiler errors from mismatched integer
>>>> sizes is mostly quick & easy to detect simply through a cross compile.
>>>>
>>>> I vaguely recall someone mentioned problems with atomic ops in the past,
>>>> or was it 128-bit ints, caused implications for the codebase ?
>>>
>>> Atomic operations on > TARGET_BIT_SIZE and cputlb when
>>> TCG_OVERSIZED_GUEST is set. Also the core TCG code and a bunch of the
>>> backends have TARGET_LONG_BITS > TCG_TARGET_REG_BITS ifdefs peppered
>>> throughout.
>>
>> I am one of an admittedly small group of people still interested in using KVM-PR on 
>> ppc32 to boot MacOS, although there is some interest on using 64-bit KVM-PR to run 
>> super-fast MacOS on modern Talos hardware.
>>
>>  From my perspective losing the ability to run 64-bit guests on 32-bit hardware 
>> with TCG wouldn't be an issue, as long as it were still possible to use 
>> qemu-system-ppc on 32-bit hardware using both TCG and KVM to help debug the 
>> remaining issues.
> 
>   Hi Mark!
> 
> Just out of curiosity (since we briefly talked about 32-bit KVM on ppc in today's 
> QEMU/KVM call - in the context of whether qemu-system-ppc64 is a proper superset of 
> qemu-system-ppc when it comes to building a unified qemu-system binary): What host 
> machine are you using for running KVM-PR? And which QEMU machine are you using for 
> running macOS? The mac99 or the g3beige machine?

I'm using a G4 Mac Mini for my KVM experiments running Debian ports which is fairly 
up to date e.g. gcc-12 for building QEMU. Both the mac99 and g3beige machines will 
boot up to the OS X 10.2 installer on my current (custom) 5.1 kernel.

> Unrelated to KVM: Do you happen to know whether there are any problems when running 
> 32-bit guests with TCG with the mac99 or g3beige machine while using qemu-system-ppc64 ?

I'm not sure as I don't run qemu-system-ppc64 on a regular basis, but I have heard 
from people in the past who have happily used it to boot 64-bit Linux.

(goes and turns on the Mac Mini)

A quick test this evening shows that latest git master builds qemu-system-ppc and 
runs fine with -accel=kvm on the Mac Mini, however something now asserts with 
-accel=tcg on startup which didn't happen before:


Thread 1 "qemu-system-ppc" received signal SIGSEGV, Segmentation fault.
tcg_tb_alloc (s=0x1) at ../tcg/tcg.c:1025
1025        tb = (void *)ROUND_UP((uintptr_t)s->code_gen_ptr, align);
(gdb) bt
#0  0x00ad4148 in tcg_tb_alloc (s=0x1) at ../tcg/tcg.c:1025
#1  0x00ad34c8 in tcg_context_init (max_cpus=1) at ../tcg/tcg.c:959
#2  0x00ad34c8 in tcg_init (tb_size=0, splitwx=0, max_cpus=max_cpus@entry=1) at 
../tcg/tcg.c:1010
#3  0x00b3b784 in tcg_init_machine (ms=<optimized out>) at ../accel/tcg/tcg-all.c:127
#4  0x008dc784 in accel_init_machine (accel=accel@entry=0x159f8c0, ms=0x1538000) at 
../accel/accel-softmmu.c:39
#5  0x00869184 in do_configure_accelerator (opaque=opaque@entry=0xbffff2ac, 
opts=opts@entry=0x159f4f0, errp=errp@entry=0x13694cc <error_fatal>) at 
../softmmu/vl.c:2224
#6  0x00d8e13c in qemu_opts_foreach (list=<optimized out>, func=func@entry=0x869010 
<do_configure_accelerator>, opaque=opaque@entry=0xbffff2ac, errp=errp@entry=0x13694cc 
<error_fatal>)
     at ../util/qemu-option.c:1135
#7  0x0086c3b4 in configure_accelerators (progname=<optimized out>) at 
../softmmu/vl.c:2293
#8  0x0086c3b4 in qemu_init (argc=<optimized out>, argv=<optimized out>) at 
../softmmu/vl.c:3561
#9  0x0060acd4 in main (argc=<optimized out>, argv=<optimized out>) at 
../softmmu/main.c:47


Richard, any thoughts on this at all?


ATB,

Mark.

