Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9898475CEF
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 17:11:37 +0100 (CET)
Received: from localhost ([::1]:36036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxWsR-0001uA-OA
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 11:11:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mxWMs-0000vG-IX
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 10:38:58 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:45004)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mxWMn-0000V2-PB
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 10:38:58 -0500
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BFEMpfc023149; 
 Wed, 15 Dec 2021 15:38:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=SfvJCp/7ima11pfl07B0iZGcklh+t4Q1+Pxy6cp8HDE=;
 b=wqmULjWykxyru8/uNJbfIa6cBHgD5WqxUtvNr1eAh8H/If6FXDzwHqI4oXEyvRWYDBtF
 csPTZowhdmvHBLsS94Q7lfeDtC5obijkW3GLWMlA2U5Mc43/S0lSSc4MlZUe+U2kqgeD
 XzSwaqhNPhyBP8JsLuLZFnUF9JWNOBqI+fqiHqnWDK+n/XuccTS5QCEWnu63EwWZrGSx
 AX8uWinRlFbj2Xj6/iFo30Z199Lwp4pcuWXk98KvDVdMy16kFohRoCWR0rh3dRf/9gC/
 gSM1X7nPd6UsKnRKJvySb3RxRmlnt2FU/sWBKtXPT3okM+64wRj9gibqYuGP4ZNb/tIn Ug== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3cx3py77eu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Dec 2021 15:38:49 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1BFFVi2o127809;
 Wed, 15 Dec 2021 15:38:47 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2100.outbound.protection.outlook.com [104.47.70.100])
 by userp3020.oracle.com with ESMTP id 3cvnes2g32-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Dec 2021 15:38:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JQhIdzTnO4DfelvN5a5FHmrbQlLYmuRop/5PZr64qDVW3D8TKUBJZQmtCNZ5nq7uJZbw6CU4jsfjKw5ygS+x+Ql+7zqtcosVvfnDvafRIb1mRryHMS4HSbg6OZ25twapE4peSmTUk6g5QdJPHBnJPtgf0Bi04mrM4cA3ciiCGUExVvX4PapoWdumjijZtVRJZ3obcs715oQ42V3i7wwMA2cWi4dQbLVMt5W5IU8OXObp9SkuBgYmuSDn0bgBCepmyMnZeYFkGGALUm1a50eKoYcLJIFgT3FNht8AWVBfvei+wWMbfeOwWvR58tdU8C047052lsTmk7LjV6muKQznkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SfvJCp/7ima11pfl07B0iZGcklh+t4Q1+Pxy6cp8HDE=;
 b=QqIvFdzwwowtTLutoxj0lOoHUrTHuKLiUB+xYp6wVRge32KM70oMpLYzj3UdFwtViFsvEXgdqEiepR56MsSFVj1Mt1q5OJ3mKgJ7X199X+KfQQ9375KuncS+wATu+Wmd5JzgRTXH1VO/BVbHomOKuDkk5aoN9MJcOEWEvaqjeO1NEl9736TUg6Z/DWqLpXSEAO6HGoeteaEophJHI7tBztUUlQKOJWYCKXl6THu32M93ivsBUI1zXR4uIVuktCMHhE7PSaOE+sBARRLDLtaXwhml2eGQnWEUEBdF50GYTFCJg2wpMh/SJENB7gf6bWFhsLG0xIOlwV1HjGJTqY1r3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SfvJCp/7ima11pfl07B0iZGcklh+t4Q1+Pxy6cp8HDE=;
 b=KLOrVGHRCIsG64cSEZaxCSWjacL1IjDVvEYUwDNtgipqBDAPiHpEI9UNGDlRVPOVP7t9EWFyg7vn3QYycz7eH3R5W832Yi+fLG4nvyZukbIQtXZUnwgsmV9JmkqiL8QvK1MH5lxU3G/7ABXagz1PnveYwYXkQIumi7w8X5LkIXc=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by MWHPR1001MB2349.namprd10.prod.outlook.com (2603:10b6:301:30::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Wed, 15 Dec
 2021 15:38:45 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::143c:ea64:7017:19f]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::143c:ea64:7017:19f%4]) with mapi id 15.20.4778.018; Wed, 15 Dec 2021
 15:38:45 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v11 09/10] ACPI ERST: bios-tables-test testcase
Date: Wed, 15 Dec 2021 10:38:14 -0500
Message-Id: <1639582695-7328-10-git-send-email-eric.devolder@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1639582695-7328-1-git-send-email-eric.devolder@oracle.com>
References: <1639582695-7328-1-git-send-email-eric.devolder@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SN1PR12CA0073.namprd12.prod.outlook.com
 (2603:10b6:802:20::44) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 123fdd61-05a6-4f04-242d-08d9bfe0fad0
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2349:EE_
X-Microsoft-Antispam-PRVS: <MWHPR1001MB2349E95D04ED56724041755A97769@MWHPR1001MB2349.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:415;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IPbxH0xW3TeGBqkin9Q7ox46gLIAjSzp7XC1y9qDP9JIOIneFQMdxWuPmtG2ukSgxDK8rbly1L1wJ1X6A2Qyf9Ii4b+1MgEWq1UStxMY+ssVItTx8SWQyuFCPqE+vN3HN25PJfBfnkT34vBb+80ZPUE1PNdVnqvNvAPNKbnd78/sti1QIcwScdfl+kekOIKg9cUNtrBdllKzL6lpZS6bZOX7MlJI85Sj8hT7Ckcjkjj0ceDePmGsZLZbgEog5NVOA+rBhy01YsP7FJFOJL33aljQ2gsNcarVGm+pKzDgxBGPXhqwviCOSjMRb5PAQGEV8zHNTfOT6sPuQrWwnNvxRzflKeiifm3xs9eIY5vTTUKnHmULKFElGHSaBSLiFgwNHGLevIX3CwVKHwKaahEjMW0fugkyNLGX6E47jUdP7uTYzwQrzYJqsJ14mdxbc6RbuEnr/SKn+9epDGnqo+OaBpogzDfGWixWbAwV22igbT9QbsXQOe1sT1PZqVohHv64sXGplHEzgKTAVb09jHFxit6iy5mOyakiFOAAPLbUk0NSODmVLjE3DmaA5BHvBYLDhxd4f89cdPqCzBI7nwb6lRGW/vq2S26gARjL4z/544q4svEi9f6BgIRyyoLnDS5luSmqQkO0CT9ZL9/0uaW51uT2nh9vaeAJoiOTQF+Xbwq0S9n7i/ONFewEPBGMY0hM+QaxWEThHU6VrhEsdn5sPQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(86362001)(6666004)(6506007)(6512007)(2616005)(6916009)(66476007)(66556008)(5660300002)(66946007)(2906002)(36756003)(8936002)(52116002)(107886003)(316002)(4326008)(38350700002)(38100700002)(8676002)(508600001)(26005)(6486002)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eOHuQpL/vm2wUo1qL2OvjJ1SJ9kQADnlki3Qo69u4OKyzFaWhGR7Wy/UMZ0O?=
 =?us-ascii?Q?R08LhinD0AZ7rp2r8bP68NMf1pkVZT5jp17I551MCiYiipb2jJCXNk00ZkJL?=
 =?us-ascii?Q?GAbowavT+rJKxOuPCxRhhsSeDLEG0yrGG3WJJLY6M6ofZ+bPH5u6a1Bqih/d?=
 =?us-ascii?Q?PF7cof/4Ke5mlHmwzz97FBbKmKLgjJmwTSDWB2pOjujpMumXB3LoNvHCYImv?=
 =?us-ascii?Q?XgbM96y3P1srkvru+7jglfIrtwEZUuOSreyRj3WJS+rARNcM5CEBG50F3nx5?=
 =?us-ascii?Q?cPEn2458bJLXd5UIzjrTWO0OkDs/hphBRmdhRwSgpT8ZEuANIOEy1HsUQkpr?=
 =?us-ascii?Q?Khdq4LA4w5yNqlWhUYz8LbKTmjDMWWUIOdijy/PoYs5ovxr0wVYEar/FikfQ?=
 =?us-ascii?Q?jQbxGhwoOGF1I6OXtNy1rM5wZzTQEwZxVexw8Yx0DRYL+oqu2ISzk/iEEKdC?=
 =?us-ascii?Q?nGVbIkNxk8pbv50gY6ot055J5T6BX+rEQig++ECbKH6UG+vDF7lBHe7TIOK0?=
 =?us-ascii?Q?DTkFAXiN9rtqkBhaIls2uZgXccUFTfReK3W8szCCkiKlMh3PrR3+YsQSW/mt?=
 =?us-ascii?Q?NRO40Im19qO6kTdQ4PuOKuN4vFQJhi+hBz456tSw1NEz/XulIf7jeh833XtN?=
 =?us-ascii?Q?Ur2oTeGhCm8a532WGKLB3KukB8bKCjTlWd+7wMmIQmOsl/l421/lIiPXA/D2?=
 =?us-ascii?Q?ci3LVUo6ZNS4RLPMz5dpsj/2wOQNtU3N7R8uo/SUHYnsgG8wuEqFQ8GqBZq+?=
 =?us-ascii?Q?wchorWaLeD4DhHLsRJpF26jB6jytu+isrS9yxGDzfRy8H+HWXGA9ltpgIL07?=
 =?us-ascii?Q?MKx/lr2fPSCOAbtQQHISaIWUX5nWhx1bCbTCu2OvXiSH8HlrnzQJm+N1IiKg?=
 =?us-ascii?Q?1ENN6kphkhoL/JfcIT1hjYzEQHHK4as2fzZNgHl7ZZ9p5LwY+ekvX2fk34ip?=
 =?us-ascii?Q?Rh2SW1h7kGwUF6iZ8aksM4iJJ2gmGlggvndMd3NguOOakGXsLYui1gGISfiQ?=
 =?us-ascii?Q?cm6MPWcyBW36UMK/E70llJu92nSwUXrazSkT6j+cg8K6c0RJebl9zajdgFUt?=
 =?us-ascii?Q?iT2pkJLECGXDL6bP/ZvAH5xpGVAvHF16Z9ZiSU/OU8iHEsVv7dOTx0ovpJgv?=
 =?us-ascii?Q?Zt0HMgwhyP/LkWK+eZ+lqNL3B600IgVXdhX8alarwMb2nFZlnbK4m17J36pt?=
 =?us-ascii?Q?g/6R8eaXLqDP62OObQDISzwByF4aShnnSerDHGVYIKPxU/n886V2OEPpOcn7?=
 =?us-ascii?Q?4xOAgVKf6ttVdaN9MaefY8G/blocewHpln2KuN5IY3amJugtOVzbtdTHcTfl?=
 =?us-ascii?Q?Ial+HQ69ZLQ6JYhCiCvftycV38/j3fmhMmgYqHnVnCi+HZCBo8USe8AJTaxM?=
 =?us-ascii?Q?+CqAZQoIxXoBsbZysOvvgJ/fXGBtACI/2DDDVZK+Ju6MbBNf0iVLb5t0pAoU?=
 =?us-ascii?Q?G0hCRplVcD5YPHWdDDAq4Z5qCDb4b54FWE7pwSnxkcgtK91SvfBwsO99+85B?=
 =?us-ascii?Q?idmIrYHgjy/LvSOOqPecGgc9xnLDhRnmH9gEJT0BxNw85O3raD63OBl8huow?=
 =?us-ascii?Q?6+RgUli0YflFlm5L2lGVEUslXAe1La5qx7EUWhbYrjpmqeG3Fi2BF4vBtEfy?=
 =?us-ascii?Q?plwoopgZ6p+45HeMrbG3PF8vLDL6Q/kGzJwmzVwnvaQ9M2fRyynGiMe3aBqq?=
 =?us-ascii?Q?qtgrHAtasNsed5O49tZCGsJJmtc=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 123fdd61-05a6-4f04-242d-08d9bfe0fad0
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2021 15:38:45.2722 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x/nw7mQnRMYXnyltQvwoqv8aFdhoMhYCnuU/lTK3HKcpeyBrO27uzR4inBSA5MC8jiPSVbEyOFlAuE4OkbpyegT2Biv1L6YFgZScSqveuc4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1001MB2349
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10198
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0
 malwarescore=0 bulkscore=0 spamscore=0 mlxlogscore=871 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112150088
X-Proofpoint-ORIG-GUID: y3ArFTpM3qg9TtB7bBS1T3vp7N9C6M2P
X-Proofpoint-GUID: y3ArFTpM3qg9TtB7bBS1T3vp7N9C6M2P
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

This change implements the test suite checks for the ERST table.

Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
Reviewed-by: Ani Sinha <ani@anisinha.ca>
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


