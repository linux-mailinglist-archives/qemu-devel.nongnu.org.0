Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F3630EFF4
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 10:50:13 +0100 (CET)
Received: from localhost ([::1]:55518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7bHA-0004rK-Sy
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 04:50:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l7bEu-0003Wh-EE
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 04:47:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l7bEr-0003Et-7C
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 04:47:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612432068;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NrJRw/GQsmp4QSSde9KHxk64U090O1fjmeDUzZpM+P8=;
 b=GIGqOTYPy0tUMbgDYNsqma8GWhBpZIZZE7+Z6yT7ahl1aAzofc+/qUkEM1GgfbbE1T0NDD
 eL3WC7ELb72UfQSpI56m08y8uvktUwfu/YIWkSOEACi6exHMR/Lg/yJLXLBxFeA57I8KJu
 XOJ6wK/njy2RX+wAVn0HDjUWobFe/4s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-487-LS88h7ByPOOIcyeQMs3kkA-1; Thu, 04 Feb 2021 04:47:46 -0500
X-MC-Unique: LS88h7ByPOOIcyeQMs3kkA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E72DD100AA2B;
 Thu,  4 Feb 2021 09:47:44 +0000 (UTC)
Received: from localhost (ovpn-115-89.ams2.redhat.com [10.36.115.89])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4E51B5D9C0;
 Thu,  4 Feb 2021 09:47:35 +0000 (UTC)
Date: Thu, 4 Feb 2021 09:47:34 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [PATCH v4 3/3] virtiofsd: prevent opening of special files
 (CVE-2020-35517)
Message-ID: <20210204094734.GC344659@stefanha-x1.localdomain>
References: <20210203113719.83633-1-stefanha@redhat.com>
 <20210203113719.83633-4-stefanha@redhat.com>
 <20210203152850.GA3307@redhat.com>
 <20210203170237.0c98f95f@bahia.lan>
 <20210203160858.GC3307@redhat.com>
 <20210203170514.GL74271@stefanha-x1.localdomain>
 <20210203211441.GH3307@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210203211441.GH3307@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="bKyqfOwhbdpXa4YI"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: mszeredi@redhat.com, Daniel Berrange <berrange@redhat.com>, slp@redhat.com,
 qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, virtio-fs@redhat.com,
 Alex Xu <alex@alxu.ca>, P J P <ppandit@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--bKyqfOwhbdpXa4YI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 03, 2021 at 04:14:41PM -0500, Vivek Goyal wrote:
> On Wed, Feb 03, 2021 at 05:05:14PM +0000, Stefan Hajnoczi wrote:
> > On Wed, Feb 03, 2021 at 11:08:58AM -0500, Vivek Goyal wrote:
> > > On Wed, Feb 03, 2021 at 05:02:37PM +0100, Greg Kurz wrote:
> > > > On Wed, 3 Feb 2021 10:28:50 -0500
> > > > Vivek Goyal <vgoyal@redhat.com> wrote:
> > > >=20
> > > > > On Wed, Feb 03, 2021 at 11:37:19AM +0000, Stefan Hajnoczi wrote:
> > > > >=20
> > > > > [..]
> > > > > > @@ -1727,36 +1764,38 @@ static void lo_create(fuse_req_t req, f=
use_ino_t parent, const char *name,
> > > > > > =20
> > > > > >      update_open_flags(lo->writeback, lo->allow_direct_io, fi);
> > > > > > =20
> > > > > > -    fd =3D openat(parent_inode->fd, name, (fi->flags | O_CREAT=
) & ~O_NOFOLLOW,
> > > > > > -                mode);
> > > > > > +    /* Try to create a new file but don't open existing files =
*/
> > > > > > +    fd =3D openat(parent_inode->fd, name, fi->flags | O_CREAT =
| O_EXCL, mode);
> > > > > >      err =3D fd =3D=3D -1 ? errno : 0;
> > > > > > +
> > > > > >      lo_restore_cred(&old);
> > > > > > =20
> > > > > > -    if (!err) {
> > > > > > -        ssize_t fh;
> > > > > > -
> > > > > > -        pthread_mutex_lock(&lo->mutex);
> > > > > > -        fh =3D lo_add_fd_mapping(lo, fd);
> > > > > > -        pthread_mutex_unlock(&lo->mutex);
> > > > > > -        if (fh =3D=3D -1) {
> > > > > > -            close(fd);
> > > > > > -            err =3D ENOMEM;
> > > > > > -            goto out;
> > > > > > -        }
> > > > > > +    /* Ignore the error if file exists and O_EXCL was not give=
n */
> > > > > > +    if (err && !(err =3D=3D EEXIST && !(fi->flags & O_EXCL))) =
{
> > > > >=20
> > > > > Can this check be simplified to.
> > > > >        if (err && (err =3D=3D EEXIST && (fi->flags & O_EXCL)) {
> > > >=20
> > > > I guess you meant :
> > > >=20
> > > >         if (err && (err !=3D EEXIST || fi->flags & O_EXCL) {
> > >=20
> > > This sounds correct. I forgot to take into account that if error is
> > > not -EEXIST, we still want to bail out irrespective of O_EXCL.
> >=20
> > I thought about De Morgan's law too but found the OR expression is not
> > easier to read than the AND expression :(. If you prefer it written thi=
s
> > way I can change it though.
>=20
> I personally find this one to read. And not because of AND but because
> of double logical negation (!x) in previous expression.
>=20
> But I am not particular about it. If you don't find it easier to
> read, I can live with previous one.

Okay, I'll convert it. Dave also mentioned he finds the AND version
strange.

Stefan

--bKyqfOwhbdpXa4YI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmAbwrYACgkQnKSrs4Gr
c8gfPggAyGK+i7L+A4oau0a74aVdaHkMYqvj5dQcZmO18mqU3e/p0tZ8rm27Qn+g
BSEQmIltXXTPcem0wc1rIWRmZpb50JgMN/VvmUIGUtCyGtOTzJgmjRNnHpgErZFC
I7PwN14ahmEe2kTAzJUlwbnAgim8Fnzf+IwqYfIld1uHJd97l2dimtesEN6O4dMY
klb1tb6h9RegnmiljxfiB5NbaGpM2UtIZ5saVWTRuupZ8zvrLDwDsT5lG7NZmOZO
JIkQJ79OPqLwh3Igq7JvS3PIMgT6E+fQOfKjju/3QBneEao6u84Bvql37brOrHrB
/X1ZbRUHj0vTMlbc4SdBHqdrkNm47A==
=NKQZ
-----END PGP SIGNATURE-----

--bKyqfOwhbdpXa4YI--


