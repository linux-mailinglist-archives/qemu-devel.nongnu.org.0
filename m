Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 900AF38184A
	for <lists+qemu-devel@lfdr.de>; Sat, 15 May 2021 13:25:46 +0200 (CEST)
Received: from localhost ([::1]:46424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhsQT-0007iu-M1
	for lists+qemu-devel@lfdr.de; Sat, 15 May 2021 07:25:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lhsLf-0002L7-6h
 for qemu-devel@nongnu.org; Sat, 15 May 2021 07:20:47 -0400
Received: from indium.canonical.com ([91.189.90.7]:56450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lhsLb-0004O7-Ml
 for qemu-devel@nongnu.org; Sat, 15 May 2021 07:20:46 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lhsLZ-0001F4-Cc
 for <qemu-devel@nongnu.org>; Sat, 15 May 2021 11:20:41 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 5E2032E813A
 for <qemu-devel@nongnu.org>; Sat, 15 May 2021 11:20:41 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 15 May 2021 11:12:16 -0000
From: Thomas Huth <1926596@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: gaenshgosavi th-huth
X-Launchpad-Bug-Reporter: Ganesh Gosavi (gaenshgosavi)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <161969321576.9662.8100892144951224535.malonedeb@gac.canonical.com>
Message-Id: <162107713696.8164.16442187568902927395.malone@gac.canonical.com>
Subject: [Bug 1926596] Re: qemu-monitor-event command gets stuck randomly
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="5321c3f40fa4d4b847f4e47fb766e7b95ed5036c"; Instance="production"
X-Launchpad-Hash: 8a98b312ef4d1ceab1d41b4273b1e986498b15ac
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
Reply-To: Bug 1926596 <1926596@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project is currently moving its bug tracking to another system.
For this we need to know which bugs are still valid and which could be
closed already. Thus we are setting the bug state to "Incomplete" now.

If the bug has already been fixed in the latest upstream version of QEMU,
then please close this ticket as "Fix released".

If it is not fixed yet and you think that this bug report here is still
valid, then you have two options:

1) If you already have an account on gitlab.com, please open a new ticket
for this problem in our new tracker here:

    https://gitlab.com/qemu-project/qemu/-/issues

and then close this ticket here on Launchpad (or let it expire auto-
matically after 60 days). Please mention the URL of this bug ticket on
Launchpad in the new ticket on GitLab.

2) If you don't have an account on gitlab.com and don't intend to get
one, but still would like to keep this ticket opened, then please switch
the state back to "New" or "Confirmed" within the next 60 days (other-
wise it will get closed as "Expired"). We will then eventually migrate
the ticket automatically to the new system (but you won't be the reporter
of the bug in the new system and thus you won't get notified on changes
anymore).

Thank you and sorry for the inconvenience.


** Summary changed:

- qemu-monitor-event command stukcs randomly
+ qemu-monitor-event command gets stuck randomly

** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1926596

Title:
  qemu-monitor-event command gets stuck randomly

Status in QEMU:
  Incomplete

Bug description:
  We are using kvm virtualization on our servers, We use "qemu-monitor-comm=
and"(drive-backup) to take qcow2 backups and to monitor them we use "qemu-m=
onitor-event" command =

  For eg:-
  /usr/bin/virsh qemu-monitor-event VPSNAME --event "BLOCK_JOB_COMPLETED\|B=
LOCK_JOB_ERROR" --regex

  the above command stucks randomly (backup completes but still it is
  waiting) and because of which other vms backup are stucked until we
  kill that process.

  Can you suggest how can we debug this further to find the actual
  issue.

  =

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

