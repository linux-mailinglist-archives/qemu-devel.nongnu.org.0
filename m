Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BFCE31D490
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 05:22:29 +0100 (CET)
Received: from localhost ([::1]:43482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCEM8-0003yb-9I
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 23:22:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lCEKg-0003Ui-49
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 23:20:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lCEKe-0006N4-Pe
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 23:20:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613535656;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VEYmfkG6L0ScrEnj79hOgxVSja+8vLKq8Y38HA+wlfA=;
 b=IttG2e88kUSw84aIjv+eIaA6jRi2vrQXl1hUYuFqEReBwErQXgFkZDp1dovU+Vp4wjf+1+
 AAD6istMrUswsmyDcEd6p6Ojs4s5XnwXvKflLXpmjBb4BX0Bsnl0b9a9WFyPhj4hYTuuJ1
 ZrdWYOQ9uZeWRD/8/sJRPx3T9+syctU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-245-0EFcvMF9NVq_T_9oS-4o9w-1; Tue, 16 Feb 2021 23:20:51 -0500
X-MC-Unique: 0EFcvMF9NVq_T_9oS-4o9w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AE44A100CC87;
 Wed, 17 Feb 2021 04:20:50 +0000 (UTC)
Received: from localhost.localdomain (ovpn-112-29.rdu2.redhat.com
 [10.10.112.29])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F21D719D9F;
 Wed, 17 Feb 2021 04:20:45 +0000 (UTC)
Date: Tue, 16 Feb 2021 23:20:44 -0500
From: Cleber Rosa <crosa@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v4 13/24] python: Add flake8 to pipenv
Message-ID: <YCyZnEfuyu8kTMjC@localhost.localdomain>
References: <20210211185856.3975616-1-jsnow@redhat.com>
 <20210211185856.3975616-14-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210211185856.3975616-14-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="NBVmSVMBJNKEps0c"
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--NBVmSVMBJNKEps0c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 11, 2021 at 01:58:45PM -0500, John Snow wrote:
> flake8 3.5.x does not support the --extend-ignore syntax used in the
> .flake8 file to gracefully extend default ignores, so 3.6.x is our
> minimum requirement. There is no known upper bound.
>=20
> flake8 can be run from the python/ directory with no arguments.
>=20
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  python/Pipfile      |  1 +
>  python/Pipfile.lock | 51 ++++++++++++++++++++++++++++++++++++++++++++-
>  2 files changed, 51 insertions(+), 1 deletion(-)
>=20

Reviewed-by: Cleber Rosa <crosa@redhat.com>
Tested-by: Cleber Rosa <crosa@redhat.com>

--NBVmSVMBJNKEps0c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmAsmZsACgkQZX6NM6Xy
CfNxdhAAip/aN5Usg8LJxxuDPgy33ocTNjsWOW2wHKKbfKJQxaEohXoiYiqyjNaC
CRwvJ6p3u8E2+ZCdGkDzDLqlwUkPN2sTRMmUmnDknsz7R3FXJDjAYdNMdbTHcpqG
Fk+3T/X0RrN6uCnC352xYghuq3ynAonCLypHwBl26xU4lnCv2LebFaOX4SESKJRx
dtIiytCLZf8X70i+b11h01X0SmWCIT5KUlvg+NtmWUdM68L3VERI52oh2MVwJdlT
KGtgko1WBRNp5gWK+yPKeCVuajbFZ6CgZGthOy+i+fWXGyJxM756mH7keK/GGBoa
Q4q1SoU2yS6CWjJ1wsCmNMMw+eXL7j1WyZOt9D8jRwQ3P0hHkv5El6GTUaogqovj
eKuow/jAjPvvH3xdKrYEpqVGnhxbJe7sbd4AfdPOn29iww6swLqFtfA6oDZ4NeRd
k/p7VwUVhpUllm140er5PFmo6JBOu1XrVgkh42IWx63J0lqYY9iXN97mdw/G5EDY
qaAE++A6AoJcw9v3JyxOx5dmmj675VQXCF4suQiltTrAYdWkvKsVbJK1kkpijXWY
VlyXjorAc4hLTiC75BBoxmT2EIFehteQggC9oBM0Lhl9NORnp2+nPAOfvvB4FKDJ
C9ZDPJz1NHj6cp45Y4WCZR1SfAx9A5iv2OZ5Ye50OpMqQJd5vEA=
=C+qt
-----END PGP SIGNATURE-----

--NBVmSVMBJNKEps0c--


