Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8C192C94F8
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 03:07:10 +0100 (CET)
Received: from localhost ([::1]:53878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjv4Q-0007kK-24
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 21:07:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kjv2j-0006iD-Va; Mon, 30 Nov 2020 21:05:25 -0500
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41]:35650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kjv2i-0000Ki-2K; Mon, 30 Nov 2020 21:05:25 -0500
Received: by mail-io1-xd41.google.com with SMTP id i9so70123ioo.2;
 Mon, 30 Nov 2020 18:05:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bYc/o1FpFnpgsOXVRs4WJ55j0EtVt2iOoyFJPESm0wM=;
 b=X8j4dMnI+wtctTan3FMKG16efUkEp8c17sPFmq/+gQzRQIDr+uIx7rZCGw2YYUOqRX
 G1O8C3yTv36BP6vZp+mzpwax2dXVjMS6K3C/yoeUPewQU9sbrI0qYCEETiCgHWRgni3c
 bMCQGT5hq3AiSydS3q4FoGMCns1+QvaNV18DMafAlacDt2DU9Q2JaOGgps5s7KBvyiQa
 8UfyB8LKyeUEAZWqyxIX13NTgIsWW2JqTWB6GpLDHgxgDYMwB4Jb2jUUNMP+dTHYWobv
 MN8lmrgVujCB2gVw4YKlQQqhejc0VpZ+2YqkeBAnyvm4pNHgbWWn4enCarQdj9pCIYmL
 PNdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bYc/o1FpFnpgsOXVRs4WJ55j0EtVt2iOoyFJPESm0wM=;
 b=pMBHSWnW55TPZkKpa/H9gs/wP72tJZUyoNgjVMHFCBqmaheP5EybovpXqk9CMec0eV
 FFYxbAYR24nL6i2ibVQYzUuShyeeay50HcPp+KaV6QR7695Xn7r+su1qMDYwkA5YEktT
 qZGPWoFFJfnJ+zPGfK+Ix0CV9wbb1Ss8f42Dpr7WpMuWAnAgKQchDSFmH8sjrM9vzpJK
 pyZuPaMF7FAnM1Bp4e0E7wWh3HGgSt0EyKGAe9qJP/nBoqnyWyGgioisKpNZqNIqTd9f
 vkYEtTSSwSy6tH7NCPhUFK4coxA3oqykoK80bipP+RvoFpKXwx0SbWKLbCcTexWyyhVw
 70VQ==
X-Gm-Message-State: AOAM531gljTqjEWUv8fenI3OVM/1PjbX0PM6JeVns3h5obGhJmriX1Rc
 hA754WGwcgQk8IyyRA1I8ntqdvCgNHIXysmmmHo=
X-Google-Smtp-Source: ABdhPJyZUM1Rqrh0Mi44+RClz+QMlsn2JeB3XvNuOq18QoSrPYdGsEoz0ueW9WnywXlKbHdPOcWLfLo1iOIv5FTlkpA=
X-Received: by 2002:a02:6c09:: with SMTP id w9mr643578jab.135.1606788322652;
 Mon, 30 Nov 2020 18:05:22 -0800 (PST)
MIME-Version: 1.0
References: <1606709124-80741-1-git-send-email-bmeng.cn@gmail.com>
In-Reply-To: <1606709124-80741-1-git-send-email-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 30 Nov 2020 17:53:06 -0800
Message-ID: <CAKmqyKPXG0DtyreuuQFvA+-vtk3f5ZKQbgf0Ci9SiTMVQL1Yxw@mail.gmail.com>
Subject: Re: [PATCH 1/2] hw/ssi: imx_spi: Use a macro for number of chip
 selects supported
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d41;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd41.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair@alistair23.me>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm <qemu-arm@nongnu.org>,
 Peter Chubb <peter.chubb@nicta.com.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Nov 29, 2020 at 8:06 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> Avoid using a magic number (4) everywhere for the number of chip
> selects supported.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
>  hw/ssi/imx_spi.c         | 4 ++--
>  include/hw/ssi/imx_spi.h | 5 ++++-
>  2 files changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
> index d8885ae..e605049 100644
> --- a/hw/ssi/imx_spi.c
> +++ b/hw/ssi/imx_spi.c
> @@ -361,7 +361,7 @@ static void imx_spi_write(void *opaque, hwaddr offset, uint64_t value,
>
>              /* We are in master mode */
>
> -            for (i = 0; i < 4; i++) {
> +            for (i = 0; i < ECSPI_NUM_CS; i++) {
>                  qemu_set_irq(s->cs_lines[i],
>                               i == imx_spi_selected_channel(s) ? 0 : 1);
>              }
> @@ -424,7 +424,7 @@ static void imx_spi_realize(DeviceState *dev, Error **errp)
>      sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->iomem);
>      sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->irq);
>
> -    for (i = 0; i < 4; ++i) {
> +    for (i = 0; i < ECSPI_NUM_CS; ++i) {
>          sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->cs_lines[i]);
>      }
>
> diff --git a/include/hw/ssi/imx_spi.h b/include/hw/ssi/imx_spi.h
> index b82b17f..eeaf49b 100644
> --- a/include/hw/ssi/imx_spi.h
> +++ b/include/hw/ssi/imx_spi.h
> @@ -77,6 +77,9 @@
>
>  #define EXTRACT(value, name) extract32(value, name##_SHIFT, name##_LENGTH)
>
> +/* number of chip selects supported */
> +#define ECSPI_NUM_CS 4
> +
>  #define TYPE_IMX_SPI "imx.spi"
>  OBJECT_DECLARE_SIMPLE_TYPE(IMXSPIState, IMX_SPI)
>
> @@ -89,7 +92,7 @@ struct IMXSPIState {
>
>      qemu_irq irq;
>
> -    qemu_irq cs_lines[4];
> +    qemu_irq cs_lines[ECSPI_NUM_CS];
>
>      SSIBus *bus;
>
> --
> 2.7.4
>
>

