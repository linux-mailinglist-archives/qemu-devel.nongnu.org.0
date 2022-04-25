Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43AB950DE3F
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 12:53:59 +0200 (CEST)
Received: from localhost ([::1]:34314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1niwLu-0002u8-DB
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 06:53:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nivoX-0003CI-RJ
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 06:19:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29823)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nivoU-0003TV-Mq
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 06:19:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650881965;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eB3D1nk7M1P2d8zNUCUv6QeNLwaSETITmbv25fjIAeU=;
 b=Ex/g5SugbnmnFqzAR6JaGCIREIKWTblNmH8Q1vpPnwWk+KVY7djSPMirTuZEx7dv/024rh
 XXzccZ62jKKluKRYb4urcpJZ4j16XPny+S3g5J47p6P8YN6LiOKXGyILh/FgMME9PcH1LG
 cKXL3gGCJDQFlPG/F+Jsy03dTVYowhM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-73-fK0YKOcMMxiClMFXnRE4Cw-1; Mon, 25 Apr 2022 06:19:20 -0400
X-MC-Unique: fK0YKOcMMxiClMFXnRE4Cw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DD5213C02188;
 Mon, 25 Apr 2022 10:19:19 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.152])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DB5E24639FD;
 Mon, 25 Apr 2022 10:19:18 +0000 (UTC)
Date: Mon, 25 Apr 2022 11:19:16 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: LABBE Corentin <clabbe@baylibre.com>
Subject: Re: [PATCH] hw/crypto: add Allwinner sun4i-ss crypto device
Message-ID: <YmZ1pCU+0bP/LFPU@redhat.com>
References: <20220410191238.760733-1-clabbe@baylibre.com>
 <CAFEAcA9L89oN5nfM4RRxyYPBMtwbH1VfO1FbnXFUyC+rmzk51A@mail.gmail.com>
 <YmWgn2OGoZ9Uyirh@Red>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YmWgn2OGoZ9Uyirh@Red>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: b.galvani@gmail.com, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Apr 24, 2022 at 09:10:23PM +0200, LABBE Corentin wrote:
> Le Thu, Apr 21, 2022 at 01:38:00PM +0100, Peter Maydell a écrit :
> > On Sun, 10 Apr 2022 at 20:12, Corentin Labbe <clabbe@baylibre.com> wrote:
> > >
> > > From: Corentin LABBE <clabbe@baylibre.com>
> > >
> > > The Allwinner A10 has a cryptographic offloader device which
> > > could be easily emulated.
> > > The emulated device is tested with Linux only as any of BSD does not
> > > support it.
> > >
> > > Signed-off-by: Corentin LABBE <clabbe@baylibre.com>
> > 
> > Hi; thanks for this patch, and sorry it's taken me a while to get
> > to reviewing it.
> > 
> > (Daniel, I cc'd you since this device model is making use of crypto
> > related APIs.)
> > 
> > Firstly, a note on patch structure. This is quite a large patch,
> > and I think it would be useful to split it at least into two parts:
> >  (1) add the new device model
> >  (2) change the allwinner SoC to create that new device
> 
> Hello
> 
> I will do it for next iteration
> 
> > 
> > > diff --git a/docs/system/arm/cubieboard.rst b/docs/system/arm/cubieboard.rst
> > > index 344ff8cef9..7836643ba4 100644
> > > --- a/docs/system/arm/cubieboard.rst
> > > +++ b/docs/system/arm/cubieboard.rst
> > > @@ -14,3 +14,4 @@ Emulated devices:
> > >  - SDHCI
> > >  - USB controller
> > >  - SATA controller
> > > +- crypto
> > > diff --git a/docs/system/devices/allwinner-sun4i-ss.rst b/docs/system/devices/allwinner-sun4i-ss.rst
> > > new file mode 100644
> > > index 0000000000..6e7d2142b5
> > > --- /dev/null
> > > +++ b/docs/system/devices/allwinner-sun4i-ss.rst
> > > @@ -0,0 +1,31 @@
> > > +Allwinner sun4i-ss
> > > +==================
> > 
> > If you create a new rst file in docs, you need to put it into the
> > manual by adding it to some table of contents. Otherwise sphinx
> > will complain when you build the documentation, and users won't be
> > able to find it. (If you pass 'configure' the --enable-docs option
> > that will check that you have everything installed to be able to
> > build the docs.)
> > 
> > There are two options here: you can have this document, and
> > add it to the toctree in docs/system/device-emulation.rst, and
> > make the "crypto" bullet point in cubieboard.rst be a hyperlink to
> > the device-emulation.rst file. Or you can compress the information
> > down and put it into orangepi.rst.
> > 
> > > +The ``sun4i-ss`` emulates the Allwinner cryptographic offloader
> > > +present on early Allwinner SoCs (A10, A10s, A13, A20, A33)
> > > +In qemu only A10 via the cubieboard machine is supported.
> > > +
> > > +The emulated hardware is capable of handling the following algorithms:
> > > +- SHA1 and MD5 hash algorithms
> > > +- AES/DES/DES3 in CBC/ECB
> > > +- PRNG
> > > +
> > > +The emulated hardware does not handle yet:
> > > +- CTS for AES
> > > +- CTR for AES/DES/DES3
> > > +- IRQ and DMA mode
> > > +Anyway the Linux driver also does not handle them yet.
> > > +
> > > +The emulation needs a real crypto backend, for the moment only gnutls/nettle is supported.
> > > +So the device emulation needs qemu to be compiled with optionnal gnutls.
> > 
> > > diff --git a/hw/Kconfig b/hw/Kconfig
> > > index ad20cce0a9..43bd7fc14d 100644
> > > --- a/hw/Kconfig
> > > +++ b/hw/Kconfig
> > > @@ -6,6 +6,7 @@ source audio/Kconfig
> > >  source block/Kconfig
> > >  source char/Kconfig
> > >  source core/Kconfig
> > > +source crypto/Kconfig
> > >  source display/Kconfig
> > >  source dma/Kconfig
> > >  source gpio/Kconfig
> > 
> > I don't think we really need a new subdirectory of hw/
> > for a single device. If you can find two other devices that
> > already exist in QEMU that would also belong in hw/crypto/
> > then we can create it. Otherwise just put this device in
> > hw/misc.
> 
> I plan to add at least one other hw/crypto device (allwinner H3 sun8i-ce).
> I have another one already ready (rockchip rk3288) but I delay it since there are no related SoC in qemu yet.
> 
> > 
> > > diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> > > index 97f3b38019..fd8232b1d4 100644
> > > --- a/hw/arm/Kconfig
> > > +++ b/hw/arm/Kconfig
> > > @@ -317,6 +317,7 @@ config ALLWINNER_A10
> > >      select AHCI
> > >      select ALLWINNER_A10_PIT
> > >      select ALLWINNER_A10_PIC
> > > +    select ALLWINNER_CRYPTO_SUN4I_SS
> > >      select ALLWINNER_EMAC
> > >      select SERIAL
> > >      select UNIMP
> > > diff --git a/hw/arm/allwinner-a10.c b/hw/arm/allwinner-a10.c
> > > index 05e84728cb..e9104ee028 100644
> > > --- a/hw/arm/allwinner-a10.c
> > > +++ b/hw/arm/allwinner-a10.c
> > > @@ -23,6 +23,7 @@
> > >  #include "hw/misc/unimp.h"
> > >  #include "sysemu/sysemu.h"
> > >  #include "hw/boards.h"
> > > +#include "hw/crypto/allwinner-sun4i-ss.h"
> > >  #include "hw/usb/hcd-ohci.h"
> > >
> > >  #define AW_A10_MMC0_BASE        0x01c0f000
> > > @@ -32,6 +33,7 @@
> > >  #define AW_A10_EMAC_BASE        0x01c0b000
> > >  #define AW_A10_EHCI_BASE        0x01c14000
> > >  #define AW_A10_OHCI_BASE        0x01c14400
> > > +#define AW_A10_CRYPTO_BASE      0x01c15000
> > >  #define AW_A10_SATA_BASE        0x01c18000
> > >  #define AW_A10_RTC_BASE         0x01c20d00
> > >
> > > @@ -48,6 +50,10 @@ static void aw_a10_init(Object *obj)
> > >
> > >      object_initialize_child(obj, "emac", &s->emac, TYPE_AW_EMAC);
> > >
> > > +#if defined CONFIG_NETTLE
> > > +    object_initialize_child(obj, "crypto", &s->crypto, TYPE_AW_SUN4I_SS);
> > > +#endif
> > 
> > Don't put this kind of ifdef into device/SoC code, please.
> > The device emulation needs to work regardless of what
> > the specific crypto backends that got compiled into QEMU are.
> > 
> > > +#include <nettle/aes.h>
> > > +#include <nettle/cbc.h>
> > > +#include <nettle/des.h>
> > > +#include <nettle/md5.h>
> > > +#include <nettle/sha1.h>
> > 
> > Similarly, don't directly include nettle headers. The device needs
> > to use the backend-agnostic headers from include/crypto. To the
> > extent that they aren't sufficient to implement this device we
> > can look at enhancing them.
> 
> Problem is that current qemu crypto backends do not have necessary
> functions needed by this driver, I need to do basic MD5 transform
> with custom IV.
> I will check if it can be added in qemu crypto API.

If you don't want to/can't extend the crypto API, then at least
use the crypto API for all the pieces where it is possible to do
so. That way, we can clearly see where the gaps remain for this
device.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


