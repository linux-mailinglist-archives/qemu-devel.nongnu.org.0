Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35AB24863BD
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 12:29:15 +0100 (CET)
Received: from localhost ([::1]:55124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5QxG-0004qp-0F
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 06:29:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1n5Qtz-0002px-LC
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 06:25:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1n5Qtc-0004It-U9
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 06:25:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641468327;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+BGtRQMFGO8yyN30FVHiU3c67wdJS0cJlPMQxEZW36I=;
 b=DAa/LXqNzBMWaC4dWSPNlbb/Z88awyq7FWRNP0S1RPLX9Ep/CGrm2xhaafMXPJaWwSj0c9
 VgqieYwI5DW0xE/mOQH8CbAj/ny4YPqK9/PLf+pu0umJCeWURV7trM0gZcRp4MowEL/tGV
 /1JfT6LPfehJZnXoCkgmW/Gcg58R24A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-54-aSDO5XgZPtOfBLZXshCv7Q-1; Thu, 06 Jan 2022 06:25:23 -0500
X-MC-Unique: aSDO5XgZPtOfBLZXshCv7Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9DB19801962;
 Thu,  6 Jan 2022 11:25:22 +0000 (UTC)
Received: from localhost (unknown [10.39.193.158])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 21A747D5B2;
 Thu,  6 Jan 2022 11:25:15 +0000 (UTC)
Date: Thu, 6 Jan 2022 11:25:14 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Longpeng (Mike,
 Cloud Infrastructure Service Product Dept.)" <longpeng2@huawei.com>
Subject: Re: [RFC 03/10] vdpa: add the infrastructure of vdpa-dev
Message-ID: <YdbRmqnh1GYDtCR8@stefanha-x1.localdomain>
References: <20220105005900.860-1-longpeng2@huawei.com>
 <20220105005900.860-4-longpeng2@huawei.com>
 <YdVpgaq/mFEZQpT7@stefanha-x1.localdomain>
 <21147b9ccec84deabbd1dcf32f19f05e@huawei.com>
MIME-Version: 1.0
In-Reply-To: <21147b9ccec84deabbd1dcf32f19f05e@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="r4ce5M7Nf3OskiE9"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
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
Cc: "mst@redhat.com" <mst@redhat.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Yechuan <yechuan@huawei.com>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>,
 Huangzhichao <huangzhichao@huawei.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "sgarzare@redhat.com" <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--r4ce5M7Nf3OskiE9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 06, 2022 at 01:22:19AM +0000, Longpeng (Mike, Cloud Infrastruct=
ure Service Product Dept.) wrote:
>=20
>=20
> > -----Original Message-----
> > From: Stefan Hajnoczi [mailto:stefanha@redhat.com]
> > Sent: Wednesday, January 5, 2022 5:49 PM
> > To: Longpeng (Mike, Cloud Infrastructure Service Product Dept.)
> > <longpeng2@huawei.com>
> > Cc: mst@redhat.com; jasowang@redhat.com; sgarzare@redhat.com;
> > cohuck@redhat.com; pbonzini@redhat.com; Gonglei (Arei)
> > <arei.gonglei@huawei.com>; Yechuan <yechuan@huawei.com>; Huangzhichao
> > <huangzhichao@huawei.com>; qemu-devel@nongnu.org
> > Subject: Re: [RFC 03/10] vdpa: add the infrastructure of vdpa-dev
> >=20
> > On Wed, Jan 05, 2022 at 08:58:53AM +0800, Longpeng(Mike) wrote:
> > > +static const VirtioPCIDeviceTypeInfo vhost_vdpa_device_pci_info =3D =
{
> > > +    .base_name               =3D TYPE_VHOST_VDPA_DEVICE_PCI,
> > > +    .generic_name            =3D "vhost-vdpa-device-pci",
> > > +    .transitional_name       =3D "vhost-vdpa-device-pci-transitional=
",
> > > +    .non_transitional_name   =3D "vhost-vdpa-device-pci-non-transiti=
onal",
> >=20
> > Does vDPA support Transitional VIRTIO devices?
> >=20
> > I expected this device to support Modern devices only.
> >=20
>=20
> There's already a 0.95 vdpa driver (Alibaba ENI) in the kernel source and
> supporting 0.95 devices is necessary for some older GuestOS.
>=20
> I'm OK if other guys also approve of supporting 1.0+ devices only :)

If vDPA supports Transitional VIRTIO devices then it's fine to keep this
code unchanged in this patch series.

Stefan

--r4ce5M7Nf3OskiE9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmHW0ZkACgkQnKSrs4Gr
c8gaowgAq3RSBEWEP8EVnz8DYr7U5UYFKCrZLExhu5JM+uYtbcCUtKqTFShqRWaE
pzcscrgotzdhSzuMI2fC3iXE0cBoGIJHd1Ieo1prChNxunIPgc9iJnapf8rKtRtR
Ng06aYFVNwdcn7P7KWnAck3ddhJGWaxkGsxKB+nzndLO8vw7anqWLDRLyW8zbMJ1
IvVsr0GmGJb1orWSSlRNQrin61FJ0G2cQkJqQuBGybYPw7cfxrnoyBGf8U7nXlZE
bXMk1GDU+fMP1qWJ+Nm/JAA+aVbIi9vXWleWEp13ULLs0eBlqIbhzKAOavF8ar2x
ktoVqV2HaOueX60IgY3dRSk8MEqpcQ==
=wH9N
-----END PGP SIGNATURE-----

--r4ce5M7Nf3OskiE9--


