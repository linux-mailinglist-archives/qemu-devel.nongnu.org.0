Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4063333D50
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 14:09:03 +0100 (CET)
Received: from localhost ([::1]:45824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJyaE-000511-Qe
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 08:09:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lJyZU-0004aq-V6
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 08:08:16 -0500
Received: from 3.mo51.mail-out.ovh.net ([188.165.32.156]:48447)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lJyZS-0003s9-L0
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 08:08:16 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.216])
 by mo51.mail-out.ovh.net (Postfix) with ESMTPS id 8519F2700F4;
 Wed, 10 Mar 2021 14:08:06 +0100 (CET)
Received: from kaod.org (37.59.142.102) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Wed, 10 Mar
 2021 14:08:05 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-102R0040a994c4f-91da-4a88-89ca-4e715cf4bc96,
 E3A1B1521FC7554C2CCDA0AC48C2D83995993578) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Wed, 10 Mar 2021 14:08:04 +0100
From: Greg Kurz <groug@kaod.org>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH 2/4] vhost-user: Convert slave channel to QIOChannelSocket
Message-ID: <20210310140804.7fc6dce0@bahia.lan>
In-Reply-To: <YEitFGfB3SnG5Y+x@stefanha-x1.localdomain>
References: <20210308123141.26444-1-groug@kaod.org>
 <20210308123141.26444-3-groug@kaod.org>
 <YEeRgY2WEFSw+1qG@stefanha-x1.localdomain>
 <20210309212322.3ab5809d@bahia.lan>
 <YEitFGfB3SnG5Y+x@stefanha-x1.localdomain>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/8O5w2/IoXOW7vNEO63w3vz+";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Originating-IP: [37.59.142.102]
X-ClientProxiedBy: DAG4EX2.mxp5.local (172.16.2.32) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: 1661770c-b403-4404-9980-32d2cbfb4704
X-Ovh-Tracer-Id: 14174235405912152483
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledruddukedggeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtihesghdtreerredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnheplefggfefueegudegkeevieevveejfffhuddvgeffteekieevueefgfeltdfgieetnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopehmshhtsehrvgguhhgrthdrtghomh
Received-SPF: pass client-ip=188.165.32.156; envelope-from=groug@kaod.org;
 helo=3.mo51.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
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
 Vivek Goyal <vgoyal@redhat.com>, "Dr. David Alan
 Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/8O5w2/IoXOW7vNEO63w3vz+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 10 Mar 2021 11:27:16 +0000
Stefan Hajnoczi <stefanha@redhat.com> wrote:

> On Tue, Mar 09, 2021 at 09:23:22PM +0100, Greg Kurz wrote:
> > On Tue, 9 Mar 2021 15:17:21 +0000
> > Stefan Hajnoczi <stefanha@redhat.com> wrote:
> >=20
> > > On Mon, Mar 08, 2021 at 01:31:39PM +0100, Greg Kurz wrote:
> > > > +    g_autofree int *fd =3D NULL;
> > > > +    size_t fdsize =3D 0;
> > > > +    int i;
> > > > =20
> > > >      /* Read header */
> > > >      iov.iov_base =3D &hdr;
> > > >      iov.iov_len =3D VHOST_USER_HDR_SIZE;
> > > > =20
> > > >      do {
> > > > -        size =3D recvmsg(u->slave_fd, &msgh, 0);
> > > > -    } while (size < 0 && (errno =3D=3D EINTR || errno =3D=3D EAGAI=
N));
> > > > +        size =3D qio_channel_readv_full(ioc, &iov, 1, &fd, &fdsize=
, NULL);
> > > > +    } while (size =3D=3D QIO_CHANNEL_ERR_BLOCK);
> > >=20
> > > Is it possible to leak file descriptors and fd[] memory if we receive=
 a
> > > short message and then loop around? qio_channel_readv_full() will
> > > overwrite &fd and that's how the leak occurs.
> > >=20
> >=20
> > qio_channel_readv_full() only returns QIO_CHANNEL_ERR_BLOCK when the
> > channel is non-blocking mode and no data is available. Under the hood,
> > this translates to this code in qio_channel_socket_readv():
> >=20
> >  retry:
> >     ret =3D recvmsg(sioc->fd, &msg, sflags);
> >     if (ret < 0) {
> >         if (errno =3D=3D EAGAIN) {
> >             return QIO_CHANNEL_ERR_BLOCK;
> >         }
> >         if (errno =3D=3D EINTR) {
> >             goto retry;
> >         }
> >=20
> >         error_setg_errno(errp, errno,
> >                          "Unable to read from socket");
> >         return -1;
> >     }
> >=20
> > This is strictly equivalent to what we currently have. This cannot
> > leak file descriptors because we would only loop until the first
> > byte of real data is available and ancillary data cannot fly without
> > real data, i.e. no file descriptors when recvmsg() returns EAGAIN.
> >=20
> > > On the other hand, it looks like ioc is in blocking mode. I'm not sure
> > > QIO_CHANNEL_ERR_BLOCK can occur?
> > >=20
> >=20
> > You're right but the existing code is ready to handle the non-blocking
> > case, so I just kept this behavior.
>=20
> I'm confused by this tentative non-blocking support because if we set
> the fd to non-blocking, then qio_channel_readv_full() can return less
> than size bytes (a short read) and that will cause a failure:
>=20
>   if (size !=3D VHOST_USER_HDR_SIZE) {
>       error_report("Failed to read from slave.");
>       goto err;
>   }
>=20
> So although the while QIO_CHANNEL_ERR_BLOCK loop suggests the code
> supports non-blocking, it doesn't really support it :).
>=20

Yeah I agree. These EAGAIN checks that we have today are really
misleading. I'll get rid of them in a preliminary patch to
reduce the noise on the slave channel conversion.

> I think it would be clearer to remove the while QIO_CHANNEL_ERR_BLOCK
> loop. However, this is not directly related to the bug that this series
> fixes, so if you prefer to keep it, feel free.


--Sig_/8O5w2/IoXOW7vNEO63w3vz+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEtIKLr5QxQM7yo0kQcdTV5YIvc9YFAmBIxLQACgkQcdTV5YIv
c9ZWUhAAoy+5VWqSwJzKz6jxq9t+k7HnvyVDj3quLE/J2IahYoGmSTuXzyZtLfo3
b2tKCHP769FEUUg/cNZwkXGcdSfGv2XBYtTPSvKmurke3vYIm0mF4BoCd9uUCCUZ
1V3iCOVwB0ksrNMJj1OsdTEqvoGRvHsHSOTY4Ki50u92Kf9bo90FXVIZLEG5YpK0
p1/SB3RmB+XB2MEMdC2vfBAOzR9x8jTuSTY+MvwNv78PWe68yzX1DOzUyXFiOCZA
D3Z+iIswmpGddaSHi+TEsyPT5p6U/GPeB5MCcQ6lgQek74S8aZnRs/YeJfFTPBUL
V8FJ1QJGCiNXnP6BpYHEh16Ekm2QAMYCv0DoLC/AueVpwqueXr1Mr1Z5F0xd+PWn
3TtOf8oARQFa1Y3lut56LV1qg9FUsxAkUfQI5KuDrjMAAvRkjGW/zRcIDdrhJ0bO
2kZaa1kvdprHTFAERzSapPDeXcJuIiT/4Fqodq3up2Irt7ShbQhwcseFW0hzsQ8R
aTzOJNkHOVN/BjDiVsd2/yp/f3axliY3CninmKYWyoKdZ1owbvhdKhFkreRJ7XYl
stbfumkbLBBeGQyZrOueg9y895BsLWOJHHr9bYlqhgzwmn1fEFIjL5KGkVI/9Dam
QfCWznJmX3mtLf1YK8CKsfgtrH1RLP/n0F3KVKxBxaKlh/q48fA=
=+OAB
-----END PGP SIGNATURE-----

--Sig_/8O5w2/IoXOW7vNEO63w3vz+--

