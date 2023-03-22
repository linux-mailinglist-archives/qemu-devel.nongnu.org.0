Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A61EA6C47BD
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 11:35:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pevnm-0007wo-U2; Wed, 22 Mar 2023 06:34:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pevnj-0007wY-KI
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 06:34:39 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pevnh-0008Ta-Es
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 06:34:38 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 o40-20020a05600c512800b003eddedc47aeso5602446wms.3
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 03:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679481276;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RYkfG22HjGs03l4ehDPCyiQgubtep/FS2RbjbyPAMKU=;
 b=mw1Rk2Evr2Rb822D/JkRjVOtW4/ZadooypbQMLQakBrT5nsjjawNDD7DyVO5uve7py
 hhrmqoE4n6pN4wLLIlOjHkxhDV+ktp3DgIhuQSNxhjIxNhyc+UBzo16/WG7wGeX8cuqW
 QSHzNN3hWcabPdX6zUAbiEqR93zd8HzWAOTLZAy8ZiZ2GTOPfwHLbiKN3S1dCFZL9tIv
 hTbRdp998Y39uJs8ogrP3r5R214m8WyZPjmRcpNdPTqtadEBYNhNceNX5qK3vduVxq/b
 eJYNWmoharT0A8wHFgla7WTlEsreuZTeSe0j2KvQMyVL1LdvejbgubFdM1xn4bf7/O+r
 6mZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679481276;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RYkfG22HjGs03l4ehDPCyiQgubtep/FS2RbjbyPAMKU=;
 b=3XOXvNIChNoo6Hhn2vI7g2bXShalwHv7BN37wfBwN/EHnVlAUq7XkQK5rXcdN9MREi
 LSt0aU74MKZQ0t6hSGS5PU/SzEZ79xbn/xTRmnCBQ/GCBa5UCqhQpzhvaz9LNTAcRlNH
 SwZbaGORG393I5DIkIrVfKkJ5WvdE7ipfUCZnGocMwn6YbhyZnag6B42b9hM11Ee4ihA
 3lENn3fv5OiOmZppTm+yQxktnspTGgJDGa5yO5KvvP+TFjWg1WCJYvWlh87na8dFSQw+
 kud2AknfjYJtIvm+YryNB64QKYHtZqyu4JhpWIYIVYG/J9Qs84/KW5oCDB/0fAydqD3Q
 6XXw==
X-Gm-Message-State: AO0yUKV3dUbaOgvkwoM1boZjllmJpC1LRS4kqKbetGxd5rpxQl9rZkqY
 uW3qiusHiGsduRVTQCYSHc1c5g==
X-Google-Smtp-Source: AK7set/DZnvlMmeRk+0KDqjB7LCGWSlykJixPT378PklHt04EXgENQgDHwcOY8qGnUzaSXMFeyB9rQ==
X-Received: by 2002:a7b:c383:0:b0:3df:eecc:de2b with SMTP id
 s3-20020a7bc383000000b003dfeeccde2bmr4976466wmj.11.1679481275777; 
 Wed, 22 Mar 2023 03:34:35 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 k22-20020a05600c1c9600b003ee6a91b596sm870914wms.29.2023.03.22.03.34.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Mar 2023 03:34:35 -0700 (PDT)
Message-ID: <366919e9-e7ca-28bf-f61a-813634c4a115@linaro.org>
Date: Wed, 22 Mar 2023 11:34:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [RESEND PATCH 1/2] hw/cxl: Fix endian handling for decoder commit.
Content-Language: en-US
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Michael Tsirkin <mst@redhat.com>, qemu-devel@nongnu.org
Cc: linuxarm@huawei.com, Fan Ni <fan.ni@samsung.com>,
 Dave Jiang <dave.jiang@intel.com>, linux-cxl@vger.kernel.org
References: <20230322102731.4219-1-Jonathan.Cameron@huawei.com>
 <20230322102731.4219-2-Jonathan.Cameron@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230322102731.4219-2-Jonathan.Cameron@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
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

On 22/3/23 11:27, Jonathan Cameron via wrote:
> Not a real problem yet as all supported architectures are
> little endian, but continue to tidy these up when touching
> code for other reasons.
> 
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> ---
>   hw/cxl/cxl-component-utils.c | 10 ++++------
>   hw/mem/cxl_type3.c           |  9 ++++++---
>   2 files changed, 10 insertions(+), 9 deletions(-)
> 
> diff --git a/hw/cxl/cxl-component-utils.c b/hw/cxl/cxl-component-utils.c
> index b665d4f565..a3e6cf75cf 100644
> --- a/hw/cxl/cxl-component-utils.c
> +++ b/hw/cxl/cxl-component-utils.c
> @@ -47,14 +47,12 @@ static void dumb_hdm_handler(CXLComponentState *cxl_cstate, hwaddr offset,
>           break;
>       }
>   
> -    memory_region_transaction_begin();
> -    stl_le_p((uint8_t *)cache_mem + offset, value);
>       if (should_commit) {
> -        ARRAY_FIELD_DP32(cache_mem, CXL_HDM_DECODER0_CTRL, COMMIT, 0);
> -        ARRAY_FIELD_DP32(cache_mem, CXL_HDM_DECODER0_CTRL, ERR, 0);
> -        ARRAY_FIELD_DP32(cache_mem, CXL_HDM_DECODER0_CTRL, COMMITTED, 1);
> +        value = FIELD_DP32(value, CXL_HDM_DECODER0_CTRL, COMMIT, 0);
> +        value = FIELD_DP32(value, CXL_HDM_DECODER0_CTRL, ERR, 0);
> +        value = FIELD_DP32(value, CXL_HDM_DECODER0_CTRL, COMMITTED, 1);
>       }
> -    memory_region_transaction_commit();

Indeed the memory_region_transaction guard seems pointless here,
but it is a different change, so should go in a preliminary patch IMHO.

Conditional to this patch being split:
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> +    stl_le_p((uint8_t *)cache_mem + offset, value);
>   }



