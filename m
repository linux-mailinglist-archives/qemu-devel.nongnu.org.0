Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D6A8333B67
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 12:29:50 +0100 (CET)
Received: from localhost ([::1]:41516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJx2D-0002jX-Ge
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 06:29:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lJx07-0001ll-QS
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 06:27:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:20241)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lJx03-0001rv-H9
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 06:27:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615375652;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=paw8U0tutoBFuUP4kNiheO8Su6pFRov/I48Q3Z00Tkc=;
 b=Sw3YbU9Tzr2FArMWLWQnzIpBpk7o7JqrG64HPBsWE2v9Go1BxwpOZfwpjQENkuagtaRMl+
 6iC6irQ3gfTVbeGAb3zRUvwDqDqi+QX4PHgxMS13voV+f+9R7NlJrcgqfnrMYGHqxmiQ8Q
 /qqJCOiopQKYG2x1ZppNR0B+yUun7/A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-290-RJ5PgvZKPVu8UHschc9SFg-1; Wed, 10 Mar 2021 06:27:28 -0500
X-MC-Unique: RJ5PgvZKPVu8UHschc9SFg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BE49810866A9;
 Wed, 10 Mar 2021 11:27:27 +0000 (UTC)
Received: from localhost (ovpn-114-250.ams2.redhat.com [10.36.114.250])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F2F8B5945E;
 Wed, 10 Mar 2021 11:27:17 +0000 (UTC)
Date: Wed, 10 Mar 2021 11:27:16 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH 2/4] vhost-user: Convert slave channel to QIOChannelSocket
Message-ID: <YEitFGfB3SnG5Y+x@stefanha-x1.localdomain>
References: <20210308123141.26444-1-groug@kaod.org>
 <20210308123141.26444-3-groug@kaod.org>
 <YEeRgY2WEFSw+1qG@stefanha-x1.localdomain>
 <20210309212322.3ab5809d@bahia.lan>
MIME-Version: 1.0
In-Reply-To: <20210309212322.3ab5809d@bahia.lan>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="e50NnACVf93bpZ5z"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Vivek Goyal <vgoyal@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--e50NnACVf93bpZ5z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 09, 2021 at 09:23:22PM +0100, Greg Kurz wrote:
> On Tue, 9 Mar 2021 15:17:21 +0000
> Stefan Hajnoczi <stefanha@redhat.com> wrote:
>=20
> > On Mon, Mar 08, 2021 at 01:31:39PM +0100, Greg Kurz wrote:
> > > +    g_autofree int *fd =3D NULL;
> > > +    size_t fdsize =3D 0;
> > > +    int i;
> > > =20
> > >      /* Read header */
> > >      iov.iov_base =3D &hdr;
> > >      iov.iov_len =3D VHOST_USER_HDR_SIZE;
> > > =20
> > >      do {
> > > -        size =3D recvmsg(u->slave_fd, &msgh, 0);
> > > -    } while (size < 0 && (errno =3D=3D EINTR || errno =3D=3D EAGAIN)=
);
> > > +        size =3D qio_channel_readv_full(ioc, &iov, 1, &fd, &fdsize, =
NULL);
> > > +    } while (size =3D=3D QIO_CHANNEL_ERR_BLOCK);
> >=20
> > Is it possible to leak file descriptors and fd[] memory if we receive a
> > short message and then loop around? qio_channel_readv_full() will
> > overwrite &fd and that's how the leak occurs.
> >=20
>=20
> qio_channel_readv_full() only returns QIO_CHANNEL_ERR_BLOCK when the
> channel is non-blocking mode and no data is available. Under the hood,
> this translates to this code in qio_channel_socket_readv():
>=20
>  retry:
>     ret =3D recvmsg(sioc->fd, &msg, sflags);
>     if (ret < 0) {
>         if (errno =3D=3D EAGAIN) {
>             return QIO_CHANNEL_ERR_BLOCK;
>         }
>         if (errno =3D=3D EINTR) {
>             goto retry;
>         }
>=20
>         error_setg_errno(errp, errno,
>                          "Unable to read from socket");
>         return -1;
>     }
>=20
> This is strictly equivalent to what we currently have. This cannot
> leak file descriptors because we would only loop until the first
> byte of real data is available and ancillary data cannot fly without
> real data, i.e. no file descriptors when recvmsg() returns EAGAIN.
>=20
> > On the other hand, it looks like ioc is in blocking mode. I'm not sure
> > QIO_CHANNEL_ERR_BLOCK can occur?
> >=20
>=20
> You're right but the existing code is ready to handle the non-blocking
> case, so I just kept this behavior.

I'm confused by this tentative non-blocking support because if we set
the fd to non-blocking, then qio_channel_readv_full() can return less
than size bytes (a short read) and that will cause a failure:

  if (size !=3D VHOST_USER_HDR_SIZE) {
      error_report("Failed to read from slave.");
      goto err;
  }

So although the while QIO_CHANNEL_ERR_BLOCK loop suggests the code
supports non-blocking, it doesn't really support it :).

I think it would be clearer to remove the while QIO_CHANNEL_ERR_BLOCK
loop. However, this is not directly related to the bug that this series
fixes, so if you prefer to keep it, feel free.

--e50NnACVf93bpZ5z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmBIrRQACgkQnKSrs4Gr
c8iLQAf8DR+nOc1xVktI4UbQkwBXW/eC6CyKxr2wF+i5LDkODI2GQ40RrG1rIax7
Xj+X4NXXsiyCBNaf/n9VrLi7jedzVQr3Udyni+YJv18XCYI5DbOBi8IuSWqfCcI+
QYTB2TJGZ7UNi2DyOeVfX64CXr+E0WXH6iYfm4UotNa/8b0LprVpSggKWM4xkOwn
xlQGsJGuhKaujhsOho/IKq5UGhHiLTTJQMeBbHnedgyBKQcs0iJe6U7WK89L7BY6
S+KRvCBNd7OWMi3JoiES/jzqsmh2nAiTDEdS9THmoYlmXJB7HbO7K8sBBXIgMmcY
tkYx3z2byz57aqkEX+c7u1x5jIaCSw==
=lHvw
-----END PGP SIGNATURE-----

--e50NnACVf93bpZ5z--


