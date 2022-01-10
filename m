Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE4A48A332
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 23:52:20 +0100 (CET)
Received: from localhost ([::1]:47146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n73WU-0006FO-RQ
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 17:52:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1n73NB-0004lw-To
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 17:42:41 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:40034)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1n73N9-0001r3-L1
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 17:42:41 -0500
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20AJm5TC026301; 
 Mon, 10 Jan 2022 22:42:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=t4WojR4pPgZM7ReGPbmzFpfQeLKcgV8YM5y77IDNGc8=;
 b=ULb03pO9DLQhqh6kxiYpFy+1pC4DuyN1C+3BrhB14+s0PyYzyh0aJ7OOIdxy2yrz3HQA
 29B06KAcRDhOJ0TLBiNkFSBeaVzvqQyJy313SsrCG9KbvEnNn0ruV1VbVgwOew4rfBfr
 yljgaQ0Ls6gCqVxU4DlOWBWrZzN8L3n+6rX3uVg6+L52pEw2w9iyFiCpqTJ8xh9/1wyO
 eYB49VyPA+TwYNSNyM57qeDamZM4gA3ple/u0mW73eHBIUmmn53hhKQ7VlJUGfGPVw5C
 +e72XWYnZcLVMOg8YBJNBoHpGrb5kHhI/IAxLClKcZv5vkdbYfU2XkJMwSBJ+szZbDGT qw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dgp7nhck9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 10 Jan 2022 22:42:35 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20AMZZ4S009118;
 Mon, 10 Jan 2022 22:42:34 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2049.outbound.protection.outlook.com [104.47.66.49])
 by userp3020.oracle.com with ESMTP id 3df42kpj9a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 10 Jan 2022 22:42:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OLui457Jt2j2/OctzXh7XKU4OpDuW01eJDv4MM+j6vG9gr8jT+mJQ2sdalMaYppyc1UpIp7c2o0GyjtPXAjazM63GZU4OX5aq6Jn6VxDmNnQssUADQidg5PG/xy5S1MuYMUz8CuK1OJ+vC8uyLqsLAO6JacLrBdl70HQI8eXzZxb7wwZL7fXXD0Y54bPJtBFBwTceO0cZC95GbBFFDtFIlIwvd28TkeEtkk5lYZIZq8q71seeZLP65IZ757gp+/CAWggzadpU5H4wWYgDX0FabI/bdYHAo4tuwsgLPOV7I87pK/ZGdz0OSrh2qakxUeHHyG3tz3btXZ9H+wJP36aHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t4WojR4pPgZM7ReGPbmzFpfQeLKcgV8YM5y77IDNGc8=;
 b=Givym7iCFYWeRzj5Z9ZpGyx8ntSuKGBv0U6bqa47rEJMJQeA7CE+UitVU4oVSvE3S4dxG2U3Rtx/xH4Ag2LIJ8z02LqxawZMpWvphMr7lB0eK1bnJimS1M2Yg4yuHuDy8EVkKXpRhxwvizMKC2ELuW1Vd35oP5CYkQLKAhdEgl+LkbJsfgeqhKiA9wpZvSJ1A/5HtpTQoh2EMLkvTyqjoYgCgADgmoR0pSo6rn6HaWG9Zl8oLJZPIqa9vfKFkgzCT1VL5L+gDK+7zGZTI5I/Cqxo6nJZLqqKPKALfOgMrAkSNibJefd28sV432KVFXbdVii+WGHZ/DQPb/wrDXR/qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t4WojR4pPgZM7ReGPbmzFpfQeLKcgV8YM5y77IDNGc8=;
 b=CDG0OFEPVIhRwCWLzM3CWPm03l5SDAxCBui8Ksm6hDE4WxuqRu/2n/qkUqMg1W28AdHGGmHM4D4kVAikiGHfsjg+A9tzBXFuMFcEYGoMxoxX98YN8Ch49KFvrOdN51P+H7jeOnPBuIWtbItGtRzIWivcG1cdcxX+l+gI3DaLJqg=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by MWHPR10MB1600.namprd10.prod.outlook.com (2603:10b6:300:27::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Mon, 10 Jan
 2022 22:42:30 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::d573:6cc0:c616:6f2c]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::d573:6cc0:c616:6f2c%6]) with mapi id 15.20.4867.012; Mon, 10 Jan 2022
 22:42:30 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v12 7/9] ACPI ERST: create ACPI ERST table for pc/x86 machines
Date: Mon, 10 Jan 2022 17:42:02 -0500
Message-Id: <1641854524-11009-8-git-send-email-eric.devolder@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1641854524-11009-1-git-send-email-eric.devolder@oracle.com>
References: <1641854524-11009-1-git-send-email-eric.devolder@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0P220CA0029.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::13) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 35b4c3a8-08c1-4a78-9eac-08d9d48a7c44
X-MS-TrafficTypeDiagnostic: MWHPR10MB1600:EE_
X-Microsoft-Antispam-PRVS: <MWHPR10MB1600027E13DE2C44CEF2B27B97509@MWHPR10MB1600.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MgCBePjpI/4nIcLqIhtBN9lKkhN9y9WmBjT4qRa5YYAX7jdz0hZMX/xhDLMWhqbHsFSPOLOy/QOR3U7Arnu005mJ6wRa5HcR2IvYutBBoWnF0W5SvpCwLjU/AMlB69+nyEQJ4kU3gw9/Ap7IahzYmCf7FuDY/gPFjlabtzLqv/t42lhGL0E1tSke17EYnbDYOltIt0qlAQn1BsNxrXjb4FZqWiSR15Z6qizsMVwE7C6tYVgghD5g/vaPykX/I+TgryRK9eupEvoZLobgjh89YmEnLUDlB5Udj3K60tKlBdPJ5EvLeQUe1L3h92seF4t0UTgdCHki4f+V63qGdqP0VsqXs90GaXxZpx79mYY+0NSE37opi1vM6BvhBvn7v0YyvtXBoQw4u8EV6UzS52GMKRQrTUlZGj+vIgFMbQiAs4QZhXCtLNqn062wW19KvyPkoOgFIN3bZXc3svR7xME02YHLas/vld0RRqwFuskSJU0ldR3m6ot8ISzIve+ezcx2grp1mf6Mqw4J+jrQSUu7u6blTZ/DtByClT3898rbA4wNU9++NplDUnrJEGpOxMuRjEPOw1xr9SrhG0QSwNVEaP1JAVzLIG7CuOBbDLfLTA+85GoOYpxrZAU9TNvPvcufSE3WkISAVnvh+q8bAB1XjAvUTEshsHwzcQ9GL3IYEFSwT7pROdPwKqdH73THKW1d
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(86362001)(8676002)(6486002)(66556008)(38100700002)(38350700002)(36756003)(8936002)(66946007)(316002)(2906002)(6916009)(5660300002)(66476007)(52116002)(6506007)(107886003)(186003)(508600001)(26005)(4326008)(6666004)(2616005)(6512007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1V7/Ga2E1PUZLL1H37pyYL3RtBFc9e0sR38gyPu9pfao9Z6j6bU+VJ0nkZbW?=
 =?us-ascii?Q?tmrjQ/w0jLSxN5evEovpiZh0jR3wX61lyf4UIPLM935KNkX4bcU+cek8VBuO?=
 =?us-ascii?Q?So+7FLoXauqQG8vQSWm1RH0qGuZr7UxSyR1vlOZPCVARsWP6ydoy9mGo2zRl?=
 =?us-ascii?Q?eL5FFUEi9kXQz0yoB3vzBBVTjcQcrV1NwTsBEKJpFpHNdq56lJtOaAXCVuwQ?=
 =?us-ascii?Q?d6+h3fzZIk7zMwmkmqMxgSMfeual15Ulh6+cNVpQHsArDojNGsrimgbSoEiP?=
 =?us-ascii?Q?vrH2Ytulyi50miFIV9vAcFjKWvS90fdMvIZHUwpLDWK90XJfPW9WMOObXD4x?=
 =?us-ascii?Q?k8Y6V43NcbMOho/Krn9CSQORxR/exEmB9BnNQVMCGPc4nFnd3H2/7Mv47qGw?=
 =?us-ascii?Q?PJJkRXnJ0WKiCxDSmwOafAoTkrE+tCAO3ysRWpfJ0NexSJrDtNQTXf/ZtyaV?=
 =?us-ascii?Q?Ifpo7dhOs92L+SpMmq3s/Li9MznU5HfuQpFuw5YDiES6D2H7gwsvYQ//QpxY?=
 =?us-ascii?Q?WiSKcDWmCWXBS+swy00241mbehNsrghRClUZHtmKRFxjyGLyHaIFLdHptAXy?=
 =?us-ascii?Q?+duRqfR53GjD0GAQ8m4BSxNgD+iU5F5nxNBIXbvZVqAEeNpN2I4fNuKWRvJd?=
 =?us-ascii?Q?mhuRkvkgwxyerNwq8qipCdoLNuBnm++mXYMwAzck2JJsaEbaKIGZJRkz51iD?=
 =?us-ascii?Q?89Nh6oTJUMx0M2NeQcG47RofaTO49K2j/t7TCDSqkmO2eG4xXuIb68B0z/rp?=
 =?us-ascii?Q?O+1lW+VlZgorEdrQC7VLL1XuP585SodYzQ9N6gQglgkcEkHCIuiO9rIpiBPO?=
 =?us-ascii?Q?JA8fsLzKpaXjfKJ48qojIN6vnQL1z4qRHPidp72E+vXMF2yvJ+jkPN9d4ewX?=
 =?us-ascii?Q?GtwxZr9n+GcaA394HDfLy7I40nw8+rdQo81ptkazuoinghktfhM8qI0nVzDt?=
 =?us-ascii?Q?eRdcUXkQaAr9E9ma7MwRvrGTH2wQiH6/1+d9YYuyoFHliWbW2NI46isvm2UZ?=
 =?us-ascii?Q?KJ8T75f11+Jo5+p0Za+6Fyia/8025pE1oWU2L0piry0IMjEkyauHitX3NBk1?=
 =?us-ascii?Q?flBSFdPH9UcrIL0kpQSr6Doy9KSBy3/DqbQn4mtK5aketdKvgKzAv/KkretC?=
 =?us-ascii?Q?Bmv94eRG64F4EoS8PA/QWkrS3OCWhySHmE6JWxTtWUsMg6E3IsdM0ef8w/L2?=
 =?us-ascii?Q?/U6Qy7vuazIZxVNzHJ23qLaRgSOVLgMCTEGodTXY+Dv/+gmEfwEJUzjj9itV?=
 =?us-ascii?Q?37lsPaTlZZz017Kv+A8FVEDhJ3O6+NY3/wB0ONx1d9SDJakzyzLNp6YwEW13?=
 =?us-ascii?Q?ZrZK61w1PTZAjOITasYsvPN/8WUH1hpkWVaHudcRM9ZVkCowbRTpan5jNhxw?=
 =?us-ascii?Q?GdceVQEkjuS5HqEGK0dks+5bHL4GB/y4LJBxfhc0N/gIBMK9lc/olQYfHKSV?=
 =?us-ascii?Q?jQO8fU+dEEpus0snQkdVsfSEwOLib19CKEqo24rp6KRWWRWSdFhOQhrwABlP?=
 =?us-ascii?Q?Zfnu6bfrTX7877/bBxipilq+Lmuu4wqCOqlxpKD9XXWJ3LYeHcLDmKBSAsZc?=
 =?us-ascii?Q?CGLSdiIDd4EuI4PQhzgmZcX0rIzi2Cg/Ea+e5KoGPbx+GmOszXgxcckWPmkt?=
 =?us-ascii?Q?HKRwMMt5v/3E/AW23g3kTDX0T6QVT2+uguyxCKo/NKBJta8jJWnuvAxWtcKQ?=
 =?us-ascii?Q?QSdd/Q=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35b4c3a8-08c1-4a78-9eac-08d9d48a7c44
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2022 22:42:30.7113 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wMqEE6cK+oTtZl8tdNteEqfvykGY99Skju+HrQkUH7uuq5J8BrcrbUfW+BkjgarQgnrf/4uAc2GNP3SSNUqI8NryRko05neZcmODqQ1goMg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1600
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10223
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxscore=0 phishscore=0
 mlxlogscore=999 spamscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2201100146
X-Proofpoint-GUID: vcSWHiA3Qzej6YvkKY3o_bako-tI4mch
X-Proofpoint-ORIG-GUID: vcSWHiA3Qzej6YvkKY3o_bako-tI4mch
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

This change exposes ACPI ERST support for x86 guests.

Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
Reviewed-by: Ani Sinha <ani@anisinha.ca>
---
 hw/i386/acpi-build.c   | 15 +++++++++++++++
 hw/i386/acpi-microvm.c | 15 +++++++++++++++
 include/hw/acpi/erst.h |  5 +++++
 3 files changed, 35 insertions(+)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index ce823e8..ebd47aa 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -43,6 +43,7 @@
 #include "sysemu/tpm.h"
 #include "hw/acpi/tpm.h"
 #include "hw/acpi/vmgenid.h"
+#include "hw/acpi/erst.h"
 #include "sysemu/tpm_backend.h"
 #include "hw/rtc/mc146818rtc_regs.h"
 #include "migration/vmstate.h"
@@ -74,6 +75,8 @@
 #include "hw/acpi/hmat.h"
 #include "hw/acpi/viot.h"
 
+#include CONFIG_DEVICES
+
 /* These are used to size the ACPI tables for -M pc-i440fx-1.7 and
  * -M pc-i440fx-2.0.  Even if the actual amount of AML generated grows
  * a little bit, there should be plenty of free space since the DSDT
@@ -2575,6 +2578,18 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
                     ACPI_DEVICE_IF(x86ms->acpi_dev), x86ms->oem_id,
                     x86ms->oem_table_id);
 
+#ifdef CONFIG_ACPI_ERST
+    {
+        Object *erst_dev;
+        erst_dev = find_erst_dev();
+        if (erst_dev) {
+            acpi_add_table(table_offsets, tables_blob);
+            build_erst(tables_blob, tables->linker, erst_dev,
+                       x86ms->oem_id, x86ms->oem_table_id);
+        }
+    }
+#endif
+
     vmgenid_dev = find_vmgenid_dev();
     if (vmgenid_dev) {
         acpi_add_table(table_offsets, tables_blob);
diff --git a/hw/i386/acpi-microvm.c b/hw/i386/acpi-microvm.c
index 196d318..68ca7e7 100644
--- a/hw/i386/acpi-microvm.c
+++ b/hw/i386/acpi-microvm.c
@@ -30,6 +30,7 @@
 #include "hw/acpi/bios-linker-loader.h"
 #include "hw/acpi/generic_event_device.h"
 #include "hw/acpi/utils.h"
+#include "hw/acpi/erst.h"
 #include "hw/i386/fw_cfg.h"
 #include "hw/i386/microvm.h"
 #include "hw/pci/pci.h"
@@ -40,6 +41,8 @@
 #include "acpi-common.h"
 #include "acpi-microvm.h"
 
+#include CONFIG_DEVICES
+
 static void acpi_dsdt_add_virtio(Aml *scope,
                                  MicrovmMachineState *mms)
 {
@@ -207,6 +210,18 @@ static void acpi_build_microvm(AcpiBuildTables *tables,
                     ACPI_DEVICE_IF(x86ms->acpi_dev), x86ms->oem_id,
                     x86ms->oem_table_id);
 
+#ifdef CONFIG_ACPI_ERST
+    {
+        Object *erst_dev;
+        erst_dev = find_erst_dev();
+        if (erst_dev) {
+            acpi_add_table(table_offsets, tables_blob);
+            build_erst(tables_blob, tables->linker, erst_dev,
+                       x86ms->oem_id, x86ms->oem_table_id);
+        }
+    }
+#endif
+
     xsdt = tables_blob->len;
     build_xsdt(tables_blob, tables->linker, table_offsets, x86ms->oem_id,
                x86ms->oem_table_id);
diff --git a/include/hw/acpi/erst.h b/include/hw/acpi/erst.h
index 9d63717..b747fe7 100644
--- a/include/hw/acpi/erst.h
+++ b/include/hw/acpi/erst.h
@@ -16,4 +16,9 @@ void build_erst(GArray *table_data, BIOSLinker *linker, Object *erst_dev,
 
 #define TYPE_ACPI_ERST "acpi-erst"
 
+/* returns NULL unless there is exactly one device */
+static inline Object *find_erst_dev(void)
+{
+    return object_resolve_path_type("", TYPE_ACPI_ERST, NULL);
+}
 #endif
-- 
1.8.3.1


