Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 949DE4BABEA
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 22:39:58 +0100 (CET)
Received: from localhost ([::1]:43844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKoVJ-0008Ps-NI
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 16:39:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nKoQC-0002OC-OT; Thu, 17 Feb 2022 16:34:40 -0500
Received: from [2a00:1450:4864:20::531] (port=39787
 helo=mail-ed1-x531.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nKoQA-0007iU-3k; Thu, 17 Feb 2022 16:34:40 -0500
Received: by mail-ed1-x531.google.com with SMTP id u18so11993226edt.6;
 Thu, 17 Feb 2022 13:34:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:in-reply-to:references:message-id
 :mime-version:content-transfer-encoding;
 bh=5z5ioPppqIYlgLtW2csA2cpZf4EFeqlRG2bu2W5Qv1E=;
 b=IhkaXxWZydqxWdJwrrqmuqPkjjM0+96vELUbOoQeis4HLgKWEflYUg8l22decPyoNm
 xiqNj5dBKJgr+MBNBwyKL1IwdlwnnUy4f6VV6F0cSqnzcsGxqNEhTnPjtBWZnkO+FSdI
 SL6eNxnOEhhBAe4GvK+Zp5+uR8pdZg+e7U4WD1e6kfuDGtE4HqAsY5r7TK2h2WHYLqea
 JejInBJnUM9TJsKRphUVmKQy+ccC7vjAAiHJTD329WozDJ0QSIXasvO9mnOykr4B2sIW
 1OcLfxZmNafFOrDL8CtXQ6EmkHXuKY2E+cEoBjrB0TueC9K0C0glax1+A0UHH9+mA7h+
 FOHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:references
 :message-id:mime-version:content-transfer-encoding;
 bh=5z5ioPppqIYlgLtW2csA2cpZf4EFeqlRG2bu2W5Qv1E=;
 b=ESbo+3r8DGIJNiKBVB5D1RIaMQNNFyjXe3+y2C/q0VozRxYxVOtZ7nqqNLgHCLSd3n
 Gp/LUoC/HGYcZkFkF0uGEnTyhps/NjgrlyjRgG89JxrmSk8JcK1UYapJ7EwcJ1iKE2Kg
 SM80mOeCvGb1EzMMkzxI6wM01r0dkMSZMiQ5Nou/9Y9i7ThHVm1zulUqRIAOydflqFjw
 GPuqZOZIBxEDmMLLsYE9BPtCtYvdOHszfZV5ZAvBJ++oUWGLvISg5qSoHy2NOukS4tqu
 vnN6vVVHgD7iHgYeZfj2vBY66UuFnNbYtfFv1xY3V+a5/im78V8mlVzRUSOHaechZ2s7
 XRKA==
X-Gm-Message-State: AOAM530Lu8DXVR7sghlyluqIqsmAf867cjD6xdLYrvx0yxsN6zHmVluK
 Bt8v5YQ5W9irnJOUYgcCSr1EdbH5aF7Aug==
X-Google-Smtp-Source: ABdhPJwrUGQcU0YQ8e9fQXqrTIm9ODHjBS0GLjwM+Ur0guyjpaB3lDXTpWtIxXr9sjk0VasTWm0FYg==
X-Received: by 2002:a05:6402:84e:b0:412:b2b1:523f with SMTP id
 b14-20020a056402084e00b00412b2b1523fmr2618772edz.169.1645133674336; 
 Thu, 17 Feb 2022 13:34:34 -0800 (PST)
Received: from [127.0.0.1] (dynamic-077-183-198-236.77.183.pool.telefonica.de.
 [77.183.198.236])
 by smtp.gmail.com with ESMTPSA id 16sm1564301eji.94.2022.02.17.13.34.33
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 17 Feb 2022 13:34:33 -0800 (PST)
Date: Thu, 17 Feb 2022 21:34:28 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH v2 1/2] Mark remaining global TypeInfo instances as const
In-Reply-To: <20220117145805.173070-2-shentey@gmail.com>
References: <20220117145805.173070-1-shentey@gmail.com>
 <20220117145805.173070-2-shentey@gmail.com>
Message-ID: <2CABAE59-A10F-470F-A9ED-A421A66D9DDF@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::531
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x531.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Matthew Rosato <mjrosato@linux.ibm.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 qemu-trivial@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Havard Skinnemoen <hskinnemoen@google.com>, Halil Pasic <pasic@linux.ibm.com>,
 =?ISO-8859-1?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-arm@nongnu.org,
 =?ISO-8859-1?Q?Alex_Benn=E9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?ISO-8859-1?Q?Daniel_P=2E_Berrang=E9?= <berrange@redhat.com>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 Andrew Jeffery <andrew@aj.id.au>, Cornelia Huck <cohuck@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Tyrone Ting <kfting@nuvoton.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 17=2E Januar 2022 14:58:04 UTC schrieb Bernhard Beschow <shentey@gmail=
=2Ecom>:
>More than 1k of TypeInfo instances are already marked as const=2E Mark th=
e
>remaining ones, too=2E
>
>This commit was created with:
>  git grep -z -l 'static TypeInfo' -- '*=2Ec' | \
>  xargs -0 sed -i 's/static TypeInfo/static const TypeInfo/'
>
>Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>---
> hw/core/generic-loader=2Ec   | 2 +-
> hw/core/guest-loader=2Ec     | 2 +-
> hw/display/bcm2835_fb=2Ec    | 2 +-
> hw/display/i2c-ddc=2Ec       | 2 +-
> hw/display/macfb=2Ec         | 4 ++--
> hw/display/virtio-vga=2Ec    | 2 +-
> hw/dma/bcm2835_dma=2Ec       | 2 +-
> hw/i386/pc_piix=2Ec          | 2 +-
> hw/i386/sgx-epc=2Ec          | 2 +-
> hw/intc/bcm2835_ic=2Ec       | 2 +-
> hw/intc/bcm2836_control=2Ec  | 2 +-
> hw/ipmi/ipmi=2Ec             | 4 ++--
> hw/mem/nvdimm=2Ec            | 2 +-
> hw/mem/pc-dimm=2Ec           | 2 +-
> hw/misc/bcm2835_mbox=2Ec     | 2 +-
> hw/misc/bcm2835_powermgt=2Ec | 2 +-
> hw/misc/bcm2835_property=2Ec | 2 +-
> hw/misc/bcm2835_rng=2Ec      | 2 +-
> hw/misc/pvpanic-isa=2Ec      | 2 +-
> hw/misc/pvpanic-pci=2Ec      | 2 +-
> hw/net/fsl_etsec/etsec=2Ec   | 2 +-
> hw/ppc/prep_systemio=2Ec     | 2 +-
> hw/ppc/spapr_iommu=2Ec       | 2 +-
> hw/s390x/s390-pci-bus=2Ec    | 2 +-
> hw/s390x/sclp=2Ec            | 2 +-
> hw/s390x/tod-kvm=2Ec         | 2 +-
> hw/s390x/tod-tcg=2Ec         | 2 +-
> hw/s390x/tod=2Ec             | 2 +-
> hw/scsi/lsi53c895a=2Ec       | 2 +-
> hw/sd/allwinner-sdhost=2Ec   | 2 +-
> hw/sd/aspeed_sdhci=2Ec       | 2 +-
> hw/sd/bcm2835_sdhost=2Ec     | 2 +-
> hw/sd/cadence_sdhci=2Ec      | 2 +-
> hw/sd/npcm7xx_sdhci=2Ec      | 2 +-
> hw/usb/dev-mtp=2Ec           | 2 +-
> hw/usb/host-libusb=2Ec       | 2 +-
> hw/vfio/igd=2Ec              | 2 +-
> hw/virtio/virtio-pmem=2Ec    | 2 +-
> qom/object=2Ec               | 4 ++--
> 39 files changed, 42 insertions(+), 42 deletions(-)
>
>diff --git a/hw/core/generic-loader=2Ec b/hw/core/generic-loader=2Ec
>index 9a24ffb880=2E=2Eeaafc416f4 100644
>--- a/hw/core/generic-loader=2Ec
>+++ b/hw/core/generic-loader=2Ec
>@@ -207,7 +207,7 @@ static void generic_loader_class_init(ObjectClass *kl=
ass, void *data)
>     set_bit(DEVICE_CATEGORY_MISC, dc->categories);
> }
>=20
>-static TypeInfo generic_loader_info =3D {
>+static const TypeInfo generic_loader_info =3D {
>     =2Ename =3D TYPE_GENERIC_LOADER,
>     =2Eparent =3D TYPE_DEVICE,
>     =2Einstance_size =3D sizeof(GenericLoaderState),
>diff --git a/hw/core/guest-loader=2Ec b/hw/core/guest-loader=2Ec
>index d3f9d1a06e=2E=2E391c875a29 100644
>--- a/hw/core/guest-loader=2Ec
>+++ b/hw/core/guest-loader=2Ec
>@@ -129,7 +129,7 @@ static void guest_loader_class_init(ObjectClass *klas=
s, void *data)
>     set_bit(DEVICE_CATEGORY_MISC, dc->categories);
> }
>=20
>-static TypeInfo guest_loader_info =3D {
>+static const TypeInfo guest_loader_info =3D {
>     =2Ename =3D TYPE_GUEST_LOADER,
>     =2Eparent =3D TYPE_DEVICE,
>     =2Einstance_size =3D sizeof(GuestLoaderState),
>diff --git a/hw/display/bcm2835_fb=2Ec b/hw/display/bcm2835_fb=2Ec
>index 2be77bdd3a=2E=2E088fc3d51c 100644
>--- a/hw/display/bcm2835_fb=2Ec
>+++ b/hw/display/bcm2835_fb=2Ec
>@@ -454,7 +454,7 @@ static void bcm2835_fb_class_init(ObjectClass *klass,=
 void *data)
>     dc->vmsd =3D &vmstate_bcm2835_fb;
> }
>=20
>-static TypeInfo bcm2835_fb_info =3D {
>+static const TypeInfo bcm2835_fb_info =3D {
>     =2Ename          =3D TYPE_BCM2835_FB,
>     =2Eparent        =3D TYPE_SYS_BUS_DEVICE,
>     =2Einstance_size =3D sizeof(BCM2835FBState),
>diff --git a/hw/display/i2c-ddc=2Ec b/hw/display/i2c-ddc=2Ec
>index 13eb529fc1=2E=2E146489518c 100644
>--- a/hw/display/i2c-ddc=2Ec
>+++ b/hw/display/i2c-ddc=2Ec
>@@ -113,7 +113,7 @@ static void i2c_ddc_class_init(ObjectClass *oc, void =
*data)
>     isc->send =3D i2c_ddc_tx;
> }
>=20
>-static TypeInfo i2c_ddc_info =3D {
>+static const TypeInfo i2c_ddc_info =3D {
>     =2Ename =3D TYPE_I2CDDC,
>     =2Eparent =3D TYPE_I2C_SLAVE,
>     =2Einstance_size =3D sizeof(I2CDDCState),
>diff --git a/hw/display/macfb=2Ec b/hw/display/macfb=2Ec
>index 4bd7c3ad6a=2E=2E69c2ea2b6e 100644
>--- a/hw/display/macfb=2Ec
>+++ b/hw/display/macfb=2Ec
>@@ -783,14 +783,14 @@ static void macfb_nubus_class_init(ObjectClass *kla=
ss, void *data)
>     device_class_set_props(dc, macfb_nubus_properties);
> }
>=20
>-static TypeInfo macfb_sysbus_info =3D {
>+static const TypeInfo macfb_sysbus_info =3D {
>     =2Ename          =3D TYPE_MACFB,
>     =2Eparent        =3D TYPE_SYS_BUS_DEVICE,
>     =2Einstance_size =3D sizeof(MacfbSysBusState),
>     =2Eclass_init    =3D macfb_sysbus_class_init,
> };
>=20
>-static TypeInfo macfb_nubus_info =3D {
>+static const TypeInfo macfb_nubus_info =3D {
>     =2Ename          =3D TYPE_NUBUS_MACFB,
>     =2Eparent        =3D TYPE_NUBUS_DEVICE,
>     =2Einstance_size =3D sizeof(MacfbNubusState),
>diff --git a/hw/display/virtio-vga=2Ec b/hw/display/virtio-vga=2Ec
>index b23a75a04b=2E=2E5a2f7a4540 100644
>--- a/hw/display/virtio-vga=2Ec
>+++ b/hw/display/virtio-vga=2Ec
>@@ -220,7 +220,7 @@ static void virtio_vga_base_class_init(ObjectClass *k=
lass, void *data)
>                                    virtio_vga_set_big_endian_fb);
> }
>=20
>-static TypeInfo virtio_vga_base_info =3D {
>+static const TypeInfo virtio_vga_base_info =3D {
>     =2Ename          =3D TYPE_VIRTIO_VGA_BASE,
>     =2Eparent        =3D TYPE_VIRTIO_PCI,
>     =2Einstance_size =3D sizeof(VirtIOVGABase),
>diff --git a/hw/dma/bcm2835_dma=2Ec b/hw/dma/bcm2835_dma=2Ec
>index eb0002a2b9=2E=2E5e9306110d 100644
>--- a/hw/dma/bcm2835_dma=2Ec
>+++ b/hw/dma/bcm2835_dma=2Ec
>@@ -394,7 +394,7 @@ static void bcm2835_dma_class_init(ObjectClass *klass=
, void *data)
>     dc->vmsd =3D &vmstate_bcm2835_dma;
> }
>=20
>-static TypeInfo bcm2835_dma_info =3D {
>+static const TypeInfo bcm2835_dma_info =3D {
>     =2Ename          =3D TYPE_BCM2835_DMA,
>     =2Eparent        =3D TYPE_SYS_BUS_DEVICE,
>     =2Einstance_size =3D sizeof(BCM2835DMAState),
>diff --git a/hw/i386/pc_piix=2Ec b/hw/i386/pc_piix=2Ec
>index 7c7790a5ce=2E=2Ef6557d3c21 100644
>--- a/hw/i386/pc_piix=2Ec
>+++ b/hw/i386/pc_piix=2Ec
>@@ -865,7 +865,7 @@ static void isa_bridge_class_init(ObjectClass *klass,=
 void *data)
>     k->class_id     =3D PCI_CLASS_BRIDGE_ISA;
> };
>=20
>-static TypeInfo isa_bridge_info =3D {
>+static const TypeInfo isa_bridge_info =3D {
>     =2Ename          =3D "igd-passthrough-isa-bridge",
>     =2Eparent        =3D TYPE_PCI_DEVICE,
>     =2Einstance_size =3D sizeof(PCIDevice),
>diff --git a/hw/i386/sgx-epc=2Ec b/hw/i386/sgx-epc=2Ec
>index 96b2940d75=2E=2Ed664829d35 100644
>--- a/hw/i386/sgx-epc=2Ec
>+++ b/hw/i386/sgx-epc=2Ec
>@@ -167,7 +167,7 @@ static void sgx_epc_class_init(ObjectClass *oc, void =
*data)
>     mdc->fill_device_info =3D sgx_epc_md_fill_device_info;
> }
>=20
>-static TypeInfo sgx_epc_info =3D {
>+static const TypeInfo sgx_epc_info =3D {
>     =2Ename          =3D TYPE_SGX_EPC,
>     =2Eparent        =3D TYPE_DEVICE,
>     =2Einstance_size =3D sizeof(SGXEPCDevice),
>diff --git a/hw/intc/bcm2835_ic=2Ec b/hw/intc/bcm2835_ic=2Ec
>index 9000d995e8=2E=2E4513fad16f 100644
>--- a/hw/intc/bcm2835_ic=2Ec
>+++ b/hw/intc/bcm2835_ic=2Ec
>@@ -227,7 +227,7 @@ static void bcm2835_ic_class_init(ObjectClass *klass,=
 void *data)
>     dc->vmsd =3D &vmstate_bcm2835_ic;
> }
>=20
>-static TypeInfo bcm2835_ic_info =3D {
>+static const TypeInfo bcm2835_ic_info =3D {
>     =2Ename          =3D TYPE_BCM2835_IC,
>     =2Eparent        =3D TYPE_SYS_BUS_DEVICE,
>     =2Einstance_size =3D sizeof(BCM2835ICState),
>diff --git a/hw/intc/bcm2836_control=2Ec b/hw/intc/bcm2836_control=2Ec
>index 2ead76ffdc=2E=2Eb0589df188 100644
>--- a/hw/intc/bcm2836_control=2Ec
>+++ b/hw/intc/bcm2836_control=2Ec
>@@ -392,7 +392,7 @@ static void bcm2836_control_class_init(ObjectClass *k=
lass, void *data)
>     dc->vmsd =3D &vmstate_bcm2836_control;
> }
>=20
>-static TypeInfo bcm2836_control_info =3D {
>+static const TypeInfo bcm2836_control_info =3D {
>     =2Ename          =3D TYPE_BCM2836_CONTROL,
>     =2Eparent        =3D TYPE_SYS_BUS_DEVICE,
>     =2Einstance_size =3D sizeof(BCM2836ControlState),
>diff --git a/hw/ipmi/ipmi=2Ec b/hw/ipmi/ipmi=2Ec
>index 8d35c9fdd6=2E=2Ebbb07b151e 100644
>--- a/hw/ipmi/ipmi=2Ec
>+++ b/hw/ipmi/ipmi=2Ec
>@@ -85,7 +85,7 @@ static void ipmi_interface_class_init(ObjectClass *clas=
s, void *data)
>     ik->do_hw_op =3D ipmi_do_hw_op;
> }
>=20
>-static TypeInfo ipmi_interface_type_info =3D {
>+static const TypeInfo ipmi_interface_type_info =3D {
>     =2Ename =3D TYPE_IPMI_INTERFACE,
>     =2Eparent =3D TYPE_INTERFACE,
>     =2Eclass_size =3D sizeof(IPMIInterfaceClass),
>@@ -120,7 +120,7 @@ static void bmc_class_init(ObjectClass *oc, void *dat=
a)
>     device_class_set_props(dc, ipmi_bmc_properties);
> }
>=20
>-static TypeInfo ipmi_bmc_type_info =3D {
>+static const TypeInfo ipmi_bmc_type_info =3D {
>     =2Ename =3D TYPE_IPMI_BMC,
>     =2Eparent =3D TYPE_DEVICE,
>     =2Einstance_size =3D sizeof(IPMIBmc),
>diff --git a/hw/mem/nvdimm=2Ec b/hw/mem/nvdimm=2Ec
>index 7397b67156=2E=2E933bc5e0c7 100644
>--- a/hw/mem/nvdimm=2Ec
>+++ b/hw/mem/nvdimm=2Ec
>@@ -248,7 +248,7 @@ static void nvdimm_class_init(ObjectClass *oc, void *=
data)
>     set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
> }
>=20
>-static TypeInfo nvdimm_info =3D {
>+static const TypeInfo nvdimm_info =3D {
>     =2Ename          =3D TYPE_NVDIMM,
>     =2Eparent        =3D TYPE_PC_DIMM,
>     =2Eclass_size    =3D sizeof(NVDIMMClass),
>diff --git a/hw/mem/pc-dimm=2Ec b/hw/mem/pc-dimm=2Ec
>index 48b913aba6=2E=2E28af0d71b2 100644
>--- a/hw/mem/pc-dimm=2Ec
>+++ b/hw/mem/pc-dimm=2Ec
>@@ -286,7 +286,7 @@ static void pc_dimm_class_init(ObjectClass *oc, void =
*data)
>     mdc->fill_device_info =3D pc_dimm_md_fill_device_info;
> }
>=20
>-static TypeInfo pc_dimm_info =3D {
>+static const TypeInfo pc_dimm_info =3D {
>     =2Ename          =3D TYPE_PC_DIMM,
>     =2Eparent        =3D TYPE_DEVICE,
>     =2Einstance_size =3D sizeof(PCDIMMDevice),
>diff --git a/hw/misc/bcm2835_mbox=2Ec b/hw/misc/bcm2835_mbox=2Ec
>index 9f73cbd5e4=2E=2E1908c152f6 100644
>--- a/hw/misc/bcm2835_mbox=2Ec
>+++ b/hw/misc/bcm2835_mbox=2Ec
>@@ -324,7 +324,7 @@ static void bcm2835_mbox_class_init(ObjectClass *klas=
s, void *data)
>     dc->vmsd =3D &vmstate_bcm2835_mbox;
> }
>=20
>-static TypeInfo bcm2835_mbox_info =3D {
>+static const TypeInfo bcm2835_mbox_info =3D {
>     =2Ename          =3D TYPE_BCM2835_MBOX,
>     =2Eparent        =3D TYPE_SYS_BUS_DEVICE,
>     =2Einstance_size =3D sizeof(BCM2835MboxState),
>diff --git a/hw/misc/bcm2835_powermgt=2Ec b/hw/misc/bcm2835_powermgt=2Ec
>index 25fa804cbd=2E=2E976f3d34e5 100644
>--- a/hw/misc/bcm2835_powermgt=2Ec
>+++ b/hw/misc/bcm2835_powermgt=2Ec
>@@ -144,7 +144,7 @@ static void bcm2835_powermgt_class_init(ObjectClass *=
klass, void *data)
>     dc->vmsd =3D &vmstate_bcm2835_powermgt;
> }
>=20
>-static TypeInfo bcm2835_powermgt_info =3D {
>+static const TypeInfo bcm2835_powermgt_info =3D {
>     =2Ename          =3D TYPE_BCM2835_POWERMGT,
>     =2Eparent        =3D TYPE_SYS_BUS_DEVICE,
>     =2Einstance_size =3D sizeof(BCM2835PowerMgtState),
>diff --git a/hw/misc/bcm2835_property=2Ec b/hw/misc/bcm2835_property=2Ec
>index 76ea511d53=2E=2Ee94e951057 100644
>--- a/hw/misc/bcm2835_property=2Ec
>+++ b/hw/misc/bcm2835_property=2Ec
>@@ -421,7 +421,7 @@ static void bcm2835_property_class_init(ObjectClass *=
klass, void *data)
>     dc->vmsd =3D &vmstate_bcm2835_property;
> }
>=20
>-static TypeInfo bcm2835_property_info =3D {
>+static const TypeInfo bcm2835_property_info =3D {
>     =2Ename          =3D TYPE_BCM2835_PROPERTY,
>     =2Eparent        =3D TYPE_SYS_BUS_DEVICE,
>     =2Einstance_size =3D sizeof(BCM2835PropertyState),
>diff --git a/hw/misc/bcm2835_rng=2Ec b/hw/misc/bcm2835_rng=2Ec
>index d0c4e64e88=2E=2Eb3c80cf186 100644
>--- a/hw/misc/bcm2835_rng=2Ec
>+++ b/hw/misc/bcm2835_rng=2Ec
>@@ -131,7 +131,7 @@ static void bcm2835_rng_class_init(ObjectClass *klass=
, void *data)
>     dc->vmsd =3D &vmstate_bcm2835_rng;
> }
>=20
>-static TypeInfo bcm2835_rng_info =3D {
>+static const TypeInfo bcm2835_rng_info =3D {
>     =2Ename          =3D TYPE_BCM2835_RNG,
>     =2Eparent        =3D TYPE_SYS_BUS_DEVICE,
>     =2Einstance_size =3D sizeof(BCM2835RngState),
>diff --git a/hw/misc/pvpanic-isa=2Ec b/hw/misc/pvpanic-isa=2Ec
>index 7b66d58acc=2E=2Ea39fcdd1fc 100644
>--- a/hw/misc/pvpanic-isa=2Ec
>+++ b/hw/misc/pvpanic-isa=2Ec
>@@ -77,7 +77,7 @@ static void pvpanic_isa_class_init(ObjectClass *klass, =
void *data)
>     set_bit(DEVICE_CATEGORY_MISC, dc->categories);
> }
>=20
>-static TypeInfo pvpanic_isa_info =3D {
>+static const TypeInfo pvpanic_isa_info =3D {
>     =2Ename          =3D TYPE_PVPANIC_ISA_DEVICE,
>     =2Eparent        =3D TYPE_ISA_DEVICE,
>     =2Einstance_size =3D sizeof(PVPanicISAState),
>diff --git a/hw/misc/pvpanic-pci=2Ec b/hw/misc/pvpanic-pci=2Ec
>index af8cbe2830=2E=2E62e1be68c1 100644
>--- a/hw/misc/pvpanic-pci=2Ec
>+++ b/hw/misc/pvpanic-pci=2Ec
>@@ -74,7 +74,7 @@ static void pvpanic_pci_class_init(ObjectClass *klass, =
void *data)
>     set_bit(DEVICE_CATEGORY_MISC, dc->categories);
> }
>=20
>-static TypeInfo pvpanic_pci_info =3D {
>+static const TypeInfo pvpanic_pci_info =3D {
>     =2Ename          =3D TYPE_PVPANIC_PCI_DEVICE,
>     =2Eparent        =3D TYPE_PCI_DEVICE,
>     =2Einstance_size =3D sizeof(PVPanicPCIState),
>diff --git a/hw/net/fsl_etsec/etsec=2Ec b/hw/net/fsl_etsec/etsec=2Ec
>index bd9d62b559=2E=2Ee7fc082518 100644
>--- a/hw/net/fsl_etsec/etsec=2Ec
>+++ b/hw/net/fsl_etsec/etsec=2Ec
>@@ -430,7 +430,7 @@ static void etsec_class_init(ObjectClass *klass, void=
 *data)
>     dc->user_creatable =3D true;
> }
>=20
>-static TypeInfo etsec_info =3D {
>+static const TypeInfo etsec_info =3D {
>     =2Ename                  =3D TYPE_ETSEC_COMMON,
>     =2Eparent                =3D TYPE_SYS_BUS_DEVICE,
>     =2Einstance_size         =3D sizeof(eTSEC),
>diff --git a/hw/ppc/prep_systemio=2Ec b/hw/ppc/prep_systemio=2Ec
>index b2bd783248=2E=2E8c9b8dd67b 100644
>--- a/hw/ppc/prep_systemio=2Ec
>+++ b/hw/ppc/prep_systemio=2Ec
>@@ -300,7 +300,7 @@ static void prep_systemio_class_initfn(ObjectClass *k=
lass, void *data)
>     device_class_set_props(dc, prep_systemio_properties);
> }
>=20
>-static TypeInfo prep_systemio800_info =3D {
>+static const TypeInfo prep_systemio800_info =3D {
>     =2Ename          =3D TYPE_PREP_SYSTEMIO,
>     =2Eparent        =3D TYPE_ISA_DEVICE,
>     =2Einstance_size =3D sizeof(PrepSystemIoState),
>diff --git a/hw/ppc/spapr_iommu=2Ec b/hw/ppc/spapr_iommu=2Ec
>index db01071858=2E=2E81e5a1aea3 100644
>--- a/hw/ppc/spapr_iommu=2Ec
>+++ b/hw/ppc/spapr_iommu=2Ec
>@@ -685,7 +685,7 @@ static void spapr_tce_table_class_init(ObjectClass *k=
lass, void *data)
>     spapr_register_hypercall(H_STUFF_TCE, h_stuff_tce);
> }
>=20
>-static TypeInfo spapr_tce_table_info =3D {
>+static const TypeInfo spapr_tce_table_info =3D {
>     =2Ename =3D TYPE_SPAPR_TCE_TABLE,
>     =2Eparent =3D TYPE_DEVICE,
>     =2Einstance_size =3D sizeof(SpaprTceTable),
>diff --git a/hw/s390x/s390-pci-bus=2Ec b/hw/s390x/s390-pci-bus=2Ec
>index 01b58ebc70=2E=2E4b2bdd94b3 100644
>--- a/hw/s390x/s390-pci-bus=2Ec
>+++ b/hw/s390x/s390-pci-bus=2Ec
>@@ -1392,7 +1392,7 @@ static const TypeInfo s390_pci_device_info =3D {
>     =2Eclass_init =3D s390_pci_device_class_init,
> };
>=20
>-static TypeInfo s390_pci_iommu_info =3D {
>+static const TypeInfo s390_pci_iommu_info =3D {
>     =2Ename =3D TYPE_S390_PCI_IOMMU,
>     =2Eparent =3D TYPE_OBJECT,
>     =2Einstance_size =3D sizeof(S390PCIIOMMU),
>diff --git a/hw/s390x/sclp=2Ec b/hw/s390x/sclp=2Ec
>index 89c30a8a91=2E=2Eeff74479f4 100644
>--- a/hw/s390x/sclp=2Ec
>+++ b/hw/s390x/sclp=2Ec
>@@ -460,7 +460,7 @@ static void sclp_class_init(ObjectClass *oc, void *da=
ta)
>     sc->service_interrupt =3D service_interrupt;
> }
>=20
>-static TypeInfo sclp_info =3D {
>+static const TypeInfo sclp_info =3D {
>     =2Ename =3D TYPE_SCLP,
>     =2Eparent =3D TYPE_DEVICE,
>     =2Einstance_init =3D sclp_init,
>diff --git a/hw/s390x/tod-kvm=2Ec b/hw/s390x/tod-kvm=2Ec
>index ec855811ae=2E=2E9d0cbfbce2 100644
>--- a/hw/s390x/tod-kvm=2Ec
>+++ b/hw/s390x/tod-kvm=2Ec
>@@ -147,7 +147,7 @@ static void kvm_s390_tod_init(Object *obj)
>     td->stopped =3D false;
> }
>=20
>-static TypeInfo kvm_s390_tod_info =3D {
>+static const TypeInfo kvm_s390_tod_info =3D {
>     =2Ename =3D TYPE_KVM_S390_TOD,
>     =2Eparent =3D TYPE_S390_TOD,
>     =2Einstance_size =3D sizeof(S390TODState),
>diff --git a/hw/s390x/tod-tcg=2Ec b/hw/s390x/tod-tcg=2Ec
>index 9bb94ff72b=2E=2Ead4993203d 100644
>--- a/hw/s390x/tod-tcg=2Ec
>+++ b/hw/s390x/tod-tcg=2Ec
>@@ -73,7 +73,7 @@ static void qemu_s390_tod_init(Object *obj)
>     }
> }
>=20
>-static TypeInfo qemu_s390_tod_info =3D {
>+static const TypeInfo qemu_s390_tod_info =3D {
>     =2Ename =3D TYPE_QEMU_S390_TOD,
>     =2Eparent =3D TYPE_S390_TOD,
>     =2Einstance_size =3D sizeof(S390TODState),
>diff --git a/hw/s390x/tod=2Ec b/hw/s390x/tod=2Ec
>index fd5a36bf24=2E=2Ec81b1c0338 100644
>--- a/hw/s390x/tod=2Ec
>+++ b/hw/s390x/tod=2Ec
>@@ -123,7 +123,7 @@ static void s390_tod_class_init(ObjectClass *oc, void=
 *data)
>     dc->user_creatable =3D false;
> }
>=20
>-static TypeInfo s390_tod_info =3D {
>+static const TypeInfo s390_tod_info =3D {
>     =2Ename =3D TYPE_S390_TOD,
>     =2Eparent =3D TYPE_DEVICE,
>     =2Einstance_size =3D sizeof(S390TODState),
>diff --git a/hw/scsi/lsi53c895a=2Ec b/hw/scsi/lsi53c895a=2Ec
>index 4c431adb77=2E=2Ec8773f73f7 100644
>--- a/hw/scsi/lsi53c895a=2Ec
>+++ b/hw/scsi/lsi53c895a=2Ec
>@@ -2352,7 +2352,7 @@ static void lsi53c810_class_init(ObjectClass *klass=
, void *data)
>     k->device_id =3D PCI_DEVICE_ID_LSI_53C810;
> }
>=20
>-static TypeInfo lsi53c810_info =3D {
>+static const TypeInfo lsi53c810_info =3D {
>     =2Ename          =3D TYPE_LSI53C810,
>     =2Eparent        =3D TYPE_LSI53C895A,
>     =2Eclass_init    =3D lsi53c810_class_init,
>diff --git a/hw/sd/allwinner-sdhost=2Ec b/hw/sd/allwinner-sdhost=2Ec
>index de5bc49e68=2E=2E041e45c680 100644
>--- a/hw/sd/allwinner-sdhost=2Ec
>+++ b/hw/sd/allwinner-sdhost=2Ec
>@@ -835,7 +835,7 @@ static void allwinner_sdhost_sun5i_class_init(ObjectC=
lass *klass, void *data)
>     sc->max_desc_size =3D 64 * KiB;
> }
>=20
>-static TypeInfo allwinner_sdhost_info =3D {
>+static const TypeInfo allwinner_sdhost_info =3D {
>     =2Ename          =3D TYPE_AW_SDHOST,
>     =2Eparent        =3D TYPE_SYS_BUS_DEVICE,
>     =2Einstance_init =3D allwinner_sdhost_init,
>diff --git a/hw/sd/aspeed_sdhci=2Ec b/hw/sd/aspeed_sdhci=2Ec
>index df1bdf1fa4=2E=2Ebe8cafd65f 100644
>--- a/hw/sd/aspeed_sdhci=2Ec
>+++ b/hw/sd/aspeed_sdhci=2Ec
>@@ -198,7 +198,7 @@ static void aspeed_sdhci_class_init(ObjectClass *clas=
sp, void *data)
>     device_class_set_props(dc, aspeed_sdhci_properties);
> }
>=20
>-static TypeInfo aspeed_sdhci_info =3D {
>+static const TypeInfo aspeed_sdhci_info =3D {
>     =2Ename          =3D TYPE_ASPEED_SDHCI,
>     =2Eparent        =3D TYPE_SYS_BUS_DEVICE,
>     =2Einstance_size =3D sizeof(AspeedSDHCIState),
>diff --git a/hw/sd/bcm2835_sdhost=2Ec b/hw/sd/bcm2835_sdhost=2Ec
>index 088a7ac6ed=2E=2E9431c35914 100644
>--- a/hw/sd/bcm2835_sdhost=2Ec
>+++ b/hw/sd/bcm2835_sdhost=2Ec
>@@ -436,7 +436,7 @@ static void bcm2835_sdhost_class_init(ObjectClass *kl=
ass, void *data)
>     dc->vmsd =3D &vmstate_bcm2835_sdhost;
> }
>=20
>-static TypeInfo bcm2835_sdhost_info =3D {
>+static const TypeInfo bcm2835_sdhost_info =3D {
>     =2Ename          =3D TYPE_BCM2835_SDHOST,
>     =2Eparent        =3D TYPE_SYS_BUS_DEVICE,
>     =2Einstance_size =3D sizeof(BCM2835SDHostState),
>diff --git a/hw/sd/cadence_sdhci=2Ec b/hw/sd/cadence_sdhci=2Ec
>index 56b8bae1c3=2E=2E75db34befe 100644
>--- a/hw/sd/cadence_sdhci=2Ec
>+++ b/hw/sd/cadence_sdhci=2Ec
>@@ -175,7 +175,7 @@ static void cadence_sdhci_class_init(ObjectClass *cla=
ssp, void *data)
>     dc->vmsd =3D &vmstate_cadence_sdhci;
> }
>=20
>-static TypeInfo cadence_sdhci_info =3D {
>+static const TypeInfo cadence_sdhci_info =3D {
>     =2Ename          =3D TYPE_CADENCE_SDHCI,
>     =2Eparent        =3D TYPE_SYS_BUS_DEVICE,
>     =2Einstance_size =3D sizeof(CadenceSDHCIState),
>diff --git a/hw/sd/npcm7xx_sdhci=2Ec b/hw/sd/npcm7xx_sdhci=2Ec
>index ef503365df=2E=2Eb2f5b4a542 100644
>--- a/hw/sd/npcm7xx_sdhci=2Ec
>+++ b/hw/sd/npcm7xx_sdhci=2Ec
>@@ -166,7 +166,7 @@ static void npcm7xx_sdhci_instance_init(Object *obj)
>                             TYPE_SYSBUS_SDHCI);
> }
>=20
>-static TypeInfo npcm7xx_sdhci_info =3D {
>+static const TypeInfo npcm7xx_sdhci_info =3D {
>     =2Ename =3D TYPE_NPCM7XX_SDHCI,
>     =2Eparent =3D TYPE_SYS_BUS_DEVICE,
>     =2Einstance_size =3D sizeof(NPCM7xxSDHCIState),
>diff --git a/hw/usb/dev-mtp=2Ec b/hw/usb/dev-mtp=2Ec
>index c1d1694fd0=2E=2E1e6ac76bef 100644
>--- a/hw/usb/dev-mtp=2Ec
>+++ b/hw/usb/dev-mtp=2Ec
>@@ -2106,7 +2106,7 @@ static void usb_mtp_class_initfn(ObjectClass *klass=
, void *data)
>     device_class_set_props(dc, mtp_properties);
> }
>=20
>-static TypeInfo mtp_info =3D {
>+static const TypeInfo mtp_info =3D {
>     =2Ename          =3D TYPE_USB_MTP,
>     =2Eparent        =3D TYPE_USB_DEVICE,
>     =2Einstance_size =3D sizeof(MTPState),
>diff --git a/hw/usb/host-libusb=2Ec b/hw/usb/host-libusb=2Ec
>index d0d46dd0a4=2E=2E2b35cb6cdd 100644
>--- a/hw/usb/host-libusb=2Ec
>+++ b/hw/usb/host-libusb=2Ec
>@@ -1801,7 +1801,7 @@ static void usb_host_class_initfn(ObjectClass *klas=
s, void *data)
>     set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
> }
>=20
>-static TypeInfo usb_host_dev_info =3D {
>+static const TypeInfo usb_host_dev_info =3D {
>     =2Ename          =3D TYPE_USB_HOST_DEVICE,
>     =2Eparent        =3D TYPE_USB_DEVICE,
>     =2Einstance_size =3D sizeof(USBHostDevice),
>diff --git a/hw/vfio/igd=2Ec b/hw/vfio/igd=2Ec
>index d4685709a3=2E=2Eafe3fe7efc 100644
>--- a/hw/vfio/igd=2Ec
>+++ b/hw/vfio/igd=2Ec
>@@ -199,7 +199,7 @@ static void vfio_pci_igd_lpc_bridge_class_init(Object=
Class *klass, void *data)
>     k->class_id =3D PCI_CLASS_BRIDGE_ISA;
> }
>=20
>-static TypeInfo vfio_pci_igd_lpc_bridge_info =3D {
>+static const TypeInfo vfio_pci_igd_lpc_bridge_info =3D {
>     =2Ename =3D "vfio-pci-igd-lpc-bridge",
>     =2Eparent =3D TYPE_PCI_DEVICE,
>     =2Eclass_init =3D vfio_pci_igd_lpc_bridge_class_init,
>diff --git a/hw/virtio/virtio-pmem=2Ec b/hw/virtio/virtio-pmem=2Ec
>index d1aeb90a31=2E=2E5419dca75e 100644
>--- a/hw/virtio/virtio-pmem=2Ec
>+++ b/hw/virtio/virtio-pmem=2Ec
>@@ -182,7 +182,7 @@ static void virtio_pmem_class_init(ObjectClass *klass=
, void *data)
>     set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
> }
>=20
>-static TypeInfo virtio_pmem_info =3D {
>+static const TypeInfo virtio_pmem_info =3D {
>     =2Ename          =3D TYPE_VIRTIO_PMEM,
>     =2Eparent        =3D TYPE_VIRTIO_DEVICE,
>     =2Eclass_size    =3D sizeof(VirtIOPMEMClass),
>diff --git a/qom/object=2Ec b/qom/object=2Ec
>index 4f0677cca9=2E=2E9f7a33139d 100644
>--- a/qom/object=2Ec
>+++ b/qom/object=2Ec
>@@ -2793,13 +2793,13 @@ static void object_class_init(ObjectClass *klass,=
 void *data)
>=20
> static void register_types(void)
> {
>-    static TypeInfo interface_info =3D {
>+    static const TypeInfo interface_info =3D {
>         =2Ename =3D TYPE_INTERFACE,
>         =2Eclass_size =3D sizeof(InterfaceClass),
>         =2Eabstract =3D true,
>     };
>=20
>-    static TypeInfo object_info =3D {
>+    static const TypeInfo object_info =3D {
>         =2Ename =3D TYPE_OBJECT,
>         =2Einstance_size =3D sizeof(Object),
>         =2Eclass_init =3D object_class_init,

Ping

