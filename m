Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A98F13B8908
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 21:11:50 +0200 (CEST)
Received: from localhost ([::1]:48944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyfcj-0003n2-Cq
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 15:11:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1lyfZF-00074N-Bt
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 15:08:13 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:13854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1lyfZ7-0005nE-Ko
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 15:08:12 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15UJ6q77007417; Wed, 30 Jun 2021 19:08:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=mzHmRG3cqnhU1qBANplUOQqg713Txtq/wF+2D3fZWYU=;
 b=KYS2Zo6Y9jMbsr1bAW6kOueB/E7Pfd9aY/p2f4dmmqnt3WphJWAEeJkHmwvbtCREH6QV
 BXMBuZhFUTgCjtJkG10XSEyh2XZ1EIGQ9DkzpqAJiORJsF2aqu74QjRAnnJyuAguQ5Nh
 cZus4lpTwfD2spoJ4YIM23uRckt7uApvKBF/dZdmR2AG0mQGqYJ2Al9ghiwpiQVJGuqM
 IYDD1IvqtC1MUSCdArog7pEn9sJ2nXs4RUtLk7RtDSOyo+/a3BTGkgYZownIttUtiSK3
 iOCmFlOo4ohO+HnHqi2AEq2ZHYFs7jJhcyuXLkcDRc8QL0yzlQpQ/P6B5bGksnfPdK76 Fw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 39gguq1ra0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Jun 2021 19:08:04 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 15UIxvjC089823;
 Wed, 30 Jun 2021 19:08:03 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2044.outbound.protection.outlook.com [104.47.66.44])
 by aserp3020.oracle.com with ESMTP id 39dv28kymg-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Jun 2021 19:08:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n4SRNtFzpLJnjqdHBLHH33U+R6FAqPnWekCkCuFGlmEW7kEEm0F7FD+qWpxkycfZ2zTKwuSR6sv9Yk5Utu9RsE50IgM2Gg1yplU39jQuPuczeeN09MRXOV3cN12eGkiCzhjkqKyiV4Yz7OPa7b7Mg3528cwzTgo+RYJIVtuvIOauxuqTBEG6Br3YGfgjhpweYVBQ3CxH/hFBVYxoo4cHj82shiNZbFZzAw6peRhVyOW/14DbKpK3lZspFfS+WioT4Owyx4WrQsHP5ARbQ8vXE+x65EUHvc7P9jXcDYGdc3919KaHxxtQS+G4UpzEU08gETzQtbe+QcqhYYORaJKIwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mzHmRG3cqnhU1qBANplUOQqg713Txtq/wF+2D3fZWYU=;
 b=RVj1DYtdHVuxtCq8b8odoYjAmBmrJAft4cuT7I3ha2Oj3lqRQPYrZVyF0aBbfGmUw5o461QSlF1q5t1H8XNLvzeVIUadATjSi18M8GjjRNgRp3NxaR9dKWktBfcpjC4ogz1CYUERdLN/P2Zvh6A0KJex/0Q6aDLgx2DqqCgKyxGezeGZExb+ef3mfzZ+Rl36S7xo29lLVt+QY9C1ZZT7bqvMrUkNyvwGbE39xbz+dDBFPo2KUxQ8QTKDbHRRbErKOg4yYUL2gpSvUv7AT9l9lXGemCLyyVznvdx5g7NR2hGWUuM4Mqc8STv3jeq8GDnH/IOebOFKGRuBLhC/VMkd0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mzHmRG3cqnhU1qBANplUOQqg713Txtq/wF+2D3fZWYU=;
 b=lKo4km2NJMq9Sxz/TCIkdTUA6hOFFG/RVlnk8chJzTEV4qy4KV+yRP/ycWwmiJuZ2J/zqzP8LBAzS5Qm9WVm0KzUeEviCFf7c89Ec8atzsTiKgTGLl038qvcXem4UpNCavGtCcxAitDQvJ2MurpQ8a1jCYJQ1rVlt5LcHBAjjC0=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by CO6PR10MB5473.namprd10.prod.outlook.com (2603:10b6:5:355::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.19; Wed, 30 Jun
 2021 19:08:01 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::a0af:e69c:6e81:b8fc]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::a0af:e69c:6e81:b8fc%7]) with mapi id 15.20.4287.023; Wed, 30 Jun 2021
 19:08:01 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 06/10] ACPI ERST: build the ACPI ERST table
Date: Wed, 30 Jun 2021 15:07:17 -0400
Message-Id: <1625080041-29010-7-git-send-email-eric.devolder@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1625080041-29010-1-git-send-email-eric.devolder@oracle.com>
References: <1625080041-29010-1-git-send-email-eric.devolder@oracle.com>
Content-Type: text/plain
X-Originating-IP: [138.3.201.23]
X-ClientProxiedBy: BYAPR01CA0060.prod.exchangelabs.com (2603:10b6:a03:94::37)
 To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ban25x6uut23.us.oracle.com (138.3.201.23) by
 BYAPR01CA0060.prod.exchangelabs.com (2603:10b6:a03:94::37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.23 via Frontend Transport; Wed, 30 Jun 2021 19:07:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8caca31b-9a38-4ad7-9aef-08d93bfa6136
X-MS-TrafficTypeDiagnostic: CO6PR10MB5473:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR10MB547332EBB8FBA8BAFDBF503097019@CO6PR10MB5473.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:569;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l4HzZdrfxIdqYXN8H3xWDlIy0Rhqp3cCfW89O22o/13jZevM0z8N93xSHZ/WO4WGlL+mFrRX6OZxbU//sUgemvoRXOT+mwPFgHiBAAuROKj6yijxUjvczOIMHT+g787FV75j4uYErQuMpADI5ldYbq4SRCUikMA5NAxISgfLpx2JiWjQEjot5JY/NsZn5547EEIcRLZ0fpYJZ9iLZZ82F4tYMp+p0AtuMGz5ZSIzcIx2py9VYnCwSJAZ+8HfjkJm7dqggPsg0cRngWAFnthFqnPgrHnkdUNwoZ99unrOhUqAVYaj/E/h9+CY76jz2/JO24Zpc371jJZsJOjdVW8QoNFwvsR4cbkalTx1Eag2Ha6FwhK8MQgDf2PUtwX0zQIbh3PpBWofW6MfOSdaDVp4uGTgmiKhx+8UWr+vH3uOP/FIUAUVD7baCl3G/J+O/9AY/R2DHieDwAKo+naO9CM/7RXb5j6UtO3tYx2ij/2aNvJmdJaoz2Glr9U6Y6tzkNOtXM6sXYvfD9UVSQTYHEgVBKNRAD74EfvHKhUmmZIqeDZXvMEzf0OoXUJpmPVALiqQyi3oH8NqOn9YLgYCpvAfpiYLN9sDG/yKs3zjX6te8T3yyheA35wDc2CSiRxrtvQZYDByZAOTNFzPcQqfT5Yy4LiSWp0gS5LHaolUtOxBIhUjEWb/KFJ4KfT48do321F7WUn93+6seTO2V9/1iC8j2g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(39860400002)(136003)(396003)(346002)(366004)(107886003)(2906002)(83380400001)(6666004)(66476007)(66556008)(8936002)(6916009)(8676002)(66946007)(4326008)(2616005)(956004)(7696005)(86362001)(186003)(16526019)(478600001)(26005)(38100700002)(38350700002)(5660300002)(36756003)(316002)(52116002)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0yOtxHUP3CFEGa+5ud5Wvu+mKaRo94P7uyIhSxnjGsh8iT40yLyCC9lLcPeG?=
 =?us-ascii?Q?yIMhHP0Xx5Z/wfFdsAm9TURubY1m73ilEBs1MRmF7h0N6iyNaCGDB7J3ROg7?=
 =?us-ascii?Q?pSmBytIOhV4YLLM3QU1eQuXYP+RI5D4jLDGaB/pLslV3gdvdKfe8Zj5sOEZm?=
 =?us-ascii?Q?z1ZC10Cl45A41zFrUskgRti3atuKw+DeO44SoULlWDxGvoXQpmZDaLjQGfFr?=
 =?us-ascii?Q?dpZfL2CfjLmkpUH7oq1CVrjVIoy+0FnlyfbTOzj/IHPuSIBj+xdDNFBVY7K8?=
 =?us-ascii?Q?49SeTquH0gaRgwHdaHTuVV7Pjvw/AHbjb7oPU6QIgGUwnK99568GSTxNKiDB?=
 =?us-ascii?Q?LjBqdilAw1I+nVS5SJz5zht7Sh0zBFlp8WCy7j4ol/+/EFZ0P2EjoOZuclCl?=
 =?us-ascii?Q?RfJ2lwRtnVWxhdIbLuNCEvmhadGif5NRm9aUCjOdYdpkoDoY2G7Sg0iIa8J8?=
 =?us-ascii?Q?8Lz1QDeoU22wMvjhEEv3qedmO/xYnbPehKkyHoqc+eHDDPsUNlG35/kmBzNR?=
 =?us-ascii?Q?RmOSHtijicONaB3w8+S+TnYwoKdXi8YMG/+5XhpQAW+gn7CittzHyaYIe/Pr?=
 =?us-ascii?Q?bbQWznpO1NNW4CzXKsoXy7SO4Gs7nSTs1RQLaJ/Pvop1zxEVyDo/hZqGkZI4?=
 =?us-ascii?Q?zqc5ycZ4BTduM7gS+GNSCd78XoBR1In/wuUsaB/29mXu8byBqiMs21pI7hlx?=
 =?us-ascii?Q?B7+CQH65GzWn4kc2y3stSh0qgU5wa5zjfH2TK+YcBiDJHaeUr8u4l6Z6Rf35?=
 =?us-ascii?Q?NdslQypYSXx+0eOjZYhXsYikuzyYoIdFBJUeycAJiV+OMaRlHm0mIDBrCFg0?=
 =?us-ascii?Q?dcMjXvrBQhxd/oaA7llX+o3Irar2x7KbramsRYZDBacWObn38Ov9IXwNtkSN?=
 =?us-ascii?Q?xcNQer/kk/iVsU+OEgEXyffx4FUZco+AOq94EdSKmH5e+gEmDj1I6kvCsRGI?=
 =?us-ascii?Q?JW6zGbyFYJZA4SmMIbflFpc1kZlMfMJHthgN7CdmTkDZwrP2dNaifUqTmFvl?=
 =?us-ascii?Q?W7vcAQYT4Ewqcjbu7Y4AOO3QgAL+7qAY0Rorn6X0N2aUp6mUWm4ukDbMKIgM?=
 =?us-ascii?Q?OFbhRNQnnpIfzTSyEHK0QsJea1MjXCYhPLPICUvOeCw18YdCF6YfALmJN/NH?=
 =?us-ascii?Q?GzKohTgDqvzwUB0H0UrMz7FgDQzAh/ktiNf//mozRG/kSisuCPrdAyTVwsKz?=
 =?us-ascii?Q?+0pmHUXktCmwBLkib/jYbVcpUOD+iRaj9PTBPYZFeEihMtAjAXQvuTC8lon8?=
 =?us-ascii?Q?5RU0S9evCmqSHziGov2vb9GgfdZ2Q8IpGV8uFJobziKrhDZJ0NJUHewVmx/r?=
 =?us-ascii?Q?+qv2AXFwmPcV5NYjSJcqMwv4?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8caca31b-9a38-4ad7-9aef-08d93bfa6136
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2021 19:08:00.9422 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l4DtHiHg4c5E9RB+4QFi3DrRyruvhbCQxCQLXwsL56DgmfByFA7ohsJOAYj0ra5u3PgTKGfhh3rzDwceiD347+29/WCmbKgCB9camKrEWd0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5473
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10031
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 spamscore=0 adultscore=0
 malwarescore=0 mlxlogscore=999 suspectscore=0 phishscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106300106
X-Proofpoint-ORIG-GUID: WXpVVWKfFpnSqmudDlBqAOFMxh9bQ2xV
X-Proofpoint-GUID: WXpVVWKfFpnSqmudDlBqAOFMxh9bQ2xV
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
Cc: ehabkost@redhat.com, mst@redhat.com, konrad.wilk@oracle.com,
 pbonzini@redhat.com, imammedo@redhat.com, boris.ostrovsky@oracle.com,
 rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This code is called from the machine code (if ACPI supported)
to generate the ACPI ERST table.

Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
---
 hw/acpi/erst.c | 214 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 214 insertions(+)

diff --git a/hw/acpi/erst.c b/hw/acpi/erst.c
index 6e9bd2e..1f1dbbc 100644
--- a/hw/acpi/erst.c
+++ b/hw/acpi/erst.c
@@ -555,6 +555,220 @@ static const MemoryRegionOps erst_mem_ops = {
 /*******************************************************************/
 /*******************************************************************/
 
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
+    ERSTDeviceState *s = ACPIERST(erst_dev);
+    unsigned action;
+    unsigned erst_start = table_data->len;
+
+    s->bar0 = (hwaddr)pci_get_bar_addr(PCI_DEVICE(erst_dev), 0);
+    trace_acpi_erst_pci_bar_0(s->bar0);
+    s->bar1 = (hwaddr)pci_get_bar_addr(PCI_DEVICE(erst_dev), 1);
+    trace_acpi_erst_pci_bar_1(s->bar1);
+
+    acpi_data_push(table_data, sizeof(AcpiTableHeader));
+    /* serialization_header_length */
+    build_append_int_noprefix(table_data, 48, 4);
+    /* reserved */
+    build_append_int_noprefix(table_data,  0, 4);
+    /*
+     * instruction_entry_count - changes to the number of serialization
+     * instructions in the ACTIONs below must be reflected in this
+     * pre-computed value.
+     */
+    build_append_int_noprefix(table_data, 29, 4);
+
+#define MASK8  0x00000000000000FFUL
+#define MASK16 0x000000000000FFFFUL
+#define MASK32 0x00000000FFFFFFFFUL
+#define MASK64 0xFFFFFFFFFFFFFFFFUL
+
+    for (action = 0; action < ACPI_ERST_MAX_ACTIONS; ++action) {
+        switch (action) {
+        case ACPI_ERST_ACTION_BEGIN_WRITE_OPERATION:
+            build_serialization_instruction_entry(table_data, action,
+                ACPI_ERST_INST_WRITE_REGISTER_VALUE, 0, 32,
+                s->bar0 + ERST_CSR_ACTION, action, MASK8);
+            break;
+        case ACPI_ERST_ACTION_BEGIN_READ_OPERATION:
+            build_serialization_instruction_entry(table_data, action,
+                ACPI_ERST_INST_WRITE_REGISTER_VALUE, 0, 32,
+                s->bar0 + ERST_CSR_ACTION, action, MASK8);
+            break;
+        case ACPI_ERST_ACTION_BEGIN_CLEAR_OPERATION:
+            build_serialization_instruction_entry(table_data, action,
+                ACPI_ERST_INST_WRITE_REGISTER_VALUE, 0, 32,
+                s->bar0 + ERST_CSR_ACTION, action, MASK8);
+            break;
+        case ACPI_ERST_ACTION_END_OPERATION:
+            build_serialization_instruction_entry(table_data, action,
+                ACPI_ERST_INST_WRITE_REGISTER_VALUE, 0, 32,
+                s->bar0 + ERST_CSR_ACTION, action, MASK8);
+            break;
+        case ACPI_ERST_ACTION_SET_RECORD_OFFSET:
+            build_serialization_instruction_entry(table_data, action,
+                ACPI_ERST_INST_WRITE_REGISTER      , 0, 32,
+                s->bar0 + ERST_CSR_VALUE , 0, MASK32);
+            build_serialization_instruction_entry(table_data, action,
+                ACPI_ERST_INST_WRITE_REGISTER_VALUE, 0, 32,
+                s->bar0 + ERST_CSR_ACTION, action, MASK8);
+            break;
+        case ACPI_ERST_ACTION_EXECUTE_OPERATION:
+            build_serialization_instruction_entry(table_data, action,
+                ACPI_ERST_INST_WRITE_REGISTER_VALUE, 0, 32,
+                s->bar0 + ERST_CSR_VALUE , ERST_EXECUTE_OPERATION_MAGIC, MASK8);
+            build_serialization_instruction_entry(table_data, action,
+                ACPI_ERST_INST_WRITE_REGISTER_VALUE, 0, 32,
+                s->bar0 + ERST_CSR_ACTION, action, MASK8);
+            break;
+        case ACPI_ERST_ACTION_CHECK_BUSY_STATUS:
+            build_serialization_instruction_entry(table_data, action,
+                ACPI_ERST_INST_WRITE_REGISTER_VALUE, 0, 32,
+                s->bar0 + ERST_CSR_ACTION, action, MASK8);
+            build_serialization_instruction_entry(table_data, action,
+                ACPI_ERST_INST_READ_REGISTER_VALUE , 0, 32,
+                s->bar0 + ERST_CSR_VALUE, 0x01, MASK8);
+            break;
+        case ACPI_ERST_ACTION_GET_COMMAND_STATUS:
+            build_serialization_instruction_entry(table_data, action,
+                ACPI_ERST_INST_WRITE_REGISTER_VALUE, 0, 32,
+                s->bar0 + ERST_CSR_ACTION, action, MASK8);
+            build_serialization_instruction_entry(table_data, action,
+                ACPI_ERST_INST_READ_REGISTER       , 0, 32,
+                s->bar0 + ERST_CSR_VALUE, 0, MASK8);
+            break;
+        case ACPI_ERST_ACTION_GET_RECORD_IDENTIFIER:
+            build_serialization_instruction_entry(table_data, action,
+                ACPI_ERST_INST_WRITE_REGISTER_VALUE, 0, 32,
+                s->bar0 + ERST_CSR_ACTION, action, MASK8);
+            build_serialization_instruction_entry(table_data, action,
+                ACPI_ERST_INST_READ_REGISTER       , 0, 64,
+                s->bar0 + ERST_CSR_VALUE, 0, MASK64);
+            break;
+        case ACPI_ERST_ACTION_SET_RECORD_IDENTIFIER:
+            build_serialization_instruction_entry(table_data, action,
+                ACPI_ERST_INST_WRITE_REGISTER      , 0, 64,
+                s->bar0 + ERST_CSR_VALUE , 0, MASK64);
+            build_serialization_instruction_entry(table_data, action,
+                ACPI_ERST_INST_WRITE_REGISTER_VALUE, 0, 32,
+                s->bar0 + ERST_CSR_ACTION, action, MASK8);
+            break;
+        case ACPI_ERST_ACTION_GET_RECORD_COUNT:
+            build_serialization_instruction_entry(table_data, action,
+                ACPI_ERST_INST_WRITE_REGISTER_VALUE, 0, 32,
+                s->bar0 + ERST_CSR_ACTION, action, MASK8);
+            build_serialization_instruction_entry(table_data, action,
+                ACPI_ERST_INST_READ_REGISTER       , 0, 32,
+                s->bar0 + ERST_CSR_VALUE, 0, MASK32);
+            break;
+        case ACPI_ERST_ACTION_BEGIN_DUMMY_WRITE_OPERATION:
+            build_serialization_instruction_entry(table_data, action,
+                ACPI_ERST_INST_WRITE_REGISTER_VALUE, 0, 32,
+                s->bar0 + ERST_CSR_ACTION, action, MASK8);
+            break;
+        case ACPI_ERST_ACTION_RESERVED:
+            build_serialization_instruction_entry(table_data, action,
+                ACPI_ERST_INST_WRITE_REGISTER_VALUE, 0, 32,
+                s->bar0 + ERST_CSR_ACTION, action, MASK8);
+            break;
+        case ACPI_ERST_ACTION_GET_ERROR_LOG_ADDRESS_RANGE:
+            build_serialization_instruction_entry(table_data, action,
+                ACPI_ERST_INST_WRITE_REGISTER_VALUE, 0, 32,
+                s->bar0 + ERST_CSR_ACTION, action, MASK8);
+            build_serialization_instruction_entry(table_data, action,
+                ACPI_ERST_INST_READ_REGISTER       , 0, 64,
+                s->bar0 + ERST_CSR_VALUE, 0, MASK64);
+            break;
+        case ACPI_ERST_ACTION_GET_ERROR_LOG_ADDRESS_LENGTH:
+            build_serialization_instruction_entry(table_data, action,
+                ACPI_ERST_INST_WRITE_REGISTER_VALUE, 0, 32,
+                s->bar0 + ERST_CSR_ACTION, action, MASK8);
+            build_serialization_instruction_entry(table_data, action,
+                ACPI_ERST_INST_READ_REGISTER       , 0, 64,
+                s->bar0 + ERST_CSR_VALUE, 0, MASK32);
+            break;
+        case ACPI_ERST_ACTION_GET_ERROR_LOG_ADDRESS_RANGE_ATTRIBUTES:
+            build_serialization_instruction_entry(table_data, action,
+                ACPI_ERST_INST_WRITE_REGISTER_VALUE, 0, 32,
+                s->bar0 + ERST_CSR_ACTION, action, MASK8);
+            build_serialization_instruction_entry(table_data, action,
+                ACPI_ERST_INST_READ_REGISTER       , 0, 32,
+                s->bar0 + ERST_CSR_VALUE, 0, MASK32);
+            break;
+        case ACPI_ERST_ACTION_GET_EXECUTE_OPERATION_TIMINGS:
+            build_serialization_instruction_entry(table_data, action,
+                ACPI_ERST_INST_WRITE_REGISTER_VALUE, 0, 32,
+                s->bar0 + ERST_CSR_ACTION, action, MASK8);
+            build_serialization_instruction_entry(table_data, action,
+                ACPI_ERST_INST_READ_REGISTER       , 0, 64,
+                s->bar0 + ERST_CSR_VALUE, 0, MASK64);
+        default:
+            build_serialization_instruction_entry(table_data, action,
+                ACPI_ERST_INST_NOOP, 0, 0, 0, action, 0);
+            break;
+        }
+    }
+    build_header(linker, table_data,
+                 (void *)(table_data->data + erst_start),
+                 "ERST", table_data->len - erst_start,
+                 1, oem_id, oem_table_id);
+}
+
+/*******************************************************************/
+/*******************************************************************/
+
 static const VMStateDescription erst_vmstate  = {
     .name = "acpi-erst",
     .version_id = 1,
-- 
1.8.3.1


