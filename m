Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4485475C6E
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 16:57:06 +0100 (CET)
Received: from localhost ([::1]:60832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxWeP-0005HR-Fs
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 10:57:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mxWMr-0000q5-BR
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 10:38:57 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:11326)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mxWMn-0000Ux-O0
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 10:38:57 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BFEgO3E008084; 
 Wed, 15 Dec 2021 15:38:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=mXEh2jGv4DoF0vIppaBruG/EAPEuT5VvAsiMhDw8k7o=;
 b=CerjxEq0lx6j6KDz7rjzVmzKZS8UiMyYhWjAWr/m5WnRPC53K8Ft0SoVb8smB72aXofW
 QH1uNBC23FiETiEV66TAyHXeM/kjJruFV2Ge14fc9pLK9jix4cWKWWX7RptfIQpAytNb
 rVDAuy5ov79lr1/GkAn3E5AEynv7tAywEGEsC6lQxRgn86jtnFnD2FZJ6iC+03/1hy1N
 fzqShB6TRNiuYjbNPnKUF5wpfoqIbtfB56D6QXGdckOx5SVDnw862KqevpzgFbOYv6dN
 TfkC/tl/Ca91E0jXJchbCS79h7zkbgDBBeiV79aesz3aIlDKwA1a0slCFBrX5iq0i03o IQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3cx2nff7b4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Dec 2021 15:38:50 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1BFFUWwK094240;
 Wed, 15 Dec 2021 15:38:49 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2106.outbound.protection.outlook.com [104.47.55.106])
 by aserp3020.oracle.com with ESMTP id 3cxmrc0ww6-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Dec 2021 15:38:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PnCi/F+rzoEADjHk6sg0Gm92HHVLwP2cTrkuMKXdfq3BjKdfJAsdownsyEu+yLe1C7mlFmU1Z/yrQDgsEFHOUtO73AA9/lYVzipZNLJQ10/hktmU0y82hsv/3dciu0cRbMGUkOl4/W/NLiKkqoe0L0AboJ0w1OVotlQkXuyVpJXUKpTlWtzMOI613HGCCt9y0PcTc0JuDvhta+O5e2LIhKVUfL9FzHISV4971ckeMwvsLScUaguswTgvfbd7Yn7GCLV0lxGnzCLsA7dDVAwlaxwmQ4WEXR5WKOhF/GvVKqXJDYJhUo5wCtsyQbsZZHxCTbynC1uRB2Frc/c/yAvDrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mXEh2jGv4DoF0vIppaBruG/EAPEuT5VvAsiMhDw8k7o=;
 b=b0IknjUlDtehG3f/r/MzIpi3rmHKw6tYDKXYrc056QD9UCzt1k6j6kxO2+QMxMDZS8s0bPCCXkMEDqIJWDMx43plxlyGSNHlB0SAwlWblEZUhhfkd3/bRmXSMVBsRtKKl8dcdSbnY3T+gQhp8JIwkNjoA9QkrqLee6mf9ODk5yFpMdMSWCY/6ouzvj6OZn2Or3F18UhoSTSVJBFg32onz7IqATt3jVJIvliwOeUdLP5nnuHiYFc/aEUh3bLPtMZeWp8SFUcHraVbf5FRFyKLv4XeXhLw1hfeVBpd0tkmJxisL0BaHG7EmxDDU71f8FFvB5NRlRtFlvoOKUDoDTFfww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mXEh2jGv4DoF0vIppaBruG/EAPEuT5VvAsiMhDw8k7o=;
 b=S4X7DxBi047VVY86ijxnLdLVQnr56PffP1kpZj7AKKTTU3LsBenC6vM1CHg0PZJemQz8EU0ImQgjPm8LesyIJ59uSAPbOg4Jfj/7T4RRFO45kDJggtEQ6SA0cxNitNRAnRdH36gnpDnK3zkrsWRcgkwb9A4He9oGioeJkbLpNXw=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by CO6PR10MB5474.namprd10.prod.outlook.com (2603:10b6:5:35e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Wed, 15 Dec
 2021 15:38:40 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::143c:ea64:7017:19f]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::143c:ea64:7017:19f%4]) with mapi id 15.20.4778.018; Wed, 15 Dec 2021
 15:38:40 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v11 06/10] ACPI ERST: build the ACPI ERST table
Date: Wed, 15 Dec 2021 10:38:11 -0500
Message-Id: <1639582695-7328-7-git-send-email-eric.devolder@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1639582695-7328-1-git-send-email-eric.devolder@oracle.com>
References: <1639582695-7328-1-git-send-email-eric.devolder@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SN1PR12CA0073.namprd12.prod.outlook.com
 (2603:10b6:802:20::44) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: acdb565f-c317-4f29-1947-08d9bfe0f7bd
X-MS-TrafficTypeDiagnostic: CO6PR10MB5474:EE_
X-Microsoft-Antispam-PRVS: <CO6PR10MB5474EAF6BF655525671BB49897769@CO6PR10MB5474.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ux38DRVPNit3PaNHrIiZRzy7FR+iQT86K86zGs+JTh1RresJUTO3HSg0UMDBmxNEFkFoztYnmWyYMgYQkJD8UhpLIjERXJ0dAgGfffteU1eeM8+qJ0573+BqT4b7MQ05TYWBXlFR8V8O6QCKlViR70ENOorr8wMcxhZfwa2Kl4aYLdxbjoAl/IllVMYqVj640cDFJf7JWBIsJnDnTfI0eVyqTy8SX5ZFdj9eEcqziYsalbyxSlzl9XuxxxbcSoh8e+eV8aen28Rz9etjVMxPzT03WH20OSbzQmQcpbgPvoX5nUiSLzk9MH9S9EB76w9f71sDge9l3zoalSdjP6q6Y9FzD9AEkdr3BUAvlpKg0wNMeijnwIsWzNbfRW4dIYT3krwSvTIgzs/+0yd+y65qJUCDcTDtbYoafsmMZbzY1XDNhAXC06bccOWb3Yptryw3Kwa3oFF0fIX5zIdjcixOpRZESfLJN/IKUQpHCyfzVxcTQgV2N6EYr5Lcrrl+rp15CAtqBpJOduLZjCQQrKJw5lqD4NupEuC0XQIPBE0j90PZZXuGJq6jHlJVgOOzT5QCWGfD39aDTxfHWhv7+0BrQSqy/avrjAKIN2/zdjVN6FJrs4lSqNfzhiOJSLHEnkdoMxgLJlQ7BdRri2h+TnIbpcP7Y6V/FlgKCc0Rw1Lhju3ADu5rrKxnaJ3OUOmv+jWR2mG4utMxqfa+HcbqNpsofQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(5660300002)(508600001)(316002)(8936002)(38100700002)(8676002)(6506007)(38350700002)(2906002)(36756003)(107886003)(6486002)(26005)(6666004)(4326008)(66946007)(66476007)(2616005)(186003)(6512007)(86362001)(66556008)(6916009)(52116002)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?N3SxfkcwOBl3rxY6SZzFZhiN5Owe0lY9OdR2b9b1Fu/FxGZ17TmFn0rhDn3t?=
 =?us-ascii?Q?Ads65PkqZktClOUFr5VxtR9AsW+quGHqueEGlT2mJIOKBy/j/WIR8qFa/LSR?=
 =?us-ascii?Q?FQMsjvFV8iu4jut4tSCPMcOD03pzofm/DkyeanaNJmkJvBYIa16TD1PdFxVb?=
 =?us-ascii?Q?Xvg2zwgwpRzksuEBnxrTp2xCpMrMlxAtDDZ+W02i8SHcXEry2D1jy9Hdm5Sx?=
 =?us-ascii?Q?/vMhrB5BfOn4JO/1hQjjtPVVT2y1aHUn4I8igzWUt7okfkf+mAqEFgKOhyz7?=
 =?us-ascii?Q?Y9c8LjmyY8AtWNE/hxxiF0qpuuAGqMLEnmzFbv42D2D02MJLD1Hmwpohvc3A?=
 =?us-ascii?Q?jFOB8hdRsYqGjoVzi6Gt9gNsrGLRCew/eTDmk8/5LifFKtrC/lrvtgkRBwkb?=
 =?us-ascii?Q?6jrQPgKNHOQZEpKndkp5UqXmo8GDabKwEMBquz1ruduo5zAyB2HSPFoOyevC?=
 =?us-ascii?Q?NzJwcXYp22w1pSEWOHRaNk40B8Sq8gZgCctn8tBeTeDlo/N2s4cyS+urawLO?=
 =?us-ascii?Q?+4kXLGkdkKBEqzOpoK4b71HieFab73IL5tHySslIAdCQ7X29z0EvA1ekyuEv?=
 =?us-ascii?Q?9PuKR+cixRkZaevQA99TRf+SsVHlWB4WGS7omFDd1GyTVpRFpBBMk5Lsc4c1?=
 =?us-ascii?Q?jJJe168Z/XyTNmX2HpSAslPulxTjH4+nNJHXXttOrY/7tso14o/u2HOE9R4B?=
 =?us-ascii?Q?sk/wuTd1j4fNALvG1VUCiBH7cVrNyT1HyNrhucZlfUwK6egAErFr5T1MRKGt?=
 =?us-ascii?Q?dstDKRTXJd/35fS0DTvAmjonDFhKD53tylxE7m6eRV5YK7sZA21b7+bMvn+f?=
 =?us-ascii?Q?heOlOlRN9IlcceuER12oNZTZ4UUrbuUJ8L8ekbfG6PWe5qC/o/gmywUMBpi+?=
 =?us-ascii?Q?t78tIBmX53L5I9LdHXb3lZCN3pl6YOBg6XoscgeldBQPCRbG0NFGk9Eljmo9?=
 =?us-ascii?Q?KTndpbwRojOSnBIZuhVRjEXFjz2RMWW1APnF9pWBrsKsLfMpNO5ORTPo+Lul?=
 =?us-ascii?Q?wUYCYAJBatgw+F4Vp/iMg9TSTmwRtmuSySoITAIfQNDfUl9F41ddB8iGmHBo?=
 =?us-ascii?Q?HDAZqxveu8nE5a/XSqxObflQ3JgWeBfsvHFmAt5DWTh6xMdIFzxN65z1qfjy?=
 =?us-ascii?Q?in19BQEFDM5NZDs32FpnXpzltlSNQahczwF6Nmgzz7xmyheS4am5oAQVO2pv?=
 =?us-ascii?Q?qxOCXTsD31BCmq4ViGWPb/EjQFRZZWwG2T+0nMAByMClSqrkOztrU86GCn44?=
 =?us-ascii?Q?3nOYHpys1oTqiNydGUaZ/XIbVqqdOXO9fG4h9dnhWFbcJ7ESbPAKscAGtayC?=
 =?us-ascii?Q?RMgK+1JXy1lIuxuUcQ8KgtAU33PNB9ygXX8hk+Zo7SoRCAnM0HKCbMeQSVHd?=
 =?us-ascii?Q?/kw2JOsjjI2roN9u3BRN8XCQemqnxVGlg8zOPieaU4Xc8uuFuuF3+QaHvCzt?=
 =?us-ascii?Q?FNvYy83qSpuCDFRZ8bLAt/qGXpNk4OwIeLjc3rp2qwmLFk4IrxvYWrqKaZtl?=
 =?us-ascii?Q?urGf2YLgaGjwuCt7E8P5R4xqLrBukNCz+NqUq5+iEwidY3cQaSjU/oCSY+Gf?=
 =?us-ascii?Q?8jjvnQhyu9GY1nm9r3etCXd2FaAmweGaQ3Ut87rRrawArmxYSmVt4azziQ6w?=
 =?us-ascii?Q?nri6/B+ywq+Ws0os2c4Wr4MyPBX3IFSv6SGgTLtkMVtVzUcXRJEnw6QoQoqr?=
 =?us-ascii?Q?yKAIOw=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acdb565f-c317-4f29-1947-08d9bfe0f7bd
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2021 15:38:40.0986 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bkDAbIXjOsoAws0Urizq4RQD6bWqd+spbS5DT7DWwxruyxhZenaWq43Q4UENTnyVcANS9SP8b6K5Qigt5X9ucDbEkX74XpOWcFcpGR5vwDc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5474
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10198
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 bulkscore=0 spamscore=0
 mlxlogscore=923 suspectscore=0 adultscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112150088
X-Proofpoint-ORIG-GUID: p4SiaUv_RHCNfcZFFeOrvLKf_FQBR-aW
X-Proofpoint-GUID: p4SiaUv_RHCNfcZFFeOrvLKf_FQBR-aW
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
index bb6cad4..05177b3 100644
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
+#define build_read_register(action, width_in_bits, reg) \
+    build_serialization_instruction_entry(table_instruction_data, \
+        action, INST_READ_REGISTER, 0, width_in_bits, \
+        bar0 + reg, 0)
+
+#define build_read_register_value(action, width_in_bits, reg, value) \
+    build_serialization_instruction_entry(table_instruction_data, \
+        action, INST_READ_REGISTER_VALUE, 0, width_in_bits, \
+        bar0 + reg, value)
+
+#define build_write_register(action, width_in_bits, reg, value) \
+    build_serialization_instruction_entry(table_instruction_data, \
+        action, INST_WRITE_REGISTER, 0, width_in_bits, \
+        bar0 + reg, value)
+
+#define build_write_register_value(action, width_in_bits, reg, value) \
+    build_serialization_instruction_entry(table_instruction_data, \
+        action, INST_WRITE_REGISTER_VALUE, 0, width_in_bits, \
+        bar0 + reg, value)
+
+    /* Serialization Instruction Entries */
+    action = ACTION_BEGIN_WRITE_OPERATION;
+    build_write_register_value(action, 32, ERST_ACTION_OFFSET, action);
+
+    action = ACTION_BEGIN_READ_OPERATION;
+    build_write_register_value(action, 32, ERST_ACTION_OFFSET, action);
+
+    action = ACTION_BEGIN_CLEAR_OPERATION;
+    build_write_register_value(action, 32, ERST_ACTION_OFFSET, action);
+
+    action = ACTION_END_OPERATION;
+    build_write_register_value(action, 32, ERST_ACTION_OFFSET, action);
+
+    action = ACTION_SET_RECORD_OFFSET;
+    build_write_register(action, 32, ERST_VALUE_OFFSET, 0);
+    build_write_register_value(action, 32, ERST_ACTION_OFFSET, action);
+
+    action = ACTION_EXECUTE_OPERATION;
+    build_write_register_value(action, 32, ERST_VALUE_OFFSET,
+        ERST_EXECUTE_OPERATION_MAGIC);
+    build_write_register_value(action, 32, ERST_ACTION_OFFSET, action);
+
+    action = ACTION_CHECK_BUSY_STATUS;
+    build_write_register_value(action, 32, ERST_ACTION_OFFSET, action);
+    build_read_register_value(action, 32, ERST_VALUE_OFFSET, 0x01);
+
+    action = ACTION_GET_COMMAND_STATUS;
+    build_write_register_value(action, 32, ERST_ACTION_OFFSET, action);
+    build_read_register(action, 32, ERST_VALUE_OFFSET);
+
+    action = ACTION_GET_RECORD_IDENTIFIER;
+    build_write_register_value(action, 32, ERST_ACTION_OFFSET, action);
+    build_read_register(action, 64, ERST_VALUE_OFFSET);
+
+    action = ACTION_SET_RECORD_IDENTIFIER;
+    build_write_register(action, 64, ERST_VALUE_OFFSET, 0);
+    build_write_register_value(action, 32, ERST_ACTION_OFFSET, action);
+
+    action = ACTION_GET_RECORD_COUNT;
+    build_write_register_value(action, 32, ERST_ACTION_OFFSET, action);
+    build_read_register(action, 32, ERST_VALUE_OFFSET);
+
+    action = ACTION_BEGIN_DUMMY_WRITE_OPERATION;
+    build_write_register_value(action, 32, ERST_ACTION_OFFSET, action);
+
+    action = ACTION_GET_ERROR_LOG_ADDRESS_RANGE;
+    build_write_register_value(action, 32, ERST_ACTION_OFFSET, action);
+    build_read_register(action, 64, ERST_VALUE_OFFSET);
+
+    action = ACTION_GET_ERROR_LOG_ADDRESS_LENGTH;
+    build_write_register_value(action, 32, ERST_ACTION_OFFSET, action);
+    build_read_register(action, 64, ERST_VALUE_OFFSET);
+
+    action = ACTION_GET_ERROR_LOG_ADDRESS_RANGE_ATTRIBUTES;
+    build_write_register_value(action, 32, ERST_ACTION_OFFSET, action);
+    build_read_register(action, 32, ERST_VALUE_OFFSET);
+
+    action = ACTION_GET_EXECUTE_OPERATION_TIMINGS;
+    build_write_register_value(action, 32, ERST_ACTION_OFFSET, action);
+    build_read_register(action, 64, ERST_VALUE_OFFSET);
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


