Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC8D31D42A
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 04:08:48 +0100 (CET)
Received: from localhost ([::1]:38502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCDCp-00029X-Iz
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 22:08:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lCDBo-0001g0-BN
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 22:07:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59166)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lCDBl-000824-E6
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 22:07:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613531260;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=J6nmz/sS3Frb0+lgjrj6nPRWzmQs/9oFuMzRrZ7KsIQ=;
 b=afAOWMHEYdH+5/CTzhU659z4AWOc5wKoHCy3i2IGWiw1GVa9zSakwLa4H2MnxWQtmL5Zzo
 ozfLI99ZKkWshgK+WSg3pbPV+SLn3Fqup7rstswInwlVjY88Rnl7N8WX9U00uP+O3QecZm
 xNqArl7BPiSamxKcmeAsONKrQb39CXI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-402-dS-M60I0MuWQPj48CiWv9w-1; Tue, 16 Feb 2021 22:07:36 -0500
X-MC-Unique: dS-M60I0MuWQPj48CiWv9w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 65CBF107ACE6;
 Wed, 17 Feb 2021 03:07:35 +0000 (UTC)
Received: from localhost.localdomain (ovpn-112-29.rdu2.redhat.com
 [10.10.112.29])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 478EC5D9C0;
 Wed, 17 Feb 2021 03:07:30 +0000 (UTC)
Date: Tue, 16 Feb 2021 22:07:28 -0500
From: Cleber Rosa <crosa@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v4 09/24] python: add pylint import exceptions
Message-ID: <YCyIcGXWSOPK+9Gq@localhost.localdomain>
References: <20210211185856.3975616-1-jsnow@redhat.com>
 <20210211185856.3975616-10-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210211185856.3975616-10-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ZmZCLInrqDj5Ahzr"
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

--ZmZCLInrqDj5Ahzr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 11, 2021 at 01:58:41PM -0500, John Snow wrote:
> Pylint 2.5.x and 2.6.x have regressions that make import checking
> inconsistent, see:
>=20
> https://github.com/PyCQA/pylint/issues/3609
> https://github.com/PyCQA/pylint/issues/3624
> https://github.com/PyCQA/pylint/issues/3651
>=20
> Pinning to 2.4.4 is worse, because it mandates versions of shared
> dependencies that are too old for features we want in isort and mypy.
> Oh well.
>=20
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  python/qemu/machine/__init__.py | 3 +++
>  python/qemu/machine/machine.py  | 2 +-
>  python/qemu/machine/qtest.py    | 2 +-
>  3 files changed, 5 insertions(+), 2 deletions(-)
>

I can see your struggle on those issues, so I choose not to punish
myself attempting to replicate them.  I'll forever trust you in these
matters.

Reviewed-by: Cleber Rosa <crosa@redhat.com>

--ZmZCLInrqDj5Ahzr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmAsiHAACgkQZX6NM6Xy
CfNeow/+PEA3FSSnOHxLN41HzDAtDfMafPER8Nw9sHo/2Ik0Nup5pFqcvpcFVUw/
tXMWZR70WZRbI39kKHiaspW4jv6RdmY7VWiKmeboHAxMXfuI/UHKH6H/BXdRPZMm
AJruK8qb+Moo9fLAz0X2Y5LpyU2thAEIR5dlQCD17YxWwExndQjiyiki/IvNc4M9
hD9JGGTkCrQ68FlvzKVDa8vjid9ylussrsVn8vLcz8MaomkROBXzVaSo8A5iD+s3
dwJePgBL8kDCCrhvQRW6TMTNnaIIgJgKbvCusYsO/Oy0druYPEuNFSokuW/idObc
leXAJdHQxjZyIuI1m00xIiEu9UeMe/gUEqMY4b1g5nSmQvWPmiDfIC0GDkIq4Uy+
Pz7OMxDL/jjp+ZuoV9Gd12g0oRUTw3H89dvWhgLiwuGeXETvsD0dMtcta4pz/9Fu
QIGMaQC2DWIvTzTTS52qXwNYkLjXK1MrymTszZrfT0NhBW+H1AU509bozKX4P0FA
4dUdEt0NhFgsRygqdr2toYH0juSpYuy+CUcnOtLJjYKS4uidViY/hzdJI+PwzBCn
BXsSQuGWLclqPF6LLVAnD8SE7NJGRcZtvv7fKCZz4D7o/2WTGbe/EFdZWLgC+iN3
orQFdQz8uEHr685nwyChn0+t0HcfV/pK2CSvmno7NTJfhEdO3N8=
=dpi2
-----END PGP SIGNATURE-----

--ZmZCLInrqDj5Ahzr--


