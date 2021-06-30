Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD6F93B8907
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 21:11:13 +0200 (CEST)
Received: from localhost ([::1]:46084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyfc8-0001np-LW
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 15:11:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1lyfZ7-0006wd-CD
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 15:08:06 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:8316)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1lyfZ5-0005lc-2A
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 15:08:05 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15UJ6pab007406; Wed, 30 Jun 2021 19:08:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=733n0ZY+pW4G5c+w/i5mYpaOWaTeUaO4gVmrELNLS0E=;
 b=RCetT6CddKQPzITTwTFoEUzjsHWbHS/SLt747/CTMZDW+mJtVYuVSZ4mELjtQoOrhcC+
 cBT2AsC/tcZUMZLZGfoABqZe7Mk5z1Ma4RMsSXdbYKgLrlsCOIjkS4gfkZ2t4jjWOMB9
 AhWgeY/ORcK8/EiJ5N9om17Kmp3L1qYNdkkgSp7bbNBefjlwq+NozD8Ms+/Vc9YJqc4b
 XwHnsYeW4GRiOb48dMYQEmx6pXZRcKtdN35Q4ZWLTuiXnbBQDYmojcwtmOQenShcjJxZ
 yUghyS6GuxqNmdWehKVx88VbEHDDvkLOPq7V4S8jRbpx5+dvleNanLsRkUVNk4aobZZP og== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 39gguq1r9r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Jun 2021 19:08:01 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 15UJ07G3101053;
 Wed, 30 Jun 2021 19:08:00 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam08lp2048.outbound.protection.outlook.com [104.47.73.48])
 by aserp3030.oracle.com with ESMTP id 39dt9hqp2y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Jun 2021 19:07:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bRU8Q6UVUnq87zJivgNkTvuspm5yT3+wOOKjt+fXHYhvYzIg9OE5FADArhWJhdAyExcDhAgTWyyRdxog+luoM964YESbU+AeFRDqeOwkwkvWU1XMfMQYu1fW8DJ2daxszv6Rmgef2rCCpEOOPNOqZJn/OESUFRvmUH1NOmG9n+5DOYbxJmV7vx5LlDIdFaoNDPs41wmFu5/h9zh8rCJiP0iDtUmVj6hJYd3Lk7PFPRwDs47cIZpn4u7Wq0/itXWWI7XEe02Jgh8kiZNQKFZyQ/FI9tgGekUlWeGqYUHUmk/dCqF6X2ZwUUFoK/TUU1X4NGgopGBW31eGwJIcvjVwkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=733n0ZY+pW4G5c+w/i5mYpaOWaTeUaO4gVmrELNLS0E=;
 b=G0WdGtd/nqRS27wUOGW9IgI71GAtwMnk0gqHmfScLXCAk+1PBIm3Yw+ALF3QHLpURJM5Es7/W1aiNn9f9r2kvI3fgPuyRe72lWyXuxLYEku53QZ1BuoCXReryWdcRVu5b1ZC4iUxgH82ezxchC1ZimZXeUv1EhI2tGkevH+VqJLqSY7KHoMxYcejF8rA6Dv9bUTxCpeGF9/dAibDFQGHDI+j54AR8eA1UvrsS4SAJ5K4AaTRydNLaIH9KNZcgetS6CFcq9zhw6pKzAbrN99qKrl/SCuJ1VWfMYFz5ifFPsh6lIo4YgdRZF1LbAEESUPhDU2RwhUtTerAaO3gH9obVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=733n0ZY+pW4G5c+w/i5mYpaOWaTeUaO4gVmrELNLS0E=;
 b=FqDljR+RgPjw5vX7yFPx42QFOidJIdCjL42rdl9DvTc0iHDJWiOMkzeQzZyxUFW+lCuq9QkkK9OP9iKNZNdY7C/d8fDDYuY/bM70druTb/1E+bshcKYc3MuEj6bdRCy9MqBGnsHgy4HIWhyXjizoK+pPfo1JICZ+HfNfw1pmJlg=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by CO6PR10MB5441.namprd10.prod.outlook.com (2603:10b6:5:35a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18; Wed, 30 Jun
 2021 19:07:57 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::a0af:e69c:6e81:b8fc]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::a0af:e69c:6e81:b8fc%7]) with mapi id 15.20.4287.023; Wed, 30 Jun 2021
 19:07:57 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 04/10] ACPI ERST: header file for ERST
Date: Wed, 30 Jun 2021 15:07:15 -0400
Message-Id: <1625080041-29010-5-git-send-email-eric.devolder@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1625080041-29010-1-git-send-email-eric.devolder@oracle.com>
References: <1625080041-29010-1-git-send-email-eric.devolder@oracle.com>
Content-Type: text/plain
X-Originating-IP: [138.3.201.23]
X-ClientProxiedBy: BYAPR01CA0060.prod.exchangelabs.com (2603:10b6:a03:94::37)
 To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ban25x6uut23.us.oracle.com (138.3.201.23) by
 BYAPR01CA0060.prod.exchangelabs.com (2603:10b6:a03:94::37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.23 via Frontend Transport; Wed, 30 Jun 2021 19:07:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d83a2e04-31fa-423b-bf5f-08d93bfa5f3f
X-MS-TrafficTypeDiagnostic: CO6PR10MB5441:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR10MB5441D5CD3FDE2DAACFCB1A2797019@CO6PR10MB5441.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3IXMuOib091RiZDMGr4I6N266mYvdr4+10szqDNnq6hXI7BVsaAAUIq3Y5QdeRfQoMJ9fFhd+fXCIznyGMd7NU4RIdgQemIB3BaGzmWjtgEB8bbJQERzY6F/aZrHsb9WtnoFkhEqaRm+HRlUXAxMzdgfHe1JGuxT0AkSxdX6CiXdlti5fPBxc82BTxQbS1efk2JAkerdAgHhjiQupK6DeoOxC7M5DS9H1Vcu4GEAMUasJv2YGnA1cKrcp9jKIFQlrI8BRz5rI6Y5Q+2m6XbIlCMsfvDvlDhSFJSWFIzaUXhH8ljvc/TBIbtz5fgDsqLm+L94Ig8JKY0uw7JhKYtUJouoK5ykk3v3S6CHOQZI9Kj+11vDSWiD8wix2hM/5nbYNN08qXe6ebKrwTHuu93svfJUhSO6wzQNRrbhdSqNz4ZYm+EblfrG1+D4YkAThB3C40DiOUFG8gu7HijHeDUhaEXH25dbNbSLmaLL4qlYRw7GZp7Z76DbI7nOAQGIq81BrIW058WsBtTjJ4PrhTAT0TrIpxY39h402YW8jb4IBTyvyy+m1mISVXAH7L84SRDxAOUOMfID8hokH1CJBRCZ3OIJMEHlGG1XJaYafbaxsYM69xbQOKjtJe1Jq70wC6zsZID3xvqKJh806WQ9+to0GXNC/13K+X9R1E0TVetgVpu2h7x2fGtpVhO1CXetzx9G7HFOJeYtMv0ZUwCpwnGBW9gf9NMiDzGaADDvNqE0V+JEU+69rjLypCtSW0TDWeJAbjilO2ENgAok2ID2yQBNdkM6XpJW49ku+wiqfrabtmzaxNRxPvlJ+BOCZWN0+W7EBGZWeG2G5MeGzSMUEyY2y+NdPUzO9jaZrKxM1Smuo7A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(346002)(39860400002)(376002)(396003)(136003)(8936002)(107886003)(38350700002)(38100700002)(26005)(36756003)(186003)(8676002)(5660300002)(2616005)(956004)(16526019)(4326008)(86362001)(66946007)(7696005)(52116002)(316002)(66556008)(6666004)(66476007)(6916009)(478600001)(2906002)(6486002)(2004002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6GPE88QveUWvot+1cJ/UG+0SWsH25zqYfXtk21eFjjb8y929HY+h1q7hR8+f?=
 =?us-ascii?Q?awoE/TPMpfVI2SWo1a8fbCJRtk1t7zfPElMEymVffZmTrBSvDr3RAJTsdmf1?=
 =?us-ascii?Q?834z2vbYWhuWuyHH1fr3mIQrBH1Ka62LKCmc93KtCdYG5FsDFZu8uHTPmVqd?=
 =?us-ascii?Q?d19ALB8ME+xPoQLZrJcEW0Hulwbk1uq3ES3+9hQHBTRCtemoVc6xDU9gU7oc?=
 =?us-ascii?Q?airpzNb/IDSkF1OitgK2PJEAXClpyEGP1PK1M4PfR1jEwswWmktmJCfGs4dO?=
 =?us-ascii?Q?0PxhUNg99ZkgMMCSic7qHF2vlk/JS9W6MKTFmHIqMtob4hSjFfZA6RR6Gzif?=
 =?us-ascii?Q?B4nLwHIV2y1nrOkUDY3PEqaYoDMe9rsSXGRN1cfwDjcabE1SnSHjO/zDmbvB?=
 =?us-ascii?Q?aQZYnUn0sQWEhM6bzG7De7+U2JHJg231D9KiNZxZ2FVdd1xWsjag09ruRAfY?=
 =?us-ascii?Q?UoCEfBL1jeaSQcMPfhgRMEn0bebVKqH1aTwTmBK3xj30jbL7HFRgiO8JNE9A?=
 =?us-ascii?Q?hWO/WdPezb0+DwDN5D6QjHd8MyrcNUdUObvn4VXplXz20L3aHoqrs9+vwt94?=
 =?us-ascii?Q?b1P1Eqp49pNXTWQ3qV0LKMwXCOiFxzI2mAmuZyYTm5rgcgEWRLTWI+3v3Kpb?=
 =?us-ascii?Q?NWTk+8efXKCBWJAVBD5GDu1oOd+vAiDN8q0G1xBoH9aCEu8zCs8Egg47ONWK?=
 =?us-ascii?Q?/Jd84ltbRJZz3rnWFH1MAC/uk6atOo26dIxajtM+0dczdxRifdeZfnpieF1h?=
 =?us-ascii?Q?N90tbntAUX5Uu23u2XDFUn/GBzLiVS7KJ5MamHc3Sy8nEf5uVGuCbbWw+DJf?=
 =?us-ascii?Q?C1y98QTJFbR3BvC957dzm+3gjySB2kCe7mElIzb6JE726tR1cxz81pSSc0WM?=
 =?us-ascii?Q?+kuXyzMwnYMnknCBea+wttSopNtm0xxzj68x31BcmlS/KLe5C+uruEdg1T6l?=
 =?us-ascii?Q?r2KZ/NNjycUiFKGeHV4fedTAZ96X2J9zkNcOB1VBLmPvZUv4YK7Lanna/9le?=
 =?us-ascii?Q?SmnsQV3khhN0r/4Yziz6cIZzLIgiuhUkMte85eeL68dZ88tGZW//xtocaUvR?=
 =?us-ascii?Q?GQX0FLu/QOZ9CVtL0TTUIWT/Fw83WymNNfiFN6cvfHdN0U+SatZRtmPMTJ0C?=
 =?us-ascii?Q?obsvLuGucLrbZz6nX7T+D/4TejrwevT7t5pMRK3x5Bzc6XovPjTuZxyRP/Nv?=
 =?us-ascii?Q?tY1DsR9sBLQqKbas9rZ61mx6qIpgoyXX0ct5Z0vye9piQAEck3bF8d5vetzX?=
 =?us-ascii?Q?AgMIK0T6CoYRkpaMmrBMdMvC4NL+Amiu1ScCzHKUmrIxXqH//RANM8I4ikqT?=
 =?us-ascii?Q?zGPZGgKQh7aX5x+YudBZge0j?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d83a2e04-31fa-423b-bf5f-08d93bfa5f3f
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2021 19:07:57.7503 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XHWsD072Qi27j8UX+2Tap1jJf7oQWkTNp0IUybSAYfeCKDJiSCeqmWtbq+/0m4Di0xyy2niQszpFX7wl9jXWEKo3giCiBGpkqYBEIM2dcwk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5441
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10031
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 bulkscore=0
 mlxlogscore=999 phishscore=0 spamscore=0 malwarescore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106300106
X-Proofpoint-ORIG-GUID: 6D200mjeUMrrQ84Z3weHX2f68gg28YaM
X-Proofpoint-GUID: 6D200mjeUMrrQ84Z3weHX2f68gg28YaM
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 UPPERCASE_50_75=0.008 autolearn=ham autolearn_force=no
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
Cc: ehabkost@redhat.com, mst@redhat.com, konrad.wilk@oracle.com,
 pbonzini@redhat.com, imammedo@redhat.com, boris.ostrovsky@oracle.com,
 rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This change introduces the defintions for ACPI ERST.

Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
---
 include/hw/acpi/erst.h | 84 ++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 84 insertions(+)
 create mode 100644 include/hw/acpi/erst.h

diff --git a/include/hw/acpi/erst.h b/include/hw/acpi/erst.h
new file mode 100644
index 0000000..07a3fa5
--- /dev/null
+++ b/include/hw/acpi/erst.h
@@ -0,0 +1,84 @@
+/*
+ * ACPI Error Record Serialization Table, ERST, Implementation
+ *
+ * Copyright (c) 2021 Oracle and/or its affiliates.
+ *
+ * ACPI ERST introduced in ACPI 4.0, June 16, 2009.
+ * ACPI Platform Error Interfaces : Error Serialization
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation;
+ * version 2 of the License.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>
+ */
+#ifndef HW_ACPI_ERST_H
+#define HW_ACPI_ERST_H
+
+void build_erst(GArray *table_data, BIOSLinker *linker, Object *erst_dev,
+                const char *oem_id, const char *oem_table_id);
+
+#define TYPE_ACPI_ERST "acpi-erst"
+#define ACPI_ERST_MEMDEV_PROP "memdev"
+
+#define ACPI_ERST_ACTION_BEGIN_WRITE_OPERATION         0x0
+#define ACPI_ERST_ACTION_BEGIN_READ_OPERATION          0x1
+#define ACPI_ERST_ACTION_BEGIN_CLEAR_OPERATION         0x2
+#define ACPI_ERST_ACTION_END_OPERATION                 0x3
+#define ACPI_ERST_ACTION_SET_RECORD_OFFSET             0x4
+#define ACPI_ERST_ACTION_EXECUTE_OPERATION             0x5
+#define ACPI_ERST_ACTION_CHECK_BUSY_STATUS             0x6
+#define ACPI_ERST_ACTION_GET_COMMAND_STATUS            0x7
+#define ACPI_ERST_ACTION_GET_RECORD_IDENTIFIER         0x8
+#define ACPI_ERST_ACTION_SET_RECORD_IDENTIFIER         0x9
+#define ACPI_ERST_ACTION_GET_RECORD_COUNT              0xA
+#define ACPI_ERST_ACTION_BEGIN_DUMMY_WRITE_OPERATION   0xB
+#define ACPI_ERST_ACTION_RESERVED                      0xC
+#define ACPI_ERST_ACTION_GET_ERROR_LOG_ADDRESS_RANGE   0xD
+#define ACPI_ERST_ACTION_GET_ERROR_LOG_ADDRESS_LENGTH  0xE
+#define ACPI_ERST_ACTION_GET_ERROR_LOG_ADDRESS_RANGE_ATTRIBUTES 0xF
+#define ACPI_ERST_ACTION_GET_EXECUTE_OPERATION_TIMINGS 0x10
+#define ACPI_ERST_MAX_ACTIONS \
+    (ACPI_ERST_ACTION_GET_EXECUTE_OPERATION_TIMINGS + 1)
+
+#define ACPI_ERST_STATUS_SUCCESS                0x00
+#define ACPI_ERST_STATUS_NOT_ENOUGH_SPACE       0x01
+#define ACPI_ERST_STATUS_HARDWARE_NOT_AVAILABLE 0x02
+#define ACPI_ERST_STATUS_FAILED                 0x03
+#define ACPI_ERST_STATUS_RECORD_STORE_EMPTY     0x04
+#define ACPI_ERST_STATUS_RECORD_NOT_FOUND       0x05
+
+#define ACPI_ERST_INST_READ_REGISTER                 0x00
+#define ACPI_ERST_INST_READ_REGISTER_VALUE           0x01
+#define ACPI_ERST_INST_WRITE_REGISTER                0x02
+#define ACPI_ERST_INST_WRITE_REGISTER_VALUE          0x03
+#define ACPI_ERST_INST_NOOP                          0x04
+#define ACPI_ERST_INST_LOAD_VAR1                     0x05
+#define ACPI_ERST_INST_LOAD_VAR2                     0x06
+#define ACPI_ERST_INST_STORE_VAR1                    0x07
+#define ACPI_ERST_INST_ADD                           0x08
+#define ACPI_ERST_INST_SUBTRACT                      0x09
+#define ACPI_ERST_INST_ADD_VALUE                     0x0A
+#define ACPI_ERST_INST_SUBTRACT_VALUE                0x0B
+#define ACPI_ERST_INST_STALL                         0x0C
+#define ACPI_ERST_INST_STALL_WHILE_TRUE              0x0D
+#define ACPI_ERST_INST_SKIP_NEXT_INSTRUCTION_IF_TRUE 0x0E
+#define ACPI_ERST_INST_GOTO                          0x0F
+#define ACPI_ERST_INST_SET_SRC_ADDRESS_BASE          0x10
+#define ACPI_ERST_INST_SET_DST_ADDRESS_BASE          0x11
+#define ACPI_ERST_INST_MOVE_DATA                     0x12
+
+/* returns NULL unless there is exactly one device */
+static inline Object *find_erst_dev(void)
+{
+    return object_resolve_path_type("", TYPE_ACPI_ERST, NULL);
+}
+#endif
+
-- 
1.8.3.1


