Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3512C3CCE00
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 08:34:58 +0200 (CEST)
Received: from localhost ([::1]:46588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5Mrh-0001ci-68
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 02:34:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1m5MlH-00049Q-CY
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 02:28:19 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:32156)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1m5MlC-0002IJ-Qk
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 02:28:19 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16J6GHn9029063; Mon, 19 Jul 2021 06:28:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=82EyQ5Xr4Rr03Me9GioAsIl3kdlCseeiWrWJ7DdI8oY=;
 b=uuOzxM6R1YYwOzIKp406nVeNQQuwAIxQkAXbXnas68LZqWOpA5PYjI9PKiwTlkYGs+Pr
 k7rxISKZPiOsPNf0pfMtZTtMp4nx23074QO6240GwGRSvd0igsm+0RI/ra7/wyP/TT/h
 v1dBZARva5IVWq4QtP5FloTgbQXgVgiJJ+ACgxtju/FZSWdtf5qC8vEfLi3dIgU3iQWI
 our+NYLt+5eJYslQrbZ5e6N42+sqr6TS8phJV0fEYKJlEUnCUx+pYKv/H4W3+g9VCpEV
 hVhMVct7lZv85rFEppKfvlNtSd07q3gvdKZWQeOBbw0331xjjHzx5UbT2cFl2l3Z9M3M WQ== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2020-01-29; bh=82EyQ5Xr4Rr03Me9GioAsIl3kdlCseeiWrWJ7DdI8oY=;
 b=eqsU02O2YBXaDTScLEGTu49ahotpAuthplKEDl/KRbr5NeQHXNfKTRnCp+op672lpEtT
 60kc4eGqo5zkU8qicQFbgswzk3+7erAoOepLJRzcyyLgvLdI1XjmR0i1YaJ3seWgtORg
 M90Cg6V1wNTdccVLJwapU5PQXT7tAhfHOLeFttNgvRfqIaFka5Z4DKSe1c4O/YpfcetE
 6R2MA/BbiFgB63P+QAt02qE0qVrecld1y6BEIKQ4qayNGvTLAsZF83W2+mocT55tUC28
 ozwsC1cWX5qh7cVhM/HUh0HTCdBWcldLIO+6Kdbq0gqIScDQz04ODHkNBna60ob+FwUK bg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 39vpkwrnjg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Jul 2021 06:28:13 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16J6G9TB086873;
 Mon, 19 Jul 2021 06:28:12 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2174.outbound.protection.outlook.com [104.47.57.174])
 by userp3020.oracle.com with ESMTP id 39v8ys1vt5-13
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Jul 2021 06:28:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xnbs7uLDIjRKJnzphjFjpSiTA4w7tHjClDDZdpDgYjU0o6i/8hYCDClnSlnbLrQ53GqudO0GVFW8GaPX11m2MbS3RMWd91gAjHOuzh8kP95Mf4p3bgwJ8wO/OhAKXBk7ZoTE8nxZot2MLp3LxhMHQLaCllvmpC7trdVeeD3cjWnM+mj1QWJt0yVrX2Yb6Aad5fM/kkucgMCuW4IfxDA0rKhdPpnfsWskWMAax3lDzzi54m7FXcdNGapIuA313ZoymEYbR9aE1PsDiEx3lRN8bk+wfKe8BqVi4tWm9MssyZPsdnuDu72+5euqFzgwbKfe5L+cSUKW6gzYS92wIPutAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=82EyQ5Xr4Rr03Me9GioAsIl3kdlCseeiWrWJ7DdI8oY=;
 b=ULpEoFidy4XhEzKlmCDtYVORBKV9EzEvtkjI7Wye4Wlge/Ec2807daZYjaB6RDZO8ybqsQ2kdCD5rIoXQiusA4GEEn+SSTEAThYYnZa5mpL0uDCKgr0yDeaB2c0Pf78GOPTW3CTLyratKNEAzwMnqxOcQyPjmKZXq5ttTK4rbm6JjNPadyNEsqCytUM3Dtod1xz2vovsLVhqc4/cYs/wf6HQj21jZcEG76PxgjVOgDZAwUfz7sutevC54kMe9xvBrVRmAedD9d+g4UTWVzkweVBj48YWHjTBZAlMMllY1eEK1xPMltMlOyfSfyFSGKawOIpwnIyP+DaLi/GQ4MAwyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=82EyQ5Xr4Rr03Me9GioAsIl3kdlCseeiWrWJ7DdI8oY=;
 b=rX+Mbn3P1ImJU+y/TeLuNVgVcWBi3jM9EAxFmEt10UnKWOg0m11ilqUGpHF87ycqTO6/O+LSuUUHmO3wAR6RTNPeHifBqEQRFvctsZ3spJkZBA0vPIwqB/B5mYKgdZTeeR5HkqQzLZc8t3yvgg2ND8ihLZK/MGzKwqsg3aRhtHs=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2869.namprd10.prod.outlook.com (2603:10b6:a03:85::17)
 by SJ0PR10MB4814.namprd10.prod.outlook.com (2603:10b6:a03:2d5::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.22; Mon, 19 Jul
 2021 06:28:10 +0000
Received: from BYAPR10MB2869.namprd10.prod.outlook.com
 ([fe80::5891:a7dc:5c2b:5539]) by BYAPR10MB2869.namprd10.prod.outlook.com
 ([fe80::5891:a7dc:5c2b:5539%7]) with mapi id 15.20.4331.032; Mon, 19 Jul 2021
 06:28:10 +0000
From: Elena Ufimtseva <elena.ufimtseva@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC 12/19] vfio-user: probe remote device's BARs
Date: Sun, 18 Jul 2021 23:27:51 -0700
Message-Id: <e3db340f0300db92604f6c9611897df4d2ab901e.1626675354.git.elena.ufimtseva@oracle.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1626675354.git.elena.ufimtseva@oracle.com>
References: <cover.1626675354.git.elena.ufimtseva@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR16CA0022.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::35) To BYAPR10MB2869.namprd10.prod.outlook.com
 (2603:10b6:a03:85::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from nuker.hsd1.ca.comcast.net
 (2601:642:4000:a09:3c73:d99e:ec8c:2487) by
 BY5PR16CA0022.namprd16.prod.outlook.com (2603:10b6:a03:1a0::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend
 Transport; Mon, 19 Jul 2021 06:28:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4289201f-0749-4f00-3112-08d94a7e60da
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4814:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR10MB481450F19DE9DC6A081ED4B38CE19@SJ0PR10MB4814.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rwjYowbexP+F9M6DDED0AZElEeUw7R3wYQ2SLsRZ4sqszjWrejVXfxGBC7GEIxrPpDuMs/nvEbbsCcqhdo44Qg0ixVViF2qUjnrjJGf8g81lFzFbJJa+Y60I9KJ08HZ75ShxjcT8le9jnDKT62YwixnzjRre6oosTKR9T21kNJcOJY9p9gNDBoNRVynDjuBCvwOv46iJVdCOhG5vN6SGZLY1rT2CVc/nYqXbDzqztl3fto4xiBu1KpktoN7duz0evgwNIGR57Ls1zlUhQUvpX+plwseeRkB1osy72K11TqZVG07TCM8m+Ty6ypERxC+gvjlm7oOAVEFYdSXZBb8ClOxNd+XC1yhSzy43CsELyC29Zt5Wb5CBHVvdDNz/0tGzeVeiodo3i/7SYotIpnJ7t44FNrkgx8nlWJY/ELwM5VA9kbzIjZfai1tdRBzTDzerhnE/6/FRQ/EhzSYyrfGWVY1aL+/oyLrkzarjr1RYiAJ4YPzXxdk6dqA/AtLHBVEFoFcSQDyhiJaSIjuNajbhtd66+VaFpE2rR+XGcyRhKrha8EKkOKECMgb9Gfez6CSx8tqIDqZlSud07fSxU/cDyahIilfsbDINTHmcw35REu2HkEeUr+At6eJspzSVZt2k0i9rv+3kyXYiz5XUck4tFQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2869.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(39860400002)(366004)(376002)(346002)(136003)(2906002)(6486002)(5660300002)(316002)(6512007)(186003)(66476007)(44832011)(66556008)(2616005)(6506007)(38100700002)(6916009)(52116002)(6666004)(8936002)(86362001)(107886003)(8676002)(83380400001)(66946007)(478600001)(36756003)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ly/zJSCV9PcV4DYxkM6a9kSHuEL/vVAeqUkjnrZGg5BPSxonfC0DuqvEvPN5?=
 =?us-ascii?Q?H/vGOV/3NiGO9IT6ZflgYJD23liM1bFAg2yHbpQ5VhRk0l8RnjHhBjvwuMh6?=
 =?us-ascii?Q?PCXSx5xZVCTUmTdhU0IjWDzbMynzT4fwGto0gHWWYpt015z6i3/yw7VneD92?=
 =?us-ascii?Q?yE1ZGR+BJmOpBuyNwlH0aQqZgGa6agQOq9glkMtkOw28kxv8SVzH1FtwsfMo?=
 =?us-ascii?Q?BADfIHykR+O25aAiE4avT1mrcWLKGzlGPQNwaVV0yKnu7hl4C9aJqxn7gaog?=
 =?us-ascii?Q?inuN0XdFUJVrxJhcFkgv/qhAlm8mo3Wdx3MOP3PrmH1We54zjyjJNl40yXTC?=
 =?us-ascii?Q?hAqQNU73eK7T0EE/+xTCivKTk5a6P1jV99FEFT+II+c959fke8rIfhMcObTc?=
 =?us-ascii?Q?GBTnY+Jqkbbzs1bv/mSfshWrT6M1I8lsC8mtWtkdtNEY1dLIt0xHZsVhFOg1?=
 =?us-ascii?Q?rB55VP8r0qpZp6RUQ8Zu52iRn23YZHB7KtHKR3SKU1eyOCw8U/YuCnvGv8C1?=
 =?us-ascii?Q?qRacKD8uOEjkOU7T2B2u01lsEvBEBNhF6K/Sae1zvKiiQwAUvo/otVLzQELa?=
 =?us-ascii?Q?8wCE4Uh8CBhCZM19Gb5lJXHYf38stsIMqqkyrUSWPw47kiJ2ASb+ztLfm4dh?=
 =?us-ascii?Q?Auxupludaxhp5Hfyv1evyGZoVVNVgA6L3LOoQBQ22pIGKrR53n342su3sZXz?=
 =?us-ascii?Q?JSbuoJIRv4+ia6fHOLqBPOkzNmyBhz2rn+YOOli1byuImdzt5S3WnDfD5NSi?=
 =?us-ascii?Q?LgHJl27EpV+B+OqeaMGMLCvJk5RHpVJ3GrlJL8ltZMCaYVoA1qwREdYHQJqE?=
 =?us-ascii?Q?pMwMKtSyd2adQJY86pgq5OzeeJjS6ZrEz9l1UYxEFu/GSOUb9FTBFwLBVAYp?=
 =?us-ascii?Q?WYcVqimp7pjlUPgfSySwtxz4UvjjR9dZfsOgn1giQ5YXxTUyTMFfgelb8GxY?=
 =?us-ascii?Q?Lj5ZhLxlxWnG5QkdyIAq9nlh3qHxgqGpLRs0Qh6rrs1YyU8kYJQqCypf8Vqv?=
 =?us-ascii?Q?8cKHcGY0AirCYNBWLtxpGedR7MQyHexyQaUbjrRGpFh3neklZ0ggpLhjP7hP?=
 =?us-ascii?Q?1OeQmpLyg1H8pk5f+QE+pXu3As5BSkfnJo1Qr+KmTeDKk+hqVmFpHZr1KVcx?=
 =?us-ascii?Q?v7luPfrQf4erXVptaQEMXRU3yCOKEQszNql3XfX18aqwv/v4gjiMgVwk7J9P?=
 =?us-ascii?Q?PkMUvri1kbVix20/rBXizDSzN2uG9eRYwuMONXcyCVmafXODopepvSulnIrc?=
 =?us-ascii?Q?y7uVBfFSNebNX1raiEHFaKs4/GlpS51f6abSOub70leUiAII4S/T1JtwMlss?=
 =?us-ascii?Q?W6HtLy5eKvtj3MDZDtI4IWPlZFzLAv/PuRbgrfFQS98JATVLWNraaikzoZs1?=
 =?us-ascii?Q?l4aNEGxQm0G7V5KoUPnXCafopXSO?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4289201f-0749-4f00-3112-08d94a7e60da
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2869.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2021 06:28:10.1772 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kDF5Wl2DjMG2hXq6vpITFqxuG697UEHC0fJXApq5+isMJSeXQFGCnDPB10xj0shgHo/jtmHRZ4D6X3btR/uR49KNuaBS8yRGlp7cebDaBck=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4814
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10049
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxscore=0 malwarescore=0
 adultscore=0 phishscore=0 suspectscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107190035
X-Proofpoint-ORIG-GUID: MFK7XhlMOJLt1DsFI0Sj6tfBIhXa3Wgb
X-Proofpoint-GUID: MFK7XhlMOJLt1DsFI0Sj6tfBIhXa3Wgb
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=elena.ufimtseva@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, MSGID_FROM_MTA_HEADER=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_BL=0.01, RCVD_IN_MSPIKE_L3=0.9,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: elena.ufimtseva@oracle.com, john.g.johnson@oracle.com, jag.raman@oracle.com,
 swapnil.ingle@nutanix.com, john.levon@nutanix.com, alex.williamson@redhat.com,
 stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: John G Johnson <john.g.johnson@oracle.com>

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 hw/vfio/pci.c | 32 +++++++++++++++++++++++++++-----
 1 file changed, 27 insertions(+), 5 deletions(-)

diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 054e673552..a8d2e59470 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -1619,11 +1619,17 @@ static void vfio_bar_prepare(VFIOPCIDevice *vdev, int nr)
     }
 
     /* Determine what type of BAR this is for registration */
-    ret = pread(vdev->vbasedev.fd, &pci_bar, sizeof(pci_bar),
-                vdev->config_offset + PCI_BASE_ADDRESS_0 + (4 * nr));
-    if (ret != sizeof(pci_bar)) {
-        error_report("vfio: Failed to read BAR %d (%m)", nr);
-        return;
+    if (vdev->vbasedev.proxy != NULL) {
+        /* during setup, config space was initialized from remote */
+        memcpy(&pci_bar, vdev->pdev.config + PCI_BASE_ADDRESS_0 + (4 * nr),
+               sizeof(pci_bar));
+    } else {
+        ret = pread(vdev->vbasedev.fd, &pci_bar, sizeof(pci_bar),
+                    vdev->config_offset + PCI_BASE_ADDRESS_0 + (4 * nr));
+        if (ret != sizeof(pci_bar)) {
+            error_report("vfio: Failed to read BAR %d (%m)", nr);
+            return;
+        }
     }
 
     pci_bar = le32_to_cpu(pci_bar);
@@ -3442,6 +3448,22 @@ static void vfio_user_pci_realize(PCIDevice *pdev, Error **errp)
     /* QEMU can also add or extend BARs */
     memset(vdev->emulated_config_bits + PCI_BASE_ADDRESS_0, 0xff, 6 * 4);
 
+    /*
+     * Local QEMU overrides aren't allowed
+     * They must be done in the device process
+     */
+    if (pdev->cap_present & QEMU_PCI_CAP_MULTIFUNCTION) {
+        error_setg(errp, "Multi-function must be specified by device process");
+        goto error;
+    }
+    if (pdev->romfile) {
+        error_setg(errp, "Romfile must be specified by device process");
+        goto error;
+    }
+
+    vfio_bars_prepare(vdev);
+
+
     return;
 
  error:
-- 
2.25.1


