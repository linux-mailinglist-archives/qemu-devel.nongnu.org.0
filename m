Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A0A26C300E
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Mar 2023 12:16:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peZxb-0005Mv-Pp; Tue, 21 Mar 2023 07:15:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1peZxQ-0005MV-DA
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 07:15:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1peZxO-0001kH-R3
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 07:15:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679397308;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lHGu6nfn0O+6PKQtsgvZsLQEgtdouiXVkl6wARC0V44=;
 b=Et3UCbwmorSJ6y6fS4FTd4wjZi/KORNTAWFjwdmnSaI5h+m+BJjzoyj5jveS62RWMNwB1R
 r3JaOQepK/ehkQcVHbfeZOZnGkIyE3L+7GA0x6VRP3lLAyK1ZQbnV29ILnlJXimZHaKgkm
 nBcVYbyO1UZ47EUBNC6tUeXfZCecCzg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-482-nkR1G4SPN8OMkBhBmmfllw-1; Tue, 21 Mar 2023 07:15:06 -0400
X-MC-Unique: nkR1G4SPN8OMkBhBmmfllw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3AA42101A531;
 Tue, 21 Mar 2023 11:15:06 +0000 (UTC)
Received: from localhost (unknown [10.39.193.58])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B52EA2166B29;
 Tue, 21 Mar 2023 11:15:05 +0000 (UTC)
Date: Tue, 21 Mar 2023 07:15:03 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Cc: qemu-devel@nongnu.org,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH for-8.0 1/3] async: Suppress GCC13 false positive in
 aio_bh_poll()
Message-ID: <20230321111503.GA1073811@fedora>
References: <20230321083322.663561-1-clg@kaod.org>
 <20230321083322.663561-2-clg@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="lSJbyntFQp47/LbD"
Content-Disposition: inline
In-Reply-To: <20230321083322.663561-2-clg@kaod.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--lSJbyntFQp47/LbD
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 21, 2023 at 09:33:20AM +0100, C=C3=A9dric Le Goater wrote:
> From: C=C3=A9dric Le Goater <clg@redhat.com>
>=20
> GCC13 reports an error :
>=20
> ../util/async.c: In function =E2=80=98aio_bh_poll=E2=80=99:
> include/qemu/queue.h:303:22: error: storing the address of local variable=
 =E2=80=98slice=E2=80=99 in =E2=80=98*ctx.bh_slice_list.sqh_last=E2=80=99 [=
-Werror=3Ddangling-pointer=3D]
>   303 |     (head)->sqh_last =3D &(elm)->field.sqe_next;                 =
         \
>       |     ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
> ../util/async.c:169:5: note: in expansion of macro =E2=80=98QSIMPLEQ_INSE=
RT_TAIL=E2=80=99
>   169 |     QSIMPLEQ_INSERT_TAIL(&ctx->bh_slice_list, &slice, next);
>       |     ^~~~~~~~~~~~~~~~~~~~
> ../util/async.c:161:17: note: =E2=80=98slice=E2=80=99 declared here
>   161 |     BHListSlice slice;
>       |                 ^~~~~
> ../util/async.c:161:17: note: =E2=80=98ctx=E2=80=99 declared here
>=20
> But the local variable 'slice' is removed from the global context list
> in following loop of the same routine. Add an intermediate helper to
> silent GCC. No functional change.
>=20
> Cc: Stefan Hajnoczi <stefanha@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> Signed-off-by: C=C3=A9dric Le Goater <clg@redhat.com>
> ---
>  util/async.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)

Thanks!

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--lSJbyntFQp47/LbD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmQZkbcACgkQnKSrs4Gr
c8jxCAf+N4BL7YPk+NiCBLbygyWBN5E9WlevDLn/2lspewno4T1wMYjdffgiH8Y3
YnkTrBJHG4e1V9ro2dt/Dzsmre71Npd+1zoHtAyJ/FKi/ZSxzarMYFz4IVnAJshq
G81Hhw38D8bxyKV81ToFUItjgP6O5ouW/i42ZaCs8MouYejZVdw5Ayk2uLbkuVZU
Z0lsOH8kNm8pf7fYe/3OADT9GXuOL1HsCw39Nt40qq0PjHIc15eHDUhnG1GXp0si
eqwtvERaU91n952BFzHXkfc/rbaqcHoY8dQ29scVnrlUu2BqZ44kY62esRaqo79j
7KjgSDbG2QY7TXjMtFBjW5DA69/xfA==
=dbEp
-----END PGP SIGNATURE-----

--lSJbyntFQp47/LbD--


