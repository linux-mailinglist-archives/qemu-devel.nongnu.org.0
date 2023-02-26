Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD9C06A3581
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 00:08:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWQ6R-0005Ll-93; Sun, 26 Feb 2023 18:06:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pWQ6P-0005LD-CV; Sun, 26 Feb 2023 18:06:45 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pWQ6N-0004In-Ht; Sun, 26 Feb 2023 18:06:45 -0500
Received: by mail-ed1-x52f.google.com with SMTP id o15so16316857edr.13;
 Sun, 26 Feb 2023 15:06:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fCCe6w1TR7RMLi6DDgN577Y15RUjGIpQ9Q98I8PJgOQ=;
 b=LjXusPQvxChqldV37KRFifFu3QkCKzeU6Vnky6BSHJEsp9liwaXVpDeFUqwZrzziJp
 KkCfs9aH8ttYpVycAc6Y1xljDM9tZhj9SWu0fZXMev3gVXuaFJ9uHfQb6kMUFezIOTLC
 Vd61CyYH2KV2wSYqT3/MjY61ddtiIxxXmUS16cwrKXZzIRaXEx7BpP9cu+g9W4tYO8p3
 MAP0hPOduuWLUJQVUBSUz4y9ZDTcTmimT6vV+85kfP2BsZDIbucrBLzHYhUtHFMAc4/s
 fgyp4fILhbYUHNKZG338f3M84fSWZGPz9w+Ixm2klJFzsKlQGMLOQg0Zch2I3hghs+Ud
 A0gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fCCe6w1TR7RMLi6DDgN577Y15RUjGIpQ9Q98I8PJgOQ=;
 b=2S3b0wdwuVJ2INmDGZ/vvld/Vu4i3Wr4SpXxwKIlDYIaiDPCB5wRNHMZdxtYkrcGt1
 H5xC+ltWCimlMBg+sche3bZvpO9jUplIU6M3+jmuCTHFS9QjuLTQvk3QSzZ2eizbAJu+
 dHIf9ggDZIr51wXv1vJNgiha56jZtYlC2Jc1OljGGGXjzUuFc2qoQtgH4ltL2EWI9mAd
 3XyIpR88zGdASK+QDts9jPqeA73hQjNOOW+9ekpy/ts3prjgdk7eoRP884KwnXZ2u5Ov
 /BUY2sX2KrNQ4IbBrAoLXEBJ8oFxHSId0CpeRilhb3dGzJsQgKITRSE8kQiqB0GI2/K8
 AUyA==
X-Gm-Message-State: AO0yUKUakw0/SFindQJJmtUeeKbah+aMb4NVAe5vEat9PmlDyYH06DG9
 lXjaYWO9CZwo74bLlDBJ6Cs=
X-Google-Smtp-Source: AK7set8wA0Ypx3eLmBI3CU+pAmglTcqZ2ZV2RWImWO0YEFou2gW7WearVaVmh4brIxcsRVddYEJ1iA==
X-Received: by 2002:a17:907:8c88:b0:8ea:5f7d:9007 with SMTP id
 td8-20020a1709078c8800b008ea5f7d9007mr18071229ejc.48.1677452801239; 
 Sun, 26 Feb 2023 15:06:41 -0800 (PST)
Received: from [127.0.0.1] (dynamic-077-013-188-032.77.13.pool.telefonica.de.
 [77.13.188.32]) by smtp.gmail.com with ESMTPSA id
 ml14-20020a170906cc0e00b008dcb559dbdbsm2405776ejb.88.2023.02.26.15.06.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Feb 2023 15:06:40 -0800 (PST)
Date: Sun, 26 Feb 2023 23:06:36 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
CC: Gerd Hoffmann <kraxel@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, philmd@linaro.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, ReneEngel80@emailn.de
Subject: Re: [PATCH v3 4/8] hw/isa/vt82c686: Implement PCI IRQ routing
In-Reply-To: <0fd9eac9174a840054c511fbc015048929c7bc40.1677445307.git.balaton@eik.bme.hu>
References: <cover.1677445307.git.balaton@eik.bme.hu>
 <0fd9eac9174a840054c511fbc015048929c7bc40.1677445307.git.balaton@eik.bme.hu>
Message-ID: <F86A8AF3-8D69-497A-ADD1-688D2B4FED03@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52f.google.com
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



Am 25=2E Februar 2023 18:11:49 UTC schrieb BALATON Zoltan <balaton@eik=2Eb=
me=2Ehu>:
>From: Bernhard Beschow <shentey@gmail=2Ecom>
>
>The real VIA south bridges implement a PCI IRQ router which is configured
>by the BIOS or the OS=2E In order to respect these configurations, QEMU
>needs to implement it as well=2E
>
>Note: The implementation was taken from piix4_set_irq() in hw/isa/piix4=
=2E
>
>Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>[balaton: declare gpio inputs instead of changing pci bus irqs so it can
> be connected in board code; remove some empty lines]
>Signed-off-by: BALATON Zoltan <balaton@eik=2Ebme=2Ehu>
>Tested-by: Rene Engel <ReneEngel80@emailn=2Ede>
>---
> hw/isa/vt82c686=2Ec | 39 +++++++++++++++++++++++++++++++++++++++
> 1 file changed, 39 insertions(+)
>
>diff --git a/hw/isa/vt82c686=2Ec b/hw/isa/vt82c686=2Ec
>index 3f9bd0c04d=2E=2E4025f9bcdc 100644
>--- a/hw/isa/vt82c686=2Ec
>+++ b/hw/isa/vt82c686=2Ec
>@@ -604,6 +604,44 @@ static void via_isa_request_i8259_irq(void *opaque, =
int irq, int level)
>     qemu_set_irq(s->cpu_intr, level);
> }
>=20
>+static int via_isa_get_pci_irq(const ViaISAState *s, int irq_num)
>+{
>+    switch (irq_num) {
>+    case 0:
>+        return s->dev=2Econfig[0x55] >> 4;
>+    case 1:
>+        return s->dev=2Econfig[0x56] & 0xf;
>+    case 2:
>+        return s->dev=2Econfig[0x56] >> 4;
>+    case 3:
>+        return s->dev=2Econfig[0x57] >> 4;
>+    }
>+    return 0;
>+}
>+
>+static void via_isa_set_pci_irq(void *opaque, int irq_num, int level)
>+{
>+    ViaISAState *s =3D opaque;
>+    PCIBus *bus =3D pci_get_bus(&s->dev);
>+    int pic_irq;
>+
>+    /* now we change the pic irq level according to the via irq mappings=
 */
>+    /* XXX: optimize */
>+    pic_irq =3D via_isa_get_pci_irq(s, irq_num);
>+    if (pic_irq < ISA_NUM_IRQS) {
>+        int i, pic_level;
>+
>+        /* The pic level is the logical OR of all the PCI irqs mapped to=
 it=2E */
>+        pic_level =3D 0;
>+        for (i =3D 0; i < PCI_NUM_PINS; i++) {
>+            if (pic_irq =3D=3D via_isa_get_pci_irq(s, i)) {
>+                pic_level |=3D pci_bus_get_irq_level(bus, i);
>+            }
>+        }
>+        qemu_set_irq(s->isa_irqs[pic_irq], pic_level);
>+    }
>+}
>+
> static void via_isa_realize(PCIDevice *d, Error **errp)
> {
>     ViaISAState *s =3D VIA_ISA(d);
>@@ -614,6 +652,7 @@ static void via_isa_realize(PCIDevice *d, Error **err=
p)
>     int i;
>=20
>     qdev_init_gpio_out(dev, &s->cpu_intr, 1);
>+    qdev_init_gpio_in_named(dev, via_isa_set_pci_irq, "pirq", PCI_NUM_PI=
NS);

This line is a Pegasos2 specific addition for fixing its IRQ handling=2E S=
ince this code must also work with the Fuloong2e board we should aim for a =
minimal changeset here which renders this line out of scope=2E

Let's keep the two series separate since now I need to watch two series fo=
r comments=2E Please use Based-on: tag next time instead=2E

Thanks,
Bernhard

>     isa_irq =3D qemu_allocate_irqs(via_isa_request_i8259_irq, s, 1);
>     isa_bus =3D isa_bus_new(dev, pci_address_space(d), pci_address_space=
_io(d),
>                           errp);

