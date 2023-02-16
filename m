Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03AFB698FCA
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 10:28:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSaYH-0008Qh-3y; Thu, 16 Feb 2023 04:27:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSaYF-0008QD-TR
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 04:27:40 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSaYD-0007gw-47
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 04:27:39 -0500
Received: by mail-wr1-x42c.google.com with SMTP id l2so1246311wry.0
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 01:27:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=J+sGyp8deuLpD1Y2Uxb6QwW81ICmNmKhGqhPAzq3KEY=;
 b=YsEqjYasZfyb+X+vzmglICDpRPN0cE9tizq+5Hv0hgx6lfUD3d/Lva+oNyXCxtOQDb
 iHL9a3C/F3rehtkAP6dkqQIQYmdPUILK36Nx8Yg64bCfelPx8jD+mBQ7iZ9T/M12Hivs
 N23JdzbqeiChCUawwnlNZIn64dcSwZSDv6NDoS7whOxI4GcineieAnUEUVWHqCByDywq
 pYAWgzTl4feCeHal0hVno6K2boew4D0fKnJzv7t21nuGgFkEEH5jmYnwlA35QyELYja4
 38JvnDIUnjacNCEqtw6njdzS/JzGJFRRd628Ct6Gcahd5xiI6FzmGoVQ5BVQGLfF1nua
 mKuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=J+sGyp8deuLpD1Y2Uxb6QwW81ICmNmKhGqhPAzq3KEY=;
 b=F3D8SW78s6ggs7xPmbY9Zlt897koinHES/WXzfZPXEVoAQNRfCEsNV2HRNRb48ALn1
 pFSlE+U6T6y4sXDKK1PKY3wnynS7wAr+o6EalEF0Q2eYRBDN3WJg6RR9RvMkck493uiq
 Gr8nedpQsZUgPIuHso+ilWjsprM6Ra1YorsasWcIwGETsLazdvgTBcHcPiZDpWULWPvI
 IpeGyGM9rX08Uvh/6T38GaCrVxYXCw+kBWsGAtSKsN5uqJt3ltMCNNS1GKjtWB1MI+Ed
 V9cjtDvuPDAzwufjxy219xCNzt94qrV7buQUZ+u74VwI+UjoI8LqQdjOekwde5tF38EQ
 HcaA==
X-Gm-Message-State: AO0yUKUQbeI5lYnxMpyQ4TokA0ht8OShMXuEi45FdgJoIit6uVwoxVzx
 dWjP3hWN86SxyNKqLyH0kL8yIeSHfvMvfHbP
X-Google-Smtp-Source: AK7set8z/+W07fTLTasjNfIShD+A/HPuCIZ7iVOdzRIpdXJiUUXEpTXBlmxPZ+PdmTDkTXsE5eIhqA==
X-Received: by 2002:a5d:4b06:0:b0:2c5:4b93:ee44 with SMTP id
 v6-20020a5d4b06000000b002c54b93ee44mr3862754wrq.60.1676539655240; 
 Thu, 16 Feb 2023 01:27:35 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 f12-20020a5d4dcc000000b002c556a4f1casm1010978wru.42.2023.02.16.01.27.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Feb 2023 01:27:34 -0800 (PST)
Message-ID: <4175aa01-03fc-94b9-dd7d-3e0268a92b55@linaro.org>
Date: Thu, 16 Feb 2023 10:27:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH] hw/arm: Add missing ZynqMP ZCU102 -> USB_DWC3 Kconfig
 dependency
Content-Language: en-US
To: qemu-devel@nongnu.org, Francisco Iglesias <francisco.iglesias@amd.com>
Cc: qemu-arm@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>
References: <20230216092327.2203-1-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230216092327.2203-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Oops I meant this as subject:
"hw/arm: Add missing XLNX_ZYNQMP_ARM -> USB_DWC3 Kconfig dependency"

On 16/2/23 10:23, Philippe Mathieu-Daudé wrote:
> Since commit acc0b8b05a when running the ZynqMP ZCU102 board with
> a QEMU configured using --without-default-devices, we get:
> 
>    $ qemu-system-aarch64 -M xlnx-zcu102
>    qemu-system-aarch64: missing object type 'usb_dwc3'
>    Abort trap: 6
> 
> Fix by adding the missing Kconfig dependency.
> 
> Fixes: acc0b8b05a ("hw/arm/xlnx-zynqmp: Connect ZynqMP's USB controllers")
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/arm/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 2d157de9b8..b5aed4aff5 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -389,6 +389,7 @@ config XLNX_ZYNQMP_ARM
>       select XLNX_CSU_DMA
>       select XLNX_ZYNQMP
>       select XLNX_ZDMA
> +    select USB_DWC3
>   
>   config XLNX_VERSAL
>       bool


