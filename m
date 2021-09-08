Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBDC2403C40
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 17:04:00 +0200 (CEST)
Received: from localhost ([::1]:59006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNz7H-00046H-C4
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 11:03:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mNz5v-0003Jd-KP
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 11:02:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48435)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mNz5s-0001Cw-Uf
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 11:02:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631113350;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mCC3JkEkPR2CArHSprk5N6TmGV99kHNE4A7prEB4e98=;
 b=YofEOf2PohmR6rF33q+GIR7V9WuGSzqmyUbOoORY0w+YgBv2C3bpi0CRE2UtkA1b4P5dBW
 N10I0m9yWjRguZuqg26dp7j5zIRsZ7x1tTrSWP34KUdAmcy8AChqTe2ZP8bIGI0nGx4fRd
 hO7BkUFbxAUa1o8KbwzP/r7zX3et0Z0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-437-npYUt6UvN8Gocl3LaVG5tA-1; Wed, 08 Sep 2021 11:02:29 -0400
X-MC-Unique: npYUt6UvN8Gocl3LaVG5tA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AFCD5824FA9;
 Wed,  8 Sep 2021 15:02:27 +0000 (UTC)
Received: from localhost (unknown [10.39.194.211])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 33E1810016FE;
 Wed,  8 Sep 2021 15:02:23 +0000 (UTC)
Date: Wed, 8 Sep 2021 16:02:22 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: John Levon <john.levon@nutanix.com>
Subject: Re: [PATCH RFC server v2 05/11] vfio-user: run vfio-user context
Message-ID: <YTjQfvz6PmpFH/QL@stefanha-x1.localdomain>
References: <cover.1629131628.git.elena.ufimtseva@oracle.com>
 <cover.1630084211.git.jag.raman@oracle.com>
 <3c043becf2b6e820f5392e0cadb465d5d9b9e6f8.1630084211.git.jag.raman@oracle.com>
 <YTizhs1m7EsAs9UG@stefanha-x1.localdomain>
 <YTi8sYZkET5tffj/@movementarian.org>
MIME-Version: 1.0
In-Reply-To: <YTi8sYZkET5tffj/@movementarian.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="KsXh8+Mb2nb0h3Z7"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "elena.ufimtseva@oracle.com" <elena.ufimtseva@oracle.com>,
 "john.g.johnson@oracle.com" <john.g.johnson@oracle.com>,
 "thuth@redhat.com" <thuth@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 Swapnil Ingle <swapnil.ingle@nutanix.com>,
 "philmd@redhat.com" <philmd@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "marcandre.lureau@gmail.com" <marcandre.lureau@gmail.com>,
 Thanos Makatos <thanos.makatos@nutanix.com>,
 "alex.bennee@linaro.org" <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--KsXh8+Mb2nb0h3Z7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 08, 2021 at 01:37:53PM +0000, John Levon wrote:
> On Wed, Sep 08, 2021 at 01:58:46PM +0100, Stefan Hajnoczi wrote:
>=20
> > > +static void *vfu_object_attach_ctx(void *opaque)
> > > +{
> > > +    VfuObject *o =3D opaque;
> > > +    int ret;
> > > +
> > > +retry_attach:
> > > +    ret =3D vfu_attach_ctx(o->vfu_ctx);
> > > +    if (ret < 0 && (errno =3D=3D EAGAIN || errno =3D=3D EWOULDBLOCK)=
) {
> >=20
> > Does this loop consume 100% CPU since this is non-blocking?
>=20
> Looks like it. Instead after vfu_create_ctx, there should be a vfu_get_po=
ll_fd()
> to get the listen socket, then a qemu_set_fd_handler(vfu_object_attach_ct=
x)
> to handle the attach when the listen socket is ready, modulo the below pa=
rt.
>=20
> > libvfio-user has non-blocking listen_fd but conn_fd is always blocking.
>=20
> It is, but in vfu_run_ctx(), we poll on it:
>=20
> ```
> 790     if (vfu_ctx->flags & LIBVFIO_USER_FLAG_ATTACH_NB) {              =
           =20
> 791         sock_flags =3D MSG_DONTWAIT | MSG_WAITALL;                   =
             =20
> 792     }                                                                =
           =20
> 793     return get_msg(hdr, sizeof(*hdr), fds, nr_fds, ts->conn_fd, sock_=
flags);    =20
> ```

This is only used for the request header. Other I/O is blocking.

>=20
> > This means ATTACH_NB is not useful because vfu_attach_ctx() is actually
> > blocking.
>=20
> You're correct that vfu_attach_ctx is in fact partially blocking: after
> accepting the connection, we call negotiate(), which can indeed block wai=
ting if
> the client hasn't sent anything.
>=20
> > I think this means vfu_run_ctx() is also blocking in some places
>=20
> Correct. There's a presumption that if a message is ready, we can read it=
 all
> without blocking, and equally that we can write to the socket without blo=
cking.
>=20
> The library docs are not at all clear on this point.
>=20
> > and QEMU's event loop might hang :(
> >=20
> > Can you make libvfio-user non-blocking in order to solve these issues?
>=20
> I presume you're concerned about the security aspect: a malicious client =
could
> withhold a write, and hence hang the device server.
>=20
> Problem is the libvfio-user API is synchronous: there's no way to return
> half-way through a vfu_attach_ctx() (or a vfu_run_ctx() after we read the
> header) then resume.
>=20
> We'd have to have a whole separate API to do that, so a separate thread s=
eems a
> better approach?

Whether to support non-blocking properly in libvfio-user is a decision
for you. If libvfio-user doesn't support non-blocking, then QEMU should
run a dedicated thread instead of the partially non-blocking approach in
this patch.

A non-blocking approach is nice when there are many devices hosted in a
single process or a lot of async replies (which requires extra thread
synchronization with the blocking approach).

Stefan

--KsXh8+Mb2nb0h3Z7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmE40H0ACgkQnKSrs4Gr
c8hs8ggAjeHI/lPas4AOI8E+jnya/pGHAutbk2whXgRXCRgdm1SbjrSwLnV7qwL3
zzvWoRyz7GUlcIpHfTV0ez1B2+jl9BOhKoijaTXXtXDEY+qQN0f+rLvg+iB50Y0f
tFOnWzJjFRhWIOOijS3WDbbdqWl17+uwgTx5rsqHyjVzTyuMuGsT8M7umbBxoUua
X0VPMwi5qV5dmJs/liDNZu+aqnjdvPgMfjV7xZM7EsItw8/Yw5N72dNLfc5eF47Z
2PL8l2MrZyxudySxzXS0MbNvBwQAwCVhsVNixmU1uwmM5nDj0Y+JE3+IaarKwF8m
9bJ1tWzr7BGlVaJc6q0YY51zNTfwCg==
=xbk8
-----END PGP SIGNATURE-----

--KsXh8+Mb2nb0h3Z7--


