Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C8F49F5C1
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 09:57:30 +0100 (CET)
Received: from localhost ([::1]:36310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDN4T-0003Yv-1E
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 03:57:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hnarukaw@yahoo-corp.jp>)
 id 1nDMkS-0004vN-Tw; Fri, 28 Jan 2022 03:36:54 -0500
Received: from corp-ob07.yahoo-corp.jp ([183.79.94.94]:51872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hnarukaw@yahoo-corp.jp>)
 id 1nDMkO-00081d-Kl; Fri, 28 Jan 2022 03:36:48 -0500
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01lp2113.outbound.protection.outlook.com [104.47.23.113])
 by corp-ob07.yahoo-corp.jp (Postfix) with ESMTPS id EEDBD19FB18B;
 Fri, 28 Jan 2022 17:36:37 +0900 (JST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo-corp.jp;
 s=default; t=1643358998;
 bh=I0FDxeKd2+WSlmADTF33q5rX3GrMcBOMrMvD5phMgL0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=pE81vhFNzzNSEX7H6sWgwVssJxfRbgpHyBOBoHmVj2Hph/KRFwz1FPwsDWnsVYYcI
 X4GRnJZoIorV8o8+9bfi9/2DbWOmY7AHWt3ZBN5qCo0gt6WxnBPvDh8lvPDmJ/txW+
 i7PyaaZhmtAYe2MvPBWBBQ/FlAXPrUHvm+csdOuk=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K2Hm5tDLX+RDaX6TMbFyIhK3iREDWbJGyZNEQWg+xVUYLaaNqhl3k9M+bMiEMbi/27eYl1qJNMJuwGEZxIhjFaj1SXq4W1o6OKdf1dwmKrnjPufi7vMS0MaRS+Ak2UFe77ZoxFVhtyFqAAbD7LVllrLQDt+pWfNwY5yA+ksEjL+SAyXsIsnGd+V7WL+rME+zKaw5zf8KhxiDpUYXPZy2SqsVJJJBGzlztGgWVYAw7xp3xEMEg3VG3N2bMspOw+azxrYHrQXZeneG3DN0PxdqQfgjFC4TX5K4llISrlloj/IbvoQ0XX40hDqZYB3K83omwwEvp3YTf6FuSG1/v7iaXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I0FDxeKd2+WSlmADTF33q5rX3GrMcBOMrMvD5phMgL0=;
 b=Nvwg99oefnIEAPLh7r6e6mdK3G+oXKsMYcwMmk2u4eJq4+EUS0Ty1LTF3IJrll1Zhv2WmAUCyrEd3UWox5xcgVQcVLLGMarbby/PxZrEadobJNs+XrqIRSCKFqs1B4lYS9uZNkWkGXSOl/ZDAjYNeeiiXbo1vczLEYuvqXgsXA9VIAmhxBKZzbXbacErPmuvoGrH9OLe8nLdmCbzLfy99R4V4OwL0lbamKAIHEIaByDWKi0AvjLL3wyGEOXpes46GqHpvsEsMgjYWJecK00kYqTGgFq+FF5cmYp5sdyn3VdeJdIl787cCCB3bCb5ZOzgnjpcKf4bIJeaef6a+C2EzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yjcorp.onmicrosoft.com; s=selector1-yjcorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I0FDxeKd2+WSlmADTF33q5rX3GrMcBOMrMvD5phMgL0=;
 b=tXCT5s+EC6b5zEV/XEq32s2Dq1AptyFnhSl6QAfpXTIY2aiwcnrkHoc0Y/NkTeqBFgnHX52pLoWPF8SPksy4QxXqqeuc3BFSb4UvkAhJosVnBYIp/xQ9oZqbTZ52cxg9FlNufSPDuP88atjaU44isu/9dR8tmfFsancVE3rzVPY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=yahoo-corp.jp;
Received: from TYCPR01MB8357.jpnprd01.prod.outlook.com (2603:1096:400:15f::12)
 by TY2PR01MB3067.jpnprd01.prod.outlook.com (2603:1096:404:74::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.13; Fri, 28 Jan
 2022 08:36:36 +0000
Received: from TYCPR01MB8357.jpnprd01.prod.outlook.com
 ([fe80::a591:fabe:54bc:fb40]) by TYCPR01MB8357.jpnprd01.prod.outlook.com
 ([fe80::a591:fabe:54bc:fb40%4]) with mapi id 15.20.4930.018; Fri, 28 Jan 2022
 08:36:36 +0000
From: Hiroki Narukawa <hnarukaw@yahoo-corp.jp>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/1] util: adjust coroutine pool size to virtio block queue
Date: Fri, 28 Jan 2022 17:36:16 +0900
Message-Id: <20220128083616.6083-2-hnarukaw@yahoo-corp.jp>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220128083616.6083-1-hnarukaw@yahoo-corp.jp>
References: <20220128083616.6083-1-hnarukaw@yahoo-corp.jp>
Content-Type: text/plain
X-ClientProxiedBy: TYWP286CA0013.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::9) To TYCPR01MB8357.jpnprd01.prod.outlook.com
 (2603:1096:400:15f::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7fbfafb5-94a1-470c-7e6b-08d9e2394c08
X-MS-TrafficTypeDiagnostic: TY2PR01MB3067:EE_
X-Microsoft-Antispam-PRVS: <TY2PR01MB306777F48953F9CFCB114DA880229@TY2PR01MB3067.jpnprd01.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:199;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Z3cG1LLuIicqiAQLkfEQn0df3Oy6G9Ni3xjymETmjiPLkNH3XKYNn592AQNpLIqh79KA1n3m4HYrbhTJo/kJMc5corJaqqx1SkE142uk6XJdUnQK1k4MFGhtWjD31v7MN0sg4yuG8FELWFYuei/WJCQly4W7btzNznPrDfXtesdmAT6nwfZ6phjvwTFiYVorjyRgV/VImgCxHVKLuoti3y1DutnAjPp08k9sRwCBOOZikmXNJSaK5sRvtOdopqFsshXpOyI9Nr7H/i/UaoWV/Yy5O9BfjjjRivq4IsF9hnoGL4nIQUlNrP77dm6CNGhjHmPVcCqCj0KtGMrnSM6OxOz67iE4UCVFrwkcWh6MH2yRRWhzT1h2vIy1uqcMddegXJ8mtRupNIqGc9g7K1SjuqURxnMcmlNfhYniDVppvGQAbnRXeAv8zpOjIV2DJI3E3tc3qhHtfJlkxDOk8vinkGuCcP5k7fxuqGHgv2aEdZCTvEiGejjB3/FevH5WzW+yaMrh6gkRlkA2XrOTaQq22gQeBNjzf0imaVFnJfYoUV88+NukhxcTSflwa1VxBxNqAAcTfu2Wl/TaB+Bf/B0tbWxj79Iw3oJH96ys2Ee44aRdb6Mpg6OQyaIe6JiG4bKkfT80pRR809NNEc7SxDqN1BbHmOSTZ/j/9eet/XslyKh8eJkXE6XO811kBPX99I8Yfd3gHRWxk4NQOuSN6ZhrtA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB8357.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6666004)(5660300002)(508600001)(186003)(52116002)(8936002)(36756003)(107886003)(316002)(1076003)(6506007)(26005)(86362001)(4326008)(38350700002)(66476007)(6486002)(38100700002)(83380400001)(82960400001)(2616005)(6916009)(2906002)(6512007)(66556008)(66946007)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?69Gj8log5l+3cNU9BNRtlefTDGriM2l3CB8SqBHKsBkOZcRCZ3IhMWm/P5ib?=
 =?us-ascii?Q?V+U+IvY829PzVmfMUNhkjTevBo4O1qRvSzL5uMBIdn1gko/rroypRttwoEC3?=
 =?us-ascii?Q?x2w3wiZcj3b21yWUMhnOkidBZDPm1L7czr7Kugp5jVZKw45VaDiVzKZWLebe?=
 =?us-ascii?Q?SgCUDb3J6C8XL8ubgt5PM6e8nx1YcYduUQeQf4ICnI3F47pUwdUeIg/hzKro?=
 =?us-ascii?Q?Yjp/7iD7xuUcu1AGAlpd/aqO1gVza0goMKLwVogrdjeOyOdkr52C85xLX4em?=
 =?us-ascii?Q?gETT5GKEpBWPWy7/k32t1AIvGOrzpfwtZVEK5qRzPodb6hSq/x2n8Jd+ZLf6?=
 =?us-ascii?Q?+JFal6KcRJ82dHEAJg0H4+hO9Y33SaGDhlbiPdZp9sn0xRBFxGooIDvC+iWL?=
 =?us-ascii?Q?0gWb2KJyqV+TYHCszbK9pRAgsZCpGgOH8VklbSncfsUfAIzoeQWkAqU9wAKD?=
 =?us-ascii?Q?sXQic6m0XQtfqpce34VN+ji6/DTEy/ewmNCSP2B2wteFLr/O/mDQ+zQuNFRW?=
 =?us-ascii?Q?e7V4X6qFz68p6zKP0C9uUqi9BjfqOgQ8/KWX1CkKQlPMWHtdAF9/5p7fDFrx?=
 =?us-ascii?Q?dtVkI5EXxbPUnC9a64HiV2VOvZgNHV4e1P9NxUiZSTfLzo/v7Maq9vsZAJCH?=
 =?us-ascii?Q?Apqfc0bg+z58TIvWeumnjIwmdmDD3HvBbw3IBqAL/KRdQSl+x+Bjz06rGqiy?=
 =?us-ascii?Q?qmJHT3ShwE6CHhJlA1QR/hplvZtXdNz9CfJ9YventYiwRI2q2gMvcd/dYLBn?=
 =?us-ascii?Q?xCr2GDVimUIap/8ua1H5YavGJKxtOgmeyjqpt5J61Ks6esav+TwQJ2HtMnFd?=
 =?us-ascii?Q?/JXmOjoF3Os4dvQVKrsL4N9GGzQvAzSNKqrOjOBfZMS09253FBzkEbBSsGhc?=
 =?us-ascii?Q?/jpBEonFdnGAnD9HUv3QYsUUiNdQDQD7xip8iSd1twZ89CJ5BgNnbUVFc6ku?=
 =?us-ascii?Q?vAfpUKYTRsJmmH5yyWjLhia1kjTUxGivQAlruPSvfo6t/N7hXW2cW2uQIBVC?=
 =?us-ascii?Q?9ooeWLcGPboaaKKNxeNUhKSedSzvB2N/PGbDnSxtWzexoFN5U0/EC4iyvMAk?=
 =?us-ascii?Q?4kP33AiY0igQtS0kkDsIp3KVE2oMnDGmhoiVPF329gq77NCMCWW36gZEFW9n?=
 =?us-ascii?Q?jnQeXx6LDYA5bpgIjcNHiEMIFHS7s45XoNKkIuON3IgFECJNfNX9oVM7iSvx?=
 =?us-ascii?Q?JOV2gDYUQEXHqx5CfQnbeW8rTdGfR2Kh2PBHRc4Plra2Ns0Xcbs4iAO5DDFk?=
 =?us-ascii?Q?3hNhouuPmsPdNfDLeYxaA5CEjrO7vwS9Rgz/hlhitOs5fcFKUUd8FXfFKtiq?=
 =?us-ascii?Q?CWf/KmJGaYEMsP/wMJopDA6C/7Q+NYqhPVpH64HWJzhKpiDiJk24vuzq1MpP?=
 =?us-ascii?Q?G9bYTpZfAd2hBaFBiP+4rECtBpzvObwuaOs5mhsf5y9rowTIXDa6L5CpRHkw?=
 =?us-ascii?Q?5ZAdcWBnxdPCVnIMI2M/YKM3dE4CmUYnbPudmhLk08ZXywMPg1gSRQy5QK11?=
 =?us-ascii?Q?X+o6khaYDXV0UDjzDnrs/X8ur8GJd43rYuI8Ctb+HA4IbASGEB2wgJjt5gzO?=
 =?us-ascii?Q?AvuTp5AHEAIhTPKZI0XoIDQObg38wFShAbruSSD8PLsgHwvNIHrMRuSk4eyV?=
 =?us-ascii?Q?m9cT/SwKjlhhh//Vcjt+3l4=3D?=
X-OriginatorOrg: yahoo-corp.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fbfafb5-94a1-470c-7e6b-08d9e2394c08
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB8357.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2022 08:36:36.8640 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a208d369-cd4e-4f87-b119-98eaf31df2c3
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cgNJHJ7H3chI/jMJqpehGYu8HGBfG3owiDcQ9PtUb6b0c4ZQrEu5ZJiicUbusSLZlgq3+Vt2uIte1aUf7Xhypw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB3067
Received-SPF: pass client-ip=183.79.94.94; envelope-from=hnarukaw@yahoo-corp.jp;
 helo=corp-ob07.yahoo-corp.jp
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

Coroutine pool size was 64 from long ago, and the basis was organized in the commit message in c740ad92.

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


