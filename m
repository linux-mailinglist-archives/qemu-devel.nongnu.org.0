Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2081E557A3E
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 14:24:44 +0200 (CEST)
Received: from localhost ([::1]:45146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4Lt4-0001tK-Vi
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 08:24:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4LkL-0005yl-PT
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 08:15:41 -0400
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c]:33432)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4LkJ-0000jl-T3
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 08:15:41 -0400
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-317710edb9dso192149717b3.0
 for <qemu-devel@nongnu.org>; Thu, 23 Jun 2022 05:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=F7bi0kL/rFqoaqds1vEBpPil9sgMeNQmgZzhUbZCVTs=;
 b=Q+HHtwCb8GnSNrQGUec7nNeSX83ZY4mtoO2gA80VcnefwaqK+d4K4Kl5l/5sxX6A0K
 +dDmkhkOgDoUbSGcrrtMmc9dF4p/rn7h6tx38fI3R5VDOnXMBX53CMgvZZ8I04jiiFmC
 hC8sqYjPWZ4bct0DAxU5yTQX/N8Wj7jCQqKrI1LdiZlR35fkCmEosGn0hcgWvjLdfSfE
 vWyJzODLKneRIk2JmOcrG5vmBt5dIG7OMK1WaVJHUPPphumQxRu3lG4kTgH3DDOANwnw
 nx7J/MI0e4dtTMGnQFCLzf4hfGa5H80LU/lev6/9TM+x++71Rzz1tzVILro+5lmbFyA5
 R3OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=F7bi0kL/rFqoaqds1vEBpPil9sgMeNQmgZzhUbZCVTs=;
 b=l7YJEQKkUq1mGnCazTHR230Zv6uRRuvTciO37MKg7/XvxXTf8FEvtD79PBpLlaQiOp
 dmtosdarCkw1LlynyXnAy8ssT3FJZA+YIu3aOnQqAQivV7MZ+qGjbSSAUjZXRGmmT0zs
 zTLpris9vvU8V4eR/pOBJ1737oZm3nCbpEQL4w1r5rcw5xkfHI0zgc7YyBRoGmGiJc4R
 Zhfc54bQxTRcoCXEiC/Pq0PG3ZnvyhykfxraMgaMDTWWNNNV7ohFbKx269Mv6oTs1G1V
 a2MX2ndJXiDlQzjXEhTKQhwsnp4fFDyVYWL7g0hGuWnmFaPRzVgsd569qcXx3CK020rP
 NYPg==
X-Gm-Message-State: AJIora9zs0lIGLc4oPzaKtwE5q/AIO2pxzDLzIUfJTuERk+ExAQVJOeF
 5a0sM+7lQHIvQWboBlxUYGTLBAFMHR6q1owNxsO1fw==
X-Google-Smtp-Source: AGRyM1uRz69Bfh9NsvumFonp6zhJqvibH5w5p7nJe65BZK6bxanJjfUicvi7sbmlQz5eAk2+A255dWUpO0qsDcfXed4=
X-Received: by 2002:a81:8486:0:b0:317:a4af:4e0a with SMTP id
 u128-20020a818486000000b00317a4af4e0amr10217824ywf.455.1655986538673; Thu, 23
 Jun 2022 05:15:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220623102617.2164175-1-pdel@fb.com>
 <20220623102617.2164175-5-pdel@fb.com>
In-Reply-To: <20220623102617.2164175-5-pdel@fb.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Jun 2022 13:15:27 +0100
Message-ID: <CAFEAcA9zmmaUth+9k82+ZrhAMOmsmttq2HOKs+DVNx0L1dx6=w@mail.gmail.com>
Subject: Re: [PATCH 04/14] sysbus: Add sysbus_mmio_map_in
To: Peter Delevoryas <pdel@fb.com>
Cc: clg@kaod.org, andrew@aj.id.au, joel@jms.id.au, pbonzini@redhat.com, 
 berrange@redhat.com, eduardo@habkost.net, marcel.apfelbaum@gmail.com, 
 richard.henderson@linaro.org, f4bug@amsat.org, ani@anisinha.ca, 
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 23 Jun 2022 at 11:56, Peter Delevoryas <pdel@fb.com> wrote:
>
> Signed-off-by: Peter Delevoryas <pdel@fb.com>
> ---
>  hw/core/sysbus.c    | 6 ++++++
>  include/hw/sysbus.h | 2 ++
>  2 files changed, 8 insertions(+)
>
> diff --git a/hw/core/sysbus.c b/hw/core/sysbus.c
> index cb4d6bae9d..7b63ec3fed 100644
> --- a/hw/core/sysbus.c
> +++ b/hw/core/sysbus.c
> @@ -160,6 +160,12 @@ void sysbus_mmio_map(SysBusDevice *dev, int n, hwaddr addr)
>      sysbus_mmio_map_common(dev, n, addr, false, 0, get_system_memory());
>  }
>
> +void sysbus_mmio_map_in(SysBusDevice *dev, int n, hwaddr addr,
> +                        MemoryRegion *system_memory)
> +{
> +    sysbus_mmio_map_common(dev, n, addr, false, 0, system_memory);
> +}
> +
>  void sysbus_mmio_map_overlap(SysBusDevice *dev, int n, hwaddr addr,
>                               int priority)
>  {
> diff --git a/include/hw/sysbus.h b/include/hw/sysbus.h
> index a7c23d5fb1..f4578029e4 100644
> --- a/include/hw/sysbus.h
> +++ b/include/hw/sysbus.h
> @@ -80,6 +80,8 @@ void sysbus_connect_irq(SysBusDevice *dev, int n, qemu_irq irq);
>  bool sysbus_is_irq_connected(SysBusDevice *dev, int n);
>  qemu_irq sysbus_get_connected_irq(SysBusDevice *dev, int n);
>  void sysbus_mmio_map(SysBusDevice *dev, int n, hwaddr addr);
> +void sysbus_mmio_map_in(SysBusDevice *dev, int n, hwaddr addr,
> +                        MemoryRegion *system_memory);
>  void sysbus_mmio_map_overlap(SysBusDevice *dev, int n, hwaddr addr,
>                               int priority);

What's this going to be used for?

The current standard way to map a sysbus MMIO region into something
other than the global system memory region is to do:
   memory_region_add_subregion(&container, addr,
                               sysbus_mmio_get_region(sbd, 0));

I'd rather not have two ways to do the same thing; we have
far too many of those already.

thanks
-- PMM

