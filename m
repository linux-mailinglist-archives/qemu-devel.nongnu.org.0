Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B024E2A59
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 15:21:33 +0100 (CET)
Received: from localhost ([::1]:42016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWIua-000703-Fo
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 10:21:32 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.kanda@oracle.com>)
 id 1nWInr-0008UZ-Qm
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 10:14:36 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:17564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.kanda@oracle.com>)
 id 1nWInn-0002RS-Vq
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 10:14:34 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22LCw7O7006207; 
 Mon, 21 Mar 2022 14:14:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=PotJIymLkPD7qEHT0b0viq1CcKI6l3095/ds7wdhELQ=;
 b=KegC7auTztLGOp55q6JWKkJ+IFHtgug/70YT4pL4lg8rCZc6qaxeHMJm1REeOLDuXl5k
 g5zHi4T0wZKr/Kjq8XC/ETjnlnH8jUN1Sj+NqJO+iB5UoVloXhXSADQLEErIl9DcRN0S
 ier9XMJjvROnIyWxis7hocgfdGwb5lOj93TpOE/ud3FMH5pkxDEq2SnCsBYK3pDD6GXA
 AYXRXx1S7IZukjgKt04Qj4B4Y3SlmXEz0LAYW6iCvfVildfVky1LTlqDdvQuEFlSAPpR
 4T/UjKhgsA+4HFPFbywq+s4Gp3R/xbUuo58wUKkC7DAeyl25xOgU0V/84kCkSgaNq+iN wg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ew6ss3cya-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 21 Mar 2022 14:14:22 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 22LE5cKh051488;
 Mon, 21 Mar 2022 14:14:21 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2175.outbound.protection.outlook.com [104.47.55.175])
 by userp3020.oracle.com with ESMTP id 3exawgsea8-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 21 Mar 2022 14:14:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S+Fy/b+p+hsIShxFqRCyQ1EunWq5kpHlrqqEemTIV4nRnWvj0UqfRdV6iTyoTqrDNRpE6djZtA9t+LxW9Ul4EXFI7F3Mq590PqcFRM2FHjsUOhJG/K1O/oEgCrUALL2rIL0zRd0iIrywJ4R0zVb6ZICBds4H8JLyFFpVPfAKt9ZqlFDBKMQEjjGqxpH4exsBfnOoe6ovboUNSlHPjrw1CB9n6Aap8lT5ssreR/0Nv0+r8eVKT+qF1ob4BTgnqG0xjth05VHRXajNc196tSF2Wes/jK2w0jp6ALL+/SrDu8DvpEItPCsNFsLq21E71UEQbbHZUiogqpYHIWhCJVZWTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PotJIymLkPD7qEHT0b0viq1CcKI6l3095/ds7wdhELQ=;
 b=ZCFxOxxtGJ9g8+DI81M1FKmyB9rLyzRo59/EiXRmCcIhnjkFV4JZFzHVdhXf/G23JhiSTqqtELESpd9uwV1E2afeBwrcc0xVPHVFUTjFAHPSIsM6TmE7QnQ7/GagsiZrS4KlDizJGrwNdALCotFkHKxNDauymIEuO+c2o/FpBliaWOU2F6p901FHt43hG2dGennAFFalXKAIV6JFrF3U/NP5QCvGECIopIag5KAwSnlJmhbxl6+hAFLvBwTqGyBhMChzfdsIvWe+7SOF98fM8JgORrjAAtXiPy3hCDNR5vHbSyFl4nxGFEhiIYwSELY7oc0ampghs8AjX9ZAfNfljw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PotJIymLkPD7qEHT0b0viq1CcKI6l3095/ds7wdhELQ=;
 b=svsMGNxUSLkPQtBFOFqw9TsxAKTa9V09GlQomELQA4cY/tdS9Ode3PVBXJH+/BB65kIvrNp7dzaYFiF9bVJEYoDGfvGi4PxRKVGt1qIA+PD90bDp34SnfU4hkNCql0RfKz4LmwB5ObN6/A3qowaXzU24cOotHrpR3BVP0kaa92g=
Received: from SA1PR10MB5841.namprd10.prod.outlook.com (2603:10b6:806:22b::16)
 by BN6PR1001MB2258.namprd10.prod.outlook.com (2603:10b6:405:2f::34)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.18; Mon, 21 Mar
 2022 14:14:19 +0000
Received: from SA1PR10MB5841.namprd10.prod.outlook.com
 ([fe80::85a0:903e:852d:6c15]) by SA1PR10MB5841.namprd10.prod.outlook.com
 ([fe80::85a0:903e:852d:6c15%5]) with mapi id 15.20.5081.018; Mon, 21 Mar 2022
 14:14:19 +0000
From: Mark Kanda <mark.kanda@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 3/5] softmmu/cpus: Free cpu->halt_cond in
 generic_destroy_vcpu_thread()
Date: Mon, 21 Mar 2022 09:14:07 -0500
Message-Id: <20220321141409.3112932-4-mark.kanda@oracle.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220321141409.3112932-1-mark.kanda@oracle.com>
References: <20220321141409.3112932-1-mark.kanda@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DM6PR03CA0096.namprd03.prod.outlook.com
 (2603:10b6:5:333::29) To SA1PR10MB5841.namprd10.prod.outlook.com
 (2603:10b6:806:22b::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2deb7145-dd04-4575-83a3-08da0b4516f9
X-MS-TrafficTypeDiagnostic: BN6PR1001MB2258:EE_
X-Microsoft-Antispam-PRVS: <BN6PR1001MB22589381DB1E3C5DBECA4E10F9169@BN6PR1001MB2258.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XOccuIjpP61uYWFrLivqdehWO+BVcKA1X54g5j35JZ/4I8tbhD7U+Ao82gNCcOyMbIR5NjpuBV8oLWTvx4nyEc+YfX+hYY5vIqXQ5SEmTl8cE2DnXI7+e+QBu1iWilYvToOhIA9vPMidxsdWEmrOnTw4Kq7w4/SDzIVS9PG0niT6iDuPTp1o3VY8JUrdlSYUTLZUQrB516XtWa000UgtUsVYYe6LYCqeO0CtHUs3XlxnedPagF6DGXJab5BQE2psMf6HPJ9bci4m9+c6Hd6M5IO4F8uqZGUTLaG+Y35/xnCtvfhpYA4D7xAMnuVa8cKsqhb0f02ZSUdDfSGpJZNhYWv7zV/4LaKGzJsfmdpoGF6Npxt8qBmyf6VQsoyIZrKEXjGIaEw/upn442wNRuy3mCIDcNi5lUa/wUkisFGTHB2bHHEJK6+2UIkMM80mDTBXahIHoNPpmf9zWA3sWcx0YMPZQQVx/pBB+QVMVq3WtI+8dURkzjWS2tzjVGvsdyoS37h3QLvCEt85ZBh2idgenVnEp79Abr4J6keWwC5+2Gg/wcAal03SD7QBKhqGmpZZuS3XFVQWn6BN3BnFXrXp0sf3/hHh7MMIKyyPfGUmSkEi53b42TUdfAF0uEl48f/6nCi/ABtfNd3eTR8d5FT3yzL+JglxHKqzCtuX+sZdojVGHf3Owbjp0nQ7aS27Gqrse0ALS4gyx1aORVRaKA3NkpN0gIgQ0WwKoWYC2Z6mrAM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR10MB5841.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(107886003)(36756003)(2616005)(2906002)(6506007)(508600001)(6666004)(66476007)(316002)(186003)(66556008)(66946007)(83380400001)(6916009)(44832011)(26005)(1076003)(8676002)(4326008)(6512007)(86362001)(52116002)(6486002)(5660300002)(8936002)(38100700002)(38350700002)(41533002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XmR3YY2lmSgiT4fpwNzAVs7caXhHOJa8XPfD7ePcwjZjDZQgE3AaiCXm/Qc5?=
 =?us-ascii?Q?MZpmaO1J8RZxQpXH71d6346XUoYl2/cGA5cZCk2yl07T/Br/XnbgtcFmugsF?=
 =?us-ascii?Q?hqkt8x6sswZfLCQiYjs7ft3K+rmR7d4VIoybRwAh8AcSKqbGalNrbSfjK765?=
 =?us-ascii?Q?EmZq4XcK5JncXU44n54T+BkhohPzfAo3Tjeks+MGu9yzWOG6mHwMkrt0QOQ+?=
 =?us-ascii?Q?doMjUYX09eJpRKmsl81MkLvarNCGCTFxOvIFNLKQbykMpHB27dPY7TjHRI5j?=
 =?us-ascii?Q?7TPo7Yy1aUYKLHEHMOO7G3QcV5z2ipt5nl/j5Hls3ufR3vL301LLlVcaZuZY?=
 =?us-ascii?Q?MXUPWxzBUEXoXvea4Nc5JJCUTebFEtPGU0RgXWHu7W5dieKMgNCDgZdmXUP6?=
 =?us-ascii?Q?ULUlFtUq8Ax7BAJrWE/nGWXcROPgfndbPZTd19U48QjVm3Hzu9CkBCMclB26?=
 =?us-ascii?Q?+hsq4WwsZAay93B1iZumNNQ+UtQ8LA+kLud+gMoTfpbl08Vxcw8dXnJoYmmS?=
 =?us-ascii?Q?6EwMf7WV1u4jODLimGD2ArAICDiwxAwQ0L53os1ydyL1jZt/ZDnlqnVNqEqb?=
 =?us-ascii?Q?cGJr7OIfUbMISdCHy9MKH0eyTWIKZbp9CXJzf3ChtZGIjDTkTUuuG9DqNRQB?=
 =?us-ascii?Q?t8O7cxcObGQQ6fjzb6QLAQ8nlsIQksFUcgsaIds3g8RTUieBZbsChzM1oHh5?=
 =?us-ascii?Q?Qmn/45BS1X0F3njabVblobkWdfzlO0K71wkqaTARbUeEkd7/iOiPRPZWWGMP?=
 =?us-ascii?Q?wHFD4a//dRfNxeRl/4xyW51MX2JiclEl53UFWcweh3Ow6RokwxYFlzaiepha?=
 =?us-ascii?Q?bSK+s7g+cdfvm+22kAjH8znFOcQLlFbBi1weBuY91U7ItX141OONp6zXosEc?=
 =?us-ascii?Q?mqSmh1CQSdeQ6XVCr7tjyuNcoZsnlgrnvGAjdyDVc+Zr9Orsw2GohyxAC0Kp?=
 =?us-ascii?Q?bm81Isu7USur6p/cfY7ZYiHHBjH4pXUSpcn8yL1mKZ3qheA3F1TVfwkDbyqt?=
 =?us-ascii?Q?L9MzMmb9s8Zy+NdI/2mfphDxNg5N0NPEzYPSUz4a1rEVmYcaW2jrJQ6pand+?=
 =?us-ascii?Q?1X6GwxVJFOsjpYCse1NbXOG61zZ6pLr06fkbhE4FS/BBiM3ld7xlpanwQBFq?=
 =?us-ascii?Q?3zephH60IloeWX3gpHqOr9zMgUDUd4I2eK/hEUWCY3csAcez4VPsKr834NX2?=
 =?us-ascii?Q?XDSorhyEikWTb/R5xpI1TXRbkEtlJo+vVPkJV7+8WV4LD9LvFdGssBJuw2Nl?=
 =?us-ascii?Q?EihOzZpMyOUraMlYAaRfY+3rqwJl9MeRqZbgf3xQ1YfrXaVSAaU2JLgzXbKd?=
 =?us-ascii?Q?WXgBWa1xAhinUZlb4Ur7wmfonXc0ygFdv2TDiPMO1WvSB9z3xyGrRY44MUMS?=
 =?us-ascii?Q?VHVFwnT2PkdaBgRcwE0JyYCRu/K71K8fEwN+DRw9Hu+2/C8MEn+3TDEujdR3?=
 =?us-ascii?Q?tt4/rdZtG33HJ4LGdmiplLwdNZ6qB1ObnOIKhm6XrAMh96oUa1/Lhg=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2deb7145-dd04-4575-83a3-08da0b4516f9
X-MS-Exchange-CrossTenant-AuthSource: SA1PR10MB5841.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2022 14:14:19.4008 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5pCASNb0O+sfAQNxa47X1OeDF7ATPkfZ2P4UdCPJsDFWa0rJqpKfT401Q3M6+LlHT8hJhp93ew4AzFtxsjAigg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1001MB2258
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10292
 signatures=694221
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 phishscore=0
 mlxlogscore=999 adultscore=0 suspectscore=0 malwarescore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203210091
X-Proofpoint-ORIG-GUID: wApLM5RS8qK52IiRhuiPTkIaGFwLhqVa
X-Proofpoint-GUID: wApLM5RS8qK52IiRhuiPTkIaGFwLhqVa
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
Cc: pbonzini@redhat.com, richard.henderson@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

vCPU hotunplug related leak reported by Valgrind:

==102631== 56 bytes in 1 blocks are definitely lost in loss record 5,089 of 8,555
==102631==    at 0x4C3ADBB: calloc (vg_replace_malloc.c:1117)
==102631==    by 0x69EE4CD: g_malloc0 (in /usr/lib64/libglib-2.0.so.0.5600.4)
==102631==    by 0x924452: kvm_start_vcpu_thread (kvm-accel-ops.c:69)
==102631==    by 0x4505C2: qemu_init_vcpu (cpus.c:643)
==102631==    by 0x76B4D1: x86_cpu_realizefn (cpu.c:6520)
==102631==    by 0x9344A7: device_set_realized (qdev.c:531)
==102631==    by 0x93E329: property_set_bool (object.c:2273)
==102631==    by 0x93C2F8: object_property_set (object.c:1408)
==102631==    by 0x940796: object_property_set_qobject (qom-qobject.c:28)
==102631==    by 0x93C663: object_property_set_bool (object.c:1477)
==102631==    by 0x933D3B: qdev_realize (qdev.c:333)
==102631==    by 0x455EC4: qdev_device_add_from_qdict (qdev-monitor.c:713)

Signed-off-by: Mark Kanda <mark.kanda@oracle.com>
---
 accel/accel-common.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/accel/accel-common.c b/accel/accel-common.c
index 623df43cc3..297d4e4ef1 100644
--- a/accel/accel-common.c
+++ b/accel/accel-common.c
@@ -140,4 +140,5 @@ type_init(register_accel_types);
 void generic_destroy_vcpu_thread(CPUState *cpu)
 {
     g_free(cpu->thread);
+    g_free(cpu->halt_cond);
 }
-- 
2.27.0


