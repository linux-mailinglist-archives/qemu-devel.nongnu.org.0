Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3795256645C
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 09:47:01 +0200 (CEST)
Received: from localhost ([::1]:56618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8dGu-0006Q2-4w
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 03:47:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1o8dEl-0004Bz-K9
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 03:44:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1o8dEj-0004XD-Ug
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 03:44:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657007085;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XReC9IhY46OqDA3jH252Cml26JPvHGVTSrdbYp/fCIM=;
 b=gVrF4QQzZ/QpLPItafDXxsNPprPgf/QxkvK6nltimNpmNgI9hxxzJA2Qda/3DT8bK1AauD
 zJuCGjZ03XWEj0lmMK23gS7CClt8Eagn6T4Hmoi6ZRbEJY3eSeo8xvjbkV4EVSLadrOZ9M
 XoErGq8EnTTalU8AljCVs0YYIFJKoFc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-126-ioc8sSacPVuLYfRoSb3u-A-1; Tue, 05 Jul 2022 03:44:38 -0400
X-MC-Unique: ioc8sSacPVuLYfRoSb3u-A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4B4D3811E81;
 Tue,  5 Jul 2022 07:44:38 +0000 (UTC)
Received: from localhost (unknown [10.39.194.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E38842026D64;
 Tue,  5 Jul 2022 07:44:37 +0000 (UTC)
Date: Tue, 5 Jul 2022 08:44:36 +0100
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
Subject: Re: [PATCH v8 07/20] job.h: add _locked public functions
Message-ID: <YsPr5FALHarTZF1s@stefanha-x1.localdomain>
References: <20220629141538.3400679-1-eesposit@redhat.com>
 <20220629141538.3400679-8-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Tn2q+XanlTGrlPLZ"
Content-Disposition: inline
In-Reply-To: <20220629141538.3400679-8-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
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


--Tn2q+XanlTGrlPLZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 29, 2022 at 10:15:25AM -0400, Emanuele Giuseppe Esposito wrote:
> These functions will be used later when we use the job lock.
>=20
> Note: at this stage, job_{lock/unlock} and job lock guard macros
> are *nop*.
>=20
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>  include/qemu/job.h | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--Tn2q+XanlTGrlPLZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmLD6+QACgkQnKSrs4Gr
c8gqpwgAuKmEk+e+4oGY2CBT+AZxC64Lm6/4ksx00VwFzWXsItuPENvGxkBLPWtv
KsuKHLt6bIN+K8EllaUIx675Wx9uaGkaqwy4MI2pon3rKekQCxN1ieVWcOmxh9Pg
9sM8ZamH+8ZJin5xJSOZxuFMHI8xDJ1k4h9RzkoHC5EClFG7BJoIVadRM7ck7mcu
ZGOE8vO9xaAPrK74zMiijogbKB3PYIUT5rewiB45RUU2KkQsydBedf1NgUfvNQG9
DiukAQtMqcSvfdyllYK3V/+yQtFsXp0VcgJUGk02VEzkPnt45dqIovmIxsirT/F/
5lPWYaFXfk5RZ8rqXkC1fhYDo0Vslg==
=3wSN
-----END PGP SIGNATURE-----

--Tn2q+XanlTGrlPLZ--


