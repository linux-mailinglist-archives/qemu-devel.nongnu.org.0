Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23ED3390718
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 19:05:02 +0200 (CEST)
Received: from localhost ([::1]:51570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llaUH-0002qS-6o
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 13:05:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1llZKS-00031P-N1
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:50:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1llZKP-00071E-K3
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:50:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621957844;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=47iyRaae1QBdFzIe4s/EeGQL6lJ1czOwZmjEdGuPYhk=;
 b=Fm1SzX0nes3Hb6RlVp7Mw6E+rcrDTtLIacNBln0CqqEHUo4ZSzd/Fg58DQiZtVIvg2P6y6
 gvKqfWhX3Nw72bTliE/oHEAPGkX9G8ClGa6JCpUaEVEJopPl8ICKjguqJ9BMbEooJwHrb2
 Zxb0z0zq/LsL4p5+uVJZ0lu//vrKQ8w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-107-aLBO40klOt6pj1l7kCaHjA-1; Tue, 25 May 2021 11:50:43 -0400
X-MC-Unique: aLBO40klOt6pj1l7kCaHjA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4369E107ACE3;
 Tue, 25 May 2021 15:50:41 +0000 (UTC)
Received: from localhost.localdomain (ovpn-112-219.ams2.redhat.com
 [10.36.112.219])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8D5E35D6AC;
 Tue, 25 May 2021 15:50:30 +0000 (UTC)
Date: Tue, 25 May 2021 11:50:27 -0400
From: Cleber Rosa <crosa@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v6 13/25] python: add excluded dirs to flake8 config
Message-ID: <YK0cw6y26fA5bnf3@localhost.localdomain>
References: <20210512231241.2816122-1-jsnow@redhat.com>
 <20210512231241.2816122-14-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210512231241.2816122-14-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="V2Y+/CCywmzWE+iY"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--V2Y+/CCywmzWE+iY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 12, 2021 at 07:12:29PM -0400, John Snow wrote:
> Instruct flake8 to avoid certain well-known directories created by
> python tooling that it ought not check.
>=20
> Note that at-present, nothing actually creates a ".venv" directory; but
> it is in such widespread usage as a de-facto location for a developer's
> virtual environment that it should be excluded anyway. A forthcoming
> commit canonizes this with a "make venv" command.
>=20
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  python/setup.cfg | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/python/setup.cfg b/python/setup.cfg
> index 9ecb2902006..f21a1c42fc0 100644
> --- a/python/setup.cfg
> +++ b/python/setup.cfg
> @@ -21,6 +21,8 @@ packages =3D find_namespace:
> =20
>  [flake8]
>  extend-ignore =3D E722  # Prefer pylint's bare-except checks to flake8's
> +exclude =3D __pycache__,
> +          .venv,
>

Given that the default set of exclusions (version control system
files) are not expected here, it LGTM to reset it with these.

Reviewed-by: Cleber Rosa <crosa@redhat.com>

--V2Y+/CCywmzWE+iY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmCtHL8ACgkQZX6NM6Xy
CfNMtA/5AWlMTXKyaIqaehPHmOYmuTQ7ps8FrtpneRxQnKt6YHjeoo1fn+qfFmVD
H4ng8upRj8fHGOb8yA4pREmJrW12HGXVDWI9S2JCX/LiK61bYHek18z47wBegWXC
vNVkJxzujJM5LLqPElCE/9OfpdMN7GedJvEVkJr1CJxt/BQgloiJCEjFvDHw48Qt
kQLzHZAMpRIRsVXKPZaDwCXlBiBb4Vy0muU8681ysP6S+pKcC/I3ZWrgZx0Y5GZ7
a+uoD2TTePFvmSVU0esiN1/NJkg8MJULTC2wmHi2ZfsT3qTOA+0ghtK9ReyH/0GB
q2nWDokk0Wk0H0dKgWIbFO+iCuvyDqY0Qus7XPbpEpcZMFYX11KrqG3wixyHUwoP
i/FR9lXpk35xqGcJ7H3MS70bGuQV0TMJ4SlLeKEVux8DzWCbRkMnAWA1MOEATiHS
Fkd5Ohym67MhUeZh3TM5aSH0Or4DcHAdW3EPMDygT8P07b+/fxLYJhWJl5MWJDVx
Ht6wb62HAceWFWmK6aRPTqyoH+cO4mhQprLd8tp8WvCoBOsqnYBNOLTcE+lRJIwC
9fHx7/caVdKw52vMnria5/jO1SysLfBTU3EdveJxyOSX3Dh/n9WKqW4vKmA4W8Px
xIQJMESL1rhKz59ZjPoUdmg0wEtCPtpPKbIE1oM22jAYxM06p2M=
=REDj
-----END PGP SIGNATURE-----

--V2Y+/CCywmzWE+iY--


