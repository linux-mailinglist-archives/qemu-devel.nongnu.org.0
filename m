Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A5068691E
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 15:56:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNEQd-0002Mo-Ju; Wed, 01 Feb 2023 09:49:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pNEQQ-0002E5-KT
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 09:49:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pNEQO-0006Xq-P2
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 09:49:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675262964;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=L2zLxt5zzmAx2cHyZQ9p2Hea0O4Tfb9178jl9dITINI=;
 b=U9+dGBxS9mEwYW53LDfxXfUU3c3YOs1HQcW4Kf0l5GCkz8JJ1837VqKsLu4ucxWVEtduKu
 kifJvKiYkfWfySjme112Pvr/eewJHPCpQcf6/FDGiuzt/jqPufnX0im0HVIZ0M2G9OFy9m
 3qpXqsk6ma2RlwgszbLYfRyZz5L7dyQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-399-xniySytGNwWwb1neQIeh9g-1; Wed, 01 Feb 2023 09:49:18 -0500
X-MC-Unique: xniySytGNwWwb1neQIeh9g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 88A79101A52E;
 Wed,  1 Feb 2023 14:49:16 +0000 (UTC)
Received: from localhost (unknown [10.39.195.52])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B7DFE404BEC0;
 Wed,  1 Feb 2023 14:49:15 +0000 (UTC)
Date: Wed, 1 Feb 2023 09:49:14 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Eric Blake <eblake@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Fam Zheng <fam@euphon.net>, Fiona Ebner <f.ebner@proxmox.com>,
 Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH v2 3/4] qemu-io: add -r option to register I/O buffer
Message-ID: <Y9p76tGiIdL/99gJ@fedora>
References: <20230130215415.919494-1-stefanha@redhat.com>
 <20230130215415.919494-4-stefanha@redhat.com>
 <20230131212324.4btboq2utna6hx3w@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="MZAmogXrzGk5NpVh"
Content-Disposition: inline
In-Reply-To: <20230131212324.4btboq2utna6hx3w@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--MZAmogXrzGk5NpVh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 31, 2023 at 03:23:24PM -0600, Eric Blake wrote:
> On Mon, Jan 30, 2023 at 04:54:14PM -0500, Stefan Hajnoczi wrote:
> > The blk_register_buf() API is an optimization hint that allows some
> > block drivers to avoid I/O buffer housekeeping or bounce buffers.
> >=20
> > Add an -r option to register the I/O buffer so that qemu-io can be used
> > to test the blk_register_buf() API. The next commit will add a test that
> > uses the new option.
> >=20
> > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > ---
> >  qemu-io-cmds.c | 167 +++++++++++++++++++++++++++++++++----------------
> >  1 file changed, 114 insertions(+), 53 deletions(-)
>=20
> Reviewed-by: Eric Blake <eblake@redhat.com>
>=20
> > @@ -1277,7 +1322,7 @@ static int writev_f(BlockBackend *blk, int argc, =
char **argv)
> >      int pattern =3D 0xcd;
> >      QEMUIOVector qiov;
> > =20
> > -    while ((c =3D getopt(argc, argv, "CfqP:")) !=3D -1) {
> > +    while ((c =3D getopt(argc, argv, "CfqrP:")) !=3D -1) {
>=20
> This one is still odd - it is neither case-sensitive nor
> case-insensitive in order, because of P: coming after qr.
>=20
> > @@ -1476,7 +1529,7 @@ static int aio_read_f(BlockBackend *blk, int argc=
, char **argv)
> >      struct aio_ctx *ctx =3D g_new0(struct aio_ctx, 1);
> > =20
> >      ctx->blk =3D blk;
> > -    while ((c =3D getopt(argc, argv, "CP:iqv")) !=3D -1) {
> > +    while ((c =3D getopt(argc, argv, "CP:iqrv")) !=3D -1) {
>=20
> This one could at least argue that all capitals are before any
> lower-case, although case-insensitive would put i before P:.
>=20
> > @@ -1582,22 +1641,24 @@ static int aio_write_f(BlockBackend *blk, int a=
rgc, char **argv)
> >      int nr_iov, c;
> >      int pattern =3D 0xcd;
> >      struct aio_ctx *ctx =3D g_new0(struct aio_ctx, 1);
> > -    BdrvRequestFlags flags =3D 0;
> > =20
> >      ctx->blk =3D blk;
> > -    while ((c =3D getopt(argc, argv, "CfiqP:uz")) !=3D -1) {
> > +    while ((c =3D getopt(argc, argv, "CfiqrP:uz")) !=3D -1) {
>=20
> Another odd spot where P: would fit better before qr.
>=20
> Those are still minor, so I don't care if you further touch them
> up. My R-b applies either way.

Ah, I only paid attention to the user-visible help strings. I'll fix up
the getopt strings.

Stefan

--MZAmogXrzGk5NpVh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmPae+oACgkQnKSrs4Gr
c8jXGAf/XgMDlYmWQJhIwbXbwNhpVDWx8uWap6TZ6VlJfbVR8MRU5y4QheDba2hi
8fpFaCcZMa7SThRhTFovIa7PkboCKX/Eq/tP0REseM08b6jGzEeKr04aEbRIspvF
umo+5M9QVkwvaNS6volzx4NcatBf9H7FXZ/vAXJIrOXWebyyfDmXwo5kSp6IPrLS
pxejyp1TjU0bE4frHwTv8lwZIjfmX4tIBsRiuC4HgqwpWczdRviRMOM5yCpbMC56
PwvjT67VNu3ZdAnRzrLGVJ/QB98AEv/JNGz3hhyThebSZ5HSwMkQytnj5OA0fkKu
6fF8mRg2sjF/EEELMHFx5Tsv6W0zIg==
=Hc7J
-----END PGP SIGNATURE-----

--MZAmogXrzGk5NpVh--


