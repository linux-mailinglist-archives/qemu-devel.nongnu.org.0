Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D17940A65E
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 08:00:07 +0200 (CEST)
Received: from localhost ([::1]:55634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ1UE-0002Xt-AE
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 02:00:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mQ1Sg-0001Zk-Fl
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 01:58:30 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:46709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mQ1Sb-0001fO-JJ
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 01:58:30 -0400
Received: by mail-wr1-x42c.google.com with SMTP id x6so18192979wrv.13
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 22:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=AV3tThFhxNRH+14MNsWi+Q2i8ah1Om3STQDcfmDYBhM=;
 b=Wpp3HP6YukJRovvBLW25D3JzXWrcIclGTq02WpdOFvoGe51efBODey5Oon3sXpF1M1
 jr+iwmysf07qrUhtNk3bZghgiK5hjsUbP1Szf8sJxbwUUIAGmC82J8jZ47bGysmWprG7
 E1SDMRuAe4bEhqbpVSqXzW64eU5kCnG28ZVEIgYdE+il49jkec9U+yu+lMQB44XS182N
 F9FcLT6x6IO/cknm+osTiYdulvnMnFYfQMAm0VVnyQhHlGKN0DQT9wf0ct/r0V9ScuKL
 miyb8WUcgV6IqwRSeDPJoqdrCOLsM8mTgqGa+AQ5/0BNqGWdY/Ft0UnfbqW/en3bfhyO
 bOyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AV3tThFhxNRH+14MNsWi+Q2i8ah1Om3STQDcfmDYBhM=;
 b=lx824FXConIU9yoi6i3zNyWji8eUJQvplObnkSSwLH2qHD6+z+Qb6IaeCEzUr4v0/E
 EktjpelQShOZhPJ0uvDdSggmqZDKWx4C6yDifrqK0HKzEQmkrcHlyGHPt9bPG9hAVkP3
 LtIE+Xl21iCiPrtG+NbAghSJSYwfycoWALLpL7RMNBuI39nir9MuopbguH9zm+ssyMnE
 urQPYMeaDvcibqFY5PP/MQ6y1E8F9IPO8AyKDX1OdIjCxcP4lUUK88KGZW90y9NcoCGm
 uxS5OaqYhmh1e3VueLBLMN7E0Jdo/RdFofriETG8uAdb78qYtkSJmiXV6qMdA/rCd+o9
 r73w==
X-Gm-Message-State: AOAM530lDhjaYB6t2iAORHKpb2aoNUfKqDwxBqE9pgpf4hgtaX+/1r/d
 oWX8tijddQZ7XtZu6iNOABQ=
X-Google-Smtp-Source: ABdhPJwgYJPeUC22jw18SBUPz7YMrT1TC9t6zF0h9yq/GYRRzRpqV+062Kjz4LAmYOq5F123I/CcMA==
X-Received: by 2002:a5d:64ee:: with SMTP id g14mr6564943wri.80.1631599103722; 
 Mon, 13 Sep 2021 22:58:23 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id v8sm7731396wrt.12.2021.09.13.22.58.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Sep 2021 22:58:23 -0700 (PDT)
Subject: Re: [PULL 35/44] tcg/arm: Remove fallback definition of __ARM_ARCH
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210914001456.793490-1-richard.henderson@linaro.org>
 <20210914001456.793490-36-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <e8287d9e-3f41-fe19-12ca-5017fddac167@amsat.org>
Date: Tue, 14 Sep 2021 07:58:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210914001456.793490-36-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.969,
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/14/21 2:14 AM, Richard Henderson wrote:
> GCC since 4.8 provides the definition and we now require 7.5.

FYI we might go back to 7.4 (this doesn't affect this patch):
https://gitlab.com/qemu-project/qemu/-/issues/614

> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/arm/tcg-target.h | 19 -------------------
>  1 file changed, 19 deletions(-)

