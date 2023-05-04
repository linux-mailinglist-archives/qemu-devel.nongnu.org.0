Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A076F713A
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 19:40:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pucpP-0000VP-5g; Thu, 04 May 2023 13:33:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1puYE6-0004CZ-1M
 for qemu-devel@nongnu.org; Thu, 04 May 2023 08:38:26 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1puYE4-0004vq-Dl
 for qemu-devel@nongnu.org; Thu, 04 May 2023 08:38:25 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34444hAr003785; Thu, 4 May 2023 12:38:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : in-reply-to : references : date : message-id : content-type :
 mime-version; s=corp-2023-03-30;
 bh=wFZfZr0S2eRqZM3SuslK4l6OH3E1Zn34a3mlOYASHnk=;
 b=xOLrrnpkw26kgNB8OZMbJS+kRr2DmR6YYQYchCT4XaHZdWTrX4FH4jQyLP/pD46iZxLe
 +K4s66tfZE8TgNoWxK77x3pGwVh1RlqxkvooJ0IpfOEX/drtr6BCBJr10RzJmbonvLUk
 31s4C1e0wbswGuq7GVv8THLn9EzvrpbT8hqDU/7H0FYuCipSt6eHN8ejtNhlbCCUNHZA
 TVv38wGHPzPJjMt4sCGBmqvVZn56MjQErOy3fdMMIJf4zh1igRLPI36kdyqE4U9bxb7x
 XCPIFaucv5WuXgenN8SoaU6TZoODp2O83SoajhTOQm8N6bDJMG+Z9j0MhqAtR8F5DDpQ wg== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3q8su1spt0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 04 May 2023 12:38:22 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 344CT2R8040476; Thu, 4 May 2023 12:38:21 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2175.outbound.protection.outlook.com [104.47.55.175])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3q8sp8f481-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 04 May 2023 12:38:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MwBD0STZYLQpexpN85WzwOBxl56tdsN/gNVllN+5onGR+dapwhwptJHsrYpMNhocx8yiIDLx1QtYGEnTfYy5pEiYUwZ+Ubt3MEe8D5I+iLFi8d9Sbgr9HVLduCR2Hj+3qCdtKd3hRX04VLR3JFA0bn4j4KEjeoKIlnOVOpFRP7qQzjoC66dW8Et9UBaGWO+/LlhIliIlSckaNLNkuIDL2Lk3O2gaTsda90557iV59n7Nj77xInhEvD8UUKE3+YWUgRAfcQbJREY3eGJB8zmbmMOpPzfPt6yrKYWcW7F9HZ8nWM/WyQGvqJR8pBfxg3Uhd6Z358/76Q1ti+O3WilkhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wFZfZr0S2eRqZM3SuslK4l6OH3E1Zn34a3mlOYASHnk=;
 b=fD4y+aOG1QI4v2R6ZJ/PAru/1X7vJ0EX9p7Se5/9j3ptSktE63kQDk1Sk3k236g9CIqVnFVvyEyKnjJWlw0VueyH6/mO3xqCheTw3UxRpgC34HI8+63Da/7yxNP0uF9SVtnr0sx78XLKOP7TZgCzsaRfPnURt2HL2mDLKYOoSiACtreYSmYKRbdwsVtUqAU4kuxrUejSYMNTf2SM/BdjLY+0F4lVws6SsYLl9ClK8dkZKjmLxMqghhzr86MkYxmD0ytJzT3etxJ8BdMop7Kr1ZOm8UmMf7mDMpyxwOdCyp6+2FLI2EQZUuWx9WQMYz9588a4iy9eJ/tyXooqAXiP9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wFZfZr0S2eRqZM3SuslK4l6OH3E1Zn34a3mlOYASHnk=;
 b=v4m2BFQS0ZpVrY1MPSyuplovx1hALC4B6tlm1R3FCNW+wKH6a84pJ6V+9ylr4sFfqvS2EUjxx90N4NpFW8fJMT5gPJTqWLtNHZi0YgLRRJEEhOxR2/w5XJRUNEmAVlmhbZInOjgQdcKh3SPSrfFp4p8cS4mEUx2J8x1bZ3qDmaU=
Received: from DS7PR10MB4926.namprd10.prod.outlook.com (2603:10b6:5:3ac::20)
 by SA2PR10MB4507.namprd10.prod.outlook.com (2603:10b6:806:119::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.26; Thu, 4 May
 2023 12:38:19 +0000
Received: from DS7PR10MB4926.namprd10.prod.outlook.com
 ([fe80::738c:b283:c54:57c0]) by DS7PR10MB4926.namprd10.prod.outlook.com
 ([fe80::738c:b283:c54:57c0%5]) with mapi id 15.20.6363.026; Thu, 4 May 2023
 12:38:19 +0000
From: David Edmondson <david.edmondson@oracle.com>
To: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>, Leonardo Bras <leobras@redhat.com>,
 Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH 2/2] migration: Put zero_pages in alphabetical order
In-Reply-To: <20230504103357.22130-3-quintela@redhat.com>
References: <20230504103357.22130-1-quintela@redhat.com>
 <20230504103357.22130-3-quintela@redhat.com>
Date: Thu, 04 May 2023 13:38:14 +0100
Message-ID: <m2h6ss5l1l.fsf@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0617.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:314::18) To DS7PR10MB4926.namprd10.prod.outlook.com
 (2603:10b6:5:3ac::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB4926:EE_|SA2PR10MB4507:EE_
X-MS-Office365-Filtering-Correlation-Id: bb9bed2f-1c29-42ee-7915-08db4c9c709b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7nOtvQEgOpRVpBr9jKtN5bqq8e4LkdHmjK6yur0fPjK+QErjOO76rZ/4dRxm1w/Q12oT6XQKTIKANhn6CJ8ir4wD/2voSF6i9MV6PngAWiz4e0xsKYOxh4PBNkMam9J0ZsQ5sK79I+7RtALz6k8un7lar24oWoSZqE+/9smOEXI09ddvHZvT4eXjkHposz/pZ17+ZXPXYN+UUgwEH9QxesofthUe5fVcPELm8sl1YffZjsGZeuqMWJ55DLJPwfK3IMTcHT3gV3ye+B+CXe3FTsPjwjvIglMS+PitulNXIkB/uY5mFkUeoOuJHYff3p6s77Rf7ERZcnDjamEaDGeZBtFyAXe7/vOYMCivKUtrRnzbOCxXNqDRk3rio+zbFlq3utwzaDTINxr4r3bTXgm434PkJDCSbPGbjV9fKqaqxG9zExwIi68+f1pMkDuDBy68KytsGXGsj0YLoSuUAEUJkzfIkYCJ/9CpHpxN9VEsVpWQY1RITo6DmSsNuKuyeZcvXY/G1xv/Kc6ZLrkleIBkZ/ZISEd1k6zSfStjpahhLbMxTE8bzoByB137sqOpVlSK
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR10MB4926.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(39860400002)(376002)(366004)(136003)(346002)(451199021)(6666004)(38100700002)(478600001)(86362001)(54906003)(83380400001)(186003)(6506007)(6512007)(26005)(2616005)(36756003)(6486002)(5660300002)(8676002)(8936002)(41300700001)(44832011)(66556008)(2906002)(316002)(66476007)(66946007)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qcYRQiJItMwdxJgrB6nR2Yi7JVunkw/sp7t6GRIfUa/8c81uRS1dVAonE96B?=
 =?us-ascii?Q?AqnpiCmYA6Lch0BeFJn8w/pEz7BKmyvat8xjyt4ZGkQCYeB3KtCINo1A/tIg?=
 =?us-ascii?Q?YEk9bp6C/y5xWgp02/jJQMhwbpnytUNKtLd8DaYwXJAEQDnP9n/LQMDvN6Ro?=
 =?us-ascii?Q?SXAdv5x7AaSut0mQsq1weFF6iiAA8XUE6fTLDqqISUZHtny6FQXhfPD2EYnz?=
 =?us-ascii?Q?sFFpnbpOFwGP5Pdm1nQlAXQsJeJMV4Zx/XzJ5i7V9XZ+0p9g+ChBn7pCo6Ya?=
 =?us-ascii?Q?dszwksgXJkp9+PyA/toWAvqgYfUPUW2iuAVWGWDq9ILuKgQbfLIMBBFLbZpp?=
 =?us-ascii?Q?L6gfdJqmOpNMOLKJOEnXD6FFl3DomBMC7mMuptwKW9d/0aGLA0msZcojfTI5?=
 =?us-ascii?Q?mT1FpttleoIsANtHUJkuKzIwvVqJMUdwB9Yf2WcvaaD5ZVBej7XeMqiVW17o?=
 =?us-ascii?Q?7+iWHwl89uvLVm/D7Un6t3vAEk7uZCk/Lxju1VoQfTWIn2ZtmjhjHVtYRQBD?=
 =?us-ascii?Q?qrJWW6Uts2cwX6lX0sRM7CtatAcLzcmXCVzkiVdfBkzbmLBuzhcNKvJED8jq?=
 =?us-ascii?Q?FJ/wCdkZMFTgxpmsQNOvFZ36XZCsFJkqRRhA8qHWMFJR4h5RURB1+lfScOT+?=
 =?us-ascii?Q?Hnogu7tNJG51QXdToAsG8+dzT/DK2Fi3W1nDgzMSOhWvhKsPH5/nqWKwrXWX?=
 =?us-ascii?Q?g5QcGgzIrn/bKVlqzl08SH39J1cWf7p+2PKR0n+VSdi7Lt731TnLduhCzW9M?=
 =?us-ascii?Q?CIx7hSjG1K7efOubZ5MAmXghKpXksOxgwgVGTC5h4TKerncwoeREogc01jBQ?=
 =?us-ascii?Q?+hf4ry0GCWjujkivFvJm5k7qQsu3RK3IaJUnwdHpluOA+3IQlzyrXt2FXsjv?=
 =?us-ascii?Q?mlcoVIze9LZXrrz9F5eiyIzIfHClyS5yFmaI9L9WcAaNeTma+XoHTAG40uNV?=
 =?us-ascii?Q?BBE/lTtaN+MnvDSx+YbiizzQzcQRvb82jfv78A7emDIlOSUoP+UwFARijuuo?=
 =?us-ascii?Q?4lg0/4UY8S/mnBLgeId+aSD3NBlRyugQjRt2OPyAsE/PBv91nqNnGi6r7xqQ?=
 =?us-ascii?Q?Ns6nGn94bdoAZxp54pJrHgQOL8NAJ1g58efqNEisDRf9/zofsdGocG7B6pH5?=
 =?us-ascii?Q?KYeYbBCXAffUkPgknakIW2cldPCiWDI7q/Ee6+0gvyLUkW0KKP19Kjv7CNK/?=
 =?us-ascii?Q?osYFMBq/yJYnuQod4Y9641ebDNV/Gd5J2hU6PHTqkaUfCPEyQVbesYxe6EpM?=
 =?us-ascii?Q?t4z1SXIObKpyDItVC5HsESJs0fUiY03I2PStBFKTVCt/WOOSVIc21KVne0KY?=
 =?us-ascii?Q?2dMcP//Om5cFnSZiTNVkljS2Ch2qZRdZrbf/32PYKIwaK2uF4nJM3/8QwFeE?=
 =?us-ascii?Q?bRDhA8mWuqK9JA9/kdo9Hr87GDjac3zL7z7xMV/pKnUvq3g7UFDhSfL8HqVt?=
 =?us-ascii?Q?o9BF/2S0XA7blnum9ZYIkYZsYkzryXKXg+sMA76tw/ksg+tX7Q4WAFQqqac1?=
 =?us-ascii?Q?mqOUZHILeUJEhItVhgvH7SWOFSSPk3lEexTbZQ7bAH0N9OHqbhxgtg6EzfZs?=
 =?us-ascii?Q?h6cyAP8BNf4Gog4xYjYQLo58lx7HjIoDn6dOL9RSJpZ8FBSgkPHgTtl3l+dk?=
 =?us-ascii?Q?FA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: U+QgkqF7Y+Bw/dvmwcRN0lWeMcPEHKERx6h/4tHdHTvMXZia6B4yg3fTWV9xyTgfAlGm/8FeWEG90/OFcRseMajDhrXNL9wOv5MuHizp9XVd9iTecpqlyKR8+R3jgGvEXyV7Y/iSDiwzWPUqEbi3e3VuPSEQT/iMBzUtjdxa2Z3vVjT2+ehvol/lhJkPX1doXj+Wn3b0qEnNj5oJIWMOCjPvM2xJU9srhMvVPUNjZbehw2LT9BmcnVJ7Wb+Oehss6GlAiSMHrPKEYuaHDrsjRy+jCVOCzlIf+fjZeWNNwb7L566XkR2VioHaIx+OZZbrMjtFhNCp/RlElvTuKVSxlKZhc/kyEbLuZ0tdIdaRihiw72wxIFVllb7v0obUPsc8RrqJ6u1X9bX77H4nOSJz0prfaeR2JCF7dLbKkYkkPOxBUdRh9qVTdOlVTnZ0GURgucK8UQ1cGCG9UgE/mhclPoafugMmwA09TCcBlKuUjc3LZf1Ze095o0bA9CHcNbsLM+gWXTFDjndwZM/ObA/u/208RA2aK3oBJdjf5YT+GeqHbk4fTcCK8yBWsz5MR82TbJa0MWVakkltAMBMObRXksO2Rq/lgezzFV5nhO8LgN6PpMnvawb7rhGRgxlDS6WazW2Y2k2BzUSxkNNPfXYLrQm40Qj+OvNLk4Rrb5YSJ9n9MdwpnGAq13tGMOZbK3XVglPinql9WbJ6/KP7lcnGbYzsuCyiR0z6JBRn1PDuNeRjj4zEx0Lp/ZPBZn2XROz+IEO09th2zWPW6MzqseoZKg==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb9bed2f-1c29-42ee-7915-08db4c9c709b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB4926.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2023 12:38:19.2124 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +SCSqpFeQW5JSaXJkx8Fclo5pjJirSQbH2VOn7zDxBEN1x+z5MkifcrElsvpvfDfn/I7KVEi7rJxPR4V2Sur3RfhtklnWQ/lesrr7flN0vQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4507
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-04_08,2023-05-04_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxlogscore=999
 phishscore=0 bulkscore=0 suspectscore=0 mlxscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2305040103
X-Proofpoint-GUID: IC5CD2XDNvC1jfHLOmvZTVCLJHG5uYwM
X-Proofpoint-ORIG-GUID: IC5CD2XDNvC1jfHLOmvZTVCLJHG5uYwM
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=david.edmondson@oracle.com; helo=mx0a-00069f02.pphosted.com
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

> I forgot to move it when I rename it from duplicated_pages.
>
> Signed-off-by: Juan Quintela <quintela@redhat.com>

Reviewed-by: David Edmondson <david.edmondson@oracle.com>

> ---
>  migration/migration-stats.h | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/migration/migration-stats.h b/migration/migration-stats.h
> index 0e49c236fa..b87ba30ea8 100644
> --- a/migration/migration-stats.h
> +++ b/migration/migration-stats.h
> @@ -48,10 +48,6 @@ typedef struct {
>       * guest is stopped.
>       */
>      Stat64 downtime_bytes;
> -    /*
> -     * number of pages transferred that were full of zeros.
> -     */
> -    Stat64 zero_pages;
>      /*
>       * number of bytes sent through multifd channels.
>       */
> @@ -77,6 +73,10 @@ typedef struct {
>       * total number of bytes transferred.
>       */
>      Stat64 transferred;
> +    /*
> +     * number of pages transferred that were full of zeros.
> +     */
> +    Stat64 zero_pages;
>  } MigrationAtomicStats;
>  
>  extern MigrationAtomicStats mig_stats;
> -- 
> 2.40.0
-- 
I've got a little black book with my poems in.

