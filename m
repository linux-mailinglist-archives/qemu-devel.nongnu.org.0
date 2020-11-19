Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A082B9814
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 17:38:45 +0100 (CET)
Received: from localhost ([::1]:48544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfmxI-0006PB-Gf
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 11:38:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kfmuL-0004hz-DJ
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 11:35:42 -0500
Received: from indium.canonical.com ([91.189.90.7]:34598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kfmuH-0004j3-HK
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 11:35:41 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kfmuE-0006PJ-CZ
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 16:35:34 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 476F62E8041
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 16:35:34 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2020 16:16:43 -0000
From: Thomas Huth <1563612@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: linux-user
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: lau-7 th-huth
X-Launchpad-Bug-Reporter: Bla Blub (lau-7)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20160330003759.31129.50215.malonedeb@gac.canonical.com>
Message-Id: <160580260401.18125.3607988263865865948.malone@gac.canonical.com>
Subject: [Bug 1563612] Re: pulseaudio applications crash under
 linux-user-x86_64
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="c35ff22711d15549e2303ae18ae521fd91f6bf00"; Instance="production"
X-Launchpad-Hash: 0d091db2770d9b21255a026ef2d3ce0096f5d305
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/19 09:30:48
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
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
Reply-To: Bug 1563612 <1563612@bugs.launchpad.net>
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
https://bugs.launchpad.net/bugs/1563612

Title:
  pulseaudio applications crash under linux-user-x86_64

Status in QEMU:
  Incomplete

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

