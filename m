Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C3B48A350
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 23:59:21 +0100 (CET)
Received: from localhost ([::1]:34718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n73dI-0001Nb-9s
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 17:59:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1n73N5-0004Ta-8J
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 17:42:35 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:41554)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1n73N3-0001q3-8E
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 17:42:34 -0500
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20AJleuC021735; 
 Mon, 10 Jan 2022 22:42:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=+UvygCXxynxPtjm7Eqi+LZ0nxFRuj1R47uAXJVNTt2w=;
 b=Z/JtXYXgTmt8Lmi6k/LpPNKJH1ehnoxoB7pv+IUFqKlUck3sO5BA9b3WZ8hEXJwVjN/u
 +OaI0on6U2ZRCrRfl4r6mcbztsMdgyFzHvuK0vqba0XAYbU4s1J0JuGyLI8Rl2Li2YJZ
 v77iDpOclwkdESA1DE3+7yI3Wb2QjjyC7S+NY9vVFM/0W9ezaEcoLVdVHAMVq3++PBw2
 Sl1IKCae1olJs3yBMdcZ7x8dcqx7BZAp+1oH7BxFg21EKu+XZ0JjqacxHkZ2sB+BdTCm
 ZhpObJE3bco9VXCAEgE57tCUJDkw/2PBiXUNq8cf6n0sJcfvnzqnpzSDWjHHY/y7v6AY 3g== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dgmk99kkj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 10 Jan 2022 22:42:31 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20AMZvuQ086461;
 Mon, 10 Jan 2022 22:42:30 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2049.outbound.protection.outlook.com [104.47.66.49])
 by aserp3020.oracle.com with ESMTP id 3df2e3x2py-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 10 Jan 2022 22:42:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XueKFT+fJqlqxKXxNavra8TFLuYUpOnttkWgzRHtssUZyb72bUe33/Jy/M7BAsCO9XOzu9yz5Mvcf7eat26rCOuyR0fVKrlqJ9XnA47TnS1azFbolf9xIVxXQLDSYQ+0msYHdtXEKcqb4nDucKO07je18q63y5cFfjaSUymTkWq/0I9aqeZF/+4fHP72KACzgCRc5pyBMUvc2cH96NSSsEak4I7yyQSAdwRnmHy1sDM9FBFCHyKLmGfo41PXS2iSDOwgUAIZWR91KNvLk4/C2h34llOZRsGq95nZnGG3GEUuvJ74+T9FPi2/qiBOq+2lWOl0h+Nh0ZiF4rVfoVXi0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+UvygCXxynxPtjm7Eqi+LZ0nxFRuj1R47uAXJVNTt2w=;
 b=KKAQ4IM487495qmc4Al8yLC1y1ZH8yRZmuGVDc9C6eEJ7L2Nk97921xjzQKfGTePktdiywi9hIHjV0zXyTgObSjospUCfSgwMrrf2siLeQNHOWVMIOVRJHIePpStAKUqgSgHW/FAoSEJDGZcq2GrGP3P8H26l+a5jZS7LvupJ46bxbP/rrh/RlsBgMkCFkWsYGmSBJ/N7op6nhOKX4UOYOdfA0vhqshonziuxKTvRMx9YDOBXqi5FHQnVUdyhmbXXFDIq42sbO6qipwZRfeySAvmdRu12MXcIgdznlqpDiL4v5vU5Eay7DJlqzwsjxfgKoQQb+wGS2J+fX5g2EtieQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+UvygCXxynxPtjm7Eqi+LZ0nxFRuj1R47uAXJVNTt2w=;
 b=bUhyYVtKRUKZ+WYLvotjlA+5oHhdy7rIVBdp+2gx6rUAquDq0GPUQ71OFIkhxIQxxR15ocZYiZFJlzwg6SdBlMzAPFwHM+Tcagv7P1Ithbe3XXyB3Kizx3VKlbUJCPz3NS4/ix4fuCnvHQWjP3VU32ldn9104n7nXEZLysN5wBk=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by MWHPR10MB1598.namprd10.prod.outlook.com (2603:10b6:300:2a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Mon, 10 Jan
 2022 22:42:28 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::d573:6cc0:c616:6f2c]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::d573:6cc0:c616:6f2c%6]) with mapi id 15.20.4867.012; Mon, 10 Jan 2022
 22:42:28 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v12 6/9] ACPI ERST: build the ACPI ERST table
Date: Mon, 10 Jan 2022 17:42:01 -0500
Message-Id: <1641854524-11009-7-git-send-email-eric.devolder@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1641854524-11009-1-git-send-email-eric.devolder@oracle.com>
References: <1641854524-11009-1-git-send-email-eric.devolder@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0P220CA0029.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::13) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 208aa455-62d6-470d-1dd2-08d9d48a7b25
X-MS-TrafficTypeDiagnostic: MWHPR10MB1598:EE_
X-Microsoft-Antispam-PRVS: <MWHPR10MB1598F71B4C3309DC4D23859897509@MWHPR10MB1598.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fC2fbgzQ/H5jZ9Nd0dxjZm+EqMT1gvOifCElwfXo/up8KKB6jFF1Q8eqD2AQbiS7qrzB4Fyl7AESprwAVo9JtKFMU3OFBOnxd0k5QQe+Au0LCZsx+sirtu2S0DOaeUrjKT0yC1TaI+xH+PTzi1gxmsWhaKX/RF9N0JNuvOts1k6fY3X6WGkLZO5BtWuTLWthD7G4rn2rhm/fsi6uLSkGaFoj6n/AhRLAmelZ3OaJdy833HhGHZRWNm2nccK4X4LKoDWID/N3jJAbsRqkMfkgX4G1WnFHLjo+t3UkvrwfZgqVmEmHPV+qTsmrP0yqUP7X5Ew4Cvb8jN9R5kvBoagc21Sv6bf56Zeiw6rLmJdQ+fAV85hYI47VjAqsnNrYBC/0viKA+sT0SMXXNwvdko1Ry+OB6ynX4wJkGX822GxcYqK4foaJHWaqTN8bkG/gywsDEPKu+D8UR6no1b7BoCQorBuYqNixsjcm5Wz9DQPiT2sMCij7c59gt2CROIImXOLayWVmF4reXI4vOoooB6BZhMQfXt4Eei4eF2csJG/GCsuBXETSVQQ+ByHtaevIRACwak6Cq4tu4QzaZxO1oTp85MvTaRQFvqFAW+Bb8RR1nXyRtHMW673r4om6CiCfpKINOu3aLVSozScZEJ0+rh/Lc3QIqjLaOpkz1/DRu15UNeJKAXC/ruzSnzQMYnvz2h1gFiDvKyzq9fKacP3lurKv9A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(38350700002)(66476007)(6916009)(6666004)(66556008)(6486002)(66946007)(52116002)(38100700002)(2906002)(6506007)(186003)(8936002)(316002)(6512007)(508600001)(4326008)(2616005)(83380400001)(36756003)(86362001)(107886003)(5660300002)(26005)(8676002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0LQInoxbB8JuaDwzv/BC0zWdU1vktJk7+0UV2azAdWuJpq6ROZ72r4P23J55?=
 =?us-ascii?Q?f1hVEjDjU4ZSFWWR6uGzRHuvwSfZ4pY0EFw2CJir7Xo82IBOvgItrGyFOWGH?=
 =?us-ascii?Q?cmKrYLLIh/BzGpEnz6sUhv1jN94S/XRNoJJdfMy1X4p8VryyT2I5FDEsQ2B+?=
 =?us-ascii?Q?zdLiETrfoBhlHNHgifDPY/wXPefWCrKNK+PnpACHHx4Mk0wxAxfByJ+onHh2?=
 =?us-ascii?Q?/CjyvWKY6y4nLnyLlCGV5aex+n0/5kVVn1yYeLZbvbLgKYCxepkCKd/kVaIX?=
 =?us-ascii?Q?VrfynvH1EUIfmLLI1d3Vmue+33QOJteeGsiz84Ht63c1Okp8v0AiL8zZYyx4?=
 =?us-ascii?Q?SdLgNO1tzwhHBPqUay0BIB6mqOkIy7F+guBFCCWoj6dKfTm6z4xWExhjDjxu?=
 =?us-ascii?Q?rQ0pVMGtL73k3q1nYLsq8RRH7H033rofqKa1Vv3LIhLGfwy4ibIjRoHLlKZ9?=
 =?us-ascii?Q?8LJBbmBBDCUtRDjLfwAbATB/cMuen/aZdcPezjAYcTt8r7Um0TqFaS968YWZ?=
 =?us-ascii?Q?G//d15Z7ZIIWN2Tza4Nkz9ZE0riyZS1dUyROhdDDSfaSGQCQcpqlvOFhAK89?=
 =?us-ascii?Q?NJ9H6Nb7G5lq7IHRTsCTdORrv7FHD7JnSyzF8Vh5JQ/G3DqSybnYImeEVf4T?=
 =?us-ascii?Q?x8z3fK2KYaoodr97Y/BA6jLT5XlxO5RQnDrO48iDqzhP5h2FDgeJ7hq4RUGW?=
 =?us-ascii?Q?ELqnJXSwAoLVhtmzBCEcV9h3GodSb5pQ295MBzo87OF9nGNKuLAlMb2uhW8c?=
 =?us-ascii?Q?FkL//x/oPjvKP0+suIOuU4dvwZC2rQ1OZEqi7Kr9ZOZsr8vz4UFePV0yN2M4?=
 =?us-ascii?Q?aOpuhPubQdCBRE9/TY8GNGeVLjfYsafrwOQbzkFSdyq/kMmuwIxS2QsdP9qy?=
 =?us-ascii?Q?MHMFokgbyejLkeuu9qNHbss7eAhiYyUGYr7XDVN+1sCEj4Y0nIE2cyKlv0U2?=
 =?us-ascii?Q?mkWK8iU2PZYyf1kGcXfmnTcboA7olgDPTtpPgbNlE2QchXSlq+roTu72ovPa?=
 =?us-ascii?Q?TvQrE/78RuUJgxtE78ve7N4Nu4hoVleft2Yx6TleSVSQWAsk9gFURMgvVbss?=
 =?us-ascii?Q?q3Mr/7y6pn1X8hcpAGUf9pD6lVimGgPmCG+T0/NHqsyx/41w6H1aNcTB8hO6?=
 =?us-ascii?Q?rZGJhhfBl+7lrUgkY/mJ7t5o+irzz4JCeXNykIJ3kgJyHOe2Df3Z+sP/YWmO?=
 =?us-ascii?Q?FZAJUhdt2c0lIYrOt1J33BmJrIG2W83/BtAi1p5Xa5Ki/MfpYJQhD6fo+Frh?=
 =?us-ascii?Q?+wqzUNxaOAW15DPmm7x7lonzKeD2J37rKn/PFNIlmlwSTxFkliGoRxIc9mm+?=
 =?us-ascii?Q?O8W/lkIWivmwY3RL//DAUZb9czrxqJHiTDF94UfAGwzRcGZk6zuyXRjG8rfN?=
 =?us-ascii?Q?QmIO4P82liW/ICaM6ZZ6ccXxoCdvlce5Do9OjqUQ0Fz/W3BSF8IgKbBlLkvn?=
 =?us-ascii?Q?cUi6583a7caOuynKjE+TyAANnesXJArrdzrXcR7CpZgncv/8UrbROXcAuuTD?=
 =?us-ascii?Q?ha68hOlGXpuY8uy1iBwnvoPVDpgTWWdPga6n36n4+0lORp/5RogrOem1olBt?=
 =?us-ascii?Q?4G5iztRVftHjOn9AInzBVGrAIfEBuQ8wqrG6wCC9mpaFznf1cmRFSFt+Ykk1?=
 =?us-ascii?Q?/fJ0pqD9QsPHN5vBAgIS5h9rAQ6pIiyc4zjYJTViYft+POb9immEYp33jUSP?=
 =?us-ascii?Q?qYzWfg=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 208aa455-62d6-470d-1dd2-08d9d48a7b25
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2022 22:42:28.8440 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hgjCJBG5O+U4JKEGXtRFHpkS+wC8B3bQanR+EWizVYJhGzTlK9nGdG/oF7OpxqakG4aipHkKnlriUF3TlriQ59djHrdF48o+vP4vLk7VkQo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1598
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10223
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxscore=0 adultscore=0
 suspectscore=0 mlxlogscore=966 bulkscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2201100146
X-Proofpoint-GUID: u2KAXAzgRmlg9E6GgEsR2_Yd3iowgYxv
X-Proofpoint-ORIG-GUID: u2KAXAzgRmlg9E6GgEsR2_Yd3iowgYxv
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0b-00069f02.pphosted.com
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
index bb6cad4..00dbd8be 100644
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


