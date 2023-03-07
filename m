Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85AAF6AF7D8
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 22:43:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZf4Y-0005DA-VF; Tue, 07 Mar 2023 16:42:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pZf4W-0005Cd-Ia; Tue, 07 Mar 2023 16:42:12 -0500
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pZf4U-0003hS-S8; Tue, 07 Mar 2023 16:42:12 -0500
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-176e43eb199so6532143fac.7; 
 Tue, 07 Mar 2023 13:42:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678225329;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZMWgfCDmNrjAXYYNbvMTMKERK5nGsGQnMErimFbo4u8=;
 b=kwosox5CwTZqYpf0h564/FAvRTNtbvcbOhYboPFUrynSeg9AgTZmWqJvCWOJ0lwqoy
 M5IE6VU7tktICKfacpmNZuVju3XRP0GkSrgXtai2xznBw2qENMZoxP1ex2KjGRAH5qfL
 lQTUopu0UPMm8MzC2wu8XQ3uVg6zd7wFUcqkK6jXCFdNyPH0lLDoU/n0C5ayHRFAwRlc
 oICwLLhilGyrCxUCsE5dcQmhDn97oPs4t3Lj+yDSs+Gwsy3KCeDv/WjA305uPWgONp8q
 kh6dUax8PdvvU4qu2IWXkvXCkvrOAg0AleDXcENMM7Ucx3sBgR0N7VzYnOYs28TMVEOz
 1kmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678225329;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZMWgfCDmNrjAXYYNbvMTMKERK5nGsGQnMErimFbo4u8=;
 b=D7OAuyLDFEL+Lh7epQA+IrOL6XTNP3d6Nb5W8b1sblfSX6Kchbq3JMAb/lV73fDlII
 QEGaDtcRaHXCNvrb2LvBV0DhNifyrHD6coKXIXlWXoZW2VXQzJjv2DU3eMqTE54CshNM
 BuJoiaeiUQ3X1Lxnhjo8LLFqCpMoLcgKr7hDt22jiZxV1128xp07DYbLCNpaCFDOku2V
 NVMKKFxyBft/jgwtUv/Rgmvx5/EtVlQjrisKgvgIfmij9QBwWAjTbc7zulu0Mj1H8Hu6
 hHcV8ufwNegjco93JPXNp/BzE5nuGpH/gYt16DRC2k0tHD1rwSHL3RqhInpDWOzQthuc
 cdaw==
X-Gm-Message-State: AO0yUKUXr+dO1MkPLECIPr9OyVTvIw5024S+RqIFL15eUGH/1T/7FBmW
 7h6kM9h7Y+HXUovJKDy/Lo0=
X-Google-Smtp-Source: AK7set+3wqfRKE2LybRyJ79lAa23StwhRXs54VrZBIlNPZrejE6sxVqwhUwF8rJ4Z7WKX6P9jgC8vA==
X-Received: by 2002:a05:6871:72b:b0:16e:19e6:b68c with SMTP id
 f43-20020a056871072b00b0016e19e6b68cmr11160389oap.21.1678225329276; 
 Tue, 07 Mar 2023 13:42:09 -0800 (PST)
Received: from [192.168.68.107] ([177.189.53.31])
 by smtp.gmail.com with ESMTPSA id
 v22-20020a4ac916000000b0052532296449sm5529107ooq.20.2023.03.07.13.42.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 13:42:09 -0800 (PST)
Message-ID: <6462322f-3706-48c7-e2d2-5f85b707fe93@gmail.com>
Date: Tue, 7 Mar 2023 18:42:05 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 14/25] target/ppc: Avoid tcg_const_i64 in do_vcntmb
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 qemu-ppc@nongnu.org
References: <20230307183503.2512684-1-richard.henderson@linaro.org>
 <20230307183503.2512684-15-richard.henderson@linaro.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20230307183503.2512684-15-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2a;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2a.google.com
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
> Compute both partial results separately and accumulate
> at the end, instead of accumulating in the middle.
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
>   target/ppc/translate/vmx-impl.c.inc | 21 +++++++++++----------
>   1 file changed, 11 insertions(+), 10 deletions(-)
> 
> diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
> index 7af6d7217d..ca27c11d87 100644
> --- a/target/ppc/translate/vmx-impl.c.inc
> +++ b/target/ppc/translate/vmx-impl.c.inc
> @@ -2236,24 +2236,25 @@ static bool trans_MTVSRBMI(DisasContext *ctx, arg_DX_b *a)
>   
>   static bool do_vcntmb(DisasContext *ctx, arg_VX_mp *a, int vece)
>   {
> -    TCGv_i64 rt, vrb, mask;
> -    rt = tcg_const_i64(0);
> -    vrb = tcg_temp_new_i64();
> +    TCGv_i64 r[2], mask;
> +
> +    r[0] = tcg_temp_new_i64();
> +    r[1] = tcg_temp_new_i64();
>       mask = tcg_constant_i64(dup_const(vece, 1ULL << ((8 << vece) - 1)));
>   
>       for (int i = 0; i < 2; i++) {
> -        get_avr64(vrb, a->vrb, i);
> +        get_avr64(r[i], a->vrb, i);
>           if (a->mp) {
> -            tcg_gen_and_i64(vrb, mask, vrb);
> +            tcg_gen_and_i64(r[i], mask, r[i]);
>           } else {
> -            tcg_gen_andc_i64(vrb, mask, vrb);
> +            tcg_gen_andc_i64(r[i], mask, r[i]);
>           }
> -        tcg_gen_ctpop_i64(vrb, vrb);
> -        tcg_gen_add_i64(rt, rt, vrb);
> +        tcg_gen_ctpop_i64(r[i], r[i]);
>       }
>   
> -    tcg_gen_shli_i64(rt, rt, TARGET_LONG_BITS - 8 + vece);
> -    tcg_gen_trunc_i64_tl(cpu_gpr[a->rt], rt);
> +    tcg_gen_add_i64(r[0], r[0], r[1]);
> +    tcg_gen_shli_i64(r[0], r[0], TARGET_LONG_BITS - 8 + vece);
> +    tcg_gen_trunc_i64_tl(cpu_gpr[a->rt], r[0]);
>       return true;
>   }
>   

