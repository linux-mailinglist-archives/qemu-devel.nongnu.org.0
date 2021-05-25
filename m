Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F1D390A65
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 22:17:24 +0200 (CEST)
Received: from localhost ([::1]:33606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lldUR-0006ge-0S
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 16:17:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lldSg-0005Ge-AE
 for qemu-devel@nongnu.org; Tue, 25 May 2021 16:15:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37337)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lldSb-0007dm-Ug
 for qemu-devel@nongnu.org; Tue, 25 May 2021 16:15:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621973724;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1Xw5I5Jug7UXBB6vSoGn4ucm18YHx+wQ7RTeHx1Z97s=;
 b=ai+sildr0sx4RryqqONbPqDff4ZLS9qIxWituIolh5bvXkv2/CZCSYg7/Gxq9a8u27fgHj
 Qr05tjd/dkRns6SL8yqTrmtwEOwFshWNdHfE3T2kCdY2Qa9cvgC5ulch2i3Yia+qKODn1F
 eR1YCFOVB76z21hVb4nF+XVUn7Myko8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-311-5ncxc_zJP8-s10rgSQWkyA-1; Tue, 25 May 2021 16:15:21 -0400
X-MC-Unique: 5ncxc_zJP8-s10rgSQWkyA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8803B6D241;
 Tue, 25 May 2021 20:15:20 +0000 (UTC)
Received: from localhost.localdomain (ovpn-112-219.ams2.redhat.com
 [10.36.112.219])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7DC0A60CC6;
 Tue, 25 May 2021 20:15:07 +0000 (UTC)
Date: Tue, 25 May 2021 16:15:04 -0400
From: Cleber Rosa <crosa@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v6 25/25] python: add tox support
Message-ID: <YK1ayNF0VTSJKa6O@localhost.localdomain>
References: <20210512231241.2816122-1-jsnow@redhat.com>
 <20210512231241.2816122-26-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210512231241.2816122-26-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="H4++Apy8qZO66Al0"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crosa@redhat.com;
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

--H4++Apy8qZO66Al0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 12, 2021 at 07:12:41PM -0400, John Snow wrote:
> This is intended to be a manually run, non-CI script.
>=20
> Use tox to test the linters against all python versions from 3.6 to
> 3.9. This will only work if you actually have those versions installed
> locally, but Fedora makes this easy:
>=20
> > sudo dnf install python36 python37 python38 python39
>=20
> Unlike the pipenv tests (make venv-check), this pulls "whichever"
> versions of the python packages, so they are unpinned and may break as
> time goes on. In the case that breakages are found, setup.cfg should be
> amended accordingly to avoid the bad dependant versions, or the code
> should be amended to work around the issue.
>=20
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  python/README.rst |  2 ++
>  python/.gitignore |  1 +
>  python/Makefile   |  7 ++++++-
>  python/setup.cfg  |  1 +
>  python/tox.ini    | 13 +++++++++++++
>  5 files changed, 23 insertions(+), 1 deletion(-)
>  create mode 100644 python/tox.ini
>=20

This works as intended for me.  A couple of notes / suggestions
for future improvements:

 * `dnf install tox` pulled all the Python versions available (I
   assume as suggestions) automatically

 * tox.ini can be folded into setup.cfg

 * a custom container image with all those Python versions may be
   handy for running both the pipenv based job (along with the
   suggestions on the previous patch) and an on-demand,
   "allow_failure" tox based CI job.

Other than those suggestions, this LGTM!

Reviewed-by: Cleber Rosa <crosa@redhat.com>
Tested-by: Cleber Rosa <crosa@redhat.com>

--H4++Apy8qZO66Al0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmCtWsMACgkQZX6NM6Xy
CfOykA//Vj5QRsibVXoGRnJbcQB6ET4dhnsaW08psiVD3D49iqxOgOnoooDgWxiO
klSNu50GgLPvCPwDB48XHnCbuSX86XbSWI8RaoMMP/ZSYS4NFCPdvmGIeNiowSFF
39dGhP9Tm6rKm4Xo5DCfe7NVoYMAqMrmjNQFR3IDgsv+XdC5rElrsnP1ZR7FeFYp
NZ1u4kQOiZuhFTjj9hdXDFSCo+Sl/KJIaJGo1Nc6jc0HLvQsXfBNGmJMrxgwMVmB
5A6j36BcjBiwLKQcwkR/UmSgxhGi4Zft6PRJC3TgdwSooApy9KBB2qSeUsY+XGct
0/J2o5XQpYhtqsin9CyhnEztiPVMb28CUC31d+mfJ5kadbxr1E0nVOMEBlZzrEgE
ORdIpdkeQib+MlPBb5qhT53hj1WGcef92Zm0K7fH/Zq+rOcmORCyvXPYpVY3rHFS
cpZvYHr0IDEqeoTNUU8tYXl9vGNTc2p5eUVfmTh6Djp5m+uzgeumHyw4N4W6yC6A
5cyGmvQEP0XYBVCepRNRTDZrBhHxFF1CnixNvxV3nXnKG6aAmRhrqKkEWM1xKhNl
Y898Yvm9DOn4mFHpPQYGN4xS59UTtvpgoDcAGhnOrmuFPfL0WRNg9UmDnWtAAhJw
wM9RnfutVzhLLqtD/XRAhRlrPLuV9o9WuoeeR6/qoDgOLvrTSHI=
=E3Og
-----END PGP SIGNATURE-----

--H4++Apy8qZO66Al0--


