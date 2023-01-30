Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70230681BED
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 21:56:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMbBc-0005Bv-9h; Mon, 30 Jan 2023 15:55:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pMbBZ-0005B9-Rb
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:55:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pMbBX-0004YZ-Vy
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:55:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675112126;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=i9ey6zaqZTEFee96Dm6zUthwDaYWO7nRpUjJ9HToa/0=;
 b=YpqksHh1veKs29RDYJXrFFmA/3/2n1HutjujJqfVeNpMRJatv7xs4uSxMUJVTLNjiY+oXw
 tzoZxE87YzsrbjgtWNtuWYLahaBniRvHIDXiJoFrWz9UF5Nvdn2LzCj9THuCdha5Z7PM1v
 qAfC/xIrZQlS0qUazmSrztaN6QH8YaU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-424-tMd2hKSFODuwkS3Tp-89ew-1; Mon, 30 Jan 2023 15:55:22 -0500
X-MC-Unique: tMd2hKSFODuwkS3Tp-89ew-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 717EA8030D5;
 Mon, 30 Jan 2023 20:55:22 +0000 (UTC)
Received: from localhost (unknown [10.39.195.80])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CC5C6492B05;
 Mon, 30 Jan 2023 20:55:21 +0000 (UTC)
Date: Mon, 30 Jan 2023 15:55:20 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Eric Blake <eblake@redhat.com>
Cc: qemu-devel@nongnu.org, Fam Zheng <fam@euphon.net>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org, Fiona Ebner <f.ebner@proxmox.com>
Subject: Re: [PATCH 3/4] qemu-io: add -r option to register I/O buffer
Message-ID: <Y9guuBen+ArAL5uQ@fedora>
References: <20230126201401.348845-1-stefanha@redhat.com>
 <20230126201401.348845-4-stefanha@redhat.com>
 <20230127232430.zy7x7wq2dvb3g3y2@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="SzXi//s6nGS8dt0L"
Content-Disposition: inline
In-Reply-To: <20230127232430.zy7x7wq2dvb3g3y2@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
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


--SzXi//s6nGS8dt0L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 27, 2023 at 05:24:30PM -0600, Eric Blake wrote:
> On Thu, Jan 26, 2023 at 03:14:00PM -0500, Stefan Hajnoczi wrote:
> > The blk_register_buf() API is an optimization hint that allows some
> > block drivers to avoid I/O buffer housekeeping or bounce buffers.
> >=20
> > Add an -r option to register the I/O buffer so that qemu-io can be used
> > to test the blk_register_buf() API. The next commit will add a test that
> > uses the new option.
> >=20
> > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > ---
> >  qemu-io-cmds.c | 149 ++++++++++++++++++++++++++++++++++---------------
> >  1 file changed, 103 insertions(+), 46 deletions(-)
> >=20
>=20
> >  static void *qemu_io_alloc_from_file(BlockBackend *blk, size_t len,
> > -                                     const char *file_name)
> > +                                     const char *file_name, bool regis=
ter_buf)
> >  {
> >      char *buf, *buf_origin;
> >      FILE *f =3D fopen(file_name, "r");
> > @@ -414,6 +423,10 @@ static void *qemu_io_alloc_from_file(BlockBackend =
*blk, size_t len,
> >      fclose(f);
> >      f =3D NULL;
> > =20
> > +    if (register_buf) {
> > +        blk_register_buf(blk, buf_origin, len, &error_abort);
> > +    }
>=20
> Why is this conditionally true...
>=20
> > +
> >      if (len > pattern_len) {
> >          len -=3D pattern_len;
> >          buf +=3D pattern_len;
> > @@ -431,7 +444,7 @@ static void *qemu_io_alloc_from_file(BlockBackend *=
blk, size_t len,
> >      return buf_origin;
> > =20
> >  error:
> > -    qemu_io_free(buf_origin);
> > +    qemu_io_free(blk, buf_origin, len, false);
>=20
> ...but cleanup unconditionally false?

It looks suspicious but it's correct: goto error only happens before the
blk_register_buf() call. Therefore we must *not* unregister the buffer
at this point.

I'll add a comment to make this clear.

>=20
> > @@ -719,6 +732,7 @@ static void read_help(void)
> >  " -p, -- ignored for backwards compatibility\n"
> >  " -P, -- use a pattern to verify read data\n"
> >  " -q, -- quiet mode, do not show I/O statistics\n"
> > +" -r, -- register I/O buffer\n"
> >  " -s, -- start offset for pattern verification (only with -P)\n"
> >  " -v, -- dump buffer to standard output\n"
>=20
> Here we have kept more or less alphabetical...
>=20
> > @@ -909,6 +932,7 @@ static void readv_help(void)
> >  " -P, -- use a pattern to verify read data\n"
> >  " -v, -- dump buffer to standard output\n"
> >  " -q, -- quiet mode, do not show I/O statistics\n"
> > +" -r, -- register I/O buffer\n"
>=20
> ...here we have not.  While it's pre-existing, would it be worth
> touching up while you're here?
>=20
> > @@ -1455,6 +1503,7 @@ static void aio_read_help(void)
> >  " -i, -- treat request as invalid, for exercising stats\n"
> >  " -v, -- dump buffer to standard output\n"
> >  " -q, -- quiet mode, do not show I/O statistics\n"
> > +" -r, -- register I/O buffer\n"
>=20
> Another pre-existing spot.
>=20
> Overall makes sense to me.

Sure, I'll order the help output alphabetically in the next revision.

Stefan

--SzXi//s6nGS8dt0L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmPYLrcACgkQnKSrs4Gr
c8gjZAf/ZOzyGHBgG7LRpNjgRi2ov5aDFgtkFktfPuTq6ufgSKsWsi2jP32whEu+
yRax+vQHWt8+OJKkJIJDUEPmJFLV2zwWo4SDSnNXycut/0x4br1ED5CqZdAfXfIU
ZjoAtNhI09iki07jVHR55FdQfUP3096GVO2OU8AVrkPpjiPRut4RZlMB3oXAGwWX
lHmfHcS151vN40EddhsVUaCetqlJzX7phyKLxt6a58N2tRVhF+HetOqqW5oVdL0y
BqFrtnS6o9NLG9zML2vZocNyVVkrPT8wk/Tw/r/VSUShp01bk8NzlmTGuhut/Nhb
0MJlDBq1br49Nq5jzadcyH2kbXuJcQ==
=/WnH
-----END PGP SIGNATURE-----

--SzXi//s6nGS8dt0L--


