Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9CE16504D6
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Dec 2022 22:39:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p71NQ-0004sn-0A; Sun, 18 Dec 2022 16:39:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p71NL-0004og-8C
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 16:39:15 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p71NJ-0006qD-M5
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 16:39:15 -0500
Received: by mail-ed1-x52a.google.com with SMTP id r26so10489431edc.10
 for <qemu-devel@nongnu.org>; Sun, 18 Dec 2022 13:39:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xMrwInNalQnFP4G5QPwKvGFvLfPRLd4031VEnGmuFNo=;
 b=Uy3/pNB25M1YFoXcJhomOLETNUqzFFaSvLN8S8ubiDzQoiZ/oKw6s78HCGNo9y1coO
 6WfzyZs3Yh0X2f2qwBDzHt1WHh30nV9M9ILotkqYT15yGL9fn/h0tHqwk71cE6Wqj3zq
 84ZN9yuoIKrAbFh6MaYf6dRZFR5i04QY7A01sPFra1N+bYwltuP1f6TLLWybyt2782w2
 3IgRypRDtDgiEbSMYsr3vD0rsHsmYo3UGfdiFk4beLdg1da6Va2kvigPdxhRJN35hHHI
 90mrF7pemcWDJfi7xTEcixMetson6wYCENsmt2pl9yK2amsVvbIyhjyU5xfF4/f/dEh8
 q0gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xMrwInNalQnFP4G5QPwKvGFvLfPRLd4031VEnGmuFNo=;
 b=tgVwCpD0zzLTO6LWvcxe9Xy1sg5Y1jmv8WmSr61jGVh9pZ5rTX6EAmfA+HT30xpAM3
 gb6/OwB3EQV3+b1XoyjIM/M1IUsJFZOBkHkN7OrI220asyGSq/LoiaLoHdWI+eFFAHVv
 It6IQ7ir7yXycTrvDkJ4ViwQTtOu98mjaEM97Tidgl9jABbYY9G5fGIHx8EpY/YwgbGf
 R2gLfyznc+95e1QRr/vHm78x/ccT7LZJrIK3JcPqgHkre65Yg56xKelUVZKQO1ZqIYjX
 FWnn+RpJs/H0ZtUDxwQ1RnMloiwnwdyGcRTbJbfHAK5au9N8mvKvV9ecSUtLpVskqmhG
 o8lQ==
X-Gm-Message-State: ANoB5pnp1K4rELg7g4oL8momwlRhWWpVtZiIICY6KHt78Yg6s0K1lYRL
 27M59RcESWnhePzYuSnkqJfNi6PnwLltv/IrVws=
X-Google-Smtp-Source: AA0mqf4Y1jKvW+qstSz8M/k0m7YnldlBbqppBLVtP1ueNHnqB6WxDcRyZmgsInVVXQ8CQ8IOLypC1A==
X-Received: by 2002:a05:6402:320f:b0:46c:ec6f:43d7 with SMTP id
 g15-20020a056402320f00b0046cec6f43d7mr47202846eda.19.1671399551661; 
 Sun, 18 Dec 2022 13:39:11 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 s19-20020a056402015300b0045bd14e241csm3579547edu.76.2022.12.18.13.39.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Dec 2022 13:39:11 -0800 (PST)
Message-ID: <b2cca51f-1c1e-a274-e857-341ef2fd0f7d@linaro.org>
Date: Sun, 18 Dec 2022 22:39:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH v4 20a/27] tcg: Pass number of arguments to tcg_emit_op()
 / tcg_op_insert_*()
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20221213212541.1820840-21-richard.henderson@linaro.org>
 <20221218211832.73312-1-philmd@linaro.org>
 <20221218211832.73312-2-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221218211832.73312-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 18/12/22 22:18, Philippe Mathieu-Daudé wrote:
> In order to have variable size allocated TCGOp, pass the number
> of arguments we use (and would allocate) up to tcg_op_alloc().
> 
> This alters tcg_emit_op(), tcg_op_insert_before() and
> tcg_op_insert_after() prototypes.
> 
> In tcg_op_alloc() ensure the number of arguments is in range.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> [PMD: Extracted from bigger patch]
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   accel/tcg/plugin-gen.c |  5 ++++-
>   include/tcg/tcg-op.h   |  2 +-
>   include/tcg/tcg.h      |  8 +++++---
>   tcg/optimize.c         |  4 ++--
>   tcg/tcg-op-vec.c       |  8 ++++----
>   tcg/tcg-op.c           | 12 ++++++------
>   tcg/tcg.c              | 30 +++++++++++++++++-------------
>   7 files changed, 39 insertions(+), 30 deletions(-)


