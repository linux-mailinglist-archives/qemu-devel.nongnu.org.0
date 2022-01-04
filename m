Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 550364842CA
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 14:52:28 +0100 (CET)
Received: from localhost ([::1]:51738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4kEk-0001g9-4C
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 08:52:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n4kDW-0000sp-F0
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 08:51:10 -0500
Received: from mout.kundenserver.de ([212.227.126.131]:40639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n4kDS-0002Rb-3u
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 08:51:09 -0500
Received: from [192.168.100.1] ([82.142.30.62]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MGzI3-1n9zQD2GfL-00E9r6; Tue, 04 Jan 2022 14:51:02 +0100
Message-ID: <69f6a9fc-d2b3-661c-38d7-1991b34c55ca@vivier.eu>
Date: Tue, 4 Jan 2022 14:51:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>
References: <20211220202500.111897-1-richard.henderson@linaro.org>
 <20211220202500.111897-3-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PULL 02/15] linux-user: Move syscall error detection into
 safe_syscall_base
In-Reply-To: <20211220202500.111897-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:FHrh1bcLjjKYRqvCAnZdpdo53EWETxNncv7T/QusJRD1jhaXGdg
 vOnZIM4vaXeiaXN8x/btR6xLAFNT0pvA0xnBifiXgFl5vrR4NK30yo9dSPyoRAcZgt9N3oO
 JM3xmCG+ZBq+soEzdtzR7sUQR5KM4XJI7bohP7DYHelTFg+6yzhXS/p4iu/DMpR5redVv7X
 /qh2rqcGH+ibR1LT/8PcQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:wT5RyklRm+E=:HzK3dH85yby/Yuekal33Iw
 NHgPuAn7tW9ffqyc6Snd+0uhRF7ZPuz/WrFeVGCUD7Qj14Xos8/Synulab0/zyGkuqoonK0kF
 WYbTWRibKiRMTkcBPd9f7Txgw1JFwNEvLALGHHRteHhAQ/bY+ldH+lHI7D4S4AVnS/zP5qayC
 2lX5yZyC18wmUCZTcCBJo3GwaYzL/b66w9sRZcXJZ4/9Bkky8VFGtfQkbo4hrI40jOSsFLg9q
 hVyIrHDIIeL0iyln+2yz//Wcul3Z+tzaf9EMIG3NIT2DEe4a8+Y0MgEv49KkCjw2tVFM3l8f4
 4fNH1Ozvm8JEnWujHSTZEtRfq+VIxXeuY0mwAL79/Kkv/hG8np2seWg7Mip06EkWJ2+K0HRwH
 8c9FoH2rQo047KmeDbC7fF7AhB2Uq1LNfbcp7mW1v7KrXzRcf5+FaIB7Jjqw9ZezjoiRz+452
 KCd8oZOkGE+gPPd5XOnOgyDqUv5M7IHBpSN8/dcS7Y59J1OJ7HGp5E91Y+irB+hjiab7V9OFR
 /XbUKsT7rXR5rDhPeQSwK3a41OyjoC1MnNsgX2/zsU51gFaWVL6Cb4AkNyQMWSLid0ZzsAw3c
 lwWxdbAM3TCYnHpw5pGZLy30BKK3a8OHLToN+3z1/pAMQK9bAWOuDP/LZ6CAAv6V3lfLxWpbu
 Q8i1QcYUPJivIcfoww3kKSmM+Su79YUOii3HUw/yrihTmJDQDvOetVZ7YeUpL0NoU+Dw=
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) NICE_REPLY_A=-3.354,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-devel@nongnu.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 20/12/2021 à 21:24, Richard Henderson a écrit :
> The current api from safe_syscall_base() is to return -errno, which is
> the interface provided by *some* linux kernel abis.  The wrapper macro,
> safe_syscall(), detects error, stores into errno, and returns -1, to
> match the api of the system syscall().
> 
> For those kernel abis that do not return -errno natively, this leads
> to double syscall error detection.  E.g. Linux ppc64, which sets the
> SO flag for error.
> 
> Simplify the usage from C by moving the error detection into assembly,
> and usage from assembly by providing a C helper with which to set errno.
> 
> Reviewed-by: Warner Losh <imp@bsdimp.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   linux-user/safe-syscall.h                  | 16 +++-------
>   linux-user/safe-syscall-error.c            | 28 ++++++++++++++++
>   linux-user/host/aarch64/safe-syscall.inc.S | 20 ++++++------
>   linux-user/host/arm/safe-syscall.inc.S     | 27 ++++++++++------
>   linux-user/host/i386/safe-syscall.inc.S    | 37 +++++++++++++++-------
>   linux-user/host/ppc64/safe-syscall.inc.S   | 24 +++++++-------
>   linux-user/host/riscv/safe-syscall.inc.S   | 20 ++++++------
>   linux-user/host/s390x/safe-syscall.inc.S   | 32 ++++++++++++-------
>   linux-user/host/x86_64/safe-syscall.inc.S  | 29 +++++++++--------
>   linux-user/meson.build                     |  1 +
>   10 files changed, 147 insertions(+), 87 deletions(-)
>   create mode 100644 linux-user/safe-syscall-error.c
> 
>

This patch breaks command execution in bash command line interface:

- if I run "chroot chroot/powerpc/jessie ls", it works

- if I run "echo ls |  chroot chroot/powerpc/jessie", it hangs

- if I run "chroot chroot/powerpc/jessie bash invalid_command",
   it does nothing whereas it should return "bash: invalid_command: No such file or directory".

I think the exit status of the command is not correctly detected by bash.

Thanks,
Laurent




