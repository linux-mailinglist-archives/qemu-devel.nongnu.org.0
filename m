Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14023579286
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 07:35:27 +0200 (CEST)
Received: from localhost ([::1]:60942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDftF-0000Oj-HA
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 01:35:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oDfq5-0007Lg-Hv
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 01:32:09 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:41749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oDfq3-0005rQ-M2
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 01:32:09 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 g4-20020a17090a290400b001f1f2b7379dso1379898pjd.0
 for <qemu-devel@nongnu.org>; Mon, 18 Jul 2022 22:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:in-reply-to:content-transfer-encoding;
 bh=X8IWXkt9z8U8RUwilprDI30oIV/xeYxIMJWZ5husQCU=;
 b=xovs/DVBFZDmeJdy0qpNO8br1cqeugoIrBCSjEPubvBm18X6gLCMBU/F2Cno8wkpg+
 KNZbTQtgvHerhmICn1JNWX51tIp1nqHc0oYuJkD9E2JQeSLMSMMILDjG8SkWD2jqM3e2
 /2Ys6kUSFDOOKiwVJbzokwaLClrTOh8TInAdEtHECI6JS5FFjel2qTZb72D2x0DftsKQ
 JToOrakid9tU2d1OJH3MkpzarrUoCx6LO8QmDVsnnrxPb485BAdS8jPIyB7OTQ4Qi9ra
 9zcVJ/NHc0Fr+gRPdODU6qSd+xmhAFMTm1ko2lR/2aaVgdwJIa8T4SCyqYzI+9kN+zfa
 fCEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=X8IWXkt9z8U8RUwilprDI30oIV/xeYxIMJWZ5husQCU=;
 b=ko9Ep4o78ap6VI3g5mXxzmqJnDal6L9tYV1kqva+JsqtTlKQe7z+IJ/T+NHbQ8z/2D
 e8tlnUoiS+m32BJL2eX4CndEYjCNZNrplL5X+EWxG7Y/cCaTilLI7bCUKzFWR3exZ56y
 INX6QewT2a4BAcjRj8cRjlUghvHWU0g/DXlMAlwzECfP7vL116TWnOt3lc/NE9d9e6iK
 mwSTYoK4VB86lbsvNQtgG2qkMf3XnAwtCHNwbvJQBTzlUDyC7ilID/mRN9bOqi3J33t9
 B14O9FFQpFvyy3JAcXuxoAeWNEG6wTktsecFIuAILb2WSj0H7j0mlzujk2XvEHRiSLnZ
 jNuA==
X-Gm-Message-State: AJIora9Ir5YApA/7jSb17HxkQw/eYNINpgl4W+MuLbnbPH03ePCUhw6E
 bh6ilMW46orJauKP58/cJ1S4j/pfMo9udafN
X-Google-Smtp-Source: AGRyM1vJa+L+r5HGyUaUWCMYqgKrsPbvRRI7UHsgzs9GOqHGpf6sWGx9tP1aP9/qMUQg2WPHeKLc6A==
X-Received: by 2002:a17:902:7b85:b0:16d:1189:f9 with SMTP id
 w5-20020a1709027b8500b0016d118900f9mr137303pll.119.1658208725359; 
 Mon, 18 Jul 2022 22:32:05 -0700 (PDT)
Received: from [192.168.113.227] ([123.231.102.160])
 by smtp.gmail.com with ESMTPSA id
 lp2-20020a17090b4a8200b001e87bd6f6c2sm12844667pjb.50.2022.07.18.22.32.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Jul 2022 22:32:04 -0700 (PDT)
Message-ID: <a253e8bf-df8c-b90c-3eb2-e2fa88d3b189@linaro.org>
Date: Tue, 19 Jul 2022 11:01:56 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] tests/docker/dockerfiles: Add
 debian-loongarch-cross.docker
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org
References: <20220704070824.965429-1-richard.henderson@linaro.org>
In-Reply-To: <20220704070824.965429-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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

On 7/4/22 12:38, Richard Henderson wrote:
> Use the pre-packaged toolchain provided by Loongson via github.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   configure                                     |  5 ++++
>   tests/docker/Makefile.include                 |  2 ++
>   .../dockerfiles/debian-loongarch-cross.docker | 25 +++++++++++++++++++
>   3 files changed, 32 insertions(+)
>   create mode 100644 tests/docker/dockerfiles/debian-loongarch-cross.docker

Queued, with the change to the smaller gcc image suggested by Song Gao.


r~

