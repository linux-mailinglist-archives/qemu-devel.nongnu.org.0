Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8398702A1E
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 12:12:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyVBc-0005cs-FY; Mon, 15 May 2023 06:12:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pyVBX-0005Zz-QA
 for qemu-devel@nongnu.org; Mon, 15 May 2023 06:12:08 -0400
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pyVBU-0002Mk-RK
 for qemu-devel@nongnu.org; Mon, 15 May 2023 06:12:07 -0400
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-199dd37f0e4so133229fac.2
 for <qemu-devel@nongnu.org>; Mon, 15 May 2023 03:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684145523; x=1686737523;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0VfEJ6pI+6PrqnqP/ccuGIBwmwzivMwkJ9Sm9N5Q3wc=;
 b=GeGw5mHucUlYAykgLwcunMtylL1v1V0q0q53nzlSVZFy/otfvxYMi6cmRU02tFdiyf
 g486bzgkRhwzj6dPZNA6ix170Kj15qHxZBGp3w9q5l+JPOOsUVzZr0Gk0UgFUXRpRF3T
 ae1QXcEiS2YKrKqbULxqTdl3f0bWppuL+qC8mHhX4k+b/ltmdmBl6iOdRbCnl9XcLIZj
 GeVijnVhFFwGmAuPxUqKw2pQN+eAzFO+ilzIzLtodPwD98wqnDJ/oOaMcgTHzsIVgq1N
 VRYLoROof2XqwPKFeAyKNg+jgstNiSufdL5ay63CBzQLZFF/29Jq8sSVQ6HLlwNthkXq
 PKhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684145523; x=1686737523;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0VfEJ6pI+6PrqnqP/ccuGIBwmwzivMwkJ9Sm9N5Q3wc=;
 b=hnjj0coGe6mYy8O9cDQ2tjYa6Ta8SJjDjH//d0XnpytAV5tfwz1np4l7uk2sPkTq7T
 ae8jeJNGoalciBGziAZ/7ki/FcypXWF/hmHQRUW1ztQykEAe+Rt4xrrGEL9LcseKvFbw
 hgUIcLbsiCAPkUTSo6oeBWB4v/YCTXa1NTW5fky2GuGjHTQWATUYW65s8tVogQn7W/t6
 8Je4bUKo3QOvuazYEJJp3pM9hfg438H1cTszU5uqdytJWt9M7YEDrFLXrPC9S30Cv1TL
 fn6zICBexKfhk11OxSo5WF/paVLRaLTFVZUojAAjAzwbvcq6Xk6so/1+mNSKp1cRanHN
 9W+g==
X-Gm-Message-State: AC+VfDyqXxTlU+VKnmrtwP1FA2CQ04hL3GwU4zFvsQsWWNdXW38fER/z
 h4Hc3t+mM+pBBaa6r8A4gymdEkWj5OQ=
X-Google-Smtp-Source: ACHHUZ4/YYip4thnReL3R6BkC2wwswWu+kRvtDQC92tCdhEOXIBbAH4ai78nHFuwMrNhIusI7zd6nw==
X-Received: by 2002:a05:6808:a0c:b0:38b:5349:e112 with SMTP id
 n12-20020a0568080a0c00b0038b5349e112mr10810375oij.46.1684145522686; 
 Mon, 15 May 2023 03:12:02 -0700 (PDT)
Received: from [192.168.68.107] (189-46-207-53.dsl.telesp.net.br.
 [189.46.207.53]) by smtp.gmail.com with ESMTPSA id
 az14-20020a056808164e00b003946655b791sm1461063oib.34.2023.05.15.03.12.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 May 2023 03:12:02 -0700 (PDT)
Message-ID: <b223d2a5-7d4c-0ec3-2a85-62962ed1e81b@gmail.com>
Date: Mon, 15 May 2023 07:11:59 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3] target/ppc: Fix fallback to MFSS for MFFS*
 instructions on pre 3.0 ISAs
To: Richard Purdie <richard.purdie@linuxfoundation.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>,
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
References: <20230510111913.1718734-1-richard.purdie@linuxfoundation.org>
Content-Language: en-US
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20230510111913.1718734-1-richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::35;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x35.google.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.93,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Queued in gitlab.com/danielhb/qemu/tree/ppc-next. Thanks,


Daniel

On 5/10/23 08:19, Richard Purdie wrote:
> The following commits changed the code such that the fallback to MFSS for MFFSCRN,
> MFFSCRNI, MFFSCE and MFFSL on pre 3.0 ISAs was removed and became an illegal instruction:
> 
>    bf8adfd88b547680aa857c46098f3a1e94373160 - target/ppc: Move mffscrn[i] to decodetree
>    394c2e2fda70da722f20fb60412d6c0ca4bfaa03 - target/ppc: Move mffsce to decodetree
>    3e5bce70efe6bd1f684efbb21fd2a316cbf0657e - target/ppc: Move mffsl to decodetree
> 
> The hardware will handle them as a MFFS instruction as the code did previously.
> This means applications that were segfaulting under qemu when encountering these
> instructions which is used in glibc libm functions for example.
> 
> The fallback for MFFSCDRN and MFFSCDRNI added in a later patch was also missing.
> 
> This patch restores the fallback to MFSS for these instructions on pre 3.0s ISAs
> as the hardware decoder would, fixing the segfaulting libm code. It doesn't have
> the fallback for 3.0 onwards to match hardware behaviour.
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>   target/ppc/insn32.decode           | 20 +++++++++++++-------
>   target/ppc/translate/fp-impl.c.inc | 22 ++++++++++++++++------
>   2 files changed, 29 insertions(+), 13 deletions(-)
> 
> v3 - drop fallback to MFFS for 3.0 ISA to match hardware
> v2 - switch to use decodetree pattern groups per feedback
> 
> diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
> index f8f589e9fd..4fcf3af8d0 100644
> --- a/target/ppc/insn32.decode
> +++ b/target/ppc/insn32.decode
> @@ -390,13 +390,19 @@ SETNBCR         011111 ..... ..... ----- 0111100000 -   @X_bi
>   
>   ### Move To/From FPSCR
>   
> -MFFS            111111 ..... 00000 ----- 1001000111 .   @X_t_rc
> -MFFSCE          111111 ..... 00001 ----- 1001000111 -   @X_t
> -MFFSCRN         111111 ..... 10110 ..... 1001000111 -   @X_tb
> -MFFSCDRN        111111 ..... 10100 ..... 1001000111 -   @X_tb
> -MFFSCRNI        111111 ..... 10111 ---.. 1001000111 -   @X_imm2
> -MFFSCDRNI       111111 ..... 10101 --... 1001000111 -   @X_imm3
> -MFFSL           111111 ..... 11000 ----- 1001000111 -   @X_t
> +{
> +  # Before Power ISA v3.0, MFFS bits 11~15 were reserved and should be ignored
> +  MFFS_ISA207     111111 ..... ----- ----- 1001000111 .   @X_t_rc
> +  [
> +    MFFS            111111 ..... 00000 ----- 1001000111 .   @X_t_rc
> +    MFFSCE          111111 ..... 00001 ----- 1001000111 -   @X_t
> +    MFFSCRN         111111 ..... 10110 ..... 1001000111 -   @X_tb
> +    MFFSCDRN        111111 ..... 10100 ..... 1001000111 -   @X_tb
> +    MFFSCRNI        111111 ..... 10111 ---.. 1001000111 -   @X_imm2
> +    MFFSCDRNI       111111 ..... 10101 --... 1001000111 -   @X_imm3
> +    MFFSL           111111 ..... 11000 ----- 1001000111 -   @X_t
> +  ]
> +}
>   
>   ### Decimal Floating-Point Arithmetic Instructions
>   
> diff --git a/target/ppc/translate/fp-impl.c.inc b/target/ppc/translate/fp-impl.c.inc
> index 57d8437851..874774eade 100644
> --- a/target/ppc/translate/fp-impl.c.inc
> +++ b/target/ppc/translate/fp-impl.c.inc
> @@ -568,6 +568,22 @@ static void store_fpscr_masked(TCGv_i64 fpscr, uint64_t clear_mask,
>       gen_helper_store_fpscr(cpu_env, fpscr_masked, st_mask);
>   }
>   
> +static bool trans_MFFS_ISA207(DisasContext *ctx, arg_X_t_rc *a)
> +{
> +    if (!(ctx->insns_flags2 & PPC2_ISA300)) {
> +        /*
> +         * Before Power ISA v3.0, MFFS bits 11~15 were reserved, any instruction
> +         * with OPCD=63 and XO=583 should be decoded as MFFS.
> +         */
> +        return trans_MFFS(ctx, a);
> +    }
> +    /*
> +     * For Power ISA v3.0+, return false and let the pattern group
> +     * select the correct instruction.
> +     */
> +    return false;
> +}
> +
>   static bool trans_MFFS(DisasContext *ctx, arg_X_t_rc *a)
>   {
>       REQUIRE_FPU(ctx);
> @@ -584,7 +600,6 @@ static bool trans_MFFSCE(DisasContext *ctx, arg_X_t *a)
>   {
>       TCGv_i64 fpscr;
>   
> -    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
>       REQUIRE_FPU(ctx);
>   
>       gen_reset_fpstatus();
> @@ -597,7 +612,6 @@ static bool trans_MFFSCRN(DisasContext *ctx, arg_X_tb *a)
>   {
>       TCGv_i64 t1, fpscr;
>   
> -    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
>       REQUIRE_FPU(ctx);
>   
>       t1 = tcg_temp_new_i64();
> @@ -614,7 +628,6 @@ static bool trans_MFFSCDRN(DisasContext *ctx, arg_X_tb *a)
>   {
>       TCGv_i64 t1, fpscr;
>   
> -    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
>       REQUIRE_FPU(ctx);
>   
>       t1 = tcg_temp_new_i64();
> @@ -631,7 +644,6 @@ static bool trans_MFFSCRNI(DisasContext *ctx, arg_X_imm2 *a)
>   {
>       TCGv_i64 t1, fpscr;
>   
> -    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
>       REQUIRE_FPU(ctx);
>   
>       t1 = tcg_temp_new_i64();
> @@ -647,7 +659,6 @@ static bool trans_MFFSCDRNI(DisasContext *ctx, arg_X_imm3 *a)
>   {
>       TCGv_i64 t1, fpscr;
>   
> -    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
>       REQUIRE_FPU(ctx);
>   
>       t1 = tcg_temp_new_i64();
> @@ -661,7 +672,6 @@ static bool trans_MFFSCDRNI(DisasContext *ctx, arg_X_imm3 *a)
>   
>   static bool trans_MFFSL(DisasContext *ctx, arg_X_t *a)
>   {
> -    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
>       REQUIRE_FPU(ctx);
>   
>       gen_reset_fpstatus();

