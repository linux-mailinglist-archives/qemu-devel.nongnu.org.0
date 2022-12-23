Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F3DF654F08
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Dec 2022 11:16:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8f52-000744-B4; Fri, 23 Dec 2022 05:15:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p8f4w-000731-NR
 for qemu-devel@nongnu.org; Fri, 23 Dec 2022 05:15:03 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p8f4u-00080w-GB
 for qemu-devel@nongnu.org; Fri, 23 Dec 2022 05:15:02 -0500
Received: by mail-wr1-x429.google.com with SMTP id h7so4149941wrs.6
 for <qemu-devel@nongnu.org>; Fri, 23 Dec 2022 02:14:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EbeMtNCZy/bX3bND40uscrEnOQyBKIniIlwGsZ8QBiU=;
 b=BcmnArPC73i5rOkYbPixhVoEBeXH2yJbiaABI4eEzXY3aC+a9xpWdS2nHKeGwO8hS4
 TtkagurPM4/WtQ9MO6EeewXQUowLKCQrId7X7A7nh3q5OOi0YliK3pS9QcPzftFcDcCA
 KZ3mkxenhQ+b1o118y6QyrczmE7Vj9RQ2HG8VYPnHVzCJ5PnmGEGRqGxn6NvJXQhyjHv
 1MBQRWIL1ePB2RACNSNvgtrkWG0XP2MOrseGJZ5DypglL8Rz9hLZZBJZ8XuDfBpN6uTV
 d0hjfkGZ6/AfOio/FTdq7adqZmopzi1dU56bjpmCYMdUrWALevWYtyNYPDw5JiEOKzAy
 hrmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EbeMtNCZy/bX3bND40uscrEnOQyBKIniIlwGsZ8QBiU=;
 b=fA1XYwW1jD7a/De57QAEX/hsAY+R+inyKLOJ6dIDnYHSHggj8IX5k4vDx6dn7YBXBD
 3NW1PMnYH6HogUiNj1iZFTUlk1qKHrMVeoWSz7w/bzXQYIzSw0afEOqh/MnB2sgJsB//
 GQ8qAX3+haLh29YTDyq1hEz8pli2ysEO5n7Z0EcA0RIvP/Js9GVhnUDYuoAgEteCD7sJ
 B+VRVUoZDiTOZZT/iV3oXSBsU0j8CQryqCUnaFkZ/eVOiyBuYBMVwkkCwUixdFdUeRTz
 MxtA0GRD1uB2uugye9tEGcVCM6WiKh6h0kYSNo3iKSsRs6YUMcUYseEvK/scnCJ0Zca/
 LEKg==
X-Gm-Message-State: AFqh2kqA7O3x7GoMbb4u5AZKsQDi1F1IJgBFOouYccbBxlijdFgMeNrm
 aKZfs5D0YimhrbVDKCaYoJJl/A==
X-Google-Smtp-Source: AMrXdXtdbE0G0Y/RsHTKGiGs6LQNmD3rMVp2+J3A+9FglTMmElq4vX7BHpHiWYWGWO/Shq67QojauQ==
X-Received: by 2002:adf:ee0d:0:b0:242:7f7f:da15 with SMTP id
 y13-20020adfee0d000000b002427f7fda15mr5135286wrn.68.1671790498077; 
 Fri, 23 Dec 2022 02:14:58 -0800 (PST)
Received: from [192.168.27.175] (160.red-88-28-30.dynamicip.rima-tde.net.
 [88.28.30.160]) by smtp.gmail.com with ESMTPSA id
 m9-20020a056000008900b00225307f43fbsm2721202wrx.44.2022.12.23.02.14.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Dec 2022 02:14:57 -0800 (PST)
Message-ID: <06975360-7efe-ad4b-da65-279c6f0972c1@linaro.org>
Date: Fri, 23 Dec 2022 11:14:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [PATCH 0/2] hw/intc/arm_gicv3: Bump ITT entry size to 16
Content-Language: en-US
To: Alexander Graf <agraf@csgraf.de>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Yanan Wang <wangyanan55@huawei.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Shashi Mallela <shashi.mallela@linaro.org>,
 Eric Auger <eric.auger@redhat.com>, Neil Armstrong <narmstrong@baylibre.com>
References: <20221223085047.94832-1-agraf@csgraf.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221223085047.94832-1-agraf@csgraf.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 23/12/22 09:50, Alexander Graf wrote:
> While trying to make Windows work with GICv3 emulation, I stumbled over
> the fact that it only supports ITT entry sizes that are power of 2 sized.
> 
> While the spec allows arbitrary sizes, in practice hardware will always
> expose power of 2 sizes and so this limitation is not really a problem
> in real world scenarios. However, we only expose a 12 byte ITT entry size
> which makes Windows blue screen on boot.
> 
> The easy way to get around that problem is to bump the size to 16. That
> is a power of 2, basically is what hardware would expose given the amount
> of bits we need per entry and doesn't break any existing scenarios. To
> play it safe, this patch set only bumps them on newer machine types.
> 
> Alexander Graf (2):
>    hw/intc/arm_gicv3: Make ITT entry size configurable
>    hw/intc/arm_gicv3: Bump ITT entry size to 16

Series:
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



