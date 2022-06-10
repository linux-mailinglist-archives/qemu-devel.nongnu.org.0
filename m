Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF19546DAB
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 21:54:01 +0200 (CEST)
Received: from localhost ([::1]:37350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzkhk-0003AA-Vc
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 15:54:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nzkfA-0000RW-F4
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 15:51:20 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:17228)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nzkf8-0000Y2-FU
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 15:51:20 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25AJhws6021178;
 Fri, 10 Jun 2022 19:51:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=1ZR+Sgedi2tGRBAxcarfr88tCeKGr2svlbOvCPCek2g=;
 b=r6oj/w3FVTi0j2vVT1G8fz9QZy/byyfFeDZ4DAUhLsMoBLyv6JMFHZOUpndBqNoV6/8I
 eo0bHdUZoK5EpNP5ePPPY9hYpInkdgW1Ia9PVvRSEekbrThSU0ZaHAjkaxhYtUd2tks9
 TP6+WKtza3heVgN8WoHmmzGTY7NPeQTjCEcpmhva8bWLQU6mQ6R29qXDqbtI/vzsQXSn
 Z5HQGdapDRi/ZfHs/9mvzKOFBSU9HIsGriBLSiHd8l4LDD8/pHltNfk3Fn3Ol2uxtDAS
 V3XVGHE2Zz8fBRwH/sHXF0yV/CO60i023tTmHlFpUcf3zcX5+wQiEJRISa5NlvtTgib3 2w== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gfyxsprdh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 Jun 2022 19:51:13 +0000
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 25AJkbDF009380; Fri, 10 Jun 2022 19:51:12 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2172.outbound.protection.outlook.com [104.47.58.172])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3gfwu6bb5b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 Jun 2022 19:51:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WNomZmvu+X7CGapxP7WyVC0K3nHAjg+rueZHlycvt+94kJXvyX48ePSfL4BWUMlK7q7NtRdgVNCa6PytKRVq3wHTMZpjeOosKrjirR5T0FbNHE24nJbmfOD+Zui7GPUxC9Ut6aOh4HRPIZfo/Ke8XM3tncCjOQ+Pxz1HVuOmsXCAyremXtbPphnrhaHgZV9qzAZUmUnqjEOKonDXUCvuKOjFU9IwA2O7kJSa5SJXCxlWPCVm/gCmJVEIe0OrsA7v55PhqdTs8R8nHYOWnG5v372ykd4W2MPO42K3PKmG7LrwSDAuXY9cuHeMEhcxfIeijRTQNxF9CZwafI4XCwhYgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1ZR+Sgedi2tGRBAxcarfr88tCeKGr2svlbOvCPCek2g=;
 b=XtEF3wOQvap8b/NRavnxW5wj9vcnIzpdDqoUTYtDjS0Pdh0yop+GP4k9NiPOfHFyWm1DW38Cuy8LSYDG1nJ7Y8Xq3xpfDz3a/3SxJynmUmcl5qFvwvdDJdmm5AEduuzrSLBVfjYJoG64w+I6EPjbZ4P957dagxddfEWIC8jJL3urE3TGMY5DodUjub204+QemlLdsAUtTy9RGY7GojJ2dGtXtag6I+sBLthY0fLFH3S3SayVs9HJ4t3RIwQecr5taBQYbUeV0QgRKJ7skCis6+oKptFQtUJJtuQarYMzkoHZpxlb1PrJYbbLZ+OGwqZUE7s/otEQ0LUdBcpbRBETkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1ZR+Sgedi2tGRBAxcarfr88tCeKGr2svlbOvCPCek2g=;
 b=FSuYVMGgLreB76njS/2Db/o4hdvGelZSv28jJLC6KHeaMB0D9sIuXzY/vPiF4YCHcQLjm2CAAcmdM3EEaCqs1j8K0yZ4sfG7mZCJeTznv3KszPwxkUGT0PVsKyvuE3ST5LwUrmh6EhOm+eiRj31GM4GuvFX1QC0QQgoRwOCaWXE=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by DM5PR1001MB2410.namprd10.prod.outlook.com (2603:10b6:4:2e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.19; Fri, 10 Jun
 2022 19:51:09 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191%7]) with mapi id 15.20.5314.020; Fri, 10 Jun 2022
 19:51:09 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, mst@redhat.com, alex.williamson@redhat.com,
 f4bug@amsat.org, pbonzini@redhat.com, marcandre.lureau@redhat.com,
 thuth@redhat.com, bleal@redhat.com, berrange@redhat.com,
 peter.maydell@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, eblake@redhat.com, armbru@redhat.com,
 quintela@redhat.com, dgilbert@redhat.com, imammedo@redhat.com,
 peterx@redhat.com, john.levon@nutanix.com, thanos.makatos@nutanix.com,
 elena.ufimtseva@oracle.com, john.g.johnson@oracle.com,
 kanth.ghatraju@oracle.com, jag.raman@oracle.com
Subject: [PATCH v11 09/14] vfio-user: handle PCI config space accesses
Date: Fri, 10 Jun 2022 15:50:36 -0400
Message-Id: <5b7b7a37251e6b4c8ab7ba4b26ee26785f9069fb.1654889541.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1654889541.git.jag.raman@oracle.com>
References: <cover.1654889541.git.jag.raman@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DM5PR04CA0046.namprd04.prod.outlook.com
 (2603:10b6:3:12b::32) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 670dc2bd-b355-4aef-61b4-08da4b1a9064
X-MS-TrafficTypeDiagnostic: DM5PR1001MB2410:EE_
X-Microsoft-Antispam-PRVS: <DM5PR1001MB24102604D54B66303BB5B4D390A69@DM5PR1001MB2410.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 49CY3Cowlf11Zy4cEoBiNWe81DlN/59S0fBvPG3HnQpAj0tjWAou/0wLwvCfJOw3+nblkvvaFuZ+awvwpkzlIT4aAvgLziSZqAsfr2sRVQzvEXI0RFl0A/O9jmrU8T0eOnf7P/POC7itmCbX1vXO35bc0kBORP+KxJnAy3syribcc7wZfijeaBV4QUPolMzTeEQ9TBz04tikKrxMcYhqoFg1KSvHRMqexuGIE9tRU0+IM1z6N4tAzQ4ZyRuhYJagnPCN2AVaRJuNi1IKrqzPcv4vF4DMOW6B1Lw2Wuhl5aQu8k2XRGbdYQ6GpG8aeAbLan1gG4Sw2LOWOWaJDaE8k/zYkHFWpBbpJloW6ivSMc3vemP4VOx61CPg70/cVfZ10scetwQ/rFraINXilquv1Pdq5qqFhTDhrRsZ3iyOE8+5nNuIiuSiPezyA7q90VepSsqNiQcsCuS7vJuP4WfhjRB0vD5h9NlFygw7YOOCEM2F4H+ofJCoSsCelUf3mh8KOCIRCPzkbFTUCgOkvOw61GLY2LN5UOjFtZ4icasUv5QI1ii8wdNhhWbs8pP/Y7hhu6b9wZBZ5EVMa5qliSmOHXxcT7bouuvpfpB5t5R/jURojyjZXylW5/fCH2qqiWzlnCcj07L1t9whIVSqu03sIAN5wjojHMqYGDi0TH2rUpJlbqho/DGYdFnHTqxDrVwBK/pO5539o5J181HMo5+cUQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(86362001)(66476007)(6512007)(26005)(6506007)(6666004)(107886003)(6486002)(186003)(508600001)(2906002)(8936002)(2616005)(36756003)(316002)(6916009)(52116002)(66556008)(38350700002)(38100700002)(8676002)(5660300002)(4326008)(66946007)(83380400001)(7416002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aHY2NZOrZjOXYBy7Rh0T/qwg0ezv8gyBPiK6GMADldcgTW9mBYGp2OgyMn8c?=
 =?us-ascii?Q?oy4mNuu7Qfjk5+uPx0/bbhqEGMqAmJ9uos1ia7ual4toEKiQCYhsXCukqonH?=
 =?us-ascii?Q?VV2DcQXEFMjgRJpsBL4jrM0xwGp2pLczeJd5jTo7tdUNsZpqHEp1tJR7qSRo?=
 =?us-ascii?Q?rnE5HQePYaXwShAiNlEBcylXH6375sNKTCx0GUlJxiSGtdeXjYC4Dj4ZaQlO?=
 =?us-ascii?Q?GB+05gKmuGrGLcGTFvw+kHYNIy45cLcLQOWiDFHhBV+5alsdkCF0zr16+Njy?=
 =?us-ascii?Q?UrgfxX9T+H5mVP2mIO9i9DVEvN4LD9I7kKdNcLBEmw65kSEQdaxWy6XwkQEF?=
 =?us-ascii?Q?ndmXiSVjcGent1UdApCvT/Du66VmjoV26oLQmevRP24kD+3QTHFGnrrdzseh?=
 =?us-ascii?Q?HBfI1ZRlQkY9KNOI8AmKE5tFtXzg3Ze9tDa7yNg9VVrsM+4jFO2lFYY0sXWH?=
 =?us-ascii?Q?14o4V3ft/Zl/jko5QtZwdF6tcUNvJs316Z3gIVNb+oQiBzg1ipkcQ70ivXn6?=
 =?us-ascii?Q?Dn+0uA38UfS6iga85+aS1CDoGWI5mPxmay5S5qSZKPXCQYzEb+69Ai5Llzdm?=
 =?us-ascii?Q?hduMP/oJkTbbPo0g06o3jSlGhMSNMr2Ywo7YNPTbBiuSArJmVQxYY6QU6oX0?=
 =?us-ascii?Q?CKTs8OAFh7gBDeabWF4h4fuhslu7yt+zAK2RNBjFO3oIpLixGQMXc8pS3qnX?=
 =?us-ascii?Q?J1UmT9MCW2duoGhrk+eCKSpp2OPe+KhD5wNMSOylCmCoFC2dtjZL4B7FAscW?=
 =?us-ascii?Q?vCM7/U6T1XShpYov5W+yBggfVH3qYprM5BEmbftKnx0RyK0kLxiHzFRO2wUd?=
 =?us-ascii?Q?K9cqFNrsssaDS38J0QbBfQJ0hv6zwFjp/iQaUQFRdygVf/K7NwunqnCnL43m?=
 =?us-ascii?Q?oP8o4lI9zwlZLKjJsP3cZUxZUxjguT1ppIa7dmznd2wg4S/o0R+9Qk7R6gRf?=
 =?us-ascii?Q?IYUstUVTpMSZ8fkxx/evBkxMOcX3aV2OCxiv9JuFauqWqIdZUwIMvkvKYuaE?=
 =?us-ascii?Q?JW9pFVihL38F2yNhKTKK8W03dnsZ94OQ/StKxnMQc3/HG1xMVmL2jb5rCCtA?=
 =?us-ascii?Q?amWCBAkWiNOijEA3AlyBuC1I/jw+f+z48H7bl4NBFl4/W1k24vpyNYjHXVxy?=
 =?us-ascii?Q?iU5B9kBGpKcqvNmtyxYbXfxnjVtABssN4RB3Jve29THpLK8jshPB7ZrEMyN1?=
 =?us-ascii?Q?2RM159Afc/YB/wwlpYg946Cw8Drob9H4GptyZeFVvqdV42dLPee30zpLOy0r?=
 =?us-ascii?Q?xEJqTKK7FkgcBcaTZNzB/NklySkqKzjcJW+1KRWiPUfpg7Ij4x/2Ma4ZRnz2?=
 =?us-ascii?Q?6psTzmgzblszOYEbNyfAHJNT+mWe/XwBzlKZGzPagpeH6wHdwescMh9YYiAj?=
 =?us-ascii?Q?JYe3dXgvcuHx/CQkQfkDUWafrQVzxbTCBmvom2RtZ4EKRxjks3fCGnHybPac?=
 =?us-ascii?Q?1k1rReB19E4uRa7GeOJOz/Dz6vh9g9WmbsKjK+8H/3DblH13XgI8QBx3CVBW?=
 =?us-ascii?Q?qxQJ0tSmnPmmwx6dWgOmFj9O6S7BHIP1yZCxiKzjmHu7RVz0d3oe1y+RFvjc?=
 =?us-ascii?Q?qRC2aeTR2v8Gvdtu+UoDdrtH+zZyO2aCdMsT9VViGiGvlNONwETqUVuvVQbb?=
 =?us-ascii?Q?/PnC15Ho7OtapllKIpwxdh9ym8HfDOJ7xb4p3aNLSMA2U2bhJ5WuvyGKqXxF?=
 =?us-ascii?Q?d508E08ZTWwD4btOX6sSpu9DcljBUJVCzTy/sRoG+EmdPaWy8WfZ5JybpCGK?=
 =?us-ascii?Q?+iO6xIgQGQ=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 670dc2bd-b355-4aef-61b4-08da4b1a9064
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2022 19:51:09.1795 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0VkxxRIHz2Z1sSM+BgfLY5tRTzhBzLjvL6novt+b+3IQ7GYdIRmKwlXn5tSWo+XVXkKwS2Vn45a4OcgCzjmJxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1001MB2410
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.874
 definitions=2022-06-10_08:2022-06-09,
 2022-06-10 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 bulkscore=0 spamscore=0
 phishscore=0 mlxscore=0 adultscore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206100076
X-Proofpoint-ORIG-GUID: fzu7p23l563lBYLjfgFf4INZy4TYDHll
X-Proofpoint-GUID: fzu7p23l563lBYLjfgFf4INZy4TYDHll
Received-SPF: pass client-ip=205.220.165.32; envelope-from=jag.raman@oracle.com;
 helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Define and register handlers for PCI config space accesses

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/remote/vfio-user-obj.c | 51 +++++++++++++++++++++++++++++++++++++++
 hw/remote/trace-events    |  2 ++
 2 files changed, 53 insertions(+)

diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
index 178bd6f8ed..cef473cb98 100644
--- a/hw/remote/vfio-user-obj.c
+++ b/hw/remote/vfio-user-obj.c
@@ -46,6 +46,7 @@
 #include "qapi/qapi-events-misc.h"
 #include "qemu/notify.h"
 #include "qemu/thread.h"
+#include "qemu/main-loop.h"
 #include "sysemu/sysemu.h"
 #include "libvfio-user.h"
 #include "hw/qdev-core.h"
@@ -244,6 +245,45 @@ retry_attach:
     qemu_set_fd_handler(o->vfu_poll_fd, vfu_object_ctx_run, NULL, o);
 }
 
+static ssize_t vfu_object_cfg_access(vfu_ctx_t *vfu_ctx, char * const buf,
+                                     size_t count, loff_t offset,
+                                     const bool is_write)
+{
+    VfuObject *o = vfu_get_private(vfu_ctx);
+    uint32_t pci_access_width = sizeof(uint32_t);
+    size_t bytes = count;
+    uint32_t val = 0;
+    char *ptr = buf;
+    int len;
+
+    /*
+     * Writes to the BAR registers would trigger an update to the
+     * global Memory and IO AddressSpaces. But the remote device
+     * never uses the global AddressSpaces, therefore overlapping
+     * memory regions are not a problem
+     */
+    while (bytes > 0) {
+        len = (bytes > pci_access_width) ? pci_access_width : bytes;
+        if (is_write) {
+            memcpy(&val, ptr, len);
+            pci_host_config_write_common(o->pci_dev, offset,
+                                         pci_config_size(o->pci_dev),
+                                         val, len);
+            trace_vfu_cfg_write(offset, val);
+        } else {
+            val = pci_host_config_read_common(o->pci_dev, offset,
+                                              pci_config_size(o->pci_dev), len);
+            memcpy(ptr, &val, len);
+            trace_vfu_cfg_read(offset, val);
+        }
+        offset += len;
+        ptr += len;
+        bytes -= len;
+    }
+
+    return count;
+}
+
 /*
  * TYPE_VFU_OBJECT depends on the availability of the 'socket' and 'device'
  * properties. It also depends on devices instantiated in QEMU. These
@@ -336,6 +376,17 @@ static void vfu_object_init_ctx(VfuObject *o, Error **errp)
                TYPE_VFU_OBJECT, o->device);
     qdev_add_unplug_blocker(DEVICE(o->pci_dev), o->unplug_blocker);
 
+    ret = vfu_setup_region(o->vfu_ctx, VFU_PCI_DEV_CFG_REGION_IDX,
+                           pci_config_size(o->pci_dev), &vfu_object_cfg_access,
+                           VFU_REGION_FLAG_RW | VFU_REGION_FLAG_ALWAYS_CB,
+                           NULL, 0, -1, 0);
+    if (ret < 0) {
+        error_setg(errp,
+                   "vfu: Failed to setup config space handlers for %s- %s",
+                   o->device, strerror(errno));
+        goto fail;
+    }
+
     ret = vfu_realize_ctx(o->vfu_ctx);
     if (ret < 0) {
         error_setg(errp, "vfu: Failed to realize device %s- %s",
diff --git a/hw/remote/trace-events b/hw/remote/trace-events
index 7da12f0d96..2ef7884346 100644
--- a/hw/remote/trace-events
+++ b/hw/remote/trace-events
@@ -5,3 +5,5 @@ mpqemu_recv_io_error(int cmd, int size, int nfds) "failed to receive %d size %d,
 
 # vfio-user-obj.c
 vfu_prop(const char *prop, const char *val) "vfu: setting %s as %s"
+vfu_cfg_read(uint32_t offset, uint32_t val) "vfu: cfg: 0x%u -> 0x%x"
+vfu_cfg_write(uint32_t offset, uint32_t val) "vfu: cfg: 0x%u <- 0x%x"
-- 
2.20.1


