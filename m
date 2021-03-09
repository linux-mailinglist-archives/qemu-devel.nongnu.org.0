Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB3D332A80
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 16:32:57 +0100 (CET)
Received: from localhost ([::1]:49204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJeLw-0004Mv-Fb
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 10:32:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1lJdXO-0002tr-Nq; Tue, 09 Mar 2021 09:40:42 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:47316)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1lJdXG-0003tN-RY; Tue, 09 Mar 2021 09:40:42 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 129EdqYc002614;
 Tue, 9 Mar 2021 14:40:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2020-01-29; bh=BXTbCtTYcn3t2F8btCOF+eLRzGsVxXTM+YyqUiPmZBM=;
 b=unA6L9KYmYDz8mrirVWlfPlUsvbHPvPP07jHUz5/GnkMqaSQ/TinBXVq9V03IWQ4ltqQ
 Agv+Lnbpl7BY0Q0RXVCXny4qPIGjdtcFP6L7N6lFAsGJw5C+ODeo/tisEv898HA8tYN6
 aqMY36P7xHBVKdyDURHOfMwtYIrNnukYacBSQpZdzfK9cwe5ExbxU+koXcZdkUclQs90
 Jxl7QnKoks0bhvnoxJzV0pppVwm/Y+EtWu9adSUYVzLRHChTHgsVGnpTa4AJimz5uN2d
 oHIpmgTvHtwasO7LB/2VdCiZWiO59YUepJushscpCC4VgAkK2BOcVxsQJOL8tcNv5NvF gg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2130.oracle.com with ESMTP id 373y8bqmnf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 09 Mar 2021 14:40:32 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 129EVPrI193285;
 Tue, 9 Mar 2021 14:40:31 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
 by userp3030.oracle.com with ESMTP id 374knwwk0y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 09 Mar 2021 14:40:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zrqy2mJzm2+MdKVzyH9fEwE/UV4fMYS9NP34isWbVufm3ev/+Np8fO2SIDl+k3Ra+rYRZzebAuAWCWRTVSey87w0QZ4MMQHJ/P2TeL5moeHK/SLgZaUEDA0Q4frDZ0O2rRwBpfVfWBDrgmkU0N2+9MR2a+KBw/nugqJzHa3pDk52cLoQHwCA6RRKQYTRnMi73tbhoawLWSdukBiNX02vCJnpb4j7pbklr6frvfEQ3O+XXMUqslyqVaGhUBVbUevGUS9c16J9CwJ3NbM6Wmx6NGo/4koiX6t9/6TtssZbAEG95AnhPh44DF1owlC5M/msaaLIOc0v0htQyJuc7dVU3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BXTbCtTYcn3t2F8btCOF+eLRzGsVxXTM+YyqUiPmZBM=;
 b=i1Mv0rINN4z2iji9H55Y2/E+Jn5RYPIzlzuOiU0jwYK0sJadgkVn3n63A5usJ300+wQJFJ0utoSRrECqH/0047U1d88sqcHbcAqhsqcpdt0+f2mb78IPGb3E3JhreKNfG3HoCwxheBq5ePClPDmqZ7TiSmGqDEvLvFANM302048tZ71rUoZy+buYf9cNoai789GvHn0GyJZ6JJ/AqcvMY51ZSwvoYLzdwIQX3PlnpV/hKOCYuTcbFHmuF913ILePbDQQhSRH30gnKu5Hj0sav78LOw/TvH6MDdGAZxSRSFPgsiO+mLI479pEdbhoVZQbpjVtCin68Bh7ZW/5X14wLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BXTbCtTYcn3t2F8btCOF+eLRzGsVxXTM+YyqUiPmZBM=;
 b=djnDnAn4Wtr86eX5HcRoXOZ3iVsidTj4wPGAJ9mbDxglUjKml590BPVN3HwTROoN/pHOFP6sdHBzHm5zxt8/QRFOFF0ToHIxuQcMHrJBmlseSF+OnMHIM/y8Qm9zSIoqInE3KJfffpoYbfAun7dKgVctae2ToV01a7fB9M0z1BU=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from DM6PR10MB3148.namprd10.prod.outlook.com (2603:10b6:5:1a4::21)
 by DM5PR10MB1771.namprd10.prod.outlook.com (2603:10b6:4:8::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.29; Tue, 9 Mar 2021 14:40:25 +0000
Received: from DM6PR10MB3148.namprd10.prod.outlook.com
 ([fe80::f871:5965:2081:3934]) by DM6PR10MB3148.namprd10.prod.outlook.com
 ([fe80::f871:5965:2081:3934%5]) with mapi id 15.20.3890.038; Tue, 9 Mar 2021
 14:40:25 +0000
From: David Edmondson <david.edmondson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 5/6] coroutine/rwlock: Wake writers in preference to readers
Date: Tue,  9 Mar 2021 14:40:14 +0000
Message-Id: <20210309144015.557477-6-david.edmondson@oracle.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210309144015.557477-1-david.edmondson@oracle.com>
References: <20210309144015.557477-1-david.edmondson@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [2001:8b0:bb71:7140:64::1]
X-ClientProxiedBy: LO2P265CA0075.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8::15) To DM6PR10MB3148.namprd10.prod.outlook.com
 (2603:10b6:5:1a4::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from disaster-area.hh.sledj.net (2001:8b0:bb71:7140:64::1) by
 LO2P265CA0075.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:8::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.26 via Frontend Transport; Tue, 9 Mar 2021 14:40:24 +0000
Received: from localhost (disaster-area.hh.sledj.net [local])	by
 disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id 310e39f4;
 Tue, 9 Mar 2021 14:40:15 +0000 (UTC)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 601b82e2-11d6-4b4f-1408-08d8e309468a
X-MS-TrafficTypeDiagnostic: DM5PR10MB1771:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR10MB17718AF2D11F3FC1169F081E88929@DM5PR10MB1771.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bCCbkhJoXQoATrhEzVP6erwJS8gTPGL3UtKCo8V1O5vJctouFJ2ty52Rm93EurvGtCJo6nd0PIPKLqCDM2TtNABU+X1zVxXjw25rov4cwGwHfwt+LoSTWbk/M22OreXmX0uTNFIM3WtT8VfB8swus/pkyGaLUh7UQQ9CQzxTxYYyBgjaKhF8nFn/Xs9Wcu4bqDL/JTcG6HIkmC672YaaG3IDhAv3ANIXVg5KKHnevX8tRQbO0fqSycyI0OwblEnyHEA38i50FVlwfYQgtcMhsyO4a+BD45s/IV/dMl8osGOXA4v/2wN+FsI8pdzzBsY4wJuw2x6rh+oAfDASr0NlLUNsstEQLaDpZ5jY0+zChCzF+bhDSCBGjEbGVXc5jBJ49lkcMtTtdaMwEWeVChncaS/hSaYSGmhah19c2mqaL1BIN45MBCkYKXZuEsKWyydsZ5ioyxg2iX2O6k/OMuVcvw3l7C2Uux5OMdt0J2sDFfOAP1kyG/BrGk9MQgSwcUra1Eip9Pf0X5jZzN2jh/jKGw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR10MB3148.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(39860400002)(346002)(396003)(376002)(136003)(86362001)(186003)(83380400001)(66946007)(44832011)(316002)(52116002)(1076003)(36756003)(8676002)(8936002)(107886003)(54906003)(66556008)(6916009)(478600001)(2616005)(5660300002)(4326008)(2906002)(66476007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?4OzbFY3B0biJig7AHH2gX/R4aGd3s23QqEQblPDX9vPU85+WPsd61GXxCK1b?=
 =?us-ascii?Q?eAeACt5vcvdniOCtNR2eCC4WZphvEWfiW4ku1EG/KbPCtGgivkHQMbU1Ob7U?=
 =?us-ascii?Q?lpmpGJ0MOOENwHkiSPRJDZEj8xTPLxpj6pzYDNbL20Y8m+6J/+XBMySzyow8?=
 =?us-ascii?Q?HFfvwAwU0/nA7/vG/3CbBDJg41sbBfxj+I8Cydy4uKr1HJr2EfOi84uBI12c?=
 =?us-ascii?Q?5Y+0JsNYFiktuax9HZsoYl2uCuJgZGno14pnpMP3CAsVC+WZbOdpttSK5/Pm?=
 =?us-ascii?Q?cqAO4BONAFM08fPyllUSksXuWo7DwEjrTYCZXt4fiuY4z+CeuULVB5XIPRf1?=
 =?us-ascii?Q?KOFnSOUrakswYOEVhAYH6LyxQpL2g8cnci59N10BEwkUKmRsY8ovenuqBiZP?=
 =?us-ascii?Q?lPdnAoI+y1LUOBGT/+qUeaJ0+ydFJg9VxXPmvOstAh+/oY/BmaoMqdIqi76m?=
 =?us-ascii?Q?6+RbsP5Lb884ekKwo4Pd0grDwpjj2tJlHM3NZNjMv3FeSHRKmgBhxeq1Q3mp?=
 =?us-ascii?Q?luSYXcsCibwcGpL5ZAYxpRS97Q79Pg62HtV6w4BJbxd6z44T/2D70mWmXtIP?=
 =?us-ascii?Q?/UjC+X9WPXW95RrKGJTGHZeojunUpD3wOovKZdxd+lllw9e6RUER9xwGjrdx?=
 =?us-ascii?Q?fzGN9Lk/lsjMJT0P8JofJy8EB+JhVcGJR3vU2Y9afwOyPApKaUWRd+PPIhHJ?=
 =?us-ascii?Q?llO0uoCQZ1soR3QfpZJbse0MQtJ24gSABkUjSlnE2XaYzebH2Prgea6QW3U3?=
 =?us-ascii?Q?OlFjEHSFqwfLD0jqDJJEiS2XMHFlapaP4YDjQaJewOeETtLOS9CSQaTqqqSF?=
 =?us-ascii?Q?vdzw0XqaHOrOvIfmxIdr3UHlbBP/MEOB5FXBAUzJX6H+JS0kyIkCgUNJwJIu?=
 =?us-ascii?Q?Fg/F5dVw8ZcFUtGvwjp6iKFC7BcdZS2PFElzPm9pyMp4vBMzphmQDhVmKmqG?=
 =?us-ascii?Q?Y8pTs7KE0FcusQ4AONmZXdF9jC7n+HlK6J/JNTeQPwlCi1Y5MLIs53mThHSG?=
 =?us-ascii?Q?92V/RgLWN4uPz2DYP2eyxnWwLwwmUK+t52dz4Ols2Ep76ZPtQbb2WIRHzCdV?=
 =?us-ascii?Q?wI66c7svdLfUB2g/NGUfQKjWW8akpd2/VpRLJfsBSyvjVs8qJrYnYlOcPzIz?=
 =?us-ascii?Q?5Mol2HmkcYZsOJNSqCAiND8SmXL6boUO2/Fsgs6GZRHTvdFZJVYdSJ41rIfA?=
 =?us-ascii?Q?KueqHrEt5SkCTV1kBgPIJY1KAPgmIMjeJpkkJ24FxxvGBurgJOZphYU9o5Zj?=
 =?us-ascii?Q?SxxCv9Tql1aoTsVOYdoew8SnpGyu1U4MMQohn4k11eg/7/O9U44LQtfxwgtW?=
 =?us-ascii?Q?FysyO4PPmX+qHQJNyQ2pjH4QSKevowFqS8RsccScXucw4Q=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 601b82e2-11d6-4b4f-1408-08d8e309468a
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB3148.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2021 14:40:25.4338 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N8c1XQSy4DqGOzK4knRCcctB9XLjtdBB5AbzbnM/uSQaGsmmexV6tuVQGQVSJByGYRc1jyx5KpbGs3B1zRfb3jn3K0APsYC83k4mO3Lao0I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR10MB1771
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9917
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 suspectscore=0 adultscore=0
 phishscore=0 malwarescore=0 mlxscore=0 bulkscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103090074
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9917
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 mlxscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 adultscore=0
 mlxlogscore=999 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103090075
Received-SPF: pass client-ip=141.146.126.79;
 envelope-from=david.edmondson@oracle.com; helo=aserp2130.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Stefan Weil <sw@weilnetz.de>, Max Reitz <mreitz@redhat.com>,
 David Edmondson <david.edmondson@oracle.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A feature of the current rwlock is that if multiple coroutines hold a
reader lock, all must be runnable. The unlock implementation relies on
this, choosing to wake a single coroutine when the final read lock
holder exits the critical section, assuming that it will wake a
coroutine attempting to acquire a write lock.

The downgrade implementation violates this assumption by creating a
read lock owning coroutine that is exclusively runnable - any other
coroutines that are waiting to acquire a read lock are *not* made
runnable when the write lock holder converts its ownership to read
only.

As a result of this, a coroutine that downgrades a write lock can
later cause unlock to wake a coroutine that is attempting to acquire a
read lock rather than one aiming for a write lock, should the
coroutines be so ordered in the wait queue.

If the wait queue contains both read hopefuls and write hopefuls, any
read hopeful coroutine that is woken will immediately go back onto the
wait queue when it attempts to acquire the rwlock, due to the pending
write acquisition. At this point there are no coroutines holding
either read or write locks and no way for the coroutines in the queue
to be made runnable. A hang ensues.

Address this by using separate queues for coroutines attempting to
acquire read and write ownership of the rwlock. When unlocking, prefer
to make runnable a coroutine that is waiting for a write lock, but if
none is available, make all coroutines waiting to take a read lock
runnable.

Signed-off-by: David Edmondson <david.edmondson@oracle.com>
---
 include/qemu/coroutine.h   |  8 +++++---
 util/qemu-coroutine-lock.c | 24 +++++++++++++++---------
 2 files changed, 20 insertions(+), 12 deletions(-)

diff --git a/include/qemu/coroutine.h b/include/qemu/coroutine.h
index 84eab6e3bf..3dfbf57faf 100644
--- a/include/qemu/coroutine.h
+++ b/include/qemu/coroutine.h
@@ -241,7 +241,8 @@ typedef struct CoRwlock {
     int pending_writer;
     int reader;
     CoMutex mutex;
-    CoQueue queue;
+    CoQueue rqueue;
+    CoQueue wqueue;
 } CoRwlock;
 
 /**
@@ -283,8 +284,9 @@ void qemu_co_rwlock_downgrade(CoRwlock *lock);
 void qemu_co_rwlock_wrlock(CoRwlock *lock);
 
 /**
- * Unlocks the read/write lock and schedules the next coroutine that was
- * waiting for this lock to be run.
+ * Unlocks the read/write lock and schedules the next coroutine that
+ * was waiting for this lock to be run, preferring to wake one
+ * attempting to take a write lock over those taking a read lock.
  */
 void qemu_co_rwlock_unlock(CoRwlock *lock);
 
diff --git a/util/qemu-coroutine-lock.c b/util/qemu-coroutine-lock.c
index eb73cf11dc..c05c143142 100644
--- a/util/qemu-coroutine-lock.c
+++ b/util/qemu-coroutine-lock.c
@@ -330,7 +330,8 @@ void coroutine_fn qemu_co_mutex_unlock(CoMutex *mutex)
 void qemu_co_rwlock_init(CoRwlock *lock)
 {
     memset(lock, 0, sizeof(*lock));
-    qemu_co_queue_init(&lock->queue);
+    qemu_co_queue_init(&lock->rqueue);
+    qemu_co_queue_init(&lock->wqueue);
     qemu_co_mutex_init(&lock->mutex);
 }
 
@@ -341,7 +342,7 @@ void qemu_co_rwlock_rdlock(CoRwlock *lock)
     qemu_co_mutex_lock(&lock->mutex);
     /* For fairness, wait if a writer is in line.  */
     while (lock->pending_writer) {
-        qemu_co_queue_wait(&lock->queue, &lock->mutex);
+        qemu_co_queue_wait(&lock->rqueue, &lock->mutex);
     }
     lock->reader++;
     qemu_co_mutex_unlock(&lock->mutex);
@@ -356,17 +357,22 @@ void qemu_co_rwlock_unlock(CoRwlock *lock)
 
     assert(qemu_in_coroutine());
     if (!lock->reader) {
-        /* The critical section started in qemu_co_rwlock_wrlock.  */
-        qemu_co_queue_restart_all(&lock->queue);
+        /* The critical section started in qemu_co_rwlock_wrlock or
+         * qemu_co_rwlock_upgrade.
+         */
+        qemu_co_queue_restart_all(&lock->wqueue);
+        qemu_co_queue_restart_all(&lock->rqueue);
     } else {
         self->locks_held--;
 
         qemu_co_mutex_lock(&lock->mutex);
         lock->reader--;
         assert(lock->reader >= 0);
-        /* Wakeup only one waiting writer */
-        if (!lock->reader) {
-            qemu_co_queue_next(&lock->queue);
+        /* If there are no remaining readers wake one waiting writer
+         * or all waiting readers.
+         */
+        if (!lock->reader && !qemu_co_queue_next(&lock->wqueue)) {
+            qemu_co_queue_restart_all(&lock->rqueue);
         }
     }
     qemu_co_mutex_unlock(&lock->mutex);
@@ -392,7 +398,7 @@ void qemu_co_rwlock_wrlock(CoRwlock *lock)
     qemu_co_mutex_lock(&lock->mutex);
     lock->pending_writer++;
     while (lock->reader) {
-        qemu_co_queue_wait(&lock->queue, &lock->mutex);
+        qemu_co_queue_wait(&lock->wqueue, &lock->mutex);
     }
     lock->pending_writer--;
 
@@ -411,7 +417,7 @@ void qemu_co_rwlock_upgrade(CoRwlock *lock)
     lock->reader--;
     lock->pending_writer++;
     while (lock->reader) {
-        qemu_co_queue_wait(&lock->queue, &lock->mutex);
+        qemu_co_queue_wait(&lock->wqueue, &lock->mutex);
     }
     lock->pending_writer--;
 
-- 
2.30.1


