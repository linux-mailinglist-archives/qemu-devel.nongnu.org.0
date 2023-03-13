Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE8D6B7010
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 08:23:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbcVP-00067r-IU; Mon, 13 Mar 2023 03:22:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pbcVN-000675-3g
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 03:22:01 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pbcVL-00061t-5A
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 03:22:00 -0400
Received: by mail-wr1-x42c.google.com with SMTP id g3so10289869wri.6
 for <qemu-devel@nongnu.org>; Mon, 13 Mar 2023 00:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678692116;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xw0WLXPzbaH+sMkBXHGJyji7+1XACs2mGxBQZo5TNlE=;
 b=r8p+igznczjUPibfTpeUvN15k83ULe7bmif6HJZ3dZqCoyVbMqIT7WbuRH6PKiNSYY
 nTxTHZdlU3s2qDPKFXPTLu0sh7532B+bL0pLRsVCvxlzd9KMqaQePQM0gJIPoIta7H67
 CYSeGvjpCVMHgumiuniKMDxM2xdQ1/5gi+qadjIvh+c7RSL0GZYu8vC30Szvq12XTwOQ
 l7TttkWJBbyldxaMp5Job8GOAtvKpVHCrsVl+KACaN6VN8n5sRnhu24o5F+/EBlg35zj
 Poyd8x66qJfKObnLYxhsLK3TXLwpuO76b2hVX0l+C6VD/VDmkLEALsDGhw+ZFpLqqpAJ
 Q1cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678692116;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xw0WLXPzbaH+sMkBXHGJyji7+1XACs2mGxBQZo5TNlE=;
 b=lhHGiz4SddE3q1PUGJU8IEENThS8ujUmm6X+xEfVmBa+Him7jUUkq+mVUtVtQeb/Go
 R0Mdtxvl+9I8MqN3e5rvr5Zc+dcS5L8vaME5ImsJK1O34Qo7ZCeNF1J80ZfCn5RczJyX
 qwdAj1kXKmVsRrorFkOqlJRhes9GGZuy/IWBkFDulSv8QyzNcoi54lzqcSjm0jAVavdv
 VCL0ScdPkiosT3/BCA01GIkOzB5X1fmpkF4OYqkv3G6aVIlKapTa5E9di1eLHkIKfIr0
 JUMUnyZnyQJsK48HeiO8IktLoEPx5QB20nr8tC1s2R48mHo0nece6V9E+hnzq/gptKcu
 mNpQ==
X-Gm-Message-State: AO0yUKULrk49fXWt6Ho/4oUtUQvNja5Lly13fS3XadpakGth9/DVBgkH
 EZDcuBc0asdKZDRUw5mUUNakXg==
X-Google-Smtp-Source: AK7set8aD2Pq3i1vc0pcvozHm+/pLCmxLnuleIEnxrikLD4CfYvDWaYdOj8DuJ2bUW2b0zEALHwacA==
X-Received: by 2002:a5d:4c8d:0:b0:2cf:3396:9126 with SMTP id
 z13-20020a5d4c8d000000b002cf33969126mr1575114wrs.10.1678692116515; 
 Mon, 13 Mar 2023 00:21:56 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 p15-20020a056000018f00b002cfe3f842c8sm769824wrx.56.2023.03.13.00.21.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Mar 2023 00:21:56 -0700 (PDT)
Message-ID: <000f7c97-d61c-2c9d-eec6-cbe68de10c9d@linaro.org>
Date: Mon, 13 Mar 2023 08:21:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2] include/block: fixup typos
Content-Language: en-US
To: Wilfred Mallawa <wilfred.mallawa@opensource.wdc.com>,
 stefanha@redhat.com, fam@euphon.net, kwolf@redhat.com, hreitz@redhat.com,
 qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Wilfred Mallawa <wilfred.mallawa@wdc.com>
References: <20230313003744.55476-1-wilfred.mallawa@opensource.wdc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230313003744.55476-1-wilfred.mallawa@opensource.wdc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 13/3/23 01:37, Wilfred Mallawa wrote:
> From: Wilfred Mallawa <wilfred.mallawa@wdc.com>
> 
> Fixup a few minor typos
> 
> Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
> ---
> 
>   v2:
>   - Fixup typo in commit msg.
> 
>   include/block/aio-wait.h         | 2 +-
>   include/block/block_int-common.h | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/include/block/aio-wait.h b/include/block/aio-wait.h
> index da13357bb8..6e43e3b7bb 100644
> --- a/include/block/aio-wait.h
> +++ b/include/block/aio-wait.h
> @@ -63,7 +63,7 @@ extern AioWait global_aio_wait;
>    * @ctx: the aio context, or NULL if multiple aio contexts (for which the
>    *       caller does not hold a lock) are involved in the polling condition.
>    * @cond: wait while this conditional expression is true
> - * @unlock: whether to unlock and then lock again @ctx. This apples

:)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> + * @unlock: whether to unlock and then lock again @ctx. This applies
>    * only when waiting for another AioContext from the main loop.
>    * Otherwise it's ignored.

