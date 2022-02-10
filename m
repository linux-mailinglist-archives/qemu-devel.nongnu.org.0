Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC3D14B0AFD
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 11:37:25 +0100 (CET)
Received: from localhost ([::1]:58038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nI6pJ-0004SP-1q
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 05:37:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1nI6c0-0000mH-Uh; Thu, 10 Feb 2022 05:23:41 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:7194)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1nI6bx-0000w0-Li; Thu, 10 Feb 2022 05:23:40 -0500
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21A7kmNm017470; 
 Thu, 10 Feb 2022 10:23:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=9euFYXzI0LIjN9h+qE5U9DSIi99JMamiEEWwopR6bDQ=;
 b=iJs322+0ooWx4YaWz1K5N29NW8pgIuJntyb/1WlFPiKLmCAc4ZPfqo+hN6+GZF4JOwmk
 psuii899a9XX/XB+Re7zzNkuqeB/XXC9OuMCYGByaICoP14S/tLSdGU25XKKBXFp6YZ9
 yEy0TyV3m1Ow9hLZFtiUPgSA1l2kMAPTXE6autyOwl5uJqCQ7QfCwid2ulc+lpsg0sbj
 EJaFnmHJJWLspjo1qFCpTre35ethnHvojFcfUF1d3oB7mBqDzXwx3lpN+g4+dPU6HPR7
 XvN4bRUCutmqwBiVWSTFgdna0XG17jMQg5Ai2YUDUDsFIAQCSjvBx4wsDXhco6sMhNsA 9g== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3e3h28qj3h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Feb 2022 10:23:19 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21AABeeT192012;
 Thu, 10 Feb 2022 10:23:18 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2042.outbound.protection.outlook.com [104.47.66.42])
 by aserp3020.oracle.com with ESMTP id 3e1h29x76e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Feb 2022 10:23:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DUyU8bbf79uMteESVKFOYEj0yuV7ZP+zwgm6gTp4hEbSCZ0j04ZSFUTpA2qD+P30SPK0eZWo9PM/7AHJqOH44j54UeXZnHDHK9KYlRkt5C1PyGIh5DZ1c402abhLVlFLY/aqeVJsJtfMLAUV+TJcPDvo+qLBeXBdyz11jduKZ3dkyDa6jf1J+1gUwVYnZutgxsFJdcai7vVRvoCzaNUDRV9BN6dzyoa3qjD8xSGMVT5HdUfyxbsImXPJxxFFl5kmBrLiXkiszinsL9TRJIpLJ2MO00gs2GK4l7WTLkn57c+MuURYSXGk4ZExeyG3j7IuHLHol0HS8Fd8LC0VaLgGQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9euFYXzI0LIjN9h+qE5U9DSIi99JMamiEEWwopR6bDQ=;
 b=VhI7jynAX6ZW8aLjQeuNK5zcWWnA1//1XRvha2fO6c6HW4UY5LCVX7bbmGZWywYfcKHv+9guwQlILWrIl+24Rtr9oiq8sOBxQSBJFOfou7acBztAlpnY7PGRdoTibqSkeb4oe4wI9qF+bV48ZUrECWso49tk3/yDwBpYIa6vLtoTuDH0lGWI2iaPB1wxg3+pHj5DYoCuwDKuVDPp6TMmTTalhV2cXhrbEwSvvSalVBfsiTv5doLjMEqVYJdDQsxI09ngHdAl22CHSelXP00KvfWLrB/lSesMdgWYgcHkek/rqUGBtwNy3ulTz0khb682ANKdXU9W2WX9sCTu6od7hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9euFYXzI0LIjN9h+qE5U9DSIi99JMamiEEWwopR6bDQ=;
 b=0GAhw38cfRUbjkfcsXL7CNqIewCoLtkhf2HmxK0FT1pfLEgeo5h3nHyMoebpJlicfUCHKpCLBpQkDjjMYYZjCNtFgJjObSKl44OPcKUWpCv1lxfKjbtjjhIAyVAFd1kSk+skxEq2r2vhYd2pJ7A/eUNE+XvhM5U5FVXypH/yrYw=
Received: from PH0PR10MB4664.namprd10.prod.outlook.com (2603:10b6:510:41::11)
 by DM6PR10MB3513.namprd10.prod.outlook.com (2603:10b6:5:17b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.17; Thu, 10 Feb
 2022 10:23:15 +0000
Received: from PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::b8e3:f092:c0ea:9ddf]) by PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::b8e3:f092:c0ea:9ddf%4]) with mapi id 15.20.4951.019; Thu, 10 Feb 2022
 10:23:15 +0000
From: Jonah Palmer <jonah.palmer@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v12 8/8] hmp: add virtio commands
Date: Thu, 10 Feb 2022 05:22:00 -0500
Message-Id: <1644488520-21604-9-git-send-email-jonah.palmer@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1644488520-21604-1-git-send-email-jonah.palmer@oracle.com>
References: <1644488520-21604-1-git-send-email-jonah.palmer@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BY5PR03CA0024.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::34) To PH0PR10MB4664.namprd10.prod.outlook.com
 (2603:10b6:510:41::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7c08e011-9db0-48c4-8b9d-08d9ec7f5918
X-MS-TrafficTypeDiagnostic: DM6PR10MB3513:EE_
X-Microsoft-Antispam-PRVS: <DM6PR10MB351364EAE4BF455C2FEC1BC6E82F9@DM6PR10MB3513.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:120;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V1iAfEVuMgpb8Y3+CtU1V5fhysvYFu3nS9cmJ2RHLQawbdJI9gIqsWmgr1FEnIPADfZsrocRt/7rKJ129oTndJS+Dqs6EgYK9AKgV13qUqT+wxF3eADeCkyIQr6dIAx0dLHAdDKLQj7ez3vfPV5ii7AaBVKWmhulyaJDi/v4s6Qs8kNyXmV74IHG8Xd0BEIlLuKfMkMAou6grBTc09j3mzWqRaOHDyzUyUK9wUbgkvt4Z7DaEHDTABPIeDJl02QZLPpPDjaXAf7B0skh46NeFZSJZZ6xUbIUXNWJ20R/E4cKlB1Ty6mbU8nk5SfubK45zMY4GyM/mfbqnODwaso2NtM5CaX0ZsvMpDpWDWthWyO8E4O0/vMc9PPaHv4IPubwIVUm0ilQxtYkt/dHtfXUzGahGN5bOESfKswlf2uWe+D4yDih4cbf9uG+nGv21Zfprgu2rbmCqS4w3cljnb8A/qjSZnL/tnqSsvNe0qde1NuNwibeXlhZxh3O50vrulFkUN30jyfs6f4e+2VfsOFJyyFuEKIzuBh99n8pnYYJ1qRZiDQVIpzlpGK/azPGMRjGZ4ptvcAvp1H3JvCruUe11ZDfoBdKoPEqm6657hJ3CBXSXlNk07cVyhg1ex96yyoM6pBP0+QZ8PTqsh1ftBP8zUxCWGE/Z51ITU3eY3DHECxn1CoYp5srOEzM810YdY3JCTZs0Wll8vPGHs2fYf4WPg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4664.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(4326008)(6666004)(508600001)(30864003)(44832011)(86362001)(8936002)(8676002)(66476007)(66556008)(66946007)(6486002)(7416002)(83380400001)(5660300002)(316002)(6506007)(38350700002)(2616005)(36756003)(38100700002)(6512007)(52116002)(186003)(6916009)(26005)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EKq2+RrK6DrvzAuZnVWxe/XUQ9JnsxnNjK6yu8zGlO4iGWCsikVrLDADE9Zc?=
 =?us-ascii?Q?lloxQja1vgSTaSAuWwV2C7twavwL2tu2QD9UsQ6TIm8g3bH1ytDpCWDyeMj2?=
 =?us-ascii?Q?RDEAG0CPG4msKgLkbxQyMy5zg3doumqlke/D3Pb3s+o/qeIjr0WNhXztjXHm?=
 =?us-ascii?Q?MZaZt+nFXpuaguBoAVsO1KJpbVJdnYcVsBSvZhkLpRlH48bTAz0wVZTGcqTy?=
 =?us-ascii?Q?O67B1ROLOGeRNxPWT0aT5ll5Sn9tVzZZhGaa6YQ77Usk2dPj8JrL4MC6FEZR?=
 =?us-ascii?Q?D/2+RUdzninBzUxdQNgieau+Se5Lzhd1kJskVdFU/KbVLjp+GnSPWSJus4jO?=
 =?us-ascii?Q?CKhDk4QsJMbiqzpFpwDDnLZG28nNadpPQeKvBx+Ii0TUrlv9DZR6KeE7aJ5c?=
 =?us-ascii?Q?R81qdGrh7R7a3KIORDSG2MWWOQAb+kjopQqPAEB3W0Uj8r+JPSRrbyTiFs5X?=
 =?us-ascii?Q?uQqKc/7cCCpgb70m78R24Q09qSoYGd+ChbqQwjgLEoLJguCYQnOto5V8TQWx?=
 =?us-ascii?Q?bDa1EZsXvIB4Dssw7mGjjz2pEPJfNZDlGYbw4in8z0/+BPh4R58mUjqsX/EU?=
 =?us-ascii?Q?81M5BmT2cYBRCVUJUDnDI78vKUaQL1jGgdbhsaH0BkQPHAJQALx9zfvrgu5R?=
 =?us-ascii?Q?LA8gkphMkytR9l6+uShWzXZrNXRB0w+/ibW8AYgWQI2W77tVOsR3ly0th4rw?=
 =?us-ascii?Q?zPNbjexOe10NE4XbpfmkK930QLPRcGUtYI551SWfI+9pgl2ZrBLetxHgIavW?=
 =?us-ascii?Q?TrwZMPglGhBNu2T37kl6J7yyzqahpsCOK3u2sclru1FBrxYHFt7011Rd1GxI?=
 =?us-ascii?Q?idgHRXtypC0dDXqk6ds10n89xtE3lhudUPzoYe+51RNFMVGxQINR76LnLc7H?=
 =?us-ascii?Q?9IxFqgRFNQnSOcvgFAQqZLXl0nPbYXSLxvS68LMov8poaqb7WGj9nma2Ebx5?=
 =?us-ascii?Q?MpB5B/Itk25R1IXvPkmKG/jA5kaTsL4ns9hFEWH1KQYRxqg/oCeQWxWBxxtt?=
 =?us-ascii?Q?KyESu8nhWxpdRuCHA1AYPPhzsrW4ZzwdzqPPavXSki5c0FLlEu2kisW+Gy+X?=
 =?us-ascii?Q?Cn6ynRcz3ShLCkF8xY6IziI5fFIxweJdc2JwRnaWCHWstVsSy8nByn77qGTH?=
 =?us-ascii?Q?njzNRasePDstPWAakgk/WmW6s7uA1OeWiltT/mG4NE3w2LZzLOaUvKZN/lv7?=
 =?us-ascii?Q?FZhKuEXWz2XxX/mxwqUomqz7csiW5UFKkz+auQtHYI3QCj5LLDoDOxxVyxUa?=
 =?us-ascii?Q?Ffsh5aOOxB3hoyMOpYqBLxrL/9lfKfADrmOCGannaYxunuERUI8I0tqcS5H7?=
 =?us-ascii?Q?NaZ0+M31ZHJxp9gqIVFUIMLa/WIo//UvYEopKY/cU3lN8XVmA62fZQwdc5cY?=
 =?us-ascii?Q?i5LcD1WG2A3Fz5xg0avHwiWCCSGeu9Sd+H85QbLN6+fUv8w1Yc9slMHRQWlZ?=
 =?us-ascii?Q?HWXhYfk1z0nUZtleR0L2zc/PGD9yaOaWKZfaxWpDANFexGgf8PNM0LZYo6nL?=
 =?us-ascii?Q?YPYH8OKhqzX1V1C7yauSIM7ONVp+F5QCtngGYWOmzKN6nxxNtxg0rOWn32g2?=
 =?us-ascii?Q?8hKloA3uLcgThiavPQmeckoBxl52iYjIINIi9te64NosIY6mWrAlIX38FFbF?=
 =?us-ascii?Q?ac5xp/fEPx8D2oiqSllZ/JE=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c08e011-9db0-48c4-8b9d-08d9ec7f5918
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4664.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2022 10:23:15.0693 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ay28J2GOfoeRE2TnmhgpRCnZ0GEgQ6KFe74wt9Yx/4t2WEe57V56qB4JbkkKw09ss4xZHrHsz8+7TqIgmV4WYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB3513
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10253
 signatures=673431
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxscore=0 bulkscore=0
 phishscore=0 malwarescore=0 mlxlogscore=999 adultscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202100056
X-Proofpoint-ORIG-GUID: TRwM4X-6-FGFxr14zX_gm2fGqX9SJOD0
X-Proofpoint-GUID: TRwM4X-6-FGFxr14zX_gm2fGqX9SJOD0
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=jonah.palmer@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: mst@redhat.com, qemu_oss@crudebyte.com, kraxel@redhat.com,
 si-wei.liu@oracle.com, joao.m.martins@oracle.com, eblake@redhat.com,
 qemu-block@nongnu.org, david@redhat.com, armbru@redhat.com,
 arei.gonglei@huawei.com, marcandre.lureau@redhat.com, lvivier@redhat.com,
 thuth@redhat.com, michael.roth@amd.com, groug@kaod.org, dgilbert@redhat.com,
 eric.auger@redhat.com, stefanha@redhat.com, boris.ostrovsky@oracle.com,
 kwolf@redhat.com, mathieu.poirier@linaro.org, raphael.norwitz@nutanix.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Laurent Vivier <lvivier@redhat.com>

This patch implements the HMP versions of the virtio QMP commands.

[Jonah: Fixed virtio hmp command output format (e.g. use PRI types).]

Signed-off-by: Jonah Palmer <jonah.palmer@oracle.com>
---
 hmp-commands-info.hx  |  70 ++++++++++++
 include/monitor/hmp.h |   5 +
 monitor/hmp-cmds.c    | 311 ++++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 386 insertions(+)

diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
index 407a1da..e49d852 100644
--- a/hmp-commands-info.hx
+++ b/hmp-commands-info.hx
@@ -877,3 +877,73 @@ SRST
   ``info sgx``
     Show intel SGX information.
 ERST
+
+    {
+        .name      = "virtio",
+        .args_type = "",
+        .params    = "",
+        .help      = "List all available virtio devices",
+        .cmd       = hmp_virtio_query,
+        .flags     = "p",
+    },
+
+SRST
+  ``info virtio``
+    List all available virtio devices
+ERST
+
+    {
+        .name      = "virtio-status",
+        .args_type = "path:s",
+        .params    = "path",
+        .help      = "Display status of a given virtio device",
+        .cmd       = hmp_virtio_status,
+        .flags     = "p",
+    },
+
+SRST
+  ``info virtio-status`` *path*
+    Display status of a given virtio device
+ERST
+
+    {
+        .name      = "virtio-queue-status",
+        .args_type = "path:s,queue:i",
+        .params    = "path queue",
+        .help      = "Display status of a given virtio queue",
+        .cmd       = hmp_virtio_queue_status,
+        .flags     = "p",
+    },
+
+SRST
+  ``info virtio-queue-status`` *path* *queue*
+    Display status of a given virtio queue
+ERST
+
+    {
+        .name      = "virtio-vhost-queue-status",
+        .args_type = "path:s,queue:i",
+        .params    = "path queue",
+        .help      = "Display status of a given vhost queue",
+        .cmd       = hmp_vhost_queue_status,
+        .flags     = "p",
+    },
+
+SRST
+  ``info virtio-vhost-queue-status`` *path* *queue*
+    Display status of a given vhost queue
+ERST
+
+    {
+        .name       = "virtio-queue-element",
+        .args_type  = "path:s,queue:i,index:i?",
+        .params     = "path queue [index]",
+        .help       = "Display element of a given virtio queue",
+        .cmd        = hmp_virtio_queue_element,
+        .flags      = "p",
+    },
+
+SRST
+  ``info virtio-queue-element`` *path* *queue* [*index*]
+    Display element of a given virtio queue
+ERST
diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
index 96d0148..47446d8 100644
--- a/include/monitor/hmp.h
+++ b/include/monitor/hmp.h
@@ -95,6 +95,11 @@ void hmp_qom_list(Monitor *mon, const QDict *qdict);
 void hmp_qom_get(Monitor *mon, const QDict *qdict);
 void hmp_qom_set(Monitor *mon, const QDict *qdict);
 void hmp_info_qom_tree(Monitor *mon, const QDict *dict);
+void hmp_virtio_query(Monitor *mon, const QDict *qdict);
+void hmp_virtio_status(Monitor *mon, const QDict *qdict);
+void hmp_virtio_queue_status(Monitor *mon, const QDict *qdict);
+void hmp_vhost_queue_status(Monitor *mon, const QDict *qdict);
+void hmp_virtio_queue_element(Monitor *mon, const QDict *qdict);
 void object_add_completion(ReadLineState *rs, int nb_args, const char *str);
 void object_del_completion(ReadLineState *rs, int nb_args, const char *str);
 void device_add_completion(ReadLineState *rs, int nb_args, const char *str);
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 2669156..d001238 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -42,6 +42,8 @@
 #include "qapi/qapi-commands-run-state.h"
 #include "qapi/qapi-commands-tpm.h"
 #include "qapi/qapi-commands-ui.h"
+#include "qapi/qapi-commands-virtio.h"
+#include "qapi/qapi-visit-virtio.h"
 #include "qapi/qapi-visit-net.h"
 #include "qapi/qapi-visit-migration.h"
 #include "qapi/qmp/qdict.h"
@@ -2166,3 +2168,312 @@ void hmp_info_memory_size_summary(Monitor *mon, const QDict *qdict)
     }
     hmp_handle_error(mon, err);
 }
+
+static void hmp_virtio_dump_protocols(Monitor *mon,
+                                      VhostDeviceProtocols *pcol)
+{
+    strList *pcol_list = pcol->protocols;
+    while (pcol_list) {
+        monitor_printf(mon, "%s", pcol_list->value);
+        pcol_list = pcol_list->next;
+        if (pcol_list != NULL) {
+            monitor_printf(mon, ", ");
+        }
+    }
+    monitor_printf(mon, "\n");
+    if (pcol->has_unknown_protocols) {
+        monitor_printf(mon, "  unknown-protocols(0x%016"PRIx64")\n",
+                       pcol->unknown_protocols);
+    }
+}
+
+static void hmp_virtio_dump_status(Monitor *mon,
+                                   VirtioDeviceStatus *status)
+{
+    strList *status_list = status->statuses;
+    while (status_list) {
+        monitor_printf(mon, "%s", status_list->value);
+        status_list = status_list->next;
+        if (status_list != NULL) {
+            monitor_printf(mon, ", ");
+        }
+    }
+    monitor_printf(mon, "\n");
+    if (status->has_unknown_statuses) {
+        monitor_printf(mon, "  unknown-statuses(0x%016"PRIx32")\n",
+                       status->unknown_statuses);
+    }
+}
+
+static void hmp_virtio_dump_features(Monitor *mon,
+                                     VirtioDeviceFeatures *features)
+{
+    strList *transport_list = features->transports;
+    while (transport_list) {
+        monitor_printf(mon, "%s", transport_list->value);
+        transport_list = transport_list->next;
+        if (transport_list != NULL) {
+            monitor_printf(mon, ", ");
+        }
+    }
+
+    monitor_printf(mon, "\n");
+    strList *list = features->dev_features;
+    if (list) {
+        monitor_printf(mon, "                    ");
+        while (list) {
+            monitor_printf(mon, "%s", list->value);
+            list = list->next;
+            if (list != NULL) {
+                monitor_printf(mon, ", ");
+            }
+        }
+        monitor_printf(mon, "\n");
+    }
+
+    if (features->has_unknown_dev_features) {
+        monitor_printf(mon, "  unknown-features(0x%016"PRIx64")\n",
+                       features->unknown_dev_features);
+    }
+}
+
+void hmp_virtio_query(Monitor *mon, const QDict *qdict)
+{
+    Error *err = NULL;
+    VirtioInfoList *list = qmp_x_query_virtio(&err);
+    VirtioInfoList *node;
+
+    if (err != NULL) {
+        hmp_handle_error(mon, err);
+        return;
+    }
+
+    if (list == NULL) {
+        monitor_printf(mon, "No VirtIO devices\n");
+        return;
+    }
+
+    node = list;
+    while (node) {
+        monitor_printf(mon, "%s [%s]\n", node->value->path,
+                       node->value->name);
+        node = node->next;
+    }
+    qapi_free_VirtioInfoList(list);
+}
+
+void hmp_virtio_status(Monitor *mon, const QDict *qdict)
+{
+    Error *err = NULL;
+    const char *path = qdict_get_try_str(qdict, "path");
+    VirtioStatus *s = qmp_x_query_virtio_status(path, &err);
+
+    if (err != NULL) {
+        hmp_handle_error(mon, err);
+        return;
+    }
+
+    monitor_printf(mon, "%s:\n", path);
+    monitor_printf(mon, "  device_name:             %s %s\n",
+                   s->name, s->has_vhost_dev ? "(vhost)" : "");
+    monitor_printf(mon, "  device_id:               %d\n", s->device_id);
+    monitor_printf(mon, "  vhost_started:           %s\n",
+                   s->vhost_started ? "true" : "false");
+    monitor_printf(mon, "  bus_name:                %s\n", s->bus_name);
+    monitor_printf(mon, "  broken:                  %s\n",
+                   s->broken ? "true" : "false");
+    monitor_printf(mon, "  disabled:                %s\n",
+                   s->disabled ? "true" : "false");
+    monitor_printf(mon, "  disable_legacy_check:    %s\n",
+                   s->disable_legacy_check ? "true" : "false");
+    monitor_printf(mon, "  started:                 %s\n",
+                   s->started ? "true" : "false");
+    monitor_printf(mon, "  use_started:             %s\n",
+                   s->use_started ? "true" : "false");
+    monitor_printf(mon, "  start_on_kick:           %s\n",
+                   s->start_on_kick ? "true" : "false");
+    monitor_printf(mon, "  use_guest_notifier_mask: %s\n",
+                   s->use_guest_notifier_mask ? "true" : "false");
+    monitor_printf(mon, "  vm_running:              %s\n",
+                   s->vm_running ? "true" : "false");
+    monitor_printf(mon, "  num_vqs:                 %"PRId64"\n", s->num_vqs);
+    monitor_printf(mon, "  queue_sel:               %d\n",
+                   s->queue_sel);
+    monitor_printf(mon, "  isr:                     %d\n", s->isr);
+    monitor_printf(mon, "  endianness:              %s\n",
+                   s->device_endian);
+    monitor_printf(mon, "  status: ");
+    hmp_virtio_dump_status(mon, s->status);
+    monitor_printf(mon, "  Guest features:   ");
+    hmp_virtio_dump_features(mon, s->guest_features);
+    monitor_printf(mon, "  Host features:    ");
+    hmp_virtio_dump_features(mon, s->host_features);
+    monitor_printf(mon, "  Backend features: ");
+    hmp_virtio_dump_features(mon, s->backend_features);
+
+    if (s->has_vhost_dev) {
+        monitor_printf(mon, "  VHost:\n");
+        monitor_printf(mon, "    nvqs:           %d\n",
+                       s->vhost_dev->nvqs);
+        monitor_printf(mon, "    vq_index:       %"PRId64"\n",
+                       s->vhost_dev->vq_index);
+        monitor_printf(mon, "    max_queues:     %"PRId64"\n",
+                       s->vhost_dev->max_queues);
+        monitor_printf(mon, "    n_mem_sections: %"PRId64"\n",
+                       s->vhost_dev->n_mem_sections);
+        monitor_printf(mon, "    n_tmp_sections: %"PRId64"\n",
+                       s->vhost_dev->n_tmp_sections);
+        monitor_printf(mon, "    backend_cap:    %"PRId64"\n",
+                       s->vhost_dev->backend_cap);
+        monitor_printf(mon, "    log_enabled:    %s\n",
+                       s->vhost_dev->log_enabled ? "true" : "false");
+        monitor_printf(mon, "    log_size:       %"PRId64"\n",
+                       s->vhost_dev->log_size);
+        monitor_printf(mon, "    Features:          ");
+        hmp_virtio_dump_features(mon, s->vhost_dev->features);
+        monitor_printf(mon, "    Acked features:    ");
+        hmp_virtio_dump_features(mon, s->vhost_dev->acked_features);
+        monitor_printf(mon, "    Backend features:  ");
+        hmp_virtio_dump_features(mon, s->vhost_dev->backend_features);
+        monitor_printf(mon, "    Protocol features: ");
+        hmp_virtio_dump_protocols(mon, s->vhost_dev->protocol_features);
+    }
+
+    qapi_free_VirtioStatus(s);
+}
+
+void hmp_vhost_queue_status(Monitor *mon, const QDict *qdict)
+{
+    Error *err = NULL;
+    const char *path = qdict_get_try_str(qdict, "path");
+    int queue = qdict_get_int(qdict, "queue");
+    VirtVhostQueueStatus *s =
+        qmp_x_query_virtio_vhost_queue_status(path, queue, &err);
+
+    if (err != NULL) {
+        hmp_handle_error(mon, err);
+        return;
+    }
+
+    monitor_printf(mon, "%s:\n", path);
+    monitor_printf(mon, "  device_name:          %s (vhost)\n",
+                   s->name);
+    monitor_printf(mon, "  kick:                 %"PRId64"\n", s->kick);
+    monitor_printf(mon, "  call:                 %"PRId64"\n", s->call);
+    monitor_printf(mon, "  VRing:\n");
+    monitor_printf(mon, "    num:         %"PRId64"\n", s->num);
+    monitor_printf(mon, "    desc:        0x%016"PRIx64"\n", s->desc);
+    monitor_printf(mon, "    desc_phys:   0x%016"PRIx64"\n",
+                   s->desc_phys);
+    monitor_printf(mon, "    desc_size:   %"PRId32"\n", s->desc_size);
+    monitor_printf(mon, "    avail:       0x%016"PRIx64"\n", s->avail);
+    monitor_printf(mon, "    avail_phys:  0x%016"PRIx64"\n",
+                   s->avail_phys);
+    monitor_printf(mon, "    avail_size:  %"PRId32"\n", s->avail_size);
+    monitor_printf(mon, "    used:        0x%016"PRIx64"\n", s->used);
+    monitor_printf(mon, "    used_phys:   0x%016"PRIx64"\n",
+                   s->used_phys);
+    monitor_printf(mon, "    used_size:   %"PRId32"\n", s->used_size);
+
+    qapi_free_VirtVhostQueueStatus(s);
+}
+
+void hmp_virtio_queue_status(Monitor *mon, const QDict *qdict)
+{
+    Error *err = NULL;
+    const char *path = qdict_get_try_str(qdict, "path");
+    int queue = qdict_get_int(qdict, "queue");
+    VirtQueueStatus *s = qmp_x_query_virtio_queue_status(path, queue, &err);
+
+    if (err != NULL) {
+        hmp_handle_error(mon, err);
+        return;
+    }
+
+    monitor_printf(mon, "%s:\n", path);
+    monitor_printf(mon, "  device_name:          %s\n", s->name);
+    monitor_printf(mon, "  queue_index:          %d\n", s->queue_index);
+    monitor_printf(mon, "  inuse:                %d\n", s->inuse);
+    monitor_printf(mon, "  used_idx:             %d\n", s->used_idx);
+    monitor_printf(mon, "  signalled_used:       %d\n",
+                   s->signalled_used);
+    monitor_printf(mon, "  signalled_used_valid: %s\n",
+                   s->signalled_used_valid ? "true" : "false");
+    if (s->has_last_avail_idx) {
+        monitor_printf(mon, "  last_avail_idx:       %d\n",
+                       s->last_avail_idx);
+    }
+    if (s->has_shadow_avail_idx) {
+        monitor_printf(mon, "  shadow_avail_idx:     %d\n",
+                       s->shadow_avail_idx);
+    }
+    monitor_printf(mon, "  VRing:\n");
+    monitor_printf(mon, "    num:          %"PRId32"\n", s->vring_num);
+    monitor_printf(mon, "    num_default:  %"PRId32"\n",
+                   s->vring_num_default);
+    monitor_printf(mon, "    align:        %"PRId32"\n",
+                   s->vring_align);
+    monitor_printf(mon, "    desc:         0x%016"PRIx64"\n",
+                   s->vring_desc);
+    monitor_printf(mon, "    avail:        0x%016"PRIx64"\n",
+                   s->vring_avail);
+    monitor_printf(mon, "    used:         0x%016"PRIx64"\n",
+                   s->vring_used);
+
+    qapi_free_VirtQueueStatus(s);
+}
+
+void hmp_virtio_queue_element(Monitor *mon, const QDict *qdict)
+{
+    Error *err = NULL;
+    const char *path = qdict_get_try_str(qdict, "path");
+    int queue = qdict_get_int(qdict, "queue");
+    int index = qdict_get_try_int(qdict, "index", -1);
+    VirtioQueueElement *e;
+    VirtioRingDescList *list;
+
+    e = qmp_x_query_virtio_queue_element(path, queue, index != -1,
+                                         index, &err);
+    if (err != NULL) {
+        hmp_handle_error(mon, err);
+        return;
+    }
+
+    monitor_printf(mon, "%s:\n", path);
+    monitor_printf(mon, "  device_name: %s\n", e->name);
+    monitor_printf(mon, "  index:       %d\n", e->index);
+    monitor_printf(mon, "  desc:\n");
+    monitor_printf(mon, "    descs:   ");
+
+    list = e->descs;
+    while (list) {
+        monitor_printf(mon, "addr 0x%"PRIx64" len %d", list->value->addr,
+                       list->value->len);
+        if (list->value->flags) {
+            strList *flag = list->value->flags;
+            monitor_printf(mon, " (");
+            while (flag) {
+                monitor_printf(mon, "%s", flag->value);
+                flag = flag->next;
+                if (flag) {
+                    monitor_printf(mon, ", ");
+                }
+            }
+            monitor_printf(mon, ")");
+        }
+        list = list->next;
+        if (list) {
+            monitor_printf(mon, ", ");
+        }
+    }
+    monitor_printf(mon, "\n");
+    monitor_printf(mon, "  avail:\n");
+    monitor_printf(mon, "    flags: %d\n", e->avail->flags);
+    monitor_printf(mon, "    idx:   %d\n", e->avail->idx);
+    monitor_printf(mon, "    ring:  %d\n", e->avail->ring);
+    monitor_printf(mon, "  used:\n");
+    monitor_printf(mon, "    flags: %d\n", e->used->flags);
+    monitor_printf(mon, "    idx:   %d\n", e->used->idx);
+
+    qapi_free_VirtioQueueElement(e);
+}
-- 
1.8.3.1


