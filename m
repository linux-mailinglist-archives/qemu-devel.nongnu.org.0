Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 089FA4EAFA1
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 16:51:03 +0200 (CEST)
Received: from localhost ([::1]:35362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZDBW-0000TT-4l
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 10:51:02 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nZD94-0007Er-CP
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 10:48:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nZD92-0001T2-GW
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 10:48:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648565307;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VhMa77GOoR56NCLOOXQ+wcBHEsDRec4NBWeHc2/JD48=;
 b=XH6LFMyruQqJTuQTfqpWGszu29wmNpMBTsdAv9we0SJwdljUafyrm21kWupRGh0FC4OOTb
 mCNPGtZ9zy6xSyGxDszxx4HIwg63/UFbe6sub5KPzB2X7MEtseZz0TNwNBo+5NV6Q3cNHz
 eKGkZ7OaP/Bxk3p3RpDZ5K6xDRHbzDA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-168-wSNU-8WuPFmVUtYVzgKhIw-1; Tue, 29 Mar 2022 10:48:24 -0400
X-MC-Unique: wSNU-8WuPFmVUtYVzgKhIw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A5E47101AA52;
 Tue, 29 Mar 2022 14:48:13 +0000 (UTC)
Received: from localhost (unknown [10.39.195.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D239840149B5;
 Tue, 29 Mar 2022 14:48:06 +0000 (UTC)
Date: Tue, 29 Mar 2022 15:48:04 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jag Raman <jag.raman@oracle.com>
Subject: Re: [PATCH v7 12/17] vfio-user: IOMMU support for remote device
Message-ID: <YkMcJDFVFu/fW/a5@stefanha-x1.localdomain>
References: <cover.1648234157.git.jag.raman@oracle.com>
 <2fdb90acd40a1f79d571d4e68c56e6b08aded60d.1648234157.git.jag.raman@oracle.com>
 <YkL9C+oMUSav9y95@stefanha-x1.localdomain>
 <AC3FD7EB-773E-4684-9A86-176EDDAC135D@oracle.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="7ZnGUI8p1YRraicX"
Content-Disposition: inline
In-Reply-To: <AC3FD7EB-773E-4684-9A86-176EDDAC135D@oracle.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
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


--7ZnGUI8p1YRraicX
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 29, 2022 at 02:12:40PM +0000, Jag Raman wrote:
> > On Mar 29, 2022, at 8:35 AM, Stefan Hajnoczi <stefanha@redhat.com> wrot=
e:
> > On Fri, Mar 25, 2022 at 03:19:41PM -0400, Jagannathan Raman wrote:
> >> +void remote_iommu_del_device(PCIDevice *pci_dev)
> >> +{
> >> +    int pci_bdf;
> >> +
> >> +    if (!remote_iommu_table.elem_by_bdf || !pci_dev) {
> >> +        return;
> >> +    }
> >> +
> >> +    pci_bdf =3D PCI_BUILD_BDF(pci_bus_num(pci_get_bus(pci_dev)), pci_=
dev->devfn);
> >> +
> >> +    qemu_mutex_lock(&remote_iommu_table.lock);
> >> +    g_hash_table_remove(remote_iommu_table.elem_by_bdf, INT2VOIDP(pci=
_bdf));
> >> +    qemu_mutex_unlock(&remote_iommu_table.lock);
> >> +}
> >> +
> >> +void remote_configure_iommu(PCIBus *pci_bus)
> >> +{
> >> +    if (!remote_iommu_table.elem_by_bdf) {
> >> +        remote_iommu_table.elem_by_bdf =3D
> >> +            g_hash_table_new_full(NULL, NULL, NULL, remote_iommu_del_=
elem);
> >> +        qemu_mutex_init(&remote_iommu_table.lock);
> >> +    }
> >> +
> >> +    pci_setup_iommu(pci_bus, remote_iommu_find_add_as, &remote_iommu_=
table);
> >=20
> > Why is remote_iommu_table global? It could be per-PCIBus and indexed by
> > just devfn instead of the full BDF.
>=20
> It=E2=80=99s global because remote_iommu_del_device() needs it for cleanu=
p.

Can remote_iommu_del_device() use pci_get_bis(pci_dev)->irq_opaque to
get the per-bus table?

Stefan

--7ZnGUI8p1YRraicX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmJDHCQACgkQnKSrs4Gr
c8gCQQf/aTf9AEYN8RV0mx2MBGlqAu7HHoPEcYjrbjCJpxWTXgk7XzsFH0iWiDt6
I1l4LDH9k1xGD/i3WwN/BRedwQv71tR09pt0neluk6H2C+qgHw6g4o6zgYgCSQmf
2XISmBGp8PYDzve2u/aqkP3KIKYEdaO6jr/1our2B91MDpW1JcSs/cr/+yMCYay4
GSQoQYTGlL47HDPYFag5ouuYBN6WXTRTGPFfPi+Q9zVAbk0r85vKCzI4VtyItZEj
WHL8RpZfiQueSYzLiSTKFmz3VAiK2PGzQ1LORhaf9ssNaizsz3a299jZc/y4Pnbk
SYlHzqYmtBCvMjELgd6PQgksCUiK4w==
=L6Fc
-----END PGP SIGNATURE-----

--7ZnGUI8p1YRraicX--


