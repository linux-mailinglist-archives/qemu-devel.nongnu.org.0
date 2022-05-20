Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E8B952EA5A
	for <lists+qemu-devel@lfdr.de>; Fri, 20 May 2022 12:55:33 +0200 (CEST)
Received: from localhost ([::1]:59056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ns0I8-00087p-M0
	for lists+qemu-devel@lfdr.de; Fri, 20 May 2022 06:55:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1ns097-00018I-72
 for qemu-devel@nongnu.org; Fri, 20 May 2022 06:46:15 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:7512)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1ns092-000214-2w
 for qemu-devel@nongnu.org; Fri, 20 May 2022 06:46:11 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24K9bgXj029971;
 Fri, 20 May 2022 10:46:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=Z7IBsIPj5o8BUaxgeeVlo0NXGwPTAuzxcMT4gxlgJ0U=;
 b=aus4dPH0x833zjlaQPXmUy00MjZxOyRkC0We5jCYmvTe/7uRCaOLodGoSwVXyIiMZ7qJ
 fwr2vkYLZE5hch0LlJJ/fkfqIkKMbkDcGNz8KT+DkYkUYS27Brd5S1fzj3bHD9EW5HO6
 4XaN6qxUWJ6jtj48v/rt3EIEvfVxXMqXpyQM4u6r1Tp2CYIHv9wGGcx0RHbWLBqBFq9l
 h2Tod9uBFTv3Y2/1VrNszDCUL1z/XaJ+fqcH++o0rl2v5JrDDdDLrm0nVWXfUrBeAjQh
 qVCmfZZke+u5N/KHgb5a0TVDS7qOetXdogpv09/mSZmZN3L1rJlR06zMhjOTfz+DgxFq Ng== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3g2310xqce-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 20 May 2022 10:46:01 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 24KAjeDk036160; Fri, 20 May 2022 10:45:59 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2104.outbound.protection.outlook.com [104.47.70.104])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3g22v5x1rc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 20 May 2022 10:45:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ETDXgrATgslQDwND4/2NxgJAAGSeDJSvYAAYAeGj8CiKYYNipf1sVMfENpa0deAk3KsVjVu/kVy9NPOeRD5QnxX9msVvrRmtLr6YoPovR8J7qHsZs2ErdGRRB4zed1FA5m+mBSby7Wdo/M+LW8TEjfBlft+MzbE9mkXxypJCe2PGIJnOV9pHzX92xEBgZT8pRI0iCV7l24pUlJvS+VsqUeKQdCg4SlUSe+3rSyQihmf5lW7AYCtMVjESsaDgFbWjvJRXjCF0cmUzS9sMIk0/M6JrRDIvvLs0EiIosnrZ2/wAZf0uiG9VSs7BfUrTAZHB69wPEbHf6BBUfCNjrIMVEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z7IBsIPj5o8BUaxgeeVlo0NXGwPTAuzxcMT4gxlgJ0U=;
 b=E8Ft71Y9asrC5mxtZ43OtO0bMrdQivGWZsWI+sX2Ep+JGl9fQb/CJTxc/2sAefpjfGgQBrs1btkSCyV8SJKDtZxgzujmI7fmS7P2PUX1UX2iOTxqV0VkAzvzg27YlNk0Bb72vhzUKDjv2Qb+XUsszSE9f2y67u12VLqQ3Q3RMYBV9nZpQfxRMaF6Rts+c69s1FkWmyGLCy2CD0nPXMLTL57DILsm7ty4Pty7QimpsOWVazHZFjc7QPNe/U0W9NGanvIsK13BsGCLnBvjk2iaDut3qFx3eMRqqwSsqWJU+CFiCIGdoN2sKZ3WUD6VM5mdntOYliF2YjWyrtjKl1otVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z7IBsIPj5o8BUaxgeeVlo0NXGwPTAuzxcMT4gxlgJ0U=;
 b=bZE4hbUEpOmPVH+n9mQAkraff7U0suh82VjZc28lKoGt+0cjFjl9wJXOAdcNL7hHFrIM+ByeqKyNJkNoIzAnmUiUAthNduGBUTdl39pdvGlFUgxLWd8c/Y+11nAJs3nsr9q5NcaGXBhBt8AKlPWCQjNtAZE3rE/VZ9+1Ef3P25A=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by BN6PR10MB1378.namprd10.prod.outlook.com (2603:10b6:404:44::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.16; Fri, 20 May
 2022 10:45:58 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::b9e5:d1b6:b4be:f9d]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::b9e5:d1b6:b4be:f9d%5]) with mapi id 15.20.5273.018; Fri, 20 May 2022
 10:45:58 +0000
From: Joao Martins <joao.m.martins@oracle.com>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Daniel Jordan <daniel.m.jordan@oracle.com>,
 David Edmondson <david.edmondson@oracle.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Joao Martins <joao.m.martins@oracle.com>
Subject: [PATCH v5 2/5] i386/pc: create pci-host qdev prior to pc_memory_init()
Date: Fri, 20 May 2022 11:45:29 +0100
Message-Id: <20220520104532.9816-3-joao.m.martins@oracle.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220520104532.9816-1-joao.m.martins@oracle.com>
References: <20220520104532.9816-1-joao.m.martins@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0392.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:f::20) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 96d440c9-e4bb-4bcc-fa62-08da3a4dec68
X-MS-TrafficTypeDiagnostic: BN6PR10MB1378:EE_
X-Microsoft-Antispam-PRVS: <BN6PR10MB13780C185805E8C068180241BBD39@BN6PR10MB1378.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kV4RAuGo/nQ1z1owy7WIwWwuygHTN2lLn3sNwsJJbJyXgFbIRcR8OpGrZLvKyqiHUxGxGnF3LsN8veoEbbzmyT+gYpDnvXok+oRZUnjuKgvSSP6LqP2Jml1Ve8nKZDsYHamOi9Q38I6pF3RRT1cCjSaqDSgrO6Y+19TPPwll4yCShryxTzsWDNUhVPVr0VnHiok1lfXlfu/T9jZDfbrIBO0x5mZSTImqUuyU29zEeqiskTJ4UN/y6RFeyyAsW2NdlIEBWfif4sfO+76UfPbQXU9eDfQSAOH591b0o2PmBjSrRSH3pbuirBX29XUxtK4vp4KXVdPEseMGGjty4CSB4eZtGsHJwua6pWvAbQXKVuzShAgBx5FbRt8GGDIqohXTk/8neZynZAzCZjNkuV8DCzxZYPYMDzuQ9sfrC4/6u2UnKXKF2TCdUzgfasvjHcsSwVUu6WhnzmKIrCOFloyFMu5ouWwqCZC4vWgnkcl1vhRvVLwr+PadXWJgfOrETlpKkgGdYO4+ClXjmH5CQ08LrkPtxhkyMTArdqL125txgmfJWTtWlA/v0nOOHbenBlVCPtTh2N3jCZxs/eNt2qBmQ09NVbob/LQrHYFv+msBYpWiLKMG2oQUy50m/4Okp4n1Rv7m1vi91/GM/lowFHppRTp/aRSOQo+Z7Rvs0xc+J12UydmrWbOvKXLlnF6ku20bazgFTHdCNxdZ86o1QCv+4w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(5660300002)(8936002)(66946007)(6666004)(7416002)(83380400001)(508600001)(66476007)(54906003)(6916009)(66556008)(6512007)(8676002)(6506007)(4326008)(26005)(52116002)(2616005)(38350700002)(38100700002)(86362001)(316002)(186003)(1076003)(107886003)(103116003)(2906002)(6486002)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UbPn6Xxn48gP4Ugzat+X+PZKJuSUlzjkSKTjw1rGKsmcuDc4oABb24Gb0KXg?=
 =?us-ascii?Q?Qf7YBeBc4jPlCUl2wsPbQCjw3C1oQopnNBHr9WKknK32zC7FJZ/ZYbclPYY9?=
 =?us-ascii?Q?vT/Dy+oZCBHrF+TWkF68pFEGZzGa0YdknHQbRyKRGYUSsdG7X1pXdZCKEPHI?=
 =?us-ascii?Q?aGmMAexZ/afsEHbkZnkCHXx0+LI9AU6CdMfkgy2nDMT0C3UZzmGkVzcc2uge?=
 =?us-ascii?Q?KlBxVgxgir7w/7E7ZMsznT/Q3lsL++cjsvXOpIBt/STrmVRDwWAarW5O2FHs?=
 =?us-ascii?Q?DJ4q3f46F2N9na5kqotRESZKp73sQ2Od/eha8qkdM1AiCKYCNuJburv+3a+7?=
 =?us-ascii?Q?W1CFtD6l6uYfIqsXyiaU+lMEcDPvR7kyjviKGbwXniwo2U85m7Il3WgHCeVT?=
 =?us-ascii?Q?vHPJ6AOGh0uoS0K3iL0WhdDmgNa2QpMI9BgXMRLWNg3O4nVoLyoxfTy40LPB?=
 =?us-ascii?Q?4dlIttAe+3J4nTAEHbOEYPCg/5kiyISnBbF/E3v/hPE9SMOvNMHdNDosgUxc?=
 =?us-ascii?Q?2/bZh5Ysq5eBXpwvhhYvK94mzBaimfje6qxyNdyid6sL4d0pDSkJA+JohBVv?=
 =?us-ascii?Q?4rOedIKDDLG8Upxc0q+OVABcPUvpgh2T2F5Y4oBnrZeXzahMUPaV5h8QI6D6?=
 =?us-ascii?Q?z2BEqxCBVMEp5kWFZGsLY77kkyzQPxQGXKZ5xYUB1xXp7FYvZWuJkLtcCyys?=
 =?us-ascii?Q?5WdjO5OGphxcAehR4sYdPXySeMBWJqKmt8r13mbzE/f/fiP26xBhEHVVaDwX?=
 =?us-ascii?Q?Ei5YObxSGEvpyQSRMgBytWdjy70j/u5dlaARJDyrmjOPrzTht58vlKET4Ez3?=
 =?us-ascii?Q?DtZwAC6W11U5Bv1Urnr2UMqH0chpiXGVBp0+Bxppqnh//lxB+dBoh1ppmslO?=
 =?us-ascii?Q?hRwgxmlXqwqxyYMcW79Ov74KtjfScy1cbEZdQfFCU81AMi3GY10SegS0yniV?=
 =?us-ascii?Q?c+aVKQplSRrDP6yMhloo/+HMQ4BiCT1DBAhP/hVEaEXEjGcCryj+hk0FG+a+?=
 =?us-ascii?Q?E71cYoWwmUwmeYQBUVQyi7jZOSXQ3JKuAkiN0zgqJ/HNppc6IXP21SQq5fLm?=
 =?us-ascii?Q?AMXnIivUO996MciH0L0SdkFx+oDLrCxgIP07Hj4j3v4E3gQ6ScTxyuJ9c21+?=
 =?us-ascii?Q?PfECZ20wWCcgiwb9CZMTHy1ghXxPpDYlbwlgqfcYWWD+kBcg1UhlfIUjoYbk?=
 =?us-ascii?Q?wSHZvbxJ8YWl7YYLPwuSvhCmBPX69lG3xphvqZL5nADaYhfT1gki3dKRxpEt?=
 =?us-ascii?Q?90CJAEaYVXod7d1GOp7+ElrX069PHOogyiUphTTwSuI2DQf3Kpi0WbAiE6DR?=
 =?us-ascii?Q?kv8VHPAS57XBz0Fksbv4xjawVI4xiHgMnw7a/9IU4GZhhWbbGFUjREeJnxXj?=
 =?us-ascii?Q?1SlH93Gxss3B+Af74dBmlSwuqqgWpRf1+BpSJQn95GsA5hwmfTYifET7aeZX?=
 =?us-ascii?Q?9Ne46W31hm8ubFQQwLtOr6hqTqrcAJjezs0U/cApPHOQA7m442hZRv0hITXv?=
 =?us-ascii?Q?IGM99o+LRbZDiFGDQjerA/OkSdI7Ox5Goue8QxALDbgr4U1zejaBIfSJMVEo?=
 =?us-ascii?Q?dIOI1ZbmoPSE6+Rup7qDiN8Ty4mOSE4fQjZKc7aBdYltQhxeNIGsZLBhKVJW?=
 =?us-ascii?Q?1Je510oy3BH3E3W63RbL0457jIsLfu/bts+ZDEyJ+uqJTtdd/gZRnX8+brJX?=
 =?us-ascii?Q?2HDIJyNvG7eKrTGFt8D6wMrMvXQ0SdFNtAXlvGh0Ah/KPZ52gbAOZlJjcId8?=
 =?us-ascii?Q?qa5Dsge7RcWtOwsIzp/oPPpaBK7ENRQ=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96d440c9-e4bb-4bcc-fa62-08da3a4dec68
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2022 10:45:58.1416 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B8iZU9gflKuKiAcZsGIWmihP5wV9PrKkYjnb7sVDyqWbUDuyaN3E0vh9OXiKeDYtfJFL/f/kR8YC5qCBN3zQnmOtSSt2DhwEhgsOc0EIoDE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR10MB1378
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.874
 definitions=2022-05-20_03:2022-05-20,
 2022-05-20 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxscore=0 suspectscore=0
 phishscore=0 bulkscore=0 adultscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205200079
X-Proofpoint-ORIG-GUID: itT1dO8unF15JQmVh_NrDzUoDZ4GfbCG
X-Proofpoint-GUID: itT1dO8unF15JQmVh_NrDzUoDZ4GfbCG
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

At the start of pc_memory_init() we usually pass a range of
0..UINT64_MAX as pci_memory, when really its 2G (i440fx) or
32G (q35). To get the real user value, we need to get pci-host
passed property for default pci_hole64_size. Thus to get that,
create the qdev prior to memory init to better make estimations
on max used/phys addr.

This is in preparation to determine that host-phys-bits are
enough and also for pci-hole64-size to be considered to relocate
ram-above-4g to be at 1T (on AMD platforms).

Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
---
 hw/i386/pc_piix.c            | 5 ++++-
 hw/i386/pc_q35.c             | 6 +++---
 hw/pci-host/i440fx.c         | 3 +--
 include/hw/pci-host/i440fx.h | 2 +-
 4 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 578e537b3525..12d4a279c793 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -91,6 +91,7 @@ static void pc_init1(MachineState *machine,
     MemoryRegion *pci_memory;
     MemoryRegion *rom_memory;
     ram_addr_t lowmem;
+    DeviceState *i440fx_dev;
 
     /*
      * Calculate ram split, for memory below and above 4G.  It's a bit
@@ -164,9 +165,11 @@ static void pc_init1(MachineState *machine,
         pci_memory = g_new(MemoryRegion, 1);
         memory_region_init(pci_memory, NULL, "pci", UINT64_MAX);
         rom_memory = pci_memory;
+        i440fx_dev = qdev_new(host_type);
     } else {
         pci_memory = NULL;
         rom_memory = system_memory;
+        i440fx_dev = NULL;
     }
 
     pc_guest_info_init(pcms);
@@ -199,7 +202,7 @@ static void pc_init1(MachineState *machine,
 
         pci_bus = i440fx_init(host_type,
                               pci_type,
-                              &i440fx_state,
+                              i440fx_dev, &i440fx_state,
                               system_memory, system_io, machine->ram_size,
                               x86ms->below_4g_mem_size,
                               x86ms->above_4g_mem_size,
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 42eb8b97079a..8d867bdb274a 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -203,12 +203,12 @@ static void pc_q35_init(MachineState *machine)
                             pcms->smbios_entry_point_type);
     }
 
-    /* allocate ram and load rom/bios */
-    pc_memory_init(pcms, get_system_memory(), rom_memory, &ram_memory);
-
     /* create pci host bus */
     q35_host = Q35_HOST_DEVICE(qdev_new(TYPE_Q35_HOST_DEVICE));
 
+    /* allocate ram and load rom/bios */
+    pc_memory_init(pcms, get_system_memory(), rom_memory, &ram_memory);
+
     object_property_add_child(qdev_get_machine(), "q35", OBJECT(q35_host));
     object_property_set_link(OBJECT(q35_host), MCH_HOST_PROP_RAM_MEM,
                              OBJECT(ram_memory), NULL);
diff --git a/hw/pci-host/i440fx.c b/hw/pci-host/i440fx.c
index e08716142b6e..5c1bab5c58ed 100644
--- a/hw/pci-host/i440fx.c
+++ b/hw/pci-host/i440fx.c
@@ -238,6 +238,7 @@ static void i440fx_realize(PCIDevice *dev, Error **errp)
 }
 
 PCIBus *i440fx_init(const char *host_type, const char *pci_type,
+                    DeviceState *dev,
                     PCII440FXState **pi440fx_state,
                     MemoryRegion *address_space_mem,
                     MemoryRegion *address_space_io,
@@ -247,7 +248,6 @@ PCIBus *i440fx_init(const char *host_type, const char *pci_type,
                     MemoryRegion *pci_address_space,
                     MemoryRegion *ram_memory)
 {
-    DeviceState *dev;
     PCIBus *b;
     PCIDevice *d;
     PCIHostState *s;
@@ -255,7 +255,6 @@ PCIBus *i440fx_init(const char *host_type, const char *pci_type,
     unsigned i;
     I440FXState *i440fx;
 
-    dev = qdev_new(host_type);
     s = PCI_HOST_BRIDGE(dev);
     b = pci_root_bus_new(dev, NULL, pci_address_space,
                          address_space_io, 0, TYPE_PCI_BUS);
diff --git a/include/hw/pci-host/i440fx.h b/include/hw/pci-host/i440fx.h
index f068aaba8fda..c4710445e30a 100644
--- a/include/hw/pci-host/i440fx.h
+++ b/include/hw/pci-host/i440fx.h
@@ -36,7 +36,7 @@ struct PCII440FXState {
 #define TYPE_IGD_PASSTHROUGH_I440FX_PCI_DEVICE "igd-passthrough-i440FX"
 
 PCIBus *i440fx_init(const char *host_type, const char *pci_type,
-                    PCII440FXState **pi440fx_state,
+                    DeviceState *dev, PCII440FXState **pi440fx_state,
                     MemoryRegion *address_space_mem,
                     MemoryRegion *address_space_io,
                     ram_addr_t ram_size,
-- 
2.17.2


