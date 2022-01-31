Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF3A4A3E92
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 09:27:33 +0100 (CET)
Received: from localhost ([::1]:39558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nES28-0007Kt-E0
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 03:27:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nERiT-0004tr-LX
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 03:07:13 -0500
Received: from [2607:f8b0:4864:20::1029] (port=35659
 helo=mail-pj1-x1029.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nERiO-0003sb-4U
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 03:07:10 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 z14-20020a17090ab10e00b001b6175d4040so11845486pjq.0
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 00:07:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=11vXh06DaPqB1I/9NZYi7RmaGjHGevUylv7Gwci0JdM=;
 b=ZXmV26+ebPEMxPNu9XJcjJXormLaJBLNzzsjk7UnFe1vAi0Ex5Sfcq6VNbPHgTBY6j
 jIfpzp7BKM62zd24LLJPbKNJTiTUv4wggSL5zT8nwaXmb2Po/sPDVdRbyYE5hwm+LVL3
 EHnGP0dbwkWcgpZIzbQywYI1itb9T8v4FCoS7j4KieJj3HHdPwD5vsJyNM8u9GMCe6Ci
 B2zL1vyaBGWpRx3QoxDckfyXFpo0J4bKz938mX0MxB/zoAp92KCGgwngddJlumVpcpPg
 szo5nEa6QTxk1LulOyT46SKaYvcGZuOoTi5/s2Ok+aMiQAejaRnO6thJxntjs7uMVRq/
 5G1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=11vXh06DaPqB1I/9NZYi7RmaGjHGevUylv7Gwci0JdM=;
 b=cWj1ritj+niBHTBUVXh3EycLXOUHFejPuKepVjAzQPM+hALZ7hporRlI7Vng2hhAf3
 Lna7W2UPkMxFNy6I+qR/j7FzhSK695TPDfpAWJ50RkmurpIgnEigiJP4lnhHLwi+fVDC
 XSJ9Y/UNysug3TjFgJla8AY6f3ls1JXtfq+4pIjvLBw0XQKgraznjoXRTvo5yr2bW9jv
 fS4mcrHPYGRHwsFEDkrYpRXstxH7QUlE1OlQoUtlvaKJBipMo4/68dSzvcao2tKQP/qR
 P7/HOG6USfVcC3LR2ZzPWKLHofHLHbxxcDU4s+Q/ncNK6hQQLQ66MLALarXnt+gJtqjG
 BF/g==
X-Gm-Message-State: AOAM531eJvZl6L9N7MXRx2x3zNVxFIxlB/4cEIYL32NOaUkEd1K1vpBB
 35rj6kHfSu/1gB9gmJIotUzvTQ==
X-Google-Smtp-Source: ABdhPJxJXa5TKM2/Ddhumm58E59XwEjGEk8DPwtoNx7zifQLBXUvN5w0QiqlOLXrO7Mibyd0rGAXNw==
X-Received: by 2002:a17:902:ea86:: with SMTP id
 x6mr19780527plb.69.1643616425276; 
 Mon, 31 Jan 2022 00:07:05 -0800 (PST)
Received: from [192.168.15.130] ([60.231.85.5])
 by smtp.gmail.com with ESMTPSA id m11sm27409779pgb.15.2022.01.31.00.06.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Jan 2022 00:07:04 -0800 (PST)
Message-ID: <68831239-736d-f8d9-6f29-c0de72b3a15e@linaro.org>
Date: Mon, 31 Jan 2022 19:06:54 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 13/16] hw/arm/boot: Don't write secondary boot stub if
 using PSCI
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220127154639.2090164-1-peter.maydell@linaro.org>
 <20220127154639.2090164-14-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220127154639.2090164-14-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1029
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
> If we're using PSCI emulation to start secondary CPUs, there is no
> point in writing the "secondary boot" stub code, because it will
> never be used -- secondary CPUs start powered-off, and when powered
> on are set to begin execution at the address specified by the guest's
> power-on PSCI call, not at the stub.
> 
> Move the call to the hook that writes the secondary boot stub code so
> that we can do it only if we're starting a Linux kernel and not using
> PSCI.
> 
> (None of the users of the hook care about the ordering of its call
> relative to anything else: they only use it to write a rom blob to
> guest memory.)
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   include/hw/arm/boot.h |  3 +++
>   hw/arm/boot.c         | 35 ++++++++++++++++++++++++-----------
>   2 files changed, 27 insertions(+), 11 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

