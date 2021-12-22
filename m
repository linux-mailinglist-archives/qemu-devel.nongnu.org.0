Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC52B47D810
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 20:58:31 +0100 (CET)
Received: from localhost ([::1]:35436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n07ks-0005AM-PN
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 14:58:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1n07VN-00050m-9o
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 14:42:29 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:26734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1n07VL-0008Ng-JR
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 14:42:28 -0500
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BMJXsAh013618; 
 Wed, 22 Dec 2021 19:42:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=kveEkWkvxeKAh6rfynJ5Eui2f/zOXWIb5V9hytChImc=;
 b=uXXC5IO2TT70/cEKkZrWPReARzw8VK0KPUOosxpqXiUcx0LE1K0BaTegpnE2NINS3ipb
 oDHSolOrZvPUbcChXhtnmx7i+xAPPdKKrFP58lQxyQWAhHb6zehZg92CdwNC3bC1jgQ7
 6tr+zYp92URrmRvd2mOJFhpAoHs9mM5UQgADBWmg/t5oZ4zm9MbO6EOZLMlLupBHzoyi
 gXSKmeCSLTmTsRU/Ibqbhe464oI61Duz+A0TEdlVD63KNUIFhRcsd3G/mvphAY/ThQdi
 FMSHR646ym0Fn1shzMrz+Y/Ewx4isWIdSu6IQjI/sc29BeXUugK+GDr2zT7B3CvSJvHU eg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3d46rm0tm3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Dec 2021 19:42:12 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1BMJelqP030437;
 Wed, 22 Dec 2021 19:42:11 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam07lp2040.outbound.protection.outlook.com [104.47.56.40])
 by userp3020.oracle.com with ESMTP id 3d193qamtk-8
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Dec 2021 19:42:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EQF4DlaMv07WzpIlCnRfQuYORHLRfmvznC3bwcQ0tFFT/3fWobsApdTHbq3t6LAubrFQpyr4w0waXwj1DQ/uLNMu+u5ygkDR6OHHjZqWm5j8iKc8iagEjrvn44wTjul+664Rw2TpLOYimloIbWrNTyrIC4myIzzDxB/UrKYrkpCGDKFOiw9tdBaf/LYs3UpxM5sDSNJVCVEkUUC3zOmlf6jqi7BDddnNkJWJcf0mQhZ9ARrVaXXb9SUBy0LAG3n2pdrutSfOee+ExWobOulmiEsd1gXm/jYOVfgX43STJlb2t2YnkZO2FjzF6x6ZkXXS9riNCQ/kICRbpAlGr9q1Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kveEkWkvxeKAh6rfynJ5Eui2f/zOXWIb5V9hytChImc=;
 b=ZKiSISY3HPGHL+XCe/6gxAdkkmzgG1Y5xTdJzMt2vkqVtOTtEB5j09lDbu6L8GsZd4OtOlS2rUX6hSjg9Mb6xSdcuLRgjXErQV8KQ0CORdiiYRpJg1PYeTA/5w6XNk+Lo9pnzsIFN2XB6ZdOjf1IBa+y/ekggJNLvlX3+cbaVZN3VFPoNlPQky8q98RJt0goL4rdHCFQxjWUQ2AKUAqsqdJFICxDs3Y3lDPq/6xiUfkOm/M0KX4TamrBzH5OslNYEOdZcyYycvjSfk+PxcaSwkyf6GsZo4DYQV5vKtQ5NNfUvNDgQUZnjlpoHTp0X9AOSWpbdYPuctL88+pAoSu4Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kveEkWkvxeKAh6rfynJ5Eui2f/zOXWIb5V9hytChImc=;
 b=T36Brc6KxTzWYRtg+gKk6Tqz8Vwkq/RKkbXhFi5Ox9wAKGT2jij0DtyPhc4UJljSZcgMCKNvuUwCik4C0KjS0U3AwNNdclK8cN95S0RERCBqG2N9sBiKu1iPVF84JKKQfCC0Y21lcqTWEuBvD1N8fkaA4VjUbQSbJh0vsQVHTSI=
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BY5PR10MB4242.namprd10.prod.outlook.com (2603:10b6:a03:20d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.16; Wed, 22 Dec
 2021 19:42:06 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::d91d:1a8b:56bd:6623]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::d91d:1a8b:56bd:6623%4]) with mapi id 15.20.4801.020; Wed, 22 Dec 2021
 19:42:06 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V7 24/29] loader: suppress rom_reset during cpr
Date: Wed, 22 Dec 2021 11:05:29 -0800
Message-Id: <1640199934-455149-25-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1640199934-455149-1-git-send-email-steven.sistare@oracle.com>
References: <1640199934-455149-1-git-send-email-steven.sistare@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0196.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::21) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 084a1bb1-1405-46fd-0795-08d9c58322e4
X-MS-TrafficTypeDiagnostic: BY5PR10MB4242:EE_
X-Microsoft-Antispam-PRVS: <BY5PR10MB4242D111BE7D1ED7B53379C8F97D9@BY5PR10MB4242.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uBQxSqEim97fIUHdOnnH+H/PepiRobDekmbnjnoaUTfB4mi7eL6GW2ne7/g9ZFL2cZAiqFkS5aV/bERjZ5+AV8/SqWjzX98qn+XSUn+/pWEJzqgCKW6K//K6/muy1ishhPce8vDSATX+L0VukrVUn5juwWSW4GQkXYjN4Ch2BMa0pTOjYyqEY7scLj7znhg0kZ41gLnXL9TYTjJRtU9J8mwJMfxMHcj32/GirnRDWNtkSNRDTdbg4F13REIDHl0pU56g8GQxXBhm4oVmbRSn9fMRvBhl3RuJ9dsdwccn+xlIGkQkoJdYZ2UesUPAlmCAxHXCXa2V1UjcB6xexqmpWKfepOIvcKvyR1o1gEwvRTC+INQs8Fu7m+OgApecIwFnQeKVtgLkZJh1KbGmFuddJl70SYpmfFSzLb1mFhmkJabQPButIivg86AyuSNrCungwqqeQF+5ZASLhQr9y+NA+g/3DsFFqGeIYqPa7F99NGiY9z+9s3pDOXfVjNWWOmLEdyxo/I+taSL9SXiJRVo1sA8J8tpc1ygHx9YbwO2nUoMuq5+Ga1egfxUSuHCo/12MalhP9k1zDz1qo10GwBZ2MGbfh17n+bbrfdfq5Md1O4ACeO6JPcVFgjIjGVc34Sp/hMXC2C7fZ5pDA6p0wduBNYLOiDSZA/tec9aMXpdF1FWrgA81fe/bgdV+InUYGArkLYbC1pCJlvWG8gNwIkWk5A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(186003)(83380400001)(316002)(6916009)(38350700002)(52116002)(54906003)(8676002)(7416002)(38100700002)(8936002)(508600001)(5660300002)(66556008)(6512007)(66476007)(6486002)(36756003)(4326008)(2616005)(6666004)(107886003)(66946007)(2906002)(26005)(86362001)(6506007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?loVVwl2wdMiLYP2wpaqrEAeOhKaGkxSSnDUHUByRRTC5VHt3SjzJMbnSlPZ2?=
 =?us-ascii?Q?AabHJfx0W+vKATuPa8G/myp57G7/4ikdVWV2HSImhTew4AoxxzPcMHDqNEJv?=
 =?us-ascii?Q?WIiIfjI+OFSMWsXrhK+IVeKnyu7BxYhA5y6UhxGmLMtMJ0NuQtyYDm/DuEQs?=
 =?us-ascii?Q?kr6wogL0Nqxlo6RMxOBe8b745Oxe9mX7FTIoqHdMABqWoKYm8dOieIAVtJQt?=
 =?us-ascii?Q?DfqDz/DSPhYNbhdVk2kF+npCpmoyqSIpnd0HxC1rgxMEGg9pSm2W6IHrQeTX?=
 =?us-ascii?Q?09OWp8pJspLmHDmiSJQw6rc5IEoAJONIHi0yHCxhICfgwGlSVFxBwdXhuJlK?=
 =?us-ascii?Q?lvEiWssfnBs5C3jVGm9Gd709lwMIw8XQd8kiWmrudFaOx02qGgI7CVEdF5sh?=
 =?us-ascii?Q?tdqaxKJM7jqD9CU5Fx6K5tbnShSYZLT2iSxA0TeJ136IIojB0OvZxbJkRufS?=
 =?us-ascii?Q?VJupv2YlV48waXqFcmpMQCWv85lZ1L1ORnc+r5cG3vpfjqJrq2FmXu+tYQjJ?=
 =?us-ascii?Q?3anATru/Mm/kRuDfwwn5OHVWdM39wurvWzi6FRAQl5syZk1o0ezzJtbcqOV1?=
 =?us-ascii?Q?winje0Mv9E3AfFJgL8ggbIxiswyi9Vl3vhVcpPBr8RBbBynVATwBx0BdCFtV?=
 =?us-ascii?Q?VyxVasw1uGEqQ0jXoyOi2HTU4G3HMBsJv/UUbbCh3u7O4yNujZEE5lr7EZVG?=
 =?us-ascii?Q?p2TRFJw8BGXqpI5ssWPZM20QwgeicwScJrnJtyVeGLC6aQhcAq0xjFC60vNu?=
 =?us-ascii?Q?vPIWObwgOSqKvLZhQn3IzXW2zDCA+TCaCuVNk24fLD6poMcztro959I/fWIJ?=
 =?us-ascii?Q?xNuGkxwfbOr4ArQg8nUuIHcUdV2zwUHjYdFvG80qwr2DBDhNYfeU0hh/UCJw?=
 =?us-ascii?Q?Zj82njNYRNowbigTX0rTBeGsmUmJiP/MGPpEGBQW93LJMJD2mOvHixGUYobc?=
 =?us-ascii?Q?huF3/MR34G6RWeVZNsw/SxaX8L328e4T1q0P5AhGtmtX9YZ6IgXH3l9ZVWhN?=
 =?us-ascii?Q?h6DNQfHzUKOVYUTJ49HTpe8rwX+qMvObn8i/JNkyg+MdcRk5FxFtymCF7ACS?=
 =?us-ascii?Q?lsGtJbtLqoZbNqjzXesuXxD9WSowt2sUI2fR3kstF02yJQrTeyM4MTkico1/?=
 =?us-ascii?Q?lrZIEwsDR7K8nbBwWohx2dH29u7vT79ATmnxogB5vmrQlMi6yAQ660y+gOT3?=
 =?us-ascii?Q?2+yvPqT86SMOWib3NOdLc5Szccmttv1nBNcK9Wh/lMU8bebNEZIAMTbJItkQ?=
 =?us-ascii?Q?eQ/Gd8Rv15xCdTxDdwLw2wwNFTmTJlv/tJ5tfIJEBgfkOBnkS7tVWQ4lP8Qm?=
 =?us-ascii?Q?UtTBaVM0FK2/6qT+NsSLoHZRpwmv7TqVK39iOuwe3HqrQiOXcqufU4onvJwa?=
 =?us-ascii?Q?Nc5eZNu4zVH0JCS83XzhsCqxiKS17O21jYyZA3vGGVGOxBd4DtqeemdAvdkR?=
 =?us-ascii?Q?ru68B6pud3O4yrJTAxqd0dKWomuGn0ErCt/259iXMLqSn96FNxXgozFl3R5V?=
 =?us-ascii?Q?ZgcCWgmgVCgUr4lZztj/OUVlZBUetUw8tota256f5GMHdhxiGBbbEJNhpLmt?=
 =?us-ascii?Q?7xvPVQRcSuKXH7eZU2dv7vyHQozuW2Ah0WSrTzY4JYtsmCIHC6cZuPoZoiVX?=
 =?us-ascii?Q?aj57g2J1DcTgaL4Bh3cwax8FKWk8zZ7rXPcqSBr/QNY4F+J0XiGvtcbqrFoY?=
 =?us-ascii?Q?n0Pv1g=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 084a1bb1-1405-46fd-0795-08d9c58322e4
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2021 19:42:06.8267 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2Ttr96z3+ISo1iFkCj+xBN1+1z/aVFKD5MSNaZfKrt/dG8Rmm8b6Z9Zid0DdvZYDxsbGd0rcbCd+sxYrf3zN/+wyO7392dKvE5xihVfrOgc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4242
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10206
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 spamscore=0
 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112220107
X-Proofpoint-GUID: LiYsv7TXGr11aE67xLrEGrla9izG1uit
X-Proofpoint-ORIG-GUID: LiYsv7TXGr11aE67xLrEGrla9izG1uit
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Zheng Chuan <zhengchuan@huawei.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Steve Sistare <steven.sistare@oracle.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reported-by: Zheng Chuan <zhengchuan@huawei.com>
Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 hw/core/loader.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/core/loader.c b/hw/core/loader.c
index 052a0fd..e88fab2 100644
--- a/hw/core/loader.c
+++ b/hw/core/loader.c
@@ -52,6 +52,7 @@
 #include "hw/hw.h"
 #include "disas/disas.h"
 #include "migration/vmstate.h"
+#include "migration/cpr.h"
 #include "monitor/monitor.h"
 #include "sysemu/reset.h"
 #include "sysemu/sysemu.h"
@@ -1137,6 +1138,7 @@ int rom_add_option(const char *file, int32_t bootindex)
 static void rom_reset(void *unused)
 {
     Rom *rom;
+    bool cpr_is_active = (cpr_get_mode() != CPR_MODE_NONE);
 
     QTAILQ_FOREACH(rom, &roms, next) {
         if (rom->fw_file) {
@@ -1147,7 +1149,7 @@ static void rom_reset(void *unused)
          * the data in during the next incoming migration in all cases.  Note
          * that some of those RAMs can actually be modified by the guest.
          */
-        if (runstate_check(RUN_STATE_INMIGRATE)) {
+        if (runstate_check(RUN_STATE_INMIGRATE) || cpr_is_active) {
             if (rom->data && rom->isrom) {
                 /*
                  * Free it so that a rom_reset after migration doesn't
-- 
1.8.3.1


