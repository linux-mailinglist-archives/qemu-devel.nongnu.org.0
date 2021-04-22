Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0721E367DD6
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 11:37:29 +0200 (CEST)
Received: from localhost ([::1]:46168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZVm4-0003X6-1B
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 05:37:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZVkM-0002Vn-Mk
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 05:35:44 -0400
Received: from indium.canonical.com ([91.189.90.7]:46416)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZVkI-0004i3-GQ
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 05:35:41 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lZVkG-00041x-TC
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 09:35:36 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id D484B2E815B
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 09:35:36 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Apr 2021 09:24:51 -0000
From: Thomas Huth <1191326@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: afaerber bonzini christian-bohr
 damian-p-jakubowski janitor kraxel-redhat l-jirkovsky raysenez th-huth
 widgetii
X-Launchpad-Bug-Reporter: JQu (damian-p-jakubowski)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20130615151015.21597.4187.malonedeb@chaenomeles.canonical.com>
Message-Id: <161908349121.7335.15377951317863015498.malone@chaenomeles.canonical.com>
Subject: [Bug 1191326] Re: QNX 4 doesn't boot on qemu >= 1.3 
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1552fceb1603b3da6cfa437575d9c9fc4b2e683a"; Instance="production"
X-Launchpad-Hash: d2aa31c77423abdb96b680b64022cdbf3ebc73dd
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
Reply-To: Bug 1191326 <1191326@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project is currently considering to move its bug tracking to
another system. For this we need to know which bugs are still valid
and which could be closed already. Thus we are setting older bugs to
"Incomplete" now.

If you still think this bug report here is valid, then please switch
the state back to "New" within the next 60 days, otherwise this report
will be marked as "Expired". Or please mark it as "Fix Released" if
the problem has been solved with a newer version of QEMU already.

Thank you and sorry for the inconvenience.


** Changed in: qemu
       Status: Confirmed =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1191326

Title:
  QNX 4 doesn't boot on qemu >=3D 1.3

Status in QEMU:
  Incomplete

Bug description:
  I am using virtual machine with QNX4 operating system installed on it.  I=
 updated my qemu from version
  to newer and QNX4 doesn't start any more. All is ok on version 1.2 but wh=
en I try to use any newer version
  (1.3, 1.4, 1.5)  QNX4 doesn't boot.  I tried on windows and linux ubuntu =
hosts - effects are the same.

  When virtual machine boots qnx bootloader loads and starts operating syst=
em. In the next step
  qnx starts its ide driver, which detects qemu harddisk and cdrom. Problem=
 starts when operating system
  tries mount partition - an error occur and qnx stop booting procedure:

  mount -p "No bios signature in partition sector on /dev/hd0"

  I have tried install qnx from cdrom but it seems that there is the same p=
roblem. QNX installer boot from
  cdrom, detects hard disk and cdrom, but cdrom can't be mounted in the nex=
t step of installation procedure.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1191326/+subscriptions

