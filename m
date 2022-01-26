Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A170849CFCD
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 17:36:15 +0100 (CET)
Received: from localhost ([::1]:42216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nClHK-0004SJ-LG
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 11:36:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1nClAE-0005zN-Ml
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 11:28:54 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:16768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1nClAD-00031f-2m
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 11:28:54 -0500
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20QFod7N024352; 
 Wed, 26 Jan 2022 16:28:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=kw5zRb6fcbfjGiIjU/ZOl679L3q3FAE7+fmlUiHRVQ0=;
 b=OcSEaLREzN7KfQ4FLEdP2iSVunSFgv/szECVc+AOFH8e2jdvw0CHoVae1meujRfPZMaT
 jJkEx0v2WeVqw8h8jTecZ9yhVhsGWDbG3INU7buFjZ3BMUB7JH6L0zqRIJBkA12Ypi56
 aubnGF7XYHqEaeo+NIrS0o1uCBtSI7QF2XsOM9L8dXhNf/ld40WYYbdgVFfsrj31KH6F
 1EVnfzHoMENEsYkZclffRifJMFM5E2XK/lKPSZrH96I/fY+Igvcgh2474YlQanzzNtHL
 GSk4eRu5SPxRb7Byoi3Pgzymhek7OTzN0W8T6GZRfQCry9l9sx8e9RyOet8bD1lj6blG eg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dsy9s6g5n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Jan 2022 16:28:50 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20QGAWIl153457;
 Wed, 26 Jan 2022 16:28:49 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam08lp2040.outbound.protection.outlook.com [104.47.73.40])
 by userp3020.oracle.com with ESMTP id 3drbcrey3y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Jan 2022 16:28:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hA5BT2CHiHNkKpUsc/vB7XaUVGUek/xyNMNiHy5rGKoYNvIgGYSDv5x8raSOEPPKFY4Gs/j/jRVmrzTO3pMG6czM16nX6D1fD6ujag2oee9qTrZHIG/O5X3Ub1nc5JLi9wdkWVWOA8MnxSq3hL8qtBMnEyJ3upWjZqG0DZHO2ZA9STsSK41KIQ03gS/JDVy4annneQZ1T1tK5sM7DkBrSqK2XlBf0zBPaCLbhzyTx85Mo3MuHfi2u52m+4LYgVOd1TQ34/CsyM5iszYILKnbS7t1g4Q/UlQCLlS7rTzd5WZklUguJCUfsw6BQ7HsWjLYgk2ASKmnmBEpcU7DkZdx/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kw5zRb6fcbfjGiIjU/ZOl679L3q3FAE7+fmlUiHRVQ0=;
 b=oBPiacKNhj9gAMNi/CSr8J8unzZkEkpUI4rsf3gjnrawPXvsvcSLvDqfQDvr7LeH1BFNi1Owy3Pqphs8TkeiiSP8JgBNlVouxId/Ov36z9uD8X57Qoz0jzS1M5BQFKkvH4CA7Nhudkh7PkjFeauvTeTJKzDjaenOrQtxjFM71HdsBTNytOUvI/4wXhPmUc0mKhnBYn7CgjotBc+xZDC3Ka387fQy26r2cMnvnGoE7Y1q5u9PmQL97vHgjZCgdiYyAYGPEQpYl/KMDI5up4gscC3p2wapwBAY19ljKeU7C1AeHJaNdCNlZBeoA5O6BePdf2Dnk8WB7liOA1mQIRk9ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kw5zRb6fcbfjGiIjU/ZOl679L3q3FAE7+fmlUiHRVQ0=;
 b=o8uIlZKoj6kqjS7NHHnppBBLAg89NkScfvfG5BdGM3m/onJi5RlE4AnWRwwJyC+flRX19xldjK9kB/D9cWrhAp2tgOfWw8N0c6+Nj9+he90fkX78iIJ3grfmrmjCf1sBsf2+llyrYVSrMLiKCryVo39ByjYFZT/Ph1WJXFShMD0=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by BN6PR10MB1858.namprd10.prod.outlook.com (2603:10b6:404:fc::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.13; Wed, 26 Jan
 2022 16:28:47 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::ac06:be4:5723:771c]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::ac06:be4:5723:771c%4]) with mapi id 15.20.4930.017; Wed, 26 Jan 2022
 16:28:47 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v14 01/10] ACPI ERST: bios-tables-test.c steps 1 and 2
Date: Wed, 26 Jan 2022 11:28:25 -0500
Message-Id: <1643214514-2839-2-git-send-email-eric.devolder@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1643214514-2839-1-git-send-email-eric.devolder@oracle.com>
References: <1643214514-2839-1-git-send-email-eric.devolder@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SN7PR04CA0223.namprd04.prod.outlook.com
 (2603:10b6:806:127::18) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2ca16239-9ca8-40f6-c9be-08d9e0e8ed4b
X-MS-TrafficTypeDiagnostic: BN6PR10MB1858:EE_
X-Microsoft-Antispam-PRVS: <BN6PR10MB18586F5664934A926BE50BE097209@BN6PR10MB1858.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3b+5n+L2jjoZR9F0hqVVZ2xdL4WsFXVzF9h1qsZALjRTGCDo1mdtKtfrapdxTPIpj5gjG49hPrdki5uiFhJ/MZh2J2V7kLiJPAcArmdchuC4vRufCDgtu9h5EcKytC5hFDXSdnqveu2NB+tY6jDIWI8KSWo0PC/UpFb1ETI3aIa2lOAbFjD6oXTUov+4DFnTrNqNygz7Rxe/Qa6t8c3wLc+5hWPP16KpMKuJWdRFKs5K5pPkGBaaoyUC1lvqP5PDSez84CVr0BLhlaFIm8QqmVS0YGVov7XbtMuCmGmtRqURVgqV43CgjnpFFYTHlvBOtt77WwY7i4oj4luv9kcOkGcjfnrB5zFojlZJGiGh6PXfT1Q876By7NG6UYrdeyizZMti6yHnlIESfnLtN6gxnpeNLLHkVthEWiVY6ebGfi/1h2ymfBVrT3olynS4EAPzduT/42kGYx4WtfdKaRA7h4jEtbDOoODYD0SH2OHps+C7sDn25phuhLuCWFi/5qlJh/IkzjUq9/M1t5SjRqDTOnFx09qrPYP93SNPP8wvHqJzx/jPS63sCNeuHyTfSWIepeIskHvOQ2Y85b3c32HHCMyaF2gWU7ZDuvEBmPW/cv/c5MIoRlqzw0uD9otLURVKyvt4LaeI+wNHxDBVAL6YTFLH7uGbfPa03+Dnr6Zx8z8K2Ldbl4v6W0nYKSZxCOoZhmRt1b/sK2GhR95QhHmQVw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(4326008)(2906002)(6512007)(26005)(2616005)(36756003)(316002)(38350700002)(38100700002)(5660300002)(8936002)(6486002)(66946007)(6506007)(66476007)(6666004)(66556008)(508600001)(86362001)(186003)(8676002)(52116002)(6916009)(107886003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XcsEkLs+k0v83qWAqpjsV3zvsqzCGQqCZTzhjkXWUS4Li29iS/jxCR5rTJ+M?=
 =?us-ascii?Q?b7F5epkb2BTdKYK0Fr5564QA4lS+MWixE2+EHY04p9nzERCnxXHz1ysp02MW?=
 =?us-ascii?Q?LQfkadOugLEz8aab0kumLk7O9IclU6BE4NKu059HYJpEe08UVmJLHkvPQVT6?=
 =?us-ascii?Q?0ocEoYE4Y7rXf73PN3bIjoOqNcyws6rbJN+v0y4+Ec64ecxyvS7+dgzNnnmB?=
 =?us-ascii?Q?wPUA3NMucIH03bfAmY323E4HvoOwJnRC/FmKCv7DvmdQFrHJ/cVAnouRGvv6?=
 =?us-ascii?Q?biamjQ/eIKOXNKSAFFyuQbbjqB4WU71lpJtfVDrz2aDGNph/FDbpOL5TDtz1?=
 =?us-ascii?Q?aQ0gvLkpXGBSwoLqnvGfl2B+FcCtaxt3fvTIECO8cM9Exp22EadTYjRgQwsM?=
 =?us-ascii?Q?fo1Or7tTwYnn7k+Itpb0VDU3jKJdZ7vy2q2L77avv22rW27QdMwslYgiZpyb?=
 =?us-ascii?Q?Y6a+jB8OLNbWmj1GLX5krOJsZ1HRNm6GsRHcxTJ2Tipx3dY2i0fHWXGHwIqT?=
 =?us-ascii?Q?pBaqd6WnOllbB8A9tIa4PvIRJ0Nhsg7k98lBQ3jmvtfnh9ysQwOi+6Er2H9g?=
 =?us-ascii?Q?q9mSgCWmFs1+gXaiHMKsQ8TYIdQx9qGJqJsqg5VxsD41w/HzDLfD+fb8bKMF?=
 =?us-ascii?Q?fKSDL1wfrzWlxaKyqRC9WmUCzZcYT0I3rgZXFf062T7x5h972XnF4Qg5dsJe?=
 =?us-ascii?Q?mDMSy8qFd2V1P6C+on1go9VWkBU92R9M1KXN97pu7MSXOldSUWEBgYYDkHex?=
 =?us-ascii?Q?xiuROPANmuUz4hdOrvTsZ/+kR1fMA6czWY3odycc4GXeDMhCHz8d+HU1fHNh?=
 =?us-ascii?Q?SCTCwx4Wm1fia/42dL5arZ3qeJYwZ+9wZBWPAKGVZMMhWs7djELyp0MdsX6L?=
 =?us-ascii?Q?NhZ6ZxNTb1cgxX4ddptbqefOxpNk03aX7I5WGp5tR10JCVagBkikibgqfdBu?=
 =?us-ascii?Q?K9XDeMnj6dB5DgjW+6PCCf7Y3/EYsxK3WPckyl4qg/3c/WflspaCOCPKmb8L?=
 =?us-ascii?Q?ijsyDa2OVgeU5k4BwZxYymB6Tb26NTkhrxx405kyiUhqJUAl2cmRPHZY3MBV?=
 =?us-ascii?Q?9olWvSGkVwy+RTAcdtCw4GSsJKgL7RJ4EQXqGAJJDknodDrorOXlCXZnmoWq?=
 =?us-ascii?Q?bGd5pHYFgbedGcVfJv0rKQ4SlqbeiK5Yl44/F+PpP1nBEri7HDIq+gFVSt4s?=
 =?us-ascii?Q?6dzejpZqyK/6AfFufVQaeF/C/uCSQV11+w92hFvZXSTYo5KxB9P2E+WCBcdT?=
 =?us-ascii?Q?h6GGuOwuKma43j2s+Lvo5Fnd1H2CsUYuWzBRKEDoCkC9s2mCYYqgmqyZOm5j?=
 =?us-ascii?Q?7qC3HxoQXQSPFXGd+nEKZJ+Qj5onWGeDq+odRwFxr38l+lldbn+MBEyC85Az?=
 =?us-ascii?Q?zrW8hf+ydBc6ptBXGNvRGS8nbEQzMz7qc8TP6gyJ+pqNME02OsQ0LXa16K0R?=
 =?us-ascii?Q?5bNpSgOn2cB5XPbjIqdAJTHbEf+2wFghpwJaVaXj0cSgcwVCnKwD4qy9D3oC?=
 =?us-ascii?Q?ToWi5FEn+lYeyT22ZNqBu/fHnJMkpLCz4ury77bUMS45efF7QtBN8hEeOeti?=
 =?us-ascii?Q?H+N9v1VAmDAQpDfgucg8ig/Q+okSRnplQMyhJtNd5i7IZzzTL/+J/R0fjHmM?=
 =?us-ascii?Q?aX7DzzeMS3qXDKpiUJTlxX6lQDe2Njmcgj4Ak3kkK33NTC1g+nEGjY089NTk?=
 =?us-ascii?Q?wnHPwg=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ca16239-9ca8-40f6-c9be-08d9e0e8ed4b
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2022 16:28:46.9555 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ygqMfJWgje9MHpoClTf1FyqX/4jeGIdDuQ8Sh4oEI4EnEKMGRb5SswZcRlu1jpLHQI3JFqe1GrejIqRNXY6DMubTSf55+2buCg7aMiMup/Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR10MB1858
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10239
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxscore=0 malwarescore=0
 spamscore=0 phishscore=0 suspectscore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2201260102
X-Proofpoint-GUID: fMrZ91D7JNZXVHT2NAJc93ai8j0xXQkG
X-Proofpoint-ORIG-GUID: fMrZ91D7JNZXVHT2NAJc93ai8j0xXQkG
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

Following the guidelines in tests/qtest/bios-tables-test.c, this
change adds empty placeholder files per step 1 for the new ERST
table, and excludes resulting changed files in bios-tables-test-allowed-diff.h
per step 2.

Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
Acked-by: Igor Mammedov <imammedo@redhat.com>
---
 tests/data/acpi/microvm/ERST.pcie           | 0
 tests/data/acpi/pc/DSDT.acpierst            | 0
 tests/data/acpi/pc/ERST.acpierst            | 0
 tests/data/acpi/q35/DSDT.acpierst           | 0
 tests/data/acpi/q35/ERST.acpierst           | 0
 tests/qtest/bios-tables-test-allowed-diff.h | 5 +++++
 6 files changed, 5 insertions(+)
 create mode 100644 tests/data/acpi/microvm/ERST.pcie
 create mode 100644 tests/data/acpi/pc/DSDT.acpierst
 create mode 100644 tests/data/acpi/pc/ERST.acpierst
 create mode 100644 tests/data/acpi/q35/DSDT.acpierst
 create mode 100644 tests/data/acpi/q35/ERST.acpierst

diff --git a/tests/data/acpi/microvm/ERST.pcie b/tests/data/acpi/microvm/ERST.pcie
new file mode 100644
index 0000000..e69de29
diff --git a/tests/data/acpi/pc/DSDT.acpierst b/tests/data/acpi/pc/DSDT.acpierst
new file mode 100644
index 0000000..e69de29
diff --git a/tests/data/acpi/pc/ERST.acpierst b/tests/data/acpi/pc/ERST.acpierst
new file mode 100644
index 0000000..e69de29
diff --git a/tests/data/acpi/q35/DSDT.acpierst b/tests/data/acpi/q35/DSDT.acpierst
new file mode 100644
index 0000000..e69de29
diff --git a/tests/data/acpi/q35/ERST.acpierst b/tests/data/acpi/q35/ERST.acpierst
new file mode 100644
index 0000000..e69de29
diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523..603db07 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,6 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/pc/DSDT.acpierst",
+"tests/data/acpi/pc/ERST.acpierst",
+"tests/data/acpi/q35/DSDT.acpierst",
+"tests/data/acpi/q35/ERST.acpierst",
+"tests/data/acpi/microvm/ERST.pcie",
-- 
1.8.3.1


