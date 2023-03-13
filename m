Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 174356B8225
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 21:03:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pboMd-00013m-Ts; Mon, 13 Mar 2023 16:01:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pboMa-00013H-Do
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 16:01:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pboMY-0004dx-Jx
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 16:01:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678737701;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Whsbbk2n3Rfowfw/tUT44841ojFQSSc8vwclvDcnxvE=;
 b=LMoekxgHrHa+DDVuePrgpFYeY/I/ViVMqubIZHP1ScXdxiHMs8cGWrrDBQ0f9QBxIihQrV
 fdbIrOIfTUf/0UdzxrHoR56CAi4ANTXxnwW03I03dwRwRP9YipnYnxDIUMT1t0/D4PYxc5
 381frnczQ8Lj33yoKWEA5meCQLj1eF0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-121-hvAueG8jP8m-CPWoVDHs4Q-1; Mon, 13 Mar 2023 16:01:38 -0400
X-MC-Unique: hvAueG8jP8m-CPWoVDHs4Q-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 92ACE3C0F662;
 Mon, 13 Mar 2023 20:01:37 +0000 (UTC)
Received: from localhost (unknown [10.39.208.8])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D1F7847507A;
 Mon, 13 Mar 2023 20:01:36 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PULL v2 00/18] Display patches
Date: Tue, 14 Mar 2023 00:01:16 +0400
Message-Id: <20230313200134.503083-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Marc-André Lureau <marcandre.lureau@redhat.com>

The following changes since commit 284c52eec2d0a1b9c47f06c3eee46762c5fc0915:

  Merge tag 'win-socket-pull-request' of https://gitlab.com/marcandre.lureau/qemu into staging (2023-03-13 13:44:17 +0000)

are available in the Git repository at:

  https://gitlab.com/marcandre.lureau/qemu.git tags/display-pull-request

for you to fetch changes up to 4814d3cbf9f921b6f60a384b4aa3fc3151fdd3a7:

  ui/dbus: restrict opengl to gbm-enabled config (2023-03-13 23:48:45 +0400)

----------------------------------------------------------------
ui: dbus & misc fixes

v2:
- fix crash spotted by avocado VNC test

----------------------------------------------------------------

Marc-André Lureau (18):
  ui/dbus: initialize cursor_fb
  ui/dbus: unregister clipboard on connection close
  audio/dbus: there are no sender for p2p mode
  ui/dbus: set mouse is-absolute during console creation
  meson: ensure dbus-display generated code is built before other units
  ui: rename cursor_{put->unref}
  ui: rename cursor_{get->ref}, return it
  ui: keep current cursor with QemuConsole
  ui: set cursor upon listener registration
  ui: set cursor position upon listener registration
  ui/sdl: get the GL context from the window
  ui/shader: fix #version directive must occur on first line
  ui/egl: print EGL error, helping debugging
  ui/sdl: add QEMU_ENABLE_SDL_LOGGING setting/environment
  ui/sdl: try to instantiate the matching opengl renderer
  ui: introduce egl_init()
  ui/dbus: do not require opengl & gbm
  ui/dbus: restrict opengl to gbm-enabled config

 meson.build                      |  4 +-
 audio/audio_int.h                |  2 +-
 include/ui/console.h             |  5 +-
 include/ui/egl-helpers.h         |  4 ++
 ui/vnc.h                         |  1 -
 audio/dbusaudio.c                |  7 ++-
 hw/display/qxl-render.c          |  4 +-
 hw/display/qxl.c                 |  2 +-
 hw/display/vmware_vga.c          |  4 +-
 ui/console.c                     | 18 ++++++++
 ui/cursor.c                      |  5 +-
 ui/dbus-clipboard.c              | 18 +++-----
 ui/dbus-console.c                | 13 ++++--
 ui/dbus-listener.c               | 22 ++++++---
 ui/dbus.c                        | 29 ++++++++----
 ui/egl-headless.c                | 16 +++----
 ui/egl-helpers.c                 | 78 +++++++++++++++++++++++++++++---
 ui/sdl2.c                        | 24 +++++++++-
 ui/spice-core.c                  |  7 +--
 ui/spice-display.c               |  8 ++--
 ui/vnc.c                         |  8 +---
 tests/qtest/meson.build          |  2 +-
 ui/meson.build                   |  6 ++-
 ui/shader/texture-blit-flip.vert |  1 -
 ui/shader/texture-blit.frag      |  1 -
 ui/shader/texture-blit.vert      |  1 -
 26 files changed, 210 insertions(+), 80 deletions(-)

-- 
2.39.2


