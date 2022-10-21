Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 454266079C3
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 16:38:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oltAi-0001Zw-GP
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 10:38:53 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oltAi-0001TE-BG
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 10:38:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oltAS-0007e6-65
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 10:38:36 -0400
Received: from mout.kundenserver.de ([212.227.17.24])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oltAQ-0000Np-9k
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 10:38:35 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1Mxm7U-1p1lod2YpC-00zIhb; Fri, 21 Oct 2022 16:38:17 +0200
Message-ID: <cf3c7362-25f1-e615-ce73-9bc86405f67b@vivier.eu>
Date: Fri, 21 Oct 2022 16:38:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH] linux-user: Fix more MIPS n32 syscall ABI issues
Content-Language: fr
To: WANG Xuerui <xen0n@gentoo.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?Q?Andreas_K_=2e_H=c3=bcttel?= <dilfridge@gentoo.org>,
 Joshua Kinard <kumba@gentoo.org>
References: <20221006085500.290341-1-xen0n@gentoo.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20221006085500.290341-1-xen0n@gentoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:L2nr8nEFD0fuLvK7+7vlRZkvSlyN8t3UCI6pKpwoIOZpcGmPMhI
 7SpyuLMarvJEZ3d9izevPvMiXmpboQJfDGLZYuVBgYFMhU+k827xFIgblG/H5iyzDRtZ6TX
 9XWiLowhgZT1dOK7GOt800JDYVAU5rJtl0vwGaw3kPnmAskajrU/a8JVkqO59jdJuygx4Qv
 rLOt/YMiYpbnCT2K3ZuXw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:O7ZaI2cZHxA=:wqw0SqIfclcOGGMQaZ5S7q
 E7/1kmQjVXAe3RiUwoZiU8OWimRuQLfStn8ooWItQPt/JA0XRTcv85sxtFFQiZm/3Yw1N9XmI
 vOpA6dMbbK2CUrMNJu6jbz9wtvaeAf6EopXZbHiTjE55imk/O+OrKG6oCIf/BMnRN1YxtlkzT
 XHYQUy4wDdtLEryUElgBSGo5xZu16XPAgDMhPgA8wUYbH5wt65lDbWbtc1BumtHHEwt3gysA6
 bLIlcBdSfRleM6EhahoT+L/PRhorUulDfl5hiCLI0M/dj/IWShktjHqWKzgorcfjsY9Jp06YE
 d8iRByRpAxXncIAKSe0YqLL6838eGDTXZQGOmAWN9i+sY90w+hgsnAtTtcMj/V8AUYK4h8vIS
 V453C5h4nW+yju+w8IQ5bJvNkQm+Nvf93ZrbX6FU+7ziLgbFqtcqrs8UaEav9gU7XlxdUTYHg
 DNQwBKEWI5/n1ghAmFS0EX9bkogQeIIvBE51N5qV9UUmeWEdXEsP/t8UeGKcp6qtLj6AEHPpR
 GQJSnHW3kE/XhZPtwRmjwwZXRnosaRky2bfP+OozYVI2fnKwVdJkncZX6YD2Q9xQPkERHTesj
 mLXefxb3RX3DuGoHVlliR5nHvT766M9F95bt0sZTyD4p39BFppEj1qQJuo3gKe4oU/K+xshva
 CUpL+hHiSC1HWWLrylCeQSPD9INNb71/QrLGat5q6Fssgpc9DEnOFgbWXSYLp9JR2xRLgnK69
 3yBgvPFnOVAtbAj6o+d0xhqXoaMmQUoPO/26Xp0DtJ4HUGxNWOz5Z10vwwA7maAYOu+neQj0F
 2WvKNI+
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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

Le 06/10/2022 à 10:55, WANG Xuerui a écrit :
> In commit 80f0fe3a85 ("linux-user: Fix syscall parameter handling for
> MIPS n32") the ABI problem regarding offset64 on MIPS n32 was fixed,
> but still some cases remain where the n32 is incorrectly treated as any
> other 32-bit ABI that passes 64-bit arguments in pairs of GPRs. Fix by
> excluding TARGET_ABI_MIPSN32 from various TARGET_ABI_BITS == 32 checks.
> 
> Closes: https://gitlab.com/qemu-project/qemu/-/issues/1238
> Signed-off-by: WANG Xuerui <xen0n@gentoo.org>
> Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Cc: Andreas K. Hüttel <dilfridge@gentoo.org>
> Cc: Joshua Kinard <kumba@gentoo.org>
> ---
> 
> Note: I can't reproduce the crash with neither MIPS n32 sysroot at my hand
> (a self-built one for Loongson-2F, and stage3-mips64_n32-openrc-20221001T170527Z),
> so I can only verify by looking at the (host and qemu) strace outputs, and
> would have to ask you to review/test this harder. Thanks.
> 
>   linux-user/syscall.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 2e954d8dbd..8b2d39fe73 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -11793,7 +11793,7 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
>           return -host_to_target_errno(ret);
>   #endif
>   
> -#if TARGET_ABI_BITS == 32
> +#if TARGET_ABI_BITS == 32 && !defined(TARGET_ABI_MIPSN32)
>   
>   #ifdef TARGET_NR_fadvise64_64
>       case TARGET_NR_fadvise64_64:
> @@ -11920,7 +11920,7 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
>           return get_errno(sys_gettid());
>   #ifdef TARGET_NR_readahead
>       case TARGET_NR_readahead:
> -#if TARGET_ABI_BITS == 32
> +#if TARGET_ABI_BITS == 32 && !defined(TARGET_ABI_MIPSN32)
>           if (regpairs_aligned(cpu_env, num)) {
>               arg2 = arg3;
>               arg3 = arg4;
> @@ -12612,7 +12612,7 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
>   #endif /* CONFIG_EVENTFD  */
>   #if defined(CONFIG_FALLOCATE) && defined(TARGET_NR_fallocate)
>       case TARGET_NR_fallocate:
> -#if TARGET_ABI_BITS == 32
> +#if TARGET_ABI_BITS == 32 && !defined(TARGET_ABI_MIPSN32)
>           ret = get_errno(fallocate(arg1, arg2, target_offset64(arg3, arg4),
>                                     target_offset64(arg5, arg6)));
>   #else
> @@ -12623,7 +12623,7 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
>   #if defined(CONFIG_SYNC_FILE_RANGE)
>   #if defined(TARGET_NR_sync_file_range)
>       case TARGET_NR_sync_file_range:
> -#if TARGET_ABI_BITS == 32
> +#if TARGET_ABI_BITS == 32 && !defined(TARGET_ABI_MIPSN32)
>   #if defined(TARGET_MIPS)
>           ret = get_errno(sync_file_range(arg1, target_offset64(arg3, arg4),
>                                           target_offset64(arg5, arg6), arg7));
> @@ -12645,7 +12645,7 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
>       case TARGET_NR_arm_sync_file_range:
>   #endif
>           /* This is like sync_file_range but the arguments are reordered */
> -#if TARGET_ABI_BITS == 32
> +#if TARGET_ABI_BITS == 32 && !defined(TARGET_ABI_MIPSN32)
>           ret = get_errno(sync_file_range(arg1, target_offset64(arg3, arg4),
>                                           target_offset64(arg5, arg6), arg2));
>   #else

Applied to my linux-user-for-7.2 branch.

Thanks,
Laurent


