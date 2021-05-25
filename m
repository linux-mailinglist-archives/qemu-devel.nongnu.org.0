Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 634B538F8E1
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 05:34:59 +0200 (CEST)
Received: from localhost ([::1]:33502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llNqM-0001vu-Gq
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 23:34:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1llNop-0000Ka-O4
 for qemu-devel@nongnu.org; Mon, 24 May 2021 23:33:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1llNok-0005e0-LH
 for qemu-devel@nongnu.org; Mon, 24 May 2021 23:33:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621913597;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=C7YCp+jUNCh8BOLFNvvc1Oqqhu9n5LZ6SWsf628w14o=;
 b=XCNBYSQ3nK/feQRlrKGG1z68DBAVkeodKc7zwIH+RhHacSrIoC7wZSG9XKEu88zQG3flIu
 uxlcTUkPbsMyPV5wGgZBLmtq11QMLbbDi+3uwWNigyYeKvUHJyMrL9OiqeQcmBY8TpNBsm
 ClFGj8xisgDzF9ewS31Lmi2VXKtGYzw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-189-fXfLAvn1OQi1QZJBeEUYQA-1; Mon, 24 May 2021 23:33:13 -0400
X-MC-Unique: fXfLAvn1OQi1QZJBeEUYQA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 257086D585;
 Tue, 25 May 2021 03:33:12 +0000 (UTC)
Received: from localhost.localdomain (ovpn-113-137.rdu2.redhat.com
 [10.10.113.137])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 717C45C1D0;
 Tue, 25 May 2021 03:33:04 +0000 (UTC)
Date: Mon, 24 May 2021 23:33:02 -0400
From: Cleber Rosa <crosa@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v6 11/25] python: add pylint to pipenv
Message-ID: <YKxv7mHytMLgUldY@localhost.localdomain>
References: <20210512231241.2816122-1-jsnow@redhat.com>
 <20210512231241.2816122-12-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210512231241.2816122-12-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="I+8HEkVV3gg08DVq"
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

--I+8HEkVV3gg08DVq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 12, 2021 at 07:12:27PM -0400, John Snow wrote:
> We are specifying >=3D pylint 2.7.x for several reasons:
>=20
> 1. For setup.cfg support, added in pylint 2.5.x
> 2. To specify a version that has incompatibly dropped
>    bad-whitespace checks (2.6.x)
> 3. 2.7.x fixes "unsubscriptable" warnings in Python 3.9
>=20
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  python/Pipfile      |   1 +
>  python/Pipfile.lock | 130 ++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 131 insertions(+)
>  create mode 100644 python/Pipfile.lock
>=20

Works as expected:

   $ pipenv run pylint --version=20
   pylint 2.7.2
   astroid 2.5.2
   Python 3.6.13 (default, Feb 25 2021, 00:00:00)=20
   [GCC 11.0.0 20210210 (Red Hat 11.0.0-0)]

Reviewed-by: Cleber Rosa <crosa@redhat.com>
Tested-by: Cleber Rosa <crosa@redhat.com>

--I+8HEkVV3gg08DVq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmCsb+oACgkQZX6NM6Xy
CfN7FBAAkIZNDaLiPEjhZ/WUiwbqca2M2pC098HLNldY6LyakEsCTm+l90d0f0a8
vCMSm/XGWSTWUkFw6gon04uND2EqtiYxnbnyAWsaQSeNWVYBObntBsCHl8qPGBAY
fSw3sl3TT6PpCNYWpB6qBRVYU942GgFUqTZOI+oYma6k9Nk0ttVJlTfZQw5VaSNd
iXRinmLMSDnTuEKJALhhKTxwj6QQz/hqg9tlUvoad0qhJ3YlPd7UcDT8+sQKUfqW
FYJJEFEJrvUTgSD2mu2fFxTyJtqwZ0M8tXjbBNQVPTdkjRhIuOFiLw0Ji7H+tEHq
DGGyBH5RUDkXQmFNHXk6+DgiyqmEnxFoIbv5Tnl3AXAlNkGlY3ukTmoEDfeDZEmi
qp66ou6Mf5ZcdXiQ5ed8nX/BmxA9HjtOOG6F1A0Mp/5BtzX4rV3Dk0X7FzutNj1S
nZg4y4JzTRkei/diB/ysgpHVvINmFPvvVAeCxyIEOUDGzluqGDVyGGjTQAn6bu9F
crL0kVyH7z+lRr74PrH9FyO6n32FPLfMC+6dOkiIDg7j6KlEepXAd241fmU2CMpa
JKhL2bxHkvQOqidAvUS5schH8OGkwQd/QW/bhOlrdvKwtuA3bRgOKyZTMZwS3t09
FM1FwSW6bOtc+nokS2tADxjvpazk9HnVn4BjSTNFicPOYE65jww=
=dlfu
-----END PGP SIGNATURE-----

--I+8HEkVV3gg08DVq--


