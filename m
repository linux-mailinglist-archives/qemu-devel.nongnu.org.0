Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D1C2C01FE
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 10:06:52 +0100 (CET)
Received: from localhost ([::1]:49456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kh7oA-000490-Of
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 04:06:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kh7n6-0003Lk-79
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 04:05:44 -0500
Received: from indium.canonical.com ([91.189.90.7]:33808)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kh7n4-0002bW-BL
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 04:05:44 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kh7n2-0003nx-LB
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 09:05:40 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 9F0A72E8019
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 09:05:40 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2020 08:56:01 -0000
From: Thomas Huth <1801933@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Wishlist; assignee=None; 
X-Launchpad-Bug-Tags: defaults
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: berrange jpeyrard
X-Launchpad-Bug-Reporter: johann peyrard (jpeyrard)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <154151022459.20108.13605520748922076387.malonedeb@gac.canonical.com>
Message-Id: <160612176176.30652.13667072307574971843.launchpad@chaenomeles.canonical.com>
Subject: [Bug 1801933] Re: default memory parameter too small on x86_64 today
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="c35ff22711d15549e2303ae18ae521fd91f6bf00"; Instance="production"
X-Launchpad-Hash: 2e3f8037ccfc3eefc843c106ce16759a9027305f
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Reply-To: Bug 1801933 <1801933@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Changed in: qemu
   Importance: Undecided =3D> Wishlist

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1801933

Title:
  default memory parameter too small on x86_64 today

Status in QEMU:
  New

Bug description:
  Launching a centos74 iso VM today does not work anymore on x86_64
  without increasing the size of the memory parameter. For example with
  this command :

  $ /opt/qemu-3.0.0/bin/qemu-system-x86_64 --curses   -enable-kvm -drive
  file=3Dfile.dd,index=3D0,media=3Ddisk -drive file=3Dcentos-
  x86_64.iso,index=3D1,media=3Dcdrom

  [    3.047614] Failed to execute /init
  [    3.048315] Kernel panic - not syncing: No init found.  Try passing in=
it=3D option to kernel. See Linux Documentation/init.txt for guidance.
  [    3.049258] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 3.10.0-693.21.1.=
el7.x86

  Increasing the size from the default 128MiB to 512MiB let the VM works wi=
thout problem.
  So, ok, it's not a qemu problem, it's more a "User problem" and interface=
 problem for me.
  But it push me in the end to launch VirtualBox instead of qemu, because t=
he default parameter does not work anymore... And I had no time to investig=
ate why it does not work because the message is not visible.
  Debian iso with the same command line for example show a message to tell =
me that there is not enough memory, so it help me to track the real issue b=
ehind.

  But... In the end, I think today, the default memory parameter on x86_64 =
is too small and it can lead some people like me to switch to VirtualBox.
  VirtualBox, in the wizard is set by default to 4MiB Ram size, which tell =
you... Ok I need to put more. And, you know that 4MiB is not enough in the =
end.

  Regards,

  Johann

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1801933/+subscriptions

