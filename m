Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 554C460DE1B
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 11:32:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onciX-0006MS-Kg; Wed, 26 Oct 2022 05:28:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1onciV-0006Kr-86
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 05:28:55 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1onciQ-0005vY-DB
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 05:28:54 -0400
Received: by mail-wr1-x42d.google.com with SMTP id bp11so24761483wrb.9
 for <qemu-devel@nongnu.org>; Wed, 26 Oct 2022 02:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=znWmNC7ul93utvQ4iKvLR5S3PUyWayLBWviS/gxEWVo=;
 b=bvZy32xOaVye/xlHS00Otv7DDTDb2LLlSBzvepQHOTIYlSdstDdPeqTfEyQJZYpIWS
 Aq+NS63jR8XMhkh3BLEt+R8Z2CBMDESBotvIe3EGAYJBwy1ec3RtB+V2sk8n5vb8NTjU
 og0j7cx7OKSNCFl3zC1+jSXm05Jv5ewTAie5r5Qds6WF1zUtyum7FQigjpRx3EY220bE
 tswWdH/ZYiSI2MQJcNQ6t1YQArpFsjmVliRnYhHrN6saDhqLzw81Zp17EHanBnbvpdGn
 07RUF3tGpf+2pWtYagVXoAYiQPrB2QsqeNzvBBWN4y9QSNo4lIKrWV8Kd18yAihC0vES
 +zQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=znWmNC7ul93utvQ4iKvLR5S3PUyWayLBWviS/gxEWVo=;
 b=QKlI4RSnPPbZUiBIBXgb3hSGyaZ7s6PW7grEjH8hRRZBwE3khwb2VxsxpZu9QoTHlR
 8rqQ5u3BKSKC17L76NP/VJl+EGqC7clF6rMSfFoiG5QHQ0+JgBJprW+/FObnc2n84rj3
 MSPE6Ri4qn8MTFrzyrnpExD0RMnOi6ybvd8OrCpL49jZTCnHiioAC1ONklJodcSRLgNH
 UtVp8lV6gaNdB5tT8iu/Ny7UV52LhjGIanCbfJipMF6qlIi6Kzqvs32JE4j6ClmWzhds
 oCLYAcILL/fSS39b5SCCwtYXrNAn6Ox5Fs8ghMshXSEYjVDfMFpBlt77VWmEWjR28wk2
 Xs7g==
X-Gm-Message-State: ACrzQf2gwAzSSwzuAKdZ3HY5ZoY5i0lB4MGH3tWhN88YsQjvDkJ8M3zO
 wB7HQdJgsn5e130lKwsAW7QOew==
X-Google-Smtp-Source: AMsMyM71zBUgcIH4qoRbBqowV2WdFKKy7GxLvn9mSxHEhAemnFMX28B3Ljn1AHE0GmzSAmK8lZbEpw==
X-Received: by 2002:a5d:64e1:0:b0:22e:762f:7d3f with SMTP id
 g1-20020a5d64e1000000b0022e762f7d3fmr28146313wri.526.1666776528681; 
 Wed, 26 Oct 2022 02:28:48 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 x17-20020adfbb51000000b0023677693532sm5159702wrg.14.2022.10.26.02.28.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Oct 2022 02:28:48 -0700 (PDT)
Message-ID: <4ef52f4b-3582-b2ca-a3c1-2e3f83418cc0@linaro.org>
Date: Wed, 26 Oct 2022 11:28:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [PATCH] aspeed: Add Supermicro X11 SPI machine type
Content-Language: en-US
To: Guenter Roeck <linux@roeck-us.net>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery
 <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20221025165109.1226001-1-linux@roeck-us.net>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221025165109.1226001-1-linux@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 25/10/22 18:51, Guenter Roeck wrote:
> supermicrox11-bmc is configured with ast2400-a1 SoC. This does not match
> the Supermicro documentation for X11 BMCs, and it does not match the
> devicetree file in the Linux kernel.
> 
> As it turns out, some Supermicro X11 motherboards use AST2400 SoCs,
> while others use AST2500.
> 
> Introduce new machine type supermicrox11-spi-bmc with AST2500 SoC
> to match the devicetree description in the Linux kernel. Hardware
> configuration details for this machine type are guesswork and taken
> from defaults as well as from the Linux kernel devicetree file.
> 
> The new machine type was tested with aspeed-bmc-supermicro-x11spi.dts
> from the Linux kernel and with Linux versions 6.0.3 and 6.1-rc2.
> Linux booted successfully from initrd and from both SPI interfaces.
> Ethernet interfaces were confirmed to be operational.
> 
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>   hw/arm/aspeed.c | 33 +++++++++++++++++++++++++++++++++
>   1 file changed, 33 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


