Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13255379768
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 21:08:22 +0200 (CEST)
Received: from localhost ([::1]:58118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgBGP-0007AL-5G
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 15:08:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lgBDx-0004RY-Aq
 for qemu-devel@nongnu.org; Mon, 10 May 2021 15:05:49 -0400
Received: from indium.canonical.com ([91.189.90.7]:42874)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lgBDu-0003FM-4l
 for qemu-devel@nongnu.org; Mon, 10 May 2021 15:05:49 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lgBDs-0001nP-Cb
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 19:05:44 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 53E902E8030
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 19:05:44 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 May 2021 18:59:31 -0000
From: Thomas Huth <1907427@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: glaubitz th-huth
X-Launchpad-Bug-Reporter: John Paul Adrian Glaubitz (glaubitz)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <160750521215.10480.16469807239042219779.malonedeb@wampee.canonical.com>
Message-Id: <162067317135.7198.2368671580805654376.malone@gac.canonical.com>
Subject: [Bug 1907427] Re: Build on sparc64 fails with "undefined reference to
 `fdt_check_full'"
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="dccd804998035922efb3da0a725ecc923e2255f3"; Instance="production"
X-Launchpad-Hash: be99183208f28d0c2d49d1949b4bac93155153e3
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_HI=-5,
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

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'expired' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/255


** Changed in: qemu
       Status: New =3D> Expired

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #255
   https://gitlab.com/qemu-project/qemu/-/issues/255

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1907427

Title:
  Build on sparc64 fails with "undefined reference to `fdt_check_full'"

Status in QEMU:
  Expired

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

