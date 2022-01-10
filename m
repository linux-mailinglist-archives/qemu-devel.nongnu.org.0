Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1426C48A34A
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 23:57:35 +0100 (CET)
Received: from localhost ([::1]:57212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n73ba-0005xj-7A
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 17:57:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1n73N2-0004M6-T8
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 17:42:32 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:29078)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1n73N1-0001pp-7k
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 17:42:32 -0500
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20AJlfJB011393; 
 Mon, 10 Jan 2022 22:42:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=4/tfqFrWnuMBDAgJe9rHCzAWYYO+Rgg9uqlAZfv56E0=;
 b=qfXD+5341xsrw1QIBHH/6hl5OrETkYa5BbcpXBk0OWxOkBhwYDlPIDqtjYS5+L8S11Hd
 SJsZh/xWWUDCqo9kNsw1HyH1T/3KUqiCc2R63/5QtgFe62cdOelS/E7PmFgKzJhsOY4E
 OInPaJUFFsDOyzHiWCcugj3i2xxZfe6HUz/xIb6rfySft7OR+ODc5w9DMyHtmCmC7lVu
 9qNMvEVL0F85eaZUmwrpSf+v+057tuCIS+bBZJQ6jO706i5Fiqr6obP6xrWaJBmn1d9p
 yYrDlruOza5DLX8qbB9vYe0ntoJNAesCEXd55uJYmcjpyFe7nSPt9JOhmzv8LOijCStZ Sg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dgjdbsw4e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 10 Jan 2022 22:42:27 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20AMZubN086395;
 Mon, 10 Jan 2022 22:42:26 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2177.outbound.protection.outlook.com [104.47.59.177])
 by aserp3020.oracle.com with ESMTP id 3df2e3x2p1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 10 Jan 2022 22:42:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LGksPySfb2RatT+4j/YmiCRKff06uHy/jo3uUJ+YeBB5YtTsw0rHX1lSfc9cwV1fMIHJSg0MD2hDlO14IEMprPhbuRs58Ukfx6wCEm28eMmh6ccKuAGxO+rtd3WlbUVQ4F4fPRmi98xKn+LLIsPBH0nyTAeQKwBCA0508gXazZDUs4w0pmuygEsHEtl/NM2HLC0RSj0JEVUZiYetVdmhHdlpJNLBxjRQaqTbqDWsEs3NEKNt6NQ2+xoIn9vBiqPNePQUaPd/DV5qpojX+C7So0jQs2DsO8RWk8uk0AWX5QG9dNfShtqAsHfa7pQuWdFPXUC/7ipmF8npRWDmoGSang==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4/tfqFrWnuMBDAgJe9rHCzAWYYO+Rgg9uqlAZfv56E0=;
 b=YxuEwdoqsTTZrldENNNPyOne10a+GICrWCdTLDLmaVzhdT52tJh/ms1wjT5/8qVW0E2srwUfOh4bA2cwTMiXrwunVN91zdEJPTRhQrb6crauiGUtUN5dJfWXwtYGbrZrez4EpeUKdY6RFnZm8Gkln21aC8vaq9lQOdkNvCldDJb9QkYjLcxGcMLtsFgjRufJLdIKkFvmEh8Q7/tD5notxFQO44e7C87CGgakiEbMK7lVp5tv3Xea6kT4dZOXjggygwYKAWo613p/iV/RS7kFWHZqXZfPg9oj/+trkpDjwuvdBd2ONbrCBZzY2GfIdbD/ayBFE/mzkr1ay9Lu7uj7sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4/tfqFrWnuMBDAgJe9rHCzAWYYO+Rgg9uqlAZfv56E0=;
 b=cVAJNviO6gKfXW1MNnsOy2nf/02w6hGNbK3CGM2Pk27vCmqsPj9ieodb9U0HGaSdgN2sspk3Q2E7LmeG0kBArNhdrmSirX6w+3y11UHGQoEty4v3aSHScyX/GrlZ1aiGTBBGFEghrLpCTSf5lQFQV+SNRVjvB9XM18UCwE1WuJs=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by MWHPR10MB1598.namprd10.prod.outlook.com (2603:10b6:300:2a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Mon, 10 Jan
 2022 22:42:25 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::d573:6cc0:c616:6f2c]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::d573:6cc0:c616:6f2c%6]) with mapi id 15.20.4867.012; Mon, 10 Jan 2022
 22:42:25 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v12 4/9] ACPI ERST: header file for ERST
Date: Mon, 10 Jan 2022 17:41:59 -0500
Message-Id: <1641854524-11009-5-git-send-email-eric.devolder@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1641854524-11009-1-git-send-email-eric.devolder@oracle.com>
References: <1641854524-11009-1-git-send-email-eric.devolder@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0P220CA0029.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::13) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e8f5e71b-4b14-4055-1a6d-08d9d48a78d8
X-MS-TrafficTypeDiagnostic: MWHPR10MB1598:EE_
X-Microsoft-Antispam-PRVS: <MWHPR10MB1598A115E6046294A4D4B63997509@MWHPR10MB1598.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RunZrVFHdMTW72GK7g0Ab6e8sAw6Ss5UUEQMinCiajdfckbnPqtStRFGYBW3xtORFElHrA9bACUyAAyLZ3J6uElSY4TZZU4udAHnBgMlqIHKC5F01a2wPNMnKaVEosPMXPFw2s67uPcQ8sSUX0GvQCXuqLSKInhElcJaVJcakm0fskV0Nfq7L0l3f2ku9nI1xTW130Su7VV0j0EsceqEePe/9LjFaQ5hHuFoYx5UckZ3qY2BSRgod4zeKNOHoJrPRr8PnlVaXnPqVK9MCesWbvD45lnmXaXG9tYtyuP5zeTsKhT9dm4FJb0yB7fWh3QD6bxpjIICwFbikIqybb4Njw3DPbIfGWeCAknM38Fan78wQrifiqZ3/5njtWILZe++Yoi6wjAqcrx9gVDGXCQKggvYFR2VlVL3Lk+Q6nshFXnUNOZUus6Uw5KUZRQP0GK2ATzA11BxCNb4QDFMGghhkQLGaIafgBDzi0V8SiBSjayKJ0lRZdMd1f+7cUW+mrFuLSzMwJBn7zui7efjc3kFcUe+XZ8On2SeS+lTcMTepxQq2rLUYhcLiNBWyUhOcm4bfWziZWzdFt3CiiJloS5HyOITCBG3fBk1JbmPFki4lNDj3vcN5e3BHa3JoObcNTlnywtO3enijrsBZWhit9MwgTTJVz0pQQYL0RUgJikzesyl2xWqK7//KNeGx7qICfpBzHVpyhVI0gjKcoNhZGlCJA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(38350700002)(66476007)(6916009)(6666004)(66556008)(6486002)(66946007)(52116002)(38100700002)(2906002)(6506007)(186003)(8936002)(316002)(6512007)(508600001)(4744005)(4326008)(2616005)(36756003)(86362001)(107886003)(5660300002)(26005)(8676002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PC5XCcc/laBRG1kIn2EHBujmbjeeKefgBRNw8lH7JfO7YPjQvg9nA1iYksS9?=
 =?us-ascii?Q?R7oFclW18wKR3uiGDsjP/Yia8VeEDxEdxmkgfne9HrpE00tCUrsJFGmqn0Kr?=
 =?us-ascii?Q?LsfXZmiErQZAyLJocoXosC4R1pcRzji9jZ2i1jQwRw3JHy9kyCI36/LrE4Jh?=
 =?us-ascii?Q?V3EsQErs3bD9wbTgfNSH2F0RHDdOMz8xiEO1d8kJ5EeVShOvKixyP9Yxa6LO?=
 =?us-ascii?Q?QWlYv40yqhtprlyIj5pyeH91N+Z8GECUU5AL4wfsmnJHEMQxYZfRNACMZKYq?=
 =?us-ascii?Q?upVZW5tI62l+8ay/8C09EcFpL0pKHjh3CNHF0NKQxcqWBh2H31lqSoc84wvy?=
 =?us-ascii?Q?W8tUMO64N4wtdNB4iTk339b1aBzJF0Hsta4lYIeeTnB0LpcQ22SSIF9OXYPo?=
 =?us-ascii?Q?xO44GF0tDAfxtZHhg63PIo3awwnuyM0w25bP5OjVFYk8TDcsxs5YoZMdR4t9?=
 =?us-ascii?Q?xViulnRxoyRFvv8T+kmRPBs7EytUsUSDINyXCNvCDo7ucHsym0DXDDWYQls/?=
 =?us-ascii?Q?88ywuljfC9yQfEMrLlMMTcXarzMJThxgw519v/QKg4e3LhKnFzpVhdx9D9Ez?=
 =?us-ascii?Q?TMN0KJJu/2PjtrfQr9d6Q/HxWcOuCIaPpMKx9I13HlCPK4NucHPzN+cFkV1h?=
 =?us-ascii?Q?yG8luj9pPeFXnIXIei8T64gQqPl8MaL6KlmXE42Pwmx7+sx9yIOSjsseWtSr?=
 =?us-ascii?Q?nH2JHmT55Mj2fFRPF9Ijv2B7XncFVP0KsQ/pOP2+2PJbhppjeSO0QH3dDONq?=
 =?us-ascii?Q?NsD1x12zjeGSHJOO4OlGPzxes+KCtuQWe/ghdhiB7IsN4febTnt3R4E87a53?=
 =?us-ascii?Q?O8ebvyKyGEMEa9+jrciDbcc27uhHpNRhyDYlrp83FXf3nBLJE++4GkTS4UOW?=
 =?us-ascii?Q?10ozI1hXbHfp0teqzSEKKv0xWjT9tyDqnYdxTXhSO93nXeLEg8DZMJnIjRmI?=
 =?us-ascii?Q?Mw0pCIRzuCNdDz8AuhW5NV150zayZf8nRhZG+azk9hFBNMGays8roUuQBsJS?=
 =?us-ascii?Q?rT8x3IhLZiLDN5EnBYJCJGL/srB+qCu9jJ9jl1qYRLpDofPfqRkDR4JM/dtH?=
 =?us-ascii?Q?+ePGqodhI/DcihN+/YugQVRTHYSkSM3QbFc2NQwrD6bsYIsH099Z9Wm24TLm?=
 =?us-ascii?Q?8M4YAG0OHuKN8FpA0x/GH/QcTsJZ8Hp3LNHI6GvfFgFYIJca+3mMI2G0IYJB?=
 =?us-ascii?Q?oULmNmtIRCr3gbOUDI3gJ8LEmGBzi4T+b7wPfYwHQTdXQE4B/pplWtAimy2a?=
 =?us-ascii?Q?8EJ8/3Bv6Ls+TcegXT9HpWGPo6K7O461MC3eQFXU2qCGG3ttB6MoqibwUO2W?=
 =?us-ascii?Q?cldHmnCqLtWTshnXoAQM/vKjYms7MHfpYe88pgYCpuc9HNc9xztCp8FIdQcc?=
 =?us-ascii?Q?NFw12vTcDSLbRCW+86Bp0eDi0vH+lliwnDmwsqEO78kftp3Aj4P0GPyb+2S7?=
 =?us-ascii?Q?fslQiyL2n61zUHtKiHoIHvxPS5CemgQuSmS0AGhIDmG3IXjITo/3Qtxvl2sF?=
 =?us-ascii?Q?MOaYxyOujvcJaOLAwcof/WpJSEP8EGGvmu3cC2YVCQBcQVJtAJuo7644KmZ2?=
 =?us-ascii?Q?j3IilB+i/A7J1rxhzdUflGKu7oZR+s6KPdLdXy5OTIf5HLgsQG0c98vololA?=
 =?us-ascii?Q?YrwkpDItJbcOui3PVDaIoNW9fihI01m2Ax7xcUaFJR+2btuZDX89qyIJnPUz?=
 =?us-ascii?Q?/9QarQ=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8f5e71b-4b14-4055-1a6d-08d9d48a78d8
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2022 22:42:24.9826 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VFaFIutANyXrM/WKD2p6Jv25InmosoT/Fb62aYeY0Wcws01/xVLlqXD3z2e9ReZRG6WDf75AdTLGpvvFE/erC0WebUFsXORjYmfuQnAAIjY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1598
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10223
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxscore=0 adultscore=0
 suspectscore=0 mlxlogscore=999 bulkscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2201100146
X-Proofpoint-GUID: _Xe_cGSU1Hi6OOY6I0Y6UttgIc48gt4t
X-Proofpoint-ORIG-GUID: _Xe_cGSU1Hi6OOY6I0Y6UttgIc48gt4t
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0a-00069f02.pphosted.com
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
Cc: berrange@redhat.com, ehabkost@redhat.com, mst@redhat.com,
 konrad.wilk@oracle.com, pbonzini@redhat.com, ani@anisinha.ca,
 imammedo@redhat.com, boris.ostrovsky@oracle.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This change introduces the public defintions for ACPI ERST.

Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
Reviewed-by: Ani Sinha <ani@anisinha.ca>
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


