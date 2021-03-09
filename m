Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8ED4332FAD
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 21:14:09 +0100 (CET)
Received: from localhost ([::1]:34554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJik4-0000pq-Lj
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 15:14:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lJhtj-0005va-FJ
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 14:20:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37676)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lJhte-0005fR-6r
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 14:20:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615317596;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Z52Duxqvam6xJ+rvUcJYYxt+E8oMxglz2BXSaxJYD+I=;
 b=c7VAqqfEXDG93rWQU2nwUjVFZbbAtntrhlb8iqtIfPRxabdbSh/mJdmzBim2FzPfyUcLF6
 GPfx9XE3pXdOjCocawqaQkgZpPtrKXxjnl+ZDNr/lKuFQDmWLUMsI1X6z/Dq4pn+3Vnd+a
 y7/MqXiDSp65/ZgRykvF8WjDfOAp+W4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-554-h1hvAuUwOP-_EzjCDKqojA-1; Tue, 09 Mar 2021 14:19:52 -0500
X-MC-Unique: h1hvAuUwOP-_EzjCDKqojA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A36F226860;
 Tue,  9 Mar 2021 19:19:51 +0000 (UTC)
Received: from localhost (ovpn-117-250.rdu2.redhat.com [10.10.117.250])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6C4F61B400;
 Tue,  9 Mar 2021 19:19:51 +0000 (UTC)
Date: Tue, 9 Mar 2021 14:04:46 -0500
From: Cleber Rosa <crosa@redhat.com>
To: Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: Re: [PATCH 2/3] tests/acceptance: Let the framework handle
 "cpu:VALUE" tagged tests
Message-ID: <20210309190446.GC2155904@amachine.somewhere>
References: <20210224212654.1146167-1-wainersm@redhat.com>
 <20210224212654.1146167-3-wainersm@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210224212654.1146167-3-wainersm@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="t0UkRYy7tHLRMCai"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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

--t0UkRYy7tHLRMCai
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 24, 2021 at 06:26:53PM -0300, Wainer dos Santos Moschetta wrote=
:
> The tests that are already tagged with "cpu:VALUE" don't need to add
> "-cpu VALUE" to the list of arguments of the vm object because the avocad=
o_qemu
> framework is able to handle it automatically. So this adjust those tests =
and
> ensure their cpu's VALUE are recognized by QEMU.
>=20
> Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
> ---
>  tests/acceptance/boot_linux.py         |  3 ---
>  tests/acceptance/machine_mips_malta.py |  7 +++----
>  tests/acceptance/replay_kernel.py      |  8 +++-----
>  tests/acceptance/reverse_debugging.py  |  2 +-
>  tests/acceptance/tcg_plugins.py        | 15 +++++++--------
>  5 files changed, 14 insertions(+), 21 deletions(-)
>=20
> diff --git a/tests/acceptance/boot_linux.py b/tests/acceptance/boot_linux=
.py
> index 0d178038a0..55637d126e 100644
> --- a/tests/acceptance/boot_linux.py
> +++ b/tests/acceptance/boot_linux.py
> @@ -82,7 +82,6 @@ def test_virt_tcg(self):
>          """
>          self.require_accelerator("tcg")
>          self.vm.add_args("-accel", "tcg")
> -        self.vm.add_args("-cpu", "max")
>          self.vm.add_args("-machine", "virt,gic-version=3D2")
>          self.add_common_args()
>          self.launch_and_wait()
> @@ -95,7 +94,6 @@ def test_virt_kvm_gicv2(self):
>          """
>          self.require_accelerator("kvm")
>          self.vm.add_args("-accel", "kvm")
> -        self.vm.add_args("-cpu", "host")
>          self.vm.add_args("-machine", "virt,gic-version=3D2")
>          self.add_common_args()
>          self.launch_and_wait()
> @@ -108,7 +106,6 @@ def test_virt_kvm_gicv3(self):
>          """
>          self.require_accelerator("kvm")
>          self.vm.add_args("-accel", "kvm")
> -        self.vm.add_args("-cpu", "host")
>          self.vm.add_args("-machine", "virt,gic-version=3D3")
>          self.add_common_args()
>          self.launch_and_wait()
> diff --git a/tests/acceptance/machine_mips_malta.py b/tests/acceptance/ma=
chine_mips_malta.py
> index 7c9a4ee4d2..b67d8cb141 100644
> --- a/tests/acceptance/machine_mips_malta.py
> +++ b/tests/acceptance/machine_mips_malta.py
> @@ -62,7 +62,6 @@ def do_test_i6400_framebuffer_logo(self, cpu_cores_coun=
t):
>          kernel_command_line =3D (self.KERNEL_COMMON_COMMAND_LINE +
>                                 'clocksource=3DGIC console=3Dtty0 console=
=3DttyS0')
>          self.vm.add_args('-kernel', kernel_path,
> -                         '-cpu', 'I6400',
>                           '-smp', '%u' % cpu_cores_count,
>                           '-vga', 'std',
>                           '-append', kernel_command_line)
> @@ -96,7 +95,7 @@ def test_mips_malta_i6400_framebuffer_logo_1core(self):
>          """
>          :avocado: tags=3Darch:mips64el
>          :avocado: tags=3Dmachine:malta
> -        :avocado: tags=3Dcpu:i6400
> +        :avocado: tags=3Dcpu:I6400

This is actually a fix in itself, as the CPU model is indeed case
sensitive:

  $ ./qemu-system-mips64el -cpu i6400
  qemu-system-mips64el: unable to find CPU model 'i6400'

I'd put it in a separate patch.

>          """
>          self.do_test_i6400_framebuffer_logo(1)
> =20
> @@ -105,7 +104,7 @@ def test_mips_malta_i6400_framebuffer_logo_7cores(sel=
f):
>          """
>          :avocado: tags=3Darch:mips64el
>          :avocado: tags=3Dmachine:malta
> -        :avocado: tags=3Dcpu:i6400
> +        :avocado: tags=3Dcpu:I6400
>          :avocado: tags=3Dmips:smp
>          """
>          self.do_test_i6400_framebuffer_logo(7)
> @@ -115,7 +114,7 @@ def test_mips_malta_i6400_framebuffer_logo_8cores(sel=
f):
>          """
>          :avocado: tags=3Darch:mips64el
>          :avocado: tags=3Dmachine:malta
> -        :avocado: tags=3Dcpu:i6400
> +        :avocado: tags=3Dcpu:I6400
>          :avocado: tags=3Dmips:smp
>          """
>          self.do_test_i6400_framebuffer_logo(8)
> diff --git a/tests/acceptance/replay_kernel.py b/tests/acceptance/replay_=
kernel.py
> index c1cb862468..6ae18485be 100644
> --- a/tests/acceptance/replay_kernel.py
> +++ b/tests/acceptance/replay_kernel.py
> @@ -156,8 +156,7 @@ def test_aarch64_virt(self):
>                                 'console=3DttyAMA0')
>          console_pattern =3D 'VFS: Cannot open root device'
> =20
> -        self.run_rr(kernel_path, kernel_command_line, console_pattern,
> -                    args=3D('-cpu', 'cortex-a53'))
> +        self.run_rr(kernel_path, kernel_command_line, console_pattern)
> =20
>      def test_arm_virt(self):
>          """
> @@ -303,7 +302,7 @@ def test_ppc64_e500(self):
>          tar_url =3D ('https://www.qemu-advent-calendar.org'
>                     '/2018/download/day19.tar.xz')
>          file_path =3D self.fetch_asset(tar_url, asset_hash=3Dtar_hash)
> -        self.do_test_advcal_2018(file_path, 'uImage', ('-cpu', 'e5500'))
> +        self.do_test_advcal_2018(file_path, 'uImage')
> =20
>      def test_ppc_g3beige(self):
>          """
> @@ -350,8 +349,7 @@ def test_xtensa_lx60(self):
>          tar_url =3D ('https://www.qemu-advent-calendar.org'
>                     '/2018/download/day02.tar.xz')
>          file_path =3D self.fetch_asset(tar_url, asset_hash=3Dtar_hash)
> -        self.do_test_advcal_2018(file_path, 'santas-sleigh-ride.elf',
> -                                 args=3D('-cpu', 'dc233c'))
> +        self.do_test_advcal_2018(file_path, 'santas-sleigh-ride.elf')
> =20
>  @skipUnless(os.getenv('AVOCADO_TIMEOUT_EXPECTED'), 'Test might timeout')
>  class ReplayKernelSlow(ReplayKernelBase):
> diff --git a/tests/acceptance/reverse_debugging.py b/tests/acceptance/rev=
erse_debugging.py
> index be01aca217..d2921e70c3 100644
> --- a/tests/acceptance/reverse_debugging.py
> +++ b/tests/acceptance/reverse_debugging.py
> @@ -207,4 +207,4 @@ def test_aarch64_virt(self):
>          kernel_path =3D self.fetch_asset(kernel_url, asset_hash=3Dkernel=
_hash)
> =20
>          self.reverse_debugging(
> -            args=3D('-kernel', kernel_path, '-cpu', 'cortex-a53'))
> +            args=3D('-kernel', kernel_path))
> diff --git a/tests/acceptance/tcg_plugins.py b/tests/acceptance/tcg_plugi=
ns.py
> index c21bf9e52a..9ca1515c3b 100644
> --- a/tests/acceptance/tcg_plugins.py
> +++ b/tests/acceptance/tcg_plugins.py
> @@ -25,7 +25,7 @@ class PluginKernelBase(LinuxKernelTest):
>      KERNEL_COMMON_COMMAND_LINE =3D 'printk.time=3D1 panic=3D-1 '
> =20
>      def run_vm(self, kernel_path, kernel_command_line,
> -               plugin, plugin_log, console_pattern, args):
> +               plugin, plugin_log, console_pattern, args=3DNone):
> =20
>          vm =3D self.get_vm()
>          vm.set_console()
> @@ -68,7 +68,7 @@ def test_aarch64_virt_insn(self):
>          :avocado: tags=3Daccel:tcg
>          :avocado: tags=3Darch:aarch64
>          :avocado: tags=3Dmachine:virt
> -        :avocado: tags=3Dcpu:cortex-a57
> +        :avocado: tags=3Dcpu:cortex-a53

Another good catch, another fix that deserve to be split out of this
patch IMO.

Also, I'd double check with Alex if it makes any difference picking
a53 or a57 for this test case.

>          """
>          kernel_path =3D self._grab_aarch64_kernel()
>          kernel_command_line =3D (self.KERNEL_COMMON_COMMAND_LINE +
> @@ -80,8 +80,7 @@ def test_aarch64_virt_insn(self):
> =20
>          self.run_vm(kernel_path, kernel_command_line,
>                      "tests/plugin/libinsn.so", plugin_log.name,
> -                    console_pattern,
> -                    args=3D('-cpu', 'cortex-a53'))
> +                    console_pattern)
> =20
>          with plugin_log as lf, \
>               mmap.mmap(lf.fileno(), 0, access=3Dmmap.ACCESS_READ) as s:
> @@ -95,7 +94,7 @@ def test_aarch64_virt_insn_icount(self):
>          :avocado: tags=3Daccel:tcg
>          :avocado: tags=3Darch:aarch64
>          :avocado: tags=3Dmachine:virt
> -        :avocado: tags=3Dcpu:cortex-a57
> +        :avocado: tags=3Dcpu:cortex-a53
>          """
>          kernel_path =3D self._grab_aarch64_kernel()
>          kernel_command_line =3D (self.KERNEL_COMMON_COMMAND_LINE +
> @@ -108,7 +107,7 @@ def test_aarch64_virt_insn_icount(self):
>          self.run_vm(kernel_path, kernel_command_line,
>                      "tests/plugin/libinsn.so", plugin_log.name,
>                      console_pattern,
> -                    args=3D('-cpu', 'cortex-a53', '-icount', 'shift=3D1'=
))
> +                    args=3D('-icount', 'shift=3D1'))
> =20
>          with plugin_log as lf, \
>               mmap.mmap(lf.fileno(), 0, access=3Dmmap.ACCESS_READ) as s:
> @@ -121,7 +120,7 @@ def test_aarch64_virt_mem_icount(self):
>          :avocado: tags=3Daccel:tcg
>          :avocado: tags=3Darch:aarch64
>          :avocado: tags=3Dmachine:virt
> -        :avocado: tags=3Dcpu:cortex-a57
> +        :avocado: tags=3Dcpu:cortex-a53
>          """
>          kernel_path =3D self._grab_aarch64_kernel()
>          kernel_command_line =3D (self.KERNEL_COMMON_COMMAND_LINE +
> @@ -134,7 +133,7 @@ def test_aarch64_virt_mem_icount(self):
>          self.run_vm(kernel_path, kernel_command_line,
>                      "tests/plugin/libmem.so,arg=3Dboth", plugin_log.name=
,
>                      console_pattern,
> -                    args=3D('-cpu', 'cortex-a53', '-icount', 'shift=3D1'=
))
> +                    args=3D('-icount', 'shift=3D1'))
> =20
>          with plugin_log as lf, \
>               mmap.mmap(lf.fileno(), 0, access=3Dmmap.ACCESS_READ) as s:
> --=20
> 2.29.2
>=20

--t0UkRYy7tHLRMCai
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmBHxswACgkQZX6NM6Xy
CfN6aA/9Hho8O+ZS1daK/71vYkUTusV1oqSU5x89HRdndCZeARH0JeejXn6nnbzw
wBTNzNiogusQqd/QNCbbT/A0MYvuBkv5hzfFiPKLscH9rD8bwXMHPNl3fBf4V5Xi
OZzWTq1DAsuTZJf4AtWsDrvATGQQFXvxNMU7/+K7T+/jHw4cmk4NhB3oQKnFRN2Q
jSN8gq/nB48ErDz1oJVKo6NfSWCYP8lirEXnjC3rA+aApin5XlQHgernWkTSq0NG
FDhjns0uZlxOVWeRERipGwPUtEqJdjV5kaJV68A0echBJAzAQUSfK5Que9soueBh
1DW0cSGXArkGoDbwFPFgOEIGjrcbu/iyd/wGH1tsjPjEThWrsiQTsUPivvLVU5PH
wuHR0MW5ipHIK+hfvB+JIikueyuxCMuzHINQghNcIUf5lXFJplBdvRt2POWoNwlL
NeYqmayeL4I3gq2Snf8oZy9PEJ5bEhjsvwP0kKJGSYqNET1FUmTsE7AtPmEn3prk
3oxJpGZKRHFDXtqu1AzpEmPYDzEqGF9L0PkesvQgRhLyVGhZl7+HWAx+JCUpETvn
85pY1s+uLCul2UcW/HeKpuXVKrOBHScUqbcG5r05p0rGO3Q+cef7bsQvnY0MFWQ5
UePhHFngNBSnBh1SHMaHoKsKhM7cMx9VdPCypa1Wc0aNQaF0BCg=
=h+QT
-----END PGP SIGNATURE-----

--t0UkRYy7tHLRMCai--


