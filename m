Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B734DDCAB
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 16:21:21 +0100 (CET)
Received: from localhost ([::1]:43294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVEPo-0002y3-Jj
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 11:21:20 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.kanda@oracle.com>)
 id 1nVEKs-0003UQ-Df
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 11:16:14 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:12680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.kanda@oracle.com>)
 id 1nVEKq-0004SU-Gk
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 11:16:14 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22ICdFpa001713; 
 Fri, 18 Mar 2022 15:16:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=ji9LDoKqE+00zMrQdX034lnfvLOuc2izypjOX8Lwtow=;
 b=JXaxFc31v26xD9si6G8+nxyLvnqia0/G5wh65M9tZBG4gV4e5t/ETbHiA12FKq2uSskC
 f+VxTBoEU2/u+h1lyjWUClQTlFhN5BnwC9X2QVLQo+EJBxoYm1DL0I6psbmXvraW9hvP
 HXYfswZeQyKqJv4hhPhLB86MgsFFp59vbVmquKVof3149PAwdLRnxKLpuVWLaGviAx56
 d1bOH2nq2Sialj8PKpOXM4ek9i2HRw5orfmOhKrMqj1pf2benxXqrfRMjVCC4QhMd1MO
 RkvHRpWhBD+k7K1JwG7yGDT4ZnTTbukpsUNgSnzBM8+OMjhNjRVldi0CR1/hyz8wKQMn Tw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3et5fucc9q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Mar 2022 15:16:09 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 22IFA35s061087;
 Fri, 18 Mar 2022 15:16:08 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1anam02lp2041.outbound.protection.outlook.com [104.47.57.41])
 by userp3020.oracle.com with ESMTP id 3et65aa4u1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Mar 2022 15:16:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TYZShjH11QJAyh5ALKreXWe3P5pCWf1Fcxcm6buC5rC3WMjDXHT8gzlDsf9fnHueEUKT1kg7GCk2qEzHd5cjDIg/VJ+u6sy7IgEa7Vftve2HnK1IJ5kHkUJ7EYa0xNkBX4RAJ+6nsFXzMrqhKpGBhZZUl+pdWMh7NpZinL+ff3UQ94r5tlHuTheMyxGScI0YLSnaNNO8FhreJDC1aTsXrzCBj+tGPOpCgqRu18E+Sx73PFEbepw1U81pKBj5HJ5mEpYJvibVGSoRGrU6/ly4LRL/L5iw80vdKIhaw3eFQU1m/rGedG/J6yepptChsg76kibc0goNhPRPx7pz/aYjWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ji9LDoKqE+00zMrQdX034lnfvLOuc2izypjOX8Lwtow=;
 b=HU76SioPiAk3QNSsCF2A1UpJG8Ur31TqU4qcVF6WRXmnThUcXnJhAlQLJEcLFSC3lwCcb4E6BlIzdS6CNja+NvbsKU/SK+LsLcD9JpF0N1EbMZFEZQWv7Too0tk36u1EmvgfuX8vP5pSfyYGd54ga1hdNvf7NK5+n2Xa6xpsXO+wTRDqQ70WIR8hsqj5auIPX5qt7eH5+J/aEgQOOpKHdeFLSKjvJ2f8Ud2eCEi2PMCtbOiURjwR4MHUxnbYjFg+EQ4XhQadP2GJYVAdBa9gzLHhchxmsyu1FSdPRqstIgNuSMbJ+CLFC2jC5RXS55KS++GSugBldYMWf536fCul3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ji9LDoKqE+00zMrQdX034lnfvLOuc2izypjOX8Lwtow=;
 b=JhlwBWhlmfGelnMa6cnfXq9iu0k+skSWGJRgbvyXOXhO6DhntC1knkKA6v8feLSq+G+jwK/rbWwjscjMt0UhS7NZBN94LytOb8qZ4Rv8mpNUkOpWOWIWvIc9beT+0Ny3QLKu4n/IJtRltT905c3HZbFxO0/ZZmX0OfSX36W6vI8=
Received: from MW5PR10MB5825.namprd10.prod.outlook.com (2603:10b6:303:19a::11)
 by MN2PR10MB4174.namprd10.prod.outlook.com (2603:10b6:208:1dd::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.14; Fri, 18 Mar
 2022 15:16:06 +0000
Received: from MW5PR10MB5825.namprd10.prod.outlook.com
 ([fe80::5915:58a8:f9b1:a71e]) by MW5PR10MB5825.namprd10.prod.outlook.com
 ([fe80::5915:58a8:f9b1:a71e%3]) with mapi id 15.20.5081.015; Fri, 18 Mar 2022
 15:16:06 +0000
From: Mark Kanda <mark.kanda@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/5] cpu: Free cpu->cpu_ases in cpu_exec_unrealizefn()
Date: Fri, 18 Mar 2022 10:15:54 -0500
Message-Id: <20220318151555.381737-5-mark.kanda@oracle.com>
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
X-MS-Office365-Filtering-Correlation-Id: e78cce2b-9e1f-408e-2512-08da08f2393e
X-MS-TrafficTypeDiagnostic: MN2PR10MB4174:EE_
X-Microsoft-Antispam-PRVS: <MN2PR10MB417443356FD5CFB74478AB6DF9139@MN2PR10MB4174.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zpbmUMDsl7PnFnLGn+YIh8ZTe2PYW3I+my7rO84r4kfml94kJdpu7KDDDE0AwHrGOZ6d1FpdSby0tHhNZDN75TzgaWkGmQ2+TXuXWXc2Q6u/bxWcbnuNHqAqc0wRqxmonlEtCZgpARAB9xZFFdtSkGDf7fTUKVILEEaWN0AM1cUFFuSW7lEEY4236MaGxKQjhBLTCU985sl1BsfEz1T+RJh3+ECPod4VpFEc0DiBY2TeOOecb3IRXhIQaDoVHMZMYeDHmZ9sv39ZctT0qfj2c5lWdXTTkL1hsY4L16toqb6r4GXKf1nfCTrhOBy2GmAAOaD+EG6WZ173AEdd2bQc8YNRyBhwzgko74jxmA2AbYm0XL7Wz9CQWEy4kSZc7IFPvdz5BZbdRjqiEwyX4y47e0nbCYVTvT6DCy7Dsm9TbYhJWWyFWw3KeapQQX44M1V44EMb4amq5MlhFxBWy/AD2OYds82w/zhktcEgF1mNjhXLx2sPL5L0WHHaLhcz+afeFcJirE0f687vmNcikcIqCpmVmTYXdtyVLpAEhNj06VDRjzhVKRslB/+Pq63Q4EHsWy7LBi+Mt2yRI3kt96yrETIOImYRo8y4y15uvo5o4Ow4uwx+GxW/t/f99FFouTEbFiMErfucuWVij343f1tmLw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW5PR10MB5825.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(52116002)(6506007)(107886003)(508600001)(36756003)(6666004)(2616005)(1076003)(6486002)(6512007)(86362001)(186003)(316002)(8936002)(2906002)(6916009)(5660300002)(44832011)(66946007)(4326008)(66556008)(66476007)(8676002)(38100700002)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dafniD4cz9B4Eatq0GXh5BU1RN5yJIH8aOVaNXnescKkNpWN4QqoX5AURVhw?=
 =?us-ascii?Q?7dvOcNPlFWjo5rRH7zRnyCHTQh6xZ+OBPoY2yaaZfvJDVhpjZWeqHB4LLc2P?=
 =?us-ascii?Q?pqhPv1H99OHO0lDC6+7FqbQsQyVMPhIzDTFxEqWpU1zlXcaFJziyF+wgHIHF?=
 =?us-ascii?Q?qJnaEKT3N8djf1RWol7B9pbFPjWqYWmnaL/2k3xnjTgIgP2DwPmtLBZcFKdH?=
 =?us-ascii?Q?nzg+9EvSJf2V8/shEDlAy/vx5c4gyDeQ+1uVxpYPggQ/4HzDzfKYkVqLMn8u?=
 =?us-ascii?Q?LG2dKH10OYythVZHnZV+sdEuyJB37ALe5TiGGekeN9IoWzJG8yNywfU/7Rwe?=
 =?us-ascii?Q?CKOKGDSQ6IVsEFiQByDvsD9t/O7b0TAqoU6C9LdsjiL892q4DR3CqAeWq0Ur?=
 =?us-ascii?Q?kHi/eGU/gOZr+FsgLTTZDSGHSl8mDdYL6F1ac2iRgcSZOXm31XhPMNdNpR4L?=
 =?us-ascii?Q?wWE5zeJJSAg1VODft/Z7aY3XZK32YzGKX3TFyRD+VFl0pL7GWzaSM/vBV8SW?=
 =?us-ascii?Q?PmuqP1YuTaQ8Ys4ft+hnELbl1iz0QLu36pFgcByEc5B6sCtkb9eVobhInuIL?=
 =?us-ascii?Q?NzvGybMMK9ST2O7I+h+peQzvuIGyZQ39RlhedeAkQpKnVu/knTtrdFQT1B5S?=
 =?us-ascii?Q?MihXDByWWAfjLpXcPnzdt5E681T+qz4H98vGykrLCRJq2j/9nFYbpYtNxa9q?=
 =?us-ascii?Q?9aosLZ6bPokZke5ECNDaejeUWP7rwjOIsLQV55BPkFswH2+m20BmsOfI8jR5?=
 =?us-ascii?Q?Sg1dFG5NtDnn3JhnaATkZPUptDIWS3FojLWAWRaMwHvJBZ/VVqX0np2W/zto?=
 =?us-ascii?Q?jLGsAgNs28hPpwzsIoIKkdKk19PVOmdiDrtiPqSsCb60Mhr1N0h6BtVpWRPg?=
 =?us-ascii?Q?JnsdMsqXHYfmZBX5ylZAWv9WZyyNv6XfnVKWUD/JhbIWTRKrtkXnAbb2i3BR?=
 =?us-ascii?Q?R9rNYdSb8l7l2MxfLRlcB7HTS+AY+rM4yG4ITNagE3rtSWk6LdTnohIYJ89f?=
 =?us-ascii?Q?4M4fo5o1Q24nYPFbTjttxbwuSB3WWwbxavhMQYHN8COQXMqeFOtWbgGH/ste?=
 =?us-ascii?Q?Z15AYc0hylGxBi1d2FR3i8aSPmfI0VE5PNuBca3ija2pvSc/Gys/jC75Ox33?=
 =?us-ascii?Q?9NzqNbQPYbTYhl0roujhLIpZjCQC+SjXkM3BIRFFA3daUJREQjQylmeebL5y?=
 =?us-ascii?Q?ROkr9uJVIrwraMWjdTq7xtVPUwmbXtSfWrhQSj8W9tKPjA3+ZW3Bp6yuaPSv?=
 =?us-ascii?Q?RGFiFD5IxhVi9tl05e4UK1vnhxaN8qFSIoWD8T+V1tRIhUBsWnFU9+/H7A6X?=
 =?us-ascii?Q?g20tqvXntfc4NATb4fOCEuEQkGe1jrYjVzGE9dD482XufRR7Sx97zaBxSlcm?=
 =?us-ascii?Q?p10/DSe/ZOu29nrw5QZFbyBqDy00+LgJkxobeNdIvXEvjTB/CY+GCWVbqe5y?=
 =?us-ascii?Q?9c/2NvLCeAtSI0dDiFrh0jsF4zAnw0aSSO+hnYT2nRPBixY/NCOsE1vMBkBd?=
 =?us-ascii?Q?2ee3NCHMt1U9FCE=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e78cce2b-9e1f-408e-2512-08da08f2393e
X-MS-Exchange-CrossTenant-AuthSource: MW5PR10MB5825.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2022 15:16:06.4015 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Epy+8/JXI27VgU+DGKxdMDh6C7wsMAnqZafuwgj1Ud/OfFW92wlI7xkTnZbD8SxeLvKu7xuz4vJtFe9Cnz+sVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4174
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10289
 signatures=693715
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0
 malwarescore=0 adultscore=0 bulkscore=0 mlxscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203180085
X-Proofpoint-GUID: YFlN276el79mckIwHGU7n0m6XmJk4WTE
X-Proofpoint-ORIG-GUID: YFlN276el79mckIwHGU7n0m6XmJk4WTE
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
 cpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/cpu.c b/cpu.c
index be1f8b074c..6a3475022f 100644
--- a/cpu.c
+++ b/cpu.c
@@ -173,6 +173,7 @@ void cpu_exec_unrealizefn(CPUState *cpu)
     if (tcg_enabled()) {
         tcg_exec_unrealizefn(cpu);
     }
+    g_free(cpu->cpu_ases);
 
     cpu_list_remove(cpu);
 }
-- 
2.27.0


