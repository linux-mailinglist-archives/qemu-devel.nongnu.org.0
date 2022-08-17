Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D43C597840
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 22:51:28 +0200 (CEST)
Received: from localhost ([::1]:41846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOQ0c-000387-V0
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 16:51:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oOPwS-0000d4-5v
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 16:47:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oOPwO-0005oO-Sw
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 16:47:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660769223;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Fki2cDaVpiHmSDbciLaugmUFyyqkDzE+KQ9Znvrb1JA=;
 b=XD99saCGQzQwZ4OUiVqFHod+HmpwACexdzGluYgQVieGohmANfvwnzl65WLI3kjn73eC7g
 yaXcW4gGuyMhBrqhMe2TgqdtfjuWvViehNDbvTFwBeXDQ8txpeuOtbrCn386kBHN3fd2w3
 gLTJ/aC93DINm1i7Hz6RQXFkjL11aTE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-575-xytuIDJgOjO2QPNv7d3IHQ-1; Wed, 17 Aug 2022 16:47:01 -0400
X-MC-Unique: xytuIDJgOjO2QPNv7d3IHQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CEC46101A54E;
 Wed, 17 Aug 2022 20:47:00 +0000 (UTC)
Received: from localhost (unknown [10.39.192.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F404C492C3B;
 Wed, 17 Aug 2022 20:46:58 +0000 (UTC)
Date: Wed, 17 Aug 2022 16:46:55 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Hanna Reitz <hreitz@redhat.com>
Cc: qemu-devel@nongnu.org, Alberto Faria <afaria@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Eric Blake <eblake@redhat.com>,
 sgarzare@redhat.com, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 John Snow <jsnow@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Fam Zheng <fam@euphon.net>,
 Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [RFC v3 4/8] block: add BDRV_REQ_REGISTERED_BUF request flag
Message-ID: <Yv1Tv83Mcwf6gRes@fedora>
References: <20220708041737.1768521-1-stefanha@redhat.com>
 <20220708041737.1768521-5-stefanha@redhat.com>
 <5ef9e60c-bcb2-7172-4664-688a5f3b2844@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="L8Vn41nmTmOihdgW"
Content-Disposition: inline
In-Reply-To: <5ef9e60c-bcb2-7172-4664-688a5f3b2844@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--L8Vn41nmTmOihdgW
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 14, 2022 at 10:54:12AM +0200, Hanna Reitz wrote:
> On 08.07.22 06:17, Stefan Hajnoczi wrote:
> > Block drivers may optimize I/O requests accessing buffers previously
> > registered with bdrv_register_buf(). Checking whether all elements of a
> > request's QEMUIOVector are within previously registered buffers is
> > expensive, so we need a hint from the user to avoid costly checks.
> >=20
> > Add a BDRV_REQ_REGISTERED_BUF request flag to indicate that all
> > QEMUIOVector elements in an I/O request are known to be within
> > previously registered buffers.
> >=20
> > bdrv_aligned_preadv() is strict in validating supported read flags and
> > its assertions fail when it sees BDRV_REQ_REGISTERED_BUF. There is no
> > harm in passing BDRV_REQ_REGISTERED_BUF to block drivers that do not
> > support it, so update the assertions to ignore BDRV_REQ_REGISTERED_BUF.
> >=20
> > Care must be taken to clear the flag when the block layer or filter
> > drivers replace QEMUIOVector elements with bounce buffers since these
> > have not been registered with bdrv_register_buf(). A lot of the changes
> > in this commit deal with clearing the flag in those cases.
> >=20
> > Ensuring that the flag is cleared properly is somewhat invasive to
> > implement across the block layer and it's hard to spot when future code
> > changes accidentally break it. Another option might be to add a flag to
> > QEMUIOVector itself and clear it in qemu_iovec_*() functions that modify
> > elements. That is more robust but somewhat of a layering violation, so I
> > haven't attempted that.
>=20
> Yeah...=C2=A0 I will say that most read code already looks quite reasonab=
le in
> that it=E2=80=99ll pass @flags to lower layers basically only if it=E2=80=
=99s an unmodified
> request, so it seems like in the past most people have already adhered to
> =E2=80=9Cdon=E2=80=99t pass on any flags if you=E2=80=99re reading to a l=
ocal bounce buffer=E2=80=9D.
>=20
> > Signed-off-by: Stefan Hajnoczi<stefanha@redhat.com>
> > ---
> >   include/block/block-common.h |  9 +++++++++
> >   block/blkverify.c            |  4 ++--
> >   block/crypto.c               |  2 ++
> >   block/io.c                   | 30 +++++++++++++++++++++++-------
> >   block/mirror.c               |  2 ++
> >   block/raw-format.c           |  2 ++
> >   6 files changed, 40 insertions(+), 9 deletions(-)
>=20
> Some things not covered here that look a bit wrong:
>=20
> While bdrv_driver_preadv() asserts that the flags don=E2=80=99t contain a=
nything the
> driver couldn=E2=80=99t handle (and this new flag is made exempt from tha=
t assertion
> here in this patch), bdrv_driver_pwritev() just hides those flags from
> drivers silently. I think just like we exempt the new flag from the
> assertion in bdrv_driver_preadv(), we should have bdrv_driver_pwritev()
> always pass it to drivers.
>=20
> The following driver read/write functions assert that @flags is 0, which =
is
> probably no longer ideal:
> - bdrv_qed_co_writev()
> - block_crypto_co_preadv()
> - nbd_client_co_preadv()
> - parallels_co_writev()
> - qcow_co_preadv()
> - qcow_co_pwritev()
> - qemu_gluster_co_writev()
> - raw_co_pwritev() (block/file-posix.c)
> - replication_co_writev()
> - ssh_co_writev()
> - vhdx_co_writev()
>=20
> snapshot_access_co_preadv_part() returns an error when any flags are set,
> but should probably ignore BDRV_REQ_REGISTERED_BUF for this check.

The assert(!flags) checks can be removed without losing much safety
since bdrv_driver_preadv/pwritev() prepare the flags bits appropriately
and calls from other locations are rare.

>=20
>=20
> While looking around, I spotted a couple of places that look like they co=
uld
> pass the flag on but currently don=E2=80=99t (just FYI, not asking for an=
ything
> here):
>=20
> bdrv_co_do_copy_on_readv() never passes the flags through to its calls, b=
ut
> I think it could pass this flag on in the one bdrv_driver_preadv() call
> where it doesn=E2=80=99t use a bounce buffer (=E2=80=9CRead directly into=
 the destination=E2=80=9D).
>=20
> qcow2=E2=80=99s qcow2_co_preadv_task() and qcow2_co_pwritev_task() (besid=
es the
> encryption part) also look like they should pass this flag on, but, well,
> the functions themselves currently don=E2=80=99t get the flag, so they ca=
n=E2=80=99t.
>=20
> qcow1=E2=80=99s qcow_co_preadv() and qcow_co_pwritev() are so-so, sometim=
es using a
> bounce buffer, and sometimes not, but those function could use optimizati=
on
> in general if anyone cared.
>=20
> vpc_co_preadv()=E2=80=99s and vpc_co_pwritev()=E2=80=99s first
> bdrv_co_preadv()/bdrv_co_pwritev() invocations look straightforward, but =
as
> with qcow1, not sure if anyone cares.
>=20
> I=E2=80=99m too lazy to thoroughly check what=E2=80=99s going on with qed=
_aio_write_main().=C2=A0
> Passing 0 is safe, and it doesn=E2=80=99t get the original request flags,=
 so I guess
> doing anything about this would be difficult.
>=20
> quorum=E2=80=99s read_fifo_child() probably could pass acb->flags. Probab=
ly.=C2=A0
> Perhaps not.=C2=A0 Difficult to say it is.
>=20
> block/replication.c also looks like a candidate for passing flags, but
> personally, I=E2=80=99d like to refrain from touching it.=C2=A0 (Well, be=
sides the fact
> that replication_co_writev() asserts that @flags is 0.)
>=20
>=20
> (And finally, I found that block/parallels.c invokes bdrv_co_pwritev() wi=
th
> a buffer instead of an I/O vector, which looks really wrong, but has noth=
ing
> to do with this patch.)

Thanks for looking at these. I haven't attempted to propagate
BDRV_REQ_REGISTERED_BUF through image format drivers yet so there are
optimization opportunities here.

> [...]
>=20
> > diff --git a/block/io.c b/block/io.c
> > index e7f4117fe7..83b8259227 100644
> > --- a/block/io.c
> > +++ b/block/io.c
>=20
> [...]
>=20
> > @@ -1902,6 +1910,11 @@ static int coroutine_fn bdrv_co_do_pwrite_zeroes=
(BlockDriverState *bs,
> >           return -ENOTSUP;
> >       }
> > +    /* By definition there is no user buffer so this flag doesn't make=
 sense */
> > +    if (flags & BDRV_REQ_REGISTERED_BUF) {
> > +        return -EINVAL;
> > +    }
> > +
>=20
> Here we return an error when the flag is met...
>=20
> >       /* Invalidate the cached block-status data range if this write ov=
erlaps */
> >       bdrv_bsc_invalidate_range(bs, offset, bytes);
> > @@ -2187,6 +2200,9 @@ static int coroutine_fn bdrv_co_do_zero_pwritev(B=
drvChild *child,
> >       bool padding;
> >       BdrvRequestPadding pad;
> > +    /* This flag doesn't make sense for padding or zero writes */
> > +    flags &=3D ~BDRV_REQ_REGISTERED_BUF;
> > +
>=20
> ...and here we just ignore it.=C2=A0 Why don=E2=80=99t we handle this the=
 same in both of
> these functions?=C2=A0 (And what about bdrv_co_pwrite_zeroes()?)
>=20
> Besides that, if we do make it an error, I wonder if it shouldn=E2=80=99t=
 be an
> assertion instead so the duty of clearing the flag falls on the caller.=
=C2=A0 (I
> personally like just silently clearing it in the zero-write functions,
> though.)

Thanks for catching this. Let's consistently clear
BDRV_REQ_REGISTERED_BUF silently for zero writes.

Stefan

--L8Vn41nmTmOihdgW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmL9U78ACgkQnKSrs4Gr
c8jNRQf+OdqIYQnedJMBTkhsAX2WDNgc/2vt3RNPyKCPWWZagAUI+BuOYxW2bA8/
l34J8i+u6+2rPzU4I6ENU5aA8US8BDMzHlPFlcJmoTyxzoSlfFgEyQQGTYE55PyA
YXYclURKtK8gLpmaEcUeplF/a5oBG8S4F1f8eTPrFLCUzQx6q/2RHVxCc3dN+rCR
9dG4fvLr0V2w2kA3HAGQMRGblouC+IMNAObUYHskZP8KIOEsq3Fxhlbt3zeyKtUc
E0X0iNqq3XYcGD5efEmk8D1ByManCYSzyqR48gBQcV+WCpq4aLXFRDkqdhCmUDsT
iFIrImc7XOnKGrszAVNnlY+kX6DUfQ==
=PV1T
-----END PGP SIGNATURE-----

--L8Vn41nmTmOihdgW--


