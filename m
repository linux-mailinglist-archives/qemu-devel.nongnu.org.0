Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2FE36901AA
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 09:00:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ1r0-0007k8-0G; Thu, 09 Feb 2023 03:00:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pQ1qu-0007f8-AQ
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 03:00:21 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pQ1qr-0007BG-3v
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 03:00:20 -0500
Received: by mail-wm1-x329.google.com with SMTP id r18so813326wmq.5
 for <qemu-devel@nongnu.org>; Thu, 09 Feb 2023 00:00:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lxrPYIlp1MU6tgnEenBlW/qQepoXWpw1NFTaSp8m2YU=;
 b=TPZdyVaw/XRGOElZAHQAyMvx+KOp9cP15FpRF72nniRvBwankz8yvVKUWzDiqqdB9e
 NiersMB102mhwFNgj5/5AYwXMNWwJr4nh6YQGYWUeRRwwtrcUn6a1Cdqs2tqtpTcQIM3
 iPQa7xiz66MeG75B/dQo+f3e19NkH5m6EDCUDHlC4Lt2UIVza8BzKAuUT9Zsyhj4+Qr7
 nOw1wM7GP2/Wl5/kC1HyC68rSQQhDw1mZgtLdbFNZqDkaKCVXOPvkx2s4n8XgRmk7uN1
 0FhsegWdTWXF3XKkYQGt/ncvq2jE/z2n1TcwGA4eQ2BOS1PZTugJjsIWgjG816isR4l6
 nxTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lxrPYIlp1MU6tgnEenBlW/qQepoXWpw1NFTaSp8m2YU=;
 b=wR3t2uMFwh3EpSqsH1tGMXmF/xkAknFG+rGzPcEoH0MY30BncCHAfZkQeW+cxmx+jg
 oc5VVXVU8OhodK+GFo2FffK5dODi2uuy879edw+gzylMuLw7jctPw/KxgX99WiJH58XZ
 KQ7TZLlc2CBAwGI7q4PVaiXH+vdGZU7wf4WVguor7Nnh5M1VXGZdTJfrdYd8VSpKsJ2t
 T8ZDiv0dnpULi/TcvEyOkHORkUhgVUnJwJeRxhPvmjBzuXNlig7QafxldWghrJYYRO61
 QBsrWwSsCpDUDZREnlHGO7nXHLBz6FbGsxEK4vJ9gZHsQ1O8vdQkfVBY8WxfKaOklDUd
 NWIA==
X-Gm-Message-State: AO0yUKULVWbh0xrqEml8rKx+hykmTzBTVQyvCFPBNnVnzgw6vzwyqnE1
 K9vA8V5yKGnPS6HR/QqcEQt3I67ex/4Q2+KX
X-Google-Smtp-Source: AK7set9tW1Ewh6BgEbbh5oWbergq52mQiBPOYyGT1Mx8sSw6+gV5vM4RE0sWvT2+RDt9oHUuvYUcmg==
X-Received: by 2002:a05:600c:331a:b0:3df:eeaa:816d with SMTP id
 q26-20020a05600c331a00b003dfeeaa816dmr3503378wmp.28.1675929615505; 
 Thu, 09 Feb 2023 00:00:15 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 e1-20020a05600c4e4100b003dc49e0132asm4249911wmq.1.2023.02.09.00.00.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Feb 2023 00:00:14 -0800 (PST)
Message-ID: <f1d5840f-5ead-a2b1-29f4-33360c00610f@linaro.org>
Date: Thu, 9 Feb 2023 09:00:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH v2 3/4] hw/gpio: add PCA9536 i2c gpio expander
Content-Language: en-US
To: Titus Rwantare <titusr@google.com>, minyard@acm.org, eddie.dong@intel.com
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, joel@jms.id.au,
 Hao Wu <wuhaotsh@google.com>
References: <20230208224339.270589-1-titusr@google.com>
 <20230208224339.270589-4-titusr@google.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230208224339.270589-4-titusr@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.146,
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

On 8/2/23 23:43, Titus Rwantare wrote:
> This device has the same register layout as the pca9538, but 4 fewer
> gpio pins. This commit lowers the number of pins initialised, and reuses
> the pca9538 logic.
> 
> Reviewed-by: Hao Wu <wuhaotsh@google.com>
> Signed-off-by: Titus Rwantare <titusr@google.com>
> ---
>   hw/gpio/pca_i2c_gpio.c         | 18 ++++++++++++++++++
>   include/hw/gpio/pca_i2c_gpio.h |  2 ++
>   2 files changed, 20 insertions(+)


> +static void pca9536_gpio_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +    I2CSlaveClass *k = I2C_SLAVE_CLASS(klass);
> +    PCAGPIOClass *pc = PCA_I2C_GPIO_CLASS(klass);
> +
> +    dc->desc = "PCA9536 4-bit I/O expander";
> +    pc->num_pins = PCA9536_NUM_PINS;
> +
> +    k->recv = pca9538_recv;
> +    k->send = pca9538_send;

Can we rename as pca953x_recv() / pca953x_send() in previous patch?

Otherwise,
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

