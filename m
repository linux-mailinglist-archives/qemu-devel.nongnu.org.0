Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E25393399
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 18:22:39 +0200 (CEST)
Received: from localhost ([::1]:36442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmImM-000785-FE
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 12:22:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lmIkI-0004mm-GK
 for qemu-devel@nongnu.org; Thu, 27 May 2021 12:20:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lmIiL-0006GE-Cn
 for qemu-devel@nongnu.org; Thu, 27 May 2021 12:20:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622132308;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sjCcqorJkaUYAl+22vGIUMMDgVZ7oIUfN7vaJpDR4dI=;
 b=My+Isnf+ZmvBLzGUgC4AVaHGnQcT7M7Vh6I7UGmmzTacPmV8nOjau8N5VF9lArPPWq6uti
 YGeMj3GO0kRunkUhnJBJ+7qfR2eR7g2G/P5GCgXBDzYAvndEoBmChWVvW4fjsrcz1BIqKZ
 UBQ0Q3R2fRfCMf/3zAH6g+WqgOmiUM0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-222-UM-bJwZBNXC-1l3QDCTxyA-1; Thu, 27 May 2021 12:18:23 -0400
X-MC-Unique: UM-bJwZBNXC-1l3QDCTxyA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 90967100946A;
 Thu, 27 May 2021 16:18:22 +0000 (UTC)
Received: from localhost (ovpn-114-2.phx2.redhat.com [10.3.114.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A574F60CC9;
 Thu, 27 May 2021 16:18:16 +0000 (UTC)
Date: Thu, 27 May 2021 12:12:00 -0400
From: Cleber Rosa <crosa@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v7 29/31] python: add .gitignore
Message-ID: <20210527161200.GF1916721@amachine.somewhere>
References: <20210526002454.124728-1-jsnow@redhat.com>
 <20210526002454.124728-30-jsnow@redhat.com>
 <ec6b802f-c705-76ae-76a0-4d7b9fd9c093@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <ec6b802f-c705-76ae-76a0-4d7b9fd9c093@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="tmoQ0UElFV5VgXgH"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Max Reitz <mreitz@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--tmoQ0UElFV5VgXgH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 26, 2021 at 12:18:55PM +0300, Vladimir Sementsov-Ogievskiy wrot=
e:
> 26.05.2021 03:24, John Snow wrote:
> > Ignore *Python* build and package output (build, dist, qemu.egg-info);
> > these files are not created as part of a QEMU build. They are created b=
y
> > running the commands 'python3 setup.py <sdist|bdist>' when preparing
> > tarballs to upload to e.g. PyPI.
> >=20
> > Ignore miscellaneous cached python confetti (mypy, pylint, et al)
> >=20
> > Ignore .idea (pycharm) .vscode, and .venv (pipenv et al).
> >=20
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
> >   python/.gitignore | 15 +++++++++++++++
> >   1 file changed, 15 insertions(+)
> >   create mode 100644 python/.gitignore

Reviewed-by: Cleber Rosa <crosa@redhat.com>

--tmoQ0UElFV5VgXgH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmCvxNAACgkQZX6NM6Xy
CfMtPBAAnYIJgAweDqOEgUmeqQd4KuOgk0rPV7YYji0w4DpWOs7M0v5rwO7anbSq
UAEJ2h9j1nJRe47vyu+6fTzlBGN7W97zNyy/a+y5YAR5BICWkY8NHoe+SeM3CjNC
tnRBDx2kJFz+njvesC29QhmHWih1MdHX1MQplsAFjoR05Jl4NDABkrEgIE/Ai+6n
2/js4dbQP8JZx/Xg7dAlNDqKRY3oL3acPrg/LtRIjoNrysCRGaF//mBOB6zMhDUs
/iCSqI2pSV261xb89kUlr2CBlKFEDGGmis1gE/paSsllFW10l4FMgjOOEO300iPk
qc7/8UG2gGAWUy1iq1BrLv4J9l0dItgtUia+JU3Kw5h4qEklRWDLvs/WIo+pjrgI
Ufk3oCKBbNaW7/+T7ywp9cjWUY2dQwSD3+DECN17Cd4xQ8Pioc4LluOukVVayjZh
BfmrD68Ni2l4uLc0Dm6I3GvGMC+RA+bxdJhwAVml2nloZJJOlDQ0CZkILoshBDlS
3CZ4rDS/yEJ9VZG2d3zkwAgdqOUIDQxLc0P+Uq6MnwC7FkZ0nAGB+hlpEqyY+KUF
ZioHjnvo3K5fZlj9CmfDGNwo7222OoxsyzDG97jxyMHei3HP9xI/pmYvF+DUen5d
WRzcgvPdLzEfSHl11xwKOZeTspOmZa45d1wcpr0P3zR2J1mmeYo=
=C9IG
-----END PGP SIGNATURE-----

--tmoQ0UElFV5VgXgH--


