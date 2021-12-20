Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1521C47B2A9
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 19:12:11 +0100 (CET)
Received: from localhost ([::1]:51874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzN8r-0004NH-LH
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 13:12:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mzLRn-0000Ll-3g
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 11:23:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mzLRj-00008T-Mb
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 11:23:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640017407;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TnLoD78PQSv0tEYlYPyRspd8bUoK9dAyezA4ExMHtyA=;
 b=XMyBL4PrjD16Tc6+XLktMNqjsL4ZES5dusBzPx015WwmEthMQpc4//mhc7MPXophXlSFCZ
 Y483HIIeX/JXHqv/kac3lkxhKAeqHh8mr8hz1ezIXHZGvbs0wxoxYwCpf/FjKvRK10yz9S
 MIwv3Q4Nm29s6/v+NAjc92nJmbopD34=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-151-AyfbUppeMTSnoP93Jd8Icg-1; Mon, 20 Dec 2021 11:23:19 -0500
X-MC-Unique: AyfbUppeMTSnoP93Jd8Icg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EF60D1927802;
 Mon, 20 Dec 2021 16:23:17 +0000 (UTC)
Received: from localhost (unknown [10.39.192.166])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7EBBE519AE;
 Mon, 20 Dec 2021 16:23:17 +0000 (UTC)
Date: Mon, 20 Dec 2021 14:36:52 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jag Raman <jag.raman@oracle.com>
Subject: Re: [PATCH v4 11/14] vfio-user: IOMMU support for remote device
Message-ID: <YcCVBLdd/WtLR49h@stefanha-x1.localdomain>
References: <cover.1639549843.git.jag.raman@oracle.com>
 <acae079dec4261d762311b86a0e699ba9ad79737.1639549843.git.jag.raman@oracle.com>
 <YbtP2eaBnptogQDf@stefanha-x1.localdomain>
 <A2ABC44E-0EDA-4FDB-B3A4-64CE1AA84560@oracle.com>
MIME-Version: 1.0
In-Reply-To: <A2ABC44E-0EDA-4FDB-B3A4-64CE1AA84560@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="qTAkprjb0FgcixNN"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.209,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John Johnson <john.g.johnson@oracle.com>,
 "thuth@redhat.com" <thuth@redhat.com>, "bleal@redhat.com" <bleal@redhat.com>,
 "swapnil.ingle@nutanix.com" <swapnil.ingle@nutanix.com>,
 "john.levon@nutanix.com" <john.levon@nutanix.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 "wainersm@redhat.com" <wainersm@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@gmail.com>,
 "crosa@redhat.com" <crosa@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "alex.bennee@linaro.org" <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--qTAkprjb0FgcixNN
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 17, 2021 at 08:00:35PM +0000, Jag Raman wrote:
> > On Dec 16, 2021, at 9:40 AM, Stefan Hajnoczi <stefanha@redhat.com> wrot=
e:
> >=20
> > On Wed, Dec 15, 2021 at 10:35:35AM -0500, Jagannathan Raman wrote:
> >> Assign separate address space for each device in the remote processes.
> >=20
> > If I understand correctly this isn't really an IOMMU. It's abusing the
> > IOMMU APIs to create isolated address spaces for each device. This way
> > memory regions added by the vfio-user client do not conflict when there
> > are multiple vfio-user servers.
>=20
> Like you already figured out, having isolated DMA address space alone is =
not
> sufficient for this application, we also needed to isolate the sysmem/RAM=
 address
> space. As such, the available IOMMU APIs alone were not sufficient, so we=
 had
> to improvise.
>=20
> >=20
> > Calling pci_root_bus_new() and keeping one PCI bus per VfuObject might
> > be a cleaner approach:
> > - Lets you isolate both PCI Memory Space and IO Space.
> > - Isolates the PCIDevices and their addresses on the bus.
> > - Isolates irqs.
> > - No more need to abuse the IOMMU API.
>=20
> I believe we would still need to have an IOMMU. It=E2=80=99s because, dev=
ices use the
> pci_dma_read()/_write() functions. These functions look up the address in=
 DMA
> address space (via pci_get_address_space() -> PCIDevice->bus_master_as ->
> PCIDevice->bus_master_enable_region -> PCIDevice->bus_master_container_re=
gion).
>  bus_master_enable_region and bus_master_container_region are effectively=
 aliases
> to the DMA address space - without an IOMMU, the dma_as would be the shar=
ed
> global sysmem/RAM space (address_space_mem, please see pci_init_bus_maste=
r())

Good point, that code assumes there is a global address space. Creating
a fake IOMMU works around that assumption but it seems cleaner to
eliminate it:

  AddressSpace *pci_device_iommu_address_space(PCIDevice *dev)
  {
      ...
      if (!pci_bus_bypass_iommu(bus) && iommu_bus && iommu_bus->iommu_fn) {
          return iommu_bus->iommu_fn(bus, iommu_bus->iommu_opaque, devfn);
      }
      return &address_space_memory;
              ^^^^^^^^^^^^^^^^^^^^

When creating a PCI root bus an AddressSpace argument could be provided,
just like it already does for the address_space_memory and
address_space_io MemoryRegions. Then the hardcoded return can be
changed to something like:

  return bus->dma_address_space;

> >> @@ -332,6 +336,12 @@ static void vfu_object_register_bars(vfu_ctx_t *v=
fu_ctx, PCIDevice *pdev)
> >>                          vfu_object_bar_handlers[i],
> >>                          VFU_REGION_FLAG_RW, NULL, 0, -1, 0);
> >>=20
> >> +        if ((o->pci_dev->io_regions[i].type & PCI_BASE_ADDRESS_SPACE)=
 =3D=3D 0) {
> >> +            memory_region_unref(o->pci_dev->io_regions[i].address_spa=
ce);
> >> +            o->pci_dev->io_regions[i].address_space =3D
> >> +                remote_iommu_get_ram(o->pci_dev);
> >> +        }
> >=20
> > This looks hacky. If you create a separate PCIHost for each device
> > instead then the BARs will be created in the MemoryRegion (confusingly
> > named "address_space" in the PCI code) of your choosing.
>=20
> I was also not very comfortable with this - added it very grudgingly out =
of
> necessity. Thank god this can go away with separate bus for each device.

I talked to Kevin Wolf about having separate busses. qdev currently
requires each DeviceState to have a parent bus and each bus must have a
parent DeviceState. There is only one exception: a special check that
allows the global system bus (sysbus_get_default()) to be created
without a parent DeviceState.

This restriction probably needs to be loosened in order to support an
isolated PCIHost for each vfio-user server. The challenge is that
qdev_find_recursive() and monitor commands like device_add currently
only search the global system bus. Maybe new syntax is needed for the
multiple root bus case or the behavior of existing monitor commands
needs to be understood and extended without breaking anything.

> >=20
> > Also, why is PCI Memory Space isolated via VFUIOMMU but PCI IO Space is
> > not?
>=20
> If I understand correctly, the IO address space translates sysmem address=
 to
> direct device access (such as I2C). Once we are inside a device, we alrea=
dy
> have access to all parts of the device (unlike RAM which sits outside the=
 device).
> So didn=E2=80=99t think device would go via IOMMU to access IO. Also didn=
=E2=80=99t see any
> other IOMMU translating IO address space accesses.

I reviewed how BARs are configured with VFIO:

1. When the guest writes to the vfio-pci PCIDevice's Configuration Space
   the write is forwarded to the VFIO device (i.e. vfio-user or VFIO
   kernel ioctl).

2. The vfio-user server receives the Configuration Space write and
   forwards it to pci_dev (the PCIDevice we're serving up). BAR mappings
   are updated in the vfio-user server so the BAR MemoryRegions are
   mapped/unmapped at the locations given by the guest.

This applies for both Memory and IO Space accesses.

Because this patch series does not isolate IO Space between VfuObject
instances the MemoryRegions will collide when two guests map IO Space
BARs of different devices at the same IO Space address. In other words,
vfu_object_bar_rw() uses the global address_space_io and that means
collisions can occur.

Stefan

--qTAkprjb0FgcixNN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmHAlQQACgkQnKSrs4Gr
c8jTBQgAix5CY0y5pBsCFH5gHsVBsxnMVjAST0y2ej/qWzDi4uZpBPlu5fqFmYEu
9zOb4BKR3pL2NPlXOULFAyRtnlzjy8k3eqNCoECqMGt77FwekAuhqC4h6Lbh8K4x
SUWVdx90LES5I9N4Zc0C22RhgrRfJS6KBydF6LuGF0e7nyCDNEkzGYSalvrverv4
YWmWhUcVz5FPqnTupkAQuW1z1i0v31O7DBfrEhhtYGFDvucgmGOB70qeVfsOb2X8
bkW+PawACp6dZBk/puscNRi61edG/EHOtZfdltGmPjJL19PSYDdtJ1z8VKlmPHs6
8X3oeN809v5qUcDMWfnIHFPvqFbxzw==
=ZoDW
-----END PGP SIGNATURE-----

--qTAkprjb0FgcixNN--


