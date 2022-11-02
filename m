Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B69D2616D36
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 19:54:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqIrx-0002dz-GJ; Wed, 02 Nov 2022 14:53:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oqIro-0002dT-1x
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 14:53:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oqIrj-00064V-BP
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 14:53:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667415210;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lf60NeE/kBYQY/rl46CCynbgEwLMbhCvXhxmnCrNN0w=;
 b=Ie0NvzKTaoR70eeXuk5EJFw9kRhAB6ny4KaKQohhyKkBR2X8/j2N5AuEVSAlT+Q5lQqVl7
 aDC6JiUCNn9peYPQhSt2KhR3hJXWJs01dMkUEa1Oy55pHBdY5WNGgVtk/xUXi5Vyd2t+G2
 qOBtgP/FQMxVlOP5Gp0BpaNIdEpRZz4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-558-CQJE9ZFYPfKbXd8QR_b1UA-1; Wed, 02 Nov 2022 14:53:27 -0400
X-MC-Unique: CQJE9ZFYPfKbXd8QR_b1UA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CDEB43C0F441;
 Wed,  2 Nov 2022 18:53:26 +0000 (UTC)
Received: from localhost (unknown [10.39.192.88])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 31847492B08;
 Wed,  2 Nov 2022 18:53:25 +0000 (UTC)
Date: Wed, 2 Nov 2022 14:53:24 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Eric Biggers <ebiggers@kernel.org>, pbonzini@redhat.com
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, qemu-block@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, nsoffer@redhat.com
Subject: Re: [PATCH 2/2] file-posix: add statx(STATX_DIOALIGN) support
Message-ID: <Y2K8pJHgzx1sWJ7S@fedora>
References: <20221101190031.6766-1-stefanha@redhat.com>
 <20221101190031.6766-3-stefanha@redhat.com>
 <Y2HkziU7YVYv4KWJ@sol.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="uJrIGFXwX6waVAQX"
Content-Disposition: inline
In-Reply-To: <Y2HkziU7YVYv4KWJ@sol.localdomain>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--uJrIGFXwX6waVAQX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 01, 2022 at 08:32:30PM -0700, Eric Biggers wrote:
> On Tue, Nov 01, 2022 at 03:00:31PM -0400, Stefan Hajnoczi wrote:
> >      /* Let's try to use the logical blocksize for the alignment. */
> > -    if (probe_logical_blocksize(fd, &bs->bl.request_alignment) < 0) {
> > -        bs->bl.request_alignment =3D 0;
> > +    if (!bs->bl.request_alignment) {
> > +        if (probe_logical_blocksize(fd, &bs->bl.request_alignment) < 0=
) {
> > +            bs->bl.request_alignment =3D 0;
> > +        }
> >      }
> > =20
> >  #ifdef __linux__
> > -    /*
> > -     * The XFS ioctl definitions are shipped in extra packages that mi=
ght
> > -     * not always be available. Since we just need the XFS_IOC_DIOINFO=
 ioctl
> > -     * here, we simply use our own definition instead:
> > -     */
> > -    struct xfs_dioattr {
> > -        uint32_t d_mem;
> > -        uint32_t d_miniosz;
> > -        uint32_t d_maxiosz;
> > -    } da;
> > -    if (ioctl(fd, _IOR('X', 30, struct xfs_dioattr), &da) >=3D 0) {
> > -        bs->bl.request_alignment =3D da.d_miniosz;
> > -        /* The kernel returns wrong information for d_mem */
> > -        /* s->buf_align =3D da.d_mem; */
> > +    if (!bs->bl.request_alignment) {
>=20
> This patch changes the fallback code to make the request_alignment value =
=66rom
> probe_logical_blocksize() override the value from XFS_IOC_DIOINFO.  Is th=
at
> intentional?

Thanks for pointing out the bug. That was not intentional. Will fix.

> > +        if (ioctl(fd, _IOR('X', 30, struct xfs_dioattr), &da) >=3D 0) {
> > +            bs->bl.request_alignment =3D da.d_miniosz;
> > +            /* The kernel returns wrong information for d_mem */
> > +            /* s->buf_align =3D da.d_mem; */
>=20
> Has this bug been reported to the XFS developers (linux-xfs@vger.kernel.o=
rg)?

Paolo: Do you remember if you reported this when you wrote commit
c25f53b06eba ("raw: Probe required direct I/O alignment")?

Stefan

--uJrIGFXwX6waVAQX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmNivKQACgkQnKSrs4Gr
c8hZ+QgAt80NT5Vs4TVfdr9bw+noWVa9myDLOWNAcUnBCjlhWRjD/mwP3JP+g/Q0
TMDEQan9TRB+UGzI3RSLezVJTs2RYbPsRNBC6i6QFfv7MOAcSv0WdRm94/Jvezk4
3L1aEOgnhEcECidGkEnSCK1IG0KM6IqWa0qsgMaRDFSqiKeWcorFVaTxzXjV/9Tf
8KlEAWKznhPvk5uzpR1XlbdHNHBhJT2PPRuFcwjvtmR9tPxs4tB74Zc3v+7mnc3i
KCAIhuV8zBzgI0BGm2GYDv849oEHU9qJF32h5GLJ+vWa/6ad+SmBg8dALWgdHknH
6xaN1qoCxac51IKs7beTEYEGmnv47g==
=7K+V
-----END PGP SIGNATURE-----

--uJrIGFXwX6waVAQX--


