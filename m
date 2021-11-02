Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC5D2442B65
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 11:10:30 +0100 (CET)
Received: from localhost ([::1]:57036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhqkP-000183-Vk
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 06:10:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mhqho-0006oy-NZ
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 06:07:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24038)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mhqhn-0000vJ-E2
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 06:07:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635847666;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vQkJ4iF0fqS9/+Ag9z6iDchXQPsdRWUxdYmzg0loNc4=;
 b=V5ENMz10q90solt7UPpa4rnmC4K5+4oHHyHs7S3EFWA+xOXrn+f1EMfEHrzNTsA73qZEls
 OJJ4k97dl94HwjAfaeBVq0B4aRggOSi8wjqoqY0mJX6SS8/4DWcNsu/V2dX4a2lxa5kb5M
 tQS54F9A8+hHlTsiS5BFc5yIl6K7jc0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-120-JSRSunZGOAWHuT1WXmdVNA-1; Tue, 02 Nov 2021 06:07:45 -0400
X-MC-Unique: JSRSunZGOAWHuT1WXmdVNA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 26BF280A5C0;
 Tue,  2 Nov 2021 10:07:44 +0000 (UTC)
Received: from localhost (unknown [10.39.194.234])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8F5EC68D7D;
 Tue,  2 Nov 2021 10:07:43 +0000 (UTC)
Date: Tue, 2 Nov 2021 10:07:42 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [RFC PATCH 01/15] jobs: add job-common.h
Message-ID: <YYEN7gY6jpN1r8yU@stefanha-x1.localdomain>
References: <20211029163914.4044794-1-eesposit@redhat.com>
 <20211029163914.4044794-2-eesposit@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211029163914.4044794-2-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="DSA740MfYNW7OLYb"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.734,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--DSA740MfYNW7OLYb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 29, 2021 at 12:39:00PM -0400, Emanuele Giuseppe Esposito wrote:
> job-common.h contains all struct and common function that currently
> are in job.h and will be shared by job-monitor and job-driver in
> the next commits.
>=20
> No functional change intended.
>=20
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>  include/qemu/job-common.h | 300 ++++++++++++++++++++++++++++++++++++++
>  include/qemu/job.h        | 271 +---------------------------------
>  2 files changed, 301 insertions(+), 270 deletions(-)
>  create mode 100644 include/qemu/job-common.h

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--DSA740MfYNW7OLYb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmGBDe4ACgkQnKSrs4Gr
c8iTcggAhMyYLaBW/0ZyZ4L85+dnRtksAxHLtlxkQpsOEcZdb3KYLUfUA5o/eFdd
TRCNe8/vz/Z1nfFG12OJRQbODhCDB8eY+XmV89UEElMmzZRVQjJBh8Cje8KN71tM
cXO0qIl5S51i7EGkE3VFBjs4vFLm1PYN7R5iuJf6/xFYZ38hN/UCK5KDOL/hxayb
tuw7uauqepIY/cxYkGUL5x4MoVwnPQCtKE0CmkMc2I5PCRhtDT/EEQCSbm6Cx010
ln/dL3hoSxGs6q2+XPrgGNZnzdmOYXQhWd3yPeOFA/fAa8u42FYxFI7Ec130zGqS
C+M+0i8VoWmAfZrG6vEJ1AePJjOrqA==
=H0fC
-----END PGP SIGNATURE-----

--DSA740MfYNW7OLYb--


