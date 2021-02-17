Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4784831D478
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 05:13:41 +0100 (CET)
Received: from localhost ([::1]:38216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCEDb-000139-OS
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 23:13:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lCECG-0000Vx-PX
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 23:12:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lCECE-0003sg-RG
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 23:12:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613535134;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=u01iG1ChvwGztf3NflI0QCA4Tg7+cyKb3LRU2ib2WHY=;
 b=foEFs9sHGu34TotaIVHA5DDL+7/zmIRcD0MEIXSD5+SdSFXxkYbI2IRL/bUm8iir6r1aHR
 RLKzRVdCrnqlhv3TNettnvustQOFZCB/XuIKL7tK7OxzqKqptxmb1VAARSqTAkBayv6peG
 oUmYktiblejdKnFQV7+AnuuZFbxrgNs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-169-JBO3b_Z-PS2fppXvx-_g0g-1; Tue, 16 Feb 2021 23:12:10 -0500
X-MC-Unique: JBO3b_Z-PS2fppXvx-_g0g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E1634C28F;
 Wed, 17 Feb 2021 04:12:08 +0000 (UTC)
Received: from localhost.localdomain (ovpn-112-29.rdu2.redhat.com
 [10.10.112.29])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6D0B05D72F;
 Wed, 17 Feb 2021 04:12:04 +0000 (UTC)
Date: Tue, 16 Feb 2021 23:12:02 -0500
From: Cleber Rosa <crosa@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v4 11/24] python: add pylint to pipenv
Message-ID: <YCyXkjIZmszDsMIa@localhost.localdomain>
References: <20210211185856.3975616-1-jsnow@redhat.com>
 <20210211185856.3975616-12-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210211185856.3975616-12-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="6kZfGUK+UwE4Y6vx"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

--6kZfGUK+UwE4Y6vx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 11, 2021 at 01:58:43PM -0500, John Snow wrote:
> We are specifying >=3D pylint 2.6.x for two reasons:
>=20
> 1. For setup.cfg support, added in pylint 2.5.x
> 2. To clarify that we are using a version that has incompatibly dropped
> bad-whitespace checks.
>=20
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  python/Pipfile      |   1 +
>  python/Pipfile.lock | 137 ++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 138 insertions(+)
>  create mode 100644 python/Pipfile.lock
>=20

Tested at this point with:

 $ pipenv install --dev
 $ pipenv run pip freeze
 astroid=3D=3D2.4.2
 isort=3D=3D5.7.0
 lazy-object-proxy=3D=3D1.4.3
 mccabe=3D=3D0.6.1
 pylint=3D=3D2.6.0
 six=3D=3D1.15.0
 toml=3D=3D0.10.2
 typed-ast=3D=3D1.4.2
 wrapt=3D=3D1.12.1

Reviewed-by: Cleber Rosa <crosa@redhat.com>
Tested-by: Cleber Rosa <crosa@redhat.com>

--6kZfGUK+UwE4Y6vx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmAsl4gACgkQZX6NM6Xy
CfMpSBAAwVO/6GorXJZdttpXV/hFd6F2KvJGUiAq+x201v8BGPyrsELS48vCc+5M
WzqCpBGZuST7nrWIX9QwsLiFllXB4+4sZc74FA8bQ1OTWxq+CHcSH7kRaK9wYxzA
Tthp4knlut4dUq5ePKUlGfI5LovUKkVjEeupcJC3g6DrmtqF+Kr/LwATzg06E79g
pDZ1R+FfIEwsSiIM8/7gGSLeV2iSQ/onD997XvErrZ5VK/rETZU788g0RH1YzKvw
oYBVZuRdygOthdNrK+JVFtGfD/u3uFaaygRwS4kSmulejaT0WX2Nwnx7LQZA2mYn
3t7Xgskdxhg0AVUTBUB7JknNN5WopOBv4knek72PyvFokyL7WFjanpvEPacWZxQy
6tNOMXo1kAwQwlRsdOOYZTHgmCIQKndjjahmUan+LqeKEN59fIIZ00v8DHzIBLTS
pUxRqn8ZgLyvdGhPn0PTSxJKvyWS0ttPUnyPu+K79MeuMqGX5JoLadX1SVcIbVhn
64sAxn8/HQl5LQbzTjwQrA7pBkEA0KKPFeRgh8Kp62GTeVi9dFXyyZk/sp9UB9Uw
b47Z08lMLSS+zc3ca+dGeURNXpEUI28WWez8s3PwPhRJ7/FmC90l1KfcOyFOmSSH
+GTkVPCMU+vk4U5yEDx5GljB+xdTGYO0JC6DKJnvOBFb3P9hdyg=
=eArs
-----END PGP SIGNATURE-----

--6kZfGUK+UwE4Y6vx--


