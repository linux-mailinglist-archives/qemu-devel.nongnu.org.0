Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E788630F1EE
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 12:21:21 +0100 (CET)
Received: from localhost ([::1]:58892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7chN-0001LD-1k
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 06:21:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1l7cfk-0000YT-5m
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 06:19:40 -0500
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:60075)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1l7cfh-0002YN-Qh
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 06:19:39 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.5])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id A4686827BAD2;
 Thu,  4 Feb 2021 12:19:34 +0100 (CET)
Received: from kaod.org (37.59.142.103) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Thu, 4 Feb 2021
 12:19:30 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G0052f006827-2496-4282-a4ff-0e171bf80c2e,
 B83331F2441F4055165AC8819D583561B3B7D288) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Thu, 4 Feb 2021 12:19:27 +0100
From: Greg Kurz <groug@kaod.org>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v4 2/3] virtiofsd: optionally return inode pointer from
 lo_do_lookup()
Message-ID: <20210204121927.31be17ff@bahia.lan>
In-Reply-To: <20210204094537.GB344659@stefanha-x1.localdomain>
References: <20210203113719.83633-1-stefanha@redhat.com>
 <20210203113719.83633-3-stefanha@redhat.com>
 <20210203152014.443a8b29@bahia.lan>
 <20210203170006.GK74271@stefanha-x1.localdomain>
 <20210204092528.0f4b3200@bahia.lan>
 <20210204094537.GB344659@stefanha-x1.localdomain>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+SwxQMkoy5gwPoBZwp3NJel";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG2EX1.mxp5.local (172.16.2.11) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: 058c27dc-556c-4f05-b5aa-21495d4957c0
X-Ovh-Tracer-Id: 15584143560846318002
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrgeeggddujecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkjghfofggtghisehgtderreertddvnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeelgffgfeeugedugeekveeiveevjeffhfduvdegffetkeeiveeufefgledtgfeiteenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtohepshhlphesrhgvughhrghtrdgtohhm
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
Cc: mszeredi@redhat.com, Daniel Berrange <berrange@redhat.com>, slp@redhat.com,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 virtio-fs@redhat.com, P J P <ppandit@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>, vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/+SwxQMkoy5gwPoBZwp3NJel
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 4 Feb 2021 09:45:37 +0000
Stefan Hajnoczi <stefanha@redhat.com> wrote:

> On Thu, Feb 04, 2021 at 09:25:28AM +0100, Greg Kurz wrote:
> > On Wed, 3 Feb 2021 17:00:06 +0000
> > Stefan Hajnoczi <stefanha@redhat.com> wrote:
> >=20
> > > On Wed, Feb 03, 2021 at 03:20:14PM +0100, Greg Kurz wrote:
> > > > On Wed,  3 Feb 2021 11:37:18 +0000
> > > > Stefan Hajnoczi <stefanha@redhat.com> wrote:
> > > >=20
> > > > > lo_do_lookup() finds an existing inode or allocates a new one. It
> > > > > increments nlookup so that the inode stays alive until the client
> > > > > releases it.
> > > > >=20
> > > > > Existing callers don't need the struct lo_inode so the function d=
oesn't
> > > > > return it. Extend the function to optionally return the inode. Th=
e next
> > > > > commit will need it.
> > > > >=20
> > > > > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > > > > ---
> > > > >  tools/virtiofsd/passthrough_ll.c | 29 +++++++++++++++++++++-----=
---
> > > > >  1 file changed, 21 insertions(+), 8 deletions(-)
> > > > >=20
> > > > > diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/p=
assthrough_ll.c
> > > > > index e63cbd3fb7..c87a1f3d72 100644
> > > > > --- a/tools/virtiofsd/passthrough_ll.c
> > > > > +++ b/tools/virtiofsd/passthrough_ll.c
> > > > > @@ -831,11 +831,13 @@ static int do_statx(struct lo_data *lo, int=
 dirfd, const char *pathname,
> > > > >  }
> > > > > =20
> > > > >  /*
> > > > > - * Increments nlookup and caller must release refcount using
> > > > > - * lo_inode_put(&parent).
> > > > > + * Increments nlookup on the inode on success. unref_inode_loloc=
ked() must be
> > > > > + * called eventually to decrement nlookup again. If inodep is no=
n-NULL, the
> > > > > + * inode pointer is stored and the caller must call lo_inode_put=
().
> > > > >   */
> > > > >  static int lo_do_lookup(fuse_req_t req, fuse_ino_t parent, const=
 char *name,
> > > > > -                        struct fuse_entry_param *e)
> > > > > +                        struct fuse_entry_param *e,
> > > > > +                        struct lo_inode **inodep)
> > > > >  {
> > > > >      int newfd;
> > > > >      int res;
> > > > > @@ -845,6 +847,10 @@ static int lo_do_lookup(fuse_req_t req, fuse=
_ino_t parent, const char *name,
> > > > >      struct lo_inode *inode =3D NULL;
> > > > >      struct lo_inode *dir =3D lo_inode(req, parent);
> > > > > =20
> > > > > +    if (inodep) {
> > > > > +        *inodep =3D NULL;
> > > > > +    }
> > > > > +
> > > >=20
> > > > Is this side-effect needed ? If lo_do_lookup() returns an error, it
> > > > rather seems that the caller shouldn't expect anything to be written
> > > > here, i.e. the content of *inodep still belongs to the caller and
> > > > whatever value it previously put in there (as patch 3/3 does) should
> > > > be preserved IMHO.
> > > >=20
> > > > Apart from that LGTM.
> > >=20
> > > I like this approach because it prevents accessing uninitialized memo=
ry
> > > in the caller:
> > >=20
> > >   struct lo_inode *inode;
> > >=20
> > >   if (lo_do_lookup(..., &inodep) !=3D 0) {
> > >     goto err;
> > >   }
> > >   ...
> > >=20
> > >   err:
> > >   lo_inode_put(&inode); <-- uninitialized in the error case!
> >=20
> > My point is that it is the caller's business to ensure that inode
> > doesn't contain garbage if it is to be used irrespective of the
> > outcome of lo_do_lookup(). This is precisely what patch 3/3 does,
> > so I don't understand the ultimate purpose of nullifying the
> > inode pointer _again_ in lo_do_lookup()...
>=20
> APIs should be designed to eliminate classes of errors where possible
> IMO. Taking care regarding the uninitialized pointer in the error case
> could be the caller's responsibility, but what's the advantage?
>=20

Because it is more explicit. FWIW caller is still responsible since it
calls lo_inode_put() in the end : initializing inode to NULL like patch
3/3 does warrants that no matter what happens in lo_do_lookup() or even
if it isn't called at all, inode can be safely passed to lo_inode_put().

But this change doesn't hurt, especially with the benefits of the rest
of this series, so:

Reviewed-by: Greg Kurz <groug@kaod.org>

> (There's a related thing with lo_inode_put(&inode) where it sets *inode
> =3D NULL to eliminate use-after-free bugs in callers. It would have been
> possible to use the same approach as free(3) where it's the caller's
> responsiblity, but that API design decision in free(3) has caused
> many bugs in applications.)
>=20
> Stefan


--Sig_/+SwxQMkoy5gwPoBZwp3NJel
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEtIKLr5QxQM7yo0kQcdTV5YIvc9YFAmAb2D8ACgkQcdTV5YIv
c9a/LBAAhvMJPTpcizjAh5nIE6vLMnaFB3sIHyN0LPx1D92hEYcWaFhQQXMT4VcC
vpnEhj0etJOpZTivVsRVMtj4SZ0donE5UEQIuqMKibL08kbsbvCJ4cAbhwavoiOQ
9HQ5SgZQCgPMWOM4QsJFHnoGbbTvN9+uMVez7ak8XujAXcMjnwhg9v/CmjhC4iZe
HnR/kfPcw3ihr8qpEE1NfEAPEZc25Hfe5aU/x6OlcBdRLZ1kj5SxSANQELII87J6
BNQxifSHT+M4UZOJNEoE7Zk2TjiAliU/FdbYAscwltdilX6yP7h8SXUwXEmUa0K8
RzGiCkvJVYlDvLq1pvEjgMF3XZ85izLte3J0DRurYRdQnocHxFaU45AgpnovXdj1
br3IfeDo3ptJd7CFLeTMXJXLKtplojvdRTwUhpKZZ43w5pzvyDSmpo2StyLNK+Nq
Yoicv+D6tpLQjzKQVRiy+zUxo9rpgusCGr1omp8PeUUXFUmRuNnWTtKMPNDFSXCS
2MG6llG1XSxZrVEtMuqSYDNE6t9hjyj07PHiAwqpFnP8cbj1jBdREYwgb/5VLgpV
qtdvcA1F9MPJU5eV4zNn3fSdky0LKmJIAsMD/cbgXybIXTk0ppBxkey5dtAF51Z+
OUyY5mlZzZvEcY0LbBlcmk3Y/9Mbrzc8KZ10N8ibQO5vc0eBBR8=
=lehA
-----END PGP SIGNATURE-----

--Sig_/+SwxQMkoy5gwPoBZwp3NJel--

