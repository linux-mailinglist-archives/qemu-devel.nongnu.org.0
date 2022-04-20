Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65971509163
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 22:26:49 +0200 (CEST)
Received: from localhost ([::1]:42230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhGuW-0007mm-GL
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 16:26:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1nhGgb-0000M9-4c
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 16:12:25 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:64774)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1nhGgY-000481-35
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 16:12:24 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23KIcDlQ019815; 
 Wed, 20 Apr 2022 20:12:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=7yo6jtfExb5/w0duTVww5gvXQFnsIH/tAVUO0p2IsgI=;
 b=BZW8V4vKT5cDY9lIP+Iu5qc5AFuuPIYPNBfFYoPPcv0OTEI8UL3GyXLTwO6zolXDuQtv
 HPO2oRbIita//GfMVoZfs084aiEtaY14qozC9H444vJ1dIFD5OWHRmyLwNgiZnSxUFFI
 v16+YzAR6bHw62ktQFbuiQSnPA7MT0kApuQ6VRHMCYGiJMhPHW5zWYpRgjpMS9cxzkES
 8tg70eDBB2Awc5FGpbUwwFEPjevxrnGSpIEKl3iCEOnoI8S21Qp5wJ4L/FX5VJvfwnNx
 zxeON/1C857nXvDNRzjssdFIYhd7AzZa/PC5qPMzJrpmdfX0kRzxhGpdwvQc7ufSQhWd 0A== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ffmd1aa4m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 Apr 2022 20:12:13 +0000
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 23KKC9SS027514; Wed, 20 Apr 2022 20:12:12 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam08lp2048.outbound.protection.outlook.com [104.47.73.48])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3ffm87vune-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 Apr 2022 20:12:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MgOycZ6Mw3J8+X2rGMB0s6AeSJKC0/5T7UqTFmu8n6dEkgJjh56CeQ1IgnTEjjRNd/uZlA165RI2Osh+RyR6GvQrXX4asVvqqIqSMw2Q/FNTWHtNwvTx3h47mG7NSYsVpuazwQMxzAa0TjxVSI2LigSN1L820MtXtQakwGpJws+x4/AdGbNPFtJ+tJ8U7AROdCTN9Jwk1NNrL8eiOfXnpuxEmJjpW0RH+m3ISc4dBaXI5LBE+Sv5rovhz57jEG576eDnb+mIMs2ViMy2MlKMw+Z3u60XjbMaH7Jyc1hfPpaLoqsWr2Vmzzhd1D9xm3E1s4/G3RIMuJ+uPoFHgHUijw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7yo6jtfExb5/w0duTVww5gvXQFnsIH/tAVUO0p2IsgI=;
 b=cSup+HJrPxyhMA4i5XvnIh/Ikxm26BsEpwYaDgcGyYO8+yG5plw1TMMFA2+6xUKW/yuEjnYeqTkgFnC2yWVD3ensZclQiMvtC/mA+EEOzOWO6348+UhvbbjQbht7F+ndWRHRPc+o4ikDWr/O/Xlr5N7LQJAEnaU8xlja2EC9ZjiVO1KM9crsYq+eriJ/yvogW7mNKQqGCFZinClt0toBqBGLNe9rKjTsFbNbYPUcf7CLAdGoKfRPKbf4zP4fmT7vndeV5h6P2X0vxKqMlcg38foMvbA+WuuikowOfnZ/kX/GwvaUSQxcS0Dq7RwU6Y0q93BmsW+xYS9lM5CijWe6bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7yo6jtfExb5/w0duTVww5gvXQFnsIH/tAVUO0p2IsgI=;
 b=kUnUIO/edd2PbWLLxmHCRAr8Co8hexhUu0R98d5YZML36B8S9WH9Nhmc5bCBgtV3e3Wcplny62z+MPS1fPIa4ksKVCFj0aYNubUPqCud+t6efWVARvPQC0u/rmd+TQhozQgyVb5DypWB/0z51uaH4pdBb1+Y6LJwZ0v563athEc=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by PH0PR10MB5644.namprd10.prod.outlook.com (2603:10b6:510:fb::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Wed, 20 Apr
 2022 20:12:00 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::d17f:a2a4:ca0c:cb49]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::d17f:a2a4:ca0c:cb49%4]) with mapi id 15.20.5186.013; Wed, 20 Apr 2022
 20:12:00 +0000
From: Joao Martins <joao.m.martins@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 4/5] i386/pc: relocate 4g start to 1T where applicable
Date: Wed, 20 Apr 2022 21:11:37 +0100
Message-Id: <20220420201138.23854-5-joao.m.martins@oracle.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220420201138.23854-1-joao.m.martins@oracle.com>
References: <20220420201138.23854-1-joao.m.martins@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0016.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ad::10) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: afac9936-6e90-4ccd-ede4-08da230a073d
X-MS-TrafficTypeDiagnostic: PH0PR10MB5644:EE_
X-Microsoft-Antispam-PRVS: <PH0PR10MB5644DF51036B09856981D3EBBBF59@PH0PR10MB5644.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: P5qBcoJMnJSjlUAQ/EZLDn29Hd716rPo9+kTD5M6CyebvEifGaqiqSFm16hv2dgMOj6dWf8Z0bS/X1jI4yfkvlJX91h+wiU3/avU8Kij4jvqaHjTXgGqxSLnwu5k3+4S462u+cTBvhgTzVmZ+7j4sZMGCME1SkEzh/eBabUeVGqKSFwduVnMIsSBNXTNv3eFyeWFM75Z+SH5cJ1YgDfCtzDykEj260+i8y3FETUTSrlkjqrKLD8uGJsbTW7Yc6s1PUanBTLlvgNcbnEG6nhb5aIP3EbhNXdEF0gbTrpOmEEKMhOZ//VuxjnexaaobBtyWCci9ffZU++GbtQyK3eupsJOVYKYCvyTzWw1GcPrz8JcujjqqFNbT4F8xduMWvYmdrvZl5fpugK76vKSvPMBMLHdNnX1m9QxF5fgBivExiH3bvp2+2IB16dTJZi2QQota81v3D28Grx8H2t2RoTjtmqbguqaFDVXKyJrS/po+Mf7BgKMe8Zh0S2BhpySxxzhPkETDLy4dYQ6JMMqyVMkMP9e3SXCzooUFoSSx339HuRjUM8DkUCuv236HQgA1p7W7E/AujpIBCRIMGkagcFeYP6ENykRBTCvNvSOimVcrC/05LfP31guaT0imTa2c8bQ031VLA2V5ybfHlQfDZounw5HvFm8mxCOVoMSEf0ITNg1Qub42Jwi2i5/zSdlZbEjrb6/5LOw3nTaTzkNiZTG3g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(1076003)(186003)(107886003)(26005)(6512007)(2616005)(6506007)(83380400001)(52116002)(36756003)(6666004)(8936002)(38100700002)(2906002)(6916009)(54906003)(38350700002)(6486002)(5660300002)(508600001)(7416002)(66476007)(66556008)(66946007)(8676002)(4326008)(316002)(86362001)(103116003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?++6+DDPEW7XCRqJYDH5T1LRYoFKyU57zucdIUKwFhKvBzO0a4ew5xezCMPeH?=
 =?us-ascii?Q?WWe/M3GOyZQn4aGg1qmrRuf1Ayc/syYkt4anG3ay1W4RfLQKXpHL0Nq/SKYD?=
 =?us-ascii?Q?X8+AcYEbqyHwaEiTJLupqMoLgTln+kutRUL0TrG3U0ibyv63i1Qj5IoeZqTB?=
 =?us-ascii?Q?Qq5jpOABZdimJhJTHGKPppcVf9vzjAG71g4bs57BbV77upOzUsT5VPwdIa7y?=
 =?us-ascii?Q?K+jV4gKTAyp8DI5EpqumZw1bDgVu+SHJm9tTqKnbhLPZCJ1oyTYUW50GstfR?=
 =?us-ascii?Q?BeOo9rOKYWjoCIGx+cax5gAroZ/XBGCJpC4ZLdGqP/+9t37a+os1XbUsdcTQ?=
 =?us-ascii?Q?1XQ+XmmKur6Bs69u+/UioukMxMwch8QgclSKnAjw88f/40MYDfq3PtifxcJp?=
 =?us-ascii?Q?lZSQZqzQAI5CTndhQ5/SLEoM4ymLqBEfp7FGjW9WgXfSvSzZ50CW0BMgGVCO?=
 =?us-ascii?Q?S/fRWq4IQsdDAIMqjCdBRz/iWI/sbS6yZnziahiSzlv9RhoeBnWIsAXs/LDg?=
 =?us-ascii?Q?umP7mNLMIntdGsRPSZ4XhbHsZWIlvXyHSvzZzcmhshIbk5ocUie+n9eoAbV5?=
 =?us-ascii?Q?+hZXjjOcOdKaVbH+Gdqcr70h8N25beeXK3d4NkHtOrvo6oyAQVRkZq7mCHjc?=
 =?us-ascii?Q?estZJISVON/Oruos4REBh5Lx0IzCJmiPEZ2mVvNbop8zFtMtRgSPXTrSQBoN?=
 =?us-ascii?Q?mo3+qY5Br7rIcggLTJmNkijN/ikJkWV0WY8Ychf1E7N2mObzPaE432/RrT4k?=
 =?us-ascii?Q?Znwt6VOS/1VoZ+GTUplZFTz+yvByC5lusa8BFlMmFQiAC4Hy/3c0mmwkosAn?=
 =?us-ascii?Q?y0UVq6xrRo+G2T+Y21NR/5M8m5YGXhsNW/jlwF23RkqjghVcbiOiRamwVSh3?=
 =?us-ascii?Q?4Ip9uAJqFhAvyrVa9FLw0AhJKzI3mIJPThbIG92pZlKleFalChywXS70Vv1t?=
 =?us-ascii?Q?kjctiKlg0qYxbLYFleVgSIfHZ/xRfjZDvNUp3phhx8vzLik8mgxxiuVK157o?=
 =?us-ascii?Q?7QE2CrRccxlzoCtSwrT5ONj3PpOb4EKcNywkQvppHIHi8zkGBUVPP4PR9HAA?=
 =?us-ascii?Q?p0uVkLUj/7i/fNSjqfLIS6x0G5lTEjqLLw8Adjba6nVwa0YbK1ZmAJrzeDWt?=
 =?us-ascii?Q?WDjz07K5d/HzyZouYlAzDFKDqE4+SH5TtRZog15+wkbE8guZwUSFnN/TLBEi?=
 =?us-ascii?Q?9t2PzpotLvL0FUiSHWjjWfyBrGW6On0FGcvSV6NhM1x6Fi6TJNQFYi9MgRld?=
 =?us-ascii?Q?LnvHVu+LRjJachD44oOJkEOrdZVggd/9fim8L44EOW6220vMI8pUvrFRwYgZ?=
 =?us-ascii?Q?TYkUsdm9zFg3uNksibbseIfifOKlsSSqqW1Topt6OKZ7APLNT49CYZ2y5ZdW?=
 =?us-ascii?Q?l37hWVafTmqoBDh42A2cEHntbjUNQlruEzwbrlTW3+/6Y7lVoamgfjTb1qRX?=
 =?us-ascii?Q?xBdOpAddhaqK4bDtfxtitvPHx9MKX7lrfxIZCS38VxF8fZWMp5NbdfCjPNmK?=
 =?us-ascii?Q?v83RX5Bi9BeoNuOCSAu8E55vKoypTM6VbzviLYT2ENj6gEe8r6+OgdXigUHh?=
 =?us-ascii?Q?sfd+b0a4PO3CUyAhGKHFWrSpnL22Y0sxLDIN2ZdDfQPRL15OtD8qxojXYt0k?=
 =?us-ascii?Q?up84kXhwDM+01k7gdhmJFgk7edzLHysJ+usqumQLfGGQEpHKNY6dM27BMWU+?=
 =?us-ascii?Q?cebizbRNGYxZv8hdtr1RW4F+qjO0rsxK88/WBwgvnxXje27zBNlSgsJ9J6xV?=
 =?us-ascii?Q?3/iigKUkOctIAJxo97/rfenYJwhw/is=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afac9936-6e90-4ccd-ede4-08da230a073d
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2022 20:12:00.6834 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qwofPLFhArW6PEGKUKBwg/xZc+/0usscoltt8a1vRbYFKM7xImlzsyXcF067fwadhGzJk9NzvOuze1mAoFNVSNa9nqUlWU7M2BeyoQ+cWTI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5644
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-04-20_05:2022-04-20,
 2022-04-20 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 adultscore=0
 malwarescore=0 mlxlogscore=999 suspectscore=0 spamscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204200119
X-Proofpoint-ORIG-GUID: 2sD0pKdyT9RqlLwCWsyPflwtyrx2NEAm
X-Proofpoint-GUID: 2sD0pKdyT9RqlLwCWsyPflwtyrx2NEAm
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Daniel Jordan <daniel.m.jordan@oracle.com>,
 David Edmondson <david.edmondson@oracle.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Paolo Bonzini <pbonzini@redhat.com>, Joao Martins <joao.m.martins@oracle.com>
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

Default phys-bits on Qemu is TCG_PHYS_BITS (40) which is enough
to address 1Tb (0xff ffff ffff). On AMD platforms, if a
ram-above-4g relocation may be desired and the CPU wasn't configured
with a big enough phys-bits, print an error message to the user
and do not make the relocation of the above-4g-region if phys-bits
is too low.

Suggested-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
---
 hw/i386/pc.c | 111 +++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 111 insertions(+)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 8eaa32ee2106..aac32ba0bd02 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -803,6 +803,110 @@ void xen_load_linux(PCMachineState *pcms)
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
+                                hwaddr above_4g_mem_start,
+                                uint64_t pci_hole64_size)
+{
+    PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
+    X86MachineState *x86ms = X86_MACHINE(pcms);
+    MachineState *machine = MACHINE(pcms);
+    ram_addr_t device_mem_size = 0;
+    hwaddr base;
+
+    if (!x86ms->above_4g_mem_size) {
+       /*
+        * 32-bit pci hole goes from
+        * end-of-low-ram (@below_4g_mem_size) to IOAPIC.
+        */
+        return IO_APIC_DEFAULT_ADDRESS - 1;
+    }
+
+    if (pcmc->has_reserved_memory &&
+       (machine->ram_size < machine->maxram_size)) {
+        device_mem_size = machine->maxram_size - machine->ram_size;
+    }
+
+    base = ROUND_UP(above_4g_mem_start + x86ms->above_4g_mem_size +
+                    pcms->sgx_epc.size, 1 * GiB);
+
+    return base + device_mem_size + pci_hole64_size;
+}
+
+static void x86_update_above_4g_mem_start(PCMachineState *pcms,
+                                          uint64_t pci_hole64_size)
+{
+    X86MachineState *x86ms = X86_MACHINE(pcms);
+    CPUX86State *env = &X86_CPU(first_cpu)->env;
+    hwaddr start = x86ms->above_4g_mem_start;
+    hwaddr maxphysaddr, maxusedaddr;
+
+    /*
+     * The HyperTransport range close to the 1T boundary is unique to AMD
+     * hosts with IOMMUs enabled. Restrict the ram-above-4g relocation
+     * to above 1T to AMD vCPUs only.
+     */
+    if (!IS_AMD_CPU(env)) {
+        return;
+    }
+
+    /* Bail out if max possible address does not cross HT range */
+    if (x86_max_phys_addr(pcms, start, pci_hole64_size) < AMD_HT_START) {
+        return;
+    }
+
+    /*
+     * Relocating ram-above-4G requires more than TCG_PHYS_BITS (40).
+     * So make sure phys-bits is required to be appropriately sized in order
+     * to proceed with the above-4g-region relocation and thus boot.
+     */
+    start = AMD_ABOVE_1TB_START;
+    maxphysaddr = ((hwaddr)1 << X86_CPU(first_cpu)->phys_bits) - 1;
+    maxusedaddr = x86_max_phys_addr(pcms, start, pci_hole64_size);
+    if (maxphysaddr < maxusedaddr) {
+        error_report("Address space limit 0x%"PRIx64" < 0x%"PRIx64
+                     " phys-bits too low (%u) cannot avoid AMD HT range",
+                     maxphysaddr, maxusedaddr, X86_CPU(first_cpu)->phys_bits);
+        exit(EXIT_FAILURE);
+    }
+
+
+    x86ms->above_4g_mem_start = start;
+}
+
 void pc_memory_init(PCMachineState *pcms,
                     MemoryRegion *system_memory,
                     MemoryRegion *rom_memory,
@@ -823,6 +927,8 @@ void pc_memory_init(PCMachineState *pcms,
 
     linux_boot = (machine->kernel_filename != NULL);
 
+    x86_update_above_4g_mem_start(pcms, pci_hole64_size);
+
     /*
      * Split single memory region and use aliases to address portions of it,
      * done for backwards compatibility with older qemus.
@@ -833,6 +939,11 @@ void pc_memory_init(PCMachineState *pcms,
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
-- 
2.17.2


