Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E8C52AC22
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 21:42:28 +0200 (CEST)
Received: from localhost ([::1]:43604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nr35G-0000wu-TZ
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 15:42:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nr33Z-0008RO-6z
 for qemu-devel@nongnu.org; Tue, 17 May 2022 15:40:33 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:43878)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nr33X-00089B-GU
 for qemu-devel@nongnu.org; Tue, 17 May 2022 15:40:32 -0400
Received: by mail-pf1-x435.google.com with SMTP id w200so30828pfc.10
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 12:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=qer5YDAuOgsBFg3LNQ5LIR5p/MjwYILxZvtIVMLl+QY=;
 b=d51yzaAsyvHMXC2f0D1wyvBdE4xDrXsXvNPNdnlKyk9xrMu+PqrsJwy+6v8UGf8H/b
 90ys3TCNyu+WRh7B6TlHMEv3iXZZAAnZ3LXH4XowS+cZYYcWPqlXKwRqr8PrOJTp5a8Y
 bK/h+mDylyxi6NICl8Q6rpZYOHEzMjCNPYH5sDLO+J9VByALm7xWMAGCk8mNdBe9vJ8d
 ud3cvdjw3W9LtSqSaaebeFMzm7NzYXqSj/vzomkzVVA0ZrjTE3rd/9roePVkN47hHva0
 GkFLE/82BsCGIwRcpqXlER6oiRuO2helhbfScONHBZ7z5QlyCIRKzCOQR+5Ej0zSR8QD
 b8lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=qer5YDAuOgsBFg3LNQ5LIR5p/MjwYILxZvtIVMLl+QY=;
 b=2KEFWMYMoX+lqRN1sZl2ELZF6aOjpVTkKy47L0oWrrY3j+b/+KeLYzfH0GYSBu6byw
 zy34aBQTyVvOSwv22hCVZYiUWfQ2NT8E20bYCCE4pi2QGSqqW0Zyoo2hy6k9evxRSS9x
 fAep0xfi9KqB6ukajCWucEmGeCbPePr9O4LgmhnL3/xQR8JoPWbPwMLClCRCtYy5mBrN
 IHpK7y50NgXWpiR3K3jb3qzhmhgTQHcHi+S6/tg11lMq0kXd9KSyil7+H/ndQAO7GQTR
 RaTq0lB3+xSyp5hKTt9VtHHboXaoBF7dIa9NySG8DAvB8BRmY4b3Q+CF7Rm5d9K3Dqyq
 v//A==
X-Gm-Message-State: AOAM532rjGHxdqApK3quK1JVaKEOb/3BwLkJKWzKTgt43V6jZ04HWMgW
 EVqPi/R5A9/LZzzHhotzUEvy6g==
X-Google-Smtp-Source: ABdhPJy3+msMmPrViqmbSHnphxF78e2rLe2dLLnySL6tbwUWrBw3mBN2xrouS4SU0WKqIUliGTyxmg==
X-Received: by 2002:a65:6c06:0:b0:3f5:f29d:e030 with SMTP id
 y6-20020a656c06000000b003f5f29de030mr838740pgu.22.1652816429892; 
 Tue, 17 May 2022 12:40:29 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 s10-20020a17090ae68a00b001da3920d985sm2048210pjy.12.2022.05.17.12.40.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 May 2022 12:40:29 -0700 (PDT)
Message-ID: <fe1da3e7-16d4-460d-13d1-87fc02561142@linaro.org>
Date: Tue, 17 May 2022 12:40:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v3 5/8] target/ppc: Implemented xvf16ger*
Content-Language: en-US
To: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>,
 qemu-ppc@nongnu.org
Cc: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
References: <20220517183735.110342-1-lucas.araujo@eldorado.org.br>
 <20220517183735.110342-6-lucas.araujo@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220517183735.110342-6-lucas.araujo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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

On 5/17/22 11:37, Lucas Mateus Castro(alqotel) wrote:
> +static inline float32 bfp32_negate(float32 a)
> +{
> +    if (unlikely(((a & 0x7f800000) == 0x7f800000) && (a & 0x007fffff))) {

float32_is_any_nan.

> +                    if (neg_mul) {
> +                        msum = bfp32_negate(msum);
> +                    }
> +                    if (neg_acc) {
> +                        at[i].VsrSF(j) = float32_sub(msum, aux_acc, excp_ptr);
> +                    } else {
> +                        at[i].VsrSF(j) = float32_add(msum, aux_acc, excp_ptr);
> +                    }

Hmm.  Since we're using negate once, perhaps just go ahead and use it twice.

Or go all the way with

     if (!neg_mul && !neg_acc) {
         r = float32_add(msum, aux_acc, excp_ptr);
     } else if (!neg_mul) {
         r = float32_sub(msum, aux_acc, excp_ptr);
     } else if (!neg_acc) {
         r = float32_sub(aux_acc, msum, excp_ptr);
     } else {
         r = float32_add(bfp32_neg(msum), bfp32_neg(aux_acc), excp_ptr);
     }

Otherwise, the logic seems sane.


r~

