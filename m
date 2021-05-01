Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7CDF370667
	for <lists+qemu-devel@lfdr.de>; Sat,  1 May 2021 10:21:32 +0200 (CEST)
Received: from localhost ([::1]:35934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcksV-0003Lx-Bo
	for lists+qemu-devel@lfdr.de; Sat, 01 May 2021 04:21:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lckqk-0002UQ-78
 for qemu-devel@nongnu.org; Sat, 01 May 2021 04:19:42 -0400
Received: from indium.canonical.com ([91.189.90.7]:43428)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lckqi-0003tc-17
 for qemu-devel@nongnu.org; Sat, 01 May 2021 04:19:42 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lckqf-0003jS-RD
 for <qemu-devel@nongnu.org>; Sat, 01 May 2021 08:19:37 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id CB73F2E8163
 for <qemu-devel@nongnu.org>; Sat,  1 May 2021 08:19:37 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 01 May 2021 08:06:45 -0000
From: Thomas Huth <1499908@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: fgouget th-huth
X-Launchpad-Bug-Reporter: Francois Gouget (fgouget)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20150925223907.9398.42616.malonedeb@gac.canonical.com>
Message-Id: <161985640580.13621.10441007796682182642.malone@wampee.canonical.com>
Subject: [Bug 1499908] Re: hda sound capture broken with VNC
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="02afa4875ac52c169f5cddf0d1bcdd6e149a3754"; Instance="production"
X-Launchpad-Hash: a253753b001a1281fae6bfd62a06a7b93ef0f5c8
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
Reply-To: Bug 1499908 <1499908@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved
to QEMU's new bug tracker on gitlab.com and thus gets marked
as 'expired' now. Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/70


** Changed in: qemu
       Status: Incomplete =3D> Expired

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #70
   https://gitlab.com/qemu-project/qemu/-/issues/70

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1499908

Title:
  hda sound capture broken with VNC

Status in QEMU:
  Expired

Bug description:
  QEmu is being used to run the Wine conformance tests in Windows
  virtual machines. Wine's conformance tests check the behavior of
  various Windows APIs and verify that they behave as expected. One of
  the tests checks the behavior of the mmdevapi sound capture APIs. This
  test works fine on real hardware and also works fine in various QEmu
  VMs but fails in some others. Further investigation showed that:

   * The mmdevapi:capture tests work on the two Vista VMs. Those use the
  ac97 sound card and are configured for VNC access to the VM.

   * The mmdevapi:capture tests fail in the Windows 7+ VMs. Those use an
  hda sound card and are configured for VNC access to the VM (so
  '-device intel-hda,id=3Dsound0,bus=3Dpci.0,addr=3D0x4 -device hda-
  duplex,id=3Dsound0-codec0,bus=3Dsound0.0,cad=3D0' and '-vnc 127.0.0.1:0').

   * Furthermore configuring the VM for Spice access fixes the
  mmdevapi:capture test (so replacing -vnc with '-spice
  port=3D5900,addr=3D127.0.0.1,disable-ticketing,seamless-migration=3Don'),
  this even if no client connects to the VM.

  So in effect the -spice and -vnc options change the behavior of the
  sound device.

  To reproduce this bug:
  1. Set up a Windows 7+ VM with an hda sound card ('ich6' in libvirt).
  2. Set it up for access using VNC.
  3. Copy the attached mmdevapi_test.exe file to it. (*)
  4. Run the tests as follows:
     mmdevapi_test.exe capture

  If you see these 'Test Failed' lines then the bug is still present:

  capture.c:586: Returned latency: 5.8050 ms
  capture.c:178: Test failed: Position 1015 expected 0
  capture.c:186: Wait'ed position 1015 pad 0 flags 1, amount of frames lock=
ed: 448
  capture.c:228: Test failed: Position 2167 expected 1463
  capture.c:248: Sleep.1 position 2167 pad 4032 flags 1, amount of frames l=
ocked: 448
  capture.c:256: Test failed: Position 2167 expected 1463
  capture.c:292: GetBufferSize 21996 period size 448
  capture.c:302: Overrun position 4215 pad 8960 flags 1, amount of frames l=
ocked: 448
  capture.c:308: Test failed: GCP 8960 vs. BufferSize 21996
  capture.c:313: Test failed: Position 4215 gap 2304
  capture.c:329: Cont'ed position 5303 pad 8512 flags 1, amount of frames l=
ocked: 448
  capture.c:333: Test failed: Position 5303 expected 4663
  capture.c:334: Test failed: flags 1
  capture.c:353: Restart position 7351 pad 8064 flags 1, amount of frames l=
ocked: 448
  capture.c:358: Test failed: Position 7351 expected 5111
  capture.c:359: Test failed: flags 1

  In case it helps, here is the source of mmdevapi_test.exe:
  https://source.winehq.org/git/wine.git/?a=3Dblob;f=3Ddlls/mmdevapi/tests/=
capture.c;hb=3D60d1d6f5952e8b5d6fb0327a28c047058851fa70#l178

  =

  So far I have confirmed that this bug is present in QEmu as shipped in th=
e following Debian packages:
   * qemu-kvm + qemu-system-x86 1:2.1+dfsg-12+deb8u2 + linux-image-3.16.0-4=
-amd64 3.16.7-ckt11-1+deb8u3
   * qemu-system-x86 1:2.3+dfsg-6a + linux-image-4.1.0-1-amd64 4.1.3-1

  =

  (*) As alternatives to using the attached binary you can:
  - Compile it from Wine's source. See:
     https://source.winehq.org/git/wine.git/

  - Or download the latest WineTest binary from https://test.winehq.org/bui=
lds/winetest-latest.exe
     And extract the mmdevapi_test.exe from there:
     winetest.exe -x tests
     tests\mmdevapi_test.exe capture

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1499908/+subscriptions

