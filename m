Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D938F51C637
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 19:36:07 +0200 (CEST)
Received: from localhost ([::1]:41030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmfOY-0006fv-UJ
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 13:36:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1nmf0m-00063U-Jm
 for qemu-devel@nongnu.org; Thu, 05 May 2022 13:11:35 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:58112)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1nmf0i-0002CG-29
 for qemu-devel@nongnu.org; Thu, 05 May 2022 13:11:31 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 245FTMUZ030007
 for <qemu-devel@nongnu.org>; Thu, 5 May 2022 17:11:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=ApAy4fxodgJ6qAhXdB6hzwjclmc8Xyt4FMplOhahbt0=;
 b=Va/3zP8QUVtH3GqDdJdfczknDiRkcvQDzDHnYb++M5F1t9i6cMTSD6+pDnR4arc3K60A
 cINm/MeCYHvWfls4f8HwhHNnp2MsNz1ixwa5TNTrkyfiqT5X4TrlM5bXa8mg1xRPi0XF
 sKWs2+JAtKPfEUU/fQuOhz6zvGPCQyDQ8kBnocGAj9u/bp7xs8ylWJPMw/WKzMTo0Bfv
 P5Jw8gUVa30//hjr7RVlKlC+KvD2mRHXsBiuabzefqU3LV4ILCTe1Osj2S909JEmdatG
 KzI48jsUyO9tI6kiAbS/Zg7Ypm9gMJShpwLoS1rgh61tQsBrutpucFkDYLKZ5AB1rh+9 /Q== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3fruq0m379-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 17:11:25 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 245H0Zqd006282
 for <qemu-devel@nongnu.org>; Thu, 5 May 2022 17:11:24 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2173.outbound.protection.outlook.com [104.47.55.173])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3fus8ybftd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 17:11:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XIKJYvlYHGowuGbDuX3LDMo2IoyN1nuntseN4VaahgTIx3/A3nqxqQDjmjZp9Hym4mLttWz8LlKJzuNr0bs1pmJDxLTPSc8ibri/8NwvsUnmQ4wh3MtxI249TqnKXxUb403mcm8wGF5igPBOpW4OkfI+dIsRiQq2qA2ZcTvwu+WqhHQqtK7Zz/qKIhpYDqtGwJy6bmZOl9zW0Jj6ZG3ul0FgucYcMlhCBxGz80RtQVaExydYSuEyINYrkT1SeC3TUtPhsAYCM+g/sRPjIeqmK9DAGmwPdmBInNXu8hf1iIIg9w8pzS8Y+bHq83R0CvpeQfYIwGWKjcJl4ugignkTZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ApAy4fxodgJ6qAhXdB6hzwjclmc8Xyt4FMplOhahbt0=;
 b=N2KJQmqmI3CkiGu+RONEJpSNW1bifkBvI4Xn28xkLN98aCKbPEqKEJtxpt1velb3o6XFdbu21s2m/jzu5zifDTxxBBIPrk1nt6YAsN2Y2Y7+z20S0K/rWQOj5loqbtUNVbbK6zbLCkjS/6lroXcjEta6KQN9uKi1IVTh2Hu9PZSNYbUHnTztJ3KcFotGjKwcekRDecQEq3CgiTOCwGV8d+uvBg+AEojyKrP2gDSmB9Fn1cE61vW+4DZo4de9aXugKmme3jBlkucowivWj1+D8sueOK4XH2Ulfjh1xmL94+5y072BYX0415bB5OgFT6CouL/CS36yJqZrNh2/YtC6Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ApAy4fxodgJ6qAhXdB6hzwjclmc8Xyt4FMplOhahbt0=;
 b=VJorGDyhzOqJOYzBRCdIPl2+tslyPBQz7JrNsSe8UEIL7RSyeE6wn/y2mhVp8EKm/G6V51JFdg9iE/n5hsVub1yNwrWtgF0UFY8FpZ9iZiGhg5F5KEXDAJjCtU1cmYsAeVU3aEhpy8C/Kg8GIw8p+7JUDGyKTTdkhUHBKTgttVM=
Received: from BYAPR10MB3255.namprd10.prod.outlook.com (2603:10b6:a03:156::22)
 by BN7PR10MB2689.namprd10.prod.outlook.com (2603:10b6:406:c3::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.27; Thu, 5 May
 2022 17:11:22 +0000
Received: from BYAPR10MB3255.namprd10.prod.outlook.com
 ([fe80::cce6:1c15:c6bd:dd05]) by BYAPR10MB3255.namprd10.prod.outlook.com
 ([fe80::cce6:1c15:c6bd:dd05%7]) with mapi id 15.20.5206.027; Thu, 5 May 2022
 17:11:22 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [RFC v5 14/23] vfio-user: forward msix BAR accesses to server
Date: Thu,  5 May 2022 10:19:57 -0700
Message-Id: <a95d08805d112e1d04a77d1eb0b7cade27683e5c.1651709440.git.john.g.johnson@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1651709440.git.john.g.johnson@oracle.com>
References: <cover.1651709440.git.john.g.johnson@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BYAPR06CA0048.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::25) To BYAPR10MB3255.namprd10.prod.outlook.com
 (2603:10b6:a03:156::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f39960fd-78a5-48ee-0bc7-08da2eba461c
X-MS-TrafficTypeDiagnostic: BN7PR10MB2689:EE_
X-Microsoft-Antispam-PRVS: <BN7PR10MB2689D1AC6B4F6149F9C68F38B6C29@BN7PR10MB2689.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: i5Hux2jlFEtfXSTXQtjO+smyJ/NgK4ResYXUDtb9iGTD3XVOa90+FKTbjaBJbAtaGVvEqu0+wjXn4IyKYG7EjTIK7g352R2TIYVVo/HfHhXiBM0LbHVY9lhmxdy7QZTP1UmWiP335ghQ7pvwvqXYUerX952I6S//FUkw2CgDzKQwrIq38rqshVIpJ5da6YezS36S+vu33RSUnLn/os56H3T1/U4HetIcbP1qn4EOAzENDYAnoCc1V3Nmblws1dP3mGHxzklm8+wz0R3RbIamyYxoT2GnBqhpZPOP6FbjAJ0Mxdu/36gCyS6JIC/1lRE/9WkK/BcAHNAhALC6javAV+3wYinz87wXN69fWMOlK1n2zDizQVgB5VHzOmr0rsrtDGxD6tze8GnXkINpq37fiM9e4jsDWXLOnuLZtrpeD9tChzVBVkwnxmdutGaX4sdcX7wxV9YHJZDfB1/8+kKydJmCI6M8PXzXNz/jwNKEBTF+0WtpsGZOKTue0TecqA/jQK0sCIB4BG6D+txw3StN2V96LmZTOy5NcP/R5JBDT6pCwRrrILAvakRznwmC0nj3sHAK08NTBIuRCi+60p/ymCGWO90PMIrO5NWIDZORP490EIrWyYPJup3M2QARt+f4OAmg+gAJpQWSGs3sYrtjMpHSGHBgWHeP62n2bMz14EmaRzVoNLLNHusuxQjR5T58DMoBMwD8Z79U3Eyd9UY6UA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3255.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(38100700002)(83380400001)(6916009)(6506007)(6512007)(38350700002)(316002)(36756003)(2906002)(2616005)(26005)(66476007)(8676002)(86362001)(186003)(66556008)(66946007)(6666004)(52116002)(6486002)(5660300002)(8936002)(508600001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wghMNcDKOZDN8prkl9jkXeSlIeTlfwPMStkgUtyivHkqyn6KYnDqEpi+Zu5T?=
 =?us-ascii?Q?lRzTGEqqAm+uO3Ue6nnRBSUE5AoWK7IfMBX7JxRl7j4DExqbo9sAE8XQZsPm?=
 =?us-ascii?Q?w9qhVeVWsw8o75fqF2497F+g/xAguOvcGt18mFRSb0UAPzjHTcCvvE43i4mF?=
 =?us-ascii?Q?iN2DCXtW2M2gYppcbjZfUMsTK6kjdnx+WOaGMDFSVRC6cpb+WKH4GNeEhUuF?=
 =?us-ascii?Q?WaeOpC1Qx2eflc3gG9MKQYqZt/5MkzFXbpIoftmZfjYstOCwv2jg/o86pKGz?=
 =?us-ascii?Q?QTEEsOzMLlzKuZ5TwHojw9B1sl08jhsm2s3r/SaGReHYO2XSdNX8LjES8Yke?=
 =?us-ascii?Q?J5rs1NMSRBmMaunSIpehfJPnv+iEVyMRxL7cq3JipmGDKEP2aGDzhH+0QyX4?=
 =?us-ascii?Q?3PFFajIWanVj5Jk9pZbFJ3D6TtWwWh//EHWpzotMF2BPoThOqt12BYNReKCk?=
 =?us-ascii?Q?gjB7miAL1O4aGjSlgTPIuDCLZIHNllWRTmDI6zhyvCZX7lw8aX0JHNVufT5T?=
 =?us-ascii?Q?omA38sld/1GIk8NCkZLVdmL5HiFsJXibUGi72RakVphZrFE7lfiCv+uh4rAV?=
 =?us-ascii?Q?Fh93i/OW/8bpVO0FzdMn9IT/PzHYurvQNrNmcl8dci+vCmv1I1UPvdQ89YII?=
 =?us-ascii?Q?dmwTZBIfaTYX6yw4rQBQrRsqo8Mk42ssTohDs6btra1nXzNrBg9PZz12ZZ+S?=
 =?us-ascii?Q?8k+SelqeyQi5UIbuaBaI6Wo2xNEajA1kFTjuHmP2wjDe7kl0NRRK/MUTdUNq?=
 =?us-ascii?Q?MGspaoJcdCotaMLzO1/oc6kaOuhH4T+m/n2avxGvUV1BXyovYK12FpCENUw7?=
 =?us-ascii?Q?lqhQQWi2q7JkbQ3kPuVzg9X9alq/jUvjVX8WWFkagvLP1R9F9sqi/l3uFMj9?=
 =?us-ascii?Q?lzIAwNfkmks6GYp9BBl8Io2UyvujzQjMlO6/D9ib2f1ObdpxgDoeRg8EnyRb?=
 =?us-ascii?Q?+Y7v91sSQ8xU/UGu1nk5t2rEa/QoZGzVP5aMjeoqgdTdFva1gDVTjLX8HXKr?=
 =?us-ascii?Q?7+KKB90M3IduzzhtfQgMvRmYjGjJme+nmgoYdrQa/gbyr8dMFDepuRoLbIcw?=
 =?us-ascii?Q?aXOnsy7xKXG4mjvmbgR8JxCWAjlTGG2/cL+MSDxYjTdpQFLtRGS8CGX6wslc?=
 =?us-ascii?Q?w7UDDj6PcYzCqOEMz1HSjtQHgKjgUpXqxOda4AvcKhyTikcmDncWaC5cIFdE?=
 =?us-ascii?Q?wlXxhs7vJFmtkQc/TlYZNRco7WlMGjhO1xeJ84FcOnkT5GzgCnd/bNnTfwP0?=
 =?us-ascii?Q?pVxlIsD9rkRacmTTcIq0m+t/I0gbAOZ1WbzbrmUd4M4NQC2oqmt1iyb5dVkE?=
 =?us-ascii?Q?SJB9+/CzjQYvR/exvinDvqnTo+yd11AJRAeAayvo/E2ABm2wnj0WU124VTne?=
 =?us-ascii?Q?32cetRXhpXTjW7u8ZQsxksxtxHoMvCVNgTjsAqPK30e+HFORwuagNXgrkF3s?=
 =?us-ascii?Q?h9L6Lld8davxt1kIA0kAcP80FJflHCsv+C3yQkdn4hCJv6584nN8D7JhH8ng?=
 =?us-ascii?Q?Niuz5qvFsR0kk8dvwY1NwIL9ckT7lRYsWwJe7ev8jSlQJ79sysaeyhcuzFFN?=
 =?us-ascii?Q?3aedAEN1r+1HjwjBrX4mJ3gvjv5T6ekp0oIs96nY56SpQ2/pWA9/LYwBI6vS?=
 =?us-ascii?Q?MhFJLMfbRMoxt4ZMQcfK5fA3Ru6JBPTHXM66pK0eCp1Ch5WL9Cno6wlJLSBJ?=
 =?us-ascii?Q?9m8uIhk3uqgsysO7yLhvbQlmytKrD8Xh1p40c6p36pUEzM1lhQtRwxfSERB6?=
 =?us-ascii?Q?kcGj6+q7rj+1I8LTXVs4wZQLKiLkXG0=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f39960fd-78a5-48ee-0bc7-08da2eba461c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3255.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2022 17:11:20.2478 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3+xBpGgvAukg8G0XiqpCa3Lpf5tmNRoc217yePLHao6jTcuBNiS/dMzWaHa1z7YQEHS/LUEaxHzfoqsn8JLLaZ0TkX0XTMj45wKEMOG4AZQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR10MB2689
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-05-05_06:2022-05-05,
 2022-05-05 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 suspectscore=0
 mlxlogscore=999 adultscore=0 mlxscore=0 spamscore=0 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205050118
X-Proofpoint-ORIG-GUID: Dk1dJIaexZ4dTKeR0tg9ZdPK_5THjW4b
X-Proofpoint-GUID: Dk1dJIaexZ4dTKeR0tg9ZdPK_5THjW4b
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=john.g.johnson@oracle.com; helo=mx0a-00069f02.pphosted.com
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

Server holds device current device pending state

Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 hw/vfio/pci.h |   1 +
 hw/vfio/pci.c | 112 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 113 insertions(+)

diff --git a/hw/vfio/pci.h b/hw/vfio/pci.h
index 643ff75..a4eb5b9 100644
--- a/hw/vfio/pci.h
+++ b/hw/vfio/pci.h
@@ -112,6 +112,7 @@ typedef struct VFIOMSIXInfo {
     uint32_t table_offset;
     uint32_t pba_offset;
     unsigned long *pending;
+    MemoryRegion *msix_regions;
 } VFIOMSIXInfo;
 
 /*
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 1be6683..bc70968 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -3426,6 +3426,111 @@ type_init(register_vfio_pci_dev_type)
  * vfio-user routines.
  */
 
+/*
+ * The server maintains the device's pending interrupts,
+ * via its MSIX table and PBA, so we treat these acceses
+ * like PCI config space and forward them.
+ */
+static uint64_t vfio_user_table_read(void *opaque, hwaddr addr,
+                                     unsigned size)
+{
+    VFIOPCIDevice *vdev = opaque;
+    uint64_t data;
+
+    /* server doesn't change these, so local copy is good */
+    memory_region_dispatch_read(&vdev->pdev.msix_table_mmio, addr,
+                                &data, size_memop(size) | MO_LE,
+                                MEMTXATTRS_UNSPECIFIED);
+    return data;
+}
+
+static void vfio_user_table_write(void *opaque, hwaddr addr,
+                                  uint64_t data, unsigned size)
+{
+    VFIOPCIDevice *vdev = opaque;
+    VFIORegion *region = &vdev->bars[vdev->msix->table_bar].region;
+
+    /* forward, then perform locally */
+    vfio_region_write(region, addr + vdev->msix->table_offset, data, size);
+    memory_region_dispatch_write(&vdev->pdev.msix_table_mmio, addr,
+                                data, size_memop(size) | MO_LE,
+                                MEMTXATTRS_UNSPECIFIED);
+}
+
+static const MemoryRegionOps vfio_user_table_ops = {
+    .read = vfio_user_table_read,
+    .write = vfio_user_table_write,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+};
+
+static uint64_t vfio_user_pba_read(void *opaque, hwaddr addr,
+                                   unsigned size)
+{
+    VFIOPCIDevice *vdev = opaque;
+    VFIORegion *region = &vdev->bars[vdev->msix->pba_bar].region;
+    uint64_t data;
+
+    /* server copy is what matters */
+    data = vfio_region_read(region, addr + vdev->msix->pba_offset, size);
+    return data;
+}
+
+static void vfio_user_pba_write(void *opaque, hwaddr addr,
+                                  uint64_t data, unsigned size)
+{
+    /* dropped */
+}
+
+static const MemoryRegionOps vfio_user_pba_ops = {
+    .read = vfio_user_pba_read,
+    .write = vfio_user_pba_write,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+};
+
+static void vfio_user_msix_setup(VFIOPCIDevice *vdev)
+{
+    MemoryRegion *vfio_reg, *msix_reg, *new_reg;
+
+    vdev->msix->msix_regions = g_new0(MemoryRegion, 2);
+
+    vfio_reg = vdev->bars[vdev->msix->table_bar].mr;
+    msix_reg = &vdev->pdev.msix_table_mmio;
+    new_reg = &vdev->msix->msix_regions[0];
+    memory_region_init_io(new_reg, OBJECT(vdev), &vfio_user_table_ops, vdev,
+                          "VFIO MSIX table", int128_get64(msix_reg->size));
+    memory_region_add_subregion_overlap(vfio_reg, vdev->msix->table_offset,
+                                        new_reg, 1);
+
+    vfio_reg = vdev->bars[vdev->msix->pba_bar].mr;
+    msix_reg = &vdev->pdev.msix_pba_mmio;
+    new_reg = &vdev->msix->msix_regions[1];
+    memory_region_init_io(new_reg, OBJECT(vdev), &vfio_user_pba_ops, vdev,
+                          "VFIO MSIX PBA", int128_get64(msix_reg->size));
+    memory_region_add_subregion_overlap(vfio_reg, vdev->msix->pba_offset,
+                                        new_reg, 1);
+}
+
+static void vfio_user_msix_teardown(VFIOPCIDevice *vdev)
+{
+    MemoryRegion *mr, *sub;
+
+    mr = vdev->bars[vdev->msix->table_bar].mr;
+    sub = &vdev->msix->msix_regions[0];
+    memory_region_del_subregion(mr, sub);
+
+    mr = vdev->bars[vdev->msix->pba_bar].mr;
+    sub = &vdev->msix->msix_regions[1];
+    memory_region_del_subregion(mr, sub);
+
+    g_free(vdev->msix->msix_regions);
+    vdev->msix->msix_regions = NULL;
+}
+
+/*
+ * Incoming request message callback.
+ *
+ * Runs off main loop, so BQL held.
+ */
 static void vfio_user_pci_process_req(void *opaque, VFIOUserMsg *msg)
 {
 
@@ -3548,6 +3653,9 @@ static void vfio_user_pci_realize(PCIDevice *pdev, Error **errp)
     if (ret) {
         goto out_teardown;
     }
+    if (vdev->msix != NULL) {
+        vfio_user_msix_setup(vdev);
+    }
 
     ret = vfio_interrupt_setup(vdev, errp);
     if (ret) {
@@ -3569,6 +3677,10 @@ static void vfio_user_instance_finalize(Object *obj)
     VFIOPCIDevice *vdev = VFIO_PCI_BASE(obj);
     VFIODevice *vbasedev = &vdev->vbasedev;
 
+    if (vdev->msix != NULL) {
+        vfio_user_msix_teardown(vdev);
+    }
+
     vfio_put_device(vdev);
 
     if (vbasedev->proxy != NULL) {
-- 
1.8.3.1


