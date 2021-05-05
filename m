Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 123293736BC
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 11:04:50 +0200 (CEST)
Received: from localhost ([::1]:56948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leDSb-0003S6-3w
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 05:04:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leDOw-0000mV-4K
 for qemu-devel@nongnu.org; Wed, 05 May 2021 05:01:02 -0400
Received: from indium.canonical.com ([91.189.90.7]:48614)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leDOu-0000Nv-6B
 for qemu-devel@nongnu.org; Wed, 05 May 2021 05:01:01 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1leDOs-0008Q0-Vk
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 09:00:58 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id EE7112E8187
 for <qemu-devel@nongnu.org>; Wed,  5 May 2021 09:00:58 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 May 2021 08:50:55 -0000
From: Thomas Huth <1779447@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: arichardson th-huth
X-Launchpad-Bug-Reporter: Alexander Richardson (arichardson)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <153035288335.30029.15175462614252877889.malonedeb@wampee.canonical.com>
Message-Id: <162020465550.32459.15198853415786719930.malone@chaenomeles.canonical.com>
Subject: [Bug 1779447] Re: SLIRP SMB silently fails with MacOS smbd
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d6ba96cccb3d3e356754af3137c6128a6c17e2a8"; Instance="production"
X-Launchpad-Hash: fe70a30d1c7b364ec2284c41681dc784033e93d3
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
Reply-To: Bug 1779447 <1779447@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'expired' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/153


** Changed in: qemu
       Status: New =3D> Expired

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #153
   https://gitlab.com/qemu-project/qemu/-/issues/153

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1779447

Title:
  SLIRP SMB silently fails with MacOS smbd

Status in QEMU:
  Expired

Bug description:
  When using the -net user,id=3Dnet0,ipv6=3Doff,smb=3D/path/to/share/option=
,hostfwd=3Dtcp::19500-:22 I can successfully mount_smbfs the shared directo=
ry on the guest when QEMU is running on a Linux or FreeBSD host. However, o=
n a MacOS host the mount_smbfs command just fails with
  `mount_smbfs: unable to open connection: syserr =3D Connection reset by p=
eer`.
  After some debugging it turns out this is because the smbd shipped by mac=
os is incompatible and doesn't use the same config file/command line argume=
nts.

  I have since got it working by compiling the sources form samba.org
  and using the --smbd=3D configure option pointing to that binary.

  Would it be possible to print a warning message or even better abort
  the launch saying smbd is incompatible with QEMU if the -smb=3D flag is
  passed? It appears that smbd should die with an error code on invalid
  arguments so QEMU should be able to report that.

  =

  This was happening with QEMU built from git sources at c1c2a435905ae76b15=
9c573b0c0d6f095b45ebc6.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1779447/+subscriptions

