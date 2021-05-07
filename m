Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA6F376211
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 10:32:41 +0200 (CEST)
Received: from localhost ([::1]:52056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1levua-0007Zg-61
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 04:32:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1levtA-0006J6-DJ
 for qemu-devel@nongnu.org; Fri, 07 May 2021 04:31:12 -0400
Received: from indium.canonical.com ([91.189.90.7]:36222)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1levt6-0007oG-8z
 for qemu-devel@nongnu.org; Fri, 07 May 2021 04:31:12 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1levt3-00014I-AJ
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 08:31:05 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 6AF122E8233
 for <qemu-devel@nongnu.org>; Fri,  7 May 2021 08:30:59 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 May 2021 08:23:10 -0000
From: Thomas Huth <1888964@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: dmabuf egl gtk gvt mdev ui vfio
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: hesiod th-huth
X-Launchpad-Bug-Reporter: Tobias Markus (hesiod)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <159571274485.17992.4520030985362542383.malonedeb@soybean.canonical.com>
Message-Id: <162037579061.6598.6567015158999096766.malone@wampee.canonical.com>
Subject: [Bug 1888964] Re: Segfault using GTK display with dmabuf (iGVT-g) on
 Wayland
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d6ba96cccb3d3e356754af3137c6128a6c17e2a8"; Instance="production"
X-Launchpad-Hash: 22dfb9d1ea51eb5f37e724fc55e88cd4035cf3c9
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
Reply-To: Bug 1888964 <1888964@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project is currently moving its bug tracking to another system.
For this we need to know which bugs are still valid and which could be
closed already. Thus we are setting the bug state to "Incomplete" now.

If the bug has already been fixed in the latest upstream version of QEMU,
then please close this ticket as "Fix released".

If it is not fixed yet and you think that this bug report here is still
valid, then you have two options:

1) If you already have an account on gitlab.com, please open a new ticket
for this problem in our new tracker here:

    https://gitlab.com/qemu-project/qemu/-/issues

and then close this ticket here on Launchpad (or let it expire auto-
matically after 60 days). Please mention the URL of this bug ticket on
Launchpad in the new ticket on GitLab.

2) If you don't have an account on gitlab.com and don't intend to get
one, but still would like to keep this ticket opened, then please switch
the state back to "New" within the next 60 days (otherwise it will get
closed as "Expired"). We will then eventually migrate the ticket auto-
matically to the new system (but you won't be the reporter of the bug
in the new system and thus won't get notified on changes anymore).

Thank you and sorry for the inconvenience.


** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1888964

Title:
  Segfault using GTK display with dmabuf (iGVT-g) on Wayland

Status in QEMU:
  Incomplete

Bug description:
  When using...
   a) Intel virtualized graphics (iGVT-g) with dmabuf output
   b) QEMU's GTK display with GL output enabled (-display gtk,gl=3Don)
   c) A Wayland compositor (Sway in my case)
  a segfault occurs at some point on boot (I guess as soon as the guest sta=
rts using the virtual graphics card?)

  The origin is the function dpy_gl_scanout_dmabuf in ui/console.c, where i=
t calls
      con->gl->ops->dpy_gl_scanout_dmabuf(con->gl, dmabuf);
  However, the ops field (struct DisplayChangeListenerOps) does not have dp=
y_gl_scanout_dmabuf set because it is set to dcl_gl_area_ops which does not=
 have dpy_gl_scanout_dmabuf set.
  Only dcl_egl_ops has dpy_gl_scanout_dmabuf set.
  Currently, the GTK display uses EGL on X11 displays, but GtkGLArea on Way=
land. This can be observed in early_gtk_display_init() in ui/gtk.c, where i=
t says (simplified code):

  if (opts->has_gl && opts->gl !=3D DISPLAYGL_MODE_OFF) {
          if (GDK_IS_WAYLAND_DISPLAY(gdk_display_get_default())) {
              gtk_use_gl_area =3D true;
              gtk_gl_area_init();
          } else {
              DisplayGLMode mode =3D opts->has_gl ? opts->gl : DISPLAYGL_MO=
DE_ON;
              gtk_egl_init(mode);
          }
  }

  To reproduce the findings above, add this assertion to dpy_gl_scanout_dma=
buf:
      assert(con->gl->ops->dpy_gl_scanout_dmabuf);
  This will make the segfault turn into an assertion failure.

  A workaround is to force QEMU to use GDK's X11 backend (using
  GDK_BACKEND=3Dx11).

  Note: This might be a duplicate of 1775011, however the information
  provided in that bug report is not sufficient to make the assertion.

  QEMU version: b0ce3f021e0157e9a5ab836cb162c48caac132e1 (from Git master b=
ranch)
  OS: Arch Linux, Kernel Version 5.17.0-1

  Relevant flags of the QEMU invocation:
  qemu-system-x86_64 \
    -vga none \
    -device vfio-pci-nohotplug,sysfsdev=3D"$GVT_DEV",romfile=3D"${ROMFILE}"=
,display=3Don,x-igd-opregion=3Don,ramfb=3Don \
    -display gtk,gl=3Don

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1888964/+subscriptions

