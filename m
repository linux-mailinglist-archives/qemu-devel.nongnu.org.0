Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3837A6DDE83
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 16:52:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmFLV-0007mJ-VM; Tue, 11 Apr 2023 10:51:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pmFLT-0007m6-Jc; Tue, 11 Apr 2023 10:51:43 -0400
Received: from forwardcorp1a.mail.yandex.net
 ([2a02:6b8:c0e:500:1:45:d181:df01])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pmFLQ-0007qn-9n; Tue, 11 Apr 2023 10:51:43 -0400
Received: from mail-nwsmtp-smtp-corp-main-83.vla.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-83.vla.yp-c.yandex.net
 [IPv6:2a02:6b8:c18:1421:0:640:53a0:0])
 by forwardcorp1a.mail.yandex.net (Yandex) with ESMTP id CBF74607D0;
 Tue, 11 Apr 2023 17:51:25 +0300 (MSK)
Received: from vsementsov-nix.yandex-team.ru (unknown
 [2a02:6b8:b081:223::1:32])
 by mail-nwsmtp-smtp-corp-main-83.vla.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id GpW7600Oh8c0-s2dSHZLf; Tue, 11 Apr 2023 17:51:24 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1681224685; bh=ZxIJko+gq5SOYvE0424N6IhWk/nnEe/g51PSjSZVhso=;
 h=Message-Id:Date:Cc:Subject:To:From;
 b=nL34BTvhisJNMNT30g6RzZ4LDUFBPC6Acw1UtxcGigglDrcXnbyG6ZN8a4US7M334
 phFhoEw1BGulhubZJYzIs+iVA1OzJgjgG8n8NollafOvQGdAKLiuDMjbi6HSewQ+JW
 TCdG378DBNCepHLHnzFfSmA14texHwFKxLBXl6WM=
Authentication-Results: mail-nwsmtp-smtp-corp-main-83.vla.yp-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, pbonzini@redhat.com, armbru@redhat.com,
 eblake@redhat.com, jasowang@redhat.com, dgilbert@redhat.com,
 quintela@redhat.com, hreitz@redhat.com, kwolf@redhat.com,
 zhanghailiang@xfusion.com, chen.zhang@intel.com, lizhijian@fujitsu.com,
 wencongyang2@huawei.com, xiechanglong.d@gmail.com,
 den-plotnikov@yandex-team.ru,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Subject: [PATCH] replication: compile out some staff when replication is not
 configured
Date: Tue, 11 Apr 2023 17:51:12 +0300
Message-Id: <20230411145112.497785-1-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:c0e:500:1:45:d181:df01;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1a.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

Don't compile-in replication-related files when replication is disabled
in config.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---

Hi all!

I'm unsure, should it be actually separate
--disable-colo / --enable-colo options or it's really used only together
with replication staff.. So, I decided to start with simpler variant.


 block/meson.build     |  2 +-
 migration/meson.build |  6 ++++--
 net/meson.build       |  8 ++++----
 qapi/migration.json   |  6 ++++--
 stubs/colo.c          | 46 +++++++++++++++++++++++++++++++++++++++++++
 stubs/meson.build     |  1 +
 6 files changed, 60 insertions(+), 9 deletions(-)
 create mode 100644 stubs/colo.c

diff --git a/block/meson.build b/block/meson.build
index 382bec0e7d..b9a72e219b 100644
--- a/block/meson.build
+++ b/block/meson.build
@@ -84,7 +84,7 @@ block_ss.add(when: 'CONFIG_WIN32', if_true: files('file-win32.c', 'win32-aio.c')
 block_ss.add(when: 'CONFIG_POSIX', if_true: [files('file-posix.c'), coref, iokit])
 block_ss.add(when: libiscsi, if_true: files('iscsi-opts.c'))
 block_ss.add(when: 'CONFIG_LINUX', if_true: files('nvme.c'))
-if not get_option('replication').disabled()
+if get_option('replication').allowed()
   block_ss.add(files('replication.c'))
 endif
 block_ss.add(when: libaio, if_true: files('linux-aio.c'))
diff --git a/migration/meson.build b/migration/meson.build
index 0d1bb9f96e..8180eaea7b 100644
--- a/migration/meson.build
+++ b/migration/meson.build
@@ -13,8 +13,6 @@ softmmu_ss.add(files(
   'block-dirty-bitmap.c',
   'channel.c',
   'channel-block.c',
-  'colo-failover.c',
-  'colo.c',
   'exec.c',
   'fd.c',
   'global_state.c',
@@ -29,6 +27,10 @@ softmmu_ss.add(files(
   'threadinfo.c',
 ), gnutls)
 
+if get_option('replication').allowed()
+  softmmu_ss.add(files('colo.c', 'colo-failover.c'))
+endif
+
 softmmu_ss.add(when: rdma, if_true: files('rdma.c'))
 if get_option('live_block_migration').allowed()
   softmmu_ss.add(files('block.c'))
diff --git a/net/meson.build b/net/meson.build
index 87afca3e93..634ab71cc6 100644
--- a/net/meson.build
+++ b/net/meson.build
@@ -1,13 +1,9 @@
 softmmu_ss.add(files(
   'announce.c',
   'checksum.c',
-  'colo-compare.c',
-  'colo.c',
   'dump.c',
   'eth.c',
   'filter-buffer.c',
-  'filter-mirror.c',
-  'filter-rewriter.c',
   'filter.c',
   'hub.c',
   'net-hmp-cmds.c',
@@ -19,6 +15,10 @@ softmmu_ss.add(files(
   'util.c',
 ))
 
+if get_option('replication').allowed()
+  softmmu_ss.add(files('colo-compare.c', 'colo.c', 'filter-rewriter.c', 'filter-mirror.c'))
+endif
+
 softmmu_ss.add(when: 'CONFIG_TCG', if_true: files('filter-replay.c'))
 
 if have_l2tpv3
diff --git a/qapi/migration.json b/qapi/migration.json
index c84fa10e86..5b81e09369 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -1685,7 +1685,8 @@
 ##
 { 'struct': 'COLOStatus',
   'data': { 'mode': 'COLOMode', 'last-mode': 'COLOMode',
-            'reason': 'COLOExitReason' } }
+            'reason': 'COLOExitReason' },
+  'if': 'CONFIG_REPLICATION' }
 
 ##
 # @query-colo-status:
@@ -1702,7 +1703,8 @@
 # Since: 3.1
 ##
 { 'command': 'query-colo-status',
-  'returns': 'COLOStatus' }
+  'returns': 'COLOStatus',
+  'if': 'CONFIG_REPLICATION' }
 
 ##
 # @migrate-recover:
diff --git a/stubs/colo.c b/stubs/colo.c
new file mode 100644
index 0000000000..5a02540baa
--- /dev/null
+++ b/stubs/colo.c
@@ -0,0 +1,46 @@
+#include "qemu/osdep.h"
+#include "qemu/notify.h"
+#include "net/colo-compare.h"
+#include "migration/colo.h"
+#include "qapi/error.h"
+#include "qapi/qapi-commands-migration.h"
+
+void colo_compare_cleanup(void)
+{
+    abort();
+}
+
+void colo_shutdown(void)
+{
+    abort();
+}
+
+void *colo_process_incoming_thread(void *opaque)
+{
+    abort();
+}
+
+void colo_checkpoint_notify(void *opaque)
+{
+    abort();
+}
+
+void migrate_start_colo_process(MigrationState *s)
+{
+    abort();
+}
+
+bool migration_in_colo_state(void)
+{
+    return false;
+}
+
+bool migration_incoming_in_colo_state(void)
+{
+    return false;
+}
+
+void qmp_x_colo_lost_heartbeat(Error **errp)
+{
+    error_setg(errp, "COLO support is not built in");
+}
diff --git a/stubs/meson.build b/stubs/meson.build
index b2b5956d97..8412cad15f 100644
--- a/stubs/meson.build
+++ b/stubs/meson.build
@@ -45,6 +45,7 @@ stub_ss.add(files('target-get-monitor-def.c'))
 stub_ss.add(files('target-monitor-defs.c'))
 stub_ss.add(files('trace-control.c'))
 stub_ss.add(files('uuid.c'))
+stub_ss.add(files('colo.c'))
 stub_ss.add(files('vmstate.c'))
 stub_ss.add(files('vm-stop.c'))
 stub_ss.add(files('win32-kbd-hook.c'))
-- 
2.34.1


