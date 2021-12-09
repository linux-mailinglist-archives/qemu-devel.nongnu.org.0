Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4419046F2BA
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Dec 2021 19:04:31 +0100 (CET)
Received: from localhost ([::1]:45776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvNmQ-0008Ck-C5
	for lists+qemu-devel@lfdr.de; Thu, 09 Dec 2021 13:04:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mvNgL-0007tg-BN
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 12:58:13 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:22388)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mvNgJ-0002u0-4h
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 12:58:12 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B9HnBPZ007290; 
 Thu, 9 Dec 2021 17:58:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=4/tfqFrWnuMBDAgJe9rHCzAWYYO+Rgg9uqlAZfv56E0=;
 b=Dyw8lTGurFQGClv1LWcyXYs4JVmFVVXJgwWCKqBbbbjwdXEeRsbNcuxWrVXQryp+plu1
 6QcHRYiy/b3XJO/J+orWSvRNiRLmDJB0rm67jQQQNBPxQtgKBYJ/CHGlfLW9lXCskaLX
 8vMY1Jfh7ysrjELRKh/JyLdyt3KzdhRrw3SCyNu6YRV5TtHow3sSe0TSOeLKRkjskCCG
 Vjn4jIQaZX3bqds1xWQKRkTmuYGqPtCG1fMIBcpNN6kCK/Z4xPvNa1hE2tzDaptDp+BR
 uuH7pB6r4Xm5RCe32nbq5GxE/AuCBOTEkIRJXQtwpeHomTj9FP2GG1VG/VzH4WXTkUb2 Mg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ctt9muxms-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 09 Dec 2021 17:58:09 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1B9HqDK6018537;
 Thu, 9 Dec 2021 17:58:09 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2104.outbound.protection.outlook.com [104.47.58.104])
 by aserp3020.oracle.com with ESMTP id 3cr0584xwt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 09 Dec 2021 17:58:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N6myMblFGDDf+QtApkNMJRHs78C95kjaff8zQ7xBO2SDA5+boQAcG5BxXZiabXG/hv0ivkQxY9qmCiXPRT0rWVjlVr/YDM9u/xmGQkjmg6mabUldFMkzz5Z6HgIUQfgMTSWjrpOKZmg9THkZgXLbFdVgikUTRjbfC+RohJe7+j+oNNe18q3ThVxe6QATsDI1+U1gBDKVki252bY4hN3fwSTF5LrjCrrUkFyqOyLdNV6y0ZySSCV4jlGF5D3BQ3JKcdWe/Bpe/s1UES/055BvGVjllfIPkY3KE8I8v9VenuHRaHemyfQ5+X193g07POYNOzcHEo0ydtvyI6099eJk5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4/tfqFrWnuMBDAgJe9rHCzAWYYO+Rgg9uqlAZfv56E0=;
 b=NsTvMctaB4JKucacOYSz+ke2gHd2RDyQTN9GdfgLCQBAh5ymLKxhasHLZxtLeZqDzozNbqoUdaLt2zITMp+fbcjl8DMHa+Ne7m7lOT7JxOJbkDn46pE+9LUjeG9rnaez4TOUWMXH1Iy40NREE70RPy+SBtEXNCpNFrl3jLWDhYFs7hl9glz75EnsUGTdHAXdtEEeNJg9lvszDXSJJ8h8aVseM2Go4eCtXAt5GWJBxLEYLI3/hc4j7VC1ikPo6d8W1lOdlEfJkd5WIBwhyOR+T+k6hMj1wbxsWf3iruWQchkQyaAKaqOJpCj1BEnA+A6ZeCQKDZddN9MHSXGHnSOR8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4/tfqFrWnuMBDAgJe9rHCzAWYYO+Rgg9uqlAZfv56E0=;
 b=TnxQgBi76nR8aW2vAj3IYXnakG11zoT0wJsg2SvNNUEUuc/FfA71XTNCNo+z7Qt9c/n0CfX5Q+MCsdND7xvPVU1IQOqz/2lRyCJYdcwLkcTp6m3Ew+UtlNKVZlzspHxhUXCZ7MGT2qDD1iu57yXTxUUukeGWnnWWjxNung1bimc=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by MW4PR10MB5810.namprd10.prod.outlook.com (2603:10b6:303:186::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Thu, 9 Dec
 2021 17:58:07 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::143c:ea64:7017:19f]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::143c:ea64:7017:19f%4]) with mapi id 15.20.4755.022; Thu, 9 Dec 2021
 17:58:07 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v10 04/10] ACPI ERST: header file for ERST
Date: Thu,  9 Dec 2021 12:57:29 -0500
Message-Id: <1639072655-19271-5-git-send-email-eric.devolder@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1639072655-19271-1-git-send-email-eric.devolder@oracle.com>
References: <1639072655-19271-1-git-send-email-eric.devolder@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SN7PR04CA0073.namprd04.prod.outlook.com
 (2603:10b6:806:121::18) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
Received: from ban25x6uut23.us.oracle.com (138.3.201.23) by
 SN7PR04CA0073.namprd04.prod.outlook.com (2603:10b6:806:121::18) with
 Microsoft SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Thu, 9 Dec 2021 17:58:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4fea4e73-6046-40ae-700a-08d9bb3d7459
X-MS-TrafficTypeDiagnostic: MW4PR10MB5810:EE_
X-Microsoft-Antispam-PRVS: <MW4PR10MB5810E9D0F56CB181F91A861997709@MW4PR10MB5810.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vMbIoLT/MOcXIhKKQ9eWXy17iG8N/Jm9PF4xoIgx2pGCzLXjKN612fZ6D0RKSbppg2WX1qXAcbalmipEa6l1ApGk7dWBvZ1bjxH4WaALTL7FlkrB3JRZ1VbWeUzdcgChdlG4m87zOVqvi0XCZrcvCtBuAkuRJDTrfYpowcGFUQIIwY91r4qm0yOW949ZPAaR09H30DOdPePdTCDl09Y3tH3os3Vc/G9rWJlxRPCsSd/2AKabkXDt9b/CxZu5Fm3o36fxwtE8S3hq+lNnK/h6C3tOHbZo/+OZ9LOkbuZ4/H54CMzhdk88m0GuLxs6MVwbtximdkrCXMq3MbGbjqXAuqtaSs2mbW8mQvvLXTzcPrUNtK6gX1+D7tley3bf25hFGmARe7C+SzbqhgV+q/67VXw4orYT6VC18XHMp4N94aSJbO/SmurgKIxkXdapVkTbe7AMZkE8pDjhJcSdbj9SaFW4FTodg8T3auPTWlMi0d6AJnDoKxt2g7Vb5IR9qE1g2tw7TGKZ3ukbWBuE6O0Owor4rBaFBMVn2yn7ohF/ncQHqnMcDlPGugq0FCZYKs1bj5o8uPJ3lVbyR5gYHZqYjN3E9IfexKoduBB2roPFS6MZ9cHppSYOF7/FUBezVmMqxo3hhJnd35flbuiQx5fflhnqCPdfDtEWSWu/EBEwhEqOSLQGyHZ0KRTddLsz4Zff94BgU9avSBM6+QBYWQtb8Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(316002)(508600001)(6916009)(5660300002)(186003)(66476007)(36756003)(26005)(6666004)(86362001)(4744005)(52116002)(38350700002)(956004)(38100700002)(2616005)(6486002)(66946007)(107886003)(4326008)(7696005)(66556008)(8676002)(8936002)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?osaqiYkG5qT9egc2oWrnxMHijli5xbeMQIQNwXm7jNDHeEIuiN29X2xT/2t+?=
 =?us-ascii?Q?oCM0rSNZoNq9ii+q7IYaUveWhpP7CaGsJRq2dmXUns0RIxBNCiZfRigKZy94?=
 =?us-ascii?Q?7QB7M6Jmayt3/fEtsbURbN8uQKFMn5aqRb/5ta8itwYt3pDjk2RJaHRNEfPU?=
 =?us-ascii?Q?yB3L+FPncXjzuJuZdAzb5MbD2cVduNr4s6yeqkE1adbo9qs2DsseVwV3GyYI?=
 =?us-ascii?Q?hVMO1z3P1u00R0Tp6bzo0H7fhcm1c5mL5F5+JI+zlqdfJ5vc/ExfScU1JfWe?=
 =?us-ascii?Q?juKy2cIQvGRSOMnJapGRNa7en6YxNdMNJ2OFSwKfoFWfdAXImWL83PbfNJ+/?=
 =?us-ascii?Q?r+OPMqIwonUSPq/ti8o4QrLEWYbvtIpk4lQIrFisE3MUPJaP5pqkOB/RutDr?=
 =?us-ascii?Q?UTp/ParzEgPtI0s60Zv7bxTpGetoL1qc9uWiGTbFW5ngzYkp3OOCP6iRtRsZ?=
 =?us-ascii?Q?nXArVFblnEwjNGFkoCUUGm1ewvW/cqicprKv/eMoHPWLKycdhU70m0p8X75M?=
 =?us-ascii?Q?scHn2LvXcRyAXSJMAYsyQmvEE9ywJBH5HzPfGNyswp2KDFK63rk+Yf8h8ZYS?=
 =?us-ascii?Q?JKZ1dY3zs9x7aSG5Qv2GU6K4b9AZF+xhTHPyMPukE+Un2Tl5S0f93eql70OH?=
 =?us-ascii?Q?O6fmw6WoghTzm66axFXqPZCr6Op5gAURE5WjC5oliw6kcqfjMcDHNkiC4BeG?=
 =?us-ascii?Q?jCfPUlaDnrTKGwwUvxw6vP+CWV1odnoFsXm/2D/AsuGVhg89QVf3H6EwytBm?=
 =?us-ascii?Q?SnXQR2VDMI9frice82UdniCsh2F1REQyKxc1/xcNldZThjuUflCHO3ixVuoX?=
 =?us-ascii?Q?Yy0VEC5KDBd1S93lShIQvwACPX7epCNjcdNu0tKVwJCcF+RsKKZZBDtxyeva?=
 =?us-ascii?Q?5xX51ibAasGeUjadQUjYsurWckBuYWiHT/Ju86pHJUVtoiMhetu8npl1fipq?=
 =?us-ascii?Q?Qvzq7knLlkstPEQuRg8y8HpLjbMghRGnisBcPm33gYEOc1gRnxgSDxRxtnBc?=
 =?us-ascii?Q?FosC/Y+D1nojMKx9+1WKIRoiixWh0ho5AZ3FdQmyvyP+t2piw37yru5G6dCc?=
 =?us-ascii?Q?ITv3AhLCEhl/DWa643znBACQ6nA9ZjuyDQxsZe1DJUpl3IZNvgQtNEUdu/47?=
 =?us-ascii?Q?eGqFSd9H1Ydr5Ijjkfh7KPFaluEvisoue2M936lXZnX3vDs2f/XpIJ7lGJ+T?=
 =?us-ascii?Q?VHGVZPdyXHwxislRK9tle8WEiop63QhMjexIbpUBJie+8wbvZQNnV1cW4ju8?=
 =?us-ascii?Q?Xdsxv6xzXtUUPDanuQE9rcRatnWkmOxBZuBKtcgjF4G8SYv2Sf7fxQI0mrpm?=
 =?us-ascii?Q?6UAmTfVAT5FsnfOCtDW+Va9qLw4QIDxVCBbRtF3HGTFQMqJaCswQ3OVsxQ9H?=
 =?us-ascii?Q?YQ11cnofAs699NoqKePWTH+ND+aQFH+NZIgYXaGU0hanvh0gVbBAXpWBdngB?=
 =?us-ascii?Q?opyxWce1Xt859M1B4cWhMteCafPD+r4VxkrRBQw4o1wULE9dxNwQCwFkpFch?=
 =?us-ascii?Q?VW9m9huQm1cu0Pvcw81fo3iRNPtkFEY/VoPALZXpIbdVOkoG7HMKvsPA0jAL?=
 =?us-ascii?Q?CMaB5FW01MjZm/iyRxS0O8RrAk0vkL3jyppMx3ZqSKLP7XBlryFdUZpf9/yg?=
 =?us-ascii?Q?v53G1suBDj+myeaZAKK6t5Z5J9eOAfEvXR7idq9qyyZjqJEpUC9NSAokbVdq?=
 =?us-ascii?Q?LKTZ0A=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fea4e73-6046-40ae-700a-08d9bb3d7459
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2021 17:58:07.0771 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jAOgGzBhejSLKygjuDO+eEXAUAOp22H0HoHUuH9WF5EczWyFnxUomw/f0JkYbXoXnkYRdT3x5FUgxxxTEbLks0FD4e2XguXuRChrs8LlXqg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB5810
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10193
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxscore=0 phishscore=0
 malwarescore=0 spamscore=0 mlxlogscore=999 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112090093
X-Proofpoint-GUID: wXR76FhOePaCurHUvgXJ9KZ_QCvPS3_z
X-Proofpoint-ORIG-GUID: wXR76FhOePaCurHUvgXJ9KZ_QCvPS3_z
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


