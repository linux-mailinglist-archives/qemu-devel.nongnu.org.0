Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF34A41C62D
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 15:57:20 +0200 (CEST)
Received: from localhost ([::1]:33308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVa5H-0002QJ-Ou
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 09:57:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mVZrT-0007sT-Er; Wed, 29 Sep 2021 09:43:04 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:40886)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mVZrQ-0005Pf-K8; Wed, 29 Sep 2021 09:43:03 -0400
Received: by mail-wr1-x42d.google.com with SMTP id s21so4344119wra.7;
 Wed, 29 Sep 2021 06:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7VgzNLKaII0sjGEZ3whMicXvjXKoiFDGa0uE27fN5Us=;
 b=dndS0oVR/ro6ZbRGqO49AYAZxpIweGsuEivJA6cvBUH1+Ae8If1pRB5u0SLLr7RVbj
 qkeZ7yWaFli8FegO/FHB3EC4bRT2Km0Aq3Eg+dvby2UhjXD5yra299bwFckBgLLXKsaw
 ckdM/7xzPtExq3Hgq8U5I+yyFnbJFNDOdNbsYvRlu+TL26+eBUAOozhU0UXKn597rePW
 UFwA5rtEm+c0+FYqpBqOG8YgNZKC4SKaPnaueH0+/7dh+kym8LQ2FB0SlJrwsVPzSxgR
 9msHbyFredzaRCpAyZbsTGEdhUbH81HYhirutEqRZEuUMPtVUrBOWDFiu6Yv8+msT1/b
 PV8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7VgzNLKaII0sjGEZ3whMicXvjXKoiFDGa0uE27fN5Us=;
 b=dOQPs/ug8Xo2cyHim8piqEeRUeOfFmE0AlJNOq6atPN5BfT5R5HDqmvMfgsRyTniur
 I/HBktIEA84Js5pDSbzQHrz/XiyvUmKM7GDQPvL205IqPwCklttHzHstQLJM04Q1+ZS6
 RzHg5IgyPeukxFY8Gvp966sY8V023XzLGmA9+X8iOt4XE/eW8uc3q+dng5EDdM7yeHfl
 ejKgidyKJVhIsh82mWUxsNDtXOHTgUUdTOCqmMZVPlKi3i44ig+lFkV6dZB+B+5gr/2T
 LKK1mpkUopZUgB9D8QNB3qh+Un6daIQLmpvTEpMva2eZXoshangdDI/FY8eW25EH4I/t
 uU4A==
X-Gm-Message-State: AOAM532tLNt4iW2UDPInwruQHLGatG/JyY6jciMURu8zQZeJw9OHrmCR
 ZiL1ukoZIqm3bkfYklBufbvnBtzLwYo=
X-Google-Smtp-Source: ABdhPJyDnrXOoVLg8/AdwtOWBESF9hljt6IlzN1hAv0uijryFbSJ0OpDXcQ0ftx17OoHfaMeoWhyGw==
X-Received: by 2002:adf:f507:: with SMTP id q7mr7035805wro.7.1632922978594;
 Wed, 29 Sep 2021 06:42:58 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id c14sm2220354wrd.50.2021.09.29.06.42.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Sep 2021 06:42:57 -0700 (PDT)
Message-ID: <6d180a5b-8b52-e7c1-4483-1a7972427e1e@amsat.org>
Date: Wed, 29 Sep 2021 15:42:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] target/sh4: Use lookup_symbol in sh4_tr_disas_log
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210929130316.121330-1-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20210929130316.121330-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-3.03,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, ysato@users.sourceforge.jp
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/29/21 15:03, Richard Henderson wrote:
> The correct thing to do has been present but commented
> out since the initial commit of the sh4 translator.
> 
> Fixes: fdf9b3e831e
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/sh4/translate.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

