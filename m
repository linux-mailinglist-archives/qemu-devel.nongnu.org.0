Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4113F4884F1
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 18:26:52 +0100 (CET)
Received: from localhost ([::1]:48614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6FUR-0002Zo-Ct
	for lists+qemu-devel@lfdr.de; Sat, 08 Jan 2022 12:26:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n6FT5-0001t9-8U
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 12:25:30 -0500
Received: from mout.kundenserver.de ([212.227.17.24]:40569)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n6FT2-00054m-VG
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 12:25:26 -0500
Received: from [192.168.100.1] ([82.142.12.178]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MQvGz-1mlZxN0BD5-00O3hR; Sat, 08 Jan 2022 18:25:22 +0100
Message-ID: <8dc07143-77a6-884e-fdf2-e083a947f59e@vivier.eu>
Date: Sat, 8 Jan 2022 18:25:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v5 00/24] linux-user: Clean up siginfo_t handling
Content-Language: fr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220107213243.212806-1-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220107213243.212806-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:jXRjqfEAeQpx8q96Y/D3WhfJwfJq45JEqzQ52UKF16tLO3+u0Ht
 XX3Jcwl1m5uVKBp9Bb0/hn9PA9LdWopjlLXHzbgsBkOqlzuiRABk4fyZLohYEW1yZWYWmsg
 KrlA6HE7QebssuY3OVUDXq2jOLnF1hGgoCyUK4NlVGtD7JOdlRQxSjhwheoFjNgBFSlr2k/
 v6JHSRd4BZNu7lozsCtSw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:KqxXTxa5UhY=:0TizX/kNZD7tFmaIPIDLAU
 NHEuQspt7TRt0jVqds+g3VBbR7E3qU3haSl17WU8U5utCsj11DsT8ZsthV3L9ie/IY7gKkAj5
 bnY/6KmN8qO4s54Wh6eAZZyonxSMNRNgrAfZgDTCV8BZDk0V8iROS4CfdWOt/k3k+BiKyKHwk
 VgOrIQKoYphonu+wUAkK+A2JFrv0JeczLHOwazJvHgmcBVrONcFzXESMCamGwycQuZld3LoMN
 JdGVk3Z+/OmFBXyptId2tfQGXrvjHkDwndtfq+MmpRZUMndlJcTdndeSDByOZj87R3kpfqmlK
 KHxQcWj/E1UHQ8xe0Rm54aadxUd21uABboKHbvLZxqlEIJUzr9zhHcOdtTUdCrjyq/EGklyU8
 NEHGYosIeTTZG+31DkKyGBBHsLv/ItxSGpi4E8QrIAnXELSqyPwCLzzD1tpkSjoVPEdUT91Yh
 lN+OfIVhyTai0uFzr6faYoTmJ3RaSjT8gM4la+6oz0AmFR1niXIk6G/qGHHKD4agX6KphH216
 IBsGfQcivRHoPStSdGtpDxCMox+ucDUhPLnKM/rzEhTvVYNzyS7z4T1wOs7dw9Z65YHS+GjZe
 kI8g7HTZMsxVeMN+6z6E0ZP1qBzcP6n/ksGEhEVNC55YdlfeHBhLaOdmUGJxVx9jY87fP1gXG
 Jb6W3QisIMrl+xSWe1AWXtOS7KVEbaSwJkutGGoRfz1eBjAqjK43UvgcSMsJDfYkz9aQ=
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-4.199,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Le 07/01/2022 à 22:32, Richard Henderson a écrit :
> Changes from v4:
>    * Rebase on master.
> 
> All patches are reviewed.

Series applied to my linux-user-for-7.0 branch.

Thanks,
Laurent

> 
> r~
> 
> 
> Richard Henderson (24):
>    linux-user/alpha: Set TRAP_UNK for bugchk and unknown gentrap
>    linux-user/alpha: Set FPE_FLTUNK for gentrap ROPRAND
>    linux-user/alpha: Use force_sig_fault
>    linux-user/cris: Use force_sig_fault
>    linux-user/hppa: Use force_sig_fault
>    linux-user/hppa: Use the proper si_code for PRIV_OPR, PRIV_REG,
>      OVERFLOW
>    linux-user: Remove TARGET_NSIGFPE
>    linux-user/hppa: Set FPE_CONDTRAP for COND
>    linux-user/i386: Split out maybe_handle_vm86_trap
>    linux-user/i386: Use force_sig, force_sig_fault
>    linux-user/m68k: Use force_sig_fault
>    linux-user/microblaze: Use force_sig_fault
>    linux-user/microblaze: Fix SIGFPE si_codes
>    linux-user/mips: Improve do_break
>    linux-user/mips: Use force_sig_fault
>    target/mips: Extract break code into env->error_code
>    target/mips: Extract trap code into env->error_code
>    linux-user/openrisc: Use force_sig_fault
>    linux-user/ppc: Use force_sig_fault
>    linux-user/riscv: Use force_sig_fault
>    linux-user/s390x: Use force_sig_fault
>    linux-user/sh4: Use force_sig_fault
>    linux-user/sparc: Use force_sig_fault
>    linux-user/xtensa: Use force_sig_fault
> 
>   linux-user/syscall_defs.h                 |   3 +-
>   target/mips/tcg/translate.h               |   1 +
>   linux-user/alpha/cpu_loop.c               |  61 +++-----
>   linux-user/cris/cpu_loop.c                |  12 +-
>   linux-user/hppa/cpu_loop.c                |  26 ++--
>   linux-user/i386/cpu_loop.c                |  78 +++++-----
>   linux-user/m68k/cpu_loop.c                |  24 +---
>   linux-user/microblaze/cpu_loop.c          |  71 +++++----
>   linux-user/mips/cpu_loop.c                | 166 +++++-----------------
>   linux-user/openrisc/cpu_loop.c            |  18 +--
>   linux-user/ppc/cpu_loop.c                 | 136 ++++--------------
>   linux-user/riscv/cpu_loop.c               |  31 +---
>   linux-user/s390x/cpu_loop.c               |   7 +-
>   linux-user/sh4/cpu_loop.c                 |   6 +-
>   linux-user/sparc/cpu_loop.c               |  14 +-
>   linux-user/xtensa/cpu_loop.c              |  26 ++--
>   target/mips/tcg/translate.c               |  36 ++++-
>   target/mips/tcg/micromips_translate.c.inc |  10 +-
>   target/mips/tcg/mips16e_translate.c.inc   |   2 +-
>   target/mips/tcg/nanomips_translate.c.inc  |   4 +-
>   20 files changed, 230 insertions(+), 502 deletions(-)
> 


