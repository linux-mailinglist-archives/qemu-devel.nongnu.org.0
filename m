Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5AF432D3B6
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 13:55:39 +0100 (CET)
Received: from localhost ([::1]:55116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHnVy-000256-LS
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 07:55:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lHnSt-0007Su-RM
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 07:52:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58319)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lHnSq-00055B-U9
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 07:52:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614862343;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=EJjWmERrmwptKyG94Daltiys2icJ9/yjMcpoHjAt09U=;
 b=Qw7XTZIDzLQXwbOpARK+6Ld+KdXqOl0kYvcyx9GMl/4+xoWXWz/+ZnVyWUderItBoIHSOd
 HRZ4p0nU4ERHoocEAmO4bhoU5GWuJ9/+tRDyQTEeKxsvR6sKNv9uOxFOXWuX3LZWxkRPXg
 Bf4S252uyqHtdUBL+5nSXm+CnS0SfDY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-539-L0nv2mL8MOGkimUo1tlV5A-1; Thu, 04 Mar 2021 07:52:19 -0500
X-MC-Unique: L0nv2mL8MOGkimUo1tlV5A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D05A0108BD0A;
 Thu,  4 Mar 2021 12:52:18 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-115-129.ams2.redhat.com
 [10.36.115.129])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7CDB26060F;
 Thu,  4 Mar 2021 12:52:09 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 25AA318000A7; Thu,  4 Mar 2021 09:37:05 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/8] Ui 20210304 patches
Date: Thu,  4 Mar 2021 09:36:57 +0100
Message-Id: <20210304083705.1046645-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit cbcf09872a936ccefef6a34298046d3b9aefc148=
:=0D
=0D
  Merge remote-tracking branch 'remotes/stsquad/tags/pull-testing-updates-2=
40=3D=0D
221-1' into staging (2021-02-25 19:07:58 +0000)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://git.kraxel.org/qemu tags/ui-20210304-pull-request=0D
=0D
for you to fetch changes up to ed8f3fe6898e0f3fea2ece7c87464a06098b2300:=0D
=0D
  virtio-gpu: Do not distinguish the primary console (2021-03-04 09:35:36 +=
01=3D=0D
00)=0D
=0D
----------------------------------------------------------------=0D
ui/console: message surface tweaks.=0D
ui/cocoa: bugfixes and cleanups.=0D
=0D
----------------------------------------------------------------=0D
=0D
Akihiko Odaki (7):=0D
  ui/cocoa: Remove the uses of full screen APIs=0D
  ui/cocoa: Fix stride resolution of pixman image=0D
  configure: Improve OpenGL dependency detections=0D
  ui/cocoa: Replace fprintf with error_report=0D
  ui/console: Add placeholder flag to message surface=0D
  ui/console: Pass placeholder surface to displays=0D
  virtio-gpu: Do not distinguish the primary console=0D
=0D
Zack Marvel (1):=0D
  ui/gtk: vte: fix sending multiple characeters=0D
=0D
 configure                    | 37 ++++++++++--------------=0D
 include/ui/console.h         | 10 +++++--=0D
 include/ui/egl-helpers.h     |  9 +++++-=0D
 include/ui/spice-display.h   |  2 +-=0D
 hw/display/vhost-user-gpu.c  |  6 ++--=0D
 hw/display/virtio-gpu-3d.c   | 10 ++-----=0D
 hw/display/virtio-gpu-base.c |  3 --=0D
 hw/display/virtio-gpu.c      |  9 +-----=0D
 ui/console.c                 | 28 ++++++++++++++----=0D
 ui/egl-helpers.c             |  8 ++++--=0D
 ui/gtk-egl.c                 |  6 ++--=0D
 ui/gtk-gl-area.c             |  2 +-=0D
 ui/gtk.c                     | 29 +++++++++++++++----=0D
 ui/sdl2-2d.c                 |  7 ++---=0D
 ui/sdl2-gl.c                 |  4 +--=0D
 ui/spice-display.c           |  6 ++--=0D
 ui/vnc.c                     | 10 -------=0D
 docs/interop/vhost-user.json |  3 +-=0D
 meson.build                  |  2 +-=0D
 ui/cocoa.m                   | 55 +++++++++++++++---------------------=0D
 ui/meson.build               |  8 ++++--=0D
 21 files changed, 131 insertions(+), 123 deletions(-)=0D
=0D
--=3D20=0D
2.29.2=0D
=0D


