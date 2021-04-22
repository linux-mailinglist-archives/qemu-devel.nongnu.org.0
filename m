Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 718FE368032
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 14:21:46 +0200 (CEST)
Received: from localhost ([::1]:34816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZYL3-0001qU-Gw
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 08:21:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lZYA7-00056w-3G
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 08:10:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lZYA5-0002Vr-19
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 08:10:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619093424;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=I6fnjCcRzaOttpJJtwPmS5JBhxATenE0rV4+48vmixY=;
 b=PH7o63vMX9J16dNONET93XNeiKqi53Yv+LNI7cS2myP9QJIP/w8NL5PMUxXZGK+dJb/96g
 imFVcKSlrBCvRbBtYrRxcJECuwJiHpq6IMmHnM9W7EKtaDrVhxGw/H0afZvgqfwX/gX2Hj
 IuqgpfRfqr8FoSuvbmI9epAWc81hQgg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-342-NYrNrmFVN0KnJFMLoJsUbQ-1; Thu, 22 Apr 2021 08:10:21 -0400
X-MC-Unique: NYrNrmFVN0KnJFMLoJsUbQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BA0641966343;
 Thu, 22 Apr 2021 12:10:02 +0000 (UTC)
Received: from localhost (ovpn-112-237.rdu2.redhat.com [10.10.112.237])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7C4C35C1D5;
 Thu, 22 Apr 2021 12:10:02 +0000 (UTC)
Date: Thu, 22 Apr 2021 08:09:59 -0400
From: Cleber Rosa <crosa@redhat.com>
To: Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: Re: [PATCH v2 3/7] tests/acceptance: Let the framework handle
 "cpu:VALUE" tagged tests
Message-ID: <20210422120959.GD2153290@amachine.somewhere>
References: <20210408195237.3489296-1-wainersm@redhat.com>
 <20210408195237.3489296-4-wainersm@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210408195237.3489296-4-wainersm@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="SFyWQ0h3ruR435lw"
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
Cc: wrampazz@redhat.com, alex.bennee@linaro.org, qemu-devel@nongnu.org,
 pavel.dovgaluk@ispras.ru, pbonzini@redhat.com, philmd@redhat.com,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--SFyWQ0h3ruR435lw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 08, 2021 at 04:52:33PM -0300, Wainer dos Santos Moschetta wrote=
:
> The tests that are already tagged with "cpu:VALUE" don't need to add
> "-cpu VALUE" to the list of arguments of the vm object because the avocad=
o_qemu
> framework is able to handle it automatically.
>=20
> Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
> ---
>  tests/acceptance/boot_linux.py         | 3 ---
>  tests/acceptance/machine_mips_malta.py | 1 -
>  tests/acceptance/replay_kernel.py      | 8 +++-----
>  tests/acceptance/reverse_debugging.py  | 2 +-
>  tests/acceptance/tcg_plugins.py        | 9 ++++-----
>  5 files changed, 8 insertions(+), 15 deletions(-)
>

Reviewed-by: Cleber Rosa <crosa@redhat.com>
Tested-by: Cleber Rosa <crosa@redhat.com>

--SFyWQ0h3ruR435lw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmCBZ5UACgkQZX6NM6Xy
CfOtXQ//ZrEnIhIDxmP6YFaEo59A6c0qiau65G4g9bFHK7Mk3P9J0JlqLtCKRWvI
WcP3eknTyxX1ILS9cAMRX+j2bbCQlfjyxkJIYv/AOcpXewUX/EZKpt2iTCaKLStb
UKOzs1VdNCyllEdq6ReDfEggshWZeTB/UNHU3wp0OktWHghaIpCBbTpt503pvmWE
RqvBEVyh9cEFrcU1kxgSb+vmuBvfhRCAAKyJu6WXcFbQ1EMa6s2SOu7+X5y4JN/A
5gUUMru3Dusu4wP1/0qmKrWZqaJ3DgdzIZs6BB/+biFKOnot0yBzm0a8OGB5/vLW
lgbQ3BRl2Bc9I7KOVRLF0H76xqpY07XQkNQS/NbAiRfDB5shmh6yhR8PM0bHYDOR
Fi2VpvdueIj1leYNwpUGcjLlQAUbfhe7Y++enf3AEV5x1EUM5f5iklIiLAYSylFj
xEFibgtvD+szGTyWAhbKiTf/J/QxYEPwVZSfZNFXkczP4tZnGSW9Bo6v63bdVpd6
tfrF/bKQav1QKmSKqtShqtdiq3NYOsiXw8h3jjKsBZWtvb7wYRQdGTAMhlR1Bjp8
TlvfpAxP8Xnf1XnkXVar1KSBs3v1vCHFJpO0XwOE2UMfvqc0vDFdzl2j3+X/iE2C
w+CyqWj4UcRST4JGa4a+WM8Jdfln/zLZxxj+ukbM+cZX1LAdJag=
=BgvR
-----END PGP SIGNATURE-----

--SFyWQ0h3ruR435lw--


