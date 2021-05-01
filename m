Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F9B370765
	for <lists+qemu-devel@lfdr.de>; Sat,  1 May 2021 15:22:12 +0200 (CEST)
Received: from localhost ([::1]:39832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcpZT-0000bg-1l
	for lists+qemu-devel@lfdr.de; Sat, 01 May 2021 09:22:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lcpY5-000885-9A
 for qemu-devel@nongnu.org; Sat, 01 May 2021 09:20:45 -0400
Received: from indium.canonical.com ([91.189.90.7]:42328)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lcpXy-0000Hb-Pt
 for qemu-devel@nongnu.org; Sat, 01 May 2021 09:20:44 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lcpXw-0004Wv-8d
 for <qemu-devel@nongnu.org>; Sat, 01 May 2021 13:20:36 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 3624E2E815B
 for <qemu-devel@nongnu.org>; Sat,  1 May 2021 13:20:36 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 01 May 2021 13:13:59 -0000
From: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <1861677@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: audio
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: philmd th-huth
X-Launchpad-Bug-Reporter: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9_=28philmd?=
 =?utf-8?q?=29?=
X-Launchpad-Bug-Modifier: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9_=28philmd?=
 =?utf-8?q?=29?=
References: <158073341807.19403.15811772889635903332.malonedeb@gac.canonical.com>
Message-Id: <161987484000.9618.16126357867827043363.malone@gac.canonical.com>
Subject: [Bug 1861677] Re: wavcapture crash with pulseaudio
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="02afa4875ac52c169f5cddf0d1bcdd6e149a3754"; Instance="production"
X-Launchpad-Hash: f52636024c6857fab9ba49497eb0c4c350f7c8b9
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
Reply-To: Bug 1861677 <1861677@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fixed in v5.1.0, commit cbaf25d1f59 ("audio: fix wavcapture segfault").

** Changed in: qemu
       Status: New =3D> Fix Released

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1861677

Title:
  wavcapture crash with pulseaudio

Status in QEMU:
  Fix Released

Bug description:
  As of commit 28db64fce55,
  using demo from QEMU advent calendar 2018 day 1:
  https://www.qemu-advent-calendar.org/2018/download/day01.tar.xz

  $ qemu-system-x86_64 -M pc \
    -net none -soundhw pcspk \
    -drive file=3Dday01/fbird.img,format=3Draw,if=3Dfloppy \
    -monitor stdio -S
  (qemu) info qtree =

  bus: main-system-bus
    type System
    dev: i440FX-pcihost, id ""
      bus: pci.0
        dev: PIIX3, id ""
          bus: isa.0
            dev: isa-pcspk, id ""
              audiodev =3D "pa"
              iobase =3D 97 (0x61)
              migrate =3D true
  (qemu) wavcapture out.wav pa
  (qemu) cont
  (qemu) # Press 'up' key in demo
  Segmentation fault (core dumped)

  (gdb) bt
  #0  0x0000555bfef0dc51 in audio_pcm_sw_write (sw=3D0x555c01333930, buf=3D=
0x0, size=3D14728) at audio/audio.c:725
  #1  0x0000555bfef10a49 in audio_capture_mix_and_clear (hw=3D0x555c012379b=
0, rpos=3D0, samples=3D3682) at audio/audio.c:1054
  #2  0x0000555bfef11059 in audio_run_out (s=3D0x555c01235550) at audio/aud=
io.c:1186
  #3  0x0000555bfef11894 in audio_run (s=3D0x555c01235550, msg=3D0x555bff3e=
37e8 "timer") at audio/audio.c:1355
  #4  0x0000555bfef10334 in audio_timer (opaque=3D0x555c01235550) at audio/=
audio.c:831
  #5  0x0000555bff33f041 in timerlist_run_timers (timer_list=3D0x555c00377b=
50) at util/qemu-timer.c:588
  #6  0x0000555bff33f0eb in qemu_clock_run_timers (type=3DQEMU_CLOCK_VIRTUA=
L) at util/qemu-timer.c:602
  #7  0x0000555bff33f3b6 in qemu_clock_run_all_timers () at util/qemu-timer=
.c:688
  #8  0x0000555bff33fb60 in main_loop_wait (nonblocking=3D0) at util/main-l=
oop.c:525
  #9  0x0000555bfef0187c in main_loop () at vl.c:1683
  #10 0x0000555bfef090ab in main (argc=3D12, argv=3D0x7ffec49184c8, envp=3D=
0x7ffec4918530) at vl.c:4438
  (gdb) p *sw
  $1 =3D {card =3D 0x0, s =3D 0x0, info =3D {bits =3D 16, sign =3D 1, freq =
=3D 44100, nchannels =3D 2, bytes_per_frame =3D 4, bytes_per_second =3D 176=
400, swap_endianness =3D 0}, conv =3D 0x555bfef0ced1 <noop_conv>, ratio =3D=
 4294967296, buf =3D 0x555c0123f6f0, =

    rate =3D 0x555c007c0ec0, total_hw_samples_mixed =3D 0, active =3D 1, em=
pty =3D 1, hw =3D 0x555c014b12a0, name =3D 0x0, vol =3D {mute =3D 0, r =3D =
4294967296, l =3D 4294967296}, callback =3D {opaque =3D 0x0, fn =3D 0x0}, e=
ntries =3D {le_next =3D 0x0, =

      le_prev =3D 0x555c014b1310}}
  (gdb) p *sw->hw
  $2 =3D {s =3D 0x555c01235550, enabled =3D 1, poll_mode =3D 0, pending_dis=
able =3D 0, info =3D {bits =3D 16, sign =3D 1, freq =3D 44100, nchannels =
=3D 2, bytes_per_frame =3D 4, bytes_per_second =3D 176400, swap_endianness =
=3D 0}, =

    clip =3D 0x555bfef16376 <clip_natural_int16_t_from_stereo>, ts_helper =
=3D 0, mix_buf =3D 0x555c0059d680, buf_emul =3D 0x0, pos_emul =3D 0, pendin=
g_emul =3D 0, size_emul =3D 0, samples =3D 16384, sw_head =3D {lh_first =3D=
 0x555c01333930}, cap_head =3D {
      lh_first =3D 0x0}, pcm_ops =3D 0x0, entries =3D {le_next =3D 0x0, le_=
prev =3D 0x0}}

  sw->hw->pcm_ops is NULL.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1861677/+subscriptions

