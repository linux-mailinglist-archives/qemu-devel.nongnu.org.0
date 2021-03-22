Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D34343FC6
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 12:31:04 +0100 (CET)
Received: from localhost ([::1]:55936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOIlz-0003vD-BP
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 07:31:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lOIjv-0002jx-1n
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 07:28:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lOIjs-0007gj-QV
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 07:28:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616412531;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Cg8PrCpFCg3Kd6mMmbywiZOmzuF1Z4ndyFIccoxQqqw=;
 b=Xp0MmEVfOWbMJCW2Ot+PKe6uNXe87BukvNE1VK0iFs0jsfefZ3DAzUWWrLQMrhEzhgMq8j
 uN13KgRdJXxebVpyS8tbls1msGOswBfQLcn3eTTyPtSkv9ew7dxZlvq3X+/l0BTXx6u9r+
 sYBMqlJIgZUxi1E+UbzZk2YVcznOyL4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-107-tqU9mZ-wM06PtPTfTubZtw-1; Mon, 22 Mar 2021 07:28:46 -0400
X-MC-Unique: tqU9mZ-wM06PtPTfTubZtw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EFBFE107B7C5;
 Mon, 22 Mar 2021 11:28:44 +0000 (UTC)
Received: from localhost (ovpn-114-89.ams2.redhat.com [10.36.114.89])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 30E786A03C;
 Mon, 22 Mar 2021 11:28:43 +0000 (UTC)
Date: Mon, 22 Mar 2021 11:28:42 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH 0/2] Fix crash if try to remove bitmap on target during
 migration
Message-ID: <YFh/atA9gTnLX18v@stefanha-x1.localdomain>
References: <20210319204124.364312-1-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20210319204124.364312-1-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Xi4XB4EmM2Cr+YLn"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, fam@euphon.net, qemu-block@nongnu.org,
 quintela@redhat.com, dgilbert@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Xi4XB4EmM2Cr+YLn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 19, 2021 at 11:41:22PM +0300, Vladimir Sementsov-Ogievskiy wrot=
e:
> Hi all!
>=20
> Bitmaps on source are marked busy during migration.
>=20
> Enabled bitmaps on target have successor, so they are busy.
>=20
> But disabled migrated bitmaps are not protected on target. User can
> simple remove them and it lead to use-after-free. These bitmaps should
> be marked busy.
>=20
> Vladimir Sementsov-Ogievskiy (2):
>   migration/block-dirty-bitmap: make incoming disabled bitmaps busy
>   migrate-bitmaps-postcopy-test: check that we can't remove in-flight
>     bitmaps
>=20
>  migration/block-dirty-bitmap.c                         | 6 ++++++
>  tests/qemu-iotests/tests/migrate-bitmaps-postcopy-test | 9 +++++++++
>  2 files changed, 15 insertions(+)
>=20
> --=20
> 2.29.2
>=20

Thanks, applied to my block tree:
https://gitlab.com/stefanha/qemu/commits/block

Stefan

--Xi4XB4EmM2Cr+YLn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmBYf2oACgkQnKSrs4Gr
c8i91wf8C81hTPCgjwuo5ZTQFYVGyNA63JHHJb1kj5/WxgdZNESc/Rh3U0m/lQL2
HSbzSWfNLsn/BVuXNwZQFbJJyTZHBvUCohuhtY+Cb7CSbRe8aFNYRioUtz+sEVOz
/zfyvRXxburTOFuAkCUaPN/B2VCBuutww/mZAlTkB19ShOzUlj9cOa80Ixdj4Igf
7HlGsrdXjXr/GRYHVSsn7d1WDI9WV4SYSewrXBHagY4Yz76BuwE7lI+2G6oWK6mV
pdrzOBUENO2pFWncP1aW73GaPR0XLpp65S6dnuaNcp9aPTkmrlc1vTKd6D7LTNbf
gW8TdaPzISpccoEkSWS+tc5ClDH0BA==
=mQBN
-----END PGP SIGNATURE-----

--Xi4XB4EmM2Cr+YLn--


