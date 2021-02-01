Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2EA730B0ED
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 20:57:47 +0100 (CET)
Received: from localhost ([::1]:48884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6fKU-0000NA-LB
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 14:57:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l6fIV-0007Jx-Hv; Mon, 01 Feb 2021 14:55:43 -0500
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f]:40263)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l6fIS-0004yx-9E; Mon, 01 Feb 2021 14:55:43 -0500
Received: by mail-io1-xd2f.google.com with SMTP id n2so18745926iom.7;
 Mon, 01 Feb 2021 11:55:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=t+VQY3n2hBHe+l9VCgLFPOjkCcS4RdqRaL6lQRK4pUQ=;
 b=klA8TpfR/Fck97Ig/68FSnBQHaTRFI6X940zA1O5VoWA/bNE5+DXnNKn7l8QCwcAbo
 8CeSnKrn8pH38mBLSROyzkS94oikZsRrIRx1i59vNn8CEoMm/P2W/R4Kx52QM3fBwRdW
 46eqmZXsIpkDsYnpEccKGNbMEwgLc6zHn2xMWVH7fniA4HshLxmk4KGFTLa71RDc8RoV
 +PIvJITZ2xmh1FKduAVSprWJ+wY80uyXHCkXi816hYnXRzaLxorr5XENC/Zr9Mz7B9/F
 JR+fqPq+bHPeIlEW2AiQTddm7xg8/lF1rJn0sHcg6RnOBxVvVAZ1zHYLXkTykF+LotXl
 sEcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=t+VQY3n2hBHe+l9VCgLFPOjkCcS4RdqRaL6lQRK4pUQ=;
 b=A5fmYihsiizJHa9tx5czaYinCGsmAx4KdeCrjrDrETbbrmhzF9d/pmNlgMGEwS1/o8
 vlAH9FC+z1Gcs+WEaFWJW+Q6SZ0f/m4+dGvNojvDhzrHIsLpWtDjyTjd6vWDJUG0D3Ld
 k4o1auDzkppgoEsRoqydoo/uR/t0Qd41AENEcNUR2C0a23nM3JwHeHnR9k56tQfQPK0S
 E1bEA75PPvFTfbHOh/iGmfZzKkmd5DePgGiac7ilYWqcrL0PrMC5TMgli1eY6sDj6IFr
 9Fcf3fHOYpVH9xjPNlak+lR6wYYgRByI/gryaTqXtVaJs98y/Xi0Kb4ip8i/TsxJJLql
 ydpA==
X-Gm-Message-State: AOAM531JK6hG9yIcwfbFzQBRj+I2ONypTM3rSwEAIopoLpJ62Eh0x3cg
 djWy6+q1DpoUDxx9L2u/iosh9RnpcZ2MO39XKa0=
X-Google-Smtp-Source: ABdhPJxwDj564UCQSKzRs+NS6uutLKQlIQsMcsHrHEDOHinGQwNhOMlowc4040Y0FeEeLwfY3J47rHTJXVPhJ1U0+jA=
X-Received: by 2002:a6b:4003:: with SMTP id k3mr13374142ioa.105.1612209338496; 
 Mon, 01 Feb 2021 11:55:38 -0800 (PST)
MIME-Version: 1.0
References: <20210131184449.382425-1-f4bug@amsat.org>
 <20210131184449.382425-4-f4bug@amsat.org>
In-Reply-To: <20210131184449.382425-4-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 1 Feb 2021 11:55:11 -0800
Message-ID: <CAKmqyKP4vJZzW2KyPezxenKzLB4XpUe_FQ+kDnunghFajSU_hA@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] hw/arm/xlnx-versal: Versal SoC requires ZDMA
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2f;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2f.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>,
 Alistair Francis <alistair@alistair23.me>, Michael Tokarev <mjt@tls.msk.ru>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Laurent Vivier <laurent@vivier.eu>, Niek Linnenbank <nieklinnenbank@gmail.com>,
 qemu-arm <qemu-arm@nongnu.org>, Antony Pavlov <antonynpavlov@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Jan 31, 2021 at 10:47 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
>
> The Versal SoC instantiates the TYPE_XLNX_ZDMA object in
> versal_create_admas(). Introduce the XLNX_ZDMA configuration
> and select it to fix:
>
>   $ qemu-system-aarch64 -M xlnx-versal-virt ...
>   qemu-system-aarch64: missing object type 'xlnx.zdma'
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
> Cc: Alistair Francis <alistair@alistair23.me>
> Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
> ---
>  hw/arm/Kconfig     | 2 ++
>  hw/dma/Kconfig     | 3 +++
>  hw/dma/meson.build | 2 +-
>  3 files changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 223016bb4e8..09298881f2f 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -354,6 +354,7 @@ config XLNX_ZYNQMP_ARM
>      select XILINX_AXI
>      select XILINX_SPIPS
>      select XLNX_ZYNQMP
> +    select XLNX_ZDMA
>
>  config XLNX_VERSAL
>      bool
> @@ -362,6 +363,7 @@ config XLNX_VERSAL
>      select CADENCE
>      select VIRTIO_MMIO
>      select UNIMP
> +    select XLNX_ZDMA
>
>  config NPCM7XX
>      bool
> diff --git a/hw/dma/Kconfig b/hw/dma/Kconfig
> index d67492d36c1..5d6be1a7a7a 100644
> --- a/hw/dma/Kconfig
> +++ b/hw/dma/Kconfig
> @@ -18,6 +18,9 @@ config ZYNQ_DEVCFG
>      bool
>      select REGISTER
>
> +config XLNX_ZDMA
> +    bool
> +
>  config STP2000
>      bool
>
> diff --git a/hw/dma/meson.build b/hw/dma/meson.build
> index b991d7698c7..47b4a7cb47b 100644
> --- a/hw/dma/meson.build
> +++ b/hw/dma/meson.build
> @@ -9,7 +9,7 @@
>  softmmu_ss.add(when: 'CONFIG_ETRAXFS', if_true: files('etraxfs_dma.c'))
>  softmmu_ss.add(when: 'CONFIG_STP2000', if_true: files('sparc32_dma.c'))
>  softmmu_ss.add(when: 'CONFIG_XLNX_ZYNQMP_ARM', if_true: files('xlnx_dpdm=
a.c'))
> -softmmu_ss.add(when: 'CONFIG_XLNX_ZYNQMP_ARM', if_true: files('xlnx-zdma=
.c'))
> +softmmu_ss.add(when: 'CONFIG_XLNX_ZDMA', if_true: files('xlnx-zdma.c'))
>  softmmu_ss.add(when: 'CONFIG_OMAP', if_true: files('omap_dma.c', 'soc_dm=
a.c'))
>  softmmu_ss.add(when: 'CONFIG_PXA2XX', if_true: files('pxa2xx_dma.c'))
>  softmmu_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2835_dma.c'))
> --
> 2.26.2
>
>

