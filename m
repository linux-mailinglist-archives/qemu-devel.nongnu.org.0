Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7304137C761
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 18:11:45 +0200 (CEST)
Received: from localhost ([::1]:59654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgrSa-0005zr-H9
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 12:11:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lgrKq-0007F3-Cd
 for qemu-devel@nongnu.org; Wed, 12 May 2021 12:03:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51971)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lgrKj-0002U1-9q
 for qemu-devel@nongnu.org; Wed, 12 May 2021 12:03:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620835415;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EOGNlru/aUPqSwjfkzrFqZM2l8RHB3NatL67kuW6VQ0=;
 b=GYM/Y5UV0/iQMcH51pbLLvXmAwBdJorOd+/mrGg0G43pcc0APToc6RhTdJ9di3cUeB/Jpd
 M6zPMrvx0uq/c15BOH90YVa+ZbRXWFAGpwaMVrzZaCHSwRU/7vEawMjHPG0tC9lHN5SjsM
 DYCLPf4ujqc6aWOFqk3Ry/RPCWHbQoY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-413-rfGfCZFZPcmhrI9-AU5r1g-1; Wed, 12 May 2021 12:03:33 -0400
X-MC-Unique: rfGfCZFZPcmhrI9-AU5r1g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AD25E1922036;
 Wed, 12 May 2021 16:03:31 +0000 (UTC)
Received: from localhost (ovpn-115-51.ams2.redhat.com [10.36.115.51])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2C0FF60CE6;
 Wed, 12 May 2021 16:03:31 +0000 (UTC)
Date: Wed, 12 May 2021 17:03:29 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v3 0/8] block: refactor write threshold
Message-ID: <YJv8UcCNd7Px1vRs@stefanha-x1.localdomain>
References: <20210506090621.11848-1-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20210506090621.11848-1-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="h0jeazdoC2njA2UT"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: fam@euphon.net, kwolf@redhat.com, qemu-block@nongnu.org,
 eesposit@redhat.com, qemu-devel@nongnu.org, mreitz@redhat.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--h0jeazdoC2njA2UT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 06, 2021 at 12:06:13PM +0300, Vladimir Sementsov-Ogievskiy wrot=
e:
> Hi all!
>=20
> v3:
> 01-04,06,07: add Max's r-b.
> 01: improve commit msg and comments
> 03: improve commit msg
> 05: add more comments and qemu/atomic.h include
> 08: new, replacement for v2:08,09
>=20
> Vladimir Sementsov-Ogievskiy (8):
>   block/write-threshold: don't use write notifiers
>   block: drop write notifiers
>   test-write-threshold: rewrite test_threshold_(not_)trigger tests
>   block/write-threshold: drop extra APIs
>   block/write-threshold: don't use aio context lock
>   test-write-threshold: drop extra tests
>   test-write-threshold: drop extra TestStruct structure
>   write-threshold: deal with includes
>=20
>  include/block/block_int.h         |  19 ++---
>  include/block/write-threshold.h   |  31 +++------
>  block.c                           |   1 -
>  block/io.c                        |  11 +--
>  block/write-threshold.c           | 111 +++++++-----------------------
>  tests/unit/test-write-threshold.c |  90 ++----------------------
>  6 files changed, 52 insertions(+), 211 deletions(-)
>=20
> --=20
> 2.29.2
>=20

Aside from comments:

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--h0jeazdoC2njA2UT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmCb/FEACgkQnKSrs4Gr
c8i/+ggAhMaEHGCyfuH70WCfiYdvjJoEsBErZ7+l1UvqxxxkZ7se+6ycmfirzqmw
V8wyrUhan+q3y0LNsxkSnWZfZdBQk5WttIaspeKE31Vn8NHA2BFTjo9lUT0Cs5Vp
vUWiv0OQFY5flBih4jW0SQGYKKa6u6WDdICtllyOSEDPCh4U7HlrVGUIkmkQf3qo
wPUn0wFX39vXmV8Z3D9SdH1mUhRuB3BcFdxIkIfUqPVNewiEZSTqSaZnOoz2OJjz
KZkNHpt06gMrCTTZrW6CcwzBp86UEB2xm1XVemlkWV/8axfI0WLmMZ21X0FRrC0e
Mn05qH1LcgAQBZV2LZYDxaJ8LzOdOw==
=lTMa
-----END PGP SIGNATURE-----

--h0jeazdoC2njA2UT--


