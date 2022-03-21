Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8207F4E2A5C
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 15:24:06 +0100 (CET)
Received: from localhost ([::1]:48540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWIx3-00031E-1l
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 10:24:05 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.kanda@oracle.com>)
 id 1nWInr-0008Ub-PZ
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 10:14:36 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:14542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.kanda@oracle.com>)
 id 1nWIno-0002R5-69
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 10:14:34 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22LCw9ls022265; 
 Mon, 21 Mar 2022 14:14:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=NwW9/0J08o9mptHOQqQPH2TfCYDcpXPmu8kOGWqy9e4=;
 b=wC2/oHdHXxc7B+PSy6djnEY93/BaBCeyvIxd/s+hXFxa/jMLkxvJTNke3IOIE98sTKoy
 wzYI5lwFS4eVVk+GpdQGE6nCJEyLL04Y9O5fzjB5a+2SqOuDg2V0lJXU1OgrCWY7xhdm
 EDXRFY1/3ohNNo3k+7asW6iScOu9il2R02nat/KynJAFronZrlaIBVkXVD+G5Ao0G7em
 Q/dA8p4e3Rp6skXoTjrLLfiPfnEmmC7Mlx/Wu5o8zxTEav3ccVrkyijXKp/yohhPZLp9
 awsbaVrw6vhyk3NERjfoGF5jn29uPvaDQ/5K5dmF7iLKlU4ZPp7nZYjIOio8D3TdRtAT yg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ew5kckd20-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 21 Mar 2022 14:14:26 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 22LE5cKk051488;
 Mon, 21 Mar 2022 14:14:22 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2175.outbound.protection.outlook.com [104.47.55.175])
 by userp3020.oracle.com with ESMTP id 3exawgsea8-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 21 Mar 2022 14:14:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OW3CLBvCDaAlTCBwmX+9CK5GEzhIdFUayTbkvruTWtqx1dNNsq9/1ZaYvh3jbr0v3SP2eZGmHFpxP3gVYo2bN7ySOgBeFUtmLPng71Mj/QtMHAECwocpdZLb8KDQr1CCH2qWMaYOhdXhskmEPJzIJ32cazzZZPob102YZFW9wwV5UefV6PiHLw8x7IwDe//6XmEXMo7crlsPAv8kLM6n6Kfj3Ne1/vBc4tCrM83hUzPAP9njJfn6n9Swt/5lu8JQSK2R7D7+ZMXyQpI0h8tDWO5TyZi/h8Wsesj1k6a/FASogjYhOjiFiMvODoI2dJPhHKML0NfFDgRAbqu/PMFU5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NwW9/0J08o9mptHOQqQPH2TfCYDcpXPmu8kOGWqy9e4=;
 b=HhsHxR8qGkHb1XNcjijON+D8oeKrbYEDX0GuabBPxLbsAj8GlI9D9+/IKbpcNBUFPyiN9vzoJE4H7r7O6ugs3IsrulUPCwjPUHTewyZRl4zchSq0BO7balsuMPwVzVYTz1TPTL0qhYK5ccgo4Utzn34B1SX7/SoctcoQS6vCIzoQHkRkuLmYUPdZubK9qaZyHSipvLSfFavA6ew0ePB2zyTGIZZdN+FSKS+9c0+TQcPMbyBu6HwDiF+QdzW1ajKphzAW05ldY47f1S2Gg2jol125l3bDRpRyg+OT816bts315vKETSnoBCtIhv2WSNRipN1O10mS9tndK5KUzPn+Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NwW9/0J08o9mptHOQqQPH2TfCYDcpXPmu8kOGWqy9e4=;
 b=jq6iIOAXru3BSgkDvmsd0xJmyIoaxNsbbiVplcMdTOaYwYReMIoC1XzW/r4WDK9ScJJarmKb83mpG+TIR6noy5WRnvLYEsFmVSXzzPqpu3/9+5G7caodNB9iQUDSg8VZWsk+oZ0K80OhVsA9nu8iPXEYhgfPqKoGgqfrPfsuzOU=
Received: from SA1PR10MB5841.namprd10.prod.outlook.com (2603:10b6:806:22b::16)
 by BN6PR1001MB2258.namprd10.prod.outlook.com (2603:10b6:405:2f::34)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.18; Mon, 21 Mar
 2022 14:14:20 +0000
Received: from SA1PR10MB5841.namprd10.prod.outlook.com
 ([fe80::85a0:903e:852d:6c15]) by SA1PR10MB5841.namprd10.prod.outlook.com
 ([fe80::85a0:903e:852d:6c15%5]) with mapi id 15.20.5081.018; Mon, 21 Mar 2022
 14:14:20 +0000
From: Mark Kanda <mark.kanda@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 5/5] i386/cpu: Free env->xsave_buf in KVM and HVF
 destory_vcpu_thread routines
Date: Mon, 21 Mar 2022 09:14:09 -0500
Message-Id: <20220321141409.3112932-6-mark.kanda@oracle.com>
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
X-MS-Office365-Filtering-Correlation-Id: b5c1df8a-9f47-4c3d-835a-08da0b4517d6
X-MS-TrafficTypeDiagnostic: BN6PR1001MB2258:EE_
X-Microsoft-Antispam-PRVS: <BN6PR1001MB22589F609662E2588B8AC919F9169@BN6PR1001MB2258.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VELyGiVYV7Pm3apq80ac3/0I2ML7nyRc+7nLyQp/uP1X+f6QcH/Xg+4KCsUG46Rr2rAM15zs40MKQLNYJXIpFh7vALc8dHOQlpDf2VEsu3hVWoYSCvn8nk//KhrBrDh3u6by5La75GWUypjEsuHZye5jjB97XbhGMRB/en+dsj873Pv3tjIpRmZWP945byjAN6Sz+xsMdXLMvIjZmGB7J5Y7lQHFjNa/M+tj13vtJKBBGU7GN3/bFX+qyTcuXdczcKr/5DkoDJuaEol+cPk9iz1Q3Y7AYKrN86lNEBeD+VV0I5oZyj+mUD01Q4EgcuwQgkAg0VbT9UsiW3hQe8OKVW5G0n0hzNeaRnNX/0ebPsEU+7PT1WgPqQ+VHl7rydlwz1HNvD1APcOsXJPeH0aMzW/1kuAVXwcWYt6P4LNOdSyynxHVedLR5Y2IJBNJ802TiAceFO0oTUm2WCaNw6hXzvFXoCwOZ3Dr4zA/UVhrR3rbI5iIPnOaRA9CsYLxthdoDVLdfj2OL3MJWmJlxpTcT3GoB9v/XPUNj+rP07IjDESZJw+68+lFWhVLlplCmHrf6p+rkkQf8OtL9+OvYFbWx9FQNLORRCd2NjMwokiogk1uqEO55ksRFHGeogns+GMnVyCRSwHfYn7Tbk7mRwIDjnId8vYdSciHVMB5FpAhHlKQUfwtU7Lepsi+vmBG/6aISZfLKe4qh8yHY3wiIHcDvw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR10MB5841.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(107886003)(36756003)(2616005)(2906002)(6506007)(508600001)(6666004)(66476007)(316002)(186003)(66556008)(66946007)(83380400001)(6916009)(44832011)(26005)(1076003)(8676002)(4326008)(6512007)(86362001)(52116002)(6486002)(5660300002)(8936002)(38100700002)(38350700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fFq69HD6l+Gv5k6yQs15r9tBelwPPu7Ik+BlEXDvEVC0qLi4dbyDNBC2UR7A?=
 =?us-ascii?Q?D2LeoK0QYKgqZJA3ePaIgFGip5RUGGiPx5s8XHRvriUDqbUch/bU5R2CDDmi?=
 =?us-ascii?Q?DLh9tb90MoG+0HPPvw4dEqX9bGTz2K/Wp6DXImX2YtvaLXF7zm5sMujPyNAH?=
 =?us-ascii?Q?qCGAVtnzB5V5ltPH4OonCO9wEII4wmFHxw4tffPOdL9TmLjK++6dA8rrqYY9?=
 =?us-ascii?Q?FqzmKejfKBNsG42E+X7CKthkCvns6CvlHj44tTiqDy7CCBYkgDdL94leu2V0?=
 =?us-ascii?Q?WeNbOa8qQ+0Q0u+eqYLWkfp469d16TislAfo67FdGxCP2UQEYREQoTzcymo5?=
 =?us-ascii?Q?KSUQEq5eN65/GAKGNNCT7MouffPiyFUE9qRU7YlnNfF3ourKAXVSa8mPbZFh?=
 =?us-ascii?Q?zN+i2b/P9k6FkS8t+oT2cWP9LV+qPgONRZTpwmopQ0NcrStOoptZvwKcS0Ug?=
 =?us-ascii?Q?8uQaQEcJPCzXaEbaPiVRv23LnCx3s2niS4UG9gaAQmMei433Zs+3ZSYpbIBT?=
 =?us-ascii?Q?4O7sF0dE+ugv0NTdFNwfD6j0rXbL+FYaUE+VSrupq1LUwARgw1yDi6nZNySr?=
 =?us-ascii?Q?H7fQvkj0GtXcarwv7HAcnYNDTlrxyOLyxQeacdISTt8KuWwmXQa2WnMI5i+9?=
 =?us-ascii?Q?kUZZhhOwD3oE0tPL8k5Vi4I1NJnXPNXZLIiKSFvxS6Ep990dk+ZWQFoUr5Cp?=
 =?us-ascii?Q?zFrqD5nqWPunLF9vt13Awq35p4HLyXUSYIKwG4TQRctSStJqu/voivAiaGus?=
 =?us-ascii?Q?lpC5mm0TUVUXZVfArWNgHkk220R+0zm0SfLCr5Ng99aLGRb5u5r6AirisLP1?=
 =?us-ascii?Q?ARP3t72ImVGAl9SHVARxY4D4+NQuDBEJNp9RRrsWMIfA/ud93OeeBPymBRsB?=
 =?us-ascii?Q?/WpDGCZi9t2wZwBzsBqP//v2IJlPKgvUsYGG3kqQbBSuPmzhABM1ISNdf3cV?=
 =?us-ascii?Q?0oMSMkwiOghARdMF1Uq/2vRTpbXyhRMHdpGq4dZGqavc6nQXJaSFhIFQMiVJ?=
 =?us-ascii?Q?u7GUp61r8AkCyJgqn6CR8iYsFhqPC86YSRfJQqVii67GQ1t4STbc2Ne0wm4f?=
 =?us-ascii?Q?m+8xngAbbzpT4BP34QY4mnbZbbak0TARlrQPwBf9kp4Ry4n3+5XjyIZgscWB?=
 =?us-ascii?Q?UckN365RO1SiEafhiwQj0jG8j9JkBMArgI7uoNve1VtBiNPkcy5UMGrmdFlk?=
 =?us-ascii?Q?FUHZz6xeYiMR4l2wFXHp+OdWL/651UqyMUnFpFOsyUAejhf2/PXRTjEDmTvt?=
 =?us-ascii?Q?Eo2w29cJPHLv5e1bH+HJcbYuLphDZFxPnBLZDUwFwg7EMkjdZKAdwxkvNNj0?=
 =?us-ascii?Q?TgKvCo72HWyY/03Jn96TUWqzDO9RSqn3VKGjNnpZ4d45B4OHA50cPLo7BVxy?=
 =?us-ascii?Q?ivR+dZdHgC+GGe7g1t77yWxclPrnE1sEC4Q1scR6mcJWeMrXrfMLSHRdqAAX?=
 =?us-ascii?Q?+XvpLgKiVRdmowpOvr1uQ2BxA4E15aUxeqS4NcU2MHnGWzpDYe0OMg=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5c1df8a-9f47-4c3d-835a-08da0b4517d6
X-MS-Exchange-CrossTenant-AuthSource: SA1PR10MB5841.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2022 14:14:20.8023 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DgatYsBHUGkbPlm/JvRqAyj1tLI5UDv2DfR7G2jXrWGPkJhijyZKX+u6DEk5xbsDo6bmHHXUdyROYK9lTBwa7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1001MB2258
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10292
 signatures=694221
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 phishscore=0
 mlxlogscore=999 adultscore=0 suspectscore=0 malwarescore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203210091
X-Proofpoint-GUID: _iPvyKmIyBySkXlAUtIZhfjOdEHER6sP
X-Proofpoint-ORIG-GUID: _iPvyKmIyBySkXlAUtIZhfjOdEHER6sP
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

Create KVM and HVF specific destory_vcpu_thread() routines to free
env->xsave_buf.

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
 accel/hvf/hvf-accel-ops.c | 11 ++++++++++-
 accel/kvm/kvm-accel-ops.c | 11 ++++++++++-
 2 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/accel/hvf/hvf-accel-ops.c b/accel/hvf/hvf-accel-ops.c
index b23a67881c..bc53890352 100644
--- a/accel/hvf/hvf-accel-ops.c
+++ b/accel/hvf/hvf-accel-ops.c
@@ -462,12 +462,21 @@ static void hvf_start_vcpu_thread(CPUState *cpu)
                        cpu, QEMU_THREAD_JOINABLE);
 }
 
+static void hvf_destroy_vcpu_thread(CPUState *cpu)
+{
+    X86CPU *x86_cpu = X86_CPU(cpu);
+    CPUX86State *env = &x86_cpu->env;
+
+    g_free(env->xsave_buf);
+    generic_destroy_vcpu_thread(cpu);
+}
+
 static void hvf_accel_ops_class_init(ObjectClass *oc, void *data)
 {
     AccelOpsClass *ops = ACCEL_OPS_CLASS(oc);
 
     ops->create_vcpu_thread = hvf_start_vcpu_thread;
-    ops->destroy_vcpu_thread = generic_destroy_vcpu_thread;
+    ops->destroy_vcpu_thread = hvf_destroy_vcpu_thread;
     ops->kick_vcpu_thread = hvf_kick_vcpu_thread;
 
     ops->synchronize_post_reset = hvf_cpu_synchronize_post_reset;
diff --git a/accel/kvm/kvm-accel-ops.c b/accel/kvm/kvm-accel-ops.c
index 5a7a9ae79c..0345a30139 100644
--- a/accel/kvm/kvm-accel-ops.c
+++ b/accel/kvm/kvm-accel-ops.c
@@ -74,6 +74,15 @@ static void kvm_start_vcpu_thread(CPUState *cpu)
                        cpu, QEMU_THREAD_JOINABLE);
 }
 
+static void kvm_destroy_vcpu_thread(CPUState *cpu)
+{
+    X86CPU *x86_cpu = X86_CPU(cpu);
+    CPUX86State *env = &x86_cpu->env;
+
+    g_free(env->xsave_buf);
+    generic_destroy_vcpu_thread(cpu);
+}
+
 static bool kvm_vcpu_thread_is_idle(CPUState *cpu)
 {
     return !kvm_halt_in_kernel();
@@ -89,7 +98,7 @@ static void kvm_accel_ops_class_init(ObjectClass *oc, void *data)
     AccelOpsClass *ops = ACCEL_OPS_CLASS(oc);
 
     ops->create_vcpu_thread = kvm_start_vcpu_thread;
-    ops->destroy_vcpu_thread = generic_destroy_vcpu_thread;
+    ops->destroy_vcpu_thread = kvm_destroy_vcpu_thread;
     ops->cpu_thread_is_idle = kvm_vcpu_thread_is_idle;
     ops->cpus_are_resettable = kvm_cpus_are_resettable;
     ops->synchronize_post_reset = kvm_cpu_synchronize_post_reset;
-- 
2.27.0


