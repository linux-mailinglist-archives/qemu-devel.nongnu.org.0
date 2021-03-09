Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0935A332A3B
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 16:21:17 +0100 (CET)
Received: from localhost ([::1]:43652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJeAc-0006k3-3a
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 10:21:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1lJdXQ-0002wf-5m; Tue, 09 Mar 2021 09:40:44 -0500
Received: from userp2120.oracle.com ([156.151.31.85]:52522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1lJdXE-0003so-AW; Tue, 09 Mar 2021 09:40:43 -0500
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 129EdG9n174401;
 Tue, 9 Mar 2021 14:40:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2020-01-29; bh=pvrIToVSpar3E6aZZeMOPhI7q+h/49M50w+RUBHTSDM=;
 b=p+B7aLvkXOkzdetpQUWs+o5Y0Xn7pmb4On4VGjshvNz2aDAGmpLYexf2LH776acl+7SI
 BL0yK/Us9uKffJ3o52Y8BYudOh72uD4QrJYwvHPPm/bLOrCqaxUBSV6VYpZ/Qg7ftaGx
 uFah2+txIDlyBqrQEvA8CSlAudgw6ZI0+cKKHD+9zHGM4nQnL3n7nU5A64gBVg32aSCA
 EKfXlKjmB7af9EMum0CqO8tkPmI2V6a8aBDYDv9G1v20KKlvNMDD0q9V/0UW5pnd6PrO
 tfo2g7kRiw/WAEihXqtRXiyYjKnE1qB8TD0OTuwh7T7CMoX05UmX2Y+Dmm7qVlChnoPx BQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2120.oracle.com with ESMTP id 3742cn7fe2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 09 Mar 2021 14:40:30 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 129EVOYs193150;
 Tue, 9 Mar 2021 14:40:29 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2046.outbound.protection.outlook.com [104.47.66.46])
 by userp3030.oracle.com with ESMTP id 374knwwjvh-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 09 Mar 2021 14:40:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ULl4soq0tdMWBfj2bYxSI4oWrEDkuNOilaW11cfkaRrndZxhLr6whoIOERzbH2cQbX3gZm0b0IcMrb6n00Lr7tQC1H1e1d1+Qcr8GAEONOUc95LSx6SPGuoZl7IB8xYtGZ+/z0BBrFoFfbjKGOr+8miCyvDT9rCmt6Ts5oD/SZQTlbU375z7sHdra1GOs14bdSZMDBVqqUpnGMFA/bPrb1InM+xDD4g5bZhzTZMKo1MYYpwQgCtmrAs/DcwmrrzylS50V7V9V3ytfoWlA/RdFj810VkgJMg6RYH9wX2PLB4lO/AvHR0eo+1SBaIPKZz7vVoRUAR5BZutRSHblrwryA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pvrIToVSpar3E6aZZeMOPhI7q+h/49M50w+RUBHTSDM=;
 b=GnE8/zzL95Yc+BMeSdGoauLNuGzO7cKqCGkOFtt37lwIcvC24MgGVUvTDdp4Easg1Nryddij9YN7SdWdFHwk7O6QierC1rHu/HOtFBjvPGLAW+cLOIP2BfG41IYNW+MekY1SJLuuL9rlOcqrcaLXG+2+mdsb6TPuqbuN6o8H27iKYhZGax8bkkQLcnnkFuXtA/XZXXdTVTkJ6PTf5Kt3/j4M//RDzSbD8wGHOZG1Au1TRTZrZWjR5SzLVyTwmdAiciG145uxrK1uKZkGAfvCMEaBwC5gkaGVD2mkVpU/eYKJJGWfQHOOeb2EcNRn6Q5DylzYOl2dEAc0mUfuF+ZWQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pvrIToVSpar3E6aZZeMOPhI7q+h/49M50w+RUBHTSDM=;
 b=uEWvoIdPCP+lHgD9ToObt4zUu+BCcepqwz1SSNqQ/lBlBQqMWXuSHB5bJwhANTTb+i/1vTqh0Q6dcr8sLi3H6n7exM+hqGbDUNAYC7QFH6i0yNyMoRkmsyW+vLdLgVlsjHCKmnkXWkkfgRca22xOcxCLezP8hqsUZ1jXzHRE0/4=
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
Subject: [PATCH v2 4/6] test-coroutine: Add rwlock downgrade test
Date: Tue,  9 Mar 2021 14:40:13 +0000
Message-Id: <20210309144015.557477-5-david.edmondson@oracle.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210309144015.557477-1-david.edmondson@oracle.com>
References: <20210309144015.557477-1-david.edmondson@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [2001:8b0:bb71:7140:64::1]
X-ClientProxiedBy: LO4P123CA0438.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a9::11) To DM6PR10MB3148.namprd10.prod.outlook.com
 (2603:10b6:5:1a4::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from disaster-area.hh.sledj.net (2001:8b0:bb71:7140:64::1) by
 LO4P123CA0438.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:1a9::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.26 via Frontend Transport; Tue, 9 Mar 2021 14:40:23 +0000
Received: from localhost (disaster-area.hh.sledj.net [local])	by
 disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id 4a6187d0;
 Tue, 9 Mar 2021 14:40:15 +0000 (UTC)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 83b06348-a26c-46d3-aee3-08d8e309465f
X-MS-TrafficTypeDiagnostic: DM5PR10MB1771:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR10MB177165BC5D23AACE4DB10DCC88929@DM5PR10MB1771.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jtVmiYuFmqBee05eYiyD/AnWGzH5l2OcGhm/L201AjOf0liADoYeOwfa721ZhZCnMtDr0rvM/ZVIrRUZbgPlZ9xBpqsAiS7Of70alwkVlm/YBxd6mXdyq2cEIPKRygDcjidoazprXdJn+Vs8i1qDfJumnGSth5GsTE7ZBAPTGpOJpABRvqMicBErxbZxPw/Gz40p/GJJ/YFCTwjtEOZVt8+UYtD6ojziP9o6Cr+THn5y1Nb/v/LhGEExzgkUFhCItiKrQ6I9PJputGfWVcVf32EnYyAe5QBOyW1Xvd1yMwJYMmfth7TFn0E3vIKQXnPr7cZikygVv9X95s2kEMGJJwKWMBfHmTj2UUkyUnu9aXtmRW+NyJNPyqGBKtiZm+Ej3s/QoA8pI3j9kdeLi96a6BaQo4dBqFg156jG2aFkKlvrKYkfjy+zoqGN6CVhO/phZUBCLSlwqLY3ggjZfX6XefSooLyBeDmf9FS/42/iX5nRRTiSn+x+3BzqCpwIWr+mk9FcyAeFd41h3wcnKRwa7A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR10MB3148.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(39860400002)(346002)(396003)(376002)(136003)(86362001)(186003)(83380400001)(66946007)(44832011)(316002)(52116002)(1076003)(36756003)(8676002)(8936002)(107886003)(54906003)(66556008)(6916009)(478600001)(2616005)(5660300002)(4326008)(2906002)(66476007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?pfTQM7KLxUTzZwMMULsqBh+snBHQHgJgryj+Z/LgwjiCKmWq2jTnt5Acibel?=
 =?us-ascii?Q?jKKU53hqPYdh3jb0fScto0Ip+LQO0jRmmVk+d2F/ziHcV+hTlZDb5Bw2E7Md?=
 =?us-ascii?Q?ug3tUuePS1ARvAURfpzJf+IBzWygSwE9FDl75eQNkez4hzQcTP7rchyimZey?=
 =?us-ascii?Q?E2G8GqbdbozA9SYp3bZMmNnVMEvSfjMoMHrOoOtktlh1LVnSR7tOfef6ifNL?=
 =?us-ascii?Q?WrfnuD1fvFBDXZRN/WmQ+sjI4Zwz9Gqa+UqWJS3rwxrfDwrN2uZEmrSAbujO?=
 =?us-ascii?Q?yP+doXw3VMZNCScQXZuE4CGuHGKHJfG2umyGyfgrJwxEcXkHzxnVcrQvr4us?=
 =?us-ascii?Q?MLAl35Xj8Fd8Qmdo1f5WVdXqOoCM5XaW96Emk0mSG9lahOY0ftJZHJFn33r9?=
 =?us-ascii?Q?/6jjUmI9VlSfgWBNTdjQa5AqYR78aojB3qAESbIUQ/fBd6FHO9skkOobO4Jy?=
 =?us-ascii?Q?SEh198q66UgV0vhNeqHCPfAH+yYLYnV1vQ8E3EWsu+sde1pJw+IP5ABS+lkX?=
 =?us-ascii?Q?8f70iOjertf7jqjdwg+tUUdATvDfwtBX2TgXu7x8Gqk1jsNsG8+dcODFVuGO?=
 =?us-ascii?Q?v/JxxGBrEox9fNVNBGfna4nKe0TJryJbof6myt2V9zEM186rFZrigJZFWiY6?=
 =?us-ascii?Q?GfNVYrJ0o5JgnZ06Z95jNgF3c1M/NEH52K4OO9HW+gyhRc1bRZos3hdyjjlT?=
 =?us-ascii?Q?OUDwAG4qsqx7io1sdgzPsSWXgRH40KFlLS/t1zf9o4LWBrRht76yztrE08Gy?=
 =?us-ascii?Q?iwNmS7LanxKC54n1n8aUtpPEuw+OYTAguaob8J/slJ2mKUWZiJGWt9w4eNZi?=
 =?us-ascii?Q?YpWbQEfqB1+ZVHKD5il8To2QW1d07AMxRCO3wZaTvutjLSan4DlAOQ/S2eN6?=
 =?us-ascii?Q?DXpXISyxPo3DEKG5T1eCzvKM3i3BPI0jcYjtDTyZpKHCWKAwRU04tUHAS+3E?=
 =?us-ascii?Q?TPCFQcERPBKPoInqGRr+uNfVdSUYyYQfTRB2VmhHddL0yQC+HwW7jLaYmqUL?=
 =?us-ascii?Q?w2X3+tq3WdserPvueQUl5i/sqgCv4qCijr+i0pw3sQ3/kwVkyvUdfe6iM05K?=
 =?us-ascii?Q?jWWg2a7TFCCbhU3QOpu3G/0B5sLpOkvjtIHlbOKm+yuc63TDaGaEHwoYKxHw?=
 =?us-ascii?Q?BlYGpZkDM7Xi5bEYZoAE+AKukUvbmjiVRAu5r/khguoKdsyuLunnw5nZLTnR?=
 =?us-ascii?Q?mB7D/q4BfyxYbQc/U7WWQxRSirgerJObpLS2BJ8yWYmTbya9XC4AL/nVGn1G?=
 =?us-ascii?Q?qMHFJyXeb7LZF4St35XWB4ylZPcYbwlvRiWRZeGfzy6J3HJYHN66rSwV2lo1?=
 =?us-ascii?Q?jWCy/rdwXtdKwulbZhfRcws8ulhXNfblVueny+Lph5coMg=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83b06348-a26c-46d3-aee3-08d8e309465f
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB3148.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2021 14:40:25.3118 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xsbZXzFJ+O52+pxBFfVf54gyEMg/qkkEHgee/BHih30NaTmbrChQQAjC5DdI4uoqZhtSFB0gdI2HzkHcwrFw4ROXhoB2GpW7Wwwa6xrhs2Y=
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
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 suspectscore=0
 clxscore=1015 phishscore=0 adultscore=0 mlxlogscore=999 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 mlxscore=0 impostorscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103090075
Received-SPF: pass client-ip=156.151.31.85;
 envelope-from=david.edmondson@oracle.com; helo=userp2120.oracle.com
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

Test that downgrading an rwlock does not result in a failure to
schedule coroutines queued on the rwlock.

The diagram associated with test_co_rwlock_downgrade() describes the
intended behaviour, but what is observed currently corresponds to:

| c1     | c2         | c3         | c4       |
|--------+------------+------------+----------|
| rdlock |            |            |          |
| yield  |            |            |          |
|        | wrlock     |            |          |
|        | <queued>   |            |          |
|        |            | rdlock     |          |
|        |            | <queued>   |          |
|        |            |            | wrlock   |
|        |            |            | <queued> |
| unlock |            |            |          |
| yield  |            |            |          |
|        | <dequeued> |            |          |
|        | downgrade  |            |          |
|        | ...        |            |          |
|        | unlock     |            |          |
|        |            | <dequeued> |          |
|        |            | <queued>   |          |

In the test, this results in a failure...

ERROR:../tests/test-coroutine.c:369:test_co_rwlock_downgrade: assertion failed: (c3_done)
Bail out! ERROR:../tests/test-coroutine.c:369:test_co_rwlock_downgrade: assertion failed: (c3_done)

...as a result of the c3 coroutine failing to run to completion.

Signed-off-by: David Edmondson <david.edmondson@oracle.com>
---
 tests/test-coroutine.c | 112 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 112 insertions(+)

diff --git a/tests/test-coroutine.c b/tests/test-coroutine.c
index e946d93a65..62b0092721 100644
--- a/tests/test-coroutine.c
+++ b/tests/test-coroutine.c
@@ -264,6 +264,117 @@ static void test_co_mutex_lockable(void)
     g_assert(QEMU_MAKE_LOCKABLE(null_pointer) == NULL);
 }
 
+static bool c1_done;
+static bool c2_done;
+static bool c3_done;
+static bool c4_done;
+
+static void coroutine_fn rwlock_c1(void *opaque)
+{
+    CoRwlock *l = opaque;
+
+    qemu_co_rwlock_rdlock(l);
+    qemu_coroutine_yield();
+
+    qemu_co_rwlock_unlock(l);
+    qemu_coroutine_yield();
+
+    c1_done = true;
+}
+
+static void coroutine_fn rwlock_c2(void *opaque)
+{
+    CoRwlock *l = opaque;
+
+    qemu_co_rwlock_wrlock(l);
+
+    qemu_co_rwlock_downgrade(l);
+    qemu_co_rwlock_unlock(l);
+    c2_done = true;
+}
+
+static void coroutine_fn rwlock_c3(void *opaque)
+{
+    CoRwlock *l = opaque;
+
+    qemu_co_rwlock_rdlock(l);
+
+    qemu_co_rwlock_unlock(l);
+    c3_done = true;
+}
+
+static void coroutine_fn rwlock_c4(void *opaque)
+{
+    CoRwlock *l = opaque;
+
+    qemu_co_rwlock_wrlock(l);
+
+    qemu_co_rwlock_unlock(l);
+    c4_done = true;
+}
+
+/*
+ * Check that downgrading a reader-writer lock does not cause a hang.
+ *
+ * Four coroutines are used to produce a situation where there are
+ * both reader and writer hopefuls waiting to acquire an rwlock that
+ * is held by a reader.
+ *
+ * The correct sequence of operations we aim to provoke can be
+ * represented as:
+ *
+ * | c1     | c2         | c3         | c4         |
+ * |--------+------------+------------+------------|
+ * | rdlock |            |            |            |
+ * | yield  |            |            |            |
+ * |        | wrlock     |            |            |
+ * |        | <queued>   |            |            |
+ * |        |            | rdlock     |            |
+ * |        |            | <queued>   |            |
+ * |        |            |            | wrlock     |
+ * |        |            |            | <queued>   |
+ * | unlock |            |            |            |
+ * | yield  |            |            |            |
+ * |        | <dequeued> |            |            |
+ * |        | downgrade  |            |            |
+ * |        | ...        |            |            |
+ * |        | unlock     |            |            |
+ * |        |            |            | <dequeued> |
+ * |        |            |            | unlock     |
+ * |        |            | <dequeued> |            |
+ * |        |            | unlock     |            |
+ *
+ * Significantly, when c2 unlocks the downgraded lock, it should be c4
+ * that is run rather than c3.
+ */
+static void test_co_rwlock_downgrade(void)
+{
+    CoRwlock l;
+    Coroutine *c1, *c2, *c3, *c4;
+
+    qemu_co_rwlock_init(&l);
+
+    c1 = qemu_coroutine_create(rwlock_c1, &l);
+    c2 = qemu_coroutine_create(rwlock_c2, &l);
+    c3 = qemu_coroutine_create(rwlock_c3, &l);
+    c4 = qemu_coroutine_create(rwlock_c4, &l);
+
+    qemu_coroutine_enter(c1);
+    qemu_coroutine_enter(c2);
+    qemu_coroutine_enter(c3);
+    qemu_coroutine_enter(c4);
+
+    qemu_coroutine_enter(c1);
+
+    g_assert(c2_done);
+    g_assert(c3_done);
+    g_assert(c4_done);
+
+    qemu_coroutine_enter(c1);
+
+    g_assert(c1_done);
+}
+
 /*
  * Check that creation, enter, and return work
  */
@@ -501,6 +612,7 @@ int main(int argc, char **argv)
     g_test_add_func("/basic/order", test_order);
     g_test_add_func("/locking/co-mutex", test_co_mutex);
     g_test_add_func("/locking/co-mutex/lockable", test_co_mutex_lockable);
+    g_test_add_func("/locking/co-rwlock/downgrade", test_co_rwlock_downgrade);
     if (g_test_perf()) {
         g_test_add_func("/perf/lifecycle", perf_lifecycle);
         g_test_add_func("/perf/nesting", perf_nesting);
-- 
2.30.1


