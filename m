Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C98093322F1
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 11:25:45 +0100 (CET)
Received: from localhost ([::1]:41264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJZYe-0008CH-RQ
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 05:25:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1lJZVE-0006Sb-DA; Tue, 09 Mar 2021 05:22:12 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:54638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1lJZVB-00027b-12; Tue, 09 Mar 2021 05:22:11 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 129AJaNZ010906;
 Tue, 9 Mar 2021 10:22:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2020-01-29; bh=BXTbCtTYcn3t2F8btCOF+eLRzGsVxXTM+YyqUiPmZBM=;
 b=vRwaAy3g8DA3QSwlpWAsgbHpFIP7b0fJ/FVph4ZsFY+MqbB9PxyhkxdvFgKMwXcZ4dRB
 zAIm02qxwunb4xfSO7D+ojjYPA/gdIwFttSZiFwbbvgDH29Zq/q4SODhQtc8O9LFTn5X
 lJLQZK0UfS/pbxlnqk4uZ517PleESqLG2I4CRkfhWvNAbMqE9NbJdxzenNDILn9vabwN
 jte3x00ACUPltX1cPYfwg/GujQRUsJLwjBb08Uy8A2az/JgGbw+V77ELEaXUfE64rKN7
 jVKre9Vt576xMvWYdPdUM5vBzxq5R2Nc/tnu7Xwa5/mU7z83KnbDZIxkTlWtL17krgUp QA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2130.oracle.com with ESMTP id 373y8bpx0e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 09 Mar 2021 10:22:07 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 129ALUa5158580;
 Tue, 9 Mar 2021 10:22:07 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2177.outbound.protection.outlook.com [104.47.56.177])
 by aserp3020.oracle.com with ESMTP id 374kmy995w-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 09 Mar 2021 10:22:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SCQjn1UZOw62axdsDRO557ZBaoYd7dzl9SyU7MOrgbbnLkeNkJxMaEll3dnNRk9P+1g5Ygw83FGNgC0LCmZDAshw3hlqlLLZOdx4IHaHlfgoQ8Yn02FtMdHVZNM4vwMwjjaSwKAfdK4pZSzhF9EDI/SxlICfWlz0x0KitJ9fWjQsbqmTIUhyXfjrts9aab+NAjYzqJPblA0lGqIg6/8Hc2nSdcwLZA9h6oFxH8yC1M0ZEEJn2XI9ZUI7XQolksvsNF1L4fBsY6woFatOXtQqZV9Pj7yRvdRv2Z5I758n8IP2pQ55B404HGnjRPvgTjszSYQPlmaEpON3py2BUTvEXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BXTbCtTYcn3t2F8btCOF+eLRzGsVxXTM+YyqUiPmZBM=;
 b=PTk5hNAdnJ/dPg84GC+N/g0WDXM01gRvTFS4uoePICC+rG9BsFBwzVcz35s+n1yJAsPx1DsF6KgbYC9ADqQrRVvd9Ur7HoDR//73WOnW6oGYpJ3VB3C5C+aoOVCMd/1eq5L9ZZvh0pUj/8qHQ411/9oGTKZjI4mQ7bdXPjdeytZjnOQnY98IGFVEAnTPgbhSPC7sMMkXua4nhGgT9R1sg/1QYM53fAmHWEia7+nlITv8HUvQ8BAR+RseR15bJkTjZj4mtwiXf8aKGJKbxDaK1y8OcRU/bbh9bA3v57XUvs3dV39K+HnVmvC9G1q4ctg96UKHU3zDd2aJ5J56sIl4yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BXTbCtTYcn3t2F8btCOF+eLRzGsVxXTM+YyqUiPmZBM=;
 b=l88LslK0bZo90GBujIj/DFB1lkJBqr5u8gvqiws7UXbeoQWNZlhbokYc5sS3bpxmTKjk8TnT96h5xTZqAxzm93mIs+x+vn+K7JRJ3fr+rp2irOvIyiHiYmKcauk+kY8914QkYWSLDQGIONYQTaIS5ktLkBy3bmjFa3XMSqu+qO4=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
Received: from DM6PR10MB3148.namprd10.prod.outlook.com (2603:10b6:5:1a4::21)
 by DS7PR10MB5184.namprd10.prod.outlook.com (2603:10b6:5:38e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Tue, 9 Mar
 2021 10:22:06 +0000
Received: from DM6PR10MB3148.namprd10.prod.outlook.com
 ([fe80::f871:5965:2081:3934]) by DM6PR10MB3148.namprd10.prod.outlook.com
 ([fe80::f871:5965:2081:3934%5]) with mapi id 15.20.3890.038; Tue, 9 Mar 2021
 10:22:06 +0000
From: David Edmondson <david.edmondson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 4/4] coroutine/rwlock: Wake writers in preference to
 readers
Date: Tue,  9 Mar 2021 10:21:57 +0000
Message-Id: <20210309102157.365356-5-david.edmondson@oracle.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210309102157.365356-1-david.edmondson@oracle.com>
References: <20210309102157.365356-1-david.edmondson@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [2001:8b0:bb71:7140:64::1]
X-ClientProxiedBy: LNXP123CA0017.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::29) To DM6PR10MB3148.namprd10.prod.outlook.com
 (2603:10b6:5:1a4::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from disaster-area.hh.sledj.net (2001:8b0:bb71:7140:64::1) by
 LNXP123CA0017.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:d2::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.26 via Frontend Transport; Tue, 9 Mar 2021 10:22:05 +0000
Received: from localhost (disaster-area.hh.sledj.net [local])	by
 disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id 3d9f5ce7;
 Tue, 9 Mar 2021 10:21:57 +0000 (UTC)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2bda7950-e54d-4d93-0dc0-08d8e2e53068
X-MS-TrafficTypeDiagnostic: DS7PR10MB5184:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DS7PR10MB51849B74E821790CEE9892CD88929@DS7PR10MB5184.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aphtz5cwYoyfWmYJUnUxmJ7hcqqqVTwnFzvIZCNB7kQ4uCJretO01njZ4cyYRdgb+GWBHtdl+m+He3lzjnM3zhUAtVsDm8vp/exkYlLpU/9OoeJvMl/dEv+I9Ndv5dbAeeOdW4ECwEBjQQeKFl5rcReORRDAWebYh3OfBQMjbvN5Ytq68nsKhcrQpbTQp6B0ZknqehgQuUVggoEo/782ckjh8EE09/6znWR8+S+ErenrMPH5vK8utwtcoCDDP8vcJwY+AW3q9D2pv/slFrZveUEfYSGOdmglydE3VlOhiJfyKlIzfrkmCQ3abLjd+PacH1EjgXT5eI4iWLeaIjtAufA0G/4r/sZuwMrrveZMe77HX1RPqvrtsNQ5iuZE2bdJ+dUQ6m+p/KUY0koHADdiM18QOW138L0cCq5/r3oGtGRfvsfVa0IKX2G/+gPVM6LNF/a0qXJD6WMQb3/qYLLdegsC/cMfqTdB+Y3KD/4LzxeCboHYNSmSjtJnl5dIDU+aqraBD6cE4m2XJCUHVpNEQQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR10MB3148.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(396003)(39860400002)(346002)(366004)(136003)(2616005)(66946007)(478600001)(107886003)(86362001)(1076003)(6916009)(66556008)(54906003)(66476007)(8936002)(8676002)(186003)(5660300002)(316002)(44832011)(52116002)(2906002)(4326008)(83380400001)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?WDOwxVNDs8Fl8/qSNctjhorTibDLb3SYz/utCNU+a2q7xVosDC986iMCcXV7?=
 =?us-ascii?Q?mP3xvEBBGVD8k3GFDfId572/UfIJQy5o78BmlnhLeJDAlN3dL6yAyOTUSs6w?=
 =?us-ascii?Q?TyzBRWhAF7s/XuNNZuHwExcaQOG2xyXkdjIf6HrQAkUW1lfmAjlh+G8LYxaU?=
 =?us-ascii?Q?zDfb8jJPxMlIcmdaZ+O1uiVOlLUFlMzahu3jiP5LRMdllD3eg0WwTOZQhEE6?=
 =?us-ascii?Q?aPszLolmyqyW+HeRWtGYkhk9y8E5ysUwgt5X1CdRt51pxjZY0AR5uGARZqh3?=
 =?us-ascii?Q?Dle7n08HJf6LM13Qb3H6uFno5fWHruXR25yh3hxeHQbkP+coc/LkokQk6mrE?=
 =?us-ascii?Q?O0euLwfksgs2oN39Esy//fXFbckc3/D5EVmPF9X91u0IfUkPpS2H/lgbBknR?=
 =?us-ascii?Q?n5hLafwC8bTh9GXtYSW7/XGk4FIYdrE/D9cFS2g92JNtFz36swotNa7ByWQj?=
 =?us-ascii?Q?QCE/uIaCiXvLCoQPgBi+8eyAFEFEaNXJoNIFd42Bl3ONuD+ogwTwguN/hJ9E?=
 =?us-ascii?Q?uz4LFGGsJ06bl8uX8qn8goj25ANwJPv09GzbbLvmMXcnbkcK4vk92Q1Jdfyl?=
 =?us-ascii?Q?mEoW1mNsNwZKbYfnpNOVCRWQu7M3wBbTT+69tIBFW69yoVpyn9tYr2kbege5?=
 =?us-ascii?Q?lLKZBWOqRsI1YR0co2ERO5LmXmHEiF6z5F55gfsCL6kjdhTit20U3OYidaqf?=
 =?us-ascii?Q?HjgnzW2Wyv46jW6X2cOfOOfQXUEa7GzV/0NDj1pTMe5APqm+sUQjJRcHy65t?=
 =?us-ascii?Q?DbbA3fGs/Hn1PizaI+OSeq/auAfkcB1/nv5+RydpXeLAu1RApBdaLpR5qku4?=
 =?us-ascii?Q?Q+Z4siJ9hOj4QvcCi5mM+n0kn09l982RJ10BNW/SmPvxAOIxV5ShqxAWH6jN?=
 =?us-ascii?Q?XnTI8xXbtBaUWCvMmE2O994jw2ZWSt8GPKOtbkKvk6HS3kfWrLSVMqyMV8pJ?=
 =?us-ascii?Q?fYFCKVJCJ5BSqMDmBqThAhKYGALdM5mb90sKMcU3qWTHm92Aq7xMaG6z13Np?=
 =?us-ascii?Q?a5xwvipBpF2pIQtaFpDKyLFn5DmywV8ZBFE46zeF/OqS1umNDfbXgY0NhGKV?=
 =?us-ascii?Q?bcKeI4rAef5cX3+aXtKAhNEADbHX7ovBnBRxzu70ygbV6AEvrHmUOCH4Tttq?=
 =?us-ascii?Q?mQ8v7VPfssAdD8751KZqQ5uVQwQt1V1DDF0bHLbCP6Qeuba6gdOs0diAD7v2?=
 =?us-ascii?Q?y8x0+p0Mi7JKbRvC1GVmZQpaNgfOmwUdCFVBIVce99Yd01K+rcLbr3gDtahW?=
 =?us-ascii?Q?HhDeiEvLhpv4ZQ4VWRZIAaVCLT/GD7o85KVl/yChQT958XR7hNFQE1ekXljr?=
 =?us-ascii?Q?YUcEmWFAZf8DLHL1FbJIFTgyahGdcazMn2s7RxD90eAEQw=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bda7950-e54d-4d93-0dc0-08d8e2e53068
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB3148.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2021 10:22:06.2367 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tcikEkZauK+dgYIyjD8YRQ/GAP8HkJtsGLrj0ptlH3d01ZX9G6mg385tk47c8ur/nTVRX6qERpCWGppMPcH6IO7Cud1lgTAqd0XMpMI8yYE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5184
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9917
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 bulkscore=0 malwarescore=0
 spamscore=0 mlxlogscore=999 phishscore=0 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103090049
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9917
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 mlxscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 adultscore=0
 mlxlogscore=999 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103090049
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


