Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED054A594B
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 10:34:24 +0100 (CET)
Received: from localhost ([::1]:41164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEpYN-000816-KN
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 04:34:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nEpVx-0005tt-A7
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 04:31:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nEpVi-00058b-Eh
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 04:31:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643707897;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+HHpR1S5DiDOq4SrDAgsX1oMs8j/x/orfJZNs58h6Cw=;
 b=JfktdVM/YCcCMl/9RVd6QIudgalqpeUxzFhYWdBcux/1AWknUC/pbiDhSSH5f9uLoNCTSm
 A2SMf9GfWDlttMxuDhmmQI5neZr5vX8OWVs0EJIuwhfWmoyp1cVB4MY5D+uRAfAy9S7+rs
 yHBR3/Q1i+iOo3H2wxCvBsEzBeneFdQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-639-11Qwa1vfNgWu_bYabssp1A-1; Tue, 01 Feb 2022 04:31:34 -0500
X-MC-Unique: 11Qwa1vfNgWu_bYabssp1A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BB071343CB;
 Tue,  1 Feb 2022 09:31:32 +0000 (UTC)
Received: from localhost (unknown [10.39.192.234])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E68846E4CF;
 Tue,  1 Feb 2022 09:30:36 +0000 (UTC)
Date: Tue, 1 Feb 2022 09:30:35 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH v5 03/18] pci: isolated address space for PCI bus
Message-ID: <Yfj9u26F6/RdlhoB@stefanha-x1.localdomain>
References: <1CACFB08-1BBC-4ECC-9C0B-6F377018D795@oracle.com>
 <YfBDqMuO/l/gWzL8@work-vm>
 <AE47B5D2-6515-4BD3-B541-23E5274174AC@oracle.com>
 <YfEYHBhrsdF9Edpp@stefanha-x1.localdomain>
 <YfGqCJeTD9bmkZx6@work-vm>
 <20220126161120-mutt-send-email-mst@kernel.org>
 <YfJYFbBVQzho7mGp@stefanha-x1.localdomain>
 <20220127142253.21ab0025.alex.williamson@redhat.com>
 <YfO00O4sT2UgaW31@stefanha-x1.localdomain>
 <20220131091623.6739464e.alex.williamson@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="O4+wUxqBFPAnXRjz"
Content-Disposition: inline
In-Reply-To: <20220131091623.6739464e.alex.williamson@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.081,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: "eduardo@habkost.net" <eduardo@habkost.net>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>, Jag Raman <jag.raman@oracle.com>,
 Beraldo Leal <bleal@redhat.com>, John Johnson <john.g.johnson@oracle.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 "armbru@redhat.com" <armbru@redhat.com>,
 "quintela@redhat.com" <quintela@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Eric Blake <eblake@redhat.com>,
 "john.levon@nutanix.com" <john.levon@nutanix.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--O4+wUxqBFPAnXRjz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 31, 2022 at 09:16:23AM -0700, Alex Williamson wrote:
> On Fri, 28 Jan 2022 09:18:08 +0000
> Stefan Hajnoczi <stefanha@redhat.com> wrote:
>=20
> > On Thu, Jan 27, 2022 at 02:22:53PM -0700, Alex Williamson wrote:
> > > If the goal here is to restrict DMA between devices, ie. peer-to-peer
> > > (p2p), why are we trying to re-invent what an IOMMU already does? =20
> >=20
> > The issue Dave raised is that vfio-user servers run in separate
> > processses from QEMU with shared memory access to RAM but no direct
> > access to non-RAM MemoryRegions. The virtiofs DAX Window BAR is one
> > example of a non-RAM MemoryRegion that can be the source/target of DMA
> > requests.
> >=20
> > I don't think IOMMUs solve this problem but luckily the vfio-user
> > protocol already has messages that vfio-user servers can use as a
> > fallback when DMA cannot be completed through the shared memory RAM
> > accesses.
> >=20
> > > In
> > > fact, it seems like an IOMMU does this better in providing an IOVA
> > > address space per BDF.  Is the dynamic mapping overhead too much?  Wh=
at
> > > physical hardware properties or specifications could we leverage to
> > > restrict p2p mappings to a device?  Should it be governed by machine
> > > type to provide consistency between devices?  Should each "isolated"
> > > bus be in a separate root complex?  Thanks, =20
> >=20
> > There is a separate issue in this patch series regarding isolating the
> > address space where BAR accesses are made (i.e. the global
> > address_space_memory/io). When one process hosts multiple vfio-user
> > server instances (e.g. a software-defined network switch with multiple
> > ethernet devices) then each instance needs isolated memory and io addre=
ss
> > spaces so that vfio-user clients don't cause collisions when they map
> > BARs to the same address.
> >=20
> > I think the the separate root complex idea is a good solution. This
> > patch series takes a different approach by adding the concept of
> > isolated address spaces into hw/pci/.
>=20
> This all still seems pretty sketchy, BARs cannot overlap within the
> same vCPU address space, perhaps with the exception of when they're
> being sized, but DMA should be disabled during sizing.
>=20
> Devices within the same VM context with identical BARs would need to
> operate in different address spaces.  For example a translation offset
> in the vCPU address space would allow unique addressing to the devices,
> perhaps using the translation offset bits to address a root complex and
> masking those bits for downstream transactions.
>=20
> In general, the device simply operates in an address space, ie. an
> IOVA.  When a mapping is made within that address space, we perform a
> translation as necessary to generate a guest physical address.  The
> IOVA itself is only meaningful within the context of the address space,
> there is no requirement or expectation for it to be globally unique.
>=20
> If the vfio-user server is making some sort of requirement that IOVAs
> are unique across all devices, that seems very, very wrong.  Thanks,

Yes, BARs and IOVAs don't need to be unique across all devices.

The issue is that there can be as many guest physical address spaces as
there are vfio-user clients connected, so per-client isolated address
spaces are required. This patch series has a solution to that problem
with the new pci_isol_as_mem/io() API.

What I find strange about this approach is that exported PCI devices are
on PCI root ports that are connected to the machine's main PCI bus. The
PCI devices don't interact with the main bus's IOVA space, guest
physical memory space, or interrupts. It seems hacky to graft isolated
devices onto a parent bus that provides nothing to its children. I
wonder if it would be cleaner for every vfio-user server to have its own
PCIHost. Then it may be possible to drop the new pci_isol_as_mem/io()
API.

Stefan

--O4+wUxqBFPAnXRjz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmH4/bsACgkQnKSrs4Gr
c8jTXAf/eM0DS4TmuY55o9+RGpnhs3qVajaPqAwVn4FP63KmiePg/iwz7j4aMasu
6qqszxduFifc5EQmnMXxEJCNcnhZ+yk4R+UjvRKBchFgV1J5w521YDti29pLs6Lx
/WhFK7gdA8VE3fYloWnL58kMR6eNL3qi1CQpxpmhHPO6ktF1Krv2C9Cy4LqQJE7d
/IKqvhQtM72t1Dlv2Lwkbjww2CjuUWt6zxn+DugxvYZTK207i9qXUKVcepAReIjd
IOdiYS4i1mJqjrjZOWGOiyEcMjK+aGzBa96f4iGdCTOnOeKdZ6OwxMCB9mnYAkRT
yD+8VJH72BJJPCOmMSXghULuTqDEcA==
=6dB3
-----END PGP SIGNATURE-----

--O4+wUxqBFPAnXRjz--


