Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C6A35149E
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 13:57:26 +0200 (CEST)
Received: from localhost ([::1]:46374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRvwz-0005fN-5J
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 07:57:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1lRvvQ-0004MK-9U
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 07:55:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1lRvvN-0001rN-CW
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 07:55:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617278143;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=MlAniY0OZjd5A1B93IZzDez4TQZdn4nh02nPqcSCAqk=;
 b=ScL3eW8pHFQMkMAWiIzkiR5xIbFcdL8uvpvtidoOyjsmLNw1sOFrF3KpZ1YuLQkgC4CPvu
 h9J/YgEAG54zrOekH6DOyTu0433d1YuzNecQsYGcPWG3trdSeKIMsVvShOTjxGGBXA8fzD
 ACS+Xpz2bKSNxbwNl9kuXIw8o8noUMs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-35-LwtYEexZPNqmEKKePhyK4w-1; Thu, 01 Apr 2021 07:55:41 -0400
X-MC-Unique: LwtYEexZPNqmEKKePhyK4w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6804F101962D;
 Thu,  1 Apr 2021 11:55:40 +0000 (UTC)
Received: from localhost (unknown [10.36.110.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1036019C59;
 Thu,  1 Apr 2021 11:55:35 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL v2 0/9] For 6.0 patches
Date: Thu,  1 Apr 2021 15:55:23 +0400
Message-Id: <20210401115532.430961-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>=0D

The following changes since commit 6ee55e1d10c25c2f6bf5ce2084ad2327e17affa5=
:=0D
=0D
  Merge remote-tracking branch 'remotes/dg-gitlab/tags/ppc-for-6.0-20210331=
' into staging (2021-03-31 13:14:18 +0100)=0D
=0D
are available in the Git repository at:=0D
=0D
  git@gitlab.com:marcandre.lureau/qemu.git tags/for-6.0-pull-request=0D
=0D
for you to fetch changes up to d3a0bb7706520928f8493fabaee76532b5b1adb4:=0D
=0D
  tests: Add tests for yank with the chardev-change case (2021-04-01 15:27:=
44 +0400)=0D
=0D
----------------------------------------------------------------=0D
For 6.0 misc patches under my radar.=0D
=0D
V2:=0D
 - "tests: Add tests for yank with the chardev-change case" updated=0D
 - drop the readthedoc theme patch=0D
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
Marc-Andr=C3=A9 Lureau (2):=0D
  util: fix use-after-free in module_load_one=0D
  docs: simplify each section title=0D
=0D
Priyankar Jain (1):=0D
  dbus-vmstate: Increase the size of input stream buffer used during=0D
    load=0D
=0D
 docs/devel/index.rst          |   4 +-=0D
 docs/interop/index.rst        |   4 +-=0D
 docs/specs/index.rst          |   4 +-=0D
 docs/system/index.rst         |   4 +-=0D
 docs/tools/index.rst          |   4 +-=0D
 docs/user/index.rst           |   4 +-=0D
 include/chardev/char.h        |   3 +=0D
 include/qemu/yank.h           |  10 --=0D
 migration/yank_functions.h    |  17 +++=0D
 backends/dbus-vmstate.c       |  20 ++-=0D
 chardev/char-socket.c         |  41 ++++--=0D
 chardev/char.c                |  77 +++++++----=0D
 migration/channel.c           |   6 +-=0D
 migration/multifd.c           |   3 +-=0D
 migration/qemu-file-channel.c |   3 +-=0D
 migration/yank_functions.c    |  20 +++=0D
 stubs/yank.c                  |  29 ----=0D
 tests/unit/test-yank.c        | 249 ++++++++++++++++++++++++++++++++++=0D
 util/module.c                 |   3 +-=0D
 util/yank.c                   |   8 --=0D
 MAINTAINERS                   |   3 +-=0D
 migration/meson.build         |   1 +=0D
 stubs/meson.build             |   1 -=0D
 tests/unit/meson.build        |   3 +-=0D
 util/meson.build              |   2 +-=0D
 25 files changed, 417 insertions(+), 106 deletions(-)=0D
 create mode 100644 migration/yank_functions.h=0D
 create mode 100644 migration/yank_functions.c=0D
 delete mode 100644 stubs/yank.c=0D
 create mode 100644 tests/unit/test-yank.c=0D
=0D
--=20=0D
2.29.0=0D
=0D


