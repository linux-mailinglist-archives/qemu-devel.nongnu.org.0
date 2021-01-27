Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D6E305F80
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 16:26:00 +0100 (CET)
Received: from localhost ([::1]:40482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4mhj-0004DQ-9q
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 10:25:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1l4mfa-0003IP-0Z
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 10:23:46 -0500
Received: from smtpout1.mo804.mail-out.ovh.net ([79.137.123.220]:45093)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1l4mfY-0007J7-2M
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 10:23:45 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.54])
 by mo804.mail-out.ovh.net (Postfix) with ESMTPS id 1F32A866DC02;
 Wed, 27 Jan 2021 16:23:40 +0100 (CET)
Received: from kaod.org (37.59.142.106) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Wed, 27 Jan
 2021 16:23:39 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R006d544f7db-db53-43fe-b321-2eebbfee1faf,
 E0AEAA2FFBCC539F7495E66DC8DC75F2C85CA1F9) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Wed, 27 Jan 2021 16:23:32 +0100
From: Greg Kurz <groug@kaod.org>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v3] virtiofsd: prevent opening of special files
 (CVE-2020-35517)
Message-ID: <20210127162332.272e5a95@bahia.lan>
In-Reply-To: <20210127141430.GA310142@stefanha-x1.localdomain>
References: <20210127112131.308451-1-stefanha@redhat.com>
 <CAOssrKfY7zDOH3NNbtyARHMCdJJN1tKQJri8ec=igjBf=K6Dog@mail.gmail.com>
 <20210127141430.GA310142@stefanha-x1.localdomain>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/HxQ/_/v7VufMnR3yXz6fS.6";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: 856e98f9-5e83-49c3-ae01-a99c0c546ad9
X-Ovh-Tracer-Id: 9618281430619363829
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrvdekgdejgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkjghfofggtghisehgtderreertddvnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeelgffgfeeugedugeekveeiveevjeffhfduvdegffetkeeiveeufefgledtgfeiteenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtoheprghlvgigsegrlhiguhdrtggr
Received-SPF: pass client-ip=79.137.123.220; envelope-from=groug@kaod.org;
 helo=smtpout1.mo804.mail-out.ovh.net
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
Cc: Miklos Szeredi <mszeredi@redhat.com>, Daniel Berrange <berrange@redhat.com>,
 Sergio
 Lopez Pascual <slp@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 virtio-fs-list <virtio-fs@redhat.com>, Alex Xu <alex@alxu.ca>,
 P J P <ppandit@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 Vivek Goyal <vgoyal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/HxQ/_/v7VufMnR3yXz6fS.6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 27 Jan 2021 14:14:30 +0000
Stefan Hajnoczi <stefanha@redhat.com> wrote:

> On Wed, Jan 27, 2021 at 02:01:54PM +0100, Miklos Szeredi wrote:
> > On Wed, Jan 27, 2021 at 12:21 PM Stefan Hajnoczi <stefanha@redhat.com> =
wrote:
> >               }
> > > @@ -1654,9 +1677,11 @@ static void update_open_flags(int writeback, i=
nt allow_direct_io,
> > >  static void lo_create(fuse_req_t req, fuse_ino_t parent, const char =
*name,
> > >                        mode_t mode, struct fuse_file_info *fi)
> > >  {
> > > +    int open_flags =3D (fi->flags | O_CREAT) & ~O_NOFOLLOW;
> > >      int fd;
> > >      struct lo_data *lo =3D lo_data(req);
> > >      struct lo_inode *parent_inode;
> > > +    struct lo_inode *existing_inode =3D NULL;
> > >      struct fuse_entry_param e;
> > >      int err;
> > >      struct lo_cred old =3D {};
> > > @@ -1682,11 +1707,23 @@ static void lo_create(fuse_req_t req, fuse_in=
o_t parent, const char *name,
> > >
> > >      update_open_flags(lo->writeback, lo->allow_direct_io, fi);
> > >
> > > -    fd =3D openat(parent_inode->fd, name, (fi->flags | O_CREAT) & ~O=
_NOFOLLOW,
> > > -                mode);
> > > +    /* First, try to create a new file but don't open existing files=
 */
> > > +    fd =3D openat(parent_inode->fd, name, open_flags | O_EXCL, mode);
> > >      err =3D fd =3D=3D -1 ? errno : 0;
> > > +
> > >      lo_restore_cred(&old);
> > >
> > > +    /* Second, open existing files if O_EXCL was not specified */
> > > +    if (err =3D=3D EEXIST && !(fi->flags & O_EXCL)) {
> > > +        existing_inode =3D lookup_name(req, parent, name);
> > > +        if (existing_inode) {
> > > +            fd =3D lo_inode_open(lo, existing_inode, open_flags);
> > > +            if (fd < 0) {
> > > +                err =3D -fd;
> > > +            }
> > > +        }
> > > +    }
> > > +
> > >      if (!err) {
> > >          ssize_t fh;
> >=20
> > It's more of a mess than I thought.
> >=20
> > The problem here is there can also be a race between the open and the
> > subsequent lo_do_lookup().
> >=20
> > At this point it's probably enough to verify that fuse_entry_param
> > refers to the same object as the fh (using fstat and comparing st_dev
> > and st_ino).
>=20
> Can you describe the race in detail? FUSE_CREATE vs FUSE_OPEN?
> FUSE_CREATE vs FUSE_CREATE?
>=20
> > Also O_CREAT open is not supposed to return ENOENT, so failure to open
> > without O_CREAT (race between O_CREAT open and plain open) should at
> > least translate error to ESTALE or EIO.
>=20
> Thanks, will fix.
>=20

Please wait, as explained in another mail, ENOENT can happen with
O_CREAT and guest userspace should be ready to handle it.

> Sstefan


--Sig_/HxQ/_/v7VufMnR3yXz6fS.6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEtIKLr5QxQM7yo0kQcdTV5YIvc9YFAmARhXUACgkQcdTV5YIv
c9akYRAAlybyFVdX0KgMb7bbqFLOfJ/NeuaF5WXAOvhaf/n7jY2SjWyUOIrckJIm
9twEGK4PKlOXeCIHn8471uUdKoynPbbsiq7CiW//rXfE7FToV9zLa8PjFzh+mbd7
x1mEg3dkBn7eVyTypeALlOHEbAVlpaaUnw2b+rPi8bW/DJNlhuikfHkTRcs/DyGi
RgyAcoYXt09fYDAX0svYb9pigBZD+ihq3fN2wLfqqu+3YR95nu5KOvnl9o7n07B5
0IXGRMCkrMRd6b4CUtEsDj4ltVItfGbGvUCb5rbKwQ/E7cq9pG57IercheLLe1qa
syoQLQYOo24bLLyX/sG5nr1Vx30pB7xuf5lpkDoCdbu9zXpekiXf+2kvvm0r3Fvo
Vy4DP0SpgCRzlpmUJXnwVYlCwh9XCkABT5CYWFonMSpZyEbo27A966bAhPFMvrao
PHQg39O/VAO5W8dw8BzjXk26nS3kQRdwCnj2Uc0uzzYRxZck+tNTc2STetjOcZ3q
4MkogchGdBGiREsjnwfYPYhtHjzUFqp2A6BnQKvGGZy0B9KVPYJPe51LhJjGk1hl
VbVWXbanGr/rNlB53b/Z/Nn0bXR5xx3uAJWjQECyg04JaXmYDl/Rm8s1Y3yhXObe
AvqTohVX8Lh+XF+qGRKFlKSJ0PA+FC2rIHiuNKhTFgRvsJRiwyY=
=xMQq
-----END PGP SIGNATURE-----

--Sig_/HxQ/_/v7VufMnR3yXz6fS.6--

