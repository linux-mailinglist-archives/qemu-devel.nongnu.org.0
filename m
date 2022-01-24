Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F98498715
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 18:39:11 +0100 (CET)
Received: from localhost ([::1]:41770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nC3J8-0007Mu-KR
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 12:39:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1nC2yJ-0005jl-WB
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 12:17:40 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:5184)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1nC2yH-0007mI-1f
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 12:17:39 -0500
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20OFvXKZ019284; 
 Mon, 24 Jan 2022 17:17:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=E+rS39w79vEBgcAmwymFGAgyYWbmDO9DbC0xVdIH+cc=;
 b=tNfozHwmR/eyFA6yN/CTv/X7Sw5cSoD/rsKYGwtU2zXX04lOSeBdUcvsyc/MXwTXkFKZ
 H7+LYt1ASWmZ3nJiqcmATyfzmwIjKPolq3MbaFfa7pIt73ODY6HPP60bpiXXyHX64U5O
 fBXFdGWU6a1JNyihQbMrIxryc5mC9ykoY5U6K3L1Bel7TJK1fYn9w5vNNpnEMod9RiIq
 uaj0Qsl8u65Gpe3n6rfBMpGZ0ElD8CIcfGjyrnCpVk+qBqzcDQQziCEPsu2UHmyaToYF
 eImlzydR5/gM5eiTwvOCFWkYml/PFIZ/r8cUd5F72SATcd9hKEo3phfvvJnPagdy9iZ/ Mw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dsy7arbgk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Jan 2022 17:17:33 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20OHCPLH087617;
 Mon, 24 Jan 2022 17:17:32 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2171.outbound.protection.outlook.com [104.47.59.171])
 by userp3020.oracle.com with ESMTP id 3drbckxtre-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Jan 2022 17:17:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BtyJoDFZ0OiCl5SFBwX4WUJipgfMQF5bv3Yhghd1iFzT6bSM4CQav/GveAS/JjPiwiHaVzlEPYFubOJpT8eHaG7WZZ18i3g2ykh4Qys5Creq4iwVeomtYNjjoHlothXUdbk75qhh0OSmE+Ve+7QPU/Zf45YPWCg8ICQ/YXia8FXD41/57zoqe9qDOMNyN/iVDTdt6o4Sx896EqIN628AN4+VzXCYtngpuNDmLUvPw6cjeoLxdsKPlrByA8l7fVHiy0mNr+Cr8RNpyYKJ8inFCDe4Gd/WF5yuOt/0blIOOgiC3v0u+byqSYw95M1RRbvW6gMl2pFbzTw4osTxUf4O9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E+rS39w79vEBgcAmwymFGAgyYWbmDO9DbC0xVdIH+cc=;
 b=iJpA9m+5BdUpiIboyIL/d5jdcY0XWH4Mlbwj2nS3kuYvPD7f3EaZTx6c6jUMp3M/ZZ+DpWogYJQPMy4jPKcTEkWTg7TVk6lqDYj+1BVMfWq0jDAXcfbSBcTESOlwCQFBC9JFqWQ97bwjGhGHHVpFEFyDk4quN/K83VugUidvlPgPBKbmP5ks7myIr8DSqZjXoUMyJgD4BAyfAehMqCR4/3VeHZX0MRHwMz4geG5/n4laMt7t/8oP6RrCXyHDev9yCLQ+nzhCK/puHK+D1DHqXrFwyoA16vz2KYh/1bmHAbNbu+BWttS4uf1rsU/Uv3QJnCOQ5F6iu+f8TsaipsN64A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E+rS39w79vEBgcAmwymFGAgyYWbmDO9DbC0xVdIH+cc=;
 b=dKyCXbI1/Y2H8UZLNhxwVhbd30RhaAVdN5JhZfKHZzL4D3SDF8K/uxyzNA/AgYzyYwJXs1kcccemdnhki2oBtG4PEwspoBY21ywZULqIK8vxF+lneMIDQla9/yrQ1QVJ5HJjQdaeahgTpOliVkw5Sj8QSgDsYN0YVh2//lzI4cI=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by MN2PR10MB4398.namprd10.prod.outlook.com (2603:10b6:208:1dc::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.8; Mon, 24 Jan
 2022 17:17:29 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::ac06:be4:5723:771c]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::ac06:be4:5723:771c%4]) with mapi id 15.20.4909.017; Mon, 24 Jan 2022
 17:17:29 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v13 09/10] ACPI ERST: bios-tables-test testcase
Date: Mon, 24 Jan 2022 12:17:00 -0500
Message-Id: <1643044621-15892-10-git-send-email-eric.devolder@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1643044621-15892-1-git-send-email-eric.devolder@oracle.com>
References: <1643044621-15892-1-git-send-email-eric.devolder@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SN7PR04CA0055.namprd04.prod.outlook.com
 (2603:10b6:806:120::30) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8b0099ca-5dd7-4ea6-66da-08d9df5d667d
X-MS-TrafficTypeDiagnostic: MN2PR10MB4398:EE_
X-Microsoft-Antispam-PRVS: <MN2PR10MB4398005554AB6D96B8E1C4B9975E9@MN2PR10MB4398.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:415;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Fkf5fRGzCSjEmJQC+wAV3vbE0wOAE5/p+HXsv68s5P5Z6CrAOaxP/WG/C3P7hYDg3q3YwcVJbToVIaiZlcJwxIC0YFPDnEp1uyudzco4AtHAMtwt8WUOjmlWBDswtCTkBGi92rTkC3QqMxRzumdy4mwwKrGFYzGTbYQMuRIZsxv9R+1+vT+l9g2C6LPkQA2T4+o6r4tnrZKGDyZ0x3ReiNW6BymaV8/h3/+epg6wNWcNh2y3oM4aDQRCs9EtioJivaUeEnYIHihOeGx0TbS5cSaWoSKxYbu+lXKUhQKLQJ9fMbnCbXsnANQLY5hP0uHDbmkRzVMJkEdKVE+5a/4kc+W2Pk6GApPXI+DQ36r7tQIqemc07h25HJPWu0SVZ21/W5N8eKP9XGodDP/5pJx2MZMVg889ZQ/8CRxl1cF5iYCcqdNakrT5DUSUD9pXnTLGq1B2scArrV3/FGXddAEZDvBzEaf+X3LqEwIe8cnS6uXIildQkRJY3k3XLMG+tcR7HcMfq67CUHlyAv7oSHzzTv8/HmEtPG/c4fFKqxQue8H+4eFd7WBHW2gzlENXRVknkHRta0/gR+YBEIdMhoWuO2eo4tg4siaJMF9RL5B1tj4J4P1gUD2TfSEYuIbEbTPJU0E2NHOvvm/Q1eQ3BfZqU5BI2/fVAdBECf8jRQzteSMi0G5kNdhH3RJ2KyiGfMKFokNbJSgED9S8tNrshTGJIA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(2906002)(6486002)(38100700002)(316002)(8676002)(107886003)(86362001)(66556008)(6666004)(38350700002)(66946007)(4326008)(26005)(66476007)(8936002)(6512007)(5660300002)(52116002)(36756003)(2616005)(6916009)(186003)(6506007)(508600001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cb1A0SsGIiwjLyTXQIwVIFt7pl/vNRpJBaCYfpyTOnmNZkU4SppRpkiu243m?=
 =?us-ascii?Q?r34qksMo/F/ubnAAmAlU19ZrvEPIiJa1kSCpJT8MU8jG4HcBYwgUU7CTVVbK?=
 =?us-ascii?Q?4UmCXhCzJIty7Z6Ml8GHZmXlYL//HOB69fUyLhkWc+W7Gl3hDftFp9T4uLSQ?=
 =?us-ascii?Q?3M00xnJ4zlCIxqJgYF0xRdQAesnGr8UKDv8GBu+BWlOfDUepPSrKItbKens3?=
 =?us-ascii?Q?1xFs1twVMGXaNu7gMHviaCctAqv3Nfe+9h9MYLyWeyhpPSGBqrBImpsBEPoS?=
 =?us-ascii?Q?XGKMaw2ol0Mnn3CYi9s7t/4Qid9DcKaqjMhUV4LpJZxnj6Oq+RN6bWIFSBg8?=
 =?us-ascii?Q?wOe1MMXjNTXuCAFoy+0WG215v79Ta1D6/lr/0RTini/2+1o0JPgl9uV6DAWC?=
 =?us-ascii?Q?X2IHWpo2eyDgwhdHQZP5RhbLyWsDiD+UQf8HxqmlzQDWNLuqFmX7jFEi7OTg?=
 =?us-ascii?Q?8HtbdkDJ+nIs9Gq0j+32rw3AQyMXUttz5ZwBmDe8VBW+9XML4XLg3buPX9g9?=
 =?us-ascii?Q?EBLBNuShqVp+SYx+PfIkl3W4E1Pr4RLOJWIYpCB2DbzUE4b7n8kFHopJkNMQ?=
 =?us-ascii?Q?V74vl6ttEzNRu6NOilQZT/wMOeMkn+UqWe9rvJvtGXX/xpaYnz1LWneXO2eX?=
 =?us-ascii?Q?szsuoqeU11NuxXOpB0Khl7vNEcQEP7/w0aqkhSqp9WWixY6A/uxgofy4syQm?=
 =?us-ascii?Q?e1FxbbfIP2dRiv0VYzvDEahS8bgThsjalMRokK83WeQTgbDoiRIxLt1XGb8r?=
 =?us-ascii?Q?/KaMdjl6czpPRkng62VMcSMSDZzfBcKcKsTDpj/+tXeo3uEecgWR2c68+Rzj?=
 =?us-ascii?Q?2cPpL1OGSzKT2GBsllbEjrdCqyU2ANk0L5Z1IJewuhNAL+dr4y2WOfT3mis9?=
 =?us-ascii?Q?RQYFaEVqMScEo3Qiosokf7dvA5tET/4lGriWaDUtzUDb7RnNYDYy22Ehkjhi?=
 =?us-ascii?Q?z2LnFWDmTSxbi23EPRI5ukB8BWfVAhNGljT1lwHqFyMvoxvBlEasH08x+bIt?=
 =?us-ascii?Q?jp0/egRTu0GefRT/JlHJIl+5Ox6BDrmYCer3HmpxhuenbYlxcjzXY0LaiF4d?=
 =?us-ascii?Q?jWxrylGAZIa6TEu8juS9Ct7gF5ECL8HNlgq+Lt3OQstpoG5FGBH+2y81DXy0?=
 =?us-ascii?Q?vpPBXlLFJ0HtQdyVCby/bAyuDYQytdMVoHDte/UhaCT4zjheXbsy75MUlftM?=
 =?us-ascii?Q?h8LM01Vp3YN75fWICN9ClBvIPbauW44OYoYfJoLwINfdE35GYG0vvAAfNc/h?=
 =?us-ascii?Q?3H+dm9xniLlSJgpiL8TQYebcOuQBafXhuejjO+L2qT90KF+LRNbClJ9FzzEb?=
 =?us-ascii?Q?4zyWivjPbgwd3FCPR6ZYIQSjwF0m4bEnBVn+C0y0ZnN1MkteWj2IZhSgSNzF?=
 =?us-ascii?Q?VQpRADpuE8KdkV0pS3NJLjIClz6XAK1UKpl1UX7YxWhkBP58vJWWP+4R3JJ5?=
 =?us-ascii?Q?GXDrYziHppKxaVTAI5b4JMp4Q6hb0SabFgrzxKzNlaZbJRaqXpw9fVyhaIeY?=
 =?us-ascii?Q?v6rxmZcuwXYHXU/JsfDwcLrUl4TkBm7rN5WCWrZxE0PY+Ps4ynwcss1q+qvZ?=
 =?us-ascii?Q?3CXad/S05nhzqjngS5tfUkgwPPCe499ORigd42Qa/7XRb56/HGZvwAqgxaSi?=
 =?us-ascii?Q?P70qV83TECbqE8+ItxT3TlzMc+THTHsvHavvCHgIIEl52iBOujnt61S5nz8o?=
 =?us-ascii?Q?wICSCQ=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b0099ca-5dd7-4ea6-66da-08d9df5d667d
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2022 17:17:29.5957 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fOYbJjHUUvRkSvnmV7fsIDmayi1R1g9HsyaYnny+TV4X7RkC1Pn8/DC2zZW9N+CaLBHoBfRYZI2KcZmETuS3w+OMKQC7kvhNPwVEJVcXD2c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4398
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10237
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxscore=0 malwarescore=0
 spamscore=0 phishscore=0 suspectscore=0 adultscore=0 mlxlogscore=913
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2201240115
X-Proofpoint-GUID: JxwWKLoQN6wBnBSJB5b766XlT8xo03mu
X-Proofpoint-ORIG-GUID: JxwWKLoQN6wBnBSJB5b766XlT8xo03mu
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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


