Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D2C31D48D
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 05:19:04 +0100 (CET)
Received: from localhost ([::1]:41134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCEIp-0002kr-Eh
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 23:19:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lCEHk-0002Fu-S4
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 23:17:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39080)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lCEHj-0005aO-5p
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 23:17:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613535474;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=A+F8U68MIyGy7cjPxxf15nzXQ0pqJPchhjKqtJHlu7U=;
 b=D16k335cMUzg/5U/8i9uOEpRId6YCitzR2fQAM2INMFGTVkk30DzlJcS14vmrdu8vHXcOS
 csen99Gy38Q/DMrT7IA9LuuDih07jyMnV5UfYRtR0IorQHn7QcCMlT9/eEJ/FsZE1iesUS
 8PKhDlN5tLlwwwMvC/5AsbHDQHSYHMk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-20-bfLGSZb9MXS7WPNnBbe9dA-1; Tue, 16 Feb 2021 23:17:51 -0500
X-MC-Unique: bfLGSZb9MXS7WPNnBbe9dA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8278C803648;
 Wed, 17 Feb 2021 04:17:50 +0000 (UTC)
Received: from localhost.localdomain (ovpn-112-29.rdu2.redhat.com
 [10.10.112.29])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7C97210016FD;
 Wed, 17 Feb 2021 04:17:45 +0000 (UTC)
Date: Tue, 16 Feb 2021 23:17:43 -0500
From: Cleber Rosa <crosa@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v4 12/24] python: move flake8 config to setup.cfg
Message-ID: <YCyY57tVt4bSkbKU@localhost.localdomain>
References: <20210211185856.3975616-1-jsnow@redhat.com>
 <20210211185856.3975616-13-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210211185856.3975616-13-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Q87Bjx1sFgTMQnrT"
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

--Q87Bjx1sFgTMQnrT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 11, 2021 at 01:58:44PM -0500, John Snow wrote:
> Update the comment concerning the flake8 exception to match commit
> 42c0dd12, whose commit message stated:
>=20
> A note on the flake8 exception: flake8 will warn on *any* bare except,
> but pylint's is context-aware and will suppress the warning if you
> re-raise the exception.
>=20
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  python/qemu/machine/.flake8 | 2 --
>  python/setup.cfg            | 3 +++
>  2 files changed, 3 insertions(+), 2 deletions(-)
>  delete mode 100644 python/qemu/machine/.flake8
>

Reviewed-by: Cleber Rosa <crosa@redhat.com>

--Q87Bjx1sFgTMQnrT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmAsmOQACgkQZX6NM6Xy
CfNBLxAAxetNn8DZ+IkqqvKknD5Yk++7LLNofdrMVtd3IF7m29nOSZHF7dnqaU9g
fqCP9Cy3BsAOFB8zgzKrfgutNZgWPr1xYk5BM0V89XHnwGL1AsmKt/mS6cIoCkbp
wBzOcEuZH5w3YG1VcxShrwnmT/+505qbx3VnKjObfxI5v1sUDSfwbCzRyowNKRX6
W6pQ0l+dmHw4NNJNRUivqQsa83hl+ZYQrTqmMthtrKHcb1XDR6Cg29Edn2ZQVL0U
O3G3hCNw810szkHdiTnwGQOiVRsZR4R5s9vfsjyJ/HlnPleNhirBbp+Q5JSmLvN6
nEHs3Yx0SR27AckLol40o+AGZQjiTkvY4yOpYUlJK96wX/V9fNZdwizwR2T6LhOA
eHHCubZbX1eGi0BQkXs49QDc9Ml9vPP8XfSPypWlOV/XvVE6FPcx24bzoqG+0GOz
2z6hNrZKeuH8QR+dm6XFIEXaJSwkCq9mxeMqHSjJy6OeqeKkgKwXW7+R3qwg8NuR
L6EwJv1RTQ75nkg60R2nq9nMlQLa6glmi+36p2pKi+Hnq1yBtTpMRD96UodGK9d5
jXtTmwww9/lIjO1Jp9BJxlyYIYe/WZT2F1aI47o4VeC2rqK33W1OeyGa6IMlXKHG
VnbevDvzKPa2x0Zz4vhU/CUmVvWw68eI6lfNM8C7zjtSsFBeevk=
=uyqy
-----END PGP SIGNATURE-----

--Q87Bjx1sFgTMQnrT--


