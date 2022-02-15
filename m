Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 754D14B6F81
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 16:07:14 +0100 (CET)
Received: from localhost ([::1]:47008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJzQ9-0007vj-Fj
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 10:07:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.kanda@oracle.com>)
 id 1nJzOT-0006Pu-Kz
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 10:05:29 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:3642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.kanda@oracle.com>)
 id 1nJzOQ-0005Ij-L0
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 10:05:29 -0500
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21FEhw9E006438; 
 Tue, 15 Feb 2022 15:04:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=Bc31BF1ElyVGC/v4fKu2HDRZqSdf4+H+tEpStshewts=;
 b=iybzzUFkJn34kwoTjtr2ExdqNzSHp0gt5vBq3ARlrjx6g16lXfOeVULRkgZkSFbNfhaD
 F7Fc5XXecXLV2wXclOMz9LnpJZcTHysMyTKPEp/xmYCunH3TIUPHSeg5U1KsamQbAISl
 fd4rYREnyldpN64vrcIYJt0j2w1LZ0xqSySAn/x03s0LVjWZXXHnpk9at+Eeeuxdyxcr
 Y23cNMrmi2T/aBTjdh6K7cUILZC/U0/KHrUpaXQcTSAr1PYVJec9by2NbZ/tbrUyFpmC
 Ew76cl7MNaqrhDC0DOoPtdVUCzsr77vL+kw098ZutkcAhyk1Mtl5Tty8WkMX5W2OFjqk Fg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3e86n0hjey-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 15 Feb 2022 15:04:45 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21FF0UN0008531;
 Tue, 15 Feb 2022 15:04:44 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2170.outbound.protection.outlook.com [104.47.55.170])
 by aserp3030.oracle.com with ESMTP id 3e62xerfe0-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 15 Feb 2022 15:04:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=REly/6xLZSf7Ajq/DVEADsbd1wBpGAVKy0llp9YjDPc5K8gNAz1+O1GcblVsB5nPn3DbxvbPaGvzpvL+YmdxFZ/UbznW8n5SYx8llD+Tw+zNRcwI3Ye6d76mFcM1PH9ux9C6spzHIBq0xOq/zKnNVFDaMTWN7M0uQTFb4C9+7Qp9jXZfvrnrrAKpJZBUdjR7VJ6E+6B8CvAJfava0l2SQ6JuVt93yjfKNfHyLiCYHvH1946zIY91YkCSaOdctsvhclsy6tdSCBpWZjP3+bhAWAfFg+m0vqp49MCn2PuhQB3CpDtB8uFJlMt2snqhcVq8CO+YlBaAmYRM0lmT4FASZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bc31BF1ElyVGC/v4fKu2HDRZqSdf4+H+tEpStshewts=;
 b=Zk8mJQyQYLJsGuQ06gQgRNSFbZuA1UBJ/XRiVwdAxo0Z42L8g1+Ayt6lZtLVRlAgTZrpaYj5OgtK0uEZMqkjPMg+RCeOaHlpQi9lxyPTyeuO4bKZ2EDsVpIz4hS1Jef7VXUBq47EWYoxzjRJhE202/I034SF59S537F5yI5ke663Xe+KObtJRMKHhOz7SDVn8xQhVDGIZvVZdy8Z2zyg6ZCTLC3PEymrB93SIOe+ffdRvSYBFgKMiDWXEMCVKNzKC3Cs7UixcjsiLzfoBuxQHr8TyTLJowWu18O1O2WGe44SWRTc/zJ1k2Cv+mhjrnG3WxY81oBm0aODoEvkJvsfiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bc31BF1ElyVGC/v4fKu2HDRZqSdf4+H+tEpStshewts=;
 b=BIP0wYax1P4bQ5wjaPCQ8IWQ8mUZEwNdT8Pir+YkCEP5z8LggB8CKtN73hJOn90381+IF+aaMoyVIkf6pBFh2EvDrOJGsDbZRnuGPM87SvI7Lk/N7qaaEDLe0M+KPOjbucrEDlevCogXuDq6UWtwDQwm8AYT2o25ujf0ZYuNIAc=
Received: from SA1PR10MB5841.namprd10.prod.outlook.com (2603:10b6:806:22b::16)
 by DM6PR10MB3865.namprd10.prod.outlook.com (2603:10b6:5:1d3::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.12; Tue, 15 Feb
 2022 15:04:43 +0000
Received: from SA1PR10MB5841.namprd10.prod.outlook.com
 ([fe80::58ef:3181:b9d4:b716]) by SA1PR10MB5841.namprd10.prod.outlook.com
 ([fe80::58ef:3181:b9d4:b716%5]) with mapi id 15.20.4951.016; Tue, 15 Feb 2022
 15:04:43 +0000
From: Mark Kanda <mark.kanda@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 3/3] kvm: Support for querying fd-based stats
Date: Tue, 15 Feb 2022 09:04:33 -0600
Message-Id: <20220215150433.2310711-4-mark.kanda@oracle.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220215150433.2310711-1-mark.kanda@oracle.com>
References: <20220215150433.2310711-1-mark.kanda@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN7PR04CA0038.namprd04.prod.outlook.com
 (2603:10b6:806:120::13) To SA1PR10MB5841.namprd10.prod.outlook.com
 (2603:10b6:806:22b::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e4fb677b-ae14-4a56-8339-08d9f0947f2a
X-MS-TrafficTypeDiagnostic: DM6PR10MB3865:EE_
X-Microsoft-Antispam-PRVS: <DM6PR10MB3865B578B5F28EAC714EDEEDF9349@DM6PR10MB3865.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:17;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Sjpp27R+9YMZ9okxAUCNWHiW/yQxDlpQnZGlx3xThOn+DFYUC43Ifc+7OOhe5k6RhPggnsJtLlcHhWaO0GpFLISWVOMVpvwyX9reDEXtJdfXXEH/4emLX/C59yYvF/pY5/SxWyJkp/gJ2oabhEcJPPobaTb3fTvQhuZLC4wJY/XtcyPAutnbJk5wtusnk88zxjhhyc3ZbZeiOZvE57G8eDql297l+NjZCH3qV3eombL0x+Fb6R9K9/C2P8YVoqCtAyMKqYALq6/tu8TGtkOLKg3IoE0ogeFh2raVhTQ6lj78MyHxUejVDY6YCjtOr3pnjI0dRkAW3QDPD3KjLB74AxOdBQLKvpCshlXUK7AGnBmsSqiaxRbZI9ewaC1/rBFp3q2+uIJH/1s5zj9y3ByroIr6hMD/lM6J4VWi9R+E4mrCUKVQox6+6G+b2+fjr6icwF+pFRE7t3EvC4srvMB1+7Purys6kAXNcY3EMeMLzCvBloFks2kumoGci8AksYSe+bIwRH5MA3nR21PzRA4243jyg82eIUfiSoQtxJTHnHfaZV6yr2pac1T1fyi06KYwZ5blRvpYsPlu+yENuz3kgrQsoAtZnStYC737sIpkFqY3Ct0F793ttmiNz2eE2Vd69SvtTAsqZs/4HKzT6+4MLfuziZW7qou23fzOV5HXqlmnH3TM+lDnLSFETX3YcrMZp/5Y0MVGvopVin/N6jyd3Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR10MB5841.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6506007)(107886003)(2616005)(8676002)(1076003)(66476007)(26005)(6512007)(66556008)(86362001)(6916009)(52116002)(66946007)(6486002)(316002)(6666004)(508600001)(36756003)(83380400001)(44832011)(38350700002)(38100700002)(4326008)(5660300002)(186003)(8936002)(2906002)(30864003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PpuMB18lgmR4Ymwp9YDw+Mikj3AkKpwU4LEwOjv1n+8FfL16bolJoyz5TFjj?=
 =?us-ascii?Q?np364k4YiJf09pJ5I2eOgVLP6+VUwCLwj4NhRiQrmoTf3EsaL7rcNGwJZxHZ?=
 =?us-ascii?Q?mX56zh/L8T6PkIVIVpPC/555SnJ0o/Hvn/XQF6SOnboHw3IpjRIjtKYjgWrW?=
 =?us-ascii?Q?gtE1CxpFubdj+XGUe2SyMAcSHuxqIhrmIZq5G8ocfQzhZqaMUGbj79st77R1?=
 =?us-ascii?Q?5wmPVnQG+0zVNuKAVZzSe+Av2Am6M3yxEOMJogNXgnYonJW55WnAq9trsC2b?=
 =?us-ascii?Q?HOmWnE7hBJ5VFGosRxSXoqr9ZGGUMBpk/aY07zbfxvh9eUuDrbvIadc2oWhW?=
 =?us-ascii?Q?S4p8/jtoI67kUl/haYOxYmqMTrjhZobBXpgY7FWnneAMJmJuYgKwy6HlQgGp?=
 =?us-ascii?Q?SpTrRt3loKVdfk25ggPWd9zqfhrNv/HSK2E1oXd2SOt681pqeX1NjNI/A8Pn?=
 =?us-ascii?Q?5KFkDrhUmT8vjRIN20BNsi3U/IfDlxNqIUSr6udFDSYBmx7ZyXlFRva1rfdk?=
 =?us-ascii?Q?kkmlVtV9elWdTC7oLIFs8FiATPfnENGOoDsB1cfGZ0HVCcpyC9Rh9NP8qEAU?=
 =?us-ascii?Q?5EedCJm1cg2qVKz70YuGn0Cl8uLQI8hl+pUlbMcWn0xNoHlob4T8pN8m8ypA?=
 =?us-ascii?Q?MA54mm7cNELvbLwOdn92vSITUOCriN8J2TwOpFaM1U1aOfUIZIYqsJxiKWST?=
 =?us-ascii?Q?zFhz9ZmvosPfrmTIGOOCiOnR/lX5XSl+RWjMDdR3J/AASqazZKrR+1QDEtoq?=
 =?us-ascii?Q?pKTsOBXLVti1XpyS6QoM/vWR7xwmndE2RCAz9ud0AA5hX3IvamEr14v0avz7?=
 =?us-ascii?Q?FoE64sPt81pUmw4huUodWLluOffNqxn6P5QZtqxZV9UmxlQRFG2Ulh1AQFj2?=
 =?us-ascii?Q?lJJFpsPZfZ8AfHYQHEnYczGkx+MusNL/xuEz0TPb6qS4cKJYBemVeNGP99AP?=
 =?us-ascii?Q?afYshog9UNLLQeuGR6ujjOAtMvj4/IO5DAeNXkqr4wj/DJYS/ptwZZDUtYn8?=
 =?us-ascii?Q?21KlVqpQ7sh2F688FyKGpcskqaZeSqlrr5yLXe39GAM8FmvbtBdGiROu98rG?=
 =?us-ascii?Q?gafu/uZ35WEcRTA6Jge1U5kcYrl07h5OQjBJfAp9CIzIbpg6C3y3v67tzN34?=
 =?us-ascii?Q?d33E43B75utJO2w06BoeUmY/KzhyVdeW3c4S98pp2ewavZpm2VZT4jsEFph9?=
 =?us-ascii?Q?EnuKU4CCfKRRtSkSybIgtyLYCPLfd0hUJZfVF1JCxleqxJ1QhWDJY9yXYQ30?=
 =?us-ascii?Q?stKyeRU7VoA8F8P6QTYbF8gqvEhK6SKLC5kCujLo1wVFesZzoA4I+v8VU3e3?=
 =?us-ascii?Q?rRCt14xhA65Bm+hdKUJxPWKYmE2WyeoYsrOEjdAOUNwdxqH73EYBw61fRQMn?=
 =?us-ascii?Q?4YhdWcGRJS+tdhCftKeRZSqnRt+D3PZZWG5H+VOznQ9ZB06Gv6dyVQihUqqB?=
 =?us-ascii?Q?B6LF/vr6H0ofiF88j6yUmGgtnGI/gcRnkYhwHe8jjp8EBIsm18/LrbQVH3gd?=
 =?us-ascii?Q?NkOadMzTFLYjESlL+mePJfjUUvvX47xul144w+vVIs56XHrV9g3qBL3k2i+9?=
 =?us-ascii?Q?OVsyZjJycjYc3/vneefjorMYmh4tjVIz56zkPTCQBBKFZV/6jQyFAYHp1lwl?=
 =?us-ascii?Q?g5tZchHEyky0HcP6bfYL/jw=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4fb677b-ae14-4a56-8339-08d9f0947f2a
X-MS-Exchange-CrossTenant-AuthSource: SA1PR10MB5841.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2022 15:04:43.0672 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ylqAA3NZNduL+AdbE/7z97YE0Yp3PjPBfFKG8XygG6dITuw5XaXwnOqXTxC/Y5d1YA8Wf/+oH4Z3e4IIU31caw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB3865
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10258
 signatures=673431
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 phishscore=0 bulkscore=0
 malwarescore=0 adultscore=0 spamscore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202150088
X-Proofpoint-ORIG-GUID: 3-OQdQu_VedDndjA5WQfi3Ffliawwo6d
X-Proofpoint-GUID: 3-OQdQu_VedDndjA5WQfi3Ffliawwo6d
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
 accel/kvm/kvm-all.c | 393 ++++++++++++++++++++++++++++++++++++++++++++
 qapi/stats.json     |   2 +-
 2 files changed, 394 insertions(+), 1 deletion(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 0e66ebb497..7efd9b86c8 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -47,6 +47,7 @@
 #include "kvm-cpus.h"
 
 #include "hw/boards.h"
+#include "monitor/stats.h"
 
 /* This check must be after config-host.h is included */
 #ifdef CONFIG_EVENTFD
@@ -2309,6 +2310,9 @@ bool kvm_dirty_ring_enabled(void)
     return kvm_state->kvm_dirty_ring_size ? true : false;
 }
 
+static void query_stats_cb(StatsResults *, StatsFilter *, Error **);
+static void query_stats_schemas_cb(StatsSchemaResults *, Error **);
+
 static int kvm_init(MachineState *ms)
 {
     MachineClass *mc = MACHINE_GET_CLASS(ms);
@@ -2637,6 +2641,11 @@ static int kvm_init(MachineState *ms)
         }
     }
 
+    if (kvm_check_extension(kvm_state, KVM_CAP_BINARY_STATS_FD)) {
+        add_stats_callbacks(STATS_PROVIDER_KVM, &query_stats_cb,
+                            &query_stats_schemas_cb);
+    }
+
     return 0;
 
 err:
@@ -3696,3 +3705,387 @@ static void kvm_type_init(void)
 }
 
 type_init(kvm_type_init);
+
+typedef struct StatsArgs {
+    StatsFilter *filter;
+    bool is_schema;
+    union StatsResultsType {
+        StatsResults *stats;
+        StatsSchemaResults *schema;
+    } result;
+    Error **errp;
+} StatsArgs;
+
+static StatsList *add_kvmstat_entry(struct kvm_stats_desc *pdesc,
+                                    uint64_t *stats_data,
+                                    StatsList *stats_list,
+                                    Error **errp)
+{
+
+    StatsList *stats_entry;
+    Stats *stats;
+    uint64List *val_list = NULL;
+
+    switch (pdesc->flags & KVM_STATS_TYPE_MASK) {
+    case KVM_STATS_TYPE_CUMULATIVE:
+    case KVM_STATS_TYPE_INSTANT:
+    case KVM_STATS_TYPE_PEAK:
+    case KVM_STATS_TYPE_LINEAR_HIST:
+    case KVM_STATS_TYPE_LOG_HIST:
+        break;
+    default:
+        return stats_list;
+    }
+
+    switch (pdesc->flags & KVM_STATS_UNIT_MASK) {
+    case KVM_STATS_UNIT_NONE:
+    case KVM_STATS_UNIT_BYTES:
+    case KVM_STATS_UNIT_CYCLES:
+    case KVM_STATS_UNIT_SECONDS:
+        break;
+    default:
+        return stats_list;
+    }
+
+    switch (pdesc->flags & KVM_STATS_BASE_MASK) {
+    case KVM_STATS_BASE_POW10:
+    case KVM_STATS_BASE_POW2:
+        break;
+    default:
+        return stats_list;
+    }
+
+    /* Alloc and populate data list */
+    stats_entry = g_malloc0(sizeof(*stats_entry));
+    stats = g_malloc0(sizeof(*stats));
+    stats->name = g_strdup(pdesc->name);
+    stats->value = g_malloc0(sizeof(*stats->value));
+
+    if (pdesc->size == 1) {
+        stats->value->u.scalar = *stats_data;
+        stats->value->type = QTYPE_QNUM;
+    } else {
+        int i;
+        for (i = 0; i < pdesc->size; i++) {
+            uint64List *val_entry = g_malloc0(sizeof(*val_entry));
+            val_entry->value = stats_data[i];
+            val_entry->next = val_list;
+            val_list = val_entry;
+        }
+        stats->value->u.list.values = val_list;
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
+    StatsSchemaValueList *schema_entry = g_malloc0(sizeof(*schema_entry));
+    schema_entry->value = g_malloc0(sizeof(*schema_entry->value));
+
+    switch (pdesc->flags & KVM_STATS_TYPE_MASK) {
+    case KVM_STATS_TYPE_CUMULATIVE:
+        schema_entry->value->type = STATS_TYPE_CUMULATIVE;
+        break;
+    case KVM_STATS_TYPE_INSTANT:
+        schema_entry->value->type = STATS_TYPE_INSTANT;
+        break;
+    case KVM_STATS_TYPE_PEAK:
+        schema_entry->value->type = STATS_TYPE_PEAK;
+        break;
+    case KVM_STATS_TYPE_LINEAR_HIST:
+        schema_entry->value->type = STATS_TYPE_LINEAR_HIST;
+        schema_entry->value->bucket_size = pdesc->bucket_size;
+        schema_entry->value->has_bucket_size = true;
+        break;
+    case KVM_STATS_TYPE_LOG_HIST:
+        schema_entry->value->type = STATS_TYPE_LOG_HIST;
+        break;
+    default:
+        goto exit;
+    }
+
+    switch (pdesc->flags & KVM_STATS_UNIT_MASK) {
+    case KVM_STATS_UNIT_NONE:
+        schema_entry->value->unit = STATS_UNIT_NONE;
+        break;
+    case KVM_STATS_UNIT_BYTES:
+        schema_entry->value->unit = STATS_UNIT_BYTES;
+        break;
+    case KVM_STATS_UNIT_CYCLES:
+        schema_entry->value->unit = STATS_UNIT_CYCLES;
+        break;
+    case KVM_STATS_UNIT_SECONDS:
+        schema_entry->value->unit = STATS_UNIT_SECONDS;
+        break;
+    default:
+        goto exit;
+    }
+
+    switch (pdesc->flags & KVM_STATS_BASE_MASK) {
+    case KVM_STATS_BASE_POW10:
+        schema_entry->value->base = STATS_BASE_POW10;
+        break;
+    case KVM_STATS_BASE_POW2:
+        schema_entry->value->base = STATS_BASE_POW2;
+        break;
+    default:
+        goto exit;
+    }
+
+    schema_entry->value->name = g_strdup(pdesc->name);
+    schema_entry->value->exponent = pdesc->exponent;
+    schema_entry->next = list;
+    return schema_entry;
+exit:
+    g_free(schema_entry->value);
+    g_free(schema_entry);
+    return list;
+}
+
+/* Cached stats descriptors */
+typedef struct StatsDescriptors {
+    char *ident; /* 'vm' or vCPU qom path */
+    struct kvm_stats_desc *kvm_stats_desc;
+    struct kvm_stats_header *kvm_stats_header;
+    QTAILQ_ENTRY(StatsDescriptors) next;
+} StatsDescriptors;
+
+static QTAILQ_HEAD(, StatsDescriptors) stats_descriptors =
+    QTAILQ_HEAD_INITIALIZER(stats_descriptors);
+
+static StatsDescriptors *find_stats_descriptors(StatsFilter *filter)
+{
+    StatsDescriptors *entry;
+    QTAILQ_FOREACH(entry, &stats_descriptors, next) {
+        switch (filter->target) {
+        case STATS_TARGET_VM:
+            if (g_str_equal(entry->ident, StatsTarget_str(STATS_TARGET_VM))) {
+                return entry;
+            }
+            break;
+        case STATS_TARGET_VCPU:
+            if (g_str_equal(entry->ident,
+                            current_cpu->parent_obj.canonical_path)) {
+                return entry;
+            }
+            break;
+        default:
+            break;
+        }
+    }
+    return NULL;
+}
+
+static void query_stats(union StatsResultsType result, StatsFilter *filter,
+                        int stats_fd, bool is_schema, Error **errp)
+{
+    struct kvm_stats_desc *kvm_stats_desc;
+    struct kvm_stats_header *kvm_stats_header;
+    StatsDescriptors *descriptors;
+    g_autofree uint64_t *stats_data = NULL;
+    struct kvm_stats_desc *pdesc;
+    void *stats_list = NULL;
+    size_t size_desc, size_data = 0;
+    ssize_t ret;
+    int i;
+
+    descriptors = find_stats_descriptors(filter);
+    if (!descriptors) {
+        descriptors = g_malloc0(sizeof(*descriptors));
+
+        /* Read stats header */
+        kvm_stats_header = g_malloc(sizeof(*kvm_stats_header));
+        ret = read(stats_fd, kvm_stats_header, sizeof(*kvm_stats_header));
+        if (ret != sizeof(*kvm_stats_header)) {
+            error_setg(errp, "KVM stats: failed to read stats header: "
+                       "expected %zu actual %zu",
+                       sizeof(*kvm_stats_header), ret);
+            return;
+        }
+        size_desc = sizeof(*kvm_stats_desc) + kvm_stats_header->name_size;
+
+        /* Read stats descriptors */
+        kvm_stats_desc = g_malloc0(kvm_stats_header->num_desc * size_desc);
+        ret = pread(stats_fd, kvm_stats_desc,
+                    size_desc * kvm_stats_header->num_desc,
+                    kvm_stats_header->desc_offset);
+
+        if (ret != size_desc * kvm_stats_header->num_desc) {
+            error_setg(errp, "KVM stats: failed to read stats descriptors: "
+                       "expected %zu actual %zu",
+                       size_desc * kvm_stats_header->num_desc, ret);
+            return;
+        }
+        descriptors->kvm_stats_header = kvm_stats_header;
+        descriptors->kvm_stats_desc = kvm_stats_desc;
+        descriptors->ident = strdup(filter->target == STATS_TARGET_VM ?
+                                    StatsTarget_str(STATS_TARGET_VM) :
+                                    current_cpu->parent_obj.canonical_path);
+        QTAILQ_INSERT_TAIL(&stats_descriptors, descriptors, next);
+    } else {
+        kvm_stats_header = descriptors->kvm_stats_header;
+        kvm_stats_desc = descriptors->kvm_stats_desc;
+        size_desc = sizeof(*kvm_stats_desc) + kvm_stats_header->name_size;
+    }
+
+    /* Tally the total data size; read schema data */
+    for (i = 0; i < kvm_stats_header->num_desc; ++i) {
+        pdesc = (void *)kvm_stats_desc + i * size_desc;
+        size_data += pdesc->size * sizeof(*stats_data);
+        if (is_schema) {
+            stats_list = add_kvmschema_entry(pdesc, (StatsSchemaValueList *)
+                                             stats_list, errp);
+        }
+    }
+
+    /* If schema request, add the entries and return */
+    if (is_schema) {
+        switch (filter->target) {
+        case STATS_TARGET_VM:
+            add_vm_stats_schema((StatsSchemaValueList *)stats_list,
+                                 result.schema, STATS_PROVIDER_KVM);
+            break;
+        case STATS_TARGET_VCPU:
+            add_vcpu_stats_schema((StatsSchemaValueList *)stats_list,
+                                  result.schema, STATS_PROVIDER_KVM);
+            break;
+        default:
+            break;
+        }
+        return;
+    }
+
+    stats_data = g_malloc0(size_data);
+    ret = pread(stats_fd, stats_data, size_data, kvm_stats_header->data_offset);
+
+    if (ret != size_data) {
+        error_setg(errp, "KVM stats: failed to read data: "
+                   "expected %zu actual %zu", size_data, ret);
+        return;
+    }
+
+    for (i = 0; i < kvm_stats_header->num_desc; ++i) {
+        uint64_t *stats;
+        pdesc = (void *)kvm_stats_desc + i * size_desc;
+
+        /* Add entry to the list */
+        stats = (void *)stats_data + pdesc->offset;
+        if (!stats_requested_name(pdesc->name, STATS_PROVIDER_KVM, filter)) {
+            continue;
+        }
+        stats_list =
+            add_kvmstat_entry(pdesc, stats, (StatsList *) stats_list, errp);
+    }
+
+    if (!stats_list) {
+        return;
+    }
+
+    switch (filter->target) {
+    case STATS_TARGET_VM:
+        add_vm_stats_entry((StatsList *)stats_list, result.stats,
+                           STATS_PROVIDER_KVM);
+        break;
+    case STATS_TARGET_VCPU:
+        add_vcpu_stats_entry((StatsList *)stats_list, result.stats,
+                             STATS_PROVIDER_KVM,
+                             current_cpu->parent_obj.canonical_path);
+        break;
+    default:
+        break;
+    }
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
+    query_stats(kvm_stats_args->result, kvm_stats_args->filter, stats_fd,
+                kvm_stats_args->is_schema, kvm_stats_args->errp);
+    close(stats_fd);
+}
+
+static void query_stats_cb(StatsResults *stats_result, StatsFilter *filter,
+                           Error **errp)
+{
+    KVMState *s = kvm_state;
+    CPUState *cpu;
+    int stats_fd;
+
+    switch (filter->target) {
+    case STATS_TARGET_VM:
+    {
+        union StatsResultsType result;
+        result.stats = stats_result;
+        stats_fd = kvm_vm_ioctl(s, KVM_GET_STATS_FD, NULL);
+        if (stats_fd == -1) {
+            error_setg(errp, "KVM stats: ioctl failed");
+            return;
+        }
+        query_stats(result, filter, stats_fd, false, errp);
+        break;
+    }
+    case STATS_TARGET_VCPU:
+    {
+        g_autofree StatsArgs *stats_args = g_malloc0(sizeof(*stats_args));
+        stats_args->filter = filter;
+        stats_args->errp = errp;
+        stats_args->result.stats = stats_result;
+        CPU_FOREACH(cpu) {
+            if (!stats_requested_vcpu(cpu->parent_obj.canonical_path,
+                                      STATS_PROVIDER_KVM, filter)) {
+                continue;
+            }
+            run_on_cpu(cpu, query_stats_vcpu, RUN_ON_CPU_HOST_PTR(stats_args));
+        }
+        break;
+    }
+    default:
+        break;
+    }
+}
+
+void query_stats_schemas_cb(StatsSchemaResults *stats_result, Error **errp)
+{
+    g_autofree StatsArgs *stats_args = g_malloc0(sizeof(*stats_args));
+    g_autofree StatsFilter *filter = g_malloc0(sizeof(*filter));
+    union StatsResultsType result;
+    KVMState *s = kvm_state;
+    int stats_fd;
+
+    stats_args->filter = filter;
+    stats_args->errp = errp;
+
+    result.schema = stats_result;
+
+    stats_fd = kvm_vm_ioctl(s, KVM_GET_STATS_FD, NULL);
+    if (stats_fd == -1) {
+        error_setg(errp, "KVM stats: ioctl failed");
+        return;
+    }
+
+    stats_args->result.schema = stats_result;
+    stats_args->is_schema = true;
+
+    /* Query VM */
+    stats_args->filter->target = STATS_TARGET_VM;
+    query_stats(result, filter, stats_fd, true, errp);
+
+    /* Query vCPU */
+    stats_args->filter->target = STATS_TARGET_VCPU;
+    run_on_cpu(first_cpu, query_stats_vcpu, RUN_ON_CPU_HOST_PTR(stats_args));
+}
diff --git a/qapi/stats.json b/qapi/stats.json
index ae5dc3ee2c..13708e19c1 100644
--- a/qapi/stats.json
+++ b/qapi/stats.json
@@ -61,7 +61,7 @@
 # Since: 7.0
 ##
 { 'enum': 'StatsProvider',
-  'data': [ ] }
+  'data': [ 'kvm' ] }
 
 ##
 # @StatsTarget:
-- 
2.27.0


