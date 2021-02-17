Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF8231D3EE
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 03:24:48 +0100 (CET)
Received: from localhost ([::1]:42632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCCWE-0006H0-OB
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 21:24:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lCCUu-0005jC-VJ
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 21:23:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22381)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lCCUo-0003c2-V7
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 21:23:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613528596;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CIq8YFQMKuqdfMfVb/j/SRSGkm2mm9LFGxxlgfgMSWk=;
 b=bL2ybsXaMf5Ry8CVLAr2cSdgtnz7oUIJVWoFX5r0zkUXZjGdSv7ATU10XnNQ02mivEeGua
 Z49yJGFhmXSdZW2q0Zf73YnPSpx/uO7cQsV0s90OgkOKF7MafAAa+HWjP0HPupb9D/+ywG
 UF8RMfGyIAJdiRRyAjzci4ny8+IkmE0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-196-Y71is0NqPC6Qdn55QlXJaA-1; Tue, 16 Feb 2021 21:23:13 -0500
X-MC-Unique: Y71is0NqPC6Qdn55QlXJaA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E6F6A107ACF5;
 Wed, 17 Feb 2021 02:23:11 +0000 (UTC)
Received: from localhost.localdomain (ovpn-112-29.rdu2.redhat.com
 [10.10.112.29])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 261A519D6C;
 Wed, 17 Feb 2021 02:23:07 +0000 (UTC)
Date: Tue, 16 Feb 2021 21:23:05 -0500
From: Cleber Rosa <crosa@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v4 05/24] python: add qemu package installer
Message-ID: <YCx+CY3SPhnVtSgr@localhost.localdomain>
References: <20210211185856.3975616-1-jsnow@redhat.com>
 <20210211185856.3975616-6-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210211185856.3975616-6-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="cQc5rYytWC3VvkaU"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=crosa@redhat.com;
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

--cQc5rYytWC3VvkaU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 11, 2021 at 01:58:37PM -0500, John Snow wrote:
> Add setup.cfg and setup.py, necessary for installing a package via
> pip. Add a rst document explaining the basics of what this package is

Nitpick 1: setup.cfg and setup.py are indeed used by pip, your
statement is correct.  But, it hides the fact that these can be used
without pip.  On a source tree based install, you may want to simply
use "python setup.py develop" to achieve what "pip install -e" would
do (without pip ever entering the picture).

Nitpick 2: while most people will understand what you mean by "rst
document", I believe that "Add a README file in reStructuredText
format" would be more obvious.

> for and who to contact for more information. This document will be used
> as the landing page for the package on PyPI.
>=20
> I am not yet using a pyproject.toml style package manifest, because
> "editable" installs are not defined by PEP-517 and pip did not have
> support for this for some time; I consider the feature necessary for
> development.
>

I'm glad you kept it like this... I bet there's going to be another
PEP out, replacing the status quo, by the time I finish this review.

> Use a light-weight setup.py instead.
>=20
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  python/PACKAGE.rst | 32 ++++++++++++++++++++++++++++++++
>  python/setup.cfg   | 19 +++++++++++++++++++
>  python/setup.py    | 23 +++++++++++++++++++++++
>  3 files changed, 74 insertions(+)
>  create mode 100644 python/PACKAGE.rst
>  create mode 100644 python/setup.cfg
>  create mode 100755 python/setup.py
>=20
> diff --git a/python/PACKAGE.rst b/python/PACKAGE.rst
> new file mode 100644
> index 00000000000..0e714c87eb3
> --- /dev/null
> +++ b/python/PACKAGE.rst
> @@ -0,0 +1,32 @@
> +QEMU Python Tooling
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +This package provides QEMU tooling used by the QEMU project to build,
> +configure, and test QEMU. It is not a fully-fledged SDK and it is subjec=
t
> +to change at any time.
> +
> +Usage
> +-----
> +
> +The ``qemu.qmp`` subpackage provides a library for communicating with
> +QMP servers. The ``qemu.machine`` subpackage offers rudimentary
> +facilities for launching and managing QEMU processes. Refer to each
> +package's documentation
> +(``>>> help(qemu.qmp)``, ``>>> help(qemu.machine)``)
> +for more information.
> +

This gives the impression that those are the only subpackages (and
they were).  Better to reword it taking into account the qemu.utils
subpackage and possibly others (leave it open so that it doesn't rot
so quickly).

- Cleber.

--cQc5rYytWC3VvkaU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmAsfgYACgkQZX6NM6Xy
CfNpGw/6AtIKxgwdKnvzCyYfSiIn/t1U9BPVJVTq0FM8DSdJKY/gGy2EvzMIG2+I
ib/oT4gbShOx2dmXXPVSSLI6YAmz3RExoYSPjf8d7HDWa3tHU3yun7xpthWPF5aR
S+LbE0e1QlAtGiNSOR3elmr6nuzvH68ThHVO0jb2H9dSnmVOdQV4TnxfmkbzgjyA
d2t+Q0sJXbSM7Jv95dh3WkE5PsX8ycHDOl1q217ARBWJPUW/1J8gA2rmK29vlHbe
FA/hj6J/ARc8f9JIGhP/zFAj1sa2cvRbJUCTj27ETvvAHZEdoQRKNhX1pfjP/5PK
X49lHpMwO5oPBmbPGBJkxh8nU2AWmdhfUMIJqWQ+G/sbxbsaEoNvhDgiX9tsW9K0
BGe38rY7zKZ1zj2qHWMSla4arsVMrQ8TOGi3p3oK4hl9114EEqx00WB9sRtznRoA
eS+RBk6OAhqpMyISt3ZSkEV9nKgm5huHyYzrwJS1LgB4AMVqpYLHbSI2bPcV5Ky0
ecc813wH4OoUfioTtmI21+9AZsI73gfGsJAk+HFB2upkBInqiMRHavpW6+x6SU7W
oUGYxLCiQWIDUz8q+P24Fxk7ZmdvotALyTtDeb0CxyzLgrMWVoiiKOe2FHMJucFc
9O7K7diFBN0yZad3GlNmTvHmjWMVWKtgSQhOi+fn29W4BNou8Vk=
=te6/
-----END PGP SIGNATURE-----

--cQc5rYytWC3VvkaU--


