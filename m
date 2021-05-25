Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 532CD3909BF
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 21:38:03 +0200 (CEST)
Received: from localhost ([::1]:41500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llcsM-0005a5-11
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 15:38:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1llcqy-0004jx-Ez
 for qemu-devel@nongnu.org; Tue, 25 May 2021 15:36:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1llcqv-0001fE-Ea
 for qemu-devel@nongnu.org; Tue, 25 May 2021 15:36:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621971392;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=e4susosk13NEE6SSItoXjCBaDB0v1ryQAsTmz0qKdV4=;
 b=gHudt3TfdIKqcjaYIaDgLBOwYLMd3wYXhy9aaQ/ytDYxS9L5FeZuNy95rT1hS+Dx26hsBj
 7LgXPPtFlj5F53xuniDgmi7z9rKcfosx0u1lGrpG3VRperugs/yBNrIzquGnjrSlWmuPEl
 mTOAvW+b9Tvx4BppU+whwKcQDnSqcQA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-284-sQz3tSniNRSuuKeUh3CBtA-1; Tue, 25 May 2021 15:36:30 -0400
X-MC-Unique: sQz3tSniNRSuuKeUh3CBtA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E07DF90D1C2;
 Tue, 25 May 2021 19:36:24 +0000 (UTC)
Received: from localhost.localdomain (ovpn-112-219.ams2.redhat.com
 [10.36.112.219])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C62895C1A1;
 Tue, 25 May 2021 19:36:13 +0000 (UTC)
Date: Tue, 25 May 2021 15:36:10 -0400
From: Cleber Rosa <crosa@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v6 23/25] python: add .gitignore
Message-ID: <YK1RqhFrWt6yHuRt@localhost.localdomain>
References: <20210512231241.2816122-1-jsnow@redhat.com>
 <20210512231241.2816122-24-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210512231241.2816122-24-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="/OEI0uzg/FWoWCbN"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

--/OEI0uzg/FWoWCbN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 12, 2021 at 07:12:39PM -0400, John Snow wrote:
> Ignore *Python* build and package output (build, dist, qemu.egg-info);
> these files are not created as part of a QEMU build.
>=20
> Ignore miscellaneous cached python confetti (__pycache__, *.pyc,
> .mypy_cache).
>=20
> Ignore .idea (pycharm) .vscode, and .venv (pipenv et al).
>=20
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  python/.gitignore | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>  create mode 100644 python/.gitignore
>=20
> diff --git a/python/.gitignore b/python/.gitignore
> new file mode 100644
> index 00000000000..e27c99e009c
> --- /dev/null
> +++ b/python/.gitignore
> @@ -0,0 +1,19 @@
> +# python bytecode cache
> +*.pyc

This is a duplicate from the parent .gitignore, so I would avoid it.

> +__pycache__/

And this one is interesting because, the only thing that *should* be
in __pycache__ dirs is .pyc files (covered by the parent .gitignore
file).

So, I get the same behavior without these two entries here, so I would
skip them.  Let me know if you have any reason for explicitly
including them.

- Cleber.

--/OEI0uzg/FWoWCbN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmCtUaQACgkQZX6NM6Xy
CfPOaw//SeeYZVUKleGpIFFdSFILTdTL69Cf9B34HvOOQpMsHtwbojDpBzR4QBYY
051+QVkWSGaLYKYcC+Fm3L4ZnEU29af5pqA23z8Yrc5GgOzxNSa2XmyAnL0+BJj3
jGN2OuAObADCHJmrjknBaOS2g/W543epd7V/b/HR7k11KOJfSpumDTQDfCsNmOvq
K1aThClOFNitAlEaTJ2g1KSNaC7Qs4Xo12eGXZIx6IbIsIfv3ge4KO7yxyEY7heu
Qwr2cf5RDEU9kaK3K7vMHrk8SArFPnz3hrqBc0UrYxtjBbvjoieHx9lf/7JDz7Sa
4Em9Us7Qr8lMxkgBZ4H9UJU/LHjoJctO6dQvq1ocfD7ZUrK/gTbZGC2QJtToDx88
J/PCIwCNEhlajQo9Qdok5L5VusGlnBXpYLGLw8K0alqRkkH//8kfooPmqdxyGz/3
X7YRqDlYyogUBPPN+OEFFssy0NK4ELgYbDhaZ/hh4wvZY7WsXCtaZF0NqxAdFOq7
B4dxEsBXc6xCikQ2nypnox+kBiIaLGYKDl2oBfXDyJ4zYcYZSGgxBZKkYIs83NhP
IXC3CjohbHd4YGclHOyN7nNJ5R7JsWpsKv4OdQ837eeJ3/rWF5pZOD73JFaNs13s
jnOAxBHbCngiQMkYVUdqIJEsxAJnxAEwdFxgU+Odx26/fCl+6ck=
=8Ev2
-----END PGP SIGNATURE-----

--/OEI0uzg/FWoWCbN--


