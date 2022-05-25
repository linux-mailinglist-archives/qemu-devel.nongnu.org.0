Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D5A534485
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 21:49:15 +0200 (CEST)
Received: from localhost ([::1]:48672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntx0M-0005wG-WB
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 15:49:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ntwwT-0001yV-BX
 for qemu-devel@nongnu.org; Wed, 25 May 2022 15:45:22 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:52467)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ntwwP-0006lz-SF
 for qemu-devel@nongnu.org; Wed, 25 May 2022 15:45:12 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MowSu-1nU1CJ0uac-00qUkX; Wed, 25 May 2022 21:45:05 +0200
Message-ID: <a6593cbe-b1ba-5836-ad90-7fe147f64f85@vivier.eu>
Date: Wed, 25 May 2022 21:45:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v4 17/17] target/m68k: Mark helper_raise_exception as
 noreturn
Content-Language: fr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220430175342.370628-1-richard.henderson@linaro.org>
 <20220430175342.370628-18-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220430175342.370628-18-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:eSU20yfawAvm28SL+RpdDJhQqJh0IInkIUBtkuOB0Qa3zh+ZQIj
 pr8Ae2fPch0SRmiz6y2vTH8zU/lOPgTfNIQvd36NLN3aisblJNlwN+MfAg51uIDfm5zJ3py
 yaW7yXa9TUSFOzLApFdoX/d8d5OMhMV6WNuCZJH2qC0i0Yd9QuuYdfFjxdg7qFelUXVk6rq
 1zsn+98Z+B0MLkL2ERLSg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:kTpSU7s0AQU=:ZypnX6jNtMwd9BvVyQGtB9
 YFeGWQnjcKY8oF4DuxLzhRDTofJPIKbtTRLh6fGdnHFfiLurb7+eFguprnUiiYiZ8Bw070jo1
 pkdMqJQAxLkBPGwjbrUcO0BUqNFhspuaNYKiZ12wyKy6RQEpX1ycpAvfgMHPejdc1hmJ3zs5b
 DU7xloXuZcqdik6/OMQgv7auc99ho7KoOKpeq43+Y3KMx8PjUqgu3uGM454d5Rc204+XEml1a
 V0oblHjgJJenpoeJbcuA/TuLoNWGBcYhuduYygMJG3l/IBAtYOcoBToXyRiHdrCeHsjSqz9mP
 CVG3Cx1ZzkYSjssZWQUwfJv7OKvHKu4HxMtW7TD5g5RHPw7JnzF+EUABHOZNhUNGxu79SWo/n
 rz0ApKnqKkdkWFtCowWbyJTfDfUwknnGwpQrfTsPcfqvz9fl3Vi0rTgdBoVMPerXVcNipEDUV
 U7IZ37QUPg4qU20fsbYHNqT8972ox2qjygvbR/5+SGH28/9LYx+m9J32aLlEa1ig6+x8ozS7R
 FTKX4+GT3yS1GXqRFq1uEnQJDWtaJqlBMDSeeXwDBfv+fwlv4fX4nNkAPlX5oVC5lMe0GEXJL
 Uyu3mSTa9QYl8xwVIBkcwixEu4QOB76mjv+h8qAd3OxxIorFEIYpg64/7tHJMpJofs3of46c0
 1olxm+auq+pjvcXMILdY02TZaCvs4y4MBhW6sQySdhSmVpCb5Jqmk9baZ5P8vOoFKHY3FiFQV
 Bev+3N4QhzFvHqedDvca9CNt8GaSNZgBKP0RKA==
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 30/04/2022 à 19:53, Richard Henderson a écrit :
> Also mark raise_exception_ra and raise_exception, lest we
> generate a warning about helper_raise_exception returning.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/m68k/helper.h    | 2 +-
>   target/m68k/op_helper.c | 5 +++--
>   2 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/target/m68k/helper.h b/target/m68k/helper.h
> index f016c4c1c2..c9bed2b884 100644
> --- a/target/m68k/helper.h
> +++ b/target/m68k/helper.h
> @@ -109,7 +109,7 @@ DEF_HELPER_3(set_mac_extu, void, env, i32, i32)
>   DEF_HELPER_2(flush_flags, void, env, i32)
>   DEF_HELPER_2(set_ccr, void, env, i32)
>   DEF_HELPER_FLAGS_1(get_ccr, TCG_CALL_NO_WG_SE, i32, env)
> -DEF_HELPER_2(raise_exception, void, env, i32)
> +DEF_HELPER_2(raise_exception, noreturn, env, i32)
>   
>   DEF_HELPER_FLAGS_3(bfffo_reg, TCG_CALL_NO_RWG_SE, i32, i32, i32, i32)
>   
> diff --git a/target/m68k/op_helper.c b/target/m68k/op_helper.c
> index 61948d92bb..d9937ca8dc 100644
> --- a/target/m68k/op_helper.c
> +++ b/target/m68k/op_helper.c
> @@ -532,7 +532,8 @@ bool m68k_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
>   
>   #endif /* !CONFIG_USER_ONLY */
>   
> -static void raise_exception_ra(CPUM68KState *env, int tt, uintptr_t raddr)
> +G_NORETURN static void
> +raise_exception_ra(CPUM68KState *env, int tt, uintptr_t raddr)
>   {
>       CPUState *cs = env_cpu(env);
>   
> @@ -540,7 +541,7 @@ static void raise_exception_ra(CPUM68KState *env, int tt, uintptr_t raddr)
>       cpu_loop_exit_restore(cs, raddr);
>   }
>   
> -static void raise_exception(CPUM68KState *env, int tt)
> +G_NORETURN static void raise_exception(CPUM68KState *env, int tt)
>   {
>       raise_exception_ra(env, tt, 0);
>   }

And why not

   G_NORETURN void HELPER(raise_exception)(CPUM68KState *env, uint32_t tt)

?

Thanks,
Laurent

