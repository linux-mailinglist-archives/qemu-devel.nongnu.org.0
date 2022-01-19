Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5481C4942CF
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 23:08:25 +0100 (CET)
Received: from localhost ([::1]:40546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAJ7w-0002FE-DK
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 17:08:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nAIjd-0008La-Ag
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 16:43:17 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:48162)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nAIjb-0007O7-8S
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 16:43:16 -0500
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20JJSHhR031217; 
 Wed, 19 Jan 2022 21:43:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=Ujt5zfPtC5WHKvYVwzvfE/vdX+EEmzYTSrIyCNarMYM=;
 b=WMma+F8fry0LNe2qe5m1NVM581F6ILtD8cGLbd+rFQFOAPSUigYRS2GEE7r6o3EHV0Sz
 yo3/u3xwN/b95DafnR9hLQsE90ZPozGNjX+MmQPpgudmYakBH2arjAgOQXkRKIhaLwA2
 71LCLCe/Dxkjy6FL1rlfEkgIO1VHXdZGsC/6PZJg3tnNyEIaRSVQEfZg/nslaBd0Db7i
 HpMC/z6WtaLR51/h0G7fxpiQ7V2CEqPFpAn+P9rnTc0EF/L5ZLYEuMZeP0QeF4xYmqPn
 Il7sOhio43NpoxP7Orc/ahSK4rkoaXmxERtjIzEzkez/nHVPG4xw/HmNwShIijwht7bj CA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dnc4vpgqb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Jan 2022 21:43:13 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20JLa7GV131829;
 Wed, 19 Jan 2022 21:43:12 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1anam02lp2045.outbound.protection.outlook.com [104.47.57.45])
 by userp3020.oracle.com with ESMTP id 3dkqqr65hc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Jan 2022 21:43:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bNBeC5bV/eGCDKvTVhmYq/vGlAooiKppkzzshQcEb6HjxydHRvw2ESooyK7c6Vf2McelgVt7sHwhlu8pkagrDTnlov1vviPXldPJhFB2AV9tPxx7kQhbe/2jnXzXK098ouPWosuj/7mjv5ShUDnbmH3giJxERuSaoWIB3Co+ER5fw7IphEZy+9BhMAh/1QDKr7qP9Hqki3lgpUHdvN224Bv8wVmPf3CkFPOp6IWTAePErRrpdiDGqiSLRCrdfzAgTYaJVyyG4NNnRkLdbNxvoO7NoT5twaoxA3AiIf6yfsl5vav21Rhkl5YLaxNm/TKwTP8feacqTBTnXKIj9aUTvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ujt5zfPtC5WHKvYVwzvfE/vdX+EEmzYTSrIyCNarMYM=;
 b=fy2BEmo3W++hMLc/+o21N5Ji3vDjhpj+fQZRZfgAj/mOBgiK9VGpOzPBa/Uc1LxxZPqbU9X5rgPmj+Cz7RoRLZ6Bbx2jUiTBZN6yh/4Fdricc1LBabPMChTeRghJGxyvwYMsYGoINJpApWYG69P2yYyOo+QG7sIhmLucvveSfpGw2u58wa8breBoaI0m+0nUVlHbTTmsnEZ757gQiD4YaaVOV4pZzE5RUE0gVaVidrG5ciM/ozpgvV0LF1YedJomUbE1Ooi4aPFCem9cW1LzMpTOySrbFRMdn2d3QoMFM/HRFNZn91BRrMNgOWSAFvU/l0ULfU33fdTycu8pKCJ3yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ujt5zfPtC5WHKvYVwzvfE/vdX+EEmzYTSrIyCNarMYM=;
 b=nlR2iaR4tR8/ju/xYQaX/4epbfdnwiEAmgfywJuDXrFHxCA4hpvwjDtJgDjVQucFiW8dthRfFu/Rzg0O3N6gPMGOt+m2FJbglaKtGWG96siw2aaNyQ9RtnJWYAZvtGFteq7aaAO6gHWdnZ3tYrwqez0rabNGF6O+WT6A1L5DEXY=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by DM5PR10MB1497.namprd10.prod.outlook.com (2603:10b6:3:13::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.12; Wed, 19 Jan
 2022 21:43:09 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::98b1:4348:5117:5fc]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::98b1:4348:5117:5fc%7]) with mapi id 15.20.4888.014; Wed, 19 Jan 2022
 21:43:09 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 15/18] vfio-user: handle PCI BAR accesses
Date: Wed, 19 Jan 2022 16:42:04 -0500
Message-Id: <b6c6e52314ad6df12634f3223bc509ed19cff011.1642626515.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1642626515.git.jag.raman@oracle.com>
References: <cover.1642626515.git.jag.raman@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR08CA0043.namprd08.prod.outlook.com
 (2603:10b6:a03:117::20) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e57d2423-ad21-42a6-42f1-08d9db94af57
X-MS-TrafficTypeDiagnostic: DM5PR10MB1497:EE_
X-Microsoft-Antispam-PRVS: <DM5PR10MB1497B09B4151260231CC31EA90599@DM5PR10MB1497.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:390;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6o4qQuFioa8mSIi/lwiu6LriP6Xl72mIQtiKQwnWaxgK14paMONoY99s6uJUnmXtahFNsjyTrTHxKHWFckpq5CUSKq5rau0vyKdDPFxzr8k9hyugwFUmlqYhOw5iqrJHQFfrgXtyEW20sfC3qzOqQ3kchluyPh6iEswk6788E6LKb5ZGgbIvJmircT1xCauIJN86LlAwBAoah2ftoTG+Ww4j3gYhImzv9seT4PtQcFSbzmFBllrsG4r1n1wcyjO9ZjO2wsRvKu8USO7HNZ7THrDfR06yyVD5djcDMhU33Tij626VA8bTS18ICim1sRnsyIDrSo7WKQJj+Bg0xblIwwR1HPRzQC97HCAh/1PUH7gVi/qhG+uw1jv1i5KIGI00M9qzawX94egoP0cMHbVEp5b7oeb6wEiB3OsHI8O6GWurTALx41nzmNC0DSrvIokYrHX4iB57knO/DbFytWZNd88UhszhnKPcOvqN15nEerQ8uahuNWJ3MAj6Qnli3ZEclCS0Me6n8eW03moQHkuN/QY3IdgyUOqf/gHIZC7YYrWm9edAODh1VvH+9KRLkBLMdfzKjzTq5xYkPWifYRsTuFD9yIhb6lVvwboyY9EqMFk1ni79D/pGvXTfkGBFB1aG/JmUP+lV+uW0pwGvU2JMYJW8rX0mTcyKt3BVmDvzWeea8Y2jBQCG5OG3kPUxDcL2M6B2JbnHoT+McgSg5J8WZQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6506007)(26005)(5660300002)(2906002)(6916009)(8676002)(86362001)(4326008)(36756003)(508600001)(2616005)(6512007)(83380400001)(186003)(8936002)(107886003)(316002)(66556008)(66946007)(66476007)(38100700002)(7416002)(6486002)(52116002)(38350700002)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5YQ9AOlH4uq1NUz6kuCfmsfljDJhpTDf9c9Ue7cCNG/WlGSGXJapyB8wAiQe?=
 =?us-ascii?Q?HIUiSkJJu6U1UlnxN5bfGP2ghOGgM1sFPmHxcEA4g1SdR0eWI9OFDA1p+HDg?=
 =?us-ascii?Q?PKnhqLO7uMoGuThyAcQRBvnM3GMY54n29J+HVo71fDXocXghTqaDQiSQT2Ye?=
 =?us-ascii?Q?dD0oFYoXiK1/oZdOEPXVKb3TLtzzizADwAla+xM1Hy87JVb/GkF1M+9/X/yu?=
 =?us-ascii?Q?HLyoDRbDWT2PVJHKp+E7RxB2JbuBuc/5gfSzBGIjh5CQAOJZ15SKa90lRcNF?=
 =?us-ascii?Q?n35ruQg7ygy95tcQQ6UUE3kqIk9cO5mfwp+aDR1VKJmt8ZjnKis9tCtqRQ0A?=
 =?us-ascii?Q?ZvtezIAWSVEroZ4wbKnu1S+ppsF4SmRQzyyW7caGE6W25FWCouEz/HidCkAE?=
 =?us-ascii?Q?FhCHTM9Y+lTo0QoB1NPOqfzRrVTJosVFFjFRYbuOj2eXlevRBNnBQaDdBLAs?=
 =?us-ascii?Q?pwwVMO4XjHXw8wTXVVtxxzrPjcucPignrI7a1J8IZS++tVmKxC36ZZBo7VGq?=
 =?us-ascii?Q?QpmOh73vCQFzI3ZDXevP3nRShE9GCF5MZDs8nlK4pDozLxzIyHK0HKLnLRxc?=
 =?us-ascii?Q?Jn84orCpDqPrjW+kViUTOtKVg3+Z4WC5dijRHqaHKxk0ErwzgUbpgOjJcrvn?=
 =?us-ascii?Q?JEJcwToI2OsgVsoWnc2qlXhUOOa7tpv51cCgSxDJCFr4qYPPbMNlm4qP99+d?=
 =?us-ascii?Q?DL6Xlq9eDa8ZzrYcEz4j2JwTi6OOx1YfosQbMNgOLyGHog343B6Pds+W3Sne?=
 =?us-ascii?Q?MKP+QHsbIFofAsSBWhst7mk50iaSVGfOQlXW3o6jfz9NCHdZPTReEBfbF7Ef?=
 =?us-ascii?Q?AZEQSquK5DsXMX3GAEQSWe8Hq0LHqk2thhQvLaIFhRf8hR6NmRHS7xEFB+Ii?=
 =?us-ascii?Q?wfBmGalU4hL2YAm5CSsLI3uppNSLI1VmX9SXQQllfvgSF2J2+bLHWruCFiEU?=
 =?us-ascii?Q?Yyu31vYuDenwuNiFCpTfuegfgEUAXcx6DPbJs/+fJBnQi1N+m5dK37BgPDd8?=
 =?us-ascii?Q?m1oSMRPwPYEvfzDKpfDvpf+Qf4wnZyY4DJ6ZmMV0y2sqgwDTklkbzB3udqXo?=
 =?us-ascii?Q?ixeF5mTzF9HpBrNBdCDLI8Iu6yscvQWCPljLUEejY+g1BzyGQSSwywoFiAi2?=
 =?us-ascii?Q?S/6+W1bUI3FWmC0lubsGXt6KyV1QFFt9DMoj7ID7hAb0pyls8a6kD6GNdI9S?=
 =?us-ascii?Q?YFZyouQ7KI8n8nX3LKA7svu4NdltdvX46rPsyw8hqawSjAr8P+TXLFylcl6H?=
 =?us-ascii?Q?Z9KsPv8mCGudghmjsY5AM61QeOcxjPAwkTJPticIrg9M+b1Th0WBq4TD023k?=
 =?us-ascii?Q?mVHb6F84gliGT677WDdpTCM0YPVNsps/UOmct+L4NDmAFkPGvev+t/TAUl28?=
 =?us-ascii?Q?xWvGooLiRIN7YA0yZ3YIQheAiO1DRdRkAJIbPFamZCY5/6fmV1N9iCxFZokN?=
 =?us-ascii?Q?/S4zRecEFF6svoVQnw1wVTpcCMrEseiTuro4dQea5dS2bav8uYhfVnRvD9sS?=
 =?us-ascii?Q?ELhKdcweFbZzoervzRnVgDnBrImwCRaUStjAOtt3bhLJtGqpjGAeamONvBQG?=
 =?us-ascii?Q?lyI7LC9FeSxCs4WsbkcBGqxR2DaL9/IJ46cuwabBp2TdJuFfhQcQIqIV3J8e?=
 =?us-ascii?Q?a+/vz/dF/BgSI/wg7AMkiBQ=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e57d2423-ad21-42a6-42f1-08d9db94af57
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2022 21:43:09.4416 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hrT6vEpVWI+Kf6YgaKOXFyY+3P4bHebvhRfnXbJIxwd80DqRvpSWPnBIdyjjkMmHWOwTHBKNQz0Z2dqI6GnX0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR10MB1497
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10232
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0
 mlxlogscore=999 malwarescore=0 bulkscore=0 suspectscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201190117
X-Proofpoint-GUID: _oRvupgVsGkm253HXhr5kQmw9IvyUztx
X-Proofpoint-ORIG-GUID: _oRvupgVsGkm253HXhr5kQmw9IvyUztx
Received-SPF: pass client-ip=205.220.177.32; envelope-from=jag.raman@oracle.com;
 helo=mx0b-00069f02.pphosted.com
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
Cc: eduardo@habkost.net, elena.ufimtseva@oracle.com, john.g.johnson@oracle.com,
 berrange@redhat.com, bleal@redhat.com, john.levon@nutanix.com, mst@redhat.com,
 armbru@redhat.com, quintela@redhat.com, f4bug@amsat.org,
 marcandre.lureau@gmail.com, stefanha@redhat.com, thanos.makatos@nutanix.com,
 pbonzini@redhat.com, jag.raman@oracle.com, eblake@redhat.com,
 dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Determine the BARs used by the PCI device and register handlers to
manage the access to the same.

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/remote/vfio-user-obj.c | 92 +++++++++++++++++++++++++++++++++++++++
 hw/remote/trace-events    |  3 ++
 2 files changed, 95 insertions(+)

diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
index e690f1eaae..bf88eac8f1 100644
--- a/hw/remote/vfio-user-obj.c
+++ b/hw/remote/vfio-user-obj.c
@@ -291,6 +291,96 @@ static void dma_unregister(vfu_ctx_t *vfu_ctx, vfu_dma_info_t *info)
     trace_vfu_dma_unregister((uint64_t)info->iova.iov_base);
 }
 
+static ssize_t vfu_object_bar_rw(PCIDevice *pci_dev, hwaddr addr, size_t count,
+                                 char * const buf, const bool is_write,
+                                 bool is_io)
+{
+    AddressSpace *as = NULL;
+    MemTxResult res;
+
+    if (is_io) {
+        as = pci_isol_as_io(pci_dev);
+        as = as ? as : &address_space_io;
+    } else {
+        as = pci_isol_as_mem(pci_dev);
+        as = as ? as : &address_space_memory;
+    }
+
+    trace_vfu_bar_rw_enter(is_write ? "Write" : "Read", (uint64_t)addr);
+
+    res = address_space_rw(as, addr, MEMTXATTRS_UNSPECIFIED, (void *)buf,
+                           (hwaddr)count, is_write);
+    if (res != MEMTX_OK) {
+        warn_report("vfu: failed to %s 0x%"PRIx64"",
+                    is_write ? "write to" : "read from",
+                    addr);
+        return -1;
+    }
+
+    trace_vfu_bar_rw_exit(is_write ? "Write" : "Read", (uint64_t)addr);
+
+    return count;
+}
+
+/**
+ * VFU_OBJECT_BAR_HANDLER - macro for defining handlers for PCI BARs.
+ *
+ * To create handler for BAR number 2, VFU_OBJECT_BAR_HANDLER(2) would
+ * define vfu_object_bar2_handler
+ */
+#define VFU_OBJECT_BAR_HANDLER(BAR_NO)                                         \
+    static ssize_t vfu_object_bar##BAR_NO##_handler(vfu_ctx_t *vfu_ctx,        \
+                                        char * const buf, size_t count,        \
+                                        loff_t offset, const bool is_write)    \
+    {                                                                          \
+        VfuObject *o = vfu_get_private(vfu_ctx);                               \
+        PCIDevice *pci_dev = o->pci_dev;                                       \
+        hwaddr addr = (hwaddr)(pci_get_bar_addr(pci_dev, BAR_NO) + offset);    \
+        bool is_io = !!(pci_dev->io_regions[BAR_NO].type &                     \
+                        PCI_BASE_ADDRESS_SPACE);                               \
+                                                                               \
+        return vfu_object_bar_rw(pci_dev, addr, count, buf, is_write, is_io);  \
+    }                                                                          \
+
+VFU_OBJECT_BAR_HANDLER(0)
+VFU_OBJECT_BAR_HANDLER(1)
+VFU_OBJECT_BAR_HANDLER(2)
+VFU_OBJECT_BAR_HANDLER(3)
+VFU_OBJECT_BAR_HANDLER(4)
+VFU_OBJECT_BAR_HANDLER(5)
+
+static vfu_region_access_cb_t *vfu_object_bar_handlers[PCI_NUM_REGIONS] = {
+    &vfu_object_bar0_handler,
+    &vfu_object_bar1_handler,
+    &vfu_object_bar2_handler,
+    &vfu_object_bar3_handler,
+    &vfu_object_bar4_handler,
+    &vfu_object_bar5_handler,
+};
+
+/**
+ * vfu_object_register_bars - Identify active BAR regions of pdev and setup
+ *                            callbacks to handle read/write accesses
+ */
+static void vfu_object_register_bars(vfu_ctx_t *vfu_ctx, PCIDevice *pdev)
+{
+    int i;
+
+    for (i = 0; i < PCI_NUM_REGIONS; i++) {
+        if (!pdev->io_regions[i].size) {
+            continue;
+        }
+
+        vfu_setup_region(vfu_ctx, VFU_PCI_DEV_BAR0_REGION_IDX + i,
+                         (size_t)pdev->io_regions[i].size,
+                         vfu_object_bar_handlers[i],
+                         VFU_REGION_FLAG_RW, NULL, 0, -1, 0);
+
+        trace_vfu_bar_register(i, pdev->io_regions[i].addr,
+                               pdev->io_regions[i].size);
+    }
+}
+
 /*
  * TYPE_VFU_OBJECT depends on the availability of the 'socket' and 'device'
  * properties. It also depends on devices instantiated in QEMU. These
@@ -386,6 +476,8 @@ static void vfu_object_init_ctx(VfuObject *o, Error **errp)
         goto fail;
     }
 
+    vfu_object_register_bars(o->vfu_ctx, o->pci_dev);
+
     ret = vfu_realize_ctx(o->vfu_ctx);
     if (ret < 0) {
         error_setg(errp, "vfu: Failed to realize device %s- %s",
diff --git a/hw/remote/trace-events b/hw/remote/trace-events
index f945c7e33b..847d50d88f 100644
--- a/hw/remote/trace-events
+++ b/hw/remote/trace-events
@@ -9,3 +9,6 @@ vfu_cfg_read(uint32_t offset, uint32_t val) "vfu: cfg: 0x%u -> 0x%x"
 vfu_cfg_write(uint32_t offset, uint32_t val) "vfu: cfg: 0x%u <- 0x%x"
 vfu_dma_register(uint64_t gpa, size_t len) "vfu: registering GPA 0x%"PRIx64", %zu bytes"
 vfu_dma_unregister(uint64_t gpa) "vfu: unregistering GPA 0x%"PRIx64""
+vfu_bar_register(int i, uint64_t addr, uint64_t size) "vfu: BAR %d: addr 0x%"PRIx64" size 0x%"PRIx64""
+vfu_bar_rw_enter(const char *op, uint64_t addr) "vfu: %s request for BAR address 0x%"PRIx64""
+vfu_bar_rw_exit(const char *op, uint64_t addr) "vfu: Finished %s of BAR address 0x%"PRIx64""
-- 
2.20.1


