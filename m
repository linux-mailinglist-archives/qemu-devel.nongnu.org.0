Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA082390765
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 19:20:22 +0200 (CEST)
Received: from localhost ([::1]:41580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llaj7-00018y-Sn
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 13:20:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1llZhV-0003dK-V3
 for qemu-devel@nongnu.org; Tue, 25 May 2021 12:14:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21014)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1llZhN-00043t-PI
 for qemu-devel@nongnu.org; Tue, 25 May 2021 12:14:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621959267;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hx+MMlf/y5UN1J1lbKAxYnAXtR9f+6wZjEu87z44zXA=;
 b=UObfNgvQZvyt+Zln8fmZYLaIm5NKm8XC3Yl5fCZjD5nmrCIC+/IFF//lHNPVByMJMjo/as
 7iolvBGR9Md2FBZP9dJf8spnLtbYQxVo32OhTEhAIa3VfoAOXG2zWjcb04apgDx1YqdVem
 LgLBRqMhsxMxu8fU4ElS4Im0LCGeLgo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-202-smLNGS2SP8uMkMKHE8s9pw-1; Tue, 25 May 2021 12:14:23 -0400
X-MC-Unique: smLNGS2SP8uMkMKHE8s9pw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 68D4FBBEE5;
 Tue, 25 May 2021 16:14:22 +0000 (UTC)
Received: from localhost.localdomain (ovpn-112-219.ams2.redhat.com
 [10.36.112.219])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 218835C1B4;
 Tue, 25 May 2021 16:14:01 +0000 (UTC)
Date: Tue, 25 May 2021 12:13:58 -0400
From: Cleber Rosa <crosa@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v6 20/25] python: add devel package requirements to
 setuptools
Message-ID: <YK0iRgCDgKfVogKD@localhost.localdomain>
References: <20210512231241.2816122-1-jsnow@redhat.com>
 <20210512231241.2816122-21-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210512231241.2816122-21-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="gJxed1gFG90j5Rm3"
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

--gJxed1gFG90j5Rm3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 12, 2021 at 07:12:36PM -0400, John Snow wrote:
> setuptools doesn't have a formal understanding of development requires,
> but it has an optional feataures section. Fine; add a "devel" feature
> and add the requirements to it.
>=20
> To avoid duplication, we can modify pipenv to install qemu[devel]
> instead. This enables us to run invocations like "pip install -e
> .[devel]" and test the package on bleeding-edge packages beyond those
> specified in Pipfile.lock.
>=20
> Importantly, this also allows us to install the qemu development
> packages in a non-networked mode: `pip3 install --no-index -e .[devel]`
> will now fail if the proper development dependencies are not already
> met. This can be useful for automated build scripts where fetching
> network packages may be undesirable.
>

This is a fairly exotic feature of setuptools, with very very few
packages that I know about using it.  With most users (I believe)
relying on pipenv to get the exact packages, the setuptools/pip use
case may fall into obscurity IMO.

So my suggestion is: consider better exposing the fact that this is
available (a documentation section perhaps).

> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  python/Pipfile      |  5 +----
>  python/Pipfile.lock | 14 +++++++++-----
>  python/setup.cfg    |  9 +++++++++
>  3 files changed, 19 insertions(+), 9 deletions(-)
>

Either way,

Reviewed-by: Cleber Rosa <crosa@redhat.com>

--gJxed1gFG90j5Rm3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmCtIj8ACgkQZX6NM6Xy
CfNhmQ/9HKartwwN2oB2yhcR7z51wdLcgoaMx3tQ5Bge0bndMSd2A5IB8woe60lX
a646obZJzBkWdOjDp8BaVmaBWmLqZL6RLY3z8ZET00j1pOyutLL6e0xkCzozrcrk
Xap7S2/P34stp+ukWo8G/UNpTptW1zEZxlxi+tNU3kZibdSfKGN8zvjoVhDkC3Nb
N0e7M/91SKaYqixFE6CJsQ/qW8qtMcI7puGpQG0ldIUAuWnL2L+O2yJiW8sA/z25
ditstoaDCrKS3TSenUANz+x3Rqc7sHiOlyz1FJFXdTG71l4Ggpo8lGwbuE5meYPA
9sqkm7YgUxnbQfVD8BaK/2dHpUq/4C70iV6vuvccZ6+U6y85FdQ9bW6cAaIuZi3w
ToNXKbR/JY/wy8tptKK0rd2etfR4cOGeXdUd4sxdNBbi2Zz91zKwWHG49JaTkWCt
zmrwnFM58yKBjBO7c2Wh0WucvRmOfF8CxRTacmrD7yUGLnvIJ7eIUpXVI0AJfVKG
yvJN/nvhkcf5s0eUx68+FxpwUAhHm/Pa64BtXau986G0cMj58n7D8qHfO/BXl8L1
sXJvqtOyPl9iRoRACuQwe7I8b/HGUdNOK4Hg78p24n+b+idXcGpSVr/bLdtQvn9D
lSYvD2xMZMvrhPWuFYpBBIuFEU/Exxg+lT3j/siRnozeVSu5d9o=
=mL3g
-----END PGP SIGNATURE-----

--gJxed1gFG90j5Rm3--


