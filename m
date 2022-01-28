Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A994A025F
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 21:57:06 +0100 (CET)
Received: from localhost ([::1]:47634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDYIr-0001J4-Ko
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 15:57:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1nDY16-0004gs-D4
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 15:38:46 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:55370)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1nDY13-0002iB-B6
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 15:38:43 -0500
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20SK3sP2028584; 
 Fri, 28 Jan 2022 20:38:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=E+rS39w79vEBgcAmwymFGAgyYWbmDO9DbC0xVdIH+cc=;
 b=IPgECBQWJ4t1RZMs50kh80OtQ/No3OqV2oY8ezukFTAI2wtsGWMy/EPLuxXfxvdSTOvh
 0j1Z0MJeSOCLwnRK/nl2uwNh897nqdOYhLL7BZcgqT3eYHYxZgqK8in0E8Dm/rCHyo0j
 WdisM1Z345X8KIfG0sZBQ1ig7eFqJj33cJLYsgvYOn9egBTHDonkt1VsFImMjwJxc0Oz
 o5wnLEj8qRQjiPzlQ+y03QmafbX4enni7Hi7FtlR0Fv+5YaIRHLFlH1+YNb/chdin1bD
 omdGGYQU248C8MK8m0MqGT2qdkXh63ZVUum6o6kzK1sX//Ot6hRoncEFIaisGSMcVdnJ Jg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3duwrxmeb1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 Jan 2022 20:38:38 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20SKP93B185712;
 Fri, 28 Jan 2022 20:38:36 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2106.outbound.protection.outlook.com [104.47.70.106])
 by userp3030.oracle.com with ESMTP id 3dr726jfqd-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 Jan 2022 20:38:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EF19M6nfBNY+fVWatbnD1VR53f9XqsUbk0MHEv3Gm8KEzj7H5hjzUvR7jr9r2noop95Vw3MYYjGP2tXQTKKzrWMCMmsV/OXp2+Us9wKLv+OlMvXYfvsZxmJ1TkUfvmTB78JRAhwnfU7e15hIWeibQKBFE+gzY1w8vfWBGEpGyW3VehZrXKL2J93q6Avxw0B3x5pEfuKuX3Bsrf92C0ti34SPMu1gLwvTRwf7NxJ60TEsbUj01r82Whrj1dBWH7y0Qk+LSiITxabWWYtE4uO/FIZYkLgkfZQM/TisPJkkFe9UnwO23WdbM15U2DsG0aiKYziixXt+DiNr38qWEEwf0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E+rS39w79vEBgcAmwymFGAgyYWbmDO9DbC0xVdIH+cc=;
 b=M0OluO6x3yRktEsqhgtjeIXNarjeNLamL8kELnUhgi/o0Whtzv0rckTeGOrlvOqexXYgQF3eR62bWxBr/WeRhGqF3y6+LIlsGXI/hF44Yw14Ow1JkfJjXAB9ZHqrXPLDGDsl36sbpJbGmzbkL+NqjsTFVLVfZJalFAHDE1LsrT1W1kXA7iJMkc7BUPvojYqoZ92XRXjWnVj3e6fPPp3X8kB+/6p0TJNjoqFn1olMlUs2HenefExFLwrAlCdcYSoUr3uRPgwm+PsYC1Y+uzdduVaM/mZw+H+IeeWjKL4FhrRxegO+6de6ZCaIEgWbE10dLuhFnAgRnXAsgTMYs9UVjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E+rS39w79vEBgcAmwymFGAgyYWbmDO9DbC0xVdIH+cc=;
 b=k4CATh/RGROFF3jecyXB3RzhvscwM9JbGEaHXxPFGplxd1/Q13KajclLbPvn2lquRImBQSplfGt5zqHmyjRXwOCWhwtTISVorOnfeLLZNRXmH9f+QR4A7NjDD8g0pF05jqvUzOaCUQSmqE5GRjKnk9L1SGGGil409IBtggdbV+o=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by SJ0PR10MB5552.namprd10.prod.outlook.com (2603:10b6:a03:3d1::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Fri, 28 Jan
 2022 20:38:34 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::ac06:be4:5723:771c]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::ac06:be4:5723:771c%4]) with mapi id 15.20.4930.019; Fri, 28 Jan 2022
 20:38:34 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v15 09/10] ACPI ERST: bios-tables-test testcase
Date: Fri, 28 Jan 2022 15:38:08 -0500
Message-Id: <1643402289-22216-10-git-send-email-eric.devolder@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1643402289-22216-1-git-send-email-eric.devolder@oracle.com>
References: <1643402289-22216-1-git-send-email-eric.devolder@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SA1P222CA0007.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:22c::22) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 24730f97-1734-4f98-7002-08d9e29e275d
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5552:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR10MB555207ADF97A9496BFE267B897229@SJ0PR10MB5552.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:415;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zVnmEeUErSbynHcHdc6FJCP6UHMepH+0kqIxsmrsyw/bw/c0rWoUqaRiNfEKqG4m8McWWRea7rOGZ4Xj/OJ0fhjC4BZDxGKT024J4Jfz49tnd7/JmrtQEi34UIcFyWBk5a/Cgk+r8aEPqxl504z5ODAvHbHefg58M8cph4Vsr9Y9q9yWAm1u5WOx4XIz7aJ7ZhzUe2Xt8GhuXjxjl/kK+DwTr/zKCW0B/Llm61WOBm8RMFhY7HgU5RHCpgGtthJJeez+xUl+mKb+ILKo7kV/h8P1QW1ovLg8ihJZlENgk/KC3Mdo58pjK8WtmOFp/oFf1cyACIsn0hIgoQvnv8ji3uhYcq+GZH8yBi3nQ6iuLZh9joKkGmKDV3OETAfhR3jLWQvvRbLtW5Uphp3aIm4FJWd4DAE5JCx+WLEHSAiBXzN8fNVatY33d+MAMCBDd3ATv1vx/FY89DgGqgqQoEkA3fZK+GDS/JMsmHgzOmE9NgLXt+3fBCW5LqmPBXhFPH7lDYvOMyYV/K29Q2GoNgvI3oeQ8gVlk0i2bxg/SjsQeVNgvaycd5CEmS8pp7udmgeiAlE+U6hSlhdeF8o0J8vheW6zSV7zQCK4da7EnKponcPJ1N0BenOKNp0bKicNpuQHNSbAD47IPRNUjZq8ZXP5DOWbEIPYrA92s+PksZ0W8tKmi/kKRVzN0Meyg6ihkVBTZgKjrVecMjPBiVNqqIemdA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(86362001)(6916009)(316002)(66476007)(66556008)(6486002)(4326008)(38350700002)(508600001)(66946007)(38100700002)(36756003)(8936002)(8676002)(5660300002)(6506007)(2906002)(26005)(107886003)(6512007)(2616005)(6666004)(52116002)(186003)(20210929001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PsHsASFSzyZ09JtOutk25XtzmxBdRHZUdLyz5brf2X0A0cMcK+r6edzNQrF/?=
 =?us-ascii?Q?54NGmiRifjpW3FOZFVmS63YPiXF/HpcrKNJ0xi3fa+DZb0Ofbv1Bsn6kkR5a?=
 =?us-ascii?Q?65T/yss8TbLKlGoDB36XyILREDhlEriPn01DEZR5X+RaK7yljF7iG4X93xY2?=
 =?us-ascii?Q?9DUze5ix5+xelccDfYMFChlHoW6h1BJe+ZxEA4U58nsDMdOrTVkgicI/N5jl?=
 =?us-ascii?Q?gTz4Pzy1L3W8bkLzoFXc36r52gUwuSoSWii32aod8uDnDmn9iAtEohecOU8X?=
 =?us-ascii?Q?IFsdnHLSoPNE0wCR1FcyFY75w0VqrLTR0lpF7mYCE8S0jplRBN4DYigNQQXa?=
 =?us-ascii?Q?oEUnx4IQRE3mtEG9IRH63ukQzBCuhpm0apNA8rewyhhYMpYBszWhJMNBMiKT?=
 =?us-ascii?Q?9a7RF38SQzTHd6DId89IydNhUqm6L9aEcK+bDyuCw86KyxMUBaRkSgIg1Kga?=
 =?us-ascii?Q?AE6o+3sAW4KGZbuUHnyTUQIsWpDE6YrbMtJtNhHuzCNrix8q2se0R3JzG6Lq?=
 =?us-ascii?Q?4eKJg8Ca4zCpiE2Ifx3FaQ4RBENsbQB8YFL7LfR8WtZwm7qdiA22tY9k7vvt?=
 =?us-ascii?Q?3SHzcmA3aPASKnZuTZVUYlJ83NbmDyIaFzlSbi+4z1bH9kZ95Ntf4yYFOG8N?=
 =?us-ascii?Q?yL7NUJ3NlzNy2UolLgOEVk9H97T5T0PdHi6GX3YepHymG6isK5QcoN1U4hTJ?=
 =?us-ascii?Q?P4rhtesreJinCWXnCn66ZsmcUsGS8hU2WjomOTuKiz3ljpjoYxX3uUCt4Fo7?=
 =?us-ascii?Q?N+jBAq4CJy5wJ7GV+zbALUZ8ki7fqt7+1ivFOhWVroypQRbiUXNjaBs8wAyW?=
 =?us-ascii?Q?EhsPfDWiblWaMdLDGZMYQT9vMRD4WG+czaOLxDoNTN4k0FeBLAQRy7auitoc?=
 =?us-ascii?Q?/DJBxNksqACyVkl0eXOB4+2y1Th23ANszNtr/paWjNbXZLDBTrRrCT0EyaJr?=
 =?us-ascii?Q?/rdKEksewplrMV6L+bOcub3aT+zuxRdR1A5CvJ3OEQlMv+mI6Vv/8joKiIwo?=
 =?us-ascii?Q?WcFPoccQ1eyL3ANAelpz1F3vvr6hJTn4KrVxaFDM5ehyxETLMnt7PFgyvggj?=
 =?us-ascii?Q?77DP1/AhQ8mVEMP9GBLqlljhUmD/axhJr4d8dYgbf5f8lQwv+T4LjXrWRUqW?=
 =?us-ascii?Q?e33E9ycZt6+TsFoMgd+jzAswEmGX5m5E+pCEAIqT+p48308PyGviCJUDy9lo?=
 =?us-ascii?Q?hrOkrTOv6NTijzpJ8q1p8s/pfkXOoPAJe3Tv5tybHn78b9iGduMXFJZcwwq2?=
 =?us-ascii?Q?+AkVi+aGpcCXU5MQMgqpMxx4epR11OmlJElWHjQMos5Q9nSnSIzciM4gKRVV?=
 =?us-ascii?Q?6lOH6Y87w3PnO7g2y8Z0cSYj1pft+LN/ENMmRILeeQaMkNU7Rh6xYrdVoVp1?=
 =?us-ascii?Q?6GZ0sDwRnhy8YMBEc+xEc1gMVUYBbuzJHzJ7GB+kvIkbNpPfe4DEMgQlxIRe?=
 =?us-ascii?Q?VtZpidjkkHcxvF4yAtDHcLbJN1BgPQiKetaTBl8rUazu8E/L7pkNXB+QejrO?=
 =?us-ascii?Q?svnojBt9FcpOW1b25Qj/wMrKDyO537Ns9DZVtF7w9APj7eEXSoGWZJsmBG5d?=
 =?us-ascii?Q?4S71yvaF9nLo9kb8/S9aryuKvtheNFGI3UGkt6aedS1sgkSgftLy7A5oSiBh?=
 =?us-ascii?Q?Lw+3ikHeIugzZdBn3x7ozdZd3nK6OedDJgJnc+tvLb5eOcWt8w/389CBVtcD?=
 =?us-ascii?Q?bjaiug=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24730f97-1734-4f98-7002-08d9e29e275d
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2022 20:38:34.4655 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P3HeqiLWXyiB60mGb8yrx086gE+nrnqrFnFtjL4SMFE4Pk1qdX4Q/QPgEsxxsY5rNZRdCCheVHlBSYvdLLaAvbIYVPocpjD6SFaufs34HuE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5552
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10241
 signatures=673430
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxlogscore=912
 adultscore=0 spamscore=0 bulkscore=0 mlxscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201280118
X-Proofpoint-GUID: S5NO1HXCRw3U6FJnN_Axg6W3b53n-cFw
X-Proofpoint-ORIG-GUID: S5NO1HXCRw3U6FJnN_Axg6W3b53n-cFw
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
 tests/qtest/bios-tables-test.c | 54 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index e6b72d9..266b215 100644
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
@@ -1675,6 +1726,8 @@ int main(int argc, char *argv[])
         qtest_add_func("acpi/q35/dimmpxm", test_acpi_q35_tcg_dimm_pxm);
         qtest_add_func("acpi/piix4/acpihmat", test_acpi_piix4_tcg_acpi_hmat);
         qtest_add_func("acpi/q35/acpihmat", test_acpi_q35_tcg_acpi_hmat);
+        qtest_add_func("acpi/piix4/acpierst", test_acpi_piix4_acpi_erst);
+        qtest_add_func("acpi/q35/acpierst", test_acpi_q35_acpi_erst);
         qtest_add_func("acpi/microvm", test_acpi_microvm_tcg);
         qtest_add_func("acpi/microvm/usb", test_acpi_microvm_usb_tcg);
         qtest_add_func("acpi/microvm/rtc", test_acpi_microvm_rtc_tcg);
@@ -1684,6 +1737,7 @@ int main(int argc, char *argv[])
             qtest_add_func("acpi/q35/ivrs", test_acpi_q35_tcg_ivrs);
             if (strcmp(arch, "x86_64") == 0) {
                 qtest_add_func("acpi/microvm/pcie", test_acpi_microvm_pcie_tcg);
+                qtest_add_func("acpi/microvm/acpierst", test_acpi_microvm_acpi_erst);
             }
         }
         if (has_kvm) {
-- 
1.8.3.1


