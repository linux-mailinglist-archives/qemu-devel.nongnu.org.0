Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B33D067D114
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 17:13:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL4s4-0006aX-Hn; Thu, 26 Jan 2023 11:13:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pL4s2-0006aO-Fb
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 11:13:02 -0500
Received: from mout.kundenserver.de ([212.227.126.187])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pL4s0-0003aX-6R
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 11:13:02 -0500
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MRT6b-1p0XLr11cb-00NTic; Thu, 26 Jan 2023 17:12:58 +0100
Message-ID: <087f172a-ce53-7924-ba0b-072412fa93c6@vivier.eu>
Date: Thu, 26 Jan 2023 17:12:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] linux-user: Improve strace output of getgroups() and
 setgroups()
Content-Language: fr
To: Helge Deller <deller@gmx.de>, qemu-devel@nongnu.org
References: <20230115210057.445132-1-deller@gmx.de>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20230115210057.445132-1-deller@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:igOykJEtNxO+sjZUysa6DkD40iX2jvpEzybFFEO2unswhrl7aT1
 i8YL/NkTJquOcuSUJp39YWQa+mpCaf9o43pwo2jAwM+b2z1xnRmGo1b8dJTCH/97KyTONar
 ybgbxmJqQtOVfF8lBajE3SGJHStnqagN/h/fBpqSKweN/BFzY9p3Rx12pyl2HlfeFmP7aNg
 9ilJI/n/HKFEzjQ+AdCOw==
UI-OutboundReport: notjunk:1;M01:P0:8TlCLNndMXk=;L7C53fBc/cC3O1HyK9o27LBHv6j
 yO/nhCCKxqDvhol4N/j14ZpN/CpzdpC/Lix5ZXgCfXfweGh8mvniDcXuvL/fRBt9wkmc+AItk
 8VdEb2XREt7SDHwjEKd/TUtG5kDHY4fmaEVepCu/Cjvznx3/p0TbKWk062K7kkXrnlSObKc09
 qMKfhHneLrqj4jS8VYCs1SmSSuLcYO8M8PWbt+pqSmGqLRNvDFuwUy2O3qahKyvqkK4HX4c16
 1Xwu24zh0YGmZTlPg7uw/8ZhqWCbM6KPgghqc9X5GZf1lbIiknfA0X2Dav14xIlbnYmGCcsBe
 2NN8OtV0NR33i1UPejn+IzgqTy5AoV1vPuij/vbO7zB4FmI6JjOBxw2WVnvqyG7H7UsgyaEIu
 bFVx8wGB5gxH7HDLkFdLfCgAPgoRqLGmvzJolcQLbv80qKb/gkhKiitbkYTAHv77xz7jyZ3fX
 bfJ97zrw/PYxMEYtoWc9UlDizupWX7yS5y8tb2EQVPtP3G9mKv9AIkgNR/IRC6Qyh7vuXnB59
 GE34Kt6qSCP7JSlPjRXybQZ35k4m53nQo/uCxjDEGovZSx92jMQbZAl22j+q+cwKIsOZrzLAb
 Dbiaiwitqt0OE++r1fCFi8Lxi4XaHCRHbEB7/rEmHIdPX+dMEoaRIgNUiAWGNaHL+38/dJg4T
 7bJaELAeSA9IJBW3XOflu7HazYzTFaiGb+5BhHeWVg==
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.15,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Le 15/01/2023 à 22:00, Helge Deller a écrit :
> Make the strace look nicer for those syscalls.
> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> ---
>   linux-user/strace.list | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/linux-user/strace.list b/linux-user/strace.list
> index 3924046426..7c1124a718 100644
> --- a/linux-user/strace.list
> +++ b/linux-user/strace.list
> @@ -321,10 +321,10 @@
>   { TARGET_NR_getgid32, "getgid32" , NULL, NULL, NULL },
>   #endif
>   #ifdef TARGET_NR_getgroups
> -{ TARGET_NR_getgroups, "getgroups" , NULL, NULL, NULL },
> +{ TARGET_NR_getgroups, "getgroups" , "%s(%d,%p)", NULL, NULL },
>   #endif
>   #ifdef TARGET_NR_getgroups32
> -{ TARGET_NR_getgroups32, "getgroups32" , NULL, NULL, NULL },
> +{ TARGET_NR_getgroups32, "getgroups32" , "%s(%d,%p)", NULL, NULL },
>   #endif
>   #ifdef TARGET_NR_gethostname
>   { TARGET_NR_gethostname, "gethostname" , NULL, NULL, NULL },
> @@ -1308,10 +1308,10 @@
>   { TARGET_NR_setgid32, "setgid32" , "%s(%u)", NULL, NULL },
>   #endif
>   #ifdef TARGET_NR_setgroups
> -{ TARGET_NR_setgroups, "setgroups" , NULL, NULL, NULL },
> +{ TARGET_NR_setgroups, "setgroups" , "%s(%d,%p)", NULL, NULL },
>   #endif
>   #ifdef TARGET_NR_setgroups32
> -{ TARGET_NR_setgroups32, "setgroups32" , NULL, NULL, NULL },
> +{ TARGET_NR_setgroups32, "setgroups32" , "%s(%d,%p)", NULL, NULL },
>   #endif
>   #ifdef TARGET_NR_sethae
>   { TARGET_NR_sethae, "sethae" , NULL, NULL, NULL },
> --
> 2.38.1
> 
> 
Applied to my linux-user-for-8.0 branch.

Thanks,
Laurent



