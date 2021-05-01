Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE992370668
	for <lists+qemu-devel@lfdr.de>; Sat,  1 May 2021 10:21:32 +0200 (CEST)
Received: from localhost ([::1]:35904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcksV-0003LG-E5
	for lists+qemu-devel@lfdr.de; Sat, 01 May 2021 04:21:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lckqk-0002UM-0N
 for qemu-devel@nongnu.org; Sat, 01 May 2021 04:19:42 -0400
Received: from indium.canonical.com ([91.189.90.7]:43398)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lckqi-0003sg-12
 for qemu-devel@nongnu.org; Sat, 01 May 2021 04:19:41 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lckqf-0003ja-1v
 for <qemu-devel@nongnu.org>; Sat, 01 May 2021 08:19:37 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 068582E8144
 for <qemu-devel@nongnu.org>; Sat,  1 May 2021 08:19:37 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 01 May 2021 08:06:53 -0000
From: Thomas Huth <1603779@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: ac97
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: hendersa th-huth
X-Launchpad-Bug-Reporter: Andrew Henderson (hendersa)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20160717145139.15895.32533.malonedeb@gac.canonical.com>
Message-Id: <161985641348.13533.15758050242222036966.malone@wampee.canonical.com>
Subject: [Bug 1603779] Re: AC97 can allocate ~500MB of host RAM
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="02afa4875ac52c169f5cddf0d1bcdd6e149a3754"; Instance="production"
X-Launchpad-Hash: 67ad809890edf2ae78e5b5462b80984dbcfc7d27
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
Reply-To: Bug 1603779 <1603779@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved
to QEMU's new bug tracker on gitlab.com and thus gets marked
as 'expired' now. Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/71


** Changed in: qemu
       Status: New =3D> Expired

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #71
   https://gitlab.com/qemu-project/qemu/-/issues/71

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1603779

Title:
  AC97 can allocate ~500MB of host RAM

Status in QEMU:
  Expired

Bug description:
  While working with qtest test cases generated via fuzzing with QEMU
  2.5.0, I discovered some odd behavior for the AC97 virtual device with
  qemu-system-i386. If AC97_MIC_ADC_RATE is set to the value of 1, the
  QEMU process allocates over 500MB of additional host RAM. You probably
  would not normally notice this on a modern PC, except that I was using
  a "ulimit" command to restrict the maximum amount of virtual memory
  allowed for the QEMU process, so the process would crash with a
  SIGTRAP (signal 5) on the failed memory allocation.

  My minimized qtest code to reproduce the issue is:

  static void test_crash(void)
  {
    uint64_t barsize;
    dev =3D get_device();

    dev_base[0] =3D qpci_iomap(dev, 0, &barsize);
    dev_base[1] =3D qpci_iomap(dev, 1, &barsize);
    qpci_device_enable(dev);
    qpci_io_writew(dev, dev_base[0]+0x32, 0x00000001);
  } =


  I ran a "ulimit -sv 650000" command and then launched the
  tests/ac97-test binary with this crash test case included in it. I can
  then see the QEMU process crash on an allocation of 722538464 bytes. I
  can gradually increase the ulimit memory limit to ~1200000 and then no
  longer see the issue, hence my estimate of 500 MB of RAM allocated by
  the device.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1603779/+subscriptions

