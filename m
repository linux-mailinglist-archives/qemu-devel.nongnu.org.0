Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 161B3373EB5
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 17:39:38 +0200 (CEST)
Received: from localhost ([::1]:52854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leJcf-0001Pc-4h
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 11:39:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leJUS-0001ub-Dk
 for qemu-devel@nongnu.org; Wed, 05 May 2021 11:31:09 -0400
Received: from indium.canonical.com ([91.189.90.7]:46488)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leJUQ-0005Id-Ag
 for qemu-devel@nongnu.org; Wed, 05 May 2021 11:31:08 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1leJUL-0005oc-5Z
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 15:31:01 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id B50BB2E81B9
 for <qemu-devel@nongnu.org>; Wed,  5 May 2021 15:30:59 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 May 2021 15:24:26 -0000
From: Thomas Huth <1861458@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: audio
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: noah-bergbauer th-huth
X-Launchpad-Bug-Reporter: Noah Bergbauer (noah-bergbauer)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <158042156192.19296.13362308580628501069.malonedeb@gac.canonical.com>
Message-Id: <162022826680.6735.2567247015340604763.malone@wampee.canonical.com>
Subject: [Bug 1861458] Re: Clock drift issue with -soundhw hda
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d6ba96cccb3d3e356754af3137c6128a6c17e2a8"; Instance="production"
X-Launchpad-Hash: 0ae8f56b86599fe4e044bdad4190089bf2d8568a
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
Reply-To: Bug 1861458 <1861458@bugs.launchpad.net>
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

** Tags added: audio

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1861458

Title:
  Clock drift issue with -soundhw hda

Status in QEMU:
  Incomplete

Bug description:
  Here's the scenario: I'm working on code for loopback audio recording
  (i.e. recording what you're hearing) using WASAPI on Windows. As I
  usually develop on Linux, I'm using qemu to test this on a Windows 10
  VM. The heart of WASAPI audio recording is the
  IAudioCaptureClient::GetBuffer function (https://docs.microsoft.com
  /en-us/windows/win32/api/audioclient/nf-audioclient-
  iaudiocaptureclient-getbuffer). Among other things, this function
  produces a timestamp for when the audio buffer it returned is supposed
  to be played.

  When the audio device in question is the qemu hda device, this
  timestamp is wrong.

  There is a clock drift error (I measured it to be about 0.1%, i.e. 1ms
  drift every second =3D a full second after 16 minutes) that causes the
  audio clock to advance faster than the system clock. Paradoxically,
  this does not affect audio playback through qemu at all, no delay
  there. Only the timestamps returned to recording applications are
  completely bogus.

  Unfortunately I'm not intimately familiar with the inner workings of
  Intel HD Audio. All I can tell you is that this timestamp is
  supposedly obtained directly from the hardware (which would be qemu in
  this case), which is also why e.g. chromium implements a workaround
  for buggy hardware that returns incorrect timestamps.

  Here are the relevant parts of my command line (version 4.2.0):
  -enable-kvm -machine pc-q35-3.1,kernel-irqchip=3Don -cpu host,kvm=3Doff,h=
v_time,hv_relaxed,hv_vapic,hv_spinlocks=3D0x1fff,hv_vendor_id=3DNvidiaFuckU=
 -rtc base=3Dlocaltime -nodefaults -soundhw hda

  Just wanted to let you know about this because it took me three days
  of utter confusion and frustration to figure this out.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1861458/+subscriptions

