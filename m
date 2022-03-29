Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5074EACD5
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 14:04:15 +0200 (CEST)
Received: from localhost ([::1]:52578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZAa3-0005pQ-2a
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 08:04:14 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1nZAYl-00059m-3U
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 08:02:51 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:29522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1nZAYe-000773-FD
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 08:02:49 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22T8oURw003905
 for <qemu-devel@nongnu.org>; Tue, 29 Mar 2022 12:02:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : subject :
 references : date : in-reply-to : message-id : content-type :
 mime-version; s=corp-2021-07-09;
 bh=1W8hefu76HJk2bVT5ZkQdigz8ZMO6GpyFKiPSD8+Qlo=;
 b=Bne2RlP7U29rvsWUiMoBbQWDiqIkAUvYJM4kKD0zktBbC8RUvz15u0j4/JZO5K4GawcJ
 XiBxPYGQztrdxYTe9cyX9HxaPFVii6ZtNjWXkFY3nko6ZEJhzbSy2h0PorxvfUDDaOBA
 otpSK7xYcf+uB1fSdS0WZSYx/62P31bepYTHYmxxPSj8S2Zoz50k1mBeFGrNlQRVfKy9
 e5CvnKotGKwEWM4EN3riY8QBFX/N250Bvfa/dQzSFFh00jZI2nOP+N/wTr3eANsKXApA
 eFraGZyKal+DtjRhq1an/csNdWOc1y8MNKOV3Vv68WSkqoIfPFTyCG2xyLe8cw9T37+a 5A== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3f1sm2ecqp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Tue, 29 Mar 2022 12:02:40 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 22TC2CJi012099
 for <qemu-devel@nongnu.org>; Tue, 29 Mar 2022 12:02:39 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2109.outbound.protection.outlook.com [104.47.58.109])
 by userp3020.oracle.com with ESMTP id 3f1v9fg1gm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Tue, 29 Mar 2022 12:02:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gZ5gsYkkJBSK2O6ii/Tc+pVK6284Tg0Q/NvMSgrLl0jPqclyDsm34exqnzZIZK4Q7RMKNiVgVcUQYhvdmD0OjcmLu42G0eV7tSyo3lz1N/ndY1OHKwJStN9qFhHkCrn/nKvJxwysSabevXpNtEwRpS+VKWFulGe8/2m5dMoxTWp9lGtq3pMqtOuW9SiYTp9d2MipCN5hjDwtDUYYOpySoFx2dtr0jXPDRhZmB786XMDeReVdNjOkdD+wBH3mnWDeoJBnSgIhu15bqusnDz2DYnddbihyCcW9EuFbEh91aN4UGTOQ4RamiW/PV+4rK8S2clWXfpDiAgV0gWf9NEhctQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1W8hefu76HJk2bVT5ZkQdigz8ZMO6GpyFKiPSD8+Qlo=;
 b=W9sRgZI4/znb4bUKvBv7tIRQjUpo39jE4n6JMdddLf3sbEdqykrfm/VtJTg5Fo+CE7xIZOc9DVtSXdtXy2sj1TfngGXJk/I+NKwpVVTdiA8QZ4r6lP2urZ8jK1hr58u1RsJqI5wP+UxNrpbJoWM22oh3aBi1pTRQZoqSxYgPoIPu4Ry2oB3t7/TNUjapUF0N0gtgJ8sJFPLU9JHvXBuDp6SxN26pXHWj5zRhXpFe/i0keS2CmPUDjygTdwt9HiydkcRnK2lsZXdPd/oKiexIj1PEKd3d9LaVH0toSFA/W4zg+6WxAUZb02ZOaiJwg7G4fDKXzFZtIW4LP6ur3rFElQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1W8hefu76HJk2bVT5ZkQdigz8ZMO6GpyFKiPSD8+Qlo=;
 b=t/Yfp0+7CstvPdj2huQk4vF5Tigz2BR33cgko0brCRk5VQETqECYelHmowlgVd/AVO3ft2t/3bNm9cDrDMCbVIoR+3CpTL8M6WI2Zc2fTCXjNWVbrQdPQ8oDv6/GWYxf0RpDcBPjz/IL3hBEO5gJAVvofXVHLJMJ/UEq3qizPx8=
Received: from BN0PR10MB4918.namprd10.prod.outlook.com (2603:10b6:408:12e::9)
 by MN2PR10MB3838.namprd10.prod.outlook.com (2603:10b6:208:1b8::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.19; Tue, 29 Mar
 2022 12:02:37 +0000
Received: from BN0PR10MB4918.namprd10.prod.outlook.com
 ([fe80::b5ea:d565:9d80:ec50]) by BN0PR10MB4918.namprd10.prod.outlook.com
 ([fe80::b5ea:d565:9d80:ec50%4]) with mapi id 15.20.5102.023; Tue, 29 Mar 2022
 12:02:37 +0000
From: David Edmondson <david.edmondson@oracle.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH 1/2] scripts/qemu-gdb/mtree.py: Int128 are decimal
 rather than hex
References: <20220221164948.2873713-1-david.edmondson@oracle.com>
 <20220221164948.2873713-2-david.edmondson@oracle.com>
Date: Tue, 29 Mar 2022 13:02:32 +0100
In-Reply-To: <20220221164948.2873713-2-david.edmondson@oracle.com> (David
 Edmondson's message of "Mon, 21 Feb 2022 16:49:47 +0000")
Message-ID: <cunlewtezl3.fsf@oracle.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/29.0.50 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0372.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::17) To BN0PR10MB4918.namprd10.prod.outlook.com
 (2603:10b6:408:12e::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d12a2a85-2d8f-4d47-748f-08da117c040e
X-MS-TrafficTypeDiagnostic: MN2PR10MB3838:EE_
X-Microsoft-Antispam-PRVS: <MN2PR10MB383826317D51FF523B58E23C881E9@MN2PR10MB3838.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C1drVhAy8/GFQsIGerx/qqnN09UktuqFkmwsymuQXKALgR0epzfy0uwrkZX5GHDyD/tUg+LHdgKRcf8lFVy0q6agrEK8S7uLUgTNoj95yJxQ1mMd9bN2M5Z/301bnIKU7Gem86fZNy928fsFDK0xhw8svh93vTbE5+HZfCKbdJgOILuCT75uKuJpOfvb+vSvKD2OG9yMQ8/UpJwfSHo91QfihVmHHgL8THE5J0PcrGh2t/8YOQBRY6E0SN+ZfuBqNOE061eDEgbig7chROfpvPg8TkXRfr/cLGT04r5CNIp+f403K0ljz2EQX3DfJSVEnxWtSWxvfKfnCzPFHjlPVOUAqOt/lJj2b6PQAIto64vj9Ix1NylK7YUxVRSOWE44SAU5SG4V2d6M1IKNFPdPrh/IuBuflRu/Hth4CYfzripEXZgb+IeZq4i7U+injgrdWg8LorUvR6rDanXw42jXRCex+1UefL+gj7UvA7nRqtH0m3nUu5n4cLMaKSl+xF58CwLKio+qLV5PYgpNdXJnv+oWK9hf0pwe69V/SyMsp7nRSJaI8TpPkRlMA5fKw5rGgLkBzdYNy54hVF6acZHbRBLuDX2lNZU7GGJoXqGCo6aOeAdEhVlo9k378DU5BCCOCYMzgMM8Ht5SZIKbQBStuw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR10MB4918.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(5660300002)(4744005)(36756003)(66946007)(52116002)(6506007)(66476007)(6486002)(86362001)(508600001)(83380400001)(44832011)(2906002)(8936002)(8676002)(2616005)(66556008)(186003)(6512007)(38100700002)(6666004)(316002)(6916009);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AGj6ozTsPYtcAUWas6SQfhnOjG7JTsHwWYsflMbqFWYejia0E2lzOhEf8bUz?=
 =?us-ascii?Q?2T4naZ0ST/MGFd/uLpuGVMzKJ4u2L7zELyQ3r7Vg2FVlqly+6cowc1vlvuFn?=
 =?us-ascii?Q?/UFTFdJ/+guj+1fOkO5WF7bNwbqQdxvebsCqwYiEzQBFavCuGBQivB86JR+d?=
 =?us-ascii?Q?5ZQPym4RXu+sIu/RgyDArdgJ6Tb5bqdDl1yBVeg79DK9AUE5R2bJY7tj/16E?=
 =?us-ascii?Q?mBlpXfANbqTw3MDmLcmVZbqwrlp0MMXzWitrUsto9eGM7gRyddQ+mycC6ISe?=
 =?us-ascii?Q?ufIf6P562IaQmP9cyt4N14KeqBvmyVeEY3t3m6u3VwJaesPFHTgpm3r1y7TC?=
 =?us-ascii?Q?1EA4eVFQRXn3qVS1BTupKtDuUXrt6d/R3kR611HmI+isV1/PIweHltErjOby?=
 =?us-ascii?Q?OKpBtobpvMh3DYLmVxbEfoR2s2JZh3B9j9gCeIzHewSkjjv2leZ6cudwytJ0?=
 =?us-ascii?Q?2+eIpCApcvXN17W6EXw4RW3vRIORpAK+OvTggYeyPpuYA1/5eYGOWSL0Y1hC?=
 =?us-ascii?Q?GNC+O5q+QQGkxIRBFtNeN7B2lGbI9/KKUoO4ZS2n1uL27QX6yqsK8f525otO?=
 =?us-ascii?Q?SFSwG0u9mnXALiWigO30qIp0FwMHzw/3oNrpbjLTqYwGpo6s+rD+jqY6hBfX?=
 =?us-ascii?Q?hiE0o1n9bUzg/A+X3UvVY7kuoAgYunvi87M2HjnIYU94zWChh1LMfmxfPOwq?=
 =?us-ascii?Q?kcOHDnTAAmaNCRdiwF2P2htKI3F6D/OLGnvo8Yfoi1KDsC1gJOly0DRHPY8b?=
 =?us-ascii?Q?RoL03UfVwYk1HzeVt0QrnryWNe3/OD5t8qtLFwbAqvdhbngqEeZoX80PBDfa?=
 =?us-ascii?Q?jHtBrcX+swlIRJ+NhfPjbhY1wMdRh4GQs/qnbpsoTWIBvc5TWGaCXSjQ2fse?=
 =?us-ascii?Q?Wwuz8QxYvubC59ZsB7Zk67UgbQ2e41rgpjYHRAJN1PyzjVzKLI0F3nE7BKxJ?=
 =?us-ascii?Q?fxkjeYog88phAXMFUd7e8zQ9Gq5BCqgJeIx1YTbKlpRERYjsGuImg265QR+r?=
 =?us-ascii?Q?L47elOkoElkRunaxMOCve6BGVXaJsfA5znHRK2kje/Lx/uTrsKXdhTC1bZQj?=
 =?us-ascii?Q?hj906m+9FTL4H8l7wF3oPhoyFUqLywDZ81HLnXMlMHKTd8p8XYTCNS8/Dsfb?=
 =?us-ascii?Q?0Up0Zz1JOdIQK4JJ8X2XqMpAYi3hIPctIhvdBRD699YwZW46liYeYWyrgL9t?=
 =?us-ascii?Q?HCjl9ejIJYxz9mvT47FClU5w1oTFy0Hw5GPA283WBXSvNPcs/bjgT0mY4Uv8?=
 =?us-ascii?Q?xNAQOw95rFTbEVpLUIHf/YawBXqwqcbT1Q1dItSmZVXw5+zUKbwr8GQAt6Yw?=
 =?us-ascii?Q?hEZdQEWsdDmkDDilnOsBeRbVQTWdeXkMv4Ukilh2OEr2+HtQsO6OX4OTiExK?=
 =?us-ascii?Q?w47HZGtjnNdkxvvLdMrYSLoDIRpGYEGagyoi241s12qEZM+vRDjTjqagFwkG?=
 =?us-ascii?Q?CsdLBX5x9LS7qXZt+qDdPQUsmOv4g6Q6TFeTq8g+D3LNe2OA6g3q8J3dVCxt?=
 =?us-ascii?Q?rx/v6fnIMQp7cOYeCyHyieedihQHWTazGIgjZNemxzH8wk03dj4ijZpUFPoe?=
 =?us-ascii?Q?r6i6HQw4L7NYjhg9r/oyUVXUotPMk9h6SKTRJx0vtXdJgkTwOHBphsRX7EYr?=
 =?us-ascii?Q?lIOqW9XvxGbyk9lcE+adlMKdS2uZO+t3+xdrZoaElOapY7kzj6RES/rG/jOg?=
 =?us-ascii?Q?cIJuwKf0NPB8+S1Ua27OVxgtssORLrk3y/sKroBYGnP8mOS9umb96FSEZC+x?=
 =?us-ascii?Q?+BezK+qZw2/ByKWl9LCS/HKaU1YrjKTVlhPm9Dm2B3Vwgetv/tw3ZMfwFqO6?=
X-MS-Exchange-AntiSpam-MessageData-1: vzbHhWqWH+fc1g==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d12a2a85-2d8f-4d47-748f-08da117c040e
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB4918.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2022 12:02:37.1360 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eCVjUQvno60EHPSTCNdFkM4uSKyOs3ejQn+YwIAa73MQBjIx65TmNWuI0DUrVqiAYXyffx2ZbCeU8RAsyMKseGK7hsKjS37tJiEv9kyyJpI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB3838
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10300
 signatures=694973
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 malwarescore=0 spamscore=0
 adultscore=0 mlxlogscore=999 phishscore=0 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203290073
X-Proofpoint-ORIG-GUID: vdwOfA8KWeq6zwSS0n6UVWxeK53cj4Oh
X-Proofpoint-GUID: vdwOfA8KWeq6zwSS0n6UVWxeK53cj4Oh
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ping?

On Monday, 2022-02-21 at 16:49:47 GMT, David Edmondson wrote:

> When parsing QEMU's native Int128 type, do not attempt to convert from
> hexadecimal.
>
> Fixes: 8037fa55ac ("scripts/qemugdb/mtree.py: fix up mtree dump")
> Signed-off-by: David Edmondson <david.edmondson@oracle.com>
> ---
>  scripts/qemugdb/mtree.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/qemugdb/mtree.py b/scripts/qemugdb/mtree.py
> index 8fe42c3c12..c1557d44fa 100644
> --- a/scripts/qemugdb/mtree.py
> +++ b/scripts/qemugdb/mtree.py
> @@ -25,7 +25,7 @@ def int128(p):
>      if p.type.code == gdb.TYPE_CODE_STRUCT:
>          return int(p['lo']) + (int(p['hi']) << 64)
>      else:
> -        return int(("%s" % p), 16)
> +        return int("%s" % p)
>
>  class MtreeCommand(gdb.Command):
>      '''Display the memory tree hierarchy'''

dme.
-- 
The band is just fantastic, that is really what I think.

