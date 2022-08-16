Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9863759627A
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 20:31:11 +0200 (CEST)
Received: from localhost ([::1]:58486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oO1LK-0002M4-Mu
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 14:31:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oO1Ik-0008RG-SF
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 14:28:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oO1Ih-0002IE-J2
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 14:28:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660674506;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8TmK7AUc1XZMhPgQknRzKoqSAMMZMrxLgsPqj/Wz3H8=;
 b=TxTqaJBXg5cvy3SELtLg8UaMmSU4G5avAtu1lJgvAfHuyz+QxF3ThHMdT1Qn2psMIGHSie
 kCwq8r4sNyIuLtKEkliYGc5cr1KqYGVDlvZDe3alMq1Z6hXAQUqDfTpxg+lpkI0R4wUlp9
 bBP/CKY3w8H2IFazZK2YzwRc85f1Pio=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-447-d5-JV-bcOZWDhpLH4-5DtQ-1; Tue, 16 Aug 2022 14:28:23 -0400
X-MC-Unique: d5-JV-bcOZWDhpLH4-5DtQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 00E963817A62;
 Tue, 16 Aug 2022 18:28:22 +0000 (UTC)
Received: from localhost (unknown [10.39.192.96])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D958C18ECC;
 Tue, 16 Aug 2022 18:28:19 +0000 (UTC)
Date: Tue, 16 Aug 2022 14:28:18 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc: qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Subject: Re: [PATCH v10 02/21] job.h: categorize fields in struct Job
Message-ID: <YvvhwlvUTyUGHnkV@fedora>
References: <20220725073855.76049-1-eesposit@redhat.com>
 <20220725073855.76049-3-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="f/KX+/puOgTO2ckE"
Content-Disposition: inline
In-Reply-To: <20220725073855.76049-3-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--f/KX+/puOgTO2ckE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 25, 2022 at 03:38:36AM -0400, Emanuele Giuseppe Esposito wrote:
> Categorize the fields in struct Job to understand which ones
> need to be protected by the job mutex and which don't.
>=20
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> ---
>  include/qemu/job.h | 61 +++++++++++++++++++++++++++-------------------
>  1 file changed, 36 insertions(+), 25 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--f/KX+/puOgTO2ckE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmL74cIACgkQnKSrs4Gr
c8gWYgf+KgLhyS8T3vrp7cNXXc88jRcFv0bRcHGeid9aA3ZWlVuG7Ko/CpwXaxWG
PtvRU1E0UDm3e6U+QJkNl7XAMbeUnAb2HMxjJH5ZzZ5HKnPPIXbbxHKYA2iL7loR
UMWjugm0qZV12UuIxgFcnzKce3GkvLIdMY2Si+Ygb1HKDMD8kXdjk0MYtPftL3XQ
exzQtrXwbWXa6t+bUZ7vpJBc1PChfOsecug26GSfb0wKgn5RJOXMB4zC8SG1/7UI
R9fP1nR13AMnm6z0cR7fVJzN04w7o5MGeXIsR8GbtehgzxpgPvgpyuRlG1y7QPeU
u7zoN1zHE0JH3J2VfFE5kTPse92aUQ==
=1D9Z
-----END PGP SIGNATURE-----

--f/KX+/puOgTO2ckE--


