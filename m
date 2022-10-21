Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B88BC607B22
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 17:38:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olu6A-0007DM-Mo
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 11:38:14 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olu5w-0006EX-8E
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 11:38:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1olu5n-0004jH-Om
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 11:37:51 -0400
Received: from mout.kundenserver.de ([217.72.192.74])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1olu5l-0007It-Vb
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 11:37:51 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MSLlu-1ofKWD3Nfs-00SgM1; Fri, 21 Oct 2022 17:37:33 +0200
Message-ID: <0825f689-a649-3b3c-796e-ae3d8a3556e0@vivier.eu>
Date: Fri, 21 Oct 2022 17:37:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH] linux-user: Implement faccessat2
Content-Language: fr
To: WANG Xuerui <xen0n@gentoo.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 =?UTF-8?Q?Andreas_K_=2e_H=c3=bcttel?= <dilfridge@gentoo.org>
References: <20221009060813.2289077-1-xen0n@gentoo.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20221009060813.2289077-1-xen0n@gentoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:yIVHzhCwDdtCJzdYMFI78tLYKDlbxzFNR2NLRRLI76MhljHruwk
 HxqNHmmoI8lyblkcjut6RGeX9IYUE41VXfD3fMMI3zNHWU+zKi3YJ8ckgHRdzwf/s+Yt03M
 7IiaPZax23FctTs6hmcNp9qWRPUTyUdowSLjm4eKWK6+kn0OA1e4PTeY6dYtVTtM13QeWjU
 ShHPnvdYKNH0dgaZYt+VQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:7ldu8XlwsOE=:2psD4mGBaC6gDRSYXQ9UTV
 mKxZYizvZI3l3ee1Rm36lBcMGyt1povN5MPmmjOPgHxWOwpf8IOeXX1P7UQ9jdiLw5e1EAMrw
 KtsW9581qTQVEk7j7dtG2qnG8MkrYQM1K1GKszHc0QwoTkwMb/QLQBUNP3BnLrVlUzwI1jBM+
 yZ2aIlG1WK3pYa85GIPPARq8KuJEbrRTM7EnObRMrhn6eRVGCp6K026QI4tWWE3pwhkR8Exkl
 5bfNhdBwYIeKM4RDpOmtIsBaV5nT4IZqfGZ49Km5J3wBbH+dhdGTf1MVIkjwsOIoflxErmbc/
 ewRSTBrgXGCQbM30CBSxYQFzWxxOFfkebQi6/uEy5T6EPr+2Uk1Cc7cUQbemrhTrxKceq/eZ3
 1Akp5v+GyTlOzKgNjbIu97wwTbv3jB8I/y0Ih2uFc7F+fifxeHb8c2LhMhzFg6fPiQW5VDWui
 Wcob8oKiQ2S3BrDIRg+qADMnPalJbUhbHHomWyHBUEJW1ROjavCqliUO4LcZpVpAvkM9ER/ha
 U3axBMkwnKt1I1l3Twkj5AYvWJrtkFUjp1Xie8F4dlsv02NGzxe8xqwBwZLIivTJZmkKDcwVp
 XKRgdolw7PqrC0b5oy6xFmfmbPXY6Ah6dLRLVYofG8ICU3/iVQzz8URqT8VnnURb7lKv17Fl4
 T7hnu1qApXDDxwlF0UCVeGE/08EIY1FO1i7y9dczbkgCJ5sbVnksLVkoKNF8VuZ3dCa5A3gxs
 F0focc28gzcsSKL2zrUaDCKkNkqSV4AcV7MSidGH5Il22occpERo0TCTifd4hVjdF6al85XEd
 NDTY5U4
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 09/10/2022 à 08:08, WANG Xuerui a écrit :
> User space has been preferring this syscall for a while, due to its
> closer match with C semantics, and newer platforms such as LoongArch
> apparently have libc implementations that don't fallback to faccessat
> so normal access checks are failing without the emulation in place.
> 
> Tested by successfully emerging several packages within a Gentoo loong
> stage3 chroot, emulated on amd64 with help of static qemu-loongarch64.
> 
> Reported-by: Andreas K. Hüttel <dilfridge@gentoo.org>
> Signed-off-by: WANG Xuerui <xen0n@gentoo.org>
> ---
>   linux-user/strace.list | 3 +++
>   linux-user/syscall.c   | 9 +++++++++
>   2 files changed, 12 insertions(+)
> 
> diff --git a/linux-user/strace.list b/linux-user/strace.list
> index a87415bf3d..3df2184580 100644
> --- a/linux-user/strace.list
> +++ b/linux-user/strace.list
> @@ -178,6 +178,9 @@
>   #ifdef TARGET_NR_faccessat
>   { TARGET_NR_faccessat, "faccessat" , NULL, print_faccessat, NULL },
>   #endif
> +#ifdef TARGET_NR_faccessat2
> +{ TARGET_NR_faccessat2, "faccessat2" , NULL, print_faccessat, NULL },
> +#endif
>   #ifdef TARGET_NR_fadvise64
>   { TARGET_NR_fadvise64, "fadvise64" , NULL, NULL, NULL },
>   #endif
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 2e954d8dbd..a81f0b65b9 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -9110,6 +9110,15 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
>           unlock_user(p, arg2, 0);
>           return ret;
>   #endif
> +#if defined(TARGET_NR_faccessat2) && defined(__NR_faccessat2)
> +    case TARGET_NR_faccessat2:
> +        if (!(p = lock_user_string(arg2))) {
> +            return -TARGET_EFAULT;
> +        }
> +        ret = get_errno(faccessat(arg1, p, arg3, arg4));
> +        unlock_user(p, arg2, 0);
> +        return ret;
> +#endif
>   #ifdef TARGET_NR_nice /* not on alpha */
>       case TARGET_NR_nice:
>           return get_errno(nice(arg1));

I have applied this patch to my linux-user-for-7.2 branch,
adding defined(TARGET_NR_faccessat2) for print_faccessat() and removing the defined(__NR_faccessat2) 
in syscall.c (as we call the glibc wrapper).

Thanks,
Laurent

