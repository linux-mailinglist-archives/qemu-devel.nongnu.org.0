Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C8E475C9D
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 17:03:26 +0100 (CET)
Received: from localhost ([::1]:47750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxWkX-0007G1-Ir
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 11:03:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mxWKY-0006EC-6l
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 10:36:34 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:52416)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mxWKV-000051-Tj
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 10:36:33 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BFEULbA028510; 
 Wed, 15 Dec 2021 15:36:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=U0PNMwpRERF29Fs9jnyBzcAsE4L/ciUMCOnwdrDp25s=;
 b=rwkDFLBACtkRv5IYNYp6jDLcWpHfYf+sfCdw9xrcMCfWIpHcQw5MddhfiH0KF+BuaIQ9
 uUgof2qkaEUzI3aNPPiX+RqKsPyyMxDj+6dTU75FzXNRs4HGo2eY6x7NHaxj/iOecq23
 Iga0NdCiSzgyhrzaOBYQtyb14soRAX/LKl6432Q6ft1hIPzy9uskfxNGAWIGEFgXLhKP
 onGvurHuafxp2x/QRqziE3CCUD08iNEK371JyanV1i1NmH8ger6Bpxyi9Flnlwlwg42U
 n2rr+LvsVDc4TG2ICQA0ywrj3WnzjBjTr3A/jq/bQJp1FbHkZKzx76jYwF3Dnmz/kGPi xw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3cx3ukf6t5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Dec 2021 15:36:30 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1BFFViKh127804;
 Wed, 15 Dec 2021 15:36:29 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2175.outbound.protection.outlook.com [104.47.55.175])
 by userp3020.oracle.com with ESMTP id 3cvnes2d9k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Dec 2021 15:36:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MISUFb9rBTvSdZznrg0g9i0eZeTs9vruKa3IwwGK5gGGcHO2GQznBG9flG8Ly3U+096Sgcy2UTAmcPlxHW1OmtiXzWGQRoE9oMog7OWVBb21WkndUdFFiTgQkl69cFbJaFGer8rT2lmBnB10hW9jOm74c3xUG8RHw6jvVhIX7naLJwXl1y9wkdfyLkBNkw+eHK69a01l+/lOQdKKMYtUQDChcYgpRda1ClLxiuMDaIy9yoz1nSDbOn8jkDb/1wc6/6iaJILgl2pXQiZzEPB1w+lW2Fn124vO2ll+2uvMtO/xr0p4Q9riIBLLjNwmlQwaxe3ZkoKZU5WThPeFzzf4qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U0PNMwpRERF29Fs9jnyBzcAsE4L/ciUMCOnwdrDp25s=;
 b=QTtsESY+uxZRiIogoWWE5PRMfYuvG06oshbrHp7M9DnmhdCVmvOUQacXy3NKmbFEW+UKJsRRw4uWj/1DIccdLSKr83FKqAR7kSGtHLeVU3nxOlFuZX0CpNmylyxPztP60qdyZ3NtbCtCSMfmJTmJ8KEOXvfNA2F724gKwwX3y5E1ooQya7E/pqPq8QRCYsh2y9Voyd9wLJtixq2OY9b6UyqP+jN6X/UKA9hwZpeNE4KTd1M2PTftsnloW8VHS5J6ZcrTH4nFRbmtWCp1Zzt2KMaaeS5/CXpL/cJLomsGTyTdEN1TvfQS0CA2ZXdPaZGvnheMRroDKY7nD6LbRRAwEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U0PNMwpRERF29Fs9jnyBzcAsE4L/ciUMCOnwdrDp25s=;
 b=IZtYgSCIJ++rRTzuRvGlXq4Oq8hZbAyg53zzNTkU6YX9Zdw8SRuuVq75Uysjhrkf6KLt9toJ9ot7vzLxelJaDkOsLZS5p4A8ocpA7XDXBr1VmZlMA7rXj0ex6qE4pECXr24FowcodhwJUaaEaZmoOddJ6/1NSzLFIatluJZc2+w=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by BLAPR10MB5282.namprd10.prod.outlook.com (2603:10b6:208:30e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Wed, 15 Dec
 2021 15:36:26 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::b911:b919:6383:970d]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::b911:b919:6383:970d%5]) with mapi id 15.20.4778.018; Wed, 15 Dec 2021
 15:36:26 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 12/14] vfio-user: handle device interrupts
Date: Wed, 15 Dec 2021 10:35:36 -0500
Message-Id: <219410a610c55ac7f8db806aa8a4bc2e124e9d5c.1639549843.git.jag.raman@oracle.com>
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
X-MS-Office365-Filtering-Correlation-Id: 246c52bb-ae24-4882-e0e6-08d9bfe0a7dc
X-MS-TrafficTypeDiagnostic: BLAPR10MB5282:EE_
X-Microsoft-Antispam-PRVS: <BLAPR10MB5282C1B876DCEA2915A9B66190769@BLAPR10MB5282.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:279;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cWGfsTgaZGv7B4HZz7hJRDt6YLD4XY/mPSeqzZLsFLJqOUcC+7lbeXaKg7xjOR3JwJxEdQykDpuWpyAcXH19CMqaWEIK81700BiBEOf24l60BWCBhu9L5qLUSMCRaeL+dutHk6zbtqGDFSqXP6tqyLJ7u/DURFKnbHXVjuNX03icVwMdn+LE1zeESc/8Ji41nPJqcdqipAOXu6hsg4S8GpwtupVEYXAEDcy+MyzWZ6byPieAiB9whb5zrse7C1j2kXMA+WwomS4Z9Cl3V5QSYTMa+8MDw7ocgenvjZWwYhLN1amjqrCrKnMv7bUBaGAW8X75x4k5HCHGgzkslPirddksivD4VvM8DpUGTVAXHYvZFZpqq3sGrBVswowjzeLkL7KBg/3NNvClk7FcpZKv1UC2l5srUCyQQLiwZw1dLnmNLQcRSwPhaCVjcdnKpy06zwTaJ1C/dL/rYVhy2MC9DJbchYJ4zeaHdaoux09O66eWmDOjwERvZ+yI9wSFwSdlQj1PrkrX/SUKFtRwqs8IgYobJrQUUIq49Y5PJzgsjGZ5OLYQb53yFtk7iCtr0yy1GRkbCuBtPv9LJC4t1V9X+HnO09UtpW5Hlm0Ko/ugBsXPS7Bdf0ioswK5fHyNTQN46qilRm64ptcTvRbxSHrVOeaGwVLkQUgiB0AwfkMlqG1FtGYZM/vsNaeurmxy32vC5m8cV0nKWQ7f6XU/9iDvJQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(2906002)(86362001)(36756003)(316002)(52116002)(6512007)(508600001)(2616005)(6506007)(4326008)(6666004)(6916009)(6486002)(7416002)(107886003)(83380400001)(8676002)(26005)(8936002)(38100700002)(38350700002)(66946007)(5660300002)(66556008)(66476007)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JzVkpahkhFdj1hncoGjXvUz/k3jqH0Xy3New2v/4I5JJ/sHuMNqkIPCrs5eF?=
 =?us-ascii?Q?fxS3u3xWPSNgDz59gmdFPY8JmlqQ3rSeYpXEOUu9EPoZWBj85zRUVwVuIosS?=
 =?us-ascii?Q?6VDvybwKmhpxNe1zHQBEDBe6fWImE4orRUddVh0WEJ2u1ZUYO6p0FjZTzwPU?=
 =?us-ascii?Q?JAYFYaBQp30hD1mT6OeWIW6qD/hF85IXctUaiQ9jyWwNnNFXndgf0dWaUvbp?=
 =?us-ascii?Q?bEdqS3hWYfKFCD/rfdw8liu9yl/mCZBQzEwf1Rm0nZ6qcwSIQek1kXDpRN2h?=
 =?us-ascii?Q?fZ29p2RS/QjKxqXQZR0ExuvYXotQLDNVh4oHKd3Qw6IDIuW1uUBf4e8Dg9Ek?=
 =?us-ascii?Q?rIVyQeTMbeJ+Qv8c94d/S9B8zawWaK8j6BYBnPE73MfDoXa8pByBnPtScGah?=
 =?us-ascii?Q?vKaen9KhSkvRPXIryMwexbNFUwFACmu6kz6UeLEZzXq8z5KjDDR/VtcWRr3q?=
 =?us-ascii?Q?584Ur6LEnIxSy/hw0nCQR4XvQ3ZUxq0BsvGBjOuVU0IyvnLviN8m4r+GrHdA?=
 =?us-ascii?Q?3h2mw2plGo1RfaKvFmbRBmLy/aNEAz0TcKr9ZzdV9aTIy3+M8SBjwxDr2oQF?=
 =?us-ascii?Q?UpecRrAQNtwawrbyiw5yFL5uTUmkfi0+1UVYwmznleI3eOqDb/XDyqzEdUgk?=
 =?us-ascii?Q?gOcSUh3rxpjUezsBVIdkza2gHjdtwwXEVHUsOH0oGSdM54MCgcCzx6/liBA7?=
 =?us-ascii?Q?+VnyNJr8iyylT/fVfc1QPZARWZCOx2aNoFRy+icFDq1OJbSFu4LpKM1AortP?=
 =?us-ascii?Q?bt4XElwGFB1yH7tZx7evquw4w5WWNOQkR2my7lmzsW9cNqU45yxCXTe/RnVE?=
 =?us-ascii?Q?BAWac0dxr1UliQuQcRV9hbplZbVt2aUVAlBdOZv5pnmn9zVgKYqs+XabCxOo?=
 =?us-ascii?Q?aDaXsiVRDFCRM2EGZVlFXpXYaEIXKQgdBW9Wr5b5R0eBNAhxCwg4OHO5Y/Vz?=
 =?us-ascii?Q?QaBcSpKP2JV0HDWpt3gps955OOiwMItIs32VBa6atA3R7ulqloG7KArHL2J7?=
 =?us-ascii?Q?iIIffvXZEMFOT9zWEPFgra6wf10xlpn3hRmqktCizZGFNGLa3TmTaAPV2P62?=
 =?us-ascii?Q?gBG3EHH6VG3kmDRAnD2rJb3rV+g/XHHynVIMGZWnkUjGJx+NhNE4r56VGmo3?=
 =?us-ascii?Q?MkGqlRIhy+fn2D1aHEsiTYDLdWTATFzTRMROPRDt4SgmoF+3bLUq4N0O8Cm2?=
 =?us-ascii?Q?33R1MVgw1ZQD83aDDkku7MKLWYSZElS6sVcslKHC8bO6PYK7wVTt3ziXA7E9?=
 =?us-ascii?Q?D+RUwxWgEnuE7gs164At8atz/K1GgQM6u8oamLixCU6x0bfSvDTQeiKKaNY6?=
 =?us-ascii?Q?UWXc4pJir6PqXaQZCXr/IFy/Z3ECjC2w0bkRVRQDgjmlEgrW0BUj1UZ2hTyI?=
 =?us-ascii?Q?Dnyv8l5UwzJH4tPhXq5ueJB+bxMd9AX8CjRw4WaRLZNnu0FDbrJDqyyAcPNS?=
 =?us-ascii?Q?iufBTx4mqpEJ187mM2Tsl1xX+asCXU+w7hOPTr4/NhfW3T4cfnzWIE911EGF?=
 =?us-ascii?Q?L2JbW6OF/RHk1Zz48G0OMPlx8MDvoJDszWBdVhsd7uFDZGJRt0Dc/rQGnlne?=
 =?us-ascii?Q?WnhknVcT5zIU4f9/wKUhRDuUKxMHD4WsgvEv8bvpKaYamJssJePIkAzt9Hl9?=
 =?us-ascii?Q?99nM+jbDFnTcBsZgkGBTIR8=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 246c52bb-ae24-4882-e0e6-08d9bfe0a7dc
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2021 15:36:26.1829 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aF+hRPiSjgKYoGksbr3IQcUQSoKejbV7UfJdypu9+ricLA+raFuOT9sbwWI9MpRzSlAKH1Sg5q7yeBDUntXe8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5282
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10198
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0
 malwarescore=0 bulkscore=0 spamscore=0 mlxlogscore=999 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112150088
X-Proofpoint-GUID: _Hd1nFp_OIaSYQeYRHGGOf5PMWEVJOIq
X-Proofpoint-ORIG-GUID: _Hd1nFp_OIaSYQeYRHGGOf5PMWEVJOIq
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
Cc: elena.ufimtseva@oracle.com, john.g.johnson@oracle.com, thuth@redhat.com,
 jag.raman@oracle.com, bleal@redhat.com, swapnil.ingle@nutanix.com,
 john.levon@nutanix.com, philmd@redhat.com, wainersm@redhat.com,
 alex.williamson@redhat.com, thanos.makatos@nutanix.com,
 marcandre.lureau@gmail.com, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Forward remote device's interrupts to the guest

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 include/hw/pci/pci.h      |  6 ++++
 include/hw/remote/iohub.h |  1 +
 hw/pci/msi.c              | 13 ++++++-
 hw/pci/msix.c             | 12 ++++++-
 hw/remote/iohub.c         |  7 ++++
 hw/remote/vfio-user-obj.c | 74 +++++++++++++++++++++++++++++++++++++++
 hw/remote/trace-events    |  1 +
 7 files changed, 112 insertions(+), 2 deletions(-)

diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index f2fc2d5375..ffc030d9ca 100644
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
@@ -321,6 +323,10 @@ struct PCIDevice {
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
diff --git a/include/hw/remote/iohub.h b/include/hw/remote/iohub.h
index 0bf98e0d78..70d98b38d0 100644
--- a/include/hw/remote/iohub.h
+++ b/include/hw/remote/iohub.h
@@ -30,6 +30,7 @@ typedef struct RemoteIOHubState {
     unsigned int irq_level[REMOTE_IOHUB_NB_PIRQS];
     ResampleToken token[REMOTE_IOHUB_NB_PIRQS];
     QemuMutex irq_level_lock[REMOTE_IOHUB_NB_PIRQS];
+    void (*intx_notify)(int pirq, unsigned vector);
 } RemoteIOHubState;
 
 int remote_iohub_map_irq(PCIDevice *pci_dev, int intx);
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
diff --git a/hw/remote/iohub.c b/hw/remote/iohub.c
index 547d597f0f..d28d9f3ce2 100644
--- a/hw/remote/iohub.c
+++ b/hw/remote/iohub.c
@@ -17,7 +17,9 @@
 #include "qemu/thread.h"
 #include "hw/remote/machine.h"
 #include "hw/remote/iohub.h"
+#include "hw/pci/msi.h"
 #include "qemu/main-loop.h"
+#include "trace.h"
 
 void remote_iohub_init(RemoteIOHubState *iohub)
 {
@@ -32,6 +34,8 @@ void remote_iohub_init(RemoteIOHubState *iohub)
         event_notifier_init_fd(&iohub->irqfds[pirq], -1);
         event_notifier_init_fd(&iohub->resamplefds[pirq], -1);
     }
+
+    msi_nonbroken = true;
 }
 
 void remote_iohub_finalize(RemoteIOHubState *iohub)
@@ -62,6 +66,9 @@ void remote_iohub_set_irq(void *opaque, int pirq, int level)
     QEMU_LOCK_GUARD(&iohub->irq_level_lock[pirq]);
 
     if (level) {
+        if (iohub->intx_notify) {
+            iohub->intx_notify(pirq, 0);
+        }
         if (++iohub->irq_level[pirq] == 1) {
             event_notifier_set(&iohub->irqfds[pirq]);
         }
diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
index ae375e69b9..2b28d465d5 100644
--- a/hw/remote/vfio-user-obj.c
+++ b/hw/remote/vfio-user-obj.c
@@ -50,6 +50,9 @@
 #include "hw/pci/pci.h"
 #include "qemu/timer.h"
 #include "hw/remote/iommu.h"
+#include "hw/pci/msi.h"
+#include "hw/pci/msix.h"
+#include "hw/remote/iohub.h"
 
 #define TYPE_VFU_OBJECT "x-vfio-user-server"
 OBJECT_DECLARE_TYPE(VfuObject, VfuObjectClass, VFU_OBJECT)
@@ -81,6 +84,8 @@ struct VfuObject {
     int vfu_poll_fd;
 };
 
+static GHashTable *vfu_object_dev_table;
+
 static void vfu_object_init_ctx(VfuObject *o, Error **errp);
 
 static void vfu_object_set_socket(Object *obj, Visitor *v, const char *name,
@@ -347,6 +352,54 @@ static void vfu_object_register_bars(vfu_ctx_t *vfu_ctx, PCIDevice *pdev)
     }
 }
 
+static void vfu_object_intx_notify(int pci_devfn, unsigned vector)
+{
+    vfu_ctx_t *vfu_ctx = g_hash_table_lookup(vfu_object_dev_table,
+                                             (void *)(uint64_t)pci_devfn);
+
+    if (vfu_ctx) {
+        vfu_irq_trigger(vfu_ctx, vector);
+    }
+}
+
+static void vfu_object_msi_notify(PCIDevice *pci_dev, unsigned vector)
+{
+    vfu_object_intx_notify(pci_dev->devfn, vector);
+}
+
+static int vfu_object_setup_irqs(vfu_ctx_t *vfu_ctx, PCIDevice *pci_dev)
+{
+    RemoteMachineState *machine = REMOTE_MACHINE(current_machine);
+    RemoteIOHubState *iohub = &machine->iohub;
+    int ret;
+
+    ret = vfu_setup_device_nr_irqs(vfu_ctx, VFU_DEV_INTX_IRQ, 1);
+    if (ret < 0) {
+        return ret;
+    }
+
+    iohub->intx_notify = vfu_object_intx_notify;
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
@@ -437,6 +490,13 @@ static void vfu_object_init_ctx(VfuObject *o, Error **errp)
 
     vfu_object_register_bars(o->vfu_ctx, o->pci_dev);
 
+    ret = vfu_object_setup_irqs(o->vfu_ctx, o->pci_dev);
+    if (ret < 0) {
+        error_setg(errp, "vfu: Failed to setup interrupts for %s",
+                   o->device);
+        goto fail;
+    }
+
     ret = vfu_realize_ctx(o->vfu_ctx);
     if (ret < 0) {
         error_setg(errp, "vfu: Failed to realize device %s- %s",
@@ -450,6 +510,9 @@ static void vfu_object_init_ctx(VfuObject *o, Error **errp)
         goto fail;
     }
 
+    g_hash_table_insert(vfu_object_dev_table,
+                        (void *)(uint64_t)o->pci_dev->devfn, o->vfu_ctx);
+
     qemu_set_fd_handler(o->vfu_poll_fd, vfu_object_attach_ctx, NULL, o);
 
     return;
@@ -504,9 +567,18 @@ static void vfu_object_finalize(Object *obj)
         remote_iommu_free(o->pci_dev);
     }
 
+    if (o->pci_dev &&
+            g_hash_table_lookup(vfu_object_dev_table,
+                                (void *)(uint64_t)o->pci_dev->devfn)) {
+        g_hash_table_remove(vfu_object_dev_table,
+                            (void *)(uint64_t)o->pci_dev->devfn);
+    }
+
     o->pci_dev = NULL;
 
     if (!k->nr_devs && !k->daemon) {
+        g_hash_table_destroy(vfu_object_dev_table);
+        vfu_object_dev_table = NULL;
         qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
     }
 
@@ -525,6 +597,8 @@ static void vfu_object_class_init(ObjectClass *klass, void *data)
     /* Later determine how to detect a daemon */
     k->daemon = false;
 
+    vfu_object_dev_table = g_hash_table_new_full(NULL, NULL, NULL, NULL);
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


