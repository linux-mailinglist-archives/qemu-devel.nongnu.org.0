Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1848D6DC642
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Apr 2023 13:32:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1plpjx-0003Wf-UP; Mon, 10 Apr 2023 07:31:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1plpjr-0003Sr-IR; Mon, 10 Apr 2023 07:31:11 -0400
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1plpjl-0004SG-Ho; Mon, 10 Apr 2023 07:31:09 -0400
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-1842f69fe1fso5438879fac.11; 
 Mon, 10 Apr 2023 04:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1681126260; x=1683718260;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=deRmxQ/PVbeSiFGNR3WEciGTfQCi0INy+xE6YyN8RAg=;
 b=VJXchUukmvTdsHaLLC10ZkJtw/cOIj/pREfWy6YaUpVGEt26MqKb+CSxRj7UZZkigL
 eAB8iVB6X/ElTHBekWl2Uss8ixpmzF2sutdA8luCjEYXz5QQBEDf9TlR+7pxyZlhz340
 1aFVgrgo73B2PlJIo6l0oyu9wTANlBPDvpfZ8qqTUt+21rCxHhuFxVLv6HfRkt86mYSP
 WPfQohOJslbjQ6mJ7UcWYXtL3eB3YHoDXk9fm02Lo7ij8hu9TPftaO/4AEYvEr26n16U
 8Ry2BbYbbRnFu1prKU08VZfKMXD8eywc0EZa0nxcVxlgDgMM5fnNi6nVjOBeOO2CIqpJ
 xEOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681126260; x=1683718260;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=deRmxQ/PVbeSiFGNR3WEciGTfQCi0INy+xE6YyN8RAg=;
 b=pcuw8o9/VF72RUhGJz10NIRI4eQhoZLAyX4Bjy8yoI3FmZ4oiFbuFjp/f/5DZZIrN3
 kq9uLnFPJSleHcSiXhkUDwL7GavW8RWiUbRySDaXr31fqFUeU5RR5v4cSHdgcDU4Ierl
 XHgTev2Hmoe0uNBV++qSl923pqgUgxbd7HehG3BN1NxGuoXkpKJG/4Q4riok+EK31yMj
 3nY9oET0X8QY2DYeNiIhfvUltxrfQn0OcEJQjupfk9FpeGah5cIdf9CBhKGje1glZRru
 ml0GlFONpxosyeQk74ocf9GuePAknGiaQQ6cedphvF0HsGsOgq+yajFAWNURsYow1p/f
 x+8w==
X-Gm-Message-State: AAQBX9cR5pUsd4Yl6pR+RQOw6zjCMyzncLEDsHLaRLgUx/Pofb+7FN7D
 SNrc8OWz00T3u3MGM1wEADE=
X-Google-Smtp-Source: AKy350YeMVCnjm5NKpYKtjNrOKsB5j9cYfe7L/VrgK7BI65zaS5xzygT1rvhUYmIYDooQOVX/g2sjA==
X-Received: by 2002:a05:6870:f217:b0:180:13a4:425e with SMTP id
 t23-20020a056870f21700b0018013a4425emr5278288oao.30.1681126259863; 
 Mon, 10 Apr 2023 04:30:59 -0700 (PDT)
Received: from [192.168.68.107] ([191.255.108.232])
 by smtp.gmail.com with ESMTPSA id
 f17-20020a4a8911000000b005255e556399sm4448416ooi.43.2023.04.10.04.30.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Apr 2023 04:30:59 -0700 (PDT)
Message-ID: <4413874a-ecdd-85ed-565e-c7e24656428c@gmail.com>
Date: Mon, 10 Apr 2023 08:30:55 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH for-8.0 v2] target/ppc: Fix temp usage in gen_op_arith_modw
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: david@gibson.dropbear.id.au, clg@kaod.org, groug@kaod.org,
 qemu-ppc@nongnu.org, Nicholas Piggin <npiggin@gmail.com>,
 Anton Johansson <anjo@rev.ng>
References: <20230408070547.3609447-1-richard.henderson@linaro.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20230408070547.3609447-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::29;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x29.google.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-3.246,
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



On 4/8/23 04:05, Richard Henderson wrote:
> Fix a crash writing to 't3', which is now a constant.
> Instead, write the result of the remu to 't1'.


Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>


And thanks Cedric for picking this up :D


Daniel

> 
> Fixes: 7058ff5231a ("target/ppc: Avoid tcg_const_* in translate.c")
> Reported-by: Nicholas Piggin <npiggin@gmail.com>
> Reviewed-by: Anton Johansson <anjo@rev.ng>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> 
> v2: Use a temp of the correct type, for ppc64.
>      It's what I get for rushing things this afternoon.
> 
> r~
> 
> ---
>   target/ppc/translate.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index 9d05357d03..f603f1a939 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -1807,8 +1807,8 @@ static inline void gen_op_arith_modw(DisasContext *ctx, TCGv ret, TCGv arg1,
>           TCGv_i32 t2 = tcg_constant_i32(1);
>           TCGv_i32 t3 = tcg_constant_i32(0);
>           tcg_gen_movcond_i32(TCG_COND_EQ, t1, t1, t3, t2, t1);
> -        tcg_gen_remu_i32(t3, t0, t1);
> -        tcg_gen_extu_i32_tl(ret, t3);
> +        tcg_gen_remu_i32(t0, t0, t1);
> +        tcg_gen_extu_i32_tl(ret, t0);
>       }
>   }
>   

