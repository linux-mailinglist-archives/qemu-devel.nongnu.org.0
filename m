Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE37544A5E
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 13:38:11 +0200 (CEST)
Received: from localhost ([::1]:57146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzGUM-0003aU-GR
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 07:38:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nzEHJ-0006yp-K5
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:16:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20475)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nzEHI-0007WH-4V
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:16:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654766191;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lwkGxSZYLPkmJTC77v4x2EGqTAGg0+ene4APzGJOC7U=;
 b=MDWf5SuSQOdULmzpF5g1AHtMQSyqmBmFpDJueupGi6jQ0NCXSCysOORhD+sV0uDHtuxK3b
 JedOEh95ytHEO87T1ldATH9GS9CQOost9uJHE/u7N4fBFhyx4BjgQUht+Ab9FKIPC0Ghd4
 Xs0XrqRUTSDI9JP+kPm0Kljz/yi1NIQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-505-sN8qA9zmPtGNokYzHYCYPw-1; Thu, 09 Jun 2022 05:16:26 -0400
X-MC-Unique: sN8qA9zmPtGNokYzHYCYPw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2FBEB801755;
 Thu,  9 Jun 2022 09:16:25 +0000 (UTC)
Received: from localhost (unknown [10.39.193.205])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 802C0C4C7A0;
 Thu,  9 Jun 2022 09:16:23 +0000 (UTC)
Date: Thu, 9 Jun 2022 10:16:22 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc: qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v6 03/18] job.c: API functions not used outside should be
 static
Message-ID: <YqG6ZkiG3l9fxtcp@stefanha-x1.localdomain>
References: <20220314133707.2206082-1-eesposit@redhat.com>
 <20220314133707.2206082-4-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="i+VXViujDaHbn2LL"
Content-Disposition: inline
In-Reply-To: <20220314133707.2206082-4-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--i+VXViujDaHbn2LL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 14, 2022 at 09:36:52AM -0400, Emanuele Giuseppe Esposito wrote:
> job_event_* functions can all be static, as they are not used
> outside job.c.
>=20
> Same applies for job_txn_add_job().
>=20
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>  include/qemu/job.h | 18 ------------------
>  job.c              | 22 +++++++++++++++++++---
>  2 files changed, 19 insertions(+), 21 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--i+VXViujDaHbn2LL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmKhumYACgkQnKSrs4Gr
c8jh2Af/bePlReEV6kjds0UIHoju2tqYgpQInWtyTidEPm88aO99EedyVfzJshVX
Ng0OaROcH/+HW4r5lMiN//hRPKDlryNKkq0j47wme2v6xy2h6NmrXKbJApNKMUC8
pRWxTWETZs1DoGUTG2Ao/fGHB1NrusLZcfk+XRUVvii74V0FzH0JzIiCVZ7UGmCI
NAQdxVh3reco9pkSglusPUDe/LSCSOYjzYHEqvedilcvMRmUxgxYBNXuXebFqv/F
7XG4ChXz9dHuW2zDZ4CmijNQYq/BI8BsSzEpRIxOhcDYK5zAxzXr8UceR+2VgwNT
uZWDoCZrHqf/aYELgl9dDnzmGKgb6A==
=UXue
-----END PGP SIGNATURE-----

--i+VXViujDaHbn2LL--


