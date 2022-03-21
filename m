Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E584E2A5B
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 15:21:34 +0100 (CET)
Received: from localhost ([::1]:42180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWIub-00076A-KK
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 10:21:33 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.kanda@oracle.com>)
 id 1nWInq-0008U3-Ba
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 10:14:36 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:15868)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.kanda@oracle.com>)
 id 1nWInn-0002RH-K5
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 10:14:33 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22LCw7O5006207; 
 Mon, 21 Mar 2022 14:14:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=UkMvu7R+yeVsyIM0RED3+6tZA4l5brwWXK5uUWdUC7Y=;
 b=FprvGfCEgu2qqMwckRCUBfy0qQe7XIvYZLyuKvwmmpRNswCQzpQSrf2Tk88UoUhd9sPD
 cPFmInKaTG/9soFxP0+37soFuw4tf4jQog98W4oYPWLYQs94vNu2cprUJwo4kjSrqjk/
 OULLIhRE2OpVshHR498FumRdm7G+Sw9DgSTKoBNzWDv/XQTjqTcTQgdaxp17q9Snfuvo
 m/mvjwdsxyiLXLg5Rd2vce/pF+tHMdoYpHKXWU3cVVpeY1fg3OYWUhvzeFv5Olr8UoK2
 DX08Ma1NYLMe0vPLvgrpJE1k4mZNNEqhzTJI0jtquO6Kb230Y7nrQUewE/BnowCf09Jh PA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ew6ss3cy6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 21 Mar 2022 14:14:22 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 22LE5cKg051488;
 Mon, 21 Mar 2022 14:14:21 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2175.outbound.protection.outlook.com [104.47.55.175])
 by userp3020.oracle.com with ESMTP id 3exawgsea8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 21 Mar 2022 14:14:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SF7CRJMSnukFvCaGI4Cg13y91/qMCNb3g413u6tzBSxnEUHjjNOGHtctC7VL2aHF5j3zOBsnDncUoDIJN6YIvLGCzaF5vj8eUoxifTGF66yLVu/vnGqHBI/jqhX+PUoQxB2la2Wg8hZ+kbCikFLmz/21O/9CT4hZiBTdNxyju2zduBvLpMifuaIQOBc/bAehmZ2OUXlyvNAUZW6A3iXDWU+WlPsw4vu4QETN7fp0tadIM7N2TCkR+zKPirZcELJvMCrN+VvB5XVuXBEjKs1t3Dk9uoF601lOgoZ9mxf0Yo1gNX4qt5neljRik3qMp4hW/aUelyj8ybwkrP7kXiSJlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UkMvu7R+yeVsyIM0RED3+6tZA4l5brwWXK5uUWdUC7Y=;
 b=K+AexoHNJidcX9tShCjJ51uPjtuA7NA0o5/py+o8ceKAO8wg2TNXN5DhQemhENXPUFrEkFau2exdS431RLJs/0R4OtCaYo0mCLBWurvUrt1zhziaqQUcIdPYowAj4kp/prWR+8EwkeboLg0s5azGqRNcrdib1u6Nr9DE3+86QX4RL94D7hMo+4KEP62K0xWdlGWDkqSdikqnt7FuK4Do4HH6tOAQNFwKjEHOCixuQXWyPOO1JhKkvIMGkhkM/mJg5KsCbHiu5yLQicxZvqmPuexwVDQhHLUuEmJt5UsUPuGbqo8iZKiUlQVletZg1lPLPQ69O7KiA4evHUOy6SB8KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UkMvu7R+yeVsyIM0RED3+6tZA4l5brwWXK5uUWdUC7Y=;
 b=Tm1LQnD+puBF6x63B/gUeCPtdOSfjJJFsymM6bM4HyNjacxS85vtMuBU/uJY8z3rkkjf8Y5DKZOtrCQI019Lua6oNi4zbfLZGOr/LQ/qyVysahxAAUsYAV2T8gwDLbThVaNaZQ6mwNGak2xG34Z/lN4JlVg1QYvk5tuzY25DaBg=
Received: from SA1PR10MB5841.namprd10.prod.outlook.com (2603:10b6:806:22b::16)
 by BN6PR1001MB2258.namprd10.prod.outlook.com (2603:10b6:405:2f::34)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.18; Mon, 21 Mar
 2022 14:14:19 +0000
Received: from SA1PR10MB5841.namprd10.prod.outlook.com
 ([fe80::85a0:903e:852d:6c15]) by SA1PR10MB5841.namprd10.prod.outlook.com
 ([fe80::85a0:903e:852d:6c15%5]) with mapi id 15.20.5081.018; Mon, 21 Mar 2022
 14:14:18 +0000
From: Mark Kanda <mark.kanda@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/5] softmmu/cpus: Free cpu->thread in
 generic_destroy_vcpu_thread()
Date: Mon, 21 Mar 2022 09:14:06 -0500
Message-Id: <20220321141409.3112932-3-mark.kanda@oracle.com>
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
X-MS-Office365-Filtering-Correlation-Id: 8865769b-88ba-458a-dca0-08da0b45168b
X-MS-TrafficTypeDiagnostic: BN6PR1001MB2258:EE_
X-Microsoft-Antispam-PRVS: <BN6PR1001MB2258B3E84B9C056F5DC06BE4F9169@BN6PR1001MB2258.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qyKVZdVX1IYd2aKzu4E1PnbwVS30e+To0kW4R9PzjEfR1zuSxYR5pOQhMtvbV0qY10PaTi8rF9G3dTWQzUq5eRbW5alS2pbjgv4YAHUFBaWzpwWol/PQy8V5EZCiYbL3Fv+otiFKvbn4aJQh4tLytd7ErmKliedzGV6RgScC1PY0zbdD9ql3seqwiTsPY/uYQKSquWb/QHQKbCATAiGdjhhSLH9uAZ7oMuN5PdP/5/alKcflyFXJklW/zwdWr1gi1n8wyOEdr1qdyGLj1GGq8qhFpa8h0FfASk1FIVbnBdLit/H6+8XmbH4Xiu+s/9y6PulkpEPrVIKJge4ameJaSflnFQtxCY8yuMJIaBoZ/1Qk5Hlmoi4gvJmXWnMO2XL4zGCGgkfxzUkC8wnPUOamq5WldMofaILgukchmtky/+KPSrsES2zHN14iSAAVW08V7LX/GLP+8C57q3WmOW4MSq2SJ1M/rtrjB4gEG45PJVL9+yzjkjaK4OFzRjbh/WJHm0TFaFCyNxR3sbN2/VzdRUNNVWjiP7hLX6He43rjFDofeoZ1nQBlOkzL6DisUXpyOK/8VYSwJd13QwNJnSkODeYyxOePyEXzf6Qzgmaj/zDRdxQk3d2od5TEYKD8Ye3Z1b7gwTMis5+u5g47tfrZfjWl1uNbpGmGFDJKUyesihgUqaN/1tI06oo4OX9M+z6iibPjVgICIUrZMqFm3gnT9mGiLSQgIqU+fp/HNooOGro=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR10MB5841.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(107886003)(36756003)(2616005)(2906002)(6506007)(508600001)(6666004)(66476007)(316002)(186003)(66556008)(66946007)(83380400001)(6916009)(44832011)(26005)(1076003)(8676002)(4326008)(6512007)(86362001)(52116002)(6486002)(5660300002)(8936002)(38100700002)(38350700002)(41533002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yE4K3pkREx/InfCrmLwcxYX2Q06W9vIhKf8qIxSHbGbOV6k9AwCN1fIC1/si?=
 =?us-ascii?Q?BsUKN6Y3JwvoJ3l8ogVceUxWn0eDhaCwH5Sy6bUj+9SRWj6HoknEYCLIhjoq?=
 =?us-ascii?Q?3H/ftYQOYyGpNST9CeMEX48vBQ/GtR+uAhTI/ZSted2wqkUAkhqkqrIfEUeL?=
 =?us-ascii?Q?ferv2ayARxjj9x3zKIzfKHFSkFPpPQp4SYc8G21NHWY1kndswHr58NHmoYdP?=
 =?us-ascii?Q?43WWlaoRJ3uRhhGPLsiZk2c60aQRPKeYrK4rNoKQoY8GB3Ntvk0lNE2rw6KS?=
 =?us-ascii?Q?BPvJRyIK8SBefMG3pi13nDBrKmlvJgleD7+2f1E9m6oGxSYCed6jjujWJOc4?=
 =?us-ascii?Q?tXIOr7EHMhlVAUTiSRAfpNwWs5EDfx/y0drOM6hZvYA0Yke7VeILVxAauXoi?=
 =?us-ascii?Q?bKsHsZHaq1Cgq6G9D9QHTqSy6aQq40Yo1Eq3YcFZ10nbaj1nwRFovJE4DHWT?=
 =?us-ascii?Q?E9aj4Qwpud6e6nx1WhY4xWH+MYrWQyrp2Ajm7sxlZSnJOkgIDmLOE8Z6DlFB?=
 =?us-ascii?Q?tdgeYBKlZWFEN0eeb2Cw6m/Ij1wU7yooJbrSNqCJoqrpUFxawaxLnSSh9fd3?=
 =?us-ascii?Q?3a2hQv8E/LIME49CiC9iixikQJ0XAUCh8vVAncVfFNtf2xvhLHjFqapNyi6s?=
 =?us-ascii?Q?uX1shCZjMvhxJVetXZdDMHCd6Ml4m3eRdbR6vICWl8JTNSGZT3Yl3JuBLIoS?=
 =?us-ascii?Q?vPaQmHVlnCtydkcuJFiTxhKyvh9c7JvrgPTwfOe4Mt8FOQUPRoVLr6r+7QeQ?=
 =?us-ascii?Q?K0xgsbaeLMcGIkEQTwIzfDyb08JZKBF+J9ox2tX/LEXjDy9wwueVQm+pfQbU?=
 =?us-ascii?Q?CFbLRtqnAHxxHOBuk0cO7By5OtWOJUzFk3JZU/XGf8AyszTB6LhOS6ViOvzU?=
 =?us-ascii?Q?T8rjRSJGH262kbn/g/Ur220Nv25dsfH/aS/gXR5v5sAXfG+6onxUi8vjqaoF?=
 =?us-ascii?Q?OsqM8lxshG1b7OolAfn/HGkTUfaSVoRcCgAjKMcUtL4dfCq1XO433ZDCTUXX?=
 =?us-ascii?Q?lwfbix0L2lGqJP4SIuiiFumHLAWGTe12aIgmS+zMYvhIiBhS4MyCrYGtxMy1?=
 =?us-ascii?Q?6qXq/VmT6a0pWVVR3YhRVNQ3uGytscwGq5O1TSdwBvhnhhMVBcN0VKh8w0BL?=
 =?us-ascii?Q?buGIejg8ts/mdK3GS/pih2n9RfDMGd2MpPTlJtPTWaIMwrInWzU2KiIH0Noh?=
 =?us-ascii?Q?vB5Ydpbr+SwKsPtKaNCvVxMujae0QHUM9neQdb22/mSjwre+Yo4MK2dx+u8F?=
 =?us-ascii?Q?PVYkNhvQxbLqC6QgAxEATB12OVNj8Vc8EzbOWDjMn6EZDAHAG0j1kKz4Ukqh?=
 =?us-ascii?Q?6KPd3DXHMZ7RUWhC9I8QPMrv8fB4NWwX8pp//4mp1rOubmwRtR46XqJokeOY?=
 =?us-ascii?Q?8F7h4gBxnzFmbDo6waW4maYTzn/jsVjw0GMqGq71I/bNNRRvLY0OLszA4p4B?=
 =?us-ascii?Q?OUgWITLSOMxL5dqadJJ57vbe/E5IIkYgumwH79HCDarSeUBRBJ8tFA=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8865769b-88ba-458a-dca0-08da0b45168b
X-MS-Exchange-CrossTenant-AuthSource: SA1PR10MB5841.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2022 14:14:18.6353 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g7MHpKOLzZm7KE4ymZ8I6Tdq8qSTcUVOcRPLuPf/+mDiIHt4HNlaY3Ae/vVs50+gz6siEwy0yR8wWUtBDnXhQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1001MB2258
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10292
 signatures=694221
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 phishscore=0
 mlxlogscore=999 adultscore=0 suspectscore=0 malwarescore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203210091
X-Proofpoint-ORIG-GUID: LW37XsPijQ5mt7V8eyrjd1b0TLa6GccT
X-Proofpoint-GUID: LW37XsPijQ5mt7V8eyrjd1b0TLa6GccT
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

Free cpu->thread in a new AccelOpsClass::destroy_vcpu_thread() handler
generic_destroy_vcpu_thread().

vCPU hotunplug related leak reported by Valgrind:

==102631== 8 bytes in 1 blocks are definitely lost in loss record 1,037 of 8,555
==102631==    at 0x4C3ADBB: calloc (vg_replace_malloc.c:1117)
==102631==    by 0x69EE4CD: g_malloc0 (in /usr/lib64/libglib-2.0.so.0.5600.4)
==102631==    by 0x92443A: kvm_start_vcpu_thread (kvm-accel-ops.c:68)
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
 accel/accel-common.c              | 6 ++++++
 accel/hvf/hvf-accel-ops.c         | 1 +
 accel/kvm/kvm-accel-ops.c         | 1 +
 accel/qtest/qtest.c               | 1 +
 accel/tcg/tcg-accel-ops.c         | 1 +
 accel/xen/xen-all.c               | 1 +
 include/sysemu/accel-ops.h        | 2 ++
 target/i386/hax/hax-accel-ops.c   | 1 +
 target/i386/nvmm/nvmm-accel-ops.c | 1 +
 target/i386/whpx/whpx-accel-ops.c | 1 +
 10 files changed, 16 insertions(+)

diff --git a/accel/accel-common.c b/accel/accel-common.c
index 7b8ec7e0f7..623df43cc3 100644
--- a/accel/accel-common.c
+++ b/accel/accel-common.c
@@ -28,6 +28,7 @@
 
 #include "cpu.h"
 #include "hw/core/accel-cpu.h"
+#include "sysemu/accel-ops.h"
 
 #ifndef CONFIG_USER_ONLY
 #include "accel-softmmu.h"
@@ -135,3 +136,8 @@ static void register_accel_types(void)
 }
 
 type_init(register_accel_types);
+
+void generic_destroy_vcpu_thread(CPUState *cpu)
+{
+    g_free(cpu->thread);
+}
diff --git a/accel/hvf/hvf-accel-ops.c b/accel/hvf/hvf-accel-ops.c
index 54457c76c2..b23a67881c 100644
--- a/accel/hvf/hvf-accel-ops.c
+++ b/accel/hvf/hvf-accel-ops.c
@@ -467,6 +467,7 @@ static void hvf_accel_ops_class_init(ObjectClass *oc, void *data)
     AccelOpsClass *ops = ACCEL_OPS_CLASS(oc);
 
     ops->create_vcpu_thread = hvf_start_vcpu_thread;
+    ops->destroy_vcpu_thread = generic_destroy_vcpu_thread;
     ops->kick_vcpu_thread = hvf_kick_vcpu_thread;
 
     ops->synchronize_post_reset = hvf_cpu_synchronize_post_reset;
diff --git a/accel/kvm/kvm-accel-ops.c b/accel/kvm/kvm-accel-ops.c
index c4244a23c6..5a7a9ae79c 100644
--- a/accel/kvm/kvm-accel-ops.c
+++ b/accel/kvm/kvm-accel-ops.c
@@ -89,6 +89,7 @@ static void kvm_accel_ops_class_init(ObjectClass *oc, void *data)
     AccelOpsClass *ops = ACCEL_OPS_CLASS(oc);
 
     ops->create_vcpu_thread = kvm_start_vcpu_thread;
+    ops->destroy_vcpu_thread = generic_destroy_vcpu_thread;
     ops->cpu_thread_is_idle = kvm_vcpu_thread_is_idle;
     ops->cpus_are_resettable = kvm_cpus_are_resettable;
     ops->synchronize_post_reset = kvm_cpu_synchronize_post_reset;
diff --git a/accel/qtest/qtest.c b/accel/qtest/qtest.c
index f6056ac836..ba8573fc2c 100644
--- a/accel/qtest/qtest.c
+++ b/accel/qtest/qtest.c
@@ -51,6 +51,7 @@ static void qtest_accel_ops_class_init(ObjectClass *oc, void *data)
     AccelOpsClass *ops = ACCEL_OPS_CLASS(oc);
 
     ops->create_vcpu_thread = dummy_start_vcpu_thread;
+    ops->destroy_vcpu_thread = generic_destroy_vcpu_thread;
     ops->get_virtual_clock = qtest_get_virtual_clock;
 };
 
diff --git a/accel/tcg/tcg-accel-ops.c b/accel/tcg/tcg-accel-ops.c
index ea7dcad674..527592c4d7 100644
--- a/accel/tcg/tcg-accel-ops.c
+++ b/accel/tcg/tcg-accel-ops.c
@@ -94,6 +94,7 @@ void tcg_handle_interrupt(CPUState *cpu, int mask)
 
 static void tcg_accel_ops_init(AccelOpsClass *ops)
 {
+    ops->destroy_vcpu_thread = generic_destroy_vcpu_thread;
     if (qemu_tcg_mttcg_enabled()) {
         ops->create_vcpu_thread = mttcg_start_vcpu_thread;
         ops->kick_vcpu_thread = mttcg_kick_vcpu_thread;
diff --git a/accel/xen/xen-all.c b/accel/xen/xen-all.c
index 69aa7d018b..0efda554cc 100644
--- a/accel/xen/xen-all.c
+++ b/accel/xen/xen-all.c
@@ -220,6 +220,7 @@ static void xen_accel_ops_class_init(ObjectClass *oc, void *data)
     AccelOpsClass *ops = ACCEL_OPS_CLASS(oc);
 
     ops->create_vcpu_thread = dummy_start_vcpu_thread;
+    ops->destroy_vcpu_thread = generic_destroy_vcpu_thread;
 }
 
 static const TypeInfo xen_accel_ops_type = {
diff --git a/include/sysemu/accel-ops.h b/include/sysemu/accel-ops.h
index e296b27b82..fac7d6b34e 100644
--- a/include/sysemu/accel-ops.h
+++ b/include/sysemu/accel-ops.h
@@ -46,4 +46,6 @@ struct AccelOpsClass {
     int64_t (*get_elapsed_ticks)(void);
 };
 
+/* free vcpu thread structures */
+void generic_destroy_vcpu_thread(CPUState *cpu);
 #endif /* ACCEL_OPS_H */
diff --git a/target/i386/hax/hax-accel-ops.c b/target/i386/hax/hax-accel-ops.c
index 136630e9b2..b6ef246cbb 100644
--- a/target/i386/hax/hax-accel-ops.c
+++ b/target/i386/hax/hax-accel-ops.c
@@ -79,6 +79,7 @@ static void hax_accel_ops_class_init(ObjectClass *oc, void *data)
     AccelOpsClass *ops = ACCEL_OPS_CLASS(oc);
 
     ops->create_vcpu_thread = hax_start_vcpu_thread;
+    ops->destroy_vcpu_thread = generic_destroy_vcpu_thread;
     ops->kick_vcpu_thread = hax_kick_vcpu_thread;
 
     ops->synchronize_post_reset = hax_cpu_synchronize_post_reset;
diff --git a/target/i386/nvmm/nvmm-accel-ops.c b/target/i386/nvmm/nvmm-accel-ops.c
index f788f75289..ff9033127a 100644
--- a/target/i386/nvmm/nvmm-accel-ops.c
+++ b/target/i386/nvmm/nvmm-accel-ops.c
@@ -88,6 +88,7 @@ static void nvmm_accel_ops_class_init(ObjectClass *oc, void *data)
     AccelOpsClass *ops = ACCEL_OPS_CLASS(oc);
 
     ops->create_vcpu_thread = nvmm_start_vcpu_thread;
+    ops->destroy_vcpu_thread = generic_destroy_vcpu_thread;
     ops->kick_vcpu_thread = nvmm_kick_vcpu_thread;
 
     ops->synchronize_post_reset = nvmm_cpu_synchronize_post_reset;
diff --git a/target/i386/whpx/whpx-accel-ops.c b/target/i386/whpx/whpx-accel-ops.c
index 1d30e4e2ed..f4ec6b3518 100644
--- a/target/i386/whpx/whpx-accel-ops.c
+++ b/target/i386/whpx/whpx-accel-ops.c
@@ -93,6 +93,7 @@ static void whpx_accel_ops_class_init(ObjectClass *oc, void *data)
     AccelOpsClass *ops = ACCEL_OPS_CLASS(oc);
 
     ops->create_vcpu_thread = whpx_start_vcpu_thread;
+    ops->destroy_vcpu_thread = generic_destroy_vcpu_thread;
     ops->kick_vcpu_thread = whpx_kick_vcpu_thread;
     ops->cpu_thread_is_idle = whpx_vcpu_thread_is_idle;
 
-- 
2.27.0


