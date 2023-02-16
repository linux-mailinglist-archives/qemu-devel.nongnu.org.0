Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E8C5699714
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 15:20:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSf7B-0002xN-4S; Thu, 16 Feb 2023 09:20:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pSf77-0002ws-Ha; Thu, 16 Feb 2023 09:19:59 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pSf73-0002tl-Sn; Thu, 16 Feb 2023 09:19:56 -0500
Received: by mail-ed1-x534.google.com with SMTP id t16so3320800edd.10;
 Thu, 16 Feb 2023 06:19:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=95VjHFeainMePR2DshY/ljqcMNekJSmzMYZQsd7neDI=;
 b=pplpbu5WUjQmAk9oY6kx7/mTpRU6M4jlxm5FWVBGGZHrfWNJFSXez3gVqoGpw3lV1y
 VvCtcc20fhEOuQ1/lXP0h24H8XJH3W4jsNbGhjCzE8CrNenFKlrTGFVKUCCXY356JwQi
 6C79IML+LX/pm50VKWaebwGXmqa6unwixqwFY7fP9RHC7BK69u3XsC5zDrTUwsesENyz
 qibVyXDCjuDy7OxY7nVnpDzvu0fAACmkZ3XKw9xIPLBkQGlfEFy1ZV5uij18+Hu88Nrp
 1zB3O6MunR4FhTSbvl4OgSWVmxQeCOWb+SwwgpSVz6lW0UpoJ1Ngw76qCVvUD9Gvp3Z7
 6eTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=95VjHFeainMePR2DshY/ljqcMNekJSmzMYZQsd7neDI=;
 b=2xH1BHPb2Wv1k9VguZQmz1znP/cLd9vgPkag+edtI003M9OHvSixKt6SeUR8r5DkDM
 9ick+N83HGLyCLiPLtAzGs+cH/6JzTU0OjVWd0KFdHqJwibxjj6BOAGnNqdwNRJPtM3M
 P7hGG7B65N3Fe0mQvYWQKFQupqTqtRZ1eJbi2ThkR9/LitJhVtyGdpY2FHgUfjOGRvcH
 H88y2BMTtvhCK8frCsUCxaaW7KvqVdt6lcO/1W2qEzQ6LDBJoJPUJb5N0aVSV9zLOlar
 4TPf0V9LOX59PbhMwOfcIJe8GQn1o/ZzuWR+4d48sMkpceQV3ivSDRjmZwFaA6634Shp
 BFvA==
X-Gm-Message-State: AO0yUKX86AZL0zfr87Ts1qgyvuhVFskgAnaI1pTBHNEIBjnDtqs0QcTd
 T49Oh9nsmwT0IfZE0+71sdp8Uoe0K6A=
X-Google-Smtp-Source: AK7set/9RY+0pJSTV8HoZ/cQI/ovx4IKHlrJoqGhDe+mcK7+FnoG0rcw+audqojQv8FkPcIqPvC9RA==
X-Received: by 2002:a05:6402:27d0:b0:4ad:6113:76fd with SMTP id
 c16-20020a05640227d000b004ad611376fdmr1469414ede.16.1676557181441; 
 Thu, 16 Feb 2023 06:19:41 -0800 (PST)
Received: from [127.0.0.1] (dynamic-089-012-175-191.89.12.pool.telefonica.de.
 [89.12.175.191]) by smtp.gmail.com with ESMTPSA id
 d27-20020a50cd5b000000b004acb4b3b78bsm932467edj.88.2023.02.16.06.19.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Feb 2023 06:19:41 -0800 (PST)
Date: Thu, 16 Feb 2023 14:19:35 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
CC: qemu-block@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 John Snow <jsnow@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_04/20=5D_hw/ide/isa=3A_Extract_TY?=
 =?US-ASCII?Q?PE=5FISA=5FIDE_declarations_to_=27hw/ide/isa=2Eh=27?=
In-Reply-To: <20230215112712.23110-5-philmd@linaro.org>
References: <20230215112712.23110-1-philmd@linaro.org>
 <20230215112712.23110-5-philmd@linaro.org>
Message-ID: <4CA7A9C3-290E-4D6E-9B30-673C856E0F20@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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



Am 15=2E Februar 2023 11:26:56 UTC schrieb "Philippe Mathieu-Daud=C3=A9" <=
philmd@linaro=2Eorg>:
>"hw/ide=2Eh" is a mixed bag of lost IDE declarations=2E
>
>Extract isa_ide_init() and the TYPE_ISA_IDE QOM declarations
>to a new "hw/ide/isa=2Eh" header=2E
>
>Rename ISAIDEState::isairq as 'irqnum' to emphasize this is
>not a qemu_irq object but the number (index) of an ISA IRQ=2E
>
>Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro=2Eorg>
>---
> hw/i386/pc_piix=2Ec    |  1 +
> hw/ide/isa=2Ec         | 14 ++++++--------
> include/hw/ide=2Eh     |  5 -----
> include/hw/ide/isa=2Eh | 20 ++++++++++++++++++++
> 4 files changed, 27 insertions(+), 13 deletions(-)
> create mode 100644 include/hw/ide/isa=2Eh
>
>diff --git a/hw/i386/pc_piix=2Ec b/hw/i386/pc_piix=2Ec
>index df64dd8dcc=2E=2E7085b4bc58 100644
>--- a/hw/i386/pc_piix=2Ec
>+++ b/hw/i386/pc_piix=2Ec
>@@ -39,6 +39,7 @@
> #include "hw/pci/pci_ids=2Eh"
> #include "hw/usb=2Eh"
> #include "net/net=2Eh"
>+#include "hw/ide/isa=2Eh"
> #include "hw/ide/pci=2Eh"
> #include "hw/ide/piix=2Eh"
> #include "hw/irq=2Eh"
>diff --git a/hw/ide/isa=2Ec b/hw/ide/isa=2Ec
>index 8bedbd13f1=2E=2E5c3e83a0fc 100644
>--- a/hw/ide/isa=2Ec
>+++ b/hw/ide/isa=2Ec
>@@ -31,22 +31,20 @@
> #include "qemu/module=2Eh"
> #include "sysemu/dma=2Eh"
>=20
>+#include "hw/ide/isa=2Eh"
> #include "hw/ide/internal=2Eh"
> #include "qom/object=2Eh"
>=20
> /***********************************************************/
> /* ISA IDE definitions */
>=20
>-#define TYPE_ISA_IDE "isa-ide"
>-OBJECT_DECLARE_SIMPLE_TYPE(ISAIDEState, ISA_IDE)
>-
> struct ISAIDEState {
>     ISADevice parent_obj;
>=20
>     IDEBus    bus;
>     uint32_t  iobase;
>     uint32_t  iobase2;
>-    uint32_t  isairq;
>+    uint32_t  irqnum;
>     qemu_irq  irq;
> };
>=20
>@@ -75,13 +73,13 @@ static void isa_ide_realizefn(DeviceState *dev, Error=
 **errp)
>=20
>     ide_bus_init(&s->bus, sizeof(s->bus), dev, 0, 2);
>     ide_init_ioport(&s->bus, isadev, s->iobase, s->iobase2);
>-    s->irq =3D isa_get_irq(isadev, s->isairq);
>+    s->irq =3D isa_get_irq(isadev, s->irqnum);
>     ide_init2(&s->bus, s->irq);
>     vmstate_register(VMSTATE_IF(dev), 0, &vmstate_ide_isa, s);
>     ide_register_restart_cb(&s->bus);
> }
>=20
>-ISADevice *isa_ide_init(ISABus *bus, int iobase, int iobase2, int isairq=
,
>+ISADevice *isa_ide_init(ISABus *bus, int iobase, int iobase2, int irqnum=
,
>                         DriveInfo *hd0, DriveInfo *hd1)
> {
>     DeviceState *dev;
>@@ -92,7 +90,7 @@ ISADevice *isa_ide_init(ISABus *bus, int iobase, int io=
base2, int isairq,
>     dev =3D DEVICE(isadev);
>     qdev_prop_set_uint32(dev, "iobase",  iobase);
>     qdev_prop_set_uint32(dev, "iobase2", iobase2);
>-    qdev_prop_set_uint32(dev, "irq",     isairq);
>+    qdev_prop_set_uint32(dev, "irq",     irqnum);
>     isa_realize_and_unref(isadev, bus, &error_fatal);
>=20
>     s =3D ISA_IDE(dev);
>@@ -108,7 +106,7 @@ ISADevice *isa_ide_init(ISABus *bus, int iobase, int =
iobase2, int isairq,
> static Property isa_ide_properties[] =3D {
>     DEFINE_PROP_UINT32("iobase",  ISAIDEState, iobase,  0x1f0),
>     DEFINE_PROP_UINT32("iobase2", ISAIDEState, iobase2, 0x3f6),
>-    DEFINE_PROP_UINT32("irq",    ISAIDEState, isairq,  14),
>+    DEFINE_PROP_UINT32("irq",     ISAIDEState, irqnum,  14),
>     DEFINE_PROP_END_OF_LIST(),
> };
>=20
>diff --git a/include/hw/ide=2Eh b/include/hw/ide=2Eh
>index 5f8c36b2aa=2E=2E24a7aa2925 100644
>--- a/include/hw/ide=2Eh
>+++ b/include/hw/ide=2Eh
>@@ -1,13 +1,8 @@
> #ifndef HW_IDE_H
> #define HW_IDE_H
>=20
>-#include "hw/isa/isa=2Eh"
> #include "exec/memory=2Eh"
>=20
>-/* ide-isa=2Ec */
>-ISADevice *isa_ide_init(ISABus *bus, int iobase, int iobase2, int isairq=
,
>-                        DriveInfo *hd0, DriveInfo *hd1);
>-
> int ide_get_geometry(BusState *bus, int unit,
>                      int16_t *cyls, int8_t *heads, int8_t *secs);
> int ide_get_bios_chs_trans(BusState *bus, int unit);
>diff --git a/include/hw/ide/isa=2Eh b/include/hw/ide/isa=2Eh
>new file mode 100644
>index 0000000000=2E=2E1cd0ff1fa6
>--- /dev/null
>+++ b/include/hw/ide/isa=2Eh
>@@ -0,0 +1,20 @@
>+/*
>+ * QEMU IDE Emulation: ISA Bus support=2E
>+ *
>+ * Copyright (c) 2003 Fabrice Bellard
>+ * Copyright (c) 2006 Openedhand Ltd=2E
>+ *
>+ * SPDX-License-Identifier: MIT
>+ */
>+#ifndef HW_IDE_ISA_H
>+#define HW_IDE_ISA_H
>+
>+#include "qom/object=2Eh"
>+
>+#define TYPE_ISA_IDE "isa-ide"
>+OBJECT_DECLARE_SIMPLE_TYPE(ISAIDEState, ISA_IDE)
>+
>+ISADevice *isa_ide_init(ISABus *bus, int iobase, int iobase2, int irqnum=
,
>+                        DriveInfo *hd0, DriveInfo *hd1);
>+
>+#endif

Reviewed-by: Bernhard Beschow <shentey@gmail=2Ecom>

