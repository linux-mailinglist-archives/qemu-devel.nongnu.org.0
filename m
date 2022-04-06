Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E1E4F60AC
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 15:53:07 +0200 (CEST)
Received: from localhost ([::1]:42718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nc65q-0007V1-Fd
	for lists+qemu-devel@lfdr.de; Wed, 06 Apr 2022 09:53:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nc644-0005Rq-T8
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 09:51:16 -0400
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f]:46608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nc643-0003au-8X
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 09:51:16 -0400
Received: by mail-qv1-xf2f.google.com with SMTP id kk12so2223242qvb.13
 for <qemu-devel@nongnu.org>; Wed, 06 Apr 2022 06:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=/ClRovqhWFUDMMN2830oVGY9eSLbwTn4rmtw4G9Gq6c=;
 b=oKeSDLebzVkrXlDRFP/Q8XD3NNutAt3qDgoyKOy57G/K9mhrQTmvYMzK0+2UmNY4xv
 QeG28D1XvyUUTR2aDS+24HFyGTzHan2lcfnzYfQiV5Lf2/oN9KHlfcDn/A/kROylZZRK
 NUKTHk7IVmLMgyBFe6miunXcz3rGLmJVeMu3TW34VLisecfvjApGdfY1U2QZ2F+gFaTU
 2pGFHvEsG4O2Q7kYz1h/Nz6OwwQP7WgHGx7ZsS0HPm6GujlY3Ult60qqQTLMpPII2PiB
 sFDzV3gfi9znSshd+Zt1MCh37sSnUc5/Qpt0EmxwHcDEDDAZG4e3BVb1EUzum1aDYTMk
 3M+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/ClRovqhWFUDMMN2830oVGY9eSLbwTn4rmtw4G9Gq6c=;
 b=FayI2+ow+ijMP+/fFIT9bzB/XPFx5iovf03hUHePiZs3JFp+2h2HaGh3J3DEn+pZmL
 5a0udvp9c/DrRU7npz6Y0vpmY1BeyAO/nIpkmSE4enx8mCsYIZhu3xfNxBgLOLbc+X7X
 hbefIBLcmbGuu+1pXByXvSva6pWsXGdZLmtVR+7vhd4owlcDnX/2jz1WXgZiwG4v4uUf
 TESCR5A4uZPwwDE2ASyJNJ3hbGac80lf9Jn/5wGA6TghQqGBlWxHPCqU/C1mDMP9/V2K
 KSCEablRA3BF9wTRhCOGxcskQN9LxvqGBLPruIgYwj2myJuyjcb+Jg0yQhtl3/TAv6Uz
 t67A==
X-Gm-Message-State: AOAM531gjZrvbFSIavlijAodd41eAsxn680bLDZV/WtQX5IqgUXdPbJa
 1M4hjL9Ahs5cqQpGQvrMDH1/Vg==
X-Google-Smtp-Source: ABdhPJyyvwalvl6PZuvyXGFN74ns/bQdBt5ZftnY5/Bf62lFAxlY8aIDOoZQqPZ3ldouRkrUa5XAIA==
X-Received: by 2002:a05:6214:e6d:b0:441:734e:8eae with SMTP id
 jz13-20020a0562140e6d00b00441734e8eaemr7301445qvb.30.1649253074368; 
 Wed, 06 Apr 2022 06:51:14 -0700 (PDT)
Received: from [10.10.117.62] (fixed-187-188-190-73.totalplay.net.
 [187.188.190.73]) by smtp.gmail.com with ESMTPSA id
 188-20020a3709c5000000b0067b147584c2sm9779868qkj.102.2022.04.06.06.51.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Apr 2022 06:51:13 -0700 (PDT)
Message-ID: <71415f4b-0eb1-edfd-7f6d-346589c83e2c@linaro.org>
Date: Wed, 6 Apr 2022 08:51:10 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH for-7.1 09/18] hw/arm/exynos4210: Drop ext_gic_irq[] from
 Exynos4210Irq struct
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220404154658.565020-1-peter.maydell@linaro.org>
 <20220404154658.565020-10-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220404154658.565020-10-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2f;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Zongyuan Li <zongyuan.li@smartx.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/4/22 10:46, Peter Maydell wrote:
> The only time we use the ext_gic_irq[] array in the Exynos4210Irq
> struct is during realize of the SoC -- we initialize it with the
> input IRQs of the external GIC device, and then connect those to
> outputs of other devices further on in realize (including in the
> exynos4210_init_board_irqs() function).  Now that the ext_gic object
> is easily accessible as s->ext_gic we can make the connections
> directly from one device to the other without going via this array.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   include/hw/arm/exynos4210.h |  1 -
>   hw/arm/exynos4210.c         | 12 ++++++------
>   2 files changed, 6 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

