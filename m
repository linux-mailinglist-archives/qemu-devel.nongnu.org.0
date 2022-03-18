Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 525634DDCD8
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 16:29:13 +0100 (CET)
Received: from localhost ([::1]:37100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVEXQ-0001fx-Cz
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 11:29:12 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.kanda@oracle.com>)
 id 1nVEKr-0003Sv-TE
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 11:16:13 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:10504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.kanda@oracle.com>)
 id 1nVEKp-0004SK-F6
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 11:16:13 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22ICdJcd022661; 
 Fri, 18 Mar 2022 15:16:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=Z6ajZwLQAHkBZACnGzv5snnJ/0lHKzsupoxikbPhH0o=;
 b=ed8GOyrAD4Et0qiVjRH0N+f5uSQCN1GKXxlxy9lqKtSeeHEzcyv/rhwPPIKcklmgUp80
 BLuAVCnr0aINrtwQMBXf3gvLki1wk7+cg9zwYQyWJoFC4sODM6imdSXkE2zzX0F7w4U3
 4TLUpZxkSjWVearGYvVgXsi15kzbwsNDX3vmGuUKCw+k4L3LVw0dhf+r2Urk1IffWd2I
 j1Wq6gJvl/sxToI8PsivyBmsXanpT+ONeTD/uWOfshFNi5NnYZHIdZD69/Wr5A+XLZ+E
 KywdSx8DOP2RDNl2K7APa0pnGcY9BFd4mIo6oKbPvogCXQXtwMEkpL5NuhMNte7msw70 ww== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3et5s6v8fc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Mar 2022 15:16:09 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 22IFA35t061087;
 Fri, 18 Mar 2022 15:16:08 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1anam02lp2041.outbound.protection.outlook.com [104.47.57.41])
 by userp3020.oracle.com with ESMTP id 3et65aa4u1-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Mar 2022 15:16:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mZCPZhCSKvQ/Q/w0kEacD5hbMigCLv7xZ1bf9ITbVmCCo/dHI49Coi8IQcp/TpWnc4I1paZIDrNj2GXt0qGat3kkCVYkng3yFkxlUTD2E+bDPL+SgVOErIV7wv4zMEN/yzMtjnXZlwXHYxWTuhna72sra4qor2mDtxKKijJS0UxsH6doZFNRELqGH7xy8uhyKjSoAibUxI/ZAdg8iH3LYXNod+RBpwxBRKM6TSsghIoTP9PUjwGlJNWVjomA43VCk/cvCNAL62d1mJ6jDn1itj6XvwKIRgjBMTSOVUZmzeG6T9TyhXlckI5UX6VgfGo2sXl/gtRhdCN095zePRMQQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z6ajZwLQAHkBZACnGzv5snnJ/0lHKzsupoxikbPhH0o=;
 b=cySc8svBpPxDpOnzgPrPtJKRlABNAHUcKCJOwM+yVizZ2+z8PSxa7K0cAwsNIx7REhl4dt9ojvtat8SV4HxiTgVpyBKvzqwH44/5VCSPRXEt2k5AuL4klm4IARTRgKEQMOEDetA1GcA+zKkdaVHqOyyuv+RLRQ06vcDlKksflvsK2tuQ3OzbSZTJ6pc3y+Pp1SEkHf/qt9853FqfsMCHk7KEXaynJsgeeXRh8OU7g35O3TS3OHbzWrzGSzPlF6IsPQ7YmlNDVcE1QcMRxcoSq8RcH7jvTGuPGy9VXGBtUKmPPGk7ZYWvUIXfdolw4j8e0Jsq1zAQu0ycvKNN3vk+RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z6ajZwLQAHkBZACnGzv5snnJ/0lHKzsupoxikbPhH0o=;
 b=yMVwBUzUh0xc3WrQjSLBEMxNxwLHw9FMXlJ3tbsS7+iTOmHpRjHR4B9oyf0HzGMjQUejxmQBTLsth27V7pRKD59nRrMgMOsNH/MioK6yZoCGDYwhTKC7JvnUMXOukLmhyCMRokbDbgDs8hgi+P+HcMYqSf03jnQ7ltZlS4OMR8k=
Received: from MW5PR10MB5825.namprd10.prod.outlook.com (2603:10b6:303:19a::11)
 by MN2PR10MB4174.namprd10.prod.outlook.com (2603:10b6:208:1dd::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.14; Fri, 18 Mar
 2022 15:16:07 +0000
Received: from MW5PR10MB5825.namprd10.prod.outlook.com
 ([fe80::5915:58a8:f9b1:a71e]) by MW5PR10MB5825.namprd10.prod.outlook.com
 ([fe80::5915:58a8:f9b1:a71e%3]) with mapi id 15.20.5081.015; Fri, 18 Mar 2022
 15:16:07 +0000
From: Mark Kanda <mark.kanda@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 5/5] i386/cpu: Free env->xsave_buf in x86_cpu_unrealizefn()
Date: Fri, 18 Mar 2022 10:15:55 -0500
Message-Id: <20220318151555.381737-6-mark.kanda@oracle.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220318151555.381737-1-mark.kanda@oracle.com>
References: <20220318151555.381737-1-mark.kanda@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DM5PR06CA0059.namprd06.prod.outlook.com
 (2603:10b6:3:37::21) To MW5PR10MB5825.namprd10.prod.outlook.com
 (2603:10b6:303:19a::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f8af0d32-ee6a-41a4-66cb-08da08f239c8
X-MS-TrafficTypeDiagnostic: MN2PR10MB4174:EE_
X-Microsoft-Antispam-PRVS: <MN2PR10MB41748A76C1F95617A8E04721F9139@MN2PR10MB4174.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yQwFWdaZvYn8XV8DaMP8g7qqzOvkeC1y8My/VCaAr4BnQ0ksDdqjfv0+SlMFMcPyH8sgjAzC8C+K+qibXgjfsaj2EMAQ2o6tHIrIQJqEwIpKmpTt/DpSKy9ELdDItcIRt5XDERb1TcEF5+C4xnbPHYnnAYbiRkqDrjT9Rs/QPk+vUa1vCBmYoeHwZy2UjivGmNHvyTbasgWfnAq3h5lYQf5RgqKE8okU6zbx/wh5KA+XQz46ZR55E/UbN1JZobfvrwCrZ1tyYAMVl9bhTYIvDMpZ7XTttt/ItUf3kjXun9sXNQs4F/2MHYksBORwPqVlnr+/BohgNeT6f/gjXijR7D9ls2hhwxzwG0lhXnU2N6GsCt/EuF1CZyKffu8H+CzJGBeb955fUznmmSDZv+M8wwvkzzHEXJGfQIlnwlowTyoz2G9bitd3hP/B+ZCDdH/jdpsOAqe11bua9BLecc4ky24qzcP4X4bQQVbzwQio/SLGQn7lZCLhWkl+Y2y39gESQlvjBWPMBuZoGj6mNNo1vtpkPRR0OpiE73blNEg4ge3HWkmNy1X01mckGmBS76wLYrPIcF8akbgchoo6y9qHLnr7G6aEdgcfEDmAs8fGIqWBvj8YLRxUE8II+r2Jl+QC37uSdikDt2yyJdymmyCvuA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW5PR10MB5825.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(52116002)(6506007)(107886003)(508600001)(36756003)(6666004)(2616005)(1076003)(6486002)(6512007)(86362001)(186003)(316002)(8936002)(2906002)(6916009)(5660300002)(44832011)(66946007)(4326008)(66556008)(66476007)(8676002)(38100700002)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BkrVXSfUTBro5MhgzR4zWgs/wmk5+Wb6bKUQN5GSQTYOAjkAI/o0x8eoUojF?=
 =?us-ascii?Q?5DtIg2Qe4WHVbMh1mLrdcTJZymGYZeLUcMBfrjT2fzTOVdxiSG1GRIfaaHTq?=
 =?us-ascii?Q?ESPnvnv3OumjJMdD0zcXnBi9gmBeo+9wfi6RZpvAsJ37CZvpsHNj/rUdotOB?=
 =?us-ascii?Q?le35RUKZiC3cmbDftqcLNw1XvlVheGiKOCwg9rdfddQAvnGXFrsBxmoKKOIO?=
 =?us-ascii?Q?lIzjon4zEu3uH4q5SnlqC/nZqhwtWq3xzXnur6h88B9pzQfqB+SJ/jM0A4q3?=
 =?us-ascii?Q?EWm/1sxIYzHXBXTs5DnadhTtYTC29MSOSemK28eTR5Gn1+SFa0eUUdHDqZnR?=
 =?us-ascii?Q?pzDBwZfEu0AxlCoQ9mHw8kJcXzNpRJJeJ5nF09kFJ3QLu3TpP49VPB4MCnJE?=
 =?us-ascii?Q?PF6iQgvTe5r+LkZPSALupw183XzsY5uEkrbTlPdpSG4jFviWkkppVnGEN3wN?=
 =?us-ascii?Q?MSs24UDA0wfeu/brFmkTWJ2UgKjaapnLIOrUOeNJNq6m/QFGp5dvs96+AgYH?=
 =?us-ascii?Q?PO+LLVRR1Wjgvg5sfa4ZiOL3ygRyEgZr7NOSwxAydmC05hbpmZ1X8zBBbB05?=
 =?us-ascii?Q?Qx84JmxfAyJxx0rSvzobtO4hbVnfBkKVMRREsYNUl8S0gm91hkjXka5fskff?=
 =?us-ascii?Q?+DdNHvjUSoNcng8+vYOQuQs8yxrUQnGSfIM4dcCdMDbBzzxwD/gI2vzT6iLZ?=
 =?us-ascii?Q?1S/gyKZjxGIm1vDHy5i1vRG0sa2ddhFdcEyDz4OY9QUP5nlk5j/HepwRxerK?=
 =?us-ascii?Q?sS9J+bV2DVHJ6sM3TNP5UVtr2NaspVy3TEYto/pVWQ6OCDwBluq8EzhzS3ZS?=
 =?us-ascii?Q?xGwut5f+q6b1Kh1+4xz+U/KE9n6tG+3ej9Lbyry/sXLwK4v2uQJm83HTr/C7?=
 =?us-ascii?Q?+qZ1e96M5Q25gG3OBF3h5iSAG3Wc1ZmfUFEEmGYGZBERy0lVsGHJVM3gJE1R?=
 =?us-ascii?Q?O4dREcxtYu7OGDbB7AB+x7RJfJcR/aviDwwymQYgHJQEXpaqw+uuctfy1AUj?=
 =?us-ascii?Q?Lf0t1J8o37XC6sp4mz8GmIwo57usGkhLzCOTvQ198yijcVNbBwLY66UgYOQ/?=
 =?us-ascii?Q?r3l3joJtM8XTed7rDQoBBpsSsA3ZWxuDbpK9ngCgUwDpMeS56bYgJY+mrikL?=
 =?us-ascii?Q?cYFha/djFgrzEM1IUNPT5Z7NJNu0DRM+OXLIgfvo0Q3/JFM10fhtD2YFt8y8?=
 =?us-ascii?Q?fjwUqODp18I5IqPt6cWY0CWecQdEbTNs6BkEqM0rJ8BSFw0dR5yk9eCwz+xm?=
 =?us-ascii?Q?eTBDxbXizUUFd5OMR7iXf3wxLDhi/eo9WJ+l1wL2PbU/e6HUYXAlgDiv3ptk?=
 =?us-ascii?Q?6U0MeOmIQhy9P8fYshrGhMsKWvyF//HgY6KEtawHr9NJkwuQvq/llLeYUDf4?=
 =?us-ascii?Q?8efNpB3iu9zr8sarBf3UDAeOZn5NaaAnKEQ2t//2a5zpNHAC1Y2oYApB3kz6?=
 =?us-ascii?Q?NsAnuErvSbzuWf6xyOaz57aBRpT2pNHZj3HFvyzOm06F9BaiTUVB0Sgxg/oE?=
 =?us-ascii?Q?nt2rOwDX1qyy+1s=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8af0d32-ee6a-41a4-66cb-08da08f239c8
X-MS-Exchange-CrossTenant-AuthSource: MW5PR10MB5825.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2022 15:16:07.3076 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n5X8GCB5+rGwwlHUst0Mu70kGratw5JIAaxTcEogb/C/iWUMapTcP7eadQtkhd5NDBJ/wDz0b6dcC8SS7EzP9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4174
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10289
 signatures=693715
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0
 malwarescore=0 adultscore=0 bulkscore=0 mlxscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203180085
X-Proofpoint-GUID: -j5AC4mnTKZYgrQCYBGnmUUbGm6YW0nL
X-Proofpoint-ORIG-GUID: -j5AC4mnTKZYgrQCYBGnmUUbGm6YW0nL
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=mark.kanda@oracle.com; helo=mx0b-00069f02.pphosted.com
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
Cc: pbonzini@redhat.com, richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

vCPU hotunplug related leak reported by Valgrind:

==132362== 4,096 bytes in 1 blocks are definitely lost in loss record 8,440 of 8,549
==132362==    at 0x4C3B15F: memalign (vg_replace_malloc.c:1265)
==132362==    by 0x4C3B288: posix_memalign (vg_replace_malloc.c:1429)
==132362==    by 0xB41195: qemu_try_memalign (memalign.c:53)
==132362==    by 0xB41204: qemu_memalign (memalign.c:73)
==132362==    by 0x7131CB: kvm_init_xsave (kvm.c:1601)
==132362==    by 0x7148ED: kvm_arch_init_vcpu (kvm.c:2031)
==132362==    by 0x91D224: kvm_init_vcpu (kvm-all.c:516)
==132362==    by 0x9242C9: kvm_vcpu_thread_fn (kvm-accel-ops.c:40)
==132362==    by 0xB2EB26: qemu_thread_start (qemu-thread-posix.c:556)
==132362==    by 0x7EB2159: start_thread (in /usr/lib64/libpthread-2.28.so)
==132362==    by 0x9D45DD2: clone (in /usr/lib64/libc-2.28.so)

Signed-off-by: Mark Kanda <mark.kanda@oracle.com>
---
 target/i386/cpu.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index a88d6554c8..014a716c36 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -6572,6 +6572,11 @@ static void x86_cpu_unrealizefn(DeviceState *dev)
     }
 
     xcc->parent_unrealize(dev);
+
+#if defined(CONFIG_KVM) || defined(CONFIG_HVF)
+    CPUX86State *env = &cpu->env;
+    g_free(env->xsave_buf);
+#endif
 }
 
 typedef struct BitProperty {
-- 
2.27.0


