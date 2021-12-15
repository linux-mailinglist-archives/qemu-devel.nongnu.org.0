Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E45475C1F
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 16:47:13 +0100 (CET)
Received: from localhost ([::1]:33790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxWUq-0003jX-Hi
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 10:47:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mxWKR-0005y9-LJ
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 10:36:27 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:50514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mxWKP-0008W3-NW
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 10:36:27 -0500
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BFEKYEx005935; 
 Wed, 15 Dec 2021 15:36:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=pGe56WaMi8qjh8aTIOmj0bSj7cn6tx35Eirkv2aBxQA=;
 b=nSVLSrqZQWM8OmFqd30MYh3AxJ3E4OPkOTbh4h+dZ20+wN0HZyAipTzA8BTympx0Av8I
 xsQ+k8y59mnj5ajm8gSbDnj2J15TvprYBBBP2Bgentina3KgVwtLUgTjynVcnXOzFa8/
 hsEuldWdhpyt02TN/33THRXDtcvmcaYAEnQPxrIbBSA7qIvUJPMJ7HX3Nen3rYZs1sHx
 LPx8Ym/FPpM3ijXPT05v01KEqF+8MaTqDdTYvE8qfHA0LIKRjGrmxoGMmvHetDwK/C/O
 RYRy2i9tiNFxbtNSA1P/pjqD4D5XRtDigKOoNRfOCYVfM6GFIqJlpOPN8hNNJzvw612m FA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3cx56u6ug5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Dec 2021 15:36:22 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1BFFUWTY094284;
 Wed, 15 Dec 2021 15:36:21 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
 by aserp3020.oracle.com with ESMTP id 3cxmrc0u69-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Dec 2021 15:36:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kCrzTwlRf9PVVYhNpyBgptmQFc55D/16FxaLf5HM0LgQyDgYfqIjd7Ygt45WrXB1olDqLKXBnyQSbGe6t08mg+py+UwddMh1F7DSLpS8XA/gqwlFtb6NuNPkbPzTj8+69DGHDaTG+LSoQiXF63kgzgLeKOrx0mO+TAQ+oRH43/joftjf948I1jzMjjjYl7ny0eoAOE28Xs8SMXGkMiIY09sd3j45iUk6QUS2ct6HTH5V+nXMjhzv+Tlu9epM8mJKbV48ZBF/W2J+UA8P/SfX2yffQK9By3lW/TJD/IpQXBKT0xtU1GSGOqhcp8hN2Q8AH2JssgnhmEVK5xip/f5Yhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pGe56WaMi8qjh8aTIOmj0bSj7cn6tx35Eirkv2aBxQA=;
 b=nDMxptsm9I5npOLnNrScIs0Yei59SLmop3d7C2Huw7ZczUuIUG/mTMiZOmYRuV0IF4RbOR9BKXwurTysJk/nFwfNRuYK8TbUWZn/c2CACwsMIY5yJyEwBuGvjcrasWkRCZElp3bcxSWjgbKVk+MxcURofrCcbb8UJrFzGuJIWFMOjRxPkhF/GwyPLsk6O6U+0aGkEIcEr5pVqjI8cNeJ/ktFjMCTWmBYs/LOHE+JIF+Lr3OLkH6syhWbw5TrwZnF/hkTVdUZMc5kluUymy9I5BPzVrMI6J9ikqRSj+WGdTp1V/V7oPTImAXsocgHJN3ycySYgn78ySVBgGO0yzt4oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pGe56WaMi8qjh8aTIOmj0bSj7cn6tx35Eirkv2aBxQA=;
 b=UPErEZCwRjEfDdTYu03jyCNXYv00t25h9Y4MEzi1Fr5NlTKlJfVJR+eONFJgv1i59SJkUYsuxZJwoY0vWGQm1sCVflxR/SAEgQTEwGnzBsO8q4X7ehzkoTOPaGE4rjWfyxPnWfae4slRX8KWGFaaw/S8u2JJff5G0g/BRg8DGw8=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by BLAPR10MB5282.namprd10.prod.outlook.com (2603:10b6:208:30e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Wed, 15 Dec
 2021 15:36:19 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::b911:b919:6383:970d]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::b911:b919:6383:970d%5]) with mapi id 15.20.4778.018; Wed, 15 Dec 2021
 15:36:19 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 10/14] vfio-user: handle PCI BAR accesses
Date: Wed, 15 Dec 2021 10:35:34 -0500
Message-Id: <da25f11aa2c7f4aeb2eec3d6930e491051794ecf.1639549843.git.jag.raman@oracle.com>
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
X-MS-Office365-Filtering-Correlation-Id: 67270b04-e8a5-4b7b-fc8f-08d9bfe0a3d6
X-MS-TrafficTypeDiagnostic: BLAPR10MB5282:EE_
X-Microsoft-Antispam-PRVS: <BLAPR10MB5282E47C8512025CA5C8A89590769@BLAPR10MB5282.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:390;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 54UdTnH1kfGwWuRwAyj1Gi31DTygviq0EJrFqckxhuGONyrsb+PPKGRvcdQdee6L6BYikAuIwK2pHeFFvag0w+Aa3GwF+s+Q/kdlzfZe1G1H7TAWHe6SUQatqyFvBzPE2s1EK5bpF9/9zWXpCMiu7oTl4pfh+YX6VSLE4724kKVmJoqMj/BdHXy64gk/JJAf1CIXkQI1uX44jwdYTqJYvS10a10YZuqqcRnXFVSpdiW6TucdV5ccze4R1+fmPzwf2Q5SDOm6Uy9D8270quE+VFuRhNsDlLNeUkZQ+pz1li2nl11o4oDu6WeD6YtjTfPnjOA4l521gX71PZosW8MZkqQfags3EmwlBBNdk2E1Y8ahqeozLfrTJ/GbfKMpaCxbKw3y/7KNX3n4+2okGkLYkILJStSkFdsGRn6RphiMAewr1MLvZJ9t2G7owL7pqxiXGgacuQxXKj8T7pKgtkfe1jO9k32ddsznZd3LBtVzw47nkc/5hTjlp3GuE/3pUCUEJJ2oWzRF+MFvwuyG4oiFQOVNqBXlAgTaubKdyyUxBJzpU1tLmLRtHQeMh6a2iH9bm+Zjd342AKYmvCrGC8Pw5M8YVEmzHsPrl4qmLPcVCTtHpJ6/UEAd8hXUseIkVag+wKuG97VF/Ar2UJTk2rYLBDCVgrKLU5YHPz6inhjgi/TSCla+YQtkQVumOdfpcuN3HDH6eJqLlacVub3FhQsf+Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(2906002)(86362001)(36756003)(316002)(52116002)(6512007)(508600001)(2616005)(6506007)(4326008)(6666004)(6916009)(6486002)(7416002)(107886003)(83380400001)(8676002)(26005)(8936002)(38100700002)(38350700002)(66946007)(5660300002)(66556008)(66476007)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NVFU3HDv9Bq62mJUOE5+aAsMKpdgzJarsyiYQ/7hAzOBT0pB5KAQvz3PxEZq?=
 =?us-ascii?Q?gvP25/pax2dEG2FCIGrteAy1GzKfXS2K+yhx0SNzuzCLBMjt7wxcuK6bqw+N?=
 =?us-ascii?Q?BiJNWOo1ErmgGeqObNCVtvX6D1wrGGaXmjATAAAFnJbWWayeoQ0UoRBon7R3?=
 =?us-ascii?Q?jO2fjXdutC8phALdLCP0wzMfPYS52u9gZKtUbaRrakoUpcceEV3eyaPJ4qdo?=
 =?us-ascii?Q?DI9Jf7nauquBMcZ5k/nMfyM9ne1POMdNnnHyYDCovf09aFRiN6MzdbEcMai4?=
 =?us-ascii?Q?Ms1CShRmE6OWBK6sqDcfdy/RfvLVNRJ2m6H8dSZBU3t+ZtsVb15MbpVM+h9c?=
 =?us-ascii?Q?Ed/qEiQwRErvM+klrbfjXMQ3EVz5vsxvfG+jkMXnNzBY63MDk3k28aUJ+pA6?=
 =?us-ascii?Q?o4tA00Z/cnBwzmdmDH4r/kEClpF/vmYwF2iaRY9MAJsJuuouwHsCdaGJ+ARq?=
 =?us-ascii?Q?i0bc1JkyBOCpQQzCDZIL9Lm6oZCT9vNxpfOaLuOgOayuEwwDedx/H5LH1SwX?=
 =?us-ascii?Q?0+L90ZYPS6+PTrWpJvoRME70WW5uNHo0RyIHYNU5sgwAy57nUZj3AGFMCBU0?=
 =?us-ascii?Q?PljuQ+4stWLe8Z/hARmVcneDrGuEjOMZYo0amR4gB9+d5jHjGX2jZPNBNfgQ?=
 =?us-ascii?Q?Vzb/KFdQ6bPzlFPatyTzPvl0h9FikoMTROT/KfCn1telnpfJURLomHeP7ciQ?=
 =?us-ascii?Q?UOhAP9TIVVTCMXmn9fDQ4IaZefHQ5BmYgUdDDaO1I2490ALXyiEqGY4fpRfR?=
 =?us-ascii?Q?I9ACl10KOm7DAOp7oLaWjW7fBiA9GbBOGuc60BRc4V3BojBVYN9UtfcDfTUj?=
 =?us-ascii?Q?kHEX4F806vAumG8tZmCIzm0We3opPiCbJIRosXzuWGrsn9rtQN41hpTfYSve?=
 =?us-ascii?Q?rJHp2GYxHZq3nzuIjpqpoP7EFgSzezZSi9cPitujFto+EEqKAAZEpHpYZQP+?=
 =?us-ascii?Q?4PYzIDGipVQ0qPGAHzxhpwZtU6Q3PlSopi3wP6lHAYH2uMmZER+e8ZCubeCF?=
 =?us-ascii?Q?AbjFm1SjXT+XfgVs30QzLt/qbaUCRpce9VhpGVa8BewF7Pt0+Ot86PTAkwxw?=
 =?us-ascii?Q?SVaJX7u+rMe7z+K+mhrNv3FJ0Oo1N9kkJbNZDRUbkhUuK4yZ4OHMtTm2lCuo?=
 =?us-ascii?Q?Sh5qsPVuk72uTAExbgLcArUpOfUpn6ROjWNoBZZn48M8ICe24H1Ro2ckfRkg?=
 =?us-ascii?Q?LgvBtxKmiEboANChAf3giAlZC9nroZ/Z3UijLoIKxuu92mD/SqgcF/fMbnUv?=
 =?us-ascii?Q?JZEbRu7S9KkKe8JctT5BikFzYBQKAOp+b+LTL1kgxyRc1Z9SolyDAHsUOKow?=
 =?us-ascii?Q?nmhZvgKiUtlXrodr2IQPOTYFXnGPj5Ttyi+q/586yz5qwxOb5r+y/uudy4yd?=
 =?us-ascii?Q?Z7RXQzjvYyL3mzABmlN4hajU3nl0/2as35eebkMaUQuyGrcCzLJYVpoXf4H4?=
 =?us-ascii?Q?dbwtVz37RUI8VX/jYU/Es29dgyRhmg7a/9yccikzfyW9qFiruZ6JIy6x7B7H?=
 =?us-ascii?Q?O1MjIMLu6m+yDk8vXUiQ4As8AT2WEZNTQCzsUPk2uIuEi2k0cmaIWBLCd/rL?=
 =?us-ascii?Q?qVlsQavT+CMF6g5fhoQ/JrGmelA3ULqKgbRomsj48AWq5zuhFw0I0nPftiMO?=
 =?us-ascii?Q?4w16cPhFqjNHH75089Z4a5w=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67270b04-e8a5-4b7b-fc8f-08d9bfe0a3d6
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2021 15:36:19.4178 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iRiqrz8oxmI5ogpaQr8SoB1SykKX/kxmPh5OBC0SeXtejDt8nWEzqALnzih8DE2dUwc4o30MdsRd/k7DGwk3oQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5282
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10198
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 bulkscore=0 spamscore=0
 mlxlogscore=999 suspectscore=0 adultscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112150088
X-Proofpoint-ORIG-GUID: ExPJOvHzy4y4Lm82b6I5r752fBto4Ccq
X-Proofpoint-GUID: ExPJOvHzy4y4Lm82b6I5r752fBto4Ccq
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

Determine the BARs used by the PCI device and register handlers to
manage the access to the same.

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/remote/vfio-user-obj.c | 90 +++++++++++++++++++++++++++++++++++++++
 hw/remote/trace-events    |  3 ++
 2 files changed, 93 insertions(+)

diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
index 46f2251a68..9399e87cbe 100644
--- a/hw/remote/vfio-user-obj.c
+++ b/hw/remote/vfio-user-obj.c
@@ -249,6 +249,94 @@ static void dma_unregister(vfu_ctx_t *vfu_ctx, vfu_dma_info_t *info)
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
+        as = &address_space_io;
+    } else {
+        as = pci_device_iommu_address_space(pci_dev);
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
@@ -337,6 +425,8 @@ static void vfu_object_init_ctx(VfuObject *o, Error **errp)
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


