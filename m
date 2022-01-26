Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F1C49CFE7
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 17:41:57 +0100 (CET)
Received: from localhost ([::1]:50842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nClMq-0001z8-9w
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 11:41:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1nClAT-0006I6-9G
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 11:29:09 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:44786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1nClAR-00035O-7O
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 11:29:08 -0500
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20QFod8Z024349; 
 Wed, 26 Jan 2022 16:29:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=E+rS39w79vEBgcAmwymFGAgyYWbmDO9DbC0xVdIH+cc=;
 b=Vp6zQfVtq0eFvyh3pbiGmanEYAfxKbMIqL5dQwyq+2shgGO/sYiNWeZp7DrjvAA3pPlN
 YPPXbTgY9wpXKZC+gPjMWQLw8NAs6mesomFP9/IL104S6iBw0SQpQ3mBvDAZmrsX6Rz1
 EXiQsP2r/CznNOvV4W5/n2gK5yzB/fy9OcVkPPyVo/dlcBfiC2NrBvVRhkDwOBu/oFfP
 z6pT3BZzL7BXjm4wBzZuc9MhKwuuyCKW3WLqavrOPpr5g/AFd1rjy+tu7YEcnPG5PpFS
 Jg1lnC9T1tgrNfR3M9b9DnTEEuJuLkuBXe0p5mLYbqrYR1ZZSJ4GDwYXYfOb5FW2IJ/p DA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dsy9s6g72-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Jan 2022 16:29:05 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20QGAU34153273;
 Wed, 26 Jan 2022 16:29:04 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2170.outbound.protection.outlook.com [104.47.59.170])
 by userp3020.oracle.com with ESMTP id 3drbcreyd0-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Jan 2022 16:29:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WTM2CwSnYPpd0E+6h/DKkDMhT46rv9rjqb2+ShuXfOA8rBz3KpTrPiDi6hz6Al+ysRAvJAolI5Yxpao6/ST0OE5nkiHNef35rYztMlyZz+zOYlQv3sQn2G7zejhwrdGBxqEZVxX4P7ff0HQuhEwtfENGLA/ctnt07B6fvgV418RyySgOotZe1psF4MFAW5v97bK4ijyOiL+Vs+bMdgwm8WQVwJh9TCET969hXJg4k3fuJPseEeBpMZ9L1oX6uWFWZkUF5+27hE2XAv+rKbihcWSfDXYk3TvUucb2zoSw5PPD0D7IKbuuEU4oA7H+ajFHn9bfQCYpzUk0MEZrvjrByA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E+rS39w79vEBgcAmwymFGAgyYWbmDO9DbC0xVdIH+cc=;
 b=JRuWjZF08Pn6aRgJuFgSD+ou1ZAOLB/rkaVqY/OjNT60794nQOZJCiOIRHL0FGMrLu6xYg3G9U7NVv4mN16dDJyB+GwrWXLfvDBR/5w6RUDQtRJOhQc8kDXCqu3j1QnkGawWZqW0gjbWoz7w+Ol3ns4EiEvzxFUZSOPFvszpobx2mH6T7RihbAJJ49wYG4tNE+p/XBbxqWdObbSPRoSSGuFsJSfAwXOidxJteYhPp05UUIGQ9MZgxGIEYi0XIKx2Yl71Ahc8ce7kWPyaYAjidt2BwHtxwTdwf4hFGEaNuogy1YJ6czY9VonlNvXSv1wwCeyPmuMv+9sXrax0XbWqTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E+rS39w79vEBgcAmwymFGAgyYWbmDO9DbC0xVdIH+cc=;
 b=yljLppXEtj+RwBsl1c42m8Kn/wqDqzuW1QPZvEnZY05laj0pn1UtMB9OmBYe7+X4BeJngi0zw0qHf2hQavaXfnU5Pd4psD1CXdYzI48sPsF+HnePaLO03UL4QM8z2Jc3ZYaVEbWxD4yj7G+DvwzXnZG0Oxn0RugeO4k4FVDbgMA=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by CO1PR10MB4450.namprd10.prod.outlook.com (2603:10b6:303:93::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Wed, 26 Jan
 2022 16:29:03 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::ac06:be4:5723:771c]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::ac06:be4:5723:771c%4]) with mapi id 15.20.4930.017; Wed, 26 Jan 2022
 16:29:01 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v14 09/10] ACPI ERST: bios-tables-test testcase
Date: Wed, 26 Jan 2022 11:28:33 -0500
Message-Id: <1643214514-2839-10-git-send-email-eric.devolder@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1643214514-2839-1-git-send-email-eric.devolder@oracle.com>
References: <1643214514-2839-1-git-send-email-eric.devolder@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SN7PR04CA0223.namprd04.prod.outlook.com
 (2603:10b6:806:127::18) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9ba7ab96-fd17-4deb-e355-08d9e0e8f5c3
X-MS-TrafficTypeDiagnostic: CO1PR10MB4450:EE_
X-Microsoft-Antispam-PRVS: <CO1PR10MB4450D948383ADDF213B8D64C97209@CO1PR10MB4450.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:415;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OSM1oYURSFRQA0tf5wV6RruwfHR/lSA7sxwwktrwtUNJpcz+BKRuCibqHGWFrJxaFRgGqnrleAWG4j333h5CHCbh9aVdCvn4JZ50CciAufA3wMkpwXSboxH+T/YPf+9mzOzJVfzV08iV5eQxjh/zgaHXQwXVTR5vhBM0tnkvmnXMa+YeDOU3w0Cd8xSaLvkogZ5rue7LbAyELwVlLxRXcs2QblPiQBPYuZdFBqoF4cwL5w/rZYyxGHN6DHYorLX0tPs6U2pEi2D5EwYq9Po1PJnV2qjZ5TcVxdOhaNtioryxEJXqkEQ6ebbW7nweY3MDnk+x0C0p0G3YIAwvf/if3WQEHsIS2SZfBee+aDUqhEId6nvFsozFEgeSJUdaoOSmUYxYN3e6RhQ+ZMYhszYOWv1knJEUSWKljWmIkFVQhqLV+EJoBGGVqubpLBiPqhPv1+xG8l0hN30diUzNpjruZaIqL0Alk89KkDdUwl581PtUR+8RtYriqLkQMp39fsXxMPW8eGda0WdsO/hguhA2lMXgngSG2M0CuNsT50BvlIt2bJ4xq9KhJEBJYL2dZtNaQxThODJa9BpXiqRedHEeNReCnOjbT9DMMtU3zUw/MCAf9k5wJlt9TVzLJFdWGbWE8Y//Mb5UKQJHP3mKmktrGjq9gyCY0A+2H8M/uhEPTwBtkmRzkr277jxwrUuiwcEZkZeZkMPEuZJY+BUaL5qw3g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6486002)(6916009)(66556008)(66946007)(4326008)(8676002)(66476007)(8936002)(508600001)(86362001)(316002)(5660300002)(6512007)(107886003)(36756003)(38350700002)(38100700002)(186003)(26005)(2616005)(2906002)(6666004)(52116002)(6506007)(20210929001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?idW4999FIayp5opZp+b96PiA1+cb/YKYIgXmoflATvsku04O8VPckt3ftF/v?=
 =?us-ascii?Q?Nncp8t6FnWHLJMpL4ll3MjsvK1/ORRJoUcXart5LzNbx5tsDQfePWDAYHotk?=
 =?us-ascii?Q?5jcr6JgfrYUIeq0qbCnIopqWZtdPNTtN7rQwPfZm35lecGN8JubfNl2okgHB?=
 =?us-ascii?Q?0JiKjrCweVktdztYVQOFtl6BERs5dB/66hPW+wyMMonnsS3Ool8f9s6eMOKa?=
 =?us-ascii?Q?BA1kSxxYUQPmVuQPImSl0WQVg8ddBQNE3cm6HdfQ9wgDjCYJJfj3biaB676w?=
 =?us-ascii?Q?jfhvT9rs9JMsdUPzgnsz8H7sM2i/0nOsLa+Tpy7PfggWFZpcoC8/ti+scRTY?=
 =?us-ascii?Q?Iu/eMyJF4CsCO01L/ZypGOuRppKTM8oJb1FkOhz7AfmJtQsPGlMDqSo3YPXo?=
 =?us-ascii?Q?oagFtcXBtb/5X/kNMeLO9Hr/cp6iW3343c5mrovcoqMSm0zY9k6LO7BaQN3s?=
 =?us-ascii?Q?suBhVehAlPe3MC3O/qxLT8D5eoqaVu1+OK81WaiJE0iH0XNGvhYFFnzjpGDZ?=
 =?us-ascii?Q?CcnUNcn0KOjPSIWAAf2Wai5hygZThhaWqc3ynze9QxehdvZjx2np1XU+z40b?=
 =?us-ascii?Q?fJD4XGBVbDtw+yawWFnjZIvUrQxvBCsHtMrlId8+IzN4NAcFe1CG/1cqo0+3?=
 =?us-ascii?Q?M/iDizVV6Rq702JtlaWsR0T/F717p0gJgI/Dumhce+f1wBoVtr9aRaWC8J7o?=
 =?us-ascii?Q?DrsBVVY1ThY19+iRQOtunmOnS3P8AEOziwT4i6ym4kd/jTqY53yHGLQc1AKG?=
 =?us-ascii?Q?a4dyVtXHpKJr+e1bxf9SbCTYdvoR1gAYXIzg7Xa+FptN8byqfVNOSm4Piyym?=
 =?us-ascii?Q?wIgmky0TeFOeeRcwdPOnJXU/k4slXTSLoBLHdd+PMgu58K9M11XSwkkAJI72?=
 =?us-ascii?Q?yyBXo4fJrfAVEm5To2hUPTlmogaxZ7e7FqM1dIDr2bB4CdaBvwnEL2fZcE9D?=
 =?us-ascii?Q?q6KRBiKXnUDdIG8RpIeW7II89lqpZET4PrwkrtXsh2OqTC8auvfyGsi8ZY59?=
 =?us-ascii?Q?VpntmNTs26LmwYyv+E1i0NP5VenlhkPSBWrLUkD/AZztza3YhfP6jhBsnMTC?=
 =?us-ascii?Q?IoXyookPrgBLqfEs0tRdAf55VdZj0KRnvAlAq5jd5qs7hRsFAEQVI1d9ibM3?=
 =?us-ascii?Q?K6B51jRhEJ5sg11SPmc3Okf0WgruKDtVAS3GYxYp1JooQY1Xx2R7ZswSYUJi?=
 =?us-ascii?Q?+Jmg03I6DS10Z0Ko5adh2mMFgkEWE4jhwccmWgAtL5SJxnFsZWdfschxfjNt?=
 =?us-ascii?Q?kHaE1Ye00ST2FloTo11eU8yOt8Q/d8JiE4iLSDSKzW8cOX1hI1xYKfcK13Mn?=
 =?us-ascii?Q?bL3PVukbrsHk2NEJTFzJ1Lw7l7DgSebmLN6/QQSjHQIBjHSdBK267PNTKmBa?=
 =?us-ascii?Q?TkgHQwXTGc1tgqPof7thBZCR1JtgK+Uixrrpecp6aJEnl1N9M4trFnyqFbMC?=
 =?us-ascii?Q?CBMJt0OH4uJCI8ebU6UVofEEc9Qr07DJKrayv3dCIYw5exOAG71U8FHbtTQ8?=
 =?us-ascii?Q?a2b2scT5gV8eO+vhjNNf5d9P+UmtabYPr8CUtvJ1lc+ArzVkJHleet3y4QFs?=
 =?us-ascii?Q?xrOV9uc6YLN5QtQVtJDh22JXNpgLOYwrhtAHCmSP5Lig49QPsBMyOc/iUP3t?=
 =?us-ascii?Q?NuTwB1zeK0bXFwBq+B1AuCr2Ph2uryZfCpxMxlpJcZYCY0Zs0lVPX80KKgZ6?=
 =?us-ascii?Q?BTAqtA=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ba7ab96-fd17-4deb-e355-08d9e0e8f5c3
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2022 16:29:01.1488 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iBPSa+DV1xoAVnlLa+FVyL+LmBDOtDwR9XxCyPQHSikrplSJGpmpJ4Qw24JBvrSKYqQoDoESioa2Purn6B2qrZOSWws5lJLcD9JELTclY/4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4450
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10239
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxscore=0 malwarescore=0
 spamscore=0 phishscore=0 suspectscore=0 adultscore=0 mlxlogscore=912
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2201260102
X-Proofpoint-GUID: kE6byWfHuGHwi0VkkKlxnAtoORqkOEIm
X-Proofpoint-ORIG-GUID: kE6byWfHuGHwi0VkkKlxnAtoORqkOEIm
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


