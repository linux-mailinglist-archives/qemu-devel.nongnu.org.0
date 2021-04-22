Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A16DC367B85
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 09:54:51 +0200 (CEST)
Received: from localhost ([::1]:60442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZUAk-0004F8-O7
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 03:54:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZU7G-0008NB-P7
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 03:51:15 -0400
Received: from indium.canonical.com ([91.189.90.7]:43990)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZU79-0000D3-Er
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 03:51:14 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lZU78-0000cd-2E
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 07:51:06 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 097772E8157
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 07:51:06 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Apr 2021 07:42:49 -0000
From: Thomas Huth <1847861@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: black-silver th-huth
X-Launchpad-Bug-Reporter: Emanuele Faranda (black-silver)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <157089035721.2099.14904442368526379360.malonedeb@wampee.canonical.com>
Message-Id: <161907736947.9362.14632169673101689992.malone@wampee.canonical.com>
Subject: [Bug 1847861] Re: Guest stuttering under high disk IO (virtio)
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1552fceb1603b3da6cfa437575d9c9fc4b2e683a"; Instance="production"
X-Launchpad-Hash: f5b03ab6e378070bab3070107f611673ee85bbc0
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
Reply-To: Bug 1847861 <1847861@bugs.launchpad.net>
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
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1847861

Title:
  Guest stuttering under high disk IO (virtio)

Status in QEMU:
  Incomplete

Bug description:
  Performing io intensive tasks on virtualized Windows causes the system
  to visually stutter. I can often reproduce the problem by running fio
  on windows:

  fio --randrepeat=3D1 --ioengine=3Dwindowsaio --direct=3D1 --gtod_reduce=
=3D1
  --name=3Dtest --filename=3D\\.\PhysicalDrive0 --bs=3D4k --iodepth=3D128
  --size=3D4G --readwrite=3Drandread

  While the fio command is running, moving the mouse pointer will be be
  laggy. The stuttering does not appear with iodepth <=3D 32 . The
  stuttering also manifests while playing games, the music and video
  pauses for a fraction of second in a playable but disturbing way.

  Here are my system specs:

  Host OS: archlinux
  Guest OS: Windows 10 Enterprise
  qemu version: qemu-git 8:v4.1.0.r1378.g98b2e3c9ab-1 (from AUR, compiled w=
ith -march=3Dnative)
  CPU: AMD Ryzen Threadripper 1900X 8-Core Processor
  Huge Pages: vm.nr_hugepages=3D4128
  Disk: nvme type=3Draw, io=3Dthreads bus=3Dvirtio
  GPU (passthrough): Radeon RX 570

  Here are some fio test results on my windows guest:

  [size=3D512M,iodepth=3D1 -> min=3D30k,avg=3D31k,stddev=3D508]
  [size=3D2G,iodepth=3D8 -> min=3D203k,avg=3D207k,stddev=3D2.3k]
  [size=3D2G,iodepth=3D16 -> min=3D320k,avg=3D330k,stddev=3D4.3k]
  [size=3D4G,iodepth=3D32 -> min=3D300k,avg=3D310k,stddev=3D4.8k]
  [size=3D4G,iodepth=3D64 -> min=3D278k,avg=3D366k,stddev=3D68.6k] -> STUTT=
ER
  [size=3D4G,iodepth=3D64 -> min=3D358k,avg=3D428k,stddev=3D52.6k] -> STUTT=
ER
  [size=3D4G,iodepth=3D128 -> min=3D92k,avg=3D217k,stddev=3D185k] -> STUTTER
  [size=3D4G,iodepth=3D128 -> min=3D241k,avg=3D257k,stddev=3D14k] -> same c=
onfig as above, but no stuttering

  The min and avg values are the bandwidth values reported in KB/s by
  fio. You can see that, when the stuttering occurs, the stardard
  deviation is high and the minimum bandwidth is way below the average.

  Additional note: the bandwidth reported with `fio` on my linux host is
  about 2x the one reported in the guest:

  sudo fio --randrepeat=3D1 --ioengine=3Dlibaio --direct=3D1 --gtod_reduce=
=3D1
  --name=3Dtest --filename=3D/dev/nvme0n1 --bs=3D4k --iodepth=3D64 --size=
=3D512M
  --readwrite=3Drandread

  read: IOPS=3D279k, BW=3D1092MiB/s (1145MB/s)(512MiB/469msec)

  Moreover, during the fio tests on the guest I've noticed that the CPU
  usage on the host is very high (around 450%) whereas on the guest is
  only 10%

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1847861/+subscriptions

