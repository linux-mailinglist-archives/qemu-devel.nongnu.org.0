Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86744485139
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 11:39:35 +0100 (CET)
Received: from localhost ([::1]:45088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n53hd-0007ta-Ho
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 05:39:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n53TG-0000dV-6J
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 05:24:43 -0500
Received: from mout.kundenserver.de ([212.227.17.24]:40487)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n53TE-0007YI-Fx
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 05:24:41 -0500
Received: from [192.168.100.1] ([82.142.30.62]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MhToz-1mRqyL2oFv-00ecyo; Wed, 05 Jan 2022 11:24:38 +0100
Message-ID: <07a42eb9-e80e-1671-5a5a-30bee6e57e1a@vivier.eu>
Date: Wed, 5 Jan 2022 11:24:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 7/7] linux-user/nios2: Use set_sigmask in
 do_rt_sigreturn
Content-Language: fr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211221025012.1057923-1-richard.henderson@linaro.org>
 <20211221025012.1057923-8-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20211221025012.1057923-8-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Sk0g/Nk3dBuLwjyX6HOmj7WZ95O5ERQWFPmPLJ2zoR4599sMfv4
 unnL6uhAvSiqh9N/1djCyi19x/ALbACYccjY5eMt+JYkgJr0mYkUrPVKoNCh+Pdq2f4y9tt
 4jNX0weXRDN6hZ2RkL+Yxe7ZsCt/1zW1apavmLBA/i3P0rzN+yKA1Pi7P0ry7/lQvfZ1cZN
 gkZ5X5yaSYFvX8eNVpKGg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:iKrXucQ1OTA=:S6FGNfvH1SBY5wJe055YWk
 zoHDQv6u3bsM1LsuNIttS/RhSZ+/7+dPW5PCWhQ+hZJCU5+5xUOuyDUzLyjsFXBPg+a7/pS0s
 Wbq6N3ud2n4VsEo/Xs752HnfB+z7o8rs6fPXTdmMIZEyipeZe8kMau7CEm+vtqiRBGItI9BF1
 3+cLPcUk2uYfkvxbcXFM8dUkVVdh5+dvDmx0GP7gISJzW4bCV+xCXBOtM7mvow/ikVK+XFJ9Z
 XbXHgoFjOVQlhae6Nr85RGITcurORfKcTWG/7tBH3i0Xsj4AgcjJzS2ain+zG9wwQi+L/d4CI
 BeD5zKVcX5LjHL8LrIdlqoWBeFkO1nXXKatcYgnRUxG/Yu4yAZ+WzWCb42YCnFclPLxleQmEN
 /OJLSifo5dqgt1DD96ICJC7zoDZqxbdss0hyot/PT7s3OpCz6vJ68WkneqPp2oQERaanj6xRD
 DqeHdMyhyGeI0eaQAJURZIiR+xkXg+shV04a4qwphgSEovmbwTjPmZAFz0xXkk5im+qCiLDb6
 Fu3tdQVbOUw/PHkUxGffM4uq8vcG9g5iliQC1iYL/mwMTVaGh9O2wdC+qzAx9KIGoUp7SJz5c
 UrTQxh1xNVjJ8EgddrQXD3rOX5DcLDjes2zc7M83Iu77vxzs28vShOHAVjVEyfM8M8vbG5s6M
 jE1XkwH+vPpFjjOZVKtW0r/RefIps1coUQpdTQWVqNLsh5ek+XmSh526ujcEX8ENpTHE=
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.057,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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

Le 21/12/2021 à 03:50, Richard Henderson a écrit :
> Using do_sigprocmask directly was incorrect, as it will
> leave the signal blocked by the outer layers of linux-user.
> 
> Reviewed-by: Laurent Vivier <laurent@vivier.eu>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   linux-user/nios2/signal.c | 2 +-
>   linux-user/signal.c       | 2 --
>   2 files changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/linux-user/nios2/signal.c b/linux-user/nios2/signal.c
> index 80e3d42fc9..517cd39270 100644
> --- a/linux-user/nios2/signal.c
> +++ b/linux-user/nios2/signal.c
> @@ -205,7 +205,7 @@ long do_rt_sigreturn(CPUNios2State *env)
>       }
>   
>       target_to_host_sigset(&set, &frame->uc.tuc_sigmask);
> -    do_sigprocmask(SIG_SETMASK, &set, NULL);
> +    set_sigmask(&set);
>   
>       if (rt_restore_ucontext(env, &frame->uc, &rval)) {
>           goto badframe;
> diff --git a/linux-user/signal.c b/linux-user/signal.c
> index 6d5e5b698c..8cb33a351c 100644
> --- a/linux-user/signal.c
> +++ b/linux-user/signal.c
> @@ -258,7 +258,6 @@ int do_sigprocmask(int how, const sigset_t *set, sigset_t *oldset)
>       return 0;
>   }
>   
> -#if !defined(TARGET_NIOS2)
>   /* Just set the guest's signal mask to the specified value; the
>    * caller is assumed to have called block_signals() already.
>    */
> @@ -268,7 +267,6 @@ void set_sigmask(const sigset_t *set)
>   
>       ts->signal_mask = *set;
>   }
> -#endif
>   
>   /* sigaltstack management */
>   


Applied to my linux-user-for-7.0 branch.

Thanks,
Laurent

