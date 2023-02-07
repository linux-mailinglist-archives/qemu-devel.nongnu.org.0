Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A3F68E149
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 20:33:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPTiJ-000716-AL; Tue, 07 Feb 2023 14:33:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pPTiD-0006yN-3N
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 14:33:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pPTiA-0000bM-Uw
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 14:33:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675798378;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=F4QHV8Wxyfv+79GPa/6Xj8WZOXOyQeduGi5iWyx4NrM=;
 b=fZaKte3BozTsiq4945gm1N89KyjJdogvDhZWyUvrzRci4eXKexHdCwFmuYZEAUgtD9DUAW
 qedsteWEgDWD5l6SgVLprScvUy4QDCUQZ1YgsCpWDANagWXaw/l7ZBROpqDnJc+LlCsLwt
 JKjb8rVZXZn9WbsGTlDtI5tpVvfK+TQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-113-XXTYuTu8MYuvuTRnbNAWoQ-1; Tue, 07 Feb 2023 14:32:55 -0500
X-MC-Unique: XXTYuTu8MYuvuTRnbNAWoQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F1F9619705A7;
 Tue,  7 Feb 2023 19:32:54 +0000 (UTC)
Received: from localhost (unknown [10.39.192.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3BAAB175AD;
 Tue,  7 Feb 2023 19:32:53 +0000 (UTC)
Date: Tue, 7 Feb 2023 14:32:52 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Hanna Czenczek <hreitz@redhat.com>
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Fam Zheng <fam@euphon.net>,
 Fiona Ebner <f.ebner@proxmox.com>, Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH v3 3/4] qemu-io: add -r option to register I/O buffer
Message-ID: <Y+KnZCJGAi9bQO4e@fedora>
References: <20230201152751.270508-1-stefanha@redhat.com>
 <20230201152751.270508-4-stefanha@redhat.com>
 <dc546b88-9e0b-cc50-704a-64084fd91144@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="bxgVu3pHrqzp5MW4"
Content-Disposition: inline
In-Reply-To: <dc546b88-9e0b-cc50-704a-64084fd91144@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
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


--bxgVu3pHrqzp5MW4
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 07, 2023 at 12:47:06PM +0100, Hanna Czenczek wrote:
> On 01.02.23 16:27, Stefan Hajnoczi wrote:
> > The blk_register_buf() API is an optimization hint that allows some
> > block drivers to avoid I/O buffer housekeeping or bounce buffers.
> >=20
> > Add an -r option to register the I/O buffer so that qemu-io can be used
> > to test the blk_register_buf() API. The next commit will add a test that
> > uses the new option.
> >=20
> > Reviewed-by: Eric Blake <eblake@redhat.com>
> > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > ---
> >   qemu-io-cmds.c | 167 +++++++++++++++++++++++++++++++++----------------
> >   1 file changed, 114 insertions(+), 53 deletions(-)
> >=20
> > diff --git a/qemu-io-cmds.c b/qemu-io-cmds.c
> > index c0125d14c0..4b8dbef36d 100644
> > --- a/qemu-io-cmds.c
> > +++ b/qemu-io-cmds.c
>=20
> [...]
>=20
> > @@ -347,17 +348,24 @@ static void *qemu_io_alloc(BlockBackend *blk, siz=
e_t len, int pattern)
> >       }
> >       buf =3D blk_blockalign(blk, len);
> >       memset(buf, pattern, len);
> > +    if (register_buf) {
> > +        blk_register_buf(blk, buf, len, &error_abort);
> > +    }
> >       if (qemuio_misalign) {
> >           buf +=3D MISALIGN_OFFSET;
> >       }
> >       return buf;
> >   }
> > -static void qemu_io_free(void *p)
> > +static void qemu_io_free(BlockBackend *blk, void *p, size_t len,
> > +                         bool unregister_buf)
> >   {
> >       if (qemuio_misalign) {
> >           p -=3D MISALIGN_OFFSET;
> >       }
> > +    if (unregister_buf) {
> > +        blk_unregister_buf(blk, p, len);
>=20
> If `qemuio_misalign` is set, we must also increase `len` by
> `MISALIGN_OFFSET`, I think, or it won=E2=80=99t match what=E2=80=99s been=
 used in
> `qemu_io_alloc()`.

Good catch, thank you!

>=20
> > +    }
> >       qemu_vfree(p);
> >   }
>=20
> [...]
>=20
> > @@ -414,6 +423,10 @@ static void *qemu_io_alloc_from_file(BlockBackend =
*blk, size_t len,
> >       fclose(f);
> >       f =3D NULL;
> > +    if (register_buf) {
> > +        blk_register_buf(blk, buf_origin, len, &error_abort);
>=20
> `qemu_io_alloc()` registers the buffer before `MISALIGN_OFFSET` is/might =
be
> applied, and `qemu_io_free()` assumes this is the case (the buffer to be
> unregistered is passed after the offset has been subtracted again).=C2=A0=
 Here,
> however, the offset has already been applied, so there=E2=80=99ll be a mi=
smatch with
> `blk_unregister_buf()` when `qemu_io_free()` is called (and
> `qemuio_misalign` is set).
>=20
> > +    }
> > +
> >       if (len > pattern_len) {
> >           len -=3D pattern_len;
> >           buf +=3D pattern_len;
>=20
> [...]
>=20
> > @@ -750,6 +768,7 @@ static int read_f(BlockBackend *blk, int argc, char=
 **argv)
> >       int64_t total =3D 0;
> >       int pattern =3D 0;
> >       int64_t pattern_offset =3D 0, pattern_count =3D 0;
> > +    BdrvRequestFlags flags =3D 0;
> >       while ((c =3D getopt(argc, argv, "bCl:pP:qs:v")) !=3D -1) {
>=20
> I think we=E2=80=99ll need the "r" here.

Oops, thanks!

>=20
> >           switch (c) {
>=20
> [...]
>=20
> > @@ -1384,8 +1434,9 @@ static void aio_write_done(void *opaque, int ret)
> >                    ctx->qiov.size, 1, ctx->Cflag);
> >   out:
> >       if (!ctx->zflag) {
> > -        qemu_io_free(ctx->buf);
> >           qemu_iovec_destroy(&ctx->qiov);
> > +        qemu_io_free(ctx->blk, ctx->buf, ctx->qiov.size,
> > +                     ctx->flags & BDRV_REQ_REGISTERED_BUF);
>=20
> So far in this patch, you=E2=80=99ve always swapped the existing
> qemu_iovec_destroy(); qemu_io_free() combination to qemu_io_free();
> qemu_iovec_destroy().=C2=A0 I think that is correct because qemu_iovec_de=
stroy()
> overwrites the qiov by 0, so that accessing qiov.size will then read 0,
> regardless of what it was before.
>=20
> Here, you=E2=80=99re swapping it the other way around, which means that
> `ctx->qiov.size` will read 0 when `qemu_io_free()` is called, which seems
> wrong.

Yes, you're right. I will reverse the order here.

>=20
> >       }
> >       g_free(ctx);
> >   }
>=20
> [...]
>=20
> > @@ -1663,12 +1724,12 @@ static int aio_write_f(BlockBackend *blk, int a=
rgc, char **argv)
> >           }
> >           ctx->qiov.size =3D count;
> > -        blk_aio_pwrite_zeroes(blk, ctx->offset, count, flags, aio_writ=
e_done,
> > -                              ctx);
> > +        blk_aio_pwrite_zeroes(blk, ctx->offset, count, ctx->flags,
> > +                              aio_write_done, ctx);
>=20
> write_f() emits an error when -r is used together with -z =E2=80=93 why d=
oesn=E2=80=99t this
> function, too?=C2=A0 (Or, alternatively, why does write_f()?=C2=A0 Maybe =
we want to
> check what happens when you call a zero-writing function with that flag.=
=C2=A0 Or
> we don=E2=80=99t.)

I added an explicit check in write_f() and forgot to add the same check
to aio_write_f(). Will fix.

Stefan

--bxgVu3pHrqzp5MW4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmPip2QACgkQnKSrs4Gr
c8gSGggAucAQHHXnlbEtUpO0+SlIBGcIbODG5RYP1tClqJdPH2FNfHHkVhEOhpHw
LRRKuW99u1VSPP2vLg484WpLxduVDC8qyoXJIQM4rFqutSaCM+01VdL4kQhaPBL/
JhRo0YvdfvplNo1xcKYf3R/oAfoyV0NnWv/Y8pcr9yCeNLrKnVlBuvOA0ttlnXrv
E180UyS8XN7WIGpGvYxOnVr0uf5EwRIJh/oh70TKVxki2ejv+fPmTH6DvtG16784
rqAEz6YECgyrVCF8Nc8+sVIEMYLl8wdFnudWT6Kw6Ek5AMueCSbtnv4vA3mfPilw
n2Pd3ggC3wxEksa/Q9d1g8ageT8tjA==
=AWOk
-----END PGP SIGNATURE-----

--bxgVu3pHrqzp5MW4--


