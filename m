Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D3526AF7D9
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 22:43:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZf5V-0005vS-QM; Tue, 07 Mar 2023 16:43:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pZf57-0005p7-GY; Tue, 07 Mar 2023 16:42:49 -0500
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pZf55-0003lr-PI; Tue, 07 Mar 2023 16:42:49 -0500
Received: by mail-ot1-x32f.google.com with SMTP id
 32-20020a9d0323000000b0069426a71d79so7947678otv.10; 
 Tue, 07 Mar 2023 13:42:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678225366;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=P/98U8EbTBh65/hRTROrbuV7XWSS1aaK1fReuvm2LKI=;
 b=BjYypCcJCZz9xgoDmOHtTge6vQjMSum0T8+oCiiAndpRxW5qzvtXMGcPizpuzu0h/C
 hfx6e78SKmGBIaRWJNOAx3xqJfeub9e3nL45id0uGwFS5EzXKg4klWqLNktgysNe335K
 KuCTVdjRcZxVgqV7FIn9xh+NrD0E+kdOuI+qAvA7c9c/rUS53qHEkUxELRst0lSP5DLr
 oPEWYV8LZwmc4iOfUNiJtKEZZWYz1naO5IjKYEeFu4rGVNDJBE+gMFn1jHD5b6M57wd7
 QF4Wh2nhZWlOfVhPg7DykWuA0JRRWgoLGHqVR9t8TPdayj2ZAdJEFZbDfJ/mRtSxG2RB
 3RnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678225366;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=P/98U8EbTBh65/hRTROrbuV7XWSS1aaK1fReuvm2LKI=;
 b=5FXL8djyuqUwtD5LRMXDnu+1z+z+PdfLJX38eYBlbRyr6vSqB7oPDVUlMBqJDdc94s
 oVsp6zMJex96JVKQGw9w3IqC2GsWIZ4DmaUARriip3J7qtnPx3oBHbSx+wzwqO+2i73J
 AdAOI0M+VSrtWpEUWVEnhK5ync5bx+a/5tJLZYeLGv+zlApEbBomunJ6n6/YWFsLJYpD
 PoKcJghdLPdtdjfCib/aid+QRH9e+j4Y+57Ja+0R9vPsO0U35qxlVQOIHzUAa4Ej0eLc
 K9BIWTqsrGS9wH3WhQtmVnpMd9CtritnQobRzCrJzBzi23bCc0a6Po+TSInTRGDpeNP+
 4XAg==
X-Gm-Message-State: AO0yUKUEEQ7zwM52sat1yRvQ13hYmBVUmTaZXaipXeaE7aH36qNzaMj/
 oPIJiyY8RghSQPxTPT6lnwA=
X-Google-Smtp-Source: AK7set8vOzAT+baByFF4pOTobObsCUpZnhFRxuzymmXy1f1Y4hl6dcXrj0HABTdEpoBP/iTq2vs5nw==
X-Received: by 2002:a9d:12cd:0:b0:68b:d890:1e03 with SMTP id
 g71-20020a9d12cd000000b0068bd8901e03mr7675216otg.21.1678225366339; 
 Tue, 07 Mar 2023 13:42:46 -0800 (PST)
Received: from [192.168.68.107] ([177.189.53.31])
 by smtp.gmail.com with ESMTPSA id
 f15-20020a056830204f00b00690e7b0f9e3sm3053139otp.34.2023.03.07.13.42.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 13:42:45 -0800 (PST)
Message-ID: <7f14be41-2ff3-f6b7-ee7b-336f0dfc1362@gmail.com>
Date: Tue, 7 Mar 2023 18:42:43 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 16/25] target/ppc: Avoid tcg_const_* in xxeval
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 qemu-ppc@nongnu.org
References: <20230307183503.2512684-1-richard.henderson@linaro.org>
 <20230307183503.2512684-17-richard.henderson@linaro.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20230307183503.2512684-17-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32f;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x32f.google.com
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
> Initialize a new temp instead of tcg_const_*.
> Fix a pasto in a comment.
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
>   target/ppc/translate/vsx-impl.c.inc | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/vsx-impl.c.inc
> index 6e63403727..9916784e64 100644
> --- a/target/ppc/translate/vsx-impl.c.inc
> +++ b/target/ppc/translate/vsx-impl.c.inc
> @@ -2449,7 +2449,8 @@ static void gen_xxeval_i64(TCGv_i64 t, TCGv_i64 a, TCGv_i64 b, TCGv_i64 c,
>       TCGv_i64 conj, disj;
>   
>       conj = tcg_temp_new_i64();
> -    disj = tcg_const_i64(0);
> +    disj = tcg_temp_new_i64();
> +    tcg_gen_movi_i64(disj, 0);
>   
>       /* Iterate over set bits from the least to the most significant bit */
>       while (imm) {
> @@ -2492,8 +2493,9 @@ static void gen_xxeval_vec(unsigned vece, TCGv_vec t, TCGv_vec a, TCGv_vec b,
>       int bit;
>       TCGv_vec disj, conj;
>   
> -    disj = tcg_const_zeros_vec_matching(t);
>       conj = tcg_temp_new_vec_matching(t);
> +    disj = tcg_temp_new_vec_matching(t);
> +    tcg_gen_dupi_vec(vece, disj, 0);
>   
>       /* Iterate over set bits from the least to the most significant bit */
>       while (imm) {
> @@ -2546,7 +2548,7 @@ static bool trans_XXEVAL(DisasContext *ctx, arg_8RR_XX4_imm *a)
>   
>       /* Equivalent functions that can be implemented with a single gen_gvec */
>       switch (a->imm) {
> -    case 0b00000000: /* true */
> +    case 0b00000000: /* false */
>           set_cpu_vsr(a->xt, tcg_constant_i64(0), true);
>           set_cpu_vsr(a->xt, tcg_constant_i64(0), false);
>           break;

