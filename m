Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 986E848A338
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 23:54:40 +0100 (CET)
Received: from localhost ([::1]:51026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n73Yl-0000mp-Fo
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 17:54:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1n73NC-0004nW-C0
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 17:42:42 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:52216)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1n73NA-0001rH-Jm
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 17:42:42 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20AJlXq1026175; 
 Mon, 10 Jan 2022 22:42:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=E+rS39w79vEBgcAmwymFGAgyYWbmDO9DbC0xVdIH+cc=;
 b=gyIXYvJup6uc8p/QwFiN2S0/Ah5NWyoXPJqASiPquGwdda4hEry6zXiIugm9l/ogB4aq
 oyfOzgfDfuGNgwMfGYulKPtAe5ICshfXwDlYqL5Zn65KdKAPSsmLe1wAgYO1thpG0QWx
 vNsURVn8rpBigDy8uBurRI6wM8G5wVno2N/1Y7AlRjziXFtCzn+JDHiKRrhxa3r+e99X
 KYDdvKPGLLxJQVjU8iJi8ctH2thHcm49ixboDISKX11R9MIvXk2hPT4Va4Sveipiz6Qz
 xIqXVBpOrXbQbvR2sN+6eaCfvqOaGf04uupbsGUIA8NO5s+PeN7Kx56PjFjKel7JgzNG UA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dgjtg9uy2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 10 Jan 2022 22:42:37 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20AMZuRL086420;
 Mon, 10 Jan 2022 22:42:37 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2043.outbound.protection.outlook.com [104.47.66.43])
 by aserp3020.oracle.com with ESMTP id 3df2e3x2sf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 10 Jan 2022 22:42:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QNHSVDSdMnNwlpg8XdrrlpYpXfB/Ru9LxrtcYkhiJA+H1AWGKRcvFpEzh10Ppa4/lUXzyqpkm2100U55ygUWObTExWLQGHF40UgBNRkRrfbcwPiYEKFM1vF3rwZcoWSk9KuNj6Nx4wQDl6G7B9nqAIz/6ws9Cu/9i7YMPBNXifE0Om0LNVpQI/XA0l0GaDof13THrdlaJKctm4T/8P6XGK4G8E9Bc/1p/T5mzW+0v/SSdoL4YXOCEh3pakN2+/a3rdFBdbZNJtk1pTcEMNYrarA2Ae/rKc83VQYSnqSYJHavE8E1YpAe/6dtfd0z2vmMCBGbaPmxsUeYQQiAyhI7Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E+rS39w79vEBgcAmwymFGAgyYWbmDO9DbC0xVdIH+cc=;
 b=AUly0xhubdWA4OQiklOVK/oJgfTM5X76sRTt3S9iDCT4s53aOrKsk9n8A8/fDWYTEkfc5OXDde5msSOsF52781vGoo46xqgXOfj3RgOo54yDDWDxQdefKvCSQuo08nJnd42a9iapnyEw1jfVKOVZq4O5wNkIHUm0z9km/niikuRIdC07EncnS4OKhI7GZoGYiFZoX3nlSMUJ2UjnKIycLTlTdPydZ6ONvfBTCYkd5EwTmCEr7XwFDbTG6aUsxAJcI8PDUirSQlthilNZvjnsTHfd+hH+mgQsJldGUP18AtXkQNRNPLfK4edr9jYKNs0I03xHV4gIpZRNX4BMgEVcEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E+rS39w79vEBgcAmwymFGAgyYWbmDO9DbC0xVdIH+cc=;
 b=uM9vloNCwFkBJCStG3ZRD6IUo6C+vbuXUssxHmzbbp+EogWWHhi+axt0p8yj+BockQunb1CIaaGmO5G/XDty2M5yuP7ykFGFfbhGpCq1bhC3KEAVrgVLrOiyObiq5TIrTrVTxEL0P4EuZ4I1sOM9T5fb2vZKfC6n+JhxEr1W3xs=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by MWHPR10MB1600.namprd10.prod.outlook.com (2603:10b6:300:27::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Mon, 10 Jan
 2022 22:42:35 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::d573:6cc0:c616:6f2c]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::d573:6cc0:c616:6f2c%6]) with mapi id 15.20.4867.012; Mon, 10 Jan 2022
 22:42:34 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v12 9/9] ACPI ERST: bios-tables-test testcase
Date: Mon, 10 Jan 2022 17:42:04 -0500
Message-Id: <1641854524-11009-10-git-send-email-eric.devolder@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1641854524-11009-1-git-send-email-eric.devolder@oracle.com>
References: <1641854524-11009-1-git-send-email-eric.devolder@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0P220CA0029.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::13) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9c381340-0f4c-46cd-8349-08d9d48a7e8f
X-MS-TrafficTypeDiagnostic: MWHPR10MB1600:EE_
X-Microsoft-Antispam-PRVS: <MWHPR10MB1600AFB7DC8A801FA7DDEAB297509@MWHPR10MB1600.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:415;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EGPoeQc4s9i+vwOpkaRrlMZ0j4CSCWjkWfE/wzSTJh+L653YLDmqBJMd2rtwbEV7uu1NwoN7FJDxN8yFdUlwCZK1RVewAiBO60BZGRTkX3FRgAgyERrevYYFzeVz3VUJW58pKgcNi93vkpauJJkytNcAB/rD7G+9dHgTRdSxSMNnNoHMvlf6DlegBVkmCcVPv833mvvgQDi+jIpiJg1zgv7RRg8iGk2t/1b+TZR/lWNcnauNZ7qrcHTgAOgT1JhPyR607YzSXxbZiYdlEyQkzgwcSXA32uuxR7eaxgoWTj8F+sEtFcyC3c0p4HF0LUjyRvsAIBJRhUqxVHjdrVNh4zqxxuD4Unr8LIphZJ3wuFbYapY3WxpeOJ0hwmhI6pvTrS5SSZ2XJZhQycNKQiZuUw/4E9iETDq7YRmdUr4mbvm42FM3UrI8zWCmO4/Z955ixz/ZHNVvif7m8WX9fHo4+UHGJeib7f47t5yS/zeYw8ZbyXv22VDhTLxXKGcF1yfkqHh6C3ulIxNNgGQh47c5ZZA9oJ4oLkoFcC7GQg8J8WV+jCjJ1dXBjr90ByWIiuxO1/eByJW/C2zF24Iyzp1aTG9gsL0pW+SyT6hDt/tDeA9+swPRcrqY3VzRZ6GAovDTOioFET75YwHwYpN0Bk9LVBanKnHmWTYyhs4Rypp4Aec+STkkSI3XxZJryPHPcNKslB+m1w/4VdIYGmWE5zj2eA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(86362001)(8676002)(6486002)(66556008)(38100700002)(38350700002)(36756003)(8936002)(66946007)(316002)(2906002)(6916009)(5660300002)(66476007)(52116002)(6506007)(107886003)(186003)(508600001)(26005)(4326008)(6666004)(2616005)(6512007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PXu9mzpFGUjgmFWwruVyAtn2ClkhbrJF5XsEgMn0GdkaVLhiM3IlVQ9daDvJ?=
 =?us-ascii?Q?Y0/NCVTG97HOSGfhRHlumfFg1CRBM1WM0hAYLat79jT9YfbtZzv7GlmdGtlZ?=
 =?us-ascii?Q?4UYKngZh6OGtrdDnbAqDVDXWFsE8HwyhNTOXzg0EI9QmK0OALT5VHpY+SaN/?=
 =?us-ascii?Q?I+2l5ip+lubAMTDeLxTy9X/vdDGHwXMAvRVhTbHb56QAMXNt5gIakRcK0qmS?=
 =?us-ascii?Q?LaQFmaxGtY9zsLD/RrqYH1K6Fs0T90GyNg8STkZd9SROAOGaHLMlNLE3J52V?=
 =?us-ascii?Q?+slkgHVdipriWlkoRvUaoyCDjhoAs6NpabO9gFiNeQOY25wQW5c//Rd57HX8?=
 =?us-ascii?Q?0GB48E1gnfAbiZXEeRbgSgIPXRGd+ZKIzX3aaoy1yDGBCjfQs90QbtCW6fCm?=
 =?us-ascii?Q?Z+WRf45RB4CENlSSI/0llpsAOUokTEEwGPGqOiKfIZqpTNf5YxpZ3cXQua2O?=
 =?us-ascii?Q?TIfIKco3gqNEib4iVKTnWIUGZriCr7kCrPkph6JjHw7Rs2RjesLLb5qlL5Q9?=
 =?us-ascii?Q?AapvPtwPCXgw7UhbTlS6EyauewEtkeh3UNrkGv+MqBJ2nqQWCxuTvgRW2E3E?=
 =?us-ascii?Q?aABuZMuT9ECNRSWcjxyZXKuAliKv+9g5DswnusStj97zxIGpdGwyGtVDA9m6?=
 =?us-ascii?Q?fDJwyikK4LRMisoURLSyHi0O6+L/6OQKv1Hi5ddewNhOJXkLTprRTIcCEGzZ?=
 =?us-ascii?Q?+MYGglL7RyEQiSLDEU6QyhN4rF13LU+X1Orjo6+Tv5XjNtQh7JeF35bSZZWl?=
 =?us-ascii?Q?WLiqWtJHu3DDw5H+nxAE5AG4w7wxkiAd1L6t3VBIvgx4yJUCH5mF6L//JUok?=
 =?us-ascii?Q?TEZ/RKQb4FeTpnKYrkOT77FrNVG9Z9dNix0w54to5p4v3tOJmMPsIu2i2uKW?=
 =?us-ascii?Q?gZq+M3COfPsqDMLpVJTH+D6om/weBRns1lFgV4qAu+qyjL6egv+YNq4xskBB?=
 =?us-ascii?Q?XRFMydGIG5cQ3D9mENO6w2vNALLikggX+kpS0x2iSeTAId6li65Jue0ILgio?=
 =?us-ascii?Q?TewiviCSV4yRq0yw7Yfy2ysu9lp9PQy72sVwCsvyLzpeBCuB0N3TFY5i7yX/?=
 =?us-ascii?Q?R/Co3HJWN071XEvkYr9A371EM+g2HrPgkje/51/Ss0eiewfc8SsPCa9Nt4Gt?=
 =?us-ascii?Q?MUuhd72WW6yNyqZpu2ZV96WPuQevA8sGGoowELjSzrrrlZKE05r+RGq8DMjn?=
 =?us-ascii?Q?AtyqYZwYx/EvtdGnuG6W2l7v8Ok4bUW/nevbEbQADU06XF51+70BB3eGI1LY?=
 =?us-ascii?Q?e/ooX+mh0cofNOwDuaVvxDniCf+MVkD/3FqtZwweTESGIcGSpq5MbAsT/nwe?=
 =?us-ascii?Q?gHj2WI90A3jsnaW3aq/6+2lIED9Tz4hdzv6JhjvWiRMlz1yxenvECLe35+IP?=
 =?us-ascii?Q?y7nAUjRHJqzrqmC73VmZC1aQCedmQmeTm7R4bz8LWuzxU/pAnRqJdAD0XQ30?=
 =?us-ascii?Q?YLbZLlCYfnJEUN3C0pS9DloBl6v0GC8zJbUdnrKjS7HC97eNFxW0PmqYLi8x?=
 =?us-ascii?Q?OuLMm8DbX1L+9nvCUQQnPkuofhwz8bhZJFVWuDs5XnuXUAZ5QkBmGyLNoNvM?=
 =?us-ascii?Q?Mt4hQ8mW4pORWD3PpWSRARRXEhdPFS4HqJhXXWvZX1Mjbb4TNBAjjIOatfpc?=
 =?us-ascii?Q?+TavD+a9Ilipv67JrK28z42HFd3uNPsqYmMtIrriwONuv0Uqy5qpDQcgIex+?=
 =?us-ascii?Q?NA15hQ=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c381340-0f4c-46cd-8349-08d9d48a7e8f
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2022 22:42:34.9338 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tQz99agc1IcIxHfSrhYln1E7K+36XETqu2qwY/dnIdjMhbNy2xdqi1DqBwwImzSO/sytFoMtUCWkbslQFC46qmI52rjuOHEUroRfjwmITLU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1600
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10223
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxscore=0 adultscore=0
 suspectscore=0 mlxlogscore=962 bulkscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2201100146
X-Proofpoint-GUID: 1P7mjAVd5rmN8qg5HA0Y2SoHAxtCC0fF
X-Proofpoint-ORIG-GUID: 1P7mjAVd5rmN8qg5HA0Y2SoHAxtCC0fF
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


