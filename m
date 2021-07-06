Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C56A83BC5B4
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 06:47:56 +0200 (CEST)
Received: from localhost ([::1]:38152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0czz-0007xa-Q9
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 00:47:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m0cfn-0000oR-2B
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 00:27:03 -0400
Received: from indium.canonical.com ([91.189.90.7]:53112)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m0cfk-0003XZ-CR
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 00:27:02 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1m0cfX-0004xN-3l
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 04:26:47 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id B63B22E82A8
 for <qemu-devel@nongnu.org>; Tue,  6 Jul 2021 04:26:24 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 06 Jul 2021 04:17:22 -0000
From: Launchpad Bug Tracker <1865350@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: windows
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: f1outsourcing janitor th-huth
X-Launchpad-Bug-Reporter: f1outsourcing (f1outsourcing)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <158307617196.25994.14347393969000973600.malonedeb@gac.canonical.com>
Message-Id: <162554504278.7821.5423332406878060716.malone@loganberry.canonical.com>
Subject: [Bug 1865350] Re: fstrim not working with image mounted to path?
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fe01712f453e3d8fdd7cfee725621d71a8ae3628"; Instance="production"
X-Launchpad-Hash: 419a092f4bfef9e243545e6b38c826a8888ad043
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
Reply-To: Bug 1865350 <1865350@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1865350

Title:
  fstrim not working with image mounted to path?

Status in QEMU:
  Expired

Bug description:
  =

  guest os: windows server standard 2016
  qemu agent version 100.0.0

  os supports trimming
  path mounted image does not support trimming

  C:\Users\Administrator>fsutil behavior query disabledeletenotify
  NTFS DisableDeleteNotify =3D 0
  ReFS DisableDeleteNotify =3D 1

  =

  [@ ~]# virsh qemu-agent-command vps-xxx '{"execute":"guest-fstrim"}'
  {"return":{"paths":[{"path":"C:\\"},{"path":"C:\\Program Files\\Microsoft=
\\Exchange Server\\V15\\Mailbox\\xxxx\\","error":"The given volume path is =
invalid. (0x89000001)"}]}}

  =

  Looks like the fstrim does not like/check images mounted on a path? Nor d=
etects if image trimming is supported. xxxx is a ReFS mounted image without=
 trimming support. =


  If I enable trimming on the ReFS image, and configure it win2016, the
  result is still the same.

  =

  C:\Users\Administrator>fsutil behavior query disabledeletenotify
  NTFS DisableDeleteNotify =3D 0
  ReFS DisableDeleteNotify =3D 0

  [root@c03 ~]# virsh qemu-agent-command vps-xxx '{"execute":"guest-fstrim"=
}'
  {"return":{"paths":[{"path":"C:\\"},{"path":"C:\\Program Files\\Microsoft=
\\Exchange Server\\V15\\Mailbox\\xxxx\\","error":"The given volume path is =
invalid. (0x89000001)"}]}}

  PS. tried this on a win 2016 std server with just one fs, no problems
  then.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1865350/+subscriptions

