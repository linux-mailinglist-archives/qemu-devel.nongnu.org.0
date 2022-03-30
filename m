Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D335F4EBE99
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 12:22:55 +0200 (CEST)
Received: from localhost ([::1]:60226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZVTZ-0008NV-Ox
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 06:22:53 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nZVBr-0003LX-HT
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 06:04:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31049)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nZVBp-0006KN-LR
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 06:04:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648634672;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3iCjGPbg72QXMqJ0EHNM9dlXE/6xgF5oRJGumQ7kfs4=;
 b=alYvJvALner24XPa0igaLMy6wk7dxOkxWCAAja2tArSZ4mEe01rG3b40lYclyS90zhN8bZ
 5Z7asvmPGj7qLebb2fngh0q/QHr/yv7w7iZCdVlko4UwGTEf+Zg5wsxHb5vcz/pEE/SUK6
 0hVZmBEN1EnzKoZ73Q69anSxXUcZ3/c=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-614--V3bvD-HMYSejsXFz8jwew-1; Wed, 30 Mar 2022 06:04:26 -0400
X-MC-Unique: -V3bvD-HMYSejsXFz8jwew-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 047CB899EC2;
 Wed, 30 Mar 2022 10:04:26 +0000 (UTC)
Received: from localhost (unknown [10.39.195.140])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9969A42B95F;
 Wed, 30 Mar 2022 10:04:25 +0000 (UTC)
Date: Wed, 30 Mar 2022 11:04:24 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jag Raman <jag.raman@oracle.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Xu <peterx@redhat.com>, Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH v7 12/17] vfio-user: IOMMU support for remote device
Message-ID: <YkQrKI0Az/k8Hc8g@stefanha-x1.localdomain>
References: <cover.1648234157.git.jag.raman@oracle.com>
 <2fdb90acd40a1f79d571d4e68c56e6b08aded60d.1648234157.git.jag.raman@oracle.com>
 <YkL9C+oMUSav9y95@stefanha-x1.localdomain>
 <AC3FD7EB-773E-4684-9A86-176EDDAC135D@oracle.com>
 <YkMcJDFVFu/fW/a5@stefanha-x1.localdomain>
 <7022E4C4-D71A-4A6E-A5D8-222A9462654C@oracle.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ME+KmDYEwwUemRDi"
Content-Disposition: inline
In-Reply-To: <7022E4C4-D71A-4A6E-A5D8-222A9462654C@oracle.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 "berrange@redhat.com" <berrange@redhat.com>,
 "bleal@redhat.com" <bleal@redhat.com>,
 "john.levon@nutanix.com" <john.levon@nutanix.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, "armbru@redhat.com" <armbru@redhat.com>,
 "quintela@redhat.com" <quintela@redhat.com>,
 "f4bug@amsat.org" <f4bug@amsat.org>, qemu-devel <qemu-devel@nongnu.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Kanth Ghatraju <kanth.ghatraju@oracle.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "eblake@redhat.com" <eblake@redhat.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--ME+KmDYEwwUemRDi
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 29, 2022 at 07:58:51PM +0000, Jag Raman wrote:
>=20
>=20
> > On Mar 29, 2022, at 10:48 AM, Stefan Hajnoczi <stefanha@redhat.com> wro=
te:
> >=20
> > On Tue, Mar 29, 2022 at 02:12:40PM +0000, Jag Raman wrote:
> >>> On Mar 29, 2022, at 8:35 AM, Stefan Hajnoczi <stefanha@redhat.com> wr=
ote:
> >>> On Fri, Mar 25, 2022 at 03:19:41PM -0400, Jagannathan Raman wrote:
> >>>> +void remote_iommu_del_device(PCIDevice *pci_dev)
> >>>> +{
> >>>> +    int pci_bdf;
> >>>> +
> >>>> +    if (!remote_iommu_table.elem_by_bdf || !pci_dev) {
> >>>> +        return;
> >>>> +    }
> >>>> +
> >>>> +    pci_bdf =3D PCI_BUILD_BDF(pci_bus_num(pci_get_bus(pci_dev)), pc=
i_dev->devfn);
> >>>> +
> >>>> +    qemu_mutex_lock(&remote_iommu_table.lock);
> >>>> +    g_hash_table_remove(remote_iommu_table.elem_by_bdf, INT2VOIDP(p=
ci_bdf));
> >>>> +    qemu_mutex_unlock(&remote_iommu_table.lock);
> >>>> +}
> >>>> +
> >>>> +void remote_configure_iommu(PCIBus *pci_bus)
> >>>> +{
> >>>> +    if (!remote_iommu_table.elem_by_bdf) {
> >>>> +        remote_iommu_table.elem_by_bdf =3D
> >>>> +            g_hash_table_new_full(NULL, NULL, NULL, remote_iommu_de=
l_elem);
> >>>> +        qemu_mutex_init(&remote_iommu_table.lock);
> >>>> +    }
> >>>> +
> >>>> +    pci_setup_iommu(pci_bus, remote_iommu_find_add_as, &remote_iomm=
u_table);
> >>>=20
> >>> Why is remote_iommu_table global? It could be per-PCIBus and indexed =
by
> >>> just devfn instead of the full BDF.
> >>=20
> >> It=E2=80=99s global because remote_iommu_del_device() needs it for cle=
anup.
> >=20
> > Can remote_iommu_del_device() use pci_get_bis(pci_dev)->irq_opaque to
> > get the per-bus table?
>=20
> pci_get_bus(pci_dev)->irq_opaque is used for interrupts.
>=20
> PCIBus already has an iommu_opaque, which is a private
> member of the bus structure. It=E2=80=99s passed as an argument
> to the iommu_fn().
>=20
> We could add a getter function to retrieve PCIBus->iommu_opaque
> in remote_iommu_del_device(). That way we could avoid the global variable.

I've CCed Michael, Peter, and Jason regarding IOMMUs.

This makes me wonder whether there is a deeper issue with the
pci_setup_iommu() API: the lack of per-device cleanup callbacks.
Per-device IOMMU resources should be freed when a device is hot
unplugged.

=46rom what I can tell this is not the case today:

- hw/i386/intel_iommu.c:vtd_find_add_as() allocates and adds device
  address spaces but I can't find where they are removed and freed.
  VTDAddressSpace instances pointed to from vtd_bus->dev_as[] are leaked.

- hw/i386/amd_iommu.c has similar leaks.

Your patch introduces a custom remote_iommu_del_device() function, but I
think the pci_setup_iommu() API should take a device_del() callback so
IOMMUs have a standard interface for handling per-device cleanup.

BTW in your case remote_iommu_del_device() is sufficient because hot
unplug is blocked by the new unplug blocker mechanism you introduced.
For other IOMMUs unplug will not be blocked and therefore IOMMUs really
need a callback for per-device cleanup.

Stefan

--ME+KmDYEwwUemRDi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmJEKygACgkQnKSrs4Gr
c8gEZAf/WCY1ihDA2Vad7T/v2di+ZarWtkjqf3ckxYO7Yx80BGfrAEeMMP8+R/Wa
B8rbj0ng9AgNfAmfUkrb+mPKuGuYymVmMGc9N53fBRjI6QloRuJyWsbajOXZ1aOW
zPVBRcA+Q+FGVmsHIrdfnzS7pEthjARSg6CcKDSag3ARcCSJXXNlwp1YyX+PGSoE
lUwf1z3ZXL0cY3pk/xs3xYEj30RAurqu1v7t3x2uxDb8lYMALZ+woWj/zkC7mI5m
3oCYntSFudEpml5H6rH3BfKrT7sx+FXVqWnGW6zkrlR5vEZnbL44PTcZAzOm0yCx
ZyWYzBf5Rgqp6Y1X2o7yc+L0vo+bWw==
=UHc8
-----END PGP SIGNATURE-----

--ME+KmDYEwwUemRDi--


