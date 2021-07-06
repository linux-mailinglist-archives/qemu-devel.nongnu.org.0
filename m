Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4DB3BC5AA
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 06:41:51 +0200 (CEST)
Received: from localhost ([::1]:40852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0cu6-0007id-St
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 00:41:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m0cfe-0000KW-FD
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 00:26:55 -0400
Received: from indium.canonical.com ([91.189.90.7]:52582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m0cfc-0003QC-GU
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 00:26:54 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1m0cfO-0004xF-KH
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 04:26:38 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 517E62E8412
 for <qemu-devel@nongnu.org>; Tue,  6 Jul 2021 04:26:18 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 06 Jul 2021 04:17:27 -0000
From: Launchpad Bug Tracker <1871270@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: feature-request macos usb
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor michaellee8 th-huth
X-Launchpad-Bug-Reporter: Michael Lee (michaellee8)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <158622299039.23234.8027719061228410112.malonedeb@wampee.canonical.com>
Message-Id: <162554504730.7821.3570438518401815020.malone@loganberry.canonical.com>
Subject: [Bug 1871270] Re: [Feature Request] add usbredir device reset
 blacklist options support to allow macOS guest to iOS device usbredir
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fe01712f453e3d8fdd7cfee725621d71a8ae3628"; Instance="production"
X-Launchpad-Hash: 1c3f2b7fcb56b0b4d5ee86a82610326f62d2c43a
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
Reply-To: Bug 1871270 <1871270@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1871270

Title:
  [Feature Request] add usbredir device reset blacklist options support
  to allow macOS guest to iOS device usbredir

Status in QEMU:
  Expired

Bug description:
  Description of problem:
  Currently, when a iOS device is redirected to a macOS VM, it falls into a=
 reset-not-found loop.
  Version-Release number of selected component (if applicable):
  latest
  How reproducible:
  100%
  Steps to Reproduce:

  =

  Connect an iOS device to Ubuntu 18.04.2 LTS (I believe it is the same for=
 any distro.)

  =

  Connect virt-manager/virt-viewer to a macOS VM through SPICE (I am using =
OSX 10.15 Catalina)

  =

  Attempt to redirect the iOS device (iPad in my case) to the VM through us=
b redirection.

  =

  Actual results:
  For any odd number of attempt, the guest macOS will send a reset to the i=
OS device which causes the host to reset the USB connection in the host sid=
e. In the UI, it will be displayed as a successful connection for a few sec=
onds before it disconnects. After this, the iOS device will reconnect itsel=
f, but via a different device name /dev/bus/usb/x/y+1.
  For any even number of attempt, when I select the iOS device in the virt-=
manager/virt-viewer UI, the connection will not success and instead a LIBUS=
B_ERROR_NOT_FOUND error will be provided. Then the UI will reload and get t=
he new device name of the iOS device, falling into the behavior of the afor=
ementioned odd number of attempt.
  Expected results:
  The macOS detects the iOS device and connects to it happily.
  Additional info:
  It seems that this bug has been first identified as in https://bugs.freed=
esktop.org/show_bug.cgi?id=3D100149, for a Samsung Android device, which th=
e developers of SPICE applied a hotfix in https://gitlab.freedesktop.org/sp=
ice/usbredir/-/blob/master/usbredirhost/usbredirhost.c#L147. However, there=
 were no settings available for users to fix it.
  A similar bug that also consists of a macOS guest/iOS device pair, but in=
stead of being usbredir, is usb-host, has been identified and patched in ht=
tps://github.com/qemu/qemu/commit/ba4c735b4fc74e309ce4b2551d258e442ef513a5,=
 which is further modified into https://github.com/qemu/qemu/blame/146aa0f1=
04bb3bf88e43c4082a0bfc4bbda4fbd8/hw/usb/host-libusb.c#L1486. Following such=
 patch, I have attempted to apply such patch at host-side in https://github=
.com/michaellee8/qemu/blob/master/hw/usb/redirect.c (not correctly formatte=
d currently, pls ignore it atm), however I discovered that this is not enou=
gh since it is also a SPICE issue, which resolves to virt-manager/virt-view=
er.
  This is probably a cross-project issue between qemu, spice (usbredir) and=
 virt-manager/virt-viewer, which would some effort to coordinate a solution=
. However a working solution for this problem would probably benefits a lot=
 of users whom relies on connecting a mobile device into a VM, for purposes=
 like easier mobile development. Considering the report for the Samsung And=
roid Device on a PC use case, such issue is probably cross-OS/cross-device.

  cross-references:
  - https://bugzilla.redhat.com/show_bug.cgi?id=3D1821518
  - https://bugzilla.redhat.com/show_bug.cgi?id=3D1821517
  - https://gitlab.freedesktop.org/spice/usbredir/-/issues/10

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1871270/+subscriptions

