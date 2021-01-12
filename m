Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D5832F271B
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 05:33:34 +0100 (CET)
Received: from localhost ([::1]:43422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzBN7-0000Dg-2x
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 23:33:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kzBFk-00086a-0k
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 23:25:56 -0500
Received: from indium.canonical.com ([91.189.90.7]:51986)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kzBFa-0000rg-MF
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 23:25:55 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kzBFY-0004UN-Tr
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 04:25:44 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id CCB622E8144
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 04:25:44 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 Jan 2021 04:17:16 -0000
From: Launchpad Bug Tracker <1795369@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: artem.pisarenko janitor th-huth
X-Launchpad-Bug-Reporter: Artem Pisarenko (artem.pisarenko)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <153839106192.31215.12352296438682774073.malonedeb@chaenomeles.canonical.com>
Message-Id: <161042503640.10246.4568335587232671284.malone@loganberry.canonical.com>
Subject: [Bug 1795369] Re: Record/replay (icount rr) causes emulation hang or
 exit with error about missing events in log
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fe617ea08df036edd5c842aded2b315e1c090677"; Instance="production"
X-Launchpad-Hash: 97ee1284d62fcf3c442c442c7cc82c0a373ad919
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
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

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1795369

Title:
  Record/replay (icount rr) causes emulation hang or exit with error
  about missing events in log

Status in QEMU:
  Expired

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

