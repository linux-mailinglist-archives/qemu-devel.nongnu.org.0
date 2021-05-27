Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 684D5393437
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 18:42:37 +0200 (CEST)
Received: from localhost ([::1]:37074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmJ5g-0002Wp-9A
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 12:42:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lmJ3t-0001Dy-KG
 for qemu-devel@nongnu.org; Thu, 27 May 2021 12:40:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lmJ3p-0000SC-Gr
 for qemu-devel@nongnu.org; Thu, 27 May 2021 12:40:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622133639;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QANvJ0oxL3IaetN9xM9yHsUeO/+QO/tzAlLx4ffxgOw=;
 b=AVRr4inv3I7HyfsPyUzof0ez2SOz0+MJ0u7nHYsjbSRx3Vfuj45OJg2xDJW3wJhewGXVrE
 zgstfljAl9nOKmljzKdl88MlxBhVDrfesFyEJN1khTZsS9fkoxH00oH21bWRPHLwcxB8Sv
 zKBI5GJH3vDcWZXcfrhteTMJf1/84Qg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-103-XxSS7Y5SMDaXlI3-O4IJBQ-1; Thu, 27 May 2021 12:40:37 -0400
X-MC-Unique: XxSS7Y5SMDaXlI3-O4IJBQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B6577107ACE3;
 Thu, 27 May 2021 16:40:35 +0000 (UTC)
Received: from localhost (ovpn-114-2.phx2.redhat.com [10.3.114.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AD07070585;
 Thu, 27 May 2021 16:40:29 +0000 (UTC)
Date: Thu, 27 May 2021 12:40:25 -0400
From: Cleber Rosa <crosa@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v7 31/31] gitlab: add python linters to CI
Message-ID: <20210527164025.GA2061858@amachine.somewhere>
References: <20210526002454.124728-1-jsnow@redhat.com>
 <20210526002454.124728-32-jsnow@redhat.com>
 <3acc5107-33a4-1ae7-eafb-076d39fbd6e9@virtuozzo.com>
 <36db607a-2f29-2b53-5578-c17861e0dd1c@redhat.com>
 <c507b546-6877-48de-365f-5bb44cca0cff@virtuozzo.com>
 <9cd46a4a-2b5c-6022-7067-0a0ddce6fc7b@redhat.com>
 <20210527161736.GG1916721@amachine.somewhere>
MIME-Version: 1.0
In-Reply-To: <20210527161736.GG1916721@amachine.somewhere>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="C7zPtVaVf+AK4Oqc"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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

--C7zPtVaVf+AK4Oqc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 27, 2021 at 12:17:36PM -0400, Cleber Rosa wrote:
> On Wed, May 26, 2021 at 03:56:31PM -0400, John Snow wrote:
> > On 5/26/21 2:47 PM, Vladimir Sementsov-Ogievskiy wrote:
> > > > build requisite for PyPI packages in the event that PyPI only has a
> > > > sdist and not a bdist for a given dependency during installation.
> > >=20
> > > i.e. some packages are compiled during installation?
> >=20
> > Realized I didn't answer this directly. Yes, sometimes, depending on yo=
ur
> > platform or your python version or how new the python package is, it ma=
y not
> > have a binary distribution available and will require compilation.
> >
>=20
> But shouldn't this be known at this time, given that you're putting
> the depedencies for one specific platform?  I'd very very much like
> to know which packages, for this specific platform, is triggering
> a Python package build that has C-based extensions.
>=20
> And it would be even weired if such a package does *not* have C-based
> extensions, and it's still requiring gcc.  I would judge it as a
> major setuptools design issue.
>=20
> > This comes up for Python 3.10 dependencies right now in particular. The=
y do
> > not have binary distributions because (I assume) 3.10 isn't finalized y=
et,
> > so they haven't done a re-build. Or something like that.
> >=20
> > --js
>=20
> OK... but can you share which package available only in source is
> requiring gcc?  I'm not going to get a good night of sleep without
> knowing that! :)
>=20
> Thanks,
> - Cleber.

OK, so typed-ast is the culprit, and we can attest its requirement
for a compiler here:

  https://github.com/python/typed_ast/blob/8eed936014f81a55a3e17310629c40c0=
203327c3/setup.py#L123

Now I can sleep in peace. :)

- Cleber.

--C7zPtVaVf+AK4Oqc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmCvy3YACgkQZX6NM6Xy
CfNbJA/8Ct2B/ImyOHkosSwW6Akwt9rKG3+85bt/xYBj2WxcMgGv6Lsi9kpNkZwC
xAEjchOo4aRg0HUDdXVzoMEEXDI1q0FnLPePBEWzxhzf5kB8Lk06XQqPg+Qaru8Z
KEFwztwb2Ee8eLQAeyRjG/suzWKuVlDzlsoILAFTxUVJtH63DyCiz8uTMtT4FDh9
3xopwQRqeIER+OA68HVoi5FKj//VHPgAhwBX8xjX+/9qHMxMNejn1KP9n4IHSQx6
sLUJWw7MTq3FOzNALuW2pxyylx+2pfNHHKKFM6GMDJFSUB/jS0BplyHSPprXUxd0
N9cd51vHjl0knrPqX3kcWM7NWTQUUDTkj8T1S+7x9Rln9fQtK4tQ3rTEQxvcyY9z
iUfCc2WzbriopQChpMPJH87ijBvDwbJGSeIpuPZ/QCj2c2yehLEOJj9tsHFos6/G
wUwFVDdbGhm/yWQPY6QDWnFp4QaY4oMgCpJQaxALlpUF3rGCTndICT30CurieWAd
YnoC8EqbwK7BQGN03rN43cmKyxH2uCUWhlT/I5UPfTCwAXTOd/jkZRdH4s/VMEMl
cWwOQl9uD0nEAQPCMQEPgH6d2kdDS5wcBPA5bAb8PJgPFqmAzE2SWilYTrX9Dhyy
FgI1y1Nwe3kdetTLZB7WHyS9ao+q/I9/1AKTRpjdP7vlIei6Fzs=
=CIGb
-----END PGP SIGNATURE-----

--C7zPtVaVf+AK4Oqc--


