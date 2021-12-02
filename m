Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA14A466A52
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 20:17:24 +0100 (CET)
Received: from localhost ([::1]:43128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msra7-00083p-Sv
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 14:17:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1msrT1-0007VH-C9
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 14:10:03 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:17978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1msrSy-0006OV-MO
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 14:10:02 -0500
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B2J2Yud020374; 
 Thu, 2 Dec 2021 19:09:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=hue1FbAQNu+6fNtHW6xreW4UF9J/jJW7uHhvWwkmuQk=;
 b=wqeXmH6SlDdCVFt0TJvCeXkzzrGmzj/BpH2tH/tXj/zUwsYrf0EymiIkxSULxs+03rlP
 klGv0QiTQ3tk8F93qy2gKdkF/URMVZCaD+CqGs7NXTnlxhgF5/bKu9jwXPSxKDB1kadG
 C66S7FfJQ0xGTr2Y5ilJ8R6V/SNhMhb/EQWWVyPachxfHxH1ZvsFhoWmBJ2k+4H5+CPI
 BcRfoImvmr7UtOhwEV8jXtUaYX2em976jkBJO2J+1ZzN9MTo7eBfPJNTUWlinIdi/MrQ
 GD+bDPKk3oUgmO2zC9FZUXvnhqwWo7U0hqjkfKxbU3oYpoN20L8V4G5ymNhcHPPNT/tp 4w== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3cp9r5a8tx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 02 Dec 2021 19:09:56 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1B2IoP4I115582;
 Thu, 2 Dec 2021 19:09:34 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com
 (mail-bn1nam07lp2048.outbound.protection.outlook.com [104.47.51.48])
 by userp3020.oracle.com with ESMTP id 3cke4urwd9-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 02 Dec 2021 19:09:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i63AHNCWBslZ+PNjsGcDrcYNcUpTavsRTeJe5NJqRncQ3sVSGIfNzKHZpmHCso2mY2ikc0aVlOrmZka3J/RT29fGhFILM2Ix6oO9gXA39MIIFKSiVw57URhXYC3fUWNKwNyy8OWs6Bj3VNwUMIDl4AxDQB9lGDp1e1eqzjHjphIWAR4gEteEM7CxVVd6xWc0mTEo8IXPsg/yZXU5uNn5eQ9xwZEqdLvv5jBgKZRqUx+ksTuuy/nvagw//+/SG3Uvj1Z0Clb9a16h1pP7MrNMlg4vyzJ/nreYPlAYkDNTtZUzo+YrzwZqQNl/u2htxesQhSn0XZxjA2W7pCSn4LqEwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hue1FbAQNu+6fNtHW6xreW4UF9J/jJW7uHhvWwkmuQk=;
 b=hrimXqcnxskqRO+6/fHmGY5VEomNCsLmamaufK7laciDyGPmBsfSDPRBVvh3FE87EBYe6F2Pq4EmbBlOEfcqjIo/FTTcluZtSQoruD39XHpkfL10PrQl+qoctkD1gEip/NE1Lep5/sotw+xZMSVUbKUfFwc6U7Lig6OzgZyaRIdjTIZzyMsf+aFxWpekbK4GC6vJDsTpbrfN+J9Sw3ZmmM7apujRo6V5ZFad1m0UGjoClN7J00OadqTA3+6V4mf5SD1hZSlOoYMAGrK3ZD1RX1KMNpzFATnt8KM/NopqmGDL/KtEPgjisbHUVwbs/vgb26Pndb9oLtt7ahr2Zi5BuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hue1FbAQNu+6fNtHW6xreW4UF9J/jJW7uHhvWwkmuQk=;
 b=aedbL0AKzrABlmkyXc5BjJwG+Xp/XSp+6rzMfhltOhQEZutlSXZfXqyD60ROY3mIsEMMSsKdQWKDbckAz+TvcrpsxsEhYtNu2P2HtQvzE8paT4+LXGSipSu4SY6pT5pVq7VQgu5pff0sQLpLM3svnnz+74wmm8DFx3gcZTEbzr0=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by MWHPR10MB1760.namprd10.prod.outlook.com (2603:10b6:301:a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Thu, 2 Dec
 2021 19:09:33 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::143c:ea64:7017:19f]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::143c:ea64:7017:19f%4]) with mapi id 15.20.4755.015; Thu, 2 Dec 2021
 19:09:33 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 09/10] ACPI ERST: bios-tables-test testcase
Date: Thu,  2 Dec 2021 14:09:01 -0500
Message-Id: <1638472142-14396-10-git-send-email-eric.devolder@oracle.com>
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
 Transport; Thu, 2 Dec 2021 19:09:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0cf2cd2e-3eae-4e90-2f69-08d9b5c74639
X-MS-TrafficTypeDiagnostic: MWHPR10MB1760:
X-Microsoft-Antispam-PRVS: <MWHPR10MB1760E9D43003BE6EAA22BD2197699@MWHPR10MB1760.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:415;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fiAvkfzIdCoRWsO7gSlA8pnqGHKS96snYdDTaRd4xioKDv4ueLpIDi2VBuxXKFu0TgeRyu9hn23jYSWUSkCJ4aZrl+SuloiStbB5j580Onb5TjDIsV3ZJjtNzMxvNL/7m6ypMBHkt7EcPF5qaGZI0mc3goqaSlX2V949ru+dWJeHM8SMkceo3DgFJTe3ybuLP/YLCrF0PJ0WhPdUX7duAHwJbBVdRN56Jglz/pk+tqh14B4P7ZTbShL+0EtstMSUaxZrY3har9fCCQd8UnVT9qCgKYfSBvjSgxyfHAsqJzzzb0XASngJUAbeRiHbA9NNp4Z55MFd/7UTJny7RWPVdB+IR6Z66RV8z0MzTUqouhIGMPA9QrojIlzbUu45CrKxwGX06RVVCsw0pSjRmqp9bZeGPTKRkN5qq5eL2XxmNqON0CeI7IPs2iLEdzKPktJ2z/994YGm0KyLBQur7SmFkYyxLrcxsktvU8oKR2EDm9lHoj/KaUUcYSC5AXvNK8vCluMkqNXInhPNqj8fUW1Exut9boa6XW862ROZ8GqntKeIgsI43PIpmFehXllx+9Pg3jgses1tC4IJ1peyRxleBQm5da3v81Yrq6eX1hjP0fkKK0GRCqkky9z3rIJviHsG2hCFXOHt1NbplhP4sKKf7Ua5tjZ+LF9TE3ljRkH00jSUdquXR2NVaaJArPuYkb4W9zJB6GRMlcCPbW9NdAR5YQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6666004)(38100700002)(38350700002)(66556008)(36756003)(316002)(66476007)(66946007)(2906002)(186003)(6486002)(8676002)(6916009)(26005)(5660300002)(107886003)(52116002)(8936002)(508600001)(7696005)(956004)(4326008)(2616005)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FKDxZh68gZwz93jDdOB1vyreDl6s1Ch9YmBtbWH8aWr29H4KD+Zn1My+U2kK?=
 =?us-ascii?Q?DEgW9tu1jkeBAgTuSQnoWZv8ImPj6xV90iKbe/mRh9OhJlMw1tm3x04Ynk4g?=
 =?us-ascii?Q?ybeSjyb6WQv/D0mK5SjZh9VbaiJz0eUKvGr4RFBqzO0R84nCen9x/4Aol9qa?=
 =?us-ascii?Q?r0UC/uf+9TG15CC6K+fq0rCZ/SrV1Hl/19n1HLH0IuJxpNBAoKXaOeZbqPK6?=
 =?us-ascii?Q?Umh8sMqRqWTe+EdZl1wlg11rnqhgFgWUSjoQfyFkmqiZWWP3EYATybsG08sk?=
 =?us-ascii?Q?eqomdA7V9ZXRGq/EfdhaY1jTdu9gtu3ESZuqadR8Xnz99Enxmw/9ZNJSfvYg?=
 =?us-ascii?Q?rfHmuFaGjy17iGZyXWgyW60mYszMqI3vi4tEGHzPrbHvv471tCgc+a3SnzNs?=
 =?us-ascii?Q?aG2pEEaPNZcDEico0nvM3LqGi2SA9rSl9xhfllPFRPep4cf2bzkeoY6qTM+L?=
 =?us-ascii?Q?nyMcfpisdJHbvevePt5OT1VTuXY5hRx59T0on5pkD8TVaJxR/1Vx8GbcP9Dv?=
 =?us-ascii?Q?WSP/kJGxn84JmtOnmjaddA1aPeFSihWVd+Z6LHiBZC9rVlnG4Y7IavrOncUn?=
 =?us-ascii?Q?DSOp8MRHPjIUI/Du5PVpvExk6sd3RZi7XDkW7FIYrUVLhxNfsCNkptGvMFD/?=
 =?us-ascii?Q?FpycTrzdfREcrDW0iPNoPKkRCHDpGr5JrdJHfXVEC4QXmNj35Hs5BgMl4E5h?=
 =?us-ascii?Q?qGsJf5bqpGS57mA3ymoMdrHnuifpqy1b3QGSjs8sibffIonh+x7GD8iH1Btv?=
 =?us-ascii?Q?E8FBOb93eAiTKeZsxET2le6g1LdG7QMpR7mGnsgR3AhhRnqktKKzw5lYmNRL?=
 =?us-ascii?Q?w2f6n+OJ/qH8JFy754Obo/Nlvu+yS9sFWw3/j1gdHg+6s3GrQbWalTpV1Y/Q?=
 =?us-ascii?Q?Lc62Y3nhFa0fq0XZSPcYV0wl4PEx4tVL7dBpuupPAabhBUMJARlfDuhCOTGI?=
 =?us-ascii?Q?r3eh3xf2kOpBWF7LkXb6KQcNDDTT0UUH/cxN7SvhmI8lXIMD2KxmY/PqpJAM?=
 =?us-ascii?Q?mWh1vwWeyLNnNkAy1J6Fsniyti8bvaNSB9uTnr5BQcMkXKiddrV8UyjA0j8f?=
 =?us-ascii?Q?+FXX0DVxqZDlPGS+V3R5JgCXfsd3kaO5n3MZ4uMaXeY09LRZ09RHjxwCnxCJ?=
 =?us-ascii?Q?p+SKJnLnCwFZXuVa5ElK2zunOWxdytsmELxTjKIHpGVmwMp2iitm2BbnQwY5?=
 =?us-ascii?Q?2A3HCbQJ9eKXb6Jm2Zh9T8QncSVwScrgiyj2w40GGCf4XnFGjtGD30pQ5yxb?=
 =?us-ascii?Q?516tJeDE9GOQtEmK+5a3Q6LmikiWEjNvR+nQmFlYFN9WaeplfJyi1SIzq5U+?=
 =?us-ascii?Q?yorRdaLxUhggy8GFqPNSQC4icioXs4lO/hC91514aMJXoprrK+TwD9l/My2h?=
 =?us-ascii?Q?cMOnRKKOAnFaxHkAJYiOHg/8LTjqm1dqjq/QIj9CGDnE/BQmsRkzmCByuOh+?=
 =?us-ascii?Q?aO4csYp5f7UQQYQaDnwpKilzVUbK0eMnZTx82tEcfACpQtHE7Jsu5abIZ41y?=
 =?us-ascii?Q?ADyfaJQYp0/Qko2ynIh9N+mfjCdNU+9d/QDjQOQs2cnYXqDXm4DPIrjwVh9f?=
 =?us-ascii?Q?azqiMGm1HZwQoTFJeOhdtn7HY5frSl38LxNaDMDWsZhSwL5MeX+ePsBmf+xy?=
 =?us-ascii?Q?z1bn/7TgODIkMNE2HC/MOr8rHYOSege/DGWUnaszhCqqltwQ2SIrmhuKb8xC?=
 =?us-ascii?Q?5K/Zpw=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cf2cd2e-3eae-4e90-2f69-08d9b5c74639
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2021 19:09:33.2797 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tnU1Sf7FeJzt6jZhRPjj5vjejDOE0b9/HrxApERKEB4bHgDePv8VBS+Y+jvdF0vPwZOzakGkhADcHrSH+N7zKSGiQgyvApGVoKeaE0MSuMs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1760
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10185
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxlogscore=984
 phishscore=0 suspectscore=0 spamscore=0 adultscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112020121
X-Proofpoint-ORIG-GUID: TYbAeKKTzKpVTBZhZrG7goyGsotJyusy
X-Proofpoint-GUID: TYbAeKKTzKpVTBZhZrG7goyGsotJyusy
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

This change implements the test suite checks for the ERST table.

Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
---
 tests/qtest/bios-tables-test.c | 56 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 2588741..2f073e6 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -1446,6 +1446,57 @@ static void test_acpi_piix4_tcg_acpi_hmat(void)
     test_acpi_tcg_acpi_hmat(MACHINE_PC);
 }
 
+static void test_acpi_erst(const char *machine)
+{
+    gchar *tmp_path = g_dir_make_tmp("qemu-test-erst.XXXXXX", NULL);
+    gchar *params;
+    test_data data;
+
+    memset(&data, 0, sizeof(data));
+    data.machine = machine;
+    data.variant = ".acpierst";
+    params = g_strdup_printf(
+        " -object memory-backend-file,id=erstnvram,"
+            "mem-path=%s,size=0x10000,share=on"
+        " -device acpi-erst,memdev=erstnvram", tmp_path);
+    test_acpi_one(params, &data);
+    free_test_data(&data);
+    g_free(params);
+    g_assert(g_rmdir(tmp_path) == 0);
+    g_free(tmp_path);
+}
+
+static void test_acpi_piix4_acpi_erst(void)
+{
+    test_acpi_erst(MACHINE_PC);
+}
+
+static void test_acpi_q35_acpi_erst(void)
+{
+    test_acpi_erst(MACHINE_Q35);
+}
+
+static void test_acpi_microvm_acpi_erst(void)
+{
+    gchar *tmp_path = g_dir_make_tmp("qemu-test-erst.XXXXXX", NULL);
+    gchar *params;
+    test_data data;
+
+    test_acpi_microvm_prepare(&data);
+    data.variant = ".pcie";
+    data.tcg_only = true; /* need constant host-phys-bits */
+    params = g_strdup_printf(" -machine microvm,"
+        "acpi=on,ioapic2=off,rtc=off,pcie=on"
+        " -object memory-backend-file,id=erstnvram,"
+           "mem-path=%s,size=0x10000,share=on"
+        " -device acpi-erst,memdev=erstnvram", tmp_path);
+    test_acpi_one(params, &data);
+    g_free(params);
+    g_assert(g_rmdir(tmp_path) == 0);
+    g_free(tmp_path);
+    free_test_data(&data);
+}
+
 static void test_acpi_virt_tcg(void)
 {
     test_data data = {
@@ -1624,6 +1675,8 @@ int main(int argc, char *argv[])
         qtest_add_func("acpi/q35/dimmpxm", test_acpi_q35_tcg_dimm_pxm);
         qtest_add_func("acpi/piix4/acpihmat", test_acpi_piix4_tcg_acpi_hmat);
         qtest_add_func("acpi/q35/acpihmat", test_acpi_q35_tcg_acpi_hmat);
+        qtest_add_func("acpi/piix4/acpierst", test_acpi_piix4_acpi_erst);
+        qtest_add_func("acpi/q35/acpierst", test_acpi_q35_acpi_erst);
         qtest_add_func("acpi/microvm", test_acpi_microvm_tcg);
         qtest_add_func("acpi/microvm/usb", test_acpi_microvm_usb_tcg);
         qtest_add_func("acpi/microvm/rtc", test_acpi_microvm_rtc_tcg);
@@ -1639,6 +1692,9 @@ int main(int argc, char *argv[])
             qtest_add_func("acpi/q35/kvm/xapic", test_acpi_q35_kvm_xapic);
             qtest_add_func("acpi/q35/kvm/dmar", test_acpi_q35_kvm_dmar);
         }
+        if (strcmp(arch, "x86_64") == 0) {
+            qtest_add_func("acpi/microvm/acpierst", test_acpi_microvm_acpi_erst);
+        }
     } else if (strcmp(arch, "aarch64") == 0) {
         if (has_tcg) {
             qtest_add_func("acpi/virt", test_acpi_virt_tcg);
-- 
1.8.3.1


