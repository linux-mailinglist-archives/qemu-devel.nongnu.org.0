Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9744C1B23
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 19:53:28 +0100 (CET)
Received: from localhost ([::1]:34250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMwlR-0005BN-B8
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 13:53:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1nMwe1-0002sP-4p
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 13:45:46 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:55256)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1nMwdy-0008DV-VW
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 13:45:44 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21NIDolU020630; 
 Wed, 23 Feb 2022 18:45:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=67e4JTXeAvQrX49awy6nYJ+P+TFmfefA27+jMjd3Vcw=;
 b=JQqUilaZbMEps6UAevNnnkpyKBz8N16beJamWsT10rjB9plj2+Km2ltmggPaJRqBQour
 5UunRVtsU5sfCDQsT3Lzd/1DJBF1LP+4LWbztO8OlH01b31uEcmQT0GALcdrMo99sq7F
 +iRT7J6rz1TJNz4yPyr5qtPL6A7FKVQ4hG1jd2VQLWKFC13yfLLVJqS70N0FpdRZKPnR
 oVEJ09RvKZ022RlVGijDaNpTPsGKs6/h80A876+sHZzIS+8sLvziCowdYt2RLFq6368V
 Ao+bQOI0V+grpp29VkBNnNm0TwBy7uNcBnoi0CQTDhSwanEOPOWL2C798Cml0KAauRRi tA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ecvar4tgt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 23 Feb 2022 18:45:39 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21NIaVMr114448;
 Wed, 23 Feb 2022 18:45:39 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2104.outbound.protection.outlook.com [104.47.58.104])
 by aserp3020.oracle.com with ESMTP id 3eb482umu5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 23 Feb 2022 18:45:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EGogsoSgXVP509I4cl+wUeKdt2/0KAT1/U/vY3nI5GXPV6XqXWk4TrdpICnNYwWQYapdH9VSk6sKvjqafOP8HRFiT9Cp1Q5DNFtPZksUoN3Z7izF7fCVZNWic3uem6YZC9L6mLSFGCNnISA7Z0yGbQ3d9+lsxK1N7h1A0yrUbFdisllblMKLL+tofNBFucVU+k0LT6esKXj3pPEqRBmH81x+W0lg3Z4SloqvPmdUahLGrSrbKkEQhBnxaXSFhLn612shifOHyrMLuvMcUH6lXVWsPSH/xwDAvYeLFtTaSOVhvJVVAX7sWw+qtRrE6XfLjbWAgw1Cj62//wjn7WIMRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=67e4JTXeAvQrX49awy6nYJ+P+TFmfefA27+jMjd3Vcw=;
 b=CSp/B50FGsgjK7pspkc8C6KBCGyP9v6NMeX3dC9ZIWhWet3zdTJvMI1iX1v0QwnoYqAYR26Bq5Y0BdwhPcnK5ZaajDLcbY6NaKRPelIdvY1d2HGv+kJNRKQ8Lv24N/sN8I0A+ZqDpvntSzl6l0M9/KP5AegVunrzcZbbMd5YzJKgjOPQ4yXfG50pxoKtNO8Qdodqd+MqiKvXaB8DVhjF3+0xaMNRwXx3X5bl+pEiVQgiLE7Xw12I0031l//5JITiy4seAMtaau6XgexMQUciwbjXggBqCHl8ljoiBPqEISD/N+Rmjz5FUfY2QEkNeDNHdBmqXYYFWgPFz5kyiymMMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=67e4JTXeAvQrX49awy6nYJ+P+TFmfefA27+jMjd3Vcw=;
 b=BnJR2yPZsbQO9QaB+9mNSPStkRfrrPtW7J+LQzqBjoPJrPyvFvKRaa0r/vENZ+lz+XynzMw1AuMpRtInGEqI4UaDc2ovWlQ/p2gmPYdxd1vsEQxo8kVb4QEZY2kL7QVQcudvdLmHBU6ddDATnHeG2APWxp+F+IrgalmeXu5SXfs=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by MN2PR10MB4144.namprd10.prod.outlook.com (2603:10b6:208:1d6::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Wed, 23 Feb
 2022 18:45:37 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::750f:bf1d:1599:3406]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::750f:bf1d:1599:3406%6]) with mapi id 15.20.5017.024; Wed, 23 Feb 2022
 18:45:37 +0000
From: Joao Martins <joao.m.martins@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 4/6] i386/pc: relocate 4g start to 1T where applicable
Date: Wed, 23 Feb 2022 18:44:53 +0000
Message-Id: <20220223184455.9057-5-joao.m.martins@oracle.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220223184455.9057-1-joao.m.martins@oracle.com>
References: <20220223184455.9057-1-joao.m.martins@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0332.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18c::13) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 623efb96-145e-47f4-b3ef-08d9f6fcaeaa
X-MS-TrafficTypeDiagnostic: MN2PR10MB4144:EE_
X-Microsoft-Antispam-PRVS: <MN2PR10MB4144693EA1CDE84A5245EC3FBB3C9@MN2PR10MB4144.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AZlzXIGCywZCC2qqQWWYwPvhwQYUjUjr1swGdNPUrS/wtYKvZJZptQuWhTQF0isS/fjjuL3MqyAAloGye4WAUFyFSa3/+qEqleha5zLpZhrQjrqPX6V7SfH0MdCRK6IVHemMbkhqxV3/CTaGlfsjNNcxDeV8mF1AeulzkhT9PaZln1b1iyaygKUjHXmAdFPv9Kl4AMu9WQhBl8o6YlVhXPoJOwgN7F3uEMQAdEViR2Z0qG1a6+k5cOWicQw3AhbXZBeq9lbc8aKCUGiQfaBKJeJ9vxM+dfoTwU76IyopadIn5IY+NTq2pMBL8zxefx3iSFnK9EtDX0ltvhHvynAlCibT5brruqF/w+1xEVdcmdY+KW5CatUf+OJYBbHFkPmbO/FC+K4SyutHWJzoqXM2PDy+7PS68sieyI6Lwd9y0cEji+ChtZTynoM6jQKq8Nr4sSbjfFrIxhvMvc7Rm1HISnEKckjkzHAiYvqrw6X643ApVEzEB8bWpduBYPJtEzCw3k22ZSz3Pr/Ski/WA+2ukbD7KB4fwbE71V64y2P/7SpRgmp0Z8RLRITsCjRHT2NwqwE85q8Yf9sU1fvJwG2F3cl9IS9o3AuKHGYzj31FjJP2gFrz2Pbr4MhX3ABtBWkHUcDWrKwp/47cOqRFIdi/7/zWkE8gE9GYf47B9MNQ58P0oY1uSa/GryfwqgmKkp1yPMCpyFME7C6F9IZ0wRhQfA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6512007)(6506007)(6666004)(66476007)(66556008)(66946007)(83380400001)(4326008)(6486002)(103116003)(36756003)(316002)(2616005)(7416002)(86362001)(38100700002)(38350700002)(8676002)(8936002)(54906003)(6916009)(107886003)(1076003)(186003)(26005)(52116002)(508600001)(5660300002)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rH1F13pxxmAf96JKlBGD6Nm2nSOeDw1Z4fBJQV4YGV2t2UCQ60gEyk7Fjj7R?=
 =?us-ascii?Q?DTRvXJquIkGcPa9oWqJy7WlcYn2lSat42bLRezMUwiW0WzYt7zd6mpFtwDhy?=
 =?us-ascii?Q?xVhNDA27IKs0437NNdQTYJXtxaG4ahAAYaqIpljlPeafTtv+2vFVNz12nUoB?=
 =?us-ascii?Q?8LSDuqVAQi+pRbD/Vyrir4NLK8vafFqx+4ZMBOZ9+xHPdSCn64o+D65bSEAY?=
 =?us-ascii?Q?KZMG5OwCsoU4LG85YOF3fh31Jb7OjVR23fYi+EllNYjmvY0QQZpph1MfhpYa?=
 =?us-ascii?Q?uSfRu7UVAmnGkqqmEDTPzEXNZFsoy2ZJEtk2vlYDhNjNTMS8QSgy+P0Nt5lJ?=
 =?us-ascii?Q?BStqFKXI8E1szeAwGYltkMjXfyus3y9+okzwZ2iJBAeYyz/db0Z9P/l35bzE?=
 =?us-ascii?Q?TZ4tTYuKTf1NVEc6FUyESPkLT8cQxZPUEHQuhaw5pQgD4oungsKhkDF6kWwU?=
 =?us-ascii?Q?rNrITY4G1NZoK2zYD9y7rwS+sY6eOi+M5C3fqR9t5tzlzGs1jRx68TvGkTAr?=
 =?us-ascii?Q?6nOHpX56Z+GsqpkFbrkN0BU4BB5vkY4943z2DG5B3NW+8dlrmxRyBpJn6dcu?=
 =?us-ascii?Q?g4UJIuCEqYpibxVrEfEIQt1KS0BIdEnvUkuJGr8+hHfYZVgcwsAYhO1eIJFt?=
 =?us-ascii?Q?dnj6E2AhzF6CBbyUAbyAkNvbu578XGzI5be8Rc3TW2JlYMB7wb1o9hhOTunV?=
 =?us-ascii?Q?8imdnTIRdcSq6X/FUoClPMF4V+ZKFXRuzzseUAXPNvqqP/LAggga+8RyntUj?=
 =?us-ascii?Q?lp2DZGnJGfpWQIouSrjMiK77KJdO4yz4n78uUV3gEHxJXZmU2taB0o76oTN/?=
 =?us-ascii?Q?79WliEnRZnBmdB24KnQSB2qzN1/QB/wnm+hxKKBBoKDJJdvVbTXWQdgvvqnL?=
 =?us-ascii?Q?rW5al67aVpwSldQXq/KbUlX+VrvBoa54WrpwirZZoaIYT44lp/cn3E4LAtG1?=
 =?us-ascii?Q?AvSW97lu1p4jIMXp62T/vuqMv/cPpYDNlezZeFTO6bjYQp5DXaddRld6DRiN?=
 =?us-ascii?Q?QuskANMzJ4jwlZcVZGCFFTOmIwjohZ4Mdnd+q/Zu4+0aaOAwOPnXFEeuz9+o?=
 =?us-ascii?Q?bMbWrKRKCSRbfU6zznUBEdYWYIZJqGdCqw1Gfx1gAm7EV+dJ8z87cZZx5gsB?=
 =?us-ascii?Q?0TAvluLbLdnpwe1yBis5UUgzcsMNp3DAtXc0n3qosE+ZZiek+slgMgQSIagO?=
 =?us-ascii?Q?UYHZ8CNIEnhD1C4BSojq9xtYlLx9IM/sEev+5j6jyOj5ls9xFeMeYyfre8cT?=
 =?us-ascii?Q?JQtj2t0OM4Al7s/YDsx/bHnzZM5JlNxxAWr0+abS5UbW7h8BO05p1K70inmD?=
 =?us-ascii?Q?Zdg2Vd4+0Y1hIat4ETSI9iAzxzZwizAPXRXhpZr0gEKxIUBYGExnfC+QvBfS?=
 =?us-ascii?Q?RScmE/GOtPclY5MxeoDpmqOIdHNW3n4ydRyhFLs5EIiBPzf39nTDqHW6SYea?=
 =?us-ascii?Q?KXelokCPtjpMtsx7uQ6hU60YwtSjFlvRyYQHJbXAfgqP3fIf0iMQfdWUwNK1?=
 =?us-ascii?Q?9R4OATtyt9nMgmzr8ZdZF+bYDN9TTDu0sSb2Ifox40c9UAVeVM5CFArpTY8u?=
 =?us-ascii?Q?PVHBkWv/ne9vhegB+PFP6DyoseUjNnJnmcMdykrlPTZr12HWY0isZn/dLRwT?=
 =?us-ascii?Q?W01dyiCNv0Sn4aO1pgU2xlQTViewOqB8wUG91JUOJPQK0GPKAwFOUxRIho0T?=
 =?us-ascii?Q?YC5xZA=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 623efb96-145e-47f4-b3ef-08d9f6fcaeaa
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2022 18:45:37.5062 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WrIRCpecwp57isYmRe/YDxt/N+ygcTzW6wGB2Gb4tloqYn+PWhselJ3yRa+zwmSzj1QJCxHEFPrcBvAp60hmC3QtHF6SLzYA3EQAJ+C+QkM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4144
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10267
 signatures=681306
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 malwarescore=0
 mlxlogscore=999 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202230106
X-Proofpoint-GUID: P6llAkwwjImp_lEDB2s_v-wf8yYgIZ4l
X-Proofpoint-ORIG-GUID: P6llAkwwjImp_lEDB2s_v-wf8yYgIZ4l
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
 hw/i386/pc.c      | 79 +++++++++++++++++++++++++++++++++++++++++++++++
 target/i386/cpu.h |  4 +++
 2 files changed, 83 insertions(+)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 360f4e10001b..6e4f5c87a2e5 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -802,6 +802,78 @@ void xen_load_linux(PCMachineState *pcms)
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
+static hwaddr x86_max_phys_addr(PCMachineState *pcms,
+                                uint64_t pci_hole64_size)
+{
+    PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
+    X86MachineState *x86ms = X86_MACHINE(pcms);
+    MachineState *machine = MACHINE(pcms);
+    ram_addr_t device_mem_size = 0;
+    hwaddr base;
+
+    if (pcmc->has_reserved_memory &&
+       (machine->ram_size < machine->maxram_size)) {
+        device_mem_size = machine->maxram_size - machine->ram_size;
+    }
+
+    base = ROUND_UP(x86ms->above_4g_mem_start + x86ms->above_4g_mem_size +
+                    pcms->sgx_epc.size, 1 * GiB);
+
+    return base + device_mem_size + pci_hole64_size;
+}
+
+static void x86_update_above_4g_mem_start(PCMachineState *pcms,
+                                          uint64_t pci_hole64_size)
+{
+    X86MachineState *x86ms = X86_MACHINE(pcms);
+    uint32_t eax, vendor[3];
+
+    host_cpuid(0x0, 0, &eax, &vendor[0], &vendor[2], &vendor[1]);
+    if (!IS_AMD_VENDOR(vendor)) {
+        return;
+    }
+
+    if (x86_max_phys_addr(pcms, pci_hole64_size) < AMD_HT_START) {
+        return;
+    }
+
+    x86ms->above_4g_mem_start = AMD_ABOVE_1TB_START;
+}
+
 void pc_memory_init(PCMachineState *pcms,
                     MemoryRegion *system_memory,
                     MemoryRegion *rom_memory,
@@ -822,6 +894,8 @@ void pc_memory_init(PCMachineState *pcms,
 
     linux_boot = (machine->kernel_filename != NULL);
 
+    x86_update_above_4g_mem_start(pcms, pci_hole64_size);
+
     /*
      * Split single memory region and use aliases to address portions of it,
      * done for backwards compatibility with older qemus.
@@ -832,6 +906,11 @@ void pc_memory_init(PCMachineState *pcms,
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


