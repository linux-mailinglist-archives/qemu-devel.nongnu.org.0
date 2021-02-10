Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E057B316967
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 15:50:02 +0100 (CET)
Received: from localhost ([::1]:38262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9qob-0002QV-VK
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 09:50:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l9qnH-0001qa-6n; Wed, 10 Feb 2021 09:48:39 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:46496)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l9qnF-0000Je-R6; Wed, 10 Feb 2021 09:48:38 -0500
Received: by mail-ej1-x630.google.com with SMTP id w2so4641227ejk.13;
 Wed, 10 Feb 2021 06:48:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zJoaF18zw8/F0avJI6L0uu60XLA1OR8bzEeVc46+n+4=;
 b=W81Av47yneMwBT75Oo9grskaOg+BgbwRdOCbOtkLEqQGIMBKFL7z4Vt7lSnh/KCBKS
 LlChz/bQpA5Mx3fslO46+wB2bWTt96PYwbDFXjaAO/P4mgqmK2mUk7WdTI3hzVM2vgpl
 n4YNX7y+j0bsSDsAiqQjWNqGU8otEdJG1uJpC6xumUZn1Gc+dzVAJPOhsXLJTQMN/Oxf
 8WkrsPjzGC696x3YrhwpArKZMg6nMV5ajSx0ZmTWTBHkf+09TXjOKVHN4dVXyVPr/PE2
 SdOmu7gbS4B/z/DuTR9Tt2we2dDZVATY99qxcKoprsq8qyHFm2VSUxyqbU5vLC+OSUGU
 Emww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zJoaF18zw8/F0avJI6L0uu60XLA1OR8bzEeVc46+n+4=;
 b=Axsiv24kLOkK6FgVOH8TrU3IFzqDfatIgLB7d+MI9Ua5q/sOXi5/p352ubs2co7Jne
 QvIoPuo4KnAzOFB4TQHHnpe9vDgdd4H3crmRMi9bIb1xuG3WtcNcjQU31N8yFvyHzNve
 VxOo9bZhuzQc9Ig3HZOS9knVK/WuqJot96ybiKTZmt88Nt7eOImegV/UAsDRwQz2wXc2
 JNSGYOYJDxl0T97bVWP5NToEpjKmu4pd3Q71kQM/SfHz8medlDcztxe9Wom/glqhme2d
 YFVhzm1xhHZL/dDc3imILp0trIogisEUz9X9VKeRwWN1epnUJlYuJYL7kivHF114F+9d
 dszw==
X-Gm-Message-State: AOAM532rN0ZztLfWa/rGm3pGeuk3QmWI6VDAeTeaBt6KirXiXCpImByh
 BTKpkSYK8X00NdjzBCKcOq0=
X-Google-Smtp-Source: ABdhPJy+w+rSYJtzA8vA7eQvuS7Xz7b/paG6P5TtnPmKlbhx5fSn0ecaZQyuYkmU8GLRh59AEAcPSQ==
X-Received: by 2002:a17:907:c27:: with SMTP id
 ga39mr3398430ejc.68.1612968515799; 
 Wed, 10 Feb 2021 06:48:35 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id u9sm1386124ejc.57.2021.02.10.06.48.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Feb 2021 06:48:34 -0800 (PST)
Subject: Re: [PATCH v1 1/1] hw/arm: versal: Use nr_apu_cpus in favor of hard
 coding 2
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-devel@nongnu.org
References: <20210210142048.3125878-1-edgar.iglesias@gmail.com>
 <20210210142048.3125878-2-edgar.iglesias@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <90721ed4-ece0-1796-616f-cd0f8a3c7d9c@amsat.org>
Date: Wed, 10 Feb 2021 15:48:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210210142048.3125878-2-edgar.iglesias@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x630.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.211,
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
Cc: figlesia@xilinx.com, peter.maydell@linaro.org, sstabellini@kernel.org,
 edgar.iglesias@xilinx.com, sai.pavan.boddu@xilinx.com,
 frasse.iglesias@gmail.com, alistair@alistair23.me,
 richard.henderson@linaro.org, frederic.konrad@adacore.com, qemu-arm@nongnu.org,
 komlodi@xilinx.com, luc.michel@greensocs.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/10/21 3:20 PM, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
> 
> Use nr_apu_cpus in favor of hard coding 2.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> ---
>  hw/arm/xlnx-versal.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/arm/xlnx-versal.c b/hw/arm/xlnx-versal.c
> index b0777166e8..628e77ef66 100644
> --- a/hw/arm/xlnx-versal.c
> +++ b/hw/arm/xlnx-versal.c
> @@ -67,10 +67,10 @@ static void versal_create_apu_gic(Versal *s, qemu_irq *pic)
>      gicbusdev = SYS_BUS_DEVICE(&s->fpd.apu.gic);
>      gicdev = DEVICE(&s->fpd.apu.gic);
>      qdev_prop_set_uint32(gicdev, "revision", 3);
> -    qdev_prop_set_uint32(gicdev, "num-cpu", 2);
> +    qdev_prop_set_uint32(gicdev, "num-cpu", nr_apu_cpus);

Or directly XLNX_VERSAL_NR_ACPUS?

Regardless:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

>      qdev_prop_set_uint32(gicdev, "num-irq", XLNX_VERSAL_NR_IRQS + 32);
>      qdev_prop_set_uint32(gicdev, "len-redist-region-count", 1);
> -    qdev_prop_set_uint32(gicdev, "redist-region-count[0]", 2);
> +    qdev_prop_set_uint32(gicdev, "redist-region-count[0]", nr_apu_cpus);
>      qdev_prop_set_bit(gicdev, "has-security-extensions", true);
>  
>      sysbus_realize(SYS_BUS_DEVICE(&s->fpd.apu.gic), &error_fatal);
> 


