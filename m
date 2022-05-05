Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7872651C67E
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 19:45:58 +0200 (CEST)
Received: from localhost ([::1]:54182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmfY5-0007JU-HM
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 13:45:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1nmf0t-00069B-NI
 for qemu-devel@nongnu.org; Thu, 05 May 2022 13:11:45 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:28874)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1nmf0m-0002Dh-Bz
 for qemu-devel@nongnu.org; Thu, 05 May 2022 13:11:36 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 245G9xWB027626
 for <qemu-devel@nongnu.org>; Thu, 5 May 2022 17:11:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=LSoWM2+bLwAdmEE//LrstuXMLj/duRf80GNLCbTNwIk=;
 b=J8DPCXZ3c1e+AlTBf18lZPzNGSFwhCA+grlw3NFuBmT1XZdSGAfWZxPMs0y2yKPGNIMf
 h+eNS45UAzLzAT4PL+1pgn+y6+ONP+VFjqn5oZHPB3fp3XxMAFZii/JNcD7/QXPEJp42
 oG8P5/qSj6L9HDLfZnIRzAA8XxjU3crXTEqfp6RGUp7B688FiwrrndbE6UhE2vjej0zp
 As2jYzAk+HfLPK1F9snBAxykx/pxZngyk8ZmKOFAwikgS0PLBrsgDHXX2mJSAqUZWodv
 6kfVDVKmybadsPxuYz8b/FwaT9PgJ8eQoMG8vDrBAJeF9FUxugQYr2dU+IhUo2kO7T8Z 5A== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3fruw2m0nc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 17:11:31 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 245H1O7l001931
 for <qemu-devel@nongnu.org>; Thu, 5 May 2022 17:11:30 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2172.outbound.protection.outlook.com [104.47.55.172])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3fs1a7amx9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 17:11:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TkdDw+5onwuQHfutP+VHdQ30LqDxF2EN+IRlfK9t/mS4YEXeP16KNf1GKeqYcwcoVSV0PD4yjjSXKSsHWPNax6qj4tNZ7jlXgxjyA9s2EWOJNef4qdkcARKelxFREn7rKX8DXVFfwo3aKlKZZamlOG/1rEdfeD4yRsyip23MlonpvZEx9KLA2gwA65vhgvzHKG0gaMsEYnUKJre9W07sbcFHq0RQByi/V3Oim06J6RlnhY/N6v5mzjpZPHpiXHwaVExfw16k0KKz7c2xo5D7xXlA7ZLVLUONgFEybaAntB5CuV4ENVoVfOMhpumyUUEqK/f0Jgg/4uLdi583hL/mJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LSoWM2+bLwAdmEE//LrstuXMLj/duRf80GNLCbTNwIk=;
 b=L8Ntz+Z/ItSTyCRl1ujbG+ojIcrlfgYUN+sGyhRvUykvRLbMmfDUR2RKzNxEfu4++TcrhIj1KwPBtXDVzvu7ZokKa5P6tcC/uP3vlsLnuuf+WRmbLJQg0D+N9gsvalYoQv3CbkeilUmciRCC+8Ia8k41QERdWXZX1Dhpny4Oxgmln+IzTS1XQw7n01PYa/HK/9ESdri7RT96hRgyn1UKn0LpSf3CuvqJDR+Dn70zGJGxOdt9V/BdUBNOh/7dt+Xe17FAlcbXZSASNGv9BcCWOuQYq2S+9a25T6sCjhNg67SnWNbjYZ7d9LE9NXJgQD8pglINRcMwCKi1xJZ4cN0Lzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LSoWM2+bLwAdmEE//LrstuXMLj/duRf80GNLCbTNwIk=;
 b=sHvcaXqjdEpEVSLBUhXGIVQtdnmcb1IctxfapV1GEXuDuD20ZbEWOBCAUOxEsLpOYSFEy5YdaSZYk7eVcohccm1FZ8LaI+gSJCajj1n44TEesjgZcWQWpupMEGl+pPg76RGwviewaCg9Z62lqio7PBK0puGt5KHhPvfpcIlKcgI=
Received: from BYAPR10MB3255.namprd10.prod.outlook.com (2603:10b6:a03:156::22)
 by BN7PR10MB2689.namprd10.prod.outlook.com (2603:10b6:406:c3::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.27; Thu, 5 May
 2022 17:11:28 +0000
Received: from BYAPR10MB3255.namprd10.prod.outlook.com
 ([fe80::cce6:1c15:c6bd:dd05]) by BYAPR10MB3255.namprd10.prod.outlook.com
 ([fe80::cce6:1c15:c6bd:dd05%7]) with mapi id 15.20.5206.027; Thu, 5 May 2022
 17:11:28 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [RFC v5 22/23] vfio-user: add tracing to send/recv paths
Date: Thu,  5 May 2022 10:20:05 -0700
Message-Id: <115153bd4c41c4b2e2d5b046e76fc0f06ea3bf78.1651709440.git.john.g.johnson@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1651709440.git.john.g.johnson@oracle.com>
References: <cover.1651709440.git.john.g.johnson@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BYAPR06CA0048.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::25) To BYAPR10MB3255.namprd10.prod.outlook.com
 (2603:10b6:a03:156::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 37260f08-27c2-4719-8c74-08da2eba47ea
X-MS-TrafficTypeDiagnostic: BN7PR10MB2689:EE_
X-Microsoft-Antispam-PRVS: <BN7PR10MB268961F814CAEF7E8458F502B6C29@BN7PR10MB2689.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Y6GnIn2+ELi+U4G+LAG4v3qbc8QOEvS1cSIde7aamOWBIhp9IO3YR4BmG+9g9du8BpPKgV1iSuIidEk7zLd67Dj6DTetM45mr5r7PlmifznxzzT53DZGvBxxr/BIGAjbKHm6/Y5GzZxPWKJDQZRnheOdDRQ05Rr54gW6fbZg2sUNv9kCADQA1gVEa/c8URyvweJDRaJvHq/0l0fAKzD9jicJS3gxbTYL4EGtwKoM0pj8eu/Jlr9Q7yXE+loTvzpAiHUzGUj37yM/Ks9vcTjB1N7H+MMKZMGikvx6jfSEE0zEtmjK2vqcMai5NSgvOUKL0aL/gPdpNPCTSlt718s2/W2YfjNnzQIvEi8rlCGEFXdyQTNTApb9TaRGVgQG6TwpzLNWz/rnZ2WELt+/hm1N3HDjTvpHWLECD19RBTMu3tFvkC6JGH7BgUwewT3MKDp/W/t9/ab3ckHVhguegiLTYUlJFZe/pr4cP5/b3A5NwMg2FccSrrmc3L/hOFMV8aFTz2etCmrKgPffctK3Man+dFYCp+NII1JGyAKb0RIXTR8KsKOewlsG/40ZQTZ3GuUfn4yGmwWAPlmhEKIH2tEkGTiE1vFaxGrxDDHQ2OFVxC0THRTtUVn5F2xtVEBD5WXWhf4TVw0HJcZjQ1fk/yAAJiCjqD5pzo57fKq9IJt81UQTUKex8R8VME6Xwq0tQP3A0eLRTNYKrqZdFyF5vGqy7Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3255.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(38100700002)(83380400001)(6916009)(6506007)(6512007)(38350700002)(316002)(36756003)(2906002)(2616005)(26005)(66476007)(8676002)(86362001)(186003)(66556008)(66946007)(6666004)(52116002)(6486002)(5660300002)(8936002)(508600001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?08ne6mxm/6Tc6mtUkrDGENaELbzEDTTV6OB1LRCyxUhX0sxsDcm86GpLc2Bg?=
 =?us-ascii?Q?aOsiaJd1lohuhdcXSVLFq8Oj69U0NUGI5E7BA/tyGSCM5SSe4/j8Uwr8UpVM?=
 =?us-ascii?Q?LWc/5XThm02Y387WorDVuH2GsuRsG7HeUeGvy4BsGMOty1Moi6O3jDeiNvdo?=
 =?us-ascii?Q?reEfDFbkX9ICThuakSOHHvL0nn0UEqPGFk+DHl6wQaiZ4NXDk9LjxIrOQM5g?=
 =?us-ascii?Q?+biVX9kIAAEMmQ5XZZwrM0SGoxn0r4Ec/M5lPfKvuhuTlT2msniG/8skQtjQ?=
 =?us-ascii?Q?n1tLVaRQ5fUGVRN3nwOcRa32iY92LDuPylD/YFscqiWcNjoGy6SCkwYHwbzn?=
 =?us-ascii?Q?G9m1K2QhU+pmW70wU+xJ6QDV+jUkaaKAlz86njsWVbxdohj/kH4C23AfAozx?=
 =?us-ascii?Q?asryZzFeO81C0GxoNN2ir6vSCoronT1GCDi1nu16VZJIdMwPmqNJsMdS3JZh?=
 =?us-ascii?Q?UCpXUqfhlUCpI1asCxI+S3ZCF7x7cfYVTxbx/8R4SCBJa0W5LHCaBvwvpKuh?=
 =?us-ascii?Q?KzerNXVHa7rLVRvXZA3ICL+T8zdqyFLfot3rOgik4wRuR8koxLYwtcwAaMMr?=
 =?us-ascii?Q?aYsLu7wVIYmUYGv4Y6rZPfmp9YWZCVz/T6LO6v+VynOBJK7md06d1snG6Nsr?=
 =?us-ascii?Q?9WEJnjghtweNhhjBQDKfEodxhj+JXl+ShqJw5MVysLgBG31ilQmu4GeBARlj?=
 =?us-ascii?Q?GHJjmHKjpw3Hss/KWafxLcELSc6LbGSljcIjJC63fsANqp9NBiK0+6bEiu+u?=
 =?us-ascii?Q?mwjpPfz9Rw//MTA7sm6oqmbba8wT1A3Pw4IZUP/BC6rXAyNba4H3SEblF/Mm?=
 =?us-ascii?Q?FhkHYzpQerEtdGcHWojIjcffAJoWRuYTWIbLM2n0oOntPG7d6fb46QDxxI3P?=
 =?us-ascii?Q?CucmYRxp6llH6tDFt65UZ0I0pX7qkCDT36rHahQP0Ayljdl3ecPivt15D/YD?=
 =?us-ascii?Q?CKet6rwyV2iiV8rsN0ZBDDcVOaLb57cv5RB7RbL1XFkitS/G706dRVNGeMav?=
 =?us-ascii?Q?UMbFP2i7XvAvP81ok64X+4fDssNrHLy28DuM4/2IZ8ns8vhJevwln++TxV+n?=
 =?us-ascii?Q?lJPy1/YakjPDjbIzBUh1oh3b9VXA6avIwiuF6UEzervi+kRSYf4jsOCIPCw1?=
 =?us-ascii?Q?jk6OCd1DOmTcjih5OUPRTd7kI2+8p3uI2Gur77baazcFcL/jxCdq3LswtAYc?=
 =?us-ascii?Q?V63h8Co58gCnSHtII84LzIiAFJTg761ZZACxaQCXvjvLVQ9LxpFUKXzv7g1u?=
 =?us-ascii?Q?ziQsCgbn7r3s1q8jl1yF87SVjdANKjAF5Y8kNRr/F6VLqp6TqTq213TkfRBg?=
 =?us-ascii?Q?oLSkijQ6yNfEeA6FqmufziEeOtJKrlqCPQZ0KKb8VObZV0UKYRkfOh3Ha9nG?=
 =?us-ascii?Q?aYC3cZxknC33ISmr0IVB/P2hnY+GBP/RiiSKvLE9W6Enl2oB9rcPRxCZpXxl?=
 =?us-ascii?Q?Wgd6VaTR5yjVVD/LwQ3qJxHLSRs6sbrk52buJ3sMwTCSZHqHDAlTve7hLmfT?=
 =?us-ascii?Q?ZnS6fv3VREMB5duJL2qWdjtIMFJXskUlDL96MzXjfIbk41ZNsD6xehxN92qr?=
 =?us-ascii?Q?A7uNSjw9GEKy7fbFX++pTPvQRzReQsmiWqkBQm8vCpenLB4NFbCXzQwR6NWZ?=
 =?us-ascii?Q?ifng/CHYJ/UeMR5z3EK8nsJPula2NYgcML81p9NSdrMokqlTkZaLvK/mHs38?=
 =?us-ascii?Q?PnCldH//HwT67lixrA0ZWbNJ+cSTvlzszoO7WmxBNg+9tUH5zEMS3rVQGKTL?=
 =?us-ascii?Q?QZaDueNKN9scqiAQJ1msbNGbWHsyu2c=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37260f08-27c2-4719-8c74-08da2eba47ea
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3255.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2022 17:11:23.2944 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GCVdYrxJdbzpcpNZfpTc8rKHcAT0BIfetgSu5kKr4OvujkBnPi8E6lQK6ViId7agWNePPGDEYySlBa+OmVKUjMN/L6Af5ibmRok3s5CK3SY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR10MB2689
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-05-05_06:2022-05-05,
 2022-05-05 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 bulkscore=0 malwarescore=0
 spamscore=0 mlxlogscore=999 mlxscore=0 suspectscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205050118
X-Proofpoint-GUID: kOoTNEWmFFzVcNTV5LLXYuoj3fT7KEfN
X-Proofpoint-ORIG-GUID: kOoTNEWmFFzVcNTV5LLXYuoj3fT7KEfN
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=john.g.johnson@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 hw/vfio/user.c       | 8 ++++++++
 hw/vfio/trace-events | 5 +++++
 2 files changed, 13 insertions(+)

diff --git a/hw/vfio/user.c b/hw/vfio/user.c
index ec2d89b..a3e4dc8 100644
--- a/hw/vfio/user.c
+++ b/hw/vfio/user.c
@@ -29,6 +29,8 @@
 #include "qapi/qmp/qstring.h"
 #include "qapi/qmp/qnum.h"
 #include "user.h"
+#include "trace.h"
+
 
 /*
  * These are to defend against a malign server trying
@@ -111,6 +113,8 @@ static int vfio_user_send_qio(VFIOProxy *proxy, VFIOUserMsg *msg)
         vfio_user_shutdown(proxy);
         error_report_err(local_err);
     }
+    trace_vfio_user_send_write(msg->hdr->id, ret);
+
     return ret;
 }
 
@@ -227,6 +231,7 @@ static int vfio_user_complete(VFIOProxy *proxy, Error **errp)
             }
             return ret;
         }
+        trace_vfio_user_recv_read(msg->hdr->id, ret);
 
         msgleft -= ret;
         data += ret;
@@ -334,6 +339,8 @@ static int vfio_user_recv_one(VFIOProxy *proxy)
         error_setg(&local_err, "unknown message type");
         goto fatal;
     }
+    trace_vfio_user_recv_hdr(proxy->sockname, hdr.id, hdr.command, hdr.size,
+                             hdr.flags);
 
     /*
      * For replies, find the matching pending request.
@@ -410,6 +417,7 @@ static int vfio_user_recv_one(VFIOProxy *proxy)
         if (ret <= 0) {
             goto fatal;
         }
+        trace_vfio_user_recv_read(hdr.id, ret);
 
         msgleft -= ret;
         data += ret;
diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
index 0ef1b5f..ea4bd7e 100644
--- a/hw/vfio/trace-events
+++ b/hw/vfio/trace-events
@@ -165,3 +165,8 @@ vfio_load_state_device_data(const char *name, uint64_t data_offset, uint64_t dat
 vfio_load_cleanup(const char *name) " (%s)"
 vfio_get_dirty_bitmap(int fd, uint64_t iova, uint64_t size, uint64_t bitmap_size, uint64_t start) "container fd=%d, iova=0x%"PRIx64" size= 0x%"PRIx64" bitmap_size=0x%"PRIx64" start=0x%"PRIx64
 vfio_iommu_map_dirty_notify(uint64_t iova_start, uint64_t iova_end) "iommu dirty @ 0x%"PRIx64" - 0x%"PRIx64
+
+# user.c
+vfio_user_recv_hdr(const char *name, uint16_t id, uint16_t cmd, uint32_t size, uint32_t flags) " (%s) id %x cmd %x size %x flags %x"
+vfio_user_recv_read(uint16_t id, int read) " id %x read %x"
+vfio_user_send_write(uint16_t id, int wrote) " id %x wrote %x"
-- 
1.8.3.1


