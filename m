Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E6B1511C9E
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 19:32:49 +0200 (CEST)
Received: from localhost ([::1]:59912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njlWy-0006sD-MG
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 13:32:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1njlUG-0004Li-6J
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 13:30:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40929)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1njlUD-0002KA-0r
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 13:29:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651080595;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=8lkaewi0d/ZUUSfoNycQSVVjxwcxVmvfdLgd+qCC04M=;
 b=cmdBIW7KTy4WRU8rcaFodaurSsqLXGzYfnXNZedJ8RhwPV95FY7eBmyLDNIeT46CE2faZv
 SC8/EMM5Zonp6vfsuxyvm5tHe6RzU86d+6/BthzYol0/ngwi4hi71iZRJfM7q+PQXQXdxa
 fdlu2T1cLPdBDoBne8+3YAw7Ls2tlQk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-336-ibt40518PMuqXpyQE-P3Ww-1; Wed, 27 Apr 2022 13:29:54 -0400
X-MC-Unique: ibt40518PMuqXpyQE-P3Ww-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CE66D811E75
 for <qemu-devel@nongnu.org>; Wed, 27 Apr 2022 17:29:53 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.9])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9C56D463E0B;
 Wed, 27 Apr 2022 17:29:53 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 18DD2180039B; Wed, 27 Apr 2022 19:29:52 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/9] Kraxel 20220427 patches
Date: Wed, 27 Apr 2022 19:29:43 +0200
Message-Id: <20220427172952.2986839-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
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

  git://git.kraxel.org/qemu tags/kraxel-20220427-pull-request

for you to fetch changes up to a8152c4e4613c70c2f0573a82babbc8acc00cf90:

  i386: firmware parsing and sev setup for -bios loaded firmware (2022-04-27 07:51:01 +0200)

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
 .../ci/org.centos/stream/8/x86_64/configure   |   4 +-
 scripts/coverity-scan/run-coverity-scan       |   2 +-
 scripts/meson-buildoptions.sh                 |   6 +-
 21 files changed, 458 insertions(+), 158 deletions(-)

-- 
2.35.1


