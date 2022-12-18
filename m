Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09FDD6504E8
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Dec 2022 23:03:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p71jf-0002Fd-Gj; Sun, 18 Dec 2022 17:02:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p71jX-0002Db-6C
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 17:02:16 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p71jV-0002If-8k
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 17:02:10 -0500
Received: by mail-ej1-x62a.google.com with SMTP id fc4so17492149ejc.12
 for <qemu-devel@nongnu.org>; Sun, 18 Dec 2022 14:02:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AwuUJphPfzGirMpg0vkXKtFl/wer5bqA4pE6cNb30/s=;
 b=fEfFm7c0kMU6OgUCGWFdQSRmdeHzHVKZObIvEUYVm03YNrdVBnSiueXlhKi2anSj8u
 rRKEgB2kkZwXkXPbvddLejcpzlmbC1rfrEYzD/OVivKzrCIoH1kCFekm4Ei+9YbCeVCe
 HPJEvhivXOt1vecdvmbE5Y5qZD70/m2x57relyI43F65H9Jk7xTtkVgGnYJIR+aZgIfp
 wb2Jd6s4joRoB2p0IEVUEzS7NuFXzXQW3VQ8ZU3pL9Pbm/HBknyg7EWtGjsdn6aQwbDr
 Dynjqja4L/ApgxKE/S0qvu7L4jBnuGkP6CallY74nWA7teY1M1ElqM/nirRKMsRDF8YF
 bUaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AwuUJphPfzGirMpg0vkXKtFl/wer5bqA4pE6cNb30/s=;
 b=shI2d21ZdkcL2rXbqLDGKfQND0YPfkO6h/Ah9FuCVcU+QP3CNJV9zMidDF6XeiG78l
 Did0Wn2bQC9l8V3qIQaUhJczxNUDaRnn7164MGXfKRXpl9/v9BGyZ0NShiJestKzT82x
 H8jlGvItxU6Ksh5dHyU3so0xUYKedrOagg0L8/RIHheEmjSDcl++cHWGch4zLYsbMg8+
 p9Lw5g46BbLpH2BV8Vza5MaR/xCH2jzFDqg2lO9xb9LTzOJbTMLtxAZfKZon2tiwjrun
 y7rhboJjqBjh1lBtKnfTaCHR0is3Z73dHLHNo7FDViolDSoflhV5nYd6IsLmjc6UJgQS
 lp4Q==
X-Gm-Message-State: ANoB5plGe+irdQTgNIPc6O/7PHwnYpJPMBc6EXhBQgZegTC/dYyoWjTl
 LTRpcDqCpXxsOCgIDCs5qrRv/w==
X-Google-Smtp-Source: AA0mqf5Slkxs4xZpVNKOwD41BTRpdl746LyJvOB2EvVNdbT7VQhR3Yf8G4WqxDA6Vd1c2R/Pk2DhcQ==
X-Received: by 2002:a17:906:4e9a:b0:7c0:b292:e56b with SMTP id
 v26-20020a1709064e9a00b007c0b292e56bmr31782308eju.68.1671400926313; 
 Sun, 18 Dec 2022 14:02:06 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 l18-20020a1709063d3200b007ec2c8d2f40sm3038785ejf.161.2022.12.18.14.02.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Dec 2022 14:02:06 -0800 (PST)
Message-ID: <d5616b84-f9b4-3f53-1011-4df670c3ed7c@linaro.org>
Date: Sun, 18 Dec 2022 23:02:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH v2 7/7] docs/system/arm: Update Allwinner with TWI (I2C)
Content-Language: en-US
To: Strahinja Jankovic <strahinjapjankovic@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: Beniamino Galvani <b.galvani@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
References: <20221218211918.3592-1-strahinja.p.jankovic@gmail.com>
 <20221218211918.3592-8-strahinja.p.jankovic@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221218211918.3592-8-strahinja.p.jankovic@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 WEIRD_QUOTING=0.001 autolearn=ham autolearn_force=no
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

On 18/12/22 22:19, Strahinja Jankovic wrote:
> TWI (I2C) is supported so docs are updated for Cubieboard and
> Orangepi-PC board.
> 
> Signed-off-by: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
> ---
>   docs/system/arm/cubieboard.rst | 1 +
>   docs/system/arm/orangepi.rst   | 1 +
>   2 files changed, 2 insertions(+)
> 
> diff --git a/docs/system/arm/cubieboard.rst b/docs/system/arm/cubieboard.rst
> index 344ff8cef9..8d485f5435 100644
> --- a/docs/system/arm/cubieboard.rst
> +++ b/docs/system/arm/cubieboard.rst
> @@ -14,3 +14,4 @@ Emulated devices:
>   - SDHCI
>   - USB controller
>   - SATA controller
> +- TWI (I2C) controller
> diff --git a/docs/system/arm/orangepi.rst b/docs/system/arm/orangepi.rst
> index 83c7445197..e5973600a1 100644
> --- a/docs/system/arm/orangepi.rst
> +++ b/docs/system/arm/orangepi.rst
> @@ -25,6 +25,7 @@ The Orange Pi PC machine supports the following devices:
>    * Clock Control Unit
>    * System Control module
>    * Security Identifier device
> + * TWI (I2C)
>   
>   Limitations
>   """""""""""

Squash to patch #3 "hw/i2c: Allwinner TWI/I2C Emulation"?

