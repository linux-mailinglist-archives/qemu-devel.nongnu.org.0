Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 015C1332F9D
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 21:11:30 +0100 (CET)
Received: from localhost ([::1]:54394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJihU-0005IM-WF
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 15:11:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lJhtj-0005wR-FK
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 14:20:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lJhte-0005fM-8O
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 14:20:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615317596;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lAb/poRfsnDxgJC8JphkPmLqKx1aIX7mZ+Maip5DSQA=;
 b=MP7SDjQH2inP2tRMfBppWuDgzmCB115XGMP006ahWqIZTIXazhotmCqrKhMLkslIsw1Vt4
 auPRMOpnx65Y4P/XTVp+sxUdZ+ZGWLxQeRK8UKe+aUHjHYT6AJNu4tydsJsFrdJJUW50RQ
 +iu3/ERO2Fq+2Ad8nGqP6cpzHmQ/e5w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-149-bQ-Ux-F7PFOWX0plCEE4Cg-1; Tue, 09 Mar 2021 14:19:52 -0500
X-MC-Unique: bQ-Ux-F7PFOWX0plCEE4Cg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D505C108BD06;
 Tue,  9 Mar 2021 19:19:50 +0000 (UTC)
Received: from localhost (ovpn-117-250.rdu2.redhat.com [10.10.117.250])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9A0471B400;
 Tue,  9 Mar 2021 19:19:46 +0000 (UTC)
Date: Tue, 9 Mar 2021 14:18:26 -0500
From: Cleber Rosa <crosa@redhat.com>
To: Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: Re: [PATCH 3/3] tests/acceptance: Tagging tests with "cpu:VALUE"
Message-ID: <20210309191826.GD2155904@amachine.somewhere>
References: <20210224212654.1146167-1-wainersm@redhat.com>
 <20210224212654.1146167-4-wainersm@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210224212654.1146167-4-wainersm@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="sXc4Kmr5FA7axrvy"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: wrampazz@redhat.com, alex.bennee@linaro.org, qemu-devel@nongnu.org,
 pavel.dovgaluk@ispras.ru, pbonzini@redhat.com, philmd@redhat.com,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--sXc4Kmr5FA7axrvy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 24, 2021 at 06:26:54PM -0300, Wainer dos Santos Moschetta wrote=
:
> The existing tests which are passing "-cpu VALUE" argument to the vm obje=
ct
> are now properly "cpu:VALUE" tagged, so letting the avocado_qemu framewor=
k to
> handle that automatically.
>=20
> Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
> ---
>  tests/acceptance/boot_linux_console.py     | 16 +++++++++-------
>  tests/acceptance/pc_cpu_hotplug_props.py   |  2 +-
>  tests/acceptance/replay_kernel.py          |  9 ++++++---
>  tests/acceptance/virtio-gpu.py             |  4 ++--
>  tests/acceptance/x86_cpu_model_versions.py |  8 ++++++++
>  5 files changed, 26 insertions(+), 13 deletions(-)
>=20
> diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/bo=
ot_linux_console.py
> index eb01286799..2447b370ff 100644
> --- a/tests/acceptance/boot_linux_console.py
> +++ b/tests/acceptance/boot_linux_console.py
> @@ -238,6 +238,7 @@ def test_mips64el_malta_5KEc_cpio(self):
>          :avocado: tags=3Darch:mips64el
>          :avocado: tags=3Dmachine:malta
>          :avocado: tags=3Dendian:little
> +        :avocado: tags=3Dcpu:5KEc
>          """
>          kernel_url =3D ('https://github.com/philmd/qemu-testing-blob/'
>                        'raw/9ad2df38/mips/malta/mips64el/'
> @@ -257,8 +258,7 @@ def test_mips64el_malta_5KEc_cpio(self):
>          kernel_command_line =3D (self.KERNEL_COMMON_COMMAND_LINE
>                                 + 'console=3DttyS0 console=3Dtty '
>                                 + 'rdinit=3D/sbin/init noreboot')
> -        self.vm.add_args('-cpu', '5KEc',
> -                         '-kernel', kernel_path,
> +        self.vm.add_args('-kernel', kernel_path,
>                           '-initrd', initrd_path,
>                           '-append', kernel_command_line,
>                           '-no-reboot')
> @@ -286,7 +286,6 @@ def do_test_mips_malta32el_nanomips(self, kernel_url,=
 kernel_hash):
>                                 + 'mem=3D256m@@0x0 '
>                                 + 'console=3DttyS0')
>          self.vm.add_args('-no-reboot',
> -                         '-cpu', 'I7200',
>                           '-kernel', kernel_path,
>                           '-append', kernel_command_line)
>          self.vm.launch()
> @@ -298,6 +297,7 @@ def test_mips_malta32el_nanomips_4k(self):
>          :avocado: tags=3Darch:mipsel
>          :avocado: tags=3Dmachine:malta
>          :avocado: tags=3Dendian:little
> +        :avocado: tags=3Dcpu:I7200
>          """
>          kernel_url =3D ('https://mipsdistros.mips.com/LinuxDistro/nanomi=
ps/'
>                        'kernels/v4.15.18-432-gb2eb9a8b07a1-20180627102142=
/'
> @@ -310,6 +310,7 @@ def test_mips_malta32el_nanomips_16k_up(self):
>          :avocado: tags=3Darch:mipsel
>          :avocado: tags=3Dmachine:malta
>          :avocado: tags=3Dendian:little
> +        :avocado: tags=3Dcpu:I7200
>          """
>          kernel_url =3D ('https://mipsdistros.mips.com/LinuxDistro/nanomi=
ps/'
>                        'kernels/v4.15.18-432-gb2eb9a8b07a1-20180627102142=
/'
> @@ -322,6 +323,7 @@ def test_mips_malta32el_nanomips_64k_dbg(self):
>          :avocado: tags=3Darch:mipsel
>          :avocado: tags=3Dmachine:malta
>          :avocado: tags=3Dendian:little
> +        :avocado: tags=3Dcpu:I7200
>          """
>          kernel_url =3D ('https://mipsdistros.mips.com/LinuxDistro/nanomi=
ps/'
>                        'kernels/v4.15.18-432-gb2eb9a8b07a1-20180627102142=
/'
> @@ -333,6 +335,7 @@ def test_aarch64_virt(self):
>          """
>          :avocado: tags=3Darch:aarch64
>          :avocado: tags=3Dmachine:virt
> +        :avocado: tags=3Dcpu:cortex-a53
>          """
>          kernel_url =3D ('https://archives.fedoraproject.org/pub/archive/=
fedora'
>                        '/linux/releases/29/Everything/aarch64/os/images/p=
xeboot'
> @@ -343,8 +346,7 @@ def test_aarch64_virt(self):
>          self.vm.set_console()
>          kernel_command_line =3D (self.KERNEL_COMMON_COMMAND_LINE +
>                                 'console=3DttyAMA0')
> -        self.vm.add_args('-cpu', 'cortex-a53',
> -                         '-kernel', kernel_path,
> +        self.vm.add_args('-kernel', kernel_path,
>                           '-append', kernel_command_line)
>          self.vm.launch()
>          console_pattern =3D 'Kernel command line: %s' % kernel_command_l=
ine
> @@ -1076,9 +1078,9 @@ def test_ppc64_e500(self):
>          """
>          :avocado: tags=3Darch:ppc64
>          :avocado: tags=3Dmachine:ppce500
> +        :avocado: tags=3Dcpu:e5500
>          """
>          tar_hash =3D '6951d86d644b302898da2fd701739c9406527fe1'
> -        self.vm.add_args('-cpu', 'e5500')
>          self.do_test_advcal_2018('19', tar_hash, 'uImage')
> =20
>      def test_ppc_g3beige(self):
> @@ -1120,7 +1122,7 @@ def test_xtensa_lx60(self):
>          """
>          :avocado: tags=3Darch:xtensa
>          :avocado: tags=3Dmachine:lx60
> +        :avocado: tags=3Dcpu:dc233c
>          """
>          tar_hash =3D '49e88d9933742f0164b60839886c9739cb7a0d34'
> -        self.vm.add_args('-cpu', 'dc233c')
>          self.do_test_advcal_2018('02', tar_hash, 'santas-sleigh-ride.elf=
')
> diff --git a/tests/acceptance/pc_cpu_hotplug_props.py b/tests/acceptance/=
pc_cpu_hotplug_props.py
> index e49bf33fc5..f8a39e6d0a 100644
> --- a/tests/acceptance/pc_cpu_hotplug_props.py
> +++ b/tests/acceptance/pc_cpu_hotplug_props.py
> @@ -25,11 +25,11 @@
>  class OmittedCPUProps(Test):
>      """
>      :avocado: tags=3Darch:x86_64
> +    :avocado: tags=3Dcpu:qemu64
>      """
>      def test_no_die_id(self):
>          self.vm.add_args('-nodefaults', '-S')
>          self.vm.add_args('-smp', '1,sockets=3D2,cores=3D2,threads=3D2,ma=
xcpus=3D8')
> -        self.vm.add_args('-cpu', 'qemu64')
>          self.vm.add_args('-device', 'qemu64-x86_64-cpu,socket-id=3D1,cor=
e-id=3D0,thread-id=3D0')
>          self.vm.launch()
>          self.assertEquals(len(self.vm.command('query-cpus')), 2)
> diff --git a/tests/acceptance/replay_kernel.py b/tests/acceptance/replay_=
kernel.py
> index 6ae18485be..fefa6d8550 100644
> --- a/tests/acceptance/replay_kernel.py
> +++ b/tests/acceptance/replay_kernel.py
> @@ -394,6 +394,7 @@ def test_mips64el_malta_5KEc_cpio(self):
>          :avocado: tags=3Dmachine:malta
>          :avocado: tags=3Dendian:little
>          :avocado: tags=3Dslowness:high
> +        :avocado: tags=3Dcpu:5KEc
>          """
>          kernel_url =3D ('https://github.com/philmd/qemu-testing-blob/'
>                        'raw/9ad2df38/mips/malta/mips64el/'
> @@ -414,7 +415,7 @@ def test_mips64el_malta_5KEc_cpio(self):
>                                 'rdinit=3D/sbin/init noreboot')
>          console_pattern =3D 'Boot successful.'
>          self.run_rr(kernel_path, kernel_command_line, console_pattern, s=
hift=3D5,
> -                    args=3D('-initrd', initrd_path, '-cpu', '5KEc'))
> +                    args=3D('-initrd', initrd_path))
> =20
>      def do_test_mips_malta32el_nanomips(self, kernel_path_xz):
>          kernel_path =3D self.workdir + "kernel"
> @@ -426,14 +427,14 @@ def do_test_mips_malta32el_nanomips(self, kernel_pa=
th_xz):
>                                 'mem=3D256m@@0x0 '
>                                 'console=3DttyS0')
>          console_pattern =3D 'Kernel command line: %s' % kernel_command_l=
ine
> -        self.run_rr(kernel_path, kernel_command_line, console_pattern, s=
hift=3D5,
> -                    args=3D('-cpu', 'I7200'))
> +        self.run_rr(kernel_path, kernel_command_line, console_pattern, s=
hift=3D5)
> =20
>      def test_mips_malta32el_nanomips_4k(self):
>          """
>          :avocado: tags=3Darch:mipsel
>          :avocado: tags=3Dmachine:malta
>          :avocado: tags=3Dendian:little
> +        :avocado: tags=3Dcpu:I7200
>          """
>          kernel_url =3D ('https://mipsdistros.mips.com/LinuxDistro/nanomi=
ps/'
>                        'kernels/v4.15.18-432-gb2eb9a8b07a1-20180627102142=
/'
> @@ -447,6 +448,7 @@ def test_mips_malta32el_nanomips_16k_up(self):
>          :avocado: tags=3Darch:mipsel
>          :avocado: tags=3Dmachine:malta
>          :avocado: tags=3Dendian:little
> +        :avocado: tags=3Dcpu:I7200
>          """
>          kernel_url =3D ('https://mipsdistros.mips.com/LinuxDistro/nanomi=
ps/'
>                        'kernels/v4.15.18-432-gb2eb9a8b07a1-20180627102142=
/'
> @@ -460,6 +462,7 @@ def test_mips_malta32el_nanomips_64k_dbg(self):
>          :avocado: tags=3Darch:mipsel
>          :avocado: tags=3Dmachine:malta
>          :avocado: tags=3Dendian:little
> +        :avocado: tags=3Dcpu:I7200
>          """
>          kernel_url =3D ('https://mipsdistros.mips.com/LinuxDistro/nanomi=
ps/'
>                        'kernels/v4.15.18-432-gb2eb9a8b07a1-20180627102142=
/'
> diff --git a/tests/acceptance/virtio-gpu.py b/tests/acceptance/virtio-gpu=
.py
> index ab1a4c1a71..c650427379 100644
> --- a/tests/acceptance/virtio-gpu.py
> +++ b/tests/acceptance/virtio-gpu.py
> @@ -60,6 +60,7 @@ def test_virtio_vga_virgl(self):
>          """
>          :avocado: tags=3Darch:x86_64
>          :avocado: tags=3Ddevice:virtio-vga
> +        :avocado: tags=3Dcpu:host
>          """
>          kernel_command_line =3D (
>              self.KERNEL_COMMON_COMMAND_LINE + "console=3DttyS0 rdinit=3D=
/bin/bash"
> @@ -72,7 +73,6 @@ def test_virtio_vga_virgl(self):
>          initrd_path =3D self.fetch_asset(self.INITRD_URL)
> =20
>          self.vm.set_console()
> -        self.vm.add_args("-cpu", "host")
>          self.vm.add_args("-m", "2G")
>          self.vm.add_args("-machine", "pc,accel=3Dkvm")
>          self.vm.add_args("-device", "virtio-vga,virgl=3Don")
> @@ -96,6 +96,7 @@ def test_vhost_user_vga_virgl(self):
>          """
>          :avocado: tags=3Darch:x86_64
>          :avocado: tags=3Ddevice:vhost-user-vga
> +        :avocado: tags=3Dcpu:host
>          """
>          kernel_command_line =3D (
>              self.KERNEL_COMMON_COMMAND_LINE + "console=3DttyS0 rdinit=3D=
/bin/bash"
> @@ -135,7 +136,6 @@ def test_vhost_user_vga_virgl(self):
>          )
> =20
>          self.vm.set_console()
> -        self.vm.add_args("-cpu", "host")
>          self.vm.add_args("-m", "2G")
>          self.vm.add_args("-object", "memory-backend-memfd,id=3Dmem,size=
=3D2G")
>          self.vm.add_args("-machine", "pc,memory-backend=3Dmem,accel=3Dkv=
m")
> diff --git a/tests/acceptance/x86_cpu_model_versions.py b/tests/acceptanc=
e/x86_cpu_model_versions.py
> index 2b7461bb41..8a0a07ef71 100644
> --- a/tests/acceptance/x86_cpu_model_versions.py
> +++ b/tests/acceptance/x86_cpu_model_versions.py
> @@ -252,6 +252,7 @@ def get_cpu_prop(self, prop):
>      def test_4_1(self):
>          """
>          :avocado: tags=3Dmachine:pc-i440fx-4.1
> +        :avocado: tags=3Dcpu:Cascadelake-Server
>          """
>          # machine-type only:
>          self.vm.add_args('-S')
> @@ -263,6 +264,7 @@ def test_4_1(self):
>      def test_4_0(self):
>          """
>          :avocado: tags=3Dmachine:pc-i440fx-4.0
> +        :avocado: tags=3Dcpu:Cascadelake-Server
>          """
>          self.vm.add_args('-S')
>          self.vm.add_args('-cpu', 'Cascadelake-Server,x-force-features=3D=
on,check=3Doff,enforce=3Doff')
> @@ -273,6 +275,7 @@ def test_4_0(self):
>      def test_set_4_0(self):
>          """
>          :avocado: tags=3Dmachine:pc-i440fx-4.0
> +        :avocado: tags=3Dcpu:Cascadelake-Server
>          """
>          # command line must override machine-type if CPU model is not ve=
rsioned:
>          self.vm.add_args('-S')
> @@ -284,6 +287,7 @@ def test_set_4_0(self):
>      def test_unset_4_1(self):
>          """
>          :avocado: tags=3Dmachine:pc-i440fx-4.1
> +        :avocado: tags=3Dcpu:Cascadelake-Server
>          """
>          self.vm.add_args('-S')
>          self.vm.add_args('-cpu', 'Cascadelake-Server,x-force-features=3D=
on,check=3Doff,enforce=3Doff,-arch-capabilities')
> @@ -294,6 +298,7 @@ def test_unset_4_1(self):
>      def test_v1_4_0(self):
>          """
>          :avocado: tags=3Dmachine:pc-i440fx-4.0
> +        :avocado: tags=3Dcpu:Cascadelake-Server
>          """
>          # versioned CPU model overrides machine-type:
>          self.vm.add_args('-S')
> @@ -305,6 +310,7 @@ def test_v1_4_0(self):
>      def test_v2_4_0(self):
>          """
>          :avocado: tags=3Dmachine:pc-i440fx-4.0
> +        :avocado: tags=3Dcpu:Cascadelake-Server
>          """
>          self.vm.add_args('-S')
>          self.vm.add_args('-cpu', 'Cascadelake-Server-v2,x-force-features=
=3Don,check=3Doff,enforce=3Doff')
> @@ -315,6 +321,7 @@ def test_v2_4_0(self):
>      def test_v1_set_4_0(self):
>          """
>          :avocado: tags=3Dmachine:pc-i440fx-4.0
> +        :avocado: tags=3Dcpu:Cascadelake-Server
>          """
>          # command line must override machine-type and versioned CPU mode=
l:
>          self.vm.add_args('-S')
> @@ -326,6 +333,7 @@ def test_v1_set_4_0(self):
>      def test_v2_unset_4_1(self):
>          """
>          :avocado: tags=3Dmachine:pc-i440fx-4.1
> +        :avocado: tags=3Dcpu:Cascadelake-Server
>          """
>          self.vm.add_args('-S')
>          self.vm.add_args('-cpu', 'Cascadelake-Server-v2,x-force-features=
=3Don,check=3Doff,enforce=3Doff,-arch-capabilities')
> --=20
> 2.29.2
>=20

So these do produce duplicate '-cpu' arguments indeed:

   VM launch command: './qemu-system-x86_64 -display none -vga none
       -chardev socket,id=3Dmon,path=3D/var/tmp/avo_qemu_sock_syr8rstd/qemu=
-2162592-monitor.sock
       -mon chardev=3Dmon,mode=3Dcontrol -machine pc-i440fx-4.1
       -cpu Cascadelake-Server -S
       -cpu Cascadelake-Server,x-force-features=3Don,check=3Doff,enforce=3D=
off'

Like I said elsewhere, I think we should prevent this from happen (and
it looks like it wouldn't be very hard to do so).

Also, IIUC, you left this commit to *add* tags (and consequently
remove the manual setting of the '-cpu' args.  But, on the previous
patch, because of the fixes, you still do some of that, so it's not as
easy to spot the difference in intention between this patch and the
previous one.  IMO, it's another indication that you should split out
the tag fixes.

Regards,
- Cleber.

--sXc4Kmr5FA7axrvy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmBHygAACgkQZX6NM6Xy
CfMriA//YbpEi14+3okm2QDmBHf/BBpPOLzC3NNhSJYh25CXBBNs0q6djzFsM39A
zJbHWyRdGjZ3y2jYnIPWhlSXoWgDD1CjvDDnEhupPFqCWYF3jpCaVJ+e+WRu6fDX
pq4x7YcPNCHiSzxXWELWR+7++GhicPO89Q21yY7WLA4Idla8aXpKn0jTz962Zh9o
9Dqz8FcVrEf4c2/ICEffuib3VCg0LIthwgHi9RZuYzHrk0/ofDfk3E2KMyRRX45T
eQ3iKMnfCM3tkLyGofuN9XzcgFyIlnzls0UIngrun8sMe2f+ZbpuULnWvig6RWu7
hnqSQzuxqqfTRzQ3gji8c2tJQDZMcYBe8al0mW8F85M2JRq6gJnV+IoMkVbaN1ZR
cMNoxIpFCTfsNyZ3xYNzXS8rUoNyojGbVuPftGVGLDKGp2+GJ1vfvXXAR698z71h
pR/QzLH1iI/60hon/z2c72ME0T/9yNSDg/M7YIEHUWcBCzMoPtv37bPb2g+P0v92
l1QHqyO+y6oUgLKOlj6G4v/Okty0IIqljYtzBsoBWMb2LCWcy+YsJoGR/+3gCMx/
XUPOJqugASO9W6qoqhB/UYznHtYnndDjPGS2nKuSRYI4AHROUBmDzgrLzDcIm/RT
0eS6Xycj7zW6NgcpP6rIY5xkybQG8nbPKDAESVO02kDm4aPmBTI=
=YOLk
-----END PGP SIGNATURE-----

--sXc4Kmr5FA7axrvy--


