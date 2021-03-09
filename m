Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2394B33303A
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 21:49:51 +0100 (CET)
Received: from localhost ([::1]:41774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJjIc-0000y7-2c
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 15:49:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lJit7-0006wt-9f
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 15:23:29 -0500
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:36703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lJit5-00071Q-3I
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 15:23:29 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.131])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 38FBA8E30CA8;
 Tue,  9 Mar 2021 21:23:24 +0100 (CET)
Received: from kaod.org (37.59.142.103) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Tue, 9 Mar 2021
 21:23:23 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G0051093ead2-4a4a-41b1-b43a-baaf0659273d,
 5BB0FC21D60CBA87691D752E0F3295FDC8BC83A3) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Tue, 9 Mar 2021 21:23:22 +0100
From: Greg Kurz <groug@kaod.org>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH 2/4] vhost-user: Convert slave channel to QIOChannelSocket
Message-ID: <20210309212322.3ab5809d@bahia.lan>
In-Reply-To: <YEeRgY2WEFSw+1qG@stefanha-x1.localdomain>
References: <20210308123141.26444-1-groug@kaod.org>
 <20210308123141.26444-3-groug@kaod.org>
 <YEeRgY2WEFSw+1qG@stefanha-x1.localdomain>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/E.nVSgS9TZmf6UQtw+aAYAZ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG6EX2.mxp5.local (172.16.2.52) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: 5873f034-e884-4e4d-8381-6df592ec13a6
X-Ovh-Tracer-Id: 15653386405321546147
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrudduiedgudefiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkjghfofggtghisehgtderreertddvnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeelgffgfeeugedugeekveeiveevjeffhfduvdegffetkeeiveeufefgledtgfeiteenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtohepmhhsthesrhgvughhrghtrdgtohhm
Received-SPF: pass client-ip=178.32.125.2; envelope-from=groug@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Vivek Goyal <vgoyal@redhat.com>, "Dr. David Alan
 Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/E.nVSgS9TZmf6UQtw+aAYAZ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 9 Mar 2021 15:17:21 +0000
Stefan Hajnoczi <stefanha@redhat.com> wrote:

> On Mon, Mar 08, 2021 at 01:31:39PM +0100, Greg Kurz wrote:
> > +    g_autofree int *fd =3D NULL;
> > +    size_t fdsize =3D 0;
> > +    int i;
> > =20
> >      /* Read header */
> >      iov.iov_base =3D &hdr;
> >      iov.iov_len =3D VHOST_USER_HDR_SIZE;
> > =20
> >      do {
> > -        size =3D recvmsg(u->slave_fd, &msgh, 0);
> > -    } while (size < 0 && (errno =3D=3D EINTR || errno =3D=3D EAGAIN));
> > +        size =3D qio_channel_readv_full(ioc, &iov, 1, &fd, &fdsize, NU=
LL);
> > +    } while (size =3D=3D QIO_CHANNEL_ERR_BLOCK);
>=20
> Is it possible to leak file descriptors and fd[] memory if we receive a
> short message and then loop around? qio_channel_readv_full() will
> overwrite &fd and that's how the leak occurs.
>=20

qio_channel_readv_full() only returns QIO_CHANNEL_ERR_BLOCK when the
channel is non-blocking mode and no data is available. Under the hood,
this translates to this code in qio_channel_socket_readv():

 retry:
    ret =3D recvmsg(sioc->fd, &msg, sflags);
    if (ret < 0) {
        if (errno =3D=3D EAGAIN) {
            return QIO_CHANNEL_ERR_BLOCK;
        }
        if (errno =3D=3D EINTR) {
            goto retry;
        }

        error_setg_errno(errp, errno,
                         "Unable to read from socket");
        return -1;
    }

This is strictly equivalent to what we currently have. This cannot
leak file descriptors because we would only loop until the first
byte of real data is available and ancillary data cannot fly without
real data, i.e. no file descriptors when recvmsg() returns EAGAIN.

> On the other hand, it looks like ioc is in blocking mode. I'm not sure
> QIO_CHANNEL_ERR_BLOCK can occur?
>=20

You're right but the existing code is ready to handle the non-blocking
case, so I just kept this behavior.

> > @@ -1500,8 +1479,8 @@ static void slave_read(void *opaque)
> > =20
> >      /* Read payload */
> >      do {
> > -        size =3D read(u->slave_fd, &payload, hdr.size);
> > -    } while (size < 0 && (errno =3D=3D EINTR || errno =3D=3D EAGAIN));
> > +        size =3D qio_channel_read(ioc, (char *) &payload, hdr.size, NU=
LL);
> > +    } while (size =3D=3D QIO_CHANNEL_ERR_BLOCK);
>=20
> Same question here.

This also ends up in qio_channel_socket_readv().

--Sig_/E.nVSgS9TZmf6UQtw+aAYAZ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEtIKLr5QxQM7yo0kQcdTV5YIvc9YFAmBH2ToACgkQcdTV5YIv
c9YoKQ/+I7T7wd83mz5r2gEUKwtYTvbAdXc6WBVtT+85AlCfsq6arVBx/s29GaJn
AsEQnKDPxafqDMjPmhAJKYfS4ifssNjOEpRo6cCEm/CNyTdPDfBy5iqkJ9rctiYt
7BHzaYc8Gk7YFOuPI1uKwUEKXQFcfJn38qvyo7QvCi5npJ9QumUVSbAl0SMzpEPR
2E8sQb829abjGq/dyMsDNDx/wyPYn4i+8jKUW5lv2b3F96pU6nVJ3AzDYoxhL14V
A7M3jYZ3Hkm0JU0s5zrrxgv9sxyA3PZkt2noRA9a9yBWgsnFC3pAktQ0azPLxbfT
xqW9RvUVtB3D/i1EGRnilslpgXXJSlxrbOY70J7F5UU+gJ1KomD0VbqYrtAGoTUd
egWAI+2FPiRXeL2KBIqMH3hyDzk6pbhS94PT/0meqL1Ix586MEHliEXTrFI0Mcgd
l4rKazlxUvY+nXhXBdpsosLTFdWl56ZxcWFBPqL5Bz2HNpmO+Rz1NdAN9vtElsfM
zwoGHqLIc7EHqnx+ZCvBUyIvc4J2PVyPAkgiEeDkznBt8dCHK3lDrn51/GlYFJL8
o7NWOMvZwEJKfdbVSAF8vbfwKixpUrERCYcc41p6+q0FywErhd2ulNKdsVAd11IW
GUJgfc72pkBW57J6dgpJX6byRNaT8Ze+g0zUHHmMemdsaA57c7s=
=6En1
-----END PGP SIGNATURE-----

--Sig_/E.nVSgS9TZmf6UQtw+aAYAZ--

