Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0730B2C2DBF
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 18:06:00 +0100 (CET)
Received: from localhost ([::1]:42688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khblO-0002zf-Hl
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 12:05:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1khbXN-0002If-QA
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 11:51:31 -0500
Received: from indium.canonical.com ([91.189.90.7]:39706)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1khbXD-0005kD-V5
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 11:51:29 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1khbXB-00018c-1x
 for <qemu-devel@nongnu.org>; Tue, 24 Nov 2020 16:51:17 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 0AC7C2E813F
 for <qemu-devel@nongnu.org>; Tue, 24 Nov 2020 16:51:17 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2020 16:44:17 -0000
From: Thomas Huth <1779447@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: arichardson th-huth
X-Launchpad-Bug-Reporter: Alexander Richardson (arichardson)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <153035288335.30029.15175462614252877889.malonedeb@wampee.canonical.com>
Message-Id: <160623625773.8620.1416607212773561006.malone@gac.canonical.com>
Subject: [Bug 1779447] Re: SLIRP SMB silently fails with MacOS smbd
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="3bd564e52ed9790394c5663a77af1e834fc2d372"; Instance="production"
X-Launchpad-Hash: 8853474e463e5f02f7af52557219cac061cf60a2
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
Reply-To: Bug 1779447 <1779447@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project is currently considering to move its bug tracking to anoth=
er system. For this we need to know which bugs are still valid and which co=
uld be closed already. Thus we are setting older bugs to "Incomplete" now.
If you still think this bug report here is valid, then please switch the st=
ate back to "New" within the next 60 days, otherwise this report will be ma=
rked as "Expired". Or mark it as "Fix Released" if the problem has been sol=
ved with a newer version of QEMU already. Thank you and sorry for the incon=
venience.

** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1779447

Title:
  SLIRP SMB silently fails with MacOS smbd

Status in QEMU:
  Incomplete

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

