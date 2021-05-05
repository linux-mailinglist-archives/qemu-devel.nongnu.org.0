Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F03953739AC
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 13:48:00 +0200 (CEST)
Received: from localhost ([::1]:55958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leG0W-00069U-31
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 07:48:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leFuE-0001ie-7c
 for qemu-devel@nongnu.org; Wed, 05 May 2021 07:41:30 -0400
Received: from indium.canonical.com ([91.189.90.7]:54654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leFu5-0002JX-DH
 for qemu-devel@nongnu.org; Wed, 05 May 2021 07:41:29 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1leFu3-0003T6-4f
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 11:41:19 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 1B2502E818E
 for <qemu-devel@nongnu.org>; Wed,  5 May 2021 11:41:19 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 May 2021 11:27:47 -0000
From: Thomas Huth <1827772@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: gvt mdev rfc vfio
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: cuser2 th-huth
X-Launchpad-Bug-Reporter: Chen Zhang (cuser2)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <155705134117.31768.14250772954769525827.malonedeb@wampee.canonical.com>
Message-Id: <162021406719.14889.14028607154263209371.malone@soybean.canonical.com>
Subject: [Bug 1827772] Re: [RFC] dma buf: support sprite plane
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d6ba96cccb3d3e356754af3137c6128a6c17e2a8"; Instance="production"
X-Launchpad-Hash: dc0ff21a88f105e300647e1e1044681753d77c77
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
Reply-To: Bug 1827772 <1827772@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'expired' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/169


** Changed in: qemu
       Status: New =3D> Expired

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #169
   https://gitlab.com/qemu-project/qemu/-/issues/169

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1827772

Title:
  [RFC] dma buf: support sprite plane

Status in QEMU:
  Expired

Bug description:
  QEMU does not support sprite/overlay in DMA-buf mode for Intel gvt
  vGPUs. Some use cases relies on sprite plane support, e.g. hw
  accelerated video playback in Windows 10 guest.

  To support this feature, functions in both kernel and QEMU should be
  implemented:

  - query support for plane info in kernel:
  =C2=A0=C2=A0in vgpu_get_plane_info() of drm/i915/gvt/dmabuf.c, calls to i=
ntel_vgpu_decode_sprite_plane() shall be made;

  - struct to hold VFIODMABuf object in QEMU:
  =C2=A0=C2=A0in struct VFIODisplay of include/hw/vfio/vfio-common.h;
  - copying of data in QEMU:
  =C2=A0=C2=A0in vfio_display_get_dmabuf() of hw/vfio/display.c;
  - drawing of sprite plane in QEMU:
  =C2=A0=C2=A0in vfio_display_dmabuf_update() of hw/vfio/display.c;
    defining more DisplayChangeListenerOps for overlay;
    adding position info in struct QemuDmaBuf of include/ui/console.h;
    adding overlay_fb in struct VirtualGfxConsole of include/ui/gtk.h;
    implement gd_egl_overlay_dmabuf for overlay update;

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1827772/+subscriptions

