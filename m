Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C481375988
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 19:39:26 +0200 (CEST)
Received: from localhost ([::1]:40336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lehy8-0005gj-16
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 13:39:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lehuh-0004OF-OT
 for qemu-devel@nongnu.org; Thu, 06 May 2021 13:35:51 -0400
Received: from indium.canonical.com ([91.189.90.7]:38994)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lehua-0005IK-Jy
 for qemu-devel@nongnu.org; Thu, 06 May 2021 13:35:50 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lehuU-0000MI-4m
 for <qemu-devel@nongnu.org>; Thu, 06 May 2021 17:35:38 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id E3DCA2E8187
 for <qemu-devel@nongnu.org>; Thu,  6 May 2021 17:35:37 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 May 2021 17:27:51 -0000
From: Thomas Huth <1882241@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: i82551
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: stefanha th-huth tim-tree-of-life
X-Launchpad-Bug-Reporter: timsoft (tim-tree-of-life)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <159136023930.32294.17616621945608188739.malonedeb@gac.canonical.com>
Message-Id: <162032207134.514.4870087188945060832.malone@chaenomeles.canonical.com>
Subject: [Bug 1882241] Re: file transfer over cifs to 64bit guest corrupts
 large files
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d6ba96cccb3d3e356754af3137c6128a6c17e2a8"; Instance="production"
X-Launchpad-Hash: 9ffc4df28caf49bafb39d309dc74b1f5d320a0a0
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
Reply-To: Bug 1882241 <1882241@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project is currently moving its bug tracking to another system.
For this we need to know which bugs are still valid and which could be
closed already. Thus we are setting older bugs to "Incomplete" now.

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
https://bugs.launchpad.net/bugs/1882241

Title:
  file transfer over cifs to 64bit guest corrupts large files

Status in QEMU:
  Incomplete

Bug description:
  qemu 4.0 compiled fom source.
  vm called by
  qemu-system-x86_64 -cpu qemu64 -smp 4 -m 4G -drive file=3D/data/images/sl=
ack14.2_64bit_test.qcow2,format=3Dqcow2 -cdrom /mnt/smb1/slackware/iso/slac=
kware64-14.2-install-dvd.iso -boot c -net nic,macaddr=3D02:00:00:11:11:17,m=
odel=3Di82551 -net bridge,br=3Dbr0 -enable-kvm -k en-gb -display vnc=3D:3 -=
monitor telnet:localhost:7103,server,nowait,nodelay

  copying large files eg 2.4gb or reading them on a cifs mount in the guest=
 causes corruption every time. For smaller files 40-60mb corruption is more=
 than 50% of the time. tested by md5sum on cifs server, or on host machine =
vs. on guest vm.
  corruption is seen only with 64bit guest using cifs with i82551 emulated =
network device
  ie. 32bit guest using cifs with i82551 emulated network device gives no c=
orruption.

  changing the emulated device to vmxnet3 removes the data corruption
  (see below)

  qemu-system-x86_64 -cpu qemu64 -smp 4 -m 4G -drive
  file=3D/data/images/slack14.2_64bit_test.qcow2,format=3Dqcow2 -cdrom
  /mnt/smb1/slackware/iso/slackware64-14.2-install-dvd.iso -boot c -net
  nic,macaddr=3D02:00:00:11:11:17,model=3Dvmxnet3 -net bridge,br=3Dbr0
  -enable-kvm -k en-gb -display vnc=3D:3 -monitor
  telnet:localhost:7103,server,nowait,nodelay

  this corruption is repeatable. ie. I created new vm, call using top examp=
le, installed 64bit linux, mounted cifs share and copied 2.4gb file to /tmp=
 then run md5sum "filecopied"
  the md5sum is different every time. copy same file to the host, or to a 3=
2bit guest with the same virtual network device and bridge and md5sums are =
correct. The host pysical network adapter is
  lspci|grep Ether
  1e:00.0 Ethernet controller: Realtek Semiconductor Co., Ltd. RTL8111/8168=
/8411 PCI Express Gigabit Ethernet Controller (rev 11)

  physically connected via gigabit ethernet to cifs server (via gigabit
  switch)

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1882241/+subscriptions

