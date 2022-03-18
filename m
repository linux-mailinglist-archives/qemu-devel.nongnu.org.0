Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED65D4DDCA1
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 16:17:41 +0100 (CET)
Received: from localhost ([::1]:34634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVEMH-0005jQ-0B
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 11:17:41 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.kanda@oracle.com>)
 id 1nVEKr-0003Oi-DL
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 11:16:13 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:6924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.kanda@oracle.com>)
 id 1nVEKo-0004SE-Bz
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 11:16:12 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22ICdMud009939; 
 Fri, 18 Mar 2022 15:16:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=9DhsHghyJz5PWbnPL8tSW6XFGo1rSiSnNXPNDoifFHI=;
 b=YyPYB40yAkKOkw2LHvldi/xPlNYvGVoUWyxF52TmyDRafJcLqrD/rU53MiY6fhkMDaCE
 E30VPg1Ky9n5RcAkdJ5oVYFpI9bHxqHucCRmnWZT4TAl1St2lW4Nfyjg4ZXwpyLDeOz1
 w1LKYdO5cek85WacJvJdTnC/hFeuXl3KiyZhVKh9pegZ3NwFiRvXTS4TnJcAby2NSMkP
 9qLBNsKXMqzG9BDP7JX1eo9Gv9rlMzpFxO3VFQSa+3CmVjHdoGc8rTBn1zjW1QoYXGb3
 FbvDnnjNkkrhwNj2scCHSHh9HtNTIGPeOfb4Rh4u0+Fgmsw7f/7EZYuqI6vqVIQvVbNY sQ== 
Received: from aserp3030.oracle.com ([141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3et52q452v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Mar 2022 15:16:07 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 22IFAecw171688;
 Fri, 18 Mar 2022 15:16:06 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1anam02lp2048.outbound.protection.outlook.com [104.47.57.48])
 by aserp3030.oracle.com with ESMTP id 3et64u42bg-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Mar 2022 15:16:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JPPQklTiabhvFxs+PuYOxuyEvu1/vHAWqV/AfGxbctMceHL8lrP6l1LIPG6e8jjI5pIBvKRvIZNIlh03BlfVn3rKJCw5sR9WXtkcyNXJgMUp4ru3yaiKeW4ylmnvs7tpPfXYyd420Y/usdpE18AKHqP4FgSfzwZNXdHepLzMlVcmukiNK6W0QfjLNjDU8+lHEnwfAF3z8nzwscrQwcc1HEtitsx0VMfM1hyDeDGH9P4Wh1+9IyaoDznxUFiz0jwuGedfGc6jPGc5PzC9oEXzsvOUBwTI5byQ+6znmGEQ8YNJbUbszJuniQsiBtRuRD3JVx70Rv25BH8JN+ubvThiEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9DhsHghyJz5PWbnPL8tSW6XFGo1rSiSnNXPNDoifFHI=;
 b=AgqLFEuZox5Z7x6vQ62skt8lJgj/DuGii6ovt+SkGyuKCY34F67czxhjjlQGbdDAcj7gPzXlXLqR/om8UqaOKNakT7SUv2A5uFWWYvkLZFR5T78KAztblQhDtCkSDROVbgC/47PiekiekTJi0qvPcXF1JJpmGvWTG0TtzweHG81EuHfD8eC6CvXJiT63ZzWVbR1Vxe/kX2y4sNxVTRmT6qw7sgH23ZMtj9bpHEnGKoA2iSzDEKeCK0Vnms+PlRAU75ewePS7aQjoQmgr06mUvIq7f/Gd7fa/pKWmO3ROv5YyW/HQ2QakFtHqvU3J/SLIJRXzTKDSkosc5p8xlByrmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9DhsHghyJz5PWbnPL8tSW6XFGo1rSiSnNXPNDoifFHI=;
 b=p4CV2ipEnbEMrYJkJbybcASxAI1+XWLTsvmwkswhOIbjuEAPAoJosPWweDquT1LeV228LK4rpiQb+LAq+3GkN5Qu3t1SxYxoB1NEKdM7xSdRjuJnA2FhOiggt3R3H3scJvsCp8Ma2UhBGSYlAd7lyN659R6hCPf20unHck37xjg=
Received: from MW5PR10MB5825.namprd10.prod.outlook.com (2603:10b6:303:19a::11)
 by MN2PR10MB4174.namprd10.prod.outlook.com (2603:10b6:208:1dd::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.14; Fri, 18 Mar
 2022 15:16:05 +0000
Received: from MW5PR10MB5825.namprd10.prod.outlook.com
 ([fe80::5915:58a8:f9b1:a71e]) by MW5PR10MB5825.namprd10.prod.outlook.com
 ([fe80::5915:58a8:f9b1:a71e%3]) with mapi id 15.20.5081.015; Fri, 18 Mar 2022
 15:16:05 +0000
From: Mark Kanda <mark.kanda@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/5] softmmu/cpus: Free cpu->halt_cond in
 destroy_vcpu_thread_generic()
Date: Fri, 18 Mar 2022 10:15:53 -0500
Message-Id: <20220318151555.381737-4-mark.kanda@oracle.com>
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
X-MS-Office365-Filtering-Correlation-Id: 7462ccd4-7522-44f5-6061-08da08f238c4
X-MS-TrafficTypeDiagnostic: MN2PR10MB4174:EE_
X-Microsoft-Antispam-PRVS: <MN2PR10MB4174EC5481D9A2EC2F33FEE0F9139@MN2PR10MB4174.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OaQ+OGaRHBfUWTfr0J1L48QTJWMH3YKrSCOW/Il1VXfReoYPeMA7HW7DdEgfAr0/+4eNVtKF8WXH5nSpl+83aD2SBNhusi7bOuwX8VNLpUDNTj+sp7OCCSVIlXlyPspxUcElUK8GDOPwucW2FfB99wRQJnmqIZmzQ8iTMJcbRx7lsxME/RsGNIu7qmdOomIF8kfHoM0IuhVOwE1hQZDfHB4g5R9B21GDPGZjNe7bx0hXiwirYJQesNEiQUwL0zH8wPF2NVlwZiirSsGOCJUZXs+ABUK69j3amyOREZrqrM8mwlNqwLfeV2ogSVi1rV+eLccMgUMNVfTf7NCL6KdocMYMZrsVDoMb4cbmZpiUBVsGFuf+E9zov77jkzJVdEHbuVzQG7QtFtQ6KY/oSFO8YNj6xP+1gefdUzbFJNowIbF6vpjG0Cs63PjKTQe4nrXY+jGwTZd18gOz/GSOVu3Rpe385l858KvZrL6E6YheSJGC7CuCcw42k8dwut/tP2UuZ+0C4hV0LwUitpHddQ8IQHi/v79y0Nu6wFXVT/PQnUg+I2OCwrYI0H7iwjXiCfGPZXrktXrSR8MAY8lbZ1P8+ueyUugLkxjhZE+sK/UzoV03DSkSmvBwF0lWdKVul7Ybbu75lvayDDfvZlYaAkwoiWMtb7o9awOrSs+HqPqOsY29ZWj4hAQ9Th/htUOfX5fZLITn2oL6jHGgbaek35y8gw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW5PR10MB5825.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(52116002)(6506007)(107886003)(508600001)(36756003)(6666004)(2616005)(1076003)(6486002)(6512007)(86362001)(186003)(316002)(8936002)(2906002)(6916009)(5660300002)(44832011)(66946007)(4326008)(66556008)(66476007)(8676002)(38100700002)(83380400001)(41533002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wbBGA7CQ+7+qjCozeRkmviQiB7n4uhuCytNgT5S0FVO520RRRpKFp/Ki1rCG?=
 =?us-ascii?Q?iNjFpkpwz475RhaTO5soJVLDV2bX4nnNzXh6EssRuj6VQVnWAybgb1DhywOE?=
 =?us-ascii?Q?92hfe/OjBeaphJGm/ffohoyhtELVtylR8VYn3QrE66GMoCpPjnrbvLhY2h5k?=
 =?us-ascii?Q?LCzjhrxdmq9pvv+B2jdcU6eNT/5pIl06tKk7rmvjGPbblyT2GKwVdGs2+z6Z?=
 =?us-ascii?Q?JrFIBGlwppa7uuMTwddD/prxROprcYw9Un8Ac7/4FO94F4HoECN2mU1+pF6j?=
 =?us-ascii?Q?hZMMsrwdowD32lc1+UmwnnoudgWpjtnilQ/n6JdW1DhNr1f2S/NxnBDxbVQl?=
 =?us-ascii?Q?PnEYSOgJMrSwvlFtU8negrU8f5+U2Hjqc0cUjrEqYofFD4NpzefHV6PXIYIN?=
 =?us-ascii?Q?ARakacFuaG8kpzam3FrO9aPOef3CbT70tEtecKm3lx03O71qMMrxSIquGz93?=
 =?us-ascii?Q?Z4csbhcYl7SLMohLXMnNktS6///P85mWXJ3kd6F+1ZzvWdPoFlqGVMU8Ahgo?=
 =?us-ascii?Q?rILAHsTBP1Of1MOg0r8cOTcMYSu9ATma+t9ovv7CvX7uHE1XcVnWMumcwF0b?=
 =?us-ascii?Q?X7/l5K6bKsz4N3m+P4db5J9qa1CRdyArJBfu3SBDbzbEOnCQof9dXWHDqrZh?=
 =?us-ascii?Q?BXxdl2zL/q9rACU37E6HlphBzJQydLTfm9ykytRkOWrrXahlFXt71G17k05r?=
 =?us-ascii?Q?VgpyVlkgeRtLHUA0rIk7+Zf+9CIY+DxJ9UsgFtguDXqPQHS7+jzxJzohZkV/?=
 =?us-ascii?Q?NlCX2fqWQc3jGgXn2t6GZmngDKTUFVuKiEN4qIbyrGy14JsA58sXTGm9Fmi6?=
 =?us-ascii?Q?qPbQS3AeH9/mfyKd4zEybgF42tAbsIDCAtY1hWCIV09AUiCvsnfaOd0hrtfU?=
 =?us-ascii?Q?smQDfbwm4C1StfAm4PwjUBAuQkMlX2r9tfKeGB5Ex6HAwl9KNYk64dmQ94k+?=
 =?us-ascii?Q?G/8l4073PXD1W+cR43LSbufDkH/esdULQZirxAA4BvvYvpKl41537stJtZmV?=
 =?us-ascii?Q?K4eCbcy+DHS/2SvsFcyoANvHOAiBPW0/f+4v0tv+EveR3ccp0hZBM2/GTQuw?=
 =?us-ascii?Q?Qj/PHmAF1VOMpmYIzK2TagZnTGqtz3c4+pSj6eK/uCVOVSmtQSffAAsttUAh?=
 =?us-ascii?Q?0xdD80/JvOu3JbWBmXvkP3oAzZl1LbzysI2VKbGyS6hkK3vI5I09dPdaL34/?=
 =?us-ascii?Q?nwhZcy3xNKFAO2ebJ7YwcInsXld32+RVp0oTWXjcHVAkdrJw719NulQZPuRH?=
 =?us-ascii?Q?Q/dE0QN3Wmt4ifwcF06AkxDz6lfc6w6sY9EO+QaF+vUyUsIePzrNzh5fH20a?=
 =?us-ascii?Q?bz4x/h5Iz+CMMwCpcaZTHjRv3UwN9g0iWgj3zy0SFHdoE3GxHLAGKBOe6LHA?=
 =?us-ascii?Q?8CQ4RA8+38dR05gE4ECVcrerj1Kh7vmDWu7lw0dqF9jQCEWQmJ9vLIzj7BV2?=
 =?us-ascii?Q?Szr56eLUsfZClu4cGe0kV9i8IdKLCTjodW9FgRDZWhhg7zyoPG/KIq/MWf9L?=
 =?us-ascii?Q?AaHXL2LAm5alxP0=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7462ccd4-7522-44f5-6061-08da08f238c4
X-MS-Exchange-CrossTenant-AuthSource: MW5PR10MB5825.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2022 15:16:05.5254 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pIpQh+8Bpy1L6jdW5Hwjmis0s2rFDgkpZ2ebKhuEyTNKJr480kGX3sTUuCbJw3clR0TxvrwMNEvQWC1Gp4VJrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4174
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10289
 signatures=693715
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 bulkscore=0 phishscore=0
 suspectscore=0 mlxscore=0 adultscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203180085
X-Proofpoint-GUID: TMJ2q2j91M4RYgMzlEvYq2bVv6Sy6C_3
X-Proofpoint-ORIG-GUID: TMJ2q2j91M4RYgMzlEvYq2bVv6Sy6C_3
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
index 80b0d909b2..ae71a27799 100644
--- a/accel/accel-common.c
+++ b/accel/accel-common.c
@@ -140,4 +140,5 @@ type_init(register_accel_types);
 void destroy_vcpu_thread_generic(CPUState *cpu)
 {
     g_free(cpu->thread);
+    g_free(cpu->halt_cond);
 }
-- 
2.27.0


