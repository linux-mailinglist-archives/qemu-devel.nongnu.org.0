Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8A6400726
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 22:54:32 +0200 (CEST)
Received: from localhost ([::1]:56756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMGCl-0004rg-6T
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 16:54:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mMG0N-00066e-0d; Fri, 03 Sep 2021 16:41:43 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:43834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mMG0K-0001ST-NQ; Fri, 03 Sep 2021 16:41:42 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 o39-20020a05600c512700b002e74638b567so333777wms.2; 
 Fri, 03 Sep 2021 13:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=doCKbJWhlrrMGDlcyWL1a0gHB6bULxvhpl3nHIntN0s=;
 b=jw+x5uSS2UzfLCLYW3Exq8I8rABFhBM6+iO1h83Qoox1799MDjQvMBltUzgCDvS/rE
 7Se7YrZ1z0Gegaz02N7ad1nGNNUspR4tAQJsbrLThaMwU9BizXgnVp7LL/b072Wfao14
 j5wWXb8H3ldnG83nBoQ65TdlYqW+9BMXnhwvlw7oEmQryhbd3axVWlp8GPcUcD67JoSS
 /73PdJWmBBKFu/1J8zE+DplhwO67DyALMDaBzRaD5ZsSA5X2JWZ0yj9xy29+ENsYEjEA
 adEgJ1GpiHV7ntVomOcKrAKSHxJ8NlCCR4Q2RQ7ljCth3jvkC5d8Er3E3Nfdkt6qvsQI
 L99g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=doCKbJWhlrrMGDlcyWL1a0gHB6bULxvhpl3nHIntN0s=;
 b=WiXfZzy8p094WbfaPLSymeD3JdQl7YLZ610v7nrLJRQdBcX55Zlk2hZLd3F208oeHF
 kgOsA5jz/y14LHvN1xsfqZMGVaIruyeQyHbonocWJvVdTbhYr6GmqHHz4/mnYsy+ay4j
 aG1+Sm37aHmc2gwrHs03qcQein9W5moXEBFmjBMCImltGpkvfuzPzLTAPJojXfPMFtuM
 ylSndGflxMXvanjdsl/wvgyKGppBMZtNzAU1zr9IgHCEXgqbq9tp3DfWQnHabynMQ+uZ
 jLx9+pY2+UTPXwHWh2kvDfMM8ct0HrC2n9rMrPEgEezLVm0qCXWFfGjctDwKpuakCvKP
 s1tg==
X-Gm-Message-State: AOAM531ysKh1gVKQEXE41o8MaCBzH4u9oyhlwXjepANR/m7rnSk8t0mF
 tKo/SPuSju7+7ckBIOhdavE=
X-Google-Smtp-Source: ABdhPJwGd9lrwz8T/zZag5Cdq3Lc6G5wtoibGSe0krTNjAg8FHB5ckw1Uqp+BkSnesJXRNHaahJcGw==
X-Received: by 2002:a1c:7712:: with SMTP id t18mr498911wmi.161.1630701699197; 
 Fri, 03 Sep 2021 13:41:39 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id n1sm255704wrp.49.2021.09.03.13.41.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 13:41:38 -0700 (PDT)
Subject: Re: [PULL 00/14] aspeed queue
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210903194108.131403-1-clg@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <beab1f50-d8f5-b3d3-5612-15e5f74eb961@amsat.org>
Date: Fri, 3 Sep 2021 22:41:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210903194108.131403-1-clg@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.888,
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Peter Delevoryas <pdel@fb.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter,

On 9/3/21 9:40 PM, Cédric Le Goater wrote:
> The following changes since commit 8880cc4362fde4ecdac0b2092318893118206fcf:
> 
>   Merge remote-tracking branch 'remotes/cschoenebeck/tags/pull-9p-20210902' into staging (2021-09-03 08:27:38 +0100)
> 
> are available in the Git repository at:
> 
>   https://github.com/legoater/qemu/ tags/pull-aspeed-20210903
> 
> for you to fetch changes up to 907796622b2a6b945c87641d94e254ac898b96ae:
> 
>   hw/arm/aspeed: Add Fuji machine type (2021-09-03 18:43:16 +0200)
> 
> ----------------------------------------------------------------
> Aspeed patches :
> 
> * MAC enablement fixes (Guenter)
> * Watchdog  and pca9552 fixes (Andrew)
> * GPIO fixes (Joel)
> * AST2600A3 SoC and DPS310 models (Joel)
> * New Fuji BMC machine (Peter)
> 
> ----------------------------------------------------------------

> Peter Delevoryas (3):
>       hw/arm/aspeed: Initialize AST2600 UART clock selection registers
>       hw/arm/aspeed: Allow machine to set UART default
>       hw/arm/aspeed: Add Fuji machine type

I have a pending question with the last patch, do you mind holding
this PR until it is resolved with Cédric and the patch author please?

Thanks,

Phil.

