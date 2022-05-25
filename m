Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 109D053461E
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 23:56:17 +0200 (CEST)
Received: from localhost ([::1]:36804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntyzH-0002n9-NN
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 17:56:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ntyxV-00026o-49
 for qemu-devel@nongnu.org; Wed, 25 May 2022 17:54:25 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:59053)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ntyxT-00009K-D2
 for qemu-devel@nongnu.org; Wed, 25 May 2022 17:54:24 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1Mnac7-1nSa6K1Gh3-00jdHZ; Wed, 25 May 2022 23:54:21 +0200
Message-ID: <e8cd727c-e95c-f6d7-dd3f-b57796fd5553@vivier.eu>
Date: Wed, 25 May 2022 23:54:20 +0200
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
X-Provags-ID: V03:K1:J0OJtJqRM6IJw470J+7ZMaN6rUmAVDJNyJo0PE06awK4gVa0xU3
 ZBEKPzR4EeDZOM8vJow3BtZpywHgsXcVRvqJ0aPbgJL1qOpEA98q6Qauq5pC5fJ+mYTW9g2
 MFA71mC0pLXjSQpFO2RhR0dE2m4C/c+Q6sdkTtgjdJYGMBEYitx4SvWMmUEdf2c8syZJ0Dk
 O7ohmrjFfMqLgKpe0+k/A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Pvf+IlRjokg=:jXqQ7Dx+1cYFThfTuFKBFu
 skXVdTqtEFL4PHDZp3hZgowg0TvQSM5RObjV4erX9g8cCSdMMB+edHmx+87WBev1tsmx7gPVw
 KpX99IH8RursIMT76HhXr7covNuG8IHtWsnt6IdzfLcrGrLC1MC47hhltEoPL8gW+aMf2EFqT
 r3FyIV8ZWOFhxgGxEtrEzWnlj3uito9KinBGq2r+x62IpWL9arvtGIM4tDJwSWNIP37GZ0nXm
 uj3X5SPwjVQer/BoAMmAn/L04gN46qBTwU51ezPylzM5CVD2m9lwxi93lQAjh47W0HRPYWeeV
 GZ2dcIW6adNwTLLJPy9wHnpPtRsxoliDmQ61hI2wAP/WoyvIc1VGkbz07xfJbdWCOVxkTBMge
 kHDkMFgNZ51gJPg07eiWaKwh7BP89KEVYcB4SFVd4/wfMk4SgIQ1YAHQTguoMfonLoFdY8hB+
 3HG+jArzBCaVBN9lKTOktwWXXTzsuDmDvL0HzlmLRDiW47eZdLsIzS2yAvt5go7aGn3A4rfOP
 JTw8WHLUYZ838xF+d0+g8ncxR5uucGwbNUYB/Ws1N+n+CuLR5hRhNtGV73S80c2tJcHN9oQ0y
 DYQcNjw1OrmPBS1HqZQrzLtU26lYRG4Hhp4kC45iJLqA4F96p69cBF1IedN1ROUkMSDPND4xq
 u90lsq10d23aNYNQcoLFF/FAaUQgoj54d5aXdvFuMtxVixOH5uEy9XgE8sEcqTOE93Ik2g7BD
 bDlIyYXGdj971FN8RcsTLw8PKsE3eGTjA7uGOQ==
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

