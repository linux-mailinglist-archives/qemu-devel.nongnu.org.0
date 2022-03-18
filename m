Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 645124DDD0C
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 16:34:47 +0100 (CET)
Received: from localhost ([::1]:53098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVEco-0004AS-GO
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 11:34:46 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.kanda@oracle.com>)
 id 1nVEKs-0003Uk-IQ
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 11:16:14 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:6124)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.kanda@oracle.com>)
 id 1nVEKq-0004SA-2j
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 11:16:14 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22ICdXdA017022; 
 Fri, 18 Mar 2022 15:16:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=nq+rMN4EZdbNtxnnFneKPq1ygOexbKbz9dWpq0T8m74=;
 b=gZPNibcjtDKmO0wFZX0a/6OxHxrcc4zKELnMs1Tn5eWeK5TahXtpLYweCIq4ik66tF3H
 hGJW5KFvzSgrr8G8vprHOOGdSmp7d4nve7Yubbr0JHzrbEfWGq5R+MkMEtbKFraA4vQM
 fVNXRd6LGNUiLZz2mKEAmyb1maMUIMpAiTSzxSLh4S/9WCzdZZNJ4cYDnzlROu67MJ71
 B17tfXnL3y+N+dUHV1Y6dpP61huGJHb3NMNR+1ceUcsEnaGrPt+3KetYaG1EiVGe47Kw
 UL4QbiGmk/lrxALREteuFk4vJFKeBZoy25R5aM74mgETHoeVJH1bMs5cPPfTnUxoBVOW vA== 
Received: from aserp3030.oracle.com ([141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3et5xwusvm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Mar 2022 15:16:07 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 22IFAecv171688;
 Fri, 18 Mar 2022 15:16:06 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1anam02lp2048.outbound.protection.outlook.com [104.47.57.48])
 by aserp3030.oracle.com with ESMTP id 3et64u42bg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Mar 2022 15:16:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G9JXZGeNlajnNaKfVX53SK8SS6aNYKzYXY0uaHAdVugN/rJQJK4mKlkKWuWhwOYDxtU525/yuqdO1MXyOOXZte8qWOg2p2HvKKNnZqcKAWnHQtXUgIQwpriSbpcp6e5aEp362w1a276CblelltoTz0qYAneSQ6O/SjjBzUcBCPP2xA64GUzF8XWcUhimFxjlJe2euBLkSfqid/vSxTY66t51aPkbh2varPTcjD2mIlbRNnysuWGvOD1NrNBFpyEuBa0uUN1DBd64Cgu3t9T/Zsk4KbO3K4MofwznnepLbS0/vb8Rab8P12m0Woy+drjo3qM8NG1noICK+w4PUxJKZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nq+rMN4EZdbNtxnnFneKPq1ygOexbKbz9dWpq0T8m74=;
 b=PT7Dzx8SjpiYd5bo7qZzLxiwTi9eu5SdAEsyXyE0doNjR/crd5LVwbf61pMNzem94epglOUoGpsmUGQOxjNbgGG5PUdsp4Hgpntchsz+6qAcLndQ1KQYonFJhSBQMbiqJpHvax0eOzCvb8oGNucaNj+s/JQXHTI+9taHocxQY4BCrTtakSfcrHQHceJOu8Hr+aVK3xtBFUJ9WfQqiqquasMFtuJVyvMOtt93vbk7LoU8SxmcEnTbT6BnIUCcey+Wn8RbHn/kYyllze+OoFksrSnlHkf6r3xTMBA7Txwncq6CcQDWxntTn9FihX0zGQhkAd4qczSX5JhLM3yMUsbRPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nq+rMN4EZdbNtxnnFneKPq1ygOexbKbz9dWpq0T8m74=;
 b=Vgtor91zHFqbxA/b9CevFxM6Vs1Mi3vE194OypeYCXM3fUntK74YZ2RUfFV2nW24Lxy4TOB+rIiJ5LMnRpsj/NC12uoqUkdDhHLh+RZAJtgGQhH+G5Hgw2/4IhzN9aeYpmpdEEkC4KhbMgSquQYfct1w+j5WEOGKeU87f4h6IUM=
Received: from MW5PR10MB5825.namprd10.prod.outlook.com (2603:10b6:303:19a::11)
 by MN2PR10MB4174.namprd10.prod.outlook.com (2603:10b6:208:1dd::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.14; Fri, 18 Mar
 2022 15:16:04 +0000
Received: from MW5PR10MB5825.namprd10.prod.outlook.com
 ([fe80::5915:58a8:f9b1:a71e]) by MW5PR10MB5825.namprd10.prod.outlook.com
 ([fe80::5915:58a8:f9b1:a71e%3]) with mapi id 15.20.5081.015; Fri, 18 Mar 2022
 15:16:04 +0000
From: Mark Kanda <mark.kanda@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/5] softmmu/cpus: Free cpu->thread in
 destroy_vcpu_thread_generic()
Date: Fri, 18 Mar 2022 10:15:52 -0500
Message-Id: <20220318151555.381737-3-mark.kanda@oracle.com>
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
X-MS-Office365-Filtering-Correlation-Id: 86c7bb2f-81a8-43be-78f9-08da08f23844
X-MS-TrafficTypeDiagnostic: MN2PR10MB4174:EE_
X-Microsoft-Antispam-PRVS: <MN2PR10MB4174574124DCAA75C5EEE60AF9139@MN2PR10MB4174.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: L7btBA4IcuyKFdXIFXZMqfohN2uYIjjkNe8PPn/tOK0eN6gw8IbbgIJEmwWD8KojuLf6kgdFLx31NCjrh00NK+NIb4oTk0ydPW29dtkUxfrF1D8sBNShEzrxJrP8XBcxjafLOFDgo+9D6h5OA+MfvIzsuldNWRPz+4FABnm06+bD+zQGKJr6WlT4bJuuyhPypd8K8iILlctC1tlOs0uubRQvWjJdFWBKoS8Sr0cZ2RgsXNHLrR6IXsuPad9EYpzb0aJaRro1rd0XguE2BOq5vK6KRcnOkMT/5hP5GIpn9CyFc+xN41lvXAxmqM750qLUmDxJ5NqHf5dORRNqbUOnSVCJvMkIXOBWWOIzezGTqQnebqCOWb1p9JwuweGx0tpWtnX9pXSLAde+CkwAQe1XqSSf/bzIWWfqMmsy3GvtM3kN0FNq8qaztWgKjtvBzkT0E7c6yigOs1MJJuOV+dHuBj9TEs7ix07KNJyX7yovWjMdGm9Bp0wS0nFid1xGsCAY634Pbzd4YIO3FrYN4WrQ+fjgf0WvJgiFNd4NAKCdI/SfbzBHvUFmo9l3VPGw5E6Ny00bLt+w7DWoDtmqRjPuzXxYut4L9P1UPYDGwEiMxQex5Z8BUOa3HD6D33IwEHdGuT4/qJGhOm7c4BbyyN3NwSUCOeTd21cY6SCDQ01jRJQOGBOvMlpldV9+WOF3oN4o
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW5PR10MB5825.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(52116002)(6506007)(107886003)(508600001)(36756003)(6666004)(2616005)(1076003)(6486002)(6512007)(86362001)(186003)(316002)(8936002)(2906002)(6916009)(5660300002)(44832011)(66946007)(4326008)(66556008)(66476007)(8676002)(38100700002)(83380400001)(41533002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?20fGpWnTkRPHUTT/UiNNYIONdQ3qVXAl39ywxYpvaWcC94lK6gqERPbUEXMV?=
 =?us-ascii?Q?gqYi0f1UZpMxVS5GB2+uermrrgy98YlcKEr9D38QJ/5JCflKOqa1xBekDvlp?=
 =?us-ascii?Q?YO+haz6r++t6g6e0RIgt0EiI6r3EOhODVdYBiu4NfY+CFBphkv5K7NfVhBSa?=
 =?us-ascii?Q?g4iMb19sAEmv6NTk/qJB7WpWeyNtnARGtt7qu/sxaQOW/qGFajsOzJqZVcJ3?=
 =?us-ascii?Q?ZMmbsH34EQV8HknLO7+RSk+zXbao3XHNdAYZqjfmzqdcaNES2guPqCFOgk1x?=
 =?us-ascii?Q?6WNMYW3wwkAkX8k2NGxKKYg+DU+TgKXC0H8jIolhO98JbE5KJJqpBinwzg5n?=
 =?us-ascii?Q?TsYxuigqqo//JiPUVbeScCDEoOfoKv2AWv7FtAosf4zee3fN2rjxJwj81wSG?=
 =?us-ascii?Q?/kskdO3Nao9j8Tm6WhWet0lvtBkPk1KIO2GVNmVnH5/urWGQqso2fD8Xzl25?=
 =?us-ascii?Q?SRuWXofLBLXuqw0GHeSsA6mZdL7gLLATPvB1BaNIbDzurWYSewLXIsZXqE26?=
 =?us-ascii?Q?zIULow84YOKdSDtthrQUtZzRDkJgZjsqPgCUSNpYKgcRNMIfYmg11RnVN1N6?=
 =?us-ascii?Q?Lb/+Of9dc8WSiUckbQYcEcnJ79VACzoz4KPlBBfSgRjfHcb6JmLV/dj8DLYS?=
 =?us-ascii?Q?m3hMqwm4y3NafX0WxdZoAJuZw+h+PSQQiGU6K/9ak6J2XxH9TsqTRCtIrp5r?=
 =?us-ascii?Q?YMuuQ6KAQThIKcZ0TI7b4aH79hBs4oFUKnyTc2VNxPeaQl9p8O40JPdjr7lZ?=
 =?us-ascii?Q?oL38Zgt0okxuEnkqmW4Ej4aPGgDkSDg993lmcXIYJfosW1fAVejmUt93kBjh?=
 =?us-ascii?Q?k8v9hy8FPkW2s5/k1JoS8CKX7EOITd4F6BY1GcF0INsZ4DjFdixihNw6XDf3?=
 =?us-ascii?Q?ubSIpkkQSojrxG5KuvMLo3PzaGPyxGPSKFiBsrhlOcwQwm8kFnWqbEbDSLyX?=
 =?us-ascii?Q?l+UEBcoaaOBGzEDHE5/r9ByJl5nrW9zHW9xMnkza50AwN+DiJswZ2yBNy0zf?=
 =?us-ascii?Q?2O2dzQR4rqdMDgzXJNmESBwo2fGlBuU1mPSZdkl6xH0fw816rvVhT3O5Yn66?=
 =?us-ascii?Q?uy+zFdr2Ix+r/NWjhK0iJyUpDbcYN8aEK5R6wuef5G7VlzyIOY358TRqUKve?=
 =?us-ascii?Q?GqXu8FwXzUFzpUthKNe4fYB2/0SJlXILWEvET4aKVELoNYpd2JQAjK2vvulS?=
 =?us-ascii?Q?/NYHVSSTi9VFln5GAuCyi9hXLlB7If1REYo5+SLDNNY8RRmg44yPxqMUrhQE?=
 =?us-ascii?Q?sU8WeE4308/hmccraYomBDMknVP6XH17MYHAcRvdbLFHmwGn5SSGVgSfvymV?=
 =?us-ascii?Q?xu1TDj9WJLQCgmNcAomjNUfCFFg3VlTBS7XOuO3OZyMLWDDBlbSA/av0b3fC?=
 =?us-ascii?Q?BmXr9v6uWIg8b+ql6W9gEdDcBJBjQ23LZPbDLpF9WQMVwTH0TKerdy+wwt47?=
 =?us-ascii?Q?3ciySKlsK6SXM4mu/Y+QHEKRS6gIA6TPX0hlWleEHlU/+RS4xh0dubKSw3QC?=
 =?us-ascii?Q?lCpahvIQStD9PrA=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86c7bb2f-81a8-43be-78f9-08da08f23844
X-MS-Exchange-CrossTenant-AuthSource: MW5PR10MB5825.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2022 15:16:04.6871 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cWcDOkXJA0Xe+pNyzo0mERGaKTYs4Xtf8bMLNPWtWoulmPb/zhMi44kF2X6Zol7EkSp2kUPtvRZDwdKPSsUJ7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4174
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10289
 signatures=693715
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 bulkscore=0 phishscore=0
 suspectscore=0 mlxscore=0 adultscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203180085
X-Proofpoint-GUID: lCzKEd__gK3zc8cqMXwc0zk5cFMPrb8I
X-Proofpoint-ORIG-GUID: lCzKEd__gK3zc8cqMXwc0zk5cFMPrb8I
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
Cc: pbonzini@redhat.com, richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use a new AccelOpsClass::destroy_vcpu_thread() handler
destroy_vcpu_thread_generic() to free cpu->thread.

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
index 7b8ec7e0f7..80b0d909b2 100644
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
+void destroy_vcpu_thread_generic(CPUState *cpu)
+{
+    g_free(cpu->thread);
+}
diff --git a/accel/hvf/hvf-accel-ops.c b/accel/hvf/hvf-accel-ops.c
index 54457c76c2..69c23f6763 100644
--- a/accel/hvf/hvf-accel-ops.c
+++ b/accel/hvf/hvf-accel-ops.c
@@ -467,6 +467,7 @@ static void hvf_accel_ops_class_init(ObjectClass *oc, void *data)
     AccelOpsClass *ops = ACCEL_OPS_CLASS(oc);
 
     ops->create_vcpu_thread = hvf_start_vcpu_thread;
+    ops->destroy_vcpu_thread = destroy_vcpu_thread_generic;
     ops->kick_vcpu_thread = hvf_kick_vcpu_thread;
 
     ops->synchronize_post_reset = hvf_cpu_synchronize_post_reset;
diff --git a/accel/kvm/kvm-accel-ops.c b/accel/kvm/kvm-accel-ops.c
index c4244a23c6..fd439f8e23 100644
--- a/accel/kvm/kvm-accel-ops.c
+++ b/accel/kvm/kvm-accel-ops.c
@@ -89,6 +89,7 @@ static void kvm_accel_ops_class_init(ObjectClass *oc, void *data)
     AccelOpsClass *ops = ACCEL_OPS_CLASS(oc);
 
     ops->create_vcpu_thread = kvm_start_vcpu_thread;
+    ops->destroy_vcpu_thread = destroy_vcpu_thread_generic;
     ops->cpu_thread_is_idle = kvm_vcpu_thread_is_idle;
     ops->cpus_are_resettable = kvm_cpus_are_resettable;
     ops->synchronize_post_reset = kvm_cpu_synchronize_post_reset;
diff --git a/accel/qtest/qtest.c b/accel/qtest/qtest.c
index f6056ac836..3ea148ed0e 100644
--- a/accel/qtest/qtest.c
+++ b/accel/qtest/qtest.c
@@ -51,6 +51,7 @@ static void qtest_accel_ops_class_init(ObjectClass *oc, void *data)
     AccelOpsClass *ops = ACCEL_OPS_CLASS(oc);
 
     ops->create_vcpu_thread = dummy_start_vcpu_thread;
+    ops->destroy_vcpu_thread = destroy_vcpu_thread_generic;
     ops->get_virtual_clock = qtest_get_virtual_clock;
 };
 
diff --git a/accel/tcg/tcg-accel-ops.c b/accel/tcg/tcg-accel-ops.c
index ea7dcad674..4ef80c81e4 100644
--- a/accel/tcg/tcg-accel-ops.c
+++ b/accel/tcg/tcg-accel-ops.c
@@ -94,6 +94,7 @@ void tcg_handle_interrupt(CPUState *cpu, int mask)
 
 static void tcg_accel_ops_init(AccelOpsClass *ops)
 {
+    ops->destroy_vcpu_thread = destroy_vcpu_thread_generic;
     if (qemu_tcg_mttcg_enabled()) {
         ops->create_vcpu_thread = mttcg_start_vcpu_thread;
         ops->kick_vcpu_thread = mttcg_kick_vcpu_thread;
diff --git a/accel/xen/xen-all.c b/accel/xen/xen-all.c
index 69aa7d018b..c5982a782c 100644
--- a/accel/xen/xen-all.c
+++ b/accel/xen/xen-all.c
@@ -220,6 +220,7 @@ static void xen_accel_ops_class_init(ObjectClass *oc, void *data)
     AccelOpsClass *ops = ACCEL_OPS_CLASS(oc);
 
     ops->create_vcpu_thread = dummy_start_vcpu_thread;
+    ops->destroy_vcpu_thread = destroy_vcpu_thread_generic;
 }
 
 static const TypeInfo xen_accel_ops_type = {
diff --git a/include/sysemu/accel-ops.h b/include/sysemu/accel-ops.h
index e296b27b82..46e3190119 100644
--- a/include/sysemu/accel-ops.h
+++ b/include/sysemu/accel-ops.h
@@ -46,4 +46,6 @@ struct AccelOpsClass {
     int64_t (*get_elapsed_ticks)(void);
 };
 
+/* free vcpu thread structures */
+void destroy_vcpu_thread_generic(CPUState *cpu);
 #endif /* ACCEL_OPS_H */
diff --git a/target/i386/hax/hax-accel-ops.c b/target/i386/hax/hax-accel-ops.c
index 136630e9b2..8b6715d047 100644
--- a/target/i386/hax/hax-accel-ops.c
+++ b/target/i386/hax/hax-accel-ops.c
@@ -79,6 +79,7 @@ static void hax_accel_ops_class_init(ObjectClass *oc, void *data)
     AccelOpsClass *ops = ACCEL_OPS_CLASS(oc);
 
     ops->create_vcpu_thread = hax_start_vcpu_thread;
+    ops->destroy_vcpu_thread = destroy_vcpu_thread_generic;
     ops->kick_vcpu_thread = hax_kick_vcpu_thread;
 
     ops->synchronize_post_reset = hax_cpu_synchronize_post_reset;
diff --git a/target/i386/nvmm/nvmm-accel-ops.c b/target/i386/nvmm/nvmm-accel-ops.c
index f788f75289..f08292406c 100644
--- a/target/i386/nvmm/nvmm-accel-ops.c
+++ b/target/i386/nvmm/nvmm-accel-ops.c
@@ -88,6 +88,7 @@ static void nvmm_accel_ops_class_init(ObjectClass *oc, void *data)
     AccelOpsClass *ops = ACCEL_OPS_CLASS(oc);
 
     ops->create_vcpu_thread = nvmm_start_vcpu_thread;
+    ops->destroy_vcpu_thread = destroy_vcpu_thread_generic;
     ops->kick_vcpu_thread = nvmm_kick_vcpu_thread;
 
     ops->synchronize_post_reset = nvmm_cpu_synchronize_post_reset;
diff --git a/target/i386/whpx/whpx-accel-ops.c b/target/i386/whpx/whpx-accel-ops.c
index 1d30e4e2ed..17a385324c 100644
--- a/target/i386/whpx/whpx-accel-ops.c
+++ b/target/i386/whpx/whpx-accel-ops.c
@@ -93,6 +93,7 @@ static void whpx_accel_ops_class_init(ObjectClass *oc, void *data)
     AccelOpsClass *ops = ACCEL_OPS_CLASS(oc);
 
     ops->create_vcpu_thread = whpx_start_vcpu_thread;
+    ops->destroy_vcpu_thread = destroy_vcpu_thread_generic;
     ops->kick_vcpu_thread = whpx_kick_vcpu_thread;
     ops->cpu_thread_is_idle = whpx_vcpu_thread_is_idle;
 
-- 
2.27.0


