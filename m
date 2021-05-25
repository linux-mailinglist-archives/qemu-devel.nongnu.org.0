Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79CA8390705
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 18:59:20 +0200 (CEST)
Received: from localhost ([::1]:35082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llaOl-0000B7-HO
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 12:59:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1llZMV-00072Q-Db
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:52:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33152)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1llZMS-000883-Ai
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:52:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621957971;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yWd40GWJUfFKoP6RNwmDAnkEZyq+Vr96e2KtkkMQ9zk=;
 b=R3MZqV0NMTwVRikI8OzomElpzwoZgN8j2IuckUQb+fCy9DxQD23PHOBjdcz8CmWAkVYYwG
 MwXtDuzXTKgxDDv2XfABHHTZj0urxw+rEnk/rPIp5CartkI3TEeuqTV2bX48s/KXBxlDg2
 AD9IrATHDBS25ypvN69hjAC6zUIm1M8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-100-7-C7AxXcOXW1QZAJJCBvmw-1; Tue, 25 May 2021 11:52:47 -0400
X-MC-Unique: 7-C7AxXcOXW1QZAJJCBvmw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0B014107ACCD;
 Tue, 25 May 2021 15:52:46 +0000 (UTC)
Received: from localhost.localdomain (ovpn-112-219.ams2.redhat.com
 [10.36.112.219])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D32405C1C2;
 Tue, 25 May 2021 15:52:31 +0000 (UTC)
Date: Tue, 25 May 2021 11:52:28 -0400
From: Cleber Rosa <crosa@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v6 15/25] python: move mypy.ini into setup.cfg
Message-ID: <YK0dPMlf5YPvODR/@localhost.localdomain>
References: <20210512231241.2816122-1-jsnow@redhat.com>
 <20210512231241.2816122-16-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210512231241.2816122-16-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="UWaQ/vXFH5pNEWaX"
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

--UWaQ/vXFH5pNEWaX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 12, 2021 at 07:12:31PM -0400, John Snow wrote:
> mypy supports reading its configuration values from a central project
> configuration file; do so.
>=20
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  python/mypy.ini  | 4 ----
>  python/setup.cfg | 5 +++++
>  2 files changed, 5 insertions(+), 4 deletions(-)
>  delete mode 100644 python/mypy.ini

Reviewed-by: Cleber Rosa <crosa@redhat.com>

--UWaQ/vXFH5pNEWaX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmCtHTwACgkQZX6NM6Xy
CfN8HhAAzaGykNY7jf6iaBLFYu1W4MbT4pNTKtvD/Q4UskrhCXbJQXy14iSPzBAi
CK3FYzjqhz9AER5hzPSx3SRyX8KzUScKR71WCUhg/mYNvlTadRUOnLooLm86CIEd
/OULEKhsINwcU5qBf+sFhS6cnI5WTLBM+I405lMAVFSZACsPZT2TIxUhzy1sdRcK
zbo4FTqrQ2b+GDdEPoiS/Wc3zrJYE7CblweJSd9yjuKGgUhRs3qEMPjChFzyKQW6
6BaA+zxEAwxH2+5D1Rs6lCy5CVdzlENhZWhrK8amkTK1gHdll04z5Vbm19oRG6cT
TYixK/3jVwQa1SxKbg/ZyP9SKf2R6xlyLfmUIndmULk27Mf0CYLOwNsTUPJ7S5K0
OL4+g+q4OcTKTLkSHA9HT35prlkk7Wq29OGKTLML7JjP6CNtATP7AM1ecXNDrXpl
qNjUBAyVp6DsxE0wo8782rvdkca+BDS6Lyqi8fiuo1uW2/aRPjxP4urJ1EcKAdaV
Ecvpqn+wx3jeXGtwRXxSSQZ579n04F+WyRMD1NcMqSJ6zn9CbvLu53uzxTs6c+OY
BwK5JzsIlUtD/S6sG6mBnoyU6nBjGdAEGAOIvMzFYzinpv2WF6ClzGL61b7FA53f
nTl4fgb+9F9b/GVuNfHicFcoQziotOzb2X0gHUWzBTlyt7TNYeM=
=Xguq
-----END PGP SIGNATURE-----

--UWaQ/vXFH5pNEWaX--


