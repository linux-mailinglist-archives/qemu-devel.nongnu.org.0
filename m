Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 257B02D2CFC
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 15:22:04 +0100 (CET)
Received: from localhost ([::1]:58710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmdsQ-0001zM-Vy
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 09:22:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kmdqw-00015l-3v
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 09:20:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kmdqo-0004TP-Hl
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 09:20:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607437220;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KrjEC3h9VW66cGjTDX6sE0TWjwn9z0/6tN3SdRDJA+M=;
 b=N8//V7byGqwXxtxo1tNfHbmOtXQlg+lPSfyS7rXPDFmHnoecpJ5U3GWBuTSFbcoFwNRj6h
 gqMiC21fB8p5G+ZaQ6FLJ8aEIsDlLUGFpzxmN6ghig7Zmef/HqGUskmvEnfojJrKF2Olhl
 m3yWU+D9XEKi8cJX0gKW5OLjsS2foc8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-156-ApB4iayLNG-ANvj5NBsXqA-1; Tue, 08 Dec 2020 09:20:15 -0500
X-MC-Unique: ApB4iayLNG-ANvj5NBsXqA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0B9F38049D2;
 Tue,  8 Dec 2020 14:20:14 +0000 (UTC)
Received: from localhost (ovpn-113-214.ams2.redhat.com [10.36.113.214])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A80EB1F401;
 Tue,  8 Dec 2020 14:20:13 +0000 (UTC)
Date: Tue, 8 Dec 2020 14:20:12 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH 0/4] tracetool: show trace-events filename/lineno in fmt
 string errors
Message-ID: <20201208142012.GC272246@stefanha-x1.localdomain>
References: <20200827142915.108730-1-stefanha@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200827142915.108730-1-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ncSAzJYg3Aa9+CRW"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--ncSAzJYg3Aa9+CRW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 27, 2020 at 03:29:11PM +0100, Stefan Hajnoczi wrote:
> This patch series improves format string compiler error messages. Instead=
 of
> showing the generated file, show the trace-events file where the format s=
tring
> is defined.
>=20
> Stefan Hajnoczi (4):
>   tracetool: add output filename command-line argument
>   tracetool: add out_lineno and out_next_lineno to out()
>   tracetool: add input filename and line number to Event
>   tracetool: show trace-events filename/lineno in fmt string errors
>=20
>  docs/devel/tracing.txt              |  3 +-
>  meson.build                         |  3 +-
>  scripts/tracetool.py                | 12 ++++---
>  scripts/tracetool/__init__.py       | 53 +++++++++++++++++++++++++----
>  scripts/tracetool/backend/ftrace.py |  4 +++
>  scripts/tracetool/backend/log.py    |  4 +++
>  scripts/tracetool/backend/syslog.py |  4 +++
>  trace/meson.build                   | 23 +++++--------
>  8 files changed, 76 insertions(+), 30 deletions(-)
>=20
> --=20
> 2.26.2
>=20

Thanks, applied to my tracing-next tree:
https://gitlab.com/stefanha/qemu/commits/tracing-next

Stefan

--ncSAzJYg3Aa9+CRW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl/Pi5wACgkQnKSrs4Gr
c8g9vgf/Urcji4hctVkU8l+cDo7u4MMdnvjx64whOiZjJAo14+bdAYNp6h+BsH1l
3RfRyWDUxozYAm+XtBzCH5tBjGxzk6siugGt8UzMJ4z4VtRUo6j6QmbgVJWU0+y8
M3mgUrbHzLnlm141rnMiQ9lbmr8ygmi7g/dYYwPvPDbsLS+nNSS7K9sdfO511dPK
Fz3TfeNhO8y+DNtU3yf/1Ud1m+eXari0HFKDA7ktpc2eYcYhE5Py/Q2qQU4EATBT
pp8u0Wf5jp+yd5pTGM5cq2/bOco23BhADr1B+dAO0M7ZqepTaM/QwPuccscWREMl
6GTOHxkG/UxqZQgTJ2wkViG0qW3bHQ==
=NHuz
-----END PGP SIGNATURE-----

--ncSAzJYg3Aa9+CRW--


