Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA9430EE3C
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 09:21:24 +0100 (CET)
Received: from localhost ([::1]:43998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7ZtD-0008St-6i
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 03:21:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l7ZrW-0007fy-7o; Thu, 04 Feb 2021 03:19:38 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:38618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l7ZrT-0005k8-Od; Thu, 04 Feb 2021 03:19:37 -0500
Received: by mail-ej1-x635.google.com with SMTP id bl23so3812406ejb.5;
 Thu, 04 Feb 2021 00:19:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=kwnQR+RgtC3APJMKE+p+ksbLIrtDcS618dgk7AITehU=;
 b=IcNw/8mWT/7mEM/zxsBLuB2RA4+dbrnDPLORCVR4VaOtK1v0kckOlnriuKdoKyb29o
 deq+6rZQaXAmtjuVnsneSTJrKjopt1+e3DTKw9dgEfjk1y5Vg+VymJTgluv2bY0A6oRe
 8uIhUQXVjMtWBiGpxylngoyK/iO7iziSOYXbbdT5jpz++As+5DbMFlUxxUsF8eaUflPJ
 5/hWRowfUfz/y+uyfcEIuvDVTlf8thWKmitc5ZYt6AVokiDIugU4SsLfHcw4bueuRVf/
 O76Pm1Hajn05YQGFIgLbT51dOqsJ78FqXYcoMIjxxCv33vByCsEQh4vl6u23gNJhKC8K
 gUng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kwnQR+RgtC3APJMKE+p+ksbLIrtDcS618dgk7AITehU=;
 b=On2m3DhNUn5UXkXKY1pbfQ1E5jC8h8YGs3kEN4GCs6PfAjxQzKdf/x0B/iaJlaDq0l
 qfrYq5GeQTqrXuEkTDCEhDJ1egGrg6kjKGVbgGWFBwPLhf9p8h7iRBPDrV2MOQsx2ari
 dylOnGVYYsI11RJRCsOW+8PAH+9lU93xZJkvEjBSEsEZZUxaG7CeH24Kqs/tK2zAwzWT
 7Wg97u8JcDW7psbgXiAoxUq2NpOG40PZcSKYFn9D9ovh/CTUWiEi0o7s0VXCYOxwqJ6N
 0LhhLVjMxqYo6vXMbo0T+IdOxHpwlh0ZgNjI4gvEQKgN4jFt+DPj/7XRLj45s9Wf5E2e
 HWuA==
X-Gm-Message-State: AOAM531xk5/F0hLmhrJFT0Ap0Oxp0YCdjc1akuOEkaKK/tcL4MvdpIb3
 FTwQMKqKjk5EH75JhpgZpdg=
X-Google-Smtp-Source: ABdhPJyTvz2zlPxD2tBMHTgZsEenI+RrXgmnQ/n573jOZWSGL/KgHJc4UBF6WpBDpYlb7kbNZ3VlfQ==
X-Received: by 2002:a17:906:c09:: with SMTP id
 s9mr6923061ejf.539.1612426773959; 
 Thu, 04 Feb 2021 00:19:33 -0800 (PST)
Received: from [192.168.1.36] (107.red-83-59-163.dynamicip.rima-tde.net.
 [83.59.163.107])
 by smtp.gmail.com with ESMTPSA id a2sm2084813ejk.80.2021.02.04.00.19.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Feb 2021 00:19:33 -0800 (PST)
Subject: Re: [PATCH] arm: xlnx-versal: fix virtio-mmio base address assignment
To: schspa <schspa@gmail.com>, qemu-devel@nongnu.org,
 qemu-arm <qemu-arm@nongnu.org>
References: <3362132240927a23ecca7b9d8cfd6e4130509eea.camel@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <dbcfce3c-3140-01b7-06ca-497cf7fdace7@amsat.org>
Date: Thu, 4 Feb 2021 09:19:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <3362132240927a23ecca7b9d8cfd6e4130509eea.camel@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x635.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.178,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, Kevin Zhao <kevin.zhao@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

Please Cc the maintainers when posting your patch:

./scripts/get_maintainer.pl -f hw/arm/xlnx-versal-virt.c
Alistair Francis <alistair@alistair23.me> (maintainer:Xilinx ZynqMP and...)
"Edgar E. Iglesias" <edgar.iglesias@gmail.com> (maintainer:Xilinx ZynqMP
and...)
Peter Maydell <peter.maydell@linaro.org> (maintainer:Xilinx ZynqMP and...)
qemu-arm@nongnu.org (open list:Xilinx ZynqMP and...)

On 2/4/21 7:58 AM, schspa wrote:
> 
> At the moment the following QEMU command line triggers an assertion
> failure On xlnx-versal SOC:
>   qemu-system-aarch64 \
>       -machine xlnx-versal-virt -nographic -smp 2 -m 128 \
>       -fsdev local,id=shareid,path=${HOME}/work,security_model=none \
>       -device virtio-9p-device,fsdev=shareid,mount_tag=share \
>       -fsdev local,id=shareid1,path=${HOME}/Music,security_model=none \
>       -device virtio-9p-device,fsdev=shareid1,mount_tag=share1
> 
>   qemu-system-aarch64: ../migration/savevm.c:860:
>   vmstate_register_with_alias_id:
>   Assertion `!se->compat || se->instance_id == 0' failed.
> 
> This problem was fixed on arm virt platform in patch
>  
> https://lists.nongnu.org/archive/html/qemu-devel/2016-07/msg01119.html

Please use instead "in commit f58b39d2d5b ("virtio-mmio: format
transport base address in BusClass.get_dev_path")".

> It works perfectly on arm virt platform. but there is still there on
> xlnx-versal SOC.
> 
> The main difference between arm virt and xlnx-versal is they use
> different way to create virtio-mmio qdev. on arm virt, it calls
> sysbus_create_simple("virtio-mmio", base, pic[irq]); which will call
> sysbus_mmio_map internally and assign base address to subsys device
> mmio correctly. but xlnx-versal's implements won't do this.
> 
> However, xlnx-versal can't switch to sysbus_create_simple() to create
> virtio-mmio device. It's because xlnx-versal's cpu use
> VersalVirt.soc.fpd.apu.mr as it's memory. which is subregion of
> system_memory. sysbus_create_simple will add virtio to system_memory,
> which can't be accessed by cpu.
> 
> We can solve this by simply assign mmio[0].addr directly. makes
> virtio_mmio_bus_get_dev_path to produce correct unique device path.
> 
> Signed-off-by: schspa <schspa@gmail.com>
> ---
>  hw/arm/xlnx-versal-virt.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/arm/xlnx-versal-virt.c b/hw/arm/xlnx-versal-virt.c
> index 8482cd6196..87b92ec6c3 100644
> --- a/hw/arm/xlnx-versal-virt.c
> +++ b/hw/arm/xlnx-versal-virt.c
> @@ -490,6 +490,7 @@ static void create_virtio_regions(VersalVirt *s)
>          object_property_add_child(OBJECT(&s->soc), name, OBJECT(dev));
>          sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
>          sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, pic_irq);
> +        SYS_BUS_DEVICE(dev)->mmio[0].addr = base;

The proper API call is:

           sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, base);

>          mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 0);
>          memory_region_add_subregion(&s->soc.mr_ps, base, mr);
>          g_free(name);
> 


