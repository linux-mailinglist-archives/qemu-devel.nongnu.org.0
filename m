Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0589C30EE46
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 09:27:10 +0100 (CET)
Received: from localhost ([::1]:48368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7Zym-0002k5-Ms
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 03:27:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1l7ZxQ-0001lQ-Cd
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 03:25:44 -0500
Received: from 10.mo52.mail-out.ovh.net ([87.98.187.244]:33119)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1l7ZxL-00007k-WC
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 03:25:44 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.51])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id 366E623D1A5;
 Thu,  4 Feb 2021 09:25:35 +0100 (CET)
Received: from kaod.org (37.59.142.103) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Thu, 4 Feb 2021
 09:25:33 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G00543c615aa-5356-4efd-b57d-319afd77e0e3,
 B83331F2441F4055165AC8819D583561B3B7D288) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Thu, 4 Feb 2021 09:25:28 +0100
From: Greg Kurz <groug@kaod.org>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v4 2/3] virtiofsd: optionally return inode pointer from
 lo_do_lookup()
Message-ID: <20210204092528.0f4b3200@bahia.lan>
In-Reply-To: <20210203170006.GK74271@stefanha-x1.localdomain>
References: <20210203113719.83633-1-stefanha@redhat.com>
 <20210203113719.83633-3-stefanha@redhat.com>
 <20210203152014.443a8b29@bahia.lan>
 <20210203170006.GK74271@stefanha-x1.localdomain>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/1E9Ev5psbM7H+GMPlMXCCEO";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG7EX2.mxp5.local (172.16.2.62) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: e23b8230-123d-4dc0-80aa-4c7d073613a9
X-Ovh-Tracer-Id: 12645826279831673266
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrgeefgdduudehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtihesghdtreerredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnheplefggfefueegudegkeevieevveejfffhuddvgeffteekieevueefgfeltdfgieetnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopehslhhpsehrvgguhhgrthdrtghomh
Received-SPF: pass client-ip=87.98.187.244; envelope-from=groug@kaod.org;
 helo=10.mo52.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: mszeredi@redhat.com, Daniel Berrange <berrange@redhat.com>, slp@redhat.com,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 virtio-fs@redhat.com, P J P <ppandit@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>, vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/1E9Ev5psbM7H+GMPlMXCCEO
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 3 Feb 2021 17:00:06 +0000
Stefan Hajnoczi <stefanha@redhat.com> wrote:

> On Wed, Feb 03, 2021 at 03:20:14PM +0100, Greg Kurz wrote:
> > On Wed,  3 Feb 2021 11:37:18 +0000
> > Stefan Hajnoczi <stefanha@redhat.com> wrote:
> >=20
> > > lo_do_lookup() finds an existing inode or allocates a new one. It
> > > increments nlookup so that the inode stays alive until the client
> > > releases it.
> > >=20
> > > Existing callers don't need the struct lo_inode so the function doesn=
't
> > > return it. Extend the function to optionally return the inode. The ne=
xt
> > > commit will need it.
> > >=20
> > > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > > ---
> > >  tools/virtiofsd/passthrough_ll.c | 29 +++++++++++++++++++++--------
> > >  1 file changed, 21 insertions(+), 8 deletions(-)
> > >=20
> > > diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passt=
hrough_ll.c
> > > index e63cbd3fb7..c87a1f3d72 100644
> > > --- a/tools/virtiofsd/passthrough_ll.c
> > > +++ b/tools/virtiofsd/passthrough_ll.c
> > > @@ -831,11 +831,13 @@ static int do_statx(struct lo_data *lo, int dir=
fd, const char *pathname,
> > >  }
> > > =20
> > >  /*
> > > - * Increments nlookup and caller must release refcount using
> > > - * lo_inode_put(&parent).
> > > + * Increments nlookup on the inode on success. unref_inode_lolocked(=
) must be
> > > + * called eventually to decrement nlookup again. If inodep is non-NU=
LL, the
> > > + * inode pointer is stored and the caller must call lo_inode_put().
> > >   */
> > >  static int lo_do_lookup(fuse_req_t req, fuse_ino_t parent, const cha=
r *name,
> > > -                        struct fuse_entry_param *e)
> > > +                        struct fuse_entry_param *e,
> > > +                        struct lo_inode **inodep)
> > >  {
> > >      int newfd;
> > >      int res;
> > > @@ -845,6 +847,10 @@ static int lo_do_lookup(fuse_req_t req, fuse_ino=
_t parent, const char *name,
> > >      struct lo_inode *inode =3D NULL;
> > >      struct lo_inode *dir =3D lo_inode(req, parent);
> > > =20
> > > +    if (inodep) {
> > > +        *inodep =3D NULL;
> > > +    }
> > > +
> >=20
> > Is this side-effect needed ? If lo_do_lookup() returns an error, it
> > rather seems that the caller shouldn't expect anything to be written
> > here, i.e. the content of *inodep still belongs to the caller and
> > whatever value it previously put in there (as patch 3/3 does) should
> > be preserved IMHO.
> >=20
> > Apart from that LGTM.
>=20
> I like this approach because it prevents accessing uninitialized memory
> in the caller:
>=20
>   struct lo_inode *inode;
>=20
>   if (lo_do_lookup(..., &inodep) !=3D 0) {
>     goto err;
>   }
>   ...
>=20
>   err:
>   lo_inode_put(&inode); <-- uninitialized in the error case!

My point is that it is the caller's business to ensure that inode
doesn't contain garbage if it is to be used irrespective of the
outcome of lo_do_lookup(). This is precisely what patch 3/3 does,
so I don't understand the ultimate purpose of nullifying the
inode pointer _again_ in lo_do_lookup()...

--Sig_/1E9Ev5psbM7H+GMPlMXCCEO
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEtIKLr5QxQM7yo0kQcdTV5YIvc9YFAmAbr3gACgkQcdTV5YIv
c9bZkRAAksgKW+l5JBklGUgl5b2gvoL5F0sjX2LDJKtX3lTT+vy9jrE5U2otcqqo
7oyeC3m1+/BkakV3TrphqYrBr4cpA4icDd78brJFu9opXNsy6CwyC3uagzd9huID
Ga6YbeH/MZBR/Acmjf07fR0OucmZulcYbE6+ajVGhbDmuDxpk5u/1TTCoPKse0tv
1WzF4Xhztryc3qYdK3jAS7V7avqYBIBv+fDP7zihYz/4RkWu4Kt1hnC6zUnOxt/v
zEu2B1t1pflTzXADquorPaVVZt5wJL6FyZZ2RLplB1oAw3O9ha8UN3s36gP8cxr7
RAhRQMq47EqyKFnUOCueWAzTLDIsgm2S2MOm7V6ToeivrOMclz8ug37XO+w8UVeK
Cn7uJ5v9sGYGbhVwT6iVo3z8HJViRUTxMZVNDSe9yoRBuXRJs8NoAXE6DJENz9Ww
+CLgwoMc3lNICGK6r75VZd/WxM2uYznYNce99P/6nlgugUWiObsqpnlVKHXAfgNQ
loTaAFQZ9GsgUPAXFhQ6FY0qABLpky9ik/3J35LWYS9Ken/9kl6xqofSwJNQNMGH
BicpOz24IH4XGzJXAqzWovuMh/8zi3BjywiyA6vUVT6UneVUHATKDrh/6w2UXl0c
fhKUzcuJ69uv6yURaJ7nhgkI6v/P08Gk+2Dca0YzL5YCa1irJdA=
=lr6D
-----END PGP SIGNATURE-----

--Sig_/1E9Ev5psbM7H+GMPlMXCCEO--

