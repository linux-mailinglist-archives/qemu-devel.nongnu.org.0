Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3AE51868A
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 16:23:52 +0200 (CEST)
Received: from localhost ([::1]:57200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nltRO-0001Uq-O5
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 10:23:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nltLO-0008M3-Lf
 for qemu-devel@nongnu.org; Tue, 03 May 2022 10:17:38 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:55840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nltLM-0001Pi-EI
 for qemu-devel@nongnu.org; Tue, 03 May 2022 10:17:38 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 243DEwCs004092;
 Tue, 3 May 2022 14:17:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=Vo9a/ni58/tCG70YpzQGSNu+WUYCHxjC1SxAWpNAStM=;
 b=szndI3Btl2El9A7KNAUxL1Kv/GmrUjrQbnSh/xVOUwVtxFRHGwHBlMnXavhtohtZ8kmA
 Zg87Hklsmdi941GL8hDE02w/ZmBW4KC6zTi9C9JYFeqdhCt72IhjOHC/JBYwmbfJuh99
 1KQcBTThst9EYdhAdnOeQ6TsbCdoOlaUG3hGBPJt4hb1ZMtKvi66Wutz9ZIgHmiTnid9
 sI8mDzACuTkugtzOLqSFZOCkwq8h8jbtsh/7DVtM8E7qiGpBgJgmUnsteaz/ehFI0cqc
 eF9fKn0+mu2BrmlkRUyv9dL1OREGKXbutElxkfS9GutUGCTEvf9Nvu7iPhv99LU7gljN 2A== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3frw0annhh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 03 May 2022 14:17:32 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 243EGQOn002363; Tue, 3 May 2022 14:17:31 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1anam02lp2047.outbound.protection.outlook.com [104.47.57.47])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3fruj2e5pf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 03 May 2022 14:17:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AlMmXeMDwqLPIVOdE99LKBscda48EUy4SsowB4MCRVnml8oUKSeBftG7s8RpHtZ3HNolzvT4g8+0dz8FleMYRXBqgcmLz10ZwRs8m0qnvb03LWjZa7K+TUt2u6HXTfbqc+RwTAoO/BZtPlxosUWhucRgUM7bR4JnMGECqjn7CxCSs0UfuwS/36NP7csMA2DL9XRRLdjRBHUdFZpqHVIINwr8I9BbcAX++8KRarvBx8b/C+iBhue2H5/YuTLqt85MLuGRou2RYt6loetWanAI224JWz2VuXi4irMimOM9a5a97qNQiXXcx83W0J03Ca0pY66KpAhmf/HRNbTSSLhXAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vo9a/ni58/tCG70YpzQGSNu+WUYCHxjC1SxAWpNAStM=;
 b=F4BBlsMKuw4Lz3YNPXQPLXA0d6sbibxAfzd0SUTJXoUpN/qylKt+uYrjKQG3k6b+pnXKiejQ6jjrsSdWpJ8Vr4pE3kCMkamhLrjSD4OsMFEoVJmvfV3tzxvhqlDppzc3zyzjMf/uj/bUWrp6O3lHA1yVS8VTymH1BmHLdsqkIM+fArS+jBC7b4d9gWjmBbRLTyBav24P7VV2eHEf7tilbqpwPABOu/GyV/bCApCqI40+ztNg9tg+o+7TUWby6bRmrTKFFG/BteBrq0XxSgp8pd6jEH0IL2zaZ21xrJ3P2cpkTcAgnFxk706an5pjkwZI4W810T7Ys1qXO3GZRxlhaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vo9a/ni58/tCG70YpzQGSNu+WUYCHxjC1SxAWpNAStM=;
 b=oQrEdn68xy8MG4UYuobL0g7Tw8N4+fNqFKGDr6eAIZk+CW50Dg2n/yeF1ZLplrSpe9e3NIP/DS+5luP0E56fcxsL1bh84OPzYy8VIvGc/ItAYRzQbnEdKK2u00vYeOjwe6EmxIvuHpAshDUSQ1EmEapRQhvEzYcwMcs3PsTo+FA=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by MN2PR10MB3358.namprd10.prod.outlook.com (2603:10b6:208:12f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Tue, 3 May
 2022 14:17:30 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191%7]) with mapi id 15.20.5206.013; Tue, 3 May 2022
 14:17:29 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, mst@redhat.com, f4bug@amsat.org, pbonzini@redhat.com, 
 marcandre.lureau@redhat.com, thuth@redhat.com, bleal@redhat.com,
 berrange@redhat.com, eduardo@habkost.net, marcel.apfelbaum@gmail.com,
 eblake@redhat.com, armbru@redhat.com, quintela@redhat.com,
 dgilbert@redhat.com, imammedo@redhat.com, peterx@redhat.com,
 john.levon@nutanix.com, thanos.makatos@nutanix.com,
 elena.ufimtseva@oracle.com, john.g.johnson@oracle.com,
 kanth.ghatraju@oracle.com, jag.raman@oracle.com
Subject: [PATCH v9 10/17] vfio-user: run vfio-user context
Date: Tue,  3 May 2022 10:16:51 -0400
Message-Id: <7350f4813b73af783965b758ecf39d0a6a76db53.1651586203.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1651586203.git.jag.raman@oracle.com>
References: <cover.1651586203.git.jag.raman@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA9PR11CA0005.namprd11.prod.outlook.com
 (2603:10b6:806:6e::10) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 38906efb-1026-4639-e1fd-08da2d0fa83a
X-MS-TrafficTypeDiagnostic: MN2PR10MB3358:EE_
X-Microsoft-Antispam-PRVS: <MN2PR10MB3358DE79DD8D9C944AB4242690C09@MN2PR10MB3358.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +tts2CHIQkXy/P4iTSg2V8TJs0yN5DgPvj5cWQuMtAIhzXski9+YA+1fflYqaEk/rPpLqhM8cTQt9dn/5Lw6fb0TT6Jxuo+GCxLO1Qnv4o76NorVUlVQax5Z2RFiKDfjrWRPhDiVzIe1NghuzO2jcDnFMWCy7Nr+HAZ7yOOcu/OVNk/oygwuTK3oVySEEXBScSAnqIBdMI2rAhGeEfp9bPGPlkDl/Sz9eQNKoZLcpc+BKEMPOmMe68jvu2b1ssGSIFlthu4ULQYpbLrbMNprl5Jc4hMcnen/9+hjfHGizH2Yvxj6afY975TQbkAzupuOaDvDBKuS09YWw3jrBvRCeF1093/N3/BJ0IEZov66340obqVXwNivAKJUBTITnKOFaAySi4U/w/SbC/B19b3ftUxRz8ovsrQLy25E5GA8f2u/JDp9A+rRFuYnZvBZrKDwm8qfkQ7fWcaG5n7LdJPj3iJCmQNQjuowIeoa4NHNcaJ8F/mmfciKpeX5L6+EACCA3LF9uwjl5yUziVX7ubbO7TxeJad/Lb7p7036JyPd0tz/tPHLr/M7MnsNmWNRzq6hKoKBz810a8631djKKXn5Ut7LBzyJ0YLn61B851l9Wz9m6oj4CF6gRWK/Qc4Ct3FfHBfEdI5K8IPH337X5cfOV5oULKthpdPSm/7SmvOHM3ha8Bdt7onKXf/2aog9/t31uSkX8eLPTnACuQPRiOGu1w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(36756003)(83380400001)(66946007)(2616005)(6506007)(186003)(107886003)(2906002)(6486002)(6916009)(316002)(38350700002)(38100700002)(7416002)(5660300002)(8936002)(6512007)(86362001)(4326008)(6666004)(52116002)(66476007)(508600001)(8676002)(26005)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cvWvWPrWTSNgjKr3h7UEBIKh2Y/vxMdViHxUteXon3t+RRft1piiTSZXnuNG?=
 =?us-ascii?Q?4WJOh1vHPU2bnzYFSt/JMRfP7Pa7Rgo/vjbiCxMKBWlqfUaeeGyu/N48mC8W?=
 =?us-ascii?Q?TOJGoo24StnwBuYsEviEwfmNQfao/gANl0UAlxt0+Pn97CyLaKslOu1AmSR5?=
 =?us-ascii?Q?euYUp6S5HUYl7SgTGEJIc2gNoHlZ8MZhqSfEAekPm5TCM6XP6JBqSbkqHS9p?=
 =?us-ascii?Q?522ZFa6YnKWOVzf07SB3B6wUudHXoCsLgq1W/B10D/9p6FJdUwNrXmraZrtU?=
 =?us-ascii?Q?ZkSiiUQL0WQ8L4jEbz18EeyjG8pn03ojcS/frBksAyimveSa0sjqSysLQOp0?=
 =?us-ascii?Q?fw82a+xbPCESxF9JSeyl/rFKLHjHzxSIPLGXTt1MSy19egvNr928mx9quAf4?=
 =?us-ascii?Q?wjnpsftR1wGzDyYdGXXl3Wi4HdjCGK3krZbC7SmxXt+6YzRN7lVJMcMycbaV?=
 =?us-ascii?Q?kW6KiXtezQ8idNvElv6yLEs0bg8wivZUuOAP4XdyBYt7GOI6ksesvva81vmR?=
 =?us-ascii?Q?znRbE/Ka2ciw4vX+fxpVwJB3wQpyMbFBdYI/jsD3D92Dl+wFeKjgHal1Bsme?=
 =?us-ascii?Q?s3FnpJtTgd8wI7ku4Duf6iAiab+94Q81bjDcCjxZCBHvoyuwpBkcYZRmJ8zy?=
 =?us-ascii?Q?tLBBWMMvEk632COf64NuyLsthd8q26hONbjyW7Veva00sVJwL6DV6VmSgKPJ?=
 =?us-ascii?Q?sS7abOGn/uePhEIVqTBTt/9cWu2dZ6g4Rlmj9KX/XrihEFPBXbtrFxxij2sP?=
 =?us-ascii?Q?vmEuW6CGQTf/zAF0Hc4xyOCGFLW/UwlqxNKU0Z4U0BD0qpMq87NOOD53Pj7k?=
 =?us-ascii?Q?N0TP2Mf5WdHYJisGAaZz8q44XtYXoX4pf3HYX6ZYfipWyFa/92IfxYKNMnBm?=
 =?us-ascii?Q?OtR2L7KyJpzsUQ3t9aJNhvs3YPTx90KOvjlAZYdsPRQjd18HGilHQzZrvElz?=
 =?us-ascii?Q?fPjdDstAlha++9cfvRJYstHwFQyiOPUbNHMDOBW3Gu7tMvCNnlhA1/+o5D3s?=
 =?us-ascii?Q?vZzq/vzz+JJqp1hhV7/XQMoppQJAvORyQnC32uQXp7jP6nYsEk11T+SKNiFr?=
 =?us-ascii?Q?kzhwHxVZE7WVIn/22ddC0svI6428TggaGfMcjng+7QJaGitxZnLI6wx5HuEc?=
 =?us-ascii?Q?RguQtdY4TB/VuXkuwDtvmL/iAlHfYzGKzz3UZ+tec48JlnRjMqn5aC6AATWE?=
 =?us-ascii?Q?orIoOngdACp8i7mSyXUSB4LhxCjJpyqQOOzbduGYnbl5iqqga++/kvtRymUd?=
 =?us-ascii?Q?2ItkI3oiSSnIWTJ2YJi76Nr0eF8H+d2V+liMZFabEzoXJ3tlgQmCD25VfNXf?=
 =?us-ascii?Q?6gSsjRlu4sdXjy59qTBd6oWkAfB9UkDPIsIGP3jtPPA0CQ24oqYfUHx0F484?=
 =?us-ascii?Q?UFSFUn7OVbuk0XMpoUmrTI+uR44uPOCZ/L0hixUfFULFgjHbTDt1LpoiBHN9?=
 =?us-ascii?Q?yPK/RQjO5g6luvrGW0UHCQiGtERzR+XurPDsHlz9pYddutpn2Hu6zzFXZauA?=
 =?us-ascii?Q?HQ8/0+A8+mKNM1ZBRYDxwvSyFCBd8Rq1xQBqGChl69cLNsn1YZiZEo8tHSPU?=
 =?us-ascii?Q?8Fp5fE+cV6ODB26d2g2fd/02Uj6vL0e4hdcULLHZVvmsOYxhj2VHQjFuJ3wu?=
 =?us-ascii?Q?aIIwszYo1VKKuUUfrqMrVGJu+H7D96SsrFrsxrSzWkqrAU1e54OGYTSGScMk?=
 =?us-ascii?Q?rxFZoRfCWMfIsEAp808gWLpGyZD1jdZFRScTJJ1hPLHLKk1gxXFXnh1QGfoa?=
 =?us-ascii?Q?wvi0KZoKGQ=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38906efb-1026-4639-e1fd-08da2d0fa83a
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2022 14:17:29.8880 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iwI5Apabj7X5nf4b1bq+mbGWiNqfglsHXSJv7jbVj/tWxMlaRu5h61sDrrD52Koytu9FxNw6OLaKmoI7NKY+WQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB3358
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-05-03_05:2022-05-02,
 2022-05-03 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 suspectscore=0
 mlxlogscore=999 spamscore=0 bulkscore=0 mlxscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205030103
X-Proofpoint-GUID: TfMYthjcFw7Ank5BEITrOH8mLwRZEs1q
X-Proofpoint-ORIG-GUID: TfMYthjcFw7Ank5BEITrOH8mLwRZEs1q
Received-SPF: pass client-ip=205.220.165.32; envelope-from=jag.raman@oracle.com;
 helo=mx0a-00069f02.pphosted.com
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

Setup a handler to run vfio-user context. The context is driven by
messages to the file descriptor associated with it - get the fd for
the context and hook up the handler with it

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 qapi/misc.json            |  30 +++++++++++
 hw/remote/vfio-user-obj.c | 102 +++++++++++++++++++++++++++++++++++++-
 2 files changed, 131 insertions(+), 1 deletion(-)

diff --git a/qapi/misc.json b/qapi/misc.json
index b83cc39029..fa49f2876a 100644
--- a/qapi/misc.json
+++ b/qapi/misc.json
@@ -553,3 +553,33 @@
 ##
 { 'event': 'RTC_CHANGE',
   'data': { 'offset': 'int', 'qom-path': 'str' } }
+
+##
+# @VFU_CLIENT_HANGUP:
+#
+# Emitted when the client of a TYPE_VFIO_USER_SERVER closes the
+# communication channel
+#
+# @vfu-id: ID of the TYPE_VFIO_USER_SERVER object
+#
+# @vfu-qom-path: path to the TYPE_VFIO_USER_SERVER object in the QOM tree
+#
+# @dev-id: ID of attached PCI device
+#
+# @dev-qom-path: path to attached PCI device in the QOM tree
+#
+# Since: 7.1
+#
+# Example:
+#
+# <- { "event": "VFU_CLIENT_HANGUP",
+#      "data": { "vfu-id": "vfu1",
+#                "vfu-qom-path": "/objects/vfu1",
+#                "dev-id": "sas1",
+#                "dev-qom-path": "/machine/peripheral/sas1" },
+#      "timestamp": { "seconds": 1265044230, "microseconds": 450486 } }
+#
+##
+{ 'event': 'VFU_CLIENT_HANGUP',
+  'data': { 'vfu-id': 'str', 'vfu-qom-path': 'str',
+            'dev-id': 'str', 'dev-qom-path': 'str' } }
diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
index 3ca6aa2b45..3a4c6a9fa0 100644
--- a/hw/remote/vfio-user-obj.c
+++ b/hw/remote/vfio-user-obj.c
@@ -27,6 +27,9 @@
  *
  * device - id of a device on the server, a required option. PCI devices
  *          alone are supported presently.
+ *
+ * notes - x-vfio-user-server could block IO and monitor during the
+ *         initialization phase.
  */
 
 #include "qemu/osdep.h"
@@ -40,11 +43,14 @@
 #include "hw/remote/machine.h"
 #include "qapi/error.h"
 #include "qapi/qapi-visit-sockets.h"
+#include "qapi/qapi-events-misc.h"
 #include "qemu/notify.h"
+#include "qemu/thread.h"
 #include "sysemu/sysemu.h"
 #include "libvfio-user.h"
 #include "hw/qdev-core.h"
 #include "hw/pci/pci.h"
+#include "qemu/timer.h"
 
 #define TYPE_VFU_OBJECT "x-vfio-user-server"
 OBJECT_DECLARE_TYPE(VfuObject, VfuObjectClass, VFU_OBJECT)
@@ -86,6 +92,8 @@ struct VfuObject {
     PCIDevice *pci_dev;
 
     Error *unplug_blocker;
+
+    int vfu_poll_fd;
 };
 
 static void vfu_object_init_ctx(VfuObject *o, Error **errp);
@@ -164,6 +172,76 @@ static void vfu_object_set_device(Object *obj, const char *str, Error **errp)
     vfu_object_init_ctx(o, errp);
 }
 
+static void vfu_object_ctx_run(void *opaque)
+{
+    VfuObject *o = opaque;
+    const char *vfu_id;
+    char *vfu_path, *pci_dev_path;
+    int ret = -1;
+
+    while (ret != 0) {
+        ret = vfu_run_ctx(o->vfu_ctx);
+        if (ret < 0) {
+            if (errno == EINTR) {
+                continue;
+            } else if (errno == ENOTCONN) {
+                vfu_id = object_get_canonical_path_component(OBJECT(o));
+                vfu_path = object_get_canonical_path(OBJECT(o));
+                g_assert(o->pci_dev);
+                pci_dev_path = object_get_canonical_path(OBJECT(o->pci_dev));
+                qapi_event_send_vfu_client_hangup(vfu_id, vfu_path,
+                                                  o->device, pci_dev_path);
+                qemu_set_fd_handler(o->vfu_poll_fd, NULL, NULL, NULL);
+                o->vfu_poll_fd = -1;
+                object_unparent(OBJECT(o));
+                g_free(vfu_path);
+                g_free(pci_dev_path);
+                break;
+            } else {
+                VFU_OBJECT_ERROR(o, "vfu: Failed to run device %s - %s",
+                                 o->device, strerror(errno));
+                break;
+            }
+        }
+    }
+}
+
+static void vfu_object_attach_ctx(void *opaque)
+{
+    VfuObject *o = opaque;
+    GPollFD pfds[1];
+    int ret;
+
+    qemu_set_fd_handler(o->vfu_poll_fd, NULL, NULL, NULL);
+
+    pfds[0].fd = o->vfu_poll_fd;
+    pfds[0].events = G_IO_IN | G_IO_HUP | G_IO_ERR;
+
+retry_attach:
+    ret = vfu_attach_ctx(o->vfu_ctx);
+    if (ret < 0 && (errno == EAGAIN || errno == EWOULDBLOCK)) {
+        /**
+         * vfu_object_attach_ctx can block QEMU's main loop
+         * during attach - the monitor and other IO
+         * could be unresponsive during this time.
+         */
+        (void)qemu_poll_ns(pfds, 1, 500 * (int64_t)SCALE_MS);
+        goto retry_attach;
+    } else if (ret < 0) {
+        VFU_OBJECT_ERROR(o, "vfu: Failed to attach device %s to context - %s",
+                         o->device, strerror(errno));
+        return;
+    }
+
+    o->vfu_poll_fd = vfu_get_poll_fd(o->vfu_ctx);
+    if (o->vfu_poll_fd < 0) {
+        VFU_OBJECT_ERROR(o, "vfu: Failed to get poll fd %s", o->device);
+        return;
+    }
+
+    qemu_set_fd_handler(o->vfu_poll_fd, vfu_object_ctx_run, NULL, o);
+}
+
 /*
  * TYPE_VFU_OBJECT depends on the availability of the 'socket' and 'device'
  * properties. It also depends on devices instantiated in QEMU. These
@@ -202,7 +280,8 @@ static void vfu_object_init_ctx(VfuObject *o, Error **errp)
         return;
     }
 
-    o->vfu_ctx = vfu_create_ctx(VFU_TRANS_SOCK, o->socket->u.q_unix.path, 0,
+    o->vfu_ctx = vfu_create_ctx(VFU_TRANS_SOCK, o->socket->u.q_unix.path,
+                                LIBVFIO_USER_FLAG_ATTACH_NB,
                                 o, VFU_DEV_TYPE_PCI);
     if (o->vfu_ctx == NULL) {
         error_setg(errp, "vfu: Failed to create context - %s", strerror(errno));
@@ -241,6 +320,21 @@ static void vfu_object_init_ctx(VfuObject *o, Error **errp)
                TYPE_VFU_OBJECT, o->device);
     qdev_add_unplug_blocker(DEVICE(o->pci_dev), o->unplug_blocker);
 
+    ret = vfu_realize_ctx(o->vfu_ctx);
+    if (ret < 0) {
+        error_setg(errp, "vfu: Failed to realize device %s- %s",
+                   o->device, strerror(errno));
+        goto fail;
+    }
+
+    o->vfu_poll_fd = vfu_get_poll_fd(o->vfu_ctx);
+    if (o->vfu_poll_fd < 0) {
+        error_setg(errp, "vfu: Failed to get poll fd %s", o->device);
+        goto fail;
+    }
+
+    qemu_set_fd_handler(o->vfu_poll_fd, vfu_object_attach_ctx, NULL, o);
+
     return;
 
 fail:
@@ -275,6 +369,7 @@ static void vfu_object_init(Object *obj)
         qemu_add_machine_init_done_notifier(&o->machine_done);
     }
 
+    o->vfu_poll_fd = -1;
 }
 
 static void vfu_object_finalize(Object *obj)
@@ -288,6 +383,11 @@ static void vfu_object_finalize(Object *obj)
 
     o->socket = NULL;
 
+    if (o->vfu_poll_fd != -1) {
+        qemu_set_fd_handler(o->vfu_poll_fd, NULL, NULL, NULL);
+        o->vfu_poll_fd = -1;
+    }
+
     if (o->vfu_ctx) {
         vfu_destroy_ctx(o->vfu_ctx);
         o->vfu_ctx = NULL;
-- 
2.20.1


