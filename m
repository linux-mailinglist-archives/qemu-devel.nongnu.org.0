Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E103698924
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 01:12:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSRrF-0003Ce-Vd; Wed, 15 Feb 2023 19:10:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pSRrD-0003C1-Ix; Wed, 15 Feb 2023 19:10:39 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pSRrB-0000pm-4j; Wed, 15 Feb 2023 19:10:39 -0500
Received: by mail-ej1-x634.google.com with SMTP id f21so1145508ejq.8;
 Wed, 15 Feb 2023 16:10:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K9cwhPmbYHcVwn9RxzvuS8BFfxTbykrPyyfl+DdbMug=;
 b=Tdzs6O6Dg+LpUpvClwrRUbXgXT20Awv6b0bai5IAeJiOYc7mUb904oMmjvjbQciZEb
 dVyh9sMfhhVjkB2HSOlRleY49g0Q5HRWU6Uc+LZhYI2R7+Xi65vcSDfGkxy9twD0k4lJ
 1dalNElnp3R8OV1/r1ZfUT21xkS4rFuASnsPMijbmdWAZOE0U3LHN23R3mHIpmKNX8xu
 i/m+KcIihAB+Qg6BnzOkf27Evwi34seOs0NcrPJNU8iH46W28euLRSYVoVCxgmKGRggY
 nprpRQUM2gxkpDQyvxZV6DaQmv31LOKvbAApA9uV3HYhMPLvOZ/xwMvusJlz24FcMGD8
 UyFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=K9cwhPmbYHcVwn9RxzvuS8BFfxTbykrPyyfl+DdbMug=;
 b=zXVymhxIY9NrEcWmNMTiqu85rOVHADYCXNJ3PIGV8BqxGvQ/89vvjgBOcC/Pd0XAIH
 kEejE6I65g3tWlWRD4XUWIcSUeZ+t26jynRWMbfsQbR9zC3q/jvSUBHJXohzArhzQwq6
 5P74Prc3Am6IHlNqVYb4jpTJAT5DFYuosH6WJ1gPadgktwOCuHHd7rG9XsC/KBy8stne
 4NU19f4XSTzJ/AnonJkqwybvm8znfk0+eO5g9oVEL1Bk01fjTQMVLy+djrtwvhNjFSKk
 iTvwVqIZoDMXaTB/pGfbKt5vQhRzoqBamg8TPlv9seNTduWHWey2LOaDn1dBAS0ioUdK
 EL1A==
X-Gm-Message-State: AO0yUKUnejMvuaZYYlcyxTdnbeKP0xuLmY8k8iy2YQLQu2FzgVGLF1qu
 QlHhnriSM4n1v7/s3Nbar2TS3V0OIB0=
X-Google-Smtp-Source: AK7set8oeu54eSBUAcETBRNOFDKB4MN/iA9Ddupobp5fXMMp5BhHj61J2EZgjnlIr6r4GUDTUComtg==
X-Received: by 2002:a17:907:1005:b0:8aa:b526:36b3 with SMTP id
 ox5-20020a170907100500b008aab52636b3mr3853857ejb.14.1676506234282; 
 Wed, 15 Feb 2023 16:10:34 -0800 (PST)
Received: from [127.0.0.1] (dynamic-077-183-243-024.77.183.pool.telefonica.de.
 [77.183.243.24]) by smtp.gmail.com with ESMTPSA id
 y22-20020a170906559600b0084d34eec68esm28340ejp.213.2023.02.15.16.10.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 16:10:33 -0800 (PST)
Date: Thu, 16 Feb 2023 00:10:29 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
CC: qemu-block@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 John Snow <jsnow@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 qemu-ppc@nongnu.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_14/20=5D_hw/ide=3A_Rename_ide?=
 =?US-ASCII?Q?=5Finit2=28=29_-=3E_ide=5Fbus=5Finit=5Foutput=5Firq=28=29?=
In-Reply-To: <20230215112712.23110-15-philmd@linaro.org>
References: <20230215112712.23110-1-philmd@linaro.org>
 <20230215112712.23110-15-philmd@linaro.org>
Message-ID: <5ACA6485-DA03-48D8-8222-10059C54C0D8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x634.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URI_DOTEDU=1.999 autolearn=no autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



Am 15=2E Februar 2023 11:27:06 UTC schrieb "Philippe Mathieu-Daud=C3=A9" <=
philmd@linaro=2Eorg>:
>ide_init2() initializes a IDEBus, and set its output IRQ=2E

s/a IDEBus/an IDEBus/, see e=2Eg=2E https://owl=2Epurdue=2Eedu/owl/general=
_writing/grammar/articles_a_versus_an=2Ehtml =2E

>To emphasize this, rename it as ide_bus_init_output_irq()=2E

The new name suggests that only the IRQ is initialized, while in fact the =
two IDE devices contained inside the bus are too=2E It's really hard to com=
e up with a good name here because the code is so tangled=2E

>
>Mechanical change using:
>
>  $ sed -i -e 's/ide_init2/ide_bus_init_output_irq/g' \
>        $(git grep -l ide_init2)
>
>Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro=2Eorg>
>---
> hw/ide/ahci=2Ec             | 2 +-
> hw/ide/cmd646=2Ec           | 2 +-
> hw/ide/core=2Ec             | 4 ++--
> hw/ide/isa=2Ec              | 2 +-
> hw/ide/macio=2Ec            | 2 +-
> hw/ide/microdrive=2Ec       | 2 +-
> hw/ide/mmio=2Ec             | 2 +-
> hw/ide/piix=2Ec             | 3 ++-
> hw/ide/sii3112=2Ec          | 2 +-
> hw/ide/via=2Ec              | 2 +-
> include/hw/ide/internal=2Eh | 4 ++--
> 11 files changed, 14 insertions(+), 13 deletions(-)
>
>diff --git a/hw/ide/ahci=2Ec b/hw/ide/ahci=2Ec
>index 7f67fb3119=2E=2Ed79b70d8c5 100644
>--- a/hw/ide/ahci=2Ec
>+++ b/hw/ide/ahci=2Ec
>@@ -1554,7 +1554,7 @@ void ahci_realize(AHCIState *s, DeviceState *qdev, =
AddressSpace *as, int ports)
>         AHCIDevice *ad =3D &s->dev[i];
>=20
>         ide_bus_init(&ad->port, sizeof(ad->port), qdev, i, 1);
>-        ide_init2(&ad->port, irqs[i]);
>+        ide_bus_init_output_irq(&ad->port, irqs[i]);
>=20
>         ad->hba =3D s;
>         ad->port_no =3D i;
>diff --git a/hw/ide/cmd646=2Ec b/hw/ide/cmd646=2Ec
>index 2865bc25fc=2E=2E26a90ed45f 100644
>--- a/hw/ide/cmd646=2Ec
>+++ b/hw/ide/cmd646=2Ec
>@@ -294,7 +294,7 @@ static void pci_cmd646_ide_realize(PCIDevice *dev, Er=
ror **errp)
>     qdev_init_gpio_in(ds, cmd646_set_irq, 2);
>     for (i =3D 0; i < 2; i++) {
>         ide_bus_init(&d->bus[i], sizeof(d->bus[i]), ds, i, 2);
>-        ide_init2(&d->bus[i], qdev_get_gpio_in(ds, i));
>+        ide_bus_init_output_irq(&d->bus[i], qdev_get_gpio_in(ds, i));
>=20
>         bmdma_init(&d->bus[i], &d->bmdma[i], d);
>         d->bmdma[i]=2Ebus =3D &d->bus[i];
>diff --git a/hw/ide/core=2Ec b/hw/ide/core=2Ec
>index 1be0731d1a=2E=2Efd2215c506 100644
>--- a/hw/ide/core=2Ec
>+++ b/hw/ide/core=2Ec
>@@ -2771,7 +2771,7 @@ static IDEDMA ide_dma_nop =3D {
>     =2Eaiocb =3D NULL,
> };
>=20
>-void ide_init2(IDEBus *bus, qemu_irq irq)
>+void ide_bus_init_output_irq(IDEBus *bus, qemu_irq irq_out)
> {
>     int i;
>=20
>@@ -2779,7 +2779,7 @@ void ide_init2(IDEBus *bus, qemu_irq irq)
>         ide_init1(bus, i);
>         ide_reset(&bus->ifs[i]);
>     }
>-    bus->irq =3D irq;
>+    bus->irq =3D irq_out;
>     bus->dma =3D &ide_dma_nop;
> }
>=20
>diff --git a/hw/ide/isa=2Ec b/hw/ide/isa=2Ec
>index f8ed26b587=2E=2E95053e026f 100644
>--- a/hw/ide/isa=2Ec
>+++ b/hw/ide/isa=2Ec
>@@ -72,7 +72,7 @@ static void isa_ide_realizefn(DeviceState *dev, Error *=
*errp)
>=20
>     ide_bus_init(&s->bus, sizeof(s->bus), dev, 0, 2);
>     ide_init_ioport(&s->bus, isadev, s->iobase, s->iobase2);
>-    ide_init2(&s->bus, isa_get_irq(isadev, s->irqnum));
>+    ide_bus_init_output_irq(&s->bus, isa_get_irq(isadev, s->irqnum));
>     vmstate_register(VMSTATE_IF(dev), 0, &vmstate_ide_isa, s);
>     ide_bus_register_restart_cb(&s->bus);
> }
>diff --git a/hw/ide/macio=2Ec b/hw/ide/macio=2Ec
>index 7efbbc720a=2E=2E6be29e44bc 100644
>--- a/hw/ide/macio=2Ec
>+++ b/hw/ide/macio=2Ec
>@@ -420,7 +420,7 @@ static void macio_ide_realizefn(DeviceState *dev, Err=
or **errp)
> {
>     MACIOIDEState *s =3D MACIO_IDE(dev);
>=20
>-    ide_init2(&s->bus, s->ide_irq);
>+    ide_bus_init_output_irq(&s->bus, s->ide_irq);
>=20
>     /* Register DMA callbacks */
>     s->dma=2Eops =3D &dbdma_ops;
>diff --git a/hw/ide/microdrive=2Ec b/hw/ide/microdrive=2Ec
>index 08504b499f=2E=2E84452ae4ef 100644
>--- a/hw/ide/microdrive=2Ec
>+++ b/hw/ide/microdrive=2Ec
>@@ -599,7 +599,7 @@ static void microdrive_realize(DeviceState *dev, Erro=
r **errp)
> {
>     MicroDriveState *md =3D MICRODRIVE(dev);
>=20
>-    ide_init2(&md->bus, qemu_allocate_irq(md_set_irq, md, 0));
>+    ide_bus_init_output_irq(&md->bus, qemu_allocate_irq(md_set_irq, md, =
0));
> }
>=20
> static void microdrive_init(Object *obj)
>diff --git a/hw/ide/mmio=2Ec b/hw/ide/mmio=2Ec
>index 1f1527122e=2E=2Eb6c40bc028 100644
>--- a/hw/ide/mmio=2Ec
>+++ b/hw/ide/mmio=2Ec
>@@ -122,7 +122,7 @@ static void mmio_ide_realizefn(DeviceState *dev, Erro=
r **errp)
>     SysBusDevice *d =3D SYS_BUS_DEVICE(dev);
>     MMIOIDEState *s =3D MMIO_IDE(dev);
>=20
>-    ide_init2(&s->bus, s->irq);
>+    ide_bus_init_output_irq(&s->bus, s->irq);
>=20
>     memory_region_init_io(&s->iomem1, OBJECT(s), &mmio_ide_ops, s,
>                           "ide-mmio=2E1", 16 << s->shift);
>diff --git a/hw/ide/piix=2Ec b/hw/ide/piix=2Ec
>index daeb9b605d=2E=2E2f71376b93 100644
>--- a/hw/ide/piix=2Ec
>+++ b/hw/ide/piix=2Ec
>@@ -145,7 +145,8 @@ static int pci_piix_init_ports(PCIIDEState *d)
>         if (ret) {
>             return ret;
>         }
>-        ide_init2(&d->bus[i], isa_get_irq(NULL, port_info[i]=2Eisairq));
>+        ide_bus_init_output_irq(&d->bus[i],
>+                                isa_get_irq(NULL, port_info[i]=2Eisairq)=
);
>=20
>         bmdma_init(&d->bus[i], &d->bmdma[i], d);
>         d->bmdma[i]=2Ebus =3D &d->bus[i];
>diff --git a/hw/ide/sii3112=2Ec b/hw/ide/sii3112=2Ec
>index c918370220=2E=2Ef9becdff8e 100644
>--- a/hw/ide/sii3112=2Ec
>+++ b/hw/ide/sii3112=2Ec
>@@ -284,7 +284,7 @@ static void sii3112_pci_realize(PCIDevice *dev, Error=
 **errp)
>     qdev_init_gpio_in(ds, sii3112_set_irq, 2);
>     for (i =3D 0; i < 2; i++) {
>         ide_bus_init(&s->bus[i], sizeof(s->bus[i]), ds, i, 1);
>-        ide_init2(&s->bus[i], qdev_get_gpio_in(ds, i));
>+        ide_bus_init_output_irq(&s->bus[i], qdev_get_gpio_in(ds, i));
>=20
>         bmdma_init(&s->bus[i], &s->bmdma[i], s);
>         s->bmdma[i]=2Ebus =3D &s->bus[i];
>diff --git a/hw/ide/via=2Ec b/hw/ide/via=2Ec
>index fd398226d4=2E=2Eab9e43e244 100644
>--- a/hw/ide/via=2Ec
>+++ b/hw/ide/via=2Ec
>@@ -191,7 +191,7 @@ static void via_ide_realize(PCIDevice *dev, Error **e=
rrp)
>     qdev_init_gpio_in(ds, via_ide_set_irq, 2);
>     for (i =3D 0; i < 2; i++) {
>         ide_bus_init(&d->bus[i], sizeof(d->bus[i]), ds, i, 2);
>-        ide_init2(&d->bus[i], qdev_get_gpio_in(ds, i));
>+        ide_bus_init_output_irq(&d->bus[i], qdev_get_gpio_in(ds, i));
>=20
>         bmdma_init(&d->bus[i], &d->bmdma[i], d);
>         d->bmdma[i]=2Ebus =3D &d->bus[i];
>diff --git a/include/hw/ide/internal=2Eh b/include/hw/ide/internal=2Eh
>index 11a4931ef9=2E=2Ec687282a78 100644
>--- a/include/hw/ide/internal=2Eh
>+++ b/include/hw/ide/internal=2Eh
>@@ -488,7 +488,7 @@ struct IDEBus {
>     IDEDMA *dma;
>     uint8_t unit;
>     uint8_t cmd;
>-    qemu_irq irq;
>+    qemu_irq irq; /* bus output */
>=20
>     int error_status;
>     uint8_t retry_unit;
>@@ -616,8 +616,8 @@ int ide_init_drive(IDEState *s, BlockBackend *blk, ID=
EDriveKind kind,
>                    uint64_t wwn,
>                    uint32_t cylinders, uint32_t heads, uint32_t secs,
>                    int chs_trans, Error **errp);
>-void ide_init2(IDEBus *bus, qemu_irq irq);
> void ide_exit(IDEState *s);
>+void ide_bus_init_output_irq(IDEBus *bus, qemu_irq irq_out);
> int ide_init_ioport(IDEBus *bus, ISADevice *isa, int iobase, int iobase2=
);
> void ide_bus_set_irq(IDEBus *bus);
> void ide_bus_register_restart_cb(IDEBus *bus);

