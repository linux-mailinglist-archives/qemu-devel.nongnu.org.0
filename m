Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D9449CC64
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 15:33:24 +0100 (CET)
Received: from localhost ([::1]:35832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCjMR-0008EK-77
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 09:33:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.kanda@oracle.com>)
 id 1nCjJD-0005pr-TA
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 09:30:03 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:45102)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.kanda@oracle.com>)
 id 1nCjJB-0000bP-GN
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 09:30:03 -0500
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20Q9eW8F007704; 
 Wed, 26 Jan 2022 14:30:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=rdEs78cHpq0NFFY3esYwSt0ZEk3NL9gCE82MQcmt/wE=;
 b=johLRi9QZcS/75ACrI6ZMTARmC+dSwv2PFBMVVGrBdYjNQGrwGhGHRPifBV5Yq77PWD9
 GhX7rZzGiFKfN7aGIhGbu55nYZe7CePlRfiAqBI1Y5077obMWUkjsecnsj8hqAmsXWd2
 7JzmTgBCzV9MNlscvWegWtHeqIAekShG9nY+K7k5haJjS+0ifUugQq48RV4fBSl/4H/u
 LUSob+biQn9bNEmWwP2GSUOHxua0HvoGgWRFEbP8wipHXv/hHGXtWtxjVYIeuh/yUwDs
 EGab+NEKF5N7ZYqKoWwi/d6OSEyLzB61Say5dWHPiBgn8D4cIICe9NVSkvfJnd71hCKQ tg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dsy9s650b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Jan 2022 14:29:59 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20QEQoxL181401;
 Wed, 26 Jan 2022 14:29:57 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2177.outbound.protection.outlook.com [104.47.58.177])
 by aserp3020.oracle.com with ESMTP id 3dtax8fy4y-5
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Jan 2022 14:29:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GpYOE2S2hRQOf5fpHb8S6O3vLwN428JDIfGaH2oEjrrUswcUJYZPQU3DRb9Vfa1XHHgjqi6c/RqwvLP0UmCCOGYB26rGZB7ffY4SnW6NKQCU/KXsfPAY6tMn3OIIf265cP1/orN0mjWRrI6GubvhHwQIh72dNhiyxpEgd19cPQiJ3SbWPlL+U3U/z6BnSr8nSGjmpFXzfq1ZpeVuEAZ+NcEcHsZnYjU1BcercjKz2zYAIy9/3UxL5zf+j9oqOhryhxVkMPU6SX9FhtaZXLEMHQ9mPSg05hAg3lTfWh3bJjT7nezCSUi5TZnvjg5MFLnq4yrUnjMw4dcf3NSK7aR5Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rdEs78cHpq0NFFY3esYwSt0ZEk3NL9gCE82MQcmt/wE=;
 b=NgufNZqn5WRzMyCfzrA/eGStZ7aZLvH+BVgafEa7ehW7s2pVAZlZmnJvqGS8MEsgKW1O+nw8j4x78wl+t5a08Ca5yKIyYVBhdz6bXnMiUKpLJlYGgWSLYwypKetARjGZRsacFr/V7GtitNQJLu9p9+KwlS2ZuHxFDWXSgQnXFty+85n44sbNm6NjMhHk2jfsT/brAmWavXCvb2WKghzCAvBkVpQtBCvI+Tervyy9V3UFcGYcKv4w8nb4MZeHnXe/F5AeVFDQOOYBIPEJQocYDB0id/5+Yf2ZJbNVu8OYyU8Pq5I7nRO0aFkv7+wXKJ1QdSFIm4GBWNB4XQxX+rYeng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rdEs78cHpq0NFFY3esYwSt0ZEk3NL9gCE82MQcmt/wE=;
 b=0I5LeeK07/fvBo7onmKYQcRQUvha3sQg/btyRfMlpmSeJJrdHNuiWXWsFwLvJn8u9NoSch8RqxusFDEw5QlGeu28zQLhOWQsyMuiOiwy9QNHZ1q/CRdFmXzAkM/iHZzVeWbDK2vrXgG8t7gZU4h6QTM8dIwIPX8fZpfTfH4C9yk=
Received: from SA1PR10MB5841.namprd10.prod.outlook.com (2603:10b6:806:22b::16)
 by CH2PR10MB3990.namprd10.prod.outlook.com (2603:10b6:610:11::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Wed, 26 Jan
 2022 14:29:56 +0000
Received: from SA1PR10MB5841.namprd10.prod.outlook.com
 ([fe80::2511:c3af:9db2:6ba0]) by SA1PR10MB5841.namprd10.prod.outlook.com
 ([fe80::2511:c3af:9db2:6ba0%7]) with mapi id 15.20.4888.013; Wed, 26 Jan 2022
 14:29:56 +0000
From: Mark Kanda <mark.kanda@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/4] i386/cpu: Free env->xsave_buf in x86_cpu_unrealizefn()
Date: Wed, 26 Jan 2022 08:29:46 -0600
Message-Id: <20220126142946.667782-5-mark.kanda@oracle.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220126142946.667782-1-mark.kanda@oracle.com>
References: <20220126142946.667782-1-mark.kanda@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN4PR0501CA0019.namprd05.prod.outlook.com
 (2603:10b6:803:40::32) To SA1PR10MB5841.namprd10.prod.outlook.com
 (2603:10b6:806:22b::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0fb155ff-eb34-4d75-bb9f-08d9e0d852a4
X-MS-TrafficTypeDiagnostic: CH2PR10MB3990:EE_
X-Microsoft-Antispam-PRVS: <CH2PR10MB3990BC1C31AB77BC296521F6F9209@CH2PR10MB3990.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:635;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GAfQEsu+SkYPNotUYyrQgbAh42V4eX1oVgv9EtggYrTdwIk9h034KFWv5+Mr5RRq68SuCiX+MzFV6+HnshBbZYIy85olKuP42m4gCE+RQlWbcXFPAeC2XxhxAmZJfrs30yAP38KX6Ym9qO2KSbl1mm22D3x8IJEYRNOmsvuQEJfEMTENNypljObe+x+qDEaOkQAXxYujh5ToAekLm3HXUAY92qGQggD/Bo2teIRC/EM1IhXGhiirqmVdzdoFtidZ9KnIaAdoOHWe1WBtnWVOU4O+unQS63ZcvHA4NZA6HLrfwOSyEAy5FQ/SgIGkMpnOv/+BdxjnV/leAzA6vcF5O34oe/Z2BOHlRDRKF4EvIoXXPYpvMj2Q5zKvJ9lzdtKxSl9NKoiyO8NiFecJsWtLm/jeTZ0nfNui1Iym60YGUuZ6mYavunanAwUB546bcN0eeKcdKSvxSSR2tpl7CVQDGr0EQ6n3XSq/0F+otFMmj/JV/zdOady9hddR3q52GrF398B3LVZhKJsfLY8Xuah31fSZ0m7u52BrcabdsqwsDHCQPcc6a8DRsjh49SfTG32qjHGMNe6ruqOnFtBtoNNxrITWA6tDsPjf2X7GwgG1vrty8873P+yoV+z7DC8dJUeMxe0dZcBUxoyuNC6UlaXZDuo9pwfM2cPjw9FP17+YtzD0ba2/fXyNiSA3aRNX2NlZPsyfI9xhCJLQHH0PBTWFXQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR10MB5841.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(508600001)(83380400001)(36756003)(26005)(6486002)(316002)(66476007)(1076003)(186003)(66556008)(6916009)(66946007)(2616005)(107886003)(86362001)(6666004)(6512007)(6506007)(44832011)(52116002)(4326008)(8676002)(5660300002)(38100700002)(38350700002)(8936002)(2906002)(20210929001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BvSxuVChKjUZJa1OMv2u65W5mSpzYdNSQRPYpJzglDPVPJ4CMB7nLfMlkwHt?=
 =?us-ascii?Q?3WFyY7uCXbweD0lvrckZ6pb94jkAkB28J2X1GEqCXIayEnMYLPWW9wDma9yo?=
 =?us-ascii?Q?qPnmEGJ9VdMUOg2KZsM/s0zJ4yFZRJpu0imYZRnr5pC0VK800K92FmssW7aT?=
 =?us-ascii?Q?TZBbF5jkl9sR6YZ305yanZv8yiy3RnhijKjYMwnX2goRqIL+jExjI+lOfDfG?=
 =?us-ascii?Q?69ikOUuqhfzGOcVPir22g7oT+sy9/Lhn2fheDV4WSyzeTQXvQCrxhsHjKOpA?=
 =?us-ascii?Q?qptFrdvYBZ22bNHoUv0n8LL9Z3jjZH63MaKxqNHGQ3xsOsS874C22TBK08x1?=
 =?us-ascii?Q?wFvFXbcYkaRoAD2OqVEsd82Vlxdrm9syatcseUyil1Wl9idXEdY47OKJTcj2?=
 =?us-ascii?Q?GxhmtBZsD9zdo9vaLCUh9tCxuu3AIX+GFoE464patKqE5EVksA94s1XImLHb?=
 =?us-ascii?Q?ndolJu1nDNVyVkPn/FlaEpl1XQ9oT2XZObLBMK5wE/xSvugZBHgl4fW44FkR?=
 =?us-ascii?Q?bZlD7bCXijBpOui5YqNyQ4CFem3Rh2zSLtkRR9C/5SzDh19697IlR6XFhbw4?=
 =?us-ascii?Q?g6vM/pUmElyQoElQZQC9FGDJR/cNnwQJXM0w/b30pdBLWSjiPRcWDHJKoqpI?=
 =?us-ascii?Q?hZmageVKS/5XaEPt1oihXe+jZWm4h3nGdreqkHRBsyW9Zu6GT4YMoP2yV0My?=
 =?us-ascii?Q?wn2VsOfFSqOXN/ebOeewpmh12geZ1eOCZ5hTZgk9u1gNyZJXn2ynx+eM954T?=
 =?us-ascii?Q?XaPLMHEBKeYKYaE2iSD0IlWGPwmrqKOzwx1pWRHgGC0orerzQbpLIaMMYtkQ?=
 =?us-ascii?Q?VVhrt+vq0BWLWwckNgcZExmkKUWQudOrE3vY9tAlf5OJI4IIlflasfxkrUW5?=
 =?us-ascii?Q?xWTJSTbea0D3b3z3jlLOGfZ0GC5G8lMQmaOXOhG01deXE9oIYoZlO1mBIHDI?=
 =?us-ascii?Q?SzHrb8HXmhXDvk/XNWur8JfQABiJErOqLWg2YT/uvUB8kaSuigrheDngYU9G?=
 =?us-ascii?Q?bhvx396gD/q6UxYgaBSIlGidlJealdneyor/LZea3gtccEkVZoht1igjwRdU?=
 =?us-ascii?Q?U+z5U+bihMFmWdK6CHfGGUlC8BWTmxGebV21mmMDTN7lkDYAw7gjackrnaHY?=
 =?us-ascii?Q?t9grsHzxSeFSaMaL2UyQb4k0r+tsMvtBLacAZDHQfpMwcqj03vm7zacNBnaq?=
 =?us-ascii?Q?xYfR+LQsejB3sE8gGoDzjGlhkTbgBDx1zysj8kjaGhe+D0mqh3fPtyI0aFU3?=
 =?us-ascii?Q?9HdzYWUgkYWsrhHFqYzaBWYJZGn3Pv6JysVzaIBT9cqq7HtmSzk2R5bW9k8C?=
 =?us-ascii?Q?m3GrTwBVIfZBSzSd22KpdD0KDk931XFYFIRF26CO+ZtXRLPUO9ahwjg04fOP?=
 =?us-ascii?Q?CjCHgv3IaC/h9cnidQwnU1kCWyZOOsIHzAtmlHYcqqCDHd2uEniovplrL7GG?=
 =?us-ascii?Q?GPubomkpXmPoKVKpBtUKUM/A3NV1tVRAVPYEtUNWrKWAa8jIF80wHqYdqeMM?=
 =?us-ascii?Q?/svuobmhAZU/BOUnDNlgrmJEXwzqKX+iE5s/suOd2DEMz/avGycKJqJwYofm?=
 =?us-ascii?Q?d60MpdcNBuQ9yD50lf1UL9tgsMvDpzfMiedSd2zC0UZxTsVnthceW8GAkkM/?=
 =?us-ascii?Q?xAd3M//3YBp2+QuGLK1hNLE=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fb155ff-eb34-4d75-bb9f-08d9e0d852a4
X-MS-Exchange-CrossTenant-AuthSource: SA1PR10MB5841.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2022 14:29:55.4971 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: grw6tsN7ItWVwngg2yB9CJ4LwdMU7Bm5hJyDFf9H9F9D1e2XJElzzeJv0XWBNNH5+7cP+Ho30rF8sce6+LrGPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB3990
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10238
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 bulkscore=0 mlxscore=0
 phishscore=0 suspectscore=0 spamscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2201260088
X-Proofpoint-GUID: WLwF07B8jSUcjJLeEil4VeTf5o-FPQs1
X-Proofpoint-ORIG-GUID: WLwF07B8jSUcjJLeEil4VeTf5o-FPQs1
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=mark.kanda@oracle.com; helo=mx0b-00069f02.pphosted.com
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
Cc: pbonzini@redhat.com, richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

vCPU hotunplug related leak reported by Valgrind:

==377357== 4,096 bytes in 1 blocks are definitely lost in loss record 8,354 of 8,471
==377357==    at 0x4C3B15F: memalign (vg_replace_malloc.c:1265)
==377357==    by 0x4C3B288: posix_memalign (vg_replace_malloc.c:1429)
==377357==    by 0xAA4773: qemu_try_memalign (oslib-posix.c:222)
==377357==    by 0xAA47E5: qemu_memalign (oslib-posix.c:238)
==377357==    by 0x6C403D: kvm_arch_init_vcpu (kvm.c:1986)
==377357==    by 0x8AEB01: kvm_init_vcpu (kvm-all.c:516)
==377357==    by 0x8B59EA: kvm_vcpu_thread_fn (kvm-accel-ops.c:40)
==377357==    by 0xAA72F0: qemu_thread_start (qemu-thread-posix.c:556)
==377357==    by 0x8EE8159: start_thread (in /usr/lib64/libpthread-2.28.so)
==377357==    by 0x91FCDD2: clone (in /usr/lib64/libc-2.28.so)

Signed-off-by: Mark Kanda <mark.kanda@oracle.com>
---
 target/i386/cpu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index aa9e636800..33405d245d 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -6487,6 +6487,7 @@ static void x86_cpu_unrealizefn(DeviceState *dev)
 {
     X86CPU *cpu = X86_CPU(dev);
     X86CPUClass *xcc = X86_CPU_GET_CLASS(dev);
+    CPUX86State *env = &cpu->env;
 
 #ifndef CONFIG_USER_ONLY
     cpu_remove_sync(CPU(dev));
@@ -6499,6 +6500,7 @@ static void x86_cpu_unrealizefn(DeviceState *dev)
     }
 
     xcc->parent_unrealize(dev);
+    g_free(env->xsave_buf);
 }
 
 typedef struct BitProperty {
-- 
2.27.0


