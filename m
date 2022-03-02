Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A85724CAA12
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 17:24:02 +0100 (CET)
Received: from localhost ([::1]:48926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPRlg-0000FJ-PO
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 11:24:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nPRjK-0006mm-6x
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 11:21:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39769)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nPRjI-00073B-Rw
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 11:21:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646238092;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZB/wvt6bdoG9OvTuZlqPnt+HH5T7lEa8xmJAX523834=;
 b=MRFpi6SwpGNHUIV/hS5sywn29DOwD2pio9Cj+wZyAOYn8Hcz+aw7Uq+lBWvHEImo7L3gq6
 eyOK2so0zbXE04OgDAQCMj18PituvTAVOF1SK7vDrg94jq5JJ4/e9n8FanKGNnB8JfH8IK
 63K3DYAvXoToB8CSBChUaRm6aX80Si8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-240-Ed_HSNxQMni1-lByb5O0wA-1; Wed, 02 Mar 2022 11:21:29 -0500
X-MC-Unique: Ed_HSNxQMni1-lByb5O0wA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0CFD0520F;
 Wed,  2 Mar 2022 16:21:28 +0000 (UTC)
Received: from localhost (unknown [10.39.195.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 72B5A866E4;
 Wed,  2 Mar 2022 16:21:22 +0000 (UTC)
Date: Wed, 2 Mar 2022 16:21:21 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [RFC PATCH 1/5] aio-wait.h: introduce AIO_WAIT_WHILE_UNLOCKED
Message-ID: <Yh+ZgZfYMyrR9AgG@stefanha-x1.localdomain>
References: <20220301142113.163174-1-eesposit@redhat.com>
 <20220301142113.163174-2-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="1oCFC9bW1QFEzjX8"
Content-Disposition: inline
In-Reply-To: <20220301142113.163174-2-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--1oCFC9bW1QFEzjX8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 01, 2022 at 09:21:09AM -0500, Emanuele Giuseppe Esposito wrote:
> Same as AIO_WAIT_WHILE macro, but if we are in the Main loop
> do not release and then acquire ctx_ 's aiocontext.
>=20
> Once all Aiocontext locks go away, this macro will replace
> AIO_WAIT_WHILE.
>=20
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>  include/block/aio-wait.h | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--1oCFC9bW1QFEzjX8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmIfmYEACgkQnKSrs4Gr
c8jOlgf+P2y/IMi28PeG45Y6zBP5XHA1fGf5c0vKd0kbYWdZqILc2H3fHTYclqUa
IPg1Qrg63etcA6pSQj5uoQ5JS9jzh3o3KajXDM7od77s0OWHvu2FFhV+HDIalmMn
CHPiMBtKU01Gsqj7YQcc7/Ir8sNbgB2ovYvBAT9uln+jtkA+zPCPTMwgNU3E+evG
a8O2x1sAauwpN0KwxMh82BMRkinE3owHj1e1yTWA0s3swLsKl9ZnDDK6MpM4GiOJ
ld2BKb/spLZOagHVBFt+gydK2dVlPtE6iDhIXkNLRhQS1EBIOUshrCx8Uxk3m0RH
4UaMYcmYqGSnTQkUzsE6QXmU9L0G6A==
=10Bb
-----END PGP SIGNATURE-----

--1oCFC9bW1QFEzjX8--


