Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D3C473769
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 23:24:11 +0100 (CET)
Received: from localhost ([::1]:46866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwtju-0002ha-CN
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 17:24:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mwtib-00020l-GL
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 17:22:49 -0500
Received: from [2a00:1450:4864:20::42d] (port=43784
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mwtiZ-0008DH-Ia
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 17:22:49 -0500
Received: by mail-wr1-x42d.google.com with SMTP id v11so29426862wrw.10
 for <qemu-devel@nongnu.org>; Mon, 13 Dec 2021 14:22:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=Kel31a0O1515zpklGuP3jWbNlztcrlXkrSMhG4YqwqA=;
 b=Scng7jw5RSdOFiYLphOgB8gcwIBqVhAxpKBmW6cbRJ4TP+iv5BMX7r2ZXXNFcozi3D
 Aj8yMlj0/lN2byW2Jv3Txtf83R+Idzzc0ZmblEm5AMq/1EnvNUztjHK1l4/IKRPATuBJ
 At+PrkgSw8DWHPdQmXgTQAahv6BEWqJZodGoFbVEDs/xLi2Q74bc2uEJsReis6CY/z0w
 Tq1bT3wrYxhYp4n28C3T5tsrmA8X0b62qwDCczzf0cx9XmntetkN+noYe3a4QMQFWDxN
 b879uzGn7cesPAhtJXqcVR0zcj1i1caGvcIcKREGZsOC8gpureH8sm+0DHZlnAlRSwK0
 cMDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=Kel31a0O1515zpklGuP3jWbNlztcrlXkrSMhG4YqwqA=;
 b=ZcK2KJ3WZMCwv/Cq0zO4xhvFMgOYzgYl2NL65P/TwIqEjYV1/Rg618f4Cl2anII23K
 /+ClyBv6IW2m1QJljRzIZ+owLqWMSfQ0TMiM0RAhNgIW6M0v8Wbmwfc0c+OTUWW6OmCK
 l366Xh0Q6+HhqdlCwbBgAmR9pGlSVue/k4UZu0eSyReq1eCrLh1iwD0lq8COI1pFCxUJ
 IWlVRib+BfRdLmBmk08ir+YkEvhjwPBU3Y6idvS8oupr7ClBR8DmfvSW44D9gjjK9Fg2
 3/LaC1r0mUVDKbMcXlsnwzdAF+uOWuHlz2GNny8cdIdUasJXX81upP0YkXe1cCDrw2Ns
 FpQA==
X-Gm-Message-State: AOAM5308HWcS4Iqo+lvoT0ynV1DaQC/4TZkAkKeTeDKZxeawyuKGUck2
 kKMApaUycnO2ky5GkPaSZMlRdHzr9aI=
X-Google-Smtp-Source: ABdhPJxb4dLqQoHtRVnGN5AMcCscbSki9H3xdtBeAj3K+ZGNnDovT3NRe47OfH85dpby2lVVdh2Ncw==
X-Received: by 2002:adf:e8c1:: with SMTP id k1mr1363233wrn.257.1639434165767; 
 Mon, 13 Dec 2021 14:22:45 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id l7sm14353318wry.86.2021.12.13.14.22.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Dec 2021 14:22:44 -0800 (PST)
Message-ID: <751608c1-ce25-0876-d9bf-7808852a8d31@amsat.org>
Date: Mon, 13 Dec 2021 23:22:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 2/2] target/hppa: Fix deposit assert from
 trans_shrpw_imm
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
References: <20211213185610.1987974-1-f4bug@amsat.org>
 <20211213185610.1987974-3-f4bug@amsat.org>
In-Reply-To: <20211213185610.1987974-3-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-4.093,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Helge Deller <deller@gmx.de>, Sven Schnelle <svens@stackframe.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/13/21 19:56, Philippe Mathieu-Daudé wrote:
> From: Richard Henderson <richard.henderson@linaro.org>
> 
> Because sa may be 0,
> 
>     tcg_gen_deposit_reg(dest, t0, cpu_gr[a->r1], 32 - sa, sa);
> 
> may attempt a zero-width deposit at bit 32, which will assert
> for TARGET_REGISTER_BITS == 32.
> 
> Use the newer extract2 when possible, which itself includes the
> rotri special case; otherwise mirror the code from trans_shrpw_sar,
> using concat and shri.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/635
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> Message-Id: <20211213174248.29222-1-richard.henderson@linaro.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  target/hppa/translate.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/target/hppa/translate.c b/target/hppa/translate.c
> index 261e4c75c7c..952027a28e1 100644
> --- a/target/hppa/translate.c
> +++ b/target/hppa/translate.c
> @@ -140,6 +140,7 @@
>  #define tcg_gen_deposit_z_reg tcg_gen_deposit_z_i64
>  #define tcg_gen_extract_reg  tcg_gen_extract_i64
>  #define tcg_gen_sextract_reg tcg_gen_sextract_i64
> +#define tcg_gen_extract2_reg tcg_gen_extract2_i64
>  #define tcg_const_reg        tcg_const_i64
>  #define tcg_const_local_reg  tcg_const_local_i64
>  #define tcg_constant_reg     tcg_constant_i64
> @@ -234,6 +235,7 @@
>  #define tcg_gen_deposit_z_reg tcg_gen_deposit_z_i32
>  #define tcg_gen_extract_reg  tcg_gen_extract_i32
>  #define tcg_gen_sextract_reg tcg_gen_sextract_i32
> +#define tcg_gen_extract2_reg tcg_gen_extract2_i32
>  #define tcg_const_reg        tcg_const_i32
>  #define tcg_const_local_reg  tcg_const_local_i32
>  #define tcg_constant_reg     tcg_constant_i32
> @@ -3206,6 +3208,8 @@ static bool trans_shrpw_imm(DisasContext *ctx, arg_shrpw_imm *a)
>      t2 = load_gpr(ctx, a->r2);
>      if (a->r1 == 0) {
>          tcg_gen_extract_reg(dest, t2, sa, 32 - sa);
> +    } else if (TARGET_REGISTER_BITS == 32) {
> +        tcg_gen_extract2_reg(dest, t2, cpu_gr[a->r1], sa);
>      } else if (a->r1 == a->r2) {
>          TCGv_i32 t32 = tcg_temp_new_i32();
>          tcg_gen_trunc_reg_i32(t32, t2);
> @@ -3213,10 +3217,11 @@ static bool trans_shrpw_imm(DisasContext *ctx, arg_shrpw_imm *a)
>          tcg_gen_extu_i32_reg(dest, t32);
>          tcg_temp_free_i32(t32);
>      } else {
> -        TCGv_reg t0 = tcg_temp_new();
> -        tcg_gen_extract_reg(t0, t2, sa, 32 - sa);
> -        tcg_gen_deposit_reg(dest, t0, cpu_gr[a->r1], 32 - sa, sa);
> -        tcg_temp_free(t0);
> +        TCGv_i64 t64 = tcg_temp_new_i64();
> +        tcg_gen_concat_reg_i64(t64, t2, cpu_gr[a->r1]);
> +        tcg_gen_shri_i64(t64, t64, sa);
> +        tcg_gen_trunc_i64_reg(dest, t64);
> +        tcg_temp_free_i64(t64);
>      }
>      save_gpr(ctx, a->t, dest);
>  
> 

