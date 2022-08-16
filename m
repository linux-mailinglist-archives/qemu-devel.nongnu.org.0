Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A40D359628E
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 20:37:19 +0200 (CEST)
Received: from localhost ([::1]:49176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oO1RC-0005eq-Oh
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 14:37:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oO1MD-0002gf-94
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 14:32:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oO1MA-0002zS-AT
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 14:32:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660674721;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PQjIwWvJrShry3FxgbNDQnDieCvJD12TXfp/yiziUbs=;
 b=UAcC6ZNvZGePDc5SWhsu1EmOPoKU6OHiOosdKCbT1egpIMz/EnSMIuUuftK/WFkRzlPLy5
 SAH3JIJSjZI5ICbJ52tLSK7DGB4Xaw/UigiQ0Ltaug6dS9Jz+a1ACkdMltUnBlZ1EP4R6y
 cnJcSz9i3p0GZki1SY1ZAyWL5YtZ4+g=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-674-BuLju0kEPLiaEsq3hmrk9A-1; Tue, 16 Aug 2022 14:31:58 -0400
X-MC-Unique: BuLju0kEPLiaEsq3hmrk9A-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 96F0C8032FB;
 Tue, 16 Aug 2022 18:31:57 +0000 (UTC)
Received: from localhost (unknown [10.39.192.96])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 22E6C492C3B;
 Tue, 16 Aug 2022 18:31:56 +0000 (UTC)
Date: Tue, 16 Aug 2022 14:31:55 -0400
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
Subject: Re: [PATCH v10 05/21] job.c: add job_lock/unlock while keeping job.h
 intact
Message-ID: <Yvvim2+CLWjx9bzW@fedora>
References: <20220725073855.76049-1-eesposit@redhat.com>
 <20220725073855.76049-6-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="dIaOBIn7U/Ow81s1"
Content-Disposition: inline
In-Reply-To: <20220725073855.76049-6-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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


--dIaOBIn7U/Ow81s1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 25, 2022 at 03:38:39AM -0400, Emanuele Giuseppe Esposito wrote:
> With "intact" we mean that all job.h functions implicitly
> take the lock. Therefore API callers are unmodified.
>=20
> This means that:
> - many static functions that will be always called with job lock held
>   become _locked, and call _locked functions
> - all public functions take the lock internally if needed, and call _lock=
ed
>   functions
> - all public functions called internally by other functions in job.c will=
 have a
>   _locked counterpart (sometimes public), to avoid deadlocks (job lock al=
ready taken).
>   These functions are not used for now.
> - some public functions called only from exernal files (not job.c) do not
>   have _locked() counterpart and take the lock inside. Others won't need
>   the lock at all because use fields only set at initialization and
>   never modified.
>=20
> job_{lock/unlock} is independent from real_job_{lock/unlock}.
>=20
> Note: at this stage, job_{lock/unlock} and job lock guard macros
> are *nop*
>=20
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>  include/qemu/job.h | 138 ++++++++++-
>  job.c              | 600 +++++++++++++++++++++++++++++++--------------
>  2 files changed, 553 insertions(+), 185 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--dIaOBIn7U/Ow81s1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmL74psACgkQnKSrs4Gr
c8jXzgf/QKvsTAu1GCU86KYHxJYs2sVPj+m+uYNXV1oO58lmzwV54Nopdoxn0u4Q
V5a/hMTEjH+PzzWqiZ5ZybL+7c+9Ll8wD40UfwSIiggiuWAUR9DeZEqcD56G4ve1
Czx3juwMA4y90v3fjklHA2lOyc3P4s1a/gJq9QhJmx2cWbBh9+xQl5dznFO9yk/V
UoYXHqkA8X/IcmKnL70lRKnVlQMNEctXxQF9s38Zeuy2bmm9dqrFWzVPyPjiQtw7
udYRYUyhNM7PToeFSsdwi55k4i/Iqp0nZGokk0AkP6vWD28nnO4r1nbUO2WDEdYB
b5cBWXlHq/EulS46/2szNdXngt2UOA==
=7o4N
-----END PGP SIGNATURE-----

--dIaOBIn7U/Ow81s1--


