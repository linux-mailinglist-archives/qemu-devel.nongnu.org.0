Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1AB3C6457
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 21:56:16 +0200 (CEST)
Received: from localhost ([::1]:42254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m322J-0003Cb-BP
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 15:56:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1m320X-0002TK-1j
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 15:54:25 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:56245)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1m320U-0001tU-Vz
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 15:54:24 -0400
Received: from [192.168.100.1] ([82.142.17.146]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MSZDt-1lanjl3IPh-00St4h; Mon, 12 Jul 2021 21:54:08 +0200
Subject: Re: [PATCH v3 0/8] linux-user: target <-> host errno conversion code
 refactor
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210708170550.1846343-1-f4bug@amsat.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <719c1598-184d-80d3-0bd6-95d954269e64@vivier.eu>
Date: Mon, 12 Jul 2021 21:54:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210708170550.1846343-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:vIrWawEWswuZjvabJtNeUBHH2hKx8dSmakD39bhf+5DWZnS7Mk7
 LyVTY+INm4fZb7opzLfEtmZxHJpyVUMpQFGIwBpUwncyHaR+X3iL6e7rXkmr9QBuHHFJAjD
 miv6oi/gfoVAc1qVvaorQwt0nfU2AtuDyRhNVOznW6Rqv7KAYxmxtkJa86q1F5p//ZFm9kX
 j2wG6R67m/hPk3kgVZHug==
X-UI-Out-Filterresults: notjunk:1;V03:K0:k/lY63iHxIQ=:hb2EiAc1D8iKun03tv9QAu
 Rx7m8U9EDeEvVNq17+T40AIIDtgF2tHAkSwV1WTadiCLCSAnIEulb7v0Xetxkl+DveZ30uUmw
 taF8OU0GbgfEc7fXObrfE9QpUc1j6p/nLYd4HMYvyTAwI7NGrG6G2hxILAAtf+lDgTPUG2JdU
 +yL+jzAB6fFa5gWSbgSASSs0hYvjL0m10ksDkMLjWx8Rre0TErDk1VdGjBIqKLmA5Sum/VHqP
 rlnyytd/FzvUkv/CvbebjpJsmTD8CPuAej6iPf99qie7vW1xUCv1DMKj1l2YwdGy8O5YSS3Sr
 UmpqMnPG60bc90TpEQt5PA79d1MnjC1YnjhwATkjvm3Ns2dSjyucrCu5G83p4tifutsgj0L9h
 DL4U9YusBwH3Wx/MP+XrGzqwd4iUxBff0hfEFUMf0w2XMf+WC4eXuXQZYLkm2ePJKRrLFiFjk
 lYDUiIdoZOvOSeOayg+gMvL8NlpFD8Gnu14Ls+4kLzj3hvoJ0MrwlzTBwV/KhL00kFxiKXGYT
 TaS8lkdSk2YflD2pDFdNFG2HOLKXYpHZOO0215otgG2Y6/nhG5Dg3ASbNa9mn3Kt9hd9UGPf1
 J5dkP4bjNGKRlvDnFI84cTEwyN7KObXc/0bszaLKq7LR31nJbKSbsGAkIk9ZnSIyinVbcmPa5
 fdqVAbtpOW9yGrkeNVmjdFwk5csonv/zoZPjmzSnEmeHGmYn0YeQv9lcHcjFRMoAuXAz183CJ
 sDlC1SYDEWmFQa9/haFv9DDQp4E/qjTXknQxzLoja67YUUA9axIDupPmCDQ6RbyGiIcCtgFdb
 zl4XSWDquc11gVFqW44yu+ZJrEisbFcewk3qupjoQCuu0FWA+bRID+M8oQ7uHvh5e5IpuOe
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.479,
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 08/07/2021 à 19:05, Philippe Mathieu-Daudé a écrit :
> Hi,
> 
> This series extract code related to target errno conversion
> (to/from host) into a separate header.
> 
> Since v2:
> - addressed Richard / Laurent review comments
> Since v1:
> - addressed Taylor / Richard / Laurent review comments
> 
> Based-on: <20210708100756.212085-1-laurent@vivier.eu>
> 
> Philippe Mathieu-Daudé (8):
>   linux-user/syscall: Fix RF-kill errno (typo in ERFKILL)
>   linux-user/sparc: Rename target_errno.h -> target_errno_defs.h
>   linux-user: Extract target errno to 'target_errno_defs.h'
>   linux-user/alpha: Move errno definitions to 'target_errno_defs.h'
>   linux-user/hppa: Move errno definitions to 'target_errno_defs.h'
>   linux-user/mips: Move errno definitions to 'target_errno_defs.h'
>   linux-user: Simplify host <-> target errno conversion using macros
>   linux-user/syscall: Remove ERRNO_TABLE_SIZE check
> 
>  linux-user/aarch64/target_errno_defs.h        |   7 +
>  linux-user/alpha/target_errno_defs.h          | 204 ++++++++++++++++
>  linux-user/alpha/target_syscall.h             | 194 ---------------
>  linux-user/arm/target_errno_defs.h            |   7 +
>  linux-user/cris/target_errno_defs.h           |   7 +
>  .../target_errno_defs.h}                      |   4 +-
>  linux-user/hexagon/target_errno_defs.h        |   7 +
>  linux-user/hppa/target_errno_defs.h           | 220 +++++++++++++++++
>  linux-user/hppa/target_syscall.h              | 210 -----------------
>  linux-user/i386/target_errno_defs.h           |   7 +
>  linux-user/m68k/target_errno_defs.h           |   7 +
>  linux-user/microblaze/target_errno_defs.h     |   7 +
>  linux-user/mips/target_errno_defs.h           | 221 ++++++++++++++++++
>  linux-user/mips/target_syscall.h              | 211 -----------------
>  linux-user/mips64/target_errno_defs.h         |  10 +
>  linux-user/mips64/target_syscall.h            | 211 -----------------
>  linux-user/nios2/target_errno_defs.h          |   7 +
>  linux-user/openrisc/target_errno_defs.h       |   7 +
>  linux-user/ppc/target_errno_defs.h            |   7 +
>  linux-user/riscv/target_errno_defs.h          |   7 +
>  linux-user/s390x/target_errno_defs.h          |   7 +
>  linux-user/sh4/target_errno_defs.h            |   7 +
>  .../{target_errno.h => target_errno_defs.h}   |  11 +-
>  linux-user/sparc/target_syscall.h             |   2 -
>  linux-user/syscall_defs.h                     |   2 +-
>  linux-user/x86_64/target_errno_defs.h         |   7 +
>  linux-user/xtensa/target_errno_defs.h         |   7 +
>  linux-user/syscall.c                          | 164 ++-----------
>  linux-user/errnos.c.inc                       | 140 +++++++++++
>  linux-user/safe-syscall.S                     |   2 +-
>  30 files changed, 926 insertions(+), 985 deletions(-)
>  create mode 100644 linux-user/aarch64/target_errno_defs.h
>  create mode 100644 linux-user/alpha/target_errno_defs.h
>  create mode 100644 linux-user/arm/target_errno_defs.h
>  create mode 100644 linux-user/cris/target_errno_defs.h
>  rename linux-user/{errno_defs.h => generic/target_errno_defs.h} (99%)
>  create mode 100644 linux-user/hexagon/target_errno_defs.h
>  create mode 100644 linux-user/hppa/target_errno_defs.h
>  create mode 100644 linux-user/i386/target_errno_defs.h
>  create mode 100644 linux-user/m68k/target_errno_defs.h
>  create mode 100644 linux-user/microblaze/target_errno_defs.h
>  create mode 100644 linux-user/mips/target_errno_defs.h
>  create mode 100644 linux-user/mips64/target_errno_defs.h
>  create mode 100644 linux-user/nios2/target_errno_defs.h
>  create mode 100644 linux-user/openrisc/target_errno_defs.h
>  create mode 100644 linux-user/ppc/target_errno_defs.h
>  create mode 100644 linux-user/riscv/target_errno_defs.h
>  create mode 100644 linux-user/s390x/target_errno_defs.h
>  create mode 100644 linux-user/sh4/target_errno_defs.h
>  rename linux-user/sparc/{target_errno.h => target_errno_defs.h} (97%)
>  create mode 100644 linux-user/x86_64/target_errno_defs.h
>  create mode 100644 linux-user/xtensa/target_errno_defs.h
>  create mode 100644 linux-user/errnos.c.inc
> 

Series applied to my linux-user-for-6.1 branch.

Thanks,
Laurent


