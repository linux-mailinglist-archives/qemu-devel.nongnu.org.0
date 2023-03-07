Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E826AF7E5
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 22:45:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZf7E-0001dq-U2; Tue, 07 Mar 2023 16:45:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pZf7A-0001bn-SH; Tue, 07 Mar 2023 16:44:56 -0500
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pZf79-0003yv-9G; Tue, 07 Mar 2023 16:44:56 -0500
Received: by mail-ot1-x333.google.com with SMTP id
 l16-20020a9d4c10000000b006944b17058cso7755720otf.2; 
 Tue, 07 Mar 2023 13:44:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678225494;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=l1d62UhTSjiyRiotDAiTXPYoPjTGbK9w85BDpdkATwo=;
 b=PhEaQkYUjEV/suVId7d+CK4rQfk6QXgVyx6bjgl/WX19d/lpwBNvIixqxJaPMzOq3V
 5+0r2RekjCY3semtS0jW2/+TxNsMd/gjGiQl1IzkQa5SAbLRTHm677CBsBPSB5JR7kGM
 bVYNvIA2WbuNst33rOC/tWBPdyelRfq3HBFfSdh0STCuQivgaRgmYKU3nsxc5TQCYR3u
 tJK7fniz7d00I2dAWkvET5LgNprlMlNA6uOkByKoVJc3rFDzJRH+rbfheJpcU05w+HfB
 9z59kZ/8bc+ypBs1xlt3ta6HO5B/T31gCXkop8bDw7PR2GoEW3urYM90PLSohr6WBRsB
 v2eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678225494;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=l1d62UhTSjiyRiotDAiTXPYoPjTGbK9w85BDpdkATwo=;
 b=U7GM1uXL5Bppfc28CfLq4EmFFjoE5FRf+oDeAxZY0q3BolplyOGr5Lg7+xqwkTwQKZ
 Ide7rWMiUBwy3mIiSWUjHMj6wXI+bL6LhOtVb0OscJHQY39ezLXP4AFHn5SGN6hiFk3Q
 IiAKJgiPnQYssxEPxvd1DSOQukUTB/hu1llYjd6qmjy4gt96YqBxpO5fW4Cpct7hP7dL
 Pb6fAhbI1/wPwYaYNHk9Y3FI7LQig8mYHW39YCPO1518bc1H3AWwQ+O9vQQG/3iJc31O
 PV46nzlf0OqwF5AWaaoqNwwbfGBLL/voQ3txHT64rMtf/ydFPKdOKskYmPpoTrOsLt+a
 InfA==
X-Gm-Message-State: AO0yUKXUWNPdjyJPiyfTEvgT1nS5jJs0zUa6N4m1/xQ76xakxOZB6OwI
 iNFBQoyNQxok3j2oluVHFLyz9Z4P0zY=
X-Google-Smtp-Source: AK7set+1n2lNFa6NKdivofbTs/a+TWDghx9lGtrNmI6qGDpePeixnV9sDVK6A3OVM2olxogiOnfUKg==
X-Received: by 2002:a9d:71db:0:b0:694:229b:a421 with SMTP id
 z27-20020a9d71db000000b00694229ba421mr6891283otj.32.1678225493940; 
 Tue, 07 Mar 2023 13:44:53 -0800 (PST)
Received: from [192.168.68.107] ([177.189.53.31])
 by smtp.gmail.com with ESMTPSA id
 h27-20020a056830035b00b0069488fab83dsm856000ote.42.2023.03.07.13.44.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 13:44:53 -0800 (PST)
Message-ID: <a117ec6d-0a64-f3de-ebc2-bf31fe3d7466@gmail.com>
Date: Tue, 7 Mar 2023 18:44:50 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 21/25] target/ppc: Fix gen_tlbsx_booke206
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 qemu-ppc@nongnu.org
References: <20230307183503.2512684-1-richard.henderson@linaro.org>
 <20230307183503.2512684-22-richard.henderson@linaro.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20230307183503.2512684-22-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::333;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x333.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



On 3/7/23 15:34, Richard Henderson wrote:
> Fix incorrect read from rD.
> Avoid adding 0 when rA == 0.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

> Cc: Daniel Henrique Barboza <danielhb413@gmail.com>
> Cc: Cédric Le Goater <clg@kaod.org>
> Cc: David Gibson <david@gibson.dropbear.id.au>
> Cc: Greg Kurz <groug@kaod.org>
> Cc: qemu-ppc@nongnu.org
> ---
>   target/ppc/translate.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index df324fc7ff..7ec940b7d8 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -5875,12 +5875,10 @@ static void gen_tlbsx_booke206(DisasContext *ctx)
>       CHK_SV(ctx);
>       if (rA(ctx->opcode)) {
>           t0 = tcg_temp_new();
> -        tcg_gen_mov_tl(t0, cpu_gpr[rD(ctx->opcode)]);
> +        tcg_gen_add_tl(t0, cpu_gpr[rA(ctx->opcode)], cpu_gpr[rB(ctx->opcode)]);
>       } else {
> -        t0 = tcg_const_tl(0);
> +        t0 = cpu_gpr[rB(ctx->opcode)];
>       }
> -
> -    tcg_gen_add_tl(t0, t0, cpu_gpr[rB(ctx->opcode)]);
>       gen_helper_booke206_tlbsx(cpu_env, t0);
>   #endif /* defined(CONFIG_USER_ONLY) */
>   }

