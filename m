Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E83534FC42
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Mar 2021 11:13:25 +0200 (CEST)
Received: from localhost ([::1]:50276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRWui-00022r-0m
	for lists+qemu-devel@lfdr.de; Wed, 31 Mar 2021 05:13:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lRWtJ-0001cy-Rw
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 05:11:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40224)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lRWtF-0002gQ-Jp
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 05:11:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617181911;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KXRcpfLcVnIRoOERpmPzKJEcI2P7LkMQUmUvPHq6NaI=;
 b=g0HdBBL7V1Ojsb+L6j4YpMS2OUVcX94ak82K1QjMRvLmYLuRx8VacwGHstE+JqiL5ILu1k
 wtXszLN5o2xLE0HqNpudR+tmBk3ZRYtK1y/ZfL7KJ1HiA8dJoYN78UHOa0odRFZKHNVRS2
 kvRdc8C4vqepoRG4y+Vsy1xmy0vFHi4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-474-W0VSr2MvMAuAPk-Si2EKXA-1; Wed, 31 Mar 2021 05:11:46 -0400
X-MC-Unique: W0VSr2MvMAuAPk-Si2EKXA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5B4308189CA;
 Wed, 31 Mar 2021 09:11:45 +0000 (UTC)
Received: from localhost (ovpn-115-85.ams2.redhat.com [10.36.115.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DFDA8A8438;
 Wed, 31 Mar 2021 09:11:44 +0000 (UTC)
Date: Wed, 31 Mar 2021 10:11:43 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH v2] IOMMU not supported by vhost-user.
Message-ID: <YGQ8z+Uv4QTmbYTl@stefanha-x1.localdomain>
References: <a47b7a5dafcab0f3a662414ba6cbbc7eb280d478.1613591341.git.lagarcia@br.ibm.com>
 <20210223165541.5aafc638@bahia.lan>
MIME-Version: 1.0
In-Reply-To: <20210223165541.5aafc638@bahia.lan>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="+c4yZhOzomX86yW8"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: farosas@br.ibm.com, Leonardo Garcia <lagarcia@br.ibm.com>,
 lagarcia@linux.ibm.com, qemu-devel@nongnu.org, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--+c4yZhOzomX86yW8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 23, 2021 at 04:55:41PM +0100, Greg Kurz wrote:
> > diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
> > index 6e17d631f7..78e58d2148 100644
> > --- a/hw/virtio/vhost.c
> > +++ b/hw/virtio/vhost.c
> > @@ -1293,7 +1293,6 @@ int vhost_dev_init(struct vhost_dev *hdev, void *=
opaque,
> >      int i, r, n_initialized_vqs =3D 0;
> >      Error *local_err =3D NULL;
> > =20
> > -    hdev->vdev =3D NULL;
>=20
> With this change, vhost_dev_init() no longer offers the guarantee
> that ->vdev is valid, which might cause problems for any device
> that doesn't set ->vdev itself like this patch does for vhost-user-fs.
>=20
> I suggest you to turn vhost_dev_init() into a vhost_dev_init_vdev()
> with an extra vdev argument and use it for all vhost-user devices.
> Introduce a vhost_dev_init() inline that does vhost_dev_init_vdev(NULL)
> and call it everywhere else.

Yes, I agree. Passing vdev in as an argument is a clean solution.

Stefan

--+c4yZhOzomX86yW8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmBkPM8ACgkQnKSrs4Gr
c8jM+Af/f1+pG0d0GjR4TtHjeXnEzBdaO/TpqwIV4yqPtyDTGAAhfsKnOYtF4X0N
GN6RDy/Ex4ke++5p73biOtTrO57XTIhKBYOXQ/gUKUTzX7mqVH/yN/5S7MfMrniE
6NmI80UBXsO/Tab+hPU+wr4YGuG+0Ia/pdYmXfbuT6n3XwDlaKZb8xt+RdRpmQUU
kD1/clY1L2ni92b0t3zScqaxUiwN1XbrFcVWtBhKXJZ8EEZevfINZVlzLbf72jm8
mCuWdyfcp0d2FmwgaJv4/qRnZfuAD8uLMz8HKkyuQvuR1Ksya1BOL02+WeATAuIF
4LeatMePvHe+cU/Yx7IHga79KpQHuA==
=HyUY
-----END PGP SIGNATURE-----

--+c4yZhOzomX86yW8--


