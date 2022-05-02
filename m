Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC38151799B
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 00:01:08 +0200 (CEST)
Received: from localhost ([::1]:59970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nle6N-0007YG-Q8
	for lists+qemu-devel@lfdr.de; Mon, 02 May 2022 18:01:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nle3G-0004w2-Sq
 for qemu-devel@nongnu.org; Mon, 02 May 2022 17:57:55 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:43870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nle3E-0005Ml-Av
 for qemu-devel@nongnu.org; Mon, 02 May 2022 17:57:54 -0400
Received: by mail-pf1-x429.google.com with SMTP id d25so457978pfo.10
 for <qemu-devel@nongnu.org>; Mon, 02 May 2022 14:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=kVOAON9EhUd1rVrRNZDaXrwZQTTxX5rBN0j6OaIFUIc=;
 b=Hi9RWxereMO7SBEjuXPDfW2Hj9pj4FrnCRRNlxComVlDcV6V1naSd4D/2s/ZiYvNcR
 5Ud5T9LRuDleZzvFHM4KY10yl37klaGNcGR0Wifgg8oyU1AloJ2VUJwQ/yIsgyY5zluF
 ohIEzt88kY/OTQgIZheW3gyg3v2NyU4CkOnFooFUbQhnIWNNzGqWhHx5iweV1wwBpnVC
 NjsPf4HftGhtZM9h2grZT2MLB0HqzMIxLirBr4vmwHVOFXvXIFO+rYtxpfOOwULnB14j
 hPbA28US7JMbl1+vwSPQNlUVSdFGYo/c+Ihh+Nzc5LYdWgxzHdyQ44RcP6fFrOxankVT
 fD8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=kVOAON9EhUd1rVrRNZDaXrwZQTTxX5rBN0j6OaIFUIc=;
 b=w+Q3bwEO25UN3Ed4GtHPEcoRz93vHIa1m+s2UhD78/OTCtVjzxLY/SMseliw69CI3R
 ANBzJOgMuh4sS2onIZn+7C9TGO9UR3sLuLT6N2LzymS6qg0gKDfFfX+CPDcjOL+4WP0V
 XFA+pgqSOEXONioYVL2EAF05MAQkEUiNTZSrQg003lojMNTdma12jWfTQeRk+9lwOgRW
 7+ABWyRAbh19DdZ6MX/hwQwMXL0cYsA5mZKbIkEB4nROo+aqt9UXu5rpgTpqcMOTpQ0D
 PGVmar3EdLaQE9WpXOjRBosCwOV6fk9aQ29Y0LSv/wSzyQ2BDfodf0c4nP3tJoQ+QSS0
 n5YA==
X-Gm-Message-State: AOAM530a9v18iFglKfn0u3xOVxsxoZ3A6POll//DHb67S8ofgUPfp8fn
 v4cxcH16DTw8hSc06mBUKKsLFA==
X-Google-Smtp-Source: ABdhPJwMX42kAufAyLExwR/1vHL2u/9No8F1M7RDhmcvHJn64acCtJZ6Weur90RhtsSSEvKMxCtPEg==
X-Received: by 2002:a05:6a00:1acb:b0:50d:b2e1:a443 with SMTP id
 f11-20020a056a001acb00b0050db2e1a443mr13117123pfv.16.1651528670971; 
 Mon, 02 May 2022 14:57:50 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 y16-20020a1709027c9000b0015e8d4eb26bsm5122650pll.181.2022.05.02.14.57.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 May 2022 14:57:50 -0700 (PDT)
Message-ID: <75e28cd8-c0d8-4e1b-2b56-48ebe47a6571@linaro.org>
Date: Mon, 2 May 2022 14:57:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 05/21] target/ppc: Remove msr_ds macro
Content-Language: en-US
To: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, balaton@eik.bme.hu
References: <20220502143934.71908-1-victor.colombo@eldorado.org.br>
 <20220502143934.71908-6-victor.colombo@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220502143934.71908-6-victor.colombo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 5/2/22 07:39, Víctor Colombo wrote:
> msr_ds macro hides the usage of env->msr, which is a bad behavior
> Substitute it with FIELD_EX64 calls that explicitly use env->msr
> as a parameter.
> 
> Suggested-by: Richard Henderson<richard.henderson@linaro.org>
> Signed-off-by: Víctor Colombo<victor.colombo@eldorado.org.br>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

