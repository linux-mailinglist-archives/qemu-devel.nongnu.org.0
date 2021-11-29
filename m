Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E0A461CD1
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 18:37:06 +0100 (CET)
Received: from localhost ([::1]:57268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrkaP-0002z1-BA
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 12:37:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mrkVn-0006Ag-GO
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 12:32:20 -0500
Received: from [2a00:1450:4864:20::32a] (port=38686
 helo=mail-wm1-x32a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mrkVl-0003rC-9I
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 12:32:18 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 p3-20020a05600c1d8300b003334fab53afso17467596wms.3
 for <qemu-devel@nongnu.org>; Mon, 29 Nov 2021 09:32:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zpQZIk99e68CYyjW+SZDaB5VOfkE4l0inE85JEVtozs=;
 b=lgMqV9WaMFzFA5PLWR79Wz24QC7sP1CPqtHEBUJiOY+S8P0S6TnxQMlPO8uMIFnTGT
 mJH+EC7qE1R9sFsvjQeB4mcV13djnGOqbR65p+2UonvkqqXmV4PABo5vmZq07OPTLBmb
 mFSKj+G2XwSD9N/uREmcfZXZ4GTnoXSlnZsJKgjBLCcYJsPcqAP+7uwNVDVauGGezuCl
 gzljEfm5QQsS/AA7i1BFF9FIq8FH3ES6VbyLm52v/nBxVYaY9ypBA4Pha47bW+ZkjcLE
 oYwzyqRkOVdMFW6BfzQ9e7U1DiiFhBSJMd+Scy/iFWsXavkyWcpb5yReGflbNuAOij70
 5j5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zpQZIk99e68CYyjW+SZDaB5VOfkE4l0inE85JEVtozs=;
 b=kbadk2A7w6wCAts2t4hFdaY7A9r0wkdwWPBD89ccQ/cE/Re65+vevvRb6D6K/ikoj4
 UFl3h7KVEPB3oVluwuz9UZiMwPFHUxiZiWY7oXWU2y2K1x4+3Ph9uSWI/dCvnrXG11Ku
 TjlkucB3VZlDPYZTC+xLanmBT6Od/G3THqyiJgA95pOL129Bab6YxO1MvjBvD46bFY5N
 X/VivIZKpDZeDjX/nOiZ2RMjwB2ApwCZQL4tA31wx5LlqU0vFTKVAE9WW5PKwKHEyD8X
 aNqKz0EcquoCNFaZDST5conHL9wNp9Vw6sUdfLYE/8846pBs11WDhj0SqSrxt+J/0CeR
 TFFA==
X-Gm-Message-State: AOAM53371CX6zGC0bVxSLHJSsJ+E75JF85cVpCbq3phve1xWB+jD0S9K
 IB2DTXFpD687iS6FWY0JOyXuJxjm7v1u4TTiqp4xIg==
X-Google-Smtp-Source: ABdhPJz5G4cNlwJWcysdwYI0QHoEdIN7ftIYD6lv7AZs1ovzNn88nFiT0HCm7iBhysKFb/YF4QWd4S+EkiCuzjPvPq0=
X-Received: by 2002:a1c:96:: with SMTP id 144mr38727496wma.126.1638207133474; 
 Mon, 29 Nov 2021 09:32:13 -0800 (PST)
MIME-Version: 1.0
References: <20211124101555.1410-1-francisco.iglesias@xilinx.com>
 <20211124101555.1410-3-francisco.iglesias@xilinx.com>
In-Reply-To: <20211124101555.1410-3-francisco.iglesias@xilinx.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 29 Nov 2021 17:32:02 +0000
Message-ID: <CAFEAcA-a-DrpaC9Cw6S0+8+pceW1mL6GZTf_k1-0-6OP0huCDg@mail.gmail.com>
Subject: Re: [PATCH v3 02/10] hw/arm/xlnx-versal: Connect Versal's PMC SLCR
To: Francisco Iglesias <francisco.iglesias@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_XBL=0.375,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: edgar.iglesias@xilinx.com, frasse.iglesias@gmail.com,
 alistair@alistair23.me, qemu-devel@nongnu.org, alistair23@gmail.com,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 24 Nov 2021 at 10:16, Francisco Iglesias
<francisco.iglesias@xilinx.com> wrote:
>
> Connect Versal's PMC SLCR (system-level control registers) model.
>
> Signed-off-by: Francisco Iglesias <francisco.iglesias@xilinx.com>
> Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> ---
>  hw/arm/xlnx-versal.c         | 18 ++++++++++++++++++
>  include/hw/arm/xlnx-versal.h |  6 ++++++
>  2 files changed, 24 insertions(+)
>
> diff --git a/hw/arm/xlnx-versal.c b/hw/arm/xlnx-versal.c
> index b2705b6925..08e250945f 100644
> --- a/hw/arm/xlnx-versal.c
> +++ b/hw/arm/xlnx-versal.c
> @@ -369,6 +369,23 @@ static void versal_create_efuse(Versal *s, qemu_irq *pic)
>      sysbus_connect_irq(SYS_BUS_DEVICE(ctrl), 0, pic[VERSAL_EFUSE_IRQ]);
>  }
>
> +static void versal_create_pmc_iou_slcr(Versal *s, qemu_irq *pic)
> +{
> +    SysBusDevice *sbd;
> +
> +    object_initialize_child(OBJECT(s), "versal-pmc-iou-slcr", &s->pmc.iou.slcr,
> +                            TYPE_XILINX_VERSAL_PMC_IOU_SLCR);
> +
> +    sbd = SYS_BUS_DEVICE(&s->pmc.iou.slcr);
> +    sysbus_realize(sbd, &error_fatal);
> +
> +    memory_region_add_subregion(&s->mr_ps, MM_PMC_PMC_IOU_SLCR,
> +        sysbus_mmio_get_region(sbd, 0));

Nit: the indent here is wrong.

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

