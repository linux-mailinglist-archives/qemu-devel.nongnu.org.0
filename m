Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EEDE37508C
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 10:08:12 +0200 (CEST)
Received: from localhost ([::1]:56022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leZ3L-0000Lp-Ip
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 04:08:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leZ1F-0007Sl-VB
 for qemu-devel@nongnu.org; Thu, 06 May 2021 04:06:01 -0400
Received: from indium.canonical.com ([91.189.90.7]:33410)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leZ1B-0007if-OE
 for qemu-devel@nongnu.org; Thu, 06 May 2021 04:06:01 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1leZ1A-0006b0-6T
 for <qemu-devel@nongnu.org>; Thu, 06 May 2021 08:05:56 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 2F8CC2E8136
 for <qemu-devel@nongnu.org>; Thu,  6 May 2021 08:05:56 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 May 2021 07:59:49 -0000
From: Thomas Huth <1871270@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: feature-request macos usb
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: michaellee8 th-huth
X-Launchpad-Bug-Reporter: Michael Lee (michaellee8)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <158622299039.23234.8027719061228410112.malonedeb@wampee.canonical.com>
Message-Id: <162028798930.7036.5852859320038659189.malone@wampee.canonical.com>
Subject: [Bug 1871270] Re: [Feature Request] add usbredir device reset
 blacklist options support to allow macOS guest to iOS device usbredir
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d6ba96cccb3d3e356754af3137c6128a6c17e2a8"; Instance="production"
X-Launchpad-Hash: 679330cdc0464de5118c1f6f0340d8a3e8ca50a7
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

The QEMU project is currently moving its bug tracking to another system.
For this we need to know which bugs are still valid and which could be
closed already. Thus we are setting older bugs to "Incomplete" now.

If you still think this bug report here is valid, then please switch
the state back to "New" within the next 60 days, otherwise this report
will be marked as "Expired". Or please mark it as "Fix Released" if
the problem has been solved with a newer version of QEMU already.

Thank you and sorry for the inconvenience.


** Tags added: macos usb

** Changed in: qemu
       Status: New =3D> Incomplete

** Tags added: feature-request

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1871270

Title:
  [Feature Request] add usbredir device reset blacklist options support
  to allow macOS guest to iOS device usbredir

Status in QEMU:
  Incomplete

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

