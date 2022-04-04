Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67DA64F1254
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Apr 2022 11:48:58 +0200 (CEST)
Received: from localhost ([::1]:46686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbJKT-0006pO-Cs
	for lists+qemu-devel@lfdr.de; Mon, 04 Apr 2022 05:48:57 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nbJGG-0003kQ-36
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 05:44:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53032)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nbJGD-0001wb-L7
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 05:44:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649065472;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=g9LYg3drJJykuVzmM3iQhqmj7Yq/FUT9L0Ut7yNMIWo=;
 b=HOs4m93hASvFbR+DDK8pM+JIYsPz1TubkKHu+lvvCXo7bEiQH1pJ5PjKqDvLsM+ctQbAq0
 Z209+oET/AXD882EzyQPL90zQLTh/gyJeCIso+dO4QQusrTE2v5izcnxI8bMiTN/4yh/oT
 O9SZn9vmjw6dv2ZBIABH1VUXCwRlu7A=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-537-3ckBAJPFPya6VL71egoQVw-1; Mon, 04 Apr 2022 05:44:28 -0400
X-MC-Unique: 3ckBAJPFPya6VL71egoQVw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DD717811E9B;
 Mon,  4 Apr 2022 09:44:27 +0000 (UTC)
Received: from localhost (unknown [10.39.194.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 716B7C5B140;
 Mon,  4 Apr 2022 09:44:27 +0000 (UTC)
Date: Mon, 4 Apr 2022 10:44:26 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Thanos Makatos <thanos.makatos@nutanix.com>
Subject: Re: [PATCH v6 15/19] vfio-user: handle device interrupts
Message-ID: <Ykq9+jrYVXwec0X6@stefanha-x1.localdomain>
References: <cover.1645079934.git.jag.raman@oracle.com>
 <ba5a32f3def72ce66a894191747dcafd63e7a517.1645079934.git.jag.raman@oracle.com>
 <YiXdUbz3r1xORJKD@stefanha-x1.localdomain>
 <67EFF59D-E1DB-4830-B5C2-B58CCA9A35E6@oracle.com>
 <YkMWp0lUJAHhivJA@stefanha-x1.localdomain>
 <9B3B2C94-14B6-4415-9C15-E8738EB52013@oracle.com>
 <DM8PR02MB8005F9B087645AFDE4FB94A58B1F9@DM8PR02MB8005.namprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Kk8tzEdzIxtB2Gg8"
Content-Disposition: inline
In-Reply-To: <DM8PR02MB8005F9B087645AFDE4FB94A58B1F9@DM8PR02MB8005.namprd02.prod.outlook.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
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
 John Johnson <john.g.johnson@oracle.com>, Jag Raman <jag.raman@oracle.com>,
 Beraldo Leal <bleal@redhat.com>, John Levon <john.levon@nutanix.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Kanth Ghatraju <kanth.ghatraju@oracle.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Kk8tzEdzIxtB2Gg8
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 30, 2022 at 09:40:42AM +0000, Thanos Makatos wrote:
> > -----Original Message-----
> > From: Jag Raman <jag.raman@oracle.com>
> > Sent: 29 March 2022 20:07
> > To: Stefan Hajnoczi <stefanha@redhat.com>
> > Cc: Alex Williamson <alex.williamson@redhat.com>; qemu-devel <qemu-
> > devel@nongnu.org>; Michael S. Tsirkin <mst@redhat.com>; Philippe Mathie=
u-
> > Daud=C3=A9 <f4bug@amsat.org>; Paolo Bonzini <pbonzini@redhat.com>; Bera=
ldo
> > Leal <bleal@redhat.com>; Daniel P. Berrang=C3=A9 <berrange@redhat.com>;
> > eduardo@habkost.net; Marcel Apfelbaum <marcel.apfelbaum@gmail.com>;
> > Eric Blake <eblake@redhat.com>; Markus Armbruster <armbru@redhat.com>;
> > Juan Quintela <quintela@redhat.com>; dgilbert@redhat.com; John Levon
> > <john.levon@nutanix.com>; Thanos Makatos <thanos.makatos@nutanix.com>;
> > Elena Ufimtseva <elena.ufimtseva@oracle.com>; John Johnson
> > <john.g.johnson@oracle.com>; Kanth Ghatraju <kanth.ghatraju@oracle.com>
> > Subject: Re: [PATCH v6 15/19] vfio-user: handle device interrupts
> >=20
> >=20
> >=20
> > > On Mar 29, 2022, at 10:24 AM, Stefan Hajnoczi <stefanha@redhat.com>
> > wrote:
> > >
> > > On Sat, Mar 26, 2022 at 11:47:36PM +0000, Jag Raman wrote:
> > >>
> > >>
> > >>> On Mar 7, 2022, at 5:24 AM, Stefan Hajnoczi <stefanha@redhat.com>
> > wrote:
> > >>>
> > >>> On Thu, Feb 17, 2022 at 02:49:02AM -0500, Jagannathan Raman wrote:
> > >>>> Forward remote device's interrupts to the guest
> > >>>>
> > >>>> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> > >>>> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> > >>>> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> > >>>> ---
> > >>>> include/hw/pci/pci.h              |   6 ++
> > >>>> include/hw/remote/vfio-user-obj.h |   6 ++
> > >>>> hw/pci/msi.c                      |  13 +++-
> > >>>> hw/pci/msix.c                     |  12 +++-
> > >>>> hw/remote/machine.c               |  11 +--
> > >>>> hw/remote/vfio-user-obj.c         | 107 ++++++++++++++++++++++++++=
++++
> > >>>> stubs/vfio-user-obj.c             |   6 ++
> > >>>> MAINTAINERS                       |   1 +
> > >>>> hw/remote/trace-events            |   1 +
> > >>>> stubs/meson.build                 |   1 +
> > >>>> 10 files changed, 158 insertions(+), 6 deletions(-)
> > >>>> create mode 100644 include/hw/remote/vfio-user-obj.h
> > >>>> create mode 100644 stubs/vfio-user-obj.c
> > >>>>
> > >>>> diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> > >>>> index c3f3c90473..d42d526a48 100644
> > >>>> --- a/include/hw/pci/pci.h
> > >>>> +++ b/include/hw/pci/pci.h
> > >>>> @@ -129,6 +129,8 @@ typedef uint32_t PCIConfigReadFunc(PCIDevice
> > *pci_dev,
> > >>>> typedef void PCIMapIORegionFunc(PCIDevice *pci_dev, int region_num,
> > >>>>                                pcibus_t addr, pcibus_t size, int t=
ype);
> > >>>> typedef void PCIUnregisterFunc(PCIDevice *pci_dev);
> > >>>> +typedef void PCIMSINotify(PCIDevice *pci_dev, unsigned vector);
> > >>>> +typedef void PCIMSIxNotify(PCIDevice *pci_dev, unsigned vector);
> > >>>>
> > >>>> typedef struct PCIIORegion {
> > >>>>    pcibus_t addr; /* current PCI mapping address. -1 means not map=
ped */
> > >>>> @@ -323,6 +325,10 @@ struct PCIDevice {
> > >>>>    /* Space to store MSIX table & pending bit array */
> > >>>>    uint8_t *msix_table;
> > >>>>    uint8_t *msix_pba;
> > >>>> +
> > >>>> +    PCIMSINotify *msi_notify;
> > >>>> +    PCIMSIxNotify *msix_notify;
> > >>>> +
> > >>>>    /* MemoryRegion container for msix exclusive BAR setup */
> > >>>>    MemoryRegion msix_exclusive_bar;
> > >>>>    /* Memory Regions for MSIX table and pending bit entries. */
> > >>>> diff --git a/include/hw/remote/vfio-user-obj.h b/include/hw/remote=
/vfio-
> > user-obj.h
> > >>>> new file mode 100644
> > >>>> index 0000000000..87ab78b875
> > >>>> --- /dev/null
> > >>>> +++ b/include/hw/remote/vfio-user-obj.h
> > >>>> @@ -0,0 +1,6 @@
> > >>>> +#ifndef VFIO_USER_OBJ_H
> > >>>> +#define VFIO_USER_OBJ_H
> > >>>> +
> > >>>> +void vfu_object_set_bus_irq(PCIBus *pci_bus);
> > >>>> +
> > >>>> +#endif
> > >>>> diff --git a/hw/pci/msi.c b/hw/pci/msi.c
> > >>>> index 47d2b0f33c..93f5e400cc 100644
> > >>>> --- a/hw/pci/msi.c
> > >>>> +++ b/hw/pci/msi.c
> > >>>> @@ -51,6 +51,8 @@
> > >>>> */
> > >>>> bool msi_nonbroken;
> > >>>>
> > >>>> +static void pci_msi_notify(PCIDevice *dev, unsigned int vector);
> > >>>> +
> > >>>> /* If we get rid of cap allocator, we won't need this. */
> > >>>> static inline uint8_t msi_cap_sizeof(uint16_t flags)
> > >>>> {
> > >>>> @@ -225,6 +227,8 @@ int msi_init(struct PCIDevice *dev, uint8_t of=
fset,
> > >>>>    dev->msi_cap =3D config_offset;
> > >>>>    dev->cap_present |=3D QEMU_PCI_CAP_MSI;
> > >>>>
> > >>>> +    dev->msi_notify =3D pci_msi_notify;
> > >>>
> > >>> Are you sure it's correct to skip the msi_is_masked() logic? I thin=
k the
> > >>> callback function should only override the behavior of
> > >>> msi_send_message(), not the entire msi_notify() function.
> > >>>
> > >>> The same applies to MSI-X.
> > >>
> > >> Hi Stefan,
> > >>
> > >> We noticed that the client is handling the masking and unmasking of =
MSIx
> > >> interrupts.
> > >>
> > >> Concerning MSIx, vfio_msix_vector_use() handles unmasking and
> > >> vfio_msix_vector_release() handles masking operations. The server tr=
iggers
> > >> an MSIx interrupt by signaling the eventfd associated with the vecto=
r. If the
> > vector
> > >> is unmasked, the interrupt bypasses the client/QEMU and takes this
> > >> path: =E2=80=9Cserver -> KVM -> guest=E2=80=9D. Whereas, if the vect=
or is masked, it lands on
> > the
> > >> client via: =E2=80=9Cserver -> vfio_msi_interrupt()=E2=80=9D. vfio_m=
si_interrupt() suppresses
> > the
> > >> interrupt if the vector is masked. The use and release functions swi=
tch the
> > server=E2=80=99s
> > >> eventfd between VFIOPCIDevice->VFIOMSIVector[i]->kvm_interrupt and
> > >> VFIOPCIDevice->VFIOMSIVector[i]->interrupt using the
> > >> VFIO_DEVICE_SET_IRQS message.
> > >>
> > >> Concerning MSI, the server should check if the vector is unmasked be=
fore
> > >> triggering. The server is not doing it presently, will update it. Fo=
r some
> > reason,
> > >> I had assumed that MSI handling is similar to MSIx in terms of maski=
ng - sorry
> > >> about that. The masking and unmasking information for MSI is in the =
config
> > space
> > >> registers, so the server should have this information.
> > >>
> > >> You had previously suggested using callbacks for msi_get_message &
> > >> msi_send_message, considering the masking issue. Given MSIx masking
> > >> (including the MSIx table BAR) is handled at the client, the masking
> > information
> > >> doesn=E2=80=99t reach the server - so msix_notify will never invoke =
the
> > >> msi_send_message callback - all the vectors remain masked at the ser=
ver
> > >> end (msix_init() -> msix_mask_all()).
> > >
> > > I was expecting vfio-user devices to be involved in MSI-X masking so
>=20
> libvfio-user can't be involved in the first place since QEMU emulates MSI=
/X:
> https://lore.kernel.org/all/20200121101911.64701afd@w520.home/T/
>=20
> > > they can implement the Pending bit semantics described in the spec:
> > >
> > >  If a masked vector has its Pending bit Set, and the associated
> > >  underlying interrupt events are somehow satisfied (usually by softwa=
re
> > >  though the exact manner is Function-specific), the Function must Cle=
ar
> > >  the Pending bit, to avoid sending a spurious interrupt message later
> > >  when software unmasks the vector.
> > >
> > > Does QEMU VFIO support this?
> >=20
> > QEMU VFIO doesn=E2=80=99t seem to support it - I couldn=E2=80=99t find =
a place where
> > an assigned/passthru PCI device clears the pending bits in QEMU.
> >=20
> > >
> > > What happens when a hw/net/e1000e_core.c vfio-user device uses
> > > msix_clr_pending() and related APIs?
> > >
> > > Also, having the vfio-user daemon write to the eventfd while the vect=
or
> > > is masked is a waste of CPU cycles. The PCIe spec describes using MSI=
-X
> > > masking for poll mode operation and going via eventfd is suboptimal:
> > >
> > >  Software is permitted to mask one or more vectors indefinitely, and
> > >  service their associated interrupt events strictly based on polling
> > >  their Pending bits. A Function must Set and Clear its Pending bits as
> > >  necessary to support this =E2=80=9Cpure polling=E2=80=9D mode of ope=
ration.
> > >
> > > Maybe the answer is these issues don't matter in practice because MSI=
-X
> > > masking is not used much?
> >=20
> > From what I can tell, =E2=80=9Cpure polling=E2=80=9D is used by ivshmem=
 and virtio-pci devices in
> > QEMU.
> >=20
> > e1000e doesn=E2=80=99t use =E2=80=9Cpure polling=E2=80=9D, but it does =
clear pending interrupts.
> >=20
> > John Johnson, John Levon & Thanos,
> >=20
> >     Any thoughts?
>=20
> If QEMU stops emulating MSI/X then we libvfio-user would have to do it.

If Alex is happy with VFIO not supporting the exact Pending bits
semantics in the PCIe spec, then vfio-user probably doesn't need to
either.

I just wanted to raise this design issue and maybe we can document
somewhere that this is intentional.

Stefan

--Kk8tzEdzIxtB2Gg8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmJKvfoACgkQnKSrs4Gr
c8gd4ggAkPN4qDBK+r4wXXJwEj+SFqrDiBtoZL2LJApdKkGgFUCMrpWozEj2hiKN
kEjRGpGRHbOmVBNmLEuPPLc1IAH0RTJyE+pyPricY0XQOQbHFWbt1PFFJKIPI74Y
9CF8tn/CkRDSft0UcSeh+W1BEflx2EJ/RXeXANUnQ0t4bRo5OZFFzyGsXADXzETE
SbOY0StmxvA00RzZz35TJvW6tyxqg+bGzPRZHXFsYK65mQADXyyIK/x5BmOdl7xl
AMgE/GWJUahpCH6oDS8ZfobiASEfQJrVVEcVnplqSCSR1KBuBQF9OacylbGXzzAk
uL4HzW9+4nt1kNW/eWzBImXXUBd8hQ==
=B/sR
-----END PGP SIGNATURE-----

--Kk8tzEdzIxtB2Gg8--


