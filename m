Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA447490B91
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 16:40:56 +0100 (CET)
Received: from localhost ([::1]:60336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9U7r-0007rW-LU
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 10:40:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1n9Tcd-0000UQ-A2; Mon, 17 Jan 2022 10:08:39 -0500
Received: from [2a00:1450:4864:20::132] (port=34612
 helo=mail-lf1-x132.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1n9TcY-0003Wd-Uo; Mon, 17 Jan 2022 10:08:38 -0500
Received: by mail-lf1-x132.google.com with SMTP id p27so47041707lfa.1;
 Mon, 17 Jan 2022 07:08:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xNM/c2SV6LNlYtbRMau2y6pZ9yk6MJ9uH0Q2zDl/Fko=;
 b=b+Zpfgwr/KVDQSnfoFKbIHznKaEfuJXzjVr+O2khdJB8TaPSBobp0SrUttG07mpfu/
 o72pG/HmuBd7iTsDMdwQfAbjqtr7J9vqIieK6r0sb4z+XjydP8uCHw1NGk40O/iHgsH2
 gmOcyHs08SKFmDHkK+XwQzwEBwHNBeRFxNSoJUvsCQOv23zTn9fD0M3GEd0rso0ws7fL
 cN9GDUe8lgly+6OVhQ3BeiwjUTVQ8gYdR5VhvZR8IXkl98Aptrdm5HO5v0F3ED7By/KA
 8iMAjZDgFsnbJM/g20KXn6VhOtFURQoFlIDs/JQ1pQSYKMe02ghim4oA5TAjVsgkYSaU
 tG8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xNM/c2SV6LNlYtbRMau2y6pZ9yk6MJ9uH0Q2zDl/Fko=;
 b=OeGhG8Jm3w6ARIdoaMMawjlBYjM28hNK/f4m1g997gx212CKxaLsE3eVu/OTuxmt9J
 4UBUtmwgr2hCBoZC00MMS1KdSrjYVa3UJaWogoxlTvmnTplA2M3acoxF1qkO4zgkMjFZ
 UDjUh8+f9MtgKnevBr7UYRHLDXK5k78zY4SWA2tc0Y6ZMeoUiJIHV3QXbckN4xPhtATx
 3Pi+2vogkaRJu7v42gtUWTwTuTQ+Ln8p69Yj7AKa8Y0ToJ5KybQ+/RH2A5hYZLbQVaLr
 jAfk6l7PGCFZcE1qhIRk66wUfTLsiOunX0irAHCzzSWgnzlcfQ0YtM0AWyafPB60C+/R
 GHDw==
X-Gm-Message-State: AOAM533suK/HZEjionk5Ck9aibrR+LK7/X+CwCrzle1OnI+d8cY49AU7
 GAf2YLN4ujNGnUfTGCRJwIzd/8yvAVIjj32MmCA=
X-Google-Smtp-Source: ABdhPJxTi6YALprh6A8+8Ec4pzZQDsFupzwJfA9VvNHA1pCf8/oJrKV5Yzd47jeeL4vYcS43DvsMCLifkTOK1PROZoA=
X-Received: by 2002:a2e:bf1e:: with SMTP id c30mr16454219ljr.408.1642432110340; 
 Mon, 17 Jan 2022 07:08:30 -0800 (PST)
MIME-Version: 1.0
References: <20220113171038.18128-1-shentey@gmail.com>
In-Reply-To: <20220113171038.18128-1-shentey@gmail.com>
From: Bernhard Beschow <shentey@gmail.com>
Date: Mon, 17 Jan 2022 16:08:09 +0100
Message-ID: <CAG4p6K7AZ4iixONiX--cnYWJvhyjwjiBwZSFLPhLz2+ejMTT_g@mail.gmail.com>
Subject: Re: [PATCH] Mark remaining global TypeInfo instances as const
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="00000000000081316405d5c8861b"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::132
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::132;
 envelope-from=shentey@gmail.com; helo=mail-lf1-x132.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Matthew Rosato <mjrosato@linux.ibm.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>,
 qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 qemu-trivial@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Havard Skinnemoen <hskinnemoen@google.com>, Halil Pasic <pasic@linux.ibm.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>, Thomas Huth <thuth@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, Corey Minyard <minyard@acm.org>,
 "open list:S390 PCI" <qemu-s390x@nongnu.org>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 "open list:Raspberry Pi" <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 Andrew Jeffery <andrew@aj.id.au>, Cornelia Huck <cohuck@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Tyrone Ting <kfting@nuvoton.com>, "open list:e500" <qemu-ppc@nongnu.org>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000081316405d5c8861b
Content-Type: text/plain; charset="UTF-8"

Hi Philippe,

Thanks for your review. I've now sent v2 of the patch with your comments
addressed.

BTW: I almost missed your review because apparently I wasn't in the CC.
That is also the reason I'm not responding to your mail directly.

Bernhard.

On Thu, Jan 13, 2022 at 6:10 PM Bernhard Beschow <shentey@gmail.com> wrote:

> More than 1k of TypeInfo instances are already marked as const. Mark the
> remaining ones, too.
>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>  hw/core/generic-loader.c   | 2 +-
>  hw/core/guest-loader.c     | 2 +-
>  hw/display/bcm2835_fb.c    | 2 +-
>  hw/display/i2c-ddc.c       | 2 +-
>  hw/display/macfb.c         | 4 ++--
>  hw/display/virtio-vga.c    | 2 +-
>  hw/dma/bcm2835_dma.c       | 2 +-
>  hw/i386/pc_piix.c          | 2 +-
>  hw/i386/sgx-epc.c          | 2 +-
>  hw/intc/bcm2835_ic.c       | 2 +-
>  hw/intc/bcm2836_control.c  | 2 +-
>  hw/ipmi/ipmi.c             | 4 ++--
>  hw/mem/nvdimm.c            | 2 +-
>  hw/mem/pc-dimm.c           | 2 +-
>  hw/misc/bcm2835_mbox.c     | 2 +-
>  hw/misc/bcm2835_powermgt.c | 2 +-
>  hw/misc/bcm2835_property.c | 2 +-
>  hw/misc/bcm2835_rng.c      | 2 +-
>  hw/misc/pvpanic-isa.c      | 2 +-
>  hw/misc/pvpanic-pci.c      | 2 +-
>  hw/net/fsl_etsec/etsec.c   | 2 +-
>  hw/ppc/prep_systemio.c     | 2 +-
>  hw/ppc/spapr_iommu.c       | 2 +-
>  hw/s390x/s390-pci-bus.c    | 2 +-
>  hw/s390x/sclp.c            | 2 +-
>  hw/s390x/tod-kvm.c         | 2 +-
>  hw/s390x/tod-tcg.c         | 2 +-
>  hw/s390x/tod.c             | 2 +-
>  hw/scsi/lsi53c895a.c       | 2 +-
>  hw/sd/allwinner-sdhost.c   | 2 +-
>  hw/sd/aspeed_sdhci.c       | 2 +-
>  hw/sd/bcm2835_sdhost.c     | 2 +-
>  hw/sd/cadence_sdhci.c      | 2 +-
>  hw/sd/npcm7xx_sdhci.c      | 2 +-
>  hw/usb/dev-mtp.c           | 2 +-
>  hw/usb/host-libusb.c       | 2 +-
>  hw/vfio/igd.c              | 2 +-
>  hw/virtio/virtio-pmem.c    | 2 +-
>  qom/object.c               | 4 ++--
>  39 files changed, 42 insertions(+), 42 deletions(-)
>
> diff --git a/hw/core/generic-loader.c b/hw/core/generic-loader.c
> index 9a24ffb880..eaafc416f4 100644
> --- a/hw/core/generic-loader.c
> +++ b/hw/core/generic-loader.c
> @@ -207,7 +207,7 @@ static void generic_loader_class_init(ObjectClass
> *klass, void *data)
>      set_bit(DEVICE_CATEGORY_MISC, dc->categories);
>  }
>
> -static TypeInfo generic_loader_info = {
> +static const TypeInfo generic_loader_info = {
>      .name = TYPE_GENERIC_LOADER,
>      .parent = TYPE_DEVICE,
>      .instance_size = sizeof(GenericLoaderState),
> diff --git a/hw/core/guest-loader.c b/hw/core/guest-loader.c
> index d3f9d1a06e..391c875a29 100644
> --- a/hw/core/guest-loader.c
> +++ b/hw/core/guest-loader.c
> @@ -129,7 +129,7 @@ static void guest_loader_class_init(ObjectClass
> *klass, void *data)
>      set_bit(DEVICE_CATEGORY_MISC, dc->categories);
>  }
>
> -static TypeInfo guest_loader_info = {
> +static const TypeInfo guest_loader_info = {
>      .name = TYPE_GUEST_LOADER,
>      .parent = TYPE_DEVICE,
>      .instance_size = sizeof(GuestLoaderState),
> diff --git a/hw/display/bcm2835_fb.c b/hw/display/bcm2835_fb.c
> index 2be77bdd3a..088fc3d51c 100644
> --- a/hw/display/bcm2835_fb.c
> +++ b/hw/display/bcm2835_fb.c
> @@ -454,7 +454,7 @@ static void bcm2835_fb_class_init(ObjectClass *klass,
> void *data)
>      dc->vmsd = &vmstate_bcm2835_fb;
>  }
>
> -static TypeInfo bcm2835_fb_info = {
> +static const TypeInfo bcm2835_fb_info = {
>      .name          = TYPE_BCM2835_FB,
>      .parent        = TYPE_SYS_BUS_DEVICE,
>      .instance_size = sizeof(BCM2835FBState),
> diff --git a/hw/display/i2c-ddc.c b/hw/display/i2c-ddc.c
> index 13eb529fc1..146489518c 100644
> --- a/hw/display/i2c-ddc.c
> +++ b/hw/display/i2c-ddc.c
> @@ -113,7 +113,7 @@ static void i2c_ddc_class_init(ObjectClass *oc, void
> *data)
>      isc->send = i2c_ddc_tx;
>  }
>
> -static TypeInfo i2c_ddc_info = {
> +static const TypeInfo i2c_ddc_info = {
>      .name = TYPE_I2CDDC,
>      .parent = TYPE_I2C_SLAVE,
>      .instance_size = sizeof(I2CDDCState),
> diff --git a/hw/display/macfb.c b/hw/display/macfb.c
> index 4bd7c3ad6a..69c2ea2b6e 100644
> --- a/hw/display/macfb.c
> +++ b/hw/display/macfb.c
> @@ -783,14 +783,14 @@ static void macfb_nubus_class_init(ObjectClass
> *klass, void *data)
>      device_class_set_props(dc, macfb_nubus_properties);
>  }
>
> -static TypeInfo macfb_sysbus_info = {
> +static const TypeInfo macfb_sysbus_info = {
>      .name          = TYPE_MACFB,
>      .parent        = TYPE_SYS_BUS_DEVICE,
>      .instance_size = sizeof(MacfbSysBusState),
>      .class_init    = macfb_sysbus_class_init,
>  };
>
> -static TypeInfo macfb_nubus_info = {
> +static const TypeInfo macfb_nubus_info = {
>      .name          = TYPE_NUBUS_MACFB,
>      .parent        = TYPE_NUBUS_DEVICE,
>      .instance_size = sizeof(MacfbNubusState),
> diff --git a/hw/display/virtio-vga.c b/hw/display/virtio-vga.c
> index b23a75a04b..5a2f7a4540 100644
> --- a/hw/display/virtio-vga.c
> +++ b/hw/display/virtio-vga.c
> @@ -220,7 +220,7 @@ static void virtio_vga_base_class_init(ObjectClass
> *klass, void *data)
>                                     virtio_vga_set_big_endian_fb);
>  }
>
> -static TypeInfo virtio_vga_base_info = {
> +static const TypeInfo virtio_vga_base_info = {
>      .name          = TYPE_VIRTIO_VGA_BASE,
>      .parent        = TYPE_VIRTIO_PCI,
>      .instance_size = sizeof(VirtIOVGABase),
> diff --git a/hw/dma/bcm2835_dma.c b/hw/dma/bcm2835_dma.c
> index eb0002a2b9..5e9306110d 100644
> --- a/hw/dma/bcm2835_dma.c
> +++ b/hw/dma/bcm2835_dma.c
> @@ -394,7 +394,7 @@ static void bcm2835_dma_class_init(ObjectClass *klass,
> void *data)
>      dc->vmsd = &vmstate_bcm2835_dma;
>  }
>
> -static TypeInfo bcm2835_dma_info = {
> +static const TypeInfo bcm2835_dma_info = {
>      .name          = TYPE_BCM2835_DMA,
>      .parent        = TYPE_SYS_BUS_DEVICE,
>      .instance_size = sizeof(BCM2835DMAState),
> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index 7c7790a5ce..f6557d3c21 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -865,7 +865,7 @@ static void isa_bridge_class_init(ObjectClass *klass,
> void *data)
>      k->class_id     = PCI_CLASS_BRIDGE_ISA;
>  };
>
> -static TypeInfo isa_bridge_info = {
> +static const TypeInfo isa_bridge_info = {
>      .name          = "igd-passthrough-isa-bridge",
>      .parent        = TYPE_PCI_DEVICE,
>      .instance_size = sizeof(PCIDevice),
> diff --git a/hw/i386/sgx-epc.c b/hw/i386/sgx-epc.c
> index 96b2940d75..d664829d35 100644
> --- a/hw/i386/sgx-epc.c
> +++ b/hw/i386/sgx-epc.c
> @@ -167,7 +167,7 @@ static void sgx_epc_class_init(ObjectClass *oc, void
> *data)
>      mdc->fill_device_info = sgx_epc_md_fill_device_info;
>  }
>
> -static TypeInfo sgx_epc_info = {
> +static const TypeInfo sgx_epc_info = {
>      .name          = TYPE_SGX_EPC,
>      .parent        = TYPE_DEVICE,
>      .instance_size = sizeof(SGXEPCDevice),
> diff --git a/hw/intc/bcm2835_ic.c b/hw/intc/bcm2835_ic.c
> index 9000d995e8..4513fad16f 100644
> --- a/hw/intc/bcm2835_ic.c
> +++ b/hw/intc/bcm2835_ic.c
> @@ -227,7 +227,7 @@ static void bcm2835_ic_class_init(ObjectClass *klass,
> void *data)
>      dc->vmsd = &vmstate_bcm2835_ic;
>  }
>
> -static TypeInfo bcm2835_ic_info = {
> +static const TypeInfo bcm2835_ic_info = {
>      .name          = TYPE_BCM2835_IC,
>      .parent        = TYPE_SYS_BUS_DEVICE,
>      .instance_size = sizeof(BCM2835ICState),
> diff --git a/hw/intc/bcm2836_control.c b/hw/intc/bcm2836_control.c
> index 2ead76ffdc..b0589df188 100644
> --- a/hw/intc/bcm2836_control.c
> +++ b/hw/intc/bcm2836_control.c
> @@ -392,7 +392,7 @@ static void bcm2836_control_class_init(ObjectClass
> *klass, void *data)
>      dc->vmsd = &vmstate_bcm2836_control;
>  }
>
> -static TypeInfo bcm2836_control_info = {
> +static const TypeInfo bcm2836_control_info = {
>      .name          = TYPE_BCM2836_CONTROL,
>      .parent        = TYPE_SYS_BUS_DEVICE,
>      .instance_size = sizeof(BCM2836ControlState),
> diff --git a/hw/ipmi/ipmi.c b/hw/ipmi/ipmi.c
> index 8d35c9fdd6..bbb07b151e 100644
> --- a/hw/ipmi/ipmi.c
> +++ b/hw/ipmi/ipmi.c
> @@ -85,7 +85,7 @@ static void ipmi_interface_class_init(ObjectClass
> *class, void *data)
>      ik->do_hw_op = ipmi_do_hw_op;
>  }
>
> -static TypeInfo ipmi_interface_type_info = {
> +static const TypeInfo ipmi_interface_type_info = {
>      .name = TYPE_IPMI_INTERFACE,
>      .parent = TYPE_INTERFACE,
>      .class_size = sizeof(IPMIInterfaceClass),
> @@ -120,7 +120,7 @@ static void bmc_class_init(ObjectClass *oc, void *data)
>      device_class_set_props(dc, ipmi_bmc_properties);
>  }
>
> -static TypeInfo ipmi_bmc_type_info = {
> +static const TypeInfo ipmi_bmc_type_info = {
>      .name = TYPE_IPMI_BMC,
>      .parent = TYPE_DEVICE,
>      .instance_size = sizeof(IPMIBmc),
> diff --git a/hw/mem/nvdimm.c b/hw/mem/nvdimm.c
> index 7397b67156..933bc5e0c7 100644
> --- a/hw/mem/nvdimm.c
> +++ b/hw/mem/nvdimm.c
> @@ -248,7 +248,7 @@ static void nvdimm_class_init(ObjectClass *oc, void
> *data)
>      set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
>  }
>
> -static TypeInfo nvdimm_info = {
> +static const TypeInfo nvdimm_info = {
>      .name          = TYPE_NVDIMM,
>      .parent        = TYPE_PC_DIMM,
>      .class_size    = sizeof(NVDIMMClass),
> diff --git a/hw/mem/pc-dimm.c b/hw/mem/pc-dimm.c
> index 48b913aba6..28af0d71b2 100644
> --- a/hw/mem/pc-dimm.c
> +++ b/hw/mem/pc-dimm.c
> @@ -286,7 +286,7 @@ static void pc_dimm_class_init(ObjectClass *oc, void
> *data)
>      mdc->fill_device_info = pc_dimm_md_fill_device_info;
>  }
>
> -static TypeInfo pc_dimm_info = {
> +static const TypeInfo pc_dimm_info = {
>      .name          = TYPE_PC_DIMM,
>      .parent        = TYPE_DEVICE,
>      .instance_size = sizeof(PCDIMMDevice),
> diff --git a/hw/misc/bcm2835_mbox.c b/hw/misc/bcm2835_mbox.c
> index 9f73cbd5e4..1908c152f6 100644
> --- a/hw/misc/bcm2835_mbox.c
> +++ b/hw/misc/bcm2835_mbox.c
> @@ -324,7 +324,7 @@ static void bcm2835_mbox_class_init(ObjectClass
> *klass, void *data)
>      dc->vmsd = &vmstate_bcm2835_mbox;
>  }
>
> -static TypeInfo bcm2835_mbox_info = {
> +static const TypeInfo bcm2835_mbox_info = {
>      .name          = TYPE_BCM2835_MBOX,
>      .parent        = TYPE_SYS_BUS_DEVICE,
>      .instance_size = sizeof(BCM2835MboxState),
> diff --git a/hw/misc/bcm2835_powermgt.c b/hw/misc/bcm2835_powermgt.c
> index 25fa804cbd..976f3d34e5 100644
> --- a/hw/misc/bcm2835_powermgt.c
> +++ b/hw/misc/bcm2835_powermgt.c
> @@ -144,7 +144,7 @@ static void bcm2835_powermgt_class_init(ObjectClass
> *klass, void *data)
>      dc->vmsd = &vmstate_bcm2835_powermgt;
>  }
>
> -static TypeInfo bcm2835_powermgt_info = {
> +static const TypeInfo bcm2835_powermgt_info = {
>      .name          = TYPE_BCM2835_POWERMGT,
>      .parent        = TYPE_SYS_BUS_DEVICE,
>      .instance_size = sizeof(BCM2835PowerMgtState),
> diff --git a/hw/misc/bcm2835_property.c b/hw/misc/bcm2835_property.c
> index 76ea511d53..e94e951057 100644
> --- a/hw/misc/bcm2835_property.c
> +++ b/hw/misc/bcm2835_property.c
> @@ -421,7 +421,7 @@ static void bcm2835_property_class_init(ObjectClass
> *klass, void *data)
>      dc->vmsd = &vmstate_bcm2835_property;
>  }
>
> -static TypeInfo bcm2835_property_info = {
> +static const TypeInfo bcm2835_property_info = {
>      .name          = TYPE_BCM2835_PROPERTY,
>      .parent        = TYPE_SYS_BUS_DEVICE,
>      .instance_size = sizeof(BCM2835PropertyState),
> diff --git a/hw/misc/bcm2835_rng.c b/hw/misc/bcm2835_rng.c
> index d0c4e64e88..b3c80cf186 100644
> --- a/hw/misc/bcm2835_rng.c
> +++ b/hw/misc/bcm2835_rng.c
> @@ -131,7 +131,7 @@ static void bcm2835_rng_class_init(ObjectClass *klass,
> void *data)
>      dc->vmsd = &vmstate_bcm2835_rng;
>  }
>
> -static TypeInfo bcm2835_rng_info = {
> +static const TypeInfo bcm2835_rng_info = {
>      .name          = TYPE_BCM2835_RNG,
>      .parent        = TYPE_SYS_BUS_DEVICE,
>      .instance_size = sizeof(BCM2835RngState),
> diff --git a/hw/misc/pvpanic-isa.c b/hw/misc/pvpanic-isa.c
> index 7b66d58acc..a39fcdd1fc 100644
> --- a/hw/misc/pvpanic-isa.c
> +++ b/hw/misc/pvpanic-isa.c
> @@ -77,7 +77,7 @@ static void pvpanic_isa_class_init(ObjectClass *klass,
> void *data)
>      set_bit(DEVICE_CATEGORY_MISC, dc->categories);
>  }
>
> -static TypeInfo pvpanic_isa_info = {
> +static const TypeInfo pvpanic_isa_info = {
>      .name          = TYPE_PVPANIC_ISA_DEVICE,
>      .parent        = TYPE_ISA_DEVICE,
>      .instance_size = sizeof(PVPanicISAState),
> diff --git a/hw/misc/pvpanic-pci.c b/hw/misc/pvpanic-pci.c
> index af8cbe2830..62e1be68c1 100644
> --- a/hw/misc/pvpanic-pci.c
> +++ b/hw/misc/pvpanic-pci.c
> @@ -74,7 +74,7 @@ static void pvpanic_pci_class_init(ObjectClass *klass,
> void *data)
>      set_bit(DEVICE_CATEGORY_MISC, dc->categories);
>  }
>
> -static TypeInfo pvpanic_pci_info = {
> +static const TypeInfo pvpanic_pci_info = {
>      .name          = TYPE_PVPANIC_PCI_DEVICE,
>      .parent        = TYPE_PCI_DEVICE,
>      .instance_size = sizeof(PVPanicPCIState),
> diff --git a/hw/net/fsl_etsec/etsec.c b/hw/net/fsl_etsec/etsec.c
> index bd9d62b559..e7fc082518 100644
> --- a/hw/net/fsl_etsec/etsec.c
> +++ b/hw/net/fsl_etsec/etsec.c
> @@ -430,7 +430,7 @@ static void etsec_class_init(ObjectClass *klass, void
> *data)
>      dc->user_creatable = true;
>  }
>
> -static TypeInfo etsec_info = {
> +static const TypeInfo etsec_info = {
>      .name                  = TYPE_ETSEC_COMMON,
>      .parent                = TYPE_SYS_BUS_DEVICE,
>      .instance_size         = sizeof(eTSEC),
> diff --git a/hw/ppc/prep_systemio.c b/hw/ppc/prep_systemio.c
> index b2bd783248..8c9b8dd67b 100644
> --- a/hw/ppc/prep_systemio.c
> +++ b/hw/ppc/prep_systemio.c
> @@ -300,7 +300,7 @@ static void prep_systemio_class_initfn(ObjectClass
> *klass, void *data)
>      device_class_set_props(dc, prep_systemio_properties);
>  }
>
> -static TypeInfo prep_systemio800_info = {
> +static const TypeInfo prep_systemio800_info = {
>      .name          = TYPE_PREP_SYSTEMIO,
>      .parent        = TYPE_ISA_DEVICE,
>      .instance_size = sizeof(PrepSystemIoState),
> diff --git a/hw/ppc/spapr_iommu.c b/hw/ppc/spapr_iommu.c
> index db01071858..81e5a1aea3 100644
> --- a/hw/ppc/spapr_iommu.c
> +++ b/hw/ppc/spapr_iommu.c
> @@ -685,7 +685,7 @@ static void spapr_tce_table_class_init(ObjectClass
> *klass, void *data)
>      spapr_register_hypercall(H_STUFF_TCE, h_stuff_tce);
>  }
>
> -static TypeInfo spapr_tce_table_info = {
> +static const TypeInfo spapr_tce_table_info = {
>      .name = TYPE_SPAPR_TCE_TABLE,
>      .parent = TYPE_DEVICE,
>      .instance_size = sizeof(SpaprTceTable),
> diff --git a/hw/s390x/s390-pci-bus.c b/hw/s390x/s390-pci-bus.c
> index 01b58ebc70..4b2bdd94b3 100644
> --- a/hw/s390x/s390-pci-bus.c
> +++ b/hw/s390x/s390-pci-bus.c
> @@ -1392,7 +1392,7 @@ static const TypeInfo s390_pci_device_info = {
>      .class_init = s390_pci_device_class_init,
>  };
>
> -static TypeInfo s390_pci_iommu_info = {
> +static const TypeInfo s390_pci_iommu_info = {
>      .name = TYPE_S390_PCI_IOMMU,
>      .parent = TYPE_OBJECT,
>      .instance_size = sizeof(S390PCIIOMMU),
> diff --git a/hw/s390x/sclp.c b/hw/s390x/sclp.c
> index 89c30a8a91..eff74479f4 100644
> --- a/hw/s390x/sclp.c
> +++ b/hw/s390x/sclp.c
> @@ -460,7 +460,7 @@ static void sclp_class_init(ObjectClass *oc, void
> *data)
>      sc->service_interrupt = service_interrupt;
>  }
>
> -static TypeInfo sclp_info = {
> +static const TypeInfo sclp_info = {
>      .name = TYPE_SCLP,
>      .parent = TYPE_DEVICE,
>      .instance_init = sclp_init,
> diff --git a/hw/s390x/tod-kvm.c b/hw/s390x/tod-kvm.c
> index ec855811ae..9d0cbfbce2 100644
> --- a/hw/s390x/tod-kvm.c
> +++ b/hw/s390x/tod-kvm.c
> @@ -147,7 +147,7 @@ static void kvm_s390_tod_init(Object *obj)
>      td->stopped = false;
>  }
>
> -static TypeInfo kvm_s390_tod_info = {
> +static const TypeInfo kvm_s390_tod_info = {
>      .name = TYPE_KVM_S390_TOD,
>      .parent = TYPE_S390_TOD,
>      .instance_size = sizeof(S390TODState),
> diff --git a/hw/s390x/tod-tcg.c b/hw/s390x/tod-tcg.c
> index 9bb94ff72b..ad4993203d 100644
> --- a/hw/s390x/tod-tcg.c
> +++ b/hw/s390x/tod-tcg.c
> @@ -73,7 +73,7 @@ static void qemu_s390_tod_init(Object *obj)
>      }
>  }
>
> -static TypeInfo qemu_s390_tod_info = {
> +static const TypeInfo qemu_s390_tod_info = {
>      .name = TYPE_QEMU_S390_TOD,
>      .parent = TYPE_S390_TOD,
>      .instance_size = sizeof(S390TODState),
> diff --git a/hw/s390x/tod.c b/hw/s390x/tod.c
> index fd5a36bf24..c81b1c0338 100644
> --- a/hw/s390x/tod.c
> +++ b/hw/s390x/tod.c
> @@ -123,7 +123,7 @@ static void s390_tod_class_init(ObjectClass *oc, void
> *data)
>      dc->user_creatable = false;
>  }
>
> -static TypeInfo s390_tod_info = {
> +static const TypeInfo s390_tod_info = {
>      .name = TYPE_S390_TOD,
>      .parent = TYPE_DEVICE,
>      .instance_size = sizeof(S390TODState),
> diff --git a/hw/scsi/lsi53c895a.c b/hw/scsi/lsi53c895a.c
> index 4c431adb77..c8773f73f7 100644
> --- a/hw/scsi/lsi53c895a.c
> +++ b/hw/scsi/lsi53c895a.c
> @@ -2352,7 +2352,7 @@ static void lsi53c810_class_init(ObjectClass *klass,
> void *data)
>      k->device_id = PCI_DEVICE_ID_LSI_53C810;
>  }
>
> -static TypeInfo lsi53c810_info = {
> +static const TypeInfo lsi53c810_info = {
>      .name          = TYPE_LSI53C810,
>      .parent        = TYPE_LSI53C895A,
>      .class_init    = lsi53c810_class_init,
> diff --git a/hw/sd/allwinner-sdhost.c b/hw/sd/allwinner-sdhost.c
> index de5bc49e68..041e45c680 100644
> --- a/hw/sd/allwinner-sdhost.c
> +++ b/hw/sd/allwinner-sdhost.c
> @@ -835,7 +835,7 @@ static void
> allwinner_sdhost_sun5i_class_init(ObjectClass *klass, void *data)
>      sc->max_desc_size = 64 * KiB;
>  }
>
> -static TypeInfo allwinner_sdhost_info = {
> +static const TypeInfo allwinner_sdhost_info = {
>      .name          = TYPE_AW_SDHOST,
>      .parent        = TYPE_SYS_BUS_DEVICE,
>      .instance_init = allwinner_sdhost_init,
> diff --git a/hw/sd/aspeed_sdhci.c b/hw/sd/aspeed_sdhci.c
> index df1bdf1fa4..be8cafd65f 100644
> --- a/hw/sd/aspeed_sdhci.c
> +++ b/hw/sd/aspeed_sdhci.c
> @@ -198,7 +198,7 @@ static void aspeed_sdhci_class_init(ObjectClass
> *classp, void *data)
>      device_class_set_props(dc, aspeed_sdhci_properties);
>  }
>
> -static TypeInfo aspeed_sdhci_info = {
> +static const TypeInfo aspeed_sdhci_info = {
>      .name          = TYPE_ASPEED_SDHCI,
>      .parent        = TYPE_SYS_BUS_DEVICE,
>      .instance_size = sizeof(AspeedSDHCIState),
> diff --git a/hw/sd/bcm2835_sdhost.c b/hw/sd/bcm2835_sdhost.c
> index 088a7ac6ed..9431c35914 100644
> --- a/hw/sd/bcm2835_sdhost.c
> +++ b/hw/sd/bcm2835_sdhost.c
> @@ -436,7 +436,7 @@ static void bcm2835_sdhost_class_init(ObjectClass
> *klass, void *data)
>      dc->vmsd = &vmstate_bcm2835_sdhost;
>  }
>
> -static TypeInfo bcm2835_sdhost_info = {
> +static const TypeInfo bcm2835_sdhost_info = {
>      .name          = TYPE_BCM2835_SDHOST,
>      .parent        = TYPE_SYS_BUS_DEVICE,
>      .instance_size = sizeof(BCM2835SDHostState),
> diff --git a/hw/sd/cadence_sdhci.c b/hw/sd/cadence_sdhci.c
> index 56b8bae1c3..75db34befe 100644
> --- a/hw/sd/cadence_sdhci.c
> +++ b/hw/sd/cadence_sdhci.c
> @@ -175,7 +175,7 @@ static void cadence_sdhci_class_init(ObjectClass
> *classp, void *data)
>      dc->vmsd = &vmstate_cadence_sdhci;
>  }
>
> -static TypeInfo cadence_sdhci_info = {
> +static const TypeInfo cadence_sdhci_info = {
>      .name          = TYPE_CADENCE_SDHCI,
>      .parent        = TYPE_SYS_BUS_DEVICE,
>      .instance_size = sizeof(CadenceSDHCIState),
> diff --git a/hw/sd/npcm7xx_sdhci.c b/hw/sd/npcm7xx_sdhci.c
> index ef503365df..b2f5b4a542 100644
> --- a/hw/sd/npcm7xx_sdhci.c
> +++ b/hw/sd/npcm7xx_sdhci.c
> @@ -166,7 +166,7 @@ static void npcm7xx_sdhci_instance_init(Object *obj)
>                              TYPE_SYSBUS_SDHCI);
>  }
>
> -static TypeInfo npcm7xx_sdhci_info = {
> +static const TypeInfo npcm7xx_sdhci_info = {
>      .name = TYPE_NPCM7XX_SDHCI,
>      .parent = TYPE_SYS_BUS_DEVICE,
>      .instance_size = sizeof(NPCM7xxSDHCIState),
> diff --git a/hw/usb/dev-mtp.c b/hw/usb/dev-mtp.c
> index c1d1694fd0..1e6ac76bef 100644
> --- a/hw/usb/dev-mtp.c
> +++ b/hw/usb/dev-mtp.c
> @@ -2106,7 +2106,7 @@ static void usb_mtp_class_initfn(ObjectClass *klass,
> void *data)
>      device_class_set_props(dc, mtp_properties);
>  }
>
> -static TypeInfo mtp_info = {
> +static const TypeInfo mtp_info = {
>      .name          = TYPE_USB_MTP,
>      .parent        = TYPE_USB_DEVICE,
>      .instance_size = sizeof(MTPState),
> diff --git a/hw/usb/host-libusb.c b/hw/usb/host-libusb.c
> index d0d46dd0a4..2b35cb6cdd 100644
> --- a/hw/usb/host-libusb.c
> +++ b/hw/usb/host-libusb.c
> @@ -1801,7 +1801,7 @@ static void usb_host_class_initfn(ObjectClass
> *klass, void *data)
>      set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
>  }
>
> -static TypeInfo usb_host_dev_info = {
> +static const TypeInfo usb_host_dev_info = {
>      .name          = TYPE_USB_HOST_DEVICE,
>      .parent        = TYPE_USB_DEVICE,
>      .instance_size = sizeof(USBHostDevice),
> diff --git a/hw/vfio/igd.c b/hw/vfio/igd.c
> index d4685709a3..afe3fe7efc 100644
> --- a/hw/vfio/igd.c
> +++ b/hw/vfio/igd.c
> @@ -199,7 +199,7 @@ static void
> vfio_pci_igd_lpc_bridge_class_init(ObjectClass *klass, void *data)
>      k->class_id = PCI_CLASS_BRIDGE_ISA;
>  }
>
> -static TypeInfo vfio_pci_igd_lpc_bridge_info = {
> +static const TypeInfo vfio_pci_igd_lpc_bridge_info = {
>      .name = "vfio-pci-igd-lpc-bridge",
>      .parent = TYPE_PCI_DEVICE,
>      .class_init = vfio_pci_igd_lpc_bridge_class_init,
> diff --git a/hw/virtio/virtio-pmem.c b/hw/virtio/virtio-pmem.c
> index d1aeb90a31..5419dca75e 100644
> --- a/hw/virtio/virtio-pmem.c
> +++ b/hw/virtio/virtio-pmem.c
> @@ -182,7 +182,7 @@ static void virtio_pmem_class_init(ObjectClass *klass,
> void *data)
>      set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
>  }
>
> -static TypeInfo virtio_pmem_info = {
> +static const TypeInfo virtio_pmem_info = {
>      .name          = TYPE_VIRTIO_PMEM,
>      .parent        = TYPE_VIRTIO_DEVICE,
>      .class_size    = sizeof(VirtIOPMEMClass),
> diff --git a/qom/object.c b/qom/object.c
> index 4f0677cca9..9f7a33139d 100644
> --- a/qom/object.c
> +++ b/qom/object.c
> @@ -2793,13 +2793,13 @@ static void object_class_init(ObjectClass *klass,
> void *data)
>
>  static void register_types(void)
>  {
> -    static TypeInfo interface_info = {
> +    static const TypeInfo interface_info = {
>          .name = TYPE_INTERFACE,
>          .class_size = sizeof(InterfaceClass),
>          .abstract = true,
>      };
>
> -    static TypeInfo object_info = {
> +    static const TypeInfo object_info = {
>          .name = TYPE_OBJECT,
>          .instance_size = sizeof(Object),
>          .class_init = object_class_init,
> --
> 2.34.1
>
>

--00000000000081316405d5c8861b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Philippe,</div><div><br></div><div>Thanks for your=
 review. I&#39;ve now sent v2 of the patch with your comments addressed.</d=
iv><div><br></div><div>BTW: I almost missed your review  because apparently=
 I wasn&#39;t in the CC. That is also the reason I&#39;m not responding to =
your mail directly.<br></div><div><br></div>Bernhard.<br></div><br><div cla=
ss=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jan 13, 20=
22 at 6:10 PM Bernhard Beschow &lt;<a href=3D"mailto:shentey@gmail.com">she=
ntey@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">More than 1k of TypeInfo instances are already marked as cons=
t. Mark the<br>
remaining ones, too.<br>
<br>
Signed-off-by: Bernhard Beschow &lt;<a href=3D"mailto:shentey@gmail.com" ta=
rget=3D"_blank">shentey@gmail.com</a>&gt;<br>
---<br>
=C2=A0hw/core/generic-loader.c=C2=A0 =C2=A0| 2 +-<br>
=C2=A0hw/core/guest-loader.c=C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A0hw/display/bcm2835_fb.c=C2=A0 =C2=A0 | 2 +-<br>
=C2=A0hw/display/i2c-ddc.c=C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A0hw/display/macfb.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
=C2=A0hw/display/virtio-vga.c=C2=A0 =C2=A0 | 2 +-<br>
=C2=A0hw/dma/bcm2835_dma.c=C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A0hw/i386/pc_piix.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0hw/i386/sgx-epc.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0hw/intc/bcm2835_ic.c=C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A0hw/intc/bcm2836_control.c=C2=A0 | 2 +-<br>
=C2=A0hw/ipmi/ipmi.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++-=
-<br>
=C2=A0hw/mem/nvdimm.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0hw/mem/pc-dimm.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A0hw/misc/bcm2835_mbox.c=C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A0hw/misc/bcm2835_powermgt.c | 2 +-<br>
=C2=A0hw/misc/bcm2835_property.c | 2 +-<br>
=C2=A0hw/misc/bcm2835_rng.c=C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0hw/misc/pvpanic-isa.c=C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0hw/misc/pvpanic-pci.c=C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0hw/net/fsl_etsec/etsec.c=C2=A0 =C2=A0| 2 +-<br>
=C2=A0hw/ppc/prep_systemio.c=C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A0hw/ppc/spapr_iommu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A0hw/s390x/s390-pci-bus.c=C2=A0 =C2=A0 | 2 +-<br>
=C2=A0hw/s390x/sclp.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0hw/s390x/tod-kvm.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A0hw/s390x/tod-tcg.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A0hw/s390x/tod.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<=
br>
=C2=A0hw/scsi/lsi53c895a.c=C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A0hw/sd/allwinner-sdhost.c=C2=A0 =C2=A0| 2 +-<br>
=C2=A0hw/sd/aspeed_sdhci.c=C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A0hw/sd/bcm2835_sdhost.c=C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A0hw/sd/cadence_sdhci.c=C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0hw/sd/npcm7xx_sdhci.c=C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0hw/usb/dev-mtp.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A0hw/usb/host-libusb.c=C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A0hw/vfio/igd.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<=
br>
=C2=A0hw/virtio/virtio-pmem.c=C2=A0 =C2=A0 | 2 +-<br>
=C2=A0qom/object.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =
4 ++--<br>
=C2=A039 files changed, 42 insertions(+), 42 deletions(-)<br>
<br>
diff --git a/hw/core/generic-loader.c b/hw/core/generic-loader.c<br>
index 9a24ffb880..eaafc416f4 100644<br>
--- a/hw/core/generic-loader.c<br>
+++ b/hw/core/generic-loader.c<br>
@@ -207,7 +207,7 @@ static void generic_loader_class_init(ObjectClass *klas=
s, void *data)<br>
=C2=A0 =C2=A0 =C2=A0set_bit(DEVICE_CATEGORY_MISC, dc-&gt;categories);<br>
=C2=A0}<br>
<br>
-static TypeInfo generic_loader_info =3D {<br>
+static const TypeInfo generic_loader_info =3D {<br>
=C2=A0 =C2=A0 =C2=A0.name =3D TYPE_GENERIC_LOADER,<br>
=C2=A0 =C2=A0 =C2=A0.parent =3D TYPE_DEVICE,<br>
=C2=A0 =C2=A0 =C2=A0.instance_size =3D sizeof(GenericLoaderState),<br>
diff --git a/hw/core/guest-loader.c b/hw/core/guest-loader.c<br>
index d3f9d1a06e..391c875a29 100644<br>
--- a/hw/core/guest-loader.c<br>
+++ b/hw/core/guest-loader.c<br>
@@ -129,7 +129,7 @@ static void guest_loader_class_init(ObjectClass *klass,=
 void *data)<br>
=C2=A0 =C2=A0 =C2=A0set_bit(DEVICE_CATEGORY_MISC, dc-&gt;categories);<br>
=C2=A0}<br>
<br>
-static TypeInfo guest_loader_info =3D {<br>
+static const TypeInfo guest_loader_info =3D {<br>
=C2=A0 =C2=A0 =C2=A0.name =3D TYPE_GUEST_LOADER,<br>
=C2=A0 =C2=A0 =C2=A0.parent =3D TYPE_DEVICE,<br>
=C2=A0 =C2=A0 =C2=A0.instance_size =3D sizeof(GuestLoaderState),<br>
diff --git a/hw/display/bcm2835_fb.c b/hw/display/bcm2835_fb.c<br>
index 2be77bdd3a..088fc3d51c 100644<br>
--- a/hw/display/bcm2835_fb.c<br>
+++ b/hw/display/bcm2835_fb.c<br>
@@ -454,7 +454,7 @@ static void bcm2835_fb_class_init(ObjectClass *klass, v=
oid *data)<br>
=C2=A0 =C2=A0 =C2=A0dc-&gt;vmsd =3D &amp;vmstate_bcm2835_fb;<br>
=C2=A0}<br>
<br>
-static TypeInfo bcm2835_fb_info =3D {<br>
+static const TypeInfo bcm2835_fb_info =3D {<br>
=C2=A0 =C2=A0 =C2=A0.name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_BCM283=
5_FB,<br>
=C2=A0 =C2=A0 =C2=A0.parent=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_SYS_BUS_DEV=
ICE,<br>
=C2=A0 =C2=A0 =C2=A0.instance_size =3D sizeof(BCM2835FBState),<br>
diff --git a/hw/display/i2c-ddc.c b/hw/display/i2c-ddc.c<br>
index 13eb529fc1..146489518c 100644<br>
--- a/hw/display/i2c-ddc.c<br>
+++ b/hw/display/i2c-ddc.c<br>
@@ -113,7 +113,7 @@ static void i2c_ddc_class_init(ObjectClass *oc, void *d=
ata)<br>
=C2=A0 =C2=A0 =C2=A0isc-&gt;send =3D i2c_ddc_tx;<br>
=C2=A0}<br>
<br>
-static TypeInfo i2c_ddc_info =3D {<br>
+static const TypeInfo i2c_ddc_info =3D {<br>
=C2=A0 =C2=A0 =C2=A0.name =3D TYPE_I2CDDC,<br>
=C2=A0 =C2=A0 =C2=A0.parent =3D TYPE_I2C_SLAVE,<br>
=C2=A0 =C2=A0 =C2=A0.instance_size =3D sizeof(I2CDDCState),<br>
diff --git a/hw/display/macfb.c b/hw/display/macfb.c<br>
index 4bd7c3ad6a..69c2ea2b6e 100644<br>
--- a/hw/display/macfb.c<br>
+++ b/hw/display/macfb.c<br>
@@ -783,14 +783,14 @@ static void macfb_nubus_class_init(ObjectClass *klass=
, void *data)<br>
=C2=A0 =C2=A0 =C2=A0device_class_set_props(dc, macfb_nubus_properties);<br>
=C2=A0}<br>
<br>
-static TypeInfo macfb_sysbus_info =3D {<br>
+static const TypeInfo macfb_sysbus_info =3D {<br>
=C2=A0 =C2=A0 =C2=A0.name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_MACFB,=
<br>
=C2=A0 =C2=A0 =C2=A0.parent=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_SYS_BUS_DEV=
ICE,<br>
=C2=A0 =C2=A0 =C2=A0.instance_size =3D sizeof(MacfbSysBusState),<br>
=C2=A0 =C2=A0 =C2=A0.class_init=C2=A0 =C2=A0 =3D macfb_sysbus_class_init,<b=
r>
=C2=A0};<br>
<br>
-static TypeInfo macfb_nubus_info =3D {<br>
+static const TypeInfo macfb_nubus_info =3D {<br>
=C2=A0 =C2=A0 =C2=A0.name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_NUBUS_=
MACFB,<br>
=C2=A0 =C2=A0 =C2=A0.parent=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_NUBUS_DEVIC=
E,<br>
=C2=A0 =C2=A0 =C2=A0.instance_size =3D sizeof(MacfbNubusState),<br>
diff --git a/hw/display/virtio-vga.c b/hw/display/virtio-vga.c<br>
index b23a75a04b..5a2f7a4540 100644<br>
--- a/hw/display/virtio-vga.c<br>
+++ b/hw/display/virtio-vga.c<br>
@@ -220,7 +220,7 @@ static void virtio_vga_base_class_init(ObjectClass *kla=
ss, void *data)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 virtio_vga_set_big_end=
ian_fb);<br>
=C2=A0}<br>
<br>
-static TypeInfo virtio_vga_base_info =3D {<br>
+static const TypeInfo virtio_vga_base_info =3D {<br>
=C2=A0 =C2=A0 =C2=A0.name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_VIRTIO=
_VGA_BASE,<br>
=C2=A0 =C2=A0 =C2=A0.parent=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_VIRTIO_PCI,=
<br>
=C2=A0 =C2=A0 =C2=A0.instance_size =3D sizeof(VirtIOVGABase),<br>
diff --git a/hw/dma/bcm2835_dma.c b/hw/dma/bcm2835_dma.c<br>
index eb0002a2b9..5e9306110d 100644<br>
--- a/hw/dma/bcm2835_dma.c<br>
+++ b/hw/dma/bcm2835_dma.c<br>
@@ -394,7 +394,7 @@ static void bcm2835_dma_class_init(ObjectClass *klass, =
void *data)<br>
=C2=A0 =C2=A0 =C2=A0dc-&gt;vmsd =3D &amp;vmstate_bcm2835_dma;<br>
=C2=A0}<br>
<br>
-static TypeInfo bcm2835_dma_info =3D {<br>
+static const TypeInfo bcm2835_dma_info =3D {<br>
=C2=A0 =C2=A0 =C2=A0.name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_BCM283=
5_DMA,<br>
=C2=A0 =C2=A0 =C2=A0.parent=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_SYS_BUS_DEV=
ICE,<br>
=C2=A0 =C2=A0 =C2=A0.instance_size =3D sizeof(BCM2835DMAState),<br>
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c<br>
index 7c7790a5ce..f6557d3c21 100644<br>
--- a/hw/i386/pc_piix.c<br>
+++ b/hw/i386/pc_piix.c<br>
@@ -865,7 +865,7 @@ static void isa_bridge_class_init(ObjectClass *klass, v=
oid *data)<br>
=C2=A0 =C2=A0 =C2=A0k-&gt;class_id=C2=A0 =C2=A0 =C2=A0=3D PCI_CLASS_BRIDGE_=
ISA;<br>
=C2=A0};<br>
<br>
-static TypeInfo isa_bridge_info =3D {<br>
+static const TypeInfo isa_bridge_info =3D {<br>
=C2=A0 =C2=A0 =C2=A0.name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;igd-p=
assthrough-isa-bridge&quot;,<br>
=C2=A0 =C2=A0 =C2=A0.parent=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_PCI_DEVICE,=
<br>
=C2=A0 =C2=A0 =C2=A0.instance_size =3D sizeof(PCIDevice),<br>
diff --git a/hw/i386/sgx-epc.c b/hw/i386/sgx-epc.c<br>
index 96b2940d75..d664829d35 100644<br>
--- a/hw/i386/sgx-epc.c<br>
+++ b/hw/i386/sgx-epc.c<br>
@@ -167,7 +167,7 @@ static void sgx_epc_class_init(ObjectClass *oc, void *d=
ata)<br>
=C2=A0 =C2=A0 =C2=A0mdc-&gt;fill_device_info =3D sgx_epc_md_fill_device_inf=
o;<br>
=C2=A0}<br>
<br>
-static TypeInfo sgx_epc_info =3D {<br>
+static const TypeInfo sgx_epc_info =3D {<br>
=C2=A0 =C2=A0 =C2=A0.name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_SGX_EP=
C,<br>
=C2=A0 =C2=A0 =C2=A0.parent=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_DEVICE,<br>
=C2=A0 =C2=A0 =C2=A0.instance_size =3D sizeof(SGXEPCDevice),<br>
diff --git a/hw/intc/bcm2835_ic.c b/hw/intc/bcm2835_ic.c<br>
index 9000d995e8..4513fad16f 100644<br>
--- a/hw/intc/bcm2835_ic.c<br>
+++ b/hw/intc/bcm2835_ic.c<br>
@@ -227,7 +227,7 @@ static void bcm2835_ic_class_init(ObjectClass *klass, v=
oid *data)<br>
=C2=A0 =C2=A0 =C2=A0dc-&gt;vmsd =3D &amp;vmstate_bcm2835_ic;<br>
=C2=A0}<br>
<br>
-static TypeInfo bcm2835_ic_info =3D {<br>
+static const TypeInfo bcm2835_ic_info =3D {<br>
=C2=A0 =C2=A0 =C2=A0.name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_BCM283=
5_IC,<br>
=C2=A0 =C2=A0 =C2=A0.parent=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_SYS_BUS_DEV=
ICE,<br>
=C2=A0 =C2=A0 =C2=A0.instance_size =3D sizeof(BCM2835ICState),<br>
diff --git a/hw/intc/bcm2836_control.c b/hw/intc/bcm2836_control.c<br>
index 2ead76ffdc..b0589df188 100644<br>
--- a/hw/intc/bcm2836_control.c<br>
+++ b/hw/intc/bcm2836_control.c<br>
@@ -392,7 +392,7 @@ static void bcm2836_control_class_init(ObjectClass *kla=
ss, void *data)<br>
=C2=A0 =C2=A0 =C2=A0dc-&gt;vmsd =3D &amp;vmstate_bcm2836_control;<br>
=C2=A0}<br>
<br>
-static TypeInfo bcm2836_control_info =3D {<br>
+static const TypeInfo bcm2836_control_info =3D {<br>
=C2=A0 =C2=A0 =C2=A0.name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_BCM283=
6_CONTROL,<br>
=C2=A0 =C2=A0 =C2=A0.parent=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_SYS_BUS_DEV=
ICE,<br>
=C2=A0 =C2=A0 =C2=A0.instance_size =3D sizeof(BCM2836ControlState),<br>
diff --git a/hw/ipmi/ipmi.c b/hw/ipmi/ipmi.c<br>
index 8d35c9fdd6..bbb07b151e 100644<br>
--- a/hw/ipmi/ipmi.c<br>
+++ b/hw/ipmi/ipmi.c<br>
@@ -85,7 +85,7 @@ static void ipmi_interface_class_init(ObjectClass *class,=
 void *data)<br>
=C2=A0 =C2=A0 =C2=A0ik-&gt;do_hw_op =3D ipmi_do_hw_op;<br>
=C2=A0}<br>
<br>
-static TypeInfo ipmi_interface_type_info =3D {<br>
+static const TypeInfo ipmi_interface_type_info =3D {<br>
=C2=A0 =C2=A0 =C2=A0.name =3D TYPE_IPMI_INTERFACE,<br>
=C2=A0 =C2=A0 =C2=A0.parent =3D TYPE_INTERFACE,<br>
=C2=A0 =C2=A0 =C2=A0.class_size =3D sizeof(IPMIInterfaceClass),<br>
@@ -120,7 +120,7 @@ static void bmc_class_init(ObjectClass *oc, void *data)=
<br>
=C2=A0 =C2=A0 =C2=A0device_class_set_props(dc, ipmi_bmc_properties);<br>
=C2=A0}<br>
<br>
-static TypeInfo ipmi_bmc_type_info =3D {<br>
+static const TypeInfo ipmi_bmc_type_info =3D {<br>
=C2=A0 =C2=A0 =C2=A0.name =3D TYPE_IPMI_BMC,<br>
=C2=A0 =C2=A0 =C2=A0.parent =3D TYPE_DEVICE,<br>
=C2=A0 =C2=A0 =C2=A0.instance_size =3D sizeof(IPMIBmc),<br>
diff --git a/hw/mem/nvdimm.c b/hw/mem/nvdimm.c<br>
index 7397b67156..933bc5e0c7 100644<br>
--- a/hw/mem/nvdimm.c<br>
+++ b/hw/mem/nvdimm.c<br>
@@ -248,7 +248,7 @@ static void nvdimm_class_init(ObjectClass *oc, void *da=
ta)<br>
=C2=A0 =C2=A0 =C2=A0set_bit(DEVICE_CATEGORY_STORAGE, dc-&gt;categories);<br=
>
=C2=A0}<br>
<br>
-static TypeInfo nvdimm_info =3D {<br>
+static const TypeInfo nvdimm_info =3D {<br>
=C2=A0 =C2=A0 =C2=A0.name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_NVDIMM=
,<br>
=C2=A0 =C2=A0 =C2=A0.parent=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_PC_DIMM,<br=
>
=C2=A0 =C2=A0 =C2=A0.class_size=C2=A0 =C2=A0 =3D sizeof(NVDIMMClass),<br>
diff --git a/hw/mem/pc-dimm.c b/hw/mem/pc-dimm.c<br>
index 48b913aba6..28af0d71b2 100644<br>
--- a/hw/mem/pc-dimm.c<br>
+++ b/hw/mem/pc-dimm.c<br>
@@ -286,7 +286,7 @@ static void pc_dimm_class_init(ObjectClass *oc, void *d=
ata)<br>
=C2=A0 =C2=A0 =C2=A0mdc-&gt;fill_device_info =3D pc_dimm_md_fill_device_inf=
o;<br>
=C2=A0}<br>
<br>
-static TypeInfo pc_dimm_info =3D {<br>
+static const TypeInfo pc_dimm_info =3D {<br>
=C2=A0 =C2=A0 =C2=A0.name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_PC_DIM=
M,<br>
=C2=A0 =C2=A0 =C2=A0.parent=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_DEVICE,<br>
=C2=A0 =C2=A0 =C2=A0.instance_size =3D sizeof(PCDIMMDevice),<br>
diff --git a/hw/misc/bcm2835_mbox.c b/hw/misc/bcm2835_mbox.c<br>
index 9f73cbd5e4..1908c152f6 100644<br>
--- a/hw/misc/bcm2835_mbox.c<br>
+++ b/hw/misc/bcm2835_mbox.c<br>
@@ -324,7 +324,7 @@ static void bcm2835_mbox_class_init(ObjectClass *klass,=
 void *data)<br>
=C2=A0 =C2=A0 =C2=A0dc-&gt;vmsd =3D &amp;vmstate_bcm2835_mbox;<br>
=C2=A0}<br>
<br>
-static TypeInfo bcm2835_mbox_info =3D {<br>
+static const TypeInfo bcm2835_mbox_info =3D {<br>
=C2=A0 =C2=A0 =C2=A0.name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_BCM283=
5_MBOX,<br>
=C2=A0 =C2=A0 =C2=A0.parent=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_SYS_BUS_DEV=
ICE,<br>
=C2=A0 =C2=A0 =C2=A0.instance_size =3D sizeof(BCM2835MboxState),<br>
diff --git a/hw/misc/bcm2835_powermgt.c b/hw/misc/bcm2835_powermgt.c<br>
index 25fa804cbd..976f3d34e5 100644<br>
--- a/hw/misc/bcm2835_powermgt.c<br>
+++ b/hw/misc/bcm2835_powermgt.c<br>
@@ -144,7 +144,7 @@ static void bcm2835_powermgt_class_init(ObjectClass *kl=
ass, void *data)<br>
=C2=A0 =C2=A0 =C2=A0dc-&gt;vmsd =3D &amp;vmstate_bcm2835_powermgt;<br>
=C2=A0}<br>
<br>
-static TypeInfo bcm2835_powermgt_info =3D {<br>
+static const TypeInfo bcm2835_powermgt_info =3D {<br>
=C2=A0 =C2=A0 =C2=A0.name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_BCM283=
5_POWERMGT,<br>
=C2=A0 =C2=A0 =C2=A0.parent=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_SYS_BUS_DEV=
ICE,<br>
=C2=A0 =C2=A0 =C2=A0.instance_size =3D sizeof(BCM2835PowerMgtState),<br>
diff --git a/hw/misc/bcm2835_property.c b/hw/misc/bcm2835_property.c<br>
index 76ea511d53..e94e951057 100644<br>
--- a/hw/misc/bcm2835_property.c<br>
+++ b/hw/misc/bcm2835_property.c<br>
@@ -421,7 +421,7 @@ static void bcm2835_property_class_init(ObjectClass *kl=
ass, void *data)<br>
=C2=A0 =C2=A0 =C2=A0dc-&gt;vmsd =3D &amp;vmstate_bcm2835_property;<br>
=C2=A0}<br>
<br>
-static TypeInfo bcm2835_property_info =3D {<br>
+static const TypeInfo bcm2835_property_info =3D {<br>
=C2=A0 =C2=A0 =C2=A0.name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_BCM283=
5_PROPERTY,<br>
=C2=A0 =C2=A0 =C2=A0.parent=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_SYS_BUS_DEV=
ICE,<br>
=C2=A0 =C2=A0 =C2=A0.instance_size =3D sizeof(BCM2835PropertyState),<br>
diff --git a/hw/misc/bcm2835_rng.c b/hw/misc/bcm2835_rng.c<br>
index d0c4e64e88..b3c80cf186 100644<br>
--- a/hw/misc/bcm2835_rng.c<br>
+++ b/hw/misc/bcm2835_rng.c<br>
@@ -131,7 +131,7 @@ static void bcm2835_rng_class_init(ObjectClass *klass, =
void *data)<br>
=C2=A0 =C2=A0 =C2=A0dc-&gt;vmsd =3D &amp;vmstate_bcm2835_rng;<br>
=C2=A0}<br>
<br>
-static TypeInfo bcm2835_rng_info =3D {<br>
+static const TypeInfo bcm2835_rng_info =3D {<br>
=C2=A0 =C2=A0 =C2=A0.name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_BCM283=
5_RNG,<br>
=C2=A0 =C2=A0 =C2=A0.parent=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_SYS_BUS_DEV=
ICE,<br>
=C2=A0 =C2=A0 =C2=A0.instance_size =3D sizeof(BCM2835RngState),<br>
diff --git a/hw/misc/pvpanic-isa.c b/hw/misc/pvpanic-isa.c<br>
index 7b66d58acc..a39fcdd1fc 100644<br>
--- a/hw/misc/pvpanic-isa.c<br>
+++ b/hw/misc/pvpanic-isa.c<br>
@@ -77,7 +77,7 @@ static void pvpanic_isa_class_init(ObjectClass *klass, vo=
id *data)<br>
=C2=A0 =C2=A0 =C2=A0set_bit(DEVICE_CATEGORY_MISC, dc-&gt;categories);<br>
=C2=A0}<br>
<br>
-static TypeInfo pvpanic_isa_info =3D {<br>
+static const TypeInfo pvpanic_isa_info =3D {<br>
=C2=A0 =C2=A0 =C2=A0.name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_PVPANI=
C_ISA_DEVICE,<br>
=C2=A0 =C2=A0 =C2=A0.parent=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_ISA_DEVICE,=
<br>
=C2=A0 =C2=A0 =C2=A0.instance_size =3D sizeof(PVPanicISAState),<br>
diff --git a/hw/misc/pvpanic-pci.c b/hw/misc/pvpanic-pci.c<br>
index af8cbe2830..62e1be68c1 100644<br>
--- a/hw/misc/pvpanic-pci.c<br>
+++ b/hw/misc/pvpanic-pci.c<br>
@@ -74,7 +74,7 @@ static void pvpanic_pci_class_init(ObjectClass *klass, vo=
id *data)<br>
=C2=A0 =C2=A0 =C2=A0set_bit(DEVICE_CATEGORY_MISC, dc-&gt;categories);<br>
=C2=A0}<br>
<br>
-static TypeInfo pvpanic_pci_info =3D {<br>
+static const TypeInfo pvpanic_pci_info =3D {<br>
=C2=A0 =C2=A0 =C2=A0.name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_PVPANI=
C_PCI_DEVICE,<br>
=C2=A0 =C2=A0 =C2=A0.parent=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_PCI_DEVICE,=
<br>
=C2=A0 =C2=A0 =C2=A0.instance_size =3D sizeof(PVPanicPCIState),<br>
diff --git a/hw/net/fsl_etsec/etsec.c b/hw/net/fsl_etsec/etsec.c<br>
index bd9d62b559..e7fc082518 100644<br>
--- a/hw/net/fsl_etsec/etsec.c<br>
+++ b/hw/net/fsl_etsec/etsec.c<br>
@@ -430,7 +430,7 @@ static void etsec_class_init(ObjectClass *klass, void *=
data)<br>
=C2=A0 =C2=A0 =C2=A0dc-&gt;user_creatable =3D true;<br>
=C2=A0}<br>
<br>
-static TypeInfo etsec_info =3D {<br>
+static const TypeInfo etsec_info =3D {<br>
=C2=A0 =C2=A0 =C2=A0.name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =3D TYPE_ETSEC_COMMON,<br>
=C2=A0 =C2=A0 =C2=A0.parent=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =3D TYPE_SYS_BUS_DEVICE,<br>
=C2=A0 =C2=A0 =C2=A0.instance_size=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D siz=
eof(eTSEC),<br>
diff --git a/hw/ppc/prep_systemio.c b/hw/ppc/prep_systemio.c<br>
index b2bd783248..8c9b8dd67b 100644<br>
--- a/hw/ppc/prep_systemio.c<br>
+++ b/hw/ppc/prep_systemio.c<br>
@@ -300,7 +300,7 @@ static void prep_systemio_class_initfn(ObjectClass *kla=
ss, void *data)<br>
=C2=A0 =C2=A0 =C2=A0device_class_set_props(dc, prep_systemio_properties);<b=
r>
=C2=A0}<br>
<br>
-static TypeInfo prep_systemio800_info =3D {<br>
+static const TypeInfo prep_systemio800_info =3D {<br>
=C2=A0 =C2=A0 =C2=A0.name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_PREP_S=
YSTEMIO,<br>
=C2=A0 =C2=A0 =C2=A0.parent=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_ISA_DEVICE,=
<br>
=C2=A0 =C2=A0 =C2=A0.instance_size =3D sizeof(PrepSystemIoState),<br>
diff --git a/hw/ppc/spapr_iommu.c b/hw/ppc/spapr_iommu.c<br>
index db01071858..81e5a1aea3 100644<br>
--- a/hw/ppc/spapr_iommu.c<br>
+++ b/hw/ppc/spapr_iommu.c<br>
@@ -685,7 +685,7 @@ static void spapr_tce_table_class_init(ObjectClass *kla=
ss, void *data)<br>
=C2=A0 =C2=A0 =C2=A0spapr_register_hypercall(H_STUFF_TCE, h_stuff_tce);<br>
=C2=A0}<br>
<br>
-static TypeInfo spapr_tce_table_info =3D {<br>
+static const TypeInfo spapr_tce_table_info =3D {<br>
=C2=A0 =C2=A0 =C2=A0.name =3D TYPE_SPAPR_TCE_TABLE,<br>
=C2=A0 =C2=A0 =C2=A0.parent =3D TYPE_DEVICE,<br>
=C2=A0 =C2=A0 =C2=A0.instance_size =3D sizeof(SpaprTceTable),<br>
diff --git a/hw/s390x/s390-pci-bus.c b/hw/s390x/s390-pci-bus.c<br>
index 01b58ebc70..4b2bdd94b3 100644<br>
--- a/hw/s390x/s390-pci-bus.c<br>
+++ b/hw/s390x/s390-pci-bus.c<br>
@@ -1392,7 +1392,7 @@ static const TypeInfo s390_pci_device_info =3D {<br>
=C2=A0 =C2=A0 =C2=A0.class_init =3D s390_pci_device_class_init,<br>
=C2=A0};<br>
<br>
-static TypeInfo s390_pci_iommu_info =3D {<br>
+static const TypeInfo s390_pci_iommu_info =3D {<br>
=C2=A0 =C2=A0 =C2=A0.name =3D TYPE_S390_PCI_IOMMU,<br>
=C2=A0 =C2=A0 =C2=A0.parent =3D TYPE_OBJECT,<br>
=C2=A0 =C2=A0 =C2=A0.instance_size =3D sizeof(S390PCIIOMMU),<br>
diff --git a/hw/s390x/sclp.c b/hw/s390x/sclp.c<br>
index 89c30a8a91..eff74479f4 100644<br>
--- a/hw/s390x/sclp.c<br>
+++ b/hw/s390x/sclp.c<br>
@@ -460,7 +460,7 @@ static void sclp_class_init(ObjectClass *oc, void *data=
)<br>
=C2=A0 =C2=A0 =C2=A0sc-&gt;service_interrupt =3D service_interrupt;<br>
=C2=A0}<br>
<br>
-static TypeInfo sclp_info =3D {<br>
+static const TypeInfo sclp_info =3D {<br>
=C2=A0 =C2=A0 =C2=A0.name =3D TYPE_SCLP,<br>
=C2=A0 =C2=A0 =C2=A0.parent =3D TYPE_DEVICE,<br>
=C2=A0 =C2=A0 =C2=A0.instance_init =3D sclp_init,<br>
diff --git a/hw/s390x/tod-kvm.c b/hw/s390x/tod-kvm.c<br>
index ec855811ae..9d0cbfbce2 100644<br>
--- a/hw/s390x/tod-kvm.c<br>
+++ b/hw/s390x/tod-kvm.c<br>
@@ -147,7 +147,7 @@ static void kvm_s390_tod_init(Object *obj)<br>
=C2=A0 =C2=A0 =C2=A0td-&gt;stopped =3D false;<br>
=C2=A0}<br>
<br>
-static TypeInfo kvm_s390_tod_info =3D {<br>
+static const TypeInfo kvm_s390_tod_info =3D {<br>
=C2=A0 =C2=A0 =C2=A0.name =3D TYPE_KVM_S390_TOD,<br>
=C2=A0 =C2=A0 =C2=A0.parent =3D TYPE_S390_TOD,<br>
=C2=A0 =C2=A0 =C2=A0.instance_size =3D sizeof(S390TODState),<br>
diff --git a/hw/s390x/tod-tcg.c b/hw/s390x/tod-tcg.c<br>
index 9bb94ff72b..ad4993203d 100644<br>
--- a/hw/s390x/tod-tcg.c<br>
+++ b/hw/s390x/tod-tcg.c<br>
@@ -73,7 +73,7 @@ static void qemu_s390_tod_init(Object *obj)<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
<br>
-static TypeInfo qemu_s390_tod_info =3D {<br>
+static const TypeInfo qemu_s390_tod_info =3D {<br>
=C2=A0 =C2=A0 =C2=A0.name =3D TYPE_QEMU_S390_TOD,<br>
=C2=A0 =C2=A0 =C2=A0.parent =3D TYPE_S390_TOD,<br>
=C2=A0 =C2=A0 =C2=A0.instance_size =3D sizeof(S390TODState),<br>
diff --git a/hw/s390x/tod.c b/hw/s390x/tod.c<br>
index fd5a36bf24..c81b1c0338 100644<br>
--- a/hw/s390x/tod.c<br>
+++ b/hw/s390x/tod.c<br>
@@ -123,7 +123,7 @@ static void s390_tod_class_init(ObjectClass *oc, void *=
data)<br>
=C2=A0 =C2=A0 =C2=A0dc-&gt;user_creatable =3D false;<br>
=C2=A0}<br>
<br>
-static TypeInfo s390_tod_info =3D {<br>
+static const TypeInfo s390_tod_info =3D {<br>
=C2=A0 =C2=A0 =C2=A0.name =3D TYPE_S390_TOD,<br>
=C2=A0 =C2=A0 =C2=A0.parent =3D TYPE_DEVICE,<br>
=C2=A0 =C2=A0 =C2=A0.instance_size =3D sizeof(S390TODState),<br>
diff --git a/hw/scsi/lsi53c895a.c b/hw/scsi/lsi53c895a.c<br>
index 4c431adb77..c8773f73f7 100644<br>
--- a/hw/scsi/lsi53c895a.c<br>
+++ b/hw/scsi/lsi53c895a.c<br>
@@ -2352,7 +2352,7 @@ static void lsi53c810_class_init(ObjectClass *klass, =
void *data)<br>
=C2=A0 =C2=A0 =C2=A0k-&gt;device_id =3D PCI_DEVICE_ID_LSI_53C810;<br>
=C2=A0}<br>
<br>
-static TypeInfo lsi53c810_info =3D {<br>
+static const TypeInfo lsi53c810_info =3D {<br>
=C2=A0 =C2=A0 =C2=A0.name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_LSI53C=
810,<br>
=C2=A0 =C2=A0 =C2=A0.parent=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_LSI53C895A,=
<br>
=C2=A0 =C2=A0 =C2=A0.class_init=C2=A0 =C2=A0 =3D lsi53c810_class_init,<br>
diff --git a/hw/sd/allwinner-sdhost.c b/hw/sd/allwinner-sdhost.c<br>
index de5bc49e68..041e45c680 100644<br>
--- a/hw/sd/allwinner-sdhost.c<br>
+++ b/hw/sd/allwinner-sdhost.c<br>
@@ -835,7 +835,7 @@ static void allwinner_sdhost_sun5i_class_init(ObjectCla=
ss *klass, void *data)<br>
=C2=A0 =C2=A0 =C2=A0sc-&gt;max_desc_size =3D 64 * KiB;<br>
=C2=A0}<br>
<br>
-static TypeInfo allwinner_sdhost_info =3D {<br>
+static const TypeInfo allwinner_sdhost_info =3D {<br>
=C2=A0 =C2=A0 =C2=A0.name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_AW_SDH=
OST,<br>
=C2=A0 =C2=A0 =C2=A0.parent=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_SYS_BUS_DEV=
ICE,<br>
=C2=A0 =C2=A0 =C2=A0.instance_init =3D allwinner_sdhost_init,<br>
diff --git a/hw/sd/aspeed_sdhci.c b/hw/sd/aspeed_sdhci.c<br>
index df1bdf1fa4..be8cafd65f 100644<br>
--- a/hw/sd/aspeed_sdhci.c<br>
+++ b/hw/sd/aspeed_sdhci.c<br>
@@ -198,7 +198,7 @@ static void aspeed_sdhci_class_init(ObjectClass *classp=
, void *data)<br>
=C2=A0 =C2=A0 =C2=A0device_class_set_props(dc, aspeed_sdhci_properties);<br=
>
=C2=A0}<br>
<br>
-static TypeInfo aspeed_sdhci_info =3D {<br>
+static const TypeInfo aspeed_sdhci_info =3D {<br>
=C2=A0 =C2=A0 =C2=A0.name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_ASPEED=
_SDHCI,<br>
=C2=A0 =C2=A0 =C2=A0.parent=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_SYS_BUS_DEV=
ICE,<br>
=C2=A0 =C2=A0 =C2=A0.instance_size =3D sizeof(AspeedSDHCIState),<br>
diff --git a/hw/sd/bcm2835_sdhost.c b/hw/sd/bcm2835_sdhost.c<br>
index 088a7ac6ed..9431c35914 100644<br>
--- a/hw/sd/bcm2835_sdhost.c<br>
+++ b/hw/sd/bcm2835_sdhost.c<br>
@@ -436,7 +436,7 @@ static void bcm2835_sdhost_class_init(ObjectClass *klas=
s, void *data)<br>
=C2=A0 =C2=A0 =C2=A0dc-&gt;vmsd =3D &amp;vmstate_bcm2835_sdhost;<br>
=C2=A0}<br>
<br>
-static TypeInfo bcm2835_sdhost_info =3D {<br>
+static const TypeInfo bcm2835_sdhost_info =3D {<br>
=C2=A0 =C2=A0 =C2=A0.name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_BCM283=
5_SDHOST,<br>
=C2=A0 =C2=A0 =C2=A0.parent=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_SYS_BUS_DEV=
ICE,<br>
=C2=A0 =C2=A0 =C2=A0.instance_size =3D sizeof(BCM2835SDHostState),<br>
diff --git a/hw/sd/cadence_sdhci.c b/hw/sd/cadence_sdhci.c<br>
index 56b8bae1c3..75db34befe 100644<br>
--- a/hw/sd/cadence_sdhci.c<br>
+++ b/hw/sd/cadence_sdhci.c<br>
@@ -175,7 +175,7 @@ static void cadence_sdhci_class_init(ObjectClass *class=
p, void *data)<br>
=C2=A0 =C2=A0 =C2=A0dc-&gt;vmsd =3D &amp;vmstate_cadence_sdhci;<br>
=C2=A0}<br>
<br>
-static TypeInfo cadence_sdhci_info =3D {<br>
+static const TypeInfo cadence_sdhci_info =3D {<br>
=C2=A0 =C2=A0 =C2=A0.name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_CADENC=
E_SDHCI,<br>
=C2=A0 =C2=A0 =C2=A0.parent=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_SYS_BUS_DEV=
ICE,<br>
=C2=A0 =C2=A0 =C2=A0.instance_size =3D sizeof(CadenceSDHCIState),<br>
diff --git a/hw/sd/npcm7xx_sdhci.c b/hw/sd/npcm7xx_sdhci.c<br>
index ef503365df..b2f5b4a542 100644<br>
--- a/hw/sd/npcm7xx_sdhci.c<br>
+++ b/hw/sd/npcm7xx_sdhci.c<br>
@@ -166,7 +166,7 @@ static void npcm7xx_sdhci_instance_init(Object *obj)<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_SYSBUS_SDHCI);<br>
=C2=A0}<br>
<br>
-static TypeInfo npcm7xx_sdhci_info =3D {<br>
+static const TypeInfo npcm7xx_sdhci_info =3D {<br>
=C2=A0 =C2=A0 =C2=A0.name =3D TYPE_NPCM7XX_SDHCI,<br>
=C2=A0 =C2=A0 =C2=A0.parent =3D TYPE_SYS_BUS_DEVICE,<br>
=C2=A0 =C2=A0 =C2=A0.instance_size =3D sizeof(NPCM7xxSDHCIState),<br>
diff --git a/hw/usb/dev-mtp.c b/hw/usb/dev-mtp.c<br>
index c1d1694fd0..1e6ac76bef 100644<br>
--- a/hw/usb/dev-mtp.c<br>
+++ b/hw/usb/dev-mtp.c<br>
@@ -2106,7 +2106,7 @@ static void usb_mtp_class_initfn(ObjectClass *klass, =
void *data)<br>
=C2=A0 =C2=A0 =C2=A0device_class_set_props(dc, mtp_properties);<br>
=C2=A0}<br>
<br>
-static TypeInfo mtp_info =3D {<br>
+static const TypeInfo mtp_info =3D {<br>
=C2=A0 =C2=A0 =C2=A0.name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_USB_MT=
P,<br>
=C2=A0 =C2=A0 =C2=A0.parent=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_USB_DEVICE,=
<br>
=C2=A0 =C2=A0 =C2=A0.instance_size =3D sizeof(MTPState),<br>
diff --git a/hw/usb/host-libusb.c b/hw/usb/host-libusb.c<br>
index d0d46dd0a4..2b35cb6cdd 100644<br>
--- a/hw/usb/host-libusb.c<br>
+++ b/hw/usb/host-libusb.c<br>
@@ -1801,7 +1801,7 @@ static void usb_host_class_initfn(ObjectClass *klass,=
 void *data)<br>
=C2=A0 =C2=A0 =C2=A0set_bit(DEVICE_CATEGORY_BRIDGE, dc-&gt;categories);<br>
=C2=A0}<br>
<br>
-static TypeInfo usb_host_dev_info =3D {<br>
+static const TypeInfo usb_host_dev_info =3D {<br>
=C2=A0 =C2=A0 =C2=A0.name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_USB_HO=
ST_DEVICE,<br>
=C2=A0 =C2=A0 =C2=A0.parent=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_USB_DEVICE,=
<br>
=C2=A0 =C2=A0 =C2=A0.instance_size =3D sizeof(USBHostDevice),<br>
diff --git a/hw/vfio/igd.c b/hw/vfio/igd.c<br>
index d4685709a3..afe3fe7efc 100644<br>
--- a/hw/vfio/igd.c<br>
+++ b/hw/vfio/igd.c<br>
@@ -199,7 +199,7 @@ static void vfio_pci_igd_lpc_bridge_class_init(ObjectCl=
ass *klass, void *data)<br>
=C2=A0 =C2=A0 =C2=A0k-&gt;class_id =3D PCI_CLASS_BRIDGE_ISA;<br>
=C2=A0}<br>
<br>
-static TypeInfo vfio_pci_igd_lpc_bridge_info =3D {<br>
+static const TypeInfo vfio_pci_igd_lpc_bridge_info =3D {<br>
=C2=A0 =C2=A0 =C2=A0.name =3D &quot;vfio-pci-igd-lpc-bridge&quot;,<br>
=C2=A0 =C2=A0 =C2=A0.parent =3D TYPE_PCI_DEVICE,<br>
=C2=A0 =C2=A0 =C2=A0.class_init =3D vfio_pci_igd_lpc_bridge_class_init,<br>
diff --git a/hw/virtio/virtio-pmem.c b/hw/virtio/virtio-pmem.c<br>
index d1aeb90a31..5419dca75e 100644<br>
--- a/hw/virtio/virtio-pmem.c<br>
+++ b/hw/virtio/virtio-pmem.c<br>
@@ -182,7 +182,7 @@ static void virtio_pmem_class_init(ObjectClass *klass, =
void *data)<br>
=C2=A0 =C2=A0 =C2=A0set_bit(DEVICE_CATEGORY_STORAGE, dc-&gt;categories);<br=
>
=C2=A0}<br>
<br>
-static TypeInfo virtio_pmem_info =3D {<br>
+static const TypeInfo virtio_pmem_info =3D {<br>
=C2=A0 =C2=A0 =C2=A0.name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_VIRTIO=
_PMEM,<br>
=C2=A0 =C2=A0 =C2=A0.parent=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_VIRTIO_DEVI=
CE,<br>
=C2=A0 =C2=A0 =C2=A0.class_size=C2=A0 =C2=A0 =3D sizeof(VirtIOPMEMClass),<b=
r>
diff --git a/qom/object.c b/qom/object.c<br>
index 4f0677cca9..9f7a33139d 100644<br>
--- a/qom/object.c<br>
+++ b/qom/object.c<br>
@@ -2793,13 +2793,13 @@ static void object_class_init(ObjectClass *klass, v=
oid *data)<br>
<br>
=C2=A0static void register_types(void)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 static TypeInfo interface_info =3D {<br>
+=C2=A0 =C2=A0 static const TypeInfo interface_info =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name =3D TYPE_INTERFACE,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.class_size =3D sizeof(InterfaceClass),<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.abstract =3D true,<br>
=C2=A0 =C2=A0 =C2=A0};<br>
<br>
-=C2=A0 =C2=A0 static TypeInfo object_info =3D {<br>
+=C2=A0 =C2=A0 static const TypeInfo object_info =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name =3D TYPE_OBJECT,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.instance_size =3D sizeof(Object),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.class_init =3D object_class_init,<br>
-- <br>
2.34.1<br>
<br>
</blockquote></div>

--00000000000081316405d5c8861b--

