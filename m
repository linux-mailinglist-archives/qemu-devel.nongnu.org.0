Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D296A8001
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 11:37:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXgIH-0001LT-Pv; Thu, 02 Mar 2023 05:36:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pXgIG-0001FS-0b
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 05:36:12 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pXgID-00029x-7O
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 05:36:11 -0500
Received: by mail-wr1-x42d.google.com with SMTP id t15so16027150wrz.7
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 02:36:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677753367;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=r3zMtAQynGLBqlZ7qBAMcZt+6syP1vaSxp4lxKp5Ay0=;
 b=oinwO23r/3gppFKBT4Rl7J8qGaGQ5q8dz22lgR7iCpDSY3YU6aghPNEQxrFXKrsMbu
 Z0CEQEl/wev3fb7aeex2fj6W2U/3UKCNNLCua3QQivw7O3yqcePxV50Fgjv4ulMp4Zq/
 JKP+py8EKeO43hUa4sYbO+Ay714rCrYB6LTYj+mI+jXywjRzgiJo5b62tpY09+OW3+VT
 b3/vfF4YySs9g6ajrOtqEyAOowYrsoMmoWFgnCzvSi91EO7WVNHFYv765xddEan0Iz0Q
 qfaPJr4PASl+hSmBnb+SAuFPhoEw4hhVt1VJXadCnfbOoOxysQcbQA+z6UKynEEYMfog
 rKHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677753367;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=r3zMtAQynGLBqlZ7qBAMcZt+6syP1vaSxp4lxKp5Ay0=;
 b=OroOLf8LVv0x2npjMELujOkN120bl5kKA7g6fYwm6+MDstLZ9G6gsCcQxZbs6ctBFj
 llOz3FTeebeyPaFfp0nNJB1hDxvfSLU2oqup83rMr1DJ3Cq1UN9KsTedHyIvVMBdeDcx
 GfnQx3FjZrLInPpwVV2WP3Sil9ERDAu79NDPLRnWh5cK7NhIgjQmmCmAAJkeKE5XFY90
 C+2haV8C6kZ5p9YQ4/p00bdJJNN/NyFxPzElnm9Xw1YBLhWZ8E6yZnmIiwa6HrvpnT58
 LeJXZJ9ZYCWkpt5Dql+x8MqhITVPFpb+1Ljt6OeO5fGwQ9xXWmD7BjIVOt+EBvPrO5m0
 EnLA==
X-Gm-Message-State: AO0yUKWJbsXFaraD4iqw3kssicPEj1OLIDRTiQeIdK7yJ/AWVJfKrBWN
 Z2ZoMs/ST+t4P1c1ALNpBVtlWw==
X-Google-Smtp-Source: AK7set8u+oQJG2affiIVfZolaAcbxAAjb2DPK/ZnypTUALTj7pK7hZRoKtSXaKk4PVfCuU7FRHtrzA==
X-Received: by 2002:a5d:4d08:0:b0:2ca:8da1:db96 with SMTP id
 z8-20020a5d4d08000000b002ca8da1db96mr6934405wrt.50.1677753367381; 
 Thu, 02 Mar 2023 02:36:07 -0800 (PST)
Received: from [192.168.74.175] (89.red-88-28-21.dynamicip.rima-tde.net.
 [88.28.21.89]) by smtp.gmail.com with ESMTPSA id
 w9-20020a05600c474900b003eb5a0873e0sm2676982wmo.39.2023.03.02.02.36.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Mar 2023 02:36:06 -0800 (PST)
Message-ID: <7c440fc8-d37b-b933-ed5f-02baf7136bca@linaro.org>
Date: Thu, 2 Mar 2023 11:36:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 2/6] block: convert blk_exp_close_all_type() to
 AIO_WAIT_WHILE_UNLOCKED()
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Cc: Fam Zheng <fam@euphon.net>, qemu-block@nongnu.org,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>
References: <20230301205801.2453491-1-stefanha@redhat.com>
 <20230301205801.2453491-3-stefanha@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230301205801.2453491-3-stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 1/3/23 21:57, Stefan Hajnoczi wrote:
> There is no change in behavior. Switch to AIO_WAIT_WHILE_UNLOCKED()
> instead of AIO_WAIT_WHILE() to document that this code has already been
> audited and converted. The AioContext argument is already NULL so
> aio_context_release() is never called anyway.

Shouldn't we assert(ctx && unlock) in AIO_WAIT_WHILE_INTERNAL() then?

> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   block/export/export.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/block/export/export.c b/block/export/export.c
> index 28a91c9c42..e3fee60611 100644
> --- a/block/export/export.c
> +++ b/block/export/export.c
> @@ -306,7 +306,7 @@ void blk_exp_close_all_type(BlockExportType type)
>           blk_exp_request_shutdown(exp);
>       }
>   
> -    AIO_WAIT_WHILE(NULL, blk_exp_has_type(type));
> +    AIO_WAIT_WHILE_UNLOCKED(NULL, blk_exp_has_type(type));
>   }
>   
>   void blk_exp_close_all(void)


