Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC2534A500B
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 21:22:26 +0100 (CET)
Received: from localhost ([::1]:45428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEdBx-0001ME-Qt
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 15:22:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.kanda@oracle.com>)
 id 1nEcaQ-0007OS-CB
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 14:43:38 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:29782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.kanda@oracle.com>)
 id 1nEcaH-0008K6-DY
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 14:43:33 -0500
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20VJ2a1n008746; 
 Mon, 31 Jan 2022 19:43:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=H9p7KMB8H2dqIrb/pf7kYpEyuhg3hdYusfr2X20n9BY=;
 b=mICX/lHC7vZ0UHmAV3po2Myp7y/xpQYAjDQehEnO67kEG2u7zLx88Qwiyv8/apq1wKfe
 /DKUwlZgvg01GRz+lU4ic28a40Yzg6x6r46JbjE3Bxwjtj551AO6phHgL7H0wEMh7Ruz
 L2k+s+FsWOt+kCx7WKZ+DNClC+dFrPvMgIcaPY/9NHxYEeNvDe5kku8dbRyLQWX7XeHX
 I4XoFfTe5JDS2GYRv/7Dy/P9HGuM581ZzToWISLL88lQEqrjhksEHlKjzorRAiNUcDpq
 JUAn6bdr+SwKQZ1aHt3PS95LpwfPcwxS9buTE/We0o41jpUJd2uiKJW/Sx0f+JZVIXKy kw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dxnk2g34p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 31 Jan 2022 19:43:25 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20VJQEx5005659;
 Mon, 31 Jan 2022 19:43:24 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam08lp2169.outbound.protection.outlook.com [104.47.73.169])
 by userp3020.oracle.com with ESMTP id 3dvy1nd025-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 31 Jan 2022 19:43:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GLBp1pBE/kwQnyUry2TTGR5bq46c69vErcMMIuyWrFYhCcTz01XZLXMTZplu/qucRo/1JkosEHuRDbqAtaIAzmieExuee6Y92ozK+Hdly72KfGkYhPN3Gc2V7LjC0lmneH+vwq5WuvoFQGOD7HS+vCTnXNPL9UOSA5R3h/PnmoZca5Idue/tsdt0KVuFQvU8C5ZvN6oXhZej/m/25K2UV0+iCoHUckXyMIsBKPr9xlB2O5TnGr0wjSr0rH/cd+lAgYEhMpe8dug2n9qnckYK3HMGmfL5/93Zt+2t8omWF8wPdyks0EdqACv7bDZysrF55gCIMe8MBy3IIy3BH9A9NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H9p7KMB8H2dqIrb/pf7kYpEyuhg3hdYusfr2X20n9BY=;
 b=LzHLi/HrGqO/JS+k3Nv0p2Sy5y1F70ft0HnwhIxuXxLvnlJa7T0TigJCxkfJhmRBrQgy7dGW1pUTeSUTX/6zpAvmxreP9/jz82VZL73Ptyrxx+PjMJ1lmncphSOZ4oTXAGRoe5/ntFPZ+KHFXCn8/y+NcPmiOxzhXrgdjoCntPwUz2UcPYJC9wjXPL6gQo98iX0IoJGGdE59jHiNW5tUSignV7RcRy6HClTLsDe1Vgi5QuhTegXT9Tub1igRzLZFHcxh+PK+7jtSkm5FnzVX1L7pp53tAnbAk+zwVW9dos9JV0D9P4fWA+kCdz7mxsSo6/RTKbYSAfle3P/fhLeAdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H9p7KMB8H2dqIrb/pf7kYpEyuhg3hdYusfr2X20n9BY=;
 b=FVTY8tXsnQTYvBvV2zhtySebWB4sMPk52Jfe6VPh1HiEvY1iBHQDTlI58f6MUJ1QKLP9rTUDeDqTrCX5wXk6mWZ196k+30Q2neBV5s+mGkk8xYiP3ImsABsjCm+jXJtyEm2IQcHPqyxWswOMnDVZdY9A3gDlcJHCYDD/sfuebTI=
Received: from SA1PR10MB5841.namprd10.prod.outlook.com (2603:10b6:806:22b::16)
 by BLAPR10MB5362.namprd10.prod.outlook.com (2603:10b6:208:333::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.19; Mon, 31 Jan
 2022 19:43:21 +0000
Received: from SA1PR10MB5841.namprd10.prod.outlook.com
 ([fe80::58ef:3181:b9d4:b716]) by SA1PR10MB5841.namprd10.prod.outlook.com
 ([fe80::58ef:3181:b9d4:b716%5]) with mapi id 15.20.4930.021; Mon, 31 Jan 2022
 19:43:20 +0000
From: Mark Kanda <mark.kanda@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 3/3] kvm: Support for querying fd-based stats
Date: Mon, 31 Jan 2022 13:43:12 -0600
Message-Id: <20220131194312.1192626-4-mark.kanda@oracle.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220131194312.1192626-1-mark.kanda@oracle.com>
References: <20220131194312.1192626-1-mark.kanda@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA9P221CA0008.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:806:25::13) To SA1PR10MB5841.namprd10.prod.outlook.com
 (2603:10b6:806:22b::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fcee6dbf-bc51-46df-732f-08d9e4f1ef8e
X-MS-TrafficTypeDiagnostic: BLAPR10MB5362:EE_
X-Microsoft-Antispam-PRVS: <BLAPR10MB5362307FED83278294AB64C5F9259@BLAPR10MB5362.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n8w+ONNakgXwjJ+7pqcoUr6TUU1K4TItzX1t5wY7xRrbJTaPt9/eYmgcPNBxq6fjl4vEq3OQNvLIQzo5Qb1ZmXf2vT0KPGN7VvugKbOq1ptW8sklJEn8qbLsaQ8p4jb6JU8Euk41wv0HAsz6Z1ew566FSUXR6bxsLO+b7xGLLU2w4dgv9lsZCaK+pa5x3cKU/yKO0MnV4acsZRjAQ5TV/+MA+I6JESMkgyGhDZB2Sf+6es2lln5+/h2gJkFxm77C5QwmvuaQASsjiPpvAmLU3UEAQd6yImghNQjxUZ1BCifPlDj4/eb285oQ0niKyDOeLSAcN+BygyFEgFMRxVdYcK1LRtE9JUayvil/askzHfTz1jNo7o35+BR/8xHr2e+B1FhToAz6cnVRIOWOudwhs69vZFiSjMva8/PO32y2uBtQ+CO1KmBzzplFRG2VzECdovSa7wyFJQMN7VX9vdgP2cqsGORfwNWyOX80XDsQFUMMy08I/sIQilhpzoDXFi+A99ZPXu9YmVhTGjo2T4WadOe90N4J/C8gpz8hEUUMxFFHzKdZkfoW/T/+YrWJBOUPVpjNCpEleTT+m2/z539Znc5CPrFBkZ17DP+uuu3eLxOy14Y7VLkKpseH/jlYlFuCC79kbl8Yr2IU/HgAyCpnXFrCXcEggxtWG1wOknll0OeAC4UrPbWAk4QkqlRSJzSuEvbI8SAoroV+NK54KCs8fw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR10MB5841.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(26005)(508600001)(83380400001)(186003)(36756003)(107886003)(1076003)(2616005)(316002)(6916009)(52116002)(6506007)(6666004)(6486002)(2906002)(86362001)(4326008)(8936002)(8676002)(6512007)(44832011)(5660300002)(66556008)(66476007)(38350700002)(38100700002)(66946007)(20210929001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?F1Q3d8K9O1C1YEcGD5+Yrue2qccYsTHgMnG22DgEFoTlxqik+18eZ8jMSpyW?=
 =?us-ascii?Q?WfqFtnoCbeELo2TrLyCBLV9wwY4bOjXmQ9GAIgt4lCFvtwTfz4uY8v0bqwXq?=
 =?us-ascii?Q?qpYBTcd1maTpgevOyEVxKK5313bm/Ar984+v5JQN/LVql27zvnhohlWw47Bp?=
 =?us-ascii?Q?YoZIxHFTJBrRVBio+thQ2viV8xh7zAsToHQ8eUcQhmastwuFGDxxlbmL4t3W?=
 =?us-ascii?Q?yN4UmKi/GmPOSHfdNM3XjFlKPUHWsP+HZ0epKGq8W0qILd5WzEG0tKZPeCYP?=
 =?us-ascii?Q?lcdhLeqa1wYsj0B159Si2QeITonop9tqImXq7BYMAHMHvPRCNuCmZr5MoEc/?=
 =?us-ascii?Q?cpK6PwAEdtRDpLzEWorNkh82v+0H/1k/EfHiamcgBUEjVqpYgZmk0RsxTMrT?=
 =?us-ascii?Q?zv1WsEahioGz7GQWLoG59PE1UfApIZS0VsCmcezFw5kqLRKWSIRIGWYC8hUP?=
 =?us-ascii?Q?XFrgCCC22X+taXzfakhxdqnHeX4UE0o7Wt8qcox7zPuk2dRYpYrRPAXclLwF?=
 =?us-ascii?Q?0Lf1/os3pJEf4tmzul+A0XAVcflVmZopEstg42rhdV7Unz7eIikHDfBxNXzp?=
 =?us-ascii?Q?K+Z+WrnPspOu4Uz4FNVLh6yFTYniQihNy6C7N2Sxc76PIO4A45gSQkGh/mbW?=
 =?us-ascii?Q?iU4eKENrXffV2HVMbhJ9loDvxYzBlesuYesPT5luLgRF/9RvEs5U4j19wOgE?=
 =?us-ascii?Q?rUWct0n+ciKmAKAjOnhf5a3wWrmXulfGapTCsBJcNWk2qkuh4rfvQI8IMOb5?=
 =?us-ascii?Q?wi9ZLDDJxu6WK6qsdiTyxvo6fdynBeCLyiq5tfgaUoi3SA3ZM0EuGRmXV0lf?=
 =?us-ascii?Q?HJ1HH8yIFzWJwv0oZcVktsrIhTpdGyu2nHCG57D6ahjiQ1Z4rWflddt2buN9?=
 =?us-ascii?Q?xFWRExi+RWkQbm4DdRzVQvDTB+DV/ou6YmSeL2Qpz2dvcjM7Y/8ZjUXr+aC9?=
 =?us-ascii?Q?tWAPujIfOLNXpo5YpqU+wK2laRAucQQS8jEg8kQ3o4DJrU31hiyTNs2yCywz?=
 =?us-ascii?Q?aSt5ElGU69vct/OUelXEt8RGWZfZrhl2EyMTmMIdAbXfXlK7EbXCa45EDstd?=
 =?us-ascii?Q?OTz1fEzaW7lncOkWhZSC9O5QIVFyovoju1F8wQdfdMPjRxqOOGajk80OtzfU?=
 =?us-ascii?Q?MMwWKkxt4yZaRRx89ZZLYRyAxTCfacoByOdlUlK7p1IM+/efHgL8dgenbVP3?=
 =?us-ascii?Q?DQPDmvY9+hD/fWdPaX4EnfldxgPnkifi4FK6v1dcjnQSmfGh6lFPoPgfrypj?=
 =?us-ascii?Q?NDery0vRY6LCNui+TegfsFEriqBVokH2d+/dGonc7B1qblAIXPPx1mthBu72?=
 =?us-ascii?Q?LUrg6TOQc6P7iQEsMfE3Bo9UQS5vSj6idPcKag1tH0hrzPQ7MPh9mCbTJx/X?=
 =?us-ascii?Q?B02DTq2YKltb+l7G/7BtP+Al5YGSDf4OgG4ytgV2Z2zKCJLztL5BwRThuvIW?=
 =?us-ascii?Q?b3GsCd2M92i9Advr0oDJObKb2knK2Zly/mC6JrO+rFqTC4HVlD9SxvWHajof?=
 =?us-ascii?Q?ZYp0WJlxfzsN3UES56qrkI90Wg4zc2+KRk2MhDVVN6dTkpnDwdtpZw14Wj+j?=
 =?us-ascii?Q?j81YCmx7u2+FWJJBC6vUFiwWF1E832kizC1zHuznfCbJe2l2MErn02lSwEep?=
 =?us-ascii?Q?Rbk7y1IeKoTrxE6dYCeRf6A=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcee6dbf-bc51-46df-732f-08d9e4f1ef8e
X-MS-Exchange-CrossTenant-AuthSource: SA1PR10MB5841.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2022 19:43:20.8851 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HMnilhnd6NzhOVkbaD3MPcZyFeC9AYsAuAgipLXlFWVmMzTG3eo2EeRVl4T/AHEhmWMDe1VnehtcOpHYlz7mjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5362
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10244
 signatures=673430
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxscore=0 spamscore=0
 bulkscore=0 adultscore=0 mlxlogscore=999 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2201310125
X-Proofpoint-GUID: EH8pzqZjd3lk7Ywfk2kGggkVa2-rODWl
X-Proofpoint-ORIG-GUID: EH8pzqZjd3lk7Ywfk2kGggkVa2-rODWl
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=mark.kanda@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: pbonzini@redhat.com, berrange@redhat.com, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add support for querying fd-based KVM stats - as introduced by Linux kernel
commit:

cb082bfab59a ("KVM: stats: Add fd-based API to read binary stats data")

Signed-off-by: Mark Kanda <mark.kanda@oracle.com>
---
 accel/kvm/kvm-all.c | 308 ++++++++++++++++++++++++++++++++++++++++++++
 qapi/misc.json      |   2 +-
 2 files changed, 309 insertions(+), 1 deletion(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 0e66ebb497..e43e1f1c1c 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -47,6 +47,8 @@
 #include "kvm-cpus.h"
 
 #include "hw/boards.h"
+#include "qapi/qapi-commands-misc.h"
+#include "monitor/stats.h"
 
 /* This check must be after config-host.h is included */
 #ifdef CONFIG_EVENTFD
@@ -2309,6 +2311,9 @@ bool kvm_dirty_ring_enabled(void)
     return kvm_state->kvm_dirty_ring_size ? true : false;
 }
 
+static void query_stats_cb(StatsResults *, StatsFilter *, Error **);
+static void query_stats_schemas_cb(StatsSchemaResult *, Error **);
+
 static int kvm_init(MachineState *ms)
 {
     MachineClass *mc = MACHINE_GET_CLASS(ms);
@@ -2637,6 +2642,11 @@ static int kvm_init(MachineState *ms)
         }
     }
 
+    if (kvm_check_extension(kvm_state, KVM_CAP_BINARY_STATS_FD)) {
+        add_stats_callbacks(STATS_PROVIDER_KVM, &query_stats_cb,
+                            &query_stats_schemas_cb);
+    }
+
     return 0;
 
 err:
@@ -3696,3 +3706,301 @@ static void kvm_type_init(void)
 }
 
 type_init(kvm_type_init);
+
+typedef struct StatsArgs {
+    StatsFilter *filter;
+    bool is_schema;
+    union {
+        StatsResults *stats;
+        StatsSchemaResult *schema;
+    } result;
+    Error **errp;
+} StatsArgs;
+
+static StatsList *add_kvmstat_entry(struct kvm_stats_desc *pdesc,
+                                    uint64_t *stats_data,
+                                    StatsList *stats_list,
+                                    Error **errp)
+{
+    StatsList *stats_entry = g_malloc0(sizeof(*stats_entry));
+    Stats *stats = g_malloc0(sizeof(*stats));
+    uint64List *val_list = NULL;
+    int i;
+
+    stats->name = g_strdup(pdesc->name);
+    stats->value = g_malloc0(sizeof(*stats->value));
+
+    /* Alloc and populate data list */
+    if (pdesc->size == 1) {
+        stats->value->u.scalar = *stats_data;
+        stats->value->type = QTYPE_QNUM;
+    } else {
+        for (i = 0; i < pdesc->size; i++) {
+            uint64List *val_entry = g_malloc0(sizeof(*val_entry));
+            val_entry->value = stats_data[i];
+            val_entry->next = val_list;
+            val_list = val_entry;
+        }
+        stats->value->u.list.list = val_list;
+        stats->value->type = QTYPE_QDICT;
+    }
+
+    stats_entry->value = stats;
+    stats_entry->next = stats_list;
+
+    return stats_entry;
+}
+
+static StatsSchemaValueList *add_kvmschema_entry(struct kvm_stats_desc *pdesc,
+                                                 StatsSchemaValueList *list,
+                                                 Error **errp)
+{
+    StatsSchemaValueList *schema_entry;
+
+    schema_entry = g_malloc0(sizeof(*schema_entry));
+    schema_entry->value = g_malloc0(sizeof(*schema_entry->value));
+    schema_entry->value->name = g_strdup(pdesc->name);
+
+    switch (pdesc->flags & KVM_STATS_TYPE_MASK) {
+    case KVM_STATS_TYPE_CUMULATIVE:
+        schema_entry->value->type = STAT_TYPE_CUMULATIVE;
+        break;
+    case KVM_STATS_TYPE_INSTANT:
+        schema_entry->value->type = STAT_TYPE_INSTANT;
+        break;
+    case KVM_STATS_TYPE_PEAK:
+        schema_entry->value->type = STAT_TYPE_PEAK;
+        break;
+    case KVM_STATS_TYPE_LINEAR_HIST:
+        schema_entry->value->type = STAT_TYPE_LINEAR_HIST;
+        break;
+    case KVM_STATS_TYPE_LOG_HIST:
+        schema_entry->value->type = STAT_TYPE_LOG_HIST;
+        break;
+    default:
+        schema_entry->value->type = STAT_TYPE_UNKNOWN;
+    }
+
+    switch (pdesc->flags & KVM_STATS_UNIT_MASK) {
+    case KVM_STATS_UNIT_NONE:
+        schema_entry->value->unit = STAT_UNIT_NONE;
+        break;
+    case KVM_STATS_UNIT_BYTES:
+        schema_entry->value->unit = STAT_UNIT_BYTES;
+        break;
+    case KVM_STATS_UNIT_CYCLES:
+        schema_entry->value->unit = STAT_UNIT_CYCLES;
+        break;
+    case KVM_STATS_UNIT_SECONDS:
+        schema_entry->value->unit = STAT_UNIT_SECONDS;
+        break;
+    default:
+        schema_entry->value->unit = STAT_UNIT_UNKNOWN;
+    }
+
+    switch (pdesc->flags & KVM_STATS_BASE_MASK) {
+    case KVM_STATS_BASE_POW10:
+        schema_entry->value->base = STAT_BASE_POW10;
+        break;
+    case KVM_STATS_BASE_POW2:
+        schema_entry->value->base = STAT_BASE_POW2;
+        break;
+    default:
+        schema_entry->value->base = STAT_BASE_UNKNOWN;
+    }
+
+    schema_entry->value->exponent = pdesc->exponent;
+    schema_entry->next = list;
+    return schema_entry;
+}
+
+static void query_stats(StatsArgs *kvm_stat_args, int stats_fd)
+{
+    size_t size_desc, size_data;
+    struct kvm_stats_header *header;
+    struct kvm_stats_desc *stats_desc = NULL;
+    Error *local_err = NULL;
+    void *stats_list = NULL;
+    char *id = NULL;
+    ssize_t ret;
+    int i;
+
+    /* Read KVM stats header */
+    header = g_malloc(sizeof(*header));
+    ret = read(stats_fd, header, sizeof(*header));
+    if (ret != sizeof(*header)) {
+        error_setg(&local_err, "KVM stats: failed to read stats header: "
+                   "expected %zu actual %zu", sizeof(*header), ret);
+        goto exit;
+    }
+    size_desc = sizeof(*stats_desc) + header->name_size;
+
+    /* Read KVM stats id string */
+    id = g_malloc(header->name_size);
+    ret = read(stats_fd, id, header->name_size);
+    if (ret != header->name_size) {
+        error_setg(&local_err, "KVM stats: failed to read id string: "
+                   "expected %zu actual %zu", (size_t) header->name_size, ret);
+        goto exit;
+    }
+
+    /* Read KVM stats descriptors */
+    stats_desc = g_malloc0(header->num_desc * size_desc);
+    ret = pread(stats_fd, stats_desc,
+                size_desc * header->num_desc, header->desc_offset);
+
+    if (ret != size_desc * header->num_desc) {
+        error_setg(&local_err, "KVM stats: failed to read stats descriptors: "
+                   "expected %zu actual %zu",
+                   size_desc * header->num_desc, ret);
+        goto exit;
+    }
+
+    for (i = 0; i < header->num_desc; ++i) {
+        struct kvm_stats_desc *pdesc = (void *)stats_desc + i * size_desc;
+        size_data = pdesc->size * sizeof(uint64_t);
+
+        uint64_t *stats_data = g_malloc(size_data);
+
+        ret = pread(stats_fd, stats_data, size_data,
+                    header->data_offset + pdesc->offset);
+
+        if (ret != pdesc->size * sizeof(*stats_data)) {
+            error_setg(&local_err, "KVM stats: failed to read data: "
+                       "expected %zu actual %zu",
+                       pdesc->size * sizeof(*stats_data), ret);
+            g_free(stats_data);
+            goto exit;
+        }
+
+        /* Add entry to the list */
+        if (kvm_stat_args->is_schema) {
+            stats_list = add_kvmschema_entry(pdesc, (StatsSchemaValueList *)
+                                             stats_list, &local_err);
+        } else {
+            if (stat_name_filter(kvm_stat_args->filter,
+                                 kvm_stat_args->filter->target, pdesc->name)) {
+                g_free(stats_data);
+                continue;
+            }
+            stats_list = add_kvmstat_entry(pdesc, stats_data,
+                                           (StatsList *) stats_list,
+                                           &local_err);
+        }
+        g_free(stats_data);
+    }
+
+    if (!stats_list) {
+        goto exit;
+    }
+
+    if (kvm_stat_args->is_schema) {
+        StatsSchemaProvider *provider;
+        if (kvm_stat_args->filter->target == STATS_TARGET_VM) {
+            provider = add_vm_stats_schema(kvm_stat_args->result.schema,
+                                           STATS_PROVIDER_KVM);
+        } else if (kvm_stat_args->filter->target == STATS_TARGET_VCPU) {
+            provider = add_vcpu_stats_schema(kvm_stat_args->result.schema,
+                                             STATS_PROVIDER_KVM);
+        }
+        provider->stats = (StatsSchemaValueList *)stats_list;
+    } else {
+        StatsResultsEntry *results;
+        if (kvm_stat_args->filter->target == STATS_TARGET_VM) {
+            results = add_vm_stats_entry(kvm_stat_args->result.stats,
+                                         STATS_PROVIDER_KVM);
+        } else if (kvm_stat_args->filter->target == STATS_TARGET_VCPU) {
+            results =
+                add_vcpu_stats_entry(kvm_stat_args->result.stats,
+                                     STATS_PROVIDER_KVM,
+                                     current_cpu->parent_obj.canonical_path);
+        }
+        results->stats = (StatsList *)stats_list;
+    }
+exit:
+    error_propagate(kvm_stat_args->errp, local_err);
+    g_free(stats_desc);
+    g_free(id);
+    g_free(header);
+}
+
+static void query_stats_vcpu(CPUState *cpu, run_on_cpu_data data)
+{
+    StatsArgs *kvm_stats_args = (StatsArgs *) data.host_ptr;
+    int stats_fd = kvm_vcpu_ioctl(cpu, KVM_GET_STATS_FD, NULL);
+    Error *local_err = NULL;
+
+    if (stats_fd == -1) {
+        error_setg(&local_err, "KVM stats: ioctl failed");
+        error_propagate(kvm_stats_args->errp, local_err);
+        return;
+    }
+    query_stats(kvm_stats_args, stats_fd);
+    close(stats_fd);
+}
+
+static void query_stats_cb(StatsResults *stats_result, StatsFilter *filter,
+                           Error **errp)
+{
+    KVMState *s = kvm_state;
+    CPUState *cpu;
+    int stats_fd;
+    StatsArgs *stats_args = g_malloc0(sizeof(*stats_args));
+    stats_args->filter = filter;
+    stats_args->errp = errp;
+    stats_args->result.stats = stats_result;
+
+    switch (filter->target) {
+    case STATS_TARGET_VM:
+        stats_fd = kvm_vm_ioctl(s, KVM_GET_STATS_FD, NULL);
+        if (stats_fd == -1) {
+            error_setg(errp, "KVM stats: ioctl failed");
+            goto done;
+        }
+
+        query_stats(stats_args, stats_fd);
+        break;
+    case STATS_TARGET_VCPU:
+        CPU_FOREACH(cpu) {
+            if (stat_cpu_filter(filter, cpu->parent_obj.canonical_path)) {
+                continue;
+            }
+            run_on_cpu(cpu, query_stats_vcpu, RUN_ON_CPU_HOST_PTR(stats_args));
+        }
+        break;
+    default:
+        break;
+    }
+done:
+    g_free(stats_args);
+}
+
+void query_stats_schemas_cb(StatsSchemaResult *stats_result, Error **errp)
+{
+    KVMState *s = kvm_state;
+    int stats_fd;
+    StatsArgs *stats_args =  g_malloc0(sizeof(*stats_args));
+    stats_args->filter = g_malloc0(sizeof(*stats_args->filter));
+    stats_args->errp = errp;
+
+    stats_fd = kvm_vm_ioctl(s, KVM_GET_STATS_FD, NULL);
+    if (stats_fd == -1) {
+        error_setg(errp, "KVM stats: ioctl failed");
+        goto done;
+    }
+
+    stats_args->result.schema = stats_result;
+    stats_args->is_schema = true;
+
+    /* Query VM */
+    stats_args->filter->target = STATS_TARGET_VM;
+    query_stats(stats_args, stats_fd);
+
+    /* Query vCPU */
+    stats_args->filter->target = STATS_TARGET_VCPU;
+    run_on_cpu(first_cpu, query_stats_vcpu, RUN_ON_CPU_HOST_PTR(stats_args));
+done:
+    g_free(stats_args->filter);
+    g_free(stats_args);
+}
+
diff --git a/qapi/misc.json b/qapi/misc.json
index 8d326464f0..39a7d172cb 100644
--- a/qapi/misc.json
+++ b/qapi/misc.json
@@ -574,7 +574,7 @@
 # Since: 7.0
 ##
 { 'enum': 'StatsProvider',
-  'data': [ ] }
+  'data': [ 'kvm' ] }
 
 ##
 # @StatsTarget:
-- 
2.27.0


