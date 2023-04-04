Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5586D6E95
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 23:02:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjnmn-0003w2-U6; Tue, 04 Apr 2023 17:01:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pjnmm-0003uH-13
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 17:01:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pjnmk-0001Ww-F8
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 17:01:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680642105;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hU59+CgsTGXo7IuR485kJWxhopO+syI1zdWvSx0jC0o=;
 b=NG5tQavAcLhXSVuGAtAEF1qSIbBzPM9QYfbNyIP0LWIl2/Rh74UWAJcPnNMizNY+Cephqw
 Rk1GomEtlWXVt67W/OeNZZDPVSTNwQ/YRmB/1ia9wAj+ig6ZuvrPb9/E2ZEAJ8p+gkurbX
 +Pg+a8JiCHz+XxemN0tfOuATBtNihxI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-410-nUUcCrVBN7ilOFNHk6niDw-1; Tue, 04 Apr 2023 17:01:41 -0400
X-MC-Unique: nUUcCrVBN7ilOFNHk6niDw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BE052185A78F;
 Tue,  4 Apr 2023 21:01:39 +0000 (UTC)
Received: from localhost (unknown [10.39.194.166])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 857D82166B26;
 Tue,  4 Apr 2023 21:01:38 +0000 (UTC)
Date: Tue, 4 Apr 2023 17:01:36 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, Julia Suvorova <jusual@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Peter Lieven <pl@kamp.de>,
 Coiby Xu <Coiby.Xu@gmail.com>, xen-devel@lists.xenproject.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefano Garzarella <sgarzare@redhat.com>, qemu-block@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Paul Durrant <paul@xen.org>, "Richard W.M. Jones" <rjones@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Aarushi Mehta <mehta.aaru20@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Fam Zheng <fam@euphon.net>, David Woodhouse <dwmw2@infradead.org>,
 Stefan Weil <sw@weilnetz.de>, Juan Quintela <quintela@redhat.com>,
 Xie Yongji <xieyongji@bytedance.com>, Hanna Reitz <hreitz@redhat.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, eesposit@redhat.com,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>
Subject: Re: [PATCH 11/13] block/fuse: take AioContext lock around
 blk_exp_ref/unref()
Message-ID: <20230404210136.GB603232@fedora>
References: <20230403183004.347205-1-stefanha@redhat.com>
 <20230403183004.347205-12-stefanha@redhat.com>
 <92b731c7-81d4-ef54-cca9-9dcb944e94f0@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="neTXd3RKoERDfsz0"
Content-Disposition: inline
In-Reply-To: <92b731c7-81d4-ef54-cca9-9dcb944e94f0@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
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


--neTXd3RKoERDfsz0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 04, 2023 at 03:46:34PM +0200, Paolo Bonzini wrote:
> On 4/3/23 20:30, Stefan Hajnoczi wrote:
> > These functions must be called with the AioContext acquired:
> >=20
> >    /* Callers must hold exp->ctx lock */
> >    void blk_exp_ref(BlockExport *exp)
> >    ...
> >    /* Callers must hold exp->ctx lock */
> >    void blk_exp_unref(BlockExport *exp)
> >=20
> > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > ---
> >   block/export/fuse.c | 4 ++++
> >   1 file changed, 4 insertions(+)
> >=20
> > diff --git a/block/export/fuse.c b/block/export/fuse.c
> > index 06fa41079e..18394f9e07 100644
> > --- a/block/export/fuse.c
> > +++ b/block/export/fuse.c
> > @@ -244,7 +244,9 @@ static void read_from_fuse_export(void *opaque)
> >       FuseExport *exp =3D opaque;
> >       int ret;
> > +    aio_context_acquire(exp->common.ctx);
> >       blk_exp_ref(&exp->common);
> > +    aio_context_release(exp->common.ctx);
> >       do {
> >           ret =3D fuse_session_receive_buf(exp->fuse_session, &exp->fus=
e_buf);
> > @@ -256,7 +258,9 @@ static void read_from_fuse_export(void *opaque)
> >       fuse_session_process_buf(exp->fuse_session, &exp->fuse_buf);
> >   out:
> > +    aio_context_acquire(exp->common.ctx);
> >       blk_exp_unref(&exp->common);
> > +    aio_context_release(exp->common.ctx);
> >   }
>=20
> Since the actual thread-unsafe work is done in a bottom half, perhaps
> instead you can use qatomic_inc and qatomic_fetch_dec in
> blk_exp_{ref,unref}?

Sure, I'll give that a try in the next revision.

Stefan

--neTXd3RKoERDfsz0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmQskC8ACgkQnKSrs4Gr
c8ge+Af/fN0G3NFCPv1dW59nNxnKDFCC+GIm48Kk+qOWta6oggk2ADk7czgcS3fN
BHk3zVgrvaoGZ8seFxN3CqKsCfYCFCkcws2IzVErHRIGpVCN6kpakDinR244u+cF
qRwtk+ME1+Yv+IcOEk/Lj+UfS6YUD0TLY8LxfbjlsQFQV5RlsRY2/f+4FzbWrFJx
+9dicHDGkWs35LeabbAWl/mki6TGMh2/APr8a87gMlRHONc4gG/ZcDOdWj+Dg9bz
ODgE6eDuf/dHMk/xrfGzwRUly4gTrZLIUZ5ADes+ZhUipijL/8fSQ35gW2tTVzNC
8shYSvBKrBNF6oFfIUluQ/7doZbp0g==
=85Ek
-----END PGP SIGNATURE-----

--neTXd3RKoERDfsz0--


