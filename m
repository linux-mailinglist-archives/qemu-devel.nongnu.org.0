Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CAAE31FF17
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 20:00:29 +0100 (CET)
Received: from localhost ([::1]:54392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDB0u-0005dx-64
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 14:00:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lDAzc-00055T-GS
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 13:59:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26184)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lDAzZ-0002UA-3V
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 13:59:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613761143;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mrtLKwySMOFm14Rd5nOFINDtx5JqFBLBgMJ4Heu3Gpc=;
 b=Y0NC4leBdsPDOq237MgK/Z7MFZ1OTxutpbKIVv8dtVwm1uLGwj+bK0rYnn/EGqlduQko2P
 TokycBu/wfLYPzhDBtJFRXCI8ipm7kWKpLav9EMiG9J59fO7q1EH8tA6d3Z56htq4SsrTD
 DAiFl7QnAHnbopZ+TGbae1U3cwWRPTI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-595-j5bB5UguP_ecZTCWaZDlUg-1; Fri, 19 Feb 2021 13:59:01 -0500
X-MC-Unique: j5bB5UguP_ecZTCWaZDlUg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EEDC3107ACFE;
 Fri, 19 Feb 2021 18:58:58 +0000 (UTC)
Received: from localhost.localdomain (ovpn-114-28.rdu2.redhat.com
 [10.10.114.28])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3BF405C1BB;
 Fri, 19 Feb 2021 18:58:57 +0000 (UTC)
Date: Fri, 19 Feb 2021 13:58:55 -0500
From: Cleber Rosa <crosa@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH 0/2] Allwinner H3 fixes for EMAC and acceptance tests
Message-ID: <20210219185855.GA619233@localhost.localdomain>
References: <20210211220055.19047-1-nieklinnenbank@gmail.com>
 <e2b0052c-7dd3-36a2-64b7-3d56c23d0a2d@redhat.com>
 <YCuVC4T+TFjuskhF@redhat.com>
 <CAPan3Wo+c+4F82cM+UDQu+JH9eQdqL2gjnikXmg3PZKTXCP_jg@mail.gmail.com>
 <cc5f65a8-204b-17ad-3bba-61a3919ef798@redhat.com>
MIME-Version: 1.0
In-Reply-To: <cc5f65a8-204b-17ad-3bba-61a3919ef798@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="6c2NcOVqGQ03X4Wi"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: peter.maydell@linaro.org, Thomas Huth <thuth@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Pavel.Dovgaluk@ispras.ru, Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org,
 b.galvani@gmail.com, Niek Linnenbank <nieklinnenbank@gmail.com>,
 qemu-arm@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--6c2NcOVqGQ03X4Wi
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 19, 2021 at 07:24:01PM +0100, Philippe Mathieu-Daud=E9 wrote:
>=20
> I hope you understand the concern I have is not with you in particular,
> and I used your case to start a discussion with the QEMU community.
>=20
> FWIW I missed the URL change because I still have the image cached in
> Avocado so my testing ran fine. Which makes me wonder...
>=20
> Cleber, Willian, should Avocado display information about cached
> artifacts? Such "Using artifact downloaded 7 months ago".
>

As of Avocado 85.0 (currently used in QEMU), it's possible to set the
"expire" parameter to "fetch_asset", see:

  https://avocado-framework.readthedocs.io/en/85.0/api/test/avocado.html#av=
ocado.Test.fetch_asset

In this case, if we want assets to not be used if they're are 30 days
or older, that could be set to 86400.  The expired asset not being used,
and then not being able to be fetched again, would cause a test to be
canceled.

Cache browsing/listing/manipulation using the "avocado assets" command
is planned for Avocado 86.0, see:

  https://github.com/avocado-framework/avocado/issues/4311

> > So what I can do
> > instead is:
> >=20
> > =A0 - update the patch to use github to store the artifacts, and their
> > licenses (other tests also use github)
>=20
> Until there is better solutions, this is the option I prefer.
>

+1.

Regards,
- Cleber.

--6c2NcOVqGQ03X4Wi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmAwCm0ACgkQZX6NM6Xy
CfOqXg/+OedAWfYGLoW0Ff6Cs2CXBP3yLGWZHKCy0k1/jwghzV9Ve/LEsW6+oXeA
FKNQ6VIc6pultpz6VXeb7jxcUPezn4JmOhcY2OrRfJqJLs18g9+iYMNlMBdaVOAY
fU0R9Ou1IhpflJTTO3mE/ruCtiM5MS1swnfr9xbVNmimJ9v+i9Y7526RTtcLRrOE
zEBjvK/I27mOfSUKNC3kWBlGjG5FuL6ZZMoDDQcc79wxxCtjaqlrsCO0WxY/+BOv
kyza8Lqm/DniYMpys996Bm7fqsYgElfrqHTKLkQn5yIifFu8B8ZB3OKL/LZLwBTM
pJrn9N3J/ZVQVYzK+TB1f3JwDVlHac6f0YtzWiTOvoQuAkV+vBnTVAjSWsHowOST
mRIZlRQB2k6QHvaeExRWWSUykXDYdxd4w+PgTsrCHei7CBrOLwMeuprdYUQ8D0/K
KAAbbf+wkLC0PHRBIYpxeK6/rndSO3tl8KvidilgPdik8p6+lzf2LtcKI/AC5ajL
OxVj9flUdIdTnfvi3ciVIwH9L/YuzKDjfXc6N/BaTvcRsQ1YaHhE95WQgyLVNTnT
523Q7wMK9ZDKg5WSR8SAYM9nN0LaeV4e97NXRSqnTPnwg6k1Oafnft4e3OVb6VIK
LLpMpBTNrSEHEueK7PJpnd0WeCQxqANcQX+a2dZycRYBmVoqmP4=
=i7jE
-----END PGP SIGNATURE-----

--6c2NcOVqGQ03X4Wi--


