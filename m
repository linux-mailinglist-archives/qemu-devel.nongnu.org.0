Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A4A2FAF70
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 05:33:37 +0100 (CET)
Received: from localhost ([::1]:34298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1ii0-00026M-PT
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 23:33:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l1ifk-0000Kk-Pt
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 23:31:16 -0500
Received: from indium.canonical.com ([91.189.90.7]:57164)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l1ifh-0004uv-2h
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 23:31:16 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1l1iff-0003xS-Gm
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 04:31:11 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 7DD002E8138
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 04:31:11 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 Jan 2021 04:17:23 -0000
From: Launchpad Bug Tracker <1563612@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: linux-user
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor lau-7 th-huth
X-Launchpad-Bug-Reporter: Bla Blub (lau-7)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <20160330003759.31129.50215.malonedeb@gac.canonical.com>
Message-Id: <161102984334.12094.14235851604651044643.malone@loganberry.canonical.com>
Subject: [Bug 1563612] Re: pulseaudio applications crash under
 linux-user-x86_64
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="44709f752aec466e4fba4ac588c69193e99da5ce"; Instance="production"
X-Launchpad-Hash: 4ebeb99197796f46010ec2966f0155c6330fd1a6
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
Reply-To: Bug 1563612 <1563612@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1563612

Title:
  pulseaudio applications crash under linux-user-x86_64

Status in QEMU:
  Expired

Bug description:
  Running a simple application that uses pulseaudio under qemu-i386 or
  qemu-x86_64 makes it crash (tested on Debian 8.0):

  # apt-get install build-essential qemu-user libpulse-dev pulseaudio
  $ cat > test.c << __EOF
  #include <pulse/simple.h>

  int main(void) {
  	pa_simple *s;
  	pa_sample_spec ss;
  	ss.format =3D PA_SAMPLE_S16NE;
  	ss.channels =3D 2;
  	ss.rate =3D 44100;
  	s =3D pa_simple_new(NULL,               // Use the default server.
  			  "Fooapp",           // Our application's name.
  			  PA_STREAM_PLAYBACK,
  			  NULL,               // Use the default device.
  			  "Music",            // Description of our stream.
  			  &ss,                // Our sample format.
  			  NULL,               // Use default channel map
  			  NULL,               // Use default buffering
  					      // attributes.
  			  NULL                // Ignore error code.
  			);

  	int16_t buf[2 * 1000];
          int i;
          memset(buf, 0, sizeof buf);
  	for (i =3D 0; i < 44; i++) {
  		pa_simple_write(s, buf, sizeof buf, NULL);
  	}

          pa_simple_free(s);

  	return 0;
  }
  __EOF
  $ gcc test.c -o test -lpulse -lpulse-simple
  $ ./test
  <no output, no error>
  $ qemu-x86_64 ./test
  qemu: uncaught target signal 11 (Segmentation fault) - core dumped
  Segmentation fault
  $

  =

  I think this is related to the futex system call. In an attempt to debug =
the problem, I compiled pulseaudio in debug mode and it hit an assertion fa=
ilure in pa_mutex_unlock.

  Thank you for developing QEMU.  :-)

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1563612/+subscriptions

