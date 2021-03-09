Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DDA3332A1E
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 16:18:51 +0100 (CET)
Received: from localhost ([::1]:34806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJe8I-00037R-8H
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 10:18:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1lJdXN-0002s0-QP; Tue, 09 Mar 2021 09:40:41 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:47322)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1lJdXG-0003tx-TV; Tue, 09 Mar 2021 09:40:41 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 129EdwBl002657;
 Tue, 9 Mar 2021 14:40:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2020-01-29; bh=WvKAGLn/qJdpTe2hqGSeJIeYv20Z9uAexuyoo8qy01c=;
 b=PLiJh/54MVLa/tJUt4sO4H5dGCFDcWC+4bt/SoR6AnUYabSFRLYtnyyYDWHtjPuD5C0B
 wXz6J3M2+7V/Rg0o5ZyjyOQRXT2m+TMuGAZkWzUyZ4X+sod+I+Svms12Yp3OzZ2RWHq4
 bW3CE6TH1t+PBX2azTQSHxseNmuNhrfYcRzKptQ6pywXcoXN1rd9xWN8R37Z0lzsa2HU
 V9f/1+N5Xcg4bkLGeUieki6nIc54d53GwaN4fVNr8CpR0GFYcqngj/TwDzdcuR2duXDS
 xrj6/32H4ApUFP4v1jxFlWskHplsLVKEahveFIOGkxu0QCY9rsuqzHGJLrtQ1n4mA+cJ wA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2130.oracle.com with ESMTP id 373y8bqmnh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 09 Mar 2021 14:40:32 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 129EVPrJ193285;
 Tue, 9 Mar 2021 14:40:31 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
 by userp3030.oracle.com with ESMTP id 374knwwk0y-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 09 Mar 2021 14:40:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gPyr73gQcAmf5liA4GEoxaEh85Pwt0nPYxkp0EQCed1zHRmlD93ejwaFpif/X0sEtxaoI4j8EYzCO1xbXRDw9CtwaDdjLF1qcUOm7tVsZ3qL/xe4FUfVtcm1MTdSa8xqHTRAz+u29SlDgu7wb6MmjPWkjccU7Q3njU0IymhXgNefyoHNx1wPiZTsuboKCRY0yHsk8Aoo2YFp/Kf2363z+cobV4l3mkqMFPXw+f4Xxpkt1UB/I2F0N3lbdn6Gw43QQaijcasqUZyiVK7ht0PwRNKHqZho3obGc2VWiUaiIxYrdslgLi8F9+/1MJk23tEnIfFjngikEw3zajM/HnhP6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WvKAGLn/qJdpTe2hqGSeJIeYv20Z9uAexuyoo8qy01c=;
 b=SyoFog5IDvpf2VkhbbK85u1sNtud/ZfGh5+UvNdgmSjGTT8ust131lYzYcAGXgpBYE7Q4asLmRkaa3cVT9ZlK8JEows28jqgV0M3NCRQsxC/8Gj0l0Y3ee3i4yaEQqPDDuysvMPPwY9zWNqrLbYp/q6N4Pece25VchIZ5zar63QLzWHjpPw8EJiWG5a7d/k92/an0QEdIbDE1ini4rDTR4wRaE7fg/0CktUTiEMLkafRWymdORm3gza8ZoX/mqcHVCj4pLFZNjuPXMNjmqIBYuXt3AC8QiStBEwIIF38qRXlwFxvsOMBIE+jwxCahZCWrePOCK9qcxXMLDJ+q18D+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WvKAGLn/qJdpTe2hqGSeJIeYv20Z9uAexuyoo8qy01c=;
 b=gK2YGlnGAqLY4l6QyfLsdyxT0y/lSdFKnqbxytB2MkYzYmOrhcbIoIiYc9XxaLMLVbwiCbWGIdq2bhzwhP0IYX6ZRJ/qq2to6IY3Nwq7niz5tfIm5fzlmCYktebol6XYMIFcIwA+Ab/3WSc876leFII2JftHs9f53mAkV9G8I4Q=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from DM6PR10MB3148.namprd10.prod.outlook.com (2603:10b6:5:1a4::21)
 by DM5PR10MB1771.namprd10.prod.outlook.com (2603:10b6:4:8::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.29; Tue, 9 Mar 2021 14:40:26 +0000
Received: from DM6PR10MB3148.namprd10.prod.outlook.com
 ([fe80::f871:5965:2081:3934]) by DM6PR10MB3148.namprd10.prod.outlook.com
 ([fe80::f871:5965:2081:3934%5]) with mapi id 15.20.3890.038; Tue, 9 Mar 2021
 14:40:26 +0000
From: David Edmondson <david.edmondson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 6/6] coroutine/rwlock: Avoid thundering herd when unlocking
Date: Tue,  9 Mar 2021 14:40:15 +0000
Message-Id: <20210309144015.557477-7-david.edmondson@oracle.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210309144015.557477-1-david.edmondson@oracle.com>
References: <20210309144015.557477-1-david.edmondson@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [2001:8b0:bb71:7140:64::1]
X-ClientProxiedBy: LO2P265CA0214.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9e::34) To DM6PR10MB3148.namprd10.prod.outlook.com
 (2603:10b6:5:1a4::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from disaster-area.hh.sledj.net (2001:8b0:bb71:7140:64::1) by
 LO2P265CA0214.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:9e::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.26 via Frontend Transport; Tue, 9 Mar 2021 14:40:25 +0000
Received: from localhost (disaster-area.hh.sledj.net [local])	by
 disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id 04a79c41;
 Tue, 9 Mar 2021 14:40:16 +0000 (UTC)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 24aced05-801f-4f06-354d-08d8e3094755
X-MS-TrafficTypeDiagnostic: DM5PR10MB1771:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR10MB1771F70F65E7D4057F92109F88929@DM5PR10MB1771.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LV5B2BrHASLf+TUkqqZPO2uwfHsCOPYsyR8bmboCwKP7s1baDLdFos3XY+gDKHnhnJkpxOs1MASnbMbG7AMBZsvceaWmmUu7CaRfYKfseVxgm6MffEphbi7UaCDbQWLgStBS3HzOvRG3bZ+BFny6drN5ht9OxYslRSCjxqTBIihhzIC1jr+QpkckVUGbiIAAXb4pdE7exJ+002grZHd/tTLEfBJohbfGw43rN8N5P8oOhHvuK81oBjFNo+jcPeMeV4uktbaTslVVRgLCNFBqmld83gZ8fkLxC3UAVeColQXm8GL5WiWEvhv0F/wiHixRWlhtvb85DNNTveI3mul2wOjFhsHBUzltZBo00yOqLZR5/uEI3qF7fPi/RBjGmqymoSFP/PZi5C6yKfYG8uyr16ojpmcSQfc4hKmKe5RsvMVgqTBSZ7asBSAm4YB0jN2aVjWNw2I9VIBfDOO+8lkJt4l97zqjWsBNra2nNGWo1//t8nvnhdtBpu7zeUM+2+2xpHFfcq36cgdKWLDhaZQw/w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR10MB3148.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(39860400002)(346002)(396003)(376002)(136003)(86362001)(186003)(83380400001)(66946007)(44832011)(316002)(52116002)(1076003)(36756003)(8676002)(8936002)(54906003)(66556008)(6916009)(478600001)(2616005)(5660300002)(4326008)(2906002)(66476007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?lyUW2eipo2qaMCncevLxghZYp6DN9eUGmOBXZy/2ULwQLrVEn6cTIw2XmVvc?=
 =?us-ascii?Q?IQ5EJYO06QCJj9qj5v8YlGc/Xfxrs0Bxchy2hzN6yBg+eS+zIrG8lbVCRSSf?=
 =?us-ascii?Q?NzM9fXb8LwmlKxwApJo9TPwvnkZKW4IJJtx0WiWAbFwfq6xWFUzqSZXA9+h4?=
 =?us-ascii?Q?i9KUlTtxuckBaUb3kdf869bLCUoh4PJiVoRBfokMywJ372HwfQD/PDBdpNof?=
 =?us-ascii?Q?JTn+8sPSI8HM3nSuz3+t1764lkcCQ9QTtR/RPclcsLEixOXz4QMVTM1qGF1w?=
 =?us-ascii?Q?T4M5xycACKBHBWwRqDQLgPlNwI5OJEuKYP06/kmkpUM9HbymuAihlnZd4ufm?=
 =?us-ascii?Q?BZUPRlRN9awxLo2q9jmzCQZ49n/akRzr8FEEeg0IHPMXBQsqHhhxHGdOGzlV?=
 =?us-ascii?Q?eAaMzbOcfT4XF14DkM6tTY9JmuNH6U0uSctBuREA+NlcuMM08QT1w/YiPGiA?=
 =?us-ascii?Q?UvYKVuUBOvFqxSeOi1s2HmDS0no/czKsSrX4HI0iK7bGzwgwbNsYRw7ZqCZF?=
 =?us-ascii?Q?C0+P9u0c1ENzHCyfrs9xCFG13kkXYN9fbZWjElxlYuDukG9wmO/yrlMdETtX?=
 =?us-ascii?Q?UeF4j5gfi4MOVSiRWPOSrwJ6y0XHcqlQIZblNgj7XmPaCTvbCr3CBbPi0meG?=
 =?us-ascii?Q?rHYwLwKmQq4/Rk/zcfT4SyNo5P4mygvJkQyEr0HO6mlvaOfZaJ0OixV2qMwv?=
 =?us-ascii?Q?4ferZfLt0w9SccrDFBKy4EvihM6VE8144IP9vg/ZUr22zYFNo8XJc9uT0oXk?=
 =?us-ascii?Q?D0G+yfEYs+Twsab9gUKTTttjp8zNsV6EVIEk27zDaeb9K1WX5Wr+De082avU?=
 =?us-ascii?Q?aoUVXKpWhyT5ywrEuAEbolP3T6W7mEs5Qt8TpVmijmLWGn6lQypKahX9tfvi?=
 =?us-ascii?Q?JtsPdJ7+33xR/Ts0eXo65j2+BsP7xK9C8PZQ5Cyd2OO/e4N8BjvRHFwut2L4?=
 =?us-ascii?Q?K6xBVK+IJFsOyp18FOFGQdEyiHC+66VKF4q/hvXIvG3CmFVCOzRrhweCGj0z?=
 =?us-ascii?Q?h/KEGhGcy5giFmzHOn51DQ80byeRtdP1H7kdLU18NPxCupAXALhPM9ybSLia?=
 =?us-ascii?Q?oIVDC7H29B4FcJO4FZakJqoCHFroprnF7Hg0VlT4KRoT/kHF6Xr57I4ECAE0?=
 =?us-ascii?Q?itBCRfdIQX038luGVYlRsPa26GH6LG7Qw++PecP9APkEcTIkQv5igaL1Zqnr?=
 =?us-ascii?Q?QNQXltWEb/Wgy2Y6hDCFxF8pijXiEisBd0MI1WggSrf2SiNBw3xOFzzRI8/T?=
 =?us-ascii?Q?L5F2GYgNg2Id/HeveZUDiF6FtX0tlf3BKWpZ/wSin9MTSwq047dvSR1JfhjJ?=
 =?us-ascii?Q?OsFsTFa9O9o/Km6w/uCQyOn8+Uex0WbIVU57ZscjRkubOg=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24aced05-801f-4f06-354d-08d8e3094755
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB3148.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2021 14:40:26.6251 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IDBcO+EyLR4VL7Apr6YN83dkbFdJCmjoLAklLK0PpA59z+gvvOy+J5sVAcSi4XogUXKuGbdW3lhHnq4fvZ7GkAAz32f3qPXm7Ydi0Wwpco8=
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
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1011
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
 Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <paolo.bonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Given that we know whether the queued coroutines are reader hopefuls
or writer hopefuls, avoid marking all of the queued coroutines as
runnable when unlocking, choosing instead to wake a single queued
writer or all queued readers.

Suggested-by: Paolo Bonzini <paolo.bonzini@redhat.com>
Signed-off-by: David Edmondson <david.edmondson@oracle.com>
---
 util/qemu-coroutine-lock.c | 22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/util/qemu-coroutine-lock.c b/util/qemu-coroutine-lock.c
index c05c143142..6e399f28c1 100644
--- a/util/qemu-coroutine-lock.c
+++ b/util/qemu-coroutine-lock.c
@@ -356,24 +356,20 @@ void qemu_co_rwlock_unlock(CoRwlock *lock)
     Coroutine *self = qemu_coroutine_self();
 
     assert(qemu_in_coroutine());
-    if (!lock->reader) {
-        /* The critical section started in qemu_co_rwlock_wrlock or
-         * qemu_co_rwlock_upgrade.
-         */
-        qemu_co_queue_restart_all(&lock->wqueue);
-        qemu_co_queue_restart_all(&lock->rqueue);
-    } else {
+    if (lock->reader) {
         self->locks_held--;
 
+        /* Read-side critical sections do not hold lock->mutex. */
         qemu_co_mutex_lock(&lock->mutex);
         lock->reader--;
         assert(lock->reader >= 0);
-        /* If there are no remaining readers wake one waiting writer
-         * or all waiting readers.
-         */
-        if (!lock->reader && !qemu_co_queue_next(&lock->wqueue)) {
-            qemu_co_queue_restart_all(&lock->rqueue);
-        }
+    }
+
+    /* If there are no remaining readers wake one waiting writer or
+     * all waiting readers.
+     */
+    if (!lock->reader && !qemu_co_queue_next(&lock->wqueue)) {
+        qemu_co_queue_restart_all(&lock->rqueue);
     }
     qemu_co_mutex_unlock(&lock->mutex);
 }
-- 
2.30.1


