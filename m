Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5EE95F3907
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 00:29:07 +0200 (CEST)
Received: from localhost ([::1]:41768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofTvu-0008NI-II
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 18:29:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ofT7b-0002Fc-QP; Mon, 03 Oct 2022 17:37:11 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:53076)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ofT7Z-0006xc-N5; Mon, 03 Oct 2022 17:37:07 -0400
Received: by mail-pj1-x102d.google.com with SMTP id l12so10813503pjh.2;
 Mon, 03 Oct 2022 14:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=yru/y/hCtiNBzjxWpDaSRN+rTvh+8or5nZb4bMGDreo=;
 b=qOOIakDMUsjEOZ2lubxWuiawamJHyFFmOlE+oZifZWUylG9vMb2SZ8gLT2tPMKQJbW
 r0lHE6/LsEo7fgO6HFoX0Q2XPemtcN60slRb+vSuayVonhdc2/rzZ+WrE6gYEOeWTLkS
 nCR08QvTqbzw94a0qM8VIWyEddEbEpgRi+k1KHDTLaw06QaHf3BMwRAb3XSH+JctQebo
 vwzlQQsbR9B83xfmVzBxss/SbPbhoBzgXnFrAY3VONqIKf2bpFK2scK46d1RY8uS4JRU
 HCVceDb0LyaLb89irLmb1yt/V99YDpZ2gaIM0iqW0u7AzQ8AJV7W9y4jELmutrg4ESSh
 6Y/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=yru/y/hCtiNBzjxWpDaSRN+rTvh+8or5nZb4bMGDreo=;
 b=qKj5+S8/smrZv79DlDwkjiHMeGbYeotfRbC2GIKgoFvYwrPI05SRAFkUEdcnsvTRO+
 KTUcc62DGtaI3eKFwtJWMZC+RHW7ofJC58F/6KcNxwoq/zDwx2z/wHXMdcdPVMSKJdl0
 Gvxe1530C7+bomGqBmmdkJ0R7Sj208hAFeiMh1drTEJDw5Flck9dQqsMKtFiEJyrQ4b3
 aW3IaFmPoKKLGn6CGxtkeQzvI+4Nw0WkX6QrwtrnEOb9GMWX4WntvUj6n2c8FQA198OX
 t39tZPi/BwUjZgWp4D+r47oG455l2AjrQePr2WNqU9J0ojAm8qooJhL6fC3JhSUqdibz
 d8GA==
X-Gm-Message-State: ACrzQf3ilBA8BNN6DYUu782RM9l4xnO3E2Uvmfsl+rSyCwxWVohYjBrr
 hjMsfTw1DVpLpqlGaI9YjhE=
X-Google-Smtp-Source: AMsMyM5sCVyHmw1fWBmVmrpbPFL1lDqBxS2G0BNA5Inh3uJlpbCKeMt6kIKaU5rA6rua/xYdjrQLzA==
X-Received: by 2002:a17:90a:d151:b0:205:f2a4:f898 with SMTP id
 t17-20020a17090ad15100b00205f2a4f898mr14444926pjw.118.1664833022646; 
 Mon, 03 Oct 2022 14:37:02 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 n17-20020a170902d2d100b0016be834d54asm7689720plc.306.2022.10.03.14.36.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Oct 2022 14:37:02 -0700 (PDT)
Message-ID: <fca0b9b4-e9ce-e79a-077a-1c2029f712f4@amsat.org>
Date: Mon, 3 Oct 2022 23:36:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.1
Subject: Re: [PATCH v2 07/13] hw/ppc/e500: Remove if statement which is now
 always true
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Kevin Wolf <kwolf@redhat.com>, Bin Meng <bmeng.cn@gmail.com>
References: <20221003203142.24355-1-shentey@gmail.com>
 <20221003203142.24355-8-shentey@gmail.com>
In-Reply-To: <20221003203142.24355-8-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.467,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 3/10/22 22:31, Bernhard Beschow wrote:
> Now that the MPC8544DS board also has a platform bus, the if statement
> is always true.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   hw/ppc/e500.c      | 30 ++++++++++++++----------------
>   hw/ppc/e500.h      |  1 -
>   hw/ppc/e500plat.c  |  1 -
>   hw/ppc/mpc8544ds.c |  1 -
>   4 files changed, 14 insertions(+), 19 deletions(-)

>       /* Platform Bus Device */
> -    if (pmc->has_platform_bus) {
> -        dev = qdev_new(TYPE_PLATFORM_BUS_DEVICE);
> -        dev->id = g_strdup(TYPE_PLATFORM_BUS_DEVICE);
> -        qdev_prop_set_uint32(dev, "num_irqs", pmc->platform_bus_num_irqs);
> -        qdev_prop_set_uint32(dev, "mmio_size", pmc->platform_bus_size);
> -        sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
> -        pms->pbus_dev = PLATFORM_BUS_DEVICE(dev);
> -
> -        s = SYS_BUS_DEVICE(pms->pbus_dev);
> -        for (i = 0; i < pmc->platform_bus_num_irqs; i++) {
> -            int irqn = pmc->platform_bus_first_irq + i;
> -            sysbus_connect_irq(s, i, qdev_get_gpio_in(mpicdev, irqn));
> -        }
> +    dev = qdev_new(TYPE_PLATFORM_BUS_DEVICE);
> +    dev->id = g_strdup(TYPE_PLATFORM_BUS_DEVICE);
> +    qdev_prop_set_uint32(dev, "num_irqs", pmc->platform_bus_num_irqs);
> +    qdev_prop_set_uint32(dev, "mmio_size", pmc->platform_bus_size);
> +    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);

Should we abort(pmc->platform_bus_size > 0) now?

> +    pms->pbus_dev = PLATFORM_BUS_DEVICE(dev);
>   
> -        memory_region_add_subregion(address_space_mem,
> -                                    pmc->platform_bus_base,
> -                                    &pms->pbus_dev->mmio);
> +    s = SYS_BUS_DEVICE(pms->pbus_dev);
> +    for (i = 0; i < pmc->platform_bus_num_irqs; i++) {
> +        int irqn = pmc->platform_bus_first_irq + i;
> +        sysbus_connect_irq(s, i, qdev_get_gpio_in(mpicdev, irqn));
>       }
>   
> +    memory_region_add_subregion(address_space_mem,
> +                                pmc->platform_bus_base,
> +                                &pms->pbus_dev->mmio);

