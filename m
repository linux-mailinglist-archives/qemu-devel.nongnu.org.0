Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BED935A533F
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Aug 2022 19:35:01 +0200 (CEST)
Received: from localhost ([::1]:44414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oSif6-0006Ug-U0
	for lists+qemu-devel@lfdr.de; Mon, 29 Aug 2022 13:35:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1oSiAk-0001CU-Tp; Mon, 29 Aug 2022 13:03:38 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:25214)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1oSiAW-0000ki-Cz; Mon, 29 Aug 2022 13:03:37 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27TGiXgl019453;
 Mon, 29 Aug 2022 17:03:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=corp-2022-7-12;
 bh=QdtIyzKaxKQJErKdZYL69y697O2wrfsmWsCAmfCUPZ8=;
 b=2P/cqn3l9nsIrAAylA04Trt5hxWSUcezcmcf7sUHYvb/QCCZeUwX3umr+/hbAh7OwBfM
 jn+VIERpnVhQ66+z+APAwv6iCdP2YhUErM244Au6v6MvriojjiwwUfprLxlDB55JnT+I
 vxHSpk9xg7u+WyJnHMV5PmYNkNA9vvAy1SCr6vTQOa38IBpBJXmExrlvFavwFZE4Xt2O
 i1fYa2jaE6985tYhqzon2SFmjtRpehvVtT7QdBsuCc3ThpEoksCWiXB3liYfcFmk/5a+
 U2McYjN4hLwIiuaWIHAQe4vGUCqXgn8Yx6Ttl9TkEoYkOFEjwsfHpV05MAZmCxIubSQm qw== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3j7b59ux4k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 29 Aug 2022 17:03:20 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 27TG5tIU033354; Mon, 29 Aug 2022 17:03:19 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2104.outbound.protection.outlook.com [104.47.70.104])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3j79q2ne14-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 29 Aug 2022 17:03:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hM+H4JoZzwdP2NkLV454OeUB1sK80b6DNUuBceAh648kGVJAcb3UsgDGn8QgntV3c6+Yw3GRaCGG+ZOiPW8+sWvxH6XVUdUxslg+mKi/PS36FldI8Y8KJCQ8GQjzysDZGhP+boPmpM46E9eWW/FWLJ7Dt3OH7jTWuLkoppFmCjDTiqJNng74oxru/tI4svQf0h1khRohX8S6fDgKoHKStdn+idG3RtesksHAy6Z8k2D2aKPLl6GLyAF2/AH0EKwn+z1U80CBCOKXNS/9iJGgVO+h4DAxs6uz3ttWP/kKHg2DwOYM4JMOXIE/y/bPZHNZixSlKNVgtPK9VOuwqLaqvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QdtIyzKaxKQJErKdZYL69y697O2wrfsmWsCAmfCUPZ8=;
 b=LntLRKln2LmYqq1oB7taPX+nsL74EJ41QX4dl8bz1ZXWkA5MtlYLe3Xe46McwGjMnsGwLTakLtcNoDu5D3s8nPq/G3arjGWQpgtzuuby+aWmcJhNkWlVfk1Kx4DfoA2R6PjtdQllJ+fH6jWERRS0Qz0zIoshhFahflYV5514J6EJjE3FIuFCXnJY+4FxWLmnYkbF/ZIKWQMwU6NC0XCi+UWBHIuEmqHIyjCWpTnH7OViSju/jNPu8OXd5cLERYp2lvakDSLXS2/kArAaAVRLLdnrNay4Zvhi3rVTrPyqw/H6Uhyebm8qCW/XzKg6LQN78JVEp7q7JbFXAIufcOSTBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QdtIyzKaxKQJErKdZYL69y697O2wrfsmWsCAmfCUPZ8=;
 b=h0BwRs1Wmt9vwno4taHTrabpJvKMKgcM2SdIsodHxIt67SH12OFvUzi1Lh9uILgXxw4Sl31Nu6tw6Lx1sl2aOkmlsP9QqmeHEoI0UtI4We4HjhWzcRSS3qEFFG4dnhhRvDQk4IW0ccjUEiLE9LJrPNj/vtyZVPesvoczW3HnLRI=
Received: from BYAPR10MB2663.namprd10.prod.outlook.com (2603:10b6:a02:a9::20)
 by MN2PR10MB3629.namprd10.prod.outlook.com (2603:10b6:208:112::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.19; Mon, 29 Aug
 2022 17:03:17 +0000
Received: from BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::95ab:eb8e:a0a7:3f0d]) by BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::95ab:eb8e:a0a7:3f0d%5]) with mapi id 15.20.5566.021; Mon, 29 Aug 2022
 17:03:17 +0000
From: Dongli Zhang <dongli.zhang@oracle.com>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Cc: dgilbert@redhat.com, joe.jin@oracle.com
Subject: [PATCH v2 1/1] monitor/hmp: print trace as option in help for log
 command
Date: Mon, 29 Aug 2022 10:03:16 -0700
Message-Id: <20220829170316.3053-1-dongli.zhang@oracle.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DM6PR02CA0124.namprd02.prod.outlook.com
 (2603:10b6:5:1b4::26) To BYAPR10MB2663.namprd10.prod.outlook.com
 (2603:10b6:a02:a9::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b0a90374-ad59-4ad2-1a36-08da89e05e43
X-MS-TrafficTypeDiagnostic: MN2PR10MB3629:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eViDddY3dOXd833RTP79jfz+qJgV7P5u0iyy2XNfQKVTg0Qm3yt8coGLmWRbUltjaD517MhmcsY7ebErDIgHzYmQBWDUprD28OlP2jYa60yRgUVk7QGnuS/bNjw7ciqaraGD18Uyiiopi454ZaSEQeaXNIxpIVJGm4PT1JkxHD4lLG2ieBhkr2lJRZqIpeBvk1SEP9iQruuJNHTZIJHFDM41zHf95vgVhjfPpv1+0MBFTO9dplXHnpwFPZD9pz/rRH/zXZ0cMEttEL1VG4SvOvP9G8954Iri8NgjPl6t3wsECgTumn+6qO8f0w6jXiHw/tRAvfJWvEwjQSlX3GbGrUau/E72WlFEvIjaiioMVVccXw0UcTk0BZw/Ag+7T2ddC5KNH77g/3Ue4a9pUHJ5TeSusib1FndX2op/BoSWELrYLwiU6OujN0zalnZNg03XHpM9TsCINO7h7judFCA8uudMBrvmX5fgUFB1c6zATZofUCUfaft5c/EfH89jme/mxvvv32z9aDdf58PvjdbLT49LDBjvQFA0wid6ECmJir+HIk/hBDWcDI/oNbYv3Bfl6MuUfj72AB9jtunLSguw5WspcJwLb7FoLijvrqYnPHwILzzGPH44OFd4wY9l9mzdllXZqY+uDYKlx6IWUu835WKfaRri1yS96efVzAysAW/+eTREbYAOxQs8TVJYzTxy4MR5rXOmFK/Mke7gSiLqlQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2663.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39860400002)(136003)(376002)(396003)(366004)(346002)(8676002)(66556008)(66476007)(66946007)(4326008)(316002)(38100700002)(5660300002)(2906002)(8936002)(44832011)(36756003)(86362001)(6506007)(6512007)(107886003)(26005)(6486002)(478600001)(83380400001)(2616005)(41300700001)(1076003)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HKYha8P0EdpO8CFQ8ogXGBh+EnsrCOYbI/FaOmnd9bi7p3zPiili7bmzMXqf?=
 =?us-ascii?Q?kk1LJswsuvCGY3un7ob2CcG4Ig0E2heeIee5iyVsIjCun6/5LvZPZfpErrgh?=
 =?us-ascii?Q?OC05hu+TVk0Ods9hxm7eCVXwumiLvFQyGt79oVQzyKjoNLt9v8l/A4XZ9Eu2?=
 =?us-ascii?Q?ZGkUNheWCaHIdku9cHp/OvtlaBLQBs9A19EV3ta9QvhBEdHhcjlClGLC8okP?=
 =?us-ascii?Q?1xkwxEbQTz5wct798eqqtP8bAS+LnSF+c6JnbOvd/4jwwgyh/nyp8o6wafaT?=
 =?us-ascii?Q?X4OSWNoT+v0SzWhNuxJuYvQO/Jc4YCknLxEJD3uUuedr54X3MyZzd0Grclu5?=
 =?us-ascii?Q?wOivtLxJH8ajaDMpcrbTKP1cI+kt3CC+8cAD3sliW+ry24zRe8Xo7Y0B/lCL?=
 =?us-ascii?Q?6zE5RE3DWyjXCVdXYitwV8IET0dzBoMoa0Fbzcevb8A42F/b2edQnYo++1om?=
 =?us-ascii?Q?d7i2WiqSRH9DaRe+64ygRwjQG3OnZc5hhF+hKO5dD9AfWVL3gXDX3ExbwN/Z?=
 =?us-ascii?Q?hucBkatNvsKycPakgWPbj7PnYw5vhT7WZzY/+I+CxltKVArBjfTVWXUk6YsE?=
 =?us-ascii?Q?URV4mQMiP7sElzt1G0ogQBBgikC1oRxZHX8WBAAzDY+B5oEzQtXRt3N5TFsd?=
 =?us-ascii?Q?aSnL6PxaTj1fL79PI1gopo7LmLj1wBuSLxQppeK/Pxywd6Afdq5QMmpmYfP7?=
 =?us-ascii?Q?ls+fT2fLua5srtXLPQDS3u6OKTEO/YGNyY5i+JC8ZVeZf9SD7DdAOHHSfiaC?=
 =?us-ascii?Q?51So+XldJq52kqy6rgEVh3eJW/GV4KORWtOyMQHqcgY97Mr7U/oz9lN0tjDf?=
 =?us-ascii?Q?LbFBuCVUKRa7D686YS0uWA1muJ1F/FsgV69Af+uch9L2f1Fsp5fpSm3gU3g2?=
 =?us-ascii?Q?s3V9qqxoibLIMNPZ62v2ZxUySDC8fDYQi6VAWHPCNZRn9NWiQqL9k+uIUXnb?=
 =?us-ascii?Q?+33RAQofHBKdKFW4JZk0rohCxlEcsGGR3IkEJHeKqE+Xl+C95n7OqhZGwmc8?=
 =?us-ascii?Q?kiGRFmaNWwRHQBHG0dKBuOdeaPaG1cJ/MZFs4fkTv51eJ0QSMhqXgoCHJIs4?=
 =?us-ascii?Q?FkQN14ofVKkMP7AeAGfpbIsDhojReYvHB8BsU7in91ALOi2PDRmATpEoTuYD?=
 =?us-ascii?Q?vfjaJWwGuL0iS7/5OlH1wrIpyZBi05vEElvRSRiINgJFPu/TBDMld/h/mmm7?=
 =?us-ascii?Q?Su+xQQd5F8+2tRkVv19BUuivxSd4J0PfbN5c6jFd7SLNBmKPL5yZM7/prrAd?=
 =?us-ascii?Q?RwilwPxGQD3sRi+jVIwtUac0dYDkHu17Mp6S+mRFfK5KSyxSAWXH4K/Bgc0J?=
 =?us-ascii?Q?CnRWoK3SmDNs1k3wVnERIf6xaVwokskQPP9/WkYCw3q3le7YYm1MwbWu3bfV?=
 =?us-ascii?Q?VvdfQXcigNG8LnkOuN69Ia+nWFink4ZNsgSFv62r/Ac17uRCPiRKc6Sg0bpU?=
 =?us-ascii?Q?xXXyxPYSnyS7XcMdCKNvb4Lrk5UE+gL7Fq5frP03eJiMNa/QtpkOQelnp/Vp?=
 =?us-ascii?Q?TPCZoMX/mzKlAl8QHhc2smIAHjsMhzbZ+s58P3USt6rCe2+Tm1xRj/CmoIWS?=
 =?us-ascii?Q?uu0BfkBhz6oZ+CFt3KDJjKIde2jGTFcC1mMhPlmR?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0a90374-ad59-4ad2-1a36-08da89e05e43
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2663.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2022 17:03:17.4731 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7UgUsbD8A6zhIFOtPwwVw7lCP3IIk+ME16ZVUuOuaUfk2lePBSINz+J71FksYRxPsDEyISxzLrlXOJi62qg6zQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB3629
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-29_08,2022-08-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 malwarescore=0 mlxscore=0
 spamscore=0 mlxlogscore=999 phishscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2208290079
X-Proofpoint-ORIG-GUID: 3dpgCj27cDCPyeP5iiQ5_u7JCj9BdHAq
X-Proofpoint-GUID: 3dpgCj27cDCPyeP5iiQ5_u7JCj9BdHAq
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=dongli.zhang@oracle.com; helo=mx0a-00069f02.pphosted.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The below is printed when printing help information in qemu-system-x86_64
command line, and when CONFIG_TRACE_LOG is enabled:

$ qemu-system-x86_64 -d help
... ...
trace:PATTERN   enable trace events

Use "-d trace:help" to get a list of trace events.

However, they are not printed in hmp "help log" command.

Cc: Joe Jin <joe.jin@oracle.com>
Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
---
Changed since v1:
- change format for "none" as well.

 monitor/hmp.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/monitor/hmp.c b/monitor/hmp.c
index 15ca047..467fc84 100644
--- a/monitor/hmp.c
+++ b/monitor/hmp.c
@@ -285,10 +285,15 @@ void help_cmd(Monitor *mon, const char *name)
         if (!strcmp(name, "log")) {
             const QEMULogItem *item;
             monitor_printf(mon, "Log items (comma separated):\n");
-            monitor_printf(mon, "%-10s %s\n", "none", "remove all logs");
+            monitor_printf(mon, "%-15s %s\n", "none", "remove all logs");
             for (item = qemu_log_items; item->mask != 0; item++) {
-                monitor_printf(mon, "%-10s %s\n", item->name, item->help);
+                monitor_printf(mon, "%-15s %s\n", item->name, item->help);
             }
+#ifdef CONFIG_TRACE_LOG
+            monitor_printf(mon, "trace:PATTERN   enable trace events\n");
+            monitor_printf(mon, "\nUse \"info trace-events\" to get a list of "
+                                "trace events.\n\n");
+#endif
             return;
         }
 
-- 
1.8.3.1


