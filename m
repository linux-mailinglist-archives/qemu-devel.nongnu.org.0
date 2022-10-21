Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85895607A06
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 16:58:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oltTl-0000K8-B2
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 10:58:35 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oltTl-0000D3-31
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 10:58:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oltTW-0006RJ-0M
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 10:58:18 -0400
Received: from mout.kundenserver.de ([212.227.17.13])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oltTO-0006C4-51
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 10:58:17 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1M2fHt-1oovc71X6V-004Bvy; Fri, 21 Oct 2022 16:58:08 +0200
Message-ID: <deb0aef6-e0cb-2f0c-ab53-9f0d5f810597@vivier.eu>
Date: Fri, 21 Oct 2022 16:58:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH] linux-user: fix pidfd_send_signal()
Content-Language: fr
To: qemu-devel@nongnu.org
Cc: Helge Deller <deller@gmx.de>
References: <20221005163826.1455313-1-laurent@vivier.eu>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20221005163826.1455313-1-laurent@vivier.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Poahy9pe0qZDeZAsZTyutGh9vlS5snlnJrrVV4h+mjgs8Hs30Uc
 HuBuzKFnyuMPRIrR6X6OAaU4hecVFxEo8zU5UqP+BBh3gej+sUYyMPyooKRj+5rh7Cfz+Zc
 r1nAqq/UnjdHe2GQlQJDywTqm3XFmxOGv/LCXnChHWBfLQjfMqbXUeEg2AGw1x5wG0MacMd
 dnRncP5CyVASbZw5y0SRA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:gH+Ca8doIPY=:CagrpBHH5SXdRwoYZnWsaY
 +mggAaHS6C13PJqc01XmT5SRuGuTtO8yWT+E++fmMAzcrkG0ZSfbU1aEOgzSiwthCFSOZO2xn
 uKR09hAkcCiIPXCEH9324roY0x7qIYxS8mGU0B44wyBx8kUZ3yNb8FR0yExhIjIIyDrofifnc
 TturjxdXeldeMg/u5Cl+elJV2XtWYYjVmInoQdckFWQUL9ALpIJ+Jg1Fg3tMaVMa1vtXCaA6O
 YGxbKzyheq8b66doT0dsfZe9rzd+u7A7AV9/y4iexS3OKr+uSieS7KG+oaW1FVbhkGZU7tD2A
 xcjmuoJLZlbyI8RIAqLwA9VyImX84dyLB+jed2tzBLWnemcdnincdeEpbj+6XB7l96UNlooLM
 79FRfXQi0EKBKC/omruYadrWgjGq4okhFvaf03PZYE/2hN+vSTRa7Ha3FxaAJuGTwLm9B8Iwq
 EOxndIUgsa8eQYxSK3BPl4o5eDrH14nHqyQSuFufN0J2waBuLRU8qRlxKIpXQDDrgKekguiRJ
 TZJ6EeiixnhgMaVDAPlYTSKmfj3wMv5+/NCqLRAx7m40JnHfubCl1abnB4TMdhvWpKRh22Fok
 MmQbsLD/ojuOhOVu8j72xMymAu38hK0DXKJU6K7iDuAt0r74jhqtb4+EAzIkIEJLiqgAigHNw
 WnpbXtVDmnXlURr7BDADRvza3iwVJRC3C/ac9pdy0vYrQfCXKu5bnIjpoA2tmYK9mg3fg4h8w
 vW/zIvOvQ/KyQG6VzWXWs1IEpPHVwlfuUhTCzleUajH4u5joiShpK2FzxMVRaHsqWTu40zKT6
 v9aLbqQ
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
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

Le 05/10/2022 à 18:38, Laurent Vivier a écrit :
> According to pidfd_send_signal(2), info argument can be a NULL pointer.
> Fix strace to correctly manage ending comma in parameters.
> 
> Fixes: cc054c6f13 ("linux-user: Add pidfd_open(), pidfd_send_signal() and pidfd_getfd() syscalls")
> cc: Helge Deller <deller@gmx.de>
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> ---
>   linux-user/strace.c  |  4 ++--
>   linux-user/syscall.c | 19 ++++++++++++-------
>   2 files changed, 14 insertions(+), 9 deletions(-)
> 
> diff --git a/linux-user/strace.c b/linux-user/strace.c
> index 37bc96df9bb6..86c081c83f74 100644
> --- a/linux-user/strace.c
> +++ b/linux-user/strace.c
> @@ -3383,10 +3383,10 @@ print_pidfd_send_signal(CPUArchState *cpu_env, const struct syscallname *name,
>   
>           unlock_user(p, arg2, 0);
>       } else {
> -        print_pointer(arg2, 1);
> +        print_pointer(arg2, 0);
>       }
>   
> -    print_raw_param("%u", arg3, 0);
> +    print_raw_param("%u", arg3, 1);
>       print_syscall_epilogue(name);
>   }
>   #endif
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 2e954d8dbd9e..b1493917ee07 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -8679,16 +8679,21 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
>   #if defined(__NR_pidfd_send_signal) && defined(TARGET_NR_pidfd_send_signal)
>       case TARGET_NR_pidfd_send_signal:
>           {
> -            siginfo_t uinfo;
> +            siginfo_t uinfo, *puinfo;
>   
> -            p = lock_user(VERIFY_READ, arg3, sizeof(target_siginfo_t), 1);
> -            if (!p) {
> -                return -TARGET_EFAULT;
> +            if (arg3) {
> +                p = lock_user(VERIFY_READ, arg3, sizeof(target_siginfo_t), 1);
> +                if (!p) {
> +                    return -TARGET_EFAULT;
> +                 }
> +                 target_to_host_siginfo(&uinfo, p);
> +                 unlock_user(p, arg3, 0);
> +                 puinfo = &uinfo;
> +            } else {
> +                 puinfo = NULL;
>               }
> -            target_to_host_siginfo(&uinfo, p);
> -            unlock_user(p, arg3, 0);
>               ret = get_errno(pidfd_send_signal(arg1, target_to_host_signal(arg2),
> -                &uinfo, arg4));
> +                                              puinfo, arg4));
>           }
>           return ret;
>   #endif

Applied to my linux-user-for-7.2 branch.

Thanks,
Laurent



