Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0112F425999
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 19:34:52 +0200 (CEST)
Received: from localhost ([::1]:34016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYXIA-0000UM-Ve
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 13:34:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mYWz3-0001hz-2h
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 13:15:05 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:33846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mYWyy-0001Tm-Pb
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 13:15:04 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 197H4gkC028807; 
 Thu, 7 Oct 2021 17:14:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=QVs4244pfx5/5CAw7lzpnnt08hn9BG2h/zZXOzp19ss=;
 b=FzpRYFnKW/AlJLz2DuP0QxGJwpkTr4CrTNe3MRw2QT7fijVUxs/vxXJLjFxolY30IGZl
 8DGGJfeMjSpNKql+OxGWi7UKUWSOac0Hbg+IsONFjnqNf/i8rNl9Xs7PbW4g6OCGeNz5
 NZmijUN4TQcMpQx+mQX7ecM0TGM5nlW8SskSvQhdA3h2pPraJiL2wu+MJitsRLawAStS
 19TdXqBttv7rrOOkvIUZOD2zpAYxybQtvqKQdSDmY/AJSG2jb6QQGwQ45oYQ4WAlipFi
 9kfMk04+SsXK+i+pDDD9vcv+UGtEiPV31+jsgyTLK9iPZWQl8s6Jb20Avw+Z8QElwy4z ww== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bj1ecj3b4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 07 Oct 2021 17:14:58 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 197HAS8T072649;
 Thu, 7 Oct 2021 17:14:58 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2172.outbound.protection.outlook.com [104.47.58.172])
 by aserp3020.oracle.com with ESMTP id 3bev91a107-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 07 Oct 2021 17:14:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L+h2p63l9mrM5+rQXt+iSVMSw0Z3OgNn9TeR4Scc1JnMnYpnHZ1W67VSWNWiAs8mk9c8GwjJpWV6nKevYzrzVV+pC9Ye3XcHDHjqSOly4WP/2KvFtuU+3Rq5rb7kkT2A0kgMD6c4uaGoFzkuMCvYr7vKeTEEhZxLQQDCL6Yrj58hDh5KTEnpP9gf41wijNr/1gEplbrbt+FG4ZduVj6zOO6owX9t4BKAMATmD3onnsBTCtLWgqA2eyKHINz6mIQjaQUTcUHVLxHXax08JFRPuVnod58Zl8M4nbLJUJ2wWkL5EBortS7KexjT/1pBSyX1e8flE8BWrapBWRTqk0VV1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QVs4244pfx5/5CAw7lzpnnt08hn9BG2h/zZXOzp19ss=;
 b=gKiJ3aHKjTwHNoeOJQxsPdbRIHejI8DTSokSN3qgmYpGzOEjP4ElD2yCUeTBfWeAJAn1AUkkXbnnh5hHQpKEIH0QEqB2QL8q3x1jhhlt6QmSdrE/+f6su+VT+ojdcgOFibfyfofjOIVK4wVgNBnQcN+29woGtNwYvNW84nQjkaMnYLULwEiBEDwmsgzuDyxuiZyT2t9WUkV8VTdtZ3vKx5mPXumiAymBSvjq5LgHJhAHQWvXDfy0r+8me8u5Pum4/udOSXlaeTkQSlU7kfKPyfekGK8DQsiYDfXVlmxIz/M0aEMesMWy0zOj051OhW2SKCTvwQvEliusFe4ppn3xyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QVs4244pfx5/5CAw7lzpnnt08hn9BG2h/zZXOzp19ss=;
 b=l5TOCxeVGjh2P4SjkSIbBQzUVdoVIie1W7LIeSSl/hJSchY/zfPsMSbH3ZI/B35kFqEjh+W0JOWV9z9Zgv9tM5HBSEhfENuhTAjKoEQkO2oTGzjZ1OxUryZkWbfDbSCw526vUNJl8WOGo+ciYCbGVqZLZfMteN1RqX9Nojy5qKc=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by CO1PR10MB5524.namprd10.prod.outlook.com (2603:10b6:303:163::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Thu, 7 Oct
 2021 17:14:56 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::90ef:e061:a4c2:acd6]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::90ef:e061:a4c2:acd6%7]) with mapi id 15.20.4566.023; Thu, 7 Oct 2021
 17:14:56 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 03/10] ACPI ERST: header file for ERST
Date: Thu,  7 Oct 2021 13:14:29 -0400
Message-Id: <1633626876-12115-4-git-send-email-eric.devolder@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1633626876-12115-1-git-send-email-eric.devolder@oracle.com>
References: <1633626876-12115-1-git-send-email-eric.devolder@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: MN2PR08CA0015.namprd08.prod.outlook.com
 (2603:10b6:208:239::20) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
Received: from ban25x6uut23.us.oracle.com (138.3.201.23) by
 MN2PR08CA0015.namprd08.prod.outlook.com (2603:10b6:208:239::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18 via Frontend
 Transport; Thu, 7 Oct 2021 17:14:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ac4f9411-3c0e-4578-8765-08d989b5fc61
X-MS-TrafficTypeDiagnostic: CO1PR10MB5524:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO1PR10MB55249742D583AF89FCE0934997B19@CO1PR10MB5524.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SwDvOqEtKrnsWyBMcAA7qSdCaRVJLBw/+0lZwWbS9YqV1izFsMKo6nxudISuiEFLwqeJqdy7+3vkviTUo3cNSKuPdNtKBwQA3WEGDfVMs4hvW5G9HNMpNy11rKNQdeA0hOQmpAk/MNHPnMb113dwygMA28j1ViauYvRTJ1PvTWc1jcq0vEEC8K1kVbMmxz6Cam5riYyExPB5aBR/P9vIssKc/5GnW/Dykbi9fOCFgghzKj5qg5n3Hqh185iWU5B0A7k3BIc2JsLdaXIo77TMH5cLufd8Ewkb527SZJBhlRpsEhAPOo1rE84Lp5ENG8PdvSAP1T9zE3/+UqlqhHyPuenHTpCNGOdkgmSdskajTuy688+PlTaP3V7WQYPz4OQQpdrPsIxKCYoMyaa2wQumpC3QHP3Bw8xfhQLMRIc1gylngQueusXxcIutDzBWrnOl0GheG1bGebOw6g2ZW++eVj2nPCXokuB/E6yO+dl5vXho4f1a5y+D/mYGzuYNSX0SJyybSANGbxw3Lj+5T+MdRF21cn38S8jKNIDQ+loP0MCndsHA1dfgcHDxRW8yiFzWxqf2Xuf1jK12OKGIDxssyxlUcZxTmoCX1pmwzKO/gEIVoHKhIlBl1lvabCH2cEEMWUa5qFoDtYI8/Sf2EqUp+QUjW3uRM48peKgxy5oYpEs1XKuZChQrUmZW4dgBFzxCn2HM+unX6ST2htRXlUPjvA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66946007)(6916009)(4744005)(38350700002)(66476007)(2906002)(36756003)(66556008)(107886003)(5660300002)(316002)(86362001)(8676002)(2616005)(8936002)(6666004)(956004)(4326008)(508600001)(186003)(6486002)(52116002)(7696005)(26005)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Nozv7UfG+5qNTMZLy3H6+oy9+ujyabtao+rRyW1dnGObA524Y9IStWgVbQyf?=
 =?us-ascii?Q?j0Z5vcAMN+ZS+Wr2yZ/kLv/o/pk1pMUrAwvyQMspArCz4sUCw0vwXABmCstH?=
 =?us-ascii?Q?SWzOnguIon9RGcPO1vzADIqdH68A2WdOg8B7fyO70GQRCr+MDiO1jVslWYLI?=
 =?us-ascii?Q?34SEmXKnGpNDAPCrkbZIyukLHN6D6V1/0YWmigOznc7nfHiZBoNJS/SNLkdE?=
 =?us-ascii?Q?1336SUaZ0bqsJKz8qf/f9wQ8P/nwKko+aixMIhNaUQH4tx7iF8wp1c2JNMar?=
 =?us-ascii?Q?Ql19qgPFYyJ9pqweGFfYYy8lMBoY8pepJVeCH8dpqcZtwmz0hCrn50rDpIvp?=
 =?us-ascii?Q?Qpx8gWZkYrRmFTybjPez0eisxG/4p4LGBnpoN9Bu/jdpZ0t6kc614e25LFTo?=
 =?us-ascii?Q?wZgtQi9mOuvjSRMXvH72uL49sBmGtpmJyVFSecmPoZE+h8gKS9HUZtgtDh8M?=
 =?us-ascii?Q?NWeHmq/4b7NmdeUgemPvhCfOlAd61m7OwX0G9Ux75XtEEdVR6L/V8/bcD0QW?=
 =?us-ascii?Q?ac5VV4Sv8gavmgRUimp/wLTJcvFRwFT3pkXysjncyF8wb/od7wbvbrFJWhQC?=
 =?us-ascii?Q?OQn1np3ngXv+UJ0ct7a+Ze1hXQ7smc2xzZoxjQT1Uqltg6OiqJaat0enbo96?=
 =?us-ascii?Q?SonQaqY53cw8r2B3tERpkKZiA1SLO5kd2By3BX5MSb65ulTtY1odtcLhB9ev?=
 =?us-ascii?Q?QIxX4k8WSfUZuXChlqYeCRoaDdvHUv5A2tXjhpT9mtRz8jvD7JlXs15IOuZ0?=
 =?us-ascii?Q?h/fjCMftvQFXQeQg5HaBoDARQ1KszNUyMLx8VkN6XrlpeUz71rKipEImBXEG?=
 =?us-ascii?Q?D0ahYeHPTxbwUqW177d9KRR3YAB0BXHQhluAN55l9MLCgTyN3fTKXdx6dmdX?=
 =?us-ascii?Q?CZ1tESRusS5xx2gBIHlfu3Cuu5jKlcZ2KS/DwlBWUS5OYNOPgioz+m+MVkha?=
 =?us-ascii?Q?pDGaqNaGEbyuBFa77xcXaDjNnrwG0z2epkx3Pwg3VqQO37ci1+wc5lR65Pf4?=
 =?us-ascii?Q?qoNEs3hyxQ98xQaq2D7Grd+pc/0cComDXqu0kpS3U1+zCcMztfyPz2le4YiR?=
 =?us-ascii?Q?0/jNmJkt70+hDY2D1CmQIwwO8qCEBQRV2yUFaTcr12M5OVTovI7YyJMsavxb?=
 =?us-ascii?Q?EmpQdSB+l/6As/qBsvFn7AoohLJju+OAsSBmJ6arLp43nwZLpzKStKInBAXP?=
 =?us-ascii?Q?bVlvL9dF4zbDtPi1bsR+7qm4eLxAITJIQjSSBG5i5hAQhhXRFH9+4MD8uCbP?=
 =?us-ascii?Q?Em8HJ47JhoCPswjFbOdAa6cKGnFQd31dEz/pG5oZ9bGsSn+WFuRD/YQEW7f+?=
 =?us-ascii?Q?OGQxXk4tNLMn4oJ4BHQw1Lb8?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac4f9411-3c0e-4578-8765-08d989b5fc61
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2021 17:14:56.7704 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5wLQaKXUbzRBmtjlmPci+7kvOXgCJ4i0yUGZQjoqwdYpvIQZqHA0Kt2UxFXgdMZs9/h9l6Q2Xb5bdJbSOPkHLzd9cYDfcRepxPSEPUBZMdA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB5524
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10130
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 adultscore=0 phishscore=0
 spamscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110070112
X-Proofpoint-GUID: hdSqHvfpA5LE9vAU8SNAPsPUkDnTfiqe
X-Proofpoint-ORIG-GUID: hdSqHvfpA5LE9vAU8SNAPsPUkDnTfiqe
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: berrange@redhat.com, ehabkost@redhat.com, mst@redhat.com,
 konrad.wilk@oracle.com, pbonzini@redhat.com, ani@anisinha.ca,
 imammedo@redhat.com, boris.ostrovsky@oracle.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This change introduces the public defintions for ACPI ERST.

Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
---
 include/hw/acpi/erst.h | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 include/hw/acpi/erst.h

diff --git a/include/hw/acpi/erst.h b/include/hw/acpi/erst.h
new file mode 100644
index 0000000..9d63717
--- /dev/null
+++ b/include/hw/acpi/erst.h
@@ -0,0 +1,19 @@
+/*
+ * ACPI Error Record Serialization Table, ERST, Implementation
+ *
+ * ACPI ERST introduced in ACPI 4.0, June 16, 2009.
+ * ACPI Platform Error Interfaces : Error Serialization
+ *
+ * Copyright (c) 2021 Oracle and/or its affiliates.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+#ifndef HW_ACPI_ERST_H
+#define HW_ACPI_ERST_H
+
+void build_erst(GArray *table_data, BIOSLinker *linker, Object *erst_dev,
+                const char *oem_id, const char *oem_table_id);
+
+#define TYPE_ACPI_ERST "acpi-erst"
+
+#endif
-- 
1.8.3.1


