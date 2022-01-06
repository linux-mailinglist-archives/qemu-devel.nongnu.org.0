Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01BF548616A
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 09:26:00 +0100 (CET)
Received: from localhost ([::1]:38600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5O5v-000720-3U
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 03:25:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hnarukaw@yahoo-corp.jp>)
 id 1n5O1p-0003XQ-KY
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 03:21:46 -0500
Received: from corp-ob09.yahoo-corp.jp ([182.22.125.216]:59164)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hnarukaw@yahoo-corp.jp>)
 id 1n5O1m-0002dn-3b
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 03:21:45 -0500
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01lp2171.outbound.protection.outlook.com [104.47.23.171])
 by corp-ob09.yahoo-corp.jp (Postfix) with ESMTPS id 723F719FAD59
 for <qemu-devel@nongnu.org>; Thu,  6 Jan 2022 17:21:36 +0900 (JST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo-corp.jp;
 s=default; t=1641457296;
 bh=rN+47ZvRp3jfwm+KFTeWehr1qQG5F9ozm2qz79ORn2M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=IYlwrdprKkJTpafaS3rctESnoqQ709yK7hWQ08ybhEb7nNLffnRdBLEyb+W8Yx3LP
 P3Yx+i0PHdf+md8swMBnSEFjZBeIUpHwvt3bkQ4TGI0Cc0jJLLvimARufhlnx0QoIM
 DSnjthp+xxge/PEHIzY+rWiaT4As+VppjonEePRk=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YX+8Zb3leamKRa7lvCUnV5RnA+YGYFKJgngG0WW6dqmxo44Vni3xseW6eOyw9Tz/LKMj40Kq7gAc5pMSeDsoM659RCzO2dEJ8M+AOWqbBaIK6WUFm4NtHDNreHd2rYc5/4Evnh2RSiy0fv1NskKgYKqfgYbIn57Q/kb1BtKpG+MOcCTEWVb4DRJFd2CxowfCABu0NcLa6Iv8r6jSsuChocawgHczpXFpyp7pDg2a8DQBzKYvBis5vzXSfx57kal/6yuc6PhzCVaKP/+Jz+nJZGvHOnFRuRIsNkb5ABNyGY76izkMLiRk5bq8EWpkCyTmhex6M64FLfbrGiR7qo60vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rN+47ZvRp3jfwm+KFTeWehr1qQG5F9ozm2qz79ORn2M=;
 b=giwhBBnDFhr1dTHIcV6oRCgMkVi2t1uZtEGzMEOCouO535+8g033cTQ5IavD66Q2aPmO1wBf1/Veg9X+LED+jtSCAkuPfo5SCchvawK8YNz23MhRACZ/ioT2eglBvJVo48b/RQjJeQdzEF0HNyI/HRclsXRuaMrufVXYJiH3XwI6rn//EmrsIZXTjhKP4z5wENTSGSXi2uNlVMvl1Fy1B4H294CZlxOjyoRJE5pT7igcOGesgEx6MttkGEf1Cp3xyHI1m2yY7CCOB0fYMNZKnymhPgqhqd6IfKRp25Z9HG/AGNACUnd/rbAEn1cUwPh4Z5zLuGKwndFBArBqOE2zlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=yahoo-corp.jp; dmarc=pass action=none
 header.from=yahoo-corp.jp; dkim=pass header.d=yahoo-corp.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yjcorp.onmicrosoft.com; s=selector1-yjcorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rN+47ZvRp3jfwm+KFTeWehr1qQG5F9ozm2qz79ORn2M=;
 b=bLD7O5N6VWftARcl9ygsxL/xNU5AopuZqzb//zoFt2R1s1i6t/aogfrI++gYCdeZx/GAgrsLDxuWHQkAwwbn56D8Lm6lSfSTXatSp8rbeis5xwtbzvynHp1m65p32zRpiPxioNnN1KhzLbjZGtUrLifcIaC/9Ff4yAv8ZkXJ3C0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=yahoo-corp.jp;
Received: from TYCPR01MB8357.jpnprd01.prod.outlook.com (2603:1096:400:15f::12)
 by TYCPR01MB7412.jpnprd01.prod.outlook.com (2603:1096:400:f5::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9; Thu, 6 Jan
 2022 08:21:35 +0000
Received: from TYCPR01MB8357.jpnprd01.prod.outlook.com
 ([fe80::c0df:298:f41f:49fc]) by TYCPR01MB8357.jpnprd01.prod.outlook.com
 ([fe80::c0df:298:f41f:49fc%6]) with mapi id 15.20.4823.018; Thu, 6 Jan 2022
 08:21:35 +0000
From: Hiroki Narukawa <hnarukaw@yahoo-corp.jp>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/1] util: adjust coroutine pool size to virtio block queue
Date: Thu,  6 Jan 2022 17:20:57 +0900
Message-Id: <20220106082057.968-2-hnarukaw@yahoo-corp.jp>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220106082057.968-1-hnarukaw@yahoo-corp.jp>
References: <20220106082057.968-1-hnarukaw@yahoo-corp.jp>
Content-Type: text/plain
X-ClientProxiedBy: TY2PR02CA0022.apcprd02.prod.outlook.com
 (2603:1096:404:56::34) To TYCPR01MB8357.jpnprd01.prod.outlook.com
 (2603:1096:400:15f::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8507d8fb-ebe9-4542-6dfd-08d9d0ed8dbd
X-MS-TrafficTypeDiagnostic: TYCPR01MB7412:EE_
X-Microsoft-Antispam-PRVS: <TYCPR01MB7412E8011C0F59EDE3165D25804C9@TYCPR01MB7412.jpnprd01.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1468;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QqKJEselkVJ7tAeDpi5DF2hQsGoN+8rOM0aZuAyoqmUa25JYQPjuE6laH3RWoqSsUsngeKUMqxExuKuKcyTQ205UKx9H1K3hjyU7KLy5M/3roUCA556NJN59/cHjRoFTAqeAcN5OyBhJn0c0pgwlFzBgHB9DATrQ2oPIFFCBRVQLEXrQxHksdN8Z4MoSBGM9lB5WcRl7NIplzOnOEdBqM4Sn8XD2ITuCGKOkBUU95mLkHsLo61kuSiXsYTCjnm8GRotDV2q8xSGx7enEt3+mn5dnkFVtG6V9tib8eXXLhPLMGLEOyXWGdC6EDBYoQaQvmXYtLdLwaPceuyydTIGod91u+FnUKnR0PA18hC3WHspo8OXnld30EjuxeT8K8BGPNay6k5tmNTrLas/Yaqocom2Z+42hzgEbt8NK+jhd5fhtSaMKWh6hGtMuoIrS3hmOT55PjmvIoAvqXRWONzo7EQmvDckqKdsVRCuZJqGEGewtSsWYIkDMWwnIHc+rqbHM27FimGrpSb+fFm5EitGnA563aNEIAaoBpebULEBejI46o8pLIZGvttuKaoJJEp50b2hLdxc+ymfXpea3WR/U1fEaFYcnWGDQ/LOpo+PeVh7W2XkP0Na4ygGoFEHpfvOT+yqyYkegeAQdeHYBdw5bbplR1UbVffmSaDWRHkVlzfuLVVeTp2RgIbfmNpmYkPnt1FVANYiSPgF9zwBAn9MhpA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB8357.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8936002)(8676002)(83380400001)(5660300002)(508600001)(52116002)(66556008)(66946007)(66476007)(186003)(38100700002)(6916009)(4326008)(86362001)(2616005)(6506007)(1076003)(26005)(6666004)(2906002)(107886003)(316002)(82960400001)(6486002)(38350700002)(36756003)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3Wtjj84UXe4R09opvDW5VB7l2PtMEhw1//YNR8FvpcRJbQSYFoH4ugiVQ9IF?=
 =?us-ascii?Q?42ddi8/HtI9Y04MB+RQF5U4mJeVrYuB9Trg45q/XiXhvEtTTv4uG/FG+ov9d?=
 =?us-ascii?Q?N/yNLVU9NnK/+BhXHhZtbMoIpRSjIUdJnDjYY9gmMPj7KlHWstLz7wjKMAMW?=
 =?us-ascii?Q?aaa+wAIvLBGDNRUbqLh1rH2YkuDwsBAHi+8QmcpcbTerSUiWAe31GzVnEQ69?=
 =?us-ascii?Q?ziroe0sPz6xoQOW7hb9b2h9zCubOQALMki9H9T3CVMELiD5YRQFsy4kJnOjN?=
 =?us-ascii?Q?GT2/4gxdf3taTnjyxPIYLScLJdgMsQIZgTe4v5RjHq16617ov25dxv5sz5ts?=
 =?us-ascii?Q?439MoON3F3mzJ9XmYqVNxp5SoWWCWiW5oImXBNfPP+dfFuIgOIjxtYorrZbm?=
 =?us-ascii?Q?9B6SMkB36Ql7X7cV2E0DumruKNIT5ZJg5/ANIkTj99b2bYhSuDyfqek2wAC9?=
 =?us-ascii?Q?FDYv9O0MPP6B1mWklAKXt0f1c1KYVO8DOCxP9kqivQpBbKKFhSUM+gys9F8B?=
 =?us-ascii?Q?HgybrtprP0f5njCNwqaB38uimIrJze2kjWdVYd5ecsHLqKdLAfXzQyUBKhxM?=
 =?us-ascii?Q?+AhKORrTEMRgsjJ5xeE1o7QjgB8lx16TTSpaQHCBgP1E7F8QbjbQA1gALlpg?=
 =?us-ascii?Q?7SE2yUgHgkRHghxgrBZFEI1sZW6IxWWbnvFsbfpKrBeZPE99C7N+dU4uqJ5r?=
 =?us-ascii?Q?7R0tmdmz4Lv4QwCwqORSaLW1qY54T5XNofVcDBl+nodk1y3JblFLcGnPubdK?=
 =?us-ascii?Q?wC8LnnLgwQ5lqJJkcHs1fzhFSRvS/wZosGtpck/bdxcqWiL7UjIZjwoDv1p8?=
 =?us-ascii?Q?Blw09gEXTP3fJ0vkiY354Snw0wbIr0/UmKEXtdh+KClDieG8rWsi8N76LG/a?=
 =?us-ascii?Q?pesAZc0r4kfXNwSwHh3oem/X3YMxI+y8gwgeDj5dTMTerj/lbJrkH/JdkInC?=
 =?us-ascii?Q?Z+ynXPNxB8VyzwtkLvACpoJtSvxk0tNOfDYwH4Ehgp1f9nyINHmrJoi5rdrd?=
 =?us-ascii?Q?tj2g7T2z+qp3lZCuepmnUQmOZ2B9Lbiu2ki/VZWFOgKRahVjf9EO/yCkatd9?=
 =?us-ascii?Q?OmlKQdqi46crOqxab/NfmIL5isEAUahWSVCLfvkeoU512QI8/QQxs5ijDEUc?=
 =?us-ascii?Q?9UP9fn16Xcm0MO5Dj4oKuVAE+z5LTWvcMUGDYZJuKKzqVCiHeul/UmJlE6Wr?=
 =?us-ascii?Q?qxiQ4xEXqS47BYJgqzA4TW/wk2veOZxDReJaoC1f3gm5ABmPw4TUNEj+Ljwb?=
 =?us-ascii?Q?pqMg0hzko+1fYH2rPXB5b/Nabih8cXR9oL3M3QbJHLTi/oVOm3wV34s8NETH?=
 =?us-ascii?Q?/bOlilfLQjbmscUx6nfw8EzkkCpW6lTsDmkyjNZg4E1WXlhDy3A8K20C8SgT?=
 =?us-ascii?Q?YvVbDPjW96YFMUF6r01UP2UAVDhJpFcDsRUR7Q9OuEQkZwL5Oj7bt5X96LJh?=
 =?us-ascii?Q?sQaLQUGxrP+RiTNbDAuIVw9nTalj0P0tnQBybST/zn7erfPe7wGjPNgd3gGY?=
 =?us-ascii?Q?Z4dRptFjhw8ZsMXBp00W7rtL+UxAmgdTIpDnwgEuZBjyANnVMKJmiDaArZPH?=
 =?us-ascii?Q?j9SyST+cBlHp2Q9UJh/4Rbz4OEtS0fJ0kjEpwZaxLBBD7lHD5qjJunrSEPWQ?=
 =?us-ascii?Q?y8vMWUkpz6eiAqAU4tS/uHQ=3D?=
X-OriginatorOrg: yahoo-corp.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 8507d8fb-ebe9-4542-6dfd-08d9d0ed8dbd
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB8357.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2022 08:21:35.4569 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a208d369-cd4e-4f87-b119-98eaf31df2c3
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Io3eb7GxzlUNcilsCAZwECmf79zacFBMa3n/BZ09K+p8ziXCvgtKDvk1GnyHTN1ZdEfWOxGfWYSOd0tDT8ymrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7412
Received-SPF: pass client-ip=182.22.125.216;
 envelope-from=hnarukaw@yahoo-corp.jp; helo=corp-ob09.yahoo-corp.jp
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: aoiwa@yahoo-corp.jp, Hiroki Narukawa <hnarukaw@yahoo-corp.jp>
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
 hw/block/virtio-blk.c    |  3 +++
 include/qemu/coroutine.h |  5 +++++
 util/qemu-coroutine.c    | 15 +++++++++++----
 3 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
index f139cd7cc9..726dbe14de 100644
--- a/hw/block/virtio-blk.c
+++ b/hw/block/virtio-blk.c
@@ -32,6 +32,7 @@
 #include "hw/virtio/virtio-bus.h"
 #include "migration/qemu-file-types.h"
 #include "hw/virtio/virtio-access.h"
+#include "qemu/coroutine.h"
 
 /* Config size before the discard support (hide associated config fields) */
 #define VIRTIO_BLK_CFG_SIZE offsetof(struct virtio_blk_config, \
@@ -1222,6 +1223,8 @@ static void virtio_blk_device_realize(DeviceState *dev, Error **errp)
     for (i = 0; i < conf->num_queues; i++) {
         virtio_add_queue(vdev, conf->queue_size, virtio_blk_handle_output);
     }
+    qemu_coroutine_increase_pool_batch_size(conf->num_queues * conf->queue_size
+                                            / 2);
     virtio_blk_data_plane_create(vdev, conf, &s->dataplane, &err);
     if (err != NULL) {
         error_propagate(errp, err);
diff --git a/include/qemu/coroutine.h b/include/qemu/coroutine.h
index 4829ff373d..e52ed76ab2 100644
--- a/include/qemu/coroutine.h
+++ b/include/qemu/coroutine.h
@@ -331,6 +331,11 @@ void qemu_co_sleep_wake(QemuCoSleep *w);
  */
 void coroutine_fn yield_until_fd_readable(int fd);
 
+/**
+ * Increase coroutine pool size
+ */
+void qemu_coroutine_increase_pool_batch_size(unsigned int additional_pool_size);
+
 #include "qemu/lockable.h"
 
 #endif /* QEMU_COROUTINE_H */
diff --git a/util/qemu-coroutine.c b/util/qemu-coroutine.c
index 38fb6d3084..080a1e0126 100644
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
+            if (release_pool_size > pool_batch_size) {
                 /* Slow path; a good place to register the destructor, too.  */
                 if (!coroutine_pool_cleanup_notifier.notify) {
                     coroutine_pool_cleanup_notifier.notify = coroutine_pool_cleanup;
@@ -86,12 +88,12 @@ static void coroutine_delete(Coroutine *co)
     co->caller = NULL;
 
     if (CONFIG_COROUTINE_POOL) {
-        if (release_pool_size < POOL_BATCH_SIZE * 2) {
+        if (release_pool_size < pool_batch_size * 2) {
             QSLIST_INSERT_HEAD_ATOMIC(&release_pool, co, pool_next);
             qatomic_inc(&release_pool_size);
             return;
         }
-        if (alloc_pool_size < POOL_BATCH_SIZE) {
+        if (alloc_pool_size < pool_batch_size) {
             QSLIST_INSERT_HEAD(&alloc_pool, co, pool_next);
             alloc_pool_size++;
             return;
@@ -202,3 +204,8 @@ AioContext *coroutine_fn qemu_coroutine_get_aio_context(Coroutine *co)
 {
     return co->ctx;
 }
+
+void qemu_coroutine_increase_pool_batch_size(unsigned int additional_pool_size)
+{
+    qatomic_add(&pool_batch_size, additional_pool_size);
+}
-- 
2.17.1


