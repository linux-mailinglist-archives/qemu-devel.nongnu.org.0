Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A9B4BD9ED
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 14:36:11 +0100 (CET)
Received: from localhost ([::1]:50260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nM8rK-0008N4-0L
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 08:36:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1nM8Br-0006RY-B1
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 07:53:19 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:21674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1nM8Bo-0001WG-AW
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 07:53:18 -0500
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21LCqsfM002314; 
 Mon, 21 Feb 2022 12:53:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : references : date : in-reply-to : message-id : content-type :
 mime-version; s=corp-2021-07-09;
 bh=4gafuQ47WsU1YjJnJx4u8KbjYESsYX+gQxJY2ULYJOo=;
 b=azSXk1Jl476dhhwiQNF6Phbwe/TykXDx1SvW6cyaV4D23ULjQ54PR4+x2Tl6tY4OIzY/
 exwyLzAT/6/2yDcdjFfiEy6jYNhXyUl/WKZAgu2E+9SUd/Z8VI80VznO3S19ftkueV1K
 k1Oor9e+8wPMeKP7ooh94YxCKfZVY3/n7IXuut72e4Y9AVCTMW5EEcHli6nqNzrhlmhm
 XtLQzDrY7L7ZUZses820FdXdyMwn33/lqZPfGmZP6ZigEQQUD7nBFhJdMq5ILUNL/kfl
 O30EQhSlL9BzmMWhXL3vmti5OZerBUvKyjAl1atsQOp3hlPEL968GObuptbF/ynrPhA3 7g== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ear5t41vm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 21 Feb 2022 12:53:10 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21LComZ9114062;
 Mon, 21 Feb 2022 12:53:09 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2172.outbound.protection.outlook.com [104.47.55.172])
 by aserp3030.oracle.com with ESMTP id 3eapkenv4r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 21 Feb 2022 12:53:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BNyiJ4elCSecOtFwD1qTAzqniLqVxIIwaULWAyRa38mOnmzgc71fJ3ry4+pn8h5G1MYZ2RKofgvM1vojNBhcLyuFr96s0ggcAGjNYbQB9LR2zcVwSZRZTWdNYAs4gQEfWfk/3E/SvwTbrp+c0r4NYc1wprJL1eTt1b3e3Zws+b9K2JiI6CRdvZTcZLOtCBCSM9f+/DP5n3H9bnhQ6p9fYIWfFqAiVcizxGVE0v6oMQGOlWt5j9lpGltKmvB+eNvPpxRn103CvC0y2C0WJarKHkYpBeHZ3wJnOvP1/n8pSnD8a4Ia+JIAlBBtZRze3MnYkWuLhFk8hIVi/b36nnwzrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4gafuQ47WsU1YjJnJx4u8KbjYESsYX+gQxJY2ULYJOo=;
 b=kW34/iU0X0UlOXJlKbIjnLu+hhvcZmVLumRsvVpSZiiORLPgPhvm3mlL7Am+X3WmtHhUzPHy4QCdE9F5IxLXJdHXju3zOdlN7pKf9a3aWC/ZxwfP2qPLsyHwJ08wW9XsDIrgU5kcfnqagq39oGOWuLXoB4NKz6wf0vM6MKzz5u307JnCW7dLK5aTc0NrBBwLrjnzibOeXvlpohHApzWq//vb0Kvr6vGkMRtH3i6naVdAYRw1nHhLrVUhw0fdVWj41GpHrliGHu1aFjKF6EK0levGOuvqYYZwC4GOa7Qbee2n+RZtLvMvzRML70ohRfVYEdjweXuJGpfcvaNhUgf2Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4gafuQ47WsU1YjJnJx4u8KbjYESsYX+gQxJY2ULYJOo=;
 b=Me3ziHM0aLQspOxQ+Q7MAOY0sf/aWl6HQrtfHvMtOVl/ZuYHE4HNAHdRe0bmRWOxKYE7DAypEAeYLqoRQMdkV0VfBgOt72xPBXxcMy6NDjQbdUpBhn5xX/egOVuN1Srvui2PyvmSBorwGF4t0Ca0D6vzl3DwiV0q1Eh+bZUvxQw=
Received: from DS7PR10MB4926.namprd10.prod.outlook.com (2603:10b6:5:3ac::20)
 by PH0PR10MB4501.namprd10.prod.outlook.com (2603:10b6:510:43::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16; Mon, 21 Feb
 2022 12:53:07 +0000
Received: from DS7PR10MB4926.namprd10.prod.outlook.com
 ([fe80::e429:a820:ef6e:98d9]) by DS7PR10MB4926.namprd10.prod.outlook.com
 ([fe80::e429:a820:ef6e:98d9%6]) with mapi id 15.20.4995.027; Mon, 21 Feb 2022
 12:53:07 +0000
From: David Edmondson <david.edmondson@oracle.com>
To: Yang Zhong <yang.zhong@intel.com>
Subject: Re: [PATCH v2 2/8] x86: Add AMX XTILECFG and XTILEDATA components
References: <20220217060434.52460-1-yang.zhong@intel.com>
 <20220217060434.52460-3-yang.zhong@intel.com>
Date: Mon, 21 Feb 2022 12:53:02 +0000
In-Reply-To: <20220217060434.52460-3-yang.zhong@intel.com> (Yang Zhong's
 message of "Wed, 16 Feb 2022 22:04:28 -0800")
Message-ID: <cun5yp8pej5.fsf@oracle.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/29.0.50 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO3P265CA0007.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:bb::12) To DS7PR10MB4926.namprd10.prod.outlook.com
 (2603:10b6:5:3ac::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0b735f36-9135-44ac-ad23-08d9f5391b4c
X-MS-TrafficTypeDiagnostic: PH0PR10MB4501:EE_
X-Microsoft-Antispam-PRVS: <PH0PR10MB4501326EF3A3F8BBDF7E6042883A9@PH0PR10MB4501.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EwDZJsHlqqqQGnX2Up0+mjCnAcKJhQWTNGUU/plvtLk+ASAIIGcdLihM78/ZLr5fNVru3CRyTyynNUNF0YQBw1/0cMmOQEdLTaYfmTXhAxKFjHGltSD6+2V7DxcWLtNi6KOU5PI+m57Fjeew1w/c77QVw+isuteQgCg2JQ7kX1mAr6O1lXGn4nWY92Dbk9KyClBLc4CC/Vv3vnPuFSoKbbhgDRiBXvWzh+2d1BLQHWp/nI0V+2nNLDceKj1Yz1xFKMfwENd455I+4/mShVOgAsBuaMILqKeIM8F0CwrZ0zqOJjkDekU7Jq3tzF87XE/RZ1gPauW2x6xqhtg20XPNVj5z1dvCZlbNwEze4wnzfj2loXqkzbGfNOIsGaWPPe4C3NG4G0yiISnFKNiISYUfCr5me+d08dHcjFu3lpm3ILRHzT714c99aEa8q2EH5fn9nqAu3chECQe5qCR3x6KhTXDU8nqBwCV5/qn7oLOX1EkP78TQB8ntgeORFrFOh25lnTPIi3z4yeu7qgG81FFcXrZ6daJ/M3UjwORd1r58sZPk+f3L81+hSXsZ+RZfkeGDUKRQiqMpxbgiHneMInOfRBUuzWuc2gneJmBLuslq4cYShrOXEisY1pONCg1Al9Oqe5tdha8y6Rci8CsithOgkA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR10MB4926.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(4326008)(8676002)(66476007)(66946007)(66556008)(6486002)(508600001)(6916009)(316002)(83380400001)(6512007)(8936002)(5660300002)(2616005)(52116002)(44832011)(6666004)(2906002)(86362001)(186003)(6506007)(38100700002)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/epH2XfpWaffX1MGawBgKOtM9KMd+F/QqfgjpbtUWP3ghOMqJsuSvpCVkgQi?=
 =?us-ascii?Q?2kORIXBSY/f8WoWBUCAwmvP0SN8FDY7XRJ6uvba/UByr/nMTvLt4Q5xqZ5FC?=
 =?us-ascii?Q?uaSB7rOPHyzmLDWVeQil9fisZpYPmAZ1LsB06MLx5bjYStKajcXlN8oNysa1?=
 =?us-ascii?Q?Rrk1TfFeS1eZ8AGQoODBcXZR2uvi3yL2v4KTf7q6cKapbxNMPLjDeEKTdkSL?=
 =?us-ascii?Q?ne4ypLmEKUCGLEVniTWmuQmPID3WGwQcobza00jKlW3ai4UTXvkhlrGmiwkp?=
 =?us-ascii?Q?NwXgiiJbX+kHe33UafrBiRMo3eYmUcNTl3ZPOMduJDeM6IlLqskfsvGEUOXc?=
 =?us-ascii?Q?lIFzG9Z+yIekeDtLt/AA1e2S1HwwBN0hxMU08kjztHrYxUO7UEfOk344ttW9?=
 =?us-ascii?Q?VU9sp2YeNEGbPRl3Fb/SP53QKI5PMPNkw68IkB58KF5DnEGWm2KxPDnry8wv?=
 =?us-ascii?Q?Xnd3Ba+3KXW8SP3jA5ZfipNZx6CcBwx+VIJVUi9tsLwbK6skE9yVvEInPBU3?=
 =?us-ascii?Q?0bPBjunsQ7Kt/88Aw5dsuRrMlZAX4Y5tIht9RoumuNiWOpdnoTuhcHqpNw6q?=
 =?us-ascii?Q?Jh9tSPx1euSL28E80A5mP8CUYf1N9iPU5CEGIriN0ERxjPPEFLqLxpSA3tt6?=
 =?us-ascii?Q?xKV60Na4l/RJFjedfRZOU41TmpHbfDbA9mb390msY4hIS2LpjW7dvVnOEQUO?=
 =?us-ascii?Q?jVtblLLV1fmbt0GX7bbALkZUvQV5FRx55x7F4Ad5o66UbbZ2ybu9To5TQVP5?=
 =?us-ascii?Q?LZNSuMAfMT+jiEXCpXzOwdGH9Mn5j99c6dwMxz8cDswswshWTK4AHi1kIB6+?=
 =?us-ascii?Q?Y5gNMKLWeaOXH898RVutLJins3DPjokxK1p2gDgU1NAAZx27qKpSMY5llfSl?=
 =?us-ascii?Q?5aAa8tfZzp5fUrmgOeO+syEespDEJP2xupbFxzyxN+VyLc1W8xB2vLsdin0M?=
 =?us-ascii?Q?ML5Y0kQs2SOeAT53P5NxACKWqG02twnL7hMuFNr02VDly41i7SFyA64BVrJW?=
 =?us-ascii?Q?3YKU9Wl9iSgRFh4XbLeynNjDI5fm9S8jwmBGsyGk96yZYKezPtMOJ3m7jJvr?=
 =?us-ascii?Q?aZ0VKrfdaae3DLrWnQFTKm6sGv96bCXKUU3OmAhG2eqsPpGaRM3qPPJ2hQ6C?=
 =?us-ascii?Q?2P+d+UG4RzqJOPScfjE9l2fpDZSW/mhIRi2rsB2ZQUAAvbufemXHnHxGcddM?=
 =?us-ascii?Q?dZHcS6raAO2Y6VAw37UfqNIsgeiyohCY6nyzNq0OvWSQPKThD1jWD8JBJs8i?=
 =?us-ascii?Q?KapD99V+nfHAA/EACauXLRXWxt70SX3wWMLaOpLO8WrCUX8shGsue8yjAL1I?=
 =?us-ascii?Q?n+wdBiNfmQykTFgAg/zvGOlGw6lOFC3ergcxHEgBYCrOMeUbrf/L8aD/U1q2?=
 =?us-ascii?Q?KFNxXWd/mSmuyJET3QoAq/d7QVG23pELGw0IQhd7+TehJ3IeNdoLtwdZXtmd?=
 =?us-ascii?Q?ZtHEhxsjquaJlOTQYa00A1a4eBl5u7aX/VrC6np/bgJq4P5PE3auzkncMkLq?=
 =?us-ascii?Q?jdE0z0yRxIMGE0EmFknKaSwmkjI2fuRedC/K+hPLqPWNrEX0kUPsFi3KnKkX?=
 =?us-ascii?Q?72Wr1m1liEEmijNcu0BojdMKafNfm6T00Tzc5irRj2pbyk5hMzTlGmyRG34r?=
 =?us-ascii?Q?+NPoyeLSBzbpnOPOAAoMdAi0gxOyvOGRfC/y2kd0poWBvhufYg5QkbAHIXGj?=
 =?us-ascii?Q?VQ4xemN44Naz7kDsdbCD4rCIn2uijoR3Z8lonZIRDKiP6XQ+?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b735f36-9135-44ac-ad23-08d9f5391b4c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB4926.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2022 12:53:07.0992 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tkz9zACRjfnu21w29Urw/ZizTXunyPvCmoOjkzwBYBekufRswZkvV3rUJ7E8AdC51bveSAGs8/eZ1b5CUqZM2wM/gle3PSfIHLdgT6q2DRU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4501
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10264
 signatures=677614
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 suspectscore=0 mlxscore=0
 spamscore=0 mlxlogscore=999 adultscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202210077
X-Proofpoint-GUID: f7U9oPE3q-AwcL_AtBh0-LqnZnBQTjIs
X-Proofpoint-ORIG-GUID: f7U9oPE3q-AwcL_AtBh0-LqnZnBQTjIs
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

On Wednesday, 2022-02-16 at 22:04:28 -08, Yang Zhong wrote:

> From: Jing Liu <jing2.liu@intel.com>
>
> The AMX TILECFG register and the TMMx tile data registers are
> saved/restored via XSAVE, respectively in state component 17
> (64 bytes) and state component 18 (8192 bytes).
>
> Add AMX feature bits to x86_ext_save_areas array to set
> up AMX components. Add structs that define the layout of
> AMX XSAVE areas and use QEMU_BUILD_BUG_ON to validate the
> structs sizes.
>
> Signed-off-by: Jing Liu <jing2.liu@intel.com>
> Signed-off-by: Yang Zhong <yang.zhong@intel.com>

Reviewed-by: David Edmondson <david.edmondson@oracle.com>

> ---
>  target/i386/cpu.h | 18 +++++++++++++++++-
>  target/i386/cpu.c |  8 ++++++++
>  2 files changed, 25 insertions(+), 1 deletion(-)
>
> diff --git a/target/i386/cpu.h b/target/i386/cpu.h
> index de1dc124ab..06d2d6bccf 100644
> --- a/target/i386/cpu.h
> +++ b/target/i386/cpu.h
> @@ -537,6 +537,8 @@ typedef enum X86Seg {
>  #define XSTATE_ZMM_Hi256_BIT            6
>  #define XSTATE_Hi16_ZMM_BIT             7
>  #define XSTATE_PKRU_BIT                 9
> +#define XSTATE_XTILE_CFG_BIT            17
> +#define XSTATE_XTILE_DATA_BIT           18
>
>  #define XSTATE_FP_MASK                  (1ULL << XSTATE_FP_BIT)
>  #define XSTATE_SSE_MASK                 (1ULL << XSTATE_SSE_BIT)
> @@ -845,6 +847,8 @@ typedef uint64_t FeatureWordArray[FEATURE_WORDS];
>  #define CPUID_7_0_EDX_TSX_LDTRK         (1U << 16)
>  /* AVX512_FP16 instruction */
>  #define CPUID_7_0_EDX_AVX512_FP16       (1U << 23)
> +/* AMX tile (two-dimensional register) */
> +#define CPUID_7_0_EDX_AMX_TILE          (1U << 24)
>  /* Speculation Control */
>  #define CPUID_7_0_EDX_SPEC_CTRL         (1U << 26)
>  /* Single Thread Indirect Branch Predictors */
> @@ -1348,6 +1352,16 @@ typedef struct XSavePKRU {
>      uint32_t padding;
>  } XSavePKRU;
>
> +/* Ext. save area 17: AMX XTILECFG state */
> +typedef struct XSaveXTILECFG {
> +    uint8_t xtilecfg[64];
> +} XSaveXTILECFG;
> +
> +/* Ext. save area 18: AMX XTILEDATA state */
> +typedef struct XSaveXTILEDATA {
> +    uint8_t xtiledata[8][1024];
> +} XSaveXTILEDATA;
> +
>  QEMU_BUILD_BUG_ON(sizeof(XSaveAVX) != 0x100);
>  QEMU_BUILD_BUG_ON(sizeof(XSaveBNDREG) != 0x40);
>  QEMU_BUILD_BUG_ON(sizeof(XSaveBNDCSR) != 0x40);
> @@ -1355,6 +1369,8 @@ QEMU_BUILD_BUG_ON(sizeof(XSaveOpmask) != 0x40);
>  QEMU_BUILD_BUG_ON(sizeof(XSaveZMM_Hi256) != 0x200);
>  QEMU_BUILD_BUG_ON(sizeof(XSaveHi16_ZMM) != 0x400);
>  QEMU_BUILD_BUG_ON(sizeof(XSavePKRU) != 0x8);
> +QEMU_BUILD_BUG_ON(sizeof(XSaveXTILECFG) != 0x40);
> +QEMU_BUILD_BUG_ON(sizeof(XSaveXTILEDATA) != 0x2000);
>
>  typedef struct ExtSaveArea {
>      uint32_t feature, bits;
> @@ -1362,7 +1378,7 @@ typedef struct ExtSaveArea {
>      uint32_t ecx;
>  } ExtSaveArea;
>
> -#define XSAVE_STATE_AREA_COUNT (XSTATE_PKRU_BIT + 1)
> +#define XSAVE_STATE_AREA_COUNT (XSTATE_XTILE_DATA_BIT + 1)
>
>  extern ExtSaveArea x86_ext_save_areas[XSAVE_STATE_AREA_COUNT];
>
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index 37f06b0b1a..ea7e8f9081 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -1401,6 +1401,14 @@ ExtSaveArea x86_ext_save_areas[XSAVE_STATE_AREA_COUNT] = {
>      [XSTATE_PKRU_BIT] =
>            { .feature = FEAT_7_0_ECX, .bits = CPUID_7_0_ECX_PKU,
>              .size = sizeof(XSavePKRU) },
> +    [XSTATE_XTILE_CFG_BIT] = {
> +        .feature = FEAT_7_0_EDX, .bits = CPUID_7_0_EDX_AMX_TILE,
> +        .size = sizeof(XSaveXTILECFG),
> +    },
> +    [XSTATE_XTILE_DATA_BIT] = {
> +        .feature = FEAT_7_0_EDX, .bits = CPUID_7_0_EDX_AMX_TILE,
> +        .size = sizeof(XSaveXTILEDATA)
> +    },
>  };
>
>  static uint32_t xsave_area_size(uint64_t mask)

dme.
-- 
Would you offer your throat to the wolf with the red roses?

