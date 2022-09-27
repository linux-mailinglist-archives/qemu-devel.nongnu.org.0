Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65FA75EBCE1
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 10:12:50 +0200 (CEST)
Received: from localhost ([::1]:47982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od5hx-0005xF-B8
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 04:12:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1od54i-0005B3-Kx
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 03:32:17 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:55057)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1od54d-0001up-3e
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 03:32:16 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MSZDt-1ooOmk31pZ-00SyYK; Tue, 27 Sep 2022 09:32:07 +0200
Message-ID: <3fe34e9b-d82d-7d30-b477-f870bdb3e88d@vivier.eu>
Date: Tue, 27 Sep 2022 09:32:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v3 00/12] linux-user: Add more syscalls, enhance tracing &
 logging enhancements
Content-Language: fr
To: Helge Deller <deller@gmx.de>, Stefan Hajnoczi <stefanha@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220918194555.83535-1-deller@gmx.de>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220918194555.83535-1-deller@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:nh7yAwzotQ4Y9WyWGz6+gmCIMSGpknx8488WSsyJMEnOCRUZYYt
 hONYOBiB7U6SWXfltUua823k/yKq0ZJSJJMyQVIxP8dzzDjVQPxii7cS5//cUAgYrWqYhjg
 ZUXrdsxZU01c4qxiQQCgLcmlhUMkSwSaF/Ssd4P2wz6FPrcLeFvRRSN35RGdFl1bxOtotwP
 88Xim63tfI81JoLzjiItg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:t/BFGtQYsEM=:o76qJE0YDya0zqcTB4PWHs
 jryjv2Rd2GtBuZX71NFhQouWxRhctblYnV44lzxTLnSNyN8ebmZ87kx8C8iFYh1AUHPv/7/Af
 8GdJgxRZXDfWuQZMHFp+pHN9jov4pGCbcQ9A7PBCDw6g3jc2U9cf3DeoWIIJqQkOxLfyRXJsZ
 JdyVKB2+JMHXtpW38LEvKMjBXNmWoqHAFnR2Ui+kXu7Vyp3os7YBRFRNp4YGPmY8l1k96c7TP
 p8nP18bEhgQQxRTJkMdCFLvgEwiafnIGAhlzjAAaOiBlBxX3ImPcrCMYaCEJaGlkOWieymCcj
 9Ukwge/VSvP/oRZnMSpU0unEVBDcrBU2nw0LhOZaQtTzzL9fvQILbiVP72oNQiXhyL0/lCWX3
 Ly6Xfi8LpTjlc3fEOZ94/E0FuG2GY4VzzTywa+TSRfQ5OXqJuUuzJ4KY3UktPFeNL31vNcVvd
 y4F1HOfKRPsmGuiUsVcONHhwiVVmBkNirL+pMvnseLUiBQomd34NGoqxWD/Mh4aJjYrRsmOu8
 x+S8uCwnECNovOFtQ7tPYb3d0p4jv2Ro4SQdw5cIrRNdfHmI2X8TBjMQdzD++rUCe64niSmzX
 bcBOhiH+2BTqW8yNeyCxeU8WkrDhXc/IpvFV8X2g0/OZtzsds03LfP48XCtIiJyVDHqJiOPCa
 IafV1v0N9rLGUnC7rL2aZ60lc1Ey081O0+7GykTlCZ8bAW/RLVFdXa66idqddaBdTj8JITPT1
 DU74QBCvpCm2M1fijXadw+s7yyaIVpfqP/+ywdtGniRtB9zG4pey4Ma17sSTaBZLt7of0wyjM
 p3W/Mn3
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.319,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 18/09/2022 à 21:45, Helge Deller a écrit :
> Here is a bunch of patches for linux-user.
> 
> Most of them add missing syscalls and enhance the tracing/logging.
> Some of the patches are target-hppa specific.
> I've tested those on productive hppa debian buildd servers (running qemu-user).
> 
> Thanks!
> Helge
> 
> Changes to v2:
> - Fix build of close_range() and pidfd_*() patches on older Linux
>    distributions (noticed by Stefan Hajnoczi)
> 
> Changes to v1:
> - Dropped the faccessat2() syscall patch in favour of Richard's patch
> - Various changes to the "missing signals in strace output" patch based on
>    Richard's feedback, e.g. static arrays, fixed usage of _NSIG, fix build when
>    TARGET_SIGIOT does not exist
> - Use FUTEX_CMD_MASK in "Show timespec on strace for futex" patch
>    unconditionally and turn into a switch statement - as suggested by Richard
> 
> Helge Deller (12):
>    linux-user: Add missing signals in strace output
>    linux-user: Add missing clock_gettime64() syscall strace
>    linux-user: Add pidfd_open(), pidfd_send_signal() and pidfd_getfd()
>      syscalls
>    linux-user: Log failing executable in EXCP_DUMP()
>    linux-user/hppa: Use EXCP_DUMP() to show enhanced debug info
>    linux-user/hppa: Dump IIR on register dump
>    linux-user: Fix strace of chmod() if mode == 0
>    linux-user/hppa: Set TASK_UNMAPPED_BASE to 0xfa000000 for hppa arch
>    linux-user: Add strace for clock_nanosleep()
>    linux-user: Show timespec on strace for futex()
>    linux-user: Add close_range() syscall
>    linux-user: Add parameters of getrandom() syscall for strace
> 
>   linux-user/cpu_loop-common.h |   2 +
>   linux-user/hppa/cpu_loop.c   |   6 +-
>   linux-user/mmap.c            |   4 +
>   linux-user/signal-common.h   |  46 ++++++++++++
>   linux-user/signal.c          |  37 +--------
>   linux-user/strace.c          | 142 ++++++++++++++++++++++++++++++-----
>   linux-user/strace.list       |  21 +++++-
>   linux-user/syscall.c         |  50 ++++++++++++
>   target/hppa/helper.c         |   6 +-
>   9 files changed, 255 insertions(+), 59 deletions(-)
> 
> --
> 2.37.3
> 

Series applied to my linux-user-for-7.2 branch,
except PATCH 11 and 12 that have comments.

Thanks,
Laurent
> 


