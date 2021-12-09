Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A93CD46F2BC
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Dec 2021 19:04:43 +0100 (CET)
Received: from localhost ([::1]:46902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvNmc-0000U7-Nr
	for lists+qemu-devel@lfdr.de; Thu, 09 Dec 2021 13:04:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mvNgV-0008CS-Rh
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 12:58:23 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:42868)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mvNgU-0002wS-4K
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 12:58:23 -0500
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B9HnBjU019883; 
 Thu, 9 Dec 2021 17:58:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=SfvJCp/7ima11pfl07B0iZGcklh+t4Q1+Pxy6cp8HDE=;
 b=X3dP2Yxzg+o2q5kK/g6JJ2HwBSHb7MNM9xal7/GEiZdITuUl8xZSQdj0S80zmFAQDBYW
 OZhunzJD+0Q38TjYwh6gUPaEu5fSF74RmE1ACIyswhU1dv0YPXYMlwdeO8fOFfXGaDEh
 gNJpEvXa2nU70UlZqhDxlHyasdu2jBglua+MaNiWmIHTruMmcMuKrULd0RI42pcSwJCG
 aJi76k3T8OY9n/+bvBPVe3WZrdKqb0kzpgikaBNkiHu6Uo6+baM/NZfsQBw9vSifaG89
 qsiZB9sNYdfVnZGi2o7PK877WCVPBOUdwnySUBry7NHgB4kxT8a17RbOi3yf3ubzuz/+ Wg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ctu96uv1e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 09 Dec 2021 17:58:20 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1B9HomcG119673;
 Thu, 9 Dec 2021 17:58:19 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2048.outbound.protection.outlook.com [104.47.66.48])
 by userp3020.oracle.com with ESMTP id 3cr1ssvdpp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 09 Dec 2021 17:58:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dUUT/N4GcDrLNd/Utmjws5btlJRhuKpWd6CcQjogdGGWNhIYdW+HGuVv7RxZxQZ+UehkZoNQBBKGH6EN17AenQ55tARCDkZAEztZU5L0ByvhSlipbGziGhbbCz9So3AtXbieGaw9HC6ql3ghUaDGFSg++0/5lQ8NGp8EiEO36rZ1zvCwJ0x+2mh+HN2w6ITVj5uwVZiQPqolB0WYB7xeFoV6LvtKJ7ZmjmGfsM74AqdHlYdyJFQFWX2ftldXP/NtaeRExyewaKSY5Kp1Sjz3hY3YsCrIbumP+R+TJ+p62EvtwnshqMnjdf+XmtWBQNNzpDkNCgpSClIeSK4bgm5mXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SfvJCp/7ima11pfl07B0iZGcklh+t4Q1+Pxy6cp8HDE=;
 b=iFBqEBSGb8Kl6IDgTrin9JiN3VDmmYFr+bmX1T7sN9ephxMYKRRe4to0fv+kfM7mjUwNBbUSmzo3ZaWk0VVBS3omvZ45oQV9uNCuss338AzBpMsSy44+Rxq8lMX0OGM7onn0MXVgfzffvZ4o3FruhqycOu7oq8lPHNS/fm6Bc7psV/LN+E4w91r2T0NIZ5wQ4wa2RBuGlGyMphoC8RAE/1GKgDYDnRDQEYvdvSpyYh7Yjy98iY1eyX0VOaHwPuQRd1142xFlxEWw79De8PUkaVwvDsEFQd0O/K+59mMZBLDQqFU6NkrKsSBiSNzmSmF7t82DsbKeVx1OTszLaRuEXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SfvJCp/7ima11pfl07B0iZGcklh+t4Q1+Pxy6cp8HDE=;
 b=B8v+GSRFNcl5Mmct3WGyHXsjVnNKT4CQFM0INdC6qn/d6bfkoH4KjVbCzwECwW62K+WYApK+tUich5VuYmrhA5IRS8+dpLMBeBy9uQxs+HxlqlBlx1Ouh/U7NugqJHsMeKnDUA/GBjZl1Kep6wAqfuF1uHYZoPY8Mr4QPqzy7a0=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by MWHPR10MB1503.namprd10.prod.outlook.com (2603:10b6:300:22::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Thu, 9 Dec
 2021 17:58:17 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::143c:ea64:7017:19f]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::143c:ea64:7017:19f%4]) with mapi id 15.20.4755.022; Thu, 9 Dec 2021
 17:58:17 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v10 09/10] ACPI ERST: bios-tables-test testcase
Date: Thu,  9 Dec 2021 12:57:34 -0500
Message-Id: <1639072655-19271-10-git-send-email-eric.devolder@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1639072655-19271-1-git-send-email-eric.devolder@oracle.com>
References: <1639072655-19271-1-git-send-email-eric.devolder@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SN7PR04CA0073.namprd04.prod.outlook.com
 (2603:10b6:806:121::18) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
Received: from ban25x6uut23.us.oracle.com (138.3.201.23) by
 SN7PR04CA0073.namprd04.prod.outlook.com (2603:10b6:806:121::18) with
 Microsoft SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Thu, 9 Dec 2021 17:58:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f5ac2c80-ad1e-44e8-f33e-08d9bb3d7a7a
X-MS-TrafficTypeDiagnostic: MWHPR10MB1503:EE_
X-Microsoft-Antispam-PRVS: <MWHPR10MB15035088A35EA4B7B2336AD797709@MWHPR10MB1503.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:415;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z293uyyY94u6y1ZsYvPh6Umu4L9PNwJofP6Cccl8GrfQZ0j1aw009rEQFcoAv+txL0MbhnoRWvFmJPgFgAfBdMkoxdoqYwrVf2lrWZK2de0G7aAUZIPISl7VJI7PHuvrCgOY408e1WzUW/3XZD+sSYw6qmpKikx7Nb0CSh9PwtsufyPERfk6b1aCV+t+hWDa5eoJrssUK673M322pp0H3rDr/YH1DxqCGc+XrpDBFbzLiA1oMxHC7x+80hSWWVpisI3jq9SSBD3pCvWp1AXo4zKWBsTHsym5LbQ/UFn+CgXsbF12uE0Lvs2ydZ22PasrREhwSLO71alX0Z7hyxvrNJbusBTykZNys0Ezd4HJdmxUiXZiSBh7ZlT8jLELOalMat+y46GfuPJhAij396y1V/yBZlU77wpPfijULKZs7az51Xgd00vC1GsQ75RA4qi31x9ei0Jna/Aw3j2P4cH6ReXfLfnkZDaDKOEudd0mh7gPLsFPD51EiXspQDwnBdc5UVOmiedyTTRt7bwj0RlyClpg8mPXQcOiCHokHjsznI+TK5lfyo56A5TZ4kXECTbuiH1202exN4thq1lZUyj12x5vF/F2YEZHQpjLnp4QtK77Kdm4vG/IL+pnu6z4OQnEzyExM3yNpFlWXVnmcuaxxdx47bbcGv+5q0IXTIgkVhaRyBbNmoDaOG1AlDGjSpm6W1Sg4qPKUmBQgdXL3DKEEA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(2616005)(5660300002)(4326008)(956004)(52116002)(66946007)(38350700002)(8676002)(7696005)(6486002)(107886003)(36756003)(38100700002)(66476007)(26005)(186003)(86362001)(66556008)(508600001)(6666004)(2906002)(8936002)(316002)(6916009);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qasss0nlMDXhbN2ZaH2lqV+V+10GLpMffpcjMrLk2wqRaOi3U6YPGRuSl86A?=
 =?us-ascii?Q?ObpK6o5KLO/wEhRG6blSDYrH3BJcLffAdmFeWOW8q9F4o8z7CEqLjQHyqR0P?=
 =?us-ascii?Q?m2l311Et0/eeXpj1YIdG16r9rmKixxun93fXOpIm5G3N83guoxolhdeSQAGe?=
 =?us-ascii?Q?Th3I7O+LP7HCNZk8JEfAJntaUe56oXZjzgXK02yuxqACeNSpweYqt9J9BwfS?=
 =?us-ascii?Q?/rm+S+rrM55V9rqsqcFWiXNvQsLKgXhwCsjjgh6uREXnrDA95u69F+ODOiAu?=
 =?us-ascii?Q?suor3JKek9gQz0aRS5onv67/gXp4Jm9uJiWqrlrqbjNVxGLYs6Ph4vjSalNi?=
 =?us-ascii?Q?atJ9zY5a0fQjEOgVkXeo8E2ttQZ30LuZ7Q3qFcObH3VGEok26tTiPVRRPtHu?=
 =?us-ascii?Q?wJMvs+44Df+523sWeAiWiZGyOVCtfujNj2t6XOJDaWDNE+BJ9tT8ZujUieaE?=
 =?us-ascii?Q?dZNeoCTnwKudnzOLDvRxo92WOGWtK/pBsy+8RaA4Cw1S+PUekEkqBEPb1EjX?=
 =?us-ascii?Q?WqE9BeYZfAjGLRXqCk3FosgcNinnScj7mTzq/N/1jyR9Q3KGdd2fTb2Qn7TI?=
 =?us-ascii?Q?zcW6Tk1hj+AD5C2zeJJaMBbPR0cEnWWhAyZjHKyayyt7oW0VVCdy1yEVI7LM?=
 =?us-ascii?Q?88y7/Zu7YcdvqIfdXZ12pGb7oEotZOS4lDEffK4CI0MY3ZB+IdLOwyTGh+vV?=
 =?us-ascii?Q?5ZZoI1Duk0YYMbZCppiEay4cRU9nXOiA8hAXX2Nu9Kis7bFkxjY8MrqyH3ON?=
 =?us-ascii?Q?CdutmkejuBWSZymBik4i/WnFJRt9Xiv6DrAEByZ1UCqGfhsB4ciHqBg4A9wc?=
 =?us-ascii?Q?HpNC3ad5SYiUs6EqQJoP3HN/o9dNczQ8OHy/omxdoSNyFmlOQZBRPreGvpWZ?=
 =?us-ascii?Q?86+eheIbbT5ypgDqJrRXasOasGQQbXOhJlLXC9oyj5eZTUQapsG11sUqYEXR?=
 =?us-ascii?Q?78iQ26is0z/LNjl4ZaiAspFzZYNIB4akGVxM5ZL+R8mcfkP6JEDjYjXLAcqx?=
 =?us-ascii?Q?wOwOX2YCY4HblyEjtYRC+VLpKQvhzjdnqoBKlLthfDWb5M89xb9Q1dNUJY1d?=
 =?us-ascii?Q?s0YDZiYBV1gAoPKj3+mLMZWgmZz7GJMA4cjH7n2nnDVB8Pw6Hbghy2yodptz?=
 =?us-ascii?Q?nm+i47D/oZwUOrVyLIs1S4rP286k6LIAKXKq8k1UVB09hfiV17Jd/VB/uZM2?=
 =?us-ascii?Q?0HaBFKn3355zZf7M0aKIbFW6AyOTTRaEzLGb37YstMkT+jOdexZ1lFGE6MsA?=
 =?us-ascii?Q?6s2gM5+NANFCPSuCfcuV6P6uJmf96X17XJUEhM407ovxSbkkAHeBsAO398Z9?=
 =?us-ascii?Q?uMVEGAdT1zsMRfbSc5Vr3J1Yf+R58v0WlOsOfWrYbhm05jHqlyS4zXf5YZql?=
 =?us-ascii?Q?gHn3dAZbuWijMA3VG4J5o9B/wCuOvhsZCmlWOxK5MusjDmxsB7pieXTtRzqW?=
 =?us-ascii?Q?07iBzS1yniLuP8K5dErH51OIuLO/Vq7uS40zk6se0E9SMDUhuNWrqbY6+GUX?=
 =?us-ascii?Q?zzUJar4qZXVJ1kkf6kWZhKqWJTX5k0GnZZdQCt8ezE2r/mdvCTamKDJb94dz?=
 =?us-ascii?Q?nUbrOnathrdd+2yku853qeQWJmrhJ3XvTklQyr3sBbNazFQSTnyOH5nUskgJ?=
 =?us-ascii?Q?qeeW4q9/7shRMdFdkD5f98gOOg1iPowJ/Yjdhm2b8aza13mIuodF71XWX7Pi?=
 =?us-ascii?Q?Ab2/jYh0ngznah3r1Ld+ZG4KzBU=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5ac2c80-ad1e-44e8-f33e-08d9bb3d7a7a
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2021 17:58:17.3475 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /RYEuCivLY3vdcc1PiO3Z8P3kqa6qUn2Ex+GzI0pqrBPuS+fYtdQEy4/Gmi6/3m+dcO1R9Y6aS76nCq1p9Ejfi17Ubky13Odazdokoh3QAo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1503
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10193
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=934
 mlxscore=0 spamscore=0
 phishscore=0 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112090093
X-Proofpoint-GUID: aEY3S4GR_tNwtjsP95pZPQwRnRRULtAX
X-Proofpoint-ORIG-GUID: aEY3S4GR_tNwtjsP95pZPQwRnRRULtAX
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


