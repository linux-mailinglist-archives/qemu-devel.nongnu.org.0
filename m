Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B16EE6FFC10
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 23:46:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxE65-0001DT-QK; Thu, 11 May 2023 17:45:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pxE63-0001D1-Fp
 for qemu-devel@nongnu.org; Thu, 11 May 2023 17:45:11 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pxE5u-0005EF-Mz
 for qemu-devel@nongnu.org; Thu, 11 May 2023 17:45:11 -0400
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-965ab8ed1fcso1672721866b.2
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 14:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683841500; x=1686433500;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:to:from:date:from:to:cc:subject:date:message-id
 :reply-to; bh=wSJCYcAVXG17VPJ4w+RX4K3AHXlE/VNxe34A8h0/208=;
 b=f6QuRvjV2U1bpnTxNKV7Ho0CmD4LU2huTuurXOnnLCYUmEG+QMl2FFI0F/cvlAdihO
 fx2O+WpZnEoYTnNuYhMzo/qFGpVfkFhOKmMgkxRpFOBe00o25tzz7dasVACxOSBRACSQ
 B5Qer8cfLAtCZvrg3yAWIrEhiAQNNkcmqMOs3yNQGQsj1f3JBPkisGZ8NZ1DNmwqiRqt
 ILmU+gZPR1hqAJvF46NA9gmVWDR+9alBRnNNGTpSCt8AeHqdYp/92JtXBtRabUArSscm
 bOLWT0LQul5aR3Wl2atbdPKaSEeOwjFfyF6rW//42KPGt2/n2p2MgYu6y+r4xDOKyjkA
 nHtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683841500; x=1686433500;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wSJCYcAVXG17VPJ4w+RX4K3AHXlE/VNxe34A8h0/208=;
 b=XLzuSJuQ04IehDKr9uGoqlr1HDnfQktnYwhb56/wNikUAq88umvsGeFVjwdsJxVYIO
 UOw6M2YD+P71PRzMJ34Hnk8SyF6Yc/kK5+tuXUCGCSOre/JwQLQmt7d95736G5MYBy/A
 riAaBED0zZr65hYOq7B9naf5RrR1GOLie6aT8sgogJ0XupZm+9hEfpsguxSKuBPjs8jh
 bF1Zffp0Dv7a1LaS089f2f6gH680EuGQP6XfU9yTnhXiA/DBdKUKj5jjSZIWg2W9FI+o
 SEk6K2r7Iag8AWckHbAIYDfoUr+WQk9V8Zj5Pvy2/S4tQJaem7Qi2+kxJC3W1QwMcSoF
 msIg==
X-Gm-Message-State: AC+VfDxU7AouHhUWp6tE5Ra1C0h47qcHlqC8+RlFBwBZkwXwUixZatpw
 KfIuszJHxxV8bpzSEHD3ASbNC4Uh5Us=
X-Google-Smtp-Source: ACHHUZ65GRWM3sDoMHDM6gLg+HgATIRbKrJqpsYOQCkbXiidYvDg/x2A3GKcNsXUkGVTYtvtLQ3USg==
X-Received: by 2002:a17:907:26c2:b0:94f:720b:1b14 with SMTP id
 bp2-20020a17090726c200b0094f720b1b14mr19375121ejc.29.1683841500037; 
 Thu, 11 May 2023 14:45:00 -0700 (PDT)
Received: from [127.0.0.1] (dynamic-089-012-187-255.89.12.pool.telefonica.de.
 [89.12.187.255]) by smtp.gmail.com with ESMTPSA id
 y18-20020a170906525200b0094f7acbafe0sm4589076ejm.177.2023.05.11.14.44.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 May 2023 14:44:59 -0700 (PDT)
Date: Thu, 11 May 2023 21:44:51 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 mst@redhat.com, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 alex.bennee@linaro.org
Subject: Re: [RFC PATCH 03/18] hw/pci: use PCIDevice gpio for device IRQ
In-Reply-To: <20230511085731.171565-4-mark.cave-ayland@ilande.co.uk>
References: <20230511085731.171565-1-mark.cave-ayland@ilande.co.uk>
 <20230511085731.171565-4-mark.cave-ayland@ilande.co.uk>
Message-ID: <C77CADEE-2FB5-4928-A9F2-8ECD2643CFF2@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62d.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



Am 11=2E Mai 2023 08:57:16 UTC schrieb Mark Cave-Ayland <mark=2Ecave-aylan=
d@ilande=2Eco=2Euk>:
>Change pci_set_irq() to call qemu_set_irq() on the PCI device IRQ rather =
than
>calling PCI bus IRQ handler function directly=2E In order to preserve the
>existing behaviour update pci_qdev_realize() so that it automatically con=
nects
>the PCI device IRQ to the PCI bus IRQ handler=2E
>
>Finally add a "QEMU interface" description documenting the new PCI device=
 IRQ
>gpio next to the declaration of TYPE_PCI_DEVICE=2E
>
>Signed-off-by: Mark Cave-Ayland <mark=2Ecave-ayland@ilande=2Eco=2Euk>
>---
> hw/pci/pci=2Ec | 12 ++++++++++--
> 1 file changed, 10 insertions(+), 2 deletions(-)
>
>diff --git a/hw/pci/pci=2Ec b/hw/pci/pci=2Ec
>index 9471f996a7=2E=2E3da1481eb5 100644
>--- a/hw/pci/pci=2Ec
>+++ b/hw/pci/pci=2Ec
>@@ -1680,8 +1680,7 @@ qemu_irq pci_allocate_irq(PCIDevice *pci_dev)
>=20
> void pci_set_irq(PCIDevice *pci_dev, int level)
> {
>-    int intx =3D pci_intx(pci_dev);
>-    pci_irq_handler(pci_dev, intx, level);
>+    qemu_set_irq(pci_dev->irq, level);
> }
>=20
> /* Special hooks used by device assignment */
>@@ -2193,6 +2192,10 @@ static void pci_qdev_realize(DeviceState *qdev, Er=
ror **errp)
>     pci_set_power(pci_dev, true);
>=20
>     pci_dev->msi_trigger =3D pci_msi_trigger;
>+
>+    /* Connect device IRQ to bus */
>+    qdev_connect_gpio_out(DEVICE(pci_dev), 0,
>+                          pci_get_bus(pci_dev)->irq_in[pci_dev->devfn]);

I think this is confusing a few things=2E In my understanding -- unlike IS=
A -- PCI considers interrupt lanes only for PCI slots but not for buses=2E =
So for example each PCI slot could have its own direct connections (up to f=
our, intA=2E=2EintD) to the interrupt controller=2E IOW interrupt lanes and=
 PCI buses are unrelated, thus PCIBus shouldn't really have IRQs=2E

Moreover, in case the interrupt lines are shared between multiple PCI slot=
s, a usual pattern is to swizzle these lines such that the intAs from the s=
lots don't all occupy just one IRQ line=2E That means that depending on the=
 slot the device is plugged into a different lane is triggered=2E Above cod=
e, however, would always trigger the same line and wouldn't even allow for =
modeling the swizzeling=2E

Also, above code would cause out of bounds array accesses if a PCI device =
had more functions than there are on "the bus":
For example, consider PIIX which has four PIRQs, so ARRAY_SIZE(irq_fn) =3D=
=3D 4, right? devfn can be up to 8 according to the PCI spec which would ca=
use an out if bounds array access above=2E

I think that this commit does actually re-define how PCI buses work in QEM=
U although the cover letter claims to save this for another day=2E We shoul=
d probably not apply the series in its current form=2E

Best regards,
Bernhard

> }
>=20
> static void pci_device_init(Object *obj)
>@@ -2850,6 +2853,11 @@ void pci_set_power(PCIDevice *d, bool state)
>     }
> }
>=20
>+/*
>+ * QEMU interface:
>+ * + Unnamed GPIO output: set to 1 if the PCI Device has asserted its ir=
q
>+ */
>+
> static const TypeInfo pci_device_type_info =3D {
>     =2Ename =3D TYPE_PCI_DEVICE,
>     =2Eparent =3D TYPE_DEVICE,

