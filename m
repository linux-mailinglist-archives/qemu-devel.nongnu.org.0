Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 002E64EAF31
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 16:27:12 +0200 (CEST)
Received: from localhost ([::1]:49764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZCoR-0005yx-KL
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 10:27:11 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nZCmH-00054l-C0
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 10:24:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21438)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nZCmE-0005Dm-5X
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 10:24:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648563885;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+7TInoH8wySqDFDl3hHEjVWVERmnb8hEAmZ1x8/WwY4=;
 b=Wh0krC2KQlaFvvQbupS1eaBXx9RozCvqWwzsH/Fll5Wxfvi8oG1OujfUGtI9ji4EMtMjNN
 DOxfXCjJCTUWN8nkALVHhveB7Pr/HHzzEFV2KuXAikkBddTOC7Z2hByQwVbgKxw4X77EWJ
 35EQ86lUDRFiSjUHTMtHevum0rmFTA0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-345-Fp-gL0bBOgODn9TYk69AeA-1; Tue, 29 Mar 2022 10:24:42 -0400
X-MC-Unique: Fp-gL0bBOgODn9TYk69AeA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3D4673834860;
 Tue, 29 Mar 2022 14:24:41 +0000 (UTC)
Received: from localhost (unknown [10.39.195.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C924B140241B;
 Tue, 29 Mar 2022 14:24:40 +0000 (UTC)
Date: Tue, 29 Mar 2022 15:24:39 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jag Raman <jag.raman@oracle.com>,
 Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH v6 15/19] vfio-user: handle device interrupts
Message-ID: <YkMWp0lUJAHhivJA@stefanha-x1.localdomain>
References: <cover.1645079934.git.jag.raman@oracle.com>
 <ba5a32f3def72ce66a894191747dcafd63e7a517.1645079934.git.jag.raman@oracle.com>
 <YiXdUbz3r1xORJKD@stefanha-x1.localdomain>
 <67EFF59D-E1DB-4830-B5C2-B58CCA9A35E6@oracle.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="0JhQMcskEthAx9A4"
Content-Disposition: inline
In-Reply-To: <67EFF59D-E1DB-4830-B5C2-B58CCA9A35E6@oracle.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John Johnson <john.g.johnson@oracle.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 "john.levon@nutanix.com" <john.levon@nutanix.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 qemu-devel <qemu-devel@nongnu.org>, Kanth Ghatraju <kanth.ghatraju@oracle.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--0JhQMcskEthAx9A4
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 26, 2022 at 11:47:36PM +0000, Jag Raman wrote:
>=20
>=20
> > On Mar 7, 2022, at 5:24 AM, Stefan Hajnoczi <stefanha@redhat.com> wrote:
> >=20
> > On Thu, Feb 17, 2022 at 02:49:02AM -0500, Jagannathan Raman wrote:
> >> Forward remote device's interrupts to the guest
> >>=20
> >> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> >> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> >> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> >> ---
> >> include/hw/pci/pci.h              |   6 ++
> >> include/hw/remote/vfio-user-obj.h |   6 ++
> >> hw/pci/msi.c                      |  13 +++-
> >> hw/pci/msix.c                     |  12 +++-
> >> hw/remote/machine.c               |  11 +--
> >> hw/remote/vfio-user-obj.c         | 107 ++++++++++++++++++++++++++++++
> >> stubs/vfio-user-obj.c             |   6 ++
> >> MAINTAINERS                       |   1 +
> >> hw/remote/trace-events            |   1 +
> >> stubs/meson.build                 |   1 +
> >> 10 files changed, 158 insertions(+), 6 deletions(-)
> >> create mode 100644 include/hw/remote/vfio-user-obj.h
> >> create mode 100644 stubs/vfio-user-obj.c
> >>=20
> >> diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> >> index c3f3c90473..d42d526a48 100644
> >> --- a/include/hw/pci/pci.h
> >> +++ b/include/hw/pci/pci.h
> >> @@ -129,6 +129,8 @@ typedef uint32_t PCIConfigReadFunc(PCIDevice *pci_=
dev,
> >> typedef void PCIMapIORegionFunc(PCIDevice *pci_dev, int region_num,
> >>                                 pcibus_t addr, pcibus_t size, int type=
);
> >> typedef void PCIUnregisterFunc(PCIDevice *pci_dev);
> >> +typedef void PCIMSINotify(PCIDevice *pci_dev, unsigned vector);
> >> +typedef void PCIMSIxNotify(PCIDevice *pci_dev, unsigned vector);
> >>=20
> >> typedef struct PCIIORegion {
> >>     pcibus_t addr; /* current PCI mapping address. -1 means not mapped=
 */
> >> @@ -323,6 +325,10 @@ struct PCIDevice {
> >>     /* Space to store MSIX table & pending bit array */
> >>     uint8_t *msix_table;
> >>     uint8_t *msix_pba;
> >> +
> >> +    PCIMSINotify *msi_notify;
> >> +    PCIMSIxNotify *msix_notify;
> >> +
> >>     /* MemoryRegion container for msix exclusive BAR setup */
> >>     MemoryRegion msix_exclusive_bar;
> >>     /* Memory Regions for MSIX table and pending bit entries. */
> >> diff --git a/include/hw/remote/vfio-user-obj.h b/include/hw/remote/vfi=
o-user-obj.h
> >> new file mode 100644
> >> index 0000000000..87ab78b875
> >> --- /dev/null
> >> +++ b/include/hw/remote/vfio-user-obj.h
> >> @@ -0,0 +1,6 @@
> >> +#ifndef VFIO_USER_OBJ_H
> >> +#define VFIO_USER_OBJ_H
> >> +
> >> +void vfu_object_set_bus_irq(PCIBus *pci_bus);
> >> +
> >> +#endif
> >> diff --git a/hw/pci/msi.c b/hw/pci/msi.c
> >> index 47d2b0f33c..93f5e400cc 100644
> >> --- a/hw/pci/msi.c
> >> +++ b/hw/pci/msi.c
> >> @@ -51,6 +51,8 @@
> >>  */
> >> bool msi_nonbroken;
> >>=20
> >> +static void pci_msi_notify(PCIDevice *dev, unsigned int vector);
> >> +
> >> /* If we get rid of cap allocator, we won't need this. */
> >> static inline uint8_t msi_cap_sizeof(uint16_t flags)
> >> {
> >> @@ -225,6 +227,8 @@ int msi_init(struct PCIDevice *dev, uint8_t offset,
> >>     dev->msi_cap =3D config_offset;
> >>     dev->cap_present |=3D QEMU_PCI_CAP_MSI;
> >>=20
> >> +    dev->msi_notify =3D pci_msi_notify;
> >=20
> > Are you sure it's correct to skip the msi_is_masked() logic? I think the
> > callback function should only override the behavior of
> > msi_send_message(), not the entire msi_notify() function.
> >=20
> > The same applies to MSI-X.
>=20
> Hi Stefan,
>=20
> We noticed that the client is handling the masking and unmasking of MSIx
> interrupts.
>=20
> Concerning MSIx, vfio_msix_vector_use() handles unmasking and
> vfio_msix_vector_release() handles masking operations. The server triggers
> an MSIx interrupt by signaling the eventfd associated with the vector. If=
 the vector
> is unmasked, the interrupt bypasses the client/QEMU and takes this
> path: =E2=80=9Cserver -> KVM -> guest=E2=80=9D. Whereas, if the vector is=
 masked, it lands on the
> client via: =E2=80=9Cserver -> vfio_msi_interrupt()=E2=80=9D. vfio_msi_in=
terrupt() suppresses the
> interrupt if the vector is masked. The use and release functions switch t=
he server=E2=80=99s
> eventfd between VFIOPCIDevice->VFIOMSIVector[i]->kvm_interrupt and
> VFIOPCIDevice->VFIOMSIVector[i]->interrupt using the
> VFIO_DEVICE_SET_IRQS message.
>=20
> Concerning MSI, the server should check if the vector is unmasked before
> triggering. The server is not doing it presently, will update it. For som=
e reason,
> I had assumed that MSI handling is similar to MSIx in terms of masking - =
sorry
> about that. The masking and unmasking information for MSI is in the confi=
g space
> registers, so the server should have this information.
>=20
> You had previously suggested using callbacks for msi_get_message &
> msi_send_message, considering the masking issue. Given MSIx masking
> (including the MSIx table BAR) is handled at the client, the masking info=
rmation
> doesn=E2=80=99t reach the server - so msix_notify will never invoke the
> msi_send_message callback - all the vectors remain masked at the server
> end (msix_init() -> msix_mask_all()).

I was expecting vfio-user devices to be involved in MSI-X masking so
they can implement the Pending bit semantics described in the spec:

  If a masked vector has its Pending bit Set, and the associated
  underlying interrupt events are somehow satisfied (usually by software
  though the exact manner is Function-specific), the Function must Clear
  the Pending bit, to avoid sending a spurious interrupt message later
  when software unmasks the vector.

Does QEMU VFIO support this?

What happens when a hw/net/e1000e_core.c vfio-user device uses
msix_clr_pending() and related APIs?

Also, having the vfio-user daemon write to the eventfd while the vector
is masked is a waste of CPU cycles. The PCIe spec describes using MSI-X
masking for poll mode operation and going via eventfd is suboptimal:

  Software is permitted to mask one or more vectors indefinitely, and
  service their associated interrupt events strictly based on polling
  their Pending bits. A Function must Set and Clear its Pending bits as
  necessary to support this =E2=80=9Cpure polling=E2=80=9D mode of operatio=
n.

Maybe the answer is these issues don't matter in practice because MSI-X
masking is not used much?

Stefan

--0JhQMcskEthAx9A4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmJDFqcACgkQnKSrs4Gr
c8iayQf/ZWzTYDdYaDJLul1yzlfJGxrheM/F9MbRMH9N9JyFrcx8070WuLdj4T3Y
pf6ZlY1peeUos1MlArZX7M2q0MZBNo3R+BQ2a6DXpckbY6vPauuM4lXiHGz/BHfd
knIYqJBCZ3CASQUeB5ANY3NQ+doMPDXR3R7rP6seRHP7kc3u1IdjgDHybJ0QXC81
Zt0DLRqMpZttoDeaVfqrcmD3ogHoH1Mo/IbwMofJNQAPonupQqQGrhs6crjs/xZo
Bb61Yj9vd8vs0om70nX9wZsfeBWUb1IJsa3QKcdFDpE0kR58+daQ1Xm8xbYDTDma
DkSP36ukN4fH6cnLUD0d6ssdRdZtjA==
=JZX5
-----END PGP SIGNATURE-----

--0JhQMcskEthAx9A4--


