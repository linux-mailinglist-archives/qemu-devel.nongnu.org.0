Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4346670BD
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 12:18:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFuyI-0001uR-1U; Thu, 12 Jan 2023 05:38:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFuy6-0001rf-T3
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 05:38:01 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFuy5-00035A-Ab
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 05:37:58 -0500
Received: by mail-wm1-x331.google.com with SMTP id g10so12867110wmo.1
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 02:37:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BNjH70h3YMyqRnnpci45rG2ziPjGcBrn9RpOXef1k7s=;
 b=bqQXyZHpvFU1niarM6Kz3HgOx7H1S8ULA6+pHUB9jxvaH6cWR+d9AuSnkEPjQ66VaB
 QpmjjjYub8HJLv8HiT4Hgj3E/UxxMNd1meXYA91O5z0CAwnlsEMvrYdaFNBgP7GxV6mO
 UDNz0S/89bMxZBRRhVFxKue6E02/cCGw9p/ysCvZfE6q6avLPRZJi0eoD8tKWVBgDFn6
 sd07liUFXaHjJsq0PRwTdxtlj6I2PfrYyM107sjfKvl9LQz3YkqxpVYNM2ObiaIKoZ/J
 m1U7KUiRc3tcQNeTMjcHpMccQLqN5GpkNWdAPPfamTYDWpdEtUvd7vzlebaT9B69Btk/
 kVkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BNjH70h3YMyqRnnpci45rG2ziPjGcBrn9RpOXef1k7s=;
 b=KaJzTmcLsT/tAOdHyVKGRktcJa5VaoaHiFs4yP5gYYN+oI/v2P2K3XiYGqWBRCsJvt
 PcNN5++gfGcIrc2NfVaQy2c1ChBO2TUMtA4aZa+B8yFd/zugJPTBaAe24dGstixM5AVS
 T0Wn6oSRYxcnJllMIUzXXQWSPPPEuOGIsYBYb8/XUKE7kvIoVBQEaxnicwkDNIH0yFN/
 kLS7tkehKUs4xPOEfFkd5Ak86I8PtPN7icMYyURTtiSUeYFsa7wsFeQV6f276BKt0X34
 KpSCpmOX2tGWrV0TTpVQkGScKFDyrBdjiNFZ//WXswBwOK3vwJvpc/aC98ANr33HaGkY
 ACYw==
X-Gm-Message-State: AFqh2koTXlU2Via0gabQXdRNgQYCJPAiSredYVxHXHLdsoJgpyeuQShm
 5wQOWxWqGq02k5bZNSq01ZtP1Q==
X-Google-Smtp-Source: AMrXdXt46ViFFh113j3Tm/tOMx1XgaGCQHlPl84IqscgJtG0u7enSG9GrkkakymxVmMwzWrE+3IuOw==
X-Received: by 2002:a05:600c:600a:b0:3d1:ed41:57c0 with SMTP id
 az10-20020a05600c600a00b003d1ed4157c0mr58684652wmb.30.1673519873137; 
 Thu, 12 Jan 2023 02:37:53 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 he5-20020a05600c540500b003d9ed40a512sm17938494wmb.45.2023.01.12.02.37.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jan 2023 02:37:52 -0800 (PST)
Message-ID: <9ef90fdb-1355-36f4-6308-9f19028f7706@linaro.org>
Date: Thu, 12 Jan 2023 11:37:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 4/8] hw/cxl: Add CXL_CAPACITY_MULTIPLIER definition
Content-Language: en-US
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>, qemu-devel@nongnu.org,
 Michael Tsirkin <mst@redhat.com>
Cc: Ben Widawsky <bwidawsk@kernel.org>, linux-cxl@vger.kernel.org,
 linuxarm@huawei.com, Ira Weiny <ira.weiny@intel.com>,
 Gregory Price <gourry.memverge@gmail.com>
References: <20230112102644.27830-1-Jonathan.Cameron@huawei.com>
 <20230112102644.27830-5-Jonathan.Cameron@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230112102644.27830-5-Jonathan.Cameron@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
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

On 12/1/23 11:26, Jonathan Cameron wrote:
> From: Gregory Price <gourry.memverge@gmail.com>
> 
> Remove usage of magic numbers when accessing capacity fields and replace
> with CXL_CAPACITY_MULTIPLIER, matching the kernel definition.
> 
> Signed-off-by: Gregory Price <gregory.price@memverge.com>
> Reviewed-by: Davidlohr Bueso <dave@stgolabs.net>
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> 
> ---
> v2:
> Change to 256 * MiB and include qemu/units.h (Philippe Mathieu-Daudé)
> 
>   hw/cxl/cxl-mailbox-utils.c | 15 +++++++++------
>   1 file changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/cxl/cxl-mailbox-utils.c b/hw/cxl/cxl-mailbox-utils.c
> index bc1bb18844..3f67b665f5 100644
> --- a/hw/cxl/cxl-mailbox-utils.c
> +++ b/hw/cxl/cxl-mailbox-utils.c
> @@ -12,8 +12,11 @@
>   #include "hw/pci/pci.h"
>   #include "qemu/cutils.h"
>   #include "qemu/log.h"
> +#include "qemu/units.h"
>   #include "qemu/uuid.h"
>   
> +#define CXL_CAPACITY_MULTIPLIER   (256 * MiB)

Thanks, appreciated.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


