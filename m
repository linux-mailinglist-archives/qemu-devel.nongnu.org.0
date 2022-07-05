Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE5C566410
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 09:33:48 +0200 (CEST)
Received: from localhost ([::1]:39332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8d46-000290-Q1
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 03:33:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1o8d0W-0000BO-Lw
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 03:30:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37471)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1o8d0S-0002Jo-8O
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 03:30:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657006198;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fhKpuUu0stgpf96cU+HoH45VThAC4Yz8PMg0gVIDrNE=;
 b=c2IuvRXfT0KVdtu5Hbnqqjp7AXJ9D44ckCImNzOQeA3+op1MJkejtAGYBKjC2Bzj/ICiSy
 FF8goMUNzm2SFFQb077tHdueWkcODf+1JPw4khBQM1CsTu9d0tup13s0wkHW9FmPHWijus
 iL+r0HGpmvf581hFJFIaZVy7NtQzI9E=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-159-o7Q3FPzGOeCBUaf1en-Icw-1; Tue, 05 Jul 2022 03:29:55 -0400
X-MC-Unique: o7Q3FPzGOeCBUaf1en-Icw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0971C18E538C;
 Tue,  5 Jul 2022 07:29:55 +0000 (UTC)
Received: from localhost (unknown [10.39.194.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B6D3240D282E;
 Tue,  5 Jul 2022 07:29:53 +0000 (UTC)
Date: Tue, 5 Jul 2022 08:29:52 +0100
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
Subject: Re: [PATCH v8 02/20] job.h: categorize fields in struct Job
Message-ID: <YsPocPW6y7/5YyFE@stefanha-x1.localdomain>
References: <20220629141538.3400679-1-eesposit@redhat.com>
 <20220629141538.3400679-3-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="fWnrBTB7f+mmsQa6"
Content-Disposition: inline
In-Reply-To: <20220629141538.3400679-3-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
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


--fWnrBTB7f+mmsQa6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 29, 2022 at 10:15:20AM -0400, Emanuele Giuseppe Esposito wrote:
> Categorize the fields in struct Job to understand which ones
> need to be protected by the job mutex and which don't.
>=20
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> ---
>  include/qemu/job.h | 61 +++++++++++++++++++++++++++-------------------
>  1 file changed, 36 insertions(+), 25 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--fWnrBTB7f+mmsQa6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEyBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmLD6HAACgkQnKSrs4Gr
c8gUsAfxAYqQGLXUfWnru6aP1kQ/2oB6oMMTDFhf9QsVxPGOtYOp/5AAELuPLkvY
4XPysM+a8jByFzeNZ+USHTsuskx5AFPz2EyC2vr1W1MjeoHN4JyACxHpRt3dKG2o
TDydnW9LfZQO4ioGEhFfKmMtW4iGddWMmnaNnvNmAyzFbx4V+MZG6+ZBvGN4H/O2
KJbllhenrBWeRYcBU5VgiNyXlIVyhB8Pea1oGbLDvAhvULnIZklm9hQlHdsAXvud
05aQbM6Aiozd6vVb04XICM/fFkhUaKmkiS0oiLx7phudK96uELsym65eYL/8Vzhc
JwHaSsO5WzXsL5WVeMZmuvktWdcp
=6OOY
-----END PGP SIGNATURE-----

--fWnrBTB7f+mmsQa6--


