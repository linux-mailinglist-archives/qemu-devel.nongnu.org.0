Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1734218C8E4
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Mar 2020 09:22:27 +0100 (CET)
Received: from localhost ([::1]:49272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jFCvC-0001nG-64
	for lists+qemu-devel@lfdr.de; Fri, 20 Mar 2020 04:22:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43969)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1jFCuK-0001NW-Jw
 for qemu-devel@nongnu.org; Fri, 20 Mar 2020 04:21:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1jFCuJ-00081o-BJ
 for qemu-devel@nongnu.org; Fri, 20 Mar 2020 04:21:32 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:43907)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>) id 1jFCuJ-0007yB-2T
 for qemu-devel@nongnu.org; Fri, 20 Mar 2020 04:21:31 -0400
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MwQKp-1jW2tn26uj-00sNEq; Fri, 20 Mar 2020 09:21:18 +0100
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200319092627.51487-1-laurent@vivier.eu>
 <CAFEAcA_rHYVD35BGjHLv9vbevj9dX8FM+H-ctiYVvwiwrkabyg@mail.gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 mQINBFYFJhkBEAC2me7w2+RizYOKZM+vZCx69GTewOwqzHrrHSG07MUAxJ6AY29/+HYf6EY2
 WoeuLWDmXE7A3oJoIsRecD6BXHTb0OYS20lS608anr3B0xn5g0BX7es9Mw+hV/pL+63EOCVm
 SUVTEQwbGQN62guOKnJJJfphbbv82glIC/Ei4Ky8BwZkUuXd7d5NFJKC9/GDrbWdj75cDNQx
 UZ9XXbXEKY9MHX83Uy7JFoiFDMOVHn55HnncflUncO0zDzY7CxFeQFwYRbsCXOUL9yBtqLer
 Ky8/yjBskIlNrp0uQSt9LMoMsdSjYLYhvk1StsNPg74+s4u0Q6z45+l8RAsgLw5OLtTa+ePM
 JyS7OIGNYxAX6eZk1+91a6tnqfyPcMbduxyBaYXn94HUG162BeuyBkbNoIDkB7pCByed1A7q
 q9/FbuTDwgVGVLYthYSfTtN0Y60OgNkWCMtFwKxRaXt1WFA5ceqinN/XkgA+vf2Ch72zBkJL
 RBIhfOPFv5f2Hkkj0MvsUXpOWaOjatiu0fpPo6Hw14UEpywke1zN4NKubApQOlNKZZC4hu6/
 8pv2t4HRi7s0K88jQYBRPObjrN5+owtI51xMaYzvPitHQ2053LmgsOdN9EKOqZeHAYG2SmRW
 LOxYWKX14YkZI5j/TXfKlTpwSMvXho+efN4kgFvFmP6WT+tPnwARAQABtCJMYXVyZW50IFZp
 dmllciA8bGF1cmVudEB2aXZpZXIuZXU+iQI4BBMBAgAiBQJWBTDeAhsDBgsJCAcDAgYVCAIJ
 CgsEFgIDAQIeAQIXgAAKCRDzDDi9Py++PCEdD/oD8LD5UWxhQrMQCsUgLlXCSM7sxGLkwmmF
 ozqSSljEGRhffxZvO35wMFcdX9Z0QOabVoFTKrT04YmvbjsErh/dP5zeM/4EhUByeOS7s6Yl
 HubMXVQTkak9Wa9Eq6irYC6L41QNzz/oTwNEqL1weV1+XC3TNnht9B76lIaELyrJvRfgsp9M
 rE+PzGPo5h7QHWdL/Cmu8yOtPLa8Y6l/ywEJ040IoiAUfzRoaJs2csMXf0eU6gVBhCJ4bs91
 jtWTXhkzdl4tdV+NOwj3j0ukPy+RjqeL2Ej+bomnPTOW8nAZ32dapmu7Fj7VApuQO/BSIHyO
 NkowMMjB46yohEepJaJZkcgseaus0x960c4ua/SUm/Nm6vioRsxyUmWd2nG0m089pp8LPopq
 WfAk1l4GciiMepp1Cxn7cnn1kmG6fhzedXZ/8FzsKjvx/aVeZwoEmucA42uGJ3Vk9TiVdZes
 lqMITkHqDIpHjC79xzlWkXOsDbA2UY/P18AtgJEZQPXbcrRBtdSifCuXdDfHvI+3exIdTpvj
 BfbgZAar8x+lcsQBugvktlQWPfAXZu4Shobi3/mDYMEDOE92dnNRD2ChNXg2IuvAL4OW40wh
 gXlkHC1ZgToNGoYVvGcZFug1NI+vCeCFchX+L3bXyLMg3rAfWMFPAZLzn42plIDMsBs+x2yP
 +bkCDQRWBSYZARAAvFJBFuX9A6eayxUPFaEczlMbGXugs0mazbOYGlyaWsiyfyc3PStHLFPj
 rSTaeJpPCjBJErwpZUN4BbpkBpaJiMuVO6egrC8Xy8/cnJakHPR2JPEvmj7Gm/L9DphTcE15
 92rxXLesWzGBbuYxKsj8LEnrrvLyi3kNW6B5LY3Id+ZmU8YTQ2zLuGV5tLiWKKxc6s3eMXNq
 wrJTCzdVd6ThXrmUfAHbcFXOycUyf9vD+s+WKpcZzCXwKgm7x1LKsJx3UhuzT8ier1L363RW
 ZaJBZ9CTPiu8R5NCSn9V+BnrP3wlFbtLqXp6imGhazT9nJF86b5BVKpF8Vl3F0/Y+UZ4gUwL
 d9cmDKBcmQU/JaRUSWvvolNu1IewZZu3rFSVgcpdaj7F/1aC0t5vLdx9KQRyEAKvEOtCmP4m
 38kU/6r33t3JuTJnkigda4+Sfu5kYGsogeYG6dNyjX5wpK5GJIJikEhdkwcLM+BUOOTi+I9u
 tX03BGSZo7FW/J7S9y0l5a8nooDs2gBRGmUgYKqQJHCDQyYut+hmcr+BGpUn9/pp2FTWijrP
 inb/Pc96YDQLQA1q2AeAFv3Rx3XoBTGl0RCY4KZ02c0kX/dm3eKfMX40XMegzlXCrqtzUk+N
 8LeipEsnOoAQcEONAWWo1HcgUIgCjhJhBEF0AcELOQzitbJGG5UAEQEAAYkCHwQYAQIACQUC
 VgUmGQIbDAAKCRDzDDi9Py++PCD3D/9VCtydWDdOyMTJvEMRQGbx0GacqpydMEWbE3kUW0ha
 US5jz5gyJZHKR3wuf1En/3z+CEAEfP1M3xNGjZvpaKZXrgWaVWfXtGLoWAVTfE231NMQKGoB
 w2Dzx5ivIqxikXB6AanBSVpRpoaHWb06tPNxDL6SVV9lZpUn03DSR6gZEZvyPheNWkvz7bE6
 FcqszV/PNvwm0C5Ju7NlJA8PBAQjkIorGnvN/vonbVh5GsRbhYPOc/JVwNNr63P76rZL8Gk/
 hb3xtcIEi5CCzab45+URG/lzc6OV2nTj9Lg0SNcRhFZ2ILE3txrmI+aXmAu26+EkxLLfqCVT
 ohb2SffQha5KgGlOSBXustQSGH0yzzZVZb+HZPEvx6d/HjQ+t9sO1bCpEgPdZjyMuuMp9N1H
 ctbwGdQM2Qb5zgXO+8ZSzwC+6rHHIdtcB8PH2j+Nd88dVGYlWFKZ36ELeZxD7iJflsE8E8yg
 OpKgu3nD0ahBDqANU/ZmNNarBJEwvM2vfusmNnWm3QMIwxNuJghRyuFfx694Im1js0ZY3LEU
 JGSHFG4ZynA+ZFUPA6Xf0wHeJOxGKCGIyeKORsteIqgnkINW9fnKJw2pgk8qHkwVc3Vu+wGS
 ZiJK0xFusPQehjWTHn9WjMG1zvQ5TQQHxau/2FkP45+nRPco6vVFQe8JmgtRF8WFJA==
Subject: Re: [PULL v3 00/16] Linux user for 5.0 patches
Message-ID: <24977cee-e34d-005f-f8a2-4c14f3f7e1fe@vivier.eu>
Date: Fri, 20 Mar 2020 09:21:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_rHYVD35BGjHLv9vbevj9dX8FM+H-ctiYVvwiwrkabyg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ZaAQUfRQjtlD9onT+jeD0LcsJqYIEx2EDkEyBf53QgicktPPifl
 TurJIlxmipmeSMarEvGdXcKUkQ6w6fspFjLVaIqHXotWokGVooEDSkTgL9ZmUFRKkAURssV
 OdiYHz7esZU7Y/e/zcrCWJY9XctQfzCdfP7Djl2uugMUF0Z2OkTrOQqwqFJ5INfqi+c222+
 v/PGNILJc92+Af+EMS4qA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:pKA1W8UaEk0=:3pEntv5iNDsMcTmjxpYCRH
 48rw21uxhG8crag13g6eQB8u/AoAEn30b/ZBn3AMnVN3UVDtgazaFyWhJhmIANbAhTF0W6eqn
 wi/+XVVOLnJdfVinGNp45VOP4N9x6HpEiOXP+JYsYdm+TrewISGlL2QnTtH3z6vCtHpFb0mOH
 5IYME1z86fTEITqP4fqiIu0VQrUavhMN1yuYEyHB6ldaQ1m0m5CwCCRV02AH8wM7G+JIvDgcg
 58IZJbzz1uqxeX/XTNxJSvnaFF33esVgneSp+KQ9iayNT89PG14cXhtGRYxKKZPYwHgsInydo
 AnGyi7AdkWI7edZ+WhBRfmQ/JL0AhV5MCkBXqdPDgWY0iL1CEz1bfH+DxkX6YhP+FVD0YSFHq
 2ph1PeMTyhvHwgjBaNn45d8GKbzC4K6EOEil4Mw90lp2rckM20ksCJ4iCjeMvB/uXBUwQRrpp
 e5L5RdDTwdHGLes9ifLGY2+YHApPBKWHnpngwXUvH2n23GL44942RHnvGNWd/yBF+XPo1Hl6E
 hW25Sxylz+B29yHR++TX/u/0EkBTAN0mnRIZCzqkp0tnQMjlnin/fnbnKlhyN+SDPO628iHAK
 zIkykRiOFV3kB8aVqTuBD6zS2Q3CiT6DzlCqb5F/D/A/EssLtWtqwZJkvzaMlG4DJN5CbwLlF
 40N0aFzY0idxkdJvyJfKke1rkeqtXtJGf2mMWbTRk3IEwV1cs9TR3CPLKn/HLg6J/5pw0Q+2h
 UXuObigvYXfUbYd07J1L1kyjwkGpU902Z+scVEtPa6ML+iIYUDchHAoq6AGtvzO7qy4JfgLXy
 8AFDCU9oRPGZOKGr1W6wHsBEJZP+YbKgTwAy1ZdsYy2SYzLRbaZZvzCovT/N0qQMaSv/JKO
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.72.192.75
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
Cc: Riku Voipio <riku.voipio@iki.fi>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 19/03/2020 à 21:45, Peter Maydell a écrit :
> On Thu, 19 Mar 2020 at 09:29, Laurent Vivier <laurent@vivier.eu> wrote:
>>
>> The following changes since commit 373c7068dd610e97f0b551b5a6d0a27cd6da4506:
>>
>>   qemu.nsi: Install Sphinx documentation (2020-03-09 16:45:00 +0000)
>>
>> are available in the Git repository at:
>>
>>   git://github.com/vivier/qemu.git tags/linux-user-for-5.0-pull-request
>>
>> for you to fetch changes up to c91518bb0649f09e2c636790603907ef93ea95d4:
>>
>>   linux-user, openrisc: sync syscall numbers with kernel v5.5 (2020-03-19 09:22:21 +0100)
>>
>> ----------------------------------------------------------------
>> update syscall numbers to linux 5.5 (with scripts)
>> add futex_time64/clock_gettime64/clock_settime64
>> add AT_EXECFN
>> Emulate x86_64 vsyscalls
>>
>> v3: remove syscall.tbl series
>> v2: guard copy_to_user_timezone() with TARGET_NR_gettimeofday
>>     remove "Support futex_time64" patch
>>     guard sys_futex with TARGET_NR_exit
>>
>> ----------------------------------------------------------------
> 
> Still fails:
> 
> /home/petmay01/linaro/qemu-for-merges/build/all-linux-static/x86_64-linux-user/qemu-x86_64
> -L ./gnemul/qemu-x86_64 x86_64/ls -l dummyfile
> qemu: 0x40008117e9: unhandled CPU exception 0x101 - aborting
> RAX=000000000000003f RBX=000000006ffffe34 RCX=0000004000800b18
> RDX=0000004000813180
> RSI=0000000000000064 RDI=0000004000800670 RBP=000000006fffff40
> RSP=0000004000800668
> R8 =0000000000000000 R9 =0000004000800b45 R10=0000004000801a18
> R11=0000004000801260
> R12=00000040008008c0 R13=0000000000000008 R14=0000000000400040
> R15=00000040008032d0
> RIP=00000040008117e9 RFL=00000246 [---Z-P-] CPL=3 II=0 A20=1 SMM=0 HLT=0
> ES =0000 0000000000000000 00000000 00000000
> CS =0033 0000000000000000 ffffffff 00effb00 DPL=3 CS64 [-RA]
> SS =002b 0000000000000000 ffffffff 00cff300 DPL=3 DS   [-WA]
> DS =0000 0000000000000000 00000000 00000000
> FS =0000 0000000000000000 00000000 00000000
> GS =0000 0000000000000000 00000000 00000000
> LDT=0000 0000000000000000 0000ffff 00008200 DPL=0 LDT
> TR =0000 0000000000000000 0000ffff 00008b00 DPL=0 TSS64-busy
> GDT=     000000400091a000 0000007f
> IDT=     0000004000919000 000001ff
> CR0=80010001 CR2=0000000000000000 CR3=0000000000000000 CR4=00000220
> DR0=0000000000000000 DR1=0000000000000000 DR2=0000000000000000
> DR3=0000000000000000
> DR6=00000000ffff0ff0 DR7=0000000000000400
> EFER=0000000000000500
> Makefile:6: recipe for target 'test' failed
> make: *** [test] Error 127
> 

As the patches remaining in the series don't play anymore with the
dependencies, I think the problem is already existing in master and
adding the vsyscalls series that modifies a value in cpu.h only triggers it.

So, what can I do?

1- I can send my v2 without the vsyscalls series, the problem would not
be triggered anymore,

2- I can send my v3 without the vsyscalls series, the problem would not
be triggered anymore too (but some fixes will be missing in syscall_nr.h)

3- I can resend the v2 and doesn't care of the problem as a make clean
should make it disapear (moreover I didn't reproduce it and it seems it
only happens on a merge, according to Richard),

4- I can search what happens in master and fix it (but I don't really
have the time for that...)

Personnaly, I would prefer solution 3...

Thanks,
Laurent

