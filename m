Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 747D54BDA05
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 14:53:22 +0100 (CET)
Received: from localhost ([::1]:44612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nM97x-0007bS-IB
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 08:53:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1nM8ie-0003rs-11
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 08:27:15 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:11188)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1nM8ib-00074v-0D
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 08:27:11 -0500
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21LCeB89008921; 
 Mon, 21 Feb 2022 13:26:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : references : date : in-reply-to : message-id : content-type :
 mime-version; s=corp-2021-07-09;
 bh=DztYiQVcMo+nnexfMcIKqvFdDvDlmlRKrOrKfS6aIlE=;
 b=K6eUU6mJl7wDlfMlUWBd3iNQCVdrqFgCKH1ZPhMHiqJiPTRTEN0c0KVgpylZ9wO95mOP
 rBlhrd6/jksoKfvBkE7bdspMmBlq8of5nvfUdj6S+MxCuiSzwx323ad+xqUTsq8OFDYq
 7UG+f619TAyrtzhL1xS/6bA3IVCbY8wYPBKgT2D7j7wuzyZquCtqz49IAL05bMrY5XEs
 iaOepMdxTKrT8Gwu7PtD2nJ+eSn092iyDH0f9OJnxO/qxIb7jf7BJk/L5a98wXV/6uKp
 ap2XvJAYkV0dRG7ffy75DBzse9u/cu8iUAPc4o8h7PyaBkyqZaAapzRwlmcjV6dDrLo3 8Q== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3eaq52c69e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 21 Feb 2022 13:26:02 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21LDGmLT180627;
 Mon, 21 Feb 2022 13:26:01 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2171.outbound.protection.outlook.com [104.47.56.171])
 by aserp3030.oracle.com with ESMTP id 3eapkepwm1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 21 Feb 2022 13:26:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I9un3l+vlLxfuvgkSLabT/vRB+SZR+ZGMATMr9/tNcsIQmRoFYWcmjpklES8WtP6aWeK9N6tP1gqdi+vi4cMVyJ9nBI+cYH6jiXiXfhixO8YdyHqE1Yw3bci0vYKKhD8SPhYlPRuDLwHFjAHEH59d4Zi1nScpeycXt36X5WSjbBISdAxGyBVX9uBg+JPI7tQXMKqHfFPe8vlsQ6m4tvJUkCqP9kXBhtG1eMUGuEekJhKwpKpfM3kRmY0CC+V9AeE3MWMgMpAqdH354RKVBtcQWim38q1DWRdnIhnO1VZ1uLFMMqsR4L/kJpYHdJ+C4ojmT76CiJmCFUKzvWH3FJKaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DztYiQVcMo+nnexfMcIKqvFdDvDlmlRKrOrKfS6aIlE=;
 b=XooC3RnjU6OqX2Ap2VssivRAGGCy+uBsSAjeydaci4dtodDm2eEZ5nldcjEbWHvo/t3Apy0XCP1JSlirKliM/q9RjY6FLqhKx0Uf4oDVjcMApM0ZAFhaG9WuDxYl4dED9DX6dBYqHGUHEbCI0otD1zZU+A/ece0kEEwqNyGg0OOaQ+tyZpaIkjrTg9GSmiJH7UFpMxQvmvGtHZ9KaPfAJFRWJ4X9PwlCIibg2mQI2Q9Dktv5724JcgMXy0VZa2YLbELdXicSN181qRmjmYY5gigTZ85S1hpX2ITazFKQrudHFhVjX5ufNtyBR9fJKITd1K79oJjqw/uwcb1Ky8aCuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DztYiQVcMo+nnexfMcIKqvFdDvDlmlRKrOrKfS6aIlE=;
 b=nC6FGOUqTEpO+zMXxjbASJnFZwEDQY4SKWWayjox1hS+ulSUl97/GvYaDTd8V7JHFhp9v7hTVnECU36V90rEAlohXXECrXraSIBKzCxC2/IVuzysEQa3SGEdvqRYtWeaXOYcwy8CMnrAvSx1sKFreRQFbyFSEq1+xwG/LEd0dSk=
Received: from DS7PR10MB4926.namprd10.prod.outlook.com (2603:10b6:5:3ac::20)
 by PH0PR10MB4598.namprd10.prod.outlook.com (2603:10b6:510:34::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.24; Mon, 21 Feb
 2022 13:25:59 +0000
Received: from DS7PR10MB4926.namprd10.prod.outlook.com
 ([fe80::e429:a820:ef6e:98d9]) by DS7PR10MB4926.namprd10.prod.outlook.com
 ([fe80::e429:a820:ef6e:98d9%6]) with mapi id 15.20.4995.027; Mon, 21 Feb 2022
 13:25:59 +0000
From: David Edmondson <david.edmondson@oracle.com>
To: Yang Zhong <yang.zhong@intel.com>
Subject: Re: [PATCH v2 6/8] x86: add support for KVM_CAP_XSAVE2 and AMX
 state migration
References: <20220217060434.52460-1-yang.zhong@intel.com>
 <20220217060434.52460-7-yang.zhong@intel.com>
Date: Mon, 21 Feb 2022 13:25:53 +0000
In-Reply-To: <20220217060434.52460-7-yang.zhong@intel.com> (Yang Zhong's
 message of "Wed, 16 Feb 2022 22:04:32 -0800")
Message-ID: <cunv8x8nyfy.fsf@oracle.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/29.0.50 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0193.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9e::13) To DS7PR10MB4926.namprd10.prod.outlook.com
 (2603:10b6:5:3ac::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b9368417-9380-41e0-8af0-08d9f53db2ce
X-MS-TrafficTypeDiagnostic: PH0PR10MB4598:EE_
X-Microsoft-Antispam-PRVS: <PH0PR10MB4598B77E2292A3A0AEAB2BA9883A9@PH0PR10MB4598.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Z4IjQvwHc/CeWPlGXDY/CyQ9hmoENLFNCRu9BrOIIcsRgHuYmnYv9dtlPbmuWlPsOP0x4j3fga4LFMpj43ZtTnBpLCpyZsiYSQ2ejBI4B3xsdSUXrTefR+rV0YJxdAP7+7UQOACgHQfLpKAPPZmucr2iFO1QMbZU6Kg1pUDC/eYoK47LZmLKETtLlL4ZXvjb4+/mTtVr+AYr994OUZh3ZfqffVmWYyrzCMKXwEl9kc5PEQYnt66CLJnNaisRyPBpW5vqSNMLZwHuqE2HT+3y3CIggLtYAUqP5m0rRz0D6jQtzVzQXL00PvXqVcXP6bl9bTusnv5az7r4a2r9ZFWpkOS32vNhMYkjrPp6rz8sv8s/aDQml+0x4O9/CuRXJikDsOjeFUIlW4urK1Ggx5BXpmWLPhYwz3q0RVdwHRRcfdWBqJELaY3vJ1eQ1BfvHmeFDLhE/Z5rljQIrD3Sq5UMOTFIaSllu16ieSjk8lJbIXa1OZyK3X/E8S2a4V0I4xAnsBeMpxs5eU61aaT/o68Hqu60uoJzZf5srj5fTkrrwcLIvaoy7b+yqAu9ApwYpWHBYVyEE8BWBj8kivYXI9E1LNv1z44FgynmnEWNIKcfOedZkRFwXWfI8kGW2avLJD3EdCwz10G4AFDxrbxOQDeReQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR10MB4926.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(4326008)(66476007)(8676002)(66556008)(66946007)(83380400001)(6486002)(508600001)(6916009)(316002)(6512007)(8936002)(5660300002)(2616005)(52116002)(2906002)(6666004)(86362001)(186003)(6506007)(44832011)(38100700002)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lHYzfZxUfOpInS2QT9r3rShzYGEKQejCCbMYjrgPXHyNT0jztuAsmqCfKpGR?=
 =?us-ascii?Q?wMPM0wjKD0imDA3p0ojGB35uhvRDxx6EXJy9o2Xd22kvhrg7Cg+8qlDipD5Y?=
 =?us-ascii?Q?Isn3VM9UmvFxQrmqSos1bVxyX2OQTqh7klZYAqiMVtSx9OJjju+zuPSpmueP?=
 =?us-ascii?Q?w+s+5IXXNjt7p2IJVXEh7m5tYbWmZncO76jziHKG9Cl/n2dxU18QcV6q8TjT?=
 =?us-ascii?Q?U/f7wjkJL08jW+7PG92Ap3V/GJfK09NrE3xJZGngU4tBAlpAwoVtdo7mnU0H?=
 =?us-ascii?Q?BABI5rguUqlDufp74oon+iv7QrS0mUZjXFopGCvYYQrxS99AwReoonQzHA9U?=
 =?us-ascii?Q?r9KCEki40ZopwnLaAmGXwoE98aAFLeQy8PqMitaFxA3TJU1DxB+l8Shrcq/S?=
 =?us-ascii?Q?7+sbpzEvrdmxZfvj00MlaPdJ3FfQyEFm0/ks2/drv67M7HIz4etRqEKEAF3m?=
 =?us-ascii?Q?3HWhBZ9EBHXhjpfYG/Wl+1/dbJx7YNgIQDYwsqpGEdhmoMa+HZdLIFG0+aDb?=
 =?us-ascii?Q?jZ1FbNKN6ydiPJ2RxA1E5VR5THTbq50ttcvPAA6OmA1H9CyZB7pUBUUtlA3V?=
 =?us-ascii?Q?uZ/In51JjWSW2xfRY842kzLE7eci39mbKrMj7Y6d2bXVR7vXme5SBJ2R1q2j?=
 =?us-ascii?Q?BaJeC+WVrhL8+KP+OZJNFRM/XlR5ojCbnwDbi/EReaglFRwEYLu00ZMNEGKh?=
 =?us-ascii?Q?C+qdDvomjrD41A9Qp+jkEyRMCHpZVGyTlDVHBjeToU2mB1USuL760JkwPBRN?=
 =?us-ascii?Q?4e4hX5DM5t5IWruPSUTRmx1dcCJYL/p9amYlU7cuY5nvI2aZQrmhVOpIEUMp?=
 =?us-ascii?Q?3aecXeYKRkrLInpBIkx9QB39WuZfCUIg9AefFFFCdUajTxDv7Gqjg83rXZtO?=
 =?us-ascii?Q?7j9jRh5NK91DJLWV3V7dNvK/wNYPt5OEKEABGelU9vwC2fG9MxTRyY9dHxRy?=
 =?us-ascii?Q?fLQQXYAoNVLDEGbVAVDDP1YfBPDc36coRPCOxncirfifgNCSQS3j7H5Jk6DI?=
 =?us-ascii?Q?OyPP+Evdx9CZPo1vR3eOpdX6PxHQzDZXzxqW+SGHyuvMaRtaOhBb0nnSINsu?=
 =?us-ascii?Q?6vfrxVZw4vJ9LHNaqwlc3K82/FzQE9BpanfN7t1dsjAaBGK112PZio2WHM99?=
 =?us-ascii?Q?rGYUH7ZxIJAObCiywGe0Lwrj9gN0et9buLISN3uUnmUWRTaErjmVcnFpBF18?=
 =?us-ascii?Q?pWP2RGyBLbYiG3m8JU0PH/J5d6x27EEHFHrWauopcstimG078yBPHOb2SByy?=
 =?us-ascii?Q?rKXuXq7DGXflSf45OSjYeCjJviUh2Y5ytTutB9GecYUS3cZgHoGtp5UUBKMh?=
 =?us-ascii?Q?TbZwPKpfyp8/mRuawshQR/ZhMJ7HHVotknJ7E3uRF5ED7cEDcbY0zEVMzVV6?=
 =?us-ascii?Q?ibIGBpH/q4aUOh+nI0pDlsL50dLVhppG+wtKDxIGxnn9+S0jCKMMYDN43gsr?=
 =?us-ascii?Q?fLsGdZljksNoHnw4p1lU4WJ4R1/7iNvGgOoYGXM7/6uAHKxITROMMPFu1K/o?=
 =?us-ascii?Q?EytN3KjReMEtdm6zI6w741vR4YNDCx3dgYOK3mg1uh90rSTQD/HWSO30kANQ?=
 =?us-ascii?Q?KCheNZcLc3EE0gg/EI8bYbLzeb0CZB/kvellu/H/4FTReNvatoF/Dk8F1FNw?=
 =?us-ascii?Q?gmsuzPh83Tsl/syPKxUQ5N20e5PUIKzI0FLl0P1OXOoouRTDm1K78FuGaxqB?=
 =?us-ascii?Q?1CCvOZPWQbJYZY1ccg00LtmmM9rh5rsWeJ/o4ml4bBbuxwg8?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9368417-9380-41e0-8af0-08d9f53db2ce
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB4926.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2022 13:25:59.3513 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oacACJJpl4XyNX4GOX5N2XfKzDNmJUSjD/3GT7ZX22BHuoN/0lHD18/MLRgGSgQm2ibHLDc7N58I2WVfi4XBWm2C1XZ2BsZAQN0Ns2PCulo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4598
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10264
 signatures=677614
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 suspectscore=0 mlxscore=0
 spamscore=0 mlxlogscore=999 adultscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202210080
X-Proofpoint-GUID: IjbA_M6oJFq1ZOprU3xTl5AB_kqh2_U8
X-Proofpoint-ORIG-GUID: IjbA_M6oJFq1ZOprU3xTl5AB_kqh2_U8
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=david.edmondson@oracle.com; helo=mx0a-00069f02.pphosted.com
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

On Wednesday, 2022-02-16 at 22:04:32 -08, Yang Zhong wrote:

> From: Jing Liu <jing2.liu@intel.com>
>
> When dynamic xfeatures (e.g. AMX) are used by the guest, the xsave
> area would be larger than 4KB. KVM_GET_XSAVE2 and KVM_SET_XSAVE
> under KVM_CAP_XSAVE2 works with a xsave buffer larger than 4KB.
> Always use the new ioctls under KVM_CAP_XSAVE2 when KVM supports it.
>
> Signed-off-by: Jing Liu <jing2.liu@intel.com>
> Signed-off-by: Zeng Guang <guang.zeng@intel.com>
> Signed-off-by: Wei Wang <wei.w.wang@intel.com>
> Signed-off-by: Yang Zhong <yang.zhong@intel.com>
> ---
>  target/i386/cpu.h          |  4 ++++
>  target/i386/kvm/kvm.c      | 42 ++++++++++++++++++++++++--------------
>  target/i386/xsave_helper.c | 33 ++++++++++++++++++++++++++++++
>  3 files changed, 64 insertions(+), 15 deletions(-)
>
> diff --git a/target/i386/cpu.h b/target/i386/cpu.h
> index f7fc2e97a6..de9da38e42 100644
> --- a/target/i386/cpu.h
> +++ b/target/i386/cpu.h
> @@ -1528,6 +1528,10 @@ typedef struct CPUX86State {
>      uint64_t opmask_regs[NB_OPMASK_REGS];
>      YMMReg zmmh_regs[CPU_NB_REGS];
>      ZMMReg hi16_zmm_regs[CPU_NB_REGS];
> +#ifdef TARGET_X86_64
> +    uint8_t xtilecfg[64];
> +    uint8_t xtiledata[8192];
> +#endif

Can we have defined constants for these sizes? They also appear in patch
2.

>
>      /* sysenter registers */
>      uint32_t sysenter_cs;
> diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
> index 8562d3d138..ff064e3d8f 100644
> --- a/target/i386/kvm/kvm.c
> +++ b/target/i386/kvm/kvm.c
> @@ -122,6 +122,7 @@ static uint32_t num_architectural_pmu_gp_counters;
>  static uint32_t num_architectural_pmu_fixed_counters;
>
>  static int has_xsave;
> +static int has_xsave2;
>  static int has_xcrs;
>  static int has_pit_state2;
>  static int has_sregs2;
> @@ -1585,6 +1586,26 @@ static Error *invtsc_mig_blocker;
>
>  #define KVM_MAX_CPUID_ENTRIES  100
>
> +static void kvm_init_xsave(CPUX86State *env)
> +{
> +    if (has_xsave2) {
> +        env->xsave_buf_len = QEMU_ALIGN_UP(has_xsave2, 4096);

Idle curiosity - why do we round this up?

> +    } else if (has_xsave) {
> +        env->xsave_buf_len = sizeof(struct kvm_xsave);
> +    } else {
> +        return;
> +    }
> +
> +    env->xsave_buf = qemu_memalign(4096, env->xsave_buf_len);
> +    memset(env->xsave_buf, 0, env->xsave_buf_len);
> +     /*
> +      * The allocated storage must be large enough for all of the
> +      * possible XSAVE state components.
> +      */
> +    assert(kvm_arch_get_supported_cpuid(kvm_state, 0xd, 0, R_ECX) <=
> +           env->xsave_buf_len);
> +}
> +
>  int kvm_arch_init_vcpu(CPUState *cs)
>  {
>      struct {
> @@ -1614,6 +1635,8 @@ int kvm_arch_init_vcpu(CPUState *cs)
>
>      cpuid_i = 0;
>
> +    has_xsave2 = kvm_check_extension(cs->kvm_state, KVM_CAP_XSAVE2);
> +
>      r = kvm_arch_set_tsc_khz(cs);
>      if (r < 0) {
>          return r;
> @@ -2003,19 +2026,7 @@ int kvm_arch_init_vcpu(CPUState *cs)
>      if (r) {
>          goto fail;
>      }
> -
> -    if (has_xsave) {
> -        env->xsave_buf_len = sizeof(struct kvm_xsave);
> -        env->xsave_buf = qemu_memalign(4096, env->xsave_buf_len);
> -        memset(env->xsave_buf, 0, env->xsave_buf_len);
> -
> -        /*
> -         * The allocated storage must be large enough for all of the
> -         * possible XSAVE state components.
> -         */
> -        assert(kvm_arch_get_supported_cpuid(kvm_state, 0xd, 0, R_ECX)
> -               <= env->xsave_buf_len);
> -    }
> +    kvm_init_xsave(env);
>
>      max_nested_state_len = kvm_max_nested_state_length();
>      if (max_nested_state_len > 0) {
> @@ -3319,13 +3330,14 @@ static int kvm_get_xsave(X86CPU *cpu)
>  {
>      CPUX86State *env = &cpu->env;
>      void *xsave = env->xsave_buf;
> -    int ret;
> +    int type, ret;
>
>      if (!has_xsave) {
>          return kvm_get_fpu(cpu);
>      }
>
> -    ret = kvm_vcpu_ioctl(CPU(cpu), KVM_GET_XSAVE, xsave);
> +    type = has_xsave2 ? KVM_GET_XSAVE2 : KVM_GET_XSAVE;
> +    ret = kvm_vcpu_ioctl(CPU(cpu), type, xsave);
>      if (ret < 0) {
>          return ret;
>      }
> diff --git a/target/i386/xsave_helper.c b/target/i386/xsave_helper.c
> index ac61a96344..b6a004505f 100644
> --- a/target/i386/xsave_helper.c
> +++ b/target/i386/xsave_helper.c
> @@ -5,6 +5,7 @@
>  #include "qemu/osdep.h"
>
>  #include "cpu.h"
> +#include <asm/kvm.h>
>
>  void x86_cpu_xsave_all_areas(X86CPU *cpu, void *buf, uint32_t buflen)
>  {
> @@ -126,6 +127,22 @@ void x86_cpu_xsave_all_areas(X86CPU *cpu, void *buf, uint32_t buflen)
>
>          memcpy(pkru, &env->pkru, sizeof(env->pkru));
>      }
> +
> +    e = &x86_ext_save_areas[XSTATE_XTILE_CFG_BIT];
> +    if (e->size && e->offset) {
> +        XSaveXTILECFG *tilecfg = buf + e->offset;
> +
> +        memcpy(tilecfg, &env->xtilecfg, sizeof(env->xtilecfg));
> +    }
> +
> +    if (buflen > sizeof(struct kvm_xsave)) {
> +        e = &x86_ext_save_areas[XSTATE_XTILE_DATA_BIT];
> +        if (e->size && e->offset && buflen >= e->size + e->offset) {
> +            XSaveXTILEDATA *tiledata = buf + e->offset;
> +
> +            memcpy(tiledata, &env->xtiledata, sizeof(env->xtiledata));
> +        }
> +    }
>  #endif
>  }
>
> @@ -247,5 +264,21 @@ void x86_cpu_xrstor_all_areas(X86CPU *cpu, const void *buf, uint32_t buflen)
>          pkru = buf + e->offset;
>          memcpy(&env->pkru, pkru, sizeof(env->pkru));
>      }
> +
> +    e = &x86_ext_save_areas[XSTATE_XTILE_CFG_BIT];
> +    if (e->size && e->offset) {
> +        const XSaveXTILECFG *tilecfg = buf + e->offset;
> +
> +        memcpy(&env->xtilecfg, tilecfg, sizeof(env->xtilecfg));
> +    }
> +
> +    if (buflen > sizeof(struct kvm_xsave)) {
> +        e = &x86_ext_save_areas[XSTATE_XTILE_DATA_BIT];
> +        if (e->size && e->offset && buflen >= e->size + e->offset) {
> +            const XSaveXTILEDATA *tiledata = buf + e->offset;
> +
> +            memcpy(&env->xtiledata, tiledata, sizeof(env->xtiledata));
> +        }
> +    }
>  #endif
>  }

dme.
-- 
Why does it have to be like this? I can never tell.

