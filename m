Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE87375F8B
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 06:46:50 +0200 (CEST)
Received: from localhost ([::1]:44272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lesO0-0003vb-Qw
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 00:46:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lesMx-000334-LX
 for qemu-devel@nongnu.org; Fri, 07 May 2021 00:45:43 -0400
Received: from indium.canonical.com ([91.189.90.7]:37068)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lesMv-0001VX-Dr
 for qemu-devel@nongnu.org; Fri, 07 May 2021 00:45:43 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lesMt-0003sA-NV
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 04:45:39 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id AFC782E802E
 for <qemu-devel@nongnu.org>; Fri,  7 May 2021 04:45:39 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 May 2021 04:39:27 -0000
From: Thomas Huth <1888467@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: arrowfeng th-huth xanclic
X-Launchpad-Bug-Reporter: dunfeng zhang (arrowfeng)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <159540494097.10238.3390638369680947345.malonedeb@gac.canonical.com>
Message-Id: <162036236804.3318.14689436829612098530.malone@gac.canonical.com>
Subject: [Bug 1888467] Re: qemu-img http convert bug
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d6ba96cccb3d3e356754af3137c6128a6c17e2a8"; Instance="production"
X-Launchpad-Hash: 77fcfaa64af50efb53e81d9252ef7d531183f3f7
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1888467 <1888467@bugs.launchpad.net>
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
the state back to "New" within the next 60 days (otherwise it will get
closed as "Expired"). We will then eventually migrate the ticket auto-
matically to the new system (but you won't be the reporter of the bug
in the new system and thus won't get notified on changes anymore).

Thank you and sorry for the inconvenience.


** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1888467

Title:
  qemu-img http convert bug

Status in QEMU:
  Incomplete

Bug description:
  Hello, Why the file sizes of http conversion and local conversion are
  inconsistent?

  Use the http method of qemu-img for conversion. The size of some formats =
after conversion is different from the local method of qemu-img. Such as vh=
d, vdi. qcow2 and vmdk are normal=E3=80=82
  My image size is 40 G, raw format.

  The source is the same file, but the access method is different
  http method of qemu-img=EF=BC=9A qemu-img convert -f raw -O vdi http://xx=
x xxx.vdi=EF=BC=8819G=EF=BC=8Cafter conversion=EF=BC=89
  local method of qemu-img=EF=BC=9A qemu-img convert -f raw -O vdi xxx.raw =
xxx.vdi=EF=BC=883G=EF=BC=8Cafter conversion=EF=BC=89

  thank you

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1888467/+subscriptions

