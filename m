Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C07CF429DC6
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 08:32:47 +0200 (CEST)
Received: from localhost ([::1]:45330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maBLC-0008SE-Qe
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 02:32:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1maBI5-0006y6-Qo
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 02:29:33 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:38935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1maBHq-0008Vd-Vg
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 02:29:33 -0400
Received: from [192.168.100.1] ([82.142.24.54]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MZCvh-1mDxSV3MoL-00VAEm; Tue, 12 Oct 2021 08:29:14 +0200
Subject: Re: [PATCH 8/9] linux-user/nios2: Use set_sigmask in do_rt_sigreturn
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211001153347.1736014-1-richard.henderson@linaro.org>
 <20211001153347.1736014-11-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <31769b94-f7d8-4cec-ba7f-13cd9d5882ee@vivier.eu>
Date: Tue, 12 Oct 2021 08:29:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20211001153347.1736014-11-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:abPfbtZHsG0gAo3wBtV4+yzNIh6nwTlpCd9OiLlqggft7qHr1qY
 5s365Fnw6TakuulLkOylwiZcnoIRZwkQGD29xjhQJCsUJuGh3eUWf2cvpVh5DpGhyoMWZFW
 yrbU8e2p6KvHIcyjU47MYPXfSsEHq1aGybx3nQtZsVg1uMxkAM+VZZVhwfFbSKKnRZR2DBA
 EUJFsoj+dWkLdIp7Q60Ig==
X-UI-Out-Filterresults: notjunk:1;V03:K0:738k/p3yjnI=:thRFLVQsVJneW1LmFf1vp2
 HC40v97ssGHJMXqgZBbv9pvNC1GbeqyTscbOL4FDbTKMaV6fVgAXSQNedkx/MLfAV1m/KsqgB
 Rrf3N3COIGK2WPBQE8EVcQ8o/gKba4PSHFxpb4jwg1UZCrN5NYmSrPGd40N2cjd/n532w+I3I
 ntWmMjgUKiAbBu5aTGJro6k7PIwMLqPeaWAiAL0EdYOyV69un6dsvjeGea2icbPnplzcK4fJW
 4a8rJGcmOme5wEDAoPBwx1wSzq39qrAIwlKKhLXZA/8az4mB//rTIpVsAKbaEq4ylATL+pRQp
 rVsWfbyURtsPrgGHcZ0UUg7Um7viJx4gKiE8IjaOILElyK5uceNYBoRA71hWJdBZttVNhLxYy
 f0wgyFlCv3tVjodd8gqKgB8Z5sYcb3wGfw8eGhq5ZEN72GlB7pKO/EmQQTADpZm1avnhwFhKD
 8xwIzP8Kl/WnZhi5JPPFFGR5ZRyazyADyrUOaaH3FYp+VocBp1MXF+8Fre4d+C+LZnElNkVp6
 5LrUz2BZbtptUDpaSXKgGkWusRTEZ3UnNashk7jj897j1jLihSeflcpYoXdve+WUrDmL+3qS2
 mGUb7fJcZ/lAWkFbUBUgxKrDhNiVJyP6Q0W+qj8gI4jyC4NVYzrlSksFAkT2+HQdZEpjCxo6Z
 UgS5TlyvuuB75tsPYXv85dzDX4IeM/CrPaSU+udW32VqdNBAAF9s8dbQ0/9Mykm9JgYOhvv4q
 gAkvndB10ty8pobC89zUNGQiN6aRS70zTq7epQ==
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_NONE=0.001, T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: marex@denx.de, crwulff@gmail.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 01/10/2021 à 17:33, Richard Henderson a écrit :
> Using do_sigprocmask directly was incorrect, as it will
> leave the signal blocked by the outer layers of linux-user.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/nios2/signal.c | 2 +-
>  linux-user/signal.c       | 2 --
>  2 files changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/linux-user/nios2/signal.c b/linux-user/nios2/signal.c
> index 80e3d42fc9..517cd39270 100644
> --- a/linux-user/nios2/signal.c
> +++ b/linux-user/nios2/signal.c
> @@ -205,7 +205,7 @@ long do_rt_sigreturn(CPUNios2State *env)
>      }
>  
>      target_to_host_sigset(&set, &frame->uc.tuc_sigmask);
> -    do_sigprocmask(SIG_SETMASK, &set, NULL);
> +    set_sigmask(&set);
>  
>      if (rt_restore_ucontext(env, &frame->uc, &rval)) {
>          goto badframe;
> diff --git a/linux-user/signal.c b/linux-user/signal.c
> index 2038216455..5ec63cd092 100644
> --- a/linux-user/signal.c
> +++ b/linux-user/signal.c
> @@ -252,7 +252,6 @@ int do_sigprocmask(int how, const sigset_t *set, sigset_t *oldset)
>      return 0;
>  }
>  
> -#if !defined(TARGET_NIOS2)
>  /* Just set the guest's signal mask to the specified value; the
>   * caller is assumed to have called block_signals() already.
>   */
> @@ -262,7 +261,6 @@ void set_sigmask(const sigset_t *set)
>  
>      ts->signal_mask = *set;
>  }
> -#endif
>  
>  /* sigaltstack management */
>  
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

