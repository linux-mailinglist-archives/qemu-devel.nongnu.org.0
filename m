Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 369D649CFE6
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 17:41:57 +0100 (CET)
Received: from localhost ([::1]:50818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nClMp-0001yI-VB
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 11:41:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1nClAR-0006DU-HW
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 11:29:07 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:33522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1nClAN-00034V-SS
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 11:29:07 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20QFotfG022427; 
 Wed, 26 Jan 2022 16:28:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=Jynh+DagfBJTrcsVSkQtjNR0NYsSruAMsPsuay60iQ0=;
 b=X4yx6QR+5FWH0j3MU80WY4o/Fk4FbObygFPxM3Q4RtzsnT//eOr6uzK1cxZxwEmNQyIn
 Fq+oQENogavfowg9l7DZviRb3/TE/vfFWmU7JRO2Q0S8kYjYKzrCaA3FYdStqLiKGCqe
 6zwCiksWYzdEa1xQMgpI+39m/2281SKZ88WX9zGLLEmWdzKW2R71k/3jxNfMr7/n22dj
 Pjz+cMCrESwu1sja7RiXpq1Fj3P0DBzgQWkkw9Lh0mrF8S9Wqus+QsQlJxrE4lC1SsEI
 3ibgGWbjjX58jP9tw6cmHmflz2NvL6wn4X77rhrrzllexzAO3s2x3UCXaaCuXyzSaxl1 fw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dsvmjf3r9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Jan 2022 16:28:59 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20QGAnAu183810;
 Wed, 26 Jan 2022 16:28:58 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
 by aserp3020.oracle.com with ESMTP id 3dtax8qprr-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Jan 2022 16:28:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TMz07fComcZpGjQUJnBP7ZmYyXziDXIB47aJ9udRPMuAlFoO7PGRXe3+dCrjPogaV4zsS6RDIPiEtliTcSu2b2rWdRSZoE6YHqHrPNtwgPKSGlzgA3cNKH9wcmRV4qLAB/UCw4sWoHdWXpVp5gXQzB5G+z2TRNCXX0WTlnoD9v4PFcO6Ml8Yn3l2EqjkNMApWTE2S4d+0OgD/Q/C8GoN6c7CGih/awLgXH0CUy3N4IgeqKZ/0fhiR+Xh7ZEiRAvwNYtGKUl8FdeBfbe+7AD8hupbgnuplPdZgtCeOLhBXM/EIeB8z9kGhg70DsKRhQca9Q63oRmwcFmUYYG7dDO1ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jynh+DagfBJTrcsVSkQtjNR0NYsSruAMsPsuay60iQ0=;
 b=WGeDhYZ4858iS4P7zIqYHKfKbpuzaYAsoD0fXpf2C+AbdKuRZSZA20fyKGRxR5AdS9XKjuaci7WAOnTIAJjXUe/vAbZC9ye1Bo0etqoDGdMKMQF6Cjpjd2b3/4X+vAvHXBi8fDdjUj2CC2rCG4ep8BSk5L2aSAh6MoTH51uuz7n4j1n0GsHmILPF1GpWwNaUad2GzLzfc1O2ywD2cSEGwLJesyYi+/IWvLrzDzkZ5Ww4vWNFUiTi2keUmH4A/mndichEcjyN2ytAnq7K8m6EofXBj+PiY+PHleAl/PrJ0cub8SCGuK50hDEgS83Zowj2Oe+ZQ8Eb2AFDsjY8g+3KfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jynh+DagfBJTrcsVSkQtjNR0NYsSruAMsPsuay60iQ0=;
 b=rHMmVfLlb1rJp75D5Hk02tRznY4jLiDYU3ivAsF8jsrxT3xiRYh25PXTOK/Mq0HDVKEn0EydqD6lzgz1KDR8IQ02UhYx32xX7eXXDTyVa2hs4iRhjZxN1hPtn6tKisrEr8utt+J18OY6S7sO4poHZEvTG9EIBM03kyiFXd6RuYg=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by CO1PR10MB4450.namprd10.prod.outlook.com (2603:10b6:303:93::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Wed, 26 Jan
 2022 16:28:56 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::ac06:be4:5723:771c]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::ac06:be4:5723:771c%4]) with mapi id 15.20.4930.017; Wed, 26 Jan 2022
 16:28:55 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v14 06/10] ACPI ERST: build the ACPI ERST table
Date: Wed, 26 Jan 2022 11:28:30 -0500
Message-Id: <1643214514-2839-7-git-send-email-eric.devolder@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1643214514-2839-1-git-send-email-eric.devolder@oracle.com>
References: <1643214514-2839-1-git-send-email-eric.devolder@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SN7PR04CA0223.namprd04.prod.outlook.com
 (2603:10b6:806:127::18) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 720ad8be-7939-4034-b93f-08d9e0e8f2a2
X-MS-TrafficTypeDiagnostic: CO1PR10MB4450:EE_
X-Microsoft-Antispam-PRVS: <CO1PR10MB445037939A9087E873CDAAB297209@CO1PR10MB4450.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gZhUhHh3ZWSkdihBvDjpeCv0LJKnKyHa3TG0xZLTJDCs3S/dumycz8qScrJVR41MDZnvDyVvMqX3KXWIZLbHpUcf206t2u44AqGl7h6snMy+zsOd8K257wrSWPJYJ53asuuyGNqAaXMZXw4hWgXDYrP9MWdWsfYqsrdxoDaGs9BdPAYdRPq5koyBmy0SqjAzDM83oc9MZKgRYGz00tltVJtEpOKFHRsTlKstyJIxSZLuQY6E8Ng2iuBbUnq9T6LoWuleKU5seeKYTCsYx3lPWyywDDzfmHQPR8u1BG3EKGv0wEoKGLW5NfXZyYQtMSZfvjdkdu6TkL7h00rY5kg3htNM5n2xhuS6Ng5aMZ04lJfjOMRcbueqbm6ychy7VRwO2Ki3vE3xrcTI0+tIWKpwWOWy6c5VYKPUrX3+jjRvKICu/XcEhTbD8sjgWWFXf9wboxz2KzUBq/OsNZ7UW4uZ1HVQW66s0sCojSKZStwUV81ErV0sTymEQ7lfFJ2cNbN6GdSRcPK1liVuUUWDqngrNpqbzI+2ST8RdVfvGIruvveCgRumjZ5YrE7RaKyubHh2OLWEznzgjzSOSptojZ8KdA/s9lkjBwfSfxNgFBWvv4WekACQGiIAnH1M0o+f9c4qmb2ws50wGLH1NYH/VrDFhI6/VojkdnnUx85wxYDghK0ipOVnyDPpHm6fjvEf8gb/ZdfWrGr589q3a5OF8kXRQQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6486002)(83380400001)(6916009)(66556008)(66946007)(4326008)(8676002)(66476007)(8936002)(508600001)(86362001)(316002)(5660300002)(6512007)(107886003)(36756003)(38350700002)(38100700002)(186003)(26005)(2616005)(2906002)(6666004)(52116002)(6506007)(20210929001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eAHR7wcJSWDLxdeR2SIuBHglvSamzbr/QO+oKvpw58OAOL8fvRSn0UF4hW/f?=
 =?us-ascii?Q?smu8q941Cb2a6QBjpT1LkJ6pSmMddEtNbBaHcD5vkBpzEFbPlJ5n0xCgDufY?=
 =?us-ascii?Q?Jv9AVC81BVHonXamP+I198INQvMgvwq7KsISLoq+I0jIMT/riPszhjKFNqgX?=
 =?us-ascii?Q?wBZXUl51r+mPwVIEAeW5HAbctNfahGWCw3NTvpHnkJumSE60gBP0KYl4XSxv?=
 =?us-ascii?Q?F32OyJKq/8ycphiFIL/DilDCDIHmCKEZHhgBz9W31EGw71rU23aePxQ+JWiW?=
 =?us-ascii?Q?icYj2RVWDhy7TYjP+AzKK9yKnO2Ke6C//Fq5wQvf9yPBhYtI5qkm+Or5ukEh?=
 =?us-ascii?Q?P+xinG5DOeyNObkPeQB+Nv1F0tSDXWkloifDAqf3n2PcGRR6yF0DFe7VCIMQ?=
 =?us-ascii?Q?ewVYgGXR8+32R/Jv/vxbGX5lYSdIMb8CMigcCw+56yOHrOPivOEMTo83b/ie?=
 =?us-ascii?Q?AsO8Tlt7d7cdbNdEykwMfHoWfsRt5W69hN1t2igW6louwZpP8xQb1jyEjRwg?=
 =?us-ascii?Q?CCva4GGnfNLsz3vG6mRJ6Efuf0WAGdUtyOWAFQokin8CjpgkAbizXoiggK0Y?=
 =?us-ascii?Q?/dwDlCtRLXMzyNLXLq2sFg2BdwAMwdktm0OSEdrNyxawlUPhmFV9SoKjgX1n?=
 =?us-ascii?Q?5+zPihvj9BrkU3IqFjA5slgPWkQMB9ndJ+9w8GA0TScz0A52bZlyoAqmer8f?=
 =?us-ascii?Q?uQrmuZN+GrVRwY0B45qjCGn9fGg0d6NSfRzxwPwyYw5c43tCXylIkbdlI0Aq?=
 =?us-ascii?Q?THs5jNcjhNXpPCU99bmnpw4BBWONLyAPagH+uktvAT/02WtxFe/FiILIipyh?=
 =?us-ascii?Q?PW83ZiQVpPdZcqrnxmccyVQAO/Y4jS+H3I5O2wWGTn9+kCP8+e6SkMl4tWy5?=
 =?us-ascii?Q?R4hYL8cXNhoItN0xIFdsT4wQ7Vn3X1ZkAMYxMCBZwrdSCgHUVqVxH/jShIFd?=
 =?us-ascii?Q?m8wsOmTo/7SDGXMJnaWu0v5s3vOKjczAdyzoAjxguPdo/zPBZLezDbbYJmMq?=
 =?us-ascii?Q?pTl3XW0cFfdytn8E4CAHy4CxSa7+G0juD6NvjQLCQbfH+a+W9lrOlLvJa9L/?=
 =?us-ascii?Q?txg1vpDz+rTudyX3zT+A/oRc/miXkk6JQXrYCPyGCIB428fX7ZKJKnXHQirr?=
 =?us-ascii?Q?KfcFxGUiv34gFCDd+V7p2mkH3pvusa6XY82+JCEu0NgsxnJL2u8bEY/MYntd?=
 =?us-ascii?Q?/1tk50YvC0yg8Mjh7UePWyw8tLpllcT1lxLeHmefWhJiKsGXJ7zHpgoEnhuL?=
 =?us-ascii?Q?bxCpn3FWjJwjSA7hK3nmeptNswFUHtrgXKn3HRTaz3b2MO2c02Rpms+w7cXI?=
 =?us-ascii?Q?TO8XkKPP6OkXJaacbXvJwxYfa5/N6NmuceYWnDhxts/jJ6nUy173Yj5/mGu8?=
 =?us-ascii?Q?Gl+IpUD0EtF6Mx1TrUq4ny070FYKfEG8USE+rMOt/mou9O/ePbh/vCTvTFiu?=
 =?us-ascii?Q?Vlhf//GiFXXwQcciiCXj/+Kqz+pS4qFEEGskZOApx7fNNxOxce0RuOvgdnVo?=
 =?us-ascii?Q?h/NxSC64krGMvGLaLKqQT/BAUqXM+nk/zWWfMOi/aNyadcyzftCc0tzj4+ZY?=
 =?us-ascii?Q?IlkfhYTCDdCX9ag484iYAUlMoA/OqLKEK+tJ67djHTingShifxHa4vrvsSyl?=
 =?us-ascii?Q?0OV2zYEfNAKbHJqukzWyt9NdX30TWl7seVbMx/PkTAwgvY8k4Ec8bZDwuxm/?=
 =?us-ascii?Q?3CaqGQ=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 720ad8be-7939-4034-b93f-08d9e0e8f2a2
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2022 16:28:55.8826 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LFgIWVmH01/JyAjHwAZxsOdjcdZp1FWaFT4Rfb/93ttFUAuj7u7fXNv8wLdYDK84Dh+3iPwajSfTWtNRqz1hfzezb+XHjIwnkcDt0L00F6E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4450
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10239
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 bulkscore=0 mlxscore=0
 phishscore=0 suspectscore=0 spamscore=0 mlxlogscore=955 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2201260102
X-Proofpoint-GUID: yA_DetnjiFqNOafRGYf_HJkZgAWOuRN7
X-Proofpoint-ORIG-GUID: yA_DetnjiFqNOafRGYf_HJkZgAWOuRN7
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
 hw/acpi/erst.c | 225 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 225 insertions(+)

diff --git a/hw/acpi/erst.c b/hw/acpi/erst.c
index fe9ba51..5d5a639 100644
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
@@ -172,6 +193,210 @@ typedef struct {
 
 /*******************************************************************/
 /*******************************************************************/
+typedef struct {
+    GArray *table_data;
+    pcibus_t bar;
+    uint8_t instruction;
+    uint8_t flags;
+    uint8_t register_bit_width;
+    pcibus_t register_offset;
+} BuildSerializationInstructionEntry;
+
+/* ACPI 4.0: 17.4.1.2 Serialization Instruction Entries */
+static void build_serialization_instruction(
+    BuildSerializationInstructionEntry *e,
+    uint8_t serialization_action,
+    uint64_t value)
+{
+    /* ACPI 4.0: Table 17-18 Serialization Instruction Entry */
+    struct AcpiGenericAddress gas;
+    uint64_t mask;
+
+    /* Serialization Action */
+    build_append_int_noprefix(e->table_data, serialization_action, 1);
+    /* Instruction */
+    build_append_int_noprefix(e->table_data, e->instruction, 1);
+    /* Flags */
+    build_append_int_noprefix(e->table_data, e->flags, 1);
+    /* Reserved */
+    build_append_int_noprefix(e->table_data, 0, 1);
+    /* Register Region */
+    gas.space_id = AML_SYSTEM_MEMORY;
+    gas.bit_width = e->register_bit_width;
+    gas.bit_offset = 0;
+    gas.access_width = ctz32(e->register_bit_width) - 2;
+    gas.address = (uint64_t)(e->bar + e->register_offset);
+    build_append_gas_from_struct(e->table_data, &gas);
+    /* Value */
+    build_append_int_noprefix(e->table_data, value, 8);
+    /* Mask */
+    mask = (1ULL << (e->register_bit_width - 1) << 1) - 1;
+    build_append_int_noprefix(e->table_data, mask, 8);
+}
+
+/* ACPI 4.0: 17.4.1 Serialization Action Table */
+void build_erst(GArray *table_data, BIOSLinker *linker, Object *erst_dev,
+    const char *oem_id, const char *oem_table_id)
+{
+    /*
+     * Serialization Action Table
+     * The serialization action table must be generated first
+     * so that its size can be known in order to populate the
+     * Instruction Entry Count field.
+     */
+    GArray *table_instruction_data = g_array_new(FALSE, FALSE, sizeof(char));
+    pcibus_t bar0 = pci_get_bar_addr(PCI_DEVICE(erst_dev), 0);
+    AcpiTable table = { .sig = "ERST", .rev = 1, .oem_id = oem_id,
+                        .oem_table_id = oem_table_id };
+    /* Contexts for the different ways ACTION and VALUE are accessed */
+    BuildSerializationInstructionEntry rd_value_32_val = {
+        .table_data = table_instruction_data,
+        .bar = bar0,
+        .instruction = INST_READ_REGISTER_VALUE,
+        .flags = 0,
+        .register_bit_width = 32,
+        .register_offset = ERST_VALUE_OFFSET,
+    };
+    BuildSerializationInstructionEntry rd_value_32 = {
+        .table_data = table_instruction_data,
+        .bar = bar0,
+        .instruction = INST_READ_REGISTER,
+        .flags = 0,
+        .register_bit_width = 32,
+        .register_offset = ERST_VALUE_OFFSET,
+    };
+    BuildSerializationInstructionEntry rd_value_64 = {
+        .table_data = table_instruction_data,
+        .bar = bar0,
+        .instruction = INST_READ_REGISTER,
+        .flags = 0,
+        .register_bit_width = 64,
+        .register_offset = ERST_VALUE_OFFSET,
+    };
+    BuildSerializationInstructionEntry wr_value_32_val = {
+        .table_data = table_instruction_data,
+        .bar = bar0,
+        .instruction = INST_WRITE_REGISTER_VALUE,
+        .flags = 0,
+        .register_bit_width = 32,
+        .register_offset = ERST_VALUE_OFFSET,
+    };
+    BuildSerializationInstructionEntry wr_value_32 = {
+        .table_data = table_instruction_data,
+        .bar = bar0,
+        .instruction = INST_WRITE_REGISTER,
+        .flags = 0,
+        .register_bit_width = 32,
+        .register_offset = ERST_VALUE_OFFSET,
+    };
+    BuildSerializationInstructionEntry wr_value_64 = {
+        .table_data = table_instruction_data,
+        .bar = bar0,
+        .instruction = INST_WRITE_REGISTER,
+        .flags = 0,
+        .register_bit_width = 64,
+        .register_offset = ERST_VALUE_OFFSET,
+    };
+    BuildSerializationInstructionEntry wr_action = {
+        .table_data = table_instruction_data,
+        .bar = bar0,
+        .instruction = INST_WRITE_REGISTER_VALUE,
+        .flags = 0,
+        .register_bit_width = 32,
+        .register_offset = ERST_ACTION_OFFSET,
+    };
+    unsigned action;
+
+    trace_acpi_erst_pci_bar_0(bar0);
+
+    /* Serialization Instruction Entries */
+    action = ACTION_BEGIN_WRITE_OPERATION;
+    build_serialization_instruction(&wr_action, action, action);
+
+    action = ACTION_BEGIN_READ_OPERATION;
+    build_serialization_instruction(&wr_action, action, action);
+
+    action = ACTION_BEGIN_CLEAR_OPERATION;
+    build_serialization_instruction(&wr_action, action, action);
+
+    action = ACTION_END_OPERATION;
+    build_serialization_instruction(&wr_action, action, action);
+
+    action = ACTION_SET_RECORD_OFFSET;
+    build_serialization_instruction(&wr_value_32, action, 0);
+    build_serialization_instruction(&wr_action, action, action);
+
+    action = ACTION_EXECUTE_OPERATION;
+    build_serialization_instruction(&wr_value_32_val, action,
+        ERST_EXECUTE_OPERATION_MAGIC);
+    build_serialization_instruction(&wr_action, action, action);
+
+    action = ACTION_CHECK_BUSY_STATUS;
+    build_serialization_instruction(&wr_action, action, action);
+    build_serialization_instruction(&rd_value_32_val, action, 0x01);
+
+    action = ACTION_GET_COMMAND_STATUS;
+    build_serialization_instruction(&wr_action, action, action);
+    build_serialization_instruction(&rd_value_32, action, 0);
+
+    action = ACTION_GET_RECORD_IDENTIFIER;
+    build_serialization_instruction(&wr_action, action, action);
+    build_serialization_instruction(&rd_value_64, action, 0);
+
+    action = ACTION_SET_RECORD_IDENTIFIER;
+    build_serialization_instruction(&wr_value_64, action, 0);
+    build_serialization_instruction(&wr_action, action, action);
+
+    action = ACTION_GET_RECORD_COUNT;
+    build_serialization_instruction(&wr_action, action, action);
+    build_serialization_instruction(&rd_value_32, action, 0);
+
+    action = ACTION_BEGIN_DUMMY_WRITE_OPERATION;
+    build_serialization_instruction(&wr_action, action, action);
+
+    action = ACTION_GET_ERROR_LOG_ADDRESS_RANGE;
+    build_serialization_instruction(&wr_action, action, action);
+    build_serialization_instruction(&rd_value_64, action, 0);
+
+    action = ACTION_GET_ERROR_LOG_ADDRESS_LENGTH;
+    build_serialization_instruction(&wr_action, action, action);
+    build_serialization_instruction(&rd_value_64, action, 0);
+
+    action = ACTION_GET_ERROR_LOG_ADDRESS_RANGE_ATTRIBUTES;
+    build_serialization_instruction(&wr_action, action, action);
+    build_serialization_instruction(&rd_value_32, action, 0);
+
+    action = ACTION_GET_EXECUTE_OPERATION_TIMINGS;
+    build_serialization_instruction(&wr_action, action, action);
+    build_serialization_instruction(&rd_value_64, action, 0);
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


