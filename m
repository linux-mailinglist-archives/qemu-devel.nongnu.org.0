Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B6324A252
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Aug 2020 17:00:55 +0200 (CEST)
Received: from localhost ([::1]:43598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k8PaA-0005le-RB
	for lists+qemu-devel@lfdr.de; Wed, 19 Aug 2020 11:00:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1k8PYt-0004Gb-3X
 for qemu-devel@nongnu.org; Wed, 19 Aug 2020 10:59:35 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:40983
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1k8PYq-0005BW-2G
 for qemu-devel@nongnu.org; Wed, 19 Aug 2020 10:59:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597849171;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+HWWwszooCbk5xIYoyOxMRzBjWCTjjjE0Riz8fJ2Xlw=;
 b=KB2Ecf5endyQniyVNWW7lQdS8GgC5tuQS7m6E747V1ldkK9S7v+KJzKsWwNLfv7IzvOSPW
 ys/zSBEpcb+iFiS8a845LMHX+4hs/9xLKEXOpweFVwkEt/5Z4EiBA8COvV+TQoudSCH9uu
 44veM28QwbvZcvVZX6RDjBY464s0dTM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-203--SYNe0DdOpC3_F5J0vm6Rg-1; Wed, 19 Aug 2020 10:59:28 -0400
X-MC-Unique: -SYNe0DdOpC3_F5J0vm6Rg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8153E1015DC0;
 Wed, 19 Aug 2020 14:59:27 +0000 (UTC)
Received: from localhost (ovpn-113-22.ams2.redhat.com [10.36.113.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2240DBA63;
 Wed, 19 Aug 2020 14:59:26 +0000 (UTC)
Date: Wed, 19 Aug 2020 15:59:24 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v3 03/12] block/io: split out bdrv_find_conflicting_request
Message-ID: <20200819145924.GJ366841@stefanha-x1.localdomain>
References: <20200817091553.283155-1-vsementsov@virtuozzo.com>
 <20200817091553.283155-4-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20200817091553.283155-4-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="LG0Ll82vYr46+VA1"
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.81; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/19 01:46:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: fam@euphon.net, kwolf@redhat.com, qemu-block@nongnu.org, armbru@redhat.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--LG0Ll82vYr46+VA1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 17, 2020 at 12:15:44PM +0300, Vladimir Sementsov-Ogievskiy wrot=
e:
> To be reused in separate.
>=20
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  block/io.c | 71 +++++++++++++++++++++++++++++++-----------------------
>  1 file changed, 41 insertions(+), 30 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--LG0Ll82vYr46+VA1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl89PkwACgkQnKSrs4Gr
c8gbDQf/Y/eb2wHsu2fRMyzxda5vXaKWIu4i3rEuzoEWHrZI2UuDoaWurd927wN7
pnVBvZQ/pYlelAo6r2r2DRxHpGuWK9zlgGefZvMMK/bMiyAjw3R+IHg6+te7AyhX
yE/LW3G3Q74u0wfBiAhuCRF4x46q2rvqdUEiatqsX4yhUNXrSEArmd0JjHf7hvH0
pZqtKRSEdvGIP6CjtaNmlvqSRGiO0ou4xfbRCUUNWPrsFY39G9Xb/VSnCojqAajz
amftJnHIHGsdks/KVyKcfl7Fj6+7Gf09vG68KmSgovo5Dz+0kKHWX6T4w4QbXcBt
Yk562ORx3JAc1q3tzI/Ogb5LfEU8xA==
=FAUc
-----END PGP SIGNATURE-----

--LG0Ll82vYr46+VA1--


