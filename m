Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8055D6F5626
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 12:27:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu9hd-0007Ck-Om; Wed, 03 May 2023 06:27:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu9ha-000731-Qf
 for qemu-devel@nongnu.org; Wed, 03 May 2023 06:27:14 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu9hY-0002Vn-99
 for qemu-devel@nongnu.org; Wed, 03 May 2023 06:27:13 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-3f178da219bso48430225e9.1
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 03:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683109631; x=1685701631;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ApZIT9KvgQeYk5rYL1p7Q+63/bTXuOlRDKTXcmAcZlE=;
 b=CyiRWrfULMJHAVtZWPHZpaaqEJE86dOfNLRU7aYPbPzg9KIgkin4J8a8R3eWIz1A9U
 wxwomJwv3QZdS5zzqG4KZhEB1JbjdCdjxhKsYu6PI5P7CxW/2LU1zTjaocprbjQTsnI6
 DzAePgTsOp67fW9/2GhE/FHQzqfqAZqQY5zoV5+F8DAxPakOCktHt783O1IPb+uYvPcW
 RNhRNI3EuflyZUoBXS3i1A3BKrNK0lkW8x2TZicBT61T3RIdYVnl104YxREDHeQnWVqU
 FNSAvl120N/EOfBwcv7mtjltsa7OruV+WZxKb25VnGMkuJTL3SiKMIrvSOb8xYQIa2LL
 Ar/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683109631; x=1685701631;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ApZIT9KvgQeYk5rYL1p7Q+63/bTXuOlRDKTXcmAcZlE=;
 b=KfM3t9E2eZ+H33z9ryne9+8F5y4mWQy30DIM4kJcuJOu3XN3NMUmHhAaM/l7JwokuZ
 qXjlNp4bTDuv6R/pkmBo9AkGhtp06SQFqIOhc9A9v3o04Lq0bXF5rc8rzHQS5r4bMhfF
 lfS+UTU6mmHPY7dfw9fmmvuNmeXn3U7cBJ3AYZdXKNVft9HJKTAdiijynZbRBJRYro7A
 rKgAIMnppIpa9r5sxf34pA6DYIc8efNiqnRvrNSl5baCBCKa1+yG5tcBlWS6UginCLbL
 nqCeAYuxyCNKNETmX/K/wQEyaBoWGj4ynhYWhyG3La2rqJtIrSKsaMbBZ9dfoXIB/T1+
 d+xw==
X-Gm-Message-State: AC+VfDwBqk4eb3hfjPDBxQ4X/SzJIfyXus5FaTw7ZsMII18tR2P+JhUO
 jQ/h3M4aQZqgcHBrncTy4TFp4UqNKsgbCjWYQwPA+A==
X-Google-Smtp-Source: ACHHUZ7kVgNDAfTB27PhiLDjc2jXBU2l4a550ZLvfmoRIWaPPvKLJzG7ldHySLABZluTFkE3rIMKaA==
X-Received: by 2002:a7b:c7d3:0:b0:3ef:622c:26d3 with SMTP id
 z19-20020a7bc7d3000000b003ef622c26d3mr14481271wmk.35.1683109630999; 
 Wed, 03 May 2023 03:27:10 -0700 (PDT)
Received: from ?IPV6:2a02:c7c:74db:8d00:c01d:9d74:b630:9087?
 ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 u6-20020a05600c00c600b003ee1b2ab9a0sm1468493wmm.11.2023.05.03.03.27.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 May 2023 03:27:10 -0700 (PDT)
Message-ID: <3bbcecac-e673-4861-7634-63210889773c@linaro.org>
Date: Wed, 3 May 2023 11:27:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 13/22] hw/sparc: add a TCX dependency for SUN4M machines
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20230503091244.1450613-1-alex.bennee@linaro.org>
 <20230503091244.1450613-14-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230503091244.1450613-14-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
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

On 5/3/23 10:12, Alex Bennée wrote:
> This is the fallback VGA devices needed for board creation so will
> otherwise fail under "make check" with a --without-default-devices
> build.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   hw/sparc/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/hw/sparc/Kconfig b/hw/sparc/Kconfig
> index 79d58beb7a..721b37a9ca 100644
> --- a/hw/sparc/Kconfig
> +++ b/hw/sparc/Kconfig
> @@ -15,6 +15,7 @@ config SUN4M
>       select STP2000
>       select CHRP_NVRAM
>       select OR_IRQ
> +    select TCX
>   
>   config LEON3
>       bool

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

