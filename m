Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A652B5DCB
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 12:02:29 +0100 (CET)
Received: from localhost ([::1]:46070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keykl-0001B6-UC
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 06:02:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1keyjN-0000hM-13
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 06:01:01 -0500
Received: from indium.canonical.com ([91.189.90.7]:48864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1keyjK-0000YE-Pi
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 06:01:00 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1keyjH-00035U-Kv
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 11:00:55 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 94D1F2E804B
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 11:00:55 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2020 10:51:25 -0000
From: Thomas Huth <1904464@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ffontaine th-huth
X-Launchpad-Bug-Reporter: Fabrice Fontaine (ffontaine)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <160555959985.17306.1370815502265671907.malonedeb@wampee.canonical.com>
Message-Id: <160561028601.30031.1273354227634249725.malone@gac.canonical.com>
Subject: [Bug 1904464] Re: Build fails with 64 bits time_t
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="a2ee2035671f86427804714f331b9ff7fecaef7e"; Instance="production"
X-Launchpad-Hash: a0debec5d58fcd587cc05ec2d0ed246a35013fd1
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 04:35:40
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
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
Reply-To: Bug 1904464 <1904464@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Please send patches to the qemu-devel mailing list (and CC: the
corresponding maintainers) for proper review of your patch. See
https://wiki.qemu.org/Contribute/SubmitAPatch for details. Thanks!

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1904464

Title:
  Build fails with 64 bits time_t

Status in QEMU:
  New

Bug description:
  time element is deprecated on new input_event structure in kernel's
  input.h [1]

  This will avoid the following build failure:

  hw/input/virtio-input-host.c: In function 'virtio_input_host_handle_statu=
s':
  hw/input/virtio-input-host.c:198:28: error: 'struct input_event' has no m=
ember named 'time'
    198 |     if (gettimeofday(&evdev.time, NULL)) {
        |                            ^

  Fixes:
   - http://autobuild.buildroot.org/results/a538167e288c14208d557cd45446df8=
6d3d599d5
   - http://autobuild.buildroot.org/results/efd4474fb4b6c0ce0ab3838ce130429=
c51e43bbb

  [1]
  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
?id=3D152194fe9c3f

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1904464/+subscriptions

