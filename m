Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7502324121
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 17:05:19 +0100 (CET)
Received: from localhost ([::1]:50148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEwf8-00069V-Pp
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 11:05:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lEwYP-0001JR-Fr
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 10:58:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51965)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lEwYK-0002yu-Ih
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 10:58:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614182295;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pbkDDxgExv3Z/HgSETGXl6E6MhalSF9bWDYz/u8p1Ew=;
 b=fgGRay8ckGCGrTVqXbIkoeOKgoYWcO+6OrVE63buny8WqlZDRDORe/UnMU8InwNCxyd/lT
 /yLMmZfl8OovAE3dud4l2rM9ZeydR36EPs5pFDQ1Y74iQrpzyNDyCx7ZrGT3mdhiex3NrS
 4VPcajT4NOLG4yf9l18B4uGA7FblA24=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-16-Ywxt271-NiKS2JJNGkKznw-1; Wed, 24 Feb 2021 10:58:10 -0500
X-MC-Unique: Ywxt271-NiKS2JJNGkKznw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E98BE119F557;
 Wed, 24 Feb 2021 15:54:11 +0000 (UTC)
Received: from localhost (ovpn-114-28.rdu2.redhat.com [10.10.114.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9CBA55C224;
 Wed, 24 Feb 2021 15:54:11 +0000 (UTC)
Date: Wed, 24 Feb 2021 10:54:06 -0500
From: Cleber Rosa <crosa@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH v5 4/4] Jobs based on custom runners: add job definitions
 for QEMU's machines
Message-ID: <20210224155406.GB1074102@amachine.somewhere>
References: <20210219215838.752547-1-crosa@redhat.com>
 <20210219215838.752547-5-crosa@redhat.com>
 <21f882ba-21db-2d45-0e74-be27e1119355@redhat.com>
 <YDUlozcbgzWfQetX@redhat.com>
 <20210223182539.GH987581@amachine.somewhere>
 <247471f5-1b65-b93c-8c23-18857653e3b8@redhat.com>
MIME-Version: 1.0
In-Reply-To: <247471f5-1b65-b93c-8c23-18857653e3b8@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="6sX45UoQRIJXqkqR"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Erik Skultety <eskultet@redhat.com>,
 Stefan Hajnoczi <stefanha@gmail.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Andrea Bolognani <abologna@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--6sX45UoQRIJXqkqR
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 24, 2021 at 01:00:54PM +0100, Philippe Mathieu-Daud=E9 wrote:
> On 2/23/21 7:25 PM, Cleber Rosa wrote:
> > On Tue, Feb 23, 2021 at 03:56:19PM +0000, Daniel P. Berrang=E9 wrote:
> >>
> >> Urgh, well that's a big problem. We certainly don't want *anything* be=
ing
> >> placed on the custom runners without explicit opt-in, otherwise jobs r=
un
> >> in the main repo have a different environment from when users run on t=
heir
> >> personal forks.
> >>
> >> IOW, we need anti-affinity against our custom runners really.
> >>
> >=20
> > I'm assuming Phil missed that documentation, because that's a
> > non-issue, really.
> >=20
> > Just unchecking the "Run untagged jobs" check box on the runner
> > configuration makes sure that the custom runners won't pickup any jobs
> > not *specifically* tagged for them.
>=20
> Can we explicit this when registering the runner instead of having to
> access the WebUI?
>=20
> $ gitlab-runner register --help
>=20
>    --run-untagged
>      Register to run untagged builds; defaults to 'true'
>      when 'tag-list' is empty [$REGISTER_RUN_UNTAGGED]
>=20

Sure thing, I will change the default behavior on the next version.

Thanks,
- Cleber.

--6sX45UoQRIJXqkqR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmA2dpwACgkQZX6NM6Xy
CfNceQ//doK1HNCO7WGQCOBIJNxGzZLqnUlJ+ScJQ1Gah/UrVge3b6KVLcotnO1g
kQZPGsyloS4py5wxZaBT/SeWgdDWRnlRwrowt7WgEWWetNnKZvyI1Du9AujoQ6aJ
UvaT1rKJ6/bdzvKjTEG+oY7S0y4e2S+fh/P8nHQm9TWPPyfybGIvhCFcL8C1sW+7
hXVKbuPNlOwgZ9aHXY8zzGqLafyna/ReOu1zAUfne4grKCdzVqGgAQmM+jCvdH7g
WTxT8SRbV6a8u+s/dQn/W0gxIi/5YIGRPijM4hQTBZiDkqe8f+fKERTHM4dk7pdh
uTroj/hQ0entS0inP9v2dXTDsaWVbspGLWsOXMn+Kqm5QQaSWdYkHXvjMm5I+3pU
D1xHkkZTS/tNd4ZeXT2WYDwnmnxktha+Wr+/m5NwoNpvm+5rxr+eyyCOoiEm9CZ7
D6DV9AmsEb9zcH81b2uqEXYTQUV6zRZIswIyVI/6Z3JsVErCBY2j264+2tuY0LW6
57zG03zekG3SUO2IHb3hqFO1b75LSEW4/uHLfYDxdDTEIn+cR6Icd+hlYDdVe21H
KVO8WgnWJPe/CEie53GuMv11AiF9KYjIz6DuRcMUeUfxEAMZp01dr0bjI72I5QP5
TF7vKpR9Dqy4frCZiJJstsldHVzlNtRv7Qy6lJnmpNMDdDC98Fw=
=qck3
-----END PGP SIGNATURE-----

--6sX45UoQRIJXqkqR--


