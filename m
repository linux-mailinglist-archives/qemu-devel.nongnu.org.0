Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB8E83ADB8C
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 21:51:51 +0200 (CEST)
Received: from localhost ([::1]:37834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luh0R-0003Wa-09
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 15:51:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lugzL-0002s2-AS
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 15:50:43 -0400
Received: from indium.canonical.com ([91.189.90.7]:52876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lugzI-0004V6-Mj
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 15:50:43 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lugzE-00013F-6V
 for <qemu-devel@nongnu.org>; Sat, 19 Jun 2021 19:50:36 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 0DFFA2E8086
 for <qemu-devel@nongnu.org>; Sat, 19 Jun 2021 19:50:36 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 19 Jun 2021 19:45:21 -0000
From: Alexander Bulekov <1910603@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Committed; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: audio fuzzer
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: a1xndr philmd th-huth
X-Launchpad-Bug-Reporter: Alexander Bulekov (a1xndr)
X-Launchpad-Bug-Modifier: Alexander Bulekov (a1xndr)
References: <161005830186.3494.9820259593524409716.malonedeb@wampee.canonical.com>
Message-Id: <162413192120.17154.5906905660581442967.malone@gac.canonical.com>
Subject: [Bug 1910603] Re: [OSS-Fuzz] Issue 29174 sb16: Abrt in audio_bug
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="ed184eb8c3e03c8a0c3f47e69a5c546619a1af7c"; Instance="production"
X-Launchpad-Hash: 51e4489c7e87911500c68fbee68036149aaece26
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
Reply-To: Bug 1910603 <1910603@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

OSS-Fuzz confirms this is fixed: https://bugs.chromium.org/p/oss-
fuzz/issues/detail?id=3D30574#c4

** Changed in: qemu
       Status: Confirmed =3D> Fix Committed

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1910603

Title:
  [OSS-Fuzz] Issue 29174 sb16: Abrt in audio_bug

Status in QEMU:
  Fix Committed

Bug description:
  =3D=3D=3D Reproducer =3D=3D=3D
  cat << EOF | ../build-system/qemu-system-i386 \
  -machine q35 -device sb16,audiodev=3Dsnd0 \
  -audiodev none,id=3Dsnd0 -nographic -nodefaults \
  -qtest stdio
  outw 0x22c 0x41
  outb 0x22c 0x0
  outw 0x22c 0x1004
  outw 0x22c 0x1c
  EOF

  =3D=3D=3D Stack Trace =3D=3D=3D
  A bug was just triggered in audio_calloc
  Save all your work and restart without audio
  I am sorry
  Context:
  Aborted

  #0 raise
  #1 abort
  #2 audio_bug /src/qemu/audio/audio.c:119:9
  #3 audio_calloc /src/qemu/audio/audio.c:154:9
  #4 audio_pcm_sw_alloc_resources_out /src/qemu/audio/audio_template.h:116:=
15
  #5 audio_pcm_sw_init_out /src/qemu/audio/audio_template.h:175:11
  #6 audio_pcm_create_voice_pair_out /src/qemu/audio/audio_template.h:410:9
  #7 AUD_open_out /src/qemu/audio/audio_template.h:503:14
  #8 continue_dma8 /src/qemu/hw/audio/sb16.c:216:20
  #9 dma_cmd8 /src/qemu/hw/audio/sb16.c:276:5
  #10 command /src/qemu/hw/audio/sb16.c:0
  #11 dsp_write /src/qemu/hw/audio/sb16.c:949:13
  #12 portio_write /src/qemu/softmmu/ioport.c:205:13
  #13 memory_region_write_accessor /src/qemu/softmmu/memory.c:491:5
  #14 access_with_adjusted_size /src/qemu/softmmu/memory.c:552:18
  #15 memory_region_dispatch_write /src/qemu/softmmu/memory.c:0:13
  #16 flatview_write_continue /src/qemu/softmmu/physmem.c:2759:23
  #17 flatview_write /src/qemu/softmmu/physmem.c:2799:14
  #18 address_space_write /src/qemu/softmmu/physmem.c:2891:18
  #19 cpu_outw /src/qemu/softmmu/ioport.c:70:5

  =

  OSS-Fuzz Report:
  https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=3D29174

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1910603/+subscriptions

