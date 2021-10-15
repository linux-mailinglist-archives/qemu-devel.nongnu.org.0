Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6750D42FDA4
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 23:51:09 +0200 (CEST)
Received: from localhost ([::1]:48018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbV6a-0001wt-G2
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 17:51:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1mbV4n-0001Dy-Nc
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 17:49:17 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:57049)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1mbV4l-0003H2-Gz
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 17:49:17 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id 1F9F03201B5C;
 Fri, 15 Oct 2021 17:49:14 -0400 (EDT)
Received: from imap44 ([10.202.2.94])
 by compute2.internal (MEProxy); Fri, 15 Oct 2021 17:49:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type:content-transfer-encoding; s=fm3; bh=baus0
 dIpK6etpVEtAYhCbmL7YwI1BbvOcpYIkMnnhZc=; b=RY4w6qxiRXEmOaePVcOGW
 QZOA7uYgMBKqJRkfRYM3FU9xePOCjPUEwHYpqP5n0ZkERvXXq1LqiFEDe+/uhM6s
 dBVO8NZNLpvdZpxikSjjFrKzu+KywsxoliNC6rcyoTkym2kQXO3e8sDEAe492Nn8
 oLwcoZzc33GFqkyGrEwZ84QmEv1JByoo6rV2wub0y1QvJaoFzFEaub9RCy4CTHD/
 sJCeisTH+rXiF8JqbtAssseLEuWWZaD/unvgmvxMyFzk4aTd2oafypCU61w5fKBz
 wC5v1Xoa+ioq+aTTCgd1I14xcJdOT5+bXVYJwPWRwpjcK6+42H3E6EzFoONrrsp/
 w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=baus0dIpK6etpVEtAYhCbmL7YwI1BbvOcpYIkMnnh
 Zc=; b=PF3fRHFt9U2nJhEc+5R128LbX3ShDRIhheCK0iB9YiWnp/ONTO0RGfncj
 2+sO+pIHj6P3kDV3PjXiIh9gEDXmznbw2zlnFI1YJ+yY7adwLTAF/4S4A5M7Pxl9
 qnVFeDplzAjzwHOKb3yRhnjwTx3Ju7nOeTojqyCGc5EKMiRFNWWvMB+BXa67sdeO
 VwfpYFLVoFq7lIAPb/ns17QGhyZOo6KgDFzGJxu/nbmbqtDBsvjlU7QT0Tms3Tqz
 JmzTuvRxnDSweDUeqbl/v4TIt39Jh2DVbHc+J02Rdh5SYJqycUwxCmjv5T+UUe/C
 aSCLWkpvPU/n9r68j8BZSBa++sKQQ==
X-ME-Sender: <xms:WfdpYWaSjQ-qaygldYAnrdJPsjBcBhy-prpiyUcI3q8xr0c86UuIpA>
 <xme:WfdpYZYVzYL9FaXdDinyfUIMzsMJGb4ptnS4FqP7iDT2nvjIRI3MPMpR4ebbaouR1
 V5GawzRGY5r9bWEIOM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdduhedgtddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgfgsehtqhertderreejnecuhfhrohhmpedflfhi
 rgiguhhnucgjrghnghdfuceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
 eqnecuggftrfgrthhtvghrnhepfeetgeekveeftefhgfduheegvdeuuddvieefvddvlefh
 feehkeetfeeukedtfeejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
 hilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:WfdpYQ9NX-TZBsgkCpeVSTp_4lIzc2b5vvn0qlZ2Kdg_wpEHJN1Nsw>
 <xmx:WfdpYYq1hiw6cAELKEkvxDIp-B_Ee6dP5932D3VbUg-g-fjeYAATAw>
 <xmx:WfdpYRoM8T_YgGK1RjVFH7K5vS_X2rCGI1Z6I7Yk6qqtG_8MmPqdHg>
 <xmx:WfdpYY3CI5dYNRzZMgTn9YE5ij_GIoOMniGvJ0RsbDYG4zQtFI5RCg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 4F941FA0AA5; Fri, 15 Oct 2021 17:49:13 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-1345-g8441cd7852-fm-20211006.001-g8441cd78
Mime-Version: 1.0
Message-Id: <02f91e54-5b38-48ad-9bfd-b94e130258ea@www.fastmail.com>
In-Reply-To: <7cb7a16ff4daf8f48d576246255bea1fd355207c.1634259980.git.balaton@eik.bme.hu>
References: <cover.1634259980.git.balaton@eik.bme.hu>
 <7cb7a16ff4daf8f48d576246255bea1fd355207c.1634259980.git.balaton@eik.bme.hu>
Date: Fri, 15 Oct 2021 22:48:52 +0100
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "BALATON Zoltan" <balaton@eik.bme.hu>,
 "BALATON Zoltan via" <qemu-devel@nongnu.org>
Subject: Re: [PATCH 1/4] vt82c686: Move common code to via_isa_realize
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=64.147.123.25;
 envelope-from=jiaxun.yang@flygoat.com; helo=wout2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Huacai Chen <chenhuacai@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



=E5=9C=A82021=E5=B9=B410=E6=9C=8815=E6=97=A5=E5=8D=81=E6=9C=88 =E4=B8=8A=
=E5=8D=882:06=EF=BC=8CBALATON Zoltan=E5=86=99=E9=81=93=EF=BC=9A
> The vt82c686b_realize and vt8231_realize methods are almost identical,
> factor out the common parts to a via_isa_realize function to avoid
> code duplication.
>
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

> ---
>  hw/isa/vt82c686.c | 67 ++++++++++++++++++++---------------------------
>  1 file changed, 29 insertions(+), 38 deletions(-)
>
> diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
> index f57f3e7067..5b41539f2c 100644
> --- a/hw/isa/vt82c686.c
> +++ b/hw/isa/vt82c686.c
> @@ -542,6 +542,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(ViaISAState, VIA_ISA)
>  struct ViaISAState {
>      PCIDevice dev;
>      qemu_irq cpu_intr;
> +    ISABus *isa_bus;
>      ViaSuperIOState *via_sio;
>  };
>=20
> @@ -572,6 +573,29 @@ static void via_isa_request_i8259_irq(void=20
> *opaque, int irq, int level)
>      qemu_set_irq(s->cpu_intr, level);
>  }
>=20
> +static void via_isa_realize(PCIDevice *d, Error **errp)
> +{
> +    ViaISAState *s =3D VIA_ISA(d);
> +    DeviceState *dev =3D DEVICE(d);
> +    qemu_irq *isa_irq;
> +    int i;
> +
> +    qdev_init_gpio_out(dev, &s->cpu_intr, 1);
> +    isa_irq =3D qemu_allocate_irqs(via_isa_request_i8259_irq, s, 1);
> +    s->isa_bus =3D isa_bus_new(dev, get_system_memory(), pci_address_=
space_io(d),
> +                          &error_fatal);
> +    isa_bus_irqs(s->isa_bus, i8259_init(s->isa_bus, *isa_irq));
> +    i8254_pit_init(s->isa_bus, 0x40, 0, NULL);
> +    i8257_dma_init(s->isa_bus, 0);
> +    mc146818_rtc_init(s->isa_bus, 2000, NULL);
> +
> +    for (i =3D 0; i < PCI_CONFIG_HEADER_SIZE; i++) {
> +        if (i < PCI_COMMAND || i >=3D PCI_REVISION_ID) {
> +            d->wmask[i] =3D 0;
> +        }
> +    }
> +}
> +
>  /* TYPE_VT82C686B_ISA */
>=20
>  static void vt82c686b_write_config(PCIDevice *d, uint32_t addr,
> @@ -610,27 +634,10 @@ static void vt82c686b_isa_reset(DeviceState *dev)
>  static void vt82c686b_realize(PCIDevice *d, Error **errp)
>  {
>      ViaISAState *s =3D VIA_ISA(d);
> -    DeviceState *dev =3D DEVICE(d);
> -    ISABus *isa_bus;
> -    qemu_irq *isa_irq;
> -    int i;
>=20
> -    qdev_init_gpio_out(dev, &s->cpu_intr, 1);
> -    isa_irq =3D qemu_allocate_irqs(via_isa_request_i8259_irq, s, 1);
> -    isa_bus =3D isa_bus_new(dev, get_system_memory(), pci_address_spa=
ce_io(d),
> -                          &error_fatal);
> -    isa_bus_irqs(isa_bus, i8259_init(isa_bus, *isa_irq));
> -    i8254_pit_init(isa_bus, 0x40, 0, NULL);
> -    i8257_dma_init(isa_bus, 0);
> -    s->via_sio =3D VIA_SUPERIO(isa_create_simple(isa_bus,
> +    via_isa_realize(d, errp);
> +    s->via_sio =3D VIA_SUPERIO(isa_create_simple(s->isa_bus,
>                                                 TYPE_VT82C686B_SUPERIO=
));
> -    mc146818_rtc_init(isa_bus, 2000, NULL);
> -
> -    for (i =3D 0; i < PCI_CONFIG_HEADER_SIZE; i++) {
> -        if (i < PCI_COMMAND || i >=3D PCI_REVISION_ID) {
> -            d->wmask[i] =3D 0;
> -        }
> -    }
>  }
>=20
>  static void vt82c686b_class_init(ObjectClass *klass, void *data)
> @@ -691,26 +698,10 @@ static void vt8231_isa_reset(DeviceState *dev)
>  static void vt8231_realize(PCIDevice *d, Error **errp)
>  {
>      ViaISAState *s =3D VIA_ISA(d);
> -    DeviceState *dev =3D DEVICE(d);
> -    ISABus *isa_bus;
> -    qemu_irq *isa_irq;
> -    int i;
> -
> -    qdev_init_gpio_out(dev, &s->cpu_intr, 1);
> -    isa_irq =3D qemu_allocate_irqs(via_isa_request_i8259_irq, s, 1);
> -    isa_bus =3D isa_bus_new(dev, get_system_memory(), pci_address_spa=
ce_io(d),
> -                          &error_fatal);
> -    isa_bus_irqs(isa_bus, i8259_init(isa_bus, *isa_irq));
> -    i8254_pit_init(isa_bus, 0x40, 0, NULL);
> -    i8257_dma_init(isa_bus, 0);
> -    s->via_sio =3D VIA_SUPERIO(isa_create_simple(isa_bus, TYPE_VT8231=
_SUPERIO));
> -    mc146818_rtc_init(isa_bus, 2000, NULL);
>=20
> -    for (i =3D 0; i < PCI_CONFIG_HEADER_SIZE; i++) {
> -        if (i < PCI_COMMAND || i >=3D PCI_REVISION_ID) {
> -            d->wmask[i] =3D 0;
> -        }
> -    }
> +    via_isa_realize(d, errp);
> +    s->via_sio =3D VIA_SUPERIO(isa_create_simple(s->isa_bus,
> +                                               TYPE_VT8231_SUPERIO));
>  }
>=20
>  static void vt8231_class_init(ObjectClass *klass, void *data)
> --=20
> 2.21.4

--=20
- Jiaxun

