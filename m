Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE53665FAD
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 16:50:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFdLd-0000l8-1x; Wed, 11 Jan 2023 10:49:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFdLW-0000kW-Lf
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 10:49:03 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFdLU-0007Bn-Ii
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 10:48:58 -0500
Received: by mail-wr1-x431.google.com with SMTP id t5so11071993wrq.1
 for <qemu-devel@nongnu.org>; Wed, 11 Jan 2023 07:48:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=N6QKQsMkd0tEzgfZl/1XKTPgvNm9zkksrUQSlImCLXg=;
 b=Fzac++Kx11k3sVfG3PP4A2YubERKKhD6cVA5T3EGQ4Me3m15e0PKO04TSjNYc/pOF3
 JjKHLgv8HScQ9pQXkRgkELifLjgNG4MwUCyUvIxIf3xoO/S3E8O9Kesi844Qodm7TkNm
 QCD1624Nts5b6F7nA5qyEe2hKIHvAaIJcxdmX9dPyFzCQYWiUmr9S4pSystuJdGg4G7n
 xRreZzvxqT37a3mdLgfYK/uw1cFB+o+3YKYRISaWxTFznKZID9sLIw9BHDsjNa5ICE4G
 PM4lHmM2OJHyqiPVootINMPHWsrlxXqksVVMt8jIKm1lVkchS87ScyZwTWiIuhDWRO9R
 lmxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=N6QKQsMkd0tEzgfZl/1XKTPgvNm9zkksrUQSlImCLXg=;
 b=JQHCIiSX9O24mtqLzaaqMKJjRqTx2bu/aasY5X2jmoHG270xAQ6zmJqlUoe4F9JKmZ
 rI67f8/WkMdUOLJ6yWdiEIRB5VjGqs3TYMorAtSNGVveu6MWjyDBmSWMltygKtGWyQ6G
 4wQcFXlxtUBaIed49FsDg33LybfDZ2PCiqVXQLTecryDFLSz50OkkK6696u31AXX1e8O
 tmouMpB3ItIjmateAwkgOPPVxpm1QhnvJ0ytohSjDPzb18pYf9f3T3EY+nY4zFLba4Mh
 hwve3L86UZKta6ElqYI5BGDdpBrK0LJrlCQ1KzAvMK9Gx4HtQzI6vJd7CplRmi5D2RDf
 ogzw==
X-Gm-Message-State: AFqh2krvx1EGm1+NYg+y8pPimbYNVXFUcUtw8cVZpitLIQyt1g9JxOUX
 nuS5tUZ+eIFqRTpM91vcpY5n9w==
X-Google-Smtp-Source: AMrXdXuUsrvPHS5p4nQEPjja3xK1fq5S69K0Uvyh4ERcaI7Ry2EfcujmHfoPGbmbj2NkhmB2FFbjZw==
X-Received: by 2002:adf:ee8f:0:b0:2bc:7f8e:40ba with SMTP id
 b15-20020adfee8f000000b002bc7f8e40bamr6930505wro.54.1673452134359; 
 Wed, 11 Jan 2023 07:48:54 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 l1-20020adfe9c1000000b00289bdda07b7sm13731020wrn.92.2023.01.11.07.48.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jan 2023 07:48:53 -0800 (PST)
Message-ID: <cde5dfbf-da7d-7a1b-94b4-bf4bac7ca8ba@linaro.org>
Date: Wed, 11 Jan 2023 16:48:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 4/8] hw/cxl: Add CXL_CAPACITY_MULTIPLIER definition
Content-Language: en-US
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>, qemu-devel@nongnu.org,
 Michael Tsirkin <mst@redhat.com>
Cc: Ben Widawsky <bwidawsk@kernel.org>, linux-cxl@vger.kernel.org,
 linuxarm@huawei.com, Ira Weiny <ira.weiny@intel.com>,
 Gregory Price <gourry.memverge@gmail.com>
References: <20230111142440.24771-1-Jonathan.Cameron@huawei.com>
 <20230111142440.24771-5-Jonathan.Cameron@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230111142440.24771-5-Jonathan.Cameron@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
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
> From: Gregory Price <gourry.memverge@gmail.com>
> 
> Remove usage of magic numbers when accessing capacity fields and replace
> with CXL_CAPACITY_MULTIPLIER, matching the kernel definition.
> 
> Signed-off-by: Gregory Price <gregory.price@memverge.com>
> Reviewed-by: Davidlohr Bueso <dave@stgolabs.net>
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> ---
>   hw/cxl/cxl-mailbox-utils.c | 14 ++++++++------
>   1 file changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/cxl/cxl-mailbox-utils.c b/hw/cxl/cxl-mailbox-utils.c
> index bc1bb18844..942de73bbc 100644
> --- a/hw/cxl/cxl-mailbox-utils.c
> +++ b/hw/cxl/cxl-mailbox-utils.c
> @@ -14,6 +14,8 @@
>   #include "qemu/log.h"
>   #include "qemu/uuid.h"
>   
> +#define CXL_CAPACITY_MULTIPLIER   0x10000000 /* SZ_256M */

Do you mind changing to the self-documenting (256 * MiB) ?

