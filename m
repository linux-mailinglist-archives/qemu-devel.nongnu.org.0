Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C803C2957C3
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Oct 2020 07:16:38 +0200 (CEST)
Received: from localhost ([::1]:44430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kVSxp-0000M1-Ro
	for lists+qemu-devel@lfdr.de; Thu, 22 Oct 2020 01:16:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kVStx-0003dO-Nb
 for qemu-devel@nongnu.org; Thu, 22 Oct 2020 01:12:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kVStu-0003vv-C9
 for qemu-devel@nongnu.org; Thu, 22 Oct 2020 01:12:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603343553;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=bRXc3/MKYITFZYcIOnM8rjuL54ZNs1Gi7+3OLEPoTjU=;
 b=PZXWbLgM0VIC4l4wwdn964lndqwsZK801kbnilL8OCWwzMdcczjLM8kU4OcK5MNBOkDi8M
 x3DCQiVz6jpvuKZlKUk06PUlVP7zvhfHnVrxLGbQkJ7h93ef3PIDDN1cPofKb6P/CfEJnC
 pmCXExHSYNlBJq66HdYd2f+6Z6oHZBs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-593-Kad3C6vuNbWsV7R0U8_GRQ-1; Thu, 22 Oct 2020 01:12:31 -0400
X-MC-Unique: Kad3C6vuNbWsV7R0U8_GRQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6E59C803F42
 for <qemu-devel@nongnu.org>; Thu, 22 Oct 2020 05:12:30 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-66.ams2.redhat.com
 [10.36.114.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 43A2F60C15;
 Thu, 22 Oct 2020 05:12:24 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 612FB16E18; Thu, 22 Oct 2020 07:12:23 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/14] Modules 20201022 patches
Date: Thu, 22 Oct 2020 07:12:09 +0200
Message-Id: <20201022051223.6181-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/22 00:54:46
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 4c41341af76cfc85b5a6c0f87de4838672ab9f89=
:=0D
=0D
  Merge remote-tracking branch 'remotes/aperard/tags/pull-xen-20201020' int=
o staging (2020-10-20 11:20:36 +0100)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://git.kraxel.org/qemu tags/modules-20201022-pull-request=0D
=0D
for you to fetch changes up to c8263659f1268a0f3502568d7663f722b2461935:=0D
=0D
  opengl: build opengl helper code modular (2020-10-21 15:46:14 +0200)=0D
=0D
----------------------------------------------------------------=0D
modules: build spice and opengl as module.=0D
=0D
----------------------------------------------------------------=0D
=0D
Gerd Hoffmann (14):=0D
  spice: add module helpers=0D
  spice: add QemuSpiceOps, move migrate_info=0D
  spice: move qemu_spice_init() to QemuSpiceOps.=0D
  spice: move display_init() to QemuSpiceOps.=0D
  spice: move add_interface() to QemuSpiceOps.=0D
  spice: move auth functions to QemuSpiceOps.=0D
  spice: move display_add_client() to QemuSpiceOps.=0D
  spice: wire up monitor in QemuSpiceOps.=0D
  spice: load module when enabled on the cmdline=0D
  modules: dependencies infrastructure=0D
  modules: add spice dependencies=0D
  spice: flip modules switch=0D
  opengl: build egl-headless display modular=0D
  opengl: build opengl helper code modular=0D
=0D
 include/ui/qemu-spice-module.h | 44 ++++++++++++++++++=0D
 include/ui/qemu-spice.h        | 42 +----------------=0D
 audio/spiceaudio.c             |  4 +-=0D
 chardev/spice.c                |  2 +-=0D
 monitor/misc.c                 |  2 +-=0D
 monitor/qmp-cmds.c             |  6 +--=0D
 softmmu/vl.c                   | 10 ++--=0D
 ui/spice-core.c                | 31 +++++++++----=0D
 ui/spice-input.c               |  6 +--=0D
 ui/spice-module.c              | 85 ++++++++++++++++++++++++++++++++++=0D
 util/module.c                  | 44 ++++++++++++++++--=0D
 ui/meson.build                 | 28 +++++++++--=0D
 12 files changed, 232 insertions(+), 72 deletions(-)=0D
 create mode 100644 include/ui/qemu-spice-module.h=0D
 create mode 100644 ui/spice-module.c=0D
=0D
--=20=0D
2.27.0=0D
=0D


