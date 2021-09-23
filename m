Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A6C416539
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 20:32:32 +0200 (CEST)
Received: from localhost ([::1]:43994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTTWI-0003XS-MN
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 14:32:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mTTQz-0001Br-O5
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 14:27:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39312)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mTTQt-0003MU-VL
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 14:26:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632421615;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UqgCdHh0D1zoUkAye+beQDfdvgryWzyQnA7SHNJnC70=;
 b=Amzw1oEJyelV2uXRR3jew91rZS/0V9ahSNPY0w7RYRhPPojXH08KJXAFe9nmUxXtbscp8/
 gS62bA8KXWB1t5RuFNAlY8TYk6RrlbRMTOYmARegKU7Vs/srpSvDEVaz7gaXzRVRWyf90+
 5LnAhlzfORWgBfFQpFbtxBi0I4idCD0=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-433-LHW2eMdfN3-vV5dh1lqYNg-1; Thu, 23 Sep 2021 14:26:53 -0400
X-MC-Unique: LHW2eMdfN3-vV5dh1lqYNg-1
Received: by mail-oi1-f197.google.com with SMTP id
 m8-20020a05680806c800b0026702f1769bso4078153oih.10
 for <qemu-devel@nongnu.org>; Thu, 23 Sep 2021 11:26:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UqgCdHh0D1zoUkAye+beQDfdvgryWzyQnA7SHNJnC70=;
 b=UFkh+bswlJ/zDdvP3QRHjgQA2+JqPZVKur4bQkD2aIqHT0eef/ZagbB+MiRRYnLAPj
 YK0+mQ+Pz1iNyjjAppdg/kZlVwchtVjozqY82TsbbQkojrkj4YEmMWO0l36OtL3I8rV2
 xGeW4YXbS+QbfOJOQTiyRUuXA9Hf++RUrHgEY4bT8f8zjsUWqIAIH4YmYYQhA8Td8N86
 OOUFdm/nYpXZn7LR6pco8DHqTry7YTJdMGr+6R2ymF7f5cZuzYd7A9+406XxABbUVxag
 eFvub3L1PnyBuPzAbDkf5gRmqK4chx3qXCXtdDgEuOs94tQcuFj3Us91lR+MyxGAtZzJ
 DD8Q==
X-Gm-Message-State: AOAM531R3ydMzjyFxDYkYUSIbtfXIahbmypRV+/4ST/zJ/+IOoMwt42J
 M4qygqSwAbnNwiWi5jJzWQbkukFm9iIMYONBNjMrHI3XDYkf7DIdRLnITxd9VsvUscB6b2LWErM
 PRKRvSeCAIMFdFsW3xgZhTG5hew6AnHM=
X-Received: by 2002:a05:6830:310c:: with SMTP id
 b12mr124950ots.252.1632421612654; 
 Thu, 23 Sep 2021 11:26:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyLRN832chT67SMWuyIRk3hEsKBHDw8dm5HxiOzzvOE9+d407GJD06isJB7DV9qjqEM1510AmWpy0fW4uMaAYs=
X-Received: by 2002:a05:6830:310c:: with SMTP id
 b12mr124934ots.252.1632421612413; 
 Thu, 23 Sep 2021 11:26:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210923121153.23754-1-peter.maydell@linaro.org>
 <20210923121153.23754-7-peter.maydell@linaro.org>
In-Reply-To: <20210923121153.23754-7-peter.maydell@linaro.org>
From: John Snow <jsnow@redhat.com>
Date: Thu, 23 Sep 2021 14:26:41 -0400
Message-ID: <CAFn=p-bTDo29wbrBx+RWPfCc_ArcJB=ZPcGneUNtLR8O6qyzUw@mail.gmail.com>
Subject: Re: [PATCH 6/6] ide: Rename ide_bus_new() to ide_bus_init()
To: Peter Maydell <peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000055092605ccadc606"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.473,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Fam Zheng <fam@euphon.net>, Alberto Garcia <berto@igalia.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000055092605ccadc606
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 23, 2021 at 8:12 AM Peter Maydell <peter.maydell@linaro.org>
wrote:

> The function ide_bus_new() does an in-place initialization.  Rename
> it to ide_bus_init() to follow our _init vs _new convention.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/hw/ide/internal.h | 4 ++--
>  hw/ide/ahci.c             | 2 +-
>  hw/ide/cmd646.c           | 2 +-
>  hw/ide/isa.c              | 2 +-
>  hw/ide/macio.c            | 2 +-
>  hw/ide/microdrive.c       | 2 +-
>  hw/ide/mmio.c             | 2 +-
>  hw/ide/piix.c             | 2 +-
>  hw/ide/qdev.c             | 2 +-
>  hw/ide/sii3112.c          | 2 +-
>  hw/ide/via.c              | 2 +-
>  11 files changed, 12 insertions(+), 12 deletions(-)
>
> diff --git a/include/hw/ide/internal.h b/include/hw/ide/internal.h
> index 79172217ccb..97e7e59dc58 100644
> --- a/include/hw/ide/internal.h
> +++ b/include/hw/ide/internal.h
> @@ -648,8 +648,8 @@ void ide_atapi_cmd(IDEState *s);
>  void ide_atapi_cmd_reply_end(IDEState *s);
>
>  /* hw/ide/qdev.c */
> -void ide_bus_new(IDEBus *idebus, size_t idebus_size, DeviceState *dev,
> -                 int bus_id, int max_units);
> +void ide_bus_init(IDEBus *idebus, size_t idebus_size, DeviceState *dev,
> +                  int bus_id, int max_units);
>  IDEDevice *ide_create_drive(IDEBus *bus, int unit, DriveInfo *drive);
>
>  int ide_handle_rw_error(IDEState *s, int error, int op);
> diff --git a/hw/ide/ahci.c b/hw/ide/ahci.c
> index f2c51574839..a94c6e26fb0 100644
> --- a/hw/ide/ahci.c
> +++ b/hw/ide/ahci.c
> @@ -1548,7 +1548,7 @@ void ahci_realize(AHCIState *s, DeviceState *qdev,
> AddressSpace *as, int ports)
>      for (i = 0; i < s->ports; i++) {
>          AHCIDevice *ad = &s->dev[i];
>
> -        ide_bus_new(&ad->port, sizeof(ad->port), qdev, i, 1);
> +        ide_bus_init(&ad->port, sizeof(ad->port), qdev, i, 1);
>          ide_init2(&ad->port, irqs[i]);
>
>          ad->hba = s;
> diff --git a/hw/ide/cmd646.c b/hw/ide/cmd646.c
> index c2546314855..94c576262c1 100644
> --- a/hw/ide/cmd646.c
> +++ b/hw/ide/cmd646.c
> @@ -293,7 +293,7 @@ static void pci_cmd646_ide_realize(PCIDevice *dev,
> Error **errp)
>
>      qdev_init_gpio_in(ds, cmd646_set_irq, 2);
>      for (i = 0; i < 2; i++) {
> -        ide_bus_new(&d->bus[i], sizeof(d->bus[i]), ds, i, 2);
> +        ide_bus_init(&d->bus[i], sizeof(d->bus[i]), ds, i, 2);
>          ide_init2(&d->bus[i], qdev_get_gpio_in(ds, i));
>
>          bmdma_init(&d->bus[i], &d->bmdma[i], d);
> diff --git a/hw/ide/isa.c b/hw/ide/isa.c
> index 6bc19de2265..24bbde24c2b 100644
> --- a/hw/ide/isa.c
> +++ b/hw/ide/isa.c
> @@ -73,7 +73,7 @@ static void isa_ide_realizefn(DeviceState *dev, Error
> **errp)
>      ISADevice *isadev = ISA_DEVICE(dev);
>      ISAIDEState *s = ISA_IDE(dev);
>
> -    ide_bus_new(&s->bus, sizeof(s->bus), dev, 0, 2);
> +    ide_bus_init(&s->bus, sizeof(s->bus), dev, 0, 2);
>      ide_init_ioport(&s->bus, isadev, s->iobase, s->iobase2);
>      isa_init_irq(isadev, &s->irq, s->isairq);
>      ide_init2(&s->bus, s->irq);
> diff --git a/hw/ide/macio.c b/hw/ide/macio.c
> index b270a101632..b03d401ceb5 100644
> --- a/hw/ide/macio.c
> +++ b/hw/ide/macio.c
> @@ -449,7 +449,7 @@ static void macio_ide_initfn(Object *obj)
>      SysBusDevice *d = SYS_BUS_DEVICE(obj);
>      MACIOIDEState *s = MACIO_IDE(obj);
>
> -    ide_bus_new(&s->bus, sizeof(s->bus), DEVICE(obj), 0, 2);
> +    ide_bus_init(&s->bus, sizeof(s->bus), DEVICE(obj), 0, 2);
>      memory_region_init_io(&s->mem, obj, &pmac_ide_ops, s, "pmac-ide",
> 0x1000);
>      sysbus_init_mmio(d, &s->mem);
>      sysbus_init_irq(d, &s->real_ide_irq);
> diff --git a/hw/ide/microdrive.c b/hw/ide/microdrive.c
> index 58a14fea363..6df9b4cbbe1 100644
> --- a/hw/ide/microdrive.c
> +++ b/hw/ide/microdrive.c
> @@ -605,7 +605,7 @@ static void microdrive_init(Object *obj)
>  {
>      MicroDriveState *md = MICRODRIVE(obj);
>
> -    ide_bus_new(&md->bus, sizeof(md->bus), DEVICE(obj), 0, 1);
> +    ide_bus_init(&md->bus, sizeof(md->bus), DEVICE(obj), 0, 1);
>  }
>
>  static void microdrive_class_init(ObjectClass *oc, void *data)
> diff --git a/hw/ide/mmio.c b/hw/ide/mmio.c
> index 36e2f4790ab..fb2ebd4847f 100644
> --- a/hw/ide/mmio.c
> +++ b/hw/ide/mmio.c
> @@ -142,7 +142,7 @@ static void mmio_ide_initfn(Object *obj)
>      SysBusDevice *d = SYS_BUS_DEVICE(obj);
>      MMIOState *s = MMIO_IDE(obj);
>
> -    ide_bus_new(&s->bus, sizeof(s->bus), DEVICE(obj), 0, 2);
> +    ide_bus_init(&s->bus, sizeof(s->bus), DEVICE(obj), 0, 2);
>      sysbus_init_irq(d, &s->irq);
>  }
>
> diff --git a/hw/ide/piix.c b/hw/ide/piix.c
> index d3e738320be..ce89fd0aa36 100644
> --- a/hw/ide/piix.c
> +++ b/hw/ide/piix.c
> @@ -137,7 +137,7 @@ static int pci_piix_init_ports(PCIIDEState *d)
>      int i, ret;
>
>      for (i = 0; i < 2; i++) {
> -        ide_bus_new(&d->bus[i], sizeof(d->bus[i]), DEVICE(d), i, 2);
> +        ide_bus_init(&d->bus[i], sizeof(d->bus[i]), DEVICE(d), i, 2);
>          ret = ide_init_ioport(&d->bus[i], NULL, port_info[i].iobase,
>                                port_info[i].iobase2);
>          if (ret) {
> diff --git a/hw/ide/qdev.c b/hw/ide/qdev.c
> index ca844419106..618045b85ac 100644
> --- a/hw/ide/qdev.c
> +++ b/hw/ide/qdev.c
> @@ -68,7 +68,7 @@ static const TypeInfo ide_bus_info = {
>      .class_init = ide_bus_class_init,
>  };
>
> -void ide_bus_new(IDEBus *idebus, size_t idebus_size, DeviceState *dev,
> +void ide_bus_init(IDEBus *idebus, size_t idebus_size, DeviceState *dev,
>                   int bus_id, int max_units)
>  {
>      qbus_init(idebus, idebus_size, TYPE_IDE_BUS, dev, NULL);
> diff --git a/hw/ide/sii3112.c b/hw/ide/sii3112.c
> index 34c347b9c20..46204f10d75 100644
> --- a/hw/ide/sii3112.c
> +++ b/hw/ide/sii3112.c
> @@ -283,7 +283,7 @@ static void sii3112_pci_realize(PCIDevice *dev, Error
> **errp)
>
>      qdev_init_gpio_in(ds, sii3112_set_irq, 2);
>      for (i = 0; i < 2; i++) {
> -        ide_bus_new(&s->bus[i], sizeof(s->bus[i]), ds, i, 1);
> +        ide_bus_init(&s->bus[i], sizeof(s->bus[i]), ds, i, 1);
>          ide_init2(&s->bus[i], qdev_get_gpio_in(ds, i));
>
>          bmdma_init(&s->bus[i], &s->bmdma[i], s);
> diff --git a/hw/ide/via.c b/hw/ide/via.c
> index be09912b334..94cc2142c70 100644
> --- a/hw/ide/via.c
> +++ b/hw/ide/via.c
> @@ -190,7 +190,7 @@ static void via_ide_realize(PCIDevice *dev, Error
> **errp)
>
>      qdev_init_gpio_in(ds, via_ide_set_irq, 2);
>      for (i = 0; i < 2; i++) {
> -        ide_bus_new(&d->bus[i], sizeof(d->bus[i]), ds, i, 2);
> +        ide_bus_init(&d->bus[i], sizeof(d->bus[i]), ds, i, 2);
>          ide_init2(&d->bus[i], qdev_get_gpio_in(ds, i));
>
>          bmdma_init(&d->bus[i], &d->bmdma[i], d);
> --
> 2.20.1
>
>
Reviewed-by: John Snow <jsnow@redhat.com>
Acked-by: John Snow <jsnow@redhat.com> (Feel free to merge.)

--js

--00000000000055092605ccadc606
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Sep 23, 2021 at 8:12 AM Peter=
 Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@lina=
ro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">The function ide_bus_new() does an in-place initialization.=C2=A0 Ren=
ame<br>
it to ide_bus_init() to follow our _init vs _new convention.<br>
<br>
Signed-off-by: Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org=
" target=3D"_blank">peter.maydell@linaro.org</a>&gt;<br>
---<br>
=C2=A0include/hw/ide/internal.h | 4 ++--<br>
=C2=A0hw/ide/ahci.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<b=
r>
=C2=A0hw/ide/cmd646.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A0hw/ide/isa.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<b=
r>
=C2=A0hw/ide/macio.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0hw/ide/microdrive.c=C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A0hw/ide/mmio.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<b=
r>
=C2=A0hw/ide/piix.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<b=
r>
=C2=A0hw/ide/qdev.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<b=
r>
=C2=A0hw/ide/sii3112.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0hw/ide/via.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<b=
r>
=C2=A011 files changed, 12 insertions(+), 12 deletions(-)<br>
<br>
diff --git a/include/hw/ide/internal.h b/include/hw/ide/internal.h<br>
index 79172217ccb..97e7e59dc58 100644<br>
--- a/include/hw/ide/internal.h<br>
+++ b/include/hw/ide/internal.h<br>
@@ -648,8 +648,8 @@ void ide_atapi_cmd(IDEState *s);<br>
=C2=A0void ide_atapi_cmd_reply_end(IDEState *s);<br>
<br>
=C2=A0/* hw/ide/qdev.c */<br>
-void ide_bus_new(IDEBus *idebus, size_t idebus_size, DeviceState *dev,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int bus_id, =
int max_units);<br>
+void ide_bus_init(IDEBus *idebus, size_t idebus_size, DeviceState *dev,<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int bus_id,=
 int max_units);<br>
=C2=A0IDEDevice *ide_create_drive(IDEBus *bus, int unit, DriveInfo *drive);=
<br>
<br>
=C2=A0int ide_handle_rw_error(IDEState *s, int error, int op);<br>
diff --git a/hw/ide/ahci.c b/hw/ide/ahci.c<br>
index f2c51574839..a94c6e26fb0 100644<br>
--- a/hw/ide/ahci.c<br>
+++ b/hw/ide/ahci.c<br>
@@ -1548,7 +1548,7 @@ void ahci_realize(AHCIState *s, DeviceState *qdev, Ad=
dressSpace *as, int ports)<br>
=C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; s-&gt;ports; i++) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AHCIDevice *ad =3D &amp;s-&gt;dev[i];<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 ide_bus_new(&amp;ad-&gt;port, sizeof(ad-&gt;po=
rt), qdev, i, 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ide_bus_init(&amp;ad-&gt;port, sizeof(ad-&gt;p=
ort), qdev, i, 1);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ide_init2(&amp;ad-&gt;port, irqs[i]);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ad-&gt;hba =3D s;<br>
diff --git a/hw/ide/cmd646.c b/hw/ide/cmd646.c<br>
index c2546314855..94c576262c1 100644<br>
--- a/hw/ide/cmd646.c<br>
+++ b/hw/ide/cmd646.c<br>
@@ -293,7 +293,7 @@ static void pci_cmd646_ide_realize(PCIDevice *dev, Erro=
r **errp)<br>
<br>
=C2=A0 =C2=A0 =C2=A0qdev_init_gpio_in(ds, cmd646_set_irq, 2);<br>
=C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; 2; i++) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 ide_bus_new(&amp;d-&gt;bus[i], sizeof(d-&gt;bu=
s[i]), ds, i, 2);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ide_bus_init(&amp;d-&gt;bus[i], sizeof(d-&gt;b=
us[i]), ds, i, 2);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ide_init2(&amp;d-&gt;bus[i], qdev_get_gpi=
o_in(ds, i));<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bmdma_init(&amp;d-&gt;bus[i], &amp;d-&gt;=
bmdma[i], d);<br>
diff --git a/hw/ide/isa.c b/hw/ide/isa.c<br>
index 6bc19de2265..24bbde24c2b 100644<br>
--- a/hw/ide/isa.c<br>
+++ b/hw/ide/isa.c<br>
@@ -73,7 +73,7 @@ static void isa_ide_realizefn(DeviceState *dev, Error **e=
rrp)<br>
=C2=A0 =C2=A0 =C2=A0ISADevice *isadev =3D ISA_DEVICE(dev);<br>
=C2=A0 =C2=A0 =C2=A0ISAIDEState *s =3D ISA_IDE(dev);<br>
<br>
-=C2=A0 =C2=A0 ide_bus_new(&amp;s-&gt;bus, sizeof(s-&gt;bus), dev, 0, 2);<b=
r>
+=C2=A0 =C2=A0 ide_bus_init(&amp;s-&gt;bus, sizeof(s-&gt;bus), dev, 0, 2);<=
br>
=C2=A0 =C2=A0 =C2=A0ide_init_ioport(&amp;s-&gt;bus, isadev, s-&gt;iobase, s=
-&gt;iobase2);<br>
=C2=A0 =C2=A0 =C2=A0isa_init_irq(isadev, &amp;s-&gt;irq, s-&gt;isairq);<br>
=C2=A0 =C2=A0 =C2=A0ide_init2(&amp;s-&gt;bus, s-&gt;irq);<br>
diff --git a/hw/ide/macio.c b/hw/ide/macio.c<br>
index b270a101632..b03d401ceb5 100644<br>
--- a/hw/ide/macio.c<br>
+++ b/hw/ide/macio.c<br>
@@ -449,7 +449,7 @@ static void macio_ide_initfn(Object *obj)<br>
=C2=A0 =C2=A0 =C2=A0SysBusDevice *d =3D SYS_BUS_DEVICE(obj);<br>
=C2=A0 =C2=A0 =C2=A0MACIOIDEState *s =3D MACIO_IDE(obj);<br>
<br>
-=C2=A0 =C2=A0 ide_bus_new(&amp;s-&gt;bus, sizeof(s-&gt;bus), DEVICE(obj), =
0, 2);<br>
+=C2=A0 =C2=A0 ide_bus_init(&amp;s-&gt;bus, sizeof(s-&gt;bus), DEVICE(obj),=
 0, 2);<br>
=C2=A0 =C2=A0 =C2=A0memory_region_init_io(&amp;s-&gt;mem, obj, &amp;pmac_id=
e_ops, s, &quot;pmac-ide&quot;, 0x1000);<br>
=C2=A0 =C2=A0 =C2=A0sysbus_init_mmio(d, &amp;s-&gt;mem);<br>
=C2=A0 =C2=A0 =C2=A0sysbus_init_irq(d, &amp;s-&gt;real_ide_irq);<br>
diff --git a/hw/ide/microdrive.c b/hw/ide/microdrive.c<br>
index 58a14fea363..6df9b4cbbe1 100644<br>
--- a/hw/ide/microdrive.c<br>
+++ b/hw/ide/microdrive.c<br>
@@ -605,7 +605,7 @@ static void microdrive_init(Object *obj)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0MicroDriveState *md =3D MICRODRIVE(obj);<br>
<br>
-=C2=A0 =C2=A0 ide_bus_new(&amp;md-&gt;bus, sizeof(md-&gt;bus), DEVICE(obj)=
, 0, 1);<br>
+=C2=A0 =C2=A0 ide_bus_init(&amp;md-&gt;bus, sizeof(md-&gt;bus), DEVICE(obj=
), 0, 1);<br>
=C2=A0}<br>
<br>
=C2=A0static void microdrive_class_init(ObjectClass *oc, void *data)<br>
diff --git a/hw/ide/mmio.c b/hw/ide/mmio.c<br>
index 36e2f4790ab..fb2ebd4847f 100644<br>
--- a/hw/ide/mmio.c<br>
+++ b/hw/ide/mmio.c<br>
@@ -142,7 +142,7 @@ static void mmio_ide_initfn(Object *obj)<br>
=C2=A0 =C2=A0 =C2=A0SysBusDevice *d =3D SYS_BUS_DEVICE(obj);<br>
=C2=A0 =C2=A0 =C2=A0MMIOState *s =3D MMIO_IDE(obj);<br>
<br>
-=C2=A0 =C2=A0 ide_bus_new(&amp;s-&gt;bus, sizeof(s-&gt;bus), DEVICE(obj), =
0, 2);<br>
+=C2=A0 =C2=A0 ide_bus_init(&amp;s-&gt;bus, sizeof(s-&gt;bus), DEVICE(obj),=
 0, 2);<br>
=C2=A0 =C2=A0 =C2=A0sysbus_init_irq(d, &amp;s-&gt;irq);<br>
=C2=A0}<br>
<br>
diff --git a/hw/ide/piix.c b/hw/ide/piix.c<br>
index d3e738320be..ce89fd0aa36 100644<br>
--- a/hw/ide/piix.c<br>
+++ b/hw/ide/piix.c<br>
@@ -137,7 +137,7 @@ static int pci_piix_init_ports(PCIIDEState *d)<br>
=C2=A0 =C2=A0 =C2=A0int i, ret;<br>
<br>
=C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; 2; i++) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 ide_bus_new(&amp;d-&gt;bus[i], sizeof(d-&gt;bu=
s[i]), DEVICE(d), i, 2);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ide_bus_init(&amp;d-&gt;bus[i], sizeof(d-&gt;b=
us[i]), DEVICE(d), i, 2);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D ide_init_ioport(&amp;d-&gt;bus[i]=
, NULL, port_info[i].iobase,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0port_info[i].iobase2);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret) {<br>
diff --git a/hw/ide/qdev.c b/hw/ide/qdev.c<br>
index ca844419106..618045b85ac 100644<br>
--- a/hw/ide/qdev.c<br>
+++ b/hw/ide/qdev.c<br>
@@ -68,7 +68,7 @@ static const TypeInfo ide_bus_info =3D {<br>
=C2=A0 =C2=A0 =C2=A0.class_init =3D ide_bus_class_init,<br>
=C2=A0};<br>
<br>
-void ide_bus_new(IDEBus *idebus, size_t idebus_size, DeviceState *dev,<br>
+void ide_bus_init(IDEBus *idebus, size_t idebus_size, DeviceState *dev,<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int bus_id, =
int max_units)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0qbus_init(idebus, idebus_size, TYPE_IDE_BUS, dev, NULL)=
;<br>
diff --git a/hw/ide/sii3112.c b/hw/ide/sii3112.c<br>
index 34c347b9c20..46204f10d75 100644<br>
--- a/hw/ide/sii3112.c<br>
+++ b/hw/ide/sii3112.c<br>
@@ -283,7 +283,7 @@ static void sii3112_pci_realize(PCIDevice *dev, Error *=
*errp)<br>
<br>
=C2=A0 =C2=A0 =C2=A0qdev_init_gpio_in(ds, sii3112_set_irq, 2);<br>
=C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; 2; i++) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 ide_bus_new(&amp;s-&gt;bus[i], sizeof(s-&gt;bu=
s[i]), ds, i, 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ide_bus_init(&amp;s-&gt;bus[i], sizeof(s-&gt;b=
us[i]), ds, i, 1);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ide_init2(&amp;s-&gt;bus[i], qdev_get_gpi=
o_in(ds, i));<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bmdma_init(&amp;s-&gt;bus[i], &amp;s-&gt;=
bmdma[i], s);<br>
diff --git a/hw/ide/via.c b/hw/ide/via.c<br>
index be09912b334..94cc2142c70 100644<br>
--- a/hw/ide/via.c<br>
+++ b/hw/ide/via.c<br>
@@ -190,7 +190,7 @@ static void via_ide_realize(PCIDevice *dev, Error **err=
p)<br>
<br>
=C2=A0 =C2=A0 =C2=A0qdev_init_gpio_in(ds, via_ide_set_irq, 2);<br>
=C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; 2; i++) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 ide_bus_new(&amp;d-&gt;bus[i], sizeof(d-&gt;bu=
s[i]), ds, i, 2);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ide_bus_init(&amp;d-&gt;bus[i], sizeof(d-&gt;b=
us[i]), ds, i, 2);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ide_init2(&amp;d-&gt;bus[i], qdev_get_gpi=
o_in(ds, i));<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bmdma_init(&amp;d-&gt;bus[i], &amp;d-&gt;=
bmdma[i], d);<br>
-- <br>
2.20.1<br>
<br></blockquote><div><br></div><div>Reviewed-by: John Snow &lt;<a href=3D"=
mailto:jsnow@redhat.com">jsnow@redhat.com</a>&gt;</div><div>Acked-by: John =
Snow &lt;<a href=3D"mailto:jsnow@redhat.com">jsnow@redhat.com</a>&gt; (Feel=
 free to merge.)</div><div><br></div><div>--js<br></div></div></div>

--00000000000055092605ccadc606--


