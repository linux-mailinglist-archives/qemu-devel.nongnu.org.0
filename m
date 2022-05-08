Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF6351EB95
	for <lists+qemu-devel@lfdr.de>; Sun,  8 May 2022 06:28:21 +0200 (CEST)
Received: from localhost ([::1]:50430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nnYWp-0006C0-U5
	for lists+qemu-devel@lfdr.de; Sun, 08 May 2022 00:28:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nnYTz-0004RX-Vw
 for qemu-devel@nongnu.org; Sun, 08 May 2022 00:25:24 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:42940)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nnYTw-0000SE-1u
 for qemu-devel@nongnu.org; Sun, 08 May 2022 00:25:21 -0400
Received: by mail-pg1-x536.google.com with SMTP id 202so9371614pgc.9
 for <qemu-devel@nongnu.org>; Sat, 07 May 2022 21:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=TLhJIJFbAfdOcHWIQBuYFsSNGmsOMp2X4PB3xgITmIY=;
 b=EYPQTU+D1neqrRv2YF0U6aiN5KX2VvlKb4l7ukeRZgSoI+vHZE53QqFF9R9/t1WI4a
 Terp4PmEHxRFu6P6Q7YLS9fumWbNXOjGIoMVcPoqJ4axCmOQT2pIFUAa0U9YvZP1W2co
 yEawIL7PDNL7iNaIQAJankkVvNXn1e1LmB2gRjR/qXaND970PLDVEjWPuaUGm8yCfSN9
 WN00pqOC+qBtqR1XOccnSMAbHbovzXsklS5hfNPqPZVUoclqwdkD9CKXdaIMgvIFg23l
 WiSti9ufRz8UX+tOXWLPpZZOKIG1JHsK3XFXtkB9EM4P/ifEshJgDTiCWwjwiPV7ik8+
 lHwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=TLhJIJFbAfdOcHWIQBuYFsSNGmsOMp2X4PB3xgITmIY=;
 b=AMi9SNf0/qrhMmxKp16GHXwLkcdMLV0CwSArKQQRUhnG/kIpHMQWwEjYxZz3mr0Iyf
 Ki4wXQDs0HVw6pHd4lg+lpDBv5E7ch80qeKAMLQ7bbgbCqQ05iPNJCZcGCGMZcd9xMzO
 SqZI4blDm1iKM3gCUNvRQML/9g1tx25biGjesw1HVqG6dsgWRraoqf2ydjs5PIwN93Ju
 w60WI5bP4e28Omb01TqZABZ9/o+HSTmsJT68T4A0h4GtNHj2rY/U1CHJX7NUV2eB1xxd
 jQItbf+C64RbExlEM7CeJX10br/DS14u5AW5gsE3oelAzmK+MtJZEU9SDyZNCoiE3gzu
 ReaQ==
X-Gm-Message-State: AOAM532dvSuJH3zX4LPqbsq/w4oSDzCGuGoDZm6BC9C4VHvfg8HMkVfK
 0eowCvREdlwb1cMvVP41jkAhmQ==
X-Google-Smtp-Source: ABdhPJz5sBkLP5v3lp04G3Lj8E31RtPfRmZqYyjPOFqV+6jfKhIvmulUtMeb7sOInRY8fVwR9NA1Yw==
X-Received: by 2002:a63:38e:0:b0:3ab:ada6:a219 with SMTP id
 136-20020a63038e000000b003abada6a219mr8560193pgd.140.1651983887885; 
 Sat, 07 May 2022 21:24:47 -0700 (PDT)
Received: from [192.168.4.112] (50-233-235-3-static.hfc.comcastbusiness.net.
 [50.233.235.3]) by smtp.gmail.com with ESMTPSA id
 x23-20020a170902821700b0015e8d4eb248sm4383113pln.146.2022.05.07.21.24.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 May 2022 21:24:47 -0700 (PDT)
Message-ID: <748597a5-7d57-0095-afdb-52ebcf5b9e1a@linaro.org>
Date: Sat, 7 May 2022 23:24:44 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [RFC PATCH v2 5/7] target/ppc: Implemented xvf16ger*
Content-Language: en-US
To: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>,
 qemu-ppc@nongnu.org
Cc: Joel Stanley <joel@jms.id.au>, Aurelien Jarno <aurelien@aurel32.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
References: <20220506121844.18969-1-lucas.araujo@eldorado.org.br>
 <20220506121844.18969-6-lucas.araujo@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220506121844.18969-6-lucas.araujo@eldorado.org.br>
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

On 5/6/22 07:18, Lucas Mateus Castro(alqotel) wrote:
> +static inline float32 float32_neg(float32 a)
> +{
> +    if (((a & 0x7f800000) == 0x7f800000) && (a & 0x007fffff)) {
> +        return a;
> +    } else {
> +        return float32_chs(a);
> +    }
> +}

This is wrong -- even NaNs get their signs changed.
Negation and absolute value are non-arithmetic operations.

If you're matching hardware results, this suggests...

> +                    if (neg_mul) {
> +                        msum = float32_neg(msum);
> +                    }
> +                    if (neg_acc) {
> +                        aux_acc = float32_neg(at[i].VsrSF(j));
> +                    } else {
> +                        aux_acc = at[i].VsrSF(j);
> +                    }
> +                    at[i].VsrSF(j) = float32_add(msum, aux_acc, excp_ptr);

This "add" should be "sub" instead of using a separate negation, when required.
I do wonder about the double-negation vs nans.

It looks like this could be

   float32_muladd(float32_one, msum, aux_acc, flags, &status)

with flags set to float_muladd_negate_* for neg_mul and neg_acc.  Any NaNs would go 
through pick_nan_muladd and fail to be altered.

I'm not sure if I'm suggesting actual use of muladd, for the simplicity, or if you should 
have an inline check for nans.  I might need to think about this in the morning.


r~

