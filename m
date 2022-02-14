Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C3AE4B4F78
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 12:56:52 +0100 (CET)
Received: from localhost ([::1]:41392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJZyN-0008AY-OY
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 06:56:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hnarukaw@yahoo-corp.jp>)
 id 1nJZv3-0005AA-32; Mon, 14 Feb 2022 06:53:25 -0500
Received: from corp-ob10.yahoo-corp.jp ([182.22.125.210]:50640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hnarukaw@yahoo-corp.jp>)
 id 1nJZv0-0004aJ-8E; Mon, 14 Feb 2022 06:53:24 -0500
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01lp2174.outbound.protection.outlook.com [104.47.23.174])
 by corp-ob10.yahoo-corp.jp (Postfix) with ESMTPS id 0B83919FB18A;
 Mon, 14 Feb 2022 20:53:15 +0900 (JST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo-corp.jp;
 s=default; t=1644839595;
 bh=ok+Qs7NuFr97SqhS8PI68rvTFfqlb94RzGDJQmcrxag=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=Z+47hVbP8cGYccXDkv3k02qqgv0bTBOZTyV9bRHEoEJNgk9YEr2U7eRxjZ88mhqOp
 0uXGjtVukn1GdhTqxgT8paehg3DSUTqQsviQIOn4BgnPSg5IeOBO5iiBTriJw2lGoo
 yvOv99dTwdor2ZUciUtmfuKKxZgxbWPSBjqtJsOY=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V1T04flGdVCILpBNFxuIwgjoca3bJlWZzYREgwaIWps0PV34BBBm9g0Hyg5N6Kkk4nInLKkClSnvYX7vmw6HbWkFTgI6iPOHOQiUbqUZnInnD0/qp/Zxpx66tVCxuziMmvx+fuTLhyFwnDa9kwZIH6QT5/1nrKVN/xR15CLCFSdkGE+MmPQo7pByILs+noU3ZFWCJW4rUzm9G1HfPUfyPq9ONVfTeVC7MsgBSEibARx5a0mVmOhWFFbnf9WWk77Cov0I2R9bbFkIuvE5srpiN8SthhgWkkKo1RZJNpeESu2O3DPz/Re4Y13oDljiff0e5oA5CSyTSuwSwzVhXFlBcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ok+Qs7NuFr97SqhS8PI68rvTFfqlb94RzGDJQmcrxag=;
 b=obI0QpoBBzG+Jh89K1xBBnRI0TPfKfcRq5WPGqKe2AKhYRPMEYad34cMLFqtY8Pti1HqP0Mt1Zx+xkz3AwACvUUGvjULBS8hn+jEOIL104MpxNbkPIjiMZGkSloLslztCvFpv4a9H8OFU6uTKDTJCsb9GKrJLxy09Pij+m6tQGg3wB7o84P678K8EHZ1wdf+u4rV3t6lHHJelVwqlW6L95adnPKqgbj8YyBOJoD/yCiE0b6FM7SV/kEeHwmoBdtRe+RHWb5qAJUU1m+a2bC2vctLcOzkr3i7rKYexx9iLwy1q+g54xnVCQA9i94gYdEBZStPGA67lZGo3EWXjpN93A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yjcorp.onmicrosoft.com; s=selector1-yjcorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ok+Qs7NuFr97SqhS8PI68rvTFfqlb94RzGDJQmcrxag=;
 b=sjy7a94DVt0+RotBYkQlx567u8pu32vqB8M9tf+E+U8k9MIv16GS9SnzQPct8P2Pq9L85So7SZx4Yf9vZpNHcKrTfYmIEF5Q9FDleCAQKmR3KTqxI4VfBEQ/0+ewJUkErPH/LDlmkOx7c+gXKYdLCuJKqj+nw2bXqftKqo69nX0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=yahoo-corp.jp;
Received: from TYCPR01MB8357.jpnprd01.prod.outlook.com (2603:1096:400:15f::12)
 by OSZPR01MB6889.jpnprd01.prod.outlook.com (2603:1096:604:132::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.14; Mon, 14 Feb
 2022 11:53:14 +0000
Received: from TYCPR01MB8357.jpnprd01.prod.outlook.com
 ([fe80::a591:fabe:54bc:fb40]) by TYCPR01MB8357.jpnprd01.prod.outlook.com
 ([fe80::a591:fabe:54bc:fb40%3]) with mapi id 15.20.4975.015; Mon, 14 Feb 2022
 11:53:14 +0000
From: Hiroki Narukawa <hnarukaw@yahoo-corp.jp>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 1/1] util: adjust coroutine pool size to virtio block queue
Date: Mon, 14 Feb 2022 20:53:02 +0900
Message-Id: <20220214115302.13294-2-hnarukaw@yahoo-corp.jp>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220214115302.13294-1-hnarukaw@yahoo-corp.jp>
References: <20220214115302.13294-1-hnarukaw@yahoo-corp.jp>
Content-Type: text/plain
X-ClientProxiedBy: TYWPR01CA0007.jpnprd01.prod.outlook.com
 (2603:1096:400:a9::12) To TYCPR01MB8357.jpnprd01.prod.outlook.com
 (2603:1096:400:15f::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: deab5041-849e-47bf-e214-08d9efb094e7
X-MS-TrafficTypeDiagnostic: OSZPR01MB6889:EE_
X-Microsoft-Antispam-PRVS: <OSZPR01MB68899D9B13366D6F3FE362EA80339@OSZPR01MB6889.jpnprd01.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:199;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vjzvD5gmO/+vCkrnP5/zBsvL/2xLVFcyvKf0wufh/o34KQGiWV2wjkF/wk3Jc1ovCX446IUqfIAYcerC4CJwkA6RUMlIpO6KCFri0wDJWPhzzvm2QSmdotVKE6DSdwBo9R12DMOsHfKbI8q4y7N+8zAhlNeauHjTEH5cGFTlgePWgJ6mYXyk8mbqSq6/oSeTa9tOUUuU9/EcxeF9SmZVV+3v8NMdyejeNf9+/043k1of+RCIlYZ9ADsDj5BJYLAuUhsh4INjPRyvCGgIuY0+O5vJuEqaHZtt+GiLvVO+A3PPQigHF7X3ZK4v0LsFTQB3PO4s1rPNWuhjPdVYqI6zyCdt7vLi2BoHWKrha4e7x0EWPeki0KdzdDDrBWleX0fOhlPGkE4s7lJvfPJ+97F0x/OvdpIWmT6T6mhpANhxGB8Tyne5zWH8+vQdC2XOSasxmeKnZTnK6y3NMESXZUbJqPq7t7mx/c+GbJskCUkxP4q627Twand4qHr7jONzUVCTVLkBSZ3RY8kYv45Wd7Ef3OO+W0G+Jl48vQMrYjx1MvRPdxXKAQsMYA48ONNq9tEZt+viPTB6MqH/qZzH4IWH5TOzUSraXPLdECsE5sW0MHx5rejUKC8SVKFKgneCO6x7lZGYEG+vaNkPJH2J98AZXWU0YW6c50wdQXFOhs1XpvE0QqpQa2TNdpOspPAWrF80fK4E0QflYISChLXjA7Xx/Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB8357.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(36756003)(82960400001)(6916009)(316002)(66556008)(66476007)(38100700002)(5660300002)(38350700002)(4326008)(8676002)(86362001)(6486002)(508600001)(26005)(2616005)(107886003)(2906002)(1076003)(52116002)(8936002)(66946007)(83380400001)(186003)(6512007)(6666004)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qBISeM/Kd+nY0dB9CVrSkj2+UudMlkSDq5WmsSLLvl07C6iSo6Ah9mZj87gR?=
 =?us-ascii?Q?erzRjLATgOA55+0wo49Im1qyt4iBVI5qcfm4uPVwY4DSmUenYkVWS0ehhI0X?=
 =?us-ascii?Q?90CA70PgnS14MZTebVGZKq4vjaDTtj2F9idVqwUbV926fneOo3sBFSfGCyRq?=
 =?us-ascii?Q?8Gk0+ZAXa+t/c/eB2MXqIIqdt6o2cGw8F21u8qvC9fC+e5RMdBEyeR0x2iZT?=
 =?us-ascii?Q?bQ38Nbf2GOLxQ9KQJq1qbYXv/ES7DA5GQX+eO8krmIBunUX4VHYLfv9NKmED?=
 =?us-ascii?Q?iN9g8nz5kSkYy/rcCe5ewQPsZLqDtnFjAYQuF9KNNKM2u23TlD0LsCG46X6d?=
 =?us-ascii?Q?g7hstr5Mb+PFGKHUlrqogn+EJ18MZGSbeqKKGLF5Urxo/cXuWch1EosM0qdP?=
 =?us-ascii?Q?UC+ZR44QAJ6TGDRHviT2M11HJuVms8UyqVG4mbWhcxPWqs3cN3of21Q4OOlM?=
 =?us-ascii?Q?UXFZo3p8VOIMdYE2Ec0ZSfKI9nLtjr2jtj2KTVW1lh7uw7p2UYbyzhucuSSG?=
 =?us-ascii?Q?ZqfEbpE7IgcHtrmXmzL1U1m4YxVSWZNmq8o6zytVOTWqpcWBtihPeh2Undrt?=
 =?us-ascii?Q?Pl8IqXTASP2W42hjpwNSeMNosCEvI0mUTQO/2RxjbA4+99fpwypQwOaLYgvz?=
 =?us-ascii?Q?CFTYojnAeo7juSseuokvPZ85gU0GoGaZhlgpb583XYKxbhuzUsj+vhs4hHzC?=
 =?us-ascii?Q?G5yq+RAY30meHSP8BCH0rRMi/+W56PdPISpQtKo1+aZfdNKuoROIMtFqCo8K?=
 =?us-ascii?Q?zOQOgsbajgUbQYVGT42qZBZOEs35ddSGaPYfSUHzCmFnD/HS7p7wYJATcDrm?=
 =?us-ascii?Q?TIXjaFeCqD7z5mk7Pp54iBj+tPeuC5+EEYvZgN3a7kpBGx/74KjsY+HOwoqT?=
 =?us-ascii?Q?MjgmTuZ1XMLiUnz5v72QyBQcdsW9TvPkYnvY2sethH8dC6JJHt/qrL2iBTAA?=
 =?us-ascii?Q?oIuj36MJcaOfvIgmBllO66vm1egZ65dHTFSdQFt5KrSgxn9/yayQRV0UnvAF?=
 =?us-ascii?Q?qsxMi9AZhFiCIu0qoSEgwit0adqyCy4cEdiyV+mMPt0B9yDwm7ySNtRxhDjc?=
 =?us-ascii?Q?6dsPumiLPtIHv9MoP/SEGsD2EufNKKIrMGkqQf+2qdtLRMubY6700eWfdsjT?=
 =?us-ascii?Q?v4ls6aK+4otYarO8JUT1iiyXXJRp31vRxCCr4eOiETLSq2IJ4PLJ3O3315/o?=
 =?us-ascii?Q?avlEcrghdygZkFRj20wsufkZsWB8n8yRc5Zesd4r5j3rpvVAwD8av289bV2h?=
 =?us-ascii?Q?BKkg2mTLkobkFuDD/lN30/FhCyWKySzA0iFBeVvmvgrMrKCA+FcGs/wTmJjC?=
 =?us-ascii?Q?8Oc6jBijPCCWKQeIVsZcR7JsiiZ5I7UQBgN56yqbHIoJzmTk8HFRFoCjxjq0?=
 =?us-ascii?Q?2n3aMm2CkQWothJX4igmqPhf+bG34qn1pPybATEBu3FnA8KcCFUGwococQgB?=
 =?us-ascii?Q?9w3kBB0SYY1IH8Wpv7fuT+IokTBGy5st/K5SjhN6dpzZqGVOXC3SIrnOGCfF?=
 =?us-ascii?Q?8gw+PhwdBELUquOr2OyX27dFdReN0E8N3XGUEOhL9gb6+iSpiDr1yIdMjPNC?=
 =?us-ascii?Q?unRxOSf/rshvaaBrt1wrxJ2k9Wh10wALUy6MLLdbLHdwio0+CCq6yzXWoI+U?=
 =?us-ascii?Q?u/kinrJwWRCATCGOJU0Z30U=3D?=
X-OriginatorOrg: yahoo-corp.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: deab5041-849e-47bf-e214-08d9efb094e7
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB8357.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2022 11:53:14.2236 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a208d369-cd4e-4f87-b119-98eaf31df2c3
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hrfO1TM26Na6ixA7nOZMMMhtN6hFBbBP9VX9L3b3hzonJvCkLiDEREq64ncyTttFux/iLgYrSMIJ17hki0FvtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB6889
Received-SPF: pass client-ip=182.22.125.210;
 envelope-from=hnarukaw@yahoo-corp.jp; helo=corp-ob10.yahoo-corp.jp
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, Hiroki Narukawa <hnarukaw@yahoo-corp.jp>,
 qemu-block@nongnu.org, mst@redhat.com, f4bug@amsat.org, hreitz@redhat.com,
 stefanha@redhat.com, aoiwa@yahoo-corp.jp
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Coroutine pool size was 64 from long ago, and the basis was organized in the commit message in 4d68e86b.

At that time, virtio-blk queue-size and num-queue were not configuable, and equivalent values were 128 and 1.

Coroutine pool size 64 was fine then.

Later queue-size and num-queue got configuable, and default values were increased.

Coroutine pool with size 64 exhausts frequently with random disk IO in new size, and slows down.

This commit adjusts coroutine pool size adaptively with new values.

This commit adds 64 by default, but now coroutine is not only for block devices,

and is not too much burdon comparing with new default.

pool size of 128 * vCPUs.

Signed-off-by: Hiroki Narukawa <hnarukaw@yahoo-corp.jp>
---
 hw/block/virtio-blk.c    |  5 +++++
 include/qemu/coroutine.h | 10 ++++++++++
 util/qemu-coroutine.c    | 20 ++++++++++++++++----
 3 files changed, 31 insertions(+), 4 deletions(-)

diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
index 82676cdd01..540c38f829 100644
--- a/hw/block/virtio-blk.c
+++ b/hw/block/virtio-blk.c
@@ -32,6 +32,7 @@
 #include "hw/virtio/virtio-bus.h"
 #include "migration/qemu-file-types.h"
 #include "hw/virtio/virtio-access.h"
+#include "qemu/coroutine.h"
 
 /* Config size before the discard support (hide associated config fields) */
 #define VIRTIO_BLK_CFG_SIZE offsetof(struct virtio_blk_config, \
@@ -1214,6 +1215,8 @@ static void virtio_blk_device_realize(DeviceState *dev, Error **errp)
     for (i = 0; i < conf->num_queues; i++) {
         virtio_add_queue(vdev, conf->queue_size, virtio_blk_handle_output);
     }
+    qemu_coroutine_increase_pool_batch_size(conf->num_queues * conf->queue_size
+                                            / 2);
     virtio_blk_data_plane_create(vdev, conf, &s->dataplane, &err);
     if (err != NULL) {
         error_propagate(errp, err);
@@ -1250,6 +1253,8 @@ static void virtio_blk_device_unrealize(DeviceState *dev)
     for (i = 0; i < conf->num_queues; i++) {
         virtio_del_queue(vdev, i);
     }
+    qemu_coroutine_decrease_pool_batch_size(conf->num_queues * conf->queue_size
+                                            / 2);
     qemu_del_vm_change_state_handler(s->change);
     blockdev_mark_auto_del(s->blk);
     virtio_cleanup(vdev);
diff --git a/include/qemu/coroutine.h b/include/qemu/coroutine.h
index 4829ff373d..c828a95ee0 100644
--- a/include/qemu/coroutine.h
+++ b/include/qemu/coroutine.h
@@ -331,6 +331,16 @@ void qemu_co_sleep_wake(QemuCoSleep *w);
  */
 void coroutine_fn yield_until_fd_readable(int fd);
 
+/**
+ * Increase coroutine pool size
+ */
+void qemu_coroutine_increase_pool_batch_size(unsigned int additional_pool_size);
+
+/**
+ * Devcrease coroutine pool size
+ */
+void qemu_coroutine_decrease_pool_batch_size(unsigned int additional_pool_size);
+
 #include "qemu/lockable.h"
 
 #endif /* QEMU_COROUTINE_H */
diff --git a/util/qemu-coroutine.c b/util/qemu-coroutine.c
index 38fb6d3084..c03b2422ff 100644
--- a/util/qemu-coroutine.c
+++ b/util/qemu-coroutine.c
@@ -20,12 +20,14 @@
 #include "qemu/coroutine_int.h"
 #include "block/aio.h"
 
+/** Initial batch size is 64, and is increased on demand */
 enum {
-    POOL_BATCH_SIZE = 64,
+    POOL_INITIAL_BATCH_SIZE = 64,
 };
 
 /** Free list to speed up creation */
 static QSLIST_HEAD(, Coroutine) release_pool = QSLIST_HEAD_INITIALIZER(pool);
+static unsigned int pool_batch_size = POOL_INITIAL_BATCH_SIZE;
 static unsigned int release_pool_size;
 static __thread QSLIST_HEAD(, Coroutine) alloc_pool = QSLIST_HEAD_INITIALIZER(pool);
 static __thread unsigned int alloc_pool_size;
@@ -49,7 +51,7 @@ Coroutine *qemu_coroutine_create(CoroutineEntry *entry, void *opaque)
     if (CONFIG_COROUTINE_POOL) {
         co = QSLIST_FIRST(&alloc_pool);
         if (!co) {
-            if (release_pool_size > POOL_BATCH_SIZE) {
+            if (release_pool_size > qatomic_read(&pool_batch_size)) {
                 /* Slow path; a good place to register the destructor, too.  */
                 if (!coroutine_pool_cleanup_notifier.notify) {
                     coroutine_pool_cleanup_notifier.notify = coroutine_pool_cleanup;
@@ -86,12 +88,12 @@ static void coroutine_delete(Coroutine *co)
     co->caller = NULL;
 
     if (CONFIG_COROUTINE_POOL) {
-        if (release_pool_size < POOL_BATCH_SIZE * 2) {
+        if (release_pool_size < qatomic_read(&pool_batch_size) * 2) {
             QSLIST_INSERT_HEAD_ATOMIC(&release_pool, co, pool_next);
             qatomic_inc(&release_pool_size);
             return;
         }
-        if (alloc_pool_size < POOL_BATCH_SIZE) {
+        if (alloc_pool_size < qatomic_read(&pool_batch_size)) {
             QSLIST_INSERT_HEAD(&alloc_pool, co, pool_next);
             alloc_pool_size++;
             return;
@@ -202,3 +204,13 @@ AioContext *coroutine_fn qemu_coroutine_get_aio_context(Coroutine *co)
 {
     return co->ctx;
 }
+
+void qemu_coroutine_increase_pool_batch_size(unsigned int additional_pool_size)
+{
+    qatomic_add(&pool_batch_size, additional_pool_size);
+}
+
+void qemu_coroutine_decrease_pool_batch_size(unsigned int removing_pool_size)
+{
+    qatomic_sub(&pool_batch_size, removing_pool_size);
+}
-- 
2.17.1


