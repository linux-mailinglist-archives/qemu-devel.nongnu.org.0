Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C6B614C45
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Nov 2022 15:10:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oprQr-0002CO-Lv; Tue, 01 Nov 2022 09:35:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oprQa-0002AX-RU
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 09:35:42 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oprQY-00033R-8Q
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 09:35:40 -0400
Received: by mail-wr1-x42f.google.com with SMTP id g12so20114763wrs.10
 for <qemu-devel@nongnu.org>; Tue, 01 Nov 2022 06:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4OSsQFgkYsTZ2wURJTSQUOo/aXALW8hDhNoVVTfxtSA=;
 b=hv0LCf0PjzNuR23r6Gt/YXK2AttCI6he6cP7SKzZIYqq9ok1bWSTUxJEw3W25reXct
 MEljjBw6tkrDWZr6YVTwz8nvsrWBb0bHc7EdKBWwS0QOQmAS3nDT+CjI+i1oauDwKOi1
 RhjRizXWrP+I2dEIuaBG3Ew3oL7EwPMK+qClz4F0wAIser+OtxDD77ypx2yrOo6kAN2P
 Sgc2gDT12ygnh+HH4padySXuzvzbj+ODy94ipJi8pTye2ZaB4WhuRG/b7bv38tMwZQpr
 D1U7ot3kiNYLnHrKsUDMZRyFZPAJ06Mk1H0Jp+yDtim79GFx5H8ShHwo6oPfBlFYt/O6
 5w3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4OSsQFgkYsTZ2wURJTSQUOo/aXALW8hDhNoVVTfxtSA=;
 b=GXowCCnDe4fp+CY++TpoQW0ku50c7fGEuB3vGH6Av7H2Bn1ozNKmeVB2+9spzwTHxN
 DZJK/J5dJyCTrqN2UIz6Z6XuEywa8uGLkDtmVVtDto4u1xp54ZAoLUMRUMvTv6GpyveC
 odyhfKNb6GBZWhcfEOSH3wT363A03x50Iw6k9y+/p343QRweY3NGdaQiCaZGij8VKvfK
 hLcB5aCjr/rv1gdS+ddhjHsFtHFzC67D8sbU4epAUfIMkILixcpiShL3eFFrjVaUfo4S
 TUyVbot+Lwe+mQCoOqpXIrMF+oETFv2vPJv9BgvWq03xlUfDba7b5FFRzAdsXu5jRjiN
 kHhQ==
X-Gm-Message-State: ACrzQf05uiMSPYjMpSj7xhriLCIHfGwwyFOYweI0f+yiwjnMkoQUKIyJ
 lHJs0FEsRWMzKOHl5j5xOKIkgA==
X-Google-Smtp-Source: AMsMyM7JIpHLT0jp3nMEpBpXcLAdLUSeZo4NM1yBDxQw0yoKNECsAcYkaSQdoaa6hLOUV7LzvXe2hQ==
X-Received: by 2002:adf:e307:0:b0:236:ba3e:69c9 with SMTP id
 b7-20020adfe307000000b00236ba3e69c9mr9764165wrj.491.1667309736231; 
 Tue, 01 Nov 2022 06:35:36 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 c192-20020a1c35c9000000b003c6f3f6675bsm10701623wma.26.2022.11.01.06.35.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Nov 2022 06:35:35 -0700 (PDT)
Message-ID: <42dfb5eb-8b50-e13b-0d36-2dc484ad6662@linaro.org>
Date: Tue, 1 Nov 2022 14:35:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [PATCH v7 01/17] hw/vfio/pci: Ensure MSI and MSI-X do not overlap
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, qemu-arm@nongnu.org,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, John Snow <jsnow@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, Jason Wang
 <jasowang@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Paul Burton <paulburton@kernel.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Yan Vugenfirer <yan@daynix.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>
References: <20221101005859.4198-1-akihiko.odaki@daynix.com>
 <20221101005859.4198-2-akihiko.odaki@daynix.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221101005859.4198-2-akihiko.odaki@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

On 1/11/22 01:58, Akihiko Odaki wrote:
> pci_add_capability() checks whether capabilities overlap, and notifies
> its caller so that it can properly handle the case. However, in the
> most cases, the capabilities actually never overlap, and the interface
> incurred extra error handling code, which is often incorrect or
> suboptimal. For such cases, pci_add_capability() can simply abort the
> execution if the capabilities actually overlap since it should be a
> programming error.
> 
> This change handles the other cases: hw/vfio/pci depends on the check to
> decide MSI and MSI-X capabilities overlap with another. As they are
> quite an exceptional and hw/vfio/pci knows much about PCI capabilities,
> adding code specific to the cases to hw/vfio/pci still results in less
> code than having error handling code everywhere in total.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>   hw/pci/pci.c         | 32 ++++++++++++++++++++------------
>   hw/vfio/pci.c        | 15 ++++++++++++++-
>   include/hw/pci/pci.h |  3 +++
>   3 files changed, 37 insertions(+), 13 deletions(-)
> 
> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> index 2f450f6a72..33f5406706 100644
> --- a/hw/pci/pci.c
> +++ b/hw/pci/pci.c
> @@ -2512,6 +2512,23 @@ static void pci_del_option_rom(PCIDevice *pdev)
>       pdev->has_rom = false;
>   }
>   
> +void pci_check_capability_overlap(PCIDevice *pdev, uint8_t cap_id,
> +                                  uint8_t offset, uint8_t size, Error **errp)
> +{
> +    int i;
> +
> +    for (i = offset; i < offset + size; i++) {
> +        if (pdev->used[i]) {
> +            error_setg(errp,
> +                       "%s:%02x:%02x.%x PCI capability %x at offset %x overlaps existing capability %x at offset %x",
> +                       pci_root_bus_path(pdev), pci_dev_bus_num(pdev),
> +                       PCI_SLOT(pdev->devfn), PCI_FUNC(pdev->devfn),
> +                       cap_id, offset, pci_find_capability_at_offset(pdev, i), i);
> +            return;

Per the Error API ("qapi/error.h" or 
https://gitlab.com/qemu-project/qemu/-/commit/e3fe3988d7851cac) this 
function should return a boolean (true on success and false on error).

> +        }
> +    }
> +}

