Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B3249867D
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 18:22:14 +0100 (CET)
Received: from localhost ([::1]:36328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nC32j-00015A-9Y
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 12:22:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1nC2yK-0005kS-4b
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 12:17:40 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:65336)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1nC2yE-0007lh-Kn
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 12:17:39 -0500
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20OFvXKV019284; 
 Mon, 24 Jan 2022 17:17:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=TT4tb+FKWv2PAwxiQdEwMAt5XD8HqI8lAEczAlMG6sc=;
 b=LJVY3Qxca1sfSlFPkmZK3Dvb9gukaiZnAjtZOzUkPmAmIORpC4aUR/omO+Hfdnfk+PIu
 yHIuR98lGaLyE9PQ9HglaCkaMqnmlvjHtMKIq8Hxeha8dbazktF/onSdqS23C8qLlve4
 qKcUec4hlFxcPTLAatHCeeLa8Xc186adAyk9Q0V5Gf2FYqXxcQCIEa1kxqVMqLjRwQjF
 zfdWY1Zj97mgJvoCi/G46dips1p+kUJB0Eccnvq9xkJYorO4N8D/Oi9d7UplGbvjq3Y9
 iXRPEYQ6qOuaag9EdxmRddgVaZ4LPfHXDFaDvm8L5FOtznn7Qa+9E4RQxEujH3pSb3i/ PA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dsy7arbga-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Jan 2022 17:17:29 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20OHBEg7142709;
 Mon, 24 Jan 2022 17:17:28 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2175.outbound.protection.outlook.com [104.47.56.175])
 by aserp3030.oracle.com with ESMTP id 3dr7ye6qyj-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Jan 2022 17:17:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CAZapL1xXTS2foY/C5Eccevz8gGWwXj68nrgFFqR4+YS7/t8Z3weVbOgvf+gqbIeBgj2b3Nvek9o4EgGdD6+jmA4h8Ze6/koOBXDdadLfIWTwMemn6Nfzg81Qsvkn4ZLrfGI45ZbIfVNfS+/PjavSj26Eu2y7tC7R9QSk5ewoVXd9u9FWUM2AgfW2nARj6kuY7eaRiVI1LrvpFW+65Br8SB1pbvi/gaPAejL5BWXX9XQCzrcP9/QqHYs3SOU3lyOT2QyZFwBg99rdD3UbTCq3yjo7AEWwp6WAm8ZIW6m6BadVWVND7h096KJi2jrDOHUY68z03wMkpjQXaLeno2PJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TT4tb+FKWv2PAwxiQdEwMAt5XD8HqI8lAEczAlMG6sc=;
 b=cbBINe/Hv3KS5jUv+g6meNRWhXw/v7+0Ucmqim7tmAAEo+NQp+YJZlcNbt21Y1QfHj12kNkBU5JcBiUrZ/pJVk9x+6f0LdIQe/WN7EGvCsfC9Hgv+EXRA9qzzkM3n7Hu2J5AzZT/KH0eihq+tJcHWaCMPw+u/zcZAaQirmrhSsIfHurDLlF10soVSY1+DziFBlQgQubClqHtQWdZ+BSb8JOmq9w3pWrt/WzRZSm1Zx61u7Zr1FoKM8CvtSxqWucFGjfgyAtPJi37F8qgjEEML3gkQJFLFanSRCTmRBoSNXVyRl2v83hC2z0hqYxAwWnZ2gDx4uHyEvXXGh5BPwSi8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TT4tb+FKWv2PAwxiQdEwMAt5XD8HqI8lAEczAlMG6sc=;
 b=dnWnHth35N8En/f6K+UJgT1NrLht6lrXQvXFg/EQi1B5quJm9M3RLjekqLCVtq/AG0HX0wA/ivxBC6ze8xd6W3jV8B8f6iRR1ovO0M4gguAj7lg8TyXNqLTu9fHHFFVjjBLqrNYR8kVcYIj0hpFyppB1+QeVUBmFqXGDcLJCNvo=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by DM5PR1001MB2265.namprd10.prod.outlook.com (2603:10b6:4:30::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.10; Mon, 24 Jan
 2022 17:17:24 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::ac06:be4:5723:771c]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::ac06:be4:5723:771c%4]) with mapi id 15.20.4909.017; Mon, 24 Jan 2022
 17:17:24 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v13 06/10] ACPI ERST: build the ACPI ERST table
Date: Mon, 24 Jan 2022 12:16:57 -0500
Message-Id: <1643044621-15892-7-git-send-email-eric.devolder@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1643044621-15892-1-git-send-email-eric.devolder@oracle.com>
References: <1643044621-15892-1-git-send-email-eric.devolder@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SN7PR04CA0055.namprd04.prod.outlook.com
 (2603:10b6:806:120::30) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fb2abdd0-fce0-4c49-38e7-08d9df5d6395
X-MS-TrafficTypeDiagnostic: DM5PR1001MB2265:EE_
X-Microsoft-Antispam-PRVS: <DM5PR1001MB2265F4F2DA25E58704EDDA28975E9@DM5PR1001MB2265.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: X5af/tZGV8obAIM6q9tVMdbMRFOcBUlyEzy5IyJA9rN3aJvUhxN/vqmqT3ZjqW2VkVvIdDDZcqnMNEtejyvf9gI9IDF3BQf3jZAlo9kD09syoLxTkDdLotejqgGy+1nLcBArNR1C1H8ldlXP9udJjDrUGNsjggnIg8HVnM5kCJMz6Q0Cn1zKP+ken4tbaVsVXxi4d/scLpS7eaphUZpIODuLl9JCxsEhMsqydQUCgeE1XcZNopHuSzzWYnQt3j+fAc9EJsHfe4Kvjwjg9Vb6T1ruycjcWQ1XUTD9+wEbVlkbSB5QwUEUZoQJh3UIDGPtyYiNhJpr18ok+L/6Ees5DHjgRaUna9t4Db9EdfSL4eLO83b0vJyhCXnhd5ygvUYQwaBQzbJzWPUMKr8CzmH3SNgW9UZr2twHLhUAm4gwIGlxBI7BTqmaWPmEXxPDuOXNk+V83WBmluYEMfWvXf3OfF92jr1tjAGIMhbY3l2gRXU197ipy+uHX/FR+9O+ECBD3CeTOy7xwALIdNLmECGGpmQS61N2J6XZEtV1ZBcunNNRMpmc90CJLppTB1QZ0tdAOSGPU5Uf5HH7X1Z+smRr6ffCyunXQ+ca76xrcg9HxTLeLPjSa0YIFUmDwG7W8Lvdvan5grjGdzyUrq4nSVJskLYlSnfxOMiG7mldPa3nbZ3ESJVBOb3ZsFtRU8iAvmOfilXFkEhQQbDKA/lEyPzNRg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66556008)(5660300002)(508600001)(83380400001)(6486002)(316002)(6916009)(66476007)(186003)(2906002)(38350700002)(38100700002)(36756003)(52116002)(4326008)(66946007)(6666004)(8936002)(6506007)(8676002)(26005)(2616005)(107886003)(86362001)(6512007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oZCRwsArERY2japX6gObuA24nU7XqY2f/3IzeLVPqWyaHpIdTNfcxepq1lWT?=
 =?us-ascii?Q?hiXmHAe1WIAnEmGrNQ2W7jm/LuCJf5/lt2e9j5r1CGEA0+JFWKahaP1sDnEo?=
 =?us-ascii?Q?sI331basKLb82EaCfFN/p8ATbrf5vwk8v+2nqwTM80dTwrGbMk/5TuDfB0J8?=
 =?us-ascii?Q?Peysmfd3qNHxwctO7MzfGuJ7KjqxoAvUIi7AsdTA69+8E5pnREOhwfds6zmK?=
 =?us-ascii?Q?4x+hzdN5cuE7CrZaMGDajTP6KUBQoQnXkGY13NjzsBPWxHrJNE4NgNka1fWc?=
 =?us-ascii?Q?q6c2mfdEupDU5ufoW2seXtIKhcxU9VezniEZ2X/38Wsve0aNr7nIBfKNLtgw?=
 =?us-ascii?Q?eeHK+87Tx4ak8trK8+aI6sVUyY6j3OP9qx/yitNmdix+AnNVWqp/1l4W8fPL?=
 =?us-ascii?Q?tbf8YPfqAYnALQwqUB/LRGlwoFQiDt+q3xsXhXo5KleAOBdw6CRrL52+pG0z?=
 =?us-ascii?Q?XKVfl3C2RGs77ENS5cP1Z07wKNDGLpUomzAEjly2Le9YJxm4WJKfzq9Z5g6Z?=
 =?us-ascii?Q?SIDKjSHUVNbgjGkZbob8tM81q4OiuhhD7hAxRaPgskROWVnLOR1CYCaPmtm1?=
 =?us-ascii?Q?+YmO1Vke2AMnRrWHQV9b7DLYwnSco0Y0y8GzMKUUUkoL43KhTv5SK4kkiDrw?=
 =?us-ascii?Q?Dcrk5ObkeTaRAWB58XoUbYIKGbNO9IQDydbDRbCpI2CP+CujyMd77WG8pCoc?=
 =?us-ascii?Q?02yumLDTQ2tz/NHNpMXeKC28A5dhEpMcJ6qYVfeH/ctlYlcVkCLgUpwBDvnw?=
 =?us-ascii?Q?OQDv7TeK0CdZwzNGfBEmxJopnhqOOsmzzq5+IVul4DhfoOOtH3JR2SjP7jwn?=
 =?us-ascii?Q?xOnQNsc5wB9XxomldlksvySrSrZ1bsQGJN4dygsPwXimhYTmRaVRejao7opq?=
 =?us-ascii?Q?AaSkOhCcdD+bZ8WmBeHt5hRz5+TRIZ23BzVkibfd7LBWBsbm14Id7v6qGsNr?=
 =?us-ascii?Q?XV+G91STyMx6KvbPezGBqD0vgjIpouYLMQsYzUO+/JD6gMtcT91sPoX00tn3?=
 =?us-ascii?Q?doXzl7e8k8kLbLJVTLckec5lx1V+xk1rS+vm2gMjAHzVhgo2kGavWf9WmKP8?=
 =?us-ascii?Q?zcAuGRfGm5gPSoTCeVLaNJZjiPvJXUbE0wNzgx1KQi0hRz2D4mlCaGG6Ouhw?=
 =?us-ascii?Q?tSTbW5Cbv+kwn8ClZrlIshvVUMeXTrUyDucvxpGnP+fIY/pWupF/V8pYSgtY?=
 =?us-ascii?Q?7kihkasQolEuCgl1rrbxwNYOVSeQdoV4j+dmE92kG0+6BuPXK87jOTWa/J39?=
 =?us-ascii?Q?MEeaNLiXwjSrJoW14Wt9+Ynjt6hc2Em88AB8gvpZchibTX0lz+AT8but17No?=
 =?us-ascii?Q?4l/b8jZ/J3/w6qkkoFWXpj8C5nxQOBIoOM7WFvJbaRa2TqDhpUYaDL3JsnT/?=
 =?us-ascii?Q?Q7gJfcot+XMuGPI0PP0EHNDZubmPap5WlYZxfkC6TUcxQ80l6vuKGT7qe0Ld?=
 =?us-ascii?Q?1HBUz0uRN/tXzKg9/fEXj/pjBzzT+Tb7bNWKckyiqMPvHm5T7ZadhJ7F825V?=
 =?us-ascii?Q?Qghvy/3YCAV6Mw667+no/IgBqdiF7cMgfnhG8GthERM7PY7E7BWTY1kO5nao?=
 =?us-ascii?Q?3X6/QmKZJymuX1MZQaNbiLWrtIiVEV085KeATgf6BwPaU/Wao21XXHn1eE6W?=
 =?us-ascii?Q?P1xz0YDWGcUCZKBfpT3jSTMoUentI/gymr/3oclEjEd6TN1Aj3O2CvUv9u1M?=
 =?us-ascii?Q?12FeRA=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb2abdd0-fce0-4c49-38e7-08d9df5d6395
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2022 17:17:24.7645 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cbredJ5cLoElTsGm753EUILE5A++8Oc6Dj3c7g/XFBlkT7hWJgRWLxQRSMPCD+++a99HU1W5iJG1wvHAtwM2T0He1GXsBX05SNeVWI9kXTU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1001MB2265
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10237
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 adultscore=0 mlxlogscore=898 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2201240115
X-Proofpoint-GUID: oVYhujGCjVk6OTF3pUpT_zfg-T9iuUGz
X-Proofpoint-ORIG-GUID: oVYhujGCjVk6OTF3pUpT_zfg-T9iuUGz
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: berrange@redhat.com, ehabkost@redhat.com, mst@redhat.com,
 konrad.wilk@oracle.com, pbonzini@redhat.com, ani@anisinha.ca,
 imammedo@redhat.com, boris.ostrovsky@oracle.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This builds the ACPI ERST table to inform OSPM how to communicate
with the acpi-erst device.

Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
---
 hw/acpi/erst.c | 188 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 188 insertions(+)

diff --git a/hw/acpi/erst.c b/hw/acpi/erst.c
index fe9ba51..b0c7539 100644
--- a/hw/acpi/erst.c
+++ b/hw/acpi/erst.c
@@ -59,6 +59,27 @@
 #define STATUS_RECORD_STORE_EMPTY     0x04
 #define STATUS_RECORD_NOT_FOUND       0x05
 
+/* ACPI 4.0: Table 17-19 Serialization Instructions */
+#define INST_READ_REGISTER                 0x00
+#define INST_READ_REGISTER_VALUE           0x01
+#define INST_WRITE_REGISTER                0x02
+#define INST_WRITE_REGISTER_VALUE          0x03
+#define INST_NOOP                          0x04
+#define INST_LOAD_VAR1                     0x05
+#define INST_LOAD_VAR2                     0x06
+#define INST_STORE_VAR1                    0x07
+#define INST_ADD                           0x08
+#define INST_SUBTRACT                      0x09
+#define INST_ADD_VALUE                     0x0A
+#define INST_SUBTRACT_VALUE                0x0B
+#define INST_STALL                         0x0C
+#define INST_STALL_WHILE_TRUE              0x0D
+#define INST_SKIP_NEXT_INSTRUCTION_IF_TRUE 0x0E
+#define INST_GOTO                          0x0F
+#define INST_SET_SRC_ADDRESS_BASE          0x10
+#define INST_SET_DST_ADDRESS_BASE          0x11
+#define INST_MOVE_DATA                     0x12
+
 /* UEFI 2.1: Appendix N Common Platform Error Record */
 #define UEFI_CPER_RECORD_MIN_SIZE 128U
 #define UEFI_CPER_RECORD_LENGTH_OFFSET 20U
@@ -172,6 +193,173 @@ typedef struct {
 
 /*******************************************************************/
 /*******************************************************************/
+
+/* ACPI 4.0: 17.4.1.2 Serialization Instruction Entries */
+static void build_serialization_instruction_entry(GArray *table_data,
+    uint8_t serialization_action,
+    uint8_t instruction,
+    uint8_t flags,
+    uint8_t register_bit_width,
+    uint64_t register_address,
+    uint64_t value)
+{
+    /* ACPI 4.0: Table 17-18 Serialization Instruction Entry */
+    struct AcpiGenericAddress gas;
+    uint64_t mask;
+
+    /* Serialization Action */
+    build_append_int_noprefix(table_data, serialization_action, 1);
+    /* Instruction */
+    build_append_int_noprefix(table_data, instruction         , 1);
+    /* Flags */
+    build_append_int_noprefix(table_data, flags               , 1);
+    /* Reserved */
+    build_append_int_noprefix(table_data, 0                   , 1);
+    /* Register Region */
+    gas.space_id = AML_SYSTEM_MEMORY;
+    gas.bit_width = register_bit_width;
+    gas.bit_offset = 0;
+    gas.access_width = ctz32(register_bit_width) - 2;
+    gas.address = register_address;
+    build_append_gas_from_struct(table_data, &gas);
+    /* Value */
+    build_append_int_noprefix(table_data, value  , 8);
+    /* Mask */
+    mask = (1ULL << (register_bit_width - 1) << 1) - 1;
+    build_append_int_noprefix(table_data, mask  , 8);
+}
+
+/* ACPI 4.0: 17.4.1 Serialization Action Table */
+void build_erst(GArray *table_data, BIOSLinker *linker, Object *erst_dev,
+    const char *oem_id, const char *oem_table_id)
+{
+    GArray *table_instruction_data;
+    unsigned action;
+    pcibus_t bar0 = pci_get_bar_addr(PCI_DEVICE(erst_dev), 0);
+    AcpiTable table = { .sig = "ERST", .rev = 1, .oem_id = oem_id,
+                        .oem_table_id = oem_table_id };
+
+    trace_acpi_erst_pci_bar_0(bar0);
+
+    /*
+     * Serialization Action Table
+     * The serialization action table must be generated first
+     * so that its size can be known in order to populate the
+     * Instruction Entry Count field.
+     */
+    table_instruction_data = g_array_new(FALSE, FALSE, sizeof(char));
+
+    /*
+     * Macros for use with construction of the action instructions
+     */
+#define BUILD_READ_REGISTER(width_in_bits, reg) \
+    build_serialization_instruction_entry(table_instruction_data, \
+        action, INST_READ_REGISTER, 0, width_in_bits, \
+        bar0 + reg, 0)
+
+#define BUILD_READ_REGISTER_VALUE(width_in_bits, reg, value) \
+    build_serialization_instruction_entry(table_instruction_data, \
+        action, INST_READ_REGISTER_VALUE, 0, width_in_bits, \
+        bar0 + reg, value)
+
+#define BUILD_WRITE_REGISTER(width_in_bits, reg, value) \
+    build_serialization_instruction_entry(table_instruction_data, \
+        action, INST_WRITE_REGISTER, 0, width_in_bits, \
+        bar0 + reg, value)
+
+#define BUILD_WRITE_REGISTER_VALUE(width_in_bits, reg, value) \
+    build_serialization_instruction_entry(table_instruction_data, \
+        action, INST_WRITE_REGISTER_VALUE, 0, width_in_bits, \
+        bar0 + reg, value)
+
+    /* Serialization Instruction Entries */
+    action = ACTION_BEGIN_WRITE_OPERATION;
+    BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
+
+    action = ACTION_BEGIN_READ_OPERATION;
+    BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
+
+    action = ACTION_BEGIN_CLEAR_OPERATION;
+    BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
+
+    action = ACTION_END_OPERATION;
+    BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
+
+    action = ACTION_SET_RECORD_OFFSET;
+    BUILD_WRITE_REGISTER(32, ERST_VALUE_OFFSET, 0);
+    BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
+
+    action = ACTION_EXECUTE_OPERATION;
+    BUILD_WRITE_REGISTER_VALUE(32, ERST_VALUE_OFFSET,
+        ERST_EXECUTE_OPERATION_MAGIC);
+    BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
+
+    action = ACTION_CHECK_BUSY_STATUS;
+    BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
+    BUILD_READ_REGISTER_VALUE(32, ERST_VALUE_OFFSET, 0x01);
+
+    action = ACTION_GET_COMMAND_STATUS;
+    BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
+    BUILD_READ_REGISTER(32, ERST_VALUE_OFFSET);
+
+    action = ACTION_GET_RECORD_IDENTIFIER;
+    BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
+    BUILD_READ_REGISTER(64, ERST_VALUE_OFFSET);
+
+    action = ACTION_SET_RECORD_IDENTIFIER;
+    BUILD_WRITE_REGISTER(64, ERST_VALUE_OFFSET, 0);
+    BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
+
+    action = ACTION_GET_RECORD_COUNT;
+    BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
+    BUILD_READ_REGISTER(32, ERST_VALUE_OFFSET);
+
+    action = ACTION_BEGIN_DUMMY_WRITE_OPERATION;
+    BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
+
+    action = ACTION_GET_ERROR_LOG_ADDRESS_RANGE;
+    BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
+    BUILD_READ_REGISTER(64, ERST_VALUE_OFFSET);
+
+    action = ACTION_GET_ERROR_LOG_ADDRESS_LENGTH;
+    BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
+    BUILD_READ_REGISTER(64, ERST_VALUE_OFFSET);
+
+    action = ACTION_GET_ERROR_LOG_ADDRESS_RANGE_ATTRIBUTES;
+    BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
+    BUILD_READ_REGISTER(32, ERST_VALUE_OFFSET);
+
+    action = ACTION_GET_EXECUTE_OPERATION_TIMINGS;
+    BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
+    BUILD_READ_REGISTER(64, ERST_VALUE_OFFSET);
+
+    /* Serialization Header */
+    acpi_table_begin(&table, table_data);
+
+    /* Serialization Header Size */
+    build_append_int_noprefix(table_data, 48, 4);
+
+    /* Reserved */
+    build_append_int_noprefix(table_data,  0, 4);
+
+    /*
+     * Instruction Entry Count
+     * Each instruction entry is 32 bytes
+     */
+    g_assert((table_instruction_data->len) % 32 == 0);
+    build_append_int_noprefix(table_data,
+        (table_instruction_data->len / 32), 4);
+
+    /* Serialization Instruction Entries */
+    g_array_append_vals(table_data, table_instruction_data->data,
+        table_instruction_data->len);
+    g_array_free(table_instruction_data, TRUE);
+
+    acpi_table_end(linker, &table);
+}
+
+/*******************************************************************/
+/*******************************************************************/
 static uint8_t *get_nvram_ptr_by_index(ERSTDeviceState *s, unsigned index)
 {
     uint8_t *rc = NULL;
-- 
1.8.3.1


