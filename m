Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ADC44A5887
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 09:28:51 +0100 (CET)
Received: from localhost ([::1]:47328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEoWw-0004QV-5e
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 03:28:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1nEnBK-00024p-MD; Tue, 01 Feb 2022 02:02:33 -0500
Received: from mout.kundenserver.de ([212.227.126.133]:47145)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1nEnBJ-0002EU-2d; Tue, 01 Feb 2022 02:02:26 -0500
Received: from [192.168.100.1] ([82.142.10.94]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MmDAW-1mWgv90ClE-00iDiV; Tue, 01 Feb 2022 08:02:23 +0100
Message-ID: <6f3fafd3-f221-0b67-743b-e28b1835206b@vivier.eu>
Date: Tue, 1 Feb 2022 08:02:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] linux-user/syscall: Translate TARGET_RLIMIT_RTTIME
Content-Language: fr
To: Serge Belyshev <belyshev@depni.sinp.msu.ru>
References: <87y236lpwb.fsf@depni.sinp.msu.ru>
 <4e110850-a303-d0a4-158b-6186367aa739@vivier.eu>
 <87ilu2l473.fsf@depni.sinp.msu.ru> <87ee4ql3yk.fsf_-_@depni.sinp.msu.ru>
 <87a6fel3w8.fsf_-_@depni.sinp.msu.ru>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <87a6fel3w8.fsf_-_@depni.sinp.msu.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:4Y/fQ2tDecvA6GXXOy9RbS0F64hV/IRubqmezIj7lXXGa41Sgw0
 bTCIgDBTmnWF87eJcqokUy6sxSYMpPw71CRTI36EkrOokdIWAa8QQBxQ/KtF8vdJQ4DrWwr
 nehlWYCi8YCkF6LCgA2lUzuKjWuGr0qQQX0lnuCm5wEMEQft0zloWH4Ylq+KpEXpeeeu6rO
 JuwiQaxTwdybrI9s1RZ5g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:1YuaCVL7bRU=:Ru+l0BMZ7xgmsNciNAUscS
 4BY3LNmxNF6ggTdZ1tVzcgSmP9r8jf8GdSY2adQ8UKctFpdqIfTwuPH4NQPV/om/w5nvZGRoV
 WeU+OGXSZJ7cH/yvMSTQSrR5dJy/BC7OoskQQdwTmRR/WCf2h9gKd488o2tH4GfxKwqMZzzZA
 xJeqF4U2iAaCOAo0hKFSpuSGfi3R25vKOUiFOjTa4ZXgv+F3RAVjwXlauYX9SXPiHaEQvgt8v
 IjAMrvT1CFVcrpPM6TTShImKVvEyquBP6zNerLNAirNuobTxIuANv8zo2ssuZy2tfImwzwpCS
 n2GdQFPQmuhEhWSezwobRTqr2nNL8FsGssGrxXbEMce34JUXJ0oZjrD9V6yZkyRFNVc2ntAHN
 vUoPTjuLQiszS5R7hRVAIjiPiPI7UyiJ98iI6C+Ue8wL7ZWSWo2/O23TpM82pUMQL+DZsM9Td
 M5KE4RJ7vh6r4Csy2116GLDyh5NTeEZAEEgz8+0desfjaZD6EMRBX7+MKZ1fdj5vc/74OoY5c
 ZfM2m/M1v9FBaymUNjmFfSgHQwXpT8rDk0uEZYvm4M6kXc1/8gSaQjB+d5YqT6bSOZgr7nYgT
 JP29jLdOM/AgLTwbcQ7DQ+YVUcL8KQ6sEvT6G9HFSGJ+LquOr3w6uPhHqjErBQzCtas6VW8Ww
 7l1fDRm4Tk8IzN3ZlW90o3peHsLrWQmO8a691tLpyKY+PhoIC2BySDQ3OC1u2U9bdZtM=
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 29/01/2022 à 20:48, Serge Belyshev a écrit :
> 
> Signed-off-by: Serge Belyshev <belyshev@depni.sinp.msu.ru>
> ---
>   linux-user/generic/target_resource.h | 1 +
>   linux-user/syscall.c                 | 2 ++
>   2 files changed, 3 insertions(+)
> 
> diff --git a/linux-user/generic/target_resource.h b/linux-user/generic/target_resource.h
> index f04c93b125..539d8c4677 100644
> --- a/linux-user/generic/target_resource.h
> +++ b/linux-user/generic/target_resource.h
> @@ -33,5 +33,6 @@ struct target_rlimit64 {
>   #define TARGET_RLIMIT_MSGQUEUE          12
>   #define TARGET_RLIMIT_NICE              13
>   #define TARGET_RLIMIT_RTPRIO            14
> +#define TARGET_RLIMIT_RTTIME            15
>   
>   #endif
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 5950222a77..6d41a741ac 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -1083,6 +1083,8 @@ static inline int target_to_host_resource(int code)
>           return RLIMIT_RSS;
>       case TARGET_RLIMIT_RTPRIO:
>           return RLIMIT_RTPRIO;
> +    case TARGET_RLIMIT_RTTIME:
> +        return RLIMIT_RTTIME;
>       case TARGET_RLIMIT_SIGPENDING:
>           return RLIMIT_SIGPENDING;
>       case TARGET_RLIMIT_STACK:

Applied to my linux-user-for-7.0 branch.

Thanks,
Laurent


