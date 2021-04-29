Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF40B36EC8C
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 16:43:07 +0200 (CEST)
Received: from localhost ([::1]:56010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc7sg-0003Oc-GZ
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 10:43:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lc7rI-0002ry-PI
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 10:41:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lc7rF-0004Qy-Jx
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 10:41:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619707296;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Dfqj08/0uz7prioee3CF8i9bwRa01HAZ86OjTNcDqwE=;
 b=V1bktYt2gXc1zxKTl5YOo6OLBYj/U99sYVJ1ydIJrE6cTxsd9P6U57OstNs+1gOH9QzZvS
 zyByUMypY+e4JCxzdHKZdceOxZpwRI4HJIMuQDTHKFX4JFLrYfIULsZj3+jPHqmPS9FuQY
 F1jSQhukzy0qTTaWmDaCVa8b9UuZUOA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-219-o501T-W1OIi94s9pLZKpwQ-1; Thu, 29 Apr 2021 10:41:32 -0400
X-MC-Unique: o501T-W1OIi94s9pLZKpwQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F310FC73C6;
 Thu, 29 Apr 2021 14:41:30 +0000 (UTC)
Received: from localhost (ovpn-115-28.ams2.redhat.com [10.36.115.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 221BC610DF;
 Thu, 29 Apr 2021 14:41:29 +0000 (UTC)
Date: Thu, 29 Apr 2021 15:41:29 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Richard W.M. Jones" <rjones@redhat.com>
Subject: Re: [ANNOUNCE] libblkio v0.1.0 preview release
Message-ID: <YIrFmZgh5IAeiLdm@stefanha-x1.localdomain>
References: <YIq9PpAd6nP9XTmz@stefanha-x1.localdomain>
 <20210429142259.GR26415@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210429142259.GR26415@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="+sEp05qHXIRiJQlW"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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
Cc: Kevin Wolf <kwolf@redhat.com>, pkrempa@redhat.com,
 Alberto Garcia <berto@igalia.com>, slp@redhat.com, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, mreitz@redhat.com,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Klaus Jensen <its@irrelevant.dk>, philmd@redhat.com,
 Markus Armbruster <armbru@redhat.com>, sgarzare@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--+sEp05qHXIRiJQlW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 29, 2021 at 03:22:59PM +0100, Richard W.M. Jones wrote:
> On Thu, Apr 29, 2021 at 03:05:50PM +0100, Stefan Hajnoczi wrote:
> > The purpose of this preview release is to discuss both the API design
> > and general direction of the project. API documentation is available
> > here:
> >=20
> >   https://gitlab.com/libblkio/libblkio/-/blob/v0.1.0/docs/blkio.rst
>=20
> libvirt originally, and now libnbd, keep a per-thread error message
> (stored in thread-local storage).  It's a lot nicer than having to
> pass &errmsg to every function.  You can just write:
>=20
>  if (nbd_connect_tcp (nbd, "remote", "nbd") =3D=3D -1) {
>    fprintf (stderr,
>             "failed to connect to remote server: %s (errno =3D %d)\n",
>             nbd_get_error (), nbd_get_errno ());
>    exit (EXIT_FAILURE);
>  }
>=20
> (https://libguestfs.org/libnbd.3.html#ERROR-HANDLING)
>=20
> It means you can extend the range of error information available in
> future.  Also you can return a 'const char *' and the application
> doesn't have to worry about lifetimes, at least in the common case.

Thanks for sharing the idea, I think it would work well for libblkio
too.

Do you ignore the dlclose(3) memory leak?

> > Examples are available here:
> >=20
> >   https://gitlab.com/libblkio/libblkio/-/tree/v0.1.0/examples
> >=20
> > The goal is to eventually include the following drivers:
> > - Linux io_uring
> > - NVMe (VFIO and vfio-user)
> > - virtio-blk (VFIO, vfio-user, vhost-user-blk, and vhost-vdpa-blk)
> >
> > There are a few reasons why libblkio is needed:
> >=20
> > 1. QEMU, Ceph, GlusterFS, MariaDB, and other programs have been adding
> >    more low-level block I/O code, most of it duplicated. Usually only
> >    one or two of Linux AIO, io_uring, userspace drivers, vhost-user
> >    drivers, etc are implemented. This makes it difficult to benefit fro=
m
> >    the latest advances in high-performance block I/O.
> >=20
> > 2. Coding to a standard API makes it possible to introduce new
> >    optimizations or hardware interfaces without costly changes to the
> >    software stack.
> >=20
> > 3. A client library is needed so applications can take advantage of
> >    qemu-storage-daemon's vhost-user-blk exports.
> >=20
> > 4. Implementing block I/O as a library allows QEMU to use Rust for new
> >    code without messy QEMU internal API bindings. Note that libblkio
> >    currently does not provide a Rust crate, it only offers a C API.
>=20
> This is where I get confused about what this library actually does.
> It's not just a nicer wrapper around io_uring, but what is it actually
> doing?

It's a library for what QEMU calls protocol drivers (POSIX files,
userspace NVMe driver, etc). In particular, anything offering
multi-queue block I/O fits into libblkio.

It is not intended to replace libnbd or other network storage libraries.
libblkio's properties API is synchronous to keep things simple for
applications. Attaching to network storage needs to be asynchronous,
although the libblkio API could be extended if people want to support
network storage.

Stefan

--+sEp05qHXIRiJQlW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmCKxZkACgkQnKSrs4Gr
c8jCqQf+MLqXnytIy/izh9++BER5RK3A1k/9DGZBX51yWXKVTTvgM8LbRdcJpqOe
/7zFOQLkld1IxOjJCvxPeiAMDSEklRMEMBRdvtT93g8zJoEqgFVdpqU5++yTDZQY
J0Gakd/FQpmDepv8cyXJwIp9qTnqif/Z/1xYtLdcYHVjz4OgFWh6jcbCBt5Aihfx
auq0frkyWdC03Onb3LNrd+lPIyxTsr0JxK2F787HfOEQqFVVb7pXRWjjLHyj8pd+
83ib47+Drilc1skEkiU1PWLp0SsyB981N5FS8sIer5S6jovXt2gTRH8FkalWs2/r
lOllZSxipmozLJHNy409XkRPHDLc1Q==
=j+yT
-----END PGP SIGNATURE-----

--+sEp05qHXIRiJQlW--


