Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C54F542FBCA
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 21:13:03 +0200 (CEST)
Received: from localhost ([::1]:50424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbSda-0001Em-PP
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 15:13:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mbSUg-0003xL-Dk
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 15:03:55 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:27276)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mbSUc-0007qR-0v
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 15:03:50 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19FI19nW007394; 
 Fri, 15 Oct 2021 19:03:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=NbM1uYoCA/XcZj7C7eIJtD4iTl23PjIQZIIrfLnFMhc=;
 b=lZ9xRiZO1XS3RL610dHdKFRSemwuPuCJP/twF+wn6Sp2LpP/CCorkhSMEeCoN/xSMu/0
 qxD7EnxvkhOyt4MC6wlSrjRbVjYBEPbYmDHGBVI1DL81ktzh7PxhTGolN+Pw7Wa3Jb7k
 0BXTbqn/mJCO5pEwMq0iYKmU2GconcADZkKbYm2Hz8FRl33QlOIsZHwljHHw3kOcGTal
 hq5mgaMUn8jIi/FGy8cbCeJPJ85LLTX6D/7tqAWgByZR+1LCXortmub7nAE77Nz2fRoK
 cVFBY9xEh2YKzAX80Ji09ci1/rkPQ7Q7BC16epIfG3I4nZHma/dVk4yDXkcNlfJHvkiC cQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bpfsytrkr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 15 Oct 2021 19:03:44 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19FJ0sp4180781;
 Fri, 15 Oct 2021 19:03:43 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
 by aserp3020.oracle.com with ESMTP id 3bmae4ndfr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 15 Oct 2021 19:03:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hnpX+Rp6meXHvNkdjAfJkiHnV+6uX0OIoRdkMGTfeEQ47MaFKcBZ7ySv75P8xC2a30BAd0h2h0qkdjEPxwRfZy5l1G8eCxOHtFRNUoimW+lvs+lIuYhIUKUZfViPrvnGffJbaKmPUnIn+wJxEQMWWXcG0lxJLEtIekv+zIf30nAd0TOtekUBPjr7pnlHfwFimjQL7rllXfGEwMfzhDbuCoAGZGi94e0aP2tdE6rhFTFw5Nj1XTI1OHI1bvOEsAHYrIzNCoqIRYRG4222h8HSSQN/lo5oOejHyYQaEfNOa7tXTeoRc1iz1dMzO7DeaiKUZ7jYrk+n4ZPKw+0U/ij9YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NbM1uYoCA/XcZj7C7eIJtD4iTl23PjIQZIIrfLnFMhc=;
 b=TGwq5U6nbDYdB3Fv733L3rGsBR9ayV0YQQVGqcAqruibb2V82QHzbayrStjDFucMLwl+qX4L+OOKMwqGrDEZ0KyVCo4NzkJslkzc8P8NnadnA/OVLJrAH3rMXSIQejyaeriloGYciZlKIoTuC/WW6pHsRUMod8CzIt/WQJBfKC13zeBTrVOeqp2xs7oGJ/pgQSItG4+axnQY2MrYRevN78P38VMbE/APx74tuhGTEeh/VoSdhn96+dX7jIK1fm5zu+JvK+rsFGjaLInkr/3uwjijF8tjX5qoClqWOR4+m6C0XZeCf5iZULQ7tvQdSlwbWGtokFLLmExcwnaiUCxrPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NbM1uYoCA/XcZj7C7eIJtD4iTl23PjIQZIIrfLnFMhc=;
 b=EE78Sd9IHtSs7kd51/Gonk8vyt1wsMZ173OJiYWESH9PcAwwsjVIdF7IKAIg0j4W+v2kClOVJJ7NB4T5k8nCnbBXLtRrMlMISVjk13jm/AuI8UkjFO7Fa6SVolcBUTowZ3523yu2JbVDexiOcqEk9DgOnp6oqQEVeWA5OzT1e+4=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by MWHPR1001MB2288.namprd10.prod.outlook.com (2603:10b6:301:2c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.22; Fri, 15 Oct
 2021 19:03:41 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::90ef:e061:a4c2:acd6]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::90ef:e061:a4c2:acd6%9]) with mapi id 15.20.4608.017; Fri, 15 Oct 2021
 19:03:41 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 09/10] ACPI ERST: bios-tables-test testcase
Date: Fri, 15 Oct 2021 15:02:59 -0400
Message-Id: <1634324580-27120-10-git-send-email-eric.devolder@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1634324580-27120-1-git-send-email-eric.devolder@oracle.com>
References: <1634324580-27120-1-git-send-email-eric.devolder@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SA9PR13CA0129.namprd13.prod.outlook.com
 (2603:10b6:806:27::14) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
Received: from ban25x6uut23.us.oracle.com (138.3.201.23) by
 SA9PR13CA0129.namprd13.prod.outlook.com (2603:10b6:806:27::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.9 via Frontend Transport; Fri, 15 Oct 2021 19:03:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ae7180b3-340d-46b6-f5ea-08d9900e80a6
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2288:
X-Microsoft-Antispam-PRVS: <MWHPR1001MB2288D5A5696D879D42AA263F97B99@MWHPR1001MB2288.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:415;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7aAdwn0s9oP4eVJ8NIKi3cTCrL45fXF253NwWjKMnqVDEwMb+OnH7FIqTc+4YfBsx6SRqcGmD4dotUlBMrDQNk5h5YR4reDsH1kzfiU8ucnZntj18ZzmjFCb96hQ32WVXPNX0+mzrj0eo+SaL7p9Nlz9hLW6XPPGp5E3rws7JdYY+nFeqr86pam1SIuvNRjuXtn0DC+13r9mThhRmngMZUfNLjUImrJAPDrg8LrgoLVbvSQsLdYz3DtKZi5fGoT1ikS2/AzENH0S1agUdn7xqIr2Y/K2kV5XDgjDFsHsHHO5R5pY5Z3wNC4aj50AKMNdYZlr+1SDZ/Hfl91L4TvNvaYtAVALSEzU653CLKOY/eNUICI3O/H1nN/IAgIIr0zfjN9zB9cS4Ja7JKdYGTWsPeYq6IOJ7pKCZVpufDmafWuT+Mv3w8RU/MeWLchErGg3p9PNMu0yM5Nhvb5j2XfVG+1ThUZw4khQemKU5DQ4SCsOGuvGR6fymUUVQN1BS8S+3cZnKDkbOfuio/rPXVvrJ/Hg9DPOttQzIAgnlR8cImrRvvrBGlv0c2rm+KYQXEBKMdqHHCywTZfzLXGcEe1+TrdCmGBVg+dDxnaiBedBiMOlUxcnLyFoNjWmMx0luUYG6ExyZqNVBkto/vrUBTaqrahDBuNWny/yw0s2HrJCacCIkPWhg9FfTOKDyQfbEjekb4nXHlqSbkcn77o7Fqxcqg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(86362001)(6486002)(316002)(107886003)(956004)(6916009)(38100700002)(66946007)(8676002)(36756003)(4326008)(186003)(6666004)(508600001)(26005)(8936002)(2906002)(66556008)(66476007)(38350700002)(7696005)(52116002)(2616005)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?J9HQpnpVPxa7yk+8fTBc6oflMbmKFZYXqqECPpI0S6Yt+OGG+x0UfeDsaArv?=
 =?us-ascii?Q?1UEmAOLkyA7pUWuhWSv3UWvzzlMmqKggBbrkI69va/LOWsGTv49EhrMbcJv8?=
 =?us-ascii?Q?TSqin1aZwJxLzOO9MW1yJL0TpqTNg7LKsX0EoxWzFHnyXcTmlJOzmR5RMRnP?=
 =?us-ascii?Q?OWGhxhnJNVKUDJthKRdfk352tLEZ2hefie3faelCPUUuNqs3GCRa+0whj1bq?=
 =?us-ascii?Q?aImclsCYPZ242OloZ+kp9YNRGbrt258UUXUIF3vzVYc2yUI/buIORky2c48V?=
 =?us-ascii?Q?7jfUazNRMnqd67kSw5O5vv71AOv5+IH5p48+6XKsLgIpxducK+JxdceGR8rD?=
 =?us-ascii?Q?JvcG77gLzFtgnaZbw/5k8CuOTWVMwrChARZXrn/q0glLPdEZNUm+M6CtRPyg?=
 =?us-ascii?Q?onNySDHMd1EzVggRuyQOwslYVKqJSG9jUVZtOATqQGi5tX+cV4U7MLBJAjaR?=
 =?us-ascii?Q?JJk3zErvULk1BmtRRF7WtZb0oNhgdc1CnEt3cs/U5bYg9y+NI/e4a6EHPbtW?=
 =?us-ascii?Q?ULJlsJYSWJ8aJGvrxE9MIU86Ubi4R6/tREnysSPXSJV6Oajvn/RtF7egg1Nv?=
 =?us-ascii?Q?SEHmmwxGblfWAy8moRcyUve727X58mfEzziQ4pvazgOBKOELXnpRsAbftMC5?=
 =?us-ascii?Q?7T2aglnZkJZC/XReudswip+SRxYDPUX+9gbkUDur5mgxKzdbCotGYYwMsot5?=
 =?us-ascii?Q?pkizoSDJz26CKNha8K8+mh8m/WdRbUNZ1zz3GAU9BLOlSopKPSBGklh/DDIp?=
 =?us-ascii?Q?qxNleDrJcPfS01c2bI/SdHob0K7NFW+zjAqg+tjNTGt2VM6eB4w9VI2x0aIU?=
 =?us-ascii?Q?c58dPI99AiUBfw/Bv70uhFnlZsAyoUOmsQaDgMwbZPFCx4c0qmzSI2rn91wK?=
 =?us-ascii?Q?b2EdMII7+z9oHzWIN+iK6zUaJXqIv2VWTz1cknmg7ipXsvIoZJuXDXAM8mlt?=
 =?us-ascii?Q?zT7ViStxXa0XvSqPlJ9YmNEzMWWY5ae8SMeW9IYQGR/5XJpeJIQ13OmYZgVt?=
 =?us-ascii?Q?8tHnu8QXfpXgtSIi6lxKZqLii4LtQzCVokRFt+bH63RrbZMUEJfQDAdB16pL?=
 =?us-ascii?Q?IIr3gEKUUP9KKVDKQxlRZ0HpGEcv7SwfzWmxJS16yUkepOSQsQKOicDmUHwn?=
 =?us-ascii?Q?EBbu1UDN8HjS8SaGN7AYuhpgwAIJkFsrUbPYJjG+//gaOLW75a/z4gfs4iPJ?=
 =?us-ascii?Q?Au9FTej9CGIVakHTxs87QDd1SHbyTzAGt8l9zNAWugv56gnyTuKy5u1KtYkY?=
 =?us-ascii?Q?FVsO2Bewp82RVBnD4+Rg+HSalppa6FFtxk3bfzTvODktM8Y4KUE9OaPnkH1A?=
 =?us-ascii?Q?Yf0hm0o+7rqpkKKu5up91bBc?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae7180b3-340d-46b6-f5ea-08d9900e80a6
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2021 19:03:41.3885 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sIWr+RZSZgi4dAmaiugGlt8HUgIpLCdVwEn3mkD9KSnWhT+MYFwdvHgAFpTClx1xJEjWESBVu0F/4VOhz/3ZJ/y6zlT8CXCdZDCW7KggM7g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1001MB2288
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10138
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0
 suspectscore=0 mlxlogscore=999 bulkscore=0 mlxscore=0 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110150116
X-Proofpoint-ORIG-GUID: GTJzIumZ2aRqizSIibCxEVZNUNJPidyf
X-Proofpoint-GUID: GTJzIumZ2aRqizSIibCxEVZNUNJPidyf
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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


