Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B3C0310545
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 07:58:48 +0100 (CET)
Received: from localhost ([::1]:38458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7v4p-0002m8-CQ
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 01:58:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l7v2q-00011X-FK
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 01:56:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52319)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l7v2n-00014a-3o
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 01:56:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612508199;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ICs2HVtaI9w8v2Plo63OC3MgrJMRMQ96c7e6iB4DOXU=;
 b=HIf46UE3ystEAbp/FYSLk+mpUfKeR/6NMI3reowhO3hc9nq/eCzjlMpK99ZeSJzKuNvaJM
 290DM2yLa/3FR1QrAMW1gRKFmOb0/sQIZai3AkG333gVHkAvGK4YA36by8WQYI5J/Eswf6
 ZUot329CaDo7GhPWA9FW7ASZdzRo2SA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-553-c6lLsDnAOWeChZhEkaz0pA-1; Fri, 05 Feb 2021 01:56:37 -0500
X-MC-Unique: c6lLsDnAOWeChZhEkaz0pA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 62859835E26
 for <qemu-devel@nongnu.org>; Fri,  5 Feb 2021 06:56:36 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-108.ams2.redhat.com
 [10.36.113.108])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0F57C55774;
 Fri,  5 Feb 2021 06:56:21 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 6519318000B1; Fri,  5 Feb 2021 07:56:20 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/24] Vga ui 20210205 patches
Date: Fri,  5 Feb 2021 07:55:56 +0100
Message-Id: <20210205065620.1726554-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit db754f8ccaf2f073c9aed46a4389e9c0c2080399=
:=0D
=0D
  Merge remote-tracking branch 'remotes/rth-gitlab/tags/pull-tcg-20210202' =
in=3D=0D
to staging (2021-02-03 19:35:57 +0000)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://git.kraxel.org/qemu tags/vga-ui-20210205-pull-request=0D
=0D
for you to fetch changes up to 73240f104dd0169b0637e46fae3c2c39cdfb2eb9:=0D
=0D
  tests: add some virtio-gpu & vhost-user-gpu acceptance test (2021-02-04 1=
5:=3D=0D
58:54 +0100)=0D
=0D
----------------------------------------------------------------=0D
ui+virtio-gpu: opengl cleanups and fixes.=0D
qxl+spice: bugfixes=0D
=0D
----------------------------------------------------------------=0D
=0D
Alex Chen (1):=0D
  hw/display/qxl: Fix bad printf format specifiers=0D
=0D
Marc-Andr=3DC3=3DA9 Lureau (23):=0D
  qxl: set qxl.ssd.dcl.con on secondary devices=0D
  qxl: also notify the rendering is done when skipping it=0D
  spice: delay starting until display are initialized=0D
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
  tests: add some virtio-gpu & vhost-user-gpu acceptance test=0D
=0D
 tests/acceptance/virtio-gpu.py          | 161 ++++++++++++++++++++++++=0D
 contrib/vhost-user-gpu/vugpu.h          |  10 +-=0D
 include/hw/virtio/virtio-gpu.h          |   6 +-=0D
 include/ui/console.h                    |  35 +++++-=0D
 include/ui/egl-context.h                |   1 -=0D
 include/ui/egl-helpers.h                |   1 +=0D
 include/ui/gtk.h                        |   4 +=0D
 include/ui/qemu-spice.h                 |   1 +=0D
 include/ui/sdl2.h                       |   1 -=0D
 chardev/char-socket.c                   |  53 +++++---=0D
 contrib/vhost-user-gpu/vhost-user-gpu.c |  80 ++++++++----=0D
 contrib/vhost-user-gpu/virgl.c          |   2 +-=0D
 hw/display/qxl-logger.c                 |   4 +-=0D
 hw/display/qxl-render.c                 |   1 +=0D
 hw/display/qxl.c                        |   3 +-=0D
 hw/display/vhost-user-gpu.c             |  17 +--=0D
 hw/display/virtio-gpu-base.c            |  31 ++++-=0D
 hw/display/virtio-gpu.c                 |   9 +-=0D
 hw/display/virtio-vga.c                 |  20 +++=0D
 hw/vfio/display.c                       |   6 +=0D
 ui/console.c                            |  64 +++++++---=0D
 ui/egl-context.c                        |   5 -=0D
 ui/egl-headless.c                       |   1 -=0D
 ui/egl-helpers.c                        |  10 ++=0D
 ui/gtk-egl.c                            |   3 +=0D
 ui/gtk-gl-area.c                        |  28 +++++=0D
 ui/gtk.c                                |  43 +++++--=0D
 ui/sdl2-gl.c                            |  10 +-=0D
 ui/sdl2.c                               |   1 -=0D
 ui/spice-core.c                         |   9 +-=0D
 ui/spice-display.c                      |   4 +-=0D
 31 files changed, 518 insertions(+), 106 deletions(-)=0D
 create mode 100644 tests/acceptance/virtio-gpu.py=0D
=0D
--=3D20=0D
2.29.2=0D
=0D


