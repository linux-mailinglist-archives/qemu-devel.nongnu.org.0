Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B09429D1F5
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Oct 2020 20:51:12 +0100 (CET)
Received: from localhost ([::1]:40506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kXrTT-0004a7-KR
	for lists+qemu-devel@lfdr.de; Wed, 28 Oct 2020 15:51:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1kXrRk-0003t1-PE
 for qemu-devel@nongnu.org; Wed, 28 Oct 2020 15:49:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1kXrRe-0003fl-R1
 for qemu-devel@nongnu.org; Wed, 28 Oct 2020 15:49:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603914557;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bHSkTcijxqPSn6/SaXZXt/LlVTjaN+kaDiX8yNxYKvw=;
 b=aUYKF2snXJFunow2NwCbJC/JQaMevhZNgt86NLxNTLuObecwlglvVM7+9RT7u2n1hgEZ3X
 vKZkajR6EbxDmi0K8zX6QLvUGWyapEGnjXIRqRW3+oEvuWV1dl1GSQUjQckr1uZdfWwURM
 G6KWbFg8oTBEhT6xYsgiw2M6f3+Lp7I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-118-XIshdmGuPS-yOo37_MNpRA-1; Wed, 28 Oct 2020 15:49:12 -0400
X-MC-Unique: XIshdmGuPS-yOo37_MNpRA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 61E47191E2A1;
 Wed, 28 Oct 2020 19:49:11 +0000 (UTC)
Received: from localhost.localdomain (ovpn-119-55.rdu2.redhat.com
 [10.10.119.55])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C32F55578C;
 Wed, 28 Oct 2020 19:49:06 +0000 (UTC)
Date: Wed, 28 Oct 2020 15:49:05 -0400
From: Cleber Rosa <crosa@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v3 02/15] python: add qemu package installer
Message-ID: <20201028194905.GF2201333@localhost.localdomain>
References: <20201020193555.1493936-1-jsnow@redhat.com>
 <20201020193555.1493936-3-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201020193555.1493936-3-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="JSkcQAAxhB1h8DcT"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/28 01:51:10
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Ben Widawsky <ben@bwidawsk.net>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Andrea Bolognani <abologna@redhat.com>,
 Rohit Shinde <rohit.shinde12194@gmail.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--JSkcQAAxhB1h8DcT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2020 at 03:35:42PM -0400, John Snow wrote:
> Add setup.cfg and setup.py, necessary for installing a package via
> pip. Add a rst document explaining the basics of what this package is
> for and who to contact for more information. This document will be used
> as the landing page for the package on PyPI.
>=20
> I am not yet using a pyproject.toml style package manifest, because
> using pyproject.toml (and PEP-517) style packages means that pip is not
> able to install in "editable" or "develop" mode, which I consider
> necessary for the development of this package.
>=20
> Use a light-weight setup.py instead.
>=20
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  python/PACKAGE.rst | 26 ++++++++++++++++++++++++++
>  python/setup.cfg   | 18 ++++++++++++++++++
>  python/setup.py    | 23 +++++++++++++++++++++++
>  3 files changed, 67 insertions(+)
>  create mode 100644 python/PACKAGE.rst
>  create mode 100755 python/setup.cfg

I missed this earlier: setup.cfg does not need to have the execute bit
on.

- Cleber.

--JSkcQAAxhB1h8DcT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAl+ZyzAACgkQZX6NM6Xy
CfNbjQ//ZNsMe8ZZSZou8a8POZ6j+mOtw6z2YY4TESyoBi4mwRfSwGiQtKNWt0IN
5fs7//OI82gkpddBspFax3IXSzbpYzdPrV5LxkQlzoheo/eijHkyDDB0zV6+YGVS
KfVSyumdvDNdpErlVlfFUHzlUYNNvUipGmHqyZWYXGQA8pyPnD5W4YMgy1X3G1zK
4MXsSVENGc2Hzt/3g1yv9C3s+6aO9UrITOffHbMmIMcJlp6MSio1gk6fAG0yR3WZ
1QKN2rs7Vjxk1eRYZYBtdG4o0IVd4/TtdZr8uwHeJ5IJtxUxthDTAkJrTEDukmns
zkAI4VwugMashH4WNDOGMUKzW5eketzdjMCdF7YZm7JELMHfCv2o1EuqvYbMBaTw
hTNYxNtcAEYL7FmQFekeZB4dxwSuiyyz6UhoAGVo4HiC3TdRq7QwOQGIIwW3YZl2
haWZELfjLzgn/32Leo+FAlEaVYokaPEe5T8BRQX+1ud6Uu/ZL74GYms178zlGEKv
+co3Bz03sVfOB6kNVrjte2MCm06wfkZy7rP5R1y06H8ert5maCgjPBQdTnqKTZdB
h0xE8exy1tIIOJOgnz6fAB8s+hGJbCS4vjPeVVX34hnL9X589lUSdCKL3XATa6+Y
TZg+qlSxBXXMynE7L3FQCGjm9b15Xn4/Ls2Kd4rF5TRlnP8sbfU=
=FTVI
-----END PGP SIGNATURE-----

--JSkcQAAxhB1h8DcT--


