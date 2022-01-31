Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3745A4A3E13
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 08:09:58 +0100 (CET)
Received: from localhost ([::1]:48812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEQp3-0003c1-9H
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 02:09:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nEQVQ-0007jD-By
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 01:49:43 -0500
Received: from [2607:f8b0:4864:20::62c] (port=36382
 helo=mail-pl1-x62c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nEQVO-0001hN-L1
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 01:49:39 -0500
Received: by mail-pl1-x62c.google.com with SMTP id b15so11612881plg.3
 for <qemu-devel@nongnu.org>; Sun, 30 Jan 2022 22:49:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=MrK3VQutQi0aYTTF66mxXA/7wBlgGpTqZma6IyC4zPE=;
 b=TohwioRbEQ/bwoRA/uZVlFXVnLX+uafp2Tr9yqtCut5+zEvO3rPHB0Yyp+A3l0r413
 VLPBs++WuvsezLDyJrIi0cS6E4p+6Y+wDfPA/hzm/TqRyysFQvn7Ma08e+p8ig9k4W1Z
 Drig+mHnLwavp/K0O+u23y0nO7fa8Ocw+l19zE2pI3loBV/VLTtduo00U6nHYauIef+f
 BAhyN2sfOQP5kmj1Eyj98Crx2aG0kTV+kxEUI+bfVcGwh5TthaSu7NCq973ZvkZr/oa7
 niqa9NduVi9WVX0LRl2YpX0ygwI+L3p+cIhLaArAH/oHdGuoOGPEXyeUJAD4jmxRttyG
 5s+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=MrK3VQutQi0aYTTF66mxXA/7wBlgGpTqZma6IyC4zPE=;
 b=OqO8GVM972BekkuLqCzC4YE6GDoc1aQq+kVfZyJD2HsxUVZwch1h3KxNsEgDsG+mYB
 xu9P4W3+msKlxY03po+fN7R3YEWhaGY1oj7vaETvmYn0Co/e1oT0jXT3q8gc11s+6F1y
 IcFcYAthELdxrDfjjHIrWaqels8DSsDUaL3njmRgaad5IYOxvkxqZXVwbkyvFjdAe5xV
 yD0xIiLXw9WkQqryAwcIqWBHN5z6TtIFD8ca7Pfw6HfPugKO/LTWo+GuWv5U9RGD5ocH
 bmOa2ONQltdhX8kRwMf3yIT0v6D+1X9hzbQrVpWoZN0XR30xlvIIJjX2QRv+1VxRmD8q
 g+nQ==
X-Gm-Message-State: AOAM531bWEHkfoztl0knvM4Nz0KBQNVh/LQHZRClXzIjadM1MGCG0Dpi
 NRd3VF8YSSLP1epb1Lxw37BS2Q==
X-Google-Smtp-Source: ABdhPJzM331xzObVsnRKtwslcziwodStE2SOLXdwVAHRuek7eqxgMgi/stW+u7fqRMrOAyKVXsTqAw==
X-Received: by 2002:a17:902:8b8a:: with SMTP id
 ay10mr19241010plb.64.1643611776823; 
 Sun, 30 Jan 2022 22:49:36 -0800 (PST)
Received: from [192.168.15.130] ([60.231.85.5])
 by smtp.gmail.com with ESMTPSA id ck21sm9370928pjb.51.2022.01.30.22.49.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Jan 2022 22:49:36 -0800 (PST)
Message-ID: <55bbb5b9-8a1a-aa40-824e-b837f78d73f8@linaro.org>
Date: Mon, 31 Jan 2022 17:49:25 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 06/16] hw/arm/xlnx-zcu102: Don't enable PSCI conduit when
 booting guest in EL3
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220127154639.2090164-1-peter.maydell@linaro.org>
 <20220127154639.2090164-7-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220127154639.2090164-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Rob Herring <robh@kernel.org>,
 Andrew Jeffery <andrew@aj.id.au>, Andre Przywara <andre.przywara@arm.com>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Beniamino Galvani <b.galvani@gmail.com>, Tyrone Ting <kfting@nuvoton.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, Alexander Graf <agraf@csgraf.de>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Andrey Smirnov <andrew.smirnov@gmail.com>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/28/22 02:46, Peter Maydell wrote:
> Change the Xilinx ZynqMP-based board xlnx-zcu102 to use the new
> boot.c functionality to allow us to enable psci-conduit only if
> the guest is being booted in EL1 or EL2, so that if the user runs
> guest EL3 firmware code our PSCI emulation doesn't get in its
> way.
> 
> To do this we stop setting the psci-conduit property on the CPU
> objects in the SoC code, and instead set the psci_conduit field in
> the arm_boot_info struct to tell the common boot loader code that
> we'd like PSCI if the guest is starting at an EL that it makes
> sense with.
> 
> Note that this means that EL3 guest code will have no way
> to power on secondary cores, because we don't model any
> kind of power controller that does that on this SoC.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
> Again, if anybody knows the real-hardware EL3 behaviour for
> CPUs that would be great.
> ---
>   hw/arm/xlnx-zcu102.c |  1 +
>   hw/arm/xlnx-zynqmp.c | 13 ++++++++-----
>   2 files changed, 9 insertions(+), 5 deletions(-)

Acked-by: Richard Henderson <richard.henderson@linaro.org>

r~

