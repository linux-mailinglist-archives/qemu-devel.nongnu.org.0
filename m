Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BAA43AFC46
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 06:56:43 +0200 (CEST)
Received: from localhost ([::1]:59436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvYSo-0004Xy-Dr
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 00:56:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lvY48-0002jf-Ub
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 00:31:12 -0400
Received: from indium.canonical.com ([91.189.90.7]:58448)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lvY46-0000Oy-6n
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 00:31:12 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lvY44-0003kX-6f
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 04:31:08 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 216472E809C
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 04:31:08 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Jun 2021 04:17:46 -0000
From: Launchpad Bug Tracker <1618122@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor th-huth vans-163
X-Launchpad-Bug-Reporter: vans163 (vans-163)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <20160829160030.27613.81837.malonedeb@gac.canonical.com>
Message-Id: <162433546707.20423.17608961190549168113.malone@loganberry.canonical.com>
Subject: [Bug 1618122] Re: qemu-monitor screendump very slow
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="3619498b5524a71696f3dd612f4d11bd63449bb1"; Instance="production"
X-Launchpad-Hash: 12896cad49c53a10b2d2f686016cec531ee4a36e
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
Reply-To: Bug 1618122 <1618122@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1618122

Title:
  qemu-monitor screendump very slow

Status in QEMU:
  Expired

Bug description:
  qemu-monitor screendump often using 10-20% cpu usage of one core to
  take a small capture.

  Most of the CPU usage seems to come from libpixman. There were many
  reports of libpixman becoming 8 times slower in newer releases.

  https://github.com/qemu/qemu/blob/0c56c6ab68902281094c7aac6305e2321c34c18=
7/ui/console.c#L285

  Simple Valgrind Ir report.

  -------------------------------------------------------------------------=
-------
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Ir
  -------------------------------------------------------------------------=
-------
  9,994,313,959  PROGRAM TOTALS

  -------------------------------------------------------------------------=
-------
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Ir  fil=
e:function
  -------------------------------------------------------------------------=
-------
  4,883,603,360  /usr/src/debug/pixman-0.34.0/pixman/pixman-access.c:store_=
scanline_b8g8r8 [/usr/lib64/libpixman-1.so.0.34.0]
  =C2=A0=C2=A0282,312,800  /usr/src/debug/pixman-0.34.0/pixman/pixman-imple=
mentation.c:_pixman_implementation_iter_init [/usr/lib64/libpixman-1.so.0.3=
4.0]
  =C2=A0=C2=A0267,394,160  /usr/src/debug/pixman-0.34.0/pixman/pixman-sse2.=
c:sse2_fetch_x8r8g8b8 [/usr/lib64/libpixman-1.so.0.34.0]
  =C2=A0=C2=A0256,761,600  /usr/src/debug/pixman-0.34.0/pixman/pixman-priva=
te.h:store_scanline_b8g8r8
  =C2=A0=C2=A0254,676,199  ???:0x0000000000011f40 [/usr/lib64/libjemalloc.s=
o.2]
  =C2=A0=C2=A0199,990,526  ???:0x0000000000011a10 [/usr/lib64/libjemalloc.s=
o.2]

  Calls to there start from.
  qemu_pixman_linebuf_fill
  pixman_image_composite
  ????
  pixman_image_composite32
  general_composite_rect

  I tried taking a look on how to fix this, but it seems pixman is
  deeply enrooted inside the monitor.  I wanted to try to simply take
  whats on the display and memcpy it into .ppm format manually creating
  the file header, but the image is all broken with colors being off or
  its smeared.

  For example this is DisplaySurface:

  struct DisplaySurface {
  =C2=A0=C2=A0=C2=A0=C2=A0pixman_format_code_t format;
  =C2=A0=C2=A0=C2=A0=C2=A0pixman_image_t *image;
  =C2=A0=C2=A0=C2=A0=C2=A0uint8_t flags;
  #ifdef CONFIG_OPENGL
  =C2=A0=C2=A0=C2=A0=C2=A0GLenum glformat;
  =C2=A0=C2=A0=C2=A0=C2=A0GLenum gltype;
  =C2=A0=C2=A0=C2=A0=C2=A0GLuint texture;
  #endif
  };

  =

  It appears graphic_hw_update(con) renders the vram to a pixman_image.  Th=
en ppm_save(filename, surface, errp) goes over it yet again, mutates the by=
tes in an expensive way to another pixman_image, and saves that row by row =
to a ppm.

  Using sdl graphics (the default) the drawing starts in
  https://github.com/qemu/qemu/blob/7fa124b273acd22a808e742ead78c065ccd9b4c=
4/hw/display/vga.c#L1466

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1618122/+subscriptions

