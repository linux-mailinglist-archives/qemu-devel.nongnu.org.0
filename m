Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0217D4BDA0D
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 14:59:44 +0100 (CET)
Received: from localhost ([::1]:57382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nM9E6-0000J2-TN
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 08:59:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1nM8m9-0006n4-6d
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 08:30:49 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:26554)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1nM8m4-0007ZY-7W
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 08:30:48 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21LCv6dv009718; 
 Mon, 21 Feb 2022 13:30:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : references : date : in-reply-to : message-id : content-type :
 mime-version; s=corp-2021-07-09;
 bh=xWzos5Hk/NEs0QyN2yoBsMb3vDluLgXTVMmwJG1olJk=;
 b=q/EFr+DYM4dK5j5M3HmlJuKIkwAWWJil0PW3GBwXCsRphnj/SRoWq6PKfJ1Eahkc/XzD
 MaM9kVi67X+q+qMTWMIEOK6j28EAZ8g83QnBplPY5tJ2I1OwAwR0w7+lumDKIUhRvVQD
 zLg/KBiQk17E7TDv1iZH+MZbnvrFHG90oBbFL91eR0Cm2Kh8McFizqrMFetZre02z3sJ
 mrKydCwRQL+mzc8Y1h8SD3h9FI1ehNE2HV+3PCJDaWhT/X/7vjO/1lyioRJs41OqyQRt
 yIdEWSN/txZsW0RtujDnV4AIKm6VohCkR2LLo22pJat+kaihOKIl+Y5vWitJzFIkbSQs fA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3eapye45yn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 21 Feb 2022 13:30:33 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21LDFVXv133632;
 Mon, 21 Feb 2022 13:30:32 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2175.outbound.protection.outlook.com [104.47.58.175])
 by userp3030.oracle.com with ESMTP id 3eannteegd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 21 Feb 2022 13:30:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FT5uRyZ+Ot/5Ogi+eA9liHe9UhDZmYzpR79UUEhi7JV8DBSjQyK/n/dOUMxyLuMrKCeqy43xrNHyqc+BlON5KeLmmd9nT/h5vCTiATvheGKks3VUl3WRfYFngh6HAPBYdUc3CkDqt9m4dzqJwtKanURmn0Qo9GqgaPOD95TCKYHkOko8snZvTipEfS84PN2j069ZGArJS6HahYwfL8yUgPvV/Hs4e3a61Myv3BpTY1n1q0W0HTHyKxGEEPAqkjTJp8tqSoq1zdWUxwaEjm2pjo/xajMvmEIhTdgAh55/MYgz8JCHjjMUvLQDmm3ZDkF6rDRomnYupMKk66IxH57CHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xWzos5Hk/NEs0QyN2yoBsMb3vDluLgXTVMmwJG1olJk=;
 b=afLmJ1vqeppUoyg8XV/apEllILu4/dFv0yUw2C2y6j3n0qEWWXFAk+p2yj/70/utv/tFFmZYAPgNXPa09a1lNiWzFwsOI9MdlcD49eH0rKv+Nq6U+OHbFWOcEjzueOObI50Re5oof6UQo5nLnfjkNqLsQiHonKpf45Cgg4QIxyisUS1y2/VWf9ndFDy80InFDNBtUYdEarov9QEhD0k/CjdJ2xZWe3zXad8a6Bh7bJUnnDgj6kM6I3iMfG9ptWZAvAROZ9rqEyc4PKPLPLn2L/PYSzIQVNK28coKZ8trZ7kPGXLsP2sT3dF3o17s8S8+gdaFLwDWGLOIWYQhRQ5Ehw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xWzos5Hk/NEs0QyN2yoBsMb3vDluLgXTVMmwJG1olJk=;
 b=DxbPQD1IZSg9PpdBbpWD95tgaPh4Mj2GLH2sGcz5+3RCRO2ndhocBGGAopvmJEc4bIkFwnMS9aKDD7XT1LsQvWN1MwzNGcmKKMLtjQT3DXrsXy+u2RSV7eS0+DQ4QdsZjA/UXLGgU15vDF0l2+vlMHNdOgaCpmmctWPrfzui3kM=
Received: from DS7PR10MB4926.namprd10.prod.outlook.com (2603:10b6:5:3ac::20)
 by BN6PR1001MB2243.namprd10.prod.outlook.com (2603:10b6:405:30::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16; Mon, 21 Feb
 2022 13:30:30 +0000
Received: from DS7PR10MB4926.namprd10.prod.outlook.com
 ([fe80::e429:a820:ef6e:98d9]) by DS7PR10MB4926.namprd10.prod.outlook.com
 ([fe80::e429:a820:ef6e:98d9%6]) with mapi id 15.20.4995.027; Mon, 21 Feb 2022
 13:30:30 +0000
From: David Edmondson <david.edmondson@oracle.com>
To: Yang Zhong <yang.zhong@intel.com>
Subject: Re: [PATCH v2 7/8] x86: Support XFD and AMX xsave data migration
References: <20220217060434.52460-1-yang.zhong@intel.com>
 <20220217060434.52460-8-yang.zhong@intel.com>
Date: Mon, 21 Feb 2022 13:30:25 +0000
In-Reply-To: <20220217060434.52460-8-yang.zhong@intel.com> (Yang Zhong's
 message of "Wed, 16 Feb 2022 22:04:33 -0800")
Message-ID: <cunr17wny8e.fsf@oracle.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/29.0.50 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO2P123CA0062.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1::26) To DS7PR10MB4926.namprd10.prod.outlook.com
 (2603:10b6:5:3ac::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cfd171fa-bd0b-4a87-99f9-08d9f53e5458
X-MS-TrafficTypeDiagnostic: BN6PR1001MB2243:EE_
X-Microsoft-Antispam-PRVS: <BN6PR1001MB2243D1CB132A5797AAB6DB72883A9@BN6PR1001MB2243.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UOiBtV97ZQ+rOjyPzVGFziejUXaAikFsPlb3+JhI+agUu8QfkD33RBn4bQ6OvEn10bILM+xaCXJ+rApLLjzK4KR7gVQV00NaKkcm7Pr+AalqHb/1jsnenfR3CwsxrbJhUTEqTui3y4GBwfr7XG+E6MvR8TnpOvUTwFSMXHKlvp/YsQ/y+RwX5d9pXVS3NTY5Su19xKv7uMLk1WOZaaPC6E6xYCOwpqrbr0wzkt3H6udlBmPvwduXFqYTKWNg8VFoiKd3DB6jtvSkGshq7iXK+EYSQJdd22NudwiRNFu+jKS3h0HE1FMO2fwUhrcBA/VshRYripD4KHnkLtfd1hfKnNZb2pQiM0JXxlcsHnxQdlhJ9dpk258JhvxI7zx/lOUoHF5UtvdO/40J10Dc6xn2Dcso2rUpgA+USoOZhx/MSkO58pEkL78uDCIprgToT4e1wN6kAGj5OWyHo9WKzQyfjSOM7GHmaowxgv8auaHHwz4TsD1DLNywCxTiEW9IyfRbPLj+CVA6aJrEgzE1MVBsQzMkaVLWjMnQ+sUccUpYYLjSJUecaqKhkIwwR9rAJlZWv5M7XLBQYlYxJv5a7pvyxBOqepbbInMcaml3Zebj8xQ/nLaSLWCqyUtpxAMznvxcVRBN0u2ASRJUsgKDkFi3hGTwt5KuW54FiCION/xIDJI25ACVrICXFzmU5Ey+sgg74PVyBQXRsU4L5EzlMFo7MA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR10MB4926.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(83380400001)(8936002)(6486002)(44832011)(2906002)(316002)(86362001)(6916009)(508600001)(36756003)(52116002)(38100700002)(6666004)(66946007)(66556008)(4326008)(66476007)(5660300002)(8676002)(6506007)(2616005)(186003)(6512007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aBoR9ghNddwmSs/xkj6OBTjsPPvFkNpFdVWOj5j0OwDo4TxMYvhCfc44r+/6?=
 =?us-ascii?Q?WukJELkgulQLbvF3eG8EF6T8kuhgHVx1OQAzNRwezvE7vbWTj4exkzl1hn3c?=
 =?us-ascii?Q?BqckXi3s+/uSNhbHhiwGYADy1/bhjocv9Jpl36yc7em+oSgKOcbLgvUtdx5V?=
 =?us-ascii?Q?40EgMrx+ZMwaFhEKp/CNPGoMf2mlfomNBwTtirjYGLnM24um3ZyLSkkon7x1?=
 =?us-ascii?Q?tYe7wq9BGMSAudmLE8ipAfkJqA0mvDPfoWDKqygA/NvU2uQUMZtNBhlnc8a6?=
 =?us-ascii?Q?H1a79iCenU9BSSPofiWmFfihsZbVtfrhO6oQQIL2nx9jUHVZoNcFpMf0IBXm?=
 =?us-ascii?Q?tbIfX1pFhAQqF01Gg4uciMPkEGSYMN0VtW1LbN0dEwYTfdSV2Y79iGyc+5Eh?=
 =?us-ascii?Q?OAshZJVSRFrz07AWq88UBrVwtJKOMg7+czqLAX1ZiLyQFcN4GG/bFR8UcNLD?=
 =?us-ascii?Q?CcxtY0xu4sXdCRWikk8BT+bTAd1WIAv/O2GGMADtAnUbw2SkIaKx029E9SIv?=
 =?us-ascii?Q?6v6cWr+NgnqjPCSKd6rUSUpT4Jc00szBBFQl+anzL0RysJQfPdrFjOIsfxkq?=
 =?us-ascii?Q?9e2b8cTC14wzJ4xiu7LbFkNgLf/3DtWK92Zcx12iw0HkVpSI0t7SBvVGEAoe?=
 =?us-ascii?Q?4PbCdzqX/KWhDESC2syQfSfeKAn2lNzjc6WZmxWCqW7KJnNL/zJR1MogrFET?=
 =?us-ascii?Q?DdSFIQgIoTjM+OIGCTmzib7zv/PWLjDGAcSt08K2vDw3sk/ODFCbetAcwPdp?=
 =?us-ascii?Q?GCr83d9GgZ4l7WaRzCgvCTwPnc0TVzJsZBYo7sZYHJ/E0L1tEf023WyhTbso?=
 =?us-ascii?Q?TWsmtP3NNpEt6wxcGM6Ba5+rvQ9MFiEvzHEnLNXMntPc+uLCCSUDRnrj713s?=
 =?us-ascii?Q?17mJNGm8TlEhPKOLd5Qsay5QMcbtDoELNgLxRi9qFGbnTdiQo6pP/AXuDkUe?=
 =?us-ascii?Q?5+w1KxPJao5GrHfCxRhAYgrW7/Y38iXsI432xUVO9t1fgEgcuxOnXvDeYWYJ?=
 =?us-ascii?Q?93pSkjKtFVwe7q66Q7elzhuEt8EuI+CaHiK2P4qPrHGb3+UBSwFvGOdCY5YI?=
 =?us-ascii?Q?3YUAfO3MllFYsSG85gNdphOLg3LJ4ZKcTCGF1FRYp4lIYR5WjfrGVNEYwa0o?=
 =?us-ascii?Q?XKN0NWYRqnc3GJ970eWlhHp+ZlAyGxWyP0ECQjSnBlakCG/AYAPemvTP2uzn?=
 =?us-ascii?Q?VrpyBB3PPlp62a/AHSsG5iZlhoGrZIQR2M7k1ymDsIS4Bzyp0dqBbaHsGUSm?=
 =?us-ascii?Q?G0g/Orbd0vT3/eheBsQW55xb2yvXLgfJN97gOBdfvXQGnrfBRa1ezENPnEc0?=
 =?us-ascii?Q?VEDD+Rnca5bYxEhuDzVkErh3oqqRPW7zRX00lFrlTNFLX68cF7SKodhAkNvw?=
 =?us-ascii?Q?5CgXfF1I6sRcicvHvHYytrq8jYsEC0fCp+s1rL3yp/RAIxbJLNCdswlx/HPZ?=
 =?us-ascii?Q?iIZeJW0BDpavBHE3ejOFUkbuhcSm8gm8hgLuWkJj7UhHHSklNH/ULM8aqM8u?=
 =?us-ascii?Q?xtmOF8ubNUa5WGFH9fKPQ+8mxH4ssQFtrmxu/ZPW84UA/xIlXpyFiabeDuKs?=
 =?us-ascii?Q?dnFUWE3vYk2MlU7x6j7lwbKGgJf6y/jtRQCYJJ1ef9A2Mnw1aCNTv9PBpRrx?=
 =?us-ascii?Q?a2Mpi3Eo/WFO5KrtARyflWGOOHJTdb3rjyvNh6AsZPd4CVQUo9IyckrkWmSC?=
 =?us-ascii?Q?mMByWL5Tq17tb80ABKygvhernT0KliEpOYvIOQQSOcJtSZOM?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfd171fa-bd0b-4a87-99f9-08d9f53e5458
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB4926.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2022 13:30:30.4005 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XTN7FkM5rdxQqZAC95rESl3JhLZ0JAeRQMEXAvL66CMZVQYrfg7YHyIK5wJQl3vEaSwFW7jXA1e8aIDsidtJyc4NJebLBOwIWjAVvDF4emk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1001MB2243
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10264
 signatures=677614
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 suspectscore=0 adultscore=0
 malwarescore=0 phishscore=0 mlxlogscore=999 mlxscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202210080
X-Proofpoint-ORIG-GUID: PQVuBp4B-ub7_oFJUoIN45IfKyjG4IDf
X-Proofpoint-GUID: PQVuBp4B-ub7_oFJUoIN45IfKyjG4IDf
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=david.edmondson@oracle.com; helo=mx0b-00069f02.pphosted.com
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
Cc: kevin.tian@intel.com, seanjc@google.com, jing2.liu@linux.intel.com,
 qemu-devel@nongnu.org, wei.w.wang@intel.com, pbonzini@redhat.com,
 guang.zeng@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wednesday, 2022-02-16 at 22:04:33 -08, Yang Zhong wrote:

> From: Zeng Guang <guang.zeng@intel.com>
>
> XFD(eXtended Feature Disable) allows to enable a
> feature on xsave state while preventing specific
> user threads from using the feature.
>
> Support save and restore XFD MSRs if CPUID.D.1.EAX[4]
> enumerate to be valid. Likewise migrate the MSRs and
> related xsave state necessarily.
>
> Signed-off-by: Zeng Guang <guang.zeng@intel.com>
> Signed-off-by: Wei Wang <wei.w.wang@intel.com>
> Signed-off-by: Yang Zhong <yang.zhong@intel.com>

Reviewed-by: David Edmondson <david.edmondson@oracle.com>

> ---
>  target/i386/cpu.h     |  9 +++++++++
>  target/i386/kvm/kvm.c | 18 ++++++++++++++++++
>  target/i386/machine.c | 42 ++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 69 insertions(+)
>
> diff --git a/target/i386/cpu.h b/target/i386/cpu.h
> index de9da38e42..509c16323a 100644
> --- a/target/i386/cpu.h
> +++ b/target/i386/cpu.h
> @@ -505,6 +505,9 @@ typedef enum X86Seg {
>
>  #define MSR_VM_HSAVE_PA                 0xc0010117
>
> +#define MSR_IA32_XFD                    0x000001c4
> +#define MSR_IA32_XFD_ERR                0x000001c5
> +
>  #define MSR_IA32_BNDCFGS                0x00000d90
>  #define MSR_IA32_XSS                    0x00000da0
>  #define MSR_IA32_UMWAIT_CONTROL         0xe1
> @@ -873,6 +876,8 @@ typedef uint64_t FeatureWordArray[FEATURE_WORDS];
>  #define CPUID_7_1_EAX_AVX_VNNI          (1U << 4)
>  /* AVX512 BFloat16 Instruction */
>  #define CPUID_7_1_EAX_AVX512_BF16       (1U << 5)
> +/* XFD Extend Feature Disabled */
> +#define CPUID_D_1_EAX_XFD               (1U << 4)
>
>  /* Packets which contain IP payload have LIP values */
>  #define CPUID_14_0_ECX_LIP              (1U << 31)
> @@ -1617,6 +1622,10 @@ typedef struct CPUX86State {
>      uint64_t msr_rtit_cr3_match;
>      uint64_t msr_rtit_addrs[MAX_RTIT_ADDRS];
>
> +    /* Per-VCPU XFD MSRs */
> +    uint64_t msr_xfd;
> +    uint64_t msr_xfd_err;
> +
>      /* exception/interrupt handling */
>      int error_code;
>      int exception_is_int;
> diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
> index ff064e3d8f..3dd24b6b0e 100644
> --- a/target/i386/kvm/kvm.c
> +++ b/target/i386/kvm/kvm.c
> @@ -3275,6 +3275,13 @@ static int kvm_put_msrs(X86CPU *cpu, int level)
>                                env->msr_ia32_sgxlepubkeyhash[3]);
>          }
>
> +        if (env->features[FEAT_XSAVE] & CPUID_D_1_EAX_XFD) {
> +            kvm_msr_entry_add(cpu, MSR_IA32_XFD,
> +                              env->msr_xfd);
> +            kvm_msr_entry_add(cpu, MSR_IA32_XFD_ERR,
> +                              env->msr_xfd_err);
> +        }
> +
>          /* Note: MSR_IA32_FEATURE_CONTROL is written separately, see
>           *       kvm_put_msr_feature_control. */
>      }
> @@ -3667,6 +3674,11 @@ static int kvm_get_msrs(X86CPU *cpu)
>          kvm_msr_entry_add(cpu, MSR_IA32_SGXLEPUBKEYHASH3, 0);
>      }
>
> +    if (env->features[FEAT_XSAVE] & CPUID_D_1_EAX_XFD) {
> +        kvm_msr_entry_add(cpu, MSR_IA32_XFD, 0);
> +        kvm_msr_entry_add(cpu, MSR_IA32_XFD_ERR, 0);
> +    }
> +
>      ret = kvm_vcpu_ioctl(CPU(cpu), KVM_GET_MSRS, cpu->kvm_msr_buf);
>      if (ret < 0) {
>          return ret;
> @@ -3963,6 +3975,12 @@ static int kvm_get_msrs(X86CPU *cpu)
>              env->msr_ia32_sgxlepubkeyhash[index - MSR_IA32_SGXLEPUBKEYHASH0] =
>                             msrs[i].data;
>              break;
> +        case MSR_IA32_XFD:
> +            env->msr_xfd = msrs[i].data;
> +            break;
> +        case MSR_IA32_XFD_ERR:
> +            env->msr_xfd_err = msrs[i].data;
> +            break;
>          }
>      }
>
> diff --git a/target/i386/machine.c b/target/i386/machine.c
> index 6202f47793..1f9d0c46f1 100644
> --- a/target/i386/machine.c
> +++ b/target/i386/machine.c
> @@ -1483,6 +1483,46 @@ static const VMStateDescription vmstate_pdptrs = {
>      }
>  };
>
> +static bool xfd_msrs_needed(void *opaque)
> +{
> +    X86CPU *cpu = opaque;
> +    CPUX86State *env = &cpu->env;
> +
> +    return !!(env->features[FEAT_XSAVE] & CPUID_D_1_EAX_XFD);
> +}
> +
> +static const VMStateDescription vmstate_msr_xfd = {
> +    .name = "cpu/msr_xfd",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .needed = xfd_msrs_needed,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_UINT64(env.msr_xfd, X86CPU),
> +        VMSTATE_UINT64(env.msr_xfd_err, X86CPU),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
> +static bool amx_xtile_needed(void *opaque)
> +{
> +    X86CPU *cpu = opaque;
> +    CPUX86State *env = &cpu->env;
> +
> +    return !!(env->features[FEAT_7_0_EDX] & CPUID_7_0_EDX_AMX_TILE);
> +}
> +
> +static const VMStateDescription vmstate_amx_xtile = {
> +    .name = "cpu/intel_amx_xtile",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .needed = amx_xtile_needed,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_UINT8_ARRAY(env.xtilecfg, X86CPU, 64),
> +        VMSTATE_UINT8_ARRAY(env.xtiledata, X86CPU, 8192),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
>  const VMStateDescription vmstate_x86_cpu = {
>      .name = "cpu",
>      .version_id = 12,
> @@ -1622,6 +1662,8 @@ const VMStateDescription vmstate_x86_cpu = {
>          &vmstate_msr_tsx_ctrl,
>          &vmstate_msr_intel_sgx,
>          &vmstate_pdptrs,
> +        &vmstate_msr_xfd,
> +        &vmstate_amx_xtile,
>          NULL
>      }
>  };

dme.
-- 
All of us, we're going out tonight. We're gonna walk all over your cars.

