Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2191F32B932
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 17:24:34 +0100 (CET)
Received: from localhost ([::1]:43380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHUIa-0001aN-SR
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 11:24:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1lHUH0-0000eD-KC
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 11:22:54 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:42784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1lHUGw-0000FJ-3X
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 11:22:53 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 123GKM1u170220;
 Wed, 3 Mar 2021 16:22:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=to : cc : subject :
 in-reply-to : references : date : message-id : content-type : from :
 mime-version; s=corp-2020-01-29;
 bh=L3jw71G+sWGDd4QKSRhgf8DXpZmE1Zl/+PJPuxw4OuA=;
 b=c1pTFdgfh4ds4JmDWzm+wyrbeBuLBeF5mzemijo2ZER7nYd4uXFaajX1XdxOMV2tcqxL
 Q0hzMQwpadWi1VdkVso/OA3J1mJfL/QvZlBmoI2JQrekA6Wi5WfvZlaYLSbfXTIrYfz4
 lo47fmeXPZv1DXo9X619VI7yNnzwSFkCYvLAXtg1GH0J2selRR1IJ9//GcOj/WVajJUk
 AkPCpSTOjimxPMACFSEUiFUGUcr3VlojnQ+EHz/o0V7hXGofGkhyUPzrx3QUAA9PH8Rs
 hufDZh8spBfTFoG72SGJ8tNvjyXrWRDgq/qKpksggUYxAEczOXoxtPMWRuTX1UDeuStM dg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2120.oracle.com with ESMTP id 3726v79jw7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 03 Mar 2021 16:22:37 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 123GL36N183435;
 Wed, 3 Mar 2021 16:22:37 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2049.outbound.protection.outlook.com [104.47.66.49])
 by aserp3020.oracle.com with ESMTP id 370001gaur-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 03 Mar 2021 16:22:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L3imU0p6R4dooqobZ9lR49CZHr+vFFUi6FDM3mMDZtvbUL5t6c6JhA2gaLvwJ9fF2CLQC/lHdBto5aiaI438RBx8I5QVWHmalnzaBM5K9SxnKt0NowvycBTjE/S6I+ODqJxUKvupACOQoRQLJcfWwMqCvHGi7ZEY9zGfqLcmLH7BUfrls0dqBaqFGeQ5W8IBjcb/DatUgJddsTwk/k8JFYWGBYnB3NeJzNfHgXhRZXRUiSTc0luIu8Is0z6Vsg6QkhIXAUnS1z95GaYqS4DTDkIzOd4DFsiDQ7j82+JrfwlxLeFGPibgD/J9WliHHvxNwakGzAs3410M7jxngAI60g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L3jw71G+sWGDd4QKSRhgf8DXpZmE1Zl/+PJPuxw4OuA=;
 b=XlMWuE2k8l1uLVzDsRICYPeREo/VZXuaEVcOpcbWmeUWBa13e5h0ibmaPgGrzAgY3y0NdlNl1d2DARFFzQF3j7MJG0w3NSxfBmOwBZeeY1FmOl4jTZS6/wNopWkDHN9s4UhwRfz+cL06IHPrpvbIIjy5JE99sRCKpM8Iv05qWHRZ4BOpI7a6gFIaRnKdmrFqokhidH6S9XGEu6l5e5bUbKB+csCr9VZWZV19s/5T2fADzJ3fnmSoTSF2JGOgL8T0o0Z6gIw2bnVMgxJ09kp9JclCtiN5HYFtvw9QVMiERurv8zAgdnWbPdbdQf7itFScXTDIAl62vHOyjd7e15nnyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L3jw71G+sWGDd4QKSRhgf8DXpZmE1Zl/+PJPuxw4OuA=;
 b=SNLhsNTSsI4qB2rvuvzY1a+xd/zRcrnkzcVNO6PvK3PNLsW6vOvyWXEdNyDn9/pGCgeqefvBHgbWO+pvc07H/Gqjz7xA1CQuMTcpXG02CSe+z3purwK5O0DCuUgrF2rqOgFAufqCeswsbAhkTxoB973t5XlVcN2biTHkrn3Asms=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from DM6PR10MB3148.namprd10.prod.outlook.com (2603:10b6:5:1a4::21)
 by DS7PR10MB4942.namprd10.prod.outlook.com (2603:10b6:5:3ab::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Wed, 3 Mar
 2021 16:22:29 +0000
Received: from DM6PR10MB3148.namprd10.prod.outlook.com
 ([fe80::f871:5965:2081:3934]) by DM6PR10MB3148.namprd10.prod.outlook.com
 ([fe80::f871:5965:2081:3934%5]) with mapi id 15.20.3890.029; Wed, 3 Mar 2021
 16:22:29 +0000
To: Babu Moger <babu.moger@amd.com>, pbonzini@redhat.com,
 richard.henderson@linaro.org, ehabkost@redhat.com
Subject: Re: [PATCH v2] i386: Add missing cpu feature bits in EPYC-Rome model
In-Reply-To: <161478622280.16275.6399866734509127420.stgit@bmoger-ubuntu>
References: <161478622280.16275.6399866734509127420.stgit@bmoger-ubuntu>
X-HGTTG: heart-of-gold
Date: Wed, 03 Mar 2021 16:22:21 +0000
Message-ID: <m28s74ky0y.fsf@oracle.com>
Content-Type: text/plain
From: <david.edmondson@oracle.com>
X-Originating-IP: [2001:8b0:bb71:7140:64::1]
X-ClientProxiedBy: LO2P123CA0081.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:138::14) To DM6PR10MB3148.namprd10.prod.outlook.com
 (2603:10b6:5:1a4::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from disaster-area.hh.sledj.net (2001:8b0:bb71:7140:64::1) by
 LO2P123CA0081.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:138::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3890.26 via Frontend Transport; Wed, 3 Mar 2021 16:22:27 +0000
Received: from localhost (disaster-area.hh.sledj.net [local])	by
 disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id 3ff8b2be;
 Wed, 3 Mar 2021 16:22:21 +0000 (UTC)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6cfcba4d-ae61-4489-498b-08d8de608a02
X-MS-TrafficTypeDiagnostic: DS7PR10MB4942:
X-Microsoft-Antispam-PRVS: <DS7PR10MB49429FCAB2237E3146C51B3C88989@DS7PR10MB4942.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aMttS9LpytXmkzpYPacWqlaKcel4dOvF28s0Z7+O906Cy2F+nU8vxUx676u7ra1LRmp6MePPBFtv0y8yC96Q5aGXSVG3iaM0YW4dwt7ebtdw4MldiwwOcfpzGQ67Du+8pRL6L7AIALM+TqVF40x7w6DHBWBlVzeA90h0dE319+JxJ/xMz5YPAK2mkYA7EN7OSlh/REIj2RoEwxLdEQxN4abd/Rpjot1h0uFYxq82jaOMPjfs/hf8XXp5bD42J0p/4FBvNW7nb5IS/5bu9qjC5lErcfl6OkMpD4rJo27+IzomVtkyafXj9x6sHBPVQQieuFzBnVuFKSWOaGvYUlpecVJnQtjYr7WlaGfKrIHfSSV0k35+Kl7iHqijvH8ZyebZNtlmH2ekNVwTWYJQvhHh1bMGmLDMkO4iI5ofQGpZOngIlYZ/Ym6Es5rK/2GfvyjfwNgDk4IIZabEVZCrOOXqP0ZGUITZ2rPkJBKh0bATijhF48qrjEPqUi6lPJpI1d8glz2PtHGG6Vn8bVV3+iaDMg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR10MB3148.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(396003)(39860400002)(346002)(376002)(136003)(8936002)(2906002)(8676002)(86362001)(316002)(66476007)(66556008)(2876002)(66946007)(4326008)(478600001)(5660300002)(186003)(52116002)(36756003)(2616005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Mx0fj4Lzbya996vWeFQOFjw6Ztx0L12eKd/+TnA7rMdmEMvVv/NQNAEu6d8/?=
 =?us-ascii?Q?2eDA1uc12mlay+vbCEw+8oSIbDU6xzdSVK2yXZg6lRM6G02XsNVj3ZS5I2z2?=
 =?us-ascii?Q?khY6hmPZXoXNo6ocvinKL7DGJ51qmjwrWlMWR5+cELHE4HylFuDhHmRWy1XC?=
 =?us-ascii?Q?Sy2JtU/aachaNO1v/d3YixRvswNC2ISocVeoUO3NWSmRKUULvA3UYOv8DMKS?=
 =?us-ascii?Q?IuLhGUKMu8Gz5MAX89RAkdOdEV7FYQ0/MXE1AV8jUZeFix8IS3/XDrjsdluy?=
 =?us-ascii?Q?r9QAPQDfIaNj8KEEs5NKwCOJUBkQrEQGqjqEL/gFKkJ7m9e3PJzRCLQmT8Pj?=
 =?us-ascii?Q?2lKczNT4/VsW45ybkSuvzYXsqWYklIjmhDYTocMzLkZJ5hBrt9WyfRFtm3Gq?=
 =?us-ascii?Q?eJxp5O1SkWo9X5vapWxB3uX003oEsry73tlWgIPcYhKdYxr1EmjiL9tX6lLf?=
 =?us-ascii?Q?BwoKJtisq2bF+TuMfHkIjoT5wJxEMZwJQRW8sSKZmHPjZBv2I5y/5ttPHkoK?=
 =?us-ascii?Q?EPp8O7pYJYyniWyIg75X92Gak7rqWzk2pAtqzqB9P2MUNbGIQEGli4lymczV?=
 =?us-ascii?Q?jotbmlpcTjxji7mitFgEcq98jtGxagjsP2MjH0649vuYFMJHyn/UZ45RovKb?=
 =?us-ascii?Q?2tuwaB8GSep1BwEoC/ONrzvaL8tG6aiDhkRaf3e0lC8cpdT2gYkKRFc0ZjCw?=
 =?us-ascii?Q?ApgexRbBtHBcZr8k6JE+DV0ZX6O+N2aisVQxY4Rs6Fp1fHJMd7bOzOF7obBM?=
 =?us-ascii?Q?QvOhaNE81RiAc9Mrr0rZxxnaPngYYrVEQKbcgjDejVvfJTznBA1wMVom62HX?=
 =?us-ascii?Q?KFIMpKMWHz26xGEq07wYHTNl0QQ7SYCo+JhuDuSJ5SGv6E+1wRABVT0Vb7tl?=
 =?us-ascii?Q?m62op1PKvIi6VotBToKThmrEfGBxhbUk4kWc0m1bEPjOuDXHB+D4qv2GTMe6?=
 =?us-ascii?Q?8+b/pDJAXtjQ32JzNRvX5/rFhSmaeT+i2dVPaJ2Qr1Ga2F2QWSpWhQRCqUZs?=
 =?us-ascii?Q?oevPCQ7MChaoTuMNCK7OJOvtEyirQF/YNWQ0EOSV3Ol1JIXyx95CTKjhrS1X?=
 =?us-ascii?Q?o0PFA0Pq3165aomgSnc25yky7g7jnRRRAH4dmEt3ghjsisfXZ9jMWfX1UItd?=
 =?us-ascii?Q?9Tj7G4y94pOEWDrkMs0edLg8saLVtDealeZVeCawTxRmoBFLxwX/U/ETT0sv?=
 =?us-ascii?Q?pedithklRKXH4LIc+UqPGL+I4SlOkQh1HqWRfSdvekkjQqPXjgK7WQqP4R/E?=
 =?us-ascii?Q?QmpbvTavm0ZRY2YxZaV3CGJOCurY7I/zrAYNqLLnULKlwBeDNmpsBnkS8IhN?=
 =?us-ascii?Q?GSqxGvFXL6aBrBRHoRqZCZ+jNGr37svV6Mj33/sHCpupqw=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cfcba4d-ae61-4489-498b-08d8de608a02
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB3148.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2021 16:22:29.3173 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T/ErxnU7keamX7pjWwnA3dytI1RSE14QEJZ1d1Fw17I1a5EYACU465yVGt2UyRWv8XSWT7Z8ihBg2rNGS2GMLD5HSjcX+UT5iNBJGkdZMPg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB4942
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9912
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxlogscore=999
 phishscore=0 bulkscore=0 mlxscore=0 spamscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103030121
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9912
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 phishscore=0 mlxscore=0
 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 spamscore=0 mlxlogscore=999 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103030121
Received-SPF: pass client-ip=141.146.126.78;
 envelope-from=david.edmondson@oracle.com; helo=aserp2120.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: babu.moger@amd.com, pankaj.gupta@cloud.ionos.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wednesday, 2021-03-03 at 09:45:30 -06, Babu Moger wrote:

> Found the following cpu feature bits missing from EPYC-Rome model.
> ibrs    : Indirect Branch Restricted Speculation
> ssbd    : Speculative Store Bypass Disable
>
> These new features will be added in EPYC-Rome-v2. The -cpu help output
> after the change.
>
> x86 EPYC-Rome             (alias configured by machine type)
> x86 EPYC-Rome-v1          AMD EPYC-Rome Processor
> x86 EPYC-Rome-v2          AMD EPYC-Rome Processor
>
> Reported-by: Pankaj Gupta <pankaj.gupta@cloud.ionos.com>
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> Signed-off-by: Pankaj Gupta <pankaj.gupta@cloud.ionos.com>

Reviewed-by: David Edmondson <david.edmondson@oracle.com>

> ---
> v2: Model-id remains same between EPYC-Rome-v1 and EPYC-Rome-v2.
>     Removed model-id in the patch.
>
>  target/i386/cpu.c |   12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index 6a53446e6a..30e7188b0e 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -4179,6 +4179,18 @@ static X86CPUDefinition builtin_x86_defs[] = {
>          .xlevel = 0x8000001E,
>          .model_id = "AMD EPYC-Rome Processor",
>          .cache_info = &epyc_rome_cache_info,
> +        .versions = (X86CPUVersionDefinition[]) {
> +            { .version = 1 },
> +            {
> +                .version = 2,
> +                .props = (PropValue[]) {
> +                    { "ibrs", "on" },
> +                    { "amd-ssbd", "on" },
> +                    { /* end of list */ }
> +                }
> +            },
> +            { /* end of list */ }
> +        }
>      },
>      {
>          .name = "EPYC-Milan",

dme.
-- 
And the sign said: long haired freaky people need not apply.

