Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 955CD402A48
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 15:58:00 +0200 (CEST)
Received: from localhost ([::1]:58736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNbbr-0004jj-Lr
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 09:57:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mNbGH-0005qH-GI
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 09:35:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46217)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mNbGE-0006lP-KS
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 09:35:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631021737;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=n9hK1Vq/sfbod2EmT7wYlEG8Mxy8pw68/dFHpqyu5ps=;
 b=BeI3Mmera5cyDckUGSBxwfclo84oqMAdGYngkxD4BCpg+NKlk9SXHneCeK41yCnqeIe9Tm
 /QNCk8yD+CBJHHcnn79ikzRLK9BU7VHg+8hdBiYc5SiDP6+oZ0WFbAAZVcGJON2GpKoZot
 +pGFLGyD1GYYk4sglQV+NqIwt3KIjTI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-438-qeu6tOp1MAqpjrEnvM33jg-1; Tue, 07 Sep 2021 09:35:34 -0400
X-MC-Unique: qeu6tOp1MAqpjrEnvM33jg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 53FDB824FAA;
 Tue,  7 Sep 2021 13:35:33 +0000 (UTC)
Received: from localhost (unknown [10.39.194.246])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 382E61972D;
 Tue,  7 Sep 2021 13:35:29 +0000 (UTC)
Date: Tue, 7 Sep 2021 14:35:28 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: John Johnson <john.g.johnson@oracle.com>
Subject: Re: [PATCH RFC v2 05/16] vfio-user: define VFIO Proxy and
 communication functions
Message-ID: <YTdqoNde8Op8qMgz@stefanha-x1.localdomain>
References: <cover.1629131628.git.elena.ufimtseva@oracle.com>
 <3d3befd308bacb7ec9f3ccd8f99e5184261279b2.1629131628.git.elena.ufimtseva@oracle.com>
 <YSUM5wB+XAd/WmM0@stefanha-x1.localdomain>
 <533AA34D-79D8-42D1-9F0C-F66B89C21722@oracle.com>
MIME-Version: 1.0
In-Reply-To: <533AA34D-79D8-42D1-9F0C-F66B89C21722@oracle.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="darBYTB8tcOVkAKb"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Jag Raman <jag.raman@oracle.com>,
 "swapnil.ingle@nutanix.com" <swapnil.ingle@nutanix.com>,
 "john.levon@nutanix.com" <john.levon@nutanix.com>,
 QEMU Devel Mailing List <qemu-devel@nongnu.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--darBYTB8tcOVkAKb
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 30, 2021 at 03:04:08AM +0000, John Johnson wrote:
>=20
>=20
> > On Aug 24, 2021, at 8:14 AM, Stefan Hajnoczi <stefanha@redhat.com> wrot=
e:
> >=20
> > On Mon, Aug 16, 2021 at 09:42:38AM -0700, Elena Ufimtseva wrote:
> >> @@ -62,5 +65,10 @@ typedef struct VFIOProxy {
> >>=20
> >> VFIOProxy *vfio_user_connect_dev(SocketAddress *addr, Error **errp);
> >> void vfio_user_disconnect(VFIOProxy *proxy);
> >> +void vfio_user_set_reqhandler(VFIODevice *vbasdev,
> >=20
> > "vbasedev" for consistency?
> >=20
>=20
> =09OK
>=20
> >> +                              int (*handler)(void *opaque, char *buf,
> >> +                                             VFIOUserFDs *fds),
> >> +                                             void *reqarg);
> >=20
> > The handler callback is undocumented. What context does it run in, what
> > do the arguments mean, and what should the function return? Please
> > document it so it's easy for others to modify this code in the future
> > without reverse-engineering the assumptions behind it.
> >=20
>=20
> =09OK
>=20
>=20
> >> +void vfio_user_recv(void *opaque)
> >> +{
> >> +    VFIODevice *vbasedev =3D opaque;
> >> +    VFIOProxy *proxy =3D vbasedev->proxy;
> >> +    VFIOUserReply *reply =3D NULL;
> >> +    g_autofree int *fdp =3D NULL;
> >> +    VFIOUserFDs reqfds =3D { 0, 0, fdp };
> >> +    VFIOUserHdr msg;
> >> +    struct iovec iov =3D {
> >> +        .iov_base =3D &msg,
> >> +        .iov_len =3D sizeof(msg),
> >> +    };
> >> +    bool isreply;
> >> +    int i, ret;
> >> +    size_t msgleft, numfds =3D 0;
> >> +    char *data =3D NULL;
> >> +    g_autofree char *buf =3D NULL;
> >> +    Error *local_err =3D NULL;
> >> +
> >> +    qemu_mutex_lock(&proxy->lock);
> >> +    if (proxy->state =3D=3D VFIO_PROXY_CLOSING) {
> >> +        qemu_mutex_unlock(&proxy->lock);
> >> +        return;
> >> +    }
> >> +
> >> +    ret =3D qio_channel_readv_full(proxy->ioc, &iov, 1, &fdp, &numfds=
,
> >> +                                 &local_err);
> >=20
> > This is a blocking call. My understanding is that the IOThread is share=
d
> > by all vfio-user devices, so other devices will have to wait if one of
> > them is acting up (e.g. the device emulation process sent less than
> > sizeof(msg) bytes).
> >=20
> > While we're blocked in this function the proxy device cannot be
> > hot-removed since proxy->lock is held.
> >=20
> > It would more robust to use of the event loop to avoid blocking. There
> > could be a per-connection receiver coroutine that calls
> > qio_channel_readv_full_all_eof() (it yields the coroutine if reading
> > would block).
> >=20
>=20
> =09I thought the main loop uses BQL, which I don=E2=80=99t need for most
> message processing.  The blocking behavior can be fixed with FIONREAD
> beforehand to detect a message with fewer bytes than in a header.

It's I/O-bound work, exactly what the main loop was intended for.

I'm not sure the BQL can be avoided anyway:
- The vfio-user client runs under the BQL (a vCPU thread).
- The vfio-user server needs to hold the BQL since most QEMU device
  models assume they are running under the BQL.

The network communication code doesn't need to know about the BQL
though. Event-driven code (code that runs in an AioContext) can rely on
the fact that its callbacks only execute in the AioContext, i.e. in one
thread at any given time.

The code probably doesn't need explicit BQL lock/unlock and can run
safely in another IOThread if the user wishes (I would leave that up to
the user, e.g. -device vfio-user-pci,iothread=3Diothread0, instead of
creating a dedicated IOThread that is shared for all vfio-user
communication). See nbd/server.c for an example of doing event-driven
network I/O with coroutines.

Stefan

--darBYTB8tcOVkAKb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmE3aqAACgkQnKSrs4Gr
c8jftwf6Ajv+CLA7d0vqSQ2r7zYyuB0WgVSnsWWGGoykxMeFSH9LaRCUPYkMty6p
1RaiWhCfZi2dO0FcoV3gkb15l5HblBgpeuW3Tf2SfpTE+RssxbU3vG1ZB+3W/GVU
0ZJB34wWbjNlEiKqg/FGgqnyeY0mxsMQJLJNBRIalaa6rqfUw6pRcZ2L0DZZW0IE
H3axEZAVeAuisnNPs16Ma+W/rxH/bDoR1EAQ7GYNvcBhTJneNiIYhHaje6AyFsWS
DlfOy0ZR17PPK4rR0XngcAvhTnLZ0k4V4f6JZjBWcUEOWCpElTUCnbxsOUKmsqJy
DhzvxxqkJpsZ2siEbS/dmhF+mkWcIw==
=efq1
-----END PGP SIGNATURE-----

--darBYTB8tcOVkAKb--


