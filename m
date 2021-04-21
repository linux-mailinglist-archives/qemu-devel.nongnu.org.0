Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33852368031
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 14:21:34 +0200 (CEST)
Received: from localhost ([::1]:33992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZYKr-0001QB-9A
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 08:21:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lZY9x-0004wh-C1
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 08:10:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lZY9t-0002Pn-DZ
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 08:10:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619093412;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5JKMZlqs5IaHmKnBMfS+dhvrWW1I5qnZPECcx45oGto=;
 b=fgbYRw5tEbxPWPnXVeuFW1syZDIBB23B9azOUi8hXEEvK1TOmCaya7XVGh6bxXbciEOn/O
 CcV3bSEBg29jMzmHw3wr6oTlRMjpvDiOazwPQLn1RIbInQWosERhh2zFHM85LebKb6DUOR
 ti4iUf0dg7tjuHkskd8Xq1fAY+xG2YU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-234-FxYPcOKIM6Ce2SAWILugXQ-1; Thu, 22 Apr 2021 08:10:07 -0400
X-MC-Unique: FxYPcOKIM6Ce2SAWILugXQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CF7C61922997;
 Thu, 22 Apr 2021 12:09:47 +0000 (UTC)
Received: from localhost (ovpn-112-237.rdu2.redhat.com [10.10.112.237])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6FD3F5DDAD;
 Thu, 22 Apr 2021 12:09:47 +0000 (UTC)
Date: Wed, 21 Apr 2021 17:09:35 -0400
From: Cleber Rosa <crosa@redhat.com>
To: Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: Re: [PATCH v2 2/7] tests/acceptance: Fix mismatch on cpu tagged tests
Message-ID: <20210421210935.GC2153290@amachine.somewhere>
References: <20210408195237.3489296-1-wainersm@redhat.com>
 <20210408195237.3489296-3-wainersm@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210408195237.3489296-3-wainersm@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="TiqCXmo5T1hvSQQg"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_12_24=1.049,
 DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--TiqCXmo5T1hvSQQg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 08, 2021 at 04:52:32PM -0300, Wainer dos Santos Moschetta wrote=
:
> There are test cases on machine_mips_malta.py and tcg_plugins.py files
> where the cpu tag does not correspond to the value actually given to the =
QEMU
> binary. This fixed those tests tags.
>=20
> Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
> ---
>  tests/acceptance/machine_mips_malta.py | 6 +++---
>  tests/acceptance/tcg_plugins.py        | 6 +++---
>  2 files changed, 6 insertions(+), 6 deletions(-)
>=20
> diff --git a/tests/acceptance/machine_mips_malta.py b/tests/acceptance/ma=
chine_mips_malta.py
> index 7c9a4ee4d2..b1fd075f51 100644
> --- a/tests/acceptance/machine_mips_malta.py
> +++ b/tests/acceptance/machine_mips_malta.py
> @@ -96,7 +96,7 @@ def test_mips_malta_i6400_framebuffer_logo_1core(self):
>          """
>          :avocado: tags=3Darch:mips64el
>          :avocado: tags=3Dmachine:malta
> -        :avocado: tags=3Dcpu:i6400
> +        :avocado: tags=3Dcpu:I6400
>          """
>          self.do_test_i6400_framebuffer_logo(1)
> =20
> @@ -105,7 +105,7 @@ def test_mips_malta_i6400_framebuffer_logo_7cores(sel=
f):
>          """
>          :avocado: tags=3Darch:mips64el
>          :avocado: tags=3Dmachine:malta
> -        :avocado: tags=3Dcpu:i6400
> +        :avocado: tags=3Dcpu:I6400
>          :avocado: tags=3Dmips:smp
>          """
>          self.do_test_i6400_framebuffer_logo(7)
> @@ -115,7 +115,7 @@ def test_mips_malta_i6400_framebuffer_logo_8cores(sel=
f):
>          """
>          :avocado: tags=3Darch:mips64el
>          :avocado: tags=3Dmachine:malta
> -        :avocado: tags=3Dcpu:i6400
> +        :avocado: tags=3Dcpu:I6400
>          :avocado: tags=3Dmips:smp
>          """

What about also changing the test names for consistency?

>          self.do_test_i6400_framebuffer_logo(8)
> diff --git a/tests/acceptance/tcg_plugins.py b/tests/acceptance/tcg_plugi=
ns.py
> index c21bf9e52a..aa6e18b62d 100644
> --- a/tests/acceptance/tcg_plugins.py
> +++ b/tests/acceptance/tcg_plugins.py
> @@ -68,7 +68,7 @@ def test_aarch64_virt_insn(self):
>          :avocado: tags=3Daccel:tcg
>          :avocado: tags=3Darch:aarch64
>          :avocado: tags=3Dmachine:virt
> -        :avocado: tags=3Dcpu:cortex-a57
> +        :avocado: tags=3Dcpu:cortex-a53
>          """
>          kernel_path =3D self._grab_aarch64_kernel()
>          kernel_command_line =3D (self.KERNEL_COMMON_COMMAND_LINE +
> @@ -95,7 +95,7 @@ def test_aarch64_virt_insn_icount(self):
>          :avocado: tags=3Daccel:tcg
>          :avocado: tags=3Darch:aarch64
>          :avocado: tags=3Dmachine:virt
> -        :avocado: tags=3Dcpu:cortex-a57
> +        :avocado: tags=3Dcpu:cortex-a53
>          """
>          kernel_path =3D self._grab_aarch64_kernel()
>          kernel_command_line =3D (self.KERNEL_COMMON_COMMAND_LINE +
> @@ -121,7 +121,7 @@ def test_aarch64_virt_mem_icount(self):
>          :avocado: tags=3Daccel:tcg
>          :avocado: tags=3Darch:aarch64
>          :avocado: tags=3Dmachine:virt
> -        :avocado: tags=3Dcpu:cortex-a57
> +        :avocado: tags=3Dcpu:cortex-a53
>          """
>          kernel_path =3D self._grab_aarch64_kernel()
>          kernel_command_line =3D (self.KERNEL_COMMON_COMMAND_LINE +
> --=20
> 2.29.2
>=20

Despite the suggestion, this is working fine:

JOB ID     : 90e4ddaa4f5b7d2b7d53f9f7a7300e9e9a94e8f4
JOB LOG    : /home/cleber/avocado/job-results/job-2021-04-21T17.05-90e4dda/=
job.log
 (1/6) tests/acceptance/machine_mips_malta.py:MaltaMachineFramebuffer.test_=
mips_malta_i6400_framebuffer_logo_1core: PASS (3.59 s)
 (2/6) tests/acceptance/machine_mips_malta.py:MaltaMachineFramebuffer.test_=
mips_malta_i6400_framebuffer_logo_7cores: PASS (16.54 s)
 (3/6) tests/acceptance/machine_mips_malta.py:MaltaMachineFramebuffer.test_=
mips_malta_i6400_framebuffer_logo_8cores: PASS (17.95 s)
 (4/6) tests/acceptance/tcg_plugins.py:PluginKernelNormal.test_aarch64_virt=
_insn: PASS (17.05 s)
 (5/6) tests/acceptance/tcg_plugins.py:PluginKernelNormal.test_aarch64_virt=
_insn_icount: PASS (14.94 s)
 (6/6) tests/acceptance/tcg_plugins.py:PluginKernelNormal.test_aarch64_virt=
_mem_icount: PASS (14.39 s)
RESULTS    : PASS 6 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 | CA=
NCEL 0
JOB TIME   : 87.47 s

Reviewed-by: Cleber Rosa <crosa@redhat.com>
Tested-by: Cleber Rosa <crosa@redhat.com>

--TiqCXmo5T1hvSQQg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmCAlIwACgkQZX6NM6Xy
CfNW1BAAxp6CknQlMlAQ4276Ygh8nh/0fQ6lkNENMaBuccC8emDwx80j+6sR1e5q
4/hMBAhxC2A+I9JDXW2unEunOXft8uzR2cqefrPukKe/ZplPV9V0PXeoeyfMrRuK
ysVL4yuFFWussjGoazULQ/XeH7OUr3COjpC0wevcGmQbx6Fby7bjAayp/zKY932m
R6Mo1+CgWAt5TklZFJxXGcsT3n5nOHdNB+V3x1Q4jMpwplSWL1/9iMNAHmDT7Ja2
pQ1qu4NrynTGQqglAKdSiwsUmx4s5Nh5SpUp2uqXl/lVVYGm9fMHtGbzIpssuM0J
tbjATDNQnLM7yD4wfkAlAE9vlb0CzuIYsSaKUhn0aPZjUom0JKkQ22QXGRk15afl
Zwc4hDlxay4C8HteZDvEH9p9NIFSEeUixTTbzyLosco1wzD/O2SEEU2cE/fKjwMg
4AyO1wspbJBuX9tccAvPAn7hIR4HNuOua7y7s8qg0lAAiyKvYVt/BUYwFGYr72YR
sImSsp63WLH3zUi+KCQjvShi9/f1jlIgciDOQlK2gi0kyjXN/nhd2Sah6fW/wGVX
lkLn2eODHegpUbpR91Tp84RjqwAqcoJn98LGz5wVZ8VzbrM5ztyExfNfJ+d4D0Rm
fEvRwufiT32Vd3mF0Oi0GlDJOu4X8FSREFkkVrNqiYsgr214WZw=
=oCio
-----END PGP SIGNATURE-----

--TiqCXmo5T1hvSQQg--


