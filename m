Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2A7616878
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 17:22:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqGR8-00077Y-Uz; Wed, 02 Nov 2022 12:17:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oqGQy-0006yI-Fm
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:17:44 -0400
Received: from mout.kundenserver.de ([212.227.17.24])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oqGQw-0007Kc-QR
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:17:44 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MA844-1oj8t10ftq-00BebE; Wed, 02 Nov 2022 17:17:37 +0100
Message-ID: <19efbba2-c2a3-e0aa-75d4-926aa849a96a@vivier.eu>
Date: Wed, 2 Nov 2022 17:17:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v5] linux-user: Add close_range() syscall
Content-Language: fr
To: Helge Deller <deller@gmx.de>, qemu-devel@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>
References: <Y1dLJoEDhJ2AAYDn@p100>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <Y1dLJoEDhJ2AAYDn@p100>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:8jgi+zvAgsyAoB/x6x/N848UCtfDCcaJf+2S5hOWgo+3VZfXrZ2
 IZTDNwPYFg7TNufl69AwqODzeLXvueQ47By5Gw0zYxPZ2OxIP7JKQhRhC1YZZVBwMMWrFbD
 Uvw3RdaGvG1w9eLXl/aNe4oA4SInINFwfwKAAU8h24wEynasx7aoikmHWRcFCppSLPKzycT
 hOAdq/9u1QoX6E0JnkcYw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:RnY5jAZIAQU=:FHOX7YOLjEVF/E2vjGHwgf
 u61N3Bwwg9IBFZGCgBduT3D6xkdv0aVyt2BycfmGTSMrZpVD+YC3d0elPvNt/VsBe/1QZOIJO
 lIwQ4bekSqBwbctf1hVF2VN6I1uy9xfXJsJPSZvVKKdlWzI1qb77EBTlJMnSvdkfH2X1wYD1E
 +CgWuVUuGoTo2gioUZIaKqopRoziea54/MTfepMAyuDZM1K8Ay13SCiYXFwM85EhHp1v4T2wo
 XBT1F8Pt3WQL0DvsXNW9BhK6ruE+I2RmexKDdALiR29/rBahppN5hRiJqqwiqaJhKiXUOr1Nv
 INAt0C1KYOytO5GCgG0sPptCfDayBOG9nDXWoCcnhXM9AKJR813hFCDhdAZV+6bwoYVFqMwUB
 8IxdBHzSl8HLAMbZQZZUNiLpY8Gg9ePs0Tkod2nOha7SiOz0qErtWnoivd+Ttiowx2tYc8x2U
 qRk5GrHqyObUPiY9+b0sIxWPMTgvdhMfVgNPu88U3fGSG30yN1MgxBgobtuQben5DRzyywJ0U
 3nbotlJG0hjoVJGr+xrnTsC6kLqQQUaCHcaGhwizenGIqaIwlA3pbW/X2kx997P2MrHoKvLIT
 7q9CauhIANBXX1LDXKM0qr1K0dQGccEsGgFwijX9J4FxLPlaEdlmrO7YdaKhnFbxhkFMj9Udi
 I/uPNerhaFiC21zI54yNZyy7dL84k+u0a1ea8AAnAu22n2siERbSZiaKBrfsmhtGA+fHiPSd5
 lNCvyD//D1YlFkAkCBa5BSOgPp7N99kYVhaX38ZBTirwR99BJ8JF1l7b3KA4Px2oiekf4z9Vm
 Vt36xqh
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Le 25/10/2022 à 04:34, Helge Deller a écrit :
> Signed-off-by: Helge Deller <deller@gmx.de>
> ---
> Changes:
> v5: Simplify check of arg2 against target_fd_max even more
> v4: Fix check of arg2
> v3: fd_trans_unregister() only called if close_range() doesn't fail
> v2: consider CLOSE_RANGE_CLOEXEC flag
> 
> diff --git a/linux-user/strace.list b/linux-user/strace.list
> index a87415bf3d..78796266e8 100644
> --- a/linux-user/strace.list
> +++ b/linux-user/strace.list
> @@ -103,6 +103,9 @@
>   #ifdef TARGET_NR_close
>   { TARGET_NR_close, "close" , "%s(%d)", NULL, NULL },
>   #endif
> +#ifdef TARGET_NR_close_range
> +{ TARGET_NR_close_range, "close_range" , "%s(%u,%u,%u)", NULL, NULL },
> +#endif
>   #ifdef TARGET_NR_connect
>   { TARGET_NR_connect, "connect" , "%s(%d,%#x,%d)", NULL, NULL },
>   #endif
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 2e954d8dbd..c51d619a5c 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -338,6 +338,13 @@ _syscall3(int,sys_syslog,int,type,char*,bufp,int,len)
>   #ifdef __NR_exit_group
>   _syscall1(int,exit_group,int,error_code)
>   #endif
> +#if defined(__NR_close_range) && defined(TARGET_NR_close_range)
> +#define __NR_sys_close_range __NR_close_range
> +_syscall3(int,sys_close_range,int,first,int,last,int,flags)
> +#ifndef CLOSE_RANGE_CLOEXEC
> +#define CLOSE_RANGE_CLOEXEC     (1U << 2)
> +#endif
> +#endif
>   #if defined(__NR_futex)
>   _syscall6(int,sys_futex,int *,uaddr,int,op,int,val,
>             const struct timespec *,timeout,int *,uaddr2,int,val3)
> @@ -8699,6 +8706,18 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
>       case TARGET_NR_close:
>           fd_trans_unregister(arg1);
>           return get_errno(close(arg1));
> +#if defined(__NR_close_range) && defined(TARGET_NR_close_range)
> +    case TARGET_NR_close_range:
> +        ret = get_errno(sys_close_range(arg1, arg2, arg3));
> +        if (ret == 0 && !(arg3 & CLOSE_RANGE_CLOEXEC)) {
> +            abi_long fd, maxfd;
> +            maxfd = MIN(arg2, target_fd_max);
> +            for (fd = arg1; fd < maxfd; fd++) {
> +                fd_trans_unregister(fd);
> +            }
> +        }
> +        return ret;
> +#endif
> 
>       case TARGET_NR_brk:
>           return do_brk(arg1);
> 

Applied to my linux-user-for-7.2 branch.

Thanks,
Laurent



