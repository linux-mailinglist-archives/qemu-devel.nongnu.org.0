Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF44F52A800
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 18:34:39 +0200 (CEST)
Received: from localhost ([::1]:51240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nr09e-0002jz-Iw
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 12:34:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nr05h-0008At-BM
 for qemu-devel@nongnu.org; Tue, 17 May 2022 12:30:33 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:41953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nr05f-0003lV-Lc
 for qemu-devel@nongnu.org; Tue, 17 May 2022 12:30:32 -0400
Received: by mail-pg1-x536.google.com with SMTP id 31so17384099pgp.8
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 09:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ktxvDbxulmHsgR6Jto62Yxp6Kuu9o+zUyRhZNq5RXH4=;
 b=fINwSAMnB8z4dC4pgfzmooKjPNAZXCqF8idFjZnlgL5n97eakAnE8tNLlU2vsdLWtT
 GeCcHmGGG3UcqNTNXLoWIzdOtKa8hw+bHGyKtnzX7Dc4n21Aa4Lcp2ho0Ja16rKlrcrU
 oeItumBBLDh0jDBoMw6iVXudP9hXB5bFWq+TVOmyyC8SFEIuA9jxEtVIC9Vuu/gpHMWh
 GeaU3zQAp93VVHJgtog7R8L71OxIONNsidBsG44OxGWMkpVu3ywtjLxbCZcaJOUBEO2Z
 pWn+53u1JT6ilQpKXtab20OcOrLoMUJDuUYivegR9A5U03BjzBUHkk1GyxUvd+RWd6YE
 yG3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ktxvDbxulmHsgR6Jto62Yxp6Kuu9o+zUyRhZNq5RXH4=;
 b=hJB5zZoFu222sqzOuLrWNF+vNqYWKsiLhGC8WTp/8/wBZCJ6iUE/S6oT1D1xGsJ3Yk
 QhV4nmfMBr2WEVdy0t3rWuGFuG/PdDIIrj9SG7G684CiHeEefr/CiR8G82VcHiLkWTw5
 s2rRnVxttnQ0QcftPEpV/uYFmVpakn5IQr8/NEuBYeL1TT8zlTp9rJWYyiNoIrxPnK7a
 ECTndzGmIreS8ZFdBAUhqniCBmx8XjhvAICszgwSWqhI/aMPMg1WhRCG2PxVZvT57K9X
 PzGyqGwg3pZn6OHfPquJ8tE3yCMRWbGTIeSMeTsgAbMVCTBZRskGOHkWDaOIMis1gIV8
 PixQ==
X-Gm-Message-State: AOAM530N8x+g0mpaKpdKDkxAQuCjo/pDWgQKva93Cek1rWEblqNvteJz
 pQwqfNsyaRIJbsHPZef96n5crQ==
X-Google-Smtp-Source: ABdhPJy8rdeyl+NGiNv/+WL37Rvf0pSE6I/FjOD6LNnagiDs3Npq/1xb4TcLIs3nvbwDGwEDtRVxNA==
X-Received: by 2002:a63:db17:0:b0:3c1:dc15:7a6e with SMTP id
 e23-20020a63db17000000b003c1dc157a6emr20571373pgg.107.1652805029929; 
 Tue, 17 May 2022 09:30:29 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 i1-20020a056a00004100b0050dc76281e3sm59459pfk.189.2022.05.17.09.30.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 May 2022 09:30:29 -0700 (PDT)
Message-ID: <cc10226e-f73d-6db2-37ae-3966c926fe94@linaro.org>
Date: Tue, 17 May 2022 09:30:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 01/12] target/ppc: declare darn32/darn64 helpers with
 TCG_CALL_NO_RWG
Content-Language: en-US
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org
References: <20220517123929.284511-1-matheus.ferst@eldorado.org.br>
 <20220517123929.284511-2-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220517123929.284511-2-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 5/17/22 05:39, matheus.ferst@eldorado.org.br wrote:
> From: Matheus Ferst <matheus.ferst@eldorado.org.br>
> 
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
> ---
>   target/ppc/helper.h | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/target/ppc/helper.h b/target/ppc/helper.h
> index aa6773c4a5..44eb6b7b7c 100644
> --- a/target/ppc/helper.h
> +++ b/target/ppc/helper.h
> @@ -59,8 +59,8 @@ DEF_HELPER_FLAGS_2(cmpeqb, TCG_CALL_NO_RWG_SE, i32, tl, tl)
>   DEF_HELPER_FLAGS_1(popcntw, TCG_CALL_NO_RWG_SE, tl, tl)
>   DEF_HELPER_FLAGS_2(bpermd, TCG_CALL_NO_RWG_SE, i64, i64, i64)
>   DEF_HELPER_3(srad, tl, env, tl, tl)
> -DEF_HELPER_0(darn32, tl)
> -DEF_HELPER_0(darn64, tl)
> +DEF_HELPER_FLAGS_0(darn32, TCG_CALL_NO_RWG, tl)
> +DEF_HELPER_FLAGS_0(darn64, TCG_CALL_NO_RWG, tl)

These might be declared not to have side effects as well.
It would change the sequence of random numbers returned,
but if we assume those are non-predictable anyway, that
should not be visible to the guest.

Either way,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

