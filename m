Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E7A30700A
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 08:49:00 +0100 (CET)
Received: from localhost ([::1]:33056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5231-0002Gq-9R
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 02:48:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l51zO-0007QZ-9r
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 02:45:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l51zM-00016P-Hg
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 02:45:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611819911;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=68KDDyC9zxpIf7xf/eWSPndM+Q/Bw0uRrHiWoFTQVjU=;
 b=hJIH/G1E95FBi0Yw8ynkGsWtuMMXmZbHfcxhQowOUS+pQR7Zst48aJNAAXVsoTMttoDBju
 7/lC4rkEqvnlrovgnjkRJeOaVemUg1U89EVkmUeoL3ql4+4l6+gCskFTVMGl+q0WZyRtEO
 Jf0iYcaHOaO3i8ZsOOWdL3MvfMdY3SQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-274-RHFXY4XpMVuTRY6dRery-w-1; Thu, 28 Jan 2021 02:45:09 -0500
X-MC-Unique: RHFXY4XpMVuTRY6dRery-w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 675C9107ACE3;
 Thu, 28 Jan 2021 07:45:08 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-224.ams2.redhat.com
 [10.36.113.224])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3A4DD6F80A;
 Thu, 28 Jan 2021 07:45:08 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C3A9B113865F; Thu, 28 Jan 2021 08:45:06 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/5] QAPI patches patches for 2021-01-28
Date: Thu, 28 Jan 2021 08:45:01 +0100
Message-Id: <20210128074506.2725379-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.308,
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit bf159f0bdc7b8e7aa8342dedb3829ca744c1b612:

  Merge remote-tracking branch 'remotes/edgar/tags/edgar/xilinx-next-2021-01-27.for-upstream' into staging (2021-01-27 17:40:25 +0000)

are available in the Git repository at:

  git://repo.or.cz/qemu/armbru.git tags/pull-qapi-2021-01-28

for you to fetch changes up to 95b3a8c8a82a34ca874ac0d4a9bbbdb38034acf3:

  qapi: More complex uses of QAPI_LIST_APPEND (2021-01-28 08:08:45 +0100)

----------------------------------------------------------------
QAPI patches patches for 2021-01-28

----------------------------------------------------------------
Eric Blake (5):
      net: Clarify early exit condition
      qapi: A couple more QAPI_LIST_PREPEND() stragglers
      qapi: Introduce QAPI_LIST_APPEND
      qapi: Use QAPI_LIST_APPEND in trivial cases
      qapi: More complex uses of QAPI_LIST_APPEND

 include/qapi/util.h                 |  13 ++++
 backends/hostmem.c                  |  10 +--
 block/dirty-bitmap.c                |   8 +--
 block/export/export.c               |   7 +-
 block/gluster.c                     |  13 +---
 block/qapi.c                        |  37 ++---------
 block/qcow2-bitmap.c                |  15 ++---
 block/vmdk.c                        |   9 +--
 blockdev.c                          |  13 ++--
 crypto/block-luks.c                 |   9 +--
 dump/dump.c                         |  22 ++-----
 hw/acpi/cpu.c                       |   7 +-
 hw/acpi/memory_hotplug.c            |   8 +--
 hw/core/machine-qmp-cmds.c          | 125 +++++++++++++++---------------------
 hw/mem/memory-device.c              |  12 +---
 hw/pci/pci.c                        |  60 ++++++-----------
 iothread.c                          |  12 +---
 job-qmp.c                           |  13 ++--
 migration/migration.c               |  20 ++----
 monitor/hmp-cmds.c                  |  35 +++++-----
 monitor/qmp-cmds-control.c          |   9 ++-
 net/net.c                           |  15 ++---
 qemu-img.c                          |   8 +--
 qga/commands-posix.c                |  50 +++++----------
 qga/commands-win32.c                |  99 ++++++++++------------------
 scsi/pr-manager.c                   |  10 +--
 softmmu/tpm.c                       |  38 ++---------
 target/i386/cpu.c                   |  24 +++----
 tests/test-qobject-output-visitor.c |  84 +++++++-----------------
 tests/test-string-output-visitor.c  |   6 +-
 ui/spice-core.c                     |  27 +++-----
 31 files changed, 267 insertions(+), 551 deletions(-)

-- 
2.26.2


