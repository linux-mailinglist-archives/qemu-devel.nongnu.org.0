Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 568F8322F75
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 18:18:09 +0100 (CET)
Received: from localhost ([::1]:56246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEbK4-0005rA-AE
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 12:18:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lEbGJ-0004gi-Ur
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 12:14:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lEbGH-0001Qw-SC
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 12:14:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614100452;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AaVpTQHeIAjCKDt3i8SC+qwoV6vHpwZzY0YzT+qfw7c=;
 b=JH+0MfNldpkme1L9cGY+7C7P3j9ZlCGKEvdmhH7uKCtSCUDBQ8wntYuYq7mJ4somBV0oRZ
 H6YDQzbfYVS3kDOSJ1pvM5w+m1Jd9zLaT6O6DCKCjfweG8l3n2egJx4w7WDcYmNYh0+5wi
 t/R3bY37BFKKxXJbigsCtrEWRbHp5h0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-417-S954kpkBPcOnQG0uMmk4iQ-1; Tue, 23 Feb 2021 12:13:52 -0500
X-MC-Unique: S954kpkBPcOnQG0uMmk4iQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 62D92107ACF6;
 Tue, 23 Feb 2021 17:13:51 +0000 (UTC)
Received: from localhost (ovpn-114-28.rdu2.redhat.com [10.10.114.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 339D05C3FD;
 Tue, 23 Feb 2021 17:13:48 +0000 (UTC)
Date: Tue, 23 Feb 2021 11:47:18 -0500
From: Cleber Rosa <crosa@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH v5 1/4] Jobs based on custom runners: documentation and
 configuration placeholder
Message-ID: <20210223164718.GA987581@amachine.somewhere>
References: <20210219215838.752547-1-crosa@redhat.com>
 <20210219215838.752547-2-crosa@redhat.com>
 <3f0a3854-425d-27e7-d466-f6f4db4dd9aa@redhat.com>
 <e884e35a-cb4c-059b-7b67-1c69f7869347@redhat.com>
MIME-Version: 1.0
In-Reply-To: <e884e35a-cb4c-059b-7b67-1c69f7869347@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="bg08WKrSYDhXBjb5"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Erik Skultety <eskultet@redhat.com>,
 Stefan Hajnoczi <stefanha@gmail.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Andrea Bolognani <abologna@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--bg08WKrSYDhXBjb5
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 23, 2021 at 05:37:04PM +0100, Philippe Mathieu-Daud=E9 wrote:
> On 2/23/21 12:25 PM, Thomas Huth wrote:
> > On 19/02/2021 22.58, Cleber Rosa wrote:
> >> As described in the included documentation, the "custom runner" jobs
> >> extend the GitLab CI jobs already in place.=A0 One of their primary
> >> goals of catching and preventing regressions on a wider number of host
> >> systems than the ones provided by GitLab's shared runners.
> >>
> >> This sets the stage in which other community members can add their own
> >> machine configuration documentation/scripts, and accompanying job
> >> definitions.=A0 As a general rule, those newly added contributed jobs
> >> should run as "non-gating", until their reliability is verified (AKA
> >> "allow_failure: true").
> >>
> >> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> >> ---
> >> =A0 .gitlab-ci.d/custom-runners.yml | 14 ++++++++++++++
> >> =A0 .gitlab-ci.yml=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
|=A0 1 +
> >> =A0 docs/devel/ci.rst=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 | 28 +=
+++++++++++++++++++++++++++
> >> =A0 docs/devel/index.rst=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0 1 +
> >> =A0 4 files changed, 44 insertions(+)
> >> =A0 create mode 100644 .gitlab-ci.d/custom-runners.yml
> >> =A0 create mode 100644 docs/devel/ci.rst
> >>
> >> diff --git a/.gitlab-ci.d/custom-runners.yml
> >> b/.gitlab-ci.d/custom-runners.yml
> >> new file mode 100644
> >> index 0000000000..3004da2bda
> >> --- /dev/null
> >> +++ b/.gitlab-ci.d/custom-runners.yml
> >> @@ -0,0 +1,14 @@
> >> +# The CI jobs defined here require GitLab runners installed and
> >> +# registered on machines that match their operating system names,
> >> +# versions and architectures.=A0 This is in contrast to the other CI
> >> +# jobs that are intended to run on GitLab's "shared" runners.
> >> +
> >> +# Different than the default approach on "shared" runners, based on
> >> +# containers, the custom runners have no such *requirement*, as those
> >> +# jobs should be capable of running on operating systems with no
> >> +# compatible container implementation, or no support from
> >> +# gitlab-runner.=A0 To avoid problems that gitlab-runner can cause wh=
ile
> >> +# reusing the GIT repository, let's enable the recursive submodule
> >> +# strategy.
> >> +variables:
> >> +=A0 GIT_SUBMODULE_STRATEGY: recursive
> >=20
> > Is it really necessary? I thought our configure script would take care
> > of the submodules?
>

I've done a lot of testing on bare metal systems, and the problems
that come from reusing the same system and failed cleanups can be very
frustrating.  It's unfortunate that we need this, but it was the
simplest and most reliable solution I found.  :/

Having said that, I noticed after I posted this series that this is
affecting all other jobs.  We don't need it that in the jobs based
on containers (for obvious reasons), so I see two options:

1) have it enabled on all jobs for consistency

2) have it enabled only on jobs that will reuse the repo

> Well, if there is a failure during the first clone (I got one network
> timeout in the middle) then next time it doesn't work:
>=20
> Updating/initializing submodules recursively...
> Synchronizing submodule url for 'capstone'
> Synchronizing submodule url for 'dtc'
> Synchronizing submodule url for 'meson'
> Synchronizing submodule url for 'roms/QemuMacDrivers'
> Synchronizing submodule url for 'roms/SLOF'
> Synchronizing submodule url for 'roms/edk2'
> Synchronizing submodule url for
> 'roms/edk2/ArmPkg/Library/ArmSoftFloatLib/berkeley-softfloat-3'
> Synchronizing submodule url for
> 'roms/edk2/BaseTools/Source/C/BrotliCompress/brotli'
> Synchronizing submodule url for
> 'roms/edk2/BaseTools/Source/C/BrotliCompress/brotli/research/esaxx'
> Synchronizing submodule url for
> 'roms/edk2/BaseTools/Source/C/BrotliCompress/brotli/research/libdivsufsor=
t'
> Synchronizing submodule url for
> 'roms/edk2/CryptoPkg/Library/OpensslLib/openssl'
> Synchronizing submodule url for
> 'roms/edk2/MdeModulePkg/Library/BrotliCustomDecompressLib/brotli'
> Synchronizing submodule url for
> 'roms/edk2/MdeModulePkg/Universal/RegularExpressionDxe/oniguruma'
> Synchronizing submodule url for
> 'roms/edk2/UnitTestFrameworkPkg/Library/CmockaLib/cmocka'
> Synchronizing submodule url for 'roms/ipxe'
> Synchronizing submodule url for 'roms/openbios'
> Synchronizing submodule url for 'roms/opensbi'
> Synchronizing submodule url for 'roms/qboot'
> Synchronizing submodule url for 'roms/qemu-palcode'
> Synchronizing submodule url for 'roms/seabios'
> Synchronizing submodule url for 'roms/seabios-hppa'
> Synchronizing submodule url for 'roms/sgabios'
> Synchronizing submodule url for 'roms/skiboot'
> Synchronizing submodule url for 'roms/u-boot'
> Synchronizing submodule url for 'roms/u-boot-sam460ex'
> Synchronizing submodule url for 'roms/vbootrom'
> Synchronizing submodule url for 'slirp'
> Synchronizing submodule url for 'tests/fp/berkeley-softfloat-3'
> Synchronizing submodule url for 'tests/fp/berkeley-testfloat-3'
> Synchronizing submodule url for 'ui/keycodemapdb'
> Entering 'capstone'
> Entering 'dtc'
> Entering 'meson'
> Entering 'roms/QemuMacDrivers'
> Entering 'roms/SLOF'
> Entering 'roms/edk2'
> Entering 'roms/edk2/ArmPkg/Library/ArmSoftFloatLib/berkeley-softfloat-3'
> Entering 'roms/edk2/BaseTools/Source/C/BrotliCompress/brotli'
> Entering 'roms/edk2/BaseTools/Source/C/BrotliCompress/brotli/research/esa=
xx'
> Entering
> 'roms/edk2/BaseTools/Source/C/BrotliCompress/brotli/research/libdivsufsor=
t'
> Entering 'roms/edk2/CryptoPkg/Library/OpensslLib/openssl'
> Entering 'roms/edk2/MdeModulePkg/Library/BrotliCustomDecompressLib/brotli=
'
> Entering 'roms/edk2/MdeModulePkg/Universal/RegularExpressionDxe/oniguruma=
'
> Entering 'roms/edk2/UnitTestFrameworkPkg/Library/CmockaLib/cmocka'
> Entering 'roms/ipxe'
> Entering 'roms/openbios'
> Entering 'roms/opensbi'
> Entering 'roms/qboot'
> Entering 'roms/qemu-palcode'
> Entering 'roms/seabios'
> Entering 'roms/seabios-hppa'
> Entering 'roms/sgabios'
> Entering 'roms/skiboot'
> Entering 'roms/u-boot'
> Entering 'roms/u-boot-sam460ex'
> Entering 'roms/vbootrom'
> Entering 'slirp'
> Entering 'tests/fp/berkeley-softfloat-3'
> Entering 'tests/fp/berkeley-testfloat-3'
> Entering 'ui/keycodemapdb'
> Entering 'capstone'
> HEAD is now at f8b1b833 fix CS_ mips_ OP structure comment error (#1674)
> Entering 'dtc'
> HEAD is now at 85e5d83 Makefile: when building libfdt only, do not add
> unneeded deps
> Entering 'meson'
> HEAD is now at 776acd2a8 Bump versions to 0.55.3 for release
> Entering 'roms/QemuMacDrivers'
> HEAD is now at 90c488d Merge pull request #3 from
> mcayland/fix/unbreak-256-color-mode
> Entering 'roms/SLOF'
> HEAD is now at e18ddad version: update to 20200717
> Entering 'roms/edk2'
> HEAD is now at 06dc822d04 Revert ".pytool/EccCheck: Disable Ecc error
> code 10014 for open CI"
> Entering 'roms/edk2/ArmPkg/Library/ArmSoftFloatLib/berkeley-softfloat-3'
> HEAD is now at b64af41 Fix typo in function
> 'softfloat_propagateNaNF128M' for RISC-V.
> Entering 'roms/edk2/BaseTools/Source/C/BrotliCompress/brotli'
> HEAD is now at 666c328 Make types of variable match (#796)
> Entering 'roms/edk2/BaseTools/Source/C/BrotliCompress/brotli/research/esa=
xx'
> HEAD is now at ca7cb33 move to git
> Entering
> 'roms/edk2/BaseTools/Source/C/BrotliCompress/brotli/research/libdivsufsor=
t'
> HEAD is now at 5f60d6f Merge pull request #7 from kloetzl/master
> Entering 'roms/edk2/CryptoPkg/Library/OpensslLib/openssl'
> Entering 'roms/edk2/MdeModulePkg/Library/BrotliCustomDecompressLib/brotli=
'
> HEAD is now at 63be8a9 unichr was removed in Python 3 because all str
> are Unicode (#877)
> Entering 'roms/edk2/MdeModulePkg/Universal/RegularExpressionDxe/oniguruma=
'
> HEAD is now at b2c1da6 add ONIG_OPTION_CALLBACK_EACH_MATCH test
> Entering 'roms/edk2/UnitTestFrameworkPkg/Library/CmockaLib/cmocka'
> HEAD is now at 160dffe Don't use non-literal format strings
> Entering 'roms/ipxe'
> HEAD is now at 4bd064de [build] Fix building on older versions of gcc
> Entering 'roms/openbios'
> HEAD is now at 7f28286 PPC: mark first 4 pages of physical and virtual
> memory as unavailable
> Entering 'roms/opensbi'
> HEAD is now at a98258d include: Bump-up version to 0.8
> Entering 'roms/qboot'
> HEAD is now at a5300c4 qboot: Disable PIE for ELF binary build step
> Entering 'roms/qemu-palcode'
> HEAD is now at bf0e136 Report machine checks to the kernel
> Entering 'roms/seabios'
> HEAD is now at 155821a docs: Note v1.14.0 release
> Entering 'roms/seabios-hppa'
> HEAD is now at 73b740f7 parisc: Set text planes and used_bits in STI fiel=
ds
> Entering 'roms/sgabios'
> HEAD is now at cbaee52 SGABIOS: fix wrong video attrs for int 10h, ah=3D=
=3D13h
> Entering 'roms/skiboot'
> HEAD is now at 3a6fdede skiboot v6.4 release notes
> Entering 'roms/u-boot'
> HEAD is now at d3689267f9 Prepare v2019.01
> Entering 'roms/u-boot-sam460ex'
> HEAD is now at 60b3916 Add README to clarify relation to U-Boot and
> ACube's version
> Entering 'roms/vbootrom'
> HEAD is now at 0c37a43 Merge pull request #1 from google/disable-build-id
> Entering 'slirp'
> HEAD is now at 8f43a99 Merge branch 'stable-4.2' into 'stable-4.2'
> Entering 'tests/fp/berkeley-softfloat-3'
> HEAD is now at b64af41 Fix typo in function
> 'softfloat_propagateNaNF128M' for RISC-V.
> Entering 'tests/fp/berkeley-testfloat-3'
> HEAD is now at 5a59dce fail: constify fail_programName
> Entering 'ui/keycodemapdb'
> HEAD is now at 6119e6e Fix scan codes for Korean keys
> fatal: Needed a single revision
> Unable to find current revision in submodule path
> 'roms/edk2/CryptoPkg/Library/OpensslLib/openssl'
> Failed to recurse into submodule path 'roms/edk2'
> ERROR: Job failed: exit status 1
>=20

Yes, I've also found similar issues during my jobs.

Regards,
- Cleber.

--bg08WKrSYDhXBjb5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmA1MZMACgkQZX6NM6Xy
CfMW4Q/+LAllKRS2ZgMaB9Py/YfhNt7csII7vW6N070VbvCmtkpFxouZHOYBDQmo
OGltil0k8tpiS3rv7CEvnvslhCCMfFo0op1J+P0TgKRnZDpGIIWu57eJkap/crP+
zNaOuoyPASuZGudXReoX8/5jsDTLaHJA8uHa+82DQMPnnLqLQJIctnMioBDZRuv9
t5uLoKE1DWfrG17XWU5hv6YRDG/8U9F1kC/Z0ftk13zumdw6OPrU+6i0I46QNQOS
lSSpWMGs/kZquIFAC4aMHv66pWAcvEUdPnAIw6u5/RMSGDjrwVoq8jHQd2GuiwRu
OU88zbJYEEBtS1wrvDbTdeAr6CeSnGXO8E6OmdDdloHbhmFZbP31+j1clk+yqnC+
xiIRjl6sbOvGt5EdztVJf7+I4F8KY1hp95P9jrNzWxuGqNalQrPJjSAzdOZb9fqT
crWKXgRv6FXxgkrhui2iklITXmKzymjzbhJnLp2WsxB5sg/Xjs39y4ZPLAnDiSMJ
7A+tEK+I556GaK7+Vz+PDKx0pawQ0kh/yb7KPjmnFXE1/Sjodh5oIlgg1O5CkZlV
F9kjmzmo+aQhLqv1/D4yNAmEsBS7gR4HIZPWGNMwufgM3bcYxNeFGyvZJNf8am9S
ZqEiplfp+MKAwUDArrIAb6mV/Ohu2GEfDFb4j1ubG5jCYdWasVo=
=+Vg8
-----END PGP SIGNATURE-----

--bg08WKrSYDhXBjb5--


