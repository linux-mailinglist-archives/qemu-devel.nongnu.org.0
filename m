Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D03D2DEA7B
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 21:47:33 +0100 (CET)
Received: from localhost ([::1]:44070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqMex-0005s6-V6
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 15:47:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kqMe4-0005QZ-Vk
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 15:46:37 -0500
Received: from mout.kundenserver.de ([217.72.192.73]:50559)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kqMe3-0000ON-2p
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 15:46:36 -0500
Received: from [192.168.100.1] ([82.252.144.198]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MfHMj-1kAyM83W4x-00gppd; Fri, 18 Dec 2020 21:46:32 +0100
Subject: Re: [PATCH v3 1/4] linux-user: Support F_ADD_SEALS and F_GET_SEALS
 fcntls
To: Shu-Chun Weng <scw@google.com>, qemu-devel@nongnu.org
References: <20201218193213.3566856-1-scw@google.com>
 <20201218193213.3566856-2-scw@google.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <ffe33d71-97ab-355d-ae1e-7b00fdeb6998@vivier.eu>
Date: Fri, 18 Dec 2020 21:46:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201218193213.3566856-2-scw@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:+4QeiWLx3JrJYVKFP8IQ4urbaDTpSXQ5rPl7oaBD49SuePUtK4d
 THeoUfSFmvw3y6y1mTJufsxKOI9HPRMgV5U7JLxXP1a3miyhVUw8znN+cMkySf05lPuTTCO
 k30g4OZd7AQjKcuLh3pk2DoPYzd/ZF+2FtLN0EIVPgKIhMy1njmW7U+FeVk1MVpvSOVzjRi
 uKY88NemZ683sk/5TAzrg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:OCvXPB5kaLE=:aTXQktHOvwtAG7fDxVngDV
 lN4os2xccA356ef6QrbzS7MS5aUPq5qm/s8c4xk0q/etkhPy6zy2FuIXR5Zmz+4jo42JKnmT2
 QFXocsnmVVeZ5L0sPZbfo51k8sEzflp6TV3k4twkY3DV6wHs+vpPzvA+m8/icE9mIRPYi1YUK
 j4q/QBFpF8oKVLFM0eSboyyIKJ2OJWCbz97Pelfe/+wZdNgj1ZS1Ej0VO4/C6KSC1kTFKSH6X
 Ohm7Bvvawskxo0FpU3x76GbBkOMBtzhDzTSSGy/4xcvI0ZnVDcNYncPm63LHzt/c2mjyZgF/e
 02FOd1S8qYQDkWV1VSdPe3w6kPTjV6vSj8zQ/gpEYmmj1LDu1Wrzv5cedw+FhTH25gmvH8bI+
 g/ywAtKkbJpNAuSinAeCB0UV2i2VuS/TWYd39sfl7Cqf9kPu+WamUUhsf0Dz/UKXTALXgN2MI
 PP2lRyY0Mw==
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 18/12/2020 à 20:32, Shu-Chun Weng via a écrit :
> Also reorder blocks so that they are all in the same order everywhere.
> 
> Signed-off-by: Shu-Chun Weng <scw@google.com>
> ---
> v1 -> v2:
>   Updated print_fcntl().
> 
> v2 -> v3:
>   Rebase to master on Dec 18, 2020
> 
>  linux-user/strace.c       | 39 ++++++++++++++++++++++++++++++++-------
>  linux-user/syscall.c      | 10 ++++++++++
>  linux-user/syscall_defs.h | 14 ++++++++------
>  3 files changed, 50 insertions(+), 13 deletions(-)
> 
> diff --git a/linux-user/strace.c b/linux-user/strace.c
> index e00275fcb5..227812c07e 100644
> --- a/linux-user/strace.c
> +++ b/linux-user/strace.c
> @@ -2066,11 +2066,34 @@ print_fcntl(void *cpu_env, const struct syscallname *name,
>          break;
>      case TARGET_F_SETLEASE:
>          qemu_log("F_SETLEASE,");
> -        print_raw_param(TARGET_ABI_FMT_ld, arg2, 0);
> +        print_raw_param(TARGET_ABI_FMT_ld, arg2, 1);
>          break;
>      case TARGET_F_GETLEASE:
>          qemu_log("F_GETLEASE");
>          break;
> +#ifdef F_DUPFD_CLOEXEC
> +    case TARGET_F_DUPFD_CLOEXEC:
> +        qemu_log("F_DUPFD_CLOEXEC,");
> +        print_raw_param(TARGET_ABI_FMT_ld, arg2, 1);
> +        break;
> +#endif
> +    case TARGET_F_NOTIFY:
> +        qemu_log("F_NOTIFY,");
> +        print_raw_param(TARGET_ABI_FMT_ld, arg2, 1);
> +        break;
> +#ifdef F_GETOWN_EX
> +    case TARGET_F_GETOWN_EX:
> +        qemu_log("F_GETOWN_EX,");
> +        print_pointer(arg2, 1);
> +        break;
> +#endif
> +#ifdef F_SETOWN_EX
> +    case TARGET_F_SETOWN_EX:
> +        qemu_log("F_SETOWN_EX,");
> +        print_pointer(arg2, 1);
> +        break;
> +#endif
> +#ifdef F_SETPIPE_SZ
>      case TARGET_F_SETPIPE_SZ:
>          qemu_log("F_SETPIPE_SZ,");
>          print_raw_param(TARGET_ABI_FMT_ld, arg2, 1);
> @@ -2078,14 +2101,16 @@ print_fcntl(void *cpu_env, const struct syscallname *name,
>      case TARGET_F_GETPIPE_SZ:
>          qemu_log("F_GETPIPE_SZ");
>          break;
> -    case TARGET_F_DUPFD_CLOEXEC:
> -        qemu_log("F_DUPFD_CLOEXEC,");
> -        print_raw_param(TARGET_ABI_FMT_ld, arg2, 1);
> +#endif
> +#ifdef F_ADD_SEALS
> +    case TARGET_F_ADD_SEALS:
> +        qemu_log("F_ADD_SEALS,");
> +        print_raw_param("0x"TARGET_ABI_FMT_lx, arg2, 1);
>          break;
> -    case TARGET_F_NOTIFY:
> -        qemu_log("F_NOTIFY,");
> -        print_raw_param(TARGET_ABI_FMT_ld, arg2, 0);
> +    case TARGET_F_GET_SEALS:
> +        qemu_log("F_GET_SEALS");
>          break;
> +#endif
>      default:
>          print_raw_param(TARGET_ABI_FMT_ld, arg1, 0);
>          print_pointer(arg2, 1);
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 7bf99beb18..be39cf8215 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -6596,6 +6596,14 @@ static int target_to_host_fcntl_cmd(int cmd)
>      case TARGET_F_GETPIPE_SZ:
>          ret = F_GETPIPE_SZ;
>          break;
> +#endif
> +#ifdef F_ADD_SEALS
> +    case TARGET_F_ADD_SEALS:
> +        ret = F_ADD_SEALS;
> +        break;
> +    case TARGET_F_GET_SEALS:
> +        ret = F_GET_SEALS;
> +        break;
>  #endif
>      default:
>          ret = -TARGET_EINVAL;
> @@ -6888,6 +6896,8 @@ static abi_long do_fcntl(int fd, int cmd, abi_ulong arg)
>      case TARGET_F_GETLEASE:
>      case TARGET_F_SETPIPE_SZ:
>      case TARGET_F_GETPIPE_SZ:
> +    case TARGET_F_ADD_SEALS:
> +    case TARGET_F_GET_SEALS:
>          ret = get_errno(safe_fcntl(fd, host_cmd, arg));
>          break;
>  
> diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
> index b934d0b606..1beaa71d37 100644
> --- a/linux-user/syscall_defs.h
> +++ b/linux-user/syscall_defs.h
> @@ -2376,12 +2376,14 @@ struct target_statfs64 {
>  #endif
>  
>  #define TARGET_F_LINUX_SPECIFIC_BASE 1024
> -#define TARGET_F_SETLEASE (TARGET_F_LINUX_SPECIFIC_BASE + 0)
> -#define TARGET_F_GETLEASE (TARGET_F_LINUX_SPECIFIC_BASE + 1)
> -#define TARGET_F_DUPFD_CLOEXEC (TARGET_F_LINUX_SPECIFIC_BASE + 6)
> -#define TARGET_F_SETPIPE_SZ (TARGET_F_LINUX_SPECIFIC_BASE + 7)
> -#define TARGET_F_GETPIPE_SZ (TARGET_F_LINUX_SPECIFIC_BASE + 8)
> -#define TARGET_F_NOTIFY  (TARGET_F_LINUX_SPECIFIC_BASE+2)
> +#define TARGET_F_SETLEASE            (TARGET_F_LINUX_SPECIFIC_BASE + 0)
> +#define TARGET_F_GETLEASE            (TARGET_F_LINUX_SPECIFIC_BASE + 1)
> +#define TARGET_F_DUPFD_CLOEXEC       (TARGET_F_LINUX_SPECIFIC_BASE + 6)
> +#define TARGET_F_NOTIFY              (TARGET_F_LINUX_SPECIFIC_BASE + 2)
> +#define TARGET_F_SETPIPE_SZ          (TARGET_F_LINUX_SPECIFIC_BASE + 7)
> +#define TARGET_F_GETPIPE_SZ          (TARGET_F_LINUX_SPECIFIC_BASE + 8)
> +#define TARGET_F_ADD_SEALS           (TARGET_F_LINUX_SPECIFIC_BASE + 9)
> +#define TARGET_F_GET_SEALS           (TARGET_F_LINUX_SPECIFIC_BASE + 10)
>  
>  #include "target_fcntl.h"
>  
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

