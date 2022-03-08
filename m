Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7F04D1441
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 11:08:10 +0100 (CET)
Received: from localhost ([::1]:46770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRWlF-0005b1-LN
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 05:08:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nRWiH-0002zx-6J
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 05:05:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nRWiE-0007GO-Ah
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 05:05:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646733901;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lE9BEKbS3I8QqSqiqfq5YoC38xm67wHrh6hOybCqel0=;
 b=WnuwtDOUyB7kDKl7h2wSNJYABmQpRGyLaAfy/b2d43DUxwcO+XTL4Lo1O+JlTMIqZbJXlD
 HZKkbbZWJjMvJh67UoHc44A6tzg0Hjs73qqC+80/zw/C4Psp8NpVqKYuBRsIJtti7iQMyp
 C4TLTf9pRswDIb0SRVM1zvgdABSuVRc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-494-_683cm8bPlCiXKFcV86fPg-1; Tue, 08 Mar 2022 05:04:58 -0500
X-MC-Unique: _683cm8bPlCiXKFcV86fPg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F33D2801AEB;
 Tue,  8 Mar 2022 10:04:56 +0000 (UTC)
Received: from localhost (unknown [10.39.193.143])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3FB57E2C8;
 Tue,  8 Mar 2022 10:04:45 +0000 (UTC)
Date: Tue, 8 Mar 2022 10:04:43 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jag Raman <jag.raman@oracle.com>
Subject: Re: [PATCH v6 12/19] vfio-user: IOMMU support for remote device
Message-ID: <YicqOxnnWNO9tqTu@stefanha-x1.localdomain>
References: <cover.1645079934.git.jag.raman@oracle.com>
 <f6dc62f6957a6ae2d289a5810d48c717eefff861.1645079934.git.jag.raman@oracle.com>
 <YhS9gvErGeGVPcwk@stefanha-x1.localdomain>
 <208904A4-1F80-4102-8B00-C106121475A1@oracle.com>
 <Yh+gMyjTDM5GEXMT@stefanha-x1.localdomain>
 <4022DDF7-8D34-4A65-969D-B632A66E386F@oracle.com>
 <YiXURRO7kjBogt9g@stefanha-x1.localdomain>
 <77385160-0409-4915-9210-EE4B115FEDA3@oracle.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="q1dxwvnpT9Rt+lJ5"
Content-Disposition: inline
In-Reply-To: <77385160-0409-4915-9210-EE4B115FEDA3@oracle.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Kanth Ghatraju <kanth.ghatraju@oracle.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "eblake@redhat.com" <eblake@redhat.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--q1dxwvnpT9Rt+lJ5
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 07, 2022 at 02:42:49PM +0000, Jag Raman wrote:
>=20
>=20
> > On Mar 7, 2022, at 4:45 AM, Stefan Hajnoczi <stefanha@redhat.com> wrote:
> >=20
> > On Thu, Mar 03, 2022 at 02:49:53PM +0000, Jag Raman wrote:
> >>=20
> >>=20
> >>> On Mar 2, 2022, at 11:49 AM, Stefan Hajnoczi <stefanha@redhat.com> wr=
ote:
> >>>=20
> >>> On Mon, Feb 28, 2022 at 07:54:38PM +0000, Jag Raman wrote:
> >>>>=20
> >>>>=20
> >>>>> On Feb 22, 2022, at 5:40 AM, Stefan Hajnoczi <stefanha@redhat.com> =
wrote:
> >>>>>=20
> >>>>> On Thu, Feb 17, 2022 at 02:48:59AM -0500, Jagannathan Raman wrote:
> >>>>>> +struct RemoteIommuElem {
> >>>>>> +    AddressSpace  as;
> >>>>>> +    MemoryRegion  mr;
> >>>>>> +};
> >>>>>> +
> >>>>>> +GHashTable *remote_iommu_elem_by_bdf;
> >>>>>=20
> >>>>> A mutable global hash table requires synchronization when device
> >>>>> emulation runs in multiple threads.
> >>>>>=20
> >>>>> I suggest using pci_setup_iommu()'s iommu_opaque argument to avoid =
the
> >>>>> global. If there is only 1 device per remote PCI bus, then there ar=
e no
> >>>>> further synchronization concerns.
> >>>>=20
> >>>> OK, will avoid the global. We would need to access the hash table
> >>>> concurrently since there could be more than one device in the
> >>>> same bus - so a mutex would be needed here.
> >>>=20
> >>> I thought the PCIe topology can be set up with a separate buf for each
> >>> x-vfio-user-server? I remember something like that in the previous
> >>> revision where a root port was instantiated for each x-vfio-user-serv=
er.
> >>=20
> >> Yes, we could setup the PCIe topology to be that way. But the user cou=
ld
> >> add more than one device to the same bus, unless the bus type explicit=
ly
> >> limits the number of devices to one (BusClass->max_dev).
> >=20
> > Due to how the IOMMU is used to restrict the bus to the vfio-user
> > client's DMA mappings, it seems like it's necesssary to limit the number
> > of devices to 1 per bus anyway?
>=20
> Hi Stefan,
>=20
> =E2=80=9Cremote_iommu_elem_by_bdf=E2=80=9D has a separate entry for each =
of the BDF
> combinations - it provides a separate DMA address space per device. As
> such, we don=E2=80=99t have to limit the number of devices to 1 per bus.

I see, thanks!

Stefan

--q1dxwvnpT9Rt+lJ5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmInKjsACgkQnKSrs4Gr
c8iFdwf7BuPFJ13teCWfdmUK6JEJCOlC8UpslUjlgNmkkRENCWAbh8lG8L25BEaV
yInO9rJcoVp5cH2UMoZUmLmNmyckQBJBVPNXvrESIwsze/kgNuK+FoY7e2nY/8dm
E6NV6hoLXu+LRSZS5HbZhpd+SyVrc7ndV7a4U5Fc3lEjRiLJc7fQ0OxZgdte2IRF
Fr6AW47tDzqGXTdyODYn5knZMJhLzbn6X1+EB2bxmG29xVpz2XJrSyW1uMkcvLHH
7jo8aqNqJVO/cQRwLgzi5kR2/rgHrJ0G0qVBZjgr0oSfVrhT1JWw1sg2xdWygdj0
akh2MpCDTw1NMclCkz+B6iOtC9ZUGw==
=uVt/
-----END PGP SIGNATURE-----

--q1dxwvnpT9Rt+lJ5--


