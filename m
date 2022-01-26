Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E3D749CB66
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 14:53:44 +0100 (CET)
Received: from localhost ([::1]:59216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCik3-0007AP-0Q
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 08:53:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nCiSe-0007FR-3G
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 08:35:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43158)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nCiSc-0006xR-Be
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 08:35:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643204141;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UAnTIpkInJ6xHZRCdbnjCtHThLAemdDMPtDyc/9UTA4=;
 b=AHIhWzRIHsA+tUE3EmV1oeUuY35uKU3yHkafQ88Ou/daUoVqKJu70tgCYu90bwj+Xvgay2
 sLWWXnHLr1h99HMHC76H41mZgXCcwartKalDeTrzZdYBgoCISRu55GMWz5HH2Kp8Gesit/
 viVJALpCHW8CJhsEa+hWO97cCVOGBYs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-630-492D_x-1NKOJyR0XYEafXg-1; Wed, 26 Jan 2022 08:35:40 -0500
X-MC-Unique: 492D_x-1NKOJyR0XYEafXg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 01A31100C66C;
 Wed, 26 Jan 2022 13:35:39 +0000 (UTC)
Received: from localhost (unknown [10.39.195.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4B56B6E207;
 Wed, 26 Jan 2022 13:35:14 +0000 (UTC)
Date: Wed, 26 Jan 2022 13:35:13 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v5 0/7] trace qmp commands
Message-ID: <YfFOEVvficC+nryR@stefanha-x1.localdomain>
References: <20220125215655.3111881-1-vsementsov@virtuozzo.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="9+AYiN7fj1kl8ItH"
Content-Disposition: inline
In-Reply-To: <20220125215655.3111881-1-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.155,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, michael.roth@amd.com, qemu-devel@nongnu.org,
 armbru@redhat.com, hreitz@redhat.com, pbonzini@redhat.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--9+AYiN7fj1kl8ItH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 25, 2022 at 10:56:48PM +0100, Vladimir Sementsov-Ogievskiy wrot=
e:
> This series aims to add trace points for each qmp command with help of
> qapi code generator.
>=20
> v5: small fixes and rewordings, + reshuffle patches so that main meson ch=
ange now is like in v3 and Paolo's a-b make sense again.
>=20
> 01: - fix/reword commit message
>     - fix typing in qapi/gen.py
>     - rename add_trace_events to gen_trace_events, and to _gen_trace_even=
t for private attribute
> 02: - split from 03, to make 03 a bit simpler
> 03: - reword commit message
>     - rename add_trace_events to gen_trace_events, and to _gen_trace_even=
t for private attribute
>     - rebase on 02
>     - merge here main.py changes, with new option: --gen-trace
> 04: - move some parts to other commits, so now it looks like 03 patch of =
v3, so add back a-b mark by Paolo
> 05: - split doc change from 04
> 06: - split new comments from 04
> 07: new
>=20
> Vladimir Sementsov-Ogievskiy (7):
>   scripts/qapi/gen.py: add FOO.trace-events output module
>   qapi/commands: refactor error handling code
>   qapi/commands: Optionally generate trace for QMP commands
>   meson: generate trace events for qmp commands
>   docs/qapi-code-gen: update to cover trace events code generation
>   meson: document, why we don't generate trace events for tests/ and
>     qga/
>   qapi: generate trace events by default
>=20
>  docs/devel/qapi-code-gen.rst |  23 +++++++-
>  meson.build                  |   3 ++
>  qapi/meson.build             |   7 +++
>  qga/meson.build              |  11 +++-
>  scripts/qapi/commands.py     | 101 ++++++++++++++++++++++++++++++-----
>  scripts/qapi/gen.py          |  33 ++++++++++--
>  scripts/qapi/main.py         |  10 ++--
>  tests/meson.build            |  11 +++-
>  trace/meson.build            |  11 ++--
>  9 files changed, 182 insertions(+), 28 deletions(-)
>=20
> --=20
> 2.31.1
>=20

Thanks, Vladimir. This looks great!

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--9+AYiN7fj1kl8ItH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmHxThEACgkQnKSrs4Gr
c8jB8gf/Y8rfrq2uP1magLelVogHPNpPc113dk53PDtJsUpGzEOhnCyYuxyZQupp
GH8PqXG2CpJ8x9PRcjG6pqimkViM6hQ8k3Br16/FJQFujMABoZDwF02y4LVVsYHn
nGZaiI9hFJic5r2Q7m7Z69xzujOm+ggXtVKhLNxE30FdwlqKcsrIMStaFo9N8WvB
Fm/ff6QsDIqx4lj98ZCB6pP0UEaOsPBQwIzxnEyj/vMBHX4F/ZsP+qWr/ZjfBFto
H3kSdUWB5XfP1+yn05YKbMT7aAuGTdwnpdPqZUxlXzc2+4ApCdo4cLK5jf6GTfxF
NLFNSI8wfw5NRrsu5ib6SV1vpHpCcw==
=Zg+3
-----END PGP SIGNATURE-----

--9+AYiN7fj1kl8ItH--


