Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5CD731609A
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 09:09:36 +0100 (CET)
Received: from localhost ([::1]:36052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9kZ5-0000Tr-En
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 03:09:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1l9kY1-0008TU-HA; Wed, 10 Feb 2021 03:08:29 -0500
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:50079)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1l9kXz-00042v-0M; Wed, 10 Feb 2021 03:08:29 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.108])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 791AE84E04B5;
 Wed, 10 Feb 2021 09:08:15 +0100 (CET)
Received: from kaod.org (37.59.142.96) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Wed, 10 Feb
 2021 09:08:13 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R001d12a2f3f-10c7-42f8-b75a-0fb535ca3bd6,
 CA44D9D1C99DDC6070F74A114A21469C6A1097AD) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Wed, 10 Feb 2021 09:08:12 +0100
From: Greg Kurz <groug@kaod.org>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH] spapr: Adjust firmware path of PCI devices
Message-ID: <20210210090812.3597cfc0@bahia.lan>
In-Reply-To: <752c0b15-032f-017c-eecf-204f9d62fd5a@ozlabs.ru>
References: <20210122170157.246374-1-groug@kaod.org>
 <4294d3b5-abf3-fd43-660b-d82caf791d4f@ozlabs.ru>
 <20210125112311.254ba960@bahia.lan>
 <d647f198-4f47-692e-8a6e-8312044edfa8@ozlabs.ru>
 <752c0b15-032f-017c-eecf-204f9d62fd5a@ozlabs.ru>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG4EX2.mxp5.local (172.16.2.32) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: b7b81351-a02a-499a-8b12-085812fcc2ba
X-Ovh-Tracer-Id: 10695486165341280736
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrheeigdduudejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfhisehtqhertdertdejnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeevfedvjeeuvdeuvefhieeiffehhfegkefhgedvhefhleettdfhgfeugfevieekgfenucffohhmrghinhepohhpvghnshhouhhrtggvrdhorhhgnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtohepuggrvhhiugesghhisghsohhnrdgurhhophgsvggrrhdrihgurdgruh
Received-SPF: pass client-ip=178.32.125.2; envelope-from=groug@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 10 Feb 2021 17:40:43 +1100
Alexey Kardashevskiy <aik@ozlabs.ru> wrote:

>=20
>=20
> On 27/01/2021 12:28, Alexey Kardashevskiy wrote:
> >=20
> >=20
> > On 25/01/2021 21:23, Greg Kurz wrote:
> >> On Sat, 23 Jan 2021 13:36:34 +1100
> >> Alexey Kardashevskiy <aik@ozlabs.ru> wrote:
> >>
> >>>
> >>>
> >>> On 23/01/2021 04:01, Greg Kurz wrote:
> >>>> It is currently not possible to perform a strict boot from USB stora=
ge:
> >>>>
> >>>> $ qemu-system-ppc64 -accel kvm -nodefaults -nographic -serial stdio \
> >>>> =C2=A0=C2=A0=C2=A0=C2=A0-boot strict=3Don \
> >>>> =C2=A0=C2=A0=C2=A0=C2=A0-device qemu-xhci \
> >>>> =C2=A0=C2=A0=C2=A0=C2=A0-device usb-storage,drive=3Ddisk,bootindex=
=3D0 \
> >>>> =C2=A0=C2=A0=C2=A0=C2=A0-blockdev driver=3Dfile,node-name=3Ddisk,fil=
ename=3Dfedora-ppc64le.qcow2
> >>>>
> >>>>
> >>>> SLOF=20
> >>>> ********************************************************************=
**
> >>>> QEMU Starting
> >>>> =C2=A0=C2=A0 Build Date =3D Jul 17 2020 11:15:24
> >>>> =C2=A0=C2=A0 FW Version =3D git-e18ddad8516ff2cf
> >>>> =C2=A0=C2=A0 Press "s" to enter Open Firmware.
> >>>>
> >>>> Populating /vdevice methods
> >>>> Populating /vdevice/vty@71000000
> >>>> Populating /vdevice/nvram@71000001
> >>>> Populating /pci@800000020000000
> >>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 00 0000 =
(D) : 1b36 000d=C2=A0=C2=A0=C2=A0 serial bus [=20
> >>>> usb-xhci ]
> >>>> No NVRAM common partition, re-initializing...
> >>>> Scanning USB
> >>>> =C2=A0=C2=A0=C2=A0 XHCI: Initializing
> >>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 USB Storage
> >>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SCSI: Looking for d=
evices
> >>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1=
01000000000000 DISK=C2=A0=C2=A0=C2=A0=C2=A0 : "QEMU=C2=A0=C2=A0=C2=A0=C2=A0=
 QEMU HARDDISK=C2=A0=C2=A0=C2=A0 2.5+"
> >>>> Using default console: /vdevice/vty@71000000
> >>>>
> >>>> =C2=A0=C2=A0=C2=A0 Welcome to Open Firmware
> >>>>
> >>>> =C2=A0=C2=A0=C2=A0 Copyright (c) 2004, 2017 IBM Corporation All righ=
ts reserved.
> >>>> =C2=A0=C2=A0=C2=A0 This program and the accompanying materials are m=
ade available
> >>>> =C2=A0=C2=A0=C2=A0 under the terms of the BSD License available at
> >>>> =C2=A0=C2=A0=C2=A0 http://www.opensource.org/licenses/bsd-license.php
> >>>>
> >>>>
> >>>> Trying to load:=C2=A0 from:=20
> >>>> /pci@800000020000000/usb@0/storage@1/disk@101000000000000 ...
> >>>> E3405: No such device
> >>>>
> >>>> E3407: Load failed
> >>>>
> >>>> =C2=A0=C2=A0=C2=A0 Type 'boot' and press return to continue booting =
the system.
> >>>> =C2=A0=C2=A0=C2=A0 Type 'reset-all' and press return to reboot the s=
ystem.
> >>>>
> >>>>
> >>>> Ready!
> >>>> 0 >
> >>>>
> >>>> The device tree handed over by QEMU to SLOF indeed contains:
> >>>>
> >>>> qemu,boot-list =3D
> >>>> =C2=A0=C2=A0=C2=A0=C2=A0"/pci@800000020000000/usb@0/storage@1/disk@1=
01000000000000 HALT";
> >>>>
> >>>> but the device node is named usb-xhci@0, not usb@0.
> >>>
> >>>
> >>> I'd expect it to be a return of qdev_fw_name() so in this case someth=
ing
> >>> like "nec-usb-xhci" (which would still be broken) but seeing a plain
> >>> "usb" is a bit strange.
> >>>
> >>
> >> The logic under get_boot_devices_list() is a bit hard to follow
> >> because of the multiple indirections, but AFAICT it doesn't seem
> >> to rely on qdev_fw_name() to get the names.
> >>
> >> None of the XHCI devices seem to be setting DeviceClass::fw_name anywa=
y:
> >>
> >> $ git grep fw_name hw/usb/
> >> hw/usb/bus.c:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 qdev_fw_nam=
e(qdev), nr);
> >> hw/usb/dev-hub.c:=C2=A0=C2=A0=C2=A0 dc->fw_name =3D "hub";
> >> hw/usb/dev-mtp.c:=C2=A0=C2=A0=C2=A0 dc->fw_name =3D "mtp";
> >> hw/usb/dev-network.c:=C2=A0=C2=A0=C2=A0 dc->fw_name =3D "network";
> >> hw/usb/dev-storage.c:=C2=A0=C2=A0=C2=A0 dc->fw_name =3D "storage";
> >> hw/usb/dev-uas.c:=C2=A0=C2=A0=C2=A0 dc->fw_name =3D "storage";
> >>
> >> The plain "usb" naming comes from PCI, which has its own naming
> >> logic for PCI devices (which qemu-xhci happens to be) :
> >=20
> >=20
> > Right, this was the confusing bit for me. I thought that by just settin=
g=20
> > dc->fw_name to what we put in the DT should be enough but it is not.
> >=20
> >=20
> >>
> >> #0=C2=A0 0x0000000100319474 in pci_dev_fw_name (len=3D33, buf=3D0x7fff=
ffffd4c8=20
> >> "\020", dev=3D0x7fffc3320010) at ../../hw/pci/pci.c:2533
> >> #1=C2=A0 0x0000000100319474 in pcibus_get_fw_dev_path (dev=3D0x7fffc33=
20010)=20
> >> at ../../hw/pci/pci.c:2550
> >> #2=C2=A0 0x000000010053118c in bus_get_fw_dev_path (dev=3D0x7fffc33200=
10,=20
> >> bus=3D<optimized out>) at ../../hw/core/qdev-fw.c:38
> >> #3=C2=A0 0x000000010053118c in qdev_get_fw_dev_path_helper=20
> >> (dev=3D0x7fffc3320010, p=3D0x7fffffffd728 "/pci@800000020000000/",=20
> >> size=3D128) at ../../hw/core/qdev-fw.c:72
> >> #4=C2=A0 0x0000000100531064 in qdev_get_fw_dev_path_helper=20
> >> (dev=3D0x101c864a0, p=3D0x7fffffffd728 "/pci@800000020000000/", size=
=3D128)=20
> >> at ../../hw/core/qdev-fw.c:69
> >> #5=C2=A0 0x0000000100531064 in qdev_get_fw_dev_path_helper=20
> >> (dev=3D0x1019f3560, p=3D0x7fffffffd728 "/pci@800000020000000/", size=
=3D128)=20
> >> at ../../hw/core/qdev-fw.c:69
> >> #6=C2=A0 0x00000001005312f0 in qdev_get_fw_dev_path (dev=3D<optimized =
out>)=20
> >> at ../../hw/core/qdev-fw.c:91
> >> #7=C2=A0 0x0000000100588a68 in get_boot_device_path (dev=3D<optimized =
out>,=20
> >> ignore_suffixes=3D<optimized out>, ignore_suffixes@entry=3Dtrue,=20
> >> suffix=3D<optimized out>) at ../../softmmu/bootdevice.c:211
> >> #8=C2=A0 0x0000000100589540 in get_boot_devices_list (size=3D0x7ffffff=
fd990)=20
> >> at ../../softmmu/bootdevice.c:257
> >> #9=C2=A0 0x0000000100606764 in spapr_dt_chosen (reset=3Dtrue,=20
> >> fdt=3D0x7fffc26f0010, spapr=3D0x10149aef0) at ../../hw/ppc/spapr.c:1019
> >>
> >>
> >>> While your patch works, I wonder if we should assign fw_name to all p=
ci
> >>> nodes to avoid similar problems in the future? Thanks,
> >>>
> >>
> >> Not sure to understand "assign fw_name to all pci nodes" ...
> >=20
> >=20
> > Basically this:
> >=20
> > =3D=3D=3D=3D=3D
> > diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> > index de0fae10ab9c..8a286419aaf8 100644
> > --- a/hw/pci/pci.c
> > +++ b/hw/pci/pci.c
> > @@ -2508,7 +2508,12 @@ static char *pci_dev_fw_name(DeviceState *dev,=20
> > char *buf, int len)
> >  =C2=A0=C2=A0=C2=A0=C2=A0 const char *name =3D NULL;
> >  =C2=A0=C2=A0=C2=A0=C2=A0 const pci_class_desc *desc =3D=C2=A0 pci_clas=
s_descriptions;
> >  =C2=A0=C2=A0=C2=A0=C2=A0 int class =3D pci_get_word(d->config + PCI_CL=
ASS_DEVICE);
> > +=C2=A0=C2=A0=C2=A0 DeviceClass *dc =3D DEVICE_GET_CLASS(dev);
> >=20
> > +=C2=A0=C2=A0=C2=A0 if (dc->fw_name) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pstrcpy(buf, len, dc->fw_na=
me);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return buf;
> > +=C2=A0=C2=A0=C2=A0 }
> >  =C2=A0=C2=A0=C2=A0=C2=A0 while (desc->desc &&
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (class & =
~desc->fw_ign_bits) !=3D
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (desc->cl=
ass & ~desc->fw_ign_bits)) {
> > diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
> > index 0a418f1e6711..057dd384ada7 100644
> > --- a/hw/ppc/spapr_pci.c
> > +++ b/hw/ppc/spapr_pci.c
> > @@ -1467,8 +1467,14 @@ int spapr_pci_dt_populate(SpaprDrc *drc,=20
> > SpaprMachineState *spapr,
> >  =C2=A0=C2=A0=C2=A0=C2=A0 HotplugHandler *plug_handler =3D qdev_get_hot=
plug_handler(drc->dev);
> >  =C2=A0=C2=A0=C2=A0=C2=A0 SpaprPhbState *sphb =3D SPAPR_PCI_HOST_BRIDGE=
(plug_handler);
> >  =C2=A0=C2=A0=C2=A0=C2=A0 PCIDevice *pdev =3D PCI_DEVICE(drc->dev);
> > +=C2=A0=C2=A0=C2=A0 DeviceState *dev =3D DEVICE(pdev);
> > +=C2=A0=C2=A0=C2=A0 uint32_t ccode =3D pci_default_read_config(pdev, PC=
I_CLASS_PROG, 3);
> > +=C2=A0=C2=A0=C2=A0 DeviceClass *dc =3D DEVICE_GET_CLASS(dev);
> >=20
> >  =C2=A0=C2=A0=C2=A0=C2=A0 *fdt_start_offset =3D spapr_dt_pci_device(sph=
b, pdev, fdt, 0);
> > +
> > +=C2=A0=C2=A0=C2=A0 dc->fw_name =3D g_strdup(dt_name_from_class((ccode =
>> 16) & 0xff,=20
> > (ccode >> 8) & 0xff,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ccode & 0xff));
> >  =C2=A0=C2=A0=C2=A0=C2=A0 return 0;
> >  =C2=A0}
> > =3D=3D=3D=3D=3D
> >=20
> > Note this is just to demonstrate the idea (this works though) :)
> > (changing the device class is way too late, would need to dig QOM a bit=
,=20
> > also need to do the same for hotplugged devices).
> >=20
> > But the point is that pci_dev_fw_name() (has "_fw_name"!) should not=20
> > ignore dc->fw_name. Thanks,
>=20
> Ping? Too stupid proposal? :)
>=20

Post a patch ? :)

>=20
>=20


