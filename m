Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40EE848AA5E
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 10:22:58 +0100 (CET)
Received: from localhost ([::1]:51778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7DMm-0002rB-Ql
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 04:22:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hnarukaw@yahoo-corp.jp>)
 id 1n7DKl-0000at-Fp; Tue, 11 Jan 2022 04:20:51 -0500
Received: from corp-ob08.yahoo-corp.jp ([183.79.94.93]:34200)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hnarukaw@yahoo-corp.jp>)
 id 1n7DKa-0001hI-5J; Tue, 11 Jan 2022 04:20:43 -0500
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01lp2173.outbound.protection.outlook.com [104.47.23.173])
 by corp-ob08.yahoo-corp.jp (Postfix) with ESMTPS id 27ADA19D0ADA;
 Tue, 11 Jan 2022 18:20:33 +0900 (JST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo-corp.jp;
 s=default; t=1641892833;
 bh=D+hi/Z5XzlLhjEPE98rY/jSSYVDpsmZMq0JjXFbL23Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=YtIEM8vTcBuVva0i6sDBKs9E7tyL1R+9v7zBTKl3xfjNRpM35cPPZuLhiJWdDHOsn
 1N86ljdQu+bMv0iuJii+pTLbZI1QrM5WHfVTk6xrIFjGQV7lFop7c0J3LDC9HIuRuA
 csZe+D/Fq/hUKJtzM4iBCNd8EpHTtC5KtF9u0jNk=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nUu0VvHJuJpFs9/KXU7BdyUblNSD90G5zxz7yhDtZDpiJsj2/X2F2uIwG9sTTQtju/PX2gN84aL0t1vW/8bD+Jw5MV8yapltca/SFPlApG0lvTgFlyGwsR7gutOEMmxLGGrCSGFeyHA3vtbsOfj7hZ5vyoVLIVhkauBumIR2Ya/y0Hj6jKqSZupVJ1+Fow+nDhdqU8/2ioVh/0LQeS7+wGVcsRLg8SIIouO0guKPfh+gRKnIRjQ6g8MALEjOXSwMzEhegdXgrehaBfcWUtCsPF2mWuBFfJVvtTVS0D7B6uZaQGknFnXkOWc7ti16+L6z5+0YDMHKn4GPkS+Hnd45pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D+hi/Z5XzlLhjEPE98rY/jSSYVDpsmZMq0JjXFbL23Q=;
 b=aVnIkV4Jac9TvIOMNW2fql9ZD+1xWiNUsjENdGGSmd4vo6sLbgdzbrZaroYVQBJnwS8v4ImCa6A+dfvfXlbT3EFoOqjR5u7vSlVbqEAZqNqjyjhtdV/GfyBtmX6DKS3Bnu8tZmVjlMd1U+LztHcv3MmiSYF1oAeGq490DwTTsYSYPZb9fuWUH1FqE7sEaoqKhHapUyuNNKu7vOeuW0OMI4pwrrbjmum9oieONeh5fQRdf1RwQAgHqLLP2LK6C9BNNugMxN2TL9ZhAuawaP01hxG0w8bynBexg1d5H8BU090PfIpz0J60rqFYId0Pd0FIZyaGA/ht82geENldj9gKdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=yahoo-corp.jp; dmarc=pass action=none
 header.from=yahoo-corp.jp; dkim=pass header.d=yahoo-corp.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yjcorp.onmicrosoft.com; s=selector1-yjcorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D+hi/Z5XzlLhjEPE98rY/jSSYVDpsmZMq0JjXFbL23Q=;
 b=ZRf+Hn4M5OB46Val7aW9U8kIDqqXEpY9jwd+TVpQDmYg3lbNyu+JGEdrW2GIMVFiigNqxMxHHnAyue95AwC9wbdAxzZZXFKmFteTkONnP9ftRpWbuqqAWocgdiRylNn1jaHkcdnSdmpmNcQpLsxzoysttbXEq31TgwoI5/dcxb8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=yahoo-corp.jp;
Received: from TYCPR01MB8357.jpnprd01.prod.outlook.com (2603:1096:400:15f::12)
 by TYWPR01MB8639.jpnprd01.prod.outlook.com (2603:1096:400:13c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.11; Tue, 11 Jan
 2022 09:20:32 +0000
Received: from TYCPR01MB8357.jpnprd01.prod.outlook.com
 ([fe80::d1fe:ed04:219b:afe9]) by TYCPR01MB8357.jpnprd01.prod.outlook.com
 ([fe80::d1fe:ed04:219b:afe9%5]) with mapi id 15.20.4867.011; Tue, 11 Jan 2022
 09:20:32 +0000
From: Hiroki Narukawa <hnarukaw@yahoo-corp.jp>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/1] util: adjust coroutine pool size to virtio block queue
Date: Tue, 11 Jan 2022 18:19:50 +0900
Message-Id: <20220111091950.840-2-hnarukaw@yahoo-corp.jp>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220111091950.840-1-hnarukaw@yahoo-corp.jp>
References: <20220111091950.840-1-hnarukaw@yahoo-corp.jp>
Content-Type: text/plain
X-ClientProxiedBy: TYXPR01CA0066.jpnprd01.prod.outlook.com
 (2603:1096:403:a::36) To TYCPR01MB8357.jpnprd01.prod.outlook.com
 (2603:1096:400:15f::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 91d80fcb-9cae-4cfe-ac21-08d9d4e39df0
X-MS-TrafficTypeDiagnostic: TYWPR01MB8639:EE_
X-Microsoft-Antispam-PRVS: <TYWPR01MB86394C773012553262C9167F80519@TYWPR01MB8639.jpnprd01.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1468;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jA5ZEWtKEwD5MX3x0nTm8D7HqBizelxTIGSYVXGUj/oKDhyzlRYvFImturhDl3S5tiK8ssNqe+srgjZqF/kNK8REughCSGvZPADv5q5/OLLTeiu5VPADcDycCXNOubxgJjOdmD0i8Y1CD3yhM5YjmVetwM4h4lt7RMZqHus+9PkF3wJ3YpWlSOYKCajWLA2ZFQnLWkwoWQCxzP0exsqcQYsHhkiCs1fBIgvNlc3WAx0MQlQ1ACjc9Jkzv1gxWagp+8HWGo2br4SFFG0PJGv+xCdp+UC5UR6O/XBWiNcsKWTyNGiV929s9pVy/nKIufUuHGNozqH1LU+Rf9PEq04NJu7uDzBHM489Awg3XoS4irN6fVcBVOFK4M8WgGFtFJr7eSZhWOFe9QHIH4vPHJONs2x8yzvR2q3qdsUJjQwMjKQhXTazrvoLaMnQusUT7rpBHJXgCqnZGVhKvK3SbZ5KdVI+tiG3Nj9YH555pHH16frFU5z1KAV4MX4E67nbSmmMhECipAPlaxeVq5DVCs3Wn3YBUz1bLoleRnRaEgJJAPXmVo2US07GP6l7j3dEncQi9S7L4YT0I8H0D+T4+0ezej+JJN+IhbhYCgv8LTB2C8iMOeBvoafitbDLhnFcr4atZ3r1aXHztMny1o4sdcEQU7+k9F+mFiLa73lKJ+C87tCQvQQOETs09rrNL3axBqGtBLrW7Nfqzx/T6wb+7R90kw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB8357.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6512007)(508600001)(26005)(186003)(6916009)(6486002)(5660300002)(66556008)(66476007)(2616005)(4326008)(66946007)(107886003)(6506007)(316002)(52116002)(82960400001)(38350700002)(83380400001)(86362001)(8676002)(36756003)(2906002)(6666004)(38100700002)(1076003)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LIdMo05HoOFtiBKjAOZAUP4G6PB2jIHnfj2W54VGF3PG2zc5Q2GLOfLYOrLm?=
 =?us-ascii?Q?yW7QuUNqgAek9QkESHAg1T5UEoS+4jGGElVukc8jbnlDOcAujimkuTbdUi03?=
 =?us-ascii?Q?z6h6RiUMRdeAJaTviTvWdS91ISkY6ufl0JMWInYkhHoKI9awkNAE5Cgn+ME5?=
 =?us-ascii?Q?5v+jdxW4VO5BZKj/dhKUvJ32FxjtcRFLW7agdPmAuuJsrQ1bwPzVnPyNkKV1?=
 =?us-ascii?Q?0Wbrq+Ae6R+aoDJbCvjJ7MFmYbBm+SENy0HndA09yVJpOVxZTOlKXtMhcz9v?=
 =?us-ascii?Q?2yfeo8bLclXI5cJeStygl1rUK33mflcNlir45deXkAfYy/GQe7xix/GbXpiq?=
 =?us-ascii?Q?q2sEISmKGGg1GaMZjQ6URrtpAdCBzXGt6XurBFCHmzWrPzpM4mZXWP2y/SvD?=
 =?us-ascii?Q?Og1C4nlA1frgalqOsHwMdhDvq2vci8h+7TeLuLamAaP6JDzayW6e4uOMdtuh?=
 =?us-ascii?Q?0sTx9oz9cnm87lVBN190s/EBHNVa+4eD3INQvU46nCOVZ6cuL4EBcvxRMR4l?=
 =?us-ascii?Q?IFFdwavp4EtDbNPf+rYy0LuFqjH+Nd7hDqZhC0Xucf63BIPXubWS6VG6zPnU?=
 =?us-ascii?Q?GxjyQJApNU3eWdj5J80nrSpHjdki3bhzGl0dqWB1iVGsayQIlwHb5VNSU+bs?=
 =?us-ascii?Q?Ol2vZ29+LXSgaPjSssiNaDmIhN0nJXofo2XjREJmFk4ApD00AmOnLQR2aoGw?=
 =?us-ascii?Q?U/32WksLqLRgdjYPE8o4VImHa23KZKvPtNLFLcKLhYlBBmqk/OFxp7eVRDIe?=
 =?us-ascii?Q?68I71iWsm+dIkfz24VwoMhgvvgX868zXebe1TRXr67UQvXZTbo9fR4eyOPmv?=
 =?us-ascii?Q?rZBmonngi0YAUuNnPbwiIhrffh32XWpsN3Aa8paCdN7CrAYcYJ0pBaL97Z1d?=
 =?us-ascii?Q?TysjHMMA30j6brOsEpnnDFfpBC6L1ue7wc5sngzvf0TjuP8o/ZMs5kTBXfGG?=
 =?us-ascii?Q?EiNodt6fR83xDrTpNhvMEE1VcSnVzpb9XsFeHHrgvtBRT1lh3j1zaNdcHoyz?=
 =?us-ascii?Q?VBMX+i2jv3YBnqXE+1kA9QMxi1aXNMAVryTcuCPakw9zu/xx7BiUjsl+3gsT?=
 =?us-ascii?Q?6HrI+UGDG9P2OW1Y6S8aDk+fRGHISZHqUvpNhIJ6xSo+WulX1fBYggDEQTni?=
 =?us-ascii?Q?rDO19YK3/vTDTAjK1Sk6xKkLe9Po0Mhj/gZk3XWl37jN7YzDcg15KAN0KlDU?=
 =?us-ascii?Q?8uMKYEAFJxkiPpHfkLSp49QsPMADhaw6sHJQbs/83xh31P9/iHpBVYblJAcT?=
 =?us-ascii?Q?+KHK9Edct2hhALlc/EOYE99ab6pDHbL31EVd/ZAXo7BlJn1y4X7O4IYHVkPw?=
 =?us-ascii?Q?Dhz6sIkyfiH7+QQsny43RUZyOzBpUXD4C+8i/eO4xqlc4WccuoACS0WvxWu/?=
 =?us-ascii?Q?gJPhVTXO/NKhaxU7JPHiQJ8f8xImIUu9f7PbiN5p9IopdfmjEDT57TQWS8e2?=
 =?us-ascii?Q?YmLpiu46ASl0QoaY3zrRaHXP9uywRVlI+t7k6wPBLXav3HnZjuJbj1hlvpXn?=
 =?us-ascii?Q?LNWk7qyQPs6Ss+z7cN49rdqWooUbGGfKTZXAcH9ArG83l/eSfe3TGKMmFcgn?=
 =?us-ascii?Q?Qrvp00iycN7YSzdtbdPw1QJ28zcHK1xvbuRQBapQ38J+EK2x0lXO3jt2FQ7Z?=
 =?us-ascii?Q?k7dHs7GsLH97GMk0tDAxx+c=3D?=
X-OriginatorOrg: yahoo-corp.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 91d80fcb-9cae-4cfe-ac21-08d9d4e39df0
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB8357.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2022 09:20:32.3033 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a208d369-cd4e-4f87-b119-98eaf31df2c3
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KHBv5uLtZjxvEf0jbEQppg2kzIJAUAiEpmhBSDGy5oKH0DAJ7ZpV2GHS0GV85uYOyGSFmasOr8i4HD2lMYVe4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8639
Received-SPF: pass client-ip=183.79.94.93; envelope-from=hnarukaw@yahoo-corp.jp;
 helo=corp-ob08.yahoo-corp.jp
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
index 38fb6d3084..d5bd9d468f 100644
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


