Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C50938710A
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 07:14:50 +0200 (CEST)
Received: from localhost ([::1]:33844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lis49-0001tJ-5H
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 01:14:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lis2f-0000am-QK
 for qemu-devel@nongnu.org; Tue, 18 May 2021 01:13:17 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:56265)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lis2d-0002un-3m
 for qemu-devel@nongnu.org; Tue, 18 May 2021 01:13:17 -0400
Received: from [192.168.100.1] ([82.142.31.78]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1N1g3U-1lKlXM3Jua-011yVu for <qemu-devel@nongnu.org>; Tue, 18 May 2021
 07:13:13 +0200
Subject: Re: [PULL 00/59] Linux user for 6.1 patches
To: qemu-devel@nongnu.org
References: <162127895597.13007.13692054591060168843@d887ba82c771>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <82615bb2-aced-4770-9894-4d975284af0f@vivier.eu>
Date: Tue, 18 May 2021 07:13:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <162127895597.13007.13692054591060168843@d887ba82c771>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:rWt0sITH8ufyvX8GIOuumTuPVxY3WXsQJWrBYmE7Z0roaPgJ898
 GWFkofizuvBKkYf8qTnC/BbzXzFu73kPFvUNynaKZk64ZKMwWPA71FS9kTdt3HvSRhV93ue
 VBqyIjIsrhaarrwaL7BsFu9QWdND50oFiXuR+cvIjpJBhHr9MY8XeKrJ3GFdnLNkszdGPEe
 IYRpx3Dp3sbQgFVJTSt0w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:EaUdM9mN7dU=:IpdfbZ5AKCMvIfYfKlahll
 /whxgC/vIxUADN2td3AHncVFA3RnAYlQ0EijsOq9msb+C61injFpIUoWsk+/p/PAKaIy8/2Ek
 oNUYc2q7Alod4tXYps73pEL+AsnisT8085AF+kGYaDuDrRR7k1umcSe0ku5sWJyDx1QNd72Nd
 ZHl3prp2e5e1ngpW2BEMlSBo6vY2Dqwt0gOHeOwZ5rloo1Vik8uHO3nJ/K8hI8IYGq/a3yoKF
 kPtQrb/rmrUQ6krLhvOitc74Q/QkoQXiTPf4LJGMhfzEv2LuAKK8ToeeTPB8/UrDZKvmcAUNN
 I1YEG1E4IEyb6CBTt6auFNXXQE+Uhh2C166IvoGHnScc45IZApOv28D4rxS+19TXE5BAdd4t2
 ijNfrY9TsptZEznEQETZOOaDPRFmwwiLUBtP+IARXYxvciJQEohYydWLQbh2qh2mOnDik+1X4
 tXLnUYZIVUSPmDVhdJlI19ETNm7neFpJWIiCgNcLq8rWMw6X/ZtqpTbR4F8BEtA6Ge1IU2AQY
 ogEujdljNQGFbYggycxOeI=
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

I'm going to send an updated PR with fixes for problem reported by checkpatch.

Thanks,
Laurent

Le 17/05/2021 à 21:15, no-reply@patchew.org a écrit :
> Patchew URL: https://patchew.org/QEMU/20210517181424.8093-1-laurent@vivier.eu/
> 
> 
> 
> Hi,
> 
> This series seems to have some coding style problems. See output below for
> more information:
> 
> Type: series
> Message-id: 20210517181424.8093-1-laurent@vivier.eu
> Subject: [PULL 00/59] Linux user for 6.1 patches
> 
> === TEST SCRIPT BEGIN ===
> #!/bin/bash
> git rev-parse base > /dev/null || exit 0
> git config --local diff.renamelimit 0
> git config --local diff.renames True
> git config --local diff.algorithm histogram
> ./scripts/checkpatch.pl --mailback base..
> === TEST SCRIPT END ===
> 
> Updating 3c8cf5a9c21ff8782164d1def7f44bd888713384
> From https://github.com/patchew-project/qemu
>    32de74a..367196c  master     -> master
>  - [tag update]      patchew/20210517174947.1199649-1-philmd@redhat.com -> patchew/20210517174947.1199649-1-philmd@redhat.com
>  * [new tag]         patchew/20210517181424.8093-1-laurent@vivier.eu -> patchew/20210517181424.8093-1-laurent@vivier.eu
> Switched to a new branch 'test'
> 7db920b linux-user/elfload: add s390x core dumping support
> 5b6f11c linux-user/elfload: fix filling psinfo->pr_psargs
> 2b8cc26 linux-user: Tidy TARGET_NR_rt_sigaction
> e1e89de linux-user/alpha: Share code for TARGET_NR_sigaction
> 9872e82 linux-user/alpha: Define TARGET_ARCH_HAS_KA_RESTORER
> 49f59b4 linux-user: Honor TARGET_ARCH_HAS_SA_RESTORER in do_syscall
> e63cb74 linux-user: Pass ka_restorer to do_sigaction
> ce80cea linux-user/alpha: Rename the sigaction restorer field
> 59a7fe5 linux-user/alpha: Fix rt sigframe return
> ede5d61 linux-user: use GDateTime for formatting timestamp for core file
> d9c71e6 linux-user: Fix erroneous conversion in copy_file_range
> 00d88c8 linux-user: Add copy_file_range to strace.list
> b563b62 linux-user/s390x: Handle vector regs in signal stack
> 75cbffb linux-user/s390x: Clean up signal.c
> 9c32aac linux-user/s390x: Add build asserts for sigset sizes
> 0bec884 linux-user/s390x: Fix frame_addr corruption in setup_frame
> b197ab9 linux-user/s390x: Add stub sigframe argument for last_break
> bd5b9e8 linux-user/s390x: Set psw.mask properly for the signal handler
> fe8d7a1 linux-user/s390x: Clean up single-use gotos in signal.c
> c694fba linux-user/s390x: Tidy save_sigregs
> 81015fb linux-user/s390x: Use tswap_sigset in setup_rt_frame
> 2afaee9 linux-user/s390x: Fix sigcontext sregs value
> c335465 linux-user/s390x: Fix trace in restore_regs
> e488167 linux-user/s390x: Remove restore_sigregs return value
> ffa5802 linux-user/s390x: Remove PSW_ADDR_AMODE
> f835fe4 linux-user/s390x: Use uint16_t for signal retcode
> 32267a1 linux-user/s390x: Fix sigframe types
> 2fd8343 tests/tcg/sparc64: Re-enable linux-test
> 47a7850 linux-user/sparc: Implement sparc64 rt signals
> eb9b8de linux-user/sparc: Implement sparc32 rt signals
> 6a02eb6 linux-user/sparc: Add 64-bit support to fpu save/restore
> 7acfaa8 linux-user/sparc: Minor corrections to do_sigreturn
> 37c8475 linux-user/sparc: Clean up setup_frame
> b62d96d linux-user/sparc: Add rwin_save to signal frame
> b27662c linux-user/sparc: Save and restore fpu in signal frame
> a4a46f6 linux-user/sparc: Clean up get_sigframe
> eac9897 linux-user/sparc: Split out save_reg_win
> c75a3e5 linux-user/sparc: Use target_pt_regs
> 104931a linux-user/sparc: Fix the stackframe structure
> b6f9c25 linux-user/sparc: Remove target_rt_signal_frame as unused
> ed9e640 linux-user/sparc: Remove target_sigcontext as unused
> fb62578 linux-user/sparc: Merge sparc64/ into sparc/
> ee45b6d linux-user/sparc: Merge sparc64 termbits.h
> 5d9706c linux-user/sparc: Merge sparc64 target_structs.h
> fbdd320 linux-user/sparc: Merge sparc64 target_elf.h
> c73cc71 linux-user/sparc: Merge sparc64 target_syscall.h
> 05a3287 linux-user/sparc: Clean up init_thread
> d9551e1 linux-user/sparc: Include TARGET_STACK_BIAS in get_sp_from_cpustate
> be699c8 linux-user: Pass CPUArchState to target_restore_altstack
> 8ad510f linux-user: Pass CPUArchState to do_sigaltstack
> 5482bec linux-user: Use target_restore_altstack in all sigreturn
> ad4e4e2 linux-user: Split out target_restore_altstack
> 7ab6de0 linux-user: Add strace support for printing arguments of llseek
> 0ece12d linux-user/arm: Simplify accumulating and raising fpa11 exceptions
> 5dd2463 linux-user/arm: Do not fill in si_code for fpa11 exceptions
> fa4ab02 linux-user/arm: Do not emulate fpa11 in thumb mode
> c61b3a7 linux-user/arm: Split out emulate_arm_fpa11
> 4e217fb linux-user: strace now handles unshare syscall args correctly
> cfc582d linux-user: Remove dead code
> 
> === OUTPUT BEGIN ===
> 1/59 Checking commit cfc582dd467e (linux-user: Remove dead code)
> 2/59 Checking commit 4e217fb6e89d (linux-user: strace now handles unshare syscall args correctly)
> 3/59 Checking commit c61b3a7d7c99 (linux-user/arm: Split out emulate_arm_fpa11)
> 4/59 Checking commit fa4ab02afc4d (linux-user/arm: Do not emulate fpa11 in thumb mode)
> 5/59 Checking commit 5dd2463d299b (linux-user/arm: Do not fill in si_code for fpa11 exceptions)
> 6/59 Checking commit 0ece12d2d24a (linux-user/arm: Simplify accumulating and raising fpa11 exceptions)
> 7/59 Checking commit 7ab6de0b0489 (linux-user: Add strace support for printing arguments of llseek)
> 8/59 Checking commit ad4e4e24824c (linux-user: Split out target_restore_altstack)
> 9/59 Checking commit 5482becd8dd6 (linux-user: Use target_restore_altstack in all sigreturn)
> 10/59 Checking commit 8ad510f1e2f9 (linux-user: Pass CPUArchState to do_sigaltstack)
> 11/59 Checking commit be699c84a441 (linux-user: Pass CPUArchState to target_restore_altstack)
> 12/59 Checking commit d9551e125d76 (linux-user/sparc: Include TARGET_STACK_BIAS in get_sp_from_cpustate)
> 13/59 Checking commit 05a3287b727c (linux-user/sparc: Clean up init_thread)
> 14/59 Checking commit c73cc71c1f45 (linux-user/sparc: Merge sparc64 target_syscall.h)
> 15/59 Checking commit fbdd3201a581 (linux-user/sparc: Merge sparc64 target_elf.h)
> 16/59 Checking commit 5d9706cfb373 (linux-user/sparc: Merge sparc64 target_structs.h)
> 17/59 Checking commit ee45b6ddcf2d (linux-user/sparc: Merge sparc64 termbits.h)
> 18/59 Checking commit fb62578dc2a3 (linux-user/sparc: Merge sparc64/ into sparc/)
> WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
> #57: 
> deleted file mode 100644
> 
> total: 0 errors, 1 warnings, 13 lines checked
> 
> Patch 18/59 has style problems, please review.  If any of these errors
> are false positives report them to the maintainer, see
> CHECKPATCH in MAINTAINERS.
> 19/59 Checking commit ed9e6403b7c1 (linux-user/sparc: Remove target_sigcontext as unused)
> 20/59 Checking commit b6f9c259dcfe (linux-user/sparc: Remove target_rt_signal_frame as unused)
> 21/59 Checking commit 104931a73ea9 (linux-user/sparc: Fix the stackframe structure)
> 22/59 Checking commit c75a3e5af1ce (linux-user/sparc: Use target_pt_regs)
> 23/59 Checking commit eac9897cd631 (linux-user/sparc: Split out save_reg_win)
> 24/59 Checking commit a4a46f628639 (linux-user/sparc: Clean up get_sigframe)
> 25/59 Checking commit b27662c4e849 (linux-user/sparc: Save and restore fpu in signal frame)
> 26/59 Checking commit b62d96d3871c (linux-user/sparc: Add rwin_save to signal frame)
> 27/59 Checking commit 37c84750ef15 (linux-user/sparc: Clean up setup_frame)
> 28/59 Checking commit 7acfaa83fd2b (linux-user/sparc: Minor corrections to do_sigreturn)
> 29/59 Checking commit 6a02eb64b8fa (linux-user/sparc: Add 64-bit support to fpu save/restore)
> 30/59 Checking commit eb9b8def30c9 (linux-user/sparc: Implement sparc32 rt signals)
> 31/59 Checking commit 47a7850440f8 (linux-user/sparc: Implement sparc64 rt signals)
> 32/59 Checking commit 2fd8343979f4 (tests/tcg/sparc64: Re-enable linux-test)
> 33/59 Checking commit 32267a1fe861 (linux-user/s390x: Fix sigframe types)
> 34/59 Checking commit f835fe46a35f (linux-user/s390x: Use uint16_t for signal retcode)
> 35/59 Checking commit ffa58028e721 (linux-user/s390x: Remove PSW_ADDR_AMODE)
> 36/59 Checking commit e4881679e15c (linux-user/s390x: Remove restore_sigregs return value)
> 37/59 Checking commit c33546509b36 (linux-user/s390x: Fix trace in restore_regs)
> 38/59 Checking commit 2afaee9f88b5 (linux-user/s390x: Fix sigcontext sregs value)
> 39/59 Checking commit 81015fb7ae34 (linux-user/s390x: Use tswap_sigset in setup_rt_frame)
> 40/59 Checking commit c694fba9a40b (linux-user/s390x: Tidy save_sigregs)
> 41/59 Checking commit fe8d7a179041 (linux-user/s390x: Clean up single-use gotos in signal.c)
> 42/59 Checking commit bd5b9e8bae3d (linux-user/s390x: Set psw.mask properly for the signal handler)
> 43/59 Checking commit b197ab9b7234 (linux-user/s390x: Add stub sigframe argument for last_break)
> 44/59 Checking commit 0bec884690d3 (linux-user/s390x: Fix frame_addr corruption in setup_frame)
> 45/59 Checking commit 9c32aac51d45 (linux-user/s390x: Add build asserts for sigset sizes)
> 46/59 Checking commit 75cbffbff7ac (linux-user/s390x: Clean up signal.c)
> 47/59 Checking commit b563b6274f41 (linux-user/s390x: Handle vector regs in signal stack)
> ERROR: suspect code indent for conditional statements (4, 7)
> #68: FILE: linux-user/s390x/signal.c:151:
> +    for (i = 0; i < 16; ++i) {
> +       __put_user(env->vregs[i][1], &ext->vxrs_low[i]);
> 
> ERROR: suspect code indent for conditional statements (4, 7)
> #71: FILE: linux-user/s390x/signal.c:154:
> +    for (i = 0; i < 16; ++i) {
> +       __put_user(env->vregs[i + 16][0], &ext->vxrs_high[i][0]);
> 
> ERROR: suspect code indent for conditional statements (4, 7)
> #128: FILE: linux-user/s390x/signal.c:321:
> +    for (i = 0; i < 16; ++i) {
> +       __get_user(env->vregs[i][1], &ext->vxrs_low[i]);
> 
> ERROR: suspect code indent for conditional statements (4, 7)
> #131: FILE: linux-user/s390x/signal.c:324:
> +    for (i = 0; i < 16; ++i) {
> +       __get_user(env->vregs[i + 16][0], &ext->vxrs_high[i][0]);
> 
> total: 4 errors, 0 warnings, 127 lines checked
> 
> Patch 47/59 has style problems, please review.  If any of these errors
> are false positives report them to the maintainer, see
> CHECKPATCH in MAINTAINERS.
> 
> 48/59 Checking commit 00d88c824125 (linux-user: Add copy_file_range to strace.list)
> 49/59 Checking commit d9c71e62bcc0 (linux-user: Fix erroneous conversion in copy_file_range)
> 50/59 Checking commit ede5d61c022c (linux-user: use GDateTime for formatting timestamp for core file)
> 51/59 Checking commit 59a7fe51d6d0 (linux-user/alpha: Fix rt sigframe return)
> 52/59 Checking commit ce80ceaff20b (linux-user/alpha: Rename the sigaction restorer field)
> 53/59 Checking commit e63cb7421e0c (linux-user: Pass ka_restorer to do_sigaction)
> ERROR: code indent should never use tabs
> #67: FILE: linux-user/syscall.c:9019:
> +^I    ret = get_errno(do_sigaction(arg1, pact, &oact, 0));$
> 
> total: 1 errors, 0 warnings, 97 lines checked
> 
> Patch 53/59 has style problems, please review.  If any of these errors
> are false positives report them to the maintainer, see
> CHECKPATCH in MAINTAINERS.
> 
> 54/59 Checking commit 49f59b42510e (linux-user: Honor TARGET_ARCH_HAS_SA_RESTORER in do_syscall)
> 55/59 Checking commit 9872e828af1f (linux-user/alpha: Define TARGET_ARCH_HAS_KA_RESTORER)
> 56/59 Checking commit e1e89de11042 (linux-user/alpha: Share code for TARGET_NR_sigaction)
> 57/59 Checking commit 2b8cc2689cae (linux-user: Tidy TARGET_NR_rt_sigaction)
> 58/59 Checking commit 5b6f11c55ddf (linux-user/elfload: fix filling psinfo->pr_psargs)
> 59/59 Checking commit 7db920b89baa (linux-user/elfload: add s390x core dumping support)
> === OUTPUT END ===
> 
> Test command exited with code: 1
> 
> 
> The full log is available at
> http://patchew.org/logs/20210517181424.8093-1-laurent@vivier.eu/testing.checkpatch/?type=message.
> ---
> Email generated automatically by Patchew [https://patchew.org/].
> Please send your feedback to patchew-devel@redhat.com
> 


