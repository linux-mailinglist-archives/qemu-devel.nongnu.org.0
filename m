Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DBCE6F5BA2
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 17:57:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puEr3-0002IG-QO; Wed, 03 May 2023 11:57:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1puEqz-0002HV-L0
 for qemu-devel@nongnu.org; Wed, 03 May 2023 11:57:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1puEqx-0008FD-Hb
 for qemu-devel@nongnu.org; Wed, 03 May 2023 11:57:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683129434;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BlvNWUBCTcsV19lwFHnEqxaCSL8V/sRCwj0UZmGrn7U=;
 b=h3EhYWJzHJ4SGiZPNJm2fp2OpoBixokHeDzIArPtKHRWvn/lOie8wKtPfObzoojAtJsjGn
 xz3Qc2z9L7WUhPoTVBqtys57aW55MTU+PCxP8i/7t2qbdyp5678adrPn0GtxOb6mzKvzz2
 BhlnrfQ7hlxKlZBA4ih07CndEdIkDsA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-327-CocsVVPTOjyv1RH-RENSfg-1; Wed, 03 May 2023 11:57:12 -0400
X-MC-Unique: CocsVVPTOjyv1RH-RENSfg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 82A2E811E7C;
 Wed,  3 May 2023 15:57:12 +0000 (UTC)
Received: from localhost (unknown [10.39.193.0])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 04E171121331;
 Wed,  3 May 2023 15:57:11 +0000 (UTC)
Date: Wed, 3 May 2023 11:57:10 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Eric Blake <eblake@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>,
 Xie Yongji <xieyongji@bytedance.com>, Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH] block/export: call blk_set_dev_ops(blk, NULL, NULL)
Message-ID: <20230503155710.GA10587@fedora>
References: <20230502211119.720647-1-stefanha@redhat.com>
 <wsbxzv6mqjsujdacnb42ma7tzmqu26cz7f7sybxu7g6wwieona@k2eclhiu2mhl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="9FPCNUHUaxHkqDFC"
Content-Disposition: inline
In-Reply-To: <wsbxzv6mqjsujdacnb42ma7tzmqu26cz7f7sybxu7g6wwieona@k2eclhiu2mhl>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


--9FPCNUHUaxHkqDFC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 03, 2023 at 10:43:16AM -0500, Eric Blake wrote:
> On Tue, May 02, 2023 at 05:11:19PM -0400, Stefan Hajnoczi wrote:
> > Most export types install BlockDeviceOps pointers. It is easy to forget
> > to remove them because that happens automatically via the "drive" qdev
> > property in hw/ but not block/export/.
> >=20
> > Put blk_set_dev_ops(blk, NULL, NULL) calls in the core export.c code so
> > the export types don't need to remember.
> >=20
> > This fixes the nbd and vhost-user-blk export types.
> >=20
> > Fixes: fd6afc501a01 ("nbd/server: Use drained block ops to quiesce the =
server")
> > Fixes: ca858a5fe94c ("vhost-user-blk-server: notify client about disk r=
esize")
> > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > ---
> >  block/export/export.c    | 2 ++
> >  block/export/vduse-blk.c | 1 -
> >  2 files changed, 2 insertions(+), 1 deletion(-)
>=20
> Reviewed-by: Eric Blake <eblake@redhat.com>
>=20
> I'm happy to add this through my NBD queue.

Sure, go ahead!

Stefan

--9FPCNUHUaxHkqDFC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmRShFUACgkQnKSrs4Gr
c8id0Af+NJuX/PrAh67DdcCKrTKjFqaJFFXkiV0PBtf27nCqtuPPt1wdyBOUeSHD
6F4H5lyU9TZYUx7KZNQaOsxY0HPRhsO+LtibhryIk61I+sJoKEYT5cKWxmCjqVx8
ZE7oDdsofIkaOST4byyWFAeCSKFlL5By+nbyPvRgmMqgEze3gVRYm5mpw+VFKWNZ
D8KtkTbvOfPVlyniajUbfw53rLYiOzWnw5Rp9hK9oJGz0H+5CJ834j/Rk7HWcFsC
aDm6vGPCZ0rdqKYyS8gp6pSLCyHhSezhgVgPk0u0uqVbwOWbY4QPWniWsPOo/KqW
YpuAW9sGJJXRH7p6pBHUCAqKuQUpXg==
=ztat
-----END PGP SIGNATURE-----

--9FPCNUHUaxHkqDFC--


