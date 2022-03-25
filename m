Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 401154E6CB8
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 04:02:07 +0100 (CET)
Received: from localhost ([::1]:33118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXaDF-0007Im-QP
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 23:02:05 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zongyuan.li@smartx.com>)
 id 1nXaBM-0006TC-MT
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 23:00:09 -0400
Received: from [2607:f8b0:4864:20::82c] (port=38838
 helo=mail-qt1-x82c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zongyuan.li@smartx.com>)
 id 1nXaBJ-0007gO-2F
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 23:00:07 -0400
Received: by mail-qt1-x82c.google.com with SMTP id v2so5539527qtc.5
 for <qemu-devel@nongnu.org>; Thu, 24 Mar 2022 20:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smartx-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fV8k8FAe6DiXJgw5SNgJSGYrGTEQ1JTWXuujuost+sM=;
 b=SSWlJzoOPOwYe0JwoIrIeQyeHDiR1GDKvBF6pNzoEKde0s4na3C9w054ezzeu6lEic
 anAJW49Z0KQx8rGFaNn8eTrFjZPM9FL+JOOVqtIjCauN/55h7yvV2se/796SUEKt3VZa
 +xnvWAbXwDIUYC9jThT3iwKgAweSK0hV5L04ekFzOuqM/AYnveMcVSUUdIsgYdKHuTpm
 9A848Vw7iVoyV/fKJaBSU89FztRsuDjJHvb+tWdaOr8uhJxD5njuu8uSSEA4k6PA4650
 b1WHpZ8uZuavXcpxeztLsowg2tW1W5WU0uAg7/1fE0meISuJpTMXAX468f0+jTY3eTZA
 YRiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fV8k8FAe6DiXJgw5SNgJSGYrGTEQ1JTWXuujuost+sM=;
 b=BDjuBzXMx5pvQugtRcJjN6jsu2cFzikLo54S9btZlRb8DPPDbHfTys4Fm24sR3AaAl
 QJa/QcVzqss0ilcsFvDBCfMykhD9LT9rBfM1VqAuH+b6qRaOawXZQoTa8kAqFci7cIKC
 QW3nCqsqSePUpa1pL/VjyerOhtqkJe2/iNErRm1fWbqHrjL071Ar+ITy+eGG1pSZ86xg
 JCwZl2d2DyR++5OcZqZK2f6qpMmAJ2j+BO7p0WDdndDMC3mnBUzOWwp+3KiWVh8lbIMd
 cHWiVnJOz8brfgz77bYzcux01gcjjjsDhqjumgp90KGp4rsXFIcjwX17nxqwVQ4R/TIg
 JOSA==
X-Gm-Message-State: AOAM532RifMb4fc11qWUCckN9PSCn3or1M3wqwgL39qnmRFi/YIyTXJT
 8hw9vI3fVuQSTIp2JMuQfSXVz90wjuo2oELs6I7huA==
X-Google-Smtp-Source: ABdhPJzpYoEdlRZ2LWhWMzwopWbTUJCHOXXPUyiFAAbGV8BUM2afagZR2zzDv0cRxc+Sa1422yo5Cj/n54Pri27lVM8=
X-Received: by 2002:a05:622a:c3:b0:2e3:4bd0:16c2 with SMTP id
 p3-20020a05622a00c300b002e34bd016c2mr4091627qtw.575.1648177203387; Thu, 24
 Mar 2022 20:00:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220324171756.196654-1-zongyuan.li@smartx.com>
 <20220324171756.196654-4-zongyuan.li@smartx.com>
 <CAFEAcA9GA79yUQj3i5MdLWK6+r3bDObKQS+8_bfx=47TKbLHJQ@mail.gmail.com>
In-Reply-To: <CAFEAcA9GA79yUQj3i5MdLWK6+r3bDObKQS+8_bfx=47TKbLHJQ@mail.gmail.com>
From: Zongyuan Li <zongyuan.li@smartx.com>
Date: Fri, 25 Mar 2022 10:59:52 +0800
Message-ID: <CADXGpueetjT6rgH3XHo1RNxNz-WGACWB0UqYH7qkMaBV1HMsYQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] hw/intc/exynos4210: replace 'qemu_split_irq' in
 combiner and gic
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::82c
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::82c;
 envelope-from=zongyuan.li@smartx.com; helo=mail-qt1-x82c.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
 "open list:Exynos" <qemu-arm@nongnu.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

>
> > diff --git a/include/hw/core/split-irq.h b/include/hw/core/split-irq.h
> > index ff8852f407..eb485dd7a6 100644
> > --- a/include/hw/core/split-irq.h
> > +++ b/include/hw/core/split-irq.h
> > @@ -42,9 +42,6 @@
> >
> >  #define MAX_SPLIT_LINES 16
> >
> > -
> > -OBJECT_DECLARE_SIMPLE_TYPE(SplitIRQ, SPLIT_IRQ)
> > -
> >  struct SplitIRQ {
> >      DeviceState parent_obj;
> >
> > @@ -52,4 +49,6 @@ struct SplitIRQ {
> >      uint16_t num_lines;
> >  };
> >
> > +OBJECT_DECLARE_SIMPLE_TYPE(SplitIRQ, SPLIT_IRQ)
> > +
>
> What's this change for ?
>
> thanks
> -- PMM

Some language sever like `clangd-13` will complain about the following
code if we use
`typedef` before struct definition:

> @@ -79,11 +80,11 @@
> #define EXYNOS4210_NUM_DMA      3
>
>  typedef struct Exynos4210Irq {
> -    qemu_irq int_combiner_irq[EXYNOS4210_MAX_INT_COMBINER_IN_IRQ];
> -    qemu_irq ext_combiner_irq[EXYNOS4210_MAX_EXT_COMBINER_IN_IRQ];
> +    SplitIRQ int_combiner_irq[EXYNOS4210_MAX_INT_COMBINER_IN_IRQ];
> +    SplitIRQ ext_combiner_irq[EXYNOS4210_MAX_EXT_COMBINER_IN_IRQ];
>      qemu_irq int_gic_irq[EXYNOS4210_INT_GIC_NIRQ];
>      qemu_irq ext_gic_irq[EXYNOS4210_EXT_GIC_NIRQ];
> -    qemu_irq board_irqs[EXYNOS4210_MAX_INT_COMBINER_IN_IRQ];
> +    SplitIRQ board_irqs[EXYNOS4210_MAX_INT_COMBINER_IN_IRQ];
>  } Exynos4210Irq;

Because `SplitIRQ` is an incomplete type.

regards,
Li

