Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1256B31D4B1
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 05:46:34 +0100 (CET)
Received: from localhost ([::1]:58242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCEjR-0003d0-3h
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 23:46:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lCEiP-0002yG-TM
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 23:45:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40960)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lCEiN-0005LX-T0
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 23:45:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613537127;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=k/H2x8nbXUmWEdSQRfX8bpRlYdiGJDskk1NSnWKY6xo=;
 b=CLg3FrtFSS4vosiNcoIFm8Y6elzKwU3NwotQx85ZKSTmMGVBpEyRH7viI2MtUKVSetx6Ol
 r1n1iM2pAD6/w2t7c84e5gK/3qSM3CXMB/37Af+Q31A+2v53s2buqPaFr0qTW+dkvuO7Ua
 cadeHW8Yzb4mzmFRLzm5LEqFrb5NvdE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-266-4G2NRY_nNGyifD0Xrm2HiQ-1; Tue, 16 Feb 2021 23:45:24 -0500
X-MC-Unique: 4G2NRY_nNGyifD0Xrm2HiQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 721AC80196E;
 Wed, 17 Feb 2021 04:45:23 +0000 (UTC)
Received: from localhost.localdomain (ovpn-112-29.rdu2.redhat.com
 [10.10.112.29])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CAC6B60C61;
 Wed, 17 Feb 2021 04:45:12 +0000 (UTC)
Date: Tue, 16 Feb 2021 23:45:10 -0500
From: Cleber Rosa <crosa@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v4 17/24] python/qemu: add isort to pipenv
Message-ID: <YCyfVuqmPSqlgIet@localhost.localdomain>
References: <20210211185856.3975616-1-jsnow@redhat.com>
 <20210211185856.3975616-18-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210211185856.3975616-18-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="JFKtGXDkKBVrzpjr"
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

--JFKtGXDkKBVrzpjr
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 11, 2021 at 01:58:49PM -0500, John Snow wrote:
> isort 5.0.0 through 5.0.4 has a bug that causes it to misinterpret
> certain "from ..." clauses that are not related to imports.
>=20
> Require 5.0.5 or greater.
>=20
> isort can be run with 'isort -c qemu' from the python root.
>=20
> Signed-off-by: John Snow <jsnow@redhat.com>
> Reviewed-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> ---
>  python/Pipfile      | 1 +
>  python/Pipfile.lock | 4 ++--
>  2 files changed, 3 insertions(+), 2 deletions(-)

Reviewed-by: Cleber Rosa <crosa@redhat.com>
Tested-by: Cleber Rosa <crosa@redhat.com>

--JFKtGXDkKBVrzpjr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmAsn1YACgkQZX6NM6Xy
CfMmXA//dpPmmRCcmR5yxxXP+mINsvnmMvIJyIWxeHGNgS8+wpmlwepfxWmEgwG7
RBRTbyO+RtBEvSG4oml6JukeJhEeEh0Y2YqCItHD8m8SC7awC+Lt2p8PP4Jh0aIk
mmpPgWF/uzKGEyaGIO7WrM/gLNf/9Yv+dDMOtVUfdwKl0doPo0N5qkjG5Li8S3Rj
BIQm5RZWSZ8urF6XrYUHqQyNO6i4o2MXIialvhb9O9AhBTnq/NY9vOdLdqPX5sF1
PlPtDAx9zEZznspvJuYj07HjiNTiJb16QAbt2AJNdyvJ8u4fAyir25YVlRadML5e
/fCD9BvRxyuq9ZnAfZYHrrFZnuIrnNZ6KeCF74F+x5M1LU9g9Xg5Fr0clRPZn4r1
4AP0FcdYMr+o5AcQMH6Bucw9jfYe/P1qjh5XqVeyiBGZIY3lPwWFpGszoFuK5oxH
NVUu2E8ILACBoAn63Bw1I7X36gaY+VzEGTwRkgeCyRUthAWvPRiyFo0ArccDnnc4
LXSWCfrKAEQV1Ar9lqJ36YJai7RQQsCcMqwJa/8gyoULnqqZmvFZ2YpUHb/KDY+p
aKlFbiilIWlOKjlI9O0IbNmqWmGRQs7nCakIs+eGbhPa6C6bpdYUBpbJvtLStt//
sb+ikBn0m4FW87jefCTPGtvBuGJBNo5hL+SplP6VI98LxqCXzdg=
=97M0
-----END PGP SIGNATURE-----

--JFKtGXDkKBVrzpjr--


