Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4162D3E9B
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 10:24:03 +0100 (CET)
Received: from localhost ([::1]:53560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmvha-0007kG-5I
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 04:24:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kmveO-0006FX-Va
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 04:20:45 -0500
Received: from indium.canonical.com ([91.189.90.7]:36096)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kmveM-00066O-6h
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 04:20:44 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kmveJ-0001z1-4V
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 09:20:39 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 20D312E8137
 for <qemu-devel@nongnu.org>; Wed,  9 Dec 2020 09:20:39 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Dec 2020 09:13:32 -0000
From: John Paul Adrian Glaubitz <1907427@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: glaubitz
X-Launchpad-Bug-Reporter: John Paul Adrian Glaubitz (glaubitz)
X-Launchpad-Bug-Modifier: John Paul Adrian Glaubitz (glaubitz)
Message-Id: <160750521215.10480.16469807239042219779.malonedeb@wampee.canonical.com>
Subject: [Bug 1907427] [NEW] Build on sparc64 fails with "undefined reference
 to `fdt_check_full'"
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="4853cb86c14c5a9e513816c8a61121c639b30835"; Instance="production"
X-Launchpad-Hash: cc8c9830a75af928faa3e0327a2e6be70f61e6af
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Bug 1907427 <1907427@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

Trying to build QEMU on sparc64 fails with:

[4648/8435] c++  -o qemu-system-ppc64 qemu-system-ppc64.p/softmmu_main.c.o =
libcommon.fa.p/ui_vnc-auth-sasl.c.o libcommon.fa.p/migration_colo-failover.=
c.o libcommon.fa.p/hw_input_vhost-user-input.c.o libcommon.fa.p/replay_repl=
ay-random.c.o libcommon.fa.p/hw_9pfs_codir.c.o libcommon.fa.p/hw_display_ed=
id-region.c.o libcommon.fa.p/hw_net_vhost_net.c.o libcommon.fa.p/hw_isa_i82=
378.c.o libcommon.fa.p/backends_rng-egd.c.o libcommon.fa.p/hw_usb_core.c.o =
libcommon.fa.p/hw_pci-bridge_i82801b11.c.o libcommon.fa.p/net_tap.c.o libco=
mmon.fa.p/hw_ipack_ipack.c.o libcommon.fa.p/hw_scsi_mptconfig.c.o libcommon=
.fa.p/hw_usb_libhw.c.o libcommon.fa.p/hw_display_sm501.c.o libcommon.fa.p/h=
w_net_rocker_rocker_world.c.o libcommon.fa.p/fsdev_qemu-fsdev.c.o libcommon=
.fa.p/backends_tpm_tpm_util.c.o libcommon.fa.p/net_tap-linux.c.o libcommon.=
fa.p/hw_net_rocker_rocker_fp.c.o libcommon.fa.p/hw_usb_dev-uas.c.o libcommo=
n.fa.p/hw_net_fsl_etsec_miim.c.o libcommon.fa.p/net_queue.c.o libcommon.fa.=
p/hw_isa_isa-superio.c.o libcommon.fa.p/migration_global_state.c.o libcommo=
n.fa.p/backends_rng-random.c.o libcommon.fa.p/hw_ipmi_ipmi_bmc_extern.c.o l=
ibcommon.fa.p/migration_postcopy-ram.c.o libcommon.fa.p/hw_scsi_megasas.c.o=
 libcommon.fa.p/hw_acpi_acpi-stub.c.o libcommon.fa.p/hw_nvram_mac_nvram.c.o=
 libcommon.fa.p/hw_net_pcnet-pci.c.o libcommon.fa.p/cpus-common.c.o libcomm=
on.fa.p/hw_core_qdev-properties-system.c.o libcommon.fa.p/migration_colo.c.=
o libcommon.fa.p/ui_spice-module.c.o libcommon.fa.p/hw_usb_hcd-ehci-pci.c.o=
 libcommon.fa.p/migration_exec.c.o libcommon.fa.p/hw_input_adb-kbd.c.o libc=
ommon.fa.p/hw_timer_xilinx_timer.c.o libcommon.fa.p/hw_cpu_core.c.o libcomm=
on.fa.p/chardev_msmouse.c.o libcommon.fa.p/migration_socket.c.o libcommon.f=
a.p/hw_9pfs_9p-synth.c.o libcommon.fa.p/backends_dbus-vmstate.c.o libcommon=
.fa.p/net_colo-compare.c.o libcommon.fa.p/hw_misc_macio_cuda.c.o libcommon.=
fa.p/hw_audio_intel-hda.c.o libcommon.fa.p/audio_audio_legacy.c.o
(...)
libio.fa libchardev.fa -Wl,--no-whole-archive -Wl,--warn-common -Wl,-z,relr=
o -Wl,-z,now -m64 -g -O2 -fdebug-prefix-map=3D/<<PKGBUILDDIR>>=3D. -fstack-=
protector-strong -Wformat -Werror=3Dformat-security -Wdate-time -D_FORTIFY_=
SOURCE=3D2 -Wl,-z,relro -Wl,--as-needed -fstack-protector-strong libmigrati=
on.fa -Wl,--start-group libqemuutil.a contrib/libvhost-user/libvhost-user.a=
 libqmp.fa libhwcore.fa libblockdev.fa libblock.fa libcrypto.fa libauthz.fa=
 libqom.fa libio.fa libchardev.fa @block.syms @qemu.syms /usr/lib/gcc/sparc=
64-linux-gnu/10/../../../sparc64-linux-gnu/libfdt.so /usr/lib/sparc64-linux=
-gnu/libcapstone.so -lepoxy -lgbm /usr/lib/sparc64-linux-gnu/libpixman-1.so=
 /usr/lib/sparc64-linux-gnu/libz.so /usr/lib/sparc64-linux-gnu/libslirp.so =
/usr/lib/sparc64-linux-gnu/libglib-2.0.so -lrdmacm -libverbs -libumad -lgio=
-2.0 -lgobject-2.0 -lglib-2.0 -lgio-2.0 -lgobject-2.0 -lglib-2.0 /usr/lib/g=
cc/sparc64-linux-gnu/10/../../../sparc64-linux-gnu/libsasl2.so @block.syms =
-lusb-1.0 /lib/sparc64-linux-gnu/libudev.so /usr/lib/sparc64-linux-gnu/libp=
ng16.so -lvdeplug /usr/lib/sparc64-linux-gnu/libjpeg.so -pthread -luring -l=
gnutls -lutil -lgio-2.0 -lgobject-2.0 -lglib-2.0 -lgio-2.0 -lgobject-2.0 -l=
glib-2.0 -lm -Wl,--export-dynamic -lgmodule-2.0 -lglib-2.0 -laio -luring -l=
gnutls -lnettle -lstdc++ -Wl,--end-group
/usr/bin/ld: libqemu-ppc64-softmmu.fa.p/hw_ppc_spapr_hcall.c.o: in function=
 `h_update_dt':
./b/qemu/../../hw/ppc/spapr_hcall.c:1966: undefined reference to `fdt_check=
_full'
collect2: error: ld returned 1 exit status

Full build log available at:
https://buildd.debian.org/status/fetch.php?pkg=3Dqemu&arch=3Dsparc64&ver=3D=
1%3A5.2%2Bdfsg-1&stamp=3D1607502300&raw=3D0

** Affects: qemu
     Importance: Undecided
         Status: New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1907427

Title:
  Build on sparc64 fails with "undefined reference to `fdt_check_full'"

Status in QEMU:
  New

Bug description:
  Trying to build QEMU on sparc64 fails with:

  [4648/8435] c++  -o qemu-system-ppc64 qemu-system-ppc64.p/softmmu_main.c.=
o libcommon.fa.p/ui_vnc-auth-sasl.c.o libcommon.fa.p/migration_colo-failove=
r.c.o libcommon.fa.p/hw_input_vhost-user-input.c.o libcommon.fa.p/replay_re=
play-random.c.o libcommon.fa.p/hw_9pfs_codir.c.o libcommon.fa.p/hw_display_=
edid-region.c.o libcommon.fa.p/hw_net_vhost_net.c.o libcommon.fa.p/hw_isa_i=
82378.c.o libcommon.fa.p/backends_rng-egd.c.o libcommon.fa.p/hw_usb_core.c.=
o libcommon.fa.p/hw_pci-bridge_i82801b11.c.o libcommon.fa.p/net_tap.c.o lib=
common.fa.p/hw_ipack_ipack.c.o libcommon.fa.p/hw_scsi_mptconfig.c.o libcomm=
on.fa.p/hw_usb_libhw.c.o libcommon.fa.p/hw_display_sm501.c.o libcommon.fa.p=
/hw_net_rocker_rocker_world.c.o libcommon.fa.p/fsdev_qemu-fsdev.c.o libcomm=
on.fa.p/backends_tpm_tpm_util.c.o libcommon.fa.p/net_tap-linux.c.o libcommo=
n.fa.p/hw_net_rocker_rocker_fp.c.o libcommon.fa.p/hw_usb_dev-uas.c.o libcom=
mon.fa.p/hw_net_fsl_etsec_miim.c.o libcommon.fa.p/net_queue.c.o libcommon.f=
a.p/hw_isa_isa-superio.c.o libcommon.fa.p/migration_global_state.c.o libcom=
mon.fa.p/backends_rng-random.c.o libcommon.fa.p/hw_ipmi_ipmi_bmc_extern.c.o=
 libcommon.fa.p/migration_postcopy-ram.c.o libcommon.fa.p/hw_scsi_megasas.c=
.o libcommon.fa.p/hw_acpi_acpi-stub.c.o libcommon.fa.p/hw_nvram_mac_nvram.c=
.o libcommon.fa.p/hw_net_pcnet-pci.c.o libcommon.fa.p/cpus-common.c.o libco=
mmon.fa.p/hw_core_qdev-properties-system.c.o libcommon.fa.p/migration_colo.=
c.o libcommon.fa.p/ui_spice-module.c.o libcommon.fa.p/hw_usb_hcd-ehci-pci.c=
.o libcommon.fa.p/migration_exec.c.o libcommon.fa.p/hw_input_adb-kbd.c.o li=
bcommon.fa.p/hw_timer_xilinx_timer.c.o libcommon.fa.p/hw_cpu_core.c.o libco=
mmon.fa.p/chardev_msmouse.c.o libcommon.fa.p/migration_socket.c.o libcommon=
.fa.p/hw_9pfs_9p-synth.c.o libcommon.fa.p/backends_dbus-vmstate.c.o libcomm=
on.fa.p/net_colo-compare.c.o libcommon.fa.p/hw_misc_macio_cuda.c.o libcommo=
n.fa.p/hw_audio_intel-hda.c.o libcommon.fa.p/audio_audio_legacy.c.o
  (...)
  libio.fa libchardev.fa -Wl,--no-whole-archive -Wl,--warn-common -Wl,-z,re=
lro -Wl,-z,now -m64 -g -O2 -fdebug-prefix-map=3D/<<PKGBUILDDIR>>=3D. -fstac=
k-protector-strong -Wformat -Werror=3Dformat-security -Wdate-time -D_FORTIF=
Y_SOURCE=3D2 -Wl,-z,relro -Wl,--as-needed -fstack-protector-strong libmigra=
tion.fa -Wl,--start-group libqemuutil.a contrib/libvhost-user/libvhost-user=
.a libqmp.fa libhwcore.fa libblockdev.fa libblock.fa libcrypto.fa libauthz.=
fa libqom.fa libio.fa libchardev.fa @block.syms @qemu.syms /usr/lib/gcc/spa=
rc64-linux-gnu/10/../../../sparc64-linux-gnu/libfdt.so /usr/lib/sparc64-lin=
ux-gnu/libcapstone.so -lepoxy -lgbm /usr/lib/sparc64-linux-gnu/libpixman-1.=
so /usr/lib/sparc64-linux-gnu/libz.so /usr/lib/sparc64-linux-gnu/libslirp.s=
o /usr/lib/sparc64-linux-gnu/libglib-2.0.so -lrdmacm -libverbs -libumad -lg=
io-2.0 -lgobject-2.0 -lglib-2.0 -lgio-2.0 -lgobject-2.0 -lglib-2.0 /usr/lib=
/gcc/sparc64-linux-gnu/10/../../../sparc64-linux-gnu/libsasl2.so @block.sym=
s -lusb-1.0 /lib/sparc64-linux-gnu/libudev.so /usr/lib/sparc64-linux-gnu/li=
bpng16.so -lvdeplug /usr/lib/sparc64-linux-gnu/libjpeg.so -pthread -luring =
-lgnutls -lutil -lgio-2.0 -lgobject-2.0 -lglib-2.0 -lgio-2.0 -lgobject-2.0 =
-lglib-2.0 -lm -Wl,--export-dynamic -lgmodule-2.0 -lglib-2.0 -laio -luring =
-lgnutls -lnettle -lstdc++ -Wl,--end-group
  /usr/bin/ld: libqemu-ppc64-softmmu.fa.p/hw_ppc_spapr_hcall.c.o: in functi=
on `h_update_dt':
  ./b/qemu/../../hw/ppc/spapr_hcall.c:1966: undefined reference to `fdt_che=
ck_full'
  collect2: error: ld returned 1 exit status

  Full build log available at:
  https://buildd.debian.org/status/fetch.php?pkg=3Dqemu&arch=3Dsparc64&ver=
=3D1%3A5.2%2Bdfsg-1&stamp=3D1607502300&raw=3D0

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1907427/+subscriptions

