Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEFEB2C5F37
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 05:26:36 +0100 (CET)
Received: from localhost ([::1]:40430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiVL9-0008WS-8R
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 23:26:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kiVKO-00085s-9C
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 23:25:48 -0500
Received: from indium.canonical.com ([91.189.90.7]:45750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kiVKM-0003iQ-7b
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 23:25:48 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kiVKK-0008Sj-77
 for <qemu-devel@nongnu.org>; Fri, 27 Nov 2020 04:25:44 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 3458A2E8086
 for <qemu-devel@nongnu.org>; Fri, 27 Nov 2020 04:25:44 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Nov 2020 04:17:21 -0000
From: Launchpad Bug Tracker <1896317@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: i386
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor peterx philmd
X-Launchpad-Bug-Reporter: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9_=28philmd?=
 =?utf-8?q?=29?=
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <160050668992.17815.17282420990273568963.malonedeb@soybean.canonical.com>
Message-Id: <160645064182.26234.14070852995947200776.malone@loganberry.canonical.com>
Subject: [Bug 1896317] Re: ioapic: UndefinedBehaviorSanitizer starting
 qemu-system-i386
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="3bd564e52ed9790394c5663a77af1e834fc2d372"; Instance="production"
X-Launchpad-Hash: 3c8f06ac79669ea3cb6c57d891de52a6e6efae10
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
Reply-To: Bug 1896317 <1896317@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1896317

Title:
  ioapic: UndefinedBehaviorSanitizer starting qemu-system-i386

Status in QEMU:
  Expired

Bug description:
  As of commit 053a4177817:

  $ ./configure --enable-sanitizers --disable-kvm

  $ make qemu-system-i386

  $ ./build/i386-softmmu/qemu-system-i386
  include/exec/memory.h:688:12: runtime error: member access within null po=
inter of type 'AddressSpace' (aka 'struct AddressSpace')
  SUMMARY: UndefinedBehaviorSanitizer: undefined-behavior include/exec/memo=
ry.h:688:12 in =

  AddressSanitizer:DEADLYSIGNAL
  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
  =3D=3D249513=3D=3DERROR: AddressSanitizer: SEGV on unknown address 0x0000=
00000020 (pc 0x55955d7f8c4f bp 0x7fff10f3cff0 sp 0x7fff10f3cf20 T0)
  =3D=3D249513=3D=3DThe signal is caused by a READ memory access.
  =3D=3D249513=3D=3DHint: address points to the zero page.
      #0 0x55955d7f8c4f in address_space_to_flatview include/exec/memory.h:=
688:12
      #1 0x55955d8003d2 in address_space_translate include/exec/memory.h:22=
86:31
      #2 0x55955d8315f3 in address_space_stl_internal memory_ldst.c.inc:312=
:10
      #3 0x55955d831cd1 in address_space_stl_le memory_ldst.c.inc:353:5
      #4 0x55955d7ef2e1 in stl_le_phys include/exec/memory_ldst_phys.h.inc:=
103:5
      #5 0x55955d7ed299 in ioapic_service hw/intc/ioapic.c:138:17
      #6 0x55955d7f0e30 in ioapic_set_irq hw/intc/ioapic.c:186:17
      #7 0x55955e34b825 in qemu_set_irq hw/core/irq.c:45:5
      #8 0x55955d0409e6 in gsi_handler hw/i386/x86.c:583:5
      #9 0x55955e34b825 in qemu_set_irq hw/core/irq.c:45:5
      #10 0x55955ca539c9 in hpet_handle_legacy_irq hw/timer/hpet.c:724:13
      #11 0x55955e34b825 in qemu_set_irq hw/core/irq.c:45:5
      #12 0x55955ce7a695 in pit_irq_timer_update hw/timer/i8254.c:264:5
      #13 0x55955ce7a1d8 in pit_irq_control hw/timer/i8254.c:306:9
      #14 0x55955e34b825 in qemu_set_irq hw/core/irq.c:45:5
      #15 0x55955ca52276 in hpet_reset hw/timer/hpet.c:707:5
      #16 0x55955e342e91 in device_transitional_reset hw/core/qdev.c:1114:9
      #17 0x55955e345cfc in resettable_phase_hold hw/core/resettable.c:182:=
13
      #18 0x55955e31c1e5 in bus_reset_child_foreach hw/core/bus.c:94:9
      #19 0x55955e348a58 in resettable_child_foreach hw/core/resettable.c:9=
6:9
      #20 0x55955e34596f in resettable_phase_hold hw/core/resettable.c:173:5
      #21 0x55955e344a72 in resettable_assert_reset hw/core/resettable.c:60=
:5
      #22 0x55955e344919 in resettable_reset hw/core/resettable.c:45:5
      #23 0x55955e3473e9 in resettable_cold_reset_fn hw/core/resettable.c:2=
69:5
      #24 0x55955e344898 in qemu_devices_reset hw/core/reset.c:69:9
      #25 0x55955d05c5b0 in pc_machine_reset hw/i386/pc.c:1632:5
      #26 0x55955d55ab84 in qemu_system_reset softmmu/vl.c:1403:9
      #27 0x55955d56816d in qemu_init softmmu/vl.c:4458:5
      #28 0x55955bc13609 in main softmmu/main.c:49:5
      #29 0x7f3baad20041 in __libc_start_main (/lib64/libc.so.6+0x27041)
      #30 0x55955bb398ed in _start (build-sanitizer/qemu-system-i386+0x1b3d=
8ed)

  AddressSanitizer can not provide additional info.
  SUMMARY: AddressSanitizer: SEGV include/exec/memory.h:688:12 in address_s=
pace_to_flatview

  Comment and stl_le_phys() added in commit cb135f59b80:
      /* No matter whether IR is enabled, we translate
       * the IOAPIC message into a MSI one, and its
       * address space will decide whether we need a
       * translation. */
      stl_le_phys(ioapic_as, info.addr, info.data);

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1896317/+subscriptions

