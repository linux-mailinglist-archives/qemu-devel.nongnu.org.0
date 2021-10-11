Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3198428667
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 07:42:35 +0200 (CEST)
Received: from localhost ([::1]:56126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZo55-0007rE-2k
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 01:42:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mZnuY-0002b1-PL
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 01:31:42 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:18020)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mZnuW-0004SF-Jj
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 01:31:42 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19B2iJkR010295; 
 Mon, 11 Oct 2021 05:31:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=MnAuyzO8NIy0t8VjKsUyX7D40GbuQcHZlVKJG4GvpWM=;
 b=RpAjKTD6WIJQKfDX6uOl2TmDgMqKjWuw29Y2Zp0x0yRrDQWbAY1hvv/gmSf1Fz67WvVe
 /25s3640G6fLBD4rQeV3L/ooQf6uxWUrsTTZM0jp78KNGEFfZ6oaHu6tKizVkB/dhp0e
 TdC2ChnOEkX4eglrsUaQtznW3qPb7pNChaQNXGlaUnw4jKdCECDVOoac0GcEvep52HJl
 lM6TMbqF98CwLUcyuQP3cX8jawk2UIBt5ycsP0C4AdY32QpEjXcTeEbm7p82rTfhB+7U
 QiV+vqKBucgEpDXUzYKREFuPmCBXmvHBjLm73FY+X7F8k1bc6xON+2t6zofc2HMU3Oc0 yw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bkw3j1y20-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 11 Oct 2021 05:31:38 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19B5V1OX123589;
 Mon, 11 Oct 2021 05:31:37 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
 by userp3020.oracle.com with ESMTP id 3bkyv7nt8h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 11 Oct 2021 05:31:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rm0Z1prwkGmKC5oHCEu0jL9XvQe1nCxMyyW8owUZoJn2hyhbYfWNHkMbt4jdXB/oEFziucRechMfwKJJzbLYKV0+zQ5sNgIuqh6MMR+PmJTOpUuAttv9epmOV9VscMIhbhlAuT4Mpb8JrFcxBlT3PHFYqTv4sn1/ASMGhJZquGafCubPy+0zlmSkuDFqqe35BM1YrekrH6iSwdJvE+c8eGpNhZMqqxpJuvU/a41nWIyqHZmDZ/pjxm9KEjI/Ytlp4Xga04WWeN338pfg5nbzR8FH4GZfD7oc38ZP+JiDtQ5YAQuXO1OdtUDNnUwuHom1WsfYbgDEnHFAocpXTCdnXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MnAuyzO8NIy0t8VjKsUyX7D40GbuQcHZlVKJG4GvpWM=;
 b=F6wROzQBE2Yjt5AcIkOG+dSYT9L31S7UPndpFd6rBgjNNW40k2eYI3ADP7dGfmjw3l11oGS30AE5a+1jetS1XWbuRgQKOt0SDZ//1V3trSAqkZMZp4RInOof1ctKeQCbA+5zjRbX1zSKgUjX8SBqDgC+VuL/VgLjqb0rcGuAi7myeAQjBsuLv2AFwxmDcW83Zxy3uGITzspkhXIUvGGaTdCQuMkzlV8xFYb1GZIh6uMoevZvkZoyoSrT8HxPtqNI+yW8iehp8mQ5SZnQNXEgnEhLFqFamO8dnLalDFuqCF1nvSRByT3tq4HSi+j0ln3Fo32MCvgx95r557iXa5m9CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MnAuyzO8NIy0t8VjKsUyX7D40GbuQcHZlVKJG4GvpWM=;
 b=L2ei2t8tjXKdxFFnU0fC0lGNc+LVnzmKXB8Zj3+Dfvvqg3fXDsrsf3fMUuc/NyxbjKMF4UrcjDuBgYM4wKRv1SHWEYrQ7DU5rIKlFeMyZoR7J6BlQNYJVOJChk4jE2VCrMOxoeYDZdb/bgt5ZyWvhDsQqpuqKEKlEkEbUbmsvt0=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by MN2PR10MB3902.namprd10.prod.outlook.com (2603:10b6:208:184::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.22; Mon, 11 Oct
 2021 05:31:35 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::48d7:8ff1:200c:89ca]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::48d7:8ff1:200c:89ca%3]) with mapi id 15.20.4587.026; Mon, 11 Oct 2021
 05:31:35 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 04/12] vfio-user: instantiate vfio-user context
Date: Mon, 11 Oct 2021 01:31:09 -0400
Message-Id: <82b00867c07020fcf71749627414a80ef6b691cb.1633929457.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1633929457.git.jag.raman@oracle.com>
References: <cover.1633929457.git.jag.raman@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR17CA0072.namprd17.prod.outlook.com
 (2603:10b6:a03:167::49) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
Received: from jaraman-bur-1.us.oracle.com (209.17.40.40) by
 BY5PR17CA0072.namprd17.prod.outlook.com (2603:10b6:a03:167::49) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18 via Frontend
 Transport; Mon, 11 Oct 2021 05:31:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1859eb00-0074-4127-7adf-08d98c78641b
X-MS-TrafficTypeDiagnostic: MN2PR10MB3902:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR10MB3902107E0DE72172DE88FFCD90B59@MN2PR10MB3902.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:119;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0spmXai5jQwTmU3NU0k3SOMDFPYDE6oSFSXUtq0bfmfm5Fa11nc0xcZ5MjWdUn4SkwAhbcrJKb+u55n7uOnSdKFTpxtyF3wWeOawHOi6cRpZnmC+CRKsPvQpsjlRoLPXfxzZHs0LfD+9yZ0F56+KaGJPGNI1v7t7jF0Io4luNBEwxz1dWr1QCs+LH0dITcAwlV6fjZMBMcCk0LfQrW4OOqZo/mYBeAf59DQrmJldh+RUVN0Z6H1mAPg567mAGf5N+m0my1/UlY3KY1NpRl+qkoEjzn8m/HIV23FppcTPBB4Myevd2vv4MikBr72M1fMpBMY+xbgVJn9kdKoOwBysbr+b17rdi/L+Nd9nUZYPpiJuNbLGxPsWTVA/a3pdXv/E9ggmFbgmpFpAZkULfQF3fxjwwd9NQ2yhBkI0komshJ6MUj71Vt1W6RXEc0bqcrIdo7Ws3mxAC0bLB6nTnnO4ia0ZC/D3H1uJW/HI7TUCs5YpILH/K+sxDeLsLYyTZcc4I53CUtqBIgCjfw+nOwm/X/tMH0kzOGQfJFtorlS040I0dadfFoQUYHPhP5KI5nwWgp/fP2c2kwbTgslKYRo6zHi8fzd8be0JjcZHW+6YFdEJlLL7rt/NjckZjEXTfErh9mkj9E6E233VXStzsDkAgTqxI+BGjZnyE5SqsgTaZIVyf0HTo0VV4GscN7kOYBE/ZhdKXXuKpFQxaQamSEGT1A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(4326008)(6916009)(6486002)(186003)(508600001)(8676002)(7696005)(26005)(2906002)(107886003)(52116002)(316002)(38350700002)(6666004)(38100700002)(5660300002)(8936002)(86362001)(66556008)(66476007)(66946007)(36756003)(7416002)(2616005)(956004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hNn/WFF+3gV0vci5DlKq1pRSrgI1YHGEQ02M5Xwmg764PZ0+i1fdmdAlPLqc?=
 =?us-ascii?Q?FmqOk4VVJXgs0uAiSOsS+g5EZ8BO2KAL7jxmA6wSQwNAvJqHTTMZtxm9pNr6?=
 =?us-ascii?Q?YvIzcPP61HeND6IkA7dMQPaiIDq0Wf8v1KzYcjLrDOoIyTCit98d2tdOtdLT?=
 =?us-ascii?Q?kyMCmFe7eDxQMjmeUaBxRVf8jcv2RZpP8W6Aly+NQ9HgfVacxe1H9J+RF0oY?=
 =?us-ascii?Q?ZQ0aR7RsrzWw7oOeAQkc4hcBkPgCUbfBl3gnQK9+FIQLSyBkBtRbw1XyWwgp?=
 =?us-ascii?Q?5qc8kcekmA7eCiWMROUnR6bNPZ3VevGjIaDGh+aryJDDvPvY4cQEErzFkyPC?=
 =?us-ascii?Q?OB4UpAuBC8E7roVT1dEAbG9CXlbHOCYriCs2v5Im2A29nkn4rYpO28mDH1tJ?=
 =?us-ascii?Q?/Hzu1lFlYHiWkvbEbkHKEf49bwefEsv5ggysLOZs16IcgFXBUlm2Co9Eo0re?=
 =?us-ascii?Q?CndZcdR/sf9uR3v+ePFb3Vl81SB//Y5mzZ4PAqpaVmY4EYGdM2cg3EL9aaVD?=
 =?us-ascii?Q?ao0C7bztub1JdaeNM6FMtswfKL3WLUpzRokfRT4Li7p0LszIP6h4u16yADdu?=
 =?us-ascii?Q?if0OKMSUVkY9PFUzbaBnJGPQklcyG7+HJHrWHh9C2ncm+ZAlJKW54Uw6FLuu?=
 =?us-ascii?Q?4VV7y49T1BlVCFN2mBXOWI7KuQpNlHeV2qw2yqMUiLhqOgf62t/59Mz2lOsJ?=
 =?us-ascii?Q?9XeybaKQ5fbd1XZjo1nxsqfd6Mbh/LXB0J1wGtcdh9Fq5VnEMJBy/+Uk3O1O?=
 =?us-ascii?Q?2NoW2bWRgq9H6bIJ4jrCfZUgD4z6cYge3KqMsUEYUonHCasa39/ckT7Hvc+Z?=
 =?us-ascii?Q?EiCn6oLos0BA79habLTW6IdXdVFTO+ebTnMojFcMjJxhYDYCnrfBlZxHhgR9?=
 =?us-ascii?Q?zSCPVX/xB2lINstXYpeLucgRCw+GP2Ho/YgX35DX2/87KAOL0JYMy52By0eJ?=
 =?us-ascii?Q?oKw4qDZGIeXLQTHedUoG8FpgE7me2IEVN1bl0wLpcXKcrrYtc1seUN2ZE8M7?=
 =?us-ascii?Q?IYKjoV2tZhc969cCBEH6swyhF8pisEhx/bXoNG9Xo7ZHbhmW3SgVJkfG/zyl?=
 =?us-ascii?Q?t/v34uPkISQJmY/9XA4AhGRbaS/SMZCd7Od+ZqTvqrZ9YBNn04WP7BX8esUn?=
 =?us-ascii?Q?FjTv3+L1xi/HkrhZi+ahLzK4m+10jv0ZBaR2jbHBcmMzBVs4DZchk5KaDuDT?=
 =?us-ascii?Q?xvzs3RX85nhWQb7gwS78mZj3JfbajYJO4KCL4deEwZILFZG5n7+3JwNOM3vA?=
 =?us-ascii?Q?Ju6bstW7ytnr3W5R/cBMK0N0cXZkm+lS352f8mxKN9DfGQRihzLFkG5MEpjj?=
 =?us-ascii?Q?pAKE88LcZInoT5OmRk9pHwpG?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1859eb00-0074-4127-7adf-08d98c78641b
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2021 05:31:35.4861 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IU/R4fVpr2qIZYPHMGortIbjo5vwoeWeLYn3I0sOfKssmBV0kLCtFEXLpmjhROB47fMLRT9nJ8kdftRLzpzEOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB3902
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10133
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 adultscore=0 bulkscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110110032
X-Proofpoint-GUID: liD3UZOf1OZizAFWKA8y6am1ouFhJvqc
X-Proofpoint-ORIG-GUID: liD3UZOf1OZizAFWKA8y6am1ouFhJvqc
Received-SPF: pass client-ip=205.220.177.32; envelope-from=jag.raman@oracle.com;
 helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_BL=0.001,
 RCVD_IN_MSPIKE_L3=0.001, SPF_HELO_NONE=0.001,
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
Cc: elena.ufimtseva@oracle.com, john.g.johnson@oracle.com, thuth@redhat.com,
 jag.raman@oracle.com, swapnil.ingle@nutanix.com, john.levon@nutanix.com,
 philmd@redhat.com, alex.williamson@redhat.com, marcandre.lureau@gmail.com,
 stefanha@redhat.com, thanos.makatos@nutanix.com, pbonzini@redhat.com,
 alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

create a context with the vfio-user library to run a PCI device

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 hw/remote/vfio-user-obj.c | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
index c2a300f0ff..d26e5ec9e9 100644
--- a/hw/remote/vfio-user-obj.c
+++ b/hw/remote/vfio-user-obj.c
@@ -41,6 +41,9 @@
 #include "hw/remote/machine.h"
 #include "qapi/error.h"
 #include "qapi/qapi-visit-sockets.h"
+#include "qemu/notify.h"
+#include "sysemu/sysemu.h"
+#include "libvfio-user.h"
 
 #define TYPE_VFU_OBJECT "vfio-user-server"
 OBJECT_DECLARE_TYPE(VfuObject, VfuObjectClass, VFU_OBJECT)
@@ -61,6 +64,10 @@ struct VfuObject {
     SocketAddress *socket;
 
     char *device;
+
+    Notifier machine_done;
+
+    vfu_ctx_t *vfu_ctx;
 };
 
 static void vfu_object_set_socket(Object *obj, Visitor *v, const char *name,
@@ -94,9 +101,31 @@ static void vfu_object_set_device(Object *obj, const char *str, Error **errp)
     trace_vfu_prop("device", str);
 }
 
+/*
+ * vfio-user-server depends on the availability of the 'socket' and 'device'
+ * properties. It also depends on devices instantiated in QEMU. These
+ * dependencies are not available during the instance_init phase of this
+ * object's life-cycle. As such, the server is initialized after the
+ * machine is setup. machine_init_done_notifier notifies vfio-user-server
+ * when the machine is setup, and the dependencies are available.
+ */
+static void vfu_object_machine_done(Notifier *notifier, void *data)
+{
+    VfuObject *o = container_of(notifier, VfuObject, machine_done);
+
+    o->vfu_ctx = vfu_create_ctx(VFU_TRANS_SOCK, o->socket->u.q_unix.path, 0,
+                                o, VFU_DEV_TYPE_PCI);
+    if (o->vfu_ctx == NULL) {
+        error_setg(&error_abort, "vfu: Failed to create context - %s",
+                   strerror(errno));
+        return;
+    }
+}
+
 static void vfu_object_init(Object *obj)
 {
     VfuObjectClass *k = VFU_OBJECT_GET_CLASS(obj);
+    VfuObject *o = VFU_OBJECT(obj);
 
     if (!object_dynamic_cast(OBJECT(current_machine), TYPE_REMOTE_MACHINE)) {
         error_setg(&error_abort, "vfu: %s only compatible with %s machine",
@@ -111,7 +140,12 @@ static void vfu_object_init(Object *obj)
         return;
     }
 
+    o->vfu_ctx = NULL;
+
     k->nr_devs++;
+
+    o->machine_done.notify = vfu_object_machine_done;
+    qemu_add_machine_init_done_notifier(&o->machine_done);
 }
 
 static void vfu_object_finalize(Object *obj)
@@ -123,6 +157,10 @@ static void vfu_object_finalize(Object *obj)
 
     g_free(o->socket);
 
+    if (o->vfu_ctx) {
+        vfu_destroy_ctx(o->vfu_ctx);
+    }
+
     g_free(o->device);
 
     if (k->nr_devs == 0) {
-- 
2.20.1


