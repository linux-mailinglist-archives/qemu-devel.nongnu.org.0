Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07DD05AD924
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 20:41:32 +0200 (CEST)
Received: from localhost ([::1]:56818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVH2J-0005eG-1k
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 14:41:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oVGmk-0005EA-7z; Mon, 05 Sep 2022 14:25:27 -0400
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34]:39543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oVGmc-0002Ul-3u; Mon, 05 Sep 2022 14:25:23 -0400
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-11e9a7135easo23061664fac.6; 
 Mon, 05 Sep 2022 11:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=is3tn5AdJgakBvOsRBrXMirFMUoHpbf0MJHFV+HEcdo=;
 b=g8ajqoPaXh+8CVXL+T2255U2/pGm4gCiEUye7d/9z8konKoplIte4y7dW+AUQw083N
 4u+zyvRm9p3tVRWXvCaes1gy+lssnWOH/KnEgBAJGhVu6ab/uD1qjiNVi9Dqqp8GJR6O
 wqu1NGDYlYXrGvAReELfbX6v4kmu36BEfO7MuZJc1daSD97PdTRMcrCw3BHjV20mR1Vk
 htrsFjGQr2sVVVx2e454FoZM1vAWJGVdYrlL3xSl02XdK97PhMpZBnKnaae3yp4dfQOo
 rSdiVTE9XSDsFDAnwdzj5Iut5Rf+tD/qmJ6XPu/vx7U+YFi0ATpDSYVe4StcNvqra7KI
 jRvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=is3tn5AdJgakBvOsRBrXMirFMUoHpbf0MJHFV+HEcdo=;
 b=f7XA7ljxaHCSdxz+lI+rcTET0OB4xyvhm2MKwcqdQP5beyvUgPLCVi6EvZr8qJtBEr
 LPMivO8dcR3uY0+OIZU/BL1pt7zl059rvOtostY2vHybQqGBjcgZGM7QodIZkqV7EP8g
 WJ5XE/QtW5K+lrO1ygvlXtpAFW58fmsIwDjlhOAy8Kby5DUGDD0LgBXsrZ+y6KCcHKSb
 Tyx1M/VXNH2I66gqfe2PYIMaDpJsdy1i7uXrj/fVXk/hJIrfn5NBK8mHXbi7dToeGOqA
 1rqUInkF/2sm+3fefX84I5O/ccYGV00hzv9fiiQxnIi4pGogerg3RcplaGLkk8A0DLxC
 CD0w==
X-Gm-Message-State: ACgBeo3xBAbFWLNW/UYM5IgleAxQA4FlTTX81TfjsrLdXORgGQr4C6cA
 F3WeInQTepWhg0GNQD9L5JE=
X-Google-Smtp-Source: AA6agR46W3Z1tC6T7kx7KpJMMzcw/l9ADLA6+uOnBC0RtBoV1wNae8r4mc2SFNszHL8cFob1sEb0Hw==
X-Received: by 2002:a05:6808:1446:b0:343:33a:875e with SMTP id
 x6-20020a056808144600b00343033a875emr8759259oiv.79.1662402316247; 
 Mon, 05 Sep 2022 11:25:16 -0700 (PDT)
Received: from [192.168.10.102] (200-207-147-180.dsl.telesp.net.br.
 [200.207.147.180]) by smtp.gmail.com with ESMTPSA id
 105-20020a9d0bf2000000b00638ac7ddb77sm4863789oth.10.2022.09.05.11.25.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Sep 2022 11:25:15 -0700 (PDT)
Message-ID: <108a2e85-97fa-047e-a28f-679109e84ec3@gmail.com>
Date: Mon, 5 Sep 2022 15:25:11 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 06/19] target/ppc: Set OV32 when OV is set
Content-Language: en-US
To: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: clg@kaod.org, david@gibson.dropbear.id.au, groug@kaod.org,
 richard.henderson@linaro.org, matheus.ferst@eldorado.org.br,
 lucas.araujo@eldorado.org.br, leandro.lupori@eldorado.org.br,
 lucas.coutinho@eldorado.org.br
References: <20220901131756.26060-1-victor.colombo@eldorado.org.br>
 <20220901131756.26060-7-victor.colombo@eldorado.org.br>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220901131756.26060-7-victor.colombo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::34;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x34.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-1.716,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 9/1/22 10:17, Víctor Colombo wrote:
> According to PowerISA: "OV32 is set whenever OV is implicitly set, and
> is set to the same value that OV is defined to be set to in 32-bit
> mode".
> 
> This patch changes helper_update_ov_legacy to set/clear ov32 when
> applicable.
> 
> Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
> ---


Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   target/ppc/int_helper.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
> index d905f07d02..696096100b 100644
> --- a/target/ppc/int_helper.c
> +++ b/target/ppc/int_helper.c
> @@ -37,9 +37,9 @@
>   static inline void helper_update_ov_legacy(CPUPPCState *env, int ov)
>   {
>       if (unlikely(ov)) {
> -        env->so = env->ov = 1;
> +        env->so = env->ov = env->ov32 = 1;
>       } else {
> -        env->ov = 0;
> +        env->ov = env->ov32 = 0;
>       }
>   }
>   

