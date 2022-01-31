Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 286C24A3E36
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 08:29:58 +0100 (CET)
Received: from localhost ([::1]:57862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nER8O-0002bt-QS
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 02:29:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nEQWx-0007wy-Pu
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 01:51:23 -0500
Received: from [2607:f8b0:4864:20::42e] (port=42998
 helo=mail-pf1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nEQWu-00022q-Gk
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 01:51:14 -0500
Received: by mail-pf1-x42e.google.com with SMTP id i65so12086767pfc.9
 for <qemu-devel@nongnu.org>; Sun, 30 Jan 2022 22:51:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=dSrEyogKJFhAp12eJufVnFm0WUtS+NDb9vcs/6kLhek=;
 b=tv/x4bat3Z9ANaFQxI7NjzsmRcp38kDt+s09pUo9HknLavP+X9VrPmQtzPniz611JH
 cZP8GwlqpVcpeAg5rD3uF9v8GzfaqcYqFKmcVd4pvs3HYmeNrQKSLdEdUr0KylbFr2su
 eMKqDyGzYA+uMmINCwBzpV56swVaPdsgEnj6cBECD4DDIRtWr4tbIwnNwiG8p9Nh0y37
 qFm+F/Jdk7Tz+kdDkUK8lmxkY17u72WjVtaIei+WCAW8Tq8CtYZxl0lAvMF7fh2JN1Q0
 pHN3T1T7wVxx4uvVIoMQ4MBpI3O9zFsX1YtRJMOHsLrQJQgZyCPSCKN2ic6NYwn2ViU2
 GnbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=dSrEyogKJFhAp12eJufVnFm0WUtS+NDb9vcs/6kLhek=;
 b=mdVEVLmO+w91t+Wyu01JPyDRTF9EiqRHl1s5CgVyBmOohZ5/lQ8wY2Cv5k+5qChbJH
 wqmnx7BHn2TXX3cCpHcgPA2QfotK1vkFgurm+40bdGxWMNRkiRxULJxh78NSvGBwfV0M
 Mjm/XKw72iXpvfjf4zufHr3D9xVK/RggcYrB4QfEHkVtDgt6+18W8zatlqSX1Lg1uqTa
 wEBkWhNezIFVCxJO9fdfYwZMvGVgRA7bgXE/qYF79aZiB+qogg61syT6U5rfUt6zY++3
 sYEFMBnOupcJlaOZkdCfxO7Ch82SSfea2xBfzlyOa9YWHe1rz+FfOQeGv+RfwNO4f/fJ
 lpOQ==
X-Gm-Message-State: AOAM532XBDeiqtnIsog+pspgHUiRs0FjBKCB7sSbV0uyriYapHOywWw8
 h7foFihT5x+2M6JBm0WLjmqwZQ==
X-Google-Smtp-Source: ABdhPJytlN7KIg5rzcdrugRNxvgHxDLeXcpvt5WsstHiMN0pzc09EsB+OarjFIIk54NiNwZbDHiIwg==
X-Received: by 2002:a63:ed17:: with SMTP id d23mr15423300pgi.543.1643611871236; 
 Sun, 30 Jan 2022 22:51:11 -0800 (PST)
Received: from [192.168.15.130] ([60.231.85.5])
 by smtp.gmail.com with ESMTPSA id ot1sm4363525pjb.22.2022.01.30.22.51.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Jan 2022 22:51:10 -0800 (PST)
Message-ID: <dccc1934-cb3a-0f5a-fcd6-bc00442d97f3@linaro.org>
Date: Mon, 31 Jan 2022 17:50:59 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 07/16] hw/arm/versal: Let boot.c handle PSCI enablement
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220127154639.2090164-1-peter.maydell@linaro.org>
 <20220127154639.2090164-8-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220127154639.2090164-8-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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
> Instead of setting the CPU psci-conduit and start-powered-off
> properties in the xlnx-versal-virt board code, set the arm_boot_info
> psci_conduit field so that the boot.c code can do it.
> 
> This will fix a corner case where we were incorrectly enabling PSCI
> emulation when booting guest code into EL3 because it was an ELF file
> passed to -kernel.  (EL3 guest code started via -bios, -pflash, or
> the generic loader was already being run with PSCI emulation
> disabled.)
> 
> Note that EL3 guest code has no way to turn on the secondary CPUs
> because there's no emulated power controller, but this was already
> true for EL3 guest code run via -bios, -pflash, or the generic
> loader.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   include/hw/arm/xlnx-versal.h | 1 -
>   hw/arm/xlnx-versal-virt.c    | 6 ++++--
>   hw/arm/xlnx-versal.c         | 5 +----
>   3 files changed, 5 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

