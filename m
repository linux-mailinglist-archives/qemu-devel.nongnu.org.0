Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA8830C19A
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 15:30:39 +0100 (CET)
Received: from localhost ([::1]:37204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6whS-0003IU-4c
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 09:30:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1l6wdf-0006ha-7T
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 09:26:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35166)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1l6wdd-0002iy-Bo
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 09:26:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612276000;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=INCPcjCOpG8XNmX2qi4tZdE3fuDzl7gziqaFdPbsL4M=;
 b=R9fQogfv4hK0Q4w0hxIPWWZ81u1q0m27I9PDWetT1w5j/mC+ioe+Q/AYkXXeuQfvFYJ3NZ
 o6k0GK22dYfGlnMbL8QtJSgeD2y0WVxSNQEXoLXCllXV4DVx5Zl//Tx9MS2iNfQ3kfSoz+
 lezARq5Zb+eu+t9Eizv03Dvlnxz0wWc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-216-Qeq_mDYJNMaEBCTWNnFB6Q-1; Tue, 02 Feb 2021 09:26:38 -0500
X-MC-Unique: Qeq_mDYJNMaEBCTWNnFB6Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 852D99CDA0
 for <qemu-devel@nongnu.org>; Tue,  2 Feb 2021 14:26:36 +0000 (UTC)
Received: from localhost (unknown [10.36.110.27])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6EFBF1A26A;
 Tue,  2 Feb 2021 14:26:28 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 00/20] Various vhost-user-gpu & UI fixes
Date: Tue,  2 Feb 2021 18:26:05 +0400
Message-Id: <20210202142625.609070-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>=0D

Hi,=0D
=0D
Here is a collection of fixes and improvements mostly around vhost-user-gpu=
. In=0D
combination with spice, they work best with the previously sent fixes ("[PA=
TCH=0D
0/2] Fix (non-vga) QXL async screendump" & "[PATCH v2] spice: delay startin=
g=0D
until display are initialized"). I also use virgl from git, which seems to =
work=0D
better. You also need mesa with the recent fix !8663 from last week if you =
test=0D
this.=0D
=0D
The last patch is a simple RFC avocado test to have the basics under some=
=0D
control and avoid simple regressions.=0D
=0D
I have further refactoring work pending to separate the DisplayChangeListen=
er=0D
from the GL context. This should allow to run a GL-less qemu with Spice cli=
ent &=0D
vhost-user-gpu/virgl for example.=0D
=0D
Marc-Andr=C3=A9 Lureau (20):=0D
  vhost-user-gpu: check backend for EDID support=0D
  vhost-user-gpu: handle vhost-user-gpu features in a callback=0D
  vhost-user-gpu: use an extandable state enum for commands=0D
  vhost-user-gpu: handle display-info in a callback=0D
  ui: remove extra #ifdef CONFIG_OPENGL=0D
  ui: remove gl_ctx_get_current=0D
  ui: add gd_gl_area_scanout_disable=0D
  ui: annotate DCLOps callback requirements=0D
  ui: remove console_has_gl_dmabuf()=0D
  vhost-user-gpu: add a configuration flag for dmabuf usage=0D
  ui: add an optional get_flags callback to GraphicHwOps=0D
  ui: add a DCLOps callback to check dmabuf support=0D
  ui: check hw requirements during DCL registration=0D
  ui: add qemu_egl_has_dmabuf helper=0D
  ui: check gtk-egl dmabuf support=0D
  ui: add egl dmabuf import to gtkglarea=0D
  virtio-gpu: avoid re-entering cmdq processing=0D
  display/ui: add a callback to indicate GL state is flushed=0D
  chardev: check if the chardev is registered for yanking=0D
  RFC: tests: add some virtio-gpu & vhost-user-gpu acceptance test=0D
=0D
 contrib/vhost-user-gpu/vugpu.h          |  10 +-=0D
 include/hw/virtio/virtio-gpu.h          |   6 +-=0D
 include/ui/console.h                    |  35 +++++-=0D
 include/ui/egl-context.h                |   1 -=0D
 include/ui/egl-helpers.h                |   1 +=0D
 include/ui/gtk.h                        |   4 +=0D
 include/ui/sdl2.h                       |   1 -=0D
 chardev/char-socket.c                   |  53 +++++----=0D
 contrib/vhost-user-gpu/vhost-user-gpu.c |  77 ++++++++----=0D
 contrib/vhost-user-gpu/virgl.c          |   2 +-=0D
 hw/display/vhost-user-gpu.c             |  17 +--=0D
 hw/display/virtio-gpu-base.c            |  31 ++++-=0D
 hw/display/virtio-gpu.c                 |   9 +-=0D
 hw/display/virtio-vga.c                 |  20 ++++=0D
 hw/vfio/display.c                       |   6 +=0D
 ui/console.c                            |  61 +++++++---=0D
 ui/egl-context.c                        |   5 -=0D
 ui/egl-headless.c                       |   1 -=0D
 ui/egl-helpers.c                        |   9 ++=0D
 ui/gtk-egl.c                            |   3 +=0D
 ui/gtk-gl-area.c                        |  28 +++++=0D
 ui/gtk.c                                |  43 +++++--=0D
 ui/sdl2-gl.c                            |  10 +-=0D
 ui/sdl2.c                               |   1 -=0D
 ui/spice-display.c                      |   2 +-=0D
 tests/acceptance/virtio-gpu.py          | 150 ++++++++++++++++++++++++=0D
 26 files changed, 484 insertions(+), 102 deletions(-)=0D
 create mode 100644 tests/acceptance/virtio-gpu.py=0D
=0D
--=20=0D
2.29.0=0D
=0D


