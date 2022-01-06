Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 576904866DA
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 16:42:10 +0100 (CET)
Received: from localhost ([::1]:59624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5Uu1-0004ZP-D1
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 10:42:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n5Ur1-0002fu-DR
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 10:39:03 -0500
Received: from [2a00:1450:4864:20::436] (port=35470
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n5Uqz-0003Zd-Eu
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 10:39:02 -0500
Received: by mail-wr1-x436.google.com with SMTP id e9so4027536wra.2
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 07:38:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=rc7hBLje+BFl48oQWb5ex/DB+McEasIkYjOkCoMl2P0=;
 b=KBuw6w9O8QCRESZdjG4FuSXeZ216LTGEjWeE/s0NLylxBBZOp9YnYb/+ys7M7cjltE
 MdmssUhgl85qv1zGzpL/CIV6ReW1DcCmmg8f1Qzz6KJOu2rZ4cihs96zCaO/KFqNdRJm
 YlTIdEX41dIwFpWR9P3KurhIVXRS4fZ74ZbHr88SD8cxKOkuatZxOsRu2WBtnrcdPpHX
 bjJy3bvVFCkxoraXR4xyEJdkeZErv2NRaSLTs0+lANvJYiLKlSU6ffQs0T6AXhEPz64U
 idHiOqP3cIXZN7aVFIehJ7Do5G06X/6F6190oezUgIDzNNXfp4mKTtHTyUFKLszFC+s5
 txuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=rc7hBLje+BFl48oQWb5ex/DB+McEasIkYjOkCoMl2P0=;
 b=Y7m3fMulr4R/Ka5bJdPwbvD3cn1IEre8SupMv2PWMLpz5FnTX7+EVGYDV3RdpNAV3i
 V5+Q+1CyigjpoSztRgs5ofdZ+3xlXDwfwhZqIVOX2caB0+FaR+xAodIbs9PdB9X8381+
 6brhma+svsgF/VDotO+C2nDRGSrHrb5V6h+7wECdnBjLy00EBqJzqx9mswiYIVytBW+Y
 xgZnT8BrvFGwroJUsnypFo2m0LU+X4EXPx7SXwAmB15CmCYM4a1yA2Ud7/qd11KzVNoq
 bSTIjepZAwounPveOUYZQCD7Iz+oe6tTziW9vqQzgKcSdI4EH6vEBtR16P3oVqPWwTdB
 3S4g==
X-Gm-Message-State: AOAM532ksVp8EH3vZRrOoyJx9aWbeRMaLiu+4oNosD5kaTl//RZzVqAX
 ibYSJ06pGZmyEH4LWXV7RM6vGalV7f/yF1Tyn2O1oA==
X-Google-Smtp-Source: ABdhPJx3wEe+b5q/3zbvR2hBjo6ZQy8/biCYhWfWnByuOEYTYsGhxBE6s805wirDwhtEGRxihXlCtDX5NrbBzF9Hbak=
X-Received: by 2002:a5d:52c4:: with SMTP id r4mr29795035wrv.521.1641483530159; 
 Thu, 06 Jan 2022 07:38:50 -0800 (PST)
MIME-Version: 1.0
References: <20211229225206.171882-1-philmd@redhat.com>
 <20211229225206.171882-4-philmd@redhat.com>
In-Reply-To: <20211229225206.171882-4-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 Jan 2022 15:38:39 +0000
Message-ID: <CAFEAcA-WowtqsMoCX_TyMgv79DtGJKOjUMHQcn6zOU=DL3_3gA@mail.gmail.com>
Subject: Re: [PATCH 3/3] hw/sysbus: Document GPIO related functions
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Yanan Wang <wangyanan55@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 29 Dec 2021 at 22:52, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> Similarly to cd07d7f9f51 ("qdev: Document GPIO related functions"),
> add documentation comments for the various sysbus functions
> related to creating and connecting GPIO lines.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  include/hw/sysbus.h | 67 +++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 64 insertions(+), 3 deletions(-)
>
> diff --git a/include/hw/sysbus.h b/include/hw/sysbus.h
> index 24645ee7996..7b2b7c7faaa 100644
> --- a/include/hw/sysbus.h
> +++ b/include/hw/sysbus.h
> @@ -69,14 +69,75 @@ typedef void FindSysbusDeviceFunc(SysBusDevice *sbdev=
, void *opaque);
>
>  void sysbus_init_mmio(SysBusDevice *dev, MemoryRegion *memory);
>  MemoryRegion *sysbus_mmio_get_region(SysBusDevice *dev, int n);
> -void sysbus_init_irq(SysBusDevice *dev, qemu_irq *p);
> -void sysbus_pass_irq(SysBusDevice *dev, SysBusDevice *target);
> -void sysbus_init_ioports(SysBusDevice *dev, uint32_t ioport, uint32_t si=
ze);
>
> +/**
> + * sysbus_init_irq: Create an output GPIO line
> + * @dev: Sysbus device to create output GPIO for
> + * @irq: Pointer to qemu_irq for the GPIO lines
> + *
> + * Sysbus devices should use this function in their instance_init
> + * or realize methods to create any output GPIO lines they need.

It's true that this works with a qemu_irq which can be used
as an arbitrary GPIO line. But mostly we use sysbus_init_irq() when
creating things which are actually outbound IRQ lines, and
qdev_init_gpio_out{,_named}() when creating generic output
GPIO lines. So we should phrase the documentation of these
functions to steer readers towards following that convention.

(Looking at the code, I discover that under the hood the
"sysbus irq" code is really using a named output GPIO
array with a specific name (SYSBUS_DEVICE_GPIO_IRQ,
aka "sysbus-irq"). The only functional difference is that
a sysbus device can be notified when one of its IRQs is
connected, which is a nasty hack for the benefit of platform vfio.)

> + *
> + * The @irq argument should be a pointer to either a "qemu_irq" in
> + * the device's state structure.

Missing "or ..." clause, or should "either" be deleted ?

> The device implementation can then raise
> + * and lower the GPIO line by calling qemu_set_irq(). (If anything is
> + * connected to the other end of the GPIO this will cause the handler
> + * function for that input GPIO to be called.)
> + *
> + * See sysbus_connect_irq() for how code that uses such a device can
> + * connect to one of its output GPIO lines.
> + *
> + * There is no need to release the @pins allocated array because it
> + * will be automatically released when @dev calls its instance_finalize(=
)
> + * handler.
> + */

thanks
-- PMM

