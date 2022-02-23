Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1344C1B36
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 19:56:38 +0100 (CET)
Received: from localhost ([::1]:41310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMwoX-0001fM-9d
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 13:56:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1nMwe6-00030X-7l
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 13:45:50 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:64054)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1nMwe3-0008E8-Kh
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 13:45:49 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21NIDsLh001897; 
 Wed, 23 Feb 2022 18:45:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=ZrZvUmqa5K7bLhDaPLAGhqgKckpZ7KlJEO3ZCnriE1U=;
 b=Fk7WW/jAc/jDpttTlGNGEAhOqV8e1K1U13ZgwdW0G+WRPsV162Q614hkpDh10KYeJkyr
 VbljPxVgPuqSIg4KxcZA6AAhHN0VJ8V81eH74U44AUIj0VkBwENQLNjhROYjGyJpcW9x
 FO5+nir0EY6cPTbslwr5+U8PK3i4ZY+fQIXOMY2KH0ZFbDWzI55OsUzbTSTL6Z/Vv+hf
 V56o9WMBP/t4awSgbVR8xuEgVM9VlRQrXC3zouQj7Iuy2lSck3sm4JCJ/19SDA5Xce01
 oGL3WMXsYA1jl65Fe3STuj3UpXopZOQmUywVRnxSsWSs26oxqwh9FakTK5zCzQ28/yJ0 sg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ecv6ew162-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 23 Feb 2022 18:45:43 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21NIam9J147039;
 Wed, 23 Feb 2022 18:45:41 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2106.outbound.protection.outlook.com [104.47.58.106])
 by userp3020.oracle.com with ESMTP id 3eat0pxvr8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 23 Feb 2022 18:45:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oZ8tYjiK8vEtVNOiv9eGr8WPuW8sYu52kH7M6jvZdYjA8VMVhng/uclZHk7HUOtxvzrFmAuuSXq9ZWL+cDyud0OmizJvwHuDaxPxe6si4cdLDOkSH1iB6+0svPe3Pjba15e7D64RdxdfXYiJmoT1t49oDn96OYFHlrPob9AHKtyoqoglTE6BuDjyTwJ+pxM8RXvqz9FjO55iaOTRLRyttQwubMYz54OhaiU6+9zUAJS1p/UbsD3Ls32PTkpotD5pzmk2Sulx0DC3UoATsq+OCkLgQ6j+uCmxApmpafi6GH672DuSXemgMo1Ujlw7c38z1XD06i24lluzNFPUGdTXHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZrZvUmqa5K7bLhDaPLAGhqgKckpZ7KlJEO3ZCnriE1U=;
 b=VQz3Y7ObuKCH4tp2vL0xLRdiA5DEX56yHpYp2U+CM4m+WefeTVwai4pCRRG+FSS16bjp7VZDhg5z1qDFDcIF6sJ5rvTtnKw1J6XnWk/MGvMddRq4pk2blwJK7SYMIIG7Z3ELN/PYTxx/cboeR7KXHUKtfTIy0CD9BmwK9Y2/b6NJ+5w/sWJXQngaKDkL+SIeRLBhyQBWRq7BXHE/7xD7o7Ml/cbTqzJqh+g+SmBw/X81uXkHj7e1R+QMK7GVsUHCdgMrMFDGDq0sKOYR2MZC26tlvAlyv6mmOOjsM/hK/s0UNISdggN++4suyj2w3/RPdun5/VcmPEYbZRjH6uMwiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZrZvUmqa5K7bLhDaPLAGhqgKckpZ7KlJEO3ZCnriE1U=;
 b=MjI35gwD1+sbdRTYwQwEEtwJVzmyvHCE8DS3/AEKigLV2hLrNvakRDa/n5mfbZEEBleLNV/jRnnJdd9S4S70GMBs8cNCn2nmlOCuevWUg/E3by9GUqpkUQ0yawx0VPsz0upiYezgH5AANz9KWegLzPwig8VLCc2wKYKOMnvBW4A=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by MN2PR10MB4144.namprd10.prod.outlook.com (2603:10b6:208:1d6::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Wed, 23 Feb
 2022 18:45:40 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::750f:bf1d:1599:3406]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::750f:bf1d:1599:3406%6]) with mapi id 15.20.5017.024; Wed, 23 Feb 2022
 18:45:39 +0000
From: Joao Martins <joao.m.martins@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 5/6] i386/pc: warn if phys-bits is too low
Date: Wed, 23 Feb 2022 18:44:54 +0000
Message-Id: <20220223184455.9057-6-joao.m.martins@oracle.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220223184455.9057-1-joao.m.martins@oracle.com>
References: <20220223184455.9057-1-joao.m.martins@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0332.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18c::13) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a9d11232-de74-4cd9-1331-08d9f6fcb013
X-MS-TrafficTypeDiagnostic: MN2PR10MB4144:EE_
X-Microsoft-Antispam-PRVS: <MN2PR10MB4144DD04DFB05B85E0A30CBABB3C9@MN2PR10MB4144.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: w9GkXHB7RBTOwaLV/JC8wGRk9JPKJa1N0NH1IcVHQUS7vmT8jzxORuMJFD826t62TlP9DZbadUgUn5B1dwLiXBcxNpli4BvVMv0EXDguHgKoOwiZIw5Norotjo/X5QMkCT9wBgUWIRiCu4a29e++r+iGlSXV0h7JzwB70GoT4kB1KXFThWv98fdgM+KcRyVysqA3la0Ywd/G9CIZ1AGwjPKajMbITsLuuq26xe7HY8/rxrujT8v565dH3DohfxNUPMdS1Femy+oCJtPQ27R5Vd/dk/ZcPXdYRInk3ZvvcMqQFu7gp0fk3zAbGIT8eHpoz3oxVLNtAetI5Fl09jNkIAfF+CkYCMk072BWgMdwsIPAZ18b3YcybKHUJL/um+ra0wa9Idu0n9cC9hgKkHBtHiDt5IDCGGcMdTBKoNvxuVMJpAJxQRL8DzxSCvsWqDLHpIzmI6q+eCz+dsRCy5twmFX8BLHeZRdS9NLdO7VZsxn5rwGh9J0Xzs3VSW6eoe7AHclF6EgMeEZNMb686m4Lw8n8Aiu88O+yOXGaacg3pq9uY7P1f97QIpiI05fxtndCDQvEr2vYxQGpRVZxlwCQJaYze8IiZCDLwmRI3gnJ4xZp7IIcTi1zxO5rCcoHnhtGRPTvznjK8IRpvahRYPgODAe4zKrobjW/eLtm39/8alvWyOyWwd5xkqu4oHgJc27GjsSAI4+bG8QNpvnck1TBsw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6512007)(6506007)(6666004)(66476007)(66556008)(66946007)(83380400001)(4326008)(6486002)(103116003)(36756003)(316002)(2616005)(7416002)(86362001)(38100700002)(38350700002)(8676002)(8936002)(54906003)(6916009)(107886003)(1076003)(186003)(26005)(52116002)(508600001)(5660300002)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7NX0HTK23B49iqBwlbW6Ver0jbU0nxU14RG58J5l50/Xm8zXJ2fU11KFmmdK?=
 =?us-ascii?Q?B3bed4rWAfcMqYo/Vl1YqNWjb3WybPfEdynzDZlgNgw1NpotNlIg46w6g2rh?=
 =?us-ascii?Q?UW6nXGOrzQNVfB6z0AQ3Q3GTnoxzQn5LDg4Ixuurs/U/yjIFfU4UxAFxM3qq?=
 =?us-ascii?Q?WlnjZdxz4eZIXpJyXy1UGMMkwQrGRYpndciT4dSqXGbisSoJFQbZJ+JZ+AII?=
 =?us-ascii?Q?g6MEY5j04QFxun3j3RTwIpjddGr0AFwe3oG9susRoGCShI7a0Ku9AOUs3xaz?=
 =?us-ascii?Q?VHSo5+pxIHB+kW4qLtVl4cNJaafk96LKrlQd6wOCOSz36qgUBoBaxrpgB+VI?=
 =?us-ascii?Q?0TA/IJyIvmZoBNwSzetJy3K0a7e6VQEUZX/jak+IkGVLvEt0qYqlMtbLSy9v?=
 =?us-ascii?Q?CixmRFFEfwyk5/bum8jaGa7K3sn5opJMkQGST451s/vDpwRevWloZCU4BnLS?=
 =?us-ascii?Q?o5dBKXLTY4eWhBqIN6c+wRQSxVstx2kp+f9r2T8or8mqc4xZfPGaBy8Sclkv?=
 =?us-ascii?Q?ly1fIMaW1QrCMJ9kHi9iHClKgxj4ysL6a6E4vthobmtuhOcq2T0+g192foMm?=
 =?us-ascii?Q?f6C2TUy36WgG/F/KZoDATHHZGhfdwl1sftise+16tnTqQQWDThecklDN1kbr?=
 =?us-ascii?Q?puyOnN2HKRBVuFaeHZzABAVmXGVZaAF2ETEV+uV5iVS/tn/17MGoFA0MIzkI?=
 =?us-ascii?Q?rVYUaVOIiSCiDYk/1jkoB+pgDUEUE2eNRlzuVjFiQj0swcSVMXfzrT7cDjMY?=
 =?us-ascii?Q?2qLMzqIlU6ATfvgAiqTYGv9+9RtR6rfdvqKG63FSDkHnXiqGHB5dmpda5+eu?=
 =?us-ascii?Q?CGjSgKQ5TxWsf8nRenTYE3frYYjZVhjpRj6E5v+FKwfT+QKeDqRqNjXP9+Ei?=
 =?us-ascii?Q?58J2r6YvCcycJK8iDiiC0z2INac0bGZT4NyHZWHopPgfYxk/sWs0r2ku9aDq?=
 =?us-ascii?Q?9t5pz0udJPaL7CYc6moVI1iy2NfEsz/44RSkik7xZhrtYQXeQaDd35EUuUvQ?=
 =?us-ascii?Q?2GvR2z5jAMa3FK0L7MqFdFNs1+k7BTrJzxjXtCYkF7vf99ucv/0iVt6dmSCz?=
 =?us-ascii?Q?/i73LMvQtbrLczHbSO47n1K5KzttBPC5ow6jKPYPl25vuM+ReSny9gvT3BXY?=
 =?us-ascii?Q?GFnnBuoS+/muThEbWiKE/Z4n94kqMwFr1G53Gtr2MUSqRgMhar+gw9TLWaCy?=
 =?us-ascii?Q?gY3KaqgAvdeytoM7xgUwr0VFh2GeVmY7eKKG8GwwAQJsWTdIjrMyi3yVDvE2?=
 =?us-ascii?Q?08eeDEPoGbSzJrlH235/QWu+RfaTxoGkK9RhNeDNCmSYsRZn+9kuT77KwLBv?=
 =?us-ascii?Q?p2eXlOKJV+ebV4f1rOxbhzolF1sJ85gqjSBbPv3S7VpjVI8pMPtcZDO1RiiP?=
 =?us-ascii?Q?HM5m6lPQ/rEjrWCTmx9i0hLiKSgt6n3jRsNT8QIXZnSwxeWW42RPYDkZ+63Q?=
 =?us-ascii?Q?/QqGArbzLbngeqeMo5dY5HMSPn76zwqVS7DNQB3Ri1YQluqDDrMKmtabcW2d?=
 =?us-ascii?Q?Hn55TFgmsivJNgw5j0uxMFfOg4xt+rL19E011Q4Uc0Iu0y5e1UJfmW0gYVJI?=
 =?us-ascii?Q?qEl80GR/F6KAVsebzroK/SArSdHKgZ3FrFFOEdhB8asrsFgS3Xn/bbT+gX6l?=
 =?us-ascii?Q?59v6QlcmU66/chrOz3H9zcEj29s8tg+li5UJqkV6xESBw3mQJXu8Qf4ygETh?=
 =?us-ascii?Q?W0Vg1A=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9d11232-de74-4cd9-1331-08d9f6fcb013
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2022 18:45:39.8847 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3wAWGragCswHeQw+3Pu15yn20scW0qLt8wFDRTVZFdr2Kxl8GLkJBymKUn+g/Ghlx9c6+mnRlHmqwjkrWsOVIYw3BzY5n+aCHipmEj3FL4E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4144
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10267
 signatures=681306
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0 spamscore=0
 mlxscore=0 adultscore=0 mlxlogscore=999 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202230106
X-Proofpoint-GUID: XGMmqNa3VzADPDGOb8jyCaOKwsxYOBRE
X-Proofpoint-ORIG-GUID: XGMmqNa3VzADPDGOb8jyCaOKwsxYOBRE
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0b-00069f02.pphosted.com
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
 hw/i386/pc.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 6e4f5c87a2e5..11598a0a39e4 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -888,6 +888,7 @@ void pc_memory_init(PCMachineState *pcms,
     MachineClass *mc = MACHINE_GET_CLASS(machine);
     PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
     X86MachineState *x86ms = X86_MACHINE(pcms);
+    hwaddr maxphysaddr, maxusedaddr;
 
     assert(machine->ram_size == x86ms->below_4g_mem_size +
                                 x86ms->above_4g_mem_size);
@@ -896,6 +897,15 @@ void pc_memory_init(PCMachineState *pcms,
 
     x86_update_above_4g_mem_start(pcms, pci_hole64_size);
 
+    maxphysaddr = ((hwaddr)1 << X86_CPU(first_cpu)->phys_bits) - 1;
+    maxusedaddr = x86_max_phys_addr(pcms, pci_hole64_size);
+    if (maxphysaddr < maxusedaddr) {
+        warn_report("Address space above 4G at %"PRIx64"-%"PRIx64
+                    " phys-bits too low (%u)",
+                    x86ms->above_4g_mem_start, maxusedaddr,
+                    X86_CPU(first_cpu)->phys_bits);
+    }
+
     /*
      * Split single memory region and use aliases to address portions of it,
      * done for backwards compatibility with older qemus.
-- 
2.17.2


