Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6934425970
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 19:27:42 +0200 (CEST)
Received: from localhost ([::1]:40862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYXBF-0002rT-OQ
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 13:27:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mYWz9-0001mH-1X
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 13:15:12 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:46474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mYWz5-0001sP-Ix
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 13:15:10 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 197H48n6026161; 
 Thu, 7 Oct 2021 17:15:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=3oF4/6y1nW280ds+7Ltfqza2dsE1+k/SiIes9Av4WLI=;
 b=MRw7E2bkB/3zSJUYw/xNDHfVJvpVkwu7JZusWIieWx1WVnV5/fTzycdK0PbjkT0nDSVv
 5bz+XktYJXvsfU1pAKs92bzhpEBDPcuIOQ+MqMwPVSU9mDxTu4uI75sr9pwvj2O3F46F
 c7q42zj84nFuQwsUdb0WiKcQBnyTTXyasJQMKk5YSif6jXXDuO6FRxlBjfo8PbCg3Mio
 dF1By8R5SkT725Gl02WpA4wxVdBaXuGlA4bCJo132Ry1NSLvz6K1LfGoMNDCdBLZVjR+
 5YywPE0jPBZNwtaDmop2epenz6alu2+vgaOTOnZmQGxsWFukx7lSCjT9ZGQG46xQ/Rwx eA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bhy2daq1m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 07 Oct 2021 17:15:04 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 197HAnrn066991;
 Thu, 7 Oct 2021 17:15:03 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2171.outbound.protection.outlook.com [104.47.58.171])
 by userp3020.oracle.com with ESMTP id 3bf16x5tk4-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 07 Oct 2021 17:15:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dRad8MwhqHr7u9eQUZ1O3G9ky5J9zONEEH4RM+T91odYGFOz6gjD8YhsTRmHCjotpbegboWgHGY5gEEfvnH1OprBWK7NwbpVD/CtYRVjWuMg0186/FBmI0f1KXqyVDC+r1L+13FmQjJ+8ubpYOKLcXV1bjfhpIqOnFbwEEzRu6GpyBtciGC5ZBstp74AZxt7AGsACrJDdajwQPKzQGSLIm283Kei8bysdbzYH9lYpZSgqFGbmQSrQ51C/f5W33ehbnxNrsABzl+Q3HW0WVyQXPpLgEpMkz9q7v/kTXnmsGBogrv/xbCiUPOQkm9XprsY308vQCUzj4YsFLSX9z5Iiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3oF4/6y1nW280ds+7Ltfqza2dsE1+k/SiIes9Av4WLI=;
 b=Cx1eAe1f93PO66UJZzKL+erLmjyK2iPeVbgkW3wZ8I9eyGQNKneogrqUe2pTn51j3pSdQkgSL1itF55A7pgY3P7Bd26bc1yDbwceaf+DnAXeftJqEf7kAD624hnlER9f8u2Dh3zYyhi4fHyyWSJqJAGW7M7uDgDGtuOvqxoBCZwXWMIB9vTgPlYggGOTRYPq35Hla+VeI9ilGaOB/+ZAJe83qG/A5SaQf7j4JtvtmaUDYSww1pqT4VI6qBwJ9Wx80pPx32ARcPOf9w/0jZ4WudVuBKtWms2UoVHVolHYObFFpFmo8a86LNGIXz/ZNOFOkviLEq7Qlfmuc9rgjziLLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3oF4/6y1nW280ds+7Ltfqza2dsE1+k/SiIes9Av4WLI=;
 b=ssOwbEbvFOqDGVbYF/STSiJpM+PY+hg0cNYdHl46zPsdEAu/F1eLeCmheheL220vP+JMmfzSv3pNcsxsSSXIJ/B9IsVse4AFdnq0ZsATdh69VebY1lI7N3aBAuyax4dJhym7nrbXTU0uLpI3097mRtFoyJHB6PhT7wXj56Lftk8=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by CO1PR10MB5524.namprd10.prod.outlook.com (2603:10b6:303:163::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Thu, 7 Oct
 2021 17:15:00 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::90ef:e061:a4c2:acd6]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::90ef:e061:a4c2:acd6%7]) with mapi id 15.20.4566.023; Thu, 7 Oct 2021
 17:15:00 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 05/10] ACPI ERST: build the ACPI ERST table
Date: Thu,  7 Oct 2021 13:14:31 -0400
Message-Id: <1633626876-12115-6-git-send-email-eric.devolder@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1633626876-12115-1-git-send-email-eric.devolder@oracle.com>
References: <1633626876-12115-1-git-send-email-eric.devolder@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: MN2PR08CA0015.namprd08.prod.outlook.com
 (2603:10b6:208:239::20) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
Received: from ban25x6uut23.us.oracle.com (138.3.201.23) by
 MN2PR08CA0015.namprd08.prod.outlook.com (2603:10b6:208:239::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18 via Frontend
 Transport; Thu, 7 Oct 2021 17:14:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5893b8ac-d1fd-491d-b968-08d989b5fe4f
X-MS-TrafficTypeDiagnostic: CO1PR10MB5524:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO1PR10MB55242DAD12876F569F0AC15197B19@CO1PR10MB5524.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bpITon1iTlmobp49Ebxgc+m1u1K8P6qW2HZfmPjJYxMo13nbdCKYT/IWDHUdctCpAN9IV0nv0Vff9KaSyKUzH2Mveb7thWCwWEW+3ECUfje8oJcY1F/yjdbmig1NMdH+ltEqn/AXsJPml0EkmGxIpRZ23FCzV0C/sOJzZdM50hWxQDOqXSwJJcb+w5eiOWVMtURWRFmSCoSLNg1vTlpGSWh6qbSy5mxTr3UWSSuAEWRItx2gle5a9oUUV0rawRkX0rlpd6O2yLEQ6RVe8ABjtP10AymOAJD+y3kolKCP/9BBiesmx4qkd+Jof9GQOnGNvXY5TynNeCKftHN3Gpq9NdK2/T+QqyZ4RGMlViUB/GZCKZF9l4VHNf76CE5+IMGPNcAi05j3ZLAKgAsXQxlQcZmT53MYyDYA0kwXzNwKoxdXanxMWky7cNKU+XTxdsNfN7kvAWeOg1Z4rWFeFt6rmeDxyFYiPgMBPQJNL30YxGkpFhmfgI1vf9AipM/Wcqu+kLGcd+fUDWVXphOH34hzR1NTT7jpjGX8FUgZkvZ2vCwLdydJth+DDA8YxDyWp0Sw9kDjzFLCXCbcFu0AEIfFmo6u5OQinkZ3blAIiqZpd1255QHVfQDQhN5JMfXPeeh7J9WzXYy/eu8434pOvMp0QiEr8BQXG8VtkhGQUR02Tf409+2SJ/WCxCh4TnEWX/eyYAmeuMSvnu2FE10yfn/Z7Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66946007)(6916009)(38350700002)(66476007)(2906002)(36756003)(66556008)(107886003)(5660300002)(316002)(86362001)(8676002)(83380400001)(2616005)(8936002)(6666004)(956004)(4326008)(508600001)(186003)(6486002)(52116002)(7696005)(26005)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?omOKUnc4h3mj/k4zu2QhaITV3TnlWn6xf+l7KYdh7iorgYEDitW+dci0/HLZ?=
 =?us-ascii?Q?c4PpSN5GrwwkGh9Kym/pz6rU/QdyA2HexzWWi6GK8DxSWiO9k5w4tCjHsgfp?=
 =?us-ascii?Q?JqyaCdhpnMrqHFs5V/pYj71TmGxuSQd5HWouE2IdVhziF1qOwoIjsc0/OJ83?=
 =?us-ascii?Q?79Unt93VDSpkJUqYCJDrNpFF0fdheST+/P8lMIPmoto7Wg3DZlAkYc8j/Y1U?=
 =?us-ascii?Q?ukuEb9ZKoijL5SuB8wWz+3tucUFe2LIyJG7qFmmyto3aXgX4L0D8Ys5Mi8lZ?=
 =?us-ascii?Q?qw4lPa6fEEXXsrTuoZh5NK2XykcBtXE+7pHByDg4bSYiFNqVwvBauwAOFR9E?=
 =?us-ascii?Q?xo3PuRx3NofdzGDljIG/ivwvKs2nd29kiXozpLCXm6VOBFf+ZT8n9jJq6ecD?=
 =?us-ascii?Q?oExL3EQnLS6nA3ShxfQ7a1TaiEg+utJlk2SpfeJ5Ll0EqwD0BfXF5n6o6jQY?=
 =?us-ascii?Q?oERlPLElxxU9IR/z20u2J6NbQnJqDl+iHLaq0xxYI6zPWzWH/w7dnPSmMoEP?=
 =?us-ascii?Q?Zbv2akpe8OxA06UQP7TeFXAp/fUW9n7deqCxRLW/Pe7Xz8jp6WCf2ih/Oqi7?=
 =?us-ascii?Q?LSFtVkV+o+T6GgRd62kA+JPSWUrv2O8MgUllYWBpuwoV1YwRbku46MWVZiyR?=
 =?us-ascii?Q?ekbzQmY2pkB86MvUqfx8Ohemref+w3SljsOQuKGAE5yVAhpTpqLMbn5tBhNn?=
 =?us-ascii?Q?yR5yY5lE9mRmbZiasOos15VcfnPwqFVzjwhAHsbRVy1O+PklkOPJasVHETBy?=
 =?us-ascii?Q?xAe623253ya0V+Jyz6RJUkKhfCnhYU1HLq9ce02QDNEgCfwlmaBc/0L+9fPM?=
 =?us-ascii?Q?Gg61STbKWWm/mBDgM9+3zksi2K3dPb33OmFYt4U99AHB/IKYo+y8NmR+jbK7?=
 =?us-ascii?Q?/dkPuJ1tjj9o01XvPnlk2gNjd39nCNzgGpZ1nLeIjDt9v1L2wi2qPZSQkFxB?=
 =?us-ascii?Q?jYHN97/dZMKs0rQUNFKviV8vRu24guYltE0u96T5VYcoL+92mHaQApbE6oCF?=
 =?us-ascii?Q?ycVUJurtJs9tuS3wuls5C6a2gaKlp2e8gr4WsTVqVOpi91xoYVXnfge5vKbB?=
 =?us-ascii?Q?5+J+dpl+69NVeznBFS5Qf1WUDkWuuiUS9MrerMD+BDPagz2nnrLBsO+m2SU4?=
 =?us-ascii?Q?qJz+/++UXBiB0f48jOwrWYFXCLAvThZuzRJVubLAP5myNxEu2y03NsuMc+fp?=
 =?us-ascii?Q?GxlBx37QYjV0RrH+J+SPDH+n4DLapZZupPAgeEj1YjShejW8P/YV0oPuS7mJ?=
 =?us-ascii?Q?v5Y+RPDQgYUtFfp0cPnDTAam+ZCE8kL9IppfFUhFds5U2U/6pbfMg1TVoGyp?=
 =?us-ascii?Q?nyLSljJaa3/twwwLdZ6kTAWU?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5893b8ac-d1fd-491d-b968-08d989b5fe4f
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2021 17:14:59.9504 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CmXIcMwxqKFK5Yt37leVB71L84QmTG6SZi/5swyAesMaAeCLJspNCH5f9kB4N3+qbM7Jamxyl9obw/6tuHOHWJD2+zg5oIHzVaUwCohEBl0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB5524
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10130
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0
 phishscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110070112
X-Proofpoint-ORIG-GUID: JXM5P_77cQUHhC61KjCqlJGlVu5U-QEw
X-Proofpoint-GUID: JXM5P_77cQUHhC61KjCqlJGlVu5U-QEw
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 hw/acpi/erst.c | 239 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 239 insertions(+)

diff --git a/hw/acpi/erst.c b/hw/acpi/erst.c
index af7e1a9..177fa51 100644
--- a/hw/acpi/erst.c
+++ b/hw/acpi/erst.c
@@ -701,6 +701,245 @@ static const MemoryRegionOps erst_reg_ops = {
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
+    unsigned erst_start = table_data->len;
+    hwaddr bar0, bar1;
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
+    acpi_data_push(table_data, sizeof(AcpiTableHeader));
+    /* Serialization Header Size */
+    build_append_int_noprefix(table_data, 48, 4);
+    /* Reserved */
+    build_append_int_noprefix(table_data,  0, 4);
+    /*
+     * Instruction Entry Count
+     * Each instruction entry is 32 bytes
+     */
+    build_append_int_noprefix(table_data,
+        (table_instruction_data->len / 32), 4);
+    /* Serialization Instruction Entries */
+    g_array_append_vals(table_data, table_instruction_data->data,
+        table_instruction_data->len);
+    g_array_free(table_instruction_data, TRUE);
+
+    build_header(linker, table_data,
+                 (void *)(table_data->data + erst_start),
+                 "ERST", table_data->len - erst_start,
+                 1, oem_id, oem_table_id);
+}
+
 /*******************************************************************/
 /*******************************************************************/
 static int erst_post_load(void *opaque, int version_id)
-- 
1.8.3.1


