Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CEC553722B
	for <lists+qemu-devel@lfdr.de>; Sun, 29 May 2022 20:25:55 +0200 (CEST)
Received: from localhost ([::1]:35350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvNbu-0005uI-Bs
	for lists+qemu-devel@lfdr.de; Sun, 29 May 2022 14:25:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nvNaL-0005E7-Bk
 for qemu-devel@nongnu.org; Sun, 29 May 2022 14:24:17 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:39432)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nvNaJ-000835-6F
 for qemu-devel@nongnu.org; Sun, 29 May 2022 14:24:16 -0400
Received: by mail-ej1-x635.google.com with SMTP id gh17so17138839ejc.6
 for <qemu-devel@nongnu.org>; Sun, 29 May 2022 11:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:subject:in-reply-to:references:message-id:mime-version
 :content-transfer-encoding;
 bh=UB5aN22618HzdUqT8fnwRfHMj0M8nQRxrvVauxoeShI=;
 b=cuj+ocRM+7Y0YcJkdn3GBTuDJ+w5fKhf9qd9Nvk/mCdVoc2p80ZjkK32Zr6wNRW41J
 nncDi8MQ5zha8LOgwk2AmwxPgJgu18iA1V+HhRnVIvA02/IJNx2MCpOMbwqRF6/Crcrf
 bvlcxPwa0iRQlPqvGPBe/ZrYkcclJlZbj48m+bLKwwkymW+npmVqIWTI9nd/isuJyZTt
 z/LDc5i+oGo/sTn8vHb5+0tE8B7bp4LEdJXpB4ulnC/ToU/fD0oISrIL52dFU6Y3KldY
 ns360CNDUvh7n44t/Qiax3VeB00dFBUvnmTiaJDj/T7zkq5dMNLffRJqHZJgvULoD3KI
 FxkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:subject:in-reply-to:references
 :message-id:mime-version:content-transfer-encoding;
 bh=UB5aN22618HzdUqT8fnwRfHMj0M8nQRxrvVauxoeShI=;
 b=Yj9OQBuEXMNEZXRRNLqHx/BFx+LS20hoWD9RpKy3+Mo9bAUt61nZgodGJ45VQBiF0M
 YJtJ88diyoE2k4x+mp0D0ZVY7vVBEyPYEygu+d+2qe69FasPPlxKtPEAE4BfvdpQhKGM
 cSPJsNw2pv+O73CauSNHahmhpq+fGrJaSYvyKhNWp51x2ctAyTBG5l4BSxhzjWifrBUA
 zKjyjzMxSFOxZcpJ+dwWpUiZaIkhRUPj6q9hblOZgRK7LedGf7RNQWO7U5z63/8bMBxX
 6sLUPceuIpU0DsJto+1tKPIdvn2cYUVNUY3e2+7d80FVm9j7zbys7K4Cc+B/oAqe7QND
 jOMA==
X-Gm-Message-State: AOAM531LBLE9kgntH1pRtvnTgdssKRxVOdNqjn3CoYgM65ebBC9E2F3k
 n2qO/xB1XgDmJkprEFpJ3W8=
X-Google-Smtp-Source: ABdhPJwdBrC5W2b58Wuum2+i9j9LpKoUyB2j/WSgSdZvoiU1YRVk120OR3oYr7wJPo5/E0jYWdtXkw==
X-Received: by 2002:a17:907:7ba1:b0:6fe:e18a:dc89 with SMTP id
 ne33-20020a1709077ba100b006fee18adc89mr31054410ejc.392.1653848653551; 
 Sun, 29 May 2022 11:24:13 -0700 (PDT)
Received: from ?IPv6:::1?
 (p200300faaf303d00154dd35d8bf95fb4.dip0.t-ipconnect.de.
 [2003:fa:af30:3d00:154d:d35d:8bf9:5fb4])
 by smtp.gmail.com with ESMTPSA id
 g12-20020a056402424c00b0042bd25ca29asm5374126edb.59.2022.05.29.11.24.13
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 29 May 2022 11:24:13 -0700 (PDT)
Date: Sun, 29 May 2022 18:24:10 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, mst@redhat.com,
 marcel.apfelbaum@gmail.com, imammedo@redhat.com, ani@anisinha.ca,
 f4bug@amsat.org, aurelien@aurel32.net, pbonzini@redhat.com,
 richard.henderson@linaro.org, eduardo@habkost.net, hpoussin@reactos.org,
 qemu-devel@nongnu.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_05/12=5D_hw/acpi/piix4=3A_alter?=
 =?US-ASCII?Q?_piix4=5Fpm=5Finit=28=29_to_return_PIIX4PMState?=
In-Reply-To: <20220528091934.15520-6-mark.cave-ayland@ilande.co.uk>
References: <20220528091934.15520-1-mark.cave-ayland@ilande.co.uk>
 <20220528091934.15520-6-mark.cave-ayland@ilande.co.uk>
Message-ID: <E23E4ECC-EED5-4E74-9D94-4652233198E6@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 28=2E Mai 2022 09:19:27 UTC schrieb Mark Cave-Ayland <mark=2Ecave-ayland=
@ilande=2Eco=2Euk>:
>This exposes the PIIX4_PM device to the caller to allow any qdev gpios to=
 be
>mapped outside of piix4_pm_init()=2E
>
>Signed-off-by: Mark Cave-Ayland <mark=2Ecave-ayland@ilande=2Eco=2Euk>
>---
> hw/acpi/piix4=2Ec               | 11 ++++-------
> hw/i386/pc_piix=2Ec             | 10 +++++-----
> hw/isa/piix4=2Ec                |  8 +++++---
> include/hw/southbridge/piix=2Eh |  7 ++++---
> 4 files changed, 18 insertions(+), 18 deletions(-)
>
>diff --git a/hw/acpi/piix4=2Ec b/hw/acpi/piix4=2Ec
>index 7ee65b1bff=2E=2E05c129b6af 100644
>--- a/hw/acpi/piix4=2Ec
>+++ b/hw/acpi/piix4=2Ec
>@@ -497,9 +497,9 @@ static void piix4_pm_realize(PCIDevice *dev, Error **=
errp)
>     piix4_pm_add_properties(s);
> }
>=20
>-I2CBus *piix4_pm_init(PCIBus *bus, int devfn, uint32_t smb_io_base,
>-                      qemu_irq sci_irq, qemu_irq smi_irq,
>-                      int smm_enabled, DeviceState **piix4_pm)
>+PIIX4PMState *piix4_pm_init(PCIBus *bus, int devfn, uint32_t smb_io_base=
,
>+                            qemu_irq sci_irq, qemu_irq smi_irq,
>+                            int smm_enabled)
> {
>     PCIDevice *pci_dev;
>     DeviceState *dev;
>@@ -509,9 +509,6 @@ I2CBus *piix4_pm_init(PCIBus *bus, int devfn, uint32_=
t smb_io_base,
>     dev =3D DEVICE(pci_dev);
>     qdev_prop_set_uint32(dev, "smb_io_base", smb_io_base);
>     qdev_prop_set_bit(dev, "smm-enabled", smm_enabled);
>-    if (piix4_pm) {
>-        *piix4_pm =3D dev;
>-    }
>=20
>     s =3D PIIX4_PM(dev);
>     s->irq =3D sci_irq;
>@@ -519,7 +516,7 @@ I2CBus *piix4_pm_init(PCIBus *bus, int devfn, uint32_=
t smb_io_base,
>=20
>     pci_realize_and_unref(pci_dev, bus, &error_fatal);
>=20
>-    return s->smb=2Esmbus;
>+    return s;
> }
>=20
> static uint64_t gpe_readb(void *opaque, hwaddr addr, unsigned width)
>diff --git a/hw/i386/pc_piix=2Ec b/hw/i386/pc_piix=2Ec
>index 578e537b35=2E=2E0300be5ef4 100644
>--- a/hw/i386/pc_piix=2Ec
>+++ b/hw/i386/pc_piix=2Ec
>@@ -281,14 +281,14 @@ static void pc_init1(MachineState *machine,
>     }
>=20
>     if (pcmc->pci_enabled && x86_machine_is_acpi_enabled(X86_MACHINE(pcm=
s))) {
>-        DeviceState *piix4_pm;
>+        PIIX4PMState *piix4_pm;
>=20
>         smi_irq =3D qemu_allocate_irq(pc_acpi_smi_interrupt, first_cpu, =
0);
>         /* TODO: Populate SPD eeprom data=2E  */

While at it: Perhaps move this comment=2E=2E=2E

>-        pcms->smbus =3D piix4_pm_init(pci_bus, piix3_devfn + 3, 0xb100,
>-                                    x86ms->gsi[9], smi_irq,
>-                                    x86_machine_is_smm_enabled(x86ms),
>-                                    &piix4_pm);
>+        piix4_pm =3D piix4_pm_init(pci_bus, piix3_devfn + 3, 0xb100,
>+                                 x86ms->gsi[9], smi_irq,
>+                                 x86_machine_is_smm_enabled(x86ms));
>+        pcms->smbus =3D I2C_BUS(qdev_get_child_bus(DEVICE(piix4_pm), "i2=
c"));

=2E=2E=2E here? At least the Malta board seems to do this business here=2E

>         smbus_eeprom_init(pcms->smbus, 8, NULL, 0);
>=20
>         object_property_add_link(OBJECT(machine), PC_MACHINE_ACPI_DEVICE=
_PROP,
>diff --git a/hw/isa/piix4=2Ec b/hw/isa/piix4=2Ec
>index 8607e0ac36=2E=2E7d9bedd1bb 100644
>--- a/hw/isa/piix4=2Ec
>+++ b/hw/isa/piix4=2Ec
>@@ -293,6 +293,7 @@ static int pci_slot_get_pirq(PCIDevice *pci_dev, int =
irq_num)
> DeviceState *piix4_create(PCIBus *pci_bus, ISABus **isa_bus, I2CBus **sm=
bus)
> {
>     PIIX4State *s;
>+    PIIX4PMState *pms;
>     PCIDevice *pci;
>     DeviceState *dev;
>     int devfn =3D PCI_DEVFN(10, 0);
>@@ -310,9 +311,10 @@ DeviceState *piix4_create(PCIBus *pci_bus, ISABus **=
isa_bus, I2CBus **smbus)
>=20
>     pci_create_simple(pci_bus, devfn + 2, "piix4-usb-uhci");
>     if (smbus) {
>-        *smbus =3D piix4_pm_init(pci_bus, devfn + 3, 0x1100,
>-                               qdev_get_gpio_in_named(dev, "isa", 9),
>-                               NULL, 0, NULL);
>+        pms =3D piix4_pm_init(pci_bus, devfn + 3, 0x1100,
>+                            qdev_get_gpio_in_named(dev, "isa", 9),
>+                            NULL, 0);
>+        *smbus =3D I2C_BUS(qdev_get_child_bus(DEVICE(pms), "i2c"));
>     }
>=20
>     pci_bus_irqs(pci_bus, piix4_set_irq, pci_slot_get_pirq, s, PIIX_NUM_=
PIRQS);
>diff --git a/include/hw/southbridge/piix=2Eh b/include/hw/southbridge/pii=
x=2Eh
>index c5b842b45d=2E=2E108800ab06 100644
>--- a/include/hw/southbridge/piix=2Eh
>+++ b/include/hw/southbridge/piix=2Eh
>@@ -14,10 +14,11 @@
>=20
> #include "hw/pci/pci=2Eh"
> #include "qom/object=2Eh"
>+#include "hw/acpi/piix4=2Eh"
>=20
>-I2CBus *piix4_pm_init(PCIBus *bus, int devfn, uint32_t smb_io_base,
>-                      qemu_irq sci_irq, qemu_irq smi_irq,
>-                      int smm_enabled, DeviceState **piix4_pm);
>+PIIX4PMState *piix4_pm_init(PCIBus *bus, int devfn, uint32_t smb_io_base=
,
>+                            qemu_irq sci_irq, qemu_irq smi_irq,
>+                            int smm_enabled);
>=20
> /* PIRQRC[A:D]: PIRQx Route Control Registers */
> #define PIIX_PIRQCA 0x60


