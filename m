Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA87D475C76
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 16:58:26 +0100 (CET)
Received: from localhost ([::1]:35270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxWfh-00074m-JJ
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 10:58:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mxWKP-0005uL-C1
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 10:36:25 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:33144)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mxWKJ-0008V7-8F
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 10:36:25 -0500
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BFE7ijs009518; 
 Wed, 15 Dec 2021 15:36:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=YkEOGLe3egtN92CF62I+zOI5JsngT2NI8O4xQCSgSvI=;
 b=f8sqBCBXQp7fzlHFHUYq5/CqBNcOU2c9p8TXx4/D8EPp1qnyM/Gd2Lm8VO4uBmTyi+Mp
 /HtsvDXo2ffqoG0ThKUHS/uwjPu3S4VrJXJtHkpQjAYee6Gyq3JJErAzJ5P5D3nBalpd
 +e257YfoPokwjW0BQhGU1MMOumAzAlGZNmzbV+riqtBHMERskdLmHUvd65NOK4EsTj/Z
 bwj/Jc/ehqy1gblMoQY1kId7pmjvRrR4DWtvLhVDZESk+05yUHrYYNiokcodOaebDGj2
 jKFwRsVSi1ENTWYclsGzXrtFc8uRHx0MoTYfkZ4CPdb1SCqCxe/316v4H61vcBpoLXAH Vg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3cx3mryb52-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Dec 2021 15:36:16 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1BFFU7Gq165372;
 Wed, 15 Dec 2021 15:36:14 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
 by aserp3030.oracle.com with ESMTP id 3cyju8gsnk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Dec 2021 15:36:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aBAFd1aqlSnM8wmIGvSXVlIvCRsrssBFDuuftrFQffvSrj9m7gtqjh5Dky7rtLIOgU1w/R6ONnVfO5GgQEP117OgrC2WUTvS962C61TjHWpxwCC9c+XatF0CV4AkTN0HQdHXP4WK6BuWidsEOmAx7GTXE83JJOd0vbBYzs9Gp8hAky59EoD+ZQvu4Tn760dePLz6nnF6ovytv1vionocp6MSpojKGqaEs9OOcliSv/k8thcEPGAyFhC7qZ6eoa2u8hAizYNmV/Cu5DP9G5iPwT7uMahYoUX9ghQRCtXqCveu02diJhWodh2uPiaivfF2mHqwu1RTzlewtQ58mFRKGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YkEOGLe3egtN92CF62I+zOI5JsngT2NI8O4xQCSgSvI=;
 b=Q1wtX75Q7R5D6vpz7gMJ807KPI7H4LbUW7BidYFNsG0Bht2FNzxbHI0y6dc1m+T6V5vbjCJ8Eu1KZ+iymwBZdjGH9FyjNHm9BojkLKT8266ShiPIl978fWhFRZvrVSP/g8h9uLzf0V//VIDqqGS5x5AedKLRjhbX4ro6nHu/JfrXamvPIjtwGX57n1C1X3VQNOpVZW33BKeJJPJFFVxxNiGIIAPM/ji1SrE/XnwQ8IElkQyXzB5XpPArv5zh2WAx4ei7PGs5uLepDMmR0emIz4Y2x2Kxg9hdB/1KfIZGWi2ezk4dnyipsWBWpOlVlgI2e19TyY43ycqTTNrxky0hJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YkEOGLe3egtN92CF62I+zOI5JsngT2NI8O4xQCSgSvI=;
 b=Z0ho3X0VvgEoSUdL1T2YIjFSs5SgywlGnprgWRivLbqn56lycACUelWwFOB4rHzQGOogxPnZsF28IC9NkCUbEVcRoTSQAtgmeTlcV9aBLNn7er46+51hORndHkKO/nn/zbQuK6W4Nz8h3C1o/kvcxeGZwbfNe4KvING88mD7PdI=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by BLAPR10MB5282.namprd10.prod.outlook.com (2603:10b6:208:30e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Wed, 15 Dec
 2021 15:36:12 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::b911:b919:6383:970d]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::b911:b919:6383:970d%5]) with mapi id 15.20.4778.018; Wed, 15 Dec 2021
 15:36:12 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 08/14] vfio-user: handle PCI config space accesses
Date: Wed, 15 Dec 2021 10:35:32 -0500
Message-Id: <34e287d0a8d585f104bdd06681b32fc93e8746c7.1639549843.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1639549843.git.jag.raman@oracle.com>
References: <cover.1639549843.git.jag.raman@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR11CA0105.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::46) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a5511c36-4138-4d6c-dcd6-08d9bfe09fd5
X-MS-TrafficTypeDiagnostic: BLAPR10MB5282:EE_
X-Microsoft-Antispam-PRVS: <BLAPR10MB5282C4CDC60530B62770BE3490769@BLAPR10MB5282.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:409;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bxGc9LQEwGVZUwOvrsWF5JBwJBvtoGDifbGbHRu5hJUHbIYzje2RLNm28KZ5eSoK2rOtXbG1HrDpfcG7CstDz+ftKk6Z3lvj3RNPqdHNyWiFGmv+O9OutSq07D8N9qxBNQLJMW+wDFjrRojfZqMWXd6/phe7GtEKQ2psxNSWZ01nEjBpOWhntTvn7hf2ahlDtgEXhBZKZo/kBN6e/QIQTqOM+35d9KUnT5cKZM4ZCIkw4vstCYEhxfjBFzBhc+uQAuaGw4jGsXD1XmEplGIzJJ6M/JVNtC5pQFFrbVWsBUpLoPnRpsGy8412dBtd3BO9mOPU9w3iggXq5jx28bwgjJ5urS0mYEeqo9ezRlLfUKm7AWIFVRLgB7gIm42i6CBAiLR7g/9tylOq2kFAeKQqpaGAvXNxPUYa26NvA8yBOQtbWMj0cXnWuR9+gSHFjUYbS5dUgMIcXwe9yC+2O10HcGor8s+aWybvcQwBueQ1BUKW9n1wDGZg0s3eG+lfLqxoNvCbupsVSgJy6bAib0FmuwSv4n8cUSD1g7fOOjmMqd60snTkpRkBsVFADgmxnGrSK/dBOQsNHz55Ps6J5trmJej0fWPtJsuB95UjrhV8CS4/2OGjXcwZT7M9VdX2Q6ExhBWEQIJ63ihC8q47yp1bohZptVXaiHY8rOpSqelD4q7H4Xz/2ZP90O+cxImy7gPPAx4gMcdk7MFiGSlRWz6Sqw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(2906002)(86362001)(36756003)(316002)(52116002)(6512007)(508600001)(2616005)(6506007)(4326008)(6666004)(6916009)(6486002)(7416002)(107886003)(83380400001)(8676002)(26005)(8936002)(38100700002)(38350700002)(66946007)(5660300002)(66556008)(66476007)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OqIvieuSG7D9Zq1VyNxtcIQvs7kpIPX6HX0XXSm31TT+2icphvbKuK/EyGRv?=
 =?us-ascii?Q?wWCz7pEFpnSB7UOCzf0pCP93kixd8Z45AYPuoOS+e7wWrgh8yyPBr1ndE6Ep?=
 =?us-ascii?Q?fhZdbZYBmZ3esRfoIXYmYXkkupXh3dSxtXhsZi9gBXt1JxOHfSgS6lRazjuG?=
 =?us-ascii?Q?zKJ+L8OrJMAWmfJPrQhDF3+yWtMr3OcGxg9zq3L/WIGhR/UuX2vFT0aQBNpT?=
 =?us-ascii?Q?uX72lzzQGkkFAsCVH4j8TMyy3ftUmJxrL6PdBBCC+iBwTPVI0hMDrlYTDVlI?=
 =?us-ascii?Q?4Toh1Rb5/ZcHeQx6Mg3F+yGp63AdgoeEpRNSdDdXSYhOrHi1Q93plDFdu7Bz?=
 =?us-ascii?Q?behSy7eEAzYN1LwKLlDQgHDM4sX/NY2sJdlxhfTX++kaLFmvlP51jkQLgo+m?=
 =?us-ascii?Q?In5m/msAMdMz+1iSE5dEKmd1VDmSHyOzChec4/mKz9JgR+s48HqyV6Hl7QVe?=
 =?us-ascii?Q?08GpzkDoTATiYFdnUWuZHEjnzBin2/Zq71+bA0SmVO7XRqwTIoW4UaUGK/yO?=
 =?us-ascii?Q?s4cYz6mt1PCC5r1I7V9g4nvT5kNcsQaddCxI+M8ku7pp30dKYYi7e5PTP4Ce?=
 =?us-ascii?Q?IDbPL7eL6UMFSM7bV2vvAdLPdUxoCgiXg7SZjY6MM4bm7nIXzAwRVxxwXC4u?=
 =?us-ascii?Q?U+tvxILViR6d0hbclbZvQF8tppwx2Tv3LT+pF3k75GJu18YlC5oqwiR+ItA+?=
 =?us-ascii?Q?pLhZ0SlKhUwXI5A5+vP58TTe/G3jDg6mhtax1Zv8GFVX9Yn+Y5Y28DGOiBNy?=
 =?us-ascii?Q?hvExKbWyX+QXq/VEjCP6C4P4nwoY/4OSu2iheBsi2C6JyXWVZUuzd8kHdzap?=
 =?us-ascii?Q?1ScCOVgoDCSo0oPs370QZkoq+wei3eAcLcJWwdLmh78UEevwTddKbAU1YRqY?=
 =?us-ascii?Q?tlll81+foG4S2Ok0X3XWQRKZzmn1scqb5WmjzJBCNPLgqtMifEC90XrGEJ5b?=
 =?us-ascii?Q?HlxbLPHtRZU6PYi5k8f6n0anilMTMIMwnBtc1aJMZFT3RsUXXV0EbbU+j+IV?=
 =?us-ascii?Q?wqJZBW9niVe15nAIsTHkvMy25ixEmy49aAhnumPn+ruwvthpR4ClY7hlY/bo?=
 =?us-ascii?Q?kF6CR8452qYno0MyDw7VhNLVEMsO3NXJAX/KdlLMLuMENa0QYKEslgRz4JvS?=
 =?us-ascii?Q?9Py9CkTWJIsfm5tbPJt1jGxgqENtB01/ntbajD6hD/S8tDtCCGvzAaQHZsRj?=
 =?us-ascii?Q?HD5FUwi5/PD5hdIoRt5Ln8po2nuRHsq3BMqrlSVEw63uTcFT64R6HBctWXNj?=
 =?us-ascii?Q?NNQ1hHbp6UZNUK6upjDcd7QzVeRx6ZxPlw7MYoPHRF7OcD7U5oN1WpkbWGiO?=
 =?us-ascii?Q?03jj2esM85/YHo0NSmHXhQmTZeUJlCwHifWZEmdoZq6oMuM8xlYUwC9baZOj?=
 =?us-ascii?Q?oih4nXqH/tUT2ouDGKqKRRaVjG0VgOsaZz6vnq8h37sY4ZvPLx3MQTiDnJeq?=
 =?us-ascii?Q?rWwP7am1jtUqJE6bzIdzYIs0qp0WrOD85Fa+YvQVhb4E2Dn921Tpr4XkzEIO?=
 =?us-ascii?Q?ViexiQ7zmwcP3ky0rIYJJz+igwM3ytUf2AgkLhm/nrjYggdE5BrurBlf+RVA?=
 =?us-ascii?Q?v8T6VRbu68jSDgpSgBPNT81AjLGiD0feanUbeTfDqs+WAAl83u4+5F1XxB3R?=
 =?us-ascii?Q?PdfCF8KCf5pM8aPWqKcsl2I=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5511c36-4138-4d6c-dcd6-08d9bfe09fd5
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2021 15:36:12.7464 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j0dKQqLIgOpfIFPH0tYpYjKInNiwl1oYVFdEv8IXRH8DR42K1KjvHFL4NTn8v/Rw1+/ek9yjunxSyQkHZUSzyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5282
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10198
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 phishscore=0
 spamscore=0 mlxscore=0 adultscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112150088
X-Proofpoint-ORIG-GUID: nDDznOFjaMA-t07IsESSfL4Dp_wjE7wQ
X-Proofpoint-GUID: nDDznOFjaMA-t07IsESSfL4Dp_wjE7wQ
Received-SPF: pass client-ip=205.220.165.32; envelope-from=jag.raman@oracle.com;
 helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: elena.ufimtseva@oracle.com, john.g.johnson@oracle.com, thuth@redhat.com,
 jag.raman@oracle.com, bleal@redhat.com, swapnil.ingle@nutanix.com,
 john.levon@nutanix.com, philmd@redhat.com, wainersm@redhat.com,
 alex.williamson@redhat.com, thanos.makatos@nutanix.com,
 marcandre.lureau@gmail.com, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Define and register handlers for PCI config space accesses

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 hw/remote/vfio-user-obj.c | 45 +++++++++++++++++++++++++++++++++++++++
 hw/remote/trace-events    |  2 ++
 2 files changed, 47 insertions(+)

diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
index a01a0ad185..c6d0c675b7 100644
--- a/hw/remote/vfio-user-obj.c
+++ b/hw/remote/vfio-user-obj.c
@@ -43,6 +43,7 @@
 #include "qapi/qapi-visit-sockets.h"
 #include "qemu/notify.h"
 #include "qemu/thread.h"
+#include "qemu/main-loop.h"
 #include "sysemu/sysemu.h"
 #include "libvfio-user.h"
 #include "hw/qdev-core.h"
@@ -174,6 +175,39 @@ retry_attach:
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
@@ -244,6 +278,17 @@ static void vfu_object_init_ctx(VfuObject *o, Error **errp)
         goto fail;
     }
 
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


