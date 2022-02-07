Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5B84ACA71
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 21:28:52 +0100 (CET)
Received: from localhost ([::1]:38586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHAd1-0007Ic-BT
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 15:28:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1nHAZE-0004U0-5h
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 15:24:56 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:30662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1nHAZB-0001uf-TF
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 15:24:55 -0500
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 217Iti11008244; 
 Mon, 7 Feb 2022 20:24:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=aWfCcMprSwC9iidqyB8XW4PBGTOmS4Gt7lBo8Y4r90A=;
 b=ptaZOl2PljwcH4v4u+sz521Wf4X3ZEq5YGAVoj9JwfSg16a9kJr5U3SufoMjf9Bp3VLv
 9zMXGDQKZMdKNpupCvfR1OsPAPxuySO56lPWAwlMiiGLcclDoHSvatNdBcmbe+d3oUV8
 bHJQx9QPR1WEHHY3qs+9L4lXH1zXQ5Kli2C/5/mQ9r2qv8nrFKYdD3x5nbql+7TkPd1v
 f4bLh7cdVXhjE1Gw+sBh9h2JAXGxK3hG2q4qppW1nr98cseiGtje29PyP/NMNaqFDCM1
 C7VS7k7rYmPe46EoFiFd4wEv6+rqifgknhsYCot6ClCRBjiGzzNH6/uiIHrTkBO2X4H2 Cg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3e1fu2qdks-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 07 Feb 2022 20:24:48 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 217KK11a024569;
 Mon, 7 Feb 2022 20:24:47 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2104.outbound.protection.outlook.com [104.47.58.104])
 by aserp3030.oracle.com with ESMTP id 3e1f9dxjbc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 07 Feb 2022 20:24:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D21mFq7hVCEjUNqs/YUuHxbK2yqsj2TEZc/uLo/hxjnS44M0r2DccvoNYnSYqcgbQwz0ItXi53y6JREgHVuF5C6MoUtmOisruwKjKRAeKpByzZFWtAjDc0+URtS+8PyAqVoAF8oh60FV3Zxx0iFQrkUEJ1BwdDnAdKU4+0wECD7MikKCR2A+eGaYmW2Y4VuDuFiLNA0D2XjUqI6uij+wKTbLb2SvH0+RIJyfoVtBeEbzX0FuHBM3wvQ38Ki6ZV7j5YKQkpwuiuRsEcbf/fbGYUs54RnYCNZGMKJembSwAp3lyTK0sXiQkl0MxxjmEIZoGTCPlBJWrUoL4xsPg2Zcaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aWfCcMprSwC9iidqyB8XW4PBGTOmS4Gt7lBo8Y4r90A=;
 b=lfTGlDCWQ2I76ZUfwWxc1hqonOhignU91lECXhCyrQrKIMRefCSy4Yd17QDifdPb6iSa8ESLhPbVdjG+qUZfuUYyE59YP5S01HeFFtII18LkgWmna23BRLDakoqy+ICEpdVhV7DPNocAdqfQM2SZfHNciYWLFHN7FRsEinIjoRVrUfmZead0fXsiP7QKCr3iD0OzaJH1A9v4h2fmhettowZAuw8CHCrBgR9q99idnD454jpyN7U0GYOyRuM5D0B/ywxX9RxtVwg2yFBsG/8QhtZ6dLVpnYSDfc45rGyHuNaHeA7v3s6/P7RYzJ6rQMpqFBRdvjuAxhmS2B89Y0pq8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aWfCcMprSwC9iidqyB8XW4PBGTOmS4Gt7lBo8Y4r90A=;
 b=JR0ariLbq+XxvukO0DZb8Q3LJEtffAFNRhQRTmcgfnUj4jGz4l7RU4ISOLFkA8cy02B60No199gE31tdbivf6n2Bnt9L44YnFUQvD7kkZomM4JXcI/G52kN+KcxwuybOyufrQRN6fsLfl0n2/HVu+uTVyqYcEBHhXJvfb9P8O0E=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by BN8PR10MB3649.namprd10.prod.outlook.com (2603:10b6:408:b1::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Mon, 7 Feb
 2022 20:24:45 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::4910:964a:4156:242a]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::4910:964a:4156:242a%4]) with mapi id 15.20.4951.019; Mon, 7 Feb 2022
 20:24:45 +0000
From: Joao Martins <joao.m.martins@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFCv2 3/4] i386/pc: warn if phys-bits is too low
Date: Mon,  7 Feb 2022 20:24:21 +0000
Message-Id: <20220207202422.31582-4-joao.m.martins@oracle.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220207202422.31582-1-joao.m.martins@oracle.com>
References: <20220207202422.31582-1-joao.m.martins@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0032.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ae::18) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d845299f-71dd-4f54-9eb2-08d9ea77e12e
X-MS-TrafficTypeDiagnostic: BN8PR10MB3649:EE_
X-Microsoft-Antispam-PRVS: <BN8PR10MB3649068003547DDCAD538EA5BB2C9@BN8PR10MB3649.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pwN3yfNgyQzeDgNOM3EtvFPcFYqg/7ydFoJdezsyyE1z0KLTUgU3GQt4Wkpcp5TOlDlNFBpwHrHGRG14QUahg1AXIXjlG31NxV7uVhroKBXyflZBUnuqVfkiPJOZE7lfUa7yQzBv8HA9f5A4btqSAxTlMpDsjhAhXrKh+6Zcg+CJBBeGR5+DB1JQBpiB97kg20fU+cZ2ogGNd8tTVGzjQtyw95lrRJkLHrc5Dps241Re0Tkq0qa/RXQ3JllU2RLR0j+YvDzLHjAhNy/KEM77mQYYl5oKdc+sP04e6GLhzpCxUngWKxnHpPH/EXsis0xi0lr6mYXq3jYJ4+3wrCzTcKtTvYNrT5L6eErW3wPDBjE01qQnep3S3wL9iThC8gh491W8yUqrvSMCE24RVTuWzSvIQUmLAEYeuVGOuh3z0s5dpoQFmwa1skm7Ce0Lm9qhLbw4K6pgOp0TRUvfjKq1l3UaY5m5tmdqHI+Vd/NGGFJ1JkTHimzaOErRMRApbvRtVDE/9XL5NTtOFdXB1g4R72V2UfE2BFynNGFcZlCMJIUEd3E3Lz72KCPOGFPbDSMfMPCL4Z7t1EJV8xGKfSKG+mhXmsY5f1vkBz6KbW+1rQk8YUW0mFY22VpoSqiZga4K/T022mxgEzAOILio3DkXrvJjV8OEeKDZrFTgPqmiZLcRXResCpEui6+ur4nU+QIL53MTypJ9WNxQ9CG1NR5Ezw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(107886003)(2906002)(26005)(1076003)(186003)(6916009)(54906003)(2616005)(7416002)(316002)(6486002)(508600001)(36756003)(103116003)(86362001)(52116002)(38100700002)(6666004)(38350700002)(66946007)(4326008)(6512007)(66556008)(83380400001)(5660300002)(8936002)(8676002)(66476007)(6506007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jU+odBRO5hnZCkakBzKyaBxiC/zaqpxdwgUenBJA8RQFuhdrQ5Nh5GAWe0lh?=
 =?us-ascii?Q?iWs6NLPOnYX7kcgiSVi8ahNOlQdlrRMSMx7TXV1eXRGfVG8+zu3BBlnmnsFn?=
 =?us-ascii?Q?D4dPAmKhZuxcmI3Uc/AbyPXvKVcoe3UujUcsmdCmYZOmbGHp1CEz1W/T/OV2?=
 =?us-ascii?Q?IwvE12zX9mlc6x+L4tfxShydBrQHSl9vP/UGW1rqgjYkNSgxxdHPlAh0CBZp?=
 =?us-ascii?Q?azzvicEgI0J4rEwQHS4FHizW9RhzrK+ChDrnNmHZgMoYiwJleH/Ux7hjnNDI?=
 =?us-ascii?Q?Ny5dG9PCjXlPoqj2UUncc1vJytouTmfXD108ucLMyHY2SifQVlnyLxWtPqfI?=
 =?us-ascii?Q?sQjijDgH4dO0wH0byAvW2ww6aFGDlJfWOg7RCpn0nemoiA4gWwmOr6dlIEGP?=
 =?us-ascii?Q?uRDEiXm/lYL4PhpRK6dXLVRDuMj5GXr4LrIY8JqR9KBaet0AZdTzCf8p8qsM?=
 =?us-ascii?Q?2Q0Ws6ud3cFiTzYcKoVDnVKkX+D87F1RuOT/E2uW1YTHL9KaVkk9kviuqNAR?=
 =?us-ascii?Q?k1Eb6BBYRDklP2E+jsGLjvRkYbnrp0l/hd80/+c0rXSHxdG3GEjRa8nbqxDc?=
 =?us-ascii?Q?bWR84eYdQmiwFyCQCJHLac1nFnheg+52FLkuWNNfwWqw53fe2ztlRV1qqI19?=
 =?us-ascii?Q?9pMy5tGDWJKw/9HFkLO6IG5ADwT9/t8CalZ2z0XeZmVs8PuZhXWrJ3ZJhF3u?=
 =?us-ascii?Q?3y9JKusvPqjIf4CpgPZV8+IOHuR/MqVECnYzwRVMbMuBmAL/e+qy/R5sdP97?=
 =?us-ascii?Q?L64zo7l2A3w+i3lBfaiUwuu/68Qr1zH/itXth6ll6sAxmwzxUiNoefKx8cSf?=
 =?us-ascii?Q?Kp1Lc92P6cfl1sBvZv+1NesViQ7vSLr59T7kD3UkHIY6Qnioo2l4iPlQ/7HH?=
 =?us-ascii?Q?3UzN+HaT9Iu9eVswI/D5l467LpCWM5DQuFsyW7BxCIQFaOZtR+CU3pcfbtYg?=
 =?us-ascii?Q?w8aNC21q2oSXs3OgsOqFeALL5tvdZeUyAKPQehtoC/3ZbxFrzhyuDJ6usVIc?=
 =?us-ascii?Q?2JVGHaaREjBqGIfFP+8SQMzD/U5SZMXRHXnHROyoQ7FjiCV7q2HVjggF+IGO?=
 =?us-ascii?Q?dq8L2/UW0oySKgNkRUqC8OL4Akz4oDo3TBACBToPn17MGw5Vbi0zsYJm3kfK?=
 =?us-ascii?Q?HJYOgnjv5N6oiSEjoszDtjG5tcowFkn+Otg5+jjy+bbKlr8lMFGTZ7MgVHjJ?=
 =?us-ascii?Q?bFTFn4wD0wI79dRBorgKxc6tmk8sLHkWtPY0MQmIK6JaogDdM7deEeoNIMK/?=
 =?us-ascii?Q?1WAeiND4fHInDTlxks7MZ1h7YbGDXFX9Ht8VeWrcGJ+Viqy8ms2goYDBxtB9?=
 =?us-ascii?Q?ELZdi+o/zeU4BBtMUEFodqFkERN+zVfzCbvHyHtQS5Z6YNhSSAI2U9DqKEN3?=
 =?us-ascii?Q?NcPjrX+Dsx8KNiyrSbzCMmvrc81kZUtmjNNeh5ke1q2OC9gLazzgFk2W1Qhc?=
 =?us-ascii?Q?pnSrmkN635v3V684h5QGyIV+47wNRf6+/ywnDNwoN2fSGy/8pL3HPscbI2fd?=
 =?us-ascii?Q?c+Z/p07EvvgGtCeB5H2clmZxxEqcJB2/Ga5smV7x7SWQKUzL0C4gwbgdqRPk?=
 =?us-ascii?Q?WKB3QL7G7kJfuVVqLwDCXu5zg1D8+jsGCn0B0vHTic4NcPI/dvVUhlUzM4AK?=
 =?us-ascii?Q?CDjNSn76dewiTTiwKeJKS91BOV5V5B5zn2kRmnnVt1ublJ9NM3rjfnakyt1V?=
 =?us-ascii?Q?0bIhrQ=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d845299f-71dd-4f54-9eb2-08d9ea77e12e
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2022 20:24:45.1447 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FLggf0mmkQSYR0N7jkKz5CcGedNTNsO8pfFdXbPR4chMJJCY86mJ2ZKX8aSOl/xAzAW9OBqwdbW8FFA8+xMfVBHpRS+GFlkBK2cbK036g8o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR10MB3649
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10251
 signatures=673430
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 spamscore=0 adultscore=0
 mlxlogscore=999 suspectscore=0 mlxscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202070119
X-Proofpoint-ORIG-GUID: WeTXRKMkz14IkGWlOguYBnH7IFK2J2eD
X-Proofpoint-GUID: WeTXRKMkz14IkGWlOguYBnH7IFK2J2eD
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0a-00069f02.pphosted.com
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Daniel Jordan <daniel.m.jordan@oracle.com>,
 David Edmondson <david.edmondson@oracle.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>, Joao Martins <joao.m.martins@oracle.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Default phys-bits on Qemu is TCG_PHYS_BITS (40) which is enough
to address 1Tb (0xff ffff ffff). On AMD platforms, if a
ram-above-4g relocation happens and the CPU wasn't configured
with a big enough phys-bits, warn the user. There isn't a
catastrophic failure exactly, the guest will still boot, but
most likely won't be able to use more than ~4G of RAM.

Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
---
 hw/i386/pc.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index b060aedd38f3..f8712eb8427e 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -842,6 +842,7 @@ static void relocate_4g(MachineState *machine, PCMachineState *pcms)
     X86MachineState *x86ms = X86_MACHINE(pcms);
     ram_addr_t device_mem_size = 0;
     uint32_t eax, vendor[3];
+    hwaddr maxphysaddr;
 
     host_cpuid(0x0, 0, &eax, &vendor[0], &vendor[2], &vendor[1]);
     if (!IS_AMD_VENDOR(vendor)) {
@@ -858,6 +859,12 @@ static void relocate_4g(MachineState *machine, PCMachineState *pcms)
         return;
     }
 
+    maxphysaddr = ((hwaddr)1 << X86_CPU(first_cpu)->phys_bits) - 1;
+    if (maxphysaddr < AMD_ABOVE_1TB_START)
+        warn_report("Relocated RAM above 4G to start at %lu "
+                    "phys-bits too low (%u)",
+                    AMD_ABOVE_1TB_START, X86_CPU(first_cpu)->phys_bits);
+
     x86ms->above_4g_mem_start = AMD_ABOVE_1TB_START;
 }
 
-- 
2.17.2


