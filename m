Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7479B50FBB4
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 13:08:27 +0200 (CEST)
Received: from localhost ([::1]:47348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njJ3S-0007h7-Ia
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 07:08:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1njIzJ-0004Zi-Jo
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 07:04:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1njIzF-0004Uy-5L
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 07:04:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650971041;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=zVTbQ+Gd1hdQKLBzR2/TJ/TMHmkD5QCagG9BGuQGZ3c=;
 b=KBhWALRK/mcvct5zaJMOPOuLhBeJRxiZZPqd2EhCUT9sL1RQpRLFonfYlWsqkB3QUW3/j3
 TAtna4iyS9+jGb1NNnLsLkzr8dA7ciYPnOZ1u9y8s/Uj1CE2z5d9+r+AHGvXDMjyrLIXcF
 ASHErxUNHd+ShvAPtLf3y0Q61rIBfmE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-602-nxJgL6BDPOuKsxo0gW8gAw-1; Tue, 26 Apr 2022 07:04:00 -0400
X-MC-Unique: nxJgL6BDPOuKsxo0gW8gAw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C736319705AB
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 11:03:59 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.9])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9592340D2824;
 Tue, 26 Apr 2022 11:03:59 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 18BFC180062F; Tue, 26 Apr 2022 13:03:58 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/9] Kraxel 20220426 patches
Date: Tue, 26 Apr 2022 13:03:48 +0200
Message-Id: <20220426110358.1570723-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit a74782936dc6e979ce371dabda4b1c05624ea87f:

  Merge tag 'pull-migration-20220421a' of https://gitlab.com/dagrh/qemu into staging (2022-04-21 18:48:18 -0700)

are available in the Git repository at:

  git://git.kraxel.org/qemu tags/kraxel-20220426-pull-request

for you to fetch changes up to f7683b652742402f0bcd3b2714d2795ce524bd26:

  i386: firmware parsing and sev setup for -bios loaded firmware (2022-04-26 13:01:34 +0200)

----------------------------------------------------------------
vnc: add display-update monitor command.
screendump: add png support.
vmsvga: screen update fix.
i386: sev setup for -bios loaded firmware

----------------------------------------------------------------

Carwyn Ellis (1):
  hw/display/vmware_vga: do not discard screen updates

Gerd Hoffmann (3):
  i386: move bios load error message
  i386: factor out x86_firmware_configure()
  i386: firmware parsing and sev setup for -bios loaded firmware

Kshitij Suri (2):
  Replacing CONFIG_VNC_PNG with CONFIG_PNG
  Added parameter to take screenshot with screendump as PNG

Vladimir Sementsov-Ogievskiy (3):
  ui/vnc: refactor arrays of addresses to SocketAddressList
  qapi/ui: add 'display-update' command for changing listen address
  avocado/vnc: add test_change_listen

 meson_options.txt                             |   4 +-
 tests/avocado/vnc.py                          |  63 +++++++
 include/hw/i386/x86.h                         |   3 +
 include/ui/console.h                          |   1 +
 ui/vnc.h                                      |   2 +-
 hw/display/vmware_vga.c                       |  45 ++---
 hw/i386/pc_sysfw.c                            |  36 ++--
 hw/i386/x86.c                                 |  32 +++-
 monitor/hmp-cmds.c                            |  12 +-
 monitor/qmp-cmds.c                            |  15 ++
 ui/console.c                                  | 101 +++++++++++-
 ui/vnc-enc-tight.c                            |  18 +-
 ui/vnc.c                                      | 156 +++++++++---------
 docs/about/removed-features.rst               |   3 +-
 hmp-commands.hx                               |  11 +-
 hw/display/trace-events                       |   1 +
 meson.build                                   |  12 +-
 qapi/ui.json                                  |  89 +++++++++-
 .../ci/org.centos/stream/8/x86_64/configure   |   2 +-
 scripts/meson-buildoptions.sh                 |   6 +-
 20 files changed, 456 insertions(+), 156 deletions(-)

-- 
2.35.1


