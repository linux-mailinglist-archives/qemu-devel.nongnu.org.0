Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00DD538F846
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 04:44:24 +0200 (CEST)
Received: from localhost ([::1]:55776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llN3P-0001T9-3W
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 22:44:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1llN2Q-0000hs-RF
 for qemu-devel@nongnu.org; Mon, 24 May 2021 22:43:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1llN2M-0000YE-3e
 for qemu-devel@nongnu.org; Mon, 24 May 2021 22:43:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621910597;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=axUOVeagVyIPskLfegXmziuxt04RqMkQSh5VjHFbReI=;
 b=V/uR35QEI6yMWW0WzOvkoK0aEW4Rqt/KK03Mlz4u0Xo7FgYjnLNrr5CA0LWBTSV6yxu9rX
 bf7zD3+90w29X1B9JRCWLylqgtogzNWma8la6yq2rvchc3JkEp/tFr+artEuVZV4shP10L
 FRjzy9rKbYkjcI4DN1W7Wuk069T7v9s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-113-Sm3c-aBnOL6L_0Y_K7Buqw-1; Mon, 24 May 2021 22:43:13 -0400
X-MC-Unique: Sm3c-aBnOL6L_0Y_K7Buqw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A0CBD801107;
 Tue, 25 May 2021 02:43:11 +0000 (UTC)
Received: from localhost.localdomain (ovpn-113-137.rdu2.redhat.com
 [10.10.113.137])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 74ED962693;
 Tue, 25 May 2021 02:43:00 +0000 (UTC)
Date: Mon, 24 May 2021 22:42:58 -0400
From: Cleber Rosa <crosa@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v6 07/25] python: add MANIFEST.in
Message-ID: <YKxkMiUtNX2rYsPw@localhost.localdomain>
References: <20210512231241.2816122-1-jsnow@redhat.com>
 <20210512231241.2816122-8-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210512231241.2816122-8-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="pps43udRjUYxOwwU"
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

--pps43udRjUYxOwwU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 12, 2021 at 07:12:23PM -0400, John Snow wrote:
> When creating a source distribution via 'python3 setup.py sdist', the
> VERSION and PACKAGE.rst files aren't bundled by default. Create a
> MANIFEST.in file that instructs the build tools to include these so that
> installation from source dists won't fail.
>=20
> (This invocation is required by 'tox', as well as by the tooling needed
> to upload packages to PyPI.)
>=20
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  python/README.rst  | 2 ++
>  python/MANIFEST.in | 2 ++
>  2 files changed, 4 insertions(+)
>  create mode 100644 python/MANIFEST.in
>

I was about to propose mypy.ini to be included here, but given
that it's merged into setup.cfg later in this series:

Reviewed-by: Cleber Rosa <crosa@redhat.com>

---

Note to self (and to you) when generating the sdist, I get:

   ...
   package init file 'qemu/__init__.py' not found (or not a regular file)
   package init file 'dist/__init__.py' not found (or not a regular file)
   ...

Which may not be too harmful, but deserves investigation.

--pps43udRjUYxOwwU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmCsZCkACgkQZX6NM6Xy
CfPdJQ/+MVY2IkHzpINiEfft8xieIQXedn0hOS4k7atplNJfbU7a7o+Ap/mqYeQr
k968si9yE6EqAQnYFn8oy+/9M/eBAJHbvYQj8f7iVKmfnn22LyNb8dgMslAZU9Qp
Z4BTEhX27roB749NAVuOzM3MNHAdx+dZ+K8++97LhMHPruED0Haaen1XGfq2HOlX
5o8htyBDIEqzjHB2m8ndfz9CQ6xLuXnnCN8l8lqCZVm40EwiPO2d/TTB/osju89i
VnE+Qmn7hJt3IfCHf3TOXxUTcgbabEXo7ANbtpxk56CdjlBjEdupXSiuZVXxhfi5
816WhhSM+peiN88RWMj9W8PB3y1qNr8SSeAJk16m/kaoSIpdBAoP5Za05XvJ2rT6
XhNkY4zZ+lgCsJeXqHBvboLLKc7Q2NCfhsc3lRTqLLYHh+BUu1yBBPVxsGQDu3/l
vHYnBPsw/4WjJDPRWoSU/zBRXBUFuq8Ygp/+ZMSLwa4licyjNM6JAGvaaBV/yyGR
HypkHy/WG+/L22o+lIrc51Yj99mb5BzhpqRFSXffK2OJ7cCx9ur5GsEiNWvePZ4/
AvwpOjKjc7ik5JjMQ0zJKBldfa6IHimdnZ3Kus1MftreqR3Z6RmfeloDvpUbAN0y
bm7XP/Pd9J5ywjltb+nBY+yLtCP8jJm/vL0MXL6ieclKZbGjHQE=
=rut7
-----END PGP SIGNATURE-----

--pps43udRjUYxOwwU--


