Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A6554BDA06
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 14:53:23 +0100 (CET)
Received: from localhost ([::1]:44586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nM97x-0007ab-QP
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 08:53:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1nM8JV-0001t3-Fn
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 08:01:18 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:25838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1nM8JE-0002iQ-14
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 08:00:57 -0500
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21LCr58I002355; 
 Mon, 21 Feb 2022 13:00:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : references : date : in-reply-to : message-id : content-type :
 mime-version; s=corp-2021-07-09;
 bh=C66czpQjHatB/aW6UCNiFZdMCa5IMso77IkTzh0FZME=;
 b=ey7mvP38VMQjq/HK1klQCsChDwzYKlMW9lxkLvtNQoXQCXCYcW6HGBEsIa0PNbeiwfVz
 wyep7GpzNmOYan70ub+aEsdZqDfYaVObbUhUSIt+IFoBrySvHXZQP/iI8+oEWRCLSoTD
 Vu16QJBKj6QzuCEeNn5sOKtsN0ttoyhF/uSMZ6IcZjVoL+Or3XoZu87TeC8nG9RsaOoa
 MyluKf012kVxhV7m2LpyFPbg+AaGWvbBxoRAB8Flr1ohTPf2/D0u9AjTRcCWqUm6jtlQ
 9fzpkgxpk+Usp1Ff2ba5djrDFhAA4HXzgnJm6W3TJqKuIpDcqwYfejy6bdMFJr2ZfljZ Eg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ear5t42dc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 21 Feb 2022 13:00:49 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21LD0QCs011937;
 Mon, 21 Feb 2022 13:00:49 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2174.outbound.protection.outlook.com [104.47.59.174])
 by aserp3020.oracle.com with ESMTP id 3eb47yny6t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 21 Feb 2022 13:00:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WQyMJd5p/mGhsYHeIncMqBKLLDiPcvl7hvXsGHiwL3JtSAPhK4tkCGF37QhjDFxHO+STLU4DnrBkOiAYso6zzm98l5r0CSDbJ8Hxn91oxpusb2cxmXRIqHOhhdY5lbnfLCXZKgSRqgJqs978J3xpUTyH/gAYIyru1fhgsvOnVlX5q9ueQCQpZz+T8uiuK4h8BqAo+mk9lPG7TmBcxaSm6NbH4UbHQCuwzPc/E4ESIifqzMIOeHsDd9cJ0v0rz9hSevGLkSP2TqqCKvoGeB/+SoN/zktv0raxicE6oGuuYMYNZviyoeNdRtB6HwViX/vbcZHSEGPjPmL32yGtl97oCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C66czpQjHatB/aW6UCNiFZdMCa5IMso77IkTzh0FZME=;
 b=OVcMv7EMakVNUR/zS917m6vxImibUfDap+6xtZV1vHhrVtuSTj+AjNxLCnEOmf9EtxSAyKxCb25TuZTq3h1KqMElAAVwuvcbpvqGCvlbwsjArmyJDMHo9Xosv27B2Vjl7DEXjEwethihkNAOKdsfRHho9Gd3fPaghuE0kAbEiVYT23ijikz6GGFKrFtoa6+ikaS9fSNgC4CC2ZTSQZs6IIifmKsPOZYv4kRUPvVaJI4Uex7TgiGsI2Tcdw2RDmXsXA2TJy6JmZa4kSDo796MQLDZ4yGdtKZEB4/wh5rkHoUcAG3IFutQDdNVN/yJw5XNlXWAoB834NywD4QEuab7kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C66czpQjHatB/aW6UCNiFZdMCa5IMso77IkTzh0FZME=;
 b=SYCblSy8BqPgbwXkX9YGtreVnfSVnF6YVLnupgKg9hVlGHUlsXUJ3fTBhEcp/9l3YBUXTvDqqr4f/xp3LrYiLx8i8svihIowbTGzf5VzBCd0GFmcMYjbPQJtcVrkbJA3D1+kncqBS4+hz/XYo9aCB0qb2Q5pvWh6teWuVkDJ16U=
Received: from DS7PR10MB4926.namprd10.prod.outlook.com (2603:10b6:5:3ac::20)
 by BY5PR10MB3873.namprd10.prod.outlook.com (2603:10b6:a03:1b0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.14; Mon, 21 Feb
 2022 13:00:47 +0000
Received: from DS7PR10MB4926.namprd10.prod.outlook.com
 ([fe80::e429:a820:ef6e:98d9]) by DS7PR10MB4926.namprd10.prod.outlook.com
 ([fe80::e429:a820:ef6e:98d9%6]) with mapi id 15.20.4995.027; Mon, 21 Feb 2022
 13:00:46 +0000
From: David Edmondson <david.edmondson@oracle.com>
To: Yang Zhong <yang.zhong@intel.com>
Subject: Re: [PATCH v2 4/8] x86: Add XFD faulting bit for state components
References: <20220217060434.52460-1-yang.zhong@intel.com>
 <20220217060434.52460-5-yang.zhong@intel.com>
Date: Mon, 21 Feb 2022 13:00:41 +0000
In-Reply-To: <20220217060434.52460-5-yang.zhong@intel.com> (Yang Zhong's
 message of "Wed, 16 Feb 2022 22:04:30 -0800")
Message-ID: <cun1qzwpe6e.fsf@oracle.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/29.0.50 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0009.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:150::14) To DS7PR10MB4926.namprd10.prod.outlook.com
 (2603:10b6:5:3ac::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 534ea0f1-29d4-4789-8cd2-08d9f53a2d64
X-MS-TrafficTypeDiagnostic: BY5PR10MB3873:EE_
X-Microsoft-Antispam-PRVS: <BY5PR10MB38735F932424AFA81A50CA02883A9@BY5PR10MB3873.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: x45p2VBCoeRutzY6MBX6MGnl0003++TdtHkvpJVY0dndiT+Qjy+vF3H2sM7NjkNYzsO//0+DGgnc1xnnjBR2zBLtNqlA0ARCyVYuo6+XqsFO8h/1y6w7+gYKVag6TedFhcQXtzB4IGVuBKGphvhAJ93TbhfaYQsXnph9lAOPAWO1GKrDsox6DiK+Nhg7zdTvYvJAqujt3+h2IYotJdFc1q1AJfwQ9BJabrlcLCWj5hf3Kga4MwlLV0+ta4wO902TqCx6ghtoDPKPIGGM06EYEOkvTGXpK7t7hS9Xhh3sVaM/RRhW76Oqkd1XSa3OGDwXcVefG9SaFgrgv4ymnxC4XyTiD27g7w/BgQVfRXN5dU5wojARGYb1W1CnORhv5XKunAq6Ogxtzfop2af6fvQbAiRtjrPtNznn980Gu/JvsJlkRibUv76Kwv6ahM5EzkDxlYK83KnVCdc7zJgmYK4xu3iLGf51x8+lCzm0alr+ptGFUVBQw6iGM8NBvV49KXuD7spsc+WXY0BxcLRDxW/+8dFQJDbKsgeQ/rwBNsU4tLNaYy4hoFmtFTtfx5TFL5rjoGogsPsGLt2bbq75X2JC5LZiTf6Mhxy5ttniBfJeVwAoFYV3kS03GA3a5tWMw9S2Kq5iX1nA34+UxGkhe6Xm+Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR10MB4926.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6506007)(66946007)(5660300002)(4326008)(316002)(6512007)(6666004)(66556008)(2616005)(66476007)(508600001)(6486002)(186003)(83380400001)(36756003)(6916009)(44832011)(8676002)(8936002)(38100700002)(2906002)(52116002)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9PKA5A8PUVng+E5PMuYLroHcmIxA03aNdei9D47uK4Ww+sMaU8GEG4j55vdw?=
 =?us-ascii?Q?oWVQmGwOa0nQ7+KyuEFQOAoHXA/GZOl+VPz6FK6rlnR66HynXPpJVlOdtU3W?=
 =?us-ascii?Q?jxqn7L2levyrr8AlAyngZo2jwQDbA6IE6g2PpMV4P8CZFu4YHmO90PFwNYsY?=
 =?us-ascii?Q?Qfw/WpgmHaAufRMKi7afwaGAdvQYDqeyXe0koTLPXf0mWX1GfyGoRlE5UuOe?=
 =?us-ascii?Q?h0n9d44u1c/otT9MxZUsPRpOa45gv5vZbg28zuayhwYZxJgpYUuI2h9ryJk3?=
 =?us-ascii?Q?Blhv+047ethmNGfC/iI7zVywsViAvMbS+GZ0/87Vs2Mw/Cj0up2FTwKeNaph?=
 =?us-ascii?Q?38AF4qW8liRxdgpCfl4duX7qR7HxjMxuIHuOPDj3IeTyhbzr/OCQQ7E2SvdF?=
 =?us-ascii?Q?f35SQ1V0CVEalAqDVsiY5ud5ONVzBqHjISIPp0cFadbj3cczvaaz3lXK0Ls/?=
 =?us-ascii?Q?QovTtnkW6/Eqao/FCGUiN8Ohm5pqCkutNHXQXCyNVx2NoYD31DZrWFUP9rj8?=
 =?us-ascii?Q?Nub9a6pl9hA1+xYMxIGIFRbTiWHn0bnGvTwaaZfIO6eEcdwLFxU+lRQSUy0s?=
 =?us-ascii?Q?8wyZLeSiAsmFYxjrxRd49qKj9NcVkwP/+PP17Ab7rZK8U8ZaLKzRNJPzQXaA?=
 =?us-ascii?Q?Fh18kqdveLfxsgx/V1UMInwn7wojy69tepvwA1ce0Nwxh/d7be14JucLI3C1?=
 =?us-ascii?Q?MXYk+JSgx7I7tRr8Lk6gg19AgpiIpewbctrD0yU9MaoRz0zXOv9cGBo6D1PI?=
 =?us-ascii?Q?eKeQa/id2svkT2iKOBFmxhcnDRcPeET/MEUB+kYYaYDEre0JVwFcYz2rIidC?=
 =?us-ascii?Q?Plvo8CG9yg9/TcTfxeHTEAsF5ake31SwM2Ift78f6ekZxWcGNTQw3GNFPK0N?=
 =?us-ascii?Q?x4sqHb+kPUQ2dBMNNwsf+gdMTu3Gjm6pN31eNSW/soJARKdX3VLPj8mj11si?=
 =?us-ascii?Q?/w+wCeK3HACSctJ+hxAGgoYhXTI2+35Dcax1T0sTMwwq8ft5n9NWOKmgpJ4Y?=
 =?us-ascii?Q?Z3UKYz8KIGSDP2YRWYR7aCKAN3YZdyQ2TVOj+JcW2OE+B/MEBeWNI/mCLp3g?=
 =?us-ascii?Q?NlU764ygDim282vA9ekla3dTe9dgiYUph6JxY7MHg7FKBfOVLUgYS3O2/dnE?=
 =?us-ascii?Q?tVKswzNPiPiNA8ujvosKUzIMZAAlKAB7DCdPKuBgtlc4i04tF6M0JLxfqTQY?=
 =?us-ascii?Q?YaGC9d0/ZuWcI6AYSxL6rA/MIJ6DlNjVEDL45MMxk/LabzYAtRXGgj9GfOu/?=
 =?us-ascii?Q?izc+qbNht6NXM0KSOXjiAJB3FyzEoBj3ai5VrDTuOw941GS+9T8hrkYPoggk?=
 =?us-ascii?Q?tHsB6QO1TOa3KYQlh/pwIkS5efSrFqPttDa5fxn3UkA/DjdFI39R594fcCD1?=
 =?us-ascii?Q?eZtGoz3vaMs70MA5VjLve7nEhUahKux2vgesE34W46LsBngxqe3vMjVSuXEc?=
 =?us-ascii?Q?QcH1t3Ct3BYfRPVlHmjLLRioIyN0YJH3bADu0SOFrZvTxyRnEpqBIpR5TiA5?=
 =?us-ascii?Q?dFCNYFMyfZuEJrtehc5vBrNwq5omS0xU7taqIEYD+zVsRQkzpq7eDvPITNvM?=
 =?us-ascii?Q?EuZiMjNxJWJULTT3SN1w39bVUc9GLYPiaXfgc9Hvh27fnBiwVkDAAN2qUB4G?=
 =?us-ascii?Q?eNl6+urLwIS3+zRwT16QLfAtRMS5AlVt2214Mg/WLi9/wII3n+K+fQO6mh65?=
 =?us-ascii?Q?ScZD7VFNMMtANSqfef6asRE1sQqXQcL2cp42Iiiqs8puhbzc?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 534ea0f1-29d4-4789-8cd2-08d9f53a2d64
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB4926.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2022 13:00:46.9202 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5k0eixPLkkgN9S6HPEcK8Zfqi6XMxZ84hWVUPClyMJdL9EsXMuCKtbUcgDApjHdDgzfFL0yBUI12JDDGpJZSvkB6sTyA/qAsH6Uwc0/clkc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB3873
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10264
 signatures=677614
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 malwarescore=0
 mlxlogscore=999 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202210078
X-Proofpoint-GUID: 1xo6LSlJlDtPpuSvELiNsJuwho9WhtRy
X-Proofpoint-ORIG-GUID: 1xo6LSlJlDtPpuSvELiNsJuwho9WhtRy
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

On Wednesday, 2022-02-16 at 22:04:30 -08, Yang Zhong wrote:

> From: Jing Liu <jing2.liu@intel.com>
>
> Intel introduces XFD faulting mechanism for extended
> XSAVE features to dynamically enable the features in
> runtime. If CPUID (EAX=0Dh, ECX=n, n>1).ECX[2] is set
> as 1, it indicates support for XFD faulting of this
> state component.
>
> Signed-off-by: Jing Liu <jing2.liu@intel.com>
> Signed-off-by: Yang Zhong <yang.zhong@intel.com>

Small comment below...

Reviewed-by: David Edmondson <david.edmondson@oracle.com>

> ---
>  target/i386/cpu.h | 2 ++
>  target/i386/cpu.c | 3 ++-
>  2 files changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/target/i386/cpu.h b/target/i386/cpu.h
> index d4ad0f56bd..f7fc2e97a6 100644
> --- a/target/i386/cpu.h
> +++ b/target/i386/cpu.h
> @@ -558,8 +558,10 @@ typedef enum X86Seg {
>  #define ARCH_REQ_XCOMP_GUEST_PERM       0x1025
>
>  #define ESA_FEATURE_ALIGN64_BIT         1
> +#define ESA_FEATURE_XFD_BIT             2
>
>  #define ESA_FEATURE_ALIGN64_MASK        (1U << ESA_FEATURE_ALIGN64_BIT)
> +#define ESA_FEATURE_XFD_MASK            (1U << ESA_FEATURE_XFD_BIT)
>
>  /* CPUID feature words */
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index 377d993438..5a7ee8c7e1 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -5497,7 +5497,8 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
>                  const ExtSaveArea *esa = &x86_ext_save_areas[count];
>                  *eax = esa->size;
>                  *ebx = esa->offset;
> -                *ecx = esa->ecx & ESA_FEATURE_ALIGN64_MASK;
> +                *ecx = (esa->ecx & ESA_FEATURE_ALIGN64_MASK) |
> +                       (esa->ecx & ESA_FEATURE_XFD_MASK);

Is:

                *ecx = esa->ecx &
                       (ESA_FEATURE_ALIGN64_MASK | ESA_FEATURE_XFD_MASK);

not more usual?

>              }
>          }
>          break;

dme.
-- 
All of us, we're going out tonight. We're gonna walk all over your cars.

