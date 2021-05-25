Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F01F5390714
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 19:03:34 +0200 (CEST)
Received: from localhost ([::1]:47846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llaSs-0000Mc-0h
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 13:03:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1llZQ7-0007jL-4y
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:56:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32342)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1llZQ5-00023Z-NJ
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:56:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621958196;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EQN+A0ehEOYdNysr8eLWIuKE9o/N4TjoqGPUJxNNReo=;
 b=KyqD0t55C1GN8YAlO0E7KSJvMr6589LkZiHwpaCW8AGnGEnN/v/WZPhjxY8K/H7oucEF/P
 7Cl+NVguoFdhK6M6o/NfNvwauBwbCH2sRyknKNMtxCQNd+Zmty9DJMEo2nkXha7tiyfvcm
 UtYlpjOcs+zCKoLbAL9InnSdf5H0jtk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-236-pKRbM5EpMIqF0bKdbBjxrA-1; Tue, 25 May 2021 11:56:32 -0400
X-MC-Unique: pKRbM5EpMIqF0bKdbBjxrA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B28D9803631;
 Tue, 25 May 2021 15:56:31 +0000 (UTC)
Received: from localhost.localdomain (ovpn-112-219.ams2.redhat.com
 [10.36.112.219])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0C2805C1A1;
 Tue, 25 May 2021 15:56:21 +0000 (UTC)
Date: Tue, 25 May 2021 11:56:18 -0400
From: Cleber Rosa <crosa@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v6 18/25] python/qemu: add isort to pipenv
Message-ID: <YK0eIsUzQho7zEcA@localhost.localdomain>
References: <20210512231241.2816122-1-jsnow@redhat.com>
 <20210512231241.2816122-19-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210512231241.2816122-19-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="gflyxVIMwR+pq14z"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=crosa@redhat.com;
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

--gflyxVIMwR+pq14z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 12, 2021 at 07:12:34PM -0400, John Snow wrote:
> isort 5.0.0 through 5.0.4 has a bug that causes it to misinterpret
> certain "from ..." clauses that are not related to imports.
>=20
> isort < 5.1.1 has a bug where it does not handle comments near import
> statements correctly.
>=20
> Require 5.1.2 or greater.
>=20
> isort can be run with 'isort -c qemu' from the python root.
>=20
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  python/Pipfile      | 1 +
>  python/Pipfile.lock | 4 ++--
>  2 files changed, 3 insertions(+), 2 deletions(-)

Reviewed-by: Cleber Rosa <crosa@redhat.com>

--gflyxVIMwR+pq14z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmCtHiIACgkQZX6NM6Xy
CfM3Ow//Y4oulapWJMOQK3C1n51SuKF2Yi06sTwaxKg7DOYcU0NMy7Q57Av4G30v
/A8H3tO7o9lSAPSiBgnEZw/0MNVY03Suqr53bf9z2fLf+PejcppntWTa0oxSpNvp
ujyYxRLMJfypw5yzD6R/cC3a26KnGIrZwbonmhrwhvAigTNA9h3wZsh4InFUMe0J
ozBh1NZo6Ahf12tGptboDusPn2t7wJYKWHO5O1pbLh03hJ5O+eobeqrr26zwP3o7
rbcj7pH/aYbLrn1Y+ft4o4ut1Q5yUj6H7JlpmxEzSXJ/5sTlco/w/xODFjic6oaH
cH0IrokbHoqrwFJAruvywzH2wMb6o2cPsmXVW9U2OJJbCsT2IzjgBcsdgEaJtCnR
JkxU1xK2QDvawY8ZQe3g43zrfCKw/57U0nUsmjCJ4hdlqY62Ky6V8V9jztOmFkkq
VvWmGP/iXvr52TIXQOw3IsMk9x+lXRwDGHwJLEMSZogbJTg6F6mmBPHXZNwiqlMN
JaFv1VyGi7KdLcH0qvHbmYyFC3LVQqCAnY33qKJGkZqKPeRmQRSPIGtXR1uBszyt
vq4zEz4jK/k0ly0FDFXCL5qTpyS49zKS+6/xIu3U2+NVyybnGEAKwBhgEXHZqmGa
b0UlCGxkdNqIJk9eWkKX+87+XmTpe5jdJarpyIG3ecqRj8h9kMI=
=/oyA
-----END PGP SIGNATURE-----

--gflyxVIMwR+pq14z--


