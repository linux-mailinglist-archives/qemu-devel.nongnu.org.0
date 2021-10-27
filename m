Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD58E43C557
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 10:38:22 +0200 (CEST)
Received: from localhost ([::1]:35588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfeRx-0006QQ-Vt
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 04:38:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfeOJ-0003Vk-Kp
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 04:34:35 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:39811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfeOH-0007Ax-GZ
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 04:34:35 -0400
Received: by mail-wr1-x429.google.com with SMTP id z14so2714464wrg.6
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 01:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hC/ZfGcm1haTOWhGuTrElMimUMZK03xd2hUxfGVt/qk=;
 b=bdPARcME+KtPgbM5f4ixMEPnTCmmIGvO3M4bsFeq8iaFGGUIub7RldmvMVnsrBIrOI
 x1dPsQepWzNSD2R42GIzqP17frIf0uhg/slbkmJA63TFddXRTND8Z0TWFporz6vaHOHB
 9l5Q5GkmXQwjMyIFtLiD0EUYtmKRXaNP/Z+lWdcT2AUHpPO7Rq+MnhQjPeON1zY1dFnM
 +XL/Z/VY8z4CxHV8tv6MmDEH6wVh6Z5t+l/l89CXTQNyHd09QjIkaVvynDOPCsTV1FJ8
 ZrNl+9zz1ajD7ZWSbhMLs6bDHzq8FyaaaAd0tZh3HPCvS6k2XHHfrkWgp/QQrLY20Qv7
 OBug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hC/ZfGcm1haTOWhGuTrElMimUMZK03xd2hUxfGVt/qk=;
 b=BtBMpm4Qq1SshmrpIbm0FX6tg1gbKgTuwGxTVZwAdIDC0MsVqiQ9sCjeXG2ry/B56v
 wGDeZlRnKuuAKCnbp0m6z9wTFkBFTllAXTzpibiQdt/6UsMcIGIkNopqeWB9O5gKH/ZW
 sx/dv+T2udoutC0xHZqgJv0a9LcTLLsO6EpovZSqM35KJ/vPKsGa6RipnpJ9x2q5bC4g
 LeAYXPkQ/EUU39FUS30fm5XNxk9ity2jG9/eeG/SpxKRQiZh2bHh9mPveLsv+5xWi1YY
 NONCSbZHN66vwmJu0KJZT0+t3J3p/1/lZsqG25Feh0Bn5N88dZ+U/MGHd67SQCRpmQhn
 BPhA==
X-Gm-Message-State: AOAM532j1wNnGhEkCavECg4e4QYPE8fXFqVTV6omdAtn0TJpB4g6wzD+
 u7lTFN0/4Fco3IXk7PWr73irXJX0ih0=
X-Google-Smtp-Source: ABdhPJzX5w1Ajb/kxPlmP9j5mTbmtQWr4PKA4gjEGoz/nWGuxJ6+URYT8tn0cSDjudQIhwwp19cNrg==
X-Received: by 2002:a05:6000:156a:: with SMTP id
 10mr21357824wrz.347.1635323671639; 
 Wed, 27 Oct 2021 01:34:31 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id i6sm12180721wry.71.2021.10.27.01.34.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Oct 2021 01:34:31 -0700 (PDT)
Message-ID: <2c6ebe30-096a-25a4-26c2-66df518ccda0@amsat.org>
Date: Wed, 27 Oct 2021 10:34:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] target/m68k: Optimize shift_mem() using extract() TCG
 opcode
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211003142428.3676092-1-f4bug@amsat.org>
 <f7f14d9b-d952-beff-e4be-d4a6a6ef5e0e@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <f7f14d9b-d952-beff-e4be-d4a6a6ef5e0e@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.215,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/3/21 17:30, Richard Henderson wrote:
> On 10/3/21 10:24 AM, Philippe Mathieu-Daudé wrote:
>> When running the scripts/coccinelle/tcg_gen_extract.cocci
>> Coccinelle semantic patch on target/m68k/, we get:
>>
>>      [DBG] candidate at target/m68k/translate.c:3668
>>
>> Manually inspect and replace combinations of (shri, andi)
>> and (movi, andi) opcodes by the extract opcode.
>>
>> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
>> ---
>>   target/m68k/translate.c | 5 ++---
>>   1 file changed, 2 insertions(+), 3 deletions(-)
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Another candidate for tcg-next :)

