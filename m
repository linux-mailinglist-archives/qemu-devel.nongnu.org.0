Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5877A4986EE
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 18:34:19 +0100 (CET)
Received: from localhost ([::1]:60582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nC3EQ-0000yF-Aj
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 12:34:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1nC2yI-0005eA-96
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 12:17:38 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:35780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1nC2yE-0007lc-Cx
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 12:17:37 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20OFptrA022861; 
 Mon, 24 Jan 2022 17:17:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=t4WojR4pPgZM7ReGPbmzFpfQeLKcgV8YM5y77IDNGc8=;
 b=PrWkRivDcI/ENN/kEK6v7mLrr/WEfMpFpocWqQ6w03ynU0mo+urAGcdjnhHAGF9xwjZI
 zjWPvGrj3wuwoWEMq00ksnChh5Pp2WkiXNvdzw7uzDPrqXv3jsQz9nx3WXPZ9CLf6Mx/
 uH6mq0N8II/v0hKRQjmKat9huB2zGFy5KWabH6SgTRmss6gwD6qV1/0rn8eZybC8bvL+
 2AnsfD98M9ZA97NdkzwEedcDPu1AhjN/20FC1aRFOxaZJIVJA2VEKQey3b606/6zNHh+
 aRHpR8j/m9IELxO3yFKEk8vjpkVBV4x/Tz/ef4ZS+J5v4QjsyEsaZ32jBdI+EKPZjCBL 5Q== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dsvmj8uhf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Jan 2022 17:17:31 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20OHAiYr051685;
 Mon, 24 Jan 2022 17:17:30 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2176.outbound.protection.outlook.com [104.47.56.176])
 by aserp3020.oracle.com with ESMTP id 3dr9r4djpd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Jan 2022 17:17:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DBFw1RDM7tL1u672i5FguRmP6oJKLG61F59+I9qez+BW1nALDvz5dUSv+GcyZsIU9D/WNk68EzR+YDQVfD7fINFCSGSpKhSM1Uxe53383BLsyyiv52/O2+3xnVcb3z81twnKFgbpwNBE+fgBbBW7mXCr6hGvpLOQsSHWFVEi3aC6J2X0dVNMie45TLtzbdzgHm08R8BA4XJHm38C3lJ0x2RD9qKEomEXptYKHVvB+8O4zeGfiez4lnglALGG0SDjn2WRwnkG4iEj74nb11LDSE3rgo/xMzhcQBzEOE8jlLy13uT0BhwT7g4YpeGyiAD3IIWlcs8q28uZjV4g4kYhAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t4WojR4pPgZM7ReGPbmzFpfQeLKcgV8YM5y77IDNGc8=;
 b=KFFZGRxav6iWIqcc/k+y+JKtzkydECxfd2ToCWAPtFoH0yftT5DwAyuMIPAHNYUysq5c7UiVZfXYLLIm6xLzeXrfRxl7NfLGEovQkjYwsDzaTKBRAhbKV2OeHrSxr7fKrK8M0R9cYleY+tQBVkO/ThB6eUaI0ugTScQJoKN+cDrqLXzVpDgibM5IKnPtahaMfTw8UBH0tx5ynTYgWHEuEs/ttZAPOktzOkbclmdu0M25rxsG97UwsfefKcyP6Mujx4RHL7kxWDDl2hODVis+KI3TqRauJQ0BNui9JRmHgk/jdkNB2nCfbUePAZRstIOgjjECvlTu0azzafb3AEgHkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t4WojR4pPgZM7ReGPbmzFpfQeLKcgV8YM5y77IDNGc8=;
 b=JiBkBirZ9dD32U1INl2naDK3yyhQ623musQtFKt0v4XXGOi0Rw46HhsVU0Zm8F81GLgzYsqaAJ5KyLecMSJRC0Rk4LCdT9prIRGZ48A2k3vg6e5+3pU20u6CptXd11eYlbO+wHJQibdeiW7dvPtaFFTJdisXoDlHYgS+CPLsWW8=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by DM5PR1001MB2265.namprd10.prod.outlook.com (2603:10b6:4:30::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.10; Mon, 24 Jan
 2022 17:17:28 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::ac06:be4:5723:771c]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::ac06:be4:5723:771c%4]) with mapi id 15.20.4909.017; Mon, 24 Jan 2022
 17:17:26 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v13 07/10] ACPI ERST: create ACPI ERST table for pc/x86
 machines
Date: Mon, 24 Jan 2022 12:16:58 -0500
Message-Id: <1643044621-15892-8-git-send-email-eric.devolder@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1643044621-15892-1-git-send-email-eric.devolder@oracle.com>
References: <1643044621-15892-1-git-send-email-eric.devolder@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SN7PR04CA0055.namprd04.prod.outlook.com
 (2603:10b6:806:120::30) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9e33598d-c69b-4eb0-52b3-08d9df5d6494
X-MS-TrafficTypeDiagnostic: DM5PR1001MB2265:EE_
X-Microsoft-Antispam-PRVS: <DM5PR1001MB2265A301A6F55053DDC78403975E9@DM5PR1001MB2265.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6qteDEE3Au3TrC00wXf70ktPYAvKDB78d88QwUQu6iDG0OJJtz5IygHorWdKBUQ0KZzr6dS/M1VmATwGVxZz03llxW17c/R0nzT9PsXFpS8Eo9EQxQYGgcxNZETt5w89oFg2ZCzDm9owYfyH6lh5VMw7A7EvdeSWg4c2NEzOJxxm5tqXKLQ707FYp1MQhtmBQm3fqHPIlVLVZxxC764aiLfPch/mcoP1FcxCbCVDyB4aX8vq25JqTQ3JDASZYoH8vVDMWZ+z1ekhFaZJmztdSCg86EmbICpxYPn+quP/kL/txIG069AqF/fetrfpOVCF3pjbHWrDlu1BA72ih5jEJmz1vqgp17ey9WDx4xtaUaBXagwQezErc1/DTNmLndPH1K5DTbHXy50Zujk2eTX4MyjfT1szwfGUj9GTBEte8KML/7t6L5Z5W7nsRM4dJYI7+HY7DrgGGyWvvSasg7cH3cT8umkqn43Lb6qto9d/6phaVCqbc1fQFuYOfoqfm38SQ3fEVRS51mVoZJltgCaNOPtOOfhu7UlJcn5AK9O/eIGociva6ZB7Ha0XvY4Vo30pimKUFRcL2C16OO8ooTqNOJz/O0+hWTLiWyMjeucQvVxaVcEYo4pI7qaW4CyVBdU3DfyD7UDp4aSSBxTEjJK9lzTZejqJEtC0f6Vo7Q9lUhao+tDVsI+QSin5o7vgrhsue1qDCTKPfC606aCQUxOOdA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66556008)(5660300002)(508600001)(6486002)(316002)(6916009)(66476007)(186003)(2906002)(38350700002)(38100700002)(36756003)(52116002)(4326008)(66946007)(6666004)(8936002)(6506007)(8676002)(26005)(2616005)(107886003)(86362001)(6512007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9jHk6YwAnYubopFbSsSWE7otFw955US2kJHqLcFLbKD55f0zfGp3BLIiMl7v?=
 =?us-ascii?Q?3xXYWfATROSxZsGwsbXmcNaSTWNOX3MzSbo6GYsAofzYdQJXWfku7i82Zv4H?=
 =?us-ascii?Q?AHEFXPvLcLMu28r2VvUTSl2AJuGUWCmGp/Ho7ZWci5sbavyY4frixRp8A4VS?=
 =?us-ascii?Q?+Fs3JhlT5EPd1N8wquiWFHTwQn4SXSxPN9kEqCZm6C5qzxciUfuaOKOcBoby?=
 =?us-ascii?Q?XxZUzwll33KKfyV8rz8NB7CV0etC07Vdi+OEPkwfzU6mSMRMmgCXeysWZFXJ?=
 =?us-ascii?Q?+1ZMxKbJMnQRzF/Rb2shfj4MYccArlU3FyUkyMNdnT8AHZf8NB2+xW+tJ2ZS?=
 =?us-ascii?Q?oM7hICWhyoREgm9zED29ROBYr9xGTwHULkviHQToklIGqvXPsGMnNNTFQm7O?=
 =?us-ascii?Q?KucV9JwUHkNxgY62ZKRf8Eh0URV7Hot53xRZBuvleEaU7JJFnNjJDnNvnpZI?=
 =?us-ascii?Q?+FEDezvulehzlsSpN3Z0T95PR0VSTzzJ3ddCLtAewTt7o5RotevPZnThtsol?=
 =?us-ascii?Q?LGQop/tz65MCE4kdizjaoCdayKaIPq5oD89MjrtM0UQjwKtKeZhxVTvaXrhd?=
 =?us-ascii?Q?M336WTTIk6AMsVmUF4rWs4eP+KI1WBZZ2SQKBT0P7l9WLUfLI+XlMeo6N+Mf?=
 =?us-ascii?Q?Cpq6233qvvTaoctLKYsIW8R7fKwkKwAQ86stIgaVR4DvDrq9jOTI+4RsRJDd?=
 =?us-ascii?Q?U8AYj+zQz9zAwM1J9h8alPjqu1OadJXrNJnbFruFG1CUj5Pl/xTT5m2GIY+d?=
 =?us-ascii?Q?k/nMfSc5bOIsCg8dNw13cM0qF9Cc4kJKC2pb37AJNu2W7ifaQjLhEON4HCH0?=
 =?us-ascii?Q?ZPl5dLTakMgboT7yL6jfsVsPlhsy2yW2pDmTOK/msIDDblroT55D9lSx3klg?=
 =?us-ascii?Q?cDfBgZO1IdeZ7MyCK78w456P08iNZYlUHPdJ0Tinvf31XS1RTfT8r83qBxyE?=
 =?us-ascii?Q?WtA4iCs15SOkqR3Z8dNFBgO5lr2Qo344kT+tkXLf3UC32CU7cNjzJ4wgq2nv?=
 =?us-ascii?Q?hwYG2iTeEHo8AAk0+aZQlyVMjeJrj/CF0ACwpEhk/75kYb4rJR1MEs3Jdj5l?=
 =?us-ascii?Q?Y0XoAoBsRPtz3C75o+3hFYbBWCJtqPaLnai1ZGYr7waRYTmbdo19xkuw5eCi?=
 =?us-ascii?Q?f80oAuxAduGk7ED/nuF/w94weEjuH+6yVqHqYfTrf9spE5YN5r877FRr47ew?=
 =?us-ascii?Q?O2a4NeFC3XrwgI3MRal9n5QXh63LRjA8zSdnosQAJDPYCqHqv3c3D6KVKKUJ?=
 =?us-ascii?Q?rOAj2AY3cWEjreoai5s13p4Q1lskD6769anq1AAjA4HJGmOmc00+Um0DzgED?=
 =?us-ascii?Q?TZFdXjCOjw1jcK7bAdvyyKaFAZ/tfxCx7/0wgVYBNauCCRixy9ZW1g5D70wZ?=
 =?us-ascii?Q?Ma6m8UHaV2nMPuAFRxdk38XUgcBkP4A5h98KDbZvMq6HQgnNoblVyKr9fKhE?=
 =?us-ascii?Q?EuGL2yMYxhAaShxbVyaURbczweVDD8lpseuDxP3WSm5dikR6xIBEssWuVBD2?=
 =?us-ascii?Q?HcjnF97lkrx/AHGx9KXhjHIE5zlwPBjc1hN3n/QyjH3hW5OEnUwg49NmkmAb?=
 =?us-ascii?Q?waYH6z2r4tBgtRECV0pp5uPw9wm0gh+XymHVFIMM4AFXsMQZyCb0TjMxqirG?=
 =?us-ascii?Q?vdQjXA9p7Ur+uKUbfrN10m5vWcPR4kro8L9+6I8pO+m7KY41Ly/90KteQqDQ?=
 =?us-ascii?Q?S+IzSg=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e33598d-c69b-4eb0-52b3-08d9df5d6494
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2022 17:17:26.3748 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wlxX0gtuJ84jM8zzjykBSpDL9RDDUDAmSUSzu6Z9CliZfcp7miXxq30JvFJ6vraaUfRkbYqFAulEatlQaU7T381LBe9BSsoQB9ApZilMbw8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1001MB2265
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10237
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxlogscore=999
 suspectscore=0 spamscore=0 adultscore=0 phishscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201240115
X-Proofpoint-GUID: H2WMUI_RnUqi-rZDpXCacxN-mkPMYSnf
X-Proofpoint-ORIG-GUID: H2WMUI_RnUqi-rZDpXCacxN-mkPMYSnf
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


