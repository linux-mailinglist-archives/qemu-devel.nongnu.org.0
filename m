Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECBFD2AD709
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 14:03:14 +0100 (CET)
Received: from localhost ([::1]:49532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcTIo-0007Cb-1p
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 08:03:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kcTHC-00060u-RZ
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 08:01:35 -0500
Received: from mout.kundenserver.de ([217.72.192.73]:35433)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kcTH6-0008TW-52
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 08:01:34 -0500
Received: from [192.168.100.1] ([82.252.154.198]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MKKhF-1kskRA1J4J-00LocP; Tue, 10 Nov 2020 14:01:07 +0100
Subject: Re: [PATCH for-5.2 0/3] linux-user: fix various sparc64 guest bugs
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20201105212314.9628-1-peter.maydell@linaro.org>
 <21cd093c-404b-cd9c-2b61-fe1c0957d7f4@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <49766a02-f5a4-0cec-aaf6-70c27d0be9ee@vivier.eu>
Date: Tue, 10 Nov 2020 14:01:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <21cd093c-404b-cd9c-2b61-fe1c0957d7f4@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:j27XtdlhIO9IgTZZgNb1C7pRaWvwPPYwQWV5VBF9aEVZFLTrni4
 GtWu/PW8YhQfRW6dmsU4LS3RJR9ObTif0TYanpxoTFi/JSGTjSuHdLvXDcDuH6NLUibsSQm
 LquJWmg5fdPg+V67a7pEBIzrT05NT6vuXHUeY29+Z6kVDVFShO2E1WAdTv1um+cas7SOLEK
 PQyUjWIJhh6W6FaJf9kUw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:G7cNvVZB400=:yecewnFnY1U+D5UsVziI7G
 hdsL5mIPjPMdl9SDf0EcO3/wGZad2eQihBW3Fq2Sw6O7Ig2KzH8debRbR71VT2LmZNmzv2JoN
 TvBiytNAlLu1UXovRNY5BK1sk/UZfB0wVapD6XJt6k802jpB2VFOjFPhomOrGPucnLlIsapKp
 BJI5gtaIMWcDix3uPwzJprtl3eJUWOAnnoTHiThBuZ9RfE7kgCop/ZA9TpPe9uE6kM8QA9aXK
 r6gOFg4wpb0i40LI9lNpbt1xXEfg++rR/ELXZTBRe1bPPkJ1Q2gSrl1WASipuM35dJQflXJqj
 M24ZPTMYlMGTtj4tOa6YMXjBl1vVS2Hc+OtMwz3TYMYhjZLE6ha13HYm/jN1ixJfeIz7+LpkA
 EU//xNIgkEM+cVcUJWaLAVL6rRjZ821PTZ2BWh9nsTCqlUboKoOOYz1Q2EaCuKOiAE8kx4CSL
 t7es5wjdsA==
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 08:01:09
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Giuseppe Musacchio <thatlemon@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 10/11/2020 à 13:56, Mark Cave-Ayland a écrit :
> On 05/11/2020 21:23, Peter Maydell wrote:
> 
>> This set of patches fixes bugs which were preventing the
>> Debian sparc64 /bin/bash from running:
>>   * the target_ucontext structure put the registers in the
>>     wrong place (missing alignment specifier, mostly)
>>   * the set_context and get_context traps weren't saving fp
>>     and i7, which meant that guest code that did a longjmp would
>>     crash shortly afterwards (SPARC64 uses these traps to
>>     implement setjmp/longjmp)
>>   * we were trying to stuff a 64-bit PC into a uint32_t in
>>     sigreturn, which caused a SEGV on return from a signal handler
>>
>> Review very much desired in particular from anybody who understands
>> SPARC register windows and how we handle them in linux-user for
>> patch 2! The other patches are straightforward.
>>
>> This patchset is sufficient that I can at least chroot into
>> a Debian sparc64 chroot and run basic commands like 'ls' from
>> the shell prompt (together with Giuseppe Musacchio's patch that
>> fixes the stack_t struct).
>>
>> There are clearly a bunch of other bugs in sparc signal handling
>> (starting with the fact that rt_frame support is simply not
>> implemented, but there are also some XXX/FIXME comments about TSTATE
>> save/restore in set/get_context and about the FPU state in the signal
>> frame code). There's also a Coverity issue about accessing off the
>> end of the sregs[] array in the target_mc_fpu struct -- the error is
>> actually harmless (we're accessing into the space in the union for
>> dregs[16..31] which is what we want to be doing) but I'll probably
>> put together a patch to make Coverity happier.
> 
> Thanks Peter! This has been broken for a very long time indeed. Once
> this is merged I should probably look at getting a test environment set up.

+1

With these patches,

on sparc, debootstrap (wheezy) has some issues but after some hacks
around the packages I've been able to build and run LTP.

on sparc64, debootstrap (sid) seems to work well but after that there
are some issues with apt (URI error)

Thanks,
Laurent


