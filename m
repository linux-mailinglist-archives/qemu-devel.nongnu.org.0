Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87BC3425991
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 19:33:23 +0200 (CEST)
Received: from localhost ([::1]:55332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYXGk-0004Kh-GW
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 13:33:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mYWzH-0001p2-Bi
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 13:15:20 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:36200)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mYWzA-0001xd-UT
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 13:15:19 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 197H5Og6014736; 
 Thu, 7 Oct 2021 17:15:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=NbM1uYoCA/XcZj7C7eIJtD4iTl23PjIQZIIrfLnFMhc=;
 b=O2qophfVyGryFLsKvMPo+Onc2cBgMc84qSPCGUbbTlNrZP9nHfhFxp0ny6UR/du9IiDE
 ylYnXBmn9YWjwe0JF+Eka46R3FJs+Bt1kFKnkZYLsCFU6G5M3yOeQv1scoCyRybT9D3b
 F75kdHhOkIkzVwN+GEzyn5XT3+AacE1WaQ1kHb7iiIhu920m02lqYHh3DlUfgfIloRvi
 yZdwsug+wykJ9ji+/WQSihLYO/Rck0+/I1jluIO1UiGB8mtgoMPOyU+0fR6YeuC3a5LF
 8F7J7wMtwjG5N5D8ydKx/bl45VzxwIWA1J0ssTFgc2oIEzEYcZo/ln1E1g0TBmxN/mc8 oQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bj02jjcrm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 07 Oct 2021 17:15:08 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 197HAlcr119293;
 Thu, 7 Oct 2021 17:15:06 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2175.outbound.protection.outlook.com [104.47.58.175])
 by userp3030.oracle.com with ESMTP id 3bf0sak5vy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 07 Oct 2021 17:15:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hLbId+CHjkej2Z1VN5bpKAtKroeg/RcBur16J0EOBq/0xdfWRGF0nhkAKxvMDVMOzIItJ2kkBndaJzXVxB8ApmQulxj3Fv/9bbkWVaE+xWRgPmK/wCuvAiZdAdT/bd2uIiOrAthHoqf+VtXudEWu7C1S6GTQmWH8t3r5dEd6wfeb1K7f/7Twqrjk73f23EXVyDbfVLFaIoIvSJuWR/C+C6W6q0KLE4N3hZCi+b3TM5cYqdV/SgmMcqNteXhZzSYu9iWAMDRgZsu2VUtaAylkmkJk3YZZBkXDpq0tZcXKtZI2Ay+F8PJifjUowtoQ6K/Ph3Ce0fbUqEAHeNBJ79EktQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NbM1uYoCA/XcZj7C7eIJtD4iTl23PjIQZIIrfLnFMhc=;
 b=oWhPq11f1x6Y80R+sKTJjCdEBTsJvAdVbd1MaSy8yeOthiW68jNzgZobc7fGfmkYck1czvdMJf07zI9323ZRy8F1kEsaHs4h6UJFklN+ySgSu6DyyHtjleyHJESqpcpjmxpjORgdN4EaNXJI3p5eZj7hHB010p4Hzrhsm+elqabk0mnO2vNOfuc9r32jt7zlRMLAwID6aOSqeG6sL/m88+EtKVQkzFd2ZbM40vXNASkzgLtT6UG2yxz6uSbh78Ypn6uWouYKWDw1DD2ClG+ZS8nmDJSb+aAjD2o8/SyDtyYn1JNRX24yas+liDqZAY0cGT4s30awum45SoqjN3nEwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NbM1uYoCA/XcZj7C7eIJtD4iTl23PjIQZIIrfLnFMhc=;
 b=NKePLrvFNjLQBmkKPwAWuyauV8A4lpS0MPayNAVRwIcI2mHp12WAr8RT+xeGkU+AX1EOUc5yXkupDsmonk52FlBAy/AMWYLKfPBNV3bBPZvmVPqJsoRGe+gRFykNwdpr4P9KDpD+YbC5bV63Vw1c3uaSZRxs2Tk3lc+Vd75k6qo=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by CO1PR10MB5524.namprd10.prod.outlook.com (2603:10b6:303:163::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Thu, 7 Oct
 2021 17:15:04 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::90ef:e061:a4c2:acd6]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::90ef:e061:a4c2:acd6%7]) with mapi id 15.20.4566.023; Thu, 7 Oct 2021
 17:15:04 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 08/10] ACPI ERST: bios-tables-test testcase
Date: Thu,  7 Oct 2021 13:14:34 -0400
Message-Id: <1633626876-12115-9-git-send-email-eric.devolder@oracle.com>
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
 Transport; Thu, 7 Oct 2021 17:15:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5961ca8f-afef-43ac-6e17-08d989b60114
X-MS-TrafficTypeDiagnostic: CO1PR10MB5524:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO1PR10MB5524515798D1B50C9D9DE98A97B19@CO1PR10MB5524.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:415;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aRBoAIBioyojp34ibqxhkdasgepd6/6Qdyx03tdVySWOCvLkFecD6vGvwBtvL6fpp1kzCYOO9yUq8zQVo7p8BTSukQ6suhS/13GqlhFdQYALvs10us83WlQXX+ngESFc3lo+ypL6ZIZz+yital5AxS14kgRrW3GyNUe7Mt+VVetvrK0XIUpfm7ARNi4N2oxhz14fPyerX74f0IHR23dBQkHy4wVSaeP+3sCqPFMXRHhtiNruB5xYy9mtfkhgwTzhXnR+aYaRCFv5ztdlQJirfHSy6NvJCMljNBK+HF9lyYDhvjdTMouMg6DoCAX/SisGXnGPq2tJpPUciqzoTrbWVR9krUPX8uXJL1Uz2OO9ZerGgkZa4/QtsdGBAHrufPKnMl4ykzLUwyXbVlSlWqbgEPO5Lms7v5aQLOLwUeAkHBjHnINOv+w3OC7Y0aJjocP9grrx3Ozk9bVN3jOvusQBwrrP+OoASPdJKdSqDwwerg+jN9tWsmSQmM67jhYUSiGLJUlZwE+QjCcWRzcbv55YEptyMkJZsT2lhaEEMyc+/XWwfKjVUL8TJJnHRTZjm0D9RvZHpI3hJL4Xh9KneBKoiWIoagLo34Ww0MZqQSRCTJ6Wf6XW0lLLwj0XT6SW454UtykERt8ij6Fx5BuWxy4j7jusHkH1yVPimFbTblq9vYNHEN2P2Jfyf8XjtuO/hgqcoxdOkSfX7qR0Yqy2MufnQw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66946007)(6916009)(38350700002)(66476007)(2906002)(36756003)(66556008)(107886003)(5660300002)(316002)(86362001)(8676002)(2616005)(8936002)(6666004)(956004)(4326008)(508600001)(186003)(6486002)(52116002)(7696005)(26005)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+VvNHYk5rr56xowbkaIqrcOXDV3uCk52cTmdNVgu71itH8idmr83Ae48IZBo?=
 =?us-ascii?Q?aGOFTm9EWtHkjijaGFrQU15GU56GG93Uc9oKjU/+p4R4wGIU38rRsi496+aI?=
 =?us-ascii?Q?jpinhCe9NRdvI9/IXGHooqPjCtqRp8UYKavMNtqiOm8vvt+4CnbyZ6lGGiNK?=
 =?us-ascii?Q?NTetufrmjORiG9DTz7n5n12NS+Y01OoygF51vg00IoUqIf4CWOkr14BKgEEZ?=
 =?us-ascii?Q?nEE6tMtorgV8sKXBISnlBi6yCiYRSV3CkNCX7X/jlYhx4tRUS2c8zF7/lzw6?=
 =?us-ascii?Q?v7GBQzQC+vH1HUGZEREBX7Qo3Ccj0TCd6FpTCY+EN5NgHi5fR6naJAjqd8xo?=
 =?us-ascii?Q?uGJd37/2ETp3Lq7EIIPpHSTwm5ny13QpSUwpqYVNQeQqrE79Gs2GyCDLmUz8?=
 =?us-ascii?Q?CTdJeaJCZI/ylc+doJ8po8RTJpcFMYWcLGVuYTxnD/TZ8+xNPIbZvngncyLv?=
 =?us-ascii?Q?QBZoLB2NJmaLnU/+NAKO7x04nqPhSm42yvMycnTV6iDhxP0JPmFXH4sdBzKb?=
 =?us-ascii?Q?oiT6DXjS1X2RhldguGYVl4YqBcPi1BQGz5rLGQS47alUntE+VwFIuiU6+/rO?=
 =?us-ascii?Q?rGUQZ149ZlF9hRtb/92Iz68GPkU4DJyQFqH9ODnzVvSUF+gf7b8ccesrey6Y?=
 =?us-ascii?Q?wNO3mRcDfcj50aHCrS1CzX0elVKUvcUkBb412HZWblIcZcJLpHG9XLKQZKx8?=
 =?us-ascii?Q?+C5bmgd5fpURgcUdk0QEPyrwHN+Wvdd9YUDukJpYjS4vYhYJBlFz+igdmBO4?=
 =?us-ascii?Q?ho2EAJkwqFRkQXLu3BQEvl/MH714whmSDE/9qowp/qkWNHaCWSb6oQKHMcfU?=
 =?us-ascii?Q?cRWidKS0tX4bxwD8XD2UxJlB9+TWpIDgnmw2NePgLtkVakzb13kqomdcMep+?=
 =?us-ascii?Q?lPRqFpEP6Nxm1Pa4w+U2hbP8YZL+5wctMANrIitk4p+SEOYjXVEYplFKRMDO?=
 =?us-ascii?Q?z0QQlwnJnsVfgBS08V5kUr8vaojHb+f+I98VMsYGTEcvBvvylp1oslDmX1Oy?=
 =?us-ascii?Q?EKFGt91swf3e1onkM4isRdq/HLwcUfmOjDr/fkwkq0jr36H5tIh6La0+6ZsY?=
 =?us-ascii?Q?EZ+aVihpJPPaKb6cqE8jsCkGAIb12VSxP6X/2vVosJEiTSl7JZ64dcjyrJXh?=
 =?us-ascii?Q?rtGMnwZLKsfFugzEb0MaBoKyDKGf3zOAmzVEd3cGkFPeWWIDR/v2Yq2goooR?=
 =?us-ascii?Q?hjhdSdTiEua+Jt502r87C9uXG4OE4f7/pPDG1wGhJ3RgYbP+yFxPoNOUDzAI?=
 =?us-ascii?Q?Ql8Dod9utlkIuNZbXEb62+FWjwNSU/QDlDMSZDZ++/z68/RaEc6w78OcoDDK?=
 =?us-ascii?Q?qREgXlgzCxJ+18oGbeGlqZBN?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5961ca8f-afef-43ac-6e17-08d989b60114
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2021 17:15:04.6866 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: epInjTQ/wg92CJ5lXxXXgMMLZO0cvmAeerresIETQrNvERbe2KlPmzlFA/hL2zLR9xh8Q6RdSkbnJxrhjnRtP7bGjCM88mYfFY8z7ywLwLQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB5524
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10130
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 suspectscore=0 adultscore=0
 mlxscore=0 phishscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110070112
X-Proofpoint-ORIG-GUID: qbRoAAfX6zcrB-aRpFzA5ilpJe97M_in
X-Proofpoint-GUID: qbRoAAfX6zcrB-aRpFzA5ilpJe97M_in
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

This change implements the test suite checks for the ERST table.

Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
---
 tests/qtest/bios-tables-test.c | 55 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 4f11d03..617eaf6 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -1381,6 +1381,57 @@ static void test_acpi_piix4_tcg_acpi_hmat(void)
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
+static void test_acpi_piix4_erst(void)
+{
+    test_acpi_erst(MACHINE_PC);
+}
+
+static void test_acpi_q35_erst(void)
+{
+    test_acpi_erst(MACHINE_Q35);
+}
+
+static void test_acpi_microvm_erst(void)
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
@@ -1566,7 +1617,11 @@ int main(int argc, char *argv[])
         qtest_add_func("acpi/microvm/oem-fields", test_acpi_oem_fields_microvm);
         if (strcmp(arch, "x86_64") == 0) {
             qtest_add_func("acpi/microvm/pcie", test_acpi_microvm_pcie_tcg);
+            qtest_add_func("acpi/microvm/acpierst", test_acpi_microvm_erst);
         }
+        qtest_add_func("acpi/piix4/acpierst", test_acpi_piix4_erst);
+        qtest_add_func("acpi/q35/acpierst", test_acpi_q35_erst);
+
     } else if (strcmp(arch, "aarch64") == 0) {
         qtest_add_func("acpi/virt", test_acpi_virt_tcg);
         qtest_add_func("acpi/virt/numamem", test_acpi_virt_tcg_numamem);
-- 
1.8.3.1


