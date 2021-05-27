Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8913933A8
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 18:24:56 +0200 (CEST)
Received: from localhost ([::1]:43446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmIoZ-0003Oq-Td
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 12:24:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lmIkd-00054g-4R
 for qemu-devel@nongnu.org; Thu, 27 May 2021 12:20:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lmIic-0006II-L4
 for qemu-devel@nongnu.org; Thu, 27 May 2021 12:20:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622132326;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wQv7d6cPlFq1jh6eK+9EcF/19ebGJ0EzKeTnkdHiYMs=;
 b=hjGom9svQR+E6GySOYFxzD3vI5iTjDRVjcmHGbozbKz+PSV7lEt1oUEfdsO40YlYfEXbMc
 3gLLv3rLVinQjo8bSlWbqT+vCt3K5nEkt2dADGEgIHI2DFTxhuqC5/wWzSXxx4oxy+3BmI
 kKL9BTdPFAcizes3CQmQLLGRTOMPRHg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-455-BpeOSKtxMWe1EIU_5Xp9bw-1; Thu, 27 May 2021 12:18:42 -0400
X-MC-Unique: BpeOSKtxMWe1EIU_5Xp9bw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0BEBD100946D;
 Thu, 27 May 2021 16:18:41 +0000 (UTC)
Received: from localhost (ovpn-114-2.phx2.redhat.com [10.3.114.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F28D15C701;
 Thu, 27 May 2021 16:18:33 +0000 (UTC)
Date: Thu, 27 May 2021 12:11:15 -0400
From: Cleber Rosa <crosa@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v7 17/31] python: add pylint to pipenv
Message-ID: <20210527161115.GE1916721@amachine.somewhere>
References: <20210526002454.124728-1-jsnow@redhat.com>
 <20210526002454.124728-18-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210526002454.124728-18-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="qOrJKOH36bD5yhNe"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Willian Rampazzo <willianr@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--qOrJKOH36bD5yhNe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 25, 2021 at 08:24:40PM -0400, John Snow wrote:
> We are specifying >=3D pylint 2.8.x for several reasons:
>=20
> 1. For setup.cfg support, added in pylint 2.5.x
> 2. To specify a version that has incompatibly dropped
>    bad-whitespace checks (2.6.x)
> 3. 2.7.x fixes "unsubscriptable" warnings in Python 3.9
> 4. 2.8.x adds a new, incompatible 'consider-using-with'
>    warning that must be disabled in some cases.
>    These pragmas cause warnings themselves in 2.7.x.
>=20
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  python/Pipfile      |   1 +
>  python/Pipfile.lock | 130 ++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 131 insertions(+)
>  create mode 100644 python/Pipfile.lock
>

pylint bump successful:

   $ pipenv run pylint --version
   pylint 2.8.2
   astroid 2.5.6
   Python 3.6.12 (default, Aug 19 2020, 00:00:00)=20
   [GCC 9.3.1 20200408 (Red Hat 9.3.1-2)]

Reviewed-by: Cleber Rosa <crosa@redhat.com>
Tested-by: Cleber Rosa <crosa@redhat.com>

--qOrJKOH36bD5yhNe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmCvxKMACgkQZX6NM6Xy
CfMlpxAA0eKcY0zus4mh55CZCYLngnIcwZ81YoAiP+roDISy67Tq5h4W6TRn/o/0
/tGkE3F3HGQAeQ2W1YCDIRMYDybmSBTfQk0Stfq3CS9sQzQpb/uxfMVNPeyLuVUw
L+DG0uv1Vsewmozin3IpG/L9W6IAEsRY2r9l87zJdIMKmMKvFGxfKv9fktaxrlQl
8AivqKlFVeECIjLPJjn+nEXwDhNp1UCSwHfkLBHczDvGHtXqR4t5+bVV1V5mO5uD
ZZkKVz0XQTGz2Nv4z82I//4VkyAlXaUVDtEhuHjs535Lt7mtDKz/YKdx+28Birbu
jLufWaSELwoREqWbFa6gsEXqk8YMZhOqzrf49HT1bcDUUxXOvsUo0+CdSvoUXi1Q
VX5JTlHCFGTalkkeyjrfz3KcJr9yKb+OQTOyyel8iZpqIw6sPdzNmsRkiApMuAPM
/hoHfPQQEL/+GJjN2Y/U0y4ce/4YWm3l/6qkQUx9i0F4Mi0Am8gxgJEIK4MVoxip
YXKnVKwzIgvFw/p7WxPrVpqCJmirIKfaOCrO+Mcb71Mqn/7F+5uQufc7Z1ZLyJ1t
nBBubl+OIfgXtmor9IpGS7l/vY1pDshmiAk8NdUYw+384ohL8LtKL4LgimaDeHRk
5w3CjnfqOuj0bci01Rm0WNfz0Ti57RtfX8+cbe5rifvrTbPCXyE=
=AR9B
-----END PGP SIGNATURE-----

--qOrJKOH36bD5yhNe--


