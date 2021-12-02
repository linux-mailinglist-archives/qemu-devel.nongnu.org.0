Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDCE6466A5D
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 20:21:51 +0100 (CET)
Received: from localhost ([::1]:51854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msreR-0005kE-0Y
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 14:21:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1msrTk-0008O8-5O
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 14:10:48 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:47174)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1msrTd-0006Zn-9U
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 14:10:45 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B2IwIp7020451; 
 Thu, 2 Dec 2021 19:10:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=hsCQ08OMTCt57ojTlBVlHNET6qdDThP/HZhwO0+IHTI=;
 b=sc1loxJD8ojKOJBCP/BfHhdeW3AAHkMwl0baAqiXBfBjmMEkQqLOerog5bHZUV7+nJ72
 SEVkjI0HHmSAM0dNMiTtl8IdE23cd4QHUEOONSICKmshQ1rJot04UCOBq+qu79RruMvJ
 wfaPu0SvKPJeCcE1rY5bsuQ55Zh9ey/gUSs0ZMp5Iad/JI+lfSdB+y3ZgU+yYYKEerI7
 SGU8bOi2Epo88N87IeLrojxkmlt7+19oj05/UQrRflQUBDqmP3YCFTkRAgMPcuuqyK8E
 UnC1Lz8VF6FTFJS//6N/ipzP0GkE2QK9JHuKsNIKE/vcI9WGVJkNl1zc+K4wJi2qItSR jg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3cp9gktb27-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 02 Dec 2021 19:10:37 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1B2IoPns115630;
 Thu, 2 Dec 2021 19:09:30 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com
 (mail-bn1nam07lp2045.outbound.protection.outlook.com [104.47.51.45])
 by userp3020.oracle.com with ESMTP id 3cke4urwa1-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 02 Dec 2021 19:09:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P+2mQysxKD5emzjGucIOrfTsjxmFgwYlPnqPpifBD5Xc9K6zReWXMkvNguDzL73D0fACZkYOGLwy1P/xtIdsVxQsLO6mcDuCiDeXgtIwIfLXDw53iu94ZVDRazkDGIvydKM4GxJTaYnGb8UQVgNT2fYxNnWUdnz8i5yRd9hWYf7azsXe1reogeMnwbh9LLpzYFrh+qEWLoNqC6d9L9mOd3eaGLMBheHuBpmpQ5+gtPWqTaS5Ij4X7yw9Z866URD2h5NFH0ZBF5yVNpBhLSDj5VxxxjIpdnmKRlpnrIEoDCYcED2PW7rkw4pdLyTrLTF2gQBsSWnZ6AguLLbroVM0kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hsCQ08OMTCt57ojTlBVlHNET6qdDThP/HZhwO0+IHTI=;
 b=LKqTtrCZNnUHWXQ96ZiBUj2jnU3sGX/ISxnBZI2C2ZUKacjZihFjlzSIdYyrYYMDcQOOIgwS3sZL8YE7q/wfevD1ZMc5mHgRuBFcMU/EYaOylLuxv3tO/gGv99Oz1RxOib1sMyIks97j5pUgQ1K3gJL70nnBXHcXmxD05tYCXsgmlbyv657bX0ZmsJPC9TgHxFNh/Os3SPtkaZPuUr8aaEjv6PyQObY4KiIjRj9Nuhq+bsbzsEKryYCsCbeFUXtDPJfr7svtltmPKKaj9T7uCbwlrSKMznzdnaU0pAZr4iPfkjxFchc5n9zFApKKIVFLZpIwpjQ0JjXrZOM0aU9QZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hsCQ08OMTCt57ojTlBVlHNET6qdDThP/HZhwO0+IHTI=;
 b=icQVKqJKI/J9fOBwuMYeaODq7FA6xvKqCw13oimcEOmbd9JUivNxwoy1oBK2NTyLK24MDYaBhG6hZkeozhTodsTsQHT6rvA5aSrJjU5NwwaWZOrKueAYbcNcgir9xI4+0RB+zpTmQgyGCCajLk1xc7IMPsCby6+Ad4Fy39mF8fM=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by MWHPR10MB1760.namprd10.prod.outlook.com (2603:10b6:301:a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Thu, 2 Dec
 2021 19:09:27 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::143c:ea64:7017:19f]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::143c:ea64:7017:19f%4]) with mapi id 15.20.4755.015; Thu, 2 Dec 2021
 19:09:27 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 06/10] ACPI ERST: build the ACPI ERST table
Date: Thu,  2 Dec 2021 14:08:58 -0500
Message-Id: <1638472142-14396-7-git-send-email-eric.devolder@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1638472142-14396-1-git-send-email-eric.devolder@oracle.com>
References: <1638472142-14396-1-git-send-email-eric.devolder@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0014.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::19) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
Received: from ban25x6uut23.us.oracle.com (138.3.201.23) by
 SJ0PR03CA0014.namprd03.prod.outlook.com (2603:10b6:a03:33a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.16 via Frontend
 Transport; Thu, 2 Dec 2021 19:09:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5dc19392-a4bb-41f0-47d9-08d9b5c742dc
X-MS-TrafficTypeDiagnostic: MWHPR10MB1760:
X-Microsoft-Antispam-PRVS: <MWHPR10MB176035C2913C5ED6C0B91D4497699@MWHPR10MB1760.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wwa8mkBFkPYmv4+G9ZnEOpmh0MeHnMIkaQ9d5iElVbHmOF1J0iQDhEAEBUUe2CZihswSTMjX4PkqFAyMi+ksg+VvWlwlMFZnr3VGirsi5CRod8BUPRozV+CmcXy/rajvDrxzUt+bJbsn6RwKVu4fOY9OgdbTm5xPzYzyI/xOym+WsvMwAB2dmqsv+IxoRHtDb+vIGx+mUjILon0GRboTozeWGReNvhiDX2K2HYbwJ8l9s/kZBeuXp5HhZ9vm7EFCKHIJcEuOMZ5+pPcNbCm8R9fp1XCmqatmWyZUPx37soZweJzuNrSS9pTWmevyhU73326lN5Gf1UfKVtqzQ04SsAVNgujSCL4fnyhWQEOGnydBD8o3SzSUIMbelfMw8DBZCy4rQNxn+exMkKdsREYHjEw41pm5UJ15cZ8YAbFe00+Mf7r2EsykrVryPvDzsNCeoaELgBHzmokiCChy1SWtjV0ObR9lsad8BNYJxiT3qLuWRc2mmplyPb2bPKZ9gAe7bi/Fq6YdQyFu0VNBmIUX48LehmFQw4OeF/47B5eGAHkL6nQVnf6MHBYblLwnCyBj16K2gOvnQq1Ul22KX6J7boCPsJCHrhcU9jVF7ULw8KzMQ31nHVBrQ9sfwYfPErDGW9RIL8Axz2xSpa6nQkCteUYpnuWqDzySEOonBHrITI8kzKVCTP8wSLLe/+2VeNSfSZCTIRPiG3qkAu+Nnx9DCA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6666004)(38100700002)(38350700002)(66556008)(36756003)(316002)(66476007)(66946007)(2906002)(186003)(6486002)(8676002)(6916009)(26005)(5660300002)(83380400001)(107886003)(52116002)(8936002)(508600001)(7696005)(956004)(4326008)(2616005)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?l0TZbE4mVBmG1MVI9pp01DIzWQ/zaqpr+0iHWFVf2I4sPxOiwLlyNAMF375z?=
 =?us-ascii?Q?8g+PB8crrZK2PPXZOGDIg67MgKuAVKFGzPvzAeP4MgNtCTcL+SIMAeXdbcZt?=
 =?us-ascii?Q?M9c0A9aM1Lk9gAUf3IWVUxVU4IuNUle81ImOZmXoUhgsvI3SK7TdPMnX2IgJ?=
 =?us-ascii?Q?BbIfItDaTOZ7HKu8s1V06JoYM/h8xSAtiGYVvtaIP7q5geV4hJnGghynDlUo?=
 =?us-ascii?Q?XAD5M9jmkbd0TIPXt1ce7YpDzfLQloCCpQ5H9DXDDRc7nQdzpUtuFHgY6e0k?=
 =?us-ascii?Q?evc0Gd0ZMXS1QfheY5RZ3UapGXfkGNg/ohdePkR2C6/I/0hshA+T1dnXFVJs?=
 =?us-ascii?Q?LNhjlxqcZMRyiohgChi9yLbZb+Xb19s74ffV5jk097WKg71A38pSWdkW6pYH?=
 =?us-ascii?Q?9Opsh7IaOInvvp4LuQxbWvqMIXdBf8/kC2H7+tJdzsffX9gRPrgyh+XNHoTP?=
 =?us-ascii?Q?hWXUdpOHmoXcdF3gMd0POvHywNAmsmvzFgK2XpuDCTSHkbQo/9ifWB5OyMGr?=
 =?us-ascii?Q?i3/iQP5tgpgL6lQg6fAqBlGhE8eg+AsoqqyfzHHRObU4li29n+IbRNdaVG12?=
 =?us-ascii?Q?zK5wGyHMrpCgLJhpAavA5Iahme4j/CwavA1bPR88W5XhMozp3cR0mDr/sZn+?=
 =?us-ascii?Q?0tuvtGmcMyBPiuSgfHUpRzDlWWuVUp7r2A97rm2OrF2bBArxmXwU8TNGiAFK?=
 =?us-ascii?Q?Bq6Vk8nW4Dz1WJkM6gESADsmXV8EpNs55fyDYtORhN4QkLhpbpPbkplgb0Oq?=
 =?us-ascii?Q?lwvNEsNV44XPifdsKdFzh96/m4ldZe5iLeWzVDqlyP6oEg8BS3F0KeHYKCjo?=
 =?us-ascii?Q?fm5ITcZ+7S4Wu8PWt5jlyXxUcQiVEnlfaCTshxg2QeOB2yKtr56pH0euu0rg?=
 =?us-ascii?Q?6Xi5aSheN2MX8Hww2Oh5K5x+SG3MPt3PXm9rWh3i7XIig8pAsxfReLF5vd+7?=
 =?us-ascii?Q?r78Jbqxg1VWK5NEdcZ+K3YFrv6cx9d6MDb4WBBQeBWfaP7C/pyiigk3fHMVk?=
 =?us-ascii?Q?zhlKevjjcfY1i3nouIGhx4KS6i0UGxA1b1L1muxUvqGwMVLlY6MH4Ay4DY0p?=
 =?us-ascii?Q?faMwdW2EJWXLsglwgjf/N/a0vlSqbeHu0pi16N3pvXTo3KowLfgp4VX+F5CB?=
 =?us-ascii?Q?jK0vW0CJ0nPYR4ZujKDWSaAajNM53lgwIWhEl8LsfibWsOR3Dirr4VanOwPu?=
 =?us-ascii?Q?XAdNK/N5iTQxzQMvKvjrfcLe9IOYpT56INe2YSx9aPnMVX68syJ5f1nhW/g+?=
 =?us-ascii?Q?/9mIQRLtcNCN1s39XjtkxX4IYBzTNuFzt6mmXrj56lSnBCMFpiSQn5pE7aq3?=
 =?us-ascii?Q?D+ZpXtdJ+Tetz9VdTyInHVPcl3PBWWtF3cYmFHBebvzHa+IaOjwpUr4fUtOL?=
 =?us-ascii?Q?5B9iwkoKX4SZLEAB+IeV3VuTzECGZuVlh1Q+O6FwaAhfBN47EXo+O3Uc7BMj?=
 =?us-ascii?Q?UqNgXveWG+ma8ywS4YPdTcEkdD8I+tJlousTjP56YzYYiCG15LLuzRNZsWo0?=
 =?us-ascii?Q?3/E/VU/ZFKayCmMZ+jvZgZ3KEjw4+kpi0mDzflk9wdjYzcxPP0F+dMys/bLz?=
 =?us-ascii?Q?bSChIBPutL5F0lU2qtcSvjLh1bEj69SIgCYqRzt8rJzRCwn5e7pq3AsFXRYS?=
 =?us-ascii?Q?lqoJSfM9fV/n8eGpD7NEuohvfAhCDbgfXE9KE6ZWb+a0TANV3tTs2vi3WTz5?=
 =?us-ascii?Q?cUV/RA=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dc19392-a4bb-41f0-47d9-08d9b5c742dc
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2021 19:09:27.6049 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LqDmZ5kGgfCjGrxLD8MT4MqFfFuV9LYCJyi4LCejG/5ZUpgQi5iB3/MaUXir/lSlSu3NDTndeRpwbuOXvebYm6zZA06peFev+EeYLQe+sSY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1760
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10185
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxlogscore=999
 phishscore=0 suspectscore=0 spamscore=0 adultscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112020121
X-Proofpoint-ORIG-GUID: De5PMlFXA0C64KSJekNcwrevSMsQ9yA_
X-Proofpoint-GUID: De5PMlFXA0C64KSJekNcwrevSMsQ9yA_
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

This builds the ACPI ERST table to inform OSPM how to communicate
with the acpi-erst device.

Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
---
 hw/acpi/erst.c | 241 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 241 insertions(+)

diff --git a/hw/acpi/erst.c b/hw/acpi/erst.c
index 4304f55..06a87af 100644
--- a/hw/acpi/erst.c
+++ b/hw/acpi/erst.c
@@ -701,6 +701,247 @@ static const MemoryRegionOps erst_reg_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
+
+/*******************************************************************/
+/*******************************************************************/
+
+/* ACPI 4.0: Table 17-19 Serialization Instructions */
+#define INST_READ_REGISTER                 0x00
+#define INST_READ_REGISTER_VALUE           0x01
+#define INST_WRITE_REGISTER                0x02
+#define INST_WRITE_REGISTER_VALUE          0x03
+#define INST_NOOP                          0x04
+#define INST_LOAD_VAR1                     0x05
+#define INST_LOAD_VAR2                     0x06
+#define INST_STORE_VAR1                    0x07
+#define INST_ADD                           0x08
+#define INST_SUBTRACT                      0x09
+#define INST_ADD_VALUE                     0x0A
+#define INST_SUBTRACT_VALUE                0x0B
+#define INST_STALL                         0x0C
+#define INST_STALL_WHILE_TRUE              0x0D
+#define INST_SKIP_NEXT_INSTRUCTION_IF_TRUE 0x0E
+#define INST_GOTO                          0x0F
+#define INST_SET_SRC_ADDRESS_BASE          0x10
+#define INST_SET_DST_ADDRESS_BASE          0x11
+#define INST_MOVE_DATA                     0x12
+
+/* ACPI 4.0: 17.4.1.2 Serialization Instruction Entries */
+static void build_serialization_instruction_entry(GArray *table_data,
+    uint8_t serialization_action,
+    uint8_t instruction,
+    uint8_t flags,
+    uint8_t register_bit_width,
+    uint64_t register_address,
+    uint64_t value,
+    uint64_t mask)
+{
+    /* ACPI 4.0: Table 17-18 Serialization Instruction Entry */
+    struct AcpiGenericAddress gas;
+
+    /* Serialization Action */
+    build_append_int_noprefix(table_data, serialization_action, 1);
+    /* Instruction */
+    build_append_int_noprefix(table_data, instruction         , 1);
+    /* Flags */
+    build_append_int_noprefix(table_data, flags               , 1);
+    /* Reserved */
+    build_append_int_noprefix(table_data, 0                   , 1);
+    /* Register Region */
+    gas.space_id = AML_SYSTEM_MEMORY;
+    gas.bit_width = register_bit_width;
+    gas.bit_offset = 0;
+    switch (register_bit_width) {
+    case 8:
+        gas.access_width = 1;
+        break;
+    case 16:
+        gas.access_width = 2;
+        break;
+    case 32:
+        gas.access_width = 3;
+        break;
+    case 64:
+        gas.access_width = 4;
+        break;
+    default:
+        gas.access_width = 0;
+        break;
+    }
+    gas.address = register_address;
+    build_append_gas_from_struct(table_data, &gas);
+    /* Value */
+    build_append_int_noprefix(table_data, value  , 8);
+    /* Mask */
+    build_append_int_noprefix(table_data, mask   , 8);
+}
+
+/* ACPI 4.0: 17.4.1 Serialization Action Table */
+void build_erst(GArray *table_data, BIOSLinker *linker, Object *erst_dev,
+    const char *oem_id, const char *oem_table_id)
+{
+    GArray *table_instruction_data;
+    unsigned action;
+    hwaddr bar0, bar1;
+    AcpiTable table = { .sig = "ERST", .rev = 1, .oem_id = oem_id,
+                        .oem_table_id = oem_table_id };
+
+    bar0 = (hwaddr)pci_get_bar_addr(PCI_DEVICE(erst_dev), 0);
+    trace_acpi_erst_pci_bar_0(bar0);
+    bar1 = (hwaddr)pci_get_bar_addr(PCI_DEVICE(erst_dev), 1);
+    trace_acpi_erst_pci_bar_1(bar1);
+
+#define MASK8  0x00000000000000FFUL
+#define MASK16 0x000000000000FFFFUL
+#define MASK32 0x00000000FFFFFFFFUL
+#define MASK64 0xFFFFFFFFFFFFFFFFUL
+
+    /*
+     * Serialization Action Table
+     * The serialization action table must be generated first
+     * so that its size can be known in order to populate the
+     * Instruction Entry Count field.
+     */
+    table_instruction_data = g_array_new(FALSE, FALSE, sizeof(char));
+
+    /* Serialization Instruction Entries */
+    action = ACTION_BEGIN_WRITE_OPERATION;
+    build_serialization_instruction_entry(table_instruction_data,
+        action, INST_WRITE_REGISTER_VALUE, 0, 32,
+        bar0 + ERST_ACTION_OFFSET, action, MASK8);
+
+    action = ACTION_BEGIN_READ_OPERATION;
+    build_serialization_instruction_entry(table_instruction_data,
+        action, INST_WRITE_REGISTER_VALUE, 0, 32,
+        bar0 + ERST_ACTION_OFFSET, action, MASK8);
+
+    action = ACTION_BEGIN_CLEAR_OPERATION;
+    build_serialization_instruction_entry(table_instruction_data,
+        action, INST_WRITE_REGISTER_VALUE, 0, 32,
+        bar0 + ERST_ACTION_OFFSET, action, MASK8);
+
+    action = ACTION_END_OPERATION;
+    build_serialization_instruction_entry(table_instruction_data,
+        action, INST_WRITE_REGISTER_VALUE, 0, 32,
+        bar0 + ERST_ACTION_OFFSET, action, MASK8);
+
+    action = ACTION_SET_RECORD_OFFSET;
+    build_serialization_instruction_entry(table_instruction_data,
+        action, INST_WRITE_REGISTER      , 0, 32,
+        bar0 + ERST_VALUE_OFFSET , 0, MASK32);
+    build_serialization_instruction_entry(table_instruction_data,
+        action, INST_WRITE_REGISTER_VALUE, 0, 32,
+        bar0 + ERST_ACTION_OFFSET, action, MASK8);
+
+    action = ACTION_EXECUTE_OPERATION;
+    build_serialization_instruction_entry(table_instruction_data,
+        action, INST_WRITE_REGISTER_VALUE, 0, 32,
+        bar0 + ERST_VALUE_OFFSET , ERST_EXECUTE_OPERATION_MAGIC, MASK8);
+    build_serialization_instruction_entry(table_instruction_data,
+        action, INST_WRITE_REGISTER_VALUE, 0, 32,
+        bar0 + ERST_ACTION_OFFSET, action, MASK8);
+
+    action = ACTION_CHECK_BUSY_STATUS;
+    build_serialization_instruction_entry(table_instruction_data,
+        action, INST_WRITE_REGISTER_VALUE, 0, 32,
+        bar0 + ERST_ACTION_OFFSET, action, MASK8);
+    build_serialization_instruction_entry(table_instruction_data,
+        action, INST_READ_REGISTER_VALUE , 0, 32,
+        bar0 + ERST_VALUE_OFFSET, 0x01, MASK8);
+
+    action = ACTION_GET_COMMAND_STATUS;
+    build_serialization_instruction_entry(table_instruction_data,
+        action, INST_WRITE_REGISTER_VALUE, 0, 32,
+        bar0 + ERST_ACTION_OFFSET, action, MASK8);
+    build_serialization_instruction_entry(table_instruction_data,
+        action, INST_READ_REGISTER       , 0, 32,
+        bar0 + ERST_VALUE_OFFSET, 0, MASK8);
+
+    action = ACTION_GET_RECORD_IDENTIFIER;
+    build_serialization_instruction_entry(table_instruction_data,
+        action, INST_WRITE_REGISTER_VALUE, 0, 32,
+        bar0 + ERST_ACTION_OFFSET, action, MASK8);
+    build_serialization_instruction_entry(table_instruction_data,
+        action, INST_READ_REGISTER       , 0, 64,
+        bar0 + ERST_VALUE_OFFSET, 0, MASK64);
+
+    action = ACTION_SET_RECORD_IDENTIFIER;
+    build_serialization_instruction_entry(table_instruction_data,
+        action, INST_WRITE_REGISTER      , 0, 64,
+        bar0 + ERST_VALUE_OFFSET , 0, MASK64);
+    build_serialization_instruction_entry(table_instruction_data,
+        action, INST_WRITE_REGISTER_VALUE, 0, 32,
+        bar0 + ERST_ACTION_OFFSET, action, MASK8);
+
+    action = ACTION_GET_RECORD_COUNT;
+    build_serialization_instruction_entry(table_instruction_data,
+        action, INST_WRITE_REGISTER_VALUE, 0, 32,
+        bar0 + ERST_ACTION_OFFSET, action, MASK8);
+    build_serialization_instruction_entry(table_instruction_data,
+        action, INST_READ_REGISTER       , 0, 32,
+        bar0 + ERST_VALUE_OFFSET, 0, MASK32);
+
+    action = ACTION_BEGIN_DUMMY_WRITE_OPERATION;
+    build_serialization_instruction_entry(table_instruction_data,
+        action, INST_WRITE_REGISTER_VALUE, 0, 32,
+        bar0 + ERST_ACTION_OFFSET, action, MASK8);
+
+    action = ACTION_GET_ERROR_LOG_ADDRESS_RANGE;
+    build_serialization_instruction_entry(table_instruction_data,
+        action, INST_WRITE_REGISTER_VALUE, 0, 32,
+        bar0 + ERST_ACTION_OFFSET, action, MASK8);
+    build_serialization_instruction_entry(table_instruction_data,
+        action, INST_READ_REGISTER       , 0, 64,
+        bar0 + ERST_VALUE_OFFSET, 0, MASK64);
+
+    action = ACTION_GET_ERROR_LOG_ADDRESS_LENGTH;
+    build_serialization_instruction_entry(table_instruction_data,
+        action, INST_WRITE_REGISTER_VALUE, 0, 32,
+        bar0 + ERST_ACTION_OFFSET, action, MASK8);
+    build_serialization_instruction_entry(table_instruction_data,
+        action, INST_READ_REGISTER       , 0, 64,
+        bar0 + ERST_VALUE_OFFSET, 0, MASK32);
+
+    action = ACTION_GET_ERROR_LOG_ADDRESS_RANGE_ATTRIBUTES;
+    build_serialization_instruction_entry(table_instruction_data,
+        action, INST_WRITE_REGISTER_VALUE, 0, 32,
+        bar0 + ERST_ACTION_OFFSET, action, MASK8);
+    build_serialization_instruction_entry(table_instruction_data,
+        action, INST_READ_REGISTER       , 0, 32,
+        bar0 + ERST_VALUE_OFFSET, 0, MASK32);
+
+    action = ACTION_GET_EXECUTE_OPERATION_TIMINGS;
+    build_serialization_instruction_entry(table_instruction_data,
+        action, INST_WRITE_REGISTER_VALUE, 0, 32,
+        bar0 + ERST_ACTION_OFFSET, action, MASK8);
+    build_serialization_instruction_entry(table_instruction_data,
+        action, INST_READ_REGISTER       , 0, 64,
+        bar0 + ERST_VALUE_OFFSET, 0, MASK64);
+
+    /* Serialization Header */
+    acpi_table_begin(&table, table_data);
+
+    /* Serialization Header Size */
+    build_append_int_noprefix(table_data, 48, 4);
+
+    /* Reserved */
+    build_append_int_noprefix(table_data,  0, 4);
+
+    /*
+     * Instruction Entry Count
+     * Each instruction entry is 32 bytes
+     */
+    build_append_int_noprefix(table_data,
+        (table_instruction_data->len / 32), 4);
+
+    /* Serialization Instruction Entries */
+    g_array_append_vals(table_data, table_instruction_data->data,
+        table_instruction_data->len);
+    g_array_free(table_instruction_data, TRUE);
+
+    acpi_table_end(linker, &table);
+}
+
 /*******************************************************************/
 /*******************************************************************/
 static int erst_post_load(void *opaque, int version_id)
-- 
1.8.3.1


