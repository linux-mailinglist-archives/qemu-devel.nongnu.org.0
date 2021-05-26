Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D69C4391EE2
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 20:19:36 +0200 (CEST)
Received: from localhost ([::1]:32838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lly7z-0006iK-UN
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 14:19:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1llxvu-0003Sy-65
 for qemu-devel@nongnu.org; Wed, 26 May 2021 14:07:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56371)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1llxvf-0003AX-VY
 for qemu-devel@nongnu.org; Wed, 26 May 2021 14:07:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622052411;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ykPyVyPX65ynsKu2AhRFTCmGGYL0JndPsWm8nPSGOX0=;
 b=PNJrXyW9oXL6t47h0FImRFVWtOAbdrBkBNlZgIhvDf591m3LSRht4BWnaTM7XNuXbyof6K
 7LsvZtEBOCpn3nHIAiqxOK8pxgnhUl7arVeJpsbtlSO0VwXDmIa93gOANYSQj4cSAmh0GO
 u10M9hz47HOj1mn4R/HIS04dng50jpU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-353-eIL2xC_pNW-lDUuPY0CtXQ-1; Wed, 26 May 2021 14:06:35 -0400
X-MC-Unique: eIL2xC_pNW-lDUuPY0CtXQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 83FB5803635;
 Wed, 26 May 2021 18:06:34 +0000 (UTC)
Received: from localhost (ovpn-114-2.phx2.redhat.com [10.3.114.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3D9525C23E;
 Wed, 26 May 2021 18:06:27 +0000 (UTC)
Date: Wed, 26 May 2021 14:04:59 -0400
From: Cleber Rosa <crosa@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH] tests/acceptance: Add a 'virt_kvm' test using the GICv3
Message-ID: <20210526180459.GA1725208@amachine.somewhere>
References: <20200929224857.1225107-1-philmd@redhat.com>
 <87eefvnx3s.fsf@linaro.org>
 <7a720701-a34f-ccf4-d116-a0f0703b5f83@redhat.com>
 <87ft03wd3w.fsf@linaro.org>
 <b9fa6362-7899-884e-58b9-f670143de6ae@redhat.com>
 <a2a463cb-e2a1-1884-cc97-8c5b4689341b@redhat.com>
MIME-Version: 1.0
In-Reply-To: <a2a463cb-e2a1-1884-cc97-8c5b4689341b@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="MGYHOYXEY6WxJCY8"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--MGYHOYXEY6WxJCY8
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 13, 2021 at 06:25:47PM +0200, Philippe Mathieu-Daud=E9 wrote:
> Hi Alex,
>=20
> On 4/12/21 7:55 PM, Philippe Mathieu-Daud=E9 wrote:
> > On 4/6/21 7:12 PM, Alex Benn=E9e wrote:
> >>
> >> Philippe Mathieu-Daud=E9 <philmd@redhat.com> writes:
> >>
> >>> On 3/31/21 5:45 PM, Alex Benn=E9e wrote:
> >>>>
> >>>> Philippe Mathieu-Daud=E9 <philmd@redhat.com> writes:
> >>>>
> >>>>> The current 'virt_kvm' test is restricted to GICv2, but can also
> >>>>> work with a GICv3. Duplicate it but add a GICv3 test which can be
> >>>>> tested on some hardware.
> >>>>>
> >>>>> Noticed while running:
> >>>>>
> >>>>>  $ avocado --show=3Dapp run -t machine:virt tests/acceptance/
> >>>>>  ...
> >>>>>  (2/6) tests/acceptance/boot_linux.py:BootLinuxAarch64.test_virt_kv=
m: ERROR: Unexpected empty reply from server (1.82 s)
> >>>>>
> >>>>> The job.log content is:
> >>>>>
> >>>>>   L0351 DEBUG| Output: 'qemu-system-aarch64: host does not support =
in-kernel GICv2 emulation\n'
> >>>>>
> >>>>> With this patch:
> >>>>>
> >>>>>  $ avocado --show=3Dapp run -t device:gicv3 tests/acceptance/
> >>>>>  (1/1)
> >>>>>  tests/acceptance/boot_linux.py:BootLinuxAarch64.test_virt_kvm_gicv=
3:
> >>>>>  PASS (55.10 s)
> >>>>
> >>>> On the new aarch64 machine which is GICv3 I get the following:
> >>>>
> >>>>  (006/142) tests/acceptance/boot_linux.py:BootLinuxAarch64.test_virt=
_kvm_gicv2: ERROR: Unexpected empty reply from server (0.47 s)
> >>>>
> >>>> which it shouldn't have run. However:
> >>>>
> >>>>   ./tests/venv/bin/avocado --show=3Dapp run -t device:gic3 tests/acc=
eptance/
> >>>>   Test Suite could not be create. No test references provided nor an=
y other arguments resolved into tests
> >>>>
> >>>> Is this something that has regressed or am I doing it wrong?
> >>>
> >>> Typo in the tag: "device:gic3" -> "device:gicv3"
> >>
> >> Doh!
> >>
> >> But what about:
> >>
> >> /tests/venv/bin/avocado run tests/acceptance/boot_linux.py:BootLinuxAa=
rch64.test_virt_kvm_gicv2
> >> JOB ID     : 396696d8f9d31d970878cb46025b2ced76f3623f
> >> JOB LOG    : /home/alex/avocado/job-results/job-2021-04-06T17.11-39669=
6d/job.log
> >>  (1/1) tests/acceptance/boot_linux.py:BootLinuxAarch64.test_virt_kvm_g=
icv2: ERROR: Unexpected empty reply from server (0.65 s)
> >> RESULTS    : PASS 0 | ERROR 1 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0=
 | CANCEL 0
> >> JOB TIME   : 0.96 s
> >>
> >> why doesn't that skip?
> >=20
> > /home/phil/avocado/job-results/job-2021-04-12T17.51-efdca81/job.log
> > 2021-04-12 17:52:44,589 machine          L0389 DEBUG| Output:
> > "qemu-system-aarch64: Could not find ROM image
> > '/home/phil/qemu/build/host/pc-bios/edk2-aarch64-code.fd'\n"
> >=20
> > Missing prerequisite:
> >=20
> > $ ninja pc-bios/edk2-aarch64-code.fd
> > [1/1] Generating edk2-aarch64-code.fd with a custom command (wrapped by
> > meson to capture output)
> >=20
> > Then we are good:
> >=20
> > $ avocado --show=3Dapp,console run -t device:gicv3 tests/acceptance
> > JOB ID     : e84401e5cc3ae53a3094c79491e661385cc7b4a7
> > JOB LOG    :
> > /home/phil/avocado/job-results/job-2021-04-12T17.53-e84401e/job.log
> >  (1/1)
> > tests/acceptance/boot_linux.py:BootLinuxAarch64.test_virt_kvm_gicv3:
> > PASS (16.38 s)
> > RESULTS    : PASS 1 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 =
|
> > CANCEL 0
> > JOB TIME   : 16.70 s
> >=20
> > Probably some missing dependency in Makefile/Meson?
>=20
> Are you using multiple build directories?
>=20
> I could reproduce doing:
>=20
> $ mkdir A B
> $ cd A
> $ make check-qtest-aarch64
> $ avocado --show=3Dapp,console run -t device:gicv3 tests/acceptance
> $ cd ../B
> $ ninja qemu-system-aarch64
> $ avocado --show=3Dapp,console run -t device:gicv3 tests/acceptance
>=20
> In A edk2-aarch64-code.fd has been expanded in A/pc-bios/,
> in B it isn't.
>=20
> check-acceptance is a Makefile rule, not a ninja one...
> I suppose we need to convert it to ninja to be able to use the
> rest of the dependencies checks.
>=20
> Cc'ing Paolo because I'm not sure what the best move and where
> to plug things.
>=20
>=20

While a proper build system conversion fix doesn't happen, what about:

diff --git a/tests/acceptance/boot_linux.py b/tests/acceptance/boot_linux.p=
y
index 314370fd1f..5d42d98dc7 100644
--- a/tests/acceptance/boot_linux.py
+++ b/tests/acceptance/boot_linux.py
@@ -69,9 +69,10 @@ class BootLinuxAarch64(LinuxTest):
     chksum =3D '1e18d9c0cf734940c4b5d5ec592facaed2af0ad0329383d5639c997fdf=
16fe49'
=20
     def add_common_args(self):
-        self.vm.add_args('-bios',
-                         os.path.join(BUILD_DIR, 'pc-bios',
-                                      'edk2-aarch64-code.fd'))
+        bios_path =3D os.path.join(BUILD_DIR, 'pc-bios', 'edk2-aarch64-cod=
e.fd')
+        if not os.path.exists(bios_path):
+            self.cancel('Missing bios file "%s"', bios_path)
+        self.vm.add_args('-bios', bios_path)
         self.vm.add_args('-device', 'virtio-rng-pci,rng=3Drng0')
         self.vm.add_args('-object', 'rng-random,id=3Drng0,filename=3D/dev/=
urandom')

I can send a patch if this looks reasonable.

- Cleber.

--MGYHOYXEY6WxJCY8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmCujcgACgkQZX6NM6Xy
CfNCUQ//Yw+YFrL2SPireJ6UbnuZdYOXRKZwMHcwYxjaowfUha0wH0yaFgmwodRI
x7d987fYfxpvJoVSy+T+g90L2x6vGNzCkb42lO7qriRO87+++YdoIaXW1WvuArkl
+wcmARzdlVSevjFMnspXOAsbJCdDyy2fNy8g6MJ3yZ7kzHc7ShmaoNoOasZJTW0b
y5Igtw6f1O3GKNDpPcgGf92eV/1ui4IWSANzE2o6LwxheQMOAPC4R/ZDNDfUPZVP
tw++7fJR0v9z6lSv26SNbfoVzJ9hD7sk+TbIO4JPgZQa7XIxBkiJsGutf6piEiOL
GJMVrip+7FxTgto2lxmmB/nbP5a9rhq190B+EmhNSp7UkgBUyTp+5IA0lAny52qS
7Brr5Mp/qK88IjWBWooPCZdKcKJBcZV8CzSv+oz6Eya8rxbCE7BPBPFr51ct0FN0
OZMMs3mjfNA2EpIGHrpQ9kIB5K6Wa2WrGGtcp8YPtukoNkv0hOLxWvorNQmGrANF
AfrmU2HfgXkBbjiA5FKTTdLQ/hX+s3Atw6dzCuZODTzwZksPFNnOXp4cb5c01KSZ
Mmbwi5uOvgLNB7eA0UQ/ZTsk3nJpkxQROO9MXAkC9r2OrukZzExa+0uLIq2Ga5L8
5G8LRB2slWE050hRSZsamjefe2/HyHEyozGYvVmfmkw6bFJ3JHA=
=D9DA
-----END PGP SIGNATURE-----

--MGYHOYXEY6WxJCY8--


