Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 384F04C3493
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 19:21:39 +0100 (CET)
Received: from localhost ([::1]:34268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNIkD-0006LL-ST
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 13:21:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nNIiJ-00057l-LR
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 13:19:39 -0500
Received: from [2607:f8b0:4864:20::1036] (port=40928
 helo=mail-pj1-x1036.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nNIiI-0008WJ-36
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 13:19:39 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 em10-20020a17090b014a00b001bc3071f921so6385232pjb.5
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 10:19:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=3IxVseU8l7XDXRxTi9N1V8Pou/lNos7YBlEUolAvfns=;
 b=Fht8bSa4B2VXnHnqa8wOJub4zfZb7EiKg2nf25HByvMbLQfmcH8UJjkAkfW3+IL940
 tEfvSW84BV8z4VNjILNHLamJBPQMwjEoXFMM496JloS7lyXyaxRnLBXEZ8s6qKqcrNc1
 mhnsFsOe1RybgWHfX6UKwHIoSjPovMWoMJ2ftsFDiGQKOQs4E2Qw/X5/ZomPtpBPCUVh
 /gxa8uX322pkrOQHS83jt4UQs6h9pWJS/AOA2n1RqOHz+3nXSFGPkpe782jExCI5L8ZY
 +gNtwnOPaEEpmTxnM7dDWmhvhHB+RpNmZc40rwXjm29Hl/7T8TbYg4IRfTWja3JKqB8l
 wfDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3IxVseU8l7XDXRxTi9N1V8Pou/lNos7YBlEUolAvfns=;
 b=EOFHCuMOnOAEvXNMYssO6gwhG6VY2p+yMl8YwHC/e+4qBAXj1jTWNzRsutQo8lYUym
 x6p+DBReFR9l64lzKcl3VdckJnFg+bzHEvJYSxoDcvcyUW3wRTEluNNw5/3/yvB0s/4W
 i68+i44v+1e2qFjzcKi5Yuh7aeOgKBGbctnxnKbedDR6zK/eynPy15+/s+DHkKfPOyxx
 IHv8t57oSxi9p7ecdeserO4jmuVwlidZjfLivECxFq2CQAjiHpGatYkCOpgR1eaxVNRq
 KgRxdrZHn9q8HWdEFxp26kD4L/a0UzBpUlD+mQtDF4ywsDcdC/wbq7kGKjM1DVAxFXR0
 O+pg==
X-Gm-Message-State: AOAM533/vSV+7MK3/4Z3v93PdJ6ieCkJIbkqgi67DB9OvbQYbbZEXU87
 wLIaUI9/2cawi68gApq91gmpxg==
X-Google-Smtp-Source: ABdhPJzcdsoRauC8hfxgYD5h9dJ8v7dd4qQUn1hKEpRA0y4WF7AAirJRGWXE7OmVFx1Vor+TxRY0XA==
X-Received: by 2002:a17:902:e5c3:b0:14f:a4ff:34b8 with SMTP id
 u3-20020a170902e5c300b0014fa4ff34b8mr3751617plf.24.1645726775954; 
 Thu, 24 Feb 2022 10:19:35 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 s9-20020a056a00194900b004e1583f88a2sm189577pfk.0.2022.02.24.10.19.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Feb 2022 10:19:35 -0800 (PST)
Message-ID: <f820b1ca-53de-08bc-e886-e1be157b8da5@linaro.org>
Date: Thu, 24 Feb 2022 08:19:32 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] target/arm: Report KVM's actual PSCI version to guest in
 dtb
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220224134655.1207865-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220224134655.1207865-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1036
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Akihiko Odaki <akihiko.odaki@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/24/22 03:46, Peter Maydell wrote:
> When we're using KVM, the PSCI implementation is provided by the
> kernel, but QEMU has to tell the guest about it via the device tree.
> Currently we look at the KVM_CAP_ARM_PSCI_0_2 capability to determine
> if the kernel is providing at least PSCI 0.2, but if the kernel
> provides a newer version than that we will still only tell the guest
> it has PSCI 0.2.  (This is fairly harmless; it just means the guest
> won't use newer parts of the PSCI API.)
> 
> The kernel exposes the specific PSCI version it is implementing via
> the ONE_REG API; use this to report in the dtb that the PSCI
> implementation is 1.0-compatible if appropriate.  (The device tree
> binding currently only distinguishes "pre-0.2", "0.2-compatible" and
> "1.0-compatible".)
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
> Based-on:20220213035753.34577-1-akihiko.odaki@gmail.com
> ("[PATCH v2] target/arm: Support PSCI 1.1 and SMCCC 1.0")
> though note that to compile on arm hosts you'll need the
> bugfix to that patch from which I describe in a reply to it.
> 
>   target/arm/kvm-consts.h |  1 +
>   hw/arm/boot.c           |  5 ++---
>   target/arm/kvm64.c      | 12 ++++++++++++
>   3 files changed, 15 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

