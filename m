Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 963A6534613
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 23:52:56 +0200 (CEST)
Received: from localhost ([::1]:60476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntyw3-0007xx-NU
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 17:52:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ntyuX-000781-4K
 for qemu-devel@nongnu.org; Wed, 25 May 2022 17:51:21 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:32829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ntyuV-0008H8-GW
 for qemu-devel@nongnu.org; Wed, 25 May 2022 17:51:20 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1Mg6i8-1nLDeV11J8-00hcl6; Wed, 25 May 2022 23:51:17 +0200
Message-ID: <2918f84f-37ef-1ce3-71f3-72328150e18b@vivier.eu>
Date: Wed, 25 May 2022 23:51:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v4 13/17] target/m68k: Implement FTRAPcc
Content-Language: fr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220430175342.370628-1-richard.henderson@linaro.org>
 <20220430175342.370628-14-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220430175342.370628-14-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:DN2EnQxgks2ymcfNJE74Jumyl9wjJV+WUA4WZSOadDbP5otOMpO
 jCt4LIwP2dJKZ7FeYfp3D4rwAD7y6BibWc1b3UOQuDnoul0XM7EQ5E6FYSRyMQXZSYbtVYs
 i67dWHlG3iOVZ4iURD1ME0XXdVcSE3JhsuR6rbrB7VxwYjW4SezimmXHmGYWDIIq0h9cbGi
 gzu8dzPl2/vv/m71djgAg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Z/NlVf7XLzM=:dC4rtbOFO7t7y8meFd9Od9
 k/ro5mCKHgQ3aNiE9UmzwFoMBgl66ESanQhM5UZFjvbYD7Kw2mZROMrB6MwElhCwH9FTVpvcP
 monIJgBtQ40UltCGNVVtA9rRV76zLqtFk/DQ4dzf17X8fUKEAnens2RTR4rPBGKw0ScxQ7XbX
 HibcbfZEb/2O9jPJ1iqQJgmSvdkBedj5rPsOounBH6axbYGz/nnabb4aNcJCU0zrU5R3mx8ym
 /nSDkqQNreblZ9plmViR0fd31lIMd4qwLH1l58NzXY+e+a8INHm3qwUJIZ+3jystAI7psThcT
 mJhLg6ybB/2hpHcpZ3BhcxS1dxEbxrH9L0PEODbwh3jBXu9PiwUe0KUEB9IwEX6pwKOzuJPlG
 MqIFdmYSnQaOwBBhcCdnJFWJdqxmxXLk9QncwbZQH6bagQX4CtV8JshtCudCO9YgVjHOFkh4C
 T5E8Hl2fj/3OKXc+ezK3Fz3orr8EhMyy/JUB2xGD1K54tmfBSp8627+jImPoBCxfNc8S+iBja
 1XcU00q3sZhrC8Pe8wfV4c3SeCznMzs1/Vd3NLTk/w7nr8pKFrXrQzI5c4d4U58JSRaDzkwY3
 gArzSHFm+hTe3mXwXocLF8Uj9R/x6UmODH6IkVue18LpnyriBXz8afVcsr+4GgtnBJ7z3L6aR
 e8YccHmvgS0wdDqghxBFr1EIpczobHtuktzvo5Lh+NDqLs0O4zwVrdxJpfdoVhvUKdNg2cxDn
 x3Wjxh248lFL7rgQ0D4cOs7xohZ57p6V6IqhYw==
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/m68k/translate.c | 30 ++++++++++++++++++++++++++++++
>   1 file changed, 30 insertions(+)
> 
> diff --git a/target/m68k/translate.c b/target/m68k/translate.c
> index 0cd7ef89e3..a3141d7f77 100644
> --- a/target/m68k/translate.c
> +++ b/target/m68k/translate.c
> @@ -5567,6 +5567,35 @@ DISAS_INSN(fscc)
>       tcg_temp_free(tmp);
>   }
>   
> +DISAS_INSN(ftrapcc)
> +{
> +    DisasCompare c;
> +    uint16_t ext;
> +    int cond;
> +
> +    ext = read_im16(env, s);
> +    cond = ext & 0x3f;
> +
> +    /* Consume and discard the immediate operand. */
> +    switch (extract32(insn, 0, 3)) {
> +    case 2: /* ftrapcc.w */
> +        (void)read_im16(env, s);
> +        break;
> +    case 3: /* ftrapcc.l */
> +        (void)read_im32(env, s);
> +        break;
> +    case 4: /* ftrapcc (no operand) */
> +        break;
> +    default:
> +        /* Illegal insn */
> +        disas_undef(env, s, insn);
> +        return;
> +    }
> +
> +    gen_fcc_cond(&c, s, cond);
> +    do_trapcc(s, &c);
> +}
> +
>   #if defined(CONFIG_SOFTMMU)
>   DISAS_INSN(frestore)
>   {
> @@ -6190,6 +6219,7 @@ void register_m68k_insns (CPUM68KState *env)
>       INSN(fbcc,      f280, ffc0, CF_FPU);
>       INSN(fpu,       f200, ffc0, FPU);
>       INSN(fscc,      f240, ffc0, FPU);
> +    INSN(ftrapcc,   f278, fff8, FPU);
>       INSN(fbcc,      f280, ff80, FPU);
>   #if defined(CONFIG_SOFTMMU)
>       INSN(frestore,  f340, ffc0, CF_FPU);

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

