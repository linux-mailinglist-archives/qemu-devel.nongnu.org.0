Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D514E4E2A4E
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 15:17:23 +0100 (CET)
Received: from localhost ([::1]:35662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWIqY-0002Ow-Mc
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 10:17:22 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.kanda@oracle.com>)
 id 1nWInr-0008Ua-Pz
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 10:14:36 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:17292)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.kanda@oracle.com>)
 id 1nWIno-0002RQ-78
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 10:14:34 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22LCwAFQ010833; 
 Mon, 21 Mar 2022 14:14:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=BBXfA7q7lQksCSxnsxqRR7C7Fy4/CuFBSBN4efH+JcY=;
 b=UedfjF4aQGKcdQXKtls9ouvqnb+cotyiAassl1XOKNAZVKDbD9Mi/ynewDmal2iGq1u/
 DtDWnuRhwXFZ62kQUXVGOz7uKoUVM9of64RZa7IHPYL/DcVq42EUbY30tl7jxv0PWpAC
 +ywaqLo3L0zVn25QkKwDZZ1R5mws1qkZAJRLGSlo/S9wxmNkHDclAVXL/hGjFPClfwGy
 xz4YrHlkDUyYNj2lGyKD7FkNrRdsVeeFZbVs6+e/uxIpGkmaooLzjuywolV2qrDJ5E4u
 dcR+xRcuXXXfhB6ZiLcyKz2lf4TUdXcSdjbfz9MBzyzEzfOXoo7rkl+DKKYt33PjMaKs Cg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ew5y1uecx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 21 Mar 2022 14:14:23 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 22LE5cKi051488;
 Mon, 21 Mar 2022 14:14:22 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2175.outbound.protection.outlook.com [104.47.55.175])
 by userp3020.oracle.com with ESMTP id 3exawgsea8-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 21 Mar 2022 14:14:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N9gmx5D/aBNt6R7zTugFNobTDnpYuD3CyrDgBwqP/AF184OcWw5p9bGz6bEtsy85MgyjSO1Vc+4l/b4jyw12JvUB3/cgmGCrg2gl19vZ3i1jvrHCUZ+u8TIOdaBuyeDbcXStIUKxVd8bDXQouc9gfuTGxh7htdkhKIN9O2rtZTTY01rRLEOEl0IHxzkijbJdDGmRKA5WMnr2CeTsNak5svAGJN7W7yDGZ03sOYn+uzoP35OyZpT+APSZ3Pcanwa+bcL+AO0XV8TyuM/p+qMnrZTfSVAdYjI+0aQfvfdsJkMISUMXJiPvgcX4isVmX6c48rSSydahpEbmhnNwO0fXYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BBXfA7q7lQksCSxnsxqRR7C7Fy4/CuFBSBN4efH+JcY=;
 b=I+Iwkqq6hhTyjugIVxgyTyaFdtGzf8kImE967r1J3F6zXR8BAPCtF9KdFFuXuZML5v9qcvrkP5tM66R6DDY9KqxIrHe6dhBzBaE4cx6aKZLE1xWU6Na6EcWLwMb7t4hLOwzp/KBGnvKb4X/Jus5qua5FZZFOj1iesdXFkD0MwCpyrWFQVPSD+I/HXxFG2OZEOG4VAlXqGS5xBXnFctJZpQYQilltklmIADtlCyYTqQrYKX9ahZBVKpJo+RXc/DnXbgjtzzH38qjjDYYZ+vY41RX/LcOfARsoqU2wDRJSy9kpciBdpm3Fgy9FqXGP1hzztfCGuRv81iyEEmR65WG+cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BBXfA7q7lQksCSxnsxqRR7C7Fy4/CuFBSBN4efH+JcY=;
 b=eA0x1Ziy3fIgmI9oR/xedulQ1bdtztbAOW0oKwEyOxu6VB75PXeuAX/IFNa1kTjgT4hm4pl4Kbtyan8HfWU91RQDzE+LnU9XGWWF6EYcysixc8YXEYYQdtGWapbkLSSsvDa7hugXQqmGn4eU7MN6VX/ekxQB/5szxoPHwTMFuMI=
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
Subject: [PATCH v3 4/5] cpu: Free cpu->cpu_ases in cpu_address_space_destroy()
Date: Mon, 21 Mar 2022 09:14:08 -0500
Message-Id: <20220321141409.3112932-5-mark.kanda@oracle.com>
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
X-MS-Office365-Filtering-Correlation-Id: be5581ed-02c4-4750-3d41-08da0b451769
X-MS-TrafficTypeDiagnostic: BN6PR1001MB2258:EE_
X-Microsoft-Antispam-PRVS: <BN6PR1001MB225898D981FA1CD1A85F3B32F9169@BN6PR1001MB2258.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: soghq5xHlQakWzVYxO5mQK2RSJV7lX8Uiq90VF7FiA60/jsZi1xHOo9ytRMhFSB9HmK7ki2063yb65p28EbUOhOsH4H6YOSMzr68vzQYnHawRNPE38GOCd9u5qa578PgXDHJhkem5L7Sp3dhrKuVew6j1d+ECPRbPLRtn4SNCkeX0rsAyAaE2bcJEo2e/68GC1Xdzxzp/9IuATxKYeaJHklmCi7iJJ/t5YHNn50/cIKp2KydmdT3o7uDwo7Njwlvu0qkg6zt4EwOE49pr3PrXtMzOx0HBczOqcKZpT+r1fSTzeVHtONQeSKYFUPOEAniNMjEOd18ivTWemChDmvTFMEIi6xV9HBP6Fg/0lMuRw17komZmfPw5JGv/G0SsCOuINFZPyxfZPKfTM1k50ewu32J7n4a5AaXDtpT6DX0apdNEPfRcGiy/dmOziXfM0C3i8iJvQZqr6dqOFcUBZgvzXSU5c6G3s1fjeW+G+VUOqnt5meBP3eTWldpbSmXFM2QD8AmmkkPX4Mkm8VtcM/qDegGzbtq60OJYyC9ye3B+G2IeMMv0y1MZhCcppUvH2+0iR7zjmcs124DqxhN+dUaHSjDF8IuzVOGf+pj+ExS1PBzUe/zUDvDLomvn39/5n7yEPXtgZDj+hGyTPDvqQyQ6jfcZMVhGu885B5k+LjglNG7QB0rYnniXqlu8KbX+h8HPEq7vMRnKyRshs0hDMt+Zg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR10MB5841.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(107886003)(36756003)(2616005)(2906002)(6506007)(508600001)(6666004)(66476007)(316002)(186003)(66556008)(66946007)(83380400001)(6916009)(44832011)(26005)(1076003)(8676002)(4326008)(6512007)(86362001)(52116002)(6486002)(5660300002)(8936002)(38100700002)(38350700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rj2+rpirgzJ9NS9qND/SwiTMEsOPhM5QlP1+DwfqUBDwqxK5gZpPqqGFGged?=
 =?us-ascii?Q?Rlms5L85RyRxkO/1Le9d3HkbukLJp52OAyQpxLb5IL/+FYcx7GDxr+HB7g7c?=
 =?us-ascii?Q?b7wVclcwI2gg+q4zpipdzgu4HVjBsB73llNEo0i/vj0y6KxLUBVsUfMy/F1t?=
 =?us-ascii?Q?C+qVKo3MQLTHsmIu15dwfe9EWZ+UJ/spvnjJJarnY9eg1c3jc4NQfssb9Mm6?=
 =?us-ascii?Q?40smEhA7yr1vT2SHRhmQADuh0uBI22nU/GpATbEBmT3eHJhkP/oYC8ParQts?=
 =?us-ascii?Q?zYxyIMwoQ0cxWDlsMWfJ88nAkMXxY7k9638WbjcAFip91DeqysqZv3FDa7pf?=
 =?us-ascii?Q?7zKxsGBTdbOP4l1EUZN09ejEdSXxEdPMo5eQAMAy/prhU2WJDpRx3U7Dm6PL?=
 =?us-ascii?Q?w4+DV6BkJGnRhEtAmuRVnuCHIQpFJIZgGE8SKYq2zJiVGzUgfMrvu7Nq3Ef8?=
 =?us-ascii?Q?a/2KULBsgI5DgG+ATARScLwbXm4Bh/iZk7OkfdSCU1t4hicgGDUWGKQBZhd/?=
 =?us-ascii?Q?GbkGTqnWHYKRRVQj+mzQVCrEdaI3BK2G9F38OVDDXvLW+vfdU9vmIq1qgUxl?=
 =?us-ascii?Q?H3Lln5JXjeb7eYMIwVr+kpC5u/SJ1LUIcNXEL0ZjAZWJfj7QK65xGy4JXlAh?=
 =?us-ascii?Q?NDoldQZ6IXLo1tLkUgVCYs3jhBgFq55Zed2Aig1lL8Xh0zbaIqZs87qNgb5R?=
 =?us-ascii?Q?qWHPfcDzwLlca5mKRsfYkq8xl9F/0c0bmSMaNajAzWbHXul+Tbr+TuTxyrCF?=
 =?us-ascii?Q?MLEc5UWwOTaHrClUmYVGSFPh+qLPH8OqsD+zzQMamiFfHHSkBDHXpXCSExa/?=
 =?us-ascii?Q?uNNPxTxVyOYiELYjVWESIIwKvJSOf5NJIG0FNxNLhWEsVCIX1/ddYrvDQUlB?=
 =?us-ascii?Q?czExrtjPX/5IO9ZnV3EtW3dzYwM1be5waP8vhKToV/k8MQB5yu5UOHnPuFz+?=
 =?us-ascii?Q?WaZ5oKuRFXgu6eZXoGgjeCfNFxllrNSHgDWBfe1nbxNK8DIzoTEH8mK6/9dN?=
 =?us-ascii?Q?hm7Zmy7/nLWPkmeoZuV0GZo8EYtqDIbAcUDn/yuWxnq84kLmf7dlmRzM/hwI?=
 =?us-ascii?Q?gXSm6oTPrbUD2swxs8aYlqeqMNJSRYs3RFa1pssIV0LxxSAw6cQSDwuRvoD/?=
 =?us-ascii?Q?1gvNXgiGQ1CIRP4jn+joYxHx4bl0VEfZG/oN5xV27YFyMe6/224yX2rMjrQu?=
 =?us-ascii?Q?rfjC2uarry01Cq6HsSXRYe0hDn0vUCnB5WNNnRA+DQaQ2VGKfOfPXznJNYGY?=
 =?us-ascii?Q?B6ZDvx+seqAtZvUIQ/ZcP/T0A9AfzyP6NycT7J/hfaJdq+/8inkyqX9tL7Cn?=
 =?us-ascii?Q?altXjhzjeSD0+gecxDJ6G34EpzZ9aaizJK6MHZMrMcI4e8xTTsb+G9o7kpCI?=
 =?us-ascii?Q?Ldl5BC+e545WUv4/1qjiUZokHZRwNguX5GRtO0g1nf1sDonYCUQz3u5+HySd?=
 =?us-ascii?Q?WDqdqokYPcZPhV1CHGFBBUr+QyGkPddvdUDzDf1wgnNUO2VJ/Rjl4w=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be5581ed-02c4-4750-3d41-08da0b451769
X-MS-Exchange-CrossTenant-AuthSource: SA1PR10MB5841.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2022 14:14:20.0861 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mnWOLvpafOIGJ+IVtllBFhXdOjps4HIc3cFXw9BlOlN4AzhZqtQkfen7Tts78KBxLGrmM7miRbKMGTOMSo6hJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1001MB2258
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10292
 signatures=694221
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 phishscore=0
 mlxlogscore=999 adultscore=0 suspectscore=0 malwarescore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203210091
X-Proofpoint-GUID: sR7ywv6AJnTNVBBNJ5C8po8O4Hag23qq
X-Proofpoint-ORIG-GUID: sR7ywv6AJnTNVBBNJ5C8po8O4Hag23qq
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

Create cpu_address_space_destroy() to free a CPU's cpu_ases list.

vCPU hotunplug related leak reported by Valgrind:

==132362== 216 bytes in 1 blocks are definitely lost in loss record 7,119 of 8,549
==132362==    at 0x4C3ADBB: calloc (vg_replace_malloc.c:1117)
==132362==    by 0x69EE4CD: g_malloc0 (in /usr/lib64/libglib-2.0.so.0.5600.4)
==132362==    by 0x7E34AF: cpu_address_space_init (physmem.c:751)
==132362==    by 0x45053E: qemu_init_vcpu (cpus.c:635)
==132362==    by 0x76B4A7: x86_cpu_realizefn (cpu.c:6520)
==132362==    by 0x9343ED: device_set_realized (qdev.c:531)
==132362==    by 0x93E26F: property_set_bool (object.c:2273)
==132362==    by 0x93C23E: object_property_set (object.c:1408)
==132362==    by 0x9406DC: object_property_set_qobject (qom-qobject.c:28)
==132362==    by 0x93C5A9: object_property_set_bool (object.c:1477)
==132362==    by 0x933C81: qdev_realize (qdev.c:333)
==132362==    by 0x455E9A: qdev_device_add_from_qdict (qdev-monitor.c:713)

Signed-off-by: Mark Kanda <mark.kanda@oracle.com>
---
 cpu.c                     | 1 +
 include/exec/cpu-common.h | 7 +++++++
 softmmu/physmem.c         | 5 +++++
 3 files changed, 13 insertions(+)

diff --git a/cpu.c b/cpu.c
index be1f8b074c..59352a1487 100644
--- a/cpu.c
+++ b/cpu.c
@@ -174,6 +174,7 @@ void cpu_exec_unrealizefn(CPUState *cpu)
         tcg_exec_unrealizefn(cpu);
     }
 
+    cpu_address_space_destroy(cpu);
     cpu_list_remove(cpu);
 }
 
diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
index 50a7d2912e..b17ad61ae4 100644
--- a/include/exec/cpu-common.h
+++ b/include/exec/cpu-common.h
@@ -111,6 +111,13 @@ size_t qemu_ram_pagesize_largest(void);
  */
 void cpu_address_space_init(CPUState *cpu, int asidx,
                             const char *prefix, MemoryRegion *mr);
+/**
+ * cpu_address_space_destroy:
+ * @cpu: CPU for this address space
+ *
+ * Cleanup CPU's cpu_ases list.
+ */
+void cpu_address_space_destroy(CPUState *cpu);
 
 void cpu_physical_memory_rw(hwaddr addr, void *buf,
                             hwaddr len, bool is_write);
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 43ae70fbe2..aec61ca07a 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -762,6 +762,11 @@ void cpu_address_space_init(CPUState *cpu, int asidx,
     }
 }
 
+void cpu_address_space_destroy(CPUState *cpu)
+{
+    g_free(cpu->cpu_ases);
+}
+
 AddressSpace *cpu_get_address_space(CPUState *cpu, int asidx)
 {
     /* Return the AddressSpace corresponding to the specified index */
-- 
2.27.0


