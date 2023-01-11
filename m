Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA487665FB3
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 16:51:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFdNa-0001dL-U7; Wed, 11 Jan 2023 10:51:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFdNY-0001cr-QM
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 10:51:04 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFdNX-0007em-68
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 10:51:04 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 j16-20020a05600c1c1000b003d9ef8c274bso8637799wms.0
 for <qemu-devel@nongnu.org>; Wed, 11 Jan 2023 07:51:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=R3iA34dvhp3jSn6xOk1OrVv4JsY4jECUMYwtaI617JY=;
 b=BA6Ajnl4lubQmRgTHbwKEA55nCvZcZXi6GaMSSWkBJ6zy7q8N4Z0OS3u4O50C+YKKM
 GUxK7I6u+ZG67HpRXDsiTVTZtu4kopAGsZkl7LS/usMtGnoXVyHEvsXS0pDLm3lyaCYH
 vvs990JozLLG2BrRH7LNG9AGOIn1ClOVlOd6HpsCoFgS1V5nOQDG8rJ/sVK1UZsmKV1g
 dtZrZ5hF1ZXH12YbldPBbLp/trQnwcFXf407+FFuYoLLlONAlrZbm6D9K4gKOC5Zgx2p
 m6v7yga2UrjjESQ613+oECz4v/8WoNozsYt+bjFkm4Fue2A/+9/0MdZSH6biKkSr1jWq
 WdEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=R3iA34dvhp3jSn6xOk1OrVv4JsY4jECUMYwtaI617JY=;
 b=Xl6P3TFB60AvWCtrovUz49ojaGA47hPUL2SCnOfMzFE0scfYFDTmoXx4ah+uV7ltfP
 A7+VbSEb1ArLPv11iZNA5TlisUyGDXQDJCPucEJKItZREwpP/A4Gad+MvGJqVAKs8+Zr
 zFEjWeWcaXEkN43fNtAXLf8poSgz8GiwpO6Bd+aymONae4F3yv4ApRkLEpsQb9BQ0OgQ
 ZlizgPQL6OWfIBrhlS9SpvvGb3CMSxqsNs5dP+kN08hO6l5hGlTDKMcAU+bUlGUNbDXF
 9zTHFwvsOZyWkQw3o/td8Aebs097BlTLznr3fqAg9ZHz9R9qa6W3Jxd6DQWYn0ANYKIp
 zwig==
X-Gm-Message-State: AFqh2koY/7Q+ig7gxYkIsS6+Hjr0OWz05EGJA3O+yBfjoFk8aVYc0k8L
 Dzhtb7daXpf6VNx9S2n5WoHF1g==
X-Google-Smtp-Source: AMrXdXuDxvzy9Al6M0dy6Q7S/XEf1yAhQPvVTaNir95bisIa7Iw7HzzjCvKU/9Owjpi5nW1cYT4jiQ==
X-Received: by 2002:a05:600c:34d0:b0:3d6:b691:b80d with SMTP id
 d16-20020a05600c34d000b003d6b691b80dmr52063697wmq.21.1673452261563; 
 Wed, 11 Jan 2023 07:51:01 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 n9-20020a05600c4f8900b003d96b8e9bcasm25836972wmq.32.2023.01.11.07.51.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jan 2023 07:51:01 -0800 (PST)
Message-ID: <47139b1a-e515-e6dd-86c4-c874afa07353@linaro.org>
Date: Wed, 11 Jan 2023 16:50:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 8/8] hw/cxl/mailbox: Use new UUID network order define for
 cel_uuid
Content-Language: en-US
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>, qemu-devel@nongnu.org,
 Michael Tsirkin <mst@redhat.com>
Cc: Ben Widawsky <bwidawsk@kernel.org>, linux-cxl@vger.kernel.org,
 linuxarm@huawei.com, Ira Weiny <ira.weiny@intel.com>,
 Gregory Price <gourry.memverge@gmail.com>
References: <20230111142440.24771-1-Jonathan.Cameron@huawei.com>
 <20230111142440.24771-9-Jonathan.Cameron@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230111142440.24771-9-Jonathan.Cameron@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/1/23 15:24, Jonathan Cameron via wrote:
> From: Ira Weiny <ira.weiny@intel.com>
> 
> The cel_uuid was programatically generated previously because there was
> no static initializer for network order UUIDs.
> 
> Use the new network order initializer for cel_uuid.  Adjust
> cxl_initialize_mailbox() because it can't fail now.
> 
> Update specification reference.
> 
> Signed-off-by: Ira Weiny <ira.weiny@intel.com>
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> ---
>   hw/cxl/cxl-device-utils.c   |  2 +-
>   hw/cxl/cxl-mailbox-utils.c  | 13 ++++++-------
>   include/hw/cxl/cxl_device.h |  2 +-
>   3 files changed, 8 insertions(+), 9 deletions(-)
> 
> diff --git a/hw/cxl/cxl-device-utils.c b/hw/cxl/cxl-device-utils.c
> index 83ce7a8270..4c5e88aaf5 100644
> --- a/hw/cxl/cxl-device-utils.c
> +++ b/hw/cxl/cxl-device-utils.c
> @@ -267,5 +267,5 @@ void cxl_device_register_init_common(CXLDeviceState *cxl_dstate)
>       cxl_device_cap_init(cxl_dstate, MEMORY_DEVICE, 0x4000);
>       memdev_reg_init_common(cxl_dstate);
>   
> -    assert(cxl_initialize_mailbox(cxl_dstate) == 0);
> +    cxl_initialize_mailbox(cxl_dstate);
>   }
> diff --git a/hw/cxl/cxl-mailbox-utils.c b/hw/cxl/cxl-mailbox-utils.c
> index 942de73bbc..7ed344a754 100644
> --- a/hw/cxl/cxl-mailbox-utils.c
> +++ b/hw/cxl/cxl-mailbox-utils.c
> @@ -192,7 +192,11 @@ static ret_code cmd_timestamp_set(struct cxl_cmd *cmd,
>       return CXL_MBOX_SUCCESS;
>   }
>   
> -static QemuUUID cel_uuid;
> +/* CXL 3.0 8.2.9.5.2.1 Command Effects Log (CEL) */
> +static QemuUUID cel_uuid = {

static const.

Otherwise:

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> +        .data = UUID(0x0da9c0b5, 0xbf41, 0x4b78, 0x8f, 0x79,
> +                     0x96, 0xb1, 0x62, 0x3b, 0x3f, 0x17)
> +};
>   
>   /* 8.2.9.4.1 */
>   static ret_code cmd_logs_get_supported(struct cxl_cmd *cmd,
> @@ -457,11 +461,8 @@ void cxl_process_mailbox(CXLDeviceState *cxl_dstate)
>                        DOORBELL, 0);
>   }

