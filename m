Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C130C2B0058
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 08:29:21 +0100 (CET)
Received: from localhost ([::1]:50982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kd72m-0008Fc-TL
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 02:29:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kd6ud-0007fv-6y
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 02:20:57 -0500
Received: from indium.canonical.com ([91.189.90.7]:54974)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kd6ua-0006Jt-5d
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 02:20:54 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kd6uY-0005e5-KC
 for <qemu-devel@nongnu.org>; Thu, 12 Nov 2020 07:20:50 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 969782E80E9
 for <qemu-devel@nongnu.org>; Thu, 12 Nov 2020 07:20:50 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2020 07:12:11 -0000
From: Thomas Huth <1795369@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: artem.pisarenko th-huth
X-Launchpad-Bug-Reporter: Artem Pisarenko (artem.pisarenko)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <153839106192.31215.12352296438682774073.malonedeb@chaenomeles.canonical.com>
Message-Id: <160516513166.23750.1381081838744528358.malone@wampee.canonical.com>
Subject: [Bug 1795369] Re: Record/replay (icount rr) causes emulation hang or
 exit with error about missing events in log
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="9218c6cee10bde7201ace93cd659634a9bc6c70a"; Instance="production"
X-Launchpad-Hash: ade9ab5ec335dc59b48d55bdadd6535b4a4eb43c
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 01:35:39
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1795369 <1795369@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project is currently considering to move its bug tracking to anoth=
er system. For this we need to know which bugs are still valid and which co=
uld be closed already. Thus we are setting older bugs to "Incomplete" now.
If you still think this bug report here is valid, then please switch the st=
ate back to "New" within the next 60 days, otherwise this report will be ma=
rked as "Expired". Or mark it as "Fix Released" if the problem has been sol=
ved with a newer version of QEMU already. Thank you and sorry for the incon=
venience.

** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1795369

Title:
  Record/replay (icount rr) causes emulation hang or exit with error
  about missing events in log

Status in QEMU:
  Incomplete

Bug description:
  Test case description:

  Guest image is Linux, which just powers off after kernel boots (instead o=
f proceeding to user-space /init or /sbin/init).
  Base cmdline:
    qemu-system-x86_64 \
      -nodefaults -nographic -machine pc,accel=3Dtcg -m 2048 -cpu qemu64 \
      -kernel bzImage -initrd rootfs -append 'nokaslr console=3DttyS0 rdini=
t=3D/init_poweroff' \
      -serial SERIAL_VALUE \
      -rtc clock=3Dvm,base=3D2000-01-01T00:00:00 \
      -icount 1,sleep=3Doff,rr=3DRR_VALUE,rrfile=3Dicount_rr_capture.bin

  Test 1.
  When SERIAL_VALUE=3Dnone
  Running with RR_VALUE=3Drecord completes successfully.
  Running with RR_VALUE=3Dreplay doesn't completes. qemu process just eatin=
g ~100% cpu and memory usage doesn't grow after some moment. I don't see wh=
at happens because of problem no.2 (see below).

  Test 2.
  When SERIAL_VALUE=3Dstdio
  Running with RR_VALUE=3Drecord completes successfully.
  Running with RR_VALUE=3Dreplay causes exit with error:
  "qemu-system-x86_64: Missing character write event in the replay log"

  Tests 3,4,5...
  SERIAL_VALUE=3Dstdio. Playing with "-rtc" clock and base suboptions, "-ic=
ount" sleep suboptions produces non-repeatable results.
  In most cases running with RR_VALUE=3Drecord completes successfully (but =
may hang at very begining).
  Running with RR_VALUE=3Dreplay with combinations of removing "-rtc base=
=3D..." and "-icount sleep=3D..." goes better, but at different places of b=
oot process it may either hang (as in test 1) or exit with error (as in tes=
t 2).
  When qemu "hangs", it may also happen differently: either it can be stopp=
ed by Ctrl-C, or have to be killed.

  =

  Guest image uploaded here: https://drive.google.com/open?id=3D1SHG4HyBdcP=
utc5Au4pyhN8z9w52et51A

  QEMU built from master (commit 042938f46e1c477419d1931381fdadffaa49d45e) =
with:
  <SRC_ROOT>/configure --prefix=3D<INSTALL_ROOT> --target-list=3Dx86_64-sof=
tmmu --enable-debug --disable-pie --enable-tcg --disable-tcg-interpreter --=
enable-virtfs --disable-docs --disable-guest-agent --disable-modules --disa=
ble-gnutls --disable-nettle --disable-gcrypt --disable-sdl --disable-curses=
 --disable-vnc --disable-vnc-sasl --disable-vnc-jpeg --disable-vnc-png --di=
sable-cocoa --disable-xen --disable-xen-pci-passthrough --disable-brlapi --=
disable-curl --disable-fdt --disable-bluez --disable-kvm --disable-hax --di=
sable-hvf --disable-whpx --disable-rdma --disable-vde --disable-netmap --di=
sable-cap-ng --disable-spice --disable-rbd --disable-libiscsi --disable-lib=
nfs --disable-smartcard --disable-libusb --disable-live-block-migration --d=
isable-usb-redir --disable-glusterfs --disable-tpm --disable-libssh2 --disa=
ble-numa --disable-libxml2 --disable-opengl --disable-virglrenderer --disab=
le-qom-cast-debug --disable-tools --disable-vxhs --disable-crypto-afalg --d=
isable-capstone --disable-replication --disable-xfsctl --disable-seccomp --=
disable-pvrdma --disable-libpmem

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1795369/+subscriptions

