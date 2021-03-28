Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E20734BE55
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Mar 2021 20:48:54 +0200 (CEST)
Received: from localhost ([::1]:54556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQaSz-0003sA-DC
	for lists+qemu-devel@lfdr.de; Sun, 28 Mar 2021 14:48:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1lQaQ5-00029F-Gs
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 14:45:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31305)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1lQaQ1-000146-CC
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 14:45:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616957144;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=CQjYpnlU/eOH1POWCg5fwey6JbJPYa1z9F88QOrJK3U=;
 b=KqU1/LU9W+XR0JCaMneitnsJ8/vJGLLwmErlRQmNyBbI+RId+B1QD9Oe1yOKkWzO8tlVuu
 4NGlYj/FzRzmOpfxpr/AnjluVKboujTqQbt0fONAy+TtjA9Tk5jI+XYLXaKTa0n/tcqbOc
 VyLzwpnJyobcQ9/6swngIyZBCwGOEkg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-293-KJCL_yfwNcCdJLx55gol4g-1; Sun, 28 Mar 2021 14:45:42 -0400
X-MC-Unique: KJCL_yfwNcCdJLx55gol4g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 69007501E0;
 Sun, 28 Mar 2021 18:45:41 +0000 (UTC)
Received: from localhost (unknown [10.36.110.42])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 956695D6AC;
 Sun, 28 Mar 2021 18:45:37 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL 00/10] For 6.0 patches
Date: Sun, 28 Mar 2021 22:45:23 +0400
Message-Id: <20210328184533.752840-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>=0D

The following changes since commit 7b9a3c9f94bcac23c534bc9f42a9e914b433b299=
:=0D
=0D
  Merge remote-tracking branch 'remotes/kraxel/tags/fixes-20210326-pull-req=
uest' into staging (2021-03-26 12:58:58 +0000)=0D
=0D
are available in the Git repository at:=0D
=0D
  git@gitlab.com:marcandre.lureau/qemu.git tags/for-6.0-pull-request=0D
=0D
for you to fetch changes up to f57d44b452e11d8b7c9743476c30a8d0f80926de:=0D
=0D
  tests: Add tests for yank with the chardev-change case (2021-03-27 13:57:=
40 +0400)=0D
=0D
----------------------------------------------------------------=0D
For 6.0 misc patches under my radar.=0D
=0D
Peter, let me know if you would rather split that PR.=0D
=0D
----------------------------------------------------------------=0D
=0D
Lukas Straub (6):=0D
  yank: Remove dependency on qiochannel=0D
  yank: Always link full yank code=0D
  chardev/char.c: Move object_property_try_add_child out of chardev_new=0D
  chardev/char.c: Always pass id to chardev_new=0D
  chardev: Fix yank with the chardev-change case=0D
  tests: Add tests for yank with the chardev-change case=0D
=0D
Marc-Andr=C3=A9 Lureau (3):=0D
  util: fix use-after-free in module_load_one=0D
  sphinx: adopt kernel readthedoc theme=0D
  docs: simplify each section title=0D
=0D
Priyankar Jain (1):=0D
  dbus-vmstate: Increase the size of input stream buffer used during=0D
    load=0D
=0D
 docs/_templates/editpage.html              |   5 -=0D
 docs/conf.py                               |  51 +++---=0D
 docs/devel/_templates/editpage.html        |   5 -=0D
 docs/devel/index.rst                       |   4 +-=0D
 docs/interop/_templates/editpage.html      |   5 -=0D
 docs/interop/index.rst                     |   4 +-=0D
 docs/meson.build                           |   5 +-=0D
 docs/specs/_templates/editpage.html        |   5 -=0D
 docs/specs/index.rst                       |   4 +-=0D
 docs/sphinx-static/theme_overrides.css     | 161 +++++++++++++++++=0D
 docs/system/_templates/editpage.html       |   5 -=0D
 docs/system/index.rst                      |   4 +-=0D
 docs/tools/_templates/editpage.html        |   5 -=0D
 docs/tools/index.rst                       |   4 +-=0D
 docs/user/_templates/editpage.html         |   5 -=0D
 docs/user/index.rst                        |   4 +-=0D
 include/chardev/char.h                     |   3 +=0D
 include/qemu/yank.h                        |  10 --=0D
 migration/yank_functions.h                 |  17 ++=0D
 backends/dbus-vmstate.c                    |  20 ++-=0D
 chardev/char-socket.c                      |  41 +++--=0D
 chardev/char.c                             |  77 +++++---=0D
 migration/channel.c                        |   6 +-=0D
 migration/multifd.c                        |   3 +-=0D
 migration/qemu-file-channel.c              |   3 +-=0D
 migration/yank_functions.c                 |  20 +++=0D
 stubs/yank.c                               |  29 ---=0D
 tests/unit/test-yank.c                     | 200 +++++++++++++++++++++=0D
 util/module.c                              |   3 +-=0D
 util/yank.c                                |   8 -=0D
 MAINTAINERS                                |   3 +-=0D
 migration/meson.build                      |   1 +=0D
 stubs/meson.build                          |   1 -=0D
 tests/docker/dockerfiles/alpine.docker     |   1 +=0D
 tests/docker/dockerfiles/debian10.docker   |   1 +=0D
 tests/docker/dockerfiles/fedora.docker     |   1 +=0D
 tests/docker/dockerfiles/ubuntu.docker     |   1 +=0D
 tests/docker/dockerfiles/ubuntu1804.docker |   1 +=0D
 tests/docker/dockerfiles/ubuntu2004.docker |   1 +=0D
 tests/unit/meson.build                     |   3 +-=0D
 util/meson.build                           |   2 +-=0D
 41 files changed, 567 insertions(+), 165 deletions(-)=0D
 delete mode 100644 docs/_templates/editpage.html=0D
 delete mode 100644 docs/devel/_templates/editpage.html=0D
 delete mode 100644 docs/interop/_templates/editpage.html=0D
 delete mode 100644 docs/specs/_templates/editpage.html=0D
 create mode 100644 docs/sphinx-static/theme_overrides.css=0D
 delete mode 100644 docs/system/_templates/editpage.html=0D
 delete mode 100644 docs/tools/_templates/editpage.html=0D
 delete mode 100644 docs/user/_templates/editpage.html=0D
 create mode 100644 migration/yank_functions.h=0D
 create mode 100644 migration/yank_functions.c=0D
 delete mode 100644 stubs/yank.c=0D
 create mode 100644 tests/unit/test-yank.c=0D
=0D
--=20=0D
2.29.0=0D
=0D


