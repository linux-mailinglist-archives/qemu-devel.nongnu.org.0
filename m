Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00AE13BBBAF
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 12:57:10 +0200 (CEST)
Received: from localhost ([::1]:59672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0MHl-0001sr-2u
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 06:57:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m0MGe-00016V-Fc
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 06:56:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27939)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m0MGb-0007OF-Dm
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 06:56:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625482556;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jZ6Iy7F3+7sqSAnV0T2ZHs2FyaeifFi+e7eKlp3fRME=;
 b=ArZt7YUuhD8kM8gNXXtOSWlVefK8kq+l0/qoN9Zh9OApQpukoTrHQqy5G0Pt7ZLCNZhe4Y
 /ruaWDcCUet9WqibfXS5DrHX12MUBEts3Fk51FMJF4+dBtnHvcfHSK7fNJfMRhtAD0TP04
 hR91kSdDvKqRLLgjNp5jV12kAo/JINc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-274-QjkXwoHHNK6IPnGDOPy4vw-1; Mon, 05 Jul 2021 06:55:52 -0400
X-MC-Unique: QjkXwoHHNK6IPnGDOPy4vw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CA29E10C1ADC;
 Mon,  5 Jul 2021 10:55:51 +0000 (UTC)
Received: from localhost (ovpn-114-164.ams2.redhat.com [10.36.114.164])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 31EF45D9D5;
 Mon,  5 Jul 2021 10:55:50 +0000 (UTC)
Date: Mon, 5 Jul 2021 11:55:50 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH 0/2] util/async: print leaked BH name when AioContext
 finalizes
Message-ID: <YOLlNskKbbI2V/13@stefanha-x1.localdomain>
References: <20210414200247.917496-1-stefanha@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210414200247.917496-1-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="V7SBbPsQZjhfVNjn"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.441,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, eric.g.ernst@gmail.com,
 Paolo Bonzini <pbonzini@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--V7SBbPsQZjhfVNjn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 14, 2021 at 09:02:45PM +0100, Stefan Hajnoczi wrote:
> Eric Ernst and I debugged a BH leak and it was more involved than it shou=
ld be.
> The problem is that BHs don't have a human-readable identifier, so low-le=
vel
> debugging techniques and inferences about the code are required to figure=
 out
> which BH was leaked in production environments without easy debug access.
>=20
> The leak ended up already being fixed upstream but let's improve diagnost=
ics
> for leaked BHs so that this becomes quick and easy in the future.
>=20
> Stefan Hajnoczi (2):
>   util/async: add a human-readable name to BHs for debugging
>   util/async: print leaked BH name when AioContext finalizes
>=20
>  include/block/aio.h            | 31 ++++++++++++++++++++++++++++---
>  include/qemu/main-loop.h       |  4 +++-
>  tests/unit/ptimer-test-stubs.c |  2 +-
>  util/async.c                   | 25 +++++++++++++++++++++----
>  util/main-loop.c               |  4 ++--
>  5 files changed, 55 insertions(+), 11 deletions(-)
>=20
> --=20
> 2.30.2
>=20

Thanks, applied to my block tree:
https://gitlab.com/stefanha/qemu/commits/block

Stefan

--V7SBbPsQZjhfVNjn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmDi5TUACgkQnKSrs4Gr
c8hx7Af8Dg1YOJLGc0k7XU5GcJOFSJ4LJ9ABzA0VQgd8cuMekXeOJahUXegjwWXY
40nBAsS1duLhm8Ms6al2uXqKYOWV7jXMY8wEUfhClGs91yDH382JWjUdOkRvdlrz
Yr1COKXKFpydwTvY7tSo9e4xw4WambgS7iOWXUqehQkAZ2ZU4Pl/l9gDOfrk1YUU
Vc2ZV7He6WasSyrO3yXrPbiW2rIND3uJa5u/jTfirzF3sGcGSeQ56l/niwT5EpKB
8a24xFQBEHGiuimeZ2mBJkwZGUIc6YP9uJVYENMwUU1a6jXKEq9MhO8q/X6l1Qvv
T07CFYbHKAg/WIC32awqN/mM8KhqCQ==
=lJ/h
-----END PGP SIGNATURE-----

--V7SBbPsQZjhfVNjn--


