Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 355EC31E01A
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 21:18:14 +0100 (CET)
Received: from localhost ([::1]:42674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCTH3-00057N-9j
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 15:18:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lCTEz-0003P2-QD
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:16:05 -0500
Received: from mout.kundenserver.de ([212.227.126.135]:60833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lCTEw-0005UB-4W
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:16:05 -0500
Received: from [192.168.100.1] ([82.252.134.158]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MPooN-1lYeun18Xz-00Mpgk; Wed, 17 Feb 2021 21:15:46 +0100
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1611113349-24906-1-git-send-email-tsimpson@quicinc.com>
 <1611113349-24906-31-git-send-email-tsimpson@quicinc.com>
From: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH v7 30/35] Hexagon (linux-user/hexagon) Linux user emulation
Message-ID: <92ec87f8-55d6-5b5f-7a7f-e8643e49c54f@vivier.eu>
Date: Wed, 17 Feb 2021 21:15:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <1611113349-24906-31-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:XJokJeEcPM6AwbSnAfxcQ8dK8wSwtxdSTwv3xiATcPpcROpKXeM
 7uqCbT06SGIYfaXn39coswti+G2/Dk6koEiSZ2YhsE+/oe72fY3aVYYrsO7BZdHP7bL81IJ
 z4gQPDPFifBNmMu3JOpFnA6s0PgfsgmZidmXx08pCjQlatPFJmxnHFH+CgAcA4lNs503yEG
 HIRd29sX/nkYwg13Zb2+Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:t0vSMpbEc8Q=:8UWaN9j4mukIb4N+zFbC7G
 FeKNyHye7LBA2x7DRG59ZIfCotu0nfWciw91Dsjl0gnCJhjkUj2peWuTtAXQ25pa1afi96QT1
 f+yd9XVIrNnnS58taNCZSrODnPZM8z6ziUOztHA8FvXKaJbZrwOuK9/UJFMXQnW01LYklM5di
 j0psmD5bgH5SImvctTqySi1lcpp3f3vNlK1CALf2YvfSQmYKdMSD1GxvGodmZgSs83jZEh2UT
 mSGHtyi6Qjo1DZezD1AslgC/Cyn5n0K2QEL+wBK9hjt42u21dNz5VMQXtxJMyD1I5k2THSAcK
 AFAbkTpuB2mBAVF941qcm/MRZ5hKZFcK7sV8WMrEz83Uiu3V7Ll8vy3UfkhOhbTwaqbkicVc6
 7icT1nFU9u37aTAxIWjarWwXOQ0m0yyNKZCdbXUdoIpBglfdnPrFTyicGcbSe
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
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
Cc: alex.bennee@linaro.org, philmd@redhat.com, bcain@quicinc.com,
 richard.henderson@linaro.org, ale@rev.ng
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 20/01/2021 à 04:29, Taylor Simpson a écrit :
> Implementation of Linux user emulation for Hexagon
> Some common files modified in addition to new files in linux-user/hexagon
> 
> Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/hexagon/sockbits.h       |  18 ++
>  linux-user/hexagon/syscall_nr.h     | 322 ++++++++++++++++++++++++++++++++++++
>  linux-user/hexagon/target_cpu.h     |  44 +++++
>  linux-user/hexagon/target_elf.h     |  40 +++++
>  linux-user/hexagon/target_fcntl.h   |  18 ++
>  linux-user/hexagon/target_signal.h  |  34 ++++
>  linux-user/hexagon/target_structs.h |  54 ++++++
>  linux-user/hexagon/target_syscall.h |  36 ++++
>  linux-user/hexagon/termbits.h       |  18 ++
>  linux-user/qemu.h                   |   2 +
>  linux-user/syscall_defs.h           |  33 ++++
>  linux-user/elfload.c                |  16 ++
>  linux-user/hexagon/cpu_loop.c       |  99 +++++++++++
>  linux-user/hexagon/signal.c         | 276 +++++++++++++++++++++++++++++++
>  scripts/gensyscalls.sh              |   1 +
>  15 files changed, 1011 insertions(+)
>  create mode 100644 linux-user/hexagon/sockbits.h
>  create mode 100644 linux-user/hexagon/syscall_nr.h
>  create mode 100644 linux-user/hexagon/target_cpu.h
>  create mode 100644 linux-user/hexagon/target_elf.h
>  create mode 100644 linux-user/hexagon/target_fcntl.h
>  create mode 100644 linux-user/hexagon/target_signal.h
>  create mode 100644 linux-user/hexagon/target_structs.h
>  create mode 100644 linux-user/hexagon/target_syscall.h
>  create mode 100644 linux-user/hexagon/termbits.h
>  create mode 100644 linux-user/hexagon/cpu_loop.c
>  create mode 100644 linux-user/hexagon/signal.c
...> diff --git a/linux-user/hexagon/target_syscall.h b/linux-user/hexagon/target_syscall.h
> new file mode 100644
> index 0000000..7f91a4a
> --- /dev/null
> +++ b/linux-user/hexagon/target_syscall.h
> @@ -0,0 +1,36 @@
> +/*
> + *  Copyright(c) 2019-2021 Qualcomm Innovation Center, Inc. All Rights Reserved.
> + *
> + *  This program is free software; you can redistribute it and/or modify
> + *  it under the terms of the GNU General Public License as published by
> + *  the Free Software Foundation; either version 2 of the License, or
> + *  (at your option) any later version.
> + *
> + *  This program is distributed in the hope that it will be useful,
> + *  but WITHOUT ANY WARRANTY; without even the implied warranty of
> + *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + *  GNU General Public License for more details.
> + *
> + *  You should have received a copy of the GNU General Public License
> + *  along with this program; if not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#ifndef HEXAGON_TARGET_SYSCALL_H
> +#define HEXAGON_TARGET_SYSCALL_H
> +
> +struct target_pt_regs {
> +    abi_long sepc;
> +    abi_long sp;

Two registers, it's unusual but it seems to be enough to load the binary.

...
> diff --git a/linux-user/hexagon/termbits.h b/linux-user/hexagon/termbits.h
> new file mode 100644
> index 0000000..8abf992
> --- /dev/null
> +++ b/linux-user/hexagon/termbits.h
> @@ -0,0 +1,18 @@
> +/*
> + *  Copyright(c) 2019-2021 Qualcomm Innovation Center, Inc. All Rights Reserved.
> + *
> + *  This program is free software; you can redistribute it and/or modify
> + *  it under the terms of the GNU General Public License as published by
> + *  the Free Software Foundation; either version 2 of the License, or
> + *  (at your option) any later version.
> + *
> + *  This program is distributed in the hope that it will be useful,
> + *  but WITHOUT ANY WARRANTY; without even the implied warranty of
> + *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + *  GNU General Public License for more details.
> + *
> + *  You should have received a copy of the GNU General Public License
> + *  along with this program; if not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#include "../i386/termbits.h"

should be #include "../generic/termbits.h"

Acked-by: Laurent Vivier <laurent@vivier.eu>

Thanks,
Laurent

