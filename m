Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 265024ACA77
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 21:31:57 +0100 (CET)
Received: from localhost ([::1]:44102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHAfz-0002iW-Vu
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 15:31:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1nHAZB-0004Q2-3t
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 15:24:53 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:34182)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1nHAZ8-0001uU-Nx
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 15:24:52 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 217IcxaW004446; 
 Mon, 7 Feb 2022 20:24:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=04jii+/F9ViBz/nWXpXXiMCbK6QHU4TjhoiyVXboTuE=;
 b=eFZSJx74S1oEbwkULIs5qAEBp7AP/ikdMDbhESZQupizwj0mzDSc3ibTOf5fbKxTEonM
 uOP6hIC3RnVw3JrbsE2972VH47/82ugEbfUnFcDxuvtglTqm1g800LD7CRZQjDYRNf/X
 ei+H9xlOymCiLveygc/qTakiyYzXnOKbend6sGqpffe0OVpCtBCYtH3qeEdaEirL9SLF
 Rx4EZIuOLhPVltNHknM7mdgbL5HbOKhJk+dc3wB32adpm9AQXEXP6oYarlIrpPMwpMm5
 I0JF9KXyUDr6nNOppi9ReCpQzG/gSOG+jyZmoPYk38j68FdiJKcS1c7taszdlH0trvxE UQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3e1g13qey3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 07 Feb 2022 20:24:45 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 217KLR5i194417;
 Mon, 7 Feb 2022 20:24:44 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2173.outbound.protection.outlook.com [104.47.55.173])
 by userp3020.oracle.com with ESMTP id 3e1jpp4hwm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 07 Feb 2022 20:24:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ForrVVk8/UusxBlCCyKVgdQfcrO6ubMaI1XmdPhB6cKnxQ3ekcf3kJg3hocGmk+RQPjfyFTolWI7jp90PoYs7M+/9uGbU9gdd4jI6AXiGcn0PLd+JbEXVED9H9ZlgWdZykWPDdkvQr0hv/duO0iZMoEj++heOoALruMBxt5kzq5j0yYTvG/mVxSzJNpGk12ICcCMpytW250tVPugpSu5Lo+CE0UYxtiIj3MVJA2kLu1F7R4Gw9ZeNmhUBMUeaQGEY5Uj/GyLj/uO2waVSkSc0nqyGkSHGSgFWXmoVMRV9AdcEdHn5rujwX3AA5DDA14m5pQNJ4f2ROAm+FIq0Ke/WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=04jii+/F9ViBz/nWXpXXiMCbK6QHU4TjhoiyVXboTuE=;
 b=LPdw2PNXERCK2mM3Q3kATCUPVd+x/mXrITl/rPleGOgsqHIkK9L5ifVkdssT5/D8ah1BG7jmGt1sTPOdBvl7Yq9A/5na1DUs02EudGEgCcEZtgMD6eJWsNxBtz66TvAEwFYi7xP/ZxXNb2jeBJ9gNXGcdm9cFd/9aHegMfiL2rR7MuHK8VB7UIqJ2LY3//ZfJqXkiTa3muPV2LHzO3i3KWwhJSap9e0xQR7WeFrVlTmRM2+DTOLhDcPRjNPBWKlbPV+aVP2EgCYOH30yAuTpagEKZlmnwr5f1h+sZf1dA0zCwC4P26ACRBTUbMEjgd9YhMRHA+Xd1sbYAOvtEUMDcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=04jii+/F9ViBz/nWXpXXiMCbK6QHU4TjhoiyVXboTuE=;
 b=hBcjPs0EdtuxqpPb0gvwzYJN25x3NHY+4yjXvbU2+t3eHX47SCgFO7V6zrpwAJnX0AmhSs8FliVffdHb2fg4L+G+KogVGlHSVPzIjtveOnVK5AHFlzoBM19TnihLtGVgNpcVafYpSkOXjbObU25owMP3dYs8Qu3xnqMrEctjbfg=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by BN6PR10MB1826.namprd10.prod.outlook.com (2603:10b6:404:fe::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.11; Mon, 7 Feb
 2022 20:24:42 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::4910:964a:4156:242a]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::4910:964a:4156:242a%4]) with mapi id 15.20.4951.019; Mon, 7 Feb 2022
 20:24:42 +0000
From: Joao Martins <joao.m.martins@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFCv2 2/4] i386/pc: relocate 4g start to 1T where applicable
Date: Mon,  7 Feb 2022 20:24:20 +0000
Message-Id: <20220207202422.31582-3-joao.m.martins@oracle.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220207202422.31582-1-joao.m.martins@oracle.com>
References: <20220207202422.31582-1-joao.m.martins@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0032.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ae::18) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 006be659-54a1-413f-0670-08d9ea77df92
X-MS-TrafficTypeDiagnostic: BN6PR10MB1826:EE_
X-Microsoft-Antispam-PRVS: <BN6PR10MB182601268DCF532B318B27F8BB2C9@BN6PR10MB1826.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6BTFD27RgAqTw3e+kHc4gO+3NIk5X6Hwlhe/Q72AbZqt6os6vzgeFu8MWwbv0FAk6EXVaHNt2+/0S/c5dRu3QGBAEtL/Kp9FuPI/AF0kDC8e/DqrI27WjwDPhTWuX4qIABPGNpheVDKWmgIKAaGuoDm27g8arGqFODq1uNTpGa/943bLznr+YDBrcESCKalnC5EGfEou2fUySUjONXJ5ImmVcMb/vYi6gaZOi/JcbioGFHx6lC4Yd3qWORzn2gAa6gFApV3Tv2EJXfkaTVA8xSTtEI/m/gmHANG6bXvXtKoedu1u6WCGze19W+ujG5PreX5g7WbFgd0+rsEqvOTCkR9j29YW1h8M2ycdpBMzrU/K/GKu3nuJVfk+SYeICZ2ssp5niXmPlNH/xrcekC8l8FGn7E5jAghNsQC0Vp2cX1w4QIVncJY13IxAW8/FNOi3BH0/1j466ahhwJa0nMLhBXB6JyRTpuCJsT7kh7PfjSjPTRtpA7kjVbY7fbImY220Fvwr6a2A/L1HT1rt/pqLLs3TXZVT4liqKCwB4Yy8JByioIE8seTnZzz7fBF7wtfs8UeekddAcjB3vloH82vcBVjWFkyc3rgPcosyN3tc+ffmTjnrZKyfLSEln61lKkr2dU7VoPlg8IznnK011mCoB60zYyqlEWJjxOtcz8ZDe3Hgpj7/JdDFbigxmOg4YWRTFpzzpMTl5ODM5QuHISzFyQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(1076003)(186003)(2906002)(26005)(54906003)(4326008)(6916009)(8936002)(8676002)(52116002)(66946007)(107886003)(66556008)(66476007)(316002)(36756003)(5660300002)(7416002)(83380400001)(2616005)(6506007)(38350700002)(38100700002)(6512007)(6666004)(86362001)(508600001)(103116003)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pB09Bhbndy7KQ31mIUe4J9nJBwQdYW2dbReBbSerZW9+MaJ8schXU7erZeSS?=
 =?us-ascii?Q?W8scb+BHHr5ZR7ksuzGFwSyMI+J3zS/cu3NobZD+fZthHPrJ+x8v5fvXts7p?=
 =?us-ascii?Q?tpY+zC0F/42PHnJCg783SXx35tV4XUGamZB7/1/Te8y0V4R9KKNbTxdcEo78?=
 =?us-ascii?Q?A1hsC6f6b/956dDwGfja6sUAk3A0mrldnvxqGrFlOgB4MPTbeBaAxAffkVd7?=
 =?us-ascii?Q?waXVuKvM3zGkSs6ioMjx1ibeLMjQZx4jOq07rE634r7WQ1LHjImZL2RM22IV?=
 =?us-ascii?Q?0CE16pokGHTQ1JTVlqtlBmZsUl1UYqVTRLii7Zd+eQDqPW9zAnI9r3FqH6PG?=
 =?us-ascii?Q?cR5jlhbFyJpVGkV3R2psMCxJEtoVhQm+SEMXVliXIMA1q/r7mOg7J28pBEBe?=
 =?us-ascii?Q?+roDJd/Cq5Va03reNc6kw4Ny7qjZUbEP/8jz0InHPaU+J7I/sSsh/nxh3ZO8?=
 =?us-ascii?Q?+4IzkzPo0jEDZsZsDf/wAisFirGOPoIYvUxbCUWwsGM0iOyXGqa4V1BF60ol?=
 =?us-ascii?Q?7+bWnshmKIACPd7sEjM03M4mXUdqT00mRGs42UMKwZ/9ekpAviDEGjYoHOb+?=
 =?us-ascii?Q?wRqsFoqDQ925VjT7Ti+Ep1hVo/QWYG6lRDucbcq0jksXt92bEgfg8Y0x6qSj?=
 =?us-ascii?Q?XcDfEeqUf22YjokbvN7O9UNv2gts0HC+xfNUddShTIhi4zOcjOfoeSHQTyHH?=
 =?us-ascii?Q?L+WIA2B78lI8NTeeQ/uMBPoJb9nrhW/XyVNs2qhrVDbW78l7He6qJKPAVgXF?=
 =?us-ascii?Q?UF5gD8ejUeU1n66IZQA+qGHxMaUW7ViFwBM5MHy5kkSS37YRhNU1nLdmXLcU?=
 =?us-ascii?Q?3tVM88PORKiTQBwyP59MgRCeJdrUh5YmlvS9eBwRUrGjR9k8w8BFPEGCY7u0?=
 =?us-ascii?Q?RR9+hZZd6NKr4IcNASs9iu33ZDwmqrJNnEoXerd4Ln+Kw6H4EdHaM4F6Kpl5?=
 =?us-ascii?Q?hueFemz5ESF1kCmYCtPo9/G/XYFShGt0G3nUBg3ovUFQSkVcxkuk5SFG7YHt?=
 =?us-ascii?Q?3i/LsY16XAsIrYwuCyeRr/dWx8ZUQhsBdCiQ23OaUazwRWPGTSCwoAyaGH2q?=
 =?us-ascii?Q?yIx+CP3jCCaTNFrsfpaUwXUGk+igF/2DHTBLFUFJ3QlCaxoP4IOcomCxj/jh?=
 =?us-ascii?Q?J1LzFbacxUyNvbC+LJJrE+BnBYTjL1tQDQITPzbMnGS/ouFd6C6lWUQLYF7v?=
 =?us-ascii?Q?zYk24qsbncFlZgNs0gcwphi19vh+HYpKZYU4GPE83mfEu603VjsGXZ7WSvqm?=
 =?us-ascii?Q?JjIXVQs8YhUzIymT3gTl2hNCUnr1v3PbPkMteY+fwiY9sYRubvfto3c5YR46?=
 =?us-ascii?Q?sJ16wP1TbNeY01iPeAvVxyqK3OUV9Pyym04meXh4VTb5W0Y7MLQ4XuyMEJpJ?=
 =?us-ascii?Q?YM9YwLsE3ihpp+N5U3AGoGdAY1lvZ5KEPN6O6HNyvIzNurWQ6KstUYyO0iVl?=
 =?us-ascii?Q?2YWj8exeHUlsj7Cevrz9IwPgogmD1UOuEa+vkt7MRaVlkxy681DuHLrU09gC?=
 =?us-ascii?Q?qcu19QSew6rOjwKA7zlOWH5Xbd0dgKXQi2uPGUaTmyey3b/oiR/gMQjCsX9d?=
 =?us-ascii?Q?/0e6ZlJMMwGKtD1gzA9QuKqCtua3+c5/EuErU+gdvm6ppIf2K4vvWum+dTxf?=
 =?us-ascii?Q?HtFpCiUT/UHCcQ4sXUOodQ3vAEy+t0XNqEqTmB8Lmbk4FjzBbCdt6/K7+xJA?=
 =?us-ascii?Q?Jh98YA=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 006be659-54a1-413f-0670-08d9ea77df92
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2022 20:24:42.4876 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JOmCiWCjHIF/CDH4bBDXrGAYXH6nEQli3fDWESTkn//VnlVJKhmPcy4Pt9bQ7Rj5npdDyJjDHE4MpLaNJZrxollZuys9amWYmZWbdhxKTGY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR10MB1826
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10251
 signatures=673430
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=953
 mlxscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 phishscore=0 adultscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202070119
X-Proofpoint-GUID: ax4YjLCQPt7ulcwCv1axqSwBFSCh2VCt
X-Proofpoint-ORIG-GUID: ax4YjLCQPt7ulcwCv1axqSwBFSCh2VCt
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

It is assumed that the whole GPA space is available to be DMA
addressable, within a given address space limit, expect for a
tiny region before the 4G. Since Linux v5.4, VFIO validates
whether the selected GPA is indeed valid i.e. not reserved by
IOMMU on behalf of some specific devices or platform-defined
restrictions, and thus failing the ioctl(VFIO_DMA_MAP) with
 -EINVAL.

AMD systems with an IOMMU are examples of such platforms and
particularly may only have these ranges as allowed:

	0000000000000000 - 00000000fedfffff (0      .. 3.982G)
	00000000fef00000 - 000000fcffffffff (3.983G .. 1011.9G)
	0000010000000000 - ffffffffffffffff (1Tb    .. 16Pb[*])

We already account for the 4G hole, albeit if the guest is big
enough we will fail to allocate a guest with  >1010G due to the
~12G hole at the 1Tb boundary, reserved for HyperTransport (HT).

[*] there is another reserved region unrelated to HT that exists
in the 256T boundaru in Fam 17h according to Errata #1286,
documeted also in "Open-Source Register Reference for AMD Family
17h Processors (PUB)"

When creating the region above 4G, take into account that on AMD
platforms the HyperTransport range is reserved and hence it
cannot be used either as GPAs. On those cases rather than
establishing the start of ram-above-4g to be 4G, relocate instead
to 1Tb. See AMD IOMMU spec, section 2.1.2 "IOMMU Logical
Topology", for more information on the underlying restriction of
IOVAs.

After accounting for the 1Tb hole on AMD hosts, mtree should
look like:

0000000000000000-000000007fffffff (prio 0, i/o):
	 alias ram-below-4g @pc.ram 0000000000000000-000000007fffffff
0000010000000000-000001ff7fffffff (prio 0, i/o):
	alias ram-above-4g @pc.ram 0000000080000000-000000ffffffffff

If the relocation is done, we also add the the reserved HT
e820 range as reserved.

Suggested-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
---
 hw/i386/pc.c      | 66 +++++++++++++++++++++++++++++++++++++++++++++++
 target/i386/cpu.h |  4 +++
 2 files changed, 70 insertions(+)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 7de0e87f4a3f..b060aedd38f3 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -802,6 +802,65 @@ void xen_load_linux(PCMachineState *pcms)
 #define PC_ROM_ALIGN       0x800
 #define PC_ROM_SIZE        (PC_ROM_MAX - PC_ROM_MIN_VGA)
 
+/*
+ * AMD systems with an IOMMU have an additional hole close to the
+ * 1Tb, which are special GPAs that cannot be DMA mapped. Depending
+ * on kernel version, VFIO may or may not let you DMA map those ranges.
+ * Starting Linux v5.4 we validate it, and can't create guests on AMD machines
+ * with certain memory sizes. It's also wrong to use those IOVA ranges
+ * in detriment of leading to IOMMU INVALID_DEVICE_REQUEST or worse.
+ * The ranges reserved for Hyper-Transport are:
+ *
+ * FD_0000_0000h - FF_FFFF_FFFFh
+ *
+ * The ranges represent the following:
+ *
+ * Base Address   Top Address  Use
+ *
+ * FD_0000_0000h FD_F7FF_FFFFh Reserved interrupt address space
+ * FD_F800_0000h FD_F8FF_FFFFh Interrupt/EOI IntCtl
+ * FD_F900_0000h FD_F90F_FFFFh Legacy PIC IACK
+ * FD_F910_0000h FD_F91F_FFFFh System Management
+ * FD_F920_0000h FD_FAFF_FFFFh Reserved Page Tables
+ * FD_FB00_0000h FD_FBFF_FFFFh Address Translation
+ * FD_FC00_0000h FD_FDFF_FFFFh I/O Space
+ * FD_FE00_0000h FD_FFFF_FFFFh Configuration
+ * FE_0000_0000h FE_1FFF_FFFFh Extended Configuration/Device Messages
+ * FE_2000_0000h FF_FFFF_FFFFh Reserved
+ *
+ * See AMD IOMMU spec, section 2.1.2 "IOMMU Logical Topology",
+ * Table 3: Special Address Controls (GPA) for more information.
+ */
+#define AMD_HT_START         0xfd00000000UL
+#define AMD_HT_END           0xffffffffffUL
+#define AMD_ABOVE_1TB_START  (AMD_HT_END + 1)
+#define AMD_HT_SIZE          (AMD_ABOVE_1TB_START - AMD_HT_START)
+
+static void relocate_4g(MachineState *machine, PCMachineState *pcms)
+{
+    PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
+    X86MachineState *x86ms = X86_MACHINE(pcms);
+    ram_addr_t device_mem_size = 0;
+    uint32_t eax, vendor[3];
+
+    host_cpuid(0x0, 0, &eax, &vendor[0], &vendor[2], &vendor[1]);
+    if (!IS_AMD_VENDOR(vendor)) {
+        return;
+    }
+
+    if (pcmc->has_reserved_memory &&
+       (machine->ram_size < machine->maxram_size)) {
+        device_mem_size = machine->maxram_size - machine->ram_size;
+    }
+
+    if ((x86ms->above_4g_mem_start + x86ms->above_4g_mem_size +
+         device_mem_size) < AMD_HT_START) {
+        return;
+    }
+
+    x86ms->above_4g_mem_start = AMD_ABOVE_1TB_START;
+}
+
 void pc_memory_init(PCMachineState *pcms,
                     MemoryRegion *system_memory,
                     MemoryRegion *rom_memory,
@@ -821,6 +880,8 @@ void pc_memory_init(PCMachineState *pcms,
 
     linux_boot = (machine->kernel_filename != NULL);
 
+    relocate_4g(machine, pcms);
+
     /*
      * Split single memory region and use aliases to address portions of it,
      * done for backwards compatibility with older qemus.
@@ -831,6 +892,11 @@ void pc_memory_init(PCMachineState *pcms,
                              0, x86ms->below_4g_mem_size);
     memory_region_add_subregion(system_memory, 0, ram_below_4g);
     e820_add_entry(0, x86ms->below_4g_mem_size, E820_RAM);
+
+    if (x86ms->above_4g_mem_start == AMD_ABOVE_1TB_START) {
+        e820_add_entry(AMD_HT_START, AMD_HT_SIZE, E820_RESERVED);
+    }
+
     if (x86ms->above_4g_mem_size > 0) {
         ram_above_4g = g_malloc(sizeof(*ram_above_4g));
         memory_region_init_alias(ram_above_4g, NULL, "ram-above-4g",
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 9911d7c8711b..1acebc569b02 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -906,6 +906,10 @@ typedef uint64_t FeatureWordArray[FEATURE_WORDS];
 #define IS_AMD_CPU(env) ((env)->cpuid_vendor1 == CPUID_VENDOR_AMD_1 && \
                          (env)->cpuid_vendor2 == CPUID_VENDOR_AMD_2 && \
                          (env)->cpuid_vendor3 == CPUID_VENDOR_AMD_3)
+#define IS_AMD_VENDOR(vendor) ((vendor[0]) == CPUID_VENDOR_AMD_1 && \
+                         (vendor[1]) == CPUID_VENDOR_AMD_2 && \
+                         (vendor[2]) == CPUID_VENDOR_AMD_3)
+
 
 #define CPUID_MWAIT_IBE     (1U << 1) /* Interrupts can exit capability */
 #define CPUID_MWAIT_EMX     (1U << 0) /* enumeration supported */
-- 
2.17.2


