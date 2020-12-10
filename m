Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F9912D627F
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 17:52:10 +0100 (CET)
Received: from localhost ([::1]:34482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knPAn-0004fc-2t
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 11:52:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1knOrZ-0008K0-Fo
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 11:32:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1knOrO-0003Sh-O3
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 11:32:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607617925;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=q+5uIdJ8o9HotguasRhCZ9yoSC30lMp+P+HFZtbtHWQ=;
 b=HsUfq4yrIu/kPwW1QKiCyQaLQicnZHv95e7hv2Texwz5BeJOFVCMBPprFTeqrdoCLDa3ch
 2z9Nqi4hmtkIVKWMZ944HT7zw5UFrccNEjkGWaLz2x9yQxo0Gpfe1QfT8GpAnnbhclIVMw
 2Vyc/fK7ChkRikAqcU/18+9uLO+zBus=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-412-sx5UWtNDPwOyAzkmpnD-UA-1; Thu, 10 Dec 2020 11:32:02 -0500
X-MC-Unique: sx5UWtNDPwOyAzkmpnD-UA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A6E3410051AB;
 Thu, 10 Dec 2020 16:31:34 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4E78560BF1;
 Thu, 10 Dec 2020 16:31:34 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id BA7EE11336D6; Thu, 10 Dec 2020 17:31:32 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/13] Miscellaneous patches for 2020-12-10
Date: Thu, 10 Dec 2020 17:31:19 +0100
Message-Id: <20201210163132.2919935-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 00ef48ff0de9c3e5834e7e3f6691bbc80d08c114:

  Merge remote-tracking branch 'remotes/kraxel/tags/microvm-20201210-pull-request' into staging (2020-12-10 12:53:01 +0000)

are available in the Git repository at:

  git://repo.or.cz/qemu/armbru.git tags/pull-misc-2020-12-10

for you to fetch changes up to 4eb79bdf87206a223a7ad7a698af519d2ec75c14:

  docs/devel/writing-qmp-commands.txt: Fix docs (2020-12-10 17:16:44 +0100)

----------------------------------------------------------------
Miscellaneous patches for 2020-12-10

----------------------------------------------------------------
Markus Armbruster (12):
      Clean up includes
      qerror: Drop unused QERR_ macros
      qerror: Eliminate QERR_ macros used in just one place
      block: Improve some block-commit, block-stream error messages
      ui: Improve some set_passwd, expire_password error messages
      ui: Improve a client_migrate_info error message
      ui: Tweak a client_migrate_info error message
      qga: Replace an unreachable error by abort()
      qga: Tweak a guest-shutdown error message
      qom: Improve {qom,device}-list-properties error messages
      Tweak a few "Parameter 'NAME' expects THING" error message
      qapi: Normalize version references x.y.0 to just x.y

Zihao Chang (1):
      docs/devel/writing-qmp-commands.txt: Fix docs

 docs/devel/writing-qmp-commands.txt     |  2 +-
 qapi/block-core.json                    | 28 ++++++++++----------
 qapi/block-export.json                  |  6 ++---
 qapi/block.json                         |  2 +-
 qapi/char.json                          |  4 +--
 qapi/control.json                       | 14 +++++-----
 qapi/machine-target.json                | 22 ++++++++--------
 qapi/machine.json                       | 46 ++++++++++++++++-----------------
 qapi/migration.json                     | 16 ++++++------
 qapi/misc-target.json                   |  2 +-
 qapi/misc.json                          | 30 ++++++++++-----------
 qapi/net.json                           |  6 ++---
 qapi/pci.json                           | 12 ++++-----
 qapi/qdev.json                          |  2 +-
 qapi/run-state.json                     | 16 ++++++------
 qapi/ui.json                            | 40 ++++++++++++++--------------
 contrib/vhost-user-gpu/vugbm.h          |  2 --
 contrib/vhost-user-gpu/vugpu.h          |  1 -
 include/hw/block/swim.h                 |  1 -
 include/hw/display/macfb.h              |  1 -
 include/qapi/qmp/qerror.h               | 23 -----------------
 include/qemu/nvdimm-utils.h             |  1 -
 tests/qtest/fuzz/fuzz.h                 |  1 -
 tests/qtest/fuzz/generic_fuzz_configs.h |  1 -
 tools/virtiofsd/fuse_common.h           |  2 --
 tools/virtiofsd/fuse_log.h              |  1 -
 tools/virtiofsd/fuse_lowlevel.h         |  3 ---
 tools/virtiofsd/fuse_misc.h             |  1 -
 tools/virtiofsd/passthrough_seccomp.h   |  1 -
 block/quorum.c                          |  2 +-
 blockdev.c                              | 17 +++++++-----
 chardev/char.c                          |  2 +-
 contrib/vhost-user-gpu/virgl.c          |  1 +
 contrib/vhost-user-gpu/vugbm.c          |  1 +
 contrib/vhost-user-input/main.c         |  1 -
 hw/core/qdev-properties-system.c        |  2 +-
 hw/display/artist.c                     |  1 -
 hw/s390x/s390-pci-vfio.c                |  3 ++-
 monitor/misc.c                          | 12 ++++-----
 monitor/qmp-cmds.c                      | 38 +++++++++++----------------
 net/net.c                               |  2 +-
 qga/commands-win32.c                    |  5 ++--
 qom/qom-qmp-cmds.c                      | 17 +++++-------
 softmmu/qdev-monitor.c                  |  4 +--
 tools/virtiofsd/buffer.c                |  5 ----
 tools/virtiofsd/fuse_log.c              |  2 --
 tools/virtiofsd/fuse_lowlevel.c         | 10 -------
 tools/virtiofsd/fuse_opt.c              |  4 ---
 tools/virtiofsd/fuse_signals.c          |  5 ----
 tools/virtiofsd/fuse_virtio.c           | 10 -------
 tools/virtiofsd/helper.c                |  8 ------
 tools/virtiofsd/passthrough_ll.c        | 12 ---------
 tools/virtiofsd/passthrough_seccomp.c   |  3 ---
 util/nvdimm-utils.c                     |  1 +
 tests/qemu-iotests/040                  | 12 ++++-----
 55 files changed, 180 insertions(+), 287 deletions(-)

-- 
2.26.2


