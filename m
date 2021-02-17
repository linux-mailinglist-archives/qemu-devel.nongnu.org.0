Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5D631D4B6
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 05:48:57 +0100 (CET)
Received: from localhost ([::1]:34782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCElk-0005ks-Vh
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 23:48:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lCEkh-000508-K8
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 23:47:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47625)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lCEkf-0006BZ-Ua
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 23:47:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613537269;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IjGSQvlQsIhi/8B3G/UZWRXL1XJ5dqFdlIMvsIAyJ4c=;
 b=aPnVSujDL89golJ4L23iG1KqZ187uPDlsDO4oV694JBO4jxiNq4UaRynvm61UyLMex9PHi
 fLRfBC0eCNwtJ9YL8M2cYeucBY98G3rBmiF0bVzDTwBceVJZlgQxgSQV8tcDEO1vc8nIEI
 +NXJhN+GqlPpxjkegPVzP15mDWBGCEQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-458-A9owsjJZOUSip-HLTUktlA-1; Tue, 16 Feb 2021 23:47:44 -0500
X-MC-Unique: A9owsjJZOUSip-HLTUktlA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B92058030BB;
 Wed, 17 Feb 2021 04:47:43 +0000 (UTC)
Received: from localhost.localdomain (ovpn-112-29.rdu2.redhat.com
 [10.10.112.29])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1635D60C87;
 Wed, 17 Feb 2021 04:47:38 +0000 (UTC)
Date: Tue, 16 Feb 2021 23:47:37 -0500
From: Cleber Rosa <crosa@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v4 18/24] python/qemu: add qemu package itself to pipenv
Message-ID: <YCyf6YQ72ZGxP8Gv@localhost.localdomain>
References: <20210211185856.3975616-1-jsnow@redhat.com>
 <20210211185856.3975616-19-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210211185856.3975616-19-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="jgGbQVZjQBDuUetl"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

--jgGbQVZjQBDuUetl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 11, 2021 at 01:58:50PM -0500, John Snow wrote:
> This adds the python qemu packages themselves to the pipenv manifest.
> 'pipenv sync' will create a virtual environment sufficient to use the SDK=
.
> 'pipenv sync --dev' will create a virtual environment sufficient to use
> and test the SDK (with pylint, mypy, isort, flake8, etc.)
>=20
> The qemu packages are installed in 'editable' mode; all changes made to
> the python package inside the git tree will be reflected in the
> installed package without reinstallation. This includes changes made
> via git pull and so on.
>=20
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  python/Pipfile      | 1 +
>  python/Pipfile.lock | 9 +++++++--
>  2 files changed, 8 insertions(+), 2 deletions(-)
>=20

Reviewed-by: Cleber Rosa <crosa@redhat.com>
Tested-by: Cleber Rosa <crosa@redhat.com>

--jgGbQVZjQBDuUetl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmAsn+kACgkQZX6NM6Xy
CfP9HA//Yngz5jy9OtCxUEQCx0tm7KsIE3BDZpaVGZH9iwQIAR7Fiu2/m2UcpIvq
udK2fkKxr59vB+B5hVZgCLlUI4FOdQ6R75j9Ow/xX2VF3CHV6IqWT6EYHk/5d8Aa
ifhKMbbS/NccE5jlkaHTitrCX8wpDej3kDBvV2eFl84z+/nJ22n4ZwgIKRb7qnGv
n984Z+Y/VfP+HkEtGNbEcd1ZIANsApTqoMwXv7DVux7jUZT5B+ctBtTGP63AB0n4
A/apKJOxJIvoLxssAzAlQ0dpz72fKvxntsE4bSOnei3qAS6RFU9w3V6W8vBQ/YQ8
mSzKEqWXshfjYVikjAPxJGOoIYpzjSbsnEqy1blJ+fEAruPNNUawluuN7Cefyy0K
hop9RvHBMn96MaQPgw0I/EGs3c4mOlvXD0mvgk+Ns3ScdpF0q+2Pgzm6MFa8x7FE
VxbgDYms4jCDN+rfne1pyXaeDkE4zoBu66xYRC6yYUHcxgirPkZofGZNvWW0EMEc
cbZCL5JLBeXxY8JysBc1o8LAnfcAcr4q/JDguCkxDIiGTU34NEfT8VfB3a/jogaW
3GsHG6kOZI3tDUFu+F9sUUpl5s3AEWA5Qka892001LOjztbtF2R5HsgSvVWpX7G9
pvPrt6ps9fR6qeOT3+tIHI2EDsk7sSkxXFGAvajaJ26Wf6S214I=
=80dU
-----END PGP SIGNATURE-----

--jgGbQVZjQBDuUetl--


