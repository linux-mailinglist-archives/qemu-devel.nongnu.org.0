Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D02750D4C1
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Apr 2022 21:14:30 +0200 (CEST)
Received: from localhost ([::1]:44966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nihgi-0003XW-I5
	for lists+qemu-devel@lfdr.de; Sun, 24 Apr 2022 15:14:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clabbe@baylibre.com>)
 id 1nihcv-0001Kv-Cd
 for qemu-devel@nongnu.org; Sun, 24 Apr 2022 15:10:33 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:56219)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <clabbe@baylibre.com>)
 id 1nihct-0003wN-9Z
 for qemu-devel@nongnu.org; Sun, 24 Apr 2022 15:10:33 -0400
Received: by mail-wm1-x335.google.com with SMTP id x3so8074536wmj.5
 for <qemu-devel@nongnu.org>; Sun, 24 Apr 2022 12:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=q8t0eo80CMqPJNf1ptRZUMi9LLCdq5o8lbaZqVVKPgc=;
 b=3luIlSLhEvuYY0CRd+PglJfM02FLRUU4JCuCp0wrXV/BQx9XyEjHnCJ8SaQe/+Ut0A
 RHDzFxW8s3XMoxiofOD/UuSOz5sR/U/Cc66epWcFt/mbtXP9S1Q1k4Fb87m/DqcDRx2t
 e/ZLNq1/2H3IzqUSFVxPwunFvl15hNPP7jXguNq2hRLY0x+FbCO+rY5r8yi7jvTPVPOY
 aZyRkJQZw8R27rUZRzi+5UoRgGpoUBov4JpfHVz3YqzuWFIW2XHyntN85CnLcJhMVxje
 OmMMs7Ov9rLlTPIKR1osLBmaB1CdcVa828z71fPsiim9DlktPIZUjHbAHw3diAlIcqb4
 Z+Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=q8t0eo80CMqPJNf1ptRZUMi9LLCdq5o8lbaZqVVKPgc=;
 b=cQXYSpSvUahh3tWUCVzdAQVvySQTXcSO1EnaJ7M2IgbPp+u4GgiW4hgSb3GHVvBIkb
 dV6MjGbaEnBOpknhYtBLQuB5BUV/OG+K0qGtc/bp9ZQ3oO22dQY+iKlqDhA6YFsm41qM
 UjDB+J/ku5562WJKB2/N15d3xPoVXfY7bX79WqvBu+LnlZdfbMwxXhsaueVe8ONa8Co7
 39SDIpdULvQ+KvK+h5r9VvC5qPdgQg5RcqB1Q8du8Oe4/nLQoSR5wS9+MyoYf6EcyhfU
 3Y8CDOouYz+FOm7O9ZMTkg+PPmx+iAn61W+4U2JoR/wFbQTfLxhIzyv8J3xq4oDJqN74
 J+PA==
X-Gm-Message-State: AOAM531m0fZsNbFm8q2fnwHZgj75JCZoWs7jPAukCZHf7NJf06+t7yPA
 fOYfngS3wue3q7n/SxNf/4d1Jw==
X-Google-Smtp-Source: ABdhPJxbjdQe6X0U7M9HtH3eg8yvKKbNYFBSNdTlu7e7h3K3MTGQQGAMaTX6uRCQ6tmKh7nHSvm6Bw==
X-Received: by 2002:a1c:2542:0:b0:38e:b64c:6afb with SMTP id
 l63-20020a1c2542000000b0038eb64c6afbmr13329338wml.65.1650827427740; 
 Sun, 24 Apr 2022 12:10:27 -0700 (PDT)
Received: from Red ([2a01:cb1d:3d5:a100:264b:feff:fe03:2806])
 by smtp.googlemail.com with ESMTPSA id
 f11-20020a7bcc0b000000b0037e0c362b6dsm6966293wmh.31.2022.04.24.12.10.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Apr 2022 12:10:27 -0700 (PDT)
Date: Sun, 24 Apr 2022 21:10:23 +0200
From: LABBE Corentin <clabbe@baylibre.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] hw/crypto: add Allwinner sun4i-ss crypto device
Message-ID: <YmWgn2OGoZ9Uyirh@Red>
References: <20220410191238.760733-1-clabbe@baylibre.com>
 <CAFEAcA9L89oN5nfM4RRxyYPBMtwbH1VfO1FbnXFUyC+rmzk51A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFEAcA9L89oN5nfM4RRxyYPBMtwbH1VfO1FbnXFUyC+rmzk51A@mail.gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=clabbe@baylibre.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: b.galvani@gmail.com, qemu-arm@nongnu.org,
 "Daniel P. Berrange" <berrange@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le Thu, Apr 21, 2022 at 01:38:00PM +0100, Peter Maydell a écrit :
> On Sun, 10 Apr 2022 at 20:12, Corentin Labbe <clabbe@baylibre.com> wrote:
> >
> > From: Corentin LABBE <clabbe@baylibre.com>
> >
> > The Allwinner A10 has a cryptographic offloader device which
> > could be easily emulated.
> > The emulated device is tested with Linux only as any of BSD does not
> > support it.
> >
> > Signed-off-by: Corentin LABBE <clabbe@baylibre.com>
> 
> Hi; thanks for this patch, and sorry it's taken me a while to get
> to reviewing it.
> 
> (Daniel, I cc'd you since this device model is making use of crypto
> related APIs.)
> 
> Firstly, a note on patch structure. This is quite a large patch,
> and I think it would be useful to split it at least into two parts:
>  (1) add the new device model
>  (2) change the allwinner SoC to create that new device

Hello

I will do it for next iteration

> 
> > diff --git a/docs/system/arm/cubieboard.rst b/docs/system/arm/cubieboard.rst
> > index 344ff8cef9..7836643ba4 100644
> > --- a/docs/system/arm/cubieboard.rst
> > +++ b/docs/system/arm/cubieboard.rst
> > @@ -14,3 +14,4 @@ Emulated devices:
> >  - SDHCI
> >  - USB controller
> >  - SATA controller
> > +- crypto
> > diff --git a/docs/system/devices/allwinner-sun4i-ss.rst b/docs/system/devices/allwinner-sun4i-ss.rst
> > new file mode 100644
> > index 0000000000..6e7d2142b5
> > --- /dev/null
> > +++ b/docs/system/devices/allwinner-sun4i-ss.rst
> > @@ -0,0 +1,31 @@
> > +Allwinner sun4i-ss
> > +==================
> 
> If you create a new rst file in docs, you need to put it into the
> manual by adding it to some table of contents. Otherwise sphinx
> will complain when you build the documentation, and users won't be
> able to find it. (If you pass 'configure' the --enable-docs option
> that will check that you have everything installed to be able to
> build the docs.)
> 
> There are two options here: you can have this document, and
> add it to the toctree in docs/system/device-emulation.rst, and
> make the "crypto" bullet point in cubieboard.rst be a hyperlink to
> the device-emulation.rst file. Or you can compress the information
> down and put it into orangepi.rst.
> 
> > +The ``sun4i-ss`` emulates the Allwinner cryptographic offloader
> > +present on early Allwinner SoCs (A10, A10s, A13, A20, A33)
> > +In qemu only A10 via the cubieboard machine is supported.
> > +
> > +The emulated hardware is capable of handling the following algorithms:
> > +- SHA1 and MD5 hash algorithms
> > +- AES/DES/DES3 in CBC/ECB
> > +- PRNG
> > +
> > +The emulated hardware does not handle yet:
> > +- CTS for AES
> > +- CTR for AES/DES/DES3
> > +- IRQ and DMA mode
> > +Anyway the Linux driver also does not handle them yet.
> > +
> > +The emulation needs a real crypto backend, for the moment only gnutls/nettle is supported.
> > +So the device emulation needs qemu to be compiled with optionnal gnutls.
> 
> > diff --git a/hw/Kconfig b/hw/Kconfig
> > index ad20cce0a9..43bd7fc14d 100644
> > --- a/hw/Kconfig
> > +++ b/hw/Kconfig
> > @@ -6,6 +6,7 @@ source audio/Kconfig
> >  source block/Kconfig
> >  source char/Kconfig
> >  source core/Kconfig
> > +source crypto/Kconfig
> >  source display/Kconfig
> >  source dma/Kconfig
> >  source gpio/Kconfig
> 
> I don't think we really need a new subdirectory of hw/
> for a single device. If you can find two other devices that
> already exist in QEMU that would also belong in hw/crypto/
> then we can create it. Otherwise just put this device in
> hw/misc.

I plan to add at least one other hw/crypto device (allwinner H3 sun8i-ce).
I have another one already ready (rockchip rk3288) but I delay it since there are no related SoC in qemu yet.

> 
> > diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> > index 97f3b38019..fd8232b1d4 100644
> > --- a/hw/arm/Kconfig
> > +++ b/hw/arm/Kconfig
> > @@ -317,6 +317,7 @@ config ALLWINNER_A10
> >      select AHCI
> >      select ALLWINNER_A10_PIT
> >      select ALLWINNER_A10_PIC
> > +    select ALLWINNER_CRYPTO_SUN4I_SS
> >      select ALLWINNER_EMAC
> >      select SERIAL
> >      select UNIMP
> > diff --git a/hw/arm/allwinner-a10.c b/hw/arm/allwinner-a10.c
> > index 05e84728cb..e9104ee028 100644
> > --- a/hw/arm/allwinner-a10.c
> > +++ b/hw/arm/allwinner-a10.c
> > @@ -23,6 +23,7 @@
> >  #include "hw/misc/unimp.h"
> >  #include "sysemu/sysemu.h"
> >  #include "hw/boards.h"
> > +#include "hw/crypto/allwinner-sun4i-ss.h"
> >  #include "hw/usb/hcd-ohci.h"
> >
> >  #define AW_A10_MMC0_BASE        0x01c0f000
> > @@ -32,6 +33,7 @@
> >  #define AW_A10_EMAC_BASE        0x01c0b000
> >  #define AW_A10_EHCI_BASE        0x01c14000
> >  #define AW_A10_OHCI_BASE        0x01c14400
> > +#define AW_A10_CRYPTO_BASE      0x01c15000
> >  #define AW_A10_SATA_BASE        0x01c18000
> >  #define AW_A10_RTC_BASE         0x01c20d00
> >
> > @@ -48,6 +50,10 @@ static void aw_a10_init(Object *obj)
> >
> >      object_initialize_child(obj, "emac", &s->emac, TYPE_AW_EMAC);
> >
> > +#if defined CONFIG_NETTLE
> > +    object_initialize_child(obj, "crypto", &s->crypto, TYPE_AW_SUN4I_SS);
> > +#endif
> 
> Don't put this kind of ifdef into device/SoC code, please.
> The device emulation needs to work regardless of what
> the specific crypto backends that got compiled into QEMU are.
> 
> > +#include <nettle/aes.h>
> > +#include <nettle/cbc.h>
> > +#include <nettle/des.h>
> > +#include <nettle/md5.h>
> > +#include <nettle/sha1.h>
> 
> Similarly, don't directly include nettle headers. The device needs
> to use the backend-agnostic headers from include/crypto. To the
> extent that they aren't sufficient to implement this device we
> can look at enhancing them.

Problem is that current qemu crypto backends do not have necessary functions needed by this driver, I need to do basic MD5 transform with custom IV.
I will check if it can be added in qemu crypto API.

> 
> > +static const VMStateDescription vmstate_allwinner_sun4i_ss = {
> > +    .name = "allwinner-sun4i-ss",
> > +    .version_id = 1,
> > +    .minimum_version_id = 1,
> > +    .fields = (VMStateField[]) {
> > +        VMSTATE_UINT32(ctl, AwSun4iSSState),
> > +        VMSTATE_UINT32(fcsr, AwSun4iSSState),
> > +        VMSTATE_UINT32_ARRAY(iv, AwSun4iSSState, 5),
> > +        VMSTATE_UINT32_ARRAY(key, AwSun4iSSState, 8),
> > +        VMSTATE_UINT32_ARRAY(md, AwSun4iSSState, 5),
> 
> Shouldn't this also include rx, rxc, tx, txc ? Or do they
> never contain live data at the point where we're migrating?

I will fix this.

> 
> > +        VMSTATE_END_OF_LIST()
> > +    }
> > +};
> 
> 
> > +/**
> > + * Object model
> > + * @{
> > + */
> 
> We don't use these @{ ... @} markers in our doc comments,
> so you can delete all of those.
> 
> I haven't looked at the rest of the code in detail, but I
> skimmed over it and didn't see anything that looked wrong.
> 
> thanks

Thanks for your review.

Regards

