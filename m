Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 662E03C278A
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 18:28:26 +0200 (CEST)
Received: from localhost ([::1]:52416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1tMX-0007TT-Ff
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 12:28:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m1tFs-0000yk-O0
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 12:21:32 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:43777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m1tFr-0006J2-A3
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 12:21:32 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 q18-20020a1ce9120000b02901f259f3a250so6632743wmc.2
 for <qemu-devel@nongnu.org>; Fri, 09 Jul 2021 09:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=sCGVBQfgxGJXNmfxYwZCGndtgPzwmm/nXP9vhktpB04=;
 b=qoWNx+RXn+ItUudwvI4+Lc3V54RAGqYPEUdspmE10K2pUblBQvlBaJUeGkH+091isI
 iAsJTCjRik59X5KLFI8e7NeaigilwveaTwu9/uUiUs3DJ3ojBVtRtJNpB6b9QifqyYJh
 iKBjVn/NlgupSeJsE3Dp6qvm+fiIINnsqM+v/QXRaz24+2Mu705HCpuV52WAYaKZHWIf
 Ge4/alPe+c4xAaq/VbEM4tVN3rgD7Hn5LOyjZJ0F8bv5RLOogsAPFp1yJknzqJE2QvmQ
 h/P2XeCTc0qdGALbD97iSCdTRmXxukBqGPfU1gDbeHzUdxsGaWEuZ0KmpH8mFOtzf5dZ
 k38w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sCGVBQfgxGJXNmfxYwZCGndtgPzwmm/nXP9vhktpB04=;
 b=KgxzO/4kMC5dtm5D97fKDo0Ad8taydTJ2i0OMs7hVS9VhTTHuU2cbIuNh0Qr46lhJi
 atLMccNfXbdP/whdFcDcbm1ivEyPg3RZWyJ1ewOhwcSkw70R7EpEq1Xbufeq8AAxpjr+
 GeoDVu8y0JDUYEeDZiXuI9uGHl7Ow9ZPs3aTY4V/JdElHL3rukTIn1z+FVobczZWJoHR
 QXAsHKr1avEk9ZlC6rxLtz1QbEwXspkbiRI9pr557XFl71TAo+myb6vOfmj0InHVM4pt
 c5HC1CQLoeWBEIQ2he5ziP72W8NwDbo8Alf+C+IZgZUwWLBQs6zxEuiG9Ni0lPlzmJKh
 Y8JA==
X-Gm-Message-State: AOAM532hxp1J9rV8Cn4WYOsvH3xt326jz6ZAIUEWNifX/bpGaVQbta6o
 4f7Rt0pdA9RmKGxiqVlhEio=
X-Google-Smtp-Source: ABdhPJwiPLGC95/k/Mdo5/+GP+4HjUdJi4xN/UUFJbh+BiiXsX7Wnq8714SpkIQj+IHvojkKQwc0QQ==
X-Received: by 2002:a1c:4c15:: with SMTP id z21mr4166843wmf.114.1625847689818; 
 Fri, 09 Jul 2021 09:21:29 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id l10sm5694525wrt.49.2021.07.09.09.21.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jul 2021 09:21:29 -0700 (PDT)
Subject: Re: [PATCH 1/4] target/openrisc: Use tcg_constant_*
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210708213754.830485-1-richard.henderson@linaro.org>
 <20210708213754.830485-2-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <c5830022-ceb2-36af-032e-0ad7f930f2c5@amsat.org>
Date: Fri, 9 Jul 2021 18:21:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210708213754.830485-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.001, NICE_REPLY_A=-0.001,
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
Cc: shorne@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/8/21 11:37 PM, Richard Henderson wrote:
> Replace uses of tcg_const_* with the allocate and free close together.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/openrisc/translate.c | 42 ++++++++-----------------------------
>  1 file changed, 9 insertions(+), 33 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

