Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4744B3933A7
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 18:24:42 +0200 (CEST)
Received: from localhost ([::1]:42762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmIoL-0002x0-BD
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 12:24:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lmIkM-0004nb-L1
 for qemu-devel@nongnu.org; Thu, 27 May 2021 12:20:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34266)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lmIiO-0006Gc-Oj
 for qemu-devel@nongnu.org; Thu, 27 May 2021 12:20:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622132312;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RxOCxJXQEJFpu/kKMzj0d2aJOfy3nC1Ohqioy1NdyvY=;
 b=BeK9+ca2WNENcByEfUXVhMt7u8qyWOETbO5F7xGwfu0FsT/BQoXC5zuiakz9fclesEL09i
 kGATCtWffnAEW4CJT1VqcObsgr5HND/1HyPJgEyY2DXBBWWuxmtxXub0PQCowB7gbY9XNd
 2mOrVwlz73hbY2x6ZEb3ydoMJ/n5miY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-144-_Wp3CU1_Mm-Aw8b5VWyKUA-1; Thu, 27 May 2021 12:18:17 -0400
X-MC-Unique: _Wp3CU1_Mm-Aw8b5VWyKUA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3785F19253C0;
 Thu, 27 May 2021 16:18:16 +0000 (UTC)
Received: from localhost (ovpn-114-2.phx2.redhat.com [10.3.114.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A951319D9B;
 Thu, 27 May 2021 16:18:09 +0000 (UTC)
Date: Thu, 27 May 2021 12:17:36 -0400
From: Cleber Rosa <crosa@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v7 31/31] gitlab: add python linters to CI
Message-ID: <20210527161736.GG1916721@amachine.somewhere>
References: <20210526002454.124728-1-jsnow@redhat.com>
 <20210526002454.124728-32-jsnow@redhat.com>
 <3acc5107-33a4-1ae7-eafb-076d39fbd6e9@virtuozzo.com>
 <36db607a-2f29-2b53-5578-c17861e0dd1c@redhat.com>
 <c507b546-6877-48de-365f-5bb44cca0cff@virtuozzo.com>
 <9cd46a4a-2b5c-6022-7067-0a0ddce6fc7b@redhat.com>
MIME-Version: 1.0
In-Reply-To: <9cd46a4a-2b5c-6022-7067-0a0ddce6fc7b@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="tvOENZuN7d6HfOWU"
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
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--tvOENZuN7d6HfOWU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 26, 2021 at 03:56:31PM -0400, John Snow wrote:
> On 5/26/21 2:47 PM, Vladimir Sementsov-Ogievskiy wrote:
> > > build requisite for PyPI packages in the event that PyPI only has a
> > > sdist and not a bdist for a given dependency during installation.
> >=20
> > i.e. some packages are compiled during installation?
>=20
> Realized I didn't answer this directly. Yes, sometimes, depending on your
> platform or your python version or how new the python package is, it may =
not
> have a binary distribution available and will require compilation.
>

But shouldn't this be known at this time, given that you're putting
the depedencies for one specific platform?  I'd very very much like
to know which packages, for this specific platform, is triggering
a Python package build that has C-based extensions.

And it would be even weired if such a package does *not* have C-based
extensions, and it's still requiring gcc.  I would judge it as a
major setuptools design issue.

> This comes up for Python 3.10 dependencies right now in particular. They =
do
> not have binary distributions because (I assume) 3.10 isn't finalized yet=
,
> so they haven't done a re-build. Or something like that.
>=20
> --js

OK... but can you share which package available only in source is
requiring gcc?  I'm not going to get a good night of sleep without
knowing that! :)

Thanks,
- Cleber.

--tvOENZuN7d6HfOWU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmCvxh4ACgkQZX6NM6Xy
CfMwxhAAn4fLFJbKQZ1T2jNWJYU2QFLcahaW4Fo5I8NZNvlw62csp7ByVrnMfb7b
DDwyDFVL8BqbdJo68mi4TzcV2NidXrklTpxohKJ4n8vHph1+vd7df+1H/28a3w0M
WN8zvZiF+vXyk2NWbQur6W0q0nzT52XGHnzzCaF7/AkPKZ7IQ1hQveJbSj9rEHdP
c2o2qnUeENRP/RSDh7GKmbXl4YLCV/9QkvyAt+19wIg8S+Gl/GeE073OOABIPTEZ
9t4M+6JyEGquLoM/z68wwwSjrVPTS57A5IB70Pc/tZZhkso9mas6nx0aD74EZmrr
K78LLmm0B6tNgsK7hLfRJaEqxzqUlR8xuUjCbN3iuQ+tvdZbSFPGpEZyOeLSyFgo
nD3nsG63aM8+WyoyRCOGYGZKmsg0JTnGhOgVKK0HYw7+0QQhh4vEVPU4V6Uz5UOV
eFX9J0SERxMeiZO3WmYMFuoegh37o2d/powECUd/WugLDaV9zofO3fj1zrx00QPW
qmstOVoL9K24eH2t8mSLY7H6/RA/4vrpCL2xoOKIj396QD7N2sFaAdrjovUV1hN0
Wdq07Q6W9HwM2Zjxfs/0Jj7EUtcVZ1Lp99nNnu5p+rfpKtf47EhFfyp0AyFn6Lql
gUsPuaSYPw7HjAj8XCvPjDr/oweWKtGD2Gcp4vUdoQ51RhVlcfY=
=WpRW
-----END PGP SIGNATURE-----

--tvOENZuN7d6HfOWU--


