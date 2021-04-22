Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E101368054
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 14:26:00 +0200 (CEST)
Received: from localhost ([::1]:43620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZYP9-0005cN-74
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 08:25:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lZYLc-0003Rf-CZ
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 08:22:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45141)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lZYLY-00006t-CV
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 08:22:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619094135;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9I6zGxS5r5ruVBDOrhehz260LTyffhaFkOB2Q1oLCLQ=;
 b=bhPQvmFVauj5Wu86Z9U/whduu2Q9e9pWZnvK1APkSyBUKtE7NnxSX4AsOcfqPUNFCMJci6
 NttY0AfDt3rgCVmbjtOKV6OAWT8chDwlXiq3lmf0a0JnjknXXpxmzws64xHFxT0Ub6c4Az
 teCpLhKIWI1uOTHiaHwfWsOhajVQZc4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-371-7Y6iLS3GOQSxep4JJPmLhg-1; Thu, 22 Apr 2021 08:22:07 -0400
X-MC-Unique: 7Y6iLS3GOQSxep4JJPmLhg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C44A010C40CA;
 Thu, 22 Apr 2021 12:22:05 +0000 (UTC)
Received: from localhost (ovpn-112-237.rdu2.redhat.com [10.10.112.237])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 766C660BE5;
 Thu, 22 Apr 2021 12:22:02 +0000 (UTC)
Date: Thu, 22 Apr 2021 08:21:48 -0400
From: Cleber Rosa <crosa@redhat.com>
To: Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: Re: [PATCH v2 7/7] tests/acceptance: Handle cpu tag on
 x86_cpu_model_versions tests
Message-ID: <20210422122148.GH2153290@amachine.somewhere>
References: <20210408195237.3489296-1-wainersm@redhat.com>
 <20210408195237.3489296-8-wainersm@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210408195237.3489296-8-wainersm@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="HuscSE0D68UGttcd"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crosa@redhat.com;
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

--HuscSE0D68UGttcd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 08, 2021 at 04:52:37PM -0300, Wainer dos Santos Moschetta wrote=
:
> Some test cases on x86_cpu_model_versions.py are corner cases because the=
y
> need to pass extra options to the -cpu argument. Once the avocado_qemu
> framework will set -cpu automatically, the value should be reset. This ch=
anged
> those tests so to call set_vm_arg() to overwrite the -cpu value.
>=20
> Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
> ---
>  tests/acceptance/x86_cpu_model_versions.py | 40 +++++++++++++++++-----
>  1 file changed, 32 insertions(+), 8 deletions(-)
>

This LGTM, but, since it depends on the previous patch, I'll hold my
R-b/T-b until I can test with the modified behavior.

Thanks!
- Cleber.

--HuscSE0D68UGttcd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmCBalwACgkQZX6NM6Xy
CfP8RRAAvtzm2BWSrOPyOS6lk3ejnL79rg4oS26le9Kkgv8ziMyCtkfvgqbNghoU
S8MhdUvZEJjWdfhEEsj3ar+UL/lnJ79ts3QHtGGc5tEapJ0M4sLufFEhZL/IEKXe
f4Ao8WsxJawHNH8gYNgcd+7sO2MyL8tKgHpfuohtfYx/BaxOVbz4pMJgpwz4KCME
LEaaVZKXcn1XNzHfweHzBhJYoeFTQ3u9qrS5u/QLSTS1vdUrVTFfg+B5srC7sLzP
WlXjGCIeDj2s+tYDb1uPI1HJUOsXsxDz/l06z31WAF+8vkCTasxAtLISy2xQXi/3
HwbtKKr91+oJ7oPqQEq0WeCacCY+2bUytLmn2SjzrQLieaqckxmwxy9GfTd4vERr
3/0tv8X7P56dCBFA/GLwKNmtPQEAINc7L7iRx3RclG1VfrUcuU2jqncjHsM7Htmt
fhT6OZKONGDqYA5kfpSXjfnyHWPkPT7dtmZnoCkostG8GnBVEFjkvS8sNlQuyLuH
u4namsfMTOY474H0LBJQpJu+6+jMwRZZtMR3CfjcysRIrH8WraJSzwpFoloFFozF
DZfhN1mrv7opiNKXo/WRmUvbR25P0jUFAPMigVdD8GmJq/jfUZS1HlJWdHwdJdvT
z5cqhnUhusCGadBZNKPLDGYXLzTsgUGwNqqupdK4iV9fr3lQRKw=
=pHd8
-----END PGP SIGNATURE-----

--HuscSE0D68UGttcd--


