Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AABB42FBBC
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 21:10:15 +0200 (CEST)
Received: from localhost ([::1]:42026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbSas-0003w6-Gq
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 15:10:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mbSUY-0003vA-4T
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 15:03:44 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:9316)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mbSUV-0007ke-UL
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 15:03:41 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19FIQR5q013290; 
 Fri, 15 Oct 2021 19:03:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=hsCQ08OMTCt57ojTlBVlHNET6qdDThP/HZhwO0+IHTI=;
 b=HNabvc702bYWR35nLRMRTbQDiwQ7f/BKEJ84JSDF1WPY+UjhG07kVX6yLGc2JGEKzJS3
 95WstN7Z5ORB7rDN84CIMFLR4gsuAIOSjzGWXI8G6LNrrQQBT1raImLoZPRU/mbLZXrz
 he9xZjVikRhHDbVSW1vVXCUz/LSlCDDMwMEvfxmQ/zUiWBwHkOaufbydzt23Gj+SOgSx
 Zfwo1v0ovprdeKn1jp1jhhHJumFJiNgLtBLnqLT+xOXecgtX44a41Z0x+A3JZW7fSqlZ
 21BjEDsSd1vFt3VB77oEc3zTI/J4NfTmCeAjb2ST0c8/KfI8OrXG/rRyhg4LOc8AW89V wA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bqbgp9jvf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 15 Oct 2021 19:03:38 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19FJ0t7w180935;
 Fri, 15 Oct 2021 19:03:37 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam08lp2042.outbound.protection.outlook.com [104.47.74.42])
 by aserp3020.oracle.com with ESMTP id 3bmae4ndad-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 15 Oct 2021 19:03:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Js2Hn0krww3ptqky0ZsG9B3QKDu6nn4fZRudCXaEU1Y6vAlzFbd1M7lKomPXwRtCZvI/XEE36PIBmGbmauTD0gMDigYif373GijWebS841Fcv/f7fDdmR3zCm2lleGP0LiXyKf5I72A5+A6923uwKeZQmaxVC3rooWI39SC6hrd4upP0+Z6HAV5wL9AHITLmDIzkJ4d22RWhO50qO9S6Wu1fXH7wCUqbqSUrhOa5iCAMy/OJIYIymBOY1wlE/Mf7pehccwBa5lyZ6iEtQ89Sq5Thr9qOWniocMo0VYvLNhHadoR28sBHRrcSa6g+shWqrSzTF4GLrLDlQ0u5MXVX2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hsCQ08OMTCt57ojTlBVlHNET6qdDThP/HZhwO0+IHTI=;
 b=ebggWXd0y+YHWifWwHGn6PbDlWSYPhvbHtIx2J/Lcgq833iGgs7Tc4XDnBV9MiyRey+yoHg2HSb7smW33no0xeBmdsR6Mq7y6h2XbQ5JsN7V4Fg1mlRc9VQROLJWqhg74XHZ7CXM89f5g6J+1jUVEcAkOxSye3loJAMbuLl9Jpnaue3Q84c6e3RPvPc6AKt3jOHvclU0pIXyrS3KIAe/6/RQaj5nXW4gq1nRm7GWD85LyqNegqBhJiJwe2vXp/dEy1eI6Vb7r/Rgh9Nud37jCbtHpRi6M13ORoN0HBtQOPmFZp+8i5dmUK8UCTOeoAkP4zlEF/W3SsKBkmBTslpoTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hsCQ08OMTCt57ojTlBVlHNET6qdDThP/HZhwO0+IHTI=;
 b=b2Lts8fsbW8n4uDGon3e5k45Nq9GymNJuTtkcg66koRKszIrMWflHKLQz07NNuMhsgDmPK5iOtXtw1mMdJK4RBEIeCl/GIPjMLri4+OqAtrsmPQgS/g3vxy6x5tmQ4XNk99UtKKhdXf7H0b9l6oviIT1aMKM8vOB+2B0J+zsLD0=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by CO6PR10MB5441.namprd10.prod.outlook.com (2603:10b6:5:35a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Fri, 15 Oct
 2021 19:03:36 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::90ef:e061:a4c2:acd6]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::90ef:e061:a4c2:acd6%9]) with mapi id 15.20.4608.017; Fri, 15 Oct 2021
 19:03:36 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 06/10] ACPI ERST: build the ACPI ERST table
Date: Fri, 15 Oct 2021 15:02:56 -0400
Message-Id: <1634324580-27120-7-git-send-email-eric.devolder@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1634324580-27120-1-git-send-email-eric.devolder@oracle.com>
References: <1634324580-27120-1-git-send-email-eric.devolder@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SA9PR13CA0129.namprd13.prod.outlook.com
 (2603:10b6:806:27::14) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
Received: from ban25x6uut23.us.oracle.com (138.3.201.23) by
 SA9PR13CA0129.namprd13.prod.outlook.com (2603:10b6:806:27::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.9 via Frontend Transport; Fri, 15 Oct 2021 19:03:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1b48820f-e133-432b-dda7-08d9900e7d68
X-MS-TrafficTypeDiagnostic: CO6PR10MB5441:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR10MB544175604D9F68312286930B97B99@CO6PR10MB5441.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /C8pCuyF7n8QyyyXQfk51JJFlkM3cpOgijPopmk8zSeONcBn1p8E+ALGC9Crx5DywsmipyWMkfxUaHH+I5RuKIhzjFmIDQQ2/2yWE29hkxeGqF2HAoBC8PvqzMurixKlkVHUrQv461i+UfHeYqaqx0tNtjwLMcYVbQ5oPejaj5ysuwgq1PijKMd58phZZeUjOPZCUTpsuETdRf8fjXgiEILAmBNB0NxBCR1PtIq6qfeh3181/3yOSTLrjG7gqMf/NWk2fBMupoFaNdWBvsFtHM66UVYr+3XhdHJBhZLdkUW+t1yZr568JBqMuUlUautMJRMKWGpVmAYIHvfTwnsrvv1b8GX0NewanpFAkdzecTshAycJpT/Sks5tGfd6GYbu/jGI2BCvKD7OMRseuyoIXC0GVnPlsyQnKezDtxX36mgJ6dRekDMJFZjpO7XmI1I6CI4pAz/x8Isx6BJsjKap50c1DF5eP3IkBlZ2r4s9Oq6qKXbCK+eamYuM5TrlD7vUa0sgooUCQCJZUFt+iA6nbrPMPqRBFy4k3E4okuz1mHP8tzkj6JeEaCZisY3ZulLufLxVNRktdD63NrC+HYW99swN0UDTNJgcW1Gk6yi6Tr/wsRl9mCO2FV++ic+NJVgXKvvJPqTPAh4WBHwa+FhhEdOgYTSgHGLTFhS3S+hk1pUSGw1/hbr/j9aOQgTzeoOSoXDdJZL5i9SzEaA/U5DK8A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(36756003)(186003)(66476007)(66556008)(66946007)(8936002)(83380400001)(2616005)(86362001)(6666004)(2906002)(956004)(508600001)(5660300002)(7696005)(6916009)(4326008)(52116002)(8676002)(38100700002)(316002)(6486002)(107886003)(38350700002)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GAtn8wp6hg0rfEBN9Gjh84tDIWgFIKe2FrhWxqheHO3YWOcMhMovBHgOaqK5?=
 =?us-ascii?Q?2z89Nuf4kvI4tJqWqd7q4CP4qpWeCGoqfjvgJ248a+Rnd9NGvvFvtZI4nqJL?=
 =?us-ascii?Q?AS1VBc33THnLxUn/7X99KeSpRjbeTWje8CQEs3D15Rv/fP5AFcwQrUg/GgF3?=
 =?us-ascii?Q?6AIQzE06QdhvFJAfWil0qn9c/ai9CAbdngc0MJp6xNI5WNBMnxHd2a0aWgPw?=
 =?us-ascii?Q?iLUybx7eCfwS3AR6pyKEZwe8OxLE+yo0a3F3FTHWwpRgNJJrQyCgm0OXfUWz?=
 =?us-ascii?Q?iJSZdYbDu5+q5lkUzk0nFemWJymS6RncbQTaBxGIH1MVrnMx/NhUeOuZRfvC?=
 =?us-ascii?Q?oWaQHFnvRor7ZEUVxVccvkXO8Wo87ph++RQAngdp3HDbNFxi1Bd8aJ80LP7P?=
 =?us-ascii?Q?N7UsQf5IK982T986yD4i0r1n6fBlY2F38dyLywqfvAuPk5u+4tmhjJ67BMdE?=
 =?us-ascii?Q?u5NBhdLM8tcjNULVN81Tgpmw7dSfKcEedVdPl8xp38XrJaDMh/wHsj+IoNa5?=
 =?us-ascii?Q?35FSVM9/cI6zT8yIW94hdyRwwRJqw2mOprp4BTx2wDiPBNk1iH9QrPxpUJda?=
 =?us-ascii?Q?BADqsvNU9p44doigfQKfB2AVdYKNlsyTwBccAakg0TCvGoQTd+umvM/1f2P1?=
 =?us-ascii?Q?67G5ORABsBJr49nmwOQTbsEVSYYxZx+vUDvN+AQfOL1yAUmEjNNlM9hXTQ3D?=
 =?us-ascii?Q?RpQQ06sUocSlEP9Nvy+LnhkyGJqBFPK+w9SHzo4s6x7bXixwhwNhmM2SIEa+?=
 =?us-ascii?Q?EzgQ/MnPwAh7VPpltDv/0dgoKz/eQyyi2f4W77FVbp+Ijms/bABb4hs7reaA?=
 =?us-ascii?Q?4atHN+vfH9xs2TIiaqRPv/0TOO0gv1qY8IjmKadLgWY4NQtq5ArTqHl0eVIz?=
 =?us-ascii?Q?XUE0bovIYVQAd3SLsS0Wv/4ulsVXeJ46kPh20thYdY9vBDnS08KOoWYF4Tej?=
 =?us-ascii?Q?jHEAv4RohaZlOMmCJDY2++7MfrVb59ZKWtn0YpnQwAOOg06PA8pFvRClECdC?=
 =?us-ascii?Q?hx7njL/4rX8dAHAY18+scYLv+9Rm7SobOTnQKDf8Q+9IVVkB4LcL1u1E5qoH?=
 =?us-ascii?Q?YwcDiNb6tpzaEz6DjFW/Ycu4QGfwhdbUUCAXauZbQAj/iMONTt8HdhbqRMY1?=
 =?us-ascii?Q?OOdDXM4Mofc9NqhV5KEboJVuwelHUwSLKtZyld63FrcBLYx+zfoo5UyqkIro?=
 =?us-ascii?Q?Bh+3ERO0dKgow1RTAxrYpsxcyMNYfqAFmerb0GXlOGhf/s3e79PjEc2Vhap9?=
 =?us-ascii?Q?sUMxvSznDhaHvbKUNduSBAyRAR55wMrrI4u9F4fw6t0VSDwhWu2f3NBzJHHM?=
 =?us-ascii?Q?dBNjBDAooDg5n0P5oyObRuRL?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b48820f-e133-432b-dda7-08d9900e7d68
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2021 19:03:35.9762 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6Ji6iIwzgeeUm/zidBNpJv2W60j5iq8jTrFLapaXTvU9rUGoyjbs2f8RM0BRWP7VatCM7YMc0zR/URurhP1uyF6anc3nIZ9cAxUbqX1Flwg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5441
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10138
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0
 suspectscore=0 mlxlogscore=999 bulkscore=0 mlxscore=0 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110150116
X-Proofpoint-GUID: iB5XNs0DmkALvsWanUQflXgQlv5palX6
X-Proofpoint-ORIG-GUID: iB5XNs0DmkALvsWanUQflXgQlv5palX6
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, MSGID_FROM_MTA_HEADER=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
 hw/acpi/erst.c | 241 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 241 insertions(+)

diff --git a/hw/acpi/erst.c b/hw/acpi/erst.c
index 4304f55..06a87af 100644
--- a/hw/acpi/erst.c
+++ b/hw/acpi/erst.c
@@ -701,6 +701,247 @@ static const MemoryRegionOps erst_reg_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
+
+/*******************************************************************/
+/*******************************************************************/
+
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
+/* ACPI 4.0: 17.4.1.2 Serialization Instruction Entries */
+static void build_serialization_instruction_entry(GArray *table_data,
+    uint8_t serialization_action,
+    uint8_t instruction,
+    uint8_t flags,
+    uint8_t register_bit_width,
+    uint64_t register_address,
+    uint64_t value,
+    uint64_t mask)
+{
+    /* ACPI 4.0: Table 17-18 Serialization Instruction Entry */
+    struct AcpiGenericAddress gas;
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
+    switch (register_bit_width) {
+    case 8:
+        gas.access_width = 1;
+        break;
+    case 16:
+        gas.access_width = 2;
+        break;
+    case 32:
+        gas.access_width = 3;
+        break;
+    case 64:
+        gas.access_width = 4;
+        break;
+    default:
+        gas.access_width = 0;
+        break;
+    }
+    gas.address = register_address;
+    build_append_gas_from_struct(table_data, &gas);
+    /* Value */
+    build_append_int_noprefix(table_data, value  , 8);
+    /* Mask */
+    build_append_int_noprefix(table_data, mask   , 8);
+}
+
+/* ACPI 4.0: 17.4.1 Serialization Action Table */
+void build_erst(GArray *table_data, BIOSLinker *linker, Object *erst_dev,
+    const char *oem_id, const char *oem_table_id)
+{
+    GArray *table_instruction_data;
+    unsigned action;
+    hwaddr bar0, bar1;
+    AcpiTable table = { .sig = "ERST", .rev = 1, .oem_id = oem_id,
+                        .oem_table_id = oem_table_id };
+
+    bar0 = (hwaddr)pci_get_bar_addr(PCI_DEVICE(erst_dev), 0);
+    trace_acpi_erst_pci_bar_0(bar0);
+    bar1 = (hwaddr)pci_get_bar_addr(PCI_DEVICE(erst_dev), 1);
+    trace_acpi_erst_pci_bar_1(bar1);
+
+#define MASK8  0x00000000000000FFUL
+#define MASK16 0x000000000000FFFFUL
+#define MASK32 0x00000000FFFFFFFFUL
+#define MASK64 0xFFFFFFFFFFFFFFFFUL
+
+    /*
+     * Serialization Action Table
+     * The serialization action table must be generated first
+     * so that its size can be known in order to populate the
+     * Instruction Entry Count field.
+     */
+    table_instruction_data = g_array_new(FALSE, FALSE, sizeof(char));
+
+    /* Serialization Instruction Entries */
+    action = ACTION_BEGIN_WRITE_OPERATION;
+    build_serialization_instruction_entry(table_instruction_data,
+        action, INST_WRITE_REGISTER_VALUE, 0, 32,
+        bar0 + ERST_ACTION_OFFSET, action, MASK8);
+
+    action = ACTION_BEGIN_READ_OPERATION;
+    build_serialization_instruction_entry(table_instruction_data,
+        action, INST_WRITE_REGISTER_VALUE, 0, 32,
+        bar0 + ERST_ACTION_OFFSET, action, MASK8);
+
+    action = ACTION_BEGIN_CLEAR_OPERATION;
+    build_serialization_instruction_entry(table_instruction_data,
+        action, INST_WRITE_REGISTER_VALUE, 0, 32,
+        bar0 + ERST_ACTION_OFFSET, action, MASK8);
+
+    action = ACTION_END_OPERATION;
+    build_serialization_instruction_entry(table_instruction_data,
+        action, INST_WRITE_REGISTER_VALUE, 0, 32,
+        bar0 + ERST_ACTION_OFFSET, action, MASK8);
+
+    action = ACTION_SET_RECORD_OFFSET;
+    build_serialization_instruction_entry(table_instruction_data,
+        action, INST_WRITE_REGISTER      , 0, 32,
+        bar0 + ERST_VALUE_OFFSET , 0, MASK32);
+    build_serialization_instruction_entry(table_instruction_data,
+        action, INST_WRITE_REGISTER_VALUE, 0, 32,
+        bar0 + ERST_ACTION_OFFSET, action, MASK8);
+
+    action = ACTION_EXECUTE_OPERATION;
+    build_serialization_instruction_entry(table_instruction_data,
+        action, INST_WRITE_REGISTER_VALUE, 0, 32,
+        bar0 + ERST_VALUE_OFFSET , ERST_EXECUTE_OPERATION_MAGIC, MASK8);
+    build_serialization_instruction_entry(table_instruction_data,
+        action, INST_WRITE_REGISTER_VALUE, 0, 32,
+        bar0 + ERST_ACTION_OFFSET, action, MASK8);
+
+    action = ACTION_CHECK_BUSY_STATUS;
+    build_serialization_instruction_entry(table_instruction_data,
+        action, INST_WRITE_REGISTER_VALUE, 0, 32,
+        bar0 + ERST_ACTION_OFFSET, action, MASK8);
+    build_serialization_instruction_entry(table_instruction_data,
+        action, INST_READ_REGISTER_VALUE , 0, 32,
+        bar0 + ERST_VALUE_OFFSET, 0x01, MASK8);
+
+    action = ACTION_GET_COMMAND_STATUS;
+    build_serialization_instruction_entry(table_instruction_data,
+        action, INST_WRITE_REGISTER_VALUE, 0, 32,
+        bar0 + ERST_ACTION_OFFSET, action, MASK8);
+    build_serialization_instruction_entry(table_instruction_data,
+        action, INST_READ_REGISTER       , 0, 32,
+        bar0 + ERST_VALUE_OFFSET, 0, MASK8);
+
+    action = ACTION_GET_RECORD_IDENTIFIER;
+    build_serialization_instruction_entry(table_instruction_data,
+        action, INST_WRITE_REGISTER_VALUE, 0, 32,
+        bar0 + ERST_ACTION_OFFSET, action, MASK8);
+    build_serialization_instruction_entry(table_instruction_data,
+        action, INST_READ_REGISTER       , 0, 64,
+        bar0 + ERST_VALUE_OFFSET, 0, MASK64);
+
+    action = ACTION_SET_RECORD_IDENTIFIER;
+    build_serialization_instruction_entry(table_instruction_data,
+        action, INST_WRITE_REGISTER      , 0, 64,
+        bar0 + ERST_VALUE_OFFSET , 0, MASK64);
+    build_serialization_instruction_entry(table_instruction_data,
+        action, INST_WRITE_REGISTER_VALUE, 0, 32,
+        bar0 + ERST_ACTION_OFFSET, action, MASK8);
+
+    action = ACTION_GET_RECORD_COUNT;
+    build_serialization_instruction_entry(table_instruction_data,
+        action, INST_WRITE_REGISTER_VALUE, 0, 32,
+        bar0 + ERST_ACTION_OFFSET, action, MASK8);
+    build_serialization_instruction_entry(table_instruction_data,
+        action, INST_READ_REGISTER       , 0, 32,
+        bar0 + ERST_VALUE_OFFSET, 0, MASK32);
+
+    action = ACTION_BEGIN_DUMMY_WRITE_OPERATION;
+    build_serialization_instruction_entry(table_instruction_data,
+        action, INST_WRITE_REGISTER_VALUE, 0, 32,
+        bar0 + ERST_ACTION_OFFSET, action, MASK8);
+
+    action = ACTION_GET_ERROR_LOG_ADDRESS_RANGE;
+    build_serialization_instruction_entry(table_instruction_data,
+        action, INST_WRITE_REGISTER_VALUE, 0, 32,
+        bar0 + ERST_ACTION_OFFSET, action, MASK8);
+    build_serialization_instruction_entry(table_instruction_data,
+        action, INST_READ_REGISTER       , 0, 64,
+        bar0 + ERST_VALUE_OFFSET, 0, MASK64);
+
+    action = ACTION_GET_ERROR_LOG_ADDRESS_LENGTH;
+    build_serialization_instruction_entry(table_instruction_data,
+        action, INST_WRITE_REGISTER_VALUE, 0, 32,
+        bar0 + ERST_ACTION_OFFSET, action, MASK8);
+    build_serialization_instruction_entry(table_instruction_data,
+        action, INST_READ_REGISTER       , 0, 64,
+        bar0 + ERST_VALUE_OFFSET, 0, MASK32);
+
+    action = ACTION_GET_ERROR_LOG_ADDRESS_RANGE_ATTRIBUTES;
+    build_serialization_instruction_entry(table_instruction_data,
+        action, INST_WRITE_REGISTER_VALUE, 0, 32,
+        bar0 + ERST_ACTION_OFFSET, action, MASK8);
+    build_serialization_instruction_entry(table_instruction_data,
+        action, INST_READ_REGISTER       , 0, 32,
+        bar0 + ERST_VALUE_OFFSET, 0, MASK32);
+
+    action = ACTION_GET_EXECUTE_OPERATION_TIMINGS;
+    build_serialization_instruction_entry(table_instruction_data,
+        action, INST_WRITE_REGISTER_VALUE, 0, 32,
+        bar0 + ERST_ACTION_OFFSET, action, MASK8);
+    build_serialization_instruction_entry(table_instruction_data,
+        action, INST_READ_REGISTER       , 0, 64,
+        bar0 + ERST_VALUE_OFFSET, 0, MASK64);
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
 /*******************************************************************/
 /*******************************************************************/
 static int erst_post_load(void *opaque, int version_id)
-- 
1.8.3.1


