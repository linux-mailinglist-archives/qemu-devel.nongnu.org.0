Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4EB14553CB
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 05:27:06 +0100 (CET)
Received: from localhost ([::1]:46610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnZ0r-0002nG-HS
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 23:27:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>)
 id 1mnYzq-00023V-NN; Wed, 17 Nov 2021 23:26:02 -0500
Received: from mga17.intel.com ([192.55.52.151]:41569)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>)
 id 1mnYzn-0004PZ-QZ; Wed, 17 Nov 2021 23:26:02 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10171"; a="214828795"
X-IronPort-AV: E=Sophos;i="5.87,243,1631602800"; d="scan'208";a="214828795"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2021 20:25:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,243,1631602800"; d="scan'208";a="507254892"
Received: from unknown (HELO localhost.localdomain.bj.intel.com)
 ([10.238.156.105])
 by orsmga008.jf.intel.com with ESMTP; 17 Nov 2021 20:25:50 -0800
From: "Rao, Lei" <lei.rao@intel.com>
To: chen.zhang@intel.com, zhang.zhanghailiang@huawei.com, quintela@redhat.com,
 dgilbert@redhat.com
Subject: [PATCH] docs/COLO-FT.txt: Drop deprecated 'props' from object-add in
 COLO docs
Date: Thu, 18 Nov 2021 12:17:21 +0800
Message-Id: <1637209041-15080-1-git-send-email-lei.rao@intel.com>
X-Mailer: git-send-email 1.8.3.1
Received-SPF: pass client-ip=192.55.52.151; envelope-from=lei.rao@intel.com;
 helo=mga17.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, "Rao, Lei" <lei.rao@intel.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Rao, Lei" <lei.rao@intel.com>

With the removal of deprecated 'props' from object-add in the commit of
"50243407457a9fb0ed17b9a9ba9fc9aee09495b1", we also should update COLO's
documents.

Signed-off-by: Lei Rao <lei.rao@intel.com>
---
 docs/COLO-FT.txt | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/docs/COLO-FT.txt b/docs/COLO-FT.txt
index 8d6d53a..fd5ffcc 100644
--- a/docs/COLO-FT.txt
+++ b/docs/COLO-FT.txt
@@ -289,11 +289,11 @@ Wait until disk is synced, then:
 {'execute': 'human-monitor-command', 'arguments':{ 'command-line': 'drive_add -n buddy driver=replication,mode=primary,file.driver=nbd,file.host=127.0.0.2,file.port=9999,file.export=parent0,node-name=replication0'}}
 {'execute': 'x-blockdev-change', 'arguments':{ 'parent': 'colo-disk0', 'node': 'replication0' } }
 
-{'execute': 'object-add', 'arguments':{ 'qom-type': 'filter-mirror', 'id': 'm0', 'props': { 'netdev': 'hn0', 'queue': 'tx', 'outdev': 'mirror0' } } }
-{'execute': 'object-add', 'arguments':{ 'qom-type': 'filter-redirector', 'id': 'redire0', 'props': { 'netdev': 'hn0', 'queue': 'rx', 'indev': 'compare_out' } } }
-{'execute': 'object-add', 'arguments':{ 'qom-type': 'filter-redirector', 'id': 'redire1', 'props': { 'netdev': 'hn0', 'queue': 'rx', 'outdev': 'compare0' } } }
+{'execute': 'object-add', 'arguments':{ 'qom-type': 'filter-mirror', 'id': 'm0', 'netdev': 'hn0', 'queue': 'tx', 'outdev': 'mirror0' } }
+{'execute': 'object-add', 'arguments':{ 'qom-type': 'filter-redirector', 'id': 'redire0', 'netdev': 'hn0', 'queue': 'rx', 'indev': 'compare_out' } }
+{'execute': 'object-add', 'arguments':{ 'qom-type': 'filter-redirector', 'id': 'redire1', 'netdev': 'hn0', 'queue': 'rx', 'outdev': 'compare0' } }
 {'execute': 'object-add', 'arguments':{ 'qom-type': 'iothread', 'id': 'iothread1' } }
-{'execute': 'object-add', 'arguments':{ 'qom-type': 'colo-compare', 'id': 'comp0', 'props': { 'primary_in': 'compare0-0', 'secondary_in': 'compare1', 'outdev': 'compare_out0', 'iothread': 'iothread1' } } }
+{'execute': 'object-add', 'arguments':{ 'qom-type': 'colo-compare', 'id': 'comp0', 'primary_in': 'compare0-0', 'secondary_in': 'compare1', 'outdev': 'compare_out0', 'iothread': 'iothread1' } }
 
 {'execute': 'migrate-set-capabilities', 'arguments':{ 'capabilities': [ {'capability': 'x-colo', 'state': true } ] } }
 {'execute': 'migrate', 'arguments':{ 'uri': 'tcp:127.0.0.2:9998' } }
@@ -318,11 +318,11 @@ Wait until disk is synced, then:
 {'execute': 'human-monitor-command', 'arguments':{ 'command-line': 'drive_add -n buddy driver=replication,mode=primary,file.driver=nbd,file.host=127.0.0.1,file.port=9999,file.export=parent0,node-name=replication0'}}
 {'execute': 'x-blockdev-change', 'arguments':{ 'parent': 'colo-disk0', 'node': 'replication0' } }
 
-{'execute': 'object-add', 'arguments':{ 'qom-type': 'filter-mirror', 'id': 'm0', 'props': { 'insert': 'before', 'position': 'id=rew0', 'netdev': 'hn0', 'queue': 'tx', 'outdev': 'mirror0' } } }
-{'execute': 'object-add', 'arguments':{ 'qom-type': 'filter-redirector', 'id': 'redire0', 'props': { 'insert': 'before', 'position': 'id=rew0', 'netdev': 'hn0', 'queue': 'rx', 'indev': 'compare_out' } } }
-{'execute': 'object-add', 'arguments':{ 'qom-type': 'filter-redirector', 'id': 'redire1', 'props': { 'insert': 'before', 'position': 'id=rew0', 'netdev': 'hn0', 'queue': 'rx', 'outdev': 'compare0' } } }
+{'execute': 'object-add', 'arguments':{ 'qom-type': 'filter-mirror', 'id': 'm0', 'insert': 'before', 'position': 'id=rew0', 'netdev': 'hn0', 'queue': 'tx', 'outdev': 'mirror0' } }
+{'execute': 'object-add', 'arguments':{ 'qom-type': 'filter-redirector', 'id': 'redire0', 'insert': 'before', 'position': 'id=rew0', 'netdev': 'hn0', 'queue': 'rx', 'indev': 'compare_out' } }
+{'execute': 'object-add', 'arguments':{ 'qom-type': 'filter-redirector', 'id': 'redire1', 'insert': 'before', 'position': 'id=rew0', 'netdev': 'hn0', 'queue': 'rx', 'outdev': 'compare0' } }
 {'execute': 'object-add', 'arguments':{ 'qom-type': 'iothread', 'id': 'iothread1' } }
-{'execute': 'object-add', 'arguments':{ 'qom-type': 'colo-compare', 'id': 'comp0', 'props': { 'primary_in': 'compare0-0', 'secondary_in': 'compare1', 'outdev': 'compare_out0', 'iothread': 'iothread1' } } }
+{'execute': 'object-add', 'arguments':{ 'qom-type': 'colo-compare', 'id': 'comp0', 'primary_in': 'compare0-0', 'secondary_in': 'compare1', 'outdev': 'compare_out0', 'iothread': 'iothread1' } }
 
 {'execute': 'migrate-set-capabilities', 'arguments':{ 'capabilities': [ {'capability': 'x-colo', 'state': true } ] } }
 {'execute': 'migrate', 'arguments':{ 'uri': 'tcp:127.0.0.1:9998' } }
-- 
1.8.3.1


