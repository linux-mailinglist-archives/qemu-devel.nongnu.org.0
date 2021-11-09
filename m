Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D08A2449FFF
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 01:53:06 +0100 (CET)
Received: from localhost ([::1]:38014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkFNp-0005IT-Vd
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 19:53:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1mkFAi-0005ju-5O
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 19:39:32 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:44324)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1mkFAY-00047J-7E
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 19:39:31 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1A905pwf019033
 for <qemu-devel@nongnu.org>; Tue, 9 Nov 2021 00:39:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=Dp8yTb3RzSzTBZUXECLNZdNuCarfOD2WRepONbKnpI4=;
 b=PmGVL+gayj637+DSd+g/hkh8srPQz303qkRQsdgQXRuxEPfEvJdpBym+MUEnx07eP2GS
 w7Zl3tR+/gONTU7TFLhjFl7ziM/UV1aqlNqYmpp6Xv+B8ynpdrJ68J27SnOsezn8EXqw
 bogCAQvk1ulEWX1JxOEPvzJTceSXwzYnF4AIzW4AF0q0eNQvoePQDbnhd9ctHakrcvpz
 6DX8i5Bul1zHqae2LCfp5JqDrox3JdPpH0gmyZZdeE7gfdyukw9N/86t+aHPwfnrGZpz
 P72bmyz7uplQTeOomWY3Wzs5j3WXWFIHmXhDc58B4JhTiCyXNIl/fGvoVIzH2b9po+nl cg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3c6sbk7c8e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Tue, 09 Nov 2021 00:39:20 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1A90ZLN7129193
 for <qemu-devel@nongnu.org>; Tue, 9 Nov 2021 00:39:19 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2104.outbound.protection.outlook.com [104.47.70.104])
 by userp3030.oracle.com with ESMTP id 3c5etuvb6n-10
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Tue, 09 Nov 2021 00:39:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F+8jCVe+Q4EaqzfXzp2UguHiteUJAuuON5h07lb2tDDQL+s++YSq6YoSP6ILkxLFHb9FzzyrLjcwQv0yxLkiSiOPAPYOL1OrvkABK5lLUmncZX7HkTdWDSUg2pA+mUQThW0YojvwFfym3LFS4x+lsL5kFr7Od3d87KWhQPgTHL6Qr0yb23rTddB1OUqZ0hkIFAQg4bMWhq4Sg7bnFWIz6mftl/elbNJ4uq9wcHr2LMc9u3PV7dK187TKV5ijBwdhe+h5uLvbwiToSmVJSygfDHgzA0lw9k8y12VcwAH5oRQsFOov5pEV3gqYRLYmFlvm1qFmr6e3S2pJvNsS33Uw1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dp8yTb3RzSzTBZUXECLNZdNuCarfOD2WRepONbKnpI4=;
 b=fmNPeohkEtPKwCbnO68TjvXKNP7M+rvjxQSIvT5yqItcHmgalMCWfy5+g6YAuuxJbGTZQWeBM/pAEfb+o1n4+V9i1wnZu4+7sMtnxG8wExu9A30H6lb/KuHByvK70WhVwbJ/wjU3Yr2us2TJC8MDvrwTP8PXaZr9r9VgcLGxxgsMVqoesNErZ/QzE5pDt6DhAzNM/k2bT7Aa9mSNHk7E1ao3Tjfl5cyOmlBXM1Ulgw0s0W9fSClPiFtthYNAAmeaLMJN7xetrrQwSdRoVNOAfzN2g687I/GuSpU0Pp+KmBZePAayrsftWjwoMBPa77Cc3Xsg8j3fibYZYy68CA/c+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dp8yTb3RzSzTBZUXECLNZdNuCarfOD2WRepONbKnpI4=;
 b=tiIy+XVPgyUUgP3CP33lmeCdsIf1+X7CVKSHwNJGZUjRu8IbCTDI4CLRus/mguMFzBBt29vzCU3Blj/PMlqGQlDijCqNgtC92TUsd2xu8Nod+aeksE/pCEEP4BJtuDuQ89PDsHs6VPhS+wicUkyLMU+wF+t2UWZdqVf3sRnQneM=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from SJ0PR10MB4686.namprd10.prod.outlook.com (2603:10b6:a03:2d7::23)
 by BY5PR10MB4068.namprd10.prod.outlook.com (2603:10b6:a03:1b2::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Tue, 9 Nov
 2021 00:39:16 +0000
Received: from SJ0PR10MB4686.namprd10.prod.outlook.com
 ([fe80::1551:92ba:9eb8:a093]) by SJ0PR10MB4686.namprd10.prod.outlook.com
 ([fe80::1551:92ba:9eb8:a093%7]) with mapi id 15.20.4669.016; Tue, 9 Nov 2021
 00:39:16 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [RFC v3 14/19] vfio-user: get and set IRQs
Date: Mon,  8 Nov 2021 16:46:42 -0800
Message-Id: <e3eba277e9adb8245e3d9d9218c4f47c134765cb.1636057885.git.john.g.johnson@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1636057885.git.john.g.johnson@oracle.com>
References: <cover.1636057885.git.john.g.johnson@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0194.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::19) To SJ0PR10MB4686.namprd10.prod.outlook.com
 (2603:10b6:a03:2d7::23)
MIME-Version: 1.0
Received: from bruckner.us.oracle.com (73.71.20.66) by
 SJ0PR03CA0194.namprd03.prod.outlook.com (2603:10b6:a03:2ef::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11 via Frontend
 Transport; Tue, 9 Nov 2021 00:39:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f5cc6753-f006-45e2-c49b-08d9a3195a65
X-MS-TrafficTypeDiagnostic: BY5PR10MB4068:
X-Microsoft-Antispam-PRVS: <BY5PR10MB40687CDDCFE0384F4CE84CB1B6929@BY5PR10MB4068.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1360;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LwW3UOcpBGUJtlC930Bxe1YXeH2+nxwsZ4W6OKBlwkDertkwVPM5uuYIauVBKiFYxak1e7RudhsQz6C56SFk4Ev8Q9ZENSXRYSgE+IszX2NPz+8RYVZP0vDvS/k5PJZBJwpQdGKXn2w9OTsQ4LxeNqOm6isQeMdPWVnpn8E1nAs+DSt97n8IAZWNNVHQfvh8BvpCMmHqpSBmyjghb3YDBG2biNBJk05aS3+O2169xOmwWxzf/m1DzmHOwyo/7if86iaVlRYgLMcXlwDL7C0dnxlprRs85fpUxSAPsLk2Zqaa1oVdkxnhbtC4NmwetZxTzDyVgy3Wo4CLpiDITNOCH5tdlflnj1JYS3TqfeCy5DEWPe2ZB94GN0tQGoOKMwzwAn03qKNae8/VZuLaJytZBUh0DavdmOv3/bICnqCIom7Y2voz/TjOvkSvE1UHy9R3ICeo4z6XsSt+c2YvUN6GcAhp/MRJoR9oO0/AgnTFe3FjOFYLFxlpq5KCKN/nWU0WGnP+Ey8t7rQATuRUybwEYG1I405xV64q+xE7Yfga0XsD6bFpk3ZaYeMeUk7sXweRCmioF5bF5N+2hgMkuio4doK8Nm0ZLcP6wHElcyxctAHQVZhTb2rQiX90Moxui0zodTp4v+C+DIDnTmvX9f4/DcMp9uGx9N1t2cqUcs0TYfPu+iVe8ZyHLxsvxryxcHonbs53CIbZ9/3nuq8VS4a/Dg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR10MB4686.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66476007)(316002)(186003)(66556008)(508600001)(8936002)(8676002)(66946007)(6486002)(26005)(2906002)(6916009)(5660300002)(36756003)(7696005)(52116002)(86362001)(83380400001)(956004)(38100700002)(6666004)(2616005)(38350700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KvONsHxqxdlpn0GJrYydB9byns0DhyeXzK28vszcDuGPmcCTTNcZ42KGF/wR?=
 =?us-ascii?Q?KfVqL6yhNfTGEEUHmjrI870bbXfdQpAbq4Kq+J7Ysu4Tk9XIb9HUEym4b/h/?=
 =?us-ascii?Q?mJ0lHiU3cbhJPK6KCguWQDGhX4JN6DiDeunbWzqU2P99bSz5KrjnEYrAGd/z?=
 =?us-ascii?Q?K9qpTrmlROtztCx+9j2EStKoXmzqFp3mD9dr5RoYeyt8SLZvpmA3d92ihpuH?=
 =?us-ascii?Q?kxAB4TGpJbmTWTOCRuYSUxsgYc20lPfTtr/sWU+rXOrUE1ycyGCNH68HBRjl?=
 =?us-ascii?Q?VCGDGMcRJ8wh+mJKKEvJ9wJ9na04A1XDXn9/gARYieh4qeRQZJd1HUkbFtDn?=
 =?us-ascii?Q?7ZfvEQ/8D0S5M7NsWbfLCqr6j3a5pQbk/4zASen72Ugy71Kele68ypc/4qOj?=
 =?us-ascii?Q?f9AW751bWcGxKaPuQff4KQYDk25wPgl9c8DWW56WpOUzDQAzE1WPt8sjZpZc?=
 =?us-ascii?Q?FkEHmXuG0aMBGdpDybGiRpSV9cuV0Ru3BKibe6VZWkqLED5wMICDrNX6HejM?=
 =?us-ascii?Q?Op1eyZqMtXL44Nb0L94BmTYAGo+eArAG9m6xVUck2FTXIwRSWyFqApLCcafI?=
 =?us-ascii?Q?1r9ykgqalnU20s7NMxtqRv0LJV05LgaCK5pVz3vofBG9YRrkumPC5hcRDfxd?=
 =?us-ascii?Q?GWfXImz+F/5UPUMRZxPN45eKw480O46nIPCZmI8QLknC7BL0OlCKGjGpAV18?=
 =?us-ascii?Q?ipj71FB4zqq7+zDN+Qmpz8eaj+TXilkHSa93zOUFRGJWvnHsUlfRYzFafDe7?=
 =?us-ascii?Q?fOp9lSIRocHVKRWoqAcghW8ps5CtsbJWAIR/X2TjLQoA9hk8Yihe5DtOOxMV?=
 =?us-ascii?Q?d10rmb1YQfO1dU2LCzjDTBti1r/ELIIgxMSMYJ+A4qZm74m0PrI4B+D2VZiB?=
 =?us-ascii?Q?TWbPrK5O9ve3x3arJj41Ymrbkcx5EJZzOu1OHH4TlCtA55LQ5j2ldpPE3m0k?=
 =?us-ascii?Q?tOjL2efvnrI+ch8w/G09orA6dUv6Flvv4mwgsr0deaMuVROKK6lZ3PPqGnCn?=
 =?us-ascii?Q?W4gofeXjGp0K4wWrsUZ57utCh6CUTcPUCDwKXcOpSqnG6o1UkSJFtiDqPa8f?=
 =?us-ascii?Q?jrJQ0gajuXCCw3jJRn6MBhTbKxcFoxtHtk5i8KJSPO2EkFgB3zAYlR6XwCr/?=
 =?us-ascii?Q?OI1iyg5X/eGyVfgRfsUH2N0BqQnOFRRQj66LQ9FVh7bTyY5DCFGW8l/ORvLU?=
 =?us-ascii?Q?VOZdR+pmvVlpMF6FiICheT4OrqpMrehujBIro9W/JLxw0A0WJGTk/k0ZRjJL?=
 =?us-ascii?Q?kA4Dx73FSFBGqiFpHNYeFxoV9HD+5ntoDB30r/Fw9p1souOzLRBuZe+ahI16?=
 =?us-ascii?Q?FoT7vM1QvH5ogK0rWQ6GCdBjN/o4sC7f9Kr97xhZuCh8po988mmCBNORQIwp?=
 =?us-ascii?Q?SPR59McPGk416yNHX5jiFjWWHhV6nEdrIvprqc6VZ4Y5DMm6ErC5PfsIkcUT?=
 =?us-ascii?Q?/zWEPonmPDJgaSc0NmBFndxKXWooWeeFdijso6Fh3Cux8Pcpf2AXhRt9vFiR?=
 =?us-ascii?Q?RSCPO6zBmIejQrfycw4mIml4CwNITiMLFTIsl2OVF4F4nJrcwVCz5BimFHdl?=
 =?us-ascii?Q?14LZPHBLz8D4wMk+wQ8Kmt5dDntQSyCG6j0O/GTOtFebYnemapOB6XYPwQLA?=
 =?us-ascii?Q?tsJcfy+hJufNMwSW7UjMWQwB2txN9kWknRkIpwNfAR0wfRG2nhEZiBizKk4Y?=
 =?us-ascii?Q?DXlFyQ=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5cc6753-f006-45e2-c49b-08d9a3195a65
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB4686.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2021 00:39:13.6670 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /voQMopkfyWqvVA455cBw3GGTOJ1222E8Ku6N6A6D5NyX78zeSmWIEVDkrQwRnpABqh9R9UeD5kOU9H679eZI4u0lRDjjjLrNFvyRhc2uVg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4068
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10162
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 adultscore=0
 mlxlogscore=999 malwarescore=0 phishscore=0 mlxscore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111090001
X-Proofpoint-GUID: sTg_NZcY8FdOgXuzSU04fZNvlMjX2ynK
X-Proofpoint-ORIG-GUID: sTg_NZcY8FdOgXuzSU04fZNvlMjX2ynK
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=john.g.johnson@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 hw/vfio/user-protocol.h |  25 ++++++++++
 hw/vfio/pci.c           |   9 +++-
 hw/vfio/user.c          | 128 ++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 160 insertions(+), 2 deletions(-)

diff --git a/hw/vfio/user-protocol.h b/hw/vfio/user-protocol.h
index 56904cf..5614efa 100644
--- a/hw/vfio/user-protocol.h
+++ b/hw/vfio/user-protocol.h
@@ -110,6 +110,31 @@ typedef struct {
 } VFIOUserRegionInfo;
 
 /*
+ * VFIO_USER_DEVICE_GET_IRQ_INFO
+ * imported from struct vfio_irq_info
+ */
+typedef struct {
+    VFIOUserHdr hdr;
+    uint32_t argsz;
+    uint32_t flags;
+    uint32_t index;
+    uint32_t count;
+} VFIOUserIRQInfo;
+
+/*
+ * VFIO_USER_DEVICE_SET_IRQS
+ * imported from struct vfio_irq_set
+ */
+typedef struct {
+    VFIOUserHdr hdr;
+    uint32_t argsz;
+    uint32_t flags;
+    uint32_t index;
+    uint32_t start;
+    uint32_t count;
+} VFIOUserIRQSet;
+
+/*
  * VFIO_USER_REGION_READ
  * VFIO_USER_REGION_WRITE
  */
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index f8729b2..6f2d2fd 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -506,7 +506,7 @@ static int vfio_msix_vector_do_use(PCIDevice *pdev, unsigned int nr,
         vdev->nr_vectors = nr + 1;
         ret = vfio_enable_vectors(vdev, true);
         if (ret) {
-            error_report("vfio: failed to enable vectors, %d", ret);
+            error_report("vfio: failed to enable vectors, %s", strerror(-ret));
         }
     } else {
         Error *err = NULL;
@@ -651,7 +651,8 @@ retry:
     ret = vfio_enable_vectors(vdev, false);
     if (ret) {
         if (ret < 0) {
-            error_report("vfio: Error: Failed to setup MSI fds: %m");
+            error_report("vfio: Error: Failed to setup MSI fds: %s",
+                         strerror(-ret));
         } else if (ret != vdev->nr_vectors) {
             error_report("vfio: Error: Failed to enable %d "
                          "MSI vectors, retry with %d", vdev->nr_vectors, ret);
@@ -2662,6 +2663,7 @@ static void vfio_populate_device(VFIOPCIDevice *vdev, Error **errp)
     irq_info.index = VFIO_PCI_ERR_IRQ_INDEX;
 
     ret = VDEV_GET_IRQ_INFO(vbasedev, &irq_info);
+
     if (ret) {
         /* This can fail for an old kernel or legacy PCI dev */
         trace_vfio_populate_device_get_irq_info_failure(strerror(errno));
@@ -3630,6 +3632,9 @@ static void vfio_user_pci_realize(PCIDevice *pdev, Error **errp)
         }
     }
 
+    vfio_register_err_notifier(vdev);
+    vfio_register_req_notifier(vdev);
+
     return;
 
 out_deregister:
diff --git a/hw/vfio/user.c b/hw/vfio/user.c
index 781cbfd..1e220b9 100644
--- a/hw/vfio/user.c
+++ b/hw/vfio/user.c
@@ -986,6 +986,113 @@ static int vfio_user_get_region_info(VFIOProxy *proxy,
     return 0;
 }
 
+static int vfio_user_get_irq_info(VFIOProxy *proxy,
+                                  struct vfio_irq_info *info)
+{
+    VFIOUserIRQInfo msg;
+
+    memset(&msg, 0, sizeof(msg));
+    vfio_user_request_msg(&msg.hdr, VFIO_USER_DEVICE_GET_IRQ_INFO,
+                          sizeof(msg), 0);
+    msg.argsz = info->argsz;
+    msg.index = info->index;
+
+    vfio_user_send_wait(proxy, &msg.hdr, NULL, 0, false);
+    if (msg.hdr.flags & VFIO_USER_ERROR) {
+        return -msg.hdr.error_reply;
+    }
+
+    memcpy(info, &msg.argsz, sizeof(*info));
+    return 0;
+}
+
+static int irq_howmany(int *fdp, int cur, int max)
+{
+    int n = 0;
+
+    if (fdp[cur] != -1) {
+        do {
+            n++;
+        } while (n < max && fdp[cur + n] != -1 && n < max_send_fds);
+    } else {
+        do {
+            n++;
+        } while (n < max && fdp[cur + n] == -1 && n < max_send_fds);
+    }
+
+    return n;
+}
+
+static int vfio_user_set_irqs(VFIOProxy *proxy, struct vfio_irq_set *irq)
+{
+    g_autofree VFIOUserIRQSet *msgp = NULL;
+    uint32_t size, nfds, send_fds, sent_fds;
+
+    if (irq->argsz < sizeof(*irq)) {
+        error_printf("vfio_user_set_irqs argsz too small\n");
+        return -EINVAL;
+    }
+
+    /*
+     * Handle simple case
+     */
+    if ((irq->flags & VFIO_IRQ_SET_DATA_EVENTFD) == 0) {
+        size = sizeof(VFIOUserHdr) + irq->argsz;
+        msgp = g_malloc0(size);
+
+        vfio_user_request_msg(&msgp->hdr, VFIO_USER_DEVICE_SET_IRQS, size, 0);
+        msgp->argsz = irq->argsz;
+        msgp->flags = irq->flags;
+        msgp->index = irq->index;
+        msgp->start = irq->start;
+        msgp->count = irq->count;
+
+        vfio_user_send_wait(proxy, &msgp->hdr, NULL, 0, false);
+        if (msgp->hdr.flags & VFIO_USER_ERROR) {
+            return -msgp->hdr.error_reply;
+        }
+
+        return 0;
+    }
+
+    /*
+     * Calculate the number of FDs to send
+     * and adjust argsz
+     */
+    nfds = (irq->argsz - sizeof(*irq)) / sizeof(int);
+    irq->argsz = sizeof(*irq);
+    msgp = g_malloc0(sizeof(*msgp));
+    /*
+     * Send in chunks if over max_send_fds
+     */
+    for (sent_fds = 0; nfds > sent_fds; sent_fds += send_fds) {
+        VFIOUserFDs *arg_fds, loop_fds;
+
+        /* must send all valid FDs or all invalid FDs in single msg */
+        send_fds = irq_howmany((int *)irq->data, sent_fds, nfds - sent_fds);
+
+        vfio_user_request_msg(&msgp->hdr, VFIO_USER_DEVICE_SET_IRQS,
+                              sizeof(*msgp), 0);
+        msgp->argsz = irq->argsz;
+        msgp->flags = irq->flags;
+        msgp->index = irq->index;
+        msgp->start = irq->start + sent_fds;
+        msgp->count = send_fds;
+
+        loop_fds.send_fds = send_fds;
+        loop_fds.recv_fds = 0;
+        loop_fds.fds = (int *)irq->data + sent_fds;
+        arg_fds = loop_fds.fds[0] != -1 ? &loop_fds : NULL;
+
+        vfio_user_send_wait(proxy, &msgp->hdr, arg_fds, 0, false);
+        if (msgp->hdr.flags & VFIO_USER_ERROR) {
+            return -msgp->hdr.error_reply;
+        }
+    }
+
+    return 0;
+}
+
 static int vfio_user_region_read(VFIOProxy *proxy, uint8_t index, off_t offset,
                                  uint32_t count, void *data)
 {
@@ -1075,6 +1182,25 @@ static int vfio_user_io_get_region_info(VFIODevice *vbasedev,
     return VDEV_VALID_REGION_INFO(vbasedev, info, fd);
 }
 
+static int vfio_user_io_get_irq_info(VFIODevice *vbasedev,
+                                     struct vfio_irq_info *irq)
+{
+    int ret;
+
+    ret = vfio_user_get_irq_info(vbasedev->proxy, irq);
+    if (ret) {
+        return ret;
+    }
+
+    return VDEV_VALID_IRQ_INFO(vbasedev, irq);
+}
+
+static int vfio_user_io_set_irqs(VFIODevice *vbasedev,
+                                 struct vfio_irq_set *irqs)
+{
+    return vfio_user_set_irqs(vbasedev->proxy, irqs);
+}
+
 static int vfio_user_io_region_read(VFIODevice *vbasedev, uint8_t index,
                                     off_t off, uint32_t size, void *data)
 {
@@ -1092,6 +1218,8 @@ static int vfio_user_io_region_write(VFIODevice *vbasedev, uint8_t index,
 VFIODevIO vfio_dev_io_sock = {
     .get_info = vfio_user_io_get_info,
     .get_region_info = vfio_user_io_get_region_info,
+    .get_irq_info = vfio_user_io_get_irq_info,
+    .set_irqs = vfio_user_io_set_irqs,
     .region_read = vfio_user_io_region_read,
     .region_write = vfio_user_io_region_write,
 };
-- 
1.8.3.1


