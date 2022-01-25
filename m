Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFCD949B0C8
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 10:59:39 +0100 (CET)
Received: from localhost ([::1]:45154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCIby-0007WO-KT
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 04:59:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nCIYr-0005GG-4N
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 04:56:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nCIYn-0000CE-Kd
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 04:56:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643104580;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=icYlzDtSsieIu/bZxJuaaRKIKQ4gVMoSz9eEQI7KWp0=;
 b=e6hMkscICQBAHT1sgZCjMUC0TatRNsz+Z+LpMUMDCZ7S9EQuBJYm+ZKLXE9lqEV8QDgHk6
 rbiDhTcG+RIXk4lcmkUOgzFpNnYNhQTYS4U6U8TDkgm3OkUkpvdpYvHOiXnt0iPoeYlROH
 ECp4XASFU+iBY6E+/pb7f1p5eKb6YmU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-450-FjNjpPSKNKWCNsz09SgtOg-1; Tue, 25 Jan 2022 04:56:16 -0500
X-MC-Unique: FjNjpPSKNKWCNsz09SgtOg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CABCA760C0;
 Tue, 25 Jan 2022 09:56:14 +0000 (UTC)
Received: from localhost (unknown [10.39.195.26])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4579A1F305;
 Tue, 25 Jan 2022 09:56:14 +0000 (UTC)
Date: Tue, 25 Jan 2022 09:56:12 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jagannathan Raman <jag.raman@oracle.com>
Subject: Re: [PATCH v5 03/18] pci: isolated address space for PCI bus
Message-ID: <Ye/JPI6yJ0zOce5e@stefanha-x1.localdomain>
References: <cover.1642626515.git.jag.raman@oracle.com>
 <2971c1bec04acaac4eb3c1f2b104cbeabad01e22.1642626515.git.jag.raman@oracle.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="qcKwzF4ZDy97TEMH"
Content-Disposition: inline
In-Reply-To: <2971c1bec04acaac4eb3c1f2b104cbeabad01e22.1642626515.git.jag.raman@oracle.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.158,
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
Cc: eduardo@habkost.net, elena.ufimtseva@oracle.com, john.g.johnson@oracle.com,
 berrange@redhat.com, bleal@redhat.com, john.levon@nutanix.com, mst@redhat.com,
 armbru@redhat.com, quintela@redhat.com, qemu-devel@nongnu.org, f4bug@amsat.org,
 marcandre.lureau@gmail.com, thanos.makatos@nutanix.com, pbonzini@redhat.com,
 eblake@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--qcKwzF4ZDy97TEMH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 19, 2022 at 04:41:52PM -0500, Jagannathan Raman wrote:
> Allow PCI buses to be part of isolated CPU address spaces. This has a
> niche usage.
>=20
> TYPE_REMOTE_MACHINE allows multiple VMs to house their PCI devices in
> the same machine/server. This would cause address space collision as
> well as be a security vulnerability. Having separate address spaces for
> each PCI bus would solve this problem.
>=20
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> ---
>  include/hw/pci/pci.h     |  2 ++
>  include/hw/pci/pci_bus.h | 17 +++++++++++++++++
>  hw/pci/pci.c             | 17 +++++++++++++++++
>  hw/pci/pci_bridge.c      |  5 +++++
>  4 files changed, 41 insertions(+)
>=20
> diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> index 023abc0f79..9bb4472abc 100644
> --- a/include/hw/pci/pci.h
> +++ b/include/hw/pci/pci.h
> @@ -387,6 +387,8 @@ void pci_device_save(PCIDevice *s, QEMUFile *f);
>  int pci_device_load(PCIDevice *s, QEMUFile *f);
>  MemoryRegion *pci_address_space(PCIDevice *dev);
>  MemoryRegion *pci_address_space_io(PCIDevice *dev);
> +AddressSpace *pci_isol_as_mem(PCIDevice *dev);
> +AddressSpace *pci_isol_as_io(PCIDevice *dev);
> =20
>  /*
>   * Should not normally be used by devices. For use by sPAPR target
> diff --git a/include/hw/pci/pci_bus.h b/include/hw/pci/pci_bus.h
> index 347440d42c..d78258e79e 100644
> --- a/include/hw/pci/pci_bus.h
> +++ b/include/hw/pci/pci_bus.h
> @@ -39,9 +39,26 @@ struct PCIBus {
>      void *irq_opaque;
>      PCIDevice *devices[PCI_SLOT_MAX * PCI_FUNC_MAX];
>      PCIDevice *parent_dev;
> +
>      MemoryRegion *address_space_mem;
>      MemoryRegion *address_space_io;

This seems like a good point to rename address_space_mem,
address_space_io, as well as PCIIORegion->address_space since they are
all MemoryRegions and not AddressSpaces. Names could be
mem_space_mr/io_space_mr and PCIIORegion->container_mr. This avoids
confusion with the actual AddressSpaces that are introduced in this
patch.

> =20
> +    /**
> +     * Isolated address spaces - these allow the PCI bus to be part
> +     * of an isolated address space as opposed to the global
> +     * address_space_memory & address_space_io. This allows the
> +     * bus to be attached to CPUs from different machines. The
> +     * following is not used used commonly.
> +     *
> +     * TYPE_REMOTE_MACHINE allows emulating devices from multiple
> +     * VM clients, as such it needs the PCI buses in the same machine
> +     * to be part of different CPU address spaces. The following is
> +     * useful in that scenario.
> +     *
> +     */
> +    AddressSpace *isol_as_mem;
> +    AddressSpace *isol_as_io;

Or use the pointers unconditionally and initialize them to the global
address_space_memory/address_space_io? That might simplify the code so
isolated address spaces is no longer a special case.

isol_as_io isn't used by this patch?

> +
>      QLIST_HEAD(, PCIBus) child; /* this will be replaced by qdev later */
>      QLIST_ENTRY(PCIBus) sibling;/* this will be replaced by qdev later */
> =20
> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> index 5d30f9ca60..d5f1c6c421 100644
> --- a/hw/pci/pci.c
> +++ b/hw/pci/pci.c
> @@ -442,6 +442,8 @@ static void pci_root_bus_internal_init(PCIBus *bus, D=
eviceState *parent,
>      bus->slot_reserved_mask =3D 0x0;
>      bus->address_space_mem =3D address_space_mem;
>      bus->address_space_io =3D address_space_io;
> +    bus->isol_as_mem =3D NULL;
> +    bus->isol_as_io =3D NULL;
>      bus->flags |=3D PCI_BUS_IS_ROOT;
> =20
>      /* host bridge */
> @@ -2676,6 +2678,16 @@ MemoryRegion *pci_address_space_io(PCIDevice *dev)
>      return pci_get_bus(dev)->address_space_io;
>  }
> =20
> +AddressSpace *pci_isol_as_mem(PCIDevice *dev)
> +{
> +    return pci_get_bus(dev)->isol_as_mem;
> +}
> +
> +AddressSpace *pci_isol_as_io(PCIDevice *dev)
> +{
> +    return pci_get_bus(dev)->isol_as_io;
> +}
> +
>  static void pci_device_class_init(ObjectClass *klass, void *data)
>  {
>      DeviceClass *k =3D DEVICE_CLASS(klass);
> @@ -2699,6 +2711,7 @@ static void pci_device_class_base_init(ObjectClass =
*klass, void *data)
> =20
>  AddressSpace *pci_device_iommu_address_space(PCIDevice *dev)
>  {
> +    AddressSpace *iommu_as =3D NULL;
>      PCIBus *bus =3D pci_get_bus(dev);
>      PCIBus *iommu_bus =3D bus;
>      uint8_t devfn =3D dev->devfn;
> @@ -2745,6 +2758,10 @@ AddressSpace *pci_device_iommu_address_space(PCIDe=
vice *dev)
>      if (!pci_bus_bypass_iommu(bus) && iommu_bus && iommu_bus->iommu_fn) {
>          return iommu_bus->iommu_fn(bus, iommu_bus->iommu_opaque, devfn);
>      }
> +    iommu_as =3D pci_isol_as_mem(dev);
> +    if (iommu_as) {
> +        return iommu_as;
> +    }
>      return &address_space_memory;
>  }
> =20

> diff --git a/hw/pci/pci_bridge.c b/hw/pci/pci_bridge.c
> index da34c8ebcd..98366768d2 100644
> --- a/hw/pci/pci_bridge.c
> +++ b/hw/pci/pci_bridge.c
> @@ -383,6 +383,11 @@ void pci_bridge_initfn(PCIDevice *dev, const char *t=
ypename)
>      sec_bus->address_space_io =3D &br->address_space_io;
>      memory_region_init(&br->address_space_io, OBJECT(br), "pci_bridge_io=
",
>                         4 * GiB);
> +
> +    /* This PCI bridge puts the sec_bus in its parent's address space */
> +    sec_bus->isol_as_mem =3D pci_isol_as_mem(dev);
> +    sec_bus->isol_as_io =3D pci_isol_as_io(dev);
> +
>      br->windows =3D pci_bridge_region_init(br);
>      QLIST_INIT(&sec_bus->child);
>      QLIST_INSERT_HEAD(&parent->child, sec_bus, sibling);
> --=20
> 2.20.1
>=20

--qcKwzF4ZDy97TEMH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmHvyTwACgkQnKSrs4Gr
c8iuswgAtK7feIvOBRLFiw/eSGbgAkIMBqNI2s7Ev5IFG2f+wfzQw1dmTR5v42np
IKP18MwUoezd9BTPkhF/NTR+TywPYFnd9uGfcfvedQTr6EF8G+1p+OtiIKCDoNnV
iEodjHsBRB/7wsN4olUYCzVCvZuwNcEdOdIs/nMdT0qR9u/psLJmS8H7nX+WhIuk
C+lgC3/Gdt1PH30BIFUpBL3+KTEhXmoGiSH/fMVMETD7dkXGyIR0V5zEyKNs52Es
7jtUL1FeD1lChknZ9g3KeZsNsishLmLLNWkw2WQC7u5Pi+zwjSGxPHNmFsX5n6xr
FRElCxU1V3C24C054iTB/Ls09mQRog==
=V/W9
-----END PGP SIGNATURE-----

--qcKwzF4ZDy97TEMH--


