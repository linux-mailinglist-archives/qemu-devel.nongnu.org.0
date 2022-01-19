Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A8C54942D0
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 23:09:59 +0100 (CET)
Received: from localhost ([::1]:42520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAJ9S-0003ca-AG
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 17:09:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nAIjj-0008SO-Cp
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 16:43:23 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:49298)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nAIjh-0007PG-1Y
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 16:43:23 -0500
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20JJmflC001398; 
 Wed, 19 Jan 2022 21:43:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=Y/Rin45j80wvjkSEF5Xr1s6e4/OTeGmkoaGQvIolwVw=;
 b=rL7ssfA3QaxZ5xHquCjE5y0Wbdp9tAC6lLoefEJa6oNJSU+D9jpQxnUJM6hndxvJqpZS
 fxQBvsOiAB3czEd2bUkIeqcZRTpzXn9SG8jB8VpP4wBKN3mZ5OCbBBgWy3v7Xm+ax31b
 q1ONGdLPIBFlPe0NdUbKR8bHHpuoj8Rd/m7s+lOHKlsGwoIsxGyfQjMHs6vw9HAb/+qY
 IiKB1KWUY0QlMpseWFuoiFwYMwoO1yS4sug2oB/AiExWEK2Kf/JJrGYYfQek0DBXPGGM
 fvk20kip/QE6faHkZrnfWdMvOlnicYDYfEPj6gKh2D4aLzqLNEVBKK7tugmt1K4/v+mR yw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dnc5f6bbm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Jan 2022 21:43:16 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20JLadnn059789;
 Wed, 19 Jan 2022 21:43:15 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam08lp2041.outbound.protection.outlook.com [104.47.73.41])
 by userp3030.oracle.com with ESMTP id 3dkkd144nt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Jan 2022 21:43:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l+zqNOyW6UOk9Jrlu+GnQHeB/UGWrmk5zMaoVmS0Wuy/rS5KaYA/73Bdj6LJ8+Lpzk8wJbKxp169YwSrDSHOGXK7Y4FJlEEvXb0NW2OCbNwqnebWfgTE8msSPOy6SIPkoRorsa58XXwVi0vtsLK100TqWKBnRhQF1037NNeOC9he/vfyZzMozh5xN8ojC2RdTf0GB/fmjZBRcY/7Oftrw0BKHlFEPZYp+Q3ocraqBY3ck3om5DwaLUHWTRRFvO6C0AZ15V4LqCe1mv13TvVAWJBFu8p4gtBM9kmSmIH0m/VyGM7a3yb08W+B2iIXw27LkJHYT6Zsg2uegRY5ZHwMsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y/Rin45j80wvjkSEF5Xr1s6e4/OTeGmkoaGQvIolwVw=;
 b=Oy7Ksi1nlsVg15GnJOMTpRerTJ2+haUm6TkoJxT6HT7wiK+6EDl4lhX+AoRI+9Xa0BvH+qzsuVYjlYGgmMMasZTI2Z8Yzc+jFB0ZNPHKJV0q6eKVfb25EbKXncnugQarawmZC62zUCnmmDbmtofiNeyRIMRAdWmK+TXiLRMnyE0T7OphO9l/pX/oSyOCdlmZnpVkTWT+HxJs0dVHJvWRTabANJ0dCoQpqjnGZpu973D/XBvrQ1vWGe3uC1V7ILvhCr4U+YgXUQ8Yg/phi9T87nSmTn+bVwGhh+WZQFmbDt5PVp+cdXIksCQ6PADIBSEeTUJ5RZFqbQUMyq7qljTk5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y/Rin45j80wvjkSEF5Xr1s6e4/OTeGmkoaGQvIolwVw=;
 b=u2LTFjtisuFnwoIV+b2gxrmcA5ejzx4MPZZFerNpzce7OcjkWf0ZLcwbA6afVVAZqjFYfGmnFgAhM5iJ7jZenKXLyk6QEKKNwUKNLBExrV0+UXizOumJZKP7IPW5vUR7zt4dmKIVi8X589AKoU4OZYJON93WPIj4nNxldtXfsUY=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by DM5PR10MB1497.namprd10.prod.outlook.com (2603:10b6:3:13::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.12; Wed, 19 Jan
 2022 21:43:13 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::98b1:4348:5117:5fc]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::98b1:4348:5117:5fc%7]) with mapi id 15.20.4888.014; Wed, 19 Jan 2022
 21:43:13 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 16/18] vfio-user: handle device interrupts
Date: Wed, 19 Jan 2022 16:42:05 -0500
Message-Id: <bc2c2c117aa72cc5d619ecfe549a252303ae539d.1642626515.git.jag.raman@oracle.com>
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
X-MS-Office365-Filtering-Correlation-Id: 3928ccc0-5284-425c-831d-08d9db94b168
X-MS-TrafficTypeDiagnostic: DM5PR10MB1497:EE_
X-Microsoft-Antispam-PRVS: <DM5PR10MB1497B15F1371FC3B6D51CD1790599@DM5PR10MB1497.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:279;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4YfsquL5JQJR62v1qppxKaie9L4zZs9FzkIVqJAa192gg5LTc7Gqu+hRfIMvBbvMfykxgpiXfREgTGZ67ydTONxBha96LlIs+XI/1JFLgLiTuOCxuAxCmE7AHHFxTV5aUqMuJBQowgWxiIA5YAtaSJNyE4K/fuUGot6FHf5PHt+oXuDIiemhF62V/Bozl/O86htavswBWACO/0ERpgBG0N4ILGJkyANppZDXn/C5rmkEEbyjZeX/S56xvo7vUaIyTVz4aQjdcC6VZS9ERcxtpC/XoZACxE0gtOB9WsZSvhrOaVar7qPXfAAPYhU1xsWmwGdty33B6IYWuGiUfGjNxkCIn7JlcNWWQzTa/7HpXsBl9g+sTdHmpq73RjIBKs2TxF2nDKH0nntaJEsUFlGdkujRDH7yypMkg88uqvyMGMeOdcCGyObQ26zcQvHxa0yFZW751hdyZukRdguwiOYbwxJah289v/lQTigItMPtICCWiuOibW0qW+UTcqyPz5aEFHdYdzCchzaWORy9WPxtxVsjW1l8uYquYfhFmK3srsWBuxQ6aBnlOANwXeTkkPA/E4tXUpI8GX4Cs6644Mrvm2GZ5ZHNl20zipGqaqBb7WpWMztTOG/0grY0TsGTCJuErprKtWviBkLhtujG3t6gzrugBkIB9t8MM4BanZYZhFxOlGC1WP7ieOuUPX0Du+ivVBxyRT23uEB2imcslbaRKw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6506007)(26005)(5660300002)(2906002)(6916009)(8676002)(86362001)(4326008)(36756003)(508600001)(2616005)(6512007)(83380400001)(186003)(8936002)(107886003)(316002)(66556008)(66946007)(66476007)(38100700002)(7416002)(6486002)(52116002)(38350700002)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sZIKy0BYJg6ccQ2FecgW5VBFon5GbZ9Ira3LHz70lgyXAh8OhhGemHpDTKTv?=
 =?us-ascii?Q?jiUG238ewU7ekzHvLwUQZ+6evCuoahqluczlGJ6rrQsgcHLCCR4EG5+aUR+O?=
 =?us-ascii?Q?xw4QHB7QDWq9gZO447sMBzzaRj3gxacvQrNIcvWMBIYKL8u7vDkcqn8odcXG?=
 =?us-ascii?Q?Iq35evmnQqh5OZj2HdLd+vE4IO3loBGjkBQZwVfJ7OFSN3FJG4VeNi8BxLaB?=
 =?us-ascii?Q?i8Xwgxljy06z7uTn5LDx25Gl14dp9fEwIVTopIRV3eV8js9e7hAk9j4Flj1N?=
 =?us-ascii?Q?wX/2rPjs99VbFaJrb6m9uFVn6fdFmY8J5dN2XTgxCITHGncz/cJuAnc5c1/D?=
 =?us-ascii?Q?XQ/JtZrmpFck+EuwmhrV+j6bAblMyEyCgv1ZKzvQZNvGG72kKMKE56ctkVTO?=
 =?us-ascii?Q?z8l4tsYbSi6kjaNZiu607dZUKyjUR/lAHRu1/zpmC0/eyHx2fV8PvkGVpr1l?=
 =?us-ascii?Q?Tdhc0PY1zcVylTSABWb5JZmRnKM6iYdBsO2WjVz8kGIoOLqlOU50cLy1a1St?=
 =?us-ascii?Q?cWOiS6Sn77GAlk+kOiuEG4rrgY7FzqrViFuVhu7JA46t7pX0uyC5V5oCK+xM?=
 =?us-ascii?Q?fhyBv8ieep/uQ+vID8NzzJtqgbNPTXpFyr+0WlXP0kmpTzjNjcM0ui+5uR1r?=
 =?us-ascii?Q?dl7TjoC5kMfPK/TkQSBFD246lSJjca9vvMy3OumiUKMBN+k3UraWA4g/mLTS?=
 =?us-ascii?Q?93Up4XXzB3r41L8OExT5Auusj4X1U5cqNOK0ERIkXLlrDGdcQ4LlZTXehsXQ?=
 =?us-ascii?Q?l8W9h/5D2O0mOSR4kM17sxtafrgfmHexFMGvurqiQUjWhryuX0AhoY2WgYAn?=
 =?us-ascii?Q?kQkbRWHJGXc7fqe2kgbunXZHnpfwdjdGJ1EpnCQ13Q5VnvXa6OnPR4aAxcBT?=
 =?us-ascii?Q?eG7HIditTO3svXdwXXGYQ0ADGjUAGw5SEsOLMMR9ooOiV+XevV2pmkMERBrE?=
 =?us-ascii?Q?s1aOHMV6+jFi9GqZy8Zj7Us9y8cfObImXiz9jzyjXKzzWdqQ+ZmIgUaRwlHc?=
 =?us-ascii?Q?NLS4AwXfytJ3ON8uiTptu9JNHT/90NWopL9wVRAo9FpPBpf8mYoDIptaPGCe?=
 =?us-ascii?Q?xlSG5Rp7ihnAEWFhyNOgHJsHzb+k0gBs71t+Al88/vVtIOH5x8pEGqdgk0UK?=
 =?us-ascii?Q?qOGnPqGta93vsc0KDrAZD0sFzlvo84p+5pzo8Wf/DMm1wTj0h8LVB0Tko4Er?=
 =?us-ascii?Q?h6PtK/3rlrk99bxUtc5cnrLwx4eRAkwlFPgYXj6FXGgVJaJ9MytdAcho4oh3?=
 =?us-ascii?Q?WdeLPhsDS2ynX9hcr0QWCqz6Y+sdbvmnBDVixnh9Nv0jAKvXqDddbm4dJQel?=
 =?us-ascii?Q?KKe5Pssr/jfVnLItgmHp8M1AoB6apT0K5bVFcwJcjpjJK/0N8DV0rhsBZUjL?=
 =?us-ascii?Q?UolG+jTs3lFM7GIlVosaZfF07HEoMwf5033niLKojT0CKIGS6Fjw0RLbMex2?=
 =?us-ascii?Q?K+mPc28EOgL53csedMTsIgIobJiFzpGp1WwwTK9nK2wR4WBav/rbrVive4be?=
 =?us-ascii?Q?Y3sSRn1n2hgvnfB7HCp60nvhFN3hZcUiUM4ic8/DLT4ZTxx2f7CGqLIu0r24?=
 =?us-ascii?Q?OZ2/SIytSUqsezXLv9o/GvdDfRRk6/a+BOX+hdSDte7uQsKd1WLvwgZYjrL8?=
 =?us-ascii?Q?ml42wCt/M11O3541c8WBr2k=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3928ccc0-5284-425c-831d-08d9db94b168
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2022 21:43:12.9101 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UNfqVY2s9q/i/0oxzJttae8A2kifun49AbaRAgEXku0fxas8cOJXXktnOd3mMfRTB2PKDOHgH4QanKZohTObLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR10MB1497
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10232
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 bulkscore=0
 malwarescore=0 adultscore=0 phishscore=0 mlxscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201190117
X-Proofpoint-GUID: VzQJ2Jy-rpY5I95dwP5A2ZOxiPoRLy0e
X-Proofpoint-ORIG-GUID: VzQJ2Jy-rpY5I95dwP5A2ZOxiPoRLy0e
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
Cc: eduardo@habkost.net, elena.ufimtseva@oracle.com, john.g.johnson@oracle.com,
 berrange@redhat.com, bleal@redhat.com, john.levon@nutanix.com, mst@redhat.com,
 armbru@redhat.com, quintela@redhat.com, f4bug@amsat.org,
 marcandre.lureau@gmail.com, stefanha@redhat.com, thanos.makatos@nutanix.com,
 pbonzini@redhat.com, jag.raman@oracle.com, eblake@redhat.com,
 dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Forward remote device's interrupts to the guest

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 include/hw/pci/pci.h      |  6 +++
 hw/pci/msi.c              | 13 +++++-
 hw/pci/msix.c             | 12 +++++-
 hw/remote/vfio-user-obj.c | 89 +++++++++++++++++++++++++++++++++++++++
 hw/remote/trace-events    |  1 +
 5 files changed, 119 insertions(+), 2 deletions(-)

diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index 8c18f10d9d..092334d2af 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -128,6 +128,8 @@ typedef uint32_t PCIConfigReadFunc(PCIDevice *pci_dev,
 typedef void PCIMapIORegionFunc(PCIDevice *pci_dev, int region_num,
                                 pcibus_t addr, pcibus_t size, int type);
 typedef void PCIUnregisterFunc(PCIDevice *pci_dev);
+typedef void PCIMSINotify(PCIDevice *pci_dev, unsigned vector);
+typedef void PCIMSIxNotify(PCIDevice *pci_dev, unsigned vector);
 
 typedef struct PCIIORegion {
     pcibus_t addr; /* current PCI mapping address. -1 means not mapped */
@@ -322,6 +324,10 @@ struct PCIDevice {
     /* Space to store MSIX table & pending bit array */
     uint8_t *msix_table;
     uint8_t *msix_pba;
+
+    PCIMSINotify *msi_notify;
+    PCIMSIxNotify *msix_notify;
+
     /* MemoryRegion container for msix exclusive BAR setup */
     MemoryRegion msix_exclusive_bar;
     /* Memory Regions for MSIX table and pending bit entries. */
diff --git a/hw/pci/msi.c b/hw/pci/msi.c
index 47d2b0f33c..93f5e400cc 100644
--- a/hw/pci/msi.c
+++ b/hw/pci/msi.c
@@ -51,6 +51,8 @@
  */
 bool msi_nonbroken;
 
+static void pci_msi_notify(PCIDevice *dev, unsigned int vector);
+
 /* If we get rid of cap allocator, we won't need this. */
 static inline uint8_t msi_cap_sizeof(uint16_t flags)
 {
@@ -225,6 +227,8 @@ int msi_init(struct PCIDevice *dev, uint8_t offset,
     dev->msi_cap = config_offset;
     dev->cap_present |= QEMU_PCI_CAP_MSI;
 
+    dev->msi_notify = pci_msi_notify;
+
     pci_set_word(dev->config + msi_flags_off(dev), flags);
     pci_set_word(dev->wmask + msi_flags_off(dev),
                  PCI_MSI_FLAGS_QSIZE | PCI_MSI_FLAGS_ENABLE);
@@ -307,7 +311,7 @@ bool msi_is_masked(const PCIDevice *dev, unsigned int vector)
     return mask & (1U << vector);
 }
 
-void msi_notify(PCIDevice *dev, unsigned int vector)
+static void pci_msi_notify(PCIDevice *dev, unsigned int vector)
 {
     uint16_t flags = pci_get_word(dev->config + msi_flags_off(dev));
     bool msi64bit = flags & PCI_MSI_FLAGS_64BIT;
@@ -332,6 +336,13 @@ void msi_notify(PCIDevice *dev, unsigned int vector)
     msi_send_message(dev, msg);
 }
 
+void msi_notify(PCIDevice *dev, unsigned int vector)
+{
+    if (dev->msi_notify) {
+        dev->msi_notify(dev, vector);
+    }
+}
+
 void msi_send_message(PCIDevice *dev, MSIMessage msg)
 {
     MemTxAttrs attrs = {};
diff --git a/hw/pci/msix.c b/hw/pci/msix.c
index ae9331cd0b..1c71e67f53 100644
--- a/hw/pci/msix.c
+++ b/hw/pci/msix.c
@@ -31,6 +31,8 @@
 #define MSIX_ENABLE_MASK (PCI_MSIX_FLAGS_ENABLE >> 8)
 #define MSIX_MASKALL_MASK (PCI_MSIX_FLAGS_MASKALL >> 8)
 
+static void pci_msix_notify(PCIDevice *dev, unsigned vector);
+
 MSIMessage msix_get_message(PCIDevice *dev, unsigned vector)
 {
     uint8_t *table_entry = dev->msix_table + vector * PCI_MSIX_ENTRY_SIZE;
@@ -334,6 +336,7 @@ int msix_init(struct PCIDevice *dev, unsigned short nentries,
     dev->msix_table = g_malloc0(table_size);
     dev->msix_pba = g_malloc0(pba_size);
     dev->msix_entry_used = g_malloc0(nentries * sizeof *dev->msix_entry_used);
+    dev->msix_notify = pci_msix_notify;
 
     msix_mask_all(dev, nentries);
 
@@ -485,7 +488,7 @@ int msix_enabled(PCIDevice *dev)
 }
 
 /* Send an MSI-X message */
-void msix_notify(PCIDevice *dev, unsigned vector)
+static void pci_msix_notify(PCIDevice *dev, unsigned vector)
 {
     MSIMessage msg;
 
@@ -503,6 +506,13 @@ void msix_notify(PCIDevice *dev, unsigned vector)
     msi_send_message(dev, msg);
 }
 
+void msix_notify(PCIDevice *dev, unsigned vector)
+{
+    if (dev->msix_notify) {
+        dev->msix_notify(dev, vector);
+    }
+}
+
 void msix_reset(PCIDevice *dev)
 {
     if (!msix_present(dev)) {
diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
index bf88eac8f1..1771dba1bf 100644
--- a/hw/remote/vfio-user-obj.c
+++ b/hw/remote/vfio-user-obj.c
@@ -53,6 +53,8 @@
 #include "hw/qdev-core.h"
 #include "hw/pci/pci.h"
 #include "qemu/timer.h"
+#include "hw/pci/msi.h"
+#include "hw/pci/msix.h"
 
 #define TYPE_VFU_OBJECT "x-vfio-user-server"
 OBJECT_DECLARE_TYPE(VfuObject, VfuObjectClass, VFU_OBJECT)
@@ -106,6 +108,8 @@ struct VfuObject {
     int vfu_poll_fd;
 };
 
+static GHashTable *vfu_object_dev_to_ctx_table;
+
 static void vfu_object_init_ctx(VfuObject *o, Error **errp);
 
 static void vfu_object_set_socket(Object *obj, Visitor *v, const char *name,
@@ -381,6 +385,72 @@ static void vfu_object_register_bars(vfu_ctx_t *vfu_ctx, PCIDevice *pdev)
     }
 }
 
+static int vfu_object_map_irq(PCIDevice *pci_dev, int intx)
+{
+    /*
+     * We only register one INTx interrupt with the server. map_irq
+     * callback is required for PCIBus.
+     */
+    return 0;
+}
+
+static void vfu_object_set_irq(void *opaque, int pirq, int level)
+{
+    vfu_ctx_t *vfu_ctx = opaque;
+
+    if (vfu_ctx && level) {
+        vfu_irq_trigger(vfu_ctx, 0);
+    }
+}
+
+static void vfu_object_msi_notify(PCIDevice *pci_dev, unsigned vector)
+{
+    vfu_ctx_t *vfu_ctx = NULL;
+
+    if (!vfu_object_dev_to_ctx_table) {
+        return;
+    }
+
+    vfu_ctx = g_hash_table_lookup(vfu_object_dev_to_ctx_table, pci_dev);
+
+    if (vfu_ctx) {
+        vfu_irq_trigger(vfu_ctx, vector);
+    }
+}
+
+static int vfu_object_setup_irqs(VfuObject *o, PCIDevice *pci_dev)
+{
+    vfu_ctx_t *vfu_ctx = o->vfu_ctx;
+    int ret;
+
+    ret = vfu_setup_device_nr_irqs(vfu_ctx, VFU_DEV_INTX_IRQ, 1);
+    if (ret < 0) {
+        return ret;
+    }
+
+    pci_bus_irqs(pci_get_bus(o->pci_dev), vfu_object_set_irq,
+                 vfu_object_map_irq, o->vfu_ctx, 1);
+
+    ret = 0;
+    if (msix_nr_vectors_allocated(pci_dev)) {
+        ret = vfu_setup_device_nr_irqs(vfu_ctx, VFU_DEV_MSIX_IRQ,
+                                       msix_nr_vectors_allocated(pci_dev));
+
+        pci_dev->msix_notify = vfu_object_msi_notify;
+    } else if (msi_nr_vectors_allocated(pci_dev)) {
+        ret = vfu_setup_device_nr_irqs(vfu_ctx, VFU_DEV_MSI_IRQ,
+                                       msi_nr_vectors_allocated(pci_dev));
+
+        pci_dev->msi_notify = vfu_object_msi_notify;
+    }
+
+    if (ret < 0) {
+        return ret;
+    }
+
+    return 0;
+}
+
 /*
  * TYPE_VFU_OBJECT depends on the availability of the 'socket' and 'device'
  * properties. It also depends on devices instantiated in QEMU. These
@@ -478,6 +548,13 @@ static void vfu_object_init_ctx(VfuObject *o, Error **errp)
 
     vfu_object_register_bars(o->vfu_ctx, o->pci_dev);
 
+    ret = vfu_object_setup_irqs(o, o->pci_dev);
+    if (ret < 0) {
+        error_setg(errp, "vfu: Failed to setup interrupts for %s",
+                   o->device);
+        goto fail;
+    }
+
     ret = vfu_realize_ctx(o->vfu_ctx);
     if (ret < 0) {
         error_setg(errp, "vfu: Failed to realize device %s- %s",
@@ -491,6 +568,8 @@ static void vfu_object_init_ctx(VfuObject *o, Error **errp)
         goto fail;
     }
 
+    g_hash_table_insert(vfu_object_dev_to_ctx_table, o->pci_dev, o->vfu_ctx);
+
     qemu_set_fd_handler(o->vfu_poll_fd, vfu_object_attach_ctx, NULL, o);
 
     return;
@@ -552,9 +631,15 @@ static void vfu_object_finalize(Object *obj)
         o->unplug_blocker = NULL;
     }
 
+    if (o->pci_dev) {
+        g_hash_table_remove(vfu_object_dev_to_ctx_table, o->pci_dev);
+    }
+
     o->pci_dev = NULL;
 
     if (!k->nr_devs && k->auto_shutdown) {
+        g_hash_table_destroy(vfu_object_dev_to_ctx_table);
+        vfu_object_dev_to_ctx_table = NULL;
         qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
     }
 
@@ -572,6 +657,10 @@ static void vfu_object_class_init(ObjectClass *klass, void *data)
 
     k->auto_shutdown = true;
 
+    msi_nonbroken = true;
+
+    vfu_object_dev_to_ctx_table = g_hash_table_new_full(NULL, NULL, NULL, NULL);
+
     object_class_property_add(klass, "socket", "SocketAddress", NULL,
                               vfu_object_set_socket, NULL, NULL);
     object_class_property_set_description(klass, "socket",
diff --git a/hw/remote/trace-events b/hw/remote/trace-events
index 847d50d88f..c167b3c7a5 100644
--- a/hw/remote/trace-events
+++ b/hw/remote/trace-events
@@ -12,3 +12,4 @@ vfu_dma_unregister(uint64_t gpa) "vfu: unregistering GPA 0x%"PRIx64""
 vfu_bar_register(int i, uint64_t addr, uint64_t size) "vfu: BAR %d: addr 0x%"PRIx64" size 0x%"PRIx64""
 vfu_bar_rw_enter(const char *op, uint64_t addr) "vfu: %s request for BAR address 0x%"PRIx64""
 vfu_bar_rw_exit(const char *op, uint64_t addr) "vfu: Finished %s of BAR address 0x%"PRIx64""
+vfu_interrupt(int pirq) "vfu: sending interrupt to device - PIRQ %d"
-- 
2.20.1


