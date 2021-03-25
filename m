Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A79C4349442
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 15:38:15 +0100 (CET)
Received: from localhost ([::1]:43188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPR7m-0002p3-Oc
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 10:38:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lPR6D-0001mI-LC
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 10:36:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lPR66-0005vP-5Y
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 10:36:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616682989;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=81LYLyIqpgREZvFXHcRYXKk14NiGerQwJuI3Hocn3h8=;
 b=C9ncMKma5Q7FvqGK+aGJzuXclcyQ2xnBurzyK3dg69+e+w6iOZ6ELed2/WAQkginKWayDS
 q4672EO1xUTKv6g076PIPEarxUZtfjdIzEXMTTqxMx3p71wDeIqXXZmOEZWAlc6RppfrlJ
 O3mRgHQDGwD9vwoh/vRBfdkAQX62Clo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-547-tMcXAvpANV2zHZOSi5OTnw-1; Thu, 25 Mar 2021 10:36:24 -0400
X-MC-Unique: tMcXAvpANV2zHZOSi5OTnw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 664EF87A83C;
 Thu, 25 Mar 2021 14:36:23 +0000 (UTC)
Received: from localhost (ovpn-119-39.rdu2.redhat.com [10.10.119.39])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 12CF710013D7;
 Thu, 25 Mar 2021 14:36:15 +0000 (UTC)
Date: Thu, 25 Mar 2021 10:36:04 -0400
From: Cleber Rosa <crosa@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH 1/1] avocado_qemu: Add SMMUv3 tests
Message-ID: <20210325143604.GA3629845@amachine.somewhere>
References: <20210325095712.250262-1-eric.auger@redhat.com>
 <20210325095712.250262-2-eric.auger@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210325095712.250262-2-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="vkogqOf2sHV7VnPd"
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
Cc: philmd@redhat.com, qemu-devel@nongnu.org, wainersm@redhat.com,
 eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--vkogqOf2sHV7VnPd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 25, 2021 at 10:57:12AM +0100, Eric Auger wrote:
> Add new tests checking the good behavior of the SMMUv3 protecting
> 2 virtio pci devices (block and net). We check the guest boots and
> we are able to install a package. Different guest configs are tested:
> standard, passthrough an strict=3D0. Given the version of the guest
> kernel in use (5.3.7 at this moment), range invalidation is not yet
> tested. This will be handled separately.
>=20
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>  tests/acceptance/smmu.py | 104 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 104 insertions(+)
>  create mode 100644 tests/acceptance/smmu.py
>=20
> diff --git a/tests/acceptance/smmu.py b/tests/acceptance/smmu.py
> new file mode 100644
> index 0000000000..65ecac8f1a
> --- /dev/null
> +++ b/tests/acceptance/smmu.py
> @@ -0,0 +1,104 @@
> +# SMMUv3 Functional tests
> +#
> +# Copyright (c) 2021 Red Hat, Inc.
> +#
> +# Author:
> +#  Eric Auger <eric.auger@redhat.com>
> +#
> +# This work is licensed under the terms of the GNU GPL, version 2 or
> +# later.  See the COPYING file in the top-level directory.
> +
> +import os
> +
> +from avocado_qemu import LinuxTest, BUILD_DIR
> +from avocado.utils import ssh

This import is not needed, given that the you're not using them directly,
but only using the LinuxTest methods that wrap them.

> +
> +class SMMU(LinuxTest):
> +
> +    KERNEL_COMMON_PARAMS =3D ("root=3DUUID=3Db6950a44-9f3c-4076-a9c2-355=
e8475b0a7 ro "
> +                            "earlyprintk=3Dpl011,0x9000000 ignore_loglev=
el "
> +                            "no_timer_check printk.time=3D1 rd_NO_PLYMOU=
TH "
> +                            "console=3DttyAMA0 ")
> +    IOMMU_ADDON =3D ',iommu_platform=3Don,disable-modern=3Doff,disable-l=
egacy=3Don'
> +    IMAGE =3D ("https://archives.fedoraproject.org/pub/archive/fedora/"
> +             "linux/releases/31/Everything/aarch64/os/images/pxeboot/")
> +    kernel_path =3D None
> +    initrd_path =3D None
> +    kernel_params =3D None
> +
> +    def set_up_boot(self):
> +        path =3D self.download_boot()
> +        self.vm.add_args('-device', 'virtio-blk-pci,bus=3Dpcie.0,scsi=3D=
off,' +
> +                         'drive=3Ddrv0,id=3Dvirtio-disk0,bootindex=3D1,'
> +                         'werror=3Dstop,rerror=3Dstop' + self.IOMMU_ADDO=
N)
> +        self.vm.add_args('-drive',
> +                         'file=3D%s,if=3Dnone,cache=3Dwritethrough,id=3D=
drv0' % path)
> +
> +    def setUp(self):
> +        super(SMMU, self).setUp(None, 'virtio-net-pci' + self.IOMMU_ADDO=
N)
> +
> +    def add_common_args(self):
> +        self.vm.add_args("-machine", "virt")
> +        self.vm.add_args('-bios', os.path.join(BUILD_DIR, 'pc-bios',
> +                                      'edk2-aarch64-code.fd'))
> +        self.vm.add_args('-device', 'virtio-rng-pci,rng=3Drng0')
> +        self.vm.add_args('-object',
> +                         'rng-random,id=3Drng0,filename=3D/dev/urandom')
> +
> +    def common_vm_setup(self, custom_kernel=3DNone):
> +        self.require_accelerator("kvm")
> +        self.add_common_args()

I know you're following the previous test pattern/template, but maybe
combine add_command_args() and common_vm_setup()?  They seem to be
doing the same thing.

> +        self.vm.add_args("-accel", "kvm")
> +        self.vm.add_args("-cpu", "host")
> +        self.vm.add_args("-machine", "iommu=3Dsmmuv3")
> +
> +        if custom_kernel is None:
> +            return
> +
> +        kernel_url =3D self.IMAGE + 'vmlinuz'
> +        initrd_url =3D self.IMAGE + 'initrd.img'
> +        self.kernel_path =3D self.fetch_asset(kernel_url)
> +        self.initrd_path =3D self.fetch_asset(initrd_url)
> +
> +    def run_and_check(self):
> +        if self.kernel_path:
> +            self.vm.add_args('-kernel', self.kernel_path,
> +                             '-append', self.kernel_params,
> +                             '-initrd', self.initrd_path)
> +        self.launch_and_wait()
> +        self.ssh_command('cat /proc/cmdline')
> +        self.ssh_command('dnf -y install numactl-devel')

Would you expect the package installation to cover significant more
than, say, a package removal?  Not relying on the distro's package
repos (and external networking) would be an improvement to the test's
stability, but I wonder how much functional coverage would be lost.

FIY, I've tried it with 'dnf -y remove yum' instead, and test times
are also considerably lower.

> +
> +    def test_smmu(self):
> +        """
> +        :avocado: tags=3Daccel:kvm
> +        :avocado: tags=3Dcpu:host
> +        :avocado: tags=3Dsmmu
> +        """

These tags are common across all tests, so you can move them to the class'
docstring.  Also, you need to add ":avocado: tags=3Darch:aarch64" or else
these will be attempted to be executed with other targets.

> +
> +        self.common_vm_setup()
> +        self.run_and_check()
> +
> +    def test_smmu_passthrough(self):
> +        """
> +        :avocado: tags=3Daccel:kvm
> +        :avocado: tags=3Dcpu:host
> +        :avocado: tags=3Dsmmu
> +        """
> +        self.common_vm_setup(True)
> +
> +        self.kernel_params =3D self.KERNEL_COMMON_PARAMS + 'iommu.passth=
rough=3Don'
> +
> +        self.run_and_check()
> +
> +    def test_smmu_nostrict(self):
> +        """
> +        :avocado: tags=3Daccel:kvm
> +        :avocado: tags=3Dcpu:host
> +        :avocado: tags=3Dsmmu
> +        """
> +        self.common_vm_setup(True)
> +
> +        self.kernel_params =3D self.KERNEL_COMMON_PARAMS + 'iommu.strict=
=3D0'
> +
> +        self.run_and_check()
> --=20
> 2.26.2
>=20

Other than those comments, the tests work as expected:

$ ./tests/venv/bin/avocado run tests/acceptance/smmu.py
JOB ID     : 8b1f1bb775d41e5c593e727ec1907710f076b161
JOB LOG    : /home/cleber/avocado/job-results/job-2021-03-25T10.31-8b1f1bb/=
job.log
 (1/3) tests/acceptance/smmu.py:SMMU.test_smmu: PASS (42.99 s)
 (2/3) tests/acceptance/smmu.py:SMMU.test_smmu_passthrough: PASS (47.06 s)
 (3/3) tests/acceptance/smmu.py:SMMU.test_smmu_nostrict: PASS (47.54 s)
RESULTS    : PASS 3 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 | CA=
NCEL 0
JOB TIME   : 138.56 s

And even with a bit of stress (running them in parallel) proved to be
quite stable:

./tests/venv/bin/avocado run --test-runner=3Dnrunner tests/acceptance/smmu.=
py

JOB ID     : bb2c3a006bb491a7086612dfa1ef980b55db4105
JOB LOG    : /home/cleber/avocado/job-results/job-2021-03-25T10.30-bb2c3a0/=
job.log
 (2/3) tests/acceptance/smmu.py:SMMU.test_smmu_passthrough: STARTED
 (1/3) tests/acceptance/smmu.py:SMMU.test_smmu: STARTED
 (3/3) tests/acceptance/smmu.py:SMMU.test_smmu_nostrict: STARTED
 (1/3) tests/acceptance/smmu.py:SMMU.test_smmu: PASS (50.22 s)
 (2/3) tests/acceptance/smmu.py:SMMU.test_smmu_passthrough: PASS (57.98 s)
 (3/3) tests/acceptance/smmu.py:SMMU.test_smmu_nostrict: PASS (58.28 s)
RESULTS    : PASS 3 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 | CA=
NCEL 0
JOB TIME   : 60.35 s

Regards,
- Cleber.

--vkogqOf2sHV7VnPd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmBcn9IACgkQZX6NM6Xy
CfOrVRAAx3grgBNv5k1+nDkeLxk7hUBT0ooQJd7UmyD26e3C/1LwI6JyYy3VRkxi
/jvihg3T0gRV9bVIvRDKuyx7B6Wws38WEl0t413sHIIWY5VOCs4cy9luTx0NPg6z
OEgIjfWofPpSrwmfvde26N/jBHdqYesFZJoqUTw2ZwE/liQBlrGeb9Zxi6ghgv/d
oaG+cKjzbuVLIWPMyafajxA6ckPgknHP9JEZPpiMkS1JFgK9sLvO3Hv8E1qmWg1Z
QzfAwgV3EzCk3JkS6ybMUkpPfdzUTi9hZtp2Sg9qsWvx403favONmecYbNvMyCxK
HG+OAiDeoL+7IJjsIRh8xlaiQEv0+REDO/ExQpwXJ6s9rGJwvGcQNWKPuQEsOGwp
YS6wDGDXE/bjNpyJoYHog6tX+lDlWjejUU05Wnky8hhYPhGPrn0SpPyO/C3GY3JP
c/bI+UbCXO8simnSaNJ0/PoGwID9gOsnkR8W8P/brruCD2wnj6lTvOq84Uiy1pEV
ye8l5t8IHheHgAyskueHMbwO/8XJFwgfQvhwRY6rc7cihrItnBNVco8D1ovSseZ0
nUX/ETKGW+bOZ0DeH1ZLUVHFQlQyPy15bE2Wx4tTIN3H/OYM37VLqZLlMTgYvk26
l+BgMdXpK/e55oslIRRNfxp07z2im12uzubGBfj11Zfnbuvqt34=
=oMKj
-----END PGP SIGNATURE-----

--vkogqOf2sHV7VnPd--


