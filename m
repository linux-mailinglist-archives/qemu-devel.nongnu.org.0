Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE9D2D108E
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 13:27:53 +0100 (CET)
Received: from localhost ([::1]:35344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmFcO-0007Ow-IX
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 07:27:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kmEkT-0006g4-O2
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 06:32:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55211)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kmEkH-0006bd-Jl
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 06:32:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607340713;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=x89gW0TXu9hA94YkYDSze6ilmB39+ZKA+72mAY6zqkc=;
 b=AoyUJuHpq7FGHs05BtDL7xsoBCdDtmyr8IlZ21JP3NBjZeEKFiiMvDTXZX22/LEEDNwlun
 mN0NV7mz4jQwhLwQydYAoJFuFOrH2BxGaOYri5gsaLNCX2i3T+YV2ZIAktJ50gW1Vkc/KW
 ydc5AVIsYSym3z0iHInrQ/46niOF5No=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-219-FH_4EaCDMrKHtXFF39eW2w-1; Mon, 07 Dec 2020 06:31:50 -0500
X-MC-Unique: FH_4EaCDMrKHtXFF39eW2w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4947ACC62A;
 Mon,  7 Dec 2020 11:31:49 +0000 (UTC)
Received: from localhost (ovpn-114-128.ams2.redhat.com [10.36.114.128])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 855DD2B6FF;
 Mon,  7 Dec 2020 11:31:45 +0000 (UTC)
Date: Mon, 7 Dec 2020 11:31:44 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Max Reitz <mreitz@redhat.com>
Subject: Re: [PATCH for-5.2 09/10] vhost-user-blk-test: test discard/write
 zeroes invalid inputs
Message-ID: <20201207113144.GE203660@stefanha-x1.localdomain>
References: <20201111124331.1393747-1-stefanha@redhat.com>
 <20201111124331.1393747-10-stefanha@redhat.com>
 <b900227e-37b1-3f59-ad66-0ef7078cdc4a@redhat.com>
MIME-Version: 1.0
In-Reply-To: <b900227e-37b1-3f59-ad66-0ef7078cdc4a@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="u5E4XgoOPWr4PD9E"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 qemu-devel@nongnu.org, Coiby Xu <Coiby.Xu@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--u5E4XgoOPWr4PD9E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2020 at 04:40:07PM +0100, Max Reitz wrote:
> On 11.11.20 13:43, Stefan Hajnoczi wrote:
> > Exercise input validation code paths in
> > block/export/vhost-user-blk-server.c.
> >=20
> > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > ---
> >   block/export/vhost-user-blk-server.c |   4 +-
> >   tests/qtest/vhost-user-blk-test.c    | 124 ++++++++++++++++++++++++++=
+
> >   2 files changed, 126 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/block/export/vhost-user-blk-server.c b/block/export/vhost-=
user-blk-server.c
> > index 3295d3c951..d88e41714d 100644
> > --- a/block/export/vhost-user-blk-server.c
> > +++ b/block/export/vhost-user-blk-server.c
> > @@ -248,8 +248,8 @@ static void coroutine_fn vu_blk_virtio_process_req(=
void *opaque)
> >               break;
> >           }
> > -        req->in->status =3D vu_blk_discard_write_zeroes(vexp, elem->ou=
t_sg,
> > -                                                      out_num, type);
> > +        req->in->status =3D vu_blk_discard_write_zeroes(vexp, out_iov,=
 out_num,
> > +                                                      type);
> >           break;
> >       }
> >       default:
>=20
> Looks like this hunk should be squashed into the previous patch.  I think
> that would lift my confusion.

Thanks, will fix.

--u5E4XgoOPWr4PD9E
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl/OEqAACgkQnKSrs4Gr
c8gepwf/RS09O1bk1CtvXOSTY9+WpxNuEASh/hIUPVnoWeTtv+4d4IeO91bWpA8u
TRU0WEmPEL6mDyNH+4FNF/fDZHQBs/vWSx6fqYQ6u55SOoMX99MkafnlMI6oezhR
lDczjL8mqbkub/+HiGKMpZrQosCCp3/4Qc3iEssiiYtqc7azy95yjDQ4ZkmNPDMq
SzdL6K+vfK1+foeTlsAkytKKSwnaxaMIh2nTWgKOYe+2pBA4K8hE7lKpF7jw7qxP
3IyRfhfLr5lk40W74rYgnhJjZRttcrrsBfasq5H+DNXU2iv+uSJFlxNwMVe4lrlA
riTNv/CD7sH3wTxUrmwPP1Cw5S8pMg==
=49vD
-----END PGP SIGNATURE-----

--u5E4XgoOPWr4PD9E--


