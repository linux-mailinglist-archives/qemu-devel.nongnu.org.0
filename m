Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35AE94D00C5
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 15:11:47 +0100 (CET)
Received: from localhost ([::1]:39442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRE5R-0000Vb-N0
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 09:11:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nRDoz-0001nZ-0e
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 08:54:45 -0500
Received: from [2a00:1450:4864:20::529] (port=46071
 helo=mail-ed1-x529.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nRDov-00009M-2v
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 08:54:42 -0500
Received: by mail-ed1-x529.google.com with SMTP id y11so19495649eda.12
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 05:54:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:in-reply-to:references:message-id
 :mime-version:content-transfer-encoding;
 bh=37T8vtJmtd8xEVaab8ewcxTEn9HZvA4a66xevu2I7n0=;
 b=L3vH3AQrV5OCfuIYOR1i4YCLvcRBnhsWtKTLPf77x1jdtpBgU7Y6+z983CjlCl1JZC
 3A4Y+WTSCL8kJ1oj4mVAIR3bEZMA4TujTXtxzZQvFbRVpov5n0I5UswDdvXvJDKgS3lv
 dUx+v2uZaMGu7nOjqiLSz8rqQZnrsEjcTrIJ7QfHcoMDQaJgYKNd6WE61UHSkv9fqUVu
 jAiU6wU7W/kevQq7uiAYIMkSUnX+mS5GS5DnG9WqhEItr3THKAG1HEoFU3zb2OsOyufb
 rumNe36RRVvktWBuqwhsn50C54tJDz8upE8snd38G4lRCMz3zjJmPfr9CF/LwWKiCnAX
 0hFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:references
 :message-id:mime-version:content-transfer-encoding;
 bh=37T8vtJmtd8xEVaab8ewcxTEn9HZvA4a66xevu2I7n0=;
 b=hmz5uyQOkO4W0aGBH4u5Df3S5R2/HrkYKIXsj3CXsBQxRGSjNN/jW+6TaX/LJVktnt
 5+J1xm0/Rci8PsaX90+NL39jKHca0C3psjjv7+jKklw62BMQy6GbqWqeFaoXmnyAxhHB
 zMkkKq1CAkvotQp+Ga2PxLo/I6s7R4QSA3dqC/JK1syfg3C/gH7+Ml0TNK15Ote2Pwfm
 +yquaGbt6l2TXMhYRiqbb/leGC54KyJlTVwuwvwSu5bOCR7+veM/+Mm5TAsoYK1rGcHr
 O22vEWq8CHLLhV1YJYpMAfHmn0+2Gt4amwl4nlDfV4NwhXj4LvY9JQOwSCWDzCeCV3mU
 AXmA==
X-Gm-Message-State: AOAM530x98HVyx/2jE4lDgsNMWEgCsB1zdndw8EcufcqR4n0KZI/Pe9j
 DW76AUQP4jbRGePdNsuJnV0=
X-Google-Smtp-Source: ABdhPJwG9yzQQNH8tpK/ZeAhZdRMtMoJH6CGpv0oW+W+57hz0pdAn0v+gSPkwAtjxDMjwk1TgcoxFA==
X-Received: by 2002:a05:6402:d7:b0:413:673:ba2f with SMTP id
 i23-20020a05640200d700b004130673ba2fmr11029055edu.29.1646661279500; 
 Mon, 07 Mar 2022 05:54:39 -0800 (PST)
Received: from [127.0.0.1] (dynamic-089-012-143-092.89.12.pool.telefonica.de.
 [89.12.143.92]) by smtp.gmail.com with ESMTPSA id
 i22-20020a170906251600b006d6d9081f46sm4755533ejb.150.2022.03.07.05.54.38
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 07 Mar 2022 05:54:39 -0800 (PST)
Date: Mon, 07 Mar 2022 13:54:37 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?=
 <philippe.mathieu.daude@gmail.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH 13/13] hw/isa: Inline and remove one-line isa_init_irq()
In-Reply-To: <20220307134353.1950-14-philippe.mathieu.daude@gmail.com>
References: <20220307134353.1950-1-philippe.mathieu.daude@gmail.com>
 <20220307134353.1950-14-philippe.mathieu.daude@gmail.com>
Message-ID: <7E750FF7-791F-4D60-8D78-55A0C90975EB@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::529
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x529.google.com
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
Cc: Corey Minyard <cminyard@mvista.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 7=2E M=C3=A4rz 2022 13:43:53 UTC schrieb "Philippe Mathieu-Daud=C3=A9" <=
philippe=2Emathieu=2Edaude@gmail=2Ecom>:
>From: Bernhard Beschow <shentey@gmail=2Ecom>
>
>isa_init_irq() has become a trivial one-line wrapper for isa_get_irq()=2E
>It can therefore be removed=2E
>
>isa_ipmi_kcs)
>
>Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>Reviewed-by: Stefan Berger <stefanb@linux=2Eibm=2Ecom> (tpm_tis_isa)
>Acked-by: Corey Minyard <cminyard@mvista=2Ecom> (isa_ipmi_bt,
>Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat=2Eorg>
>Acked-by: Gerd Hoffmann <kraxel@redhat=2Ecom>
>Message-Id: <20220301220037=2E76555-8-shentey@gmail=2Ecom>
>Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat=2Eorg>

Reviewed-by: Bernhard Beschow <shentey@gmail=2Ecom>

>---
> hw/audio/cs4231a=2Ec     | 2 +-
> hw/audio/gus=2Ec         | 2 +-
> hw/audio/sb16=2Ec        | 2 +-
> hw/block/fdc-isa=2Ec     | 2 +-
> hw/char/parallel=2Ec     | 2 +-
> hw/char/serial-isa=2Ec   | 2 +-
> hw/ide/isa=2Ec           | 2 +-
> hw/input/pckbd=2Ec       | 4 ++--
> hw/ipmi/isa_ipmi_bt=2Ec  | 2 +-
> hw/ipmi/isa_ipmi_kcs=2Ec | 2 +-
> hw/isa/isa-bus=2Ec       | 8 +-------
> hw/isa/piix4=2Ec         | 2 +-
> hw/net/ne2000-isa=2Ec    | 2 +-
> hw/rtc/m48t59-isa=2Ec    | 2 +-
> hw/tpm/tpm_tis_isa=2Ec   | 2 +-
> include/hw/isa/isa=2Eh   | 1 -
> 16 files changed, 16 insertions(+), 23 deletions(-)

These numbers look right, i=2Ee=2E the patch looks complete=2E

Best regards,
Bernhard

>
>diff --git a/hw/audio/cs4231a=2Ec b/hw/audio/cs4231a=2Ec
>index 7d60ce6f0e=2E=2E0723e39430 100644
>--- a/hw/audio/cs4231a=2Ec
>+++ b/hw/audio/cs4231a=2Ec
>@@ -677,7 +677,7 @@ static void cs4231a_realizefn (DeviceState *dev, Erro=
r **errp)
>         return;
>     }
>=20
>-    isa_init_irq(d, &s->pic, s->irq);
>+    s->pic =3D isa_get_irq(d, s->irq);
>     k =3D ISADMA_GET_CLASS(s->isa_dma);
>     k->register_channel(s->isa_dma, s->dma, cs_dma_read, s);
>=20
>diff --git a/hw/audio/gus=2Ec b/hw/audio/gus=2Ec
>index e8719ee117=2E=2E42f010b671 100644
>--- a/hw/audio/gus=2Ec
>+++ b/hw/audio/gus=2Ec
>@@ -282,7 +282,7 @@ static void gus_realizefn (DeviceState *dev, Error **=
errp)
>     s->emu=2Ehimemaddr =3D s->himem;
>     s->emu=2Egusdatapos =3D s->emu=2Ehimemaddr + 1024 * 1024 + 32;
>     s->emu=2Eopaque =3D s;
>-    isa_init_irq (d, &s->pic, s->emu=2Egusirq);
>+    s->pic =3D isa_get_irq(d, s->emu=2Egusirq);
>=20
>     AUD_set_active_out (s->voice, 1);
> }
>diff --git a/hw/audio/sb16=2Ec b/hw/audio/sb16=2Ec
>index 60f1f75e3a=2E=2E2215386ddb 100644
>--- a/hw/audio/sb16=2Ec
>+++ b/hw/audio/sb16=2Ec
>@@ -1408,7 +1408,7 @@ static void sb16_realizefn (DeviceState *dev, Error=
 **errp)
>         return;
>     }
>=20
>-    isa_init_irq (isadev, &s->pic, s->irq);
>+    s->pic =3D isa_get_irq(isadev, s->irq);
>=20
>     s->mixer_regs[0x80] =3D magic_of_irq (s->irq);
>     s->mixer_regs[0x81] =3D (1 << s->dma) | (1 << s->hdma);
>diff --git a/hw/block/fdc-isa=2Ec b/hw/block/fdc-isa=2Ec
>index ab663dce93=2E=2Efa20450747 100644
>--- a/hw/block/fdc-isa=2Ec
>+++ b/hw/block/fdc-isa=2Ec
>@@ -94,7 +94,7 @@ static void isabus_fdc_realize(DeviceState *dev, Error =
**errp)
>                              isa->iobase, fdc_portio_list, fdctrl,
>                              "fdc");
>=20
>-    isa_init_irq(isadev, &fdctrl->irq, isa->irq);
>+    fdctrl->irq =3D isa_get_irq(isadev, isa->irq);
>     fdctrl->dma_chann =3D isa->dma;
>     if (fdctrl->dma_chann !=3D -1) {
>         IsaDmaClass *k;
>diff --git a/hw/char/parallel=2Ec b/hw/char/parallel=2Ec
>index b45e67bfbb=2E=2Eadb9bd9be3 100644
>--- a/hw/char/parallel=2Ec
>+++ b/hw/char/parallel=2Ec
>@@ -553,7 +553,7 @@ static void parallel_isa_realizefn(DeviceState *dev, =
Error **errp)
>     index++;
>=20
>     base =3D isa->iobase;
>-    isa_init_irq(isadev, &s->irq, isa->isairq);
>+    s->irq =3D isa_get_irq(isadev, isa->isairq);
>     qemu_register_reset(parallel_reset, s);
>=20
>     qemu_chr_fe_set_handlers(&s->chr, parallel_can_receive, NULL,
>diff --git a/hw/char/serial-isa=2Ec b/hw/char/serial-isa=2Ec
>index 1b8b303079=2E=2E7a7ed239cd 100644
>--- a/hw/char/serial-isa=2Ec
>+++ b/hw/char/serial-isa=2Ec
>@@ -75,7 +75,7 @@ static void serial_isa_realizefn(DeviceState *dev, Erro=
r **errp)
>     }
>     index++;
>=20
>-    isa_init_irq(isadev, &s->irq, isa->isairq);
>+    s->irq =3D isa_get_irq(isadev, isa->isairq);
>     qdev_realize(DEVICE(s), NULL, errp);
>     qdev_set_legacy_instance_id(dev, isa->iobase, 3);
>=20
>diff --git a/hw/ide/isa=2Ec b/hw/ide/isa=2Ec
>index 24bbde24c2=2E=2E8bedbd13f1 100644
>--- a/hw/ide/isa=2Ec
>+++ b/hw/ide/isa=2Ec
>@@ -75,7 +75,7 @@ static void isa_ide_realizefn(DeviceState *dev, Error *=
*errp)
>=20
>     ide_bus_init(&s->bus, sizeof(s->bus), dev, 0, 2);
>     ide_init_ioport(&s->bus, isadev, s->iobase, s->iobase2);
>-    isa_init_irq(isadev, &s->irq, s->isairq);
>+    s->irq =3D isa_get_irq(isadev, s->isairq);
>     ide_init2(&s->bus, s->irq);
>     vmstate_register(VMSTATE_IF(dev), 0, &vmstate_ide_isa, s);
>     ide_register_restart_cb(&s->bus);
>diff --git a/hw/input/pckbd=2Ec b/hw/input/pckbd=2Ec
>index eb77e12f6f=2E=2E1773db0d25 100644
>--- a/hw/input/pckbd=2Ec
>+++ b/hw/input/pckbd=2Ec
>@@ -749,8 +749,8 @@ static void i8042_realizefn(DeviceState *dev, Error *=
*errp)
>         return;
>     }
>=20
>-    isa_init_irq(isadev, &s->irq_kbd, isa_s->kbd_irq);
>-    isa_init_irq(isadev, &s->irq_mouse, isa_s->mouse_irq);
>+    s->irq_kbd =3D isa_get_irq(isadev, isa_s->kbd_irq);
>+    s->irq_mouse =3D isa_get_irq(isadev, isa_s->mouse_irq);
>=20
>     isa_register_ioport(isadev, isa_s->io + 0, 0x60);
>     isa_register_ioport(isadev, isa_s->io + 1, 0x64);
>diff --git a/hw/ipmi/isa_ipmi_bt=2Ec b/hw/ipmi/isa_ipmi_bt=2Ec
>index 02625eb94e=2E=2E88aa734e9e 100644
>--- a/hw/ipmi/isa_ipmi_bt=2Ec
>+++ b/hw/ipmi/isa_ipmi_bt=2Ec
>@@ -92,7 +92,7 @@ static void isa_ipmi_bt_realize(DeviceState *dev, Error=
 **errp)
>     }
>=20
>     if (iib->isairq > 0) {
>-        isa_init_irq(isadev, &iib->irq, iib->isairq);
>+        iib->irq =3D isa_get_irq(isadev, iib->isairq);
>         iib->bt=2Euse_irq =3D 1;
>         iib->bt=2Eraise_irq =3D isa_ipmi_bt_raise_irq;
>         iib->bt=2Elower_irq =3D isa_ipmi_bt_lower_irq;
>diff --git a/hw/ipmi/isa_ipmi_kcs=2Ec b/hw/ipmi/isa_ipmi_kcs=2Ec
>index 3b23ad08b3=2E=2Eafabb95ebe 100644
>--- a/hw/ipmi/isa_ipmi_kcs=2Ec
>+++ b/hw/ipmi/isa_ipmi_kcs=2Ec
>@@ -91,7 +91,7 @@ static void ipmi_isa_realize(DeviceState *dev, Error **=
errp)
>     }
>=20
>     if (iik->isairq > 0) {
>-        isa_init_irq(isadev, &iik->irq, iik->isairq);
>+        iik->irq =3D isa_get_irq(isadev, iik->isairq);
>         iik->kcs=2Euse_irq =3D 1;
>         iik->kcs=2Eraise_irq =3D isa_ipmi_kcs_raise_irq;
>         iik->kcs=2Elower_irq =3D isa_ipmi_kcs_lower_irq;
>diff --git a/hw/isa/isa-bus=2Ec b/hw/isa/isa-bus=2Ec
>index c64a14120b=2E=2E0ad1c5fd65 100644
>--- a/hw/isa/isa-bus=2Ec
>+++ b/hw/isa/isa-bus=2Ec
>@@ -85,15 +85,9 @@ qemu_irq isa_get_irq(ISADevice *dev, unsigned isairq)
>     return isabus->irqs[isairq];
> }
>=20
>-void isa_init_irq(ISADevice *dev, qemu_irq *p, unsigned isairq)
>-{
>-    *p =3D isa_get_irq(dev, isairq);
>-}
>-
> void isa_connect_gpio_out(ISADevice *isadev, int gpioirq, unsigned isair=
q)
> {
>-    qemu_irq irq;
>-    isa_init_irq(isadev, &irq, isairq);
>+    qemu_irq irq =3D isa_get_irq(isadev, isairq);
>     qdev_connect_gpio_out(DEVICE(isadev), gpioirq, irq);
> }
>=20
>diff --git a/hw/isa/piix4=2Ec b/hw/isa/piix4=2Ec
>index fc3c8b3fd1=2E=2E8607e0ac36 100644
>--- a/hw/isa/piix4=2Ec
>+++ b/hw/isa/piix4=2Ec
>@@ -216,7 +216,7 @@ static void piix4_realize(PCIDevice *dev, Error **err=
p)
>     if (!qdev_realize(DEVICE(&s->rtc), BUS(isa_bus), errp)) {
>         return;
>     }
>-    isa_init_irq(ISA_DEVICE(&s->rtc), &s->rtc=2Eirq, s->rtc=2Eisairq);
>+    s->rtc=2Eirq =3D isa_get_irq(ISA_DEVICE(&s->rtc), s->rtc=2Eisairq);
> }
>=20
> static void piix4_init(Object *obj)
>diff --git a/hw/net/ne2000-isa=2Ec b/hw/net/ne2000-isa=2Ec
>index dd6f6e34d3=2E=2E6ced6775ff 100644
>--- a/hw/net/ne2000-isa=2Ec
>+++ b/hw/net/ne2000-isa=2Ec
>@@ -68,7 +68,7 @@ static void isa_ne2000_realizefn(DeviceState *dev, Erro=
r **errp)
>     ne2000_setup_io(s, DEVICE(isadev), 0x20);
>     isa_register_ioport(isadev, &s->io, isa->iobase);
>=20
>-    isa_init_irq(isadev, &s->irq, isa->isairq);
>+    s->irq =3D isa_get_irq(isadev, isa->isairq);
>=20
>     qemu_macaddr_default_if_unset(&s->c=2Emacaddr);
>     ne2000_reset(s);
>diff --git a/hw/rtc/m48t59-isa=2Ec b/hw/rtc/m48t59-isa=2Ec
>index e9086eada4=2E=2Ee61f7ec370 100644
>--- a/hw/rtc/m48t59-isa=2Ec
>+++ b/hw/rtc/m48t59-isa=2Ec
>@@ -106,7 +106,7 @@ static void m48t59_isa_realize(DeviceState *dev, Erro=
r **errp)
>=20
>     s->model =3D u->info=2Emodel;
>     s->size =3D u->info=2Esize;
>-    isa_init_irq(isadev, &s->IRQ, d->isairq);
>+    s->IRQ =3D isa_get_irq(isadev, d->isairq);
>     m48t59_realize_common(s, errp);
>     memory_region_init_io(&d->io, OBJECT(dev), &m48t59_io_ops, s, "m48t5=
9", 4);
>     if (d->io_base !=3D 0) {
>diff --git a/hw/tpm/tpm_tis_isa=2Ec b/hw/tpm/tpm_tis_isa=2Ec
>index 10d8a14f19=2E=2E3477afd735 100644
>--- a/hw/tpm/tpm_tis_isa=2Ec
>+++ b/hw/tpm/tpm_tis_isa=2Ec
>@@ -127,7 +127,7 @@ static void tpm_tis_isa_realizefn(DeviceState *dev, E=
rror **errp)
>         return;
>     }
>=20
>-    isa_init_irq(ISA_DEVICE(dev), &s->irq, s->irq_num);
>+    s->irq =3D isa_get_irq(ISA_DEVICE(dev), s->irq_num);
>=20
>     memory_region_add_subregion(isa_address_space(ISA_DEVICE(dev)),
>                                 TPM_TIS_ADDR_BASE, &s->mmio);
>diff --git a/include/hw/isa/isa=2Eh b/include/hw/isa/isa=2Eh
>index d80cab5b79=2E=2E034d706ba1 100644
>--- a/include/hw/isa/isa=2Eh
>+++ b/include/hw/isa/isa=2Eh
>@@ -90,7 +90,6 @@ ISABus *isa_bus_new(DeviceState *dev, MemoryRegion *add=
ress_space,
>                     MemoryRegion *address_space_io, Error **errp);
> void isa_bus_irqs(ISABus *bus, qemu_irq *irqs);
> qemu_irq isa_get_irq(ISADevice *dev, unsigned isairq);
>-void isa_init_irq(ISADevice *dev, qemu_irq *p, unsigned isairq);
> void isa_connect_gpio_out(ISADevice *isadev, int gpioirq, unsigned isair=
q);
> void isa_bus_dma(ISABus *bus, IsaDma *dma8, IsaDma *dma16);
> IsaDma *isa_get_dma(ISABus *bus, int nchan);


