Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 661F43870BA
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 06:42:21 +0200 (CEST)
Received: from localhost ([::1]:46382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lirYi-0006Wf-HY
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 00:42:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lirXI-00059k-9g
 for qemu-devel@nongnu.org; Tue, 18 May 2021 00:40:52 -0400
Received: from indium.canonical.com ([91.189.90.7]:54114)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lirXF-0003PV-Cj
 for qemu-devel@nongnu.org; Tue, 18 May 2021 00:40:52 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lirXD-0004Bh-DA
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 04:40:47 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 5A3702E8136
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 04:40:47 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 18 May 2021 04:32:44 -0000
From: Thomas Huth <1925496@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=its@irrelevant.dk; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: birkelund obektas th-huth
X-Launchpad-Bug-Reporter: Oguz Bektas (obektas)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <161909487037.10022.905940620153099238.malonedeb@wampee.canonical.com>
Message-Id: <162131236475.1070.950508635853555634.malone@wampee.canonical.com>
Subject: [Bug 1925496] Re: nvme disk cannot be hotplugged after removal
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="5321c3f40fa4d4b847f4e47fb766e7b95ed5036c"; Instance="production"
X-Launchpad-Hash: fc9d2ad2323d72cd8f70f544b19485da9eca41f3
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
Reply-To: Bug 1925496 <1925496@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project is currently moving its bug tracking to another system.
For this we need to know how to transfer the bug to the new system if
(if still necessary). Thus we're setting the status to "Incomplete" now.

In the unlikely case that the bug has already been fixed in the latest
upstream version of QEMU, then please close this ticket as "Fix released".

If it is not fixed yet and you think that this bug report here should be
moved to the new system, then you have two options:

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


** Changed in: qemu
       Status: Confirmed =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1925496

Title:
  nvme disk cannot be hotplugged after removal

Status in QEMU:
  Incomplete

Bug description:
  Hello,

  When I try to re-add an nvme disk shortly after removing it, I get an
  error about duplicate ID.

  See the following commands to reproduce. This happens consistently on
  all VMs that I tested:

  =

  attach
  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

  $VAR1 =3D {
            'arguments' =3D> {
                             'command-line' =3D> 'drive_add auto "file=3D/d=
ev/zvol/rpool/data/vm-20000-disk-1,if=3Dnone,id=3Ddrive-nvme1,format=3Draw,=
cache=3Dnone,aio=3Dnative,detect-zeroes=3Don"'
                           },
            'execute' =3D> 'human-monitor-command'
          };
  $VAR1 =3D {
            'execute' =3D> 'device_add',
            'arguments' =3D> {
                             'serial' =3D> 'nvme1',
                             'drive' =3D> 'drive-nvme1',
                             'driver' =3D> 'nvme',
                             'id' =3D> 'nvme1'
                           }
          };

  =

  detach
  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
  $VAR1 =3D {
            'arguments' =3D> {
                             'id' =3D> 'nvme1'
                           },
            'execute' =3D> 'device_del'
          };
  $VAR1 =3D {
            'execute' =3D> 'human-monitor-command',
            'arguments' =3D> {
                             'command-line' =3D> 'drive_del drive-nvme1'
                           }
          };

  reattach
  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
  $VAR1 =3D {
            'arguments' =3D> {
                             'command-line' =3D> 'drive_add auto "file=3D/d=
ev/zvol/rpool/data/vm-20000-disk-1,if=3Dnone,id=3Ddrive-nvme1,format=3Draw,=
cache=3Dnone,aio=3Dnative,detect-zeroes=3Don"'
                           },
            'execute' =3D> 'human-monitor-command'
          };

  =

  and I get:
  "Duplicate ID 'drive-nvme1' for drive"

  although it does not show up in query-block or query-pci anymore after
  the first detach.

  =

  Is this a bug or am I missing something? Please advise.

  Best regards,
  Oguz

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1925496/+subscriptions

