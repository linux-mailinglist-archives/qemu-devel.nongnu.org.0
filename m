Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DEB95AD91E
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 20:37:44 +0200 (CEST)
Received: from localhost ([::1]:56564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVGyd-0001Ls-5a
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 14:37:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oVGlG-0002lR-M6; Mon, 05 Sep 2022 14:23:54 -0400
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b]:39514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oVGlC-0002BH-1j; Mon, 05 Sep 2022 14:23:54 -0400
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-11e9a7135easo23054305fac.6; 
 Mon, 05 Sep 2022 11:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=tnHqQQRHAeB1fksOFWU7XJ6rFOlT2jp3jfsZICUWhi8=;
 b=eRKMH03ZbZJ88di986unI1eqoGEvlI3Ws8i115CYWX6jZXJTFKuyMKn3NJKXETz5C+
 f9JQxgD7DcprgKR/pm3C7fJhTbT2mXIZXaVwxs2r5yrdUOkzBSQ1wZTSKBlMPKVlaZvt
 OAxlvDjl9G9A7LKZc4v390qETCQOaXuCE5mib9UsJSAjhNVLTyrHd+4Gmh0gvm2G+hUz
 I7W5uOkna5x0mflqqONmd5GCW4y5eb3SFMvSX8GfgGMwXOIR1wNaQXrRVtTTAGxXKogv
 u6SyiXZ45fFjcuZIZuqlvLRyiBCEQeg5+FzvVn4p44gyWPuUA9dRwzw72HNiqh5VyFPL
 O5MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=tnHqQQRHAeB1fksOFWU7XJ6rFOlT2jp3jfsZICUWhi8=;
 b=3Y8wEav26+of+MlLeSqh/VeBakSq+4UyEU525gY/BowK9DDathlrGzQZOBNW+Nw/s7
 wJcQfGKOMXLXnOBIu74GAKEVA3sZoKLjWtAFpxXnpPbSMOu7+OB56gtEFwN0UG0uIOnz
 kwJQi0EM0IBM/Plvv52XcxTv/HNPr2klZVLTczulJwtQqdXXVtw+34IB+MKKsv5UMmVk
 eObVJFgdIA7j0surpoevNYNIty3mYHp0eLQGFrkE1lbRuqBHEcWd321xpNnyYTTwz/Y7
 dZCSHPsfM80jzAsx1weRuvTohV3uoyEiEHA3iXAeqOrdi4N9xzeQzBCaVIKvX34kfMLm
 Eunw==
X-Gm-Message-State: ACgBeo0yRixjC/6aEkqwWwai/SioqruZn6IqMXb8DiqhpTdNn+HffS14
 drwxW784iSKAjVS3JINp0uVfwOC5zRquFQ==
X-Google-Smtp-Source: AA6agR4FAYQK4c0s8/cQc8S07xViZ+IZ9UGXaugQDD7CnOW5CE/cHDZt455tRiQZ7Dr3S6crkscrbA==
X-Received: by 2002:a05:6870:5713:b0:11c:e8a2:bc8e with SMTP id
 k19-20020a056870571300b0011ce8a2bc8emr9416538oap.191.1662402228576; 
 Mon, 05 Sep 2022 11:23:48 -0700 (PDT)
Received: from [192.168.10.102] (200-207-147-180.dsl.telesp.net.br.
 [200.207.147.180]) by smtp.gmail.com with ESMTPSA id
 bq8-20020a05680823c800b00334c2e81dfbsm4379398oib.0.2022.09.05.11.23.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Sep 2022 11:23:47 -0700 (PDT)
Message-ID: <0e0791b1-25a6-44c7-375a-baf7c3e80d8b@gmail.com>
Date: Mon, 5 Sep 2022 15:23:43 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 05/19] target/ppc: Zero second doubleword for VSX madd
 instructions
Content-Language: en-US
To: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: clg@kaod.org, david@gibson.dropbear.id.au, groug@kaod.org,
 richard.henderson@linaro.org, matheus.ferst@eldorado.org.br,
 lucas.araujo@eldorado.org.br, leandro.lupori@eldorado.org.br,
 lucas.coutinho@eldorado.org.br
References: <20220901131756.26060-1-victor.colombo@eldorado.org.br>
 <20220901131756.26060-6-victor.colombo@eldorado.org.br>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220901131756.26060-6-victor.colombo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2b;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2b.google.com
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
> In 205eb5a89e we updated most VSX instructions to zero the
> second doubleword, as is requested by PowerISA since v3.1.
> However, VSX_MADD helper was left behind unchanged, while it
> is also affected and should be fixed as well.
> 
> This patch applies the fix for MADD instructions.
> 
> Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
> ---

In this case it's good to add a Fixes tag:


Fixes: 205eb5a89e ("target/ppc: Change VSX instructions behavior to fill with zeros")



>   target/ppc/fpu_helper.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

> 
> diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
> index 7ab6beadad..da79c64eca 100644
> --- a/target/ppc/fpu_helper.c
> +++ b/target/ppc/fpu_helper.c
> @@ -2178,7 +2178,7 @@ VSX_TSQRT(xvtsqrtsp, 4, float32, VsrW(i), -126, 23)
>   void helper_##op(CPUPPCState *env, ppc_vsr_t *xt,                             \
>                    ppc_vsr_t *s1, ppc_vsr_t *s2, ppc_vsr_t *s3)                 \
>   {                                                                             \
> -    ppc_vsr_t t = *xt;                                                        \
> +    ppc_vsr_t t = { };                                                        \
>       int i;                                                                    \
>                                                                                 \
>       helper_reset_fpstatus(env);                                               \

