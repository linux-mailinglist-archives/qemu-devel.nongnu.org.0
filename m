Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C033B09F5
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 18:08:19 +0200 (CEST)
Received: from localhost ([::1]:46924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lviwk-0004z4-7X
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 12:08:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1lviee-0006ym-Q1
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 11:49:36 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:30984)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1lvieb-0005vG-Qc
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 11:49:36 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15MFgBpg015101; Tue, 22 Jun 2021 15:49:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=A8jXyJS7ytmH5/XBXpphkF1YkVcw0HS9AdYZk3o55o0=;
 b=Rr9dEOgQFuSChgh3SQdmCxXoDxK7mMqh9vgYx0OmLRVrelZyPzlX8Xrmy6anxw9VnjcZ
 k6tVJZNZKTyr0u1ZliNZhL/Z5P/EjmY8SEy4vQSFKy10Q6nS586Io973Hhi5/diegJxo
 6mce/unsn2aoqr8oSPUDOqGjwzAhXw8gg/Tan7+vq90w8sc1NdL7uaYA78ClTJTZ/IAt
 nom+KGiuHY1uoKSRNgeFr5DTAWmI9VXCHODsqbdZvTOa8byLDhFJwq66FppUzAFwKtp5
 xG4bM++n99sk/k9eFOnfLwQuZGOGd8AgquIal6YY9q/vtj2bNeVom+Cp6ZP9IXYc612d BQ== 
Received: from oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 39b98v9je2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 22 Jun 2021 15:49:30 +0000
Received: from userp3020.oracle.com (userp3020.oracle.com [127.0.0.1])
 by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 15MFkDQb028913;
 Tue, 22 Jun 2021 15:49:29 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam08lp2168.outbound.protection.outlook.com [104.47.73.168])
 by userp3020.oracle.com with ESMTP id 399tbsy2hv-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 22 Jun 2021 15:49:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Isc/CdZFm1Czg05CPKlLMt7ZPsfrjW3x25TUyxTzWTWGY4x3CiYMcRXcT4vRCjUAvzEH2Nox9u4daBBmqmRiQ/JrkaKLOG2ZjSb4i0jhixf1lRGQFDAakFDp/CEiFBYGEPAmljfjcBPhQMF9BKmEExR1nnGGzp9rnFlIp7iAB8vBxzInQFBdTDdn1o+NIIhb2seac9RMGvM+4RuU0Tf6NB5vygu4bWPpYhqk01dTqNsny8KTnaX0Sgx7wpZGIRfVcmjqA/DZn/5YHVl2yXdSXUqMquDiwY02FRWfcx+l32qwVoTjpICA3ThPx0YnFtf0A/4ULESjSwhRo/YlyVrjCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A8jXyJS7ytmH5/XBXpphkF1YkVcw0HS9AdYZk3o55o0=;
 b=kLh/q/Qgsvv4Y8MthMKWTAnTFjC/E2fvhaAcHt52MmEgKgcCAKL1q1oeJvkN/esqFAd2cvEqEb+Fd1KwIE00RLvWvrooHgsygKLqOVMydkwKFbdhO6ITDfTzb6Bp/4+YUz/JfwTHRd9+r6uyvqJ0sMEdGtvcmC90dIn1ksogRtTpYQKwlE1lo8/25bMsx3++k7v8QWl1oDhAQTftBq8RjN6YMaO9q79Exw49NIGGT4YlmKDru/G6WjgVC9fD28G7oGgMiQklpOpW2MsXwFBD+qyKm4V2D3QXhFENHntOxF+nvF9fFqLqVzIPyUydOdJK+MaHUaX0slfE2TNXie1drQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A8jXyJS7ytmH5/XBXpphkF1YkVcw0HS9AdYZk3o55o0=;
 b=IsTovNZnwokPjjZ/2ipZfODjq/2N/Usom0mGt3ag1HzXK9LeUcXxEtpknrgEa0Zy7tCWcRMcsaWr2OczcPCb6Mxnfe1fNzYntJxQaFxIXgt0j6Xitl1sSG3W29zA2qsW14nvjus58vQnflhXF7lKLKiNyTTEcX7XB9t0w359gt8=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by BLAPR10MB5204.namprd10.prod.outlook.com (2603:10b6:208:328::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.22; Tue, 22 Jun
 2021 15:49:27 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::d875:3dd7:c053:6582]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::d875:3dd7:c053:6582%7]) with mapi id 15.20.4242.023; Tue, 22 Jun 2021
 15:49:27 +0000
From: Joao Martins <joao.m.martins@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC 4/6] i386/pc: Keep PCI 64-bit hole within usable IOVA space
Date: Tue, 22 Jun 2021 16:49:03 +0100
Message-Id: <20210622154905.30858-5-joao.m.martins@oracle.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210622154905.30858-1-joao.m.martins@oracle.com>
References: <20210622154905.30858-1-joao.m.martins@oracle.com>
Content-Type: text/plain
X-Originating-IP: [94.61.1.144]
X-ClientProxiedBy: LNXP265CA0007.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::19) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from paddy.uk.oracle.com (94.61.1.144) by
 LNXP265CA0007.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:5e::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.4242.16 via Frontend Transport; Tue, 22 Jun 2021 15:49:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 72c2d4d7-e74e-4148-1048-08d935955106
X-MS-TrafficTypeDiagnostic: BLAPR10MB5204:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BLAPR10MB5204DE4A67BEA297D35FA742BB099@BLAPR10MB5204.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:449;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iQFNYyjKZsTV7DkQudtSZSwCkNwmhTA56UQlpLKLOWXOJYEdrZ4u/ZasBrFy+HE+GaFD0voC04vGHNJvYfQh8VIhSNlVKthpH21XlAY2z7CPRdh9TX3qq3UhCuvunud7bVzSaENoeRpRGDCt63PnOqWYStJo2yNGMzzmlCTEWb0Dvn4hNFwx97hwd0rAJnLlgJpT/Zg1695P3lcvd1upRkHLm8qiuBjCmZIwjpd30HPx9EfApbBCnBcETYjv/rSI+d1aCLPQQFwD7k1F+1FGOJMRpThMaj7h7dJZ7zeY763wMbg4RIObqyl+g1Fbq6ArxvNMe0ZD7vyPlFSeG1CTYQIpblLHBBWDqdiAQGdoNY6Q6B+66HjAlWcH3kwWmRpi3+BrmWh8sue3fWzhlMlrLGQDpZOYXwx8+hwG7xQ9HPvrB6a4I6E6uN6klezC/kDJimxcITkp/kolBvBptV4CgHp+qp9RuzXkfh11bpsEex5ulMkmoAin2yDT6qLsAxhVj6W1tSbwK4p6CQEoPOTm8T7DNBcUtZvEYKZi7a74HA93Q1pxImGwd01dBZJEkDa73ENSJ4/8TwkDVSeUtkYwB4RR881nSM/dtRTsvSinWTEMjxi/XIgNDIE2bd0eWCnlsM6XzP1luJdV78ZXuuhjxtPRufkP9sozAZ7EOXZkXME=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(346002)(396003)(39860400002)(376002)(366004)(5660300002)(4326008)(8676002)(956004)(7696005)(1076003)(8936002)(52116002)(2616005)(83380400001)(6486002)(316002)(66556008)(2906002)(38350700002)(38100700002)(6666004)(66946007)(107886003)(86362001)(66476007)(36756003)(478600001)(54906003)(26005)(6916009)(103116003)(16526019)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?F96hziQtou+nDJyipOpMpQE7pMi6RZS4EJXC8F0llqWYYDZmhDv61Is4koQF?=
 =?us-ascii?Q?hcK89AVMiKoDxHD9IzeEMaTwM54DJsGdXX6y9kXYtT7jJYQ9fPoDza/+dCkl?=
 =?us-ascii?Q?mOqleb5mAStgFU0WgNjJlonw8X4gZ2cIRlNbO9VJwPdbLX6ZtIJ1hKFRmyNG?=
 =?us-ascii?Q?ZSDtjEnMq+ksVzc7LYMdKuNDaPYHvawsfL5DbvcDkh1zw6hgGzKeN/0z/B3c?=
 =?us-ascii?Q?Kt+CC6x+DMWVLkQhffm9v37p8scC2UGiaTuqHZUJHd9q1b40iMBC49uhHtQi?=
 =?us-ascii?Q?3iQ2HmX3U0W9fyCCBmZzS++qPtNfNXC/DjNKYJc+nJWvFV4RfT/wJo0fuTXg?=
 =?us-ascii?Q?mVXNLD6b8g9uMNvjjJMKOipF5eCENpWqfFP9a4JZeg6C0qNRmGz3M05jIA5Q?=
 =?us-ascii?Q?Wn04aMcvmiy7Gb2HFiqRYMJ1phZVjNELxBlEfaPNW5ciUrXNgm+aTRnpIUCY?=
 =?us-ascii?Q?YpXuJxKCMLCw7s4pkmkRB2fpUsDWT9aa1Cfac8i8CrOb6TW3726LlYBpjzaB?=
 =?us-ascii?Q?5ms7U9JLRPz7TW6FaWNdJN3nfhsI75KhS7sk+gUVsSSaSjK1ai8kKS64PPja?=
 =?us-ascii?Q?lBMBoKi3DFaDlxSISihCc5P+H2eqe7G23o6v+dK07fgpttCj++CmhORLhXpA?=
 =?us-ascii?Q?cF3Y18o74yJBEYUVzW7EfDzDeAT4bQ3/rxqTepvKBOvK8EShXs6Jhr1DQhGc?=
 =?us-ascii?Q?PYCRGOZ1sp9NdV1N+AYhBx4Z9aRPFzoRK19o3NEOUKZfN7z4lJaoPycxQIoh?=
 =?us-ascii?Q?3f7nyXJQq3vLokFGUQg49NWFoxoUGsZSRsSUjEvq+6F4l96UWP7KRoNaL383?=
 =?us-ascii?Q?JawpR4l6ZJRpRRfEBy9UNpC+wd9HR7g+LJjqknCzJVeFP6/yxvg5McpfidPI?=
 =?us-ascii?Q?m24JlMJN0bn2JKzR4/Jw/8t6QC7/CFJVDiYLUWiT6OQZEYgtEkifXSxpTx/f?=
 =?us-ascii?Q?3y2YoOLDf56+3LF36sS+YQxJKmu2NuYtWGCMO4TXQ45xmh37T7iMUymu7xO2?=
 =?us-ascii?Q?4fY0hNNYmTTexLqjw4Go3SNO62PkNfdmqvQBsrhBZ1f977erJtftQyUX6Wca?=
 =?us-ascii?Q?HTog+UGJYw93Vhw6ttQSpHJ0E8DxBAwunspLtAcCcarnYYKsTp5Od8uV6mwD?=
 =?us-ascii?Q?y+qDnfdegmhYlXrbvkDNYHkItUOMG9CvSWp6ZfUiXYgqLxM1qcsMd1xp/N/B?=
 =?us-ascii?Q?PnVNMc2lVCD2S1Bx71rDFFaCkHvO/G2dGiD461ZIUTw5jJFRUbjke5m4RUqV?=
 =?us-ascii?Q?UtWdi9JeC07/2sYAu4Qsamt67Rc5srRoq9cB+LnZO9Q/WyzKzFgGrg8qPmfe?=
 =?us-ascii?Q?nSzRm9XbEYNr9OZC4aI1xrbw?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72c2d4d7-e74e-4148-1048-08d935955106
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2021 15:49:27.7318 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ADFCp7t8PjfYoP84cCEVxwLGeBJXtNSblARsmFXLwFiNleK+Od+uP4nXais9F922zMitIcJwaYetY05WT3gzIfC3yR+zQtkxnQ0NkgYnvKQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5204
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10023
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0 mlxscore=0
 spamscore=0 mlxlogscore=999 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106220098
X-Proofpoint-ORIG-GUID: TuhGDVNhTtAiREJENS1y5Gpga1Z-Q8Qu
X-Proofpoint-GUID: TuhGDVNhTtAiREJENS1y5Gpga1Z-Q8Qu
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0b-00069f02.pphosted.com
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Daniel Jordan <daniel.m.jordan@oracle.com>,
 David Edmondson <david.edmondson@oracle.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

pci_memory initialized by q35 and i440fx is set to a range
of 0 .. UINT64_MAX, and as a consequence when ACPI and pci-host
pick the hole64_start it does not account for allowed IOVA ranges.

Rather than blindly returning, round up the hole64_start
value to the allowable IOVA range, such that it accounts for
the 1Tb hole *on AMD*. On Intel it returns the input value
for hole64 start.

Suggested-by: David Edmondson <david.edmondson@oracle.com>
Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
---
 hw/i386/pc.c         | 17 +++++++++++++++--
 hw/pci-host/i440fx.c |  4 +++-
 hw/pci-host/q35.c    |  4 +++-
 include/hw/i386/pc.h |  3 ++-
 4 files changed, 23 insertions(+), 5 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 2e2ea82a4661..65885cc16037 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1141,7 +1141,7 @@ void pc_memory_init(PCMachineState *pcms,
  * The 64bit pci hole starts after "above 4G RAM" and
  * potentially the space reserved for memory hotplug.
  */
-uint64_t pc_pci_hole64_start(void)
+uint64_t pc_pci_hole64_start(uint64_t size)
 {
     PCMachineState *pcms = PC_MACHINE(qdev_get_machine());
     PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
@@ -1155,12 +1155,25 @@ uint64_t pc_pci_hole64_start(void)
             hole64_start += memory_region_size(&ms->device_memory->mr);
         }
     } else {
-        hole64_start = 0x100000000ULL + x86ms->above_4g_mem_size;
+        if (!x86ms->above_1t_mem_size) {
+            hole64_start = 0x100000000ULL + x86ms->above_4g_mem_size;
+        } else {
+            hole64_start = x86ms->above_1t_maxram_start;
+        }
     }
+    hole64_start = allowed_round_up(hole64_start, size);
 
     return ROUND_UP(hole64_start, 1 * GiB);
 }
 
+uint64_t pc_pci_hole64_start_aligned(uint64_t start, uint64_t size)
+{
+    if (nb_iova_ranges == DEFAULT_NR_USABLE_IOVAS) {
+        return start;
+    }
+    return allowed_round_up(start, size);
+}
+
 DeviceState *pc_vga_init(ISABus *isa_bus, PCIBus *pci_bus)
 {
     DeviceState *dev = NULL;
diff --git a/hw/pci-host/i440fx.c b/hw/pci-host/i440fx.c
index 28c9bae89944..e8eaebfe1034 100644
--- a/hw/pci-host/i440fx.c
+++ b/hw/pci-host/i440fx.c
@@ -163,8 +163,10 @@ static uint64_t i440fx_pcihost_get_pci_hole64_start_value(Object *obj)
     pci_bus_get_w64_range(h->bus, &w64);
     value = range_is_empty(&w64) ? 0 : range_lob(&w64);
     if (!value && s->pci_hole64_fix) {
-        value = pc_pci_hole64_start();
+        value = pc_pci_hole64_start(s->pci_hole64_size);
     }
+    /* This returns @value when not on AMD */
+    value = pc_pci_hole64_start_aligned(value, s->pci_hole64_size);
     return value;
 }
 
diff --git a/hw/pci-host/q35.c b/hw/pci-host/q35.c
index 2eb729dff585..d556eb965ddb 100644
--- a/hw/pci-host/q35.c
+++ b/hw/pci-host/q35.c
@@ -126,8 +126,10 @@ static uint64_t q35_host_get_pci_hole64_start_value(Object *obj)
     pci_bus_get_w64_range(h->bus, &w64);
     value = range_is_empty(&w64) ? 0 : range_lob(&w64);
     if (!value && s->pci_hole64_fix) {
-        value = pc_pci_hole64_start();
+        value = pc_pci_hole64_start(s->mch.pci_hole64_size);
     }
+    /* This returns @value when not on AMD */
+    value = pc_pci_hole64_start_aligned(value, s->mch.pci_hole64_size);
     return value;
 }
 
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 73b8e2900c72..b924aef3a218 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -217,7 +217,8 @@ void pc_memory_init(PCMachineState *pcms,
                     MemoryRegion *system_memory,
                     MemoryRegion *rom_memory,
                     MemoryRegion **ram_memory);
-uint64_t pc_pci_hole64_start(void);
+uint64_t pc_pci_hole64_start(uint64_t size);
+uint64_t pc_pci_hole64_start_aligned(uint64_t value, uint64_t size);
 DeviceState *pc_vga_init(ISABus *isa_bus, PCIBus *pci_bus);
 void pc_basic_device_init(struct PCMachineState *pcms,
                           ISABus *isa_bus, qemu_irq *gsi,
-- 
2.17.1


