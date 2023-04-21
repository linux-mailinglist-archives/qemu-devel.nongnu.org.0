Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F116EA9B6
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 13:55:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pppKy-0006TM-1H; Fri, 21 Apr 2023 07:54:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pppKq-0006Rb-De; Fri, 21 Apr 2023 07:53:53 -0400
Received: from forwardcorp1b.mail.yandex.net
 ([2a02:6b8:c02:900:1:45:d181:df01])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pppKo-0003w9-0A; Fri, 21 Apr 2023 07:53:51 -0400
Received: from mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net
 [IPv6:2a02:6b8:c0c:7f29:0:640:9a2b:0])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id 44C5760158;
 Fri, 21 Apr 2023 14:53:40 +0300 (MSK)
Received: from vsementsov-nix.yandex.net (unknown [2a02:6b8:b081:8816::1:4])
 by mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id SrdkeT1Ona60-cJ2s3p8S; Fri, 21 Apr 2023 14:53:39 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1682078019; bh=zidTqHQDSeGoRL45IyOf6Jp+NDoR25n0vUblGZJ32TI=;
 h=Message-Id:Date:In-Reply-To:Cc:Subject:References:To:From;
 b=axq9USz/LihBgx49jyVUQT+3cUPVOWzOyk7AbgGw/fcLcsCM//9Z0j+T1aRQKi4A+
 750pywgNhjY+FkR3U5yTwRPkzd1Hv/eTw1R2U6lH+635kPvlBujaGxCBJI81CslScH
 +SSyE5Tm6eRw2F/AZ3jfsn7zFmjQCaVsmwaWxaWk=
Authentication-Results: mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, kwolf@redhat.com, den@openvz.org,
 alexander.ivanov@virtuozzo.com,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Subject: [PATCH v8 2/5] blockdev: transactions: rename some things
Date: Fri, 21 Apr 2023 14:53:24 +0300
Message-Id: <20230421115327.907104-3-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230421115327.907104-1-vsementsov@yandex-team.ru>
References: <20230421115327.907104-1-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:c02:900:1:45:d181:df01;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1b.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Look at qmp_transaction(): dev_list is not obvious name for list of
actions. Let's look at qapi spec, this argument is "actions". Let's
follow the common practice of using same argument names in qapi scheme
and code.

To be honest, rename props to properties for same reason.

Next, we have to rename global map of actions, to not conflict with new
name for function argument.

Rename also dev_entry loop variable accordingly to new name of the
list.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 blockdev.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/blockdev.c b/blockdev.c
index 293f6a958e..2174ab2694 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -2289,7 +2289,7 @@ static void abort_commit(void *opaque)
     g_assert_not_reached(); /* this action never succeeds */
 }
 
-static const BlkActionOps actions[] = {
+static const BlkActionOps actions_map[] = {
     [TRANSACTION_ACTION_KIND_BLOCKDEV_SNAPSHOT] = {
         .instance_size = sizeof(ExternalSnapshotState),
         .action  = external_snapshot_action,
@@ -2371,12 +2371,12 @@ static TransactionProperties *get_transaction_properties(
  *
  * Always run under BQL.
  */
-void qmp_transaction(TransactionActionList *dev_list,
-                     struct TransactionProperties *props,
+void qmp_transaction(TransactionActionList *actions,
+                     struct TransactionProperties *properties,
                      Error **errp)
 {
-    TransactionActionList *dev_entry = dev_list;
-    bool has_props = !!props;
+    TransactionActionList *act = actions;
+    bool has_properties = !!properties;
     JobTxn *block_job_txn = NULL;
     Error *local_err = NULL;
     Transaction *tran = tran_new();
@@ -2386,8 +2386,8 @@ void qmp_transaction(TransactionActionList *dev_list,
     /* Does this transaction get canceled as a group on failure?
      * If not, we don't really need to make a JobTxn.
      */
-    props = get_transaction_properties(props);
-    if (props->completion_mode != ACTION_COMPLETION_MODE_INDIVIDUAL) {
+    properties = get_transaction_properties(properties);
+    if (properties->completion_mode != ACTION_COMPLETION_MODE_INDIVIDUAL) {
         block_job_txn = job_txn_new();
     }
 
@@ -2395,24 +2395,24 @@ void qmp_transaction(TransactionActionList *dev_list,
     bdrv_drain_all();
 
     /* We don't do anything in this loop that commits us to the operations */
-    while (NULL != dev_entry) {
+    while (NULL != act) {
         TransactionAction *dev_info = NULL;
         const BlkActionOps *ops;
         BlkActionState *state;
 
-        dev_info = dev_entry->value;
-        dev_entry = dev_entry->next;
+        dev_info = act->value;
+        act = act->next;
 
-        assert(dev_info->type < ARRAY_SIZE(actions));
+        assert(dev_info->type < ARRAY_SIZE(actions_map));
 
-        ops = &actions[dev_info->type];
+        ops = &actions_map[dev_info->type];
         assert(ops->instance_size > 0);
 
         state = g_malloc0(ops->instance_size);
         state->ops = ops;
         state->action = dev_info;
         state->block_job_txn = block_job_txn;
-        state->txn_props = props;
+        state->txn_props = properties;
 
         state->ops->action(state, tran, &local_err);
         if (local_err) {
@@ -2430,8 +2430,8 @@ delete_and_fail:
     /* failure, and it is all-or-none; roll back all operations */
     tran_abort(tran);
 exit:
-    if (!has_props) {
-        qapi_free_TransactionProperties(props);
+    if (!has_properties) {
+        qapi_free_TransactionProperties(properties);
     }
     job_txn_unref(block_job_txn);
 }
-- 
2.34.1


