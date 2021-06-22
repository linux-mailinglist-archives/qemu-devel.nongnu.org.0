Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDBC93B09DD
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 18:04:18 +0200 (CEST)
Received: from localhost ([::1]:59046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvisr-0002Z1-TJ
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 12:04:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1lviej-0007GA-99
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 11:49:41 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:14932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1lvieg-0005yK-TP
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 11:49:41 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15MFenH3028112; Tue, 22 Jun 2021 15:49:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=f/xt0ljVq8pvtd2l/69nZDzpauCZs89CE3N4cKACWsk=;
 b=ogrrR8Lwg1cca9rTMExwbEraaj5+XwPLsd8DrxV57ob5Dk17BbG7+/3pYH+m89ZAKnkj
 eB8O0UV/55DXNuLKXTxWUmUdtd2HAl22wtevOQ+LEAKh9Qnqk4sHdHjCtBwUtl7DiA1d
 HlPhhSKmyGV/OyV3C/qXoK76u2nE2r0pKJG0RWq/9xidTLnzP244fzjXj2fShVb2fjbO
 Z49fUe3G5CQV0BgIRAdmAwZlnO+6xAwgHFaIZX5A6L7F6ESOWJFCQtE5CgaBPJEvrGwt
 OdMoOWjoY/FoPW90cTRfwZSu2ti8pXfhrQp1h0DIJIEIgNPI0NV3iYBba2MBo7MSq8di mw== 
Received: from oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 39anpuuub4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 22 Jun 2021 15:49:34 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
 by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 15MFlM4L180321;
 Tue, 22 Jun 2021 15:49:33 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam08lp2041.outbound.protection.outlook.com [104.47.73.41])
 by aserp3030.oracle.com with ESMTP id 3996mdpsht-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 22 Jun 2021 15:49:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Eu252mIrRz1KmbifgDzUFDeJ0GZlI5WRX1HWk2si1qul4YmdqVw6R/KKWLVJnaBkO5/HK1k0tk4YIxX6qMU28yGJGENPk0h1z0ERNsET795Vb/sy4fAQ6PP17Y8Z1pEPRqddHbdsYfSUo0bZykZTlbmpPk/Xu5TVpTVdJhzlQR5piYfEvXiOz0+9FiEvq8+/noZ4hhfi3XWgPZh+4sq6UM9dTENXi91V3mzw7D1nvYnDALQwTvRcMf4DXQgRu+BaE4T39zPYvEkx/7fE9pLBE+4JHZfgdt4gx6ZMQc/5AQAhXj12JdjrFD16Zh8dFrjWPZeVHtlREfffcq+EhPsrew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f/xt0ljVq8pvtd2l/69nZDzpauCZs89CE3N4cKACWsk=;
 b=R9E/lvytY6yskdCnnW946D2sMX2vw+IzJI0G4KynS11BHfoJxgg7XA2m62CLh6zOnwtwN5Qh3SsapHEd1qtTnmmHnrKCQp0dzTWeNH0h7TvdHr1We8e5WRkhLyJMK2oXA28CHabObAHA7yijvXoZv6URZE3Tmqfpr4d10T5pueu8GaQeprPTzlNSOhnoR4JA3RQ2nloW4lKGGgdFwWRWWUIuWuzYZx45y/l4mVpC2F56lTgU4cViIAsjiqw9OQgC/3Bh9V+ZbcJQ7MGNjV3so0YTeU0LItn1/ZON1hZPOQJFvvFRMgkyTt8FN0Sgw43c7UwcP3dn6CiNI8qOPCohDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f/xt0ljVq8pvtd2l/69nZDzpauCZs89CE3N4cKACWsk=;
 b=kY8M7kLh+zTmWczSVdm37WqXQ7OLAvTzRnVxGFz4hEYQgkijaXPd0zjGP4+6Ck3WRsVI/QuaIRrm/AK0Zp4CmKEv0fg7yXOrN37VXajEImQCu5mkQ5n5H1nwHaS2T7HkxKQNlbZMpyN+ezacC388HHN3dj0MS09j4PtliAJ+4iU=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by BLAPR10MB5204.namprd10.prod.outlook.com (2603:10b6:208:328::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.22; Tue, 22 Jun
 2021 15:49:32 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::d875:3dd7:c053:6582]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::d875:3dd7:c053:6582%7]) with mapi id 15.20.4242.023; Tue, 22 Jun 2021
 15:49:31 +0000
From: Joao Martins <joao.m.martins@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC 6/6] i386/pc: Add a machine property for AMD-only
 enforcing of valid IOVAs
Date: Tue, 22 Jun 2021 16:49:05 +0100
Message-Id: <20210622154905.30858-7-joao.m.martins@oracle.com>
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
 15.20.4242.16 via Frontend Transport; Tue, 22 Jun 2021 15:49:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e77d6a2e-dd7a-4caa-dd8a-08d935955386
X-MS-TrafficTypeDiagnostic: BLAPR10MB5204:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BLAPR10MB5204AE7215BC502E2163460BBB099@BLAPR10MB5204.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:102;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QdipfF5TCNm90hqRBWQ3IZFmk6stbd+YNf7QCjaUbr11MBVsoIuowuLYIvH6TTwkUZue3Ke/lmTDFjAtSW+j+VWbjpt3wVgO6LClX6FUXrye9dYahY0Y2rGoZfABDH+L4H6LfM96ioWGNgWk/OtLqZvpzFrvqgvlSukdrywmSn5NIgjvtN5xb/PipvUpSyOcVSOE+X8Bh+cRShBHmtz3UiK4R8KGvfmNB9KrfJGXybZIY033byrApEXCdhqMBlNPf6C5UskB3pxQee1GDXlfD4O6ganW9NDtA7S9wbwvFZ1z0B6PVL8+NYokuPbhHC12HTrBy3fTdyatDcrEHEm0zMWkdRJvhE0E7wei5V1sKKvJUG5/kHPGLlp4YWHgoMzbW9oe2SEMuGGh0+cHhXhVZtAFhko9F+fZvS1zYkdh1zqxThJvPxob5fPwwu2D7ezTi8a6kP2cau8bwTx1prPy5DU5Xhg2WjEqhh0hM/KduBo9/9EXGQXu05aZxdYo7NDGpZhfz8kD0fXdwrIRyXL5ah+2bdSEcWFsNykCUfvAFHT8Kk3AFyxhV4vF4wiDZb+PzTovVtpE8xKCKwpMTYSZUzEPKCs9nIJEbnsu3uFbVohH930L07B5IJXXS9A6KLJiD0vZuBFnqqpZFbySaHIQAQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(346002)(396003)(39860400002)(376002)(366004)(5660300002)(4326008)(8676002)(956004)(7696005)(1076003)(8936002)(52116002)(2616005)(83380400001)(6486002)(316002)(66556008)(2906002)(38350700002)(38100700002)(6666004)(66946007)(107886003)(86362001)(66476007)(36756003)(478600001)(54906003)(26005)(6916009)(103116003)(16526019)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CEhyjGUAy7cpwoV9apMvq7Dq4UssBtuI3QJ/aRGKaMs+cJ5WnbRwZeuZztqh?=
 =?us-ascii?Q?0UhyzJ3+2EEo1aGhUbg2bx0LgbU1vXKNU3yPG7IPB7zcfaYjB0O2VzUbgvxV?=
 =?us-ascii?Q?mMqadFuAhaXVhmegcYWa6v2hyPb9BCOWHHjS+0MBsHTj9LjhrgYN90ZASxBu?=
 =?us-ascii?Q?vOZ2YpHhpOI6JvtOcYHWgSrzKWbfyPGDtrirlnTuaxuQwqveRwgns229ypkb?=
 =?us-ascii?Q?Uins+TNmZlUarWRpDnJTyf2MCOum/xAK/w5oRfwzNLyyE7CbAXiEupuykN0I?=
 =?us-ascii?Q?NVrmPaqE7j9Rw6IbOD0iOJlrW0kuSacl9+5GM7tagW/1GI9fGrQuJyK7WMtC?=
 =?us-ascii?Q?RCC4L1B3nH99UEREyhDT4TAiozPlcBYiytwEeRjZ/nB8pMaZ9Bm9FHMfKTXN?=
 =?us-ascii?Q?rPWtfoIdZBl79Pm3HYW/shVXzFgr9E1li3YJBXSQgPJOdXlxSbzeMZ/O57nQ?=
 =?us-ascii?Q?poJi8fdqgZeWZg3SCI2RlfVt9FAIXNfX+Klds+EXjwzY/uYrrPjLrZgWFhL2?=
 =?us-ascii?Q?+NXw4vPm1IZEfeR+1deUcVp1btkTDOzJwjT4UHSJz/jONtUes9UEWPk/6Q5x?=
 =?us-ascii?Q?aeVvpu16MNEUwvAM0eqEloPfxPEVsK7XgTPxBffFodJyc/l0CZN4QTqZCk1z?=
 =?us-ascii?Q?rWHc5LjEfwSo7JsmmLhmJ5S6TQT4jZkjLknv73kv75hf5xc7JZuPhAPb/9xa?=
 =?us-ascii?Q?RIEBI/m8AI/wSqvgSLhIiojkiwjZOyzTZ3ejcmWC2evDveYOpxAVkHd1vA7Q?=
 =?us-ascii?Q?TsMO4dmKQ54lOS3VDdeEfeFmiS0Y5uLBLLdJi77qjqMDrqq9nlavOrIYdp1M?=
 =?us-ascii?Q?HHJyWCX2gBpGT87+PdWl7qwgkzxGzpIYFK5Z/1wm35Isq+rLW6o0agGYSKlS?=
 =?us-ascii?Q?OFCWeGRl0XhlY97bdbSl6EyTC6vev+7Z9xa/IVKtJK8kDKhAaAZLfXgmw78D?=
 =?us-ascii?Q?Eiq7sIKNzBTIe00ea/3WwsbV7j9AR7QOHEAbTK+WnsVlxxm+F8jGCTfBKpTk?=
 =?us-ascii?Q?gGhDhHe2Z6uiyzMv94eQvbCwfUW3IIL09L5oyRapTzjIBoqcSLzKwDNzS9hr?=
 =?us-ascii?Q?ZHtt2bbWZ1JILPvg/H29L8sFLyj5rw3XYpCvUuUeQ/pIWXuH5Gir1QE8xbVL?=
 =?us-ascii?Q?I7bi3nmuQoAFMbuQykfHloRRtl3Taio6RnndSLwgGwXSisxtjRNHzeYKbbxm?=
 =?us-ascii?Q?9bM55jvzW5a5t/m8Ax4Du35Nj6omoBVp/A8D91poNMVOo6tPupiMx+ibRufM?=
 =?us-ascii?Q?0SF80aCGFm8vP49AyaxPloiFuEij3SeXCZNM8/drBVSMIqi/+OtmgSe2o3NN?=
 =?us-ascii?Q?eujcR4u7r7jtgA9QQejj6fYw?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e77d6a2e-dd7a-4caa-dd8a-08d935955386
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2021 15:49:31.9085 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 38XtuTpwgaGEJJ5l4Sg3wv0yxvUoyi9vVnNl86SVYdkEZEidZmf+R3CqgeVgO0cMtx8vrOJbJAuo0vu08pIOUlC1SWycNmNN38ik4RpHmEo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5204
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10023
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 mlxscore=0 mlxlogscore=999 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106220098
X-Proofpoint-GUID: ypLOdJBI4MRf9yq_6c8BzKqkdBHfEBT6
X-Proofpoint-ORIG-GUID: ypLOdJBI4MRf9yq_6c8BzKqkdBHfEBT6
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0a-00069f02.pphosted.com
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

The added enforcing is only relevant in the case of AMD where the range
right before the 1TB is restricted and cannot be DMA mapped by the
kernel consequently leading to IOMMU INVALID_DEVICE_REQUEST or possibly
other kinds of IOMMU events in the AMD IOMMU.

Although, there's a case where it may make sense to disable the IOVA
relocation/validation when migrating from a non-valid-IOVA-aware qemu to
one that supports it.

Relocating RAM regions to after the 1Tb hole has consequences for guest
ABI because we are changing the memory mapping, and thus it may make
sense to allow admin to disable the validation (e.g. upon migration) to
either 1) Fail early when the VFIO DMA_MAP ioctl fails thus preventing
the migration to happen 'gracefully' or 2) allow booting a guest
unchanged from source host without risking changing the PCI mmio hole64
or other things we consider in the valid IOVA range changing underneath
the guest.

Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
---
 hw/i386/pc.c         | 29 +++++++++++++++++++++++++++--
 hw/i386/pc_piix.c    |  2 ++
 hw/i386/pc_q35.c     |  2 ++
 include/hw/i386/pc.h |  2 ++
 4 files changed, 33 insertions(+), 2 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 65885cc16037..eb08a6d1a2b9 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -902,10 +902,14 @@ struct GPARange usable_iova_ranges[] = {
 
  uint32_t nb_iova_ranges = DEFAULT_NR_USABLE_IOVAS;
 
-static void init_usable_iova_ranges(void)
+static void init_usable_iova_ranges(PCMachineClass *pcmc)
 {
     uint32_t eax, vendor[3];
 
+    if (!pcmc->enforce_valid_iova) {
+        return;
+    }
+
     host_cpuid(0x0, 0, &eax, &vendor[0], &vendor[2], &vendor[1]);
     if (IS_AMD_VENDOR(vendor)) {
         usable_iova_ranges[0].end = AMD_MAX_PHYSADDR_BELOW_1TB;
@@ -1000,7 +1004,7 @@ void pc_memory_init(PCMachineState *pcms,
     assert(machine->ram_size == x86ms->below_4g_mem_size +
                                 x86ms->above_4g_mem_size);
 
-    init_usable_iova_ranges();
+    init_usable_iova_ranges(pcmc);
 
     linux_boot = (machine->kernel_filename != NULL);
 
@@ -1685,6 +1689,23 @@ static void pc_machine_set_hpet(Object *obj, bool value, Error **errp)
     pcms->hpet_enabled = value;
 }
 
+static bool pc_machine_get_enforce_valid_iova(Object *obj, Error **errp)
+{
+    PCMachineState *pcms = PC_MACHINE(obj);
+    PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
+
+    return pcmc->enforce_valid_iova;
+}
+
+static void pc_machine_set_enforce_valid_iova(Object *obj, bool value,
+                                                  Error **errp)
+{
+    PCMachineState *pcms = PC_MACHINE(obj);
+    PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
+
+    pcmc->enforce_valid_iova = value;
+}
+
 static void pc_machine_get_max_ram_below_4g(Object *obj, Visitor *v,
                                             const char *name, void *opaque,
                                             Error **errp)
@@ -1851,6 +1872,7 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
     pcmc->has_reserved_memory = true;
     pcmc->kvmclock_enabled = true;
     pcmc->enforce_aligned_dimm = true;
+    pcmc->enforce_valid_iova = true;
     /* BIOS ACPI tables: 128K. Other BIOS datastructures: less than 4K reported
      * to be used at the moment, 32K should be enough for a while.  */
     pcmc->acpi_data_size = 0x20000 + 0x8000;
@@ -1913,6 +1935,9 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
         NULL, NULL);
     object_class_property_set_description(oc, PC_MACHINE_MAX_FW_SIZE,
         "Maximum combined firmware size");
+
+    object_class_property_add_bool(oc, PC_MACHINE_ENFORCE_VALID_IOVA,
+        pc_machine_get_enforce_valid_iova, pc_machine_set_enforce_valid_iova);
 }
 
 static const TypeInfo pc_machine_info = {
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 30b8bd6ea92d..21a08e2f6a4c 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -427,11 +427,13 @@ DEFINE_I440FX_MACHINE(v6_1, "pc-i440fx-6.1", NULL,
 
 static void pc_i440fx_6_0_machine_options(MachineClass *m)
 {
+    PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
     pc_i440fx_6_1_machine_options(m);
     m->alias = NULL;
     m->is_default = false;
     compat_props_add(m->compat_props, hw_compat_6_0, hw_compat_6_0_len);
     compat_props_add(m->compat_props, pc_compat_6_0, pc_compat_6_0_len);
+    pcmc->enforce_valid_iova = false;
 }
 
 DEFINE_I440FX_MACHINE(v6_0, "pc-i440fx-6.0", NULL,
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 46a0f196f413..80bb89a9bae1 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -357,10 +357,12 @@ DEFINE_Q35_MACHINE(v6_1, "pc-q35-6.1", NULL,
 
 static void pc_q35_6_0_machine_options(MachineClass *m)
 {
+    PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
     pc_q35_6_1_machine_options(m);
     m->alias = NULL;
     compat_props_add(m->compat_props, hw_compat_6_0, hw_compat_6_0_len);
     compat_props_add(m->compat_props, pc_compat_6_0, pc_compat_6_0_len);
+    pcmc->enforce_valid_iova = false;
 }
 
 DEFINE_Q35_MACHINE(v6_0, "pc-q35-6.0", NULL,
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index b924aef3a218..7337f6f2d014 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -63,6 +63,7 @@ typedef struct PCMachineState {
 #define PC_MACHINE_SATA             "sata"
 #define PC_MACHINE_PIT              "pit"
 #define PC_MACHINE_MAX_FW_SIZE      "max-fw-size"
+#define PC_MACHINE_ENFORCE_VALID_IOVA  "enforce-valid-iova"
 /**
  * PCMachineClass:
  *
@@ -113,6 +114,7 @@ struct PCMachineClass {
     bool has_reserved_memory;
     bool enforce_aligned_dimm;
     bool broken_reserved_end;
+    bool enforce_valid_iova;
 
     /* generate legacy CPU hotplug AML */
     bool legacy_cpu_hotplug;
-- 
2.17.1


