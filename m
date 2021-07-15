Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 564BA3C9774
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Jul 2021 06:29:55 +0200 (CEST)
Received: from localhost ([::1]:50096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3t0U-0004yl-An
	for lists+qemu-devel@lfdr.de; Thu, 15 Jul 2021 00:29:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m3swW-0004tX-5v
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 00:25:48 -0400
Received: from indium.canonical.com ([91.189.90.7]:37786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m3swS-0000GV-2T
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 00:25:47 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1m3swQ-0007WC-DK
 for <qemu-devel@nongnu.org>; Thu, 15 Jul 2021 04:25:42 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 63CC42E8136
 for <qemu-devel@nongnu.org>; Thu, 15 Jul 2021 04:25:42 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Jul 2021 04:17:21 -0000
From: Launchpad Bug Tracker <1926596@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: gaenshgosavi janitor th-huth
X-Launchpad-Bug-Reporter: Ganesh Gosavi (gaenshgosavi)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <161969321576.9662.8100892144951224535.malonedeb@gac.canonical.com>
Message-Id: <162632264126.31721.13899177994148509942.malone@loganberry.canonical.com>
Subject: [Bug 1926596] Re: qemu-monitor-event command gets stuck randomly
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="4fbbc20799edd34b40f59a0c81c360f947903b2a"; Instance="production"
X-Launchpad-Hash: af122221018d20337ed89093889310e513ab58c6
Received-SPF: pass client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Bug 1926596 <1926596@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

--=20
You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1926596

Title:
  qemu-monitor-event command gets stuck randomly

Status in QEMU:
  Expired

Bug description:
  We are using kvm virtualization on our servers, We use "qemu-monitor-comm=
and"(drive-backup) to take qcow2 backups and to monitor them we use "qemu-m=
onitor-event" command=20
  For eg:-
  /usr/bin/virsh qemu-monitor-event VPSNAME --event "BLOCK_JOB_COMPLETED\|B=
LOCK_JOB_ERROR" --regex

  the above command stucks randomly (backup completes but still it is
  waiting) and because of which other vms backup are stucked until we
  kill that process.

  Can you suggest how can we debug this further to find the actual
  issue.

 =20
  /usr/bin/virsh version

  Compiled against library: libvirt 4.5.0
  Using library: libvirt 4.5.0
  Using API: QEMU 4.5.0
  Running hypervisor: QEMU 2.0.0

  cat /etc/os-release
  NAME=3D"CentOS Linux"
  VERSION=3D"7 (Core)"
  ID=3D"centos"
  ID_LIKE=3D"rhel fedora"
  VERSION_ID=3D"7"
  PRETTY_NAME=3D"CentOS Linux 7 (Core)"
  ANSI_COLOR=3D"0;31"
  CPE_NAME=3D"cpe:/o:centos:centos:7"
  HOME_URL=3D"https://www.centos.org/"
  BUG_REPORT_URL=3D"https://bugs.centos.org/"

  CENTOS_MANTISBT_PROJECT=3D"CentOS-7"
  CENTOS_MANTISBT_PROJECT_VERSION=3D"7"
  REDHAT_SUPPORT_PRODUCT=3D"centos"
  REDHAT_SUPPORT_PRODUCT_VERSION=3D"7"

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1926596/+subscriptions


