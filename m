Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C935288754
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Oct 2020 12:52:18 +0200 (CEST)
Received: from localhost ([::1]:48898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kQq0X-0006dx-6D
	for lists+qemu-devel@lfdr.de; Fri, 09 Oct 2020 06:52:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kQpzQ-0006Cb-QX
 for qemu-devel@nongnu.org; Fri, 09 Oct 2020 06:51:08 -0400
Received: from indium.canonical.com ([91.189.90.7]:38470)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kQpzN-0005wK-BB
 for qemu-devel@nongnu.org; Fri, 09 Oct 2020 06:51:08 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kQpzK-0003tI-0f
 for <qemu-devel@nongnu.org>; Fri, 09 Oct 2020 10:51:02 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 02FBB2E80E9
 for <qemu-devel@nongnu.org>; Fri,  9 Oct 2020 10:51:02 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2020 10:36:32 -0000
From: moenchmeyer <1637511@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: rm-anracon th-huth
X-Launchpad-Bug-Reporter: moenchmeyer (rm-anracon)
X-Launchpad-Bug-Modifier: moenchmeyer (rm-anracon)
References: <20161028134113.28825.36828.malonedeb@wampee.canonical.com>
Message-Id: <160223979234.30693.18032323681093381427.malone@gac.canonical.com>
Subject: [Bug 1637511] Re: Armitage crashes KVM guest with Kali2016.2 for QXL
 video
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="781851f4dc11c93bc506eb54e6a0d35c919a1ce6"; Instance="production"
X-Launchpad-Hash: b9df26e7350fbcae35b0c5a20fe91f14f15d1514
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/09 06:51:03
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
Reply-To: Bug 1637511 <1637511@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Can be closed - did not happen in later versions

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1637511

Title:
  Armitage crashes KVM guest with Kali2016.2 for QXL video

Status in QEMU:
  Incomplete

Bug description:
  I recently got a strange bug which seems to be related to qemu-kvm and
  QXL. I came here via the hints of the KVM web-site for KVM/qemu bug
  tracking. But, I am not sure whether this is the right bug-tracker at
  all. Please advise me if I placed the report wrongly.

  I installed Kali2016.2 as a KVM guest on a Opensuse Leap 42.1 host
  (fully updated). The KVM guest machine was configured to use a spice
  display and QXL video. Everything OK with the installation with the
  exception of one major application with a Java interface - Armitage.

  Armitage is correctly configured and starts (with some minor Java
  errors) and opens its interface (msf console, target window  etc.)
  Trying to open the 2 specific menu points "Hosts" or "Attack" in the
  menu bar leads to something very strange: The screen flickers, then
  the whole login session is stopped and a standard login window opens.
  This happens independently of the setting for the type of Armitage
  target window (graphical or table like)

  Why do I report this bug here? =

  Because it happens with the QXL graphical video interface ONLY - not with=
 video=3Dvga or vmvga ! Neither does the bug occur when Armitage is started=
 in a ssh (-X) session from the host. =


  So, it is closely related to qemu-kvm AND QXL and the Java interaction
  with both.

  I really wonder what in the world can make 2 specific menu points of a
  Java application crash a KVM guest and restart a login shell in Kali
  only when QXL is used?

  qemu-kvm version : 2.3.1
  Kernel version of OS LEAP 42.1: Linux 4.1.31-30-default           =


  I have described the bug also to the Kali people - see
  https://bugs.kali.org/view.php?id=3D3698

  Please inform me what further data are required - if this is relevant
  in this bug-tracker at all.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1637511/+subscriptions

