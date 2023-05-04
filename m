Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAFB06F70EC
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 19:33:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puco9-0006ob-Vx; Thu, 04 May 2023 13:31:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1puYDr-0003nJ-QR
 for qemu-devel@nongnu.org; Thu, 04 May 2023 08:38:14 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1puYDp-0004rC-EO
 for qemu-devel@nongnu.org; Thu, 04 May 2023 08:38:11 -0400
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34444DjH008997; Thu, 4 May 2023 12:38:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : in-reply-to : references : date : message-id : content-type :
 mime-version; s=corp-2023-03-30;
 bh=aQ50PfSzOnc6kOJdvih+FEgBwU3L91QL6vkNdcvE06s=;
 b=yNk6jNUHib+M2ZQ7a0+9E2/RWkEIJAn9oVTBm+5BAhjxN6nwHCq3SJZmD/aRd7CDZHjy
 64hfH57OXDYyUNkdX2wcwj8VnHgKNoKxICCz8Vw7vFJfaT781a3xrqVsPVJwQoB5IqJi
 jwFCafsaqNJ+FI261SBIckssfn8fvl9nyfScbe/u32t0kbhec5g3dSxEcGcTHJa/CiPP
 fH5a8ZNj67/ZOBzYnCIJ+BZDbzyQS/9ZFibxvsIj9EatVPCXmtre3DTppWyrInbDf/+Q
 TlnBYshgclZS+JkYrwI1vUAeSbNICAs5T+Vgwbqtv7Qj9rbSIzop7FLETJpJ48C+Chl/ Ew== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3q8u9d1tvq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 04 May 2023 12:38:06 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 344CABnr040525; Thu, 4 May 2023 12:38:05 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2177.outbound.protection.outlook.com [104.47.55.177])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3q8sp8f3ym-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 04 May 2023 12:38:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P2t+1385/Y/dI4OUXdwl/5K7UjAcgDHaVjChGEmng6VObtXhsh7p/t1lMS762LmQ5/Stb1B9p75OKTPv8z/ftxj+DhK2DYBDEbh/WE/O8DIkSOXadVATdWhTBVRZhNXxhPSl+oBBnuxSEHTW0hQTeDq6VPl3lIqNyolmjCvtpg0gxUOY0IEc962OFvOVvzCtybq5xaBaY6AxfRtMQfKXedeAuWjIkTIyUDbSAQ0K8xar3pN7fQGAOFHaKd/68wVMc9ah97L87kWaHEsnDYl6JUK+Zvly8qCGGkl6gvUF2yueBN2A1YSclGzrnxZvA7Mz3SGpuYImW0R4j1jpQNXSCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aQ50PfSzOnc6kOJdvih+FEgBwU3L91QL6vkNdcvE06s=;
 b=SiY6sAXzrXsIYNqX6Kg2usEsNNKzATzMeCpqf4bXpjc9ROCwaf90OGzq7/YrJxM8xguS3C28X/fFQIR3ooOf+3fEUNmU8qzbjwGKMKGmZcMiFQUczKiy64DwpU9tj70+n/dnfuvQ7F1noXlieLpS/42XnZayKZbE/e2YGtEEe3S3MU3k/w8//uVispxHoQbwcCuNV4M/CzZjG3qQ+cSw0eWmSGnSnveXkGlWau7AWbJ9a/xaZ1v4NwqXRgb5YaQT6o2V1PyIzOnh7tGcBVRON6UCbheKQia4Psp/wOk29bTgvqUGiy0zIRNQWgcEcYgvTKHwFTZnS5AHHBeD4dTeFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aQ50PfSzOnc6kOJdvih+FEgBwU3L91QL6vkNdcvE06s=;
 b=Pn6m4fT422uz/fUTjTyFrKfaQ9jDlA8NY2QG9zXUzvF0M9V1E/TtjXrjE9oYYa+Q6BMvsVczmUxa14e756k8Z7JByRuHrpfLZTmJlSq4CS2Aj8Vknyq9AfGFY0ddfZ5krGppeuUnTbcruvdllYGAXmjDP6JPx+JwDLncZpkdJHc=
Received: from DS7PR10MB4926.namprd10.prod.outlook.com (2603:10b6:5:3ac::20)
 by SA2PR10MB4507.namprd10.prod.outlook.com (2603:10b6:806:119::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.26; Thu, 4 May
 2023 12:38:04 +0000
Received: from DS7PR10MB4926.namprd10.prod.outlook.com
 ([fe80::738c:b283:c54:57c0]) by DS7PR10MB4926.namprd10.prod.outlook.com
 ([fe80::738c:b283:c54:57c0%5]) with mapi id 15.20.6363.026; Thu, 4 May 2023
 12:38:03 +0000
From: David Edmondson <david.edmondson@oracle.com>
To: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>, Leonardo Bras <leobras@redhat.com>,
 Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH 1/2] migration: Document all migration_stats
In-Reply-To: <20230504103357.22130-2-quintela@redhat.com>
References: <20230504103357.22130-1-quintela@redhat.com>
 <20230504103357.22130-2-quintela@redhat.com>
Date: Thu, 04 May 2023 13:37:59 +0100
Message-ID: <m2jzxo5l20.fsf@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: LNXP265CA0021.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::33) To DS7PR10MB4926.namprd10.prod.outlook.com
 (2603:10b6:5:3ac::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB4926:EE_|SA2PR10MB4507:EE_
X-MS-Office365-Filtering-Correlation-Id: a084e5ca-606e-4b3f-e274-08db4c9c6733
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kq3izfagZZ7eVNBnBFNBJD174Kyj8ltvoDFPfipbXHqj+025FDyTpEl310UU2Hh243aLEMXzf7jnpau1YUlw8ZtZNM9Dcs/i2scLU1MUrRKuZ7O4OkUwq/8brFYR7oUyO9t+kzeTktk2mUS2qRAeEM+rA8+EDNauYq6uvKw9pZ8DHsh6cujpzj+VUtAjBsyFTdmIynYFQzXnKJWFnNHPEox//aLjVpc3BLT0ydOrvJp1Aj2GwDtQnAsaSWytfq5I0GfYbLvYEHyR+tL2oUQFHqzsq/4d+jlM2dbUVNj9u0xMjMMqtA+wPMmJ1W9uJt2+fZvEN8F6gZoAAwwt8W+CCl/QV6LRibLaeGaM7BZMimb+Okxrcoh7Ii501HgJNPq1RohRS5NNWnKH/rO6ZPBaffTR3zLkMgKrjY6p6xXVpmv6yVFLynBMjEFcbgwZlkPX9sCVKe/4ViIMsE9PuEBd2U1qJsW/qcmP46uIgylWhLCmYuW3Ug/DZOEVd6LLlbrkn6NDMvoLDplOvfjobqt4naGcYV7tg5752wW+H2/FW7HzQ+2z/fv25+m+GHWwnzkO
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR10MB4926.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(39860400002)(376002)(366004)(136003)(346002)(451199021)(6666004)(38100700002)(478600001)(86362001)(54906003)(83380400001)(186003)(6506007)(6512007)(26005)(2616005)(36756003)(6486002)(5660300002)(8676002)(8936002)(41300700001)(44832011)(66556008)(2906002)(316002)(66476007)(66946007)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NbmGIiQ7giNqxDVwEK4G3xUrt/PRMKntIRThy7yY2jZfeqUP84keJ7b2u9tl?=
 =?us-ascii?Q?iI3x6mlV/QX2qf8euhUkySWSeSv3AN6W8qrMwwF7RVE/ETxpAsfTqC/vuJn8?=
 =?us-ascii?Q?Vge07t/XlRcZQagC6rNvTnpTpiHdWg7nvB+ssNkXRVe9JXUkCkS3GxZpiPH4?=
 =?us-ascii?Q?LOhe4duwNtCRKe7VZ4bMNRj+qiJdeuU4KEV/NTJySSkSoDm+CpqLmkldk4Rp?=
 =?us-ascii?Q?zAtebtbH7U/AX/u4RxNdu/QRuy9DJPeBiz48Qr4vV1neaFmVzdJRzLGHzuf3?=
 =?us-ascii?Q?6bsrJxhQXKpf7tpALnv1vsCilL01knfSiC6VJooW1d3esQZRAb7Oj46P96Gw?=
 =?us-ascii?Q?ZMrYpUJSVe5ux01L9hI4heBaB+8NtuGRNXQM0NnYoQJ69kMiZGsVYQP6nWz9?=
 =?us-ascii?Q?IIVyh4SP4bGX+3bhzu8eLSB7neNI3AlZafAXBZ6PQKuq+5nmHeN3D5cY6Xu0?=
 =?us-ascii?Q?WTWgGeVauSHdh39w1tv8imWcStyvLf1YCog8vlJnIKYatERdbG+YibDoYg6q?=
 =?us-ascii?Q?ai/V3jwiQiSYr5o8Lr+DWCjh/4AG73hSvi0elXmIriJp3fsJURnTVStKL2BK?=
 =?us-ascii?Q?Eds2me/gvzLaxq6ZrBItmgrtKZ8+U/F7sHP6dzv1MFeqieqd6A/ipTotdiru?=
 =?us-ascii?Q?L2uSns07bZPCTunrDGCsW+HxTwsXQwZJtwONZ4oUUs4CQ9g3wMRMqldqizpz?=
 =?us-ascii?Q?t+ycJNNkq0PYh4bAqAv62Wnz8tZ5devm4P6mCs3AlqL0AgVYZDXLp1XgqyIr?=
 =?us-ascii?Q?314FsQFAzZkXtMjPHB/QACmpJcPb+oezPTyA1c7BOH81rurZMhBX2WZKdxZL?=
 =?us-ascii?Q?hUuXSwFAre69PtBbfArMjWu2EcqrCHV0bdXSqhYzoyCwbeGP6qvEw5wB6IYI?=
 =?us-ascii?Q?cRRsvMsPRnNmBtZajhw4/iGvJ7afes6uTFgGCorskQKhZi0AKhUfD9OwueF9?=
 =?us-ascii?Q?95/Qu0WqWsJG/RLqVas/f3WHl2gHi9mUYxTx8dPXYgh3k2DeEH5d0HpLjQa7?=
 =?us-ascii?Q?PR3tnpaQrNWkHdbcL2ffv5FWvxvPnxxV6hpTTAaXK4KxSTdk/gU4XwGTPDkr?=
 =?us-ascii?Q?mtkThEIdeiFYnI018pM+aIgg9OWEOktgIVQS2kGLFqSrOjtjB1zYaV8DK9hS?=
 =?us-ascii?Q?vmD+Rr+dVVa9pioXam1Dgp3Hq4+AS63c5v/DPi3sO5+Dqwd6vz8Aan2WS+lw?=
 =?us-ascii?Q?tBrlXm0yjtZTmlF9n75SpHMW8LejuS0JC4SwIll7rzhM9AzeZcSL/klCCzbi?=
 =?us-ascii?Q?RFyHSmQEmulN9EKJS1BagUG8qoc1b9JY0NWxXLSzi8i/ZQXop43GuDy33vVm?=
 =?us-ascii?Q?POakq3X+wAuolWoasJJc48iMqc5mWt1Krw4Z8LfbcVbnABVBq4CU3Ce+Z+oN?=
 =?us-ascii?Q?XyfIbn8Ss0I5GLk7vVaf1oCYR6WbenptEuV7Qarx6tue7C05bzrQA2dzEoku?=
 =?us-ascii?Q?QnLFalBJ2traqbeGjGeNcnOSslD6PXRr96S8Fyp09nQXmM02amljyZKcwfez?=
 =?us-ascii?Q?ItVdrjP5Qu6MdEhLggFd0MDGMm10a9v7r1oSWTiwaWmeGN5WeM86jBOkS3da?=
 =?us-ascii?Q?TBwhoEzat8t0jsJXlLOhltp/Y6TLbi8kduGA6Rq4w2zKNCPCeB8vRLnhZlDz?=
 =?us-ascii?Q?mA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: NLMD2iztbgJPT0ss+zz3zj+X2zu/TC54eRWNb+4fEajHWUDRfbJlTqKB2l48qQAVZmsHsNffC19StqCKQYxLN2eRo3BMYlpxbLR4XffCE4y8fsLCMVokoTBTM0fmXnfUFeK4o9uvHmeaJdBXrRE/GDgD5wIoIm6XmosHINiShqFc2+PeGQpAtidXo5ApUw7J3DXQKRls3J9D1PJ6+ngxTUpvForuox+zY8Gpw4NLDTR+nOMaCu5l+SOkMTnGPUn4g7EYikiTNizhNNtAsWwCaUflPRNNT00mzgt4RynIhwxlYGmy57KMn6aReHsqLxaMaNyXFFuwNna8mjcJobzA3xVOXuMcQUYW0SNtkGoQiOvSasQ3ivOQvvubqt90JY8ymHNZBH6cdvyOdYRy3ZkoEKa3CvkO17gDD4iCMVIqAE40DcArk6jURoTNti4auf1RVgP4tyxflO5i5bf0apPBQ2I0TL6oV1pbpYOkD0zUU/5Q/PsFN8FDDn7vAoSMmbrFHzmh9XMNTgPnqAsS7cjVg86Ldp/vIcadZi3GDSBPRSqyF4XpTjF4jklX15s9txA+XntMEcTKhrOqYjH64DxqE8yfzLeQAoIHi3o5xKoRifnusbDNnmlhOk16b0lWhkz+wa/9EYWiWzCoQzs1WDvEz0Tq/PzNAIvt6o3CTXc2bHcd6I+FY5NnU5EkqWNg+TWPfDNvgkhogjALSkyZM4urF/KCpw//lK+nTjXjjbsEUeFubW5UUrv0dcLdD+q9D0qf+KYUMnylI/XRFoJXGdJAcA==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a084e5ca-606e-4b3f-e274-08db4c9c6733
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB4926.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2023 12:38:03.5357 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NS7u1XN1AEKmBXiqi/79mmxFQbmarkf6Wg7JgUZ7MihPsPL6FX9KaDA9TYCKyCfJInwxZ4TpJOFrnslPuzymTfDWGxiWtgtykl/wgzqtPaA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4507
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-04_08,2023-05-04_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxlogscore=999
 phishscore=0 bulkscore=0 suspectscore=0 mlxscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2305040103
X-Proofpoint-GUID: 7bcWPYs2urSXjBgD0y4jnk6t7GjGUVPR
X-Proofpoint-ORIG-GUID: 7bcWPYs2urSXjBgD0y4jnk6t7GjGUVPR
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=david.edmondson@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Juan Quintela <quintela@redhat.com> writes:

> Signed-off-by: Juan Quintela <quintela@redhat.com>

Reviewed-by: David Edmondson <david.edmondson@oracle.com>

> ---
>  migration/migration-stats.h | 43 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
>
> diff --git a/migration/migration-stats.h b/migration/migration-stats.h
> index 149af932d7..0e49c236fa 100644
> --- a/migration/migration-stats.h
> +++ b/migration/migration-stats.h
> @@ -22,17 +22,60 @@
>   * one thread).
>   */
>  typedef struct {
> +    /*
> +     * number of bytes that were dirty last time that we sync with the

Minor, but given that you are writing sentences, please start with a
capital letter.

> +     * guest memory.  We use that to calculate the downtime.  As the
> +     * remaining dirty amounts to what we know that is still dirty
> +     * since last iteration, not counting what the guest has dirtied
> +     * sync we synchronize bitmaps.
> +     */
>      Stat64 dirty_bytes_last_sync;
> +    /*
> +     * number of pages dirtied by second.
> +     */
>      Stat64 dirty_pages_rate;
> +    /*
> +     * number of times we have synchronize guest bitmaps.
> +     */
>      Stat64 dirty_sync_count;
> +    /*
> +     * number of times zero copy failed to send any page using zero
> +     * copy.
> +     */
>      Stat64 dirty_sync_missed_zero_copy;
> +    /*
> +     * number of bytes sent at migration completion stage while the
> +     * guest is stopped.
> +     */
>      Stat64 downtime_bytes;
> +    /*
> +     * number of pages transferred that were full of zeros.
> +     */
>      Stat64 zero_pages;
> +    /*
> +     * number of bytes sent through multifd channels.
> +     */
>      Stat64 multifd_bytes;
> +    /*
> +     * number of pages transferred that were not full of zeros.
> +     */
>      Stat64 normal_pages;
> +    /*
> +     * number of bytes sent during postcopy.
> +     */
>      Stat64 postcopy_bytes;
> +    /*
> +     * number of postcopy page faults that we have handled during
> +     * postocpy stage.
> +     */
>      Stat64 postcopy_requests;
> +    /*
> +     *  number of bytes sent during precopy stage.

Spurious double space before 'number'.

> +     */
>      Stat64 precopy_bytes;
> +    /*
> +     * total number of bytes transferred.
> +     */
>      Stat64 transferred;
>  } MigrationAtomicStats;
>  
> -- 
> 2.40.0
-- 
I'm not the reason you're looking for redemption.

