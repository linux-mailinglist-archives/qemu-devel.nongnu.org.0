Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FCE04C115C
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 12:35:15 +0100 (CET)
Received: from localhost ([::1]:53428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMpvN-0004qu-LA
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 06:35:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1nMprM-0003bI-0X
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 06:31:04 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:59604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1nMprH-0002SI-KZ
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 06:31:01 -0500
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21N9K0GA006168; 
 Wed, 23 Feb 2022 11:30:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : references : date : in-reply-to : message-id : content-type :
 mime-version; s=corp-2021-07-09;
 bh=1HO9mp7kgFUP25NSx+OOafHbzZ0RchuK60TRJYtaYXg=;
 b=VBkkiNyXHQn/sdYHDmX04IMj3CR/P0A2Wvz1QZnG6Fwg6WY/W8MQ0k5p3HNhb+BUbVaS
 v7PUT2rfyvTLtuJOj99XpNl/c4l8tKCw9XGS/qdJhc0BROrJc+YoeJPrVhfmBy4q6Jn4
 DVrytUJWHLutlms5KUbQYGHsy3sYSoHmnjSGiW+2sWP+h0W3hFbDpa0iaHjrCmE2kQ4y
 YFUzbRxQ0KklQ4RLzrW0hq2HZn/epWrUlkjV1TTUYoxgmERpeU+44Si6lMzwviFGbmSr
 qWSSIrE30SLeO+GTWqz2FZcREzQG6gZvnHGsUNkGP/XTNahO0JmmqX6L5kPylXCxmhiE Ng== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ect7akyq0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 23 Feb 2022 11:30:50 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21NBUVZa018124;
 Wed, 23 Feb 2022 11:30:49 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1anam02lp2049.outbound.protection.outlook.com [104.47.57.49])
 by aserp3020.oracle.com with ESMTP id 3eb482bdaw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 23 Feb 2022 11:30:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mweCNFmncf/+H5+XYw+PgwaZA0+m1Cdk5rWRsKV/DgcOTZruvKIySf4ll/YbSbYNjA4Qspvoft7t1TSHg/RskxDzlAMDE9fnCMhSE8knlgquGPtjQx4ZcNuoa0DLIoj9momVCTKFCN6UUfjvY/7adSHlD0DIBNjolJQ99Iq6OyySBkJz9BOk/FOGBJzS8xoglzU7T0Khuy/Zr79hGsRUafWsatG6FLnhB8ljbr3HqtBJL4VOqmb7bnJzOtSjD+NLjeyIhwyosSrFTMpDTzo3irsB24F391nr5jEbQTg9xcoWnkJiloAq0RUlR/bwhF27gjKha0b4px0ardbz/jx65g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1HO9mp7kgFUP25NSx+OOafHbzZ0RchuK60TRJYtaYXg=;
 b=jo1VRI60AhIjbOVWp/mzHtZpHKKP8G8u9lFlz4oh9//g4iJHEUYe5XIEv7SnaYG3vyyxJqct8EvVgDmPxy2zZdnWZVWtM+r5oZxdgrBAsUsocpydz50+FjFCmg8vPqgihsRyAl223PiNYvaaIxd/cpx7ZK39UByPfqZr0n4vDvfec9pzX9Gl523vPRKWoPXoP6sqYAfCwvLHZgd8k4cixSX3kn5undtaa3BA/xkFhF7r0YVdj7B4d1wMdIGVbnLu9moPJwEYyfJIA9Axei4xjE+5C2dEps0qkLPsdOKE4qc5MkDoVoy0BM/9v9kPTaSzpg9r9/nAQ0d6F9q1Y7swYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1HO9mp7kgFUP25NSx+OOafHbzZ0RchuK60TRJYtaYXg=;
 b=nnERrQ0d7kt9hddBcOgkRCer5e4oNj1IcZwlVwO+ucegpDmesum4eOouc5ss7saFcyQv87PgLb6hATyNapb7ATcj8QYsgk3VuTKtfvw2sPowGBoVlH2LBKWDcJnG4zxxnSqRtAggabh4YTd5HVkvOl/h6QYKQSsotWmMcEgdOw8=
Received: from DS7PR10MB4926.namprd10.prod.outlook.com (2603:10b6:5:3ac::20)
 by SA2PR10MB4763.namprd10.prod.outlook.com (2603:10b6:806:117::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16; Wed, 23 Feb
 2022 11:30:48 +0000
Received: from DS7PR10MB4926.namprd10.prod.outlook.com
 ([fe80::e429:a820:ef6e:98d9]) by DS7PR10MB4926.namprd10.prod.outlook.com
 ([fe80::e429:a820:ef6e:98d9%7]) with mapi id 15.20.5017.022; Wed, 23 Feb 2022
 11:30:48 +0000
From: David Edmondson <david.edmondson@oracle.com>
To: Yang Zhong <yang.zhong@intel.com>
Subject: Re: [PATCH v2 5/8] x86: Add AMX CPUIDs enumeration
References: <20220217060434.52460-1-yang.zhong@intel.com>
 <20220217060434.52460-6-yang.zhong@intel.com>
Date: Wed, 23 Feb 2022 11:30:44 +0000
In-Reply-To: <20220217060434.52460-6-yang.zhong@intel.com> (Yang Zhong's
 message of "Wed, 16 Feb 2022 22:04:31 -0800")
Message-ID: <cunilt5om57.fsf@oracle.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/29.0.50 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0347.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18d::10) To DS7PR10MB4926.namprd10.prod.outlook.com
 (2603:10b6:5:3ac::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 19159eeb-304c-4193-b79a-08d9f6bff024
X-MS-TrafficTypeDiagnostic: SA2PR10MB4763:EE_
X-Microsoft-Antispam-PRVS: <SA2PR10MB4763F7040F6EA3038C50A627883C9@SA2PR10MB4763.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v91BsYxeFxfj4PKqADgqWD1p1TwII7vfI03hBrUJENbSuta1g/+i/BIJjy5uYeJr/KMXwvT0PS8+sLYSby18jmlxwmJ5/bbj25ERDYrrigcxM/9dMA0Kuo+Jr8Fz/NQlUIKKUNgBoWQVczqF05ZLnvJUB+3cm2ebWyGG5LuqhU9qFAVyplbQ9U6qBZCos6JqnGdjfUr9dzH1xtUMzz15Db2Fe9JA9VJI8jCecFF0NaeYT616AZrjYrDzWsy5BCau4n7xVsoh/QCbLPwEkV3DSEXLF7W3XRSP3TmhsWRWw4iVpkOlblgQd7fsbhq3y3DNDVT+7H9q2VIcy9P7rTuTQcAM4f6v7ln3OmK/ao4P7yiw6ep1H8cSctj5oYfnAx2Ro5wISpor75mifa1lg18ujiKvnGeA2iUTmVTiqmeb88Xqf0TYkK6BuZKpTCMOzSSgUhBKq9TxuhCibvvxXkUA6IFNrFWbGeS/+z0cSA4yxtAfbgZ0jzkrx5ofiqhWufBFXSyYEQ9vb34dmDKm7ufzh6avlBXabJ4mN9fahssF1QoZ6yV6+YG8WZCxYCVDqT5T32I5zITtoe+yqJLIj1mQMdvXb4gIgnWLxEmv1k/5L/hmeo+rMgNM9ue8tgk8BV3C77WV0AdP0FSQZ1KsrX8VeA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR10MB4926.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(4326008)(83380400001)(8676002)(316002)(6916009)(508600001)(66476007)(6486002)(66556008)(66946007)(6512007)(8936002)(5660300002)(2616005)(38100700002)(2906002)(6666004)(36756003)(186003)(86362001)(6506007)(44832011)(52116002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vJHlSk/r6R0MIcIdgvjjY2uw2TWBA9Cms2xv7c4W1FJRZKGrfmLdOc7IJSqM?=
 =?us-ascii?Q?RPKHVaxaxf2AMp9N61HO5HgKZNMQDWMAT7i/KPjn04WqsqNI5AuWvaFGmNXO?=
 =?us-ascii?Q?gjs1Rqj9GRXACaCTDDfV5reSmyps8iAOgW3TfLHifFBziZJbnNPYr6kebOPJ?=
 =?us-ascii?Q?S3T9XKECyFCflQLpxpVQpO6pc5bZWlhkiEvq7ITHdOq4FrgFdEmYBhkKtIbP?=
 =?us-ascii?Q?TvINbrex+3GekCUAqLMpi7tvjKW6HiNLQ0cOx787csKps6LCgp4LvhW7xIu5?=
 =?us-ascii?Q?E04LpjxdeObJv8n+/QNlOGhzLJdqM8sep9prCWMCAIo00WqtvQOiPv1JQE9n?=
 =?us-ascii?Q?dP0JeFflxJ3+ry7ob+kMQ3URbcRm6cbc1PkEbp0ecKGo1reM9C+LUpgpQnXP?=
 =?us-ascii?Q?ta004orEfupPuGrXHHYBJwmTxOgLsYJQEgSLGQ8rdDFIHI/b19lx0CtkURLd?=
 =?us-ascii?Q?UIw/eCCrvu7rv2NsyctLKqjRWVSx5IVRmx6mJCEZHOx9TXzyPGb0/v2Cuf1D?=
 =?us-ascii?Q?nMJf7x79go1akMSo2EKG2iwPKjx9/NeiB+24vCWi45y1anAKnLxtJIbGpvaY?=
 =?us-ascii?Q?pZAP/zRzoTEOzc7ZVqflQUq4+Iay+UFmJIXZ5WvEw/BIOtr59ppAJa4r7xhK?=
 =?us-ascii?Q?IEV71MvKzX8X3bmIXgKoYU8XFEx34UR3vT+4Xq7UlA5TEhrCkZnBew5NpKu1?=
 =?us-ascii?Q?QCLRi7HCdZrbl/AJ7AFO60pTXge/3N330mi3pRI7qqjBLP8Y3fmAdK2cK0RS?=
 =?us-ascii?Q?OZA8wPrIn602gyd1YLuIMPnQjlX0XTJmoHeuhxv7AhutZWikF92FOZ2FiA7r?=
 =?us-ascii?Q?I9U2xPAWd+5urbo7vPgWsuuxNp0/9rt9ClNlajeMmS0jngSGRa3/c1pVOIt0?=
 =?us-ascii?Q?EnILuyJcJkcP8Ve8Me3++BAIOQUKIJyf8m+cxfAEsMoupmRvKLCbqf1VS6mL?=
 =?us-ascii?Q?JomRCJ1PIzTlbH+3uRV7MELX3XDixtwq//RVt5tFHgcc+tCHcUni1AG+pF/z?=
 =?us-ascii?Q?ZCgbv55zBPM+rkJUNUtkJi/EJaJRo2w0bKCPvG0vO1fINs8SEBZJZN5fjcYw?=
 =?us-ascii?Q?XTdJni9jaTu69LlEkNmmll51DofWY2y92RcBg/jfMTjCAXFBIaiJpisiqT/U?=
 =?us-ascii?Q?dWimkvi/HLt3XGH6ItRZqZuBwy4z1/uTCLFY80q2/JiFzQRPM7kXfxto0N3W?=
 =?us-ascii?Q?7/k86mTjBVn0AlSxrjLTaMPW1jDrp421QPU7Z6RvxVy/ng0ed+MpuXiiA1t1?=
 =?us-ascii?Q?l5K3QRXJrOP+gfWlaJnss0aFdwHZa9qIiKW641n7r87cS//U0juQ3NvjBh3D?=
 =?us-ascii?Q?2hJClTCcNMdkg2/j53Cu0fy6fFFtwPobRiJt/xkBoWoivfogBRGrDMlWjUcn?=
 =?us-ascii?Q?+96NPmUVclJjxjwNN6ff3RH7LOYG99AmiRaAj/bqMQUJINRV6aqVZN007Scf?=
 =?us-ascii?Q?i3tuWvppySUwi2lqRwXaTmfR1KWxMLtu1L/ynGkI6TgxwehHBC93LOhNXczh?=
 =?us-ascii?Q?vY36HKTAw1mzXr17idRHmdU0OxJY9fIsMAZOK0CWr9Ki6adLv0Nnm7m+ZZ8s?=
 =?us-ascii?Q?ItM/bnq4pwZGDCRui7vfxNov55GMlqaHt2w6fAp6gqMIW44WeperbtmTodsZ?=
 =?us-ascii?Q?ZIipioilotZ5OLZNyIiFH7VL7oTyjvDgWnPnTsMad3pXm5pnOE2pY3pNufPk?=
 =?us-ascii?Q?+GCYjgohHSV4jjrR0wEkqaG642plXX2wvysCcvMZp6l1NoLE?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19159eeb-304c-4193-b79a-08d9f6bff024
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB4926.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2022 11:30:47.9409 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E3AXUpwY+Bcn9TgBBYSg07JHtgTukhmsYiuJu+j5IOjnXswipa6TeJegoyquAVCklaHEvRPg8Q8lJ0+E3TpK0AjBrriSvWrjQhFN+DFpzXY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4763
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10266
 signatures=677939
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 malwarescore=0
 mlxlogscore=999 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202230064
X-Proofpoint-GUID: VFVg651COxV_Ki88VZSjc6-wOwclXTSo
X-Proofpoint-ORIG-GUID: VFVg651COxV_Ki88VZSjc6-wOwclXTSo
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

On Wednesday, 2022-02-16 at 22:04:31 -08, Yang Zhong wrote:

> From: Jing Liu <jing2.liu@intel.com>
>
> Add AMX primary feature bits XFD and AMX_TILE to
> enumerate the CPU's AMX capability. Meanwhile, add
> AMX TILE and TMUL CPUID leaf and subleaves which
> exist when AMX TILE is present to provide the maximum
> capability of TILE and TMUL.
>
> Signed-off-by: Jing Liu <jing2.liu@intel.com>
> Signed-off-by: Yang Zhong <yang.zhong@intel.com>

Reviewed-by: David Edmondson <david.edmondson@oracle.com>

> ---
>  target/i386/cpu.c     | 55 ++++++++++++++++++++++++++++++++++++++++---
>  target/i386/kvm/kvm.c |  4 +++-
>  2 files changed, 55 insertions(+), 4 deletions(-)
>
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index 5a7ee8c7e1..2465bed5df 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -576,6 +576,18 @@ static CPUCacheInfo legacy_l3_cache = {
>  #define INTEL_PT_CYCLE_BITMAP    0x1fff         /* Support 0,2^(0~11) */
>  #define INTEL_PT_PSB_BITMAP      (0x003f << 16) /* Support 2K,4K,8K,16K,32K,64K */
>
> +/* CPUID Leaf 0x1D constants: */
> +#define INTEL_AMX_TILE_MAX_SUBLEAF     0x1
> +#define INTEL_AMX_TOTAL_TILE_BYTES     0x2000
> +#define INTEL_AMX_BYTES_PER_TILE       0x400
> +#define INTEL_AMX_BYTES_PER_ROW        0x40
> +#define INTEL_AMX_TILE_MAX_NAMES       0x8
> +#define INTEL_AMX_TILE_MAX_ROWS        0x10
> +
> +/* CPUID Leaf 0x1E constants: */
> +#define INTEL_AMX_TMUL_MAX_K           0x10
> +#define INTEL_AMX_TMUL_MAX_N           0x40
> +
>  void x86_cpu_vendor_words2str(char *dst, uint32_t vendor1,
>                                uint32_t vendor2, uint32_t vendor3)
>  {
> @@ -845,8 +857,8 @@ FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
>              "avx512-vp2intersect", NULL, "md-clear", NULL,
>              NULL, NULL, "serialize", NULL,
>              "tsx-ldtrk", NULL, NULL /* pconfig */, NULL,
> -            NULL, NULL, NULL, "avx512-fp16",
> -            NULL, NULL, "spec-ctrl", "stibp",
> +            NULL, NULL, "amx-bf16", "avx512-fp16",
> +            "amx-tile", "amx-int8", "spec-ctrl", "stibp",
>              NULL, "arch-capabilities", "core-capability", "ssbd",
>          },
>          .cpuid = {
> @@ -911,7 +923,7 @@ FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
>          .type = CPUID_FEATURE_WORD,
>          .feat_names = {
>              "xsaveopt", "xsavec", "xgetbv1", "xsaves",
> -            NULL, NULL, NULL, NULL,
> +            "xfd", NULL, NULL, NULL,
>              NULL, NULL, NULL, NULL,
>              NULL, NULL, NULL, NULL,
>              NULL, NULL, NULL, NULL,
> @@ -5587,6 +5599,43 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
>          }
>          break;
>      }
> +    case 0x1D: {
> +        /* AMX TILE */
> +        *eax = 0;
> +        *ebx = 0;
> +        *ecx = 0;
> +        *edx = 0;
> +        if (!(env->features[FEAT_7_0_EDX] & CPUID_7_0_EDX_AMX_TILE)) {
> +            break;
> +        }
> +
> +        if (count == 0) {
> +            /* Highest numbered palette subleaf */
> +            *eax = INTEL_AMX_TILE_MAX_SUBLEAF;
> +        } else if (count == 1) {
> +            *eax = INTEL_AMX_TOTAL_TILE_BYTES |
> +                   (INTEL_AMX_BYTES_PER_TILE << 16);
> +            *ebx = INTEL_AMX_BYTES_PER_ROW | (INTEL_AMX_TILE_MAX_NAMES << 16);
> +            *ecx = INTEL_AMX_TILE_MAX_ROWS;
> +        }
> +        break;
> +    }
> +    case 0x1E: {
> +        /* AMX TMUL */
> +        *eax = 0;
> +        *ebx = 0;
> +        *ecx = 0;
> +        *edx = 0;
> +        if (!(env->features[FEAT_7_0_EDX] & CPUID_7_0_EDX_AMX_TILE)) {
> +            break;
> +        }
> +
> +        if (count == 0) {
> +            /* Highest numbered palette subleaf */
> +            *ebx = INTEL_AMX_TMUL_MAX_K | (INTEL_AMX_TMUL_MAX_N << 8);
> +        }
> +        break;
> +    }
>      case 0x40000000:
>          /*
>           * CPUID code in kvm_arch_init_vcpu() ignores stuff
> diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
> index 3bdcd724c4..8562d3d138 100644
> --- a/target/i386/kvm/kvm.c
> +++ b/target/i386/kvm/kvm.c
> @@ -1779,7 +1779,9 @@ int kvm_arch_init_vcpu(CPUState *cs)
>                  c = &cpuid_data.entries[cpuid_i++];
>              }
>              break;
> -        case 0x14: {
> +        case 0x14:
> +        case 0x1d:
> +        case 0x1e: {
>              uint32_t times;
>
>              c->function = i;

dme.
-- 
Why does it have to be like this? I can never tell.

