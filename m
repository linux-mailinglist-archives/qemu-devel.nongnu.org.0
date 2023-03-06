Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A79F6ABE8C
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 12:47:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZ9I3-00007V-13; Mon, 06 Mar 2023 06:46:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1pZ9Hz-00007K-3P
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 06:45:59 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1pZ9Hv-00025J-GP
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 06:45:58 -0500
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3268JQt0013276; Mon, 6 Mar 2023 11:45:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : in-reply-to : references : date : message-id : content-type :
 mime-version; s=corp-2022-7-12;
 bh=GYGCeWPjyvSq3Kjg97wPmJ5C6Hu403kllc8FZwCxaFg=;
 b=Sjv2hkIYgj10O1u9TQV2h86E/fkWdTr5/MIkkpYy58pkgWcJDNEYLeMR7S1gpstfWDVg
 b19i45c13FvegRoBbO7zCPFNquBIu0sCeMxBz3ockCkk7WU7ir+yn2A08eBKJN7agGqB
 Z2hyt7+2XggW+SgBoc2hkyA/LYhGGthgwH7+zTejrxwCRts3SvVC5hH9YW3Kkuf/8pMt
 MN2P6hhf8v3IvgzB1FJ0sXnZ0PywoSPJop0mRzvbXb3gn0sbWCBpGiSt1b7XFyOeskuf
 QCehHQ9GE/eMdmRtXN513VmXImKyGbfXTiHqL4Kzau9sd/XyGA/01MHbmTgLPL/VhdQH og== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3p41562pbv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 06 Mar 2023 11:45:51 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 3269ZOu0037535; Mon, 6 Mar 2023 11:45:51 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2176.outbound.protection.outlook.com [104.47.59.176])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3p4txcvknc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 06 Mar 2023 11:45:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DMsQRDJ7m3ssM5GGbDn/i1P8txEQoTzCNhDXQbhQjwSFNU43BVZCb8uZhUK0Se25QckBxSEb2CvdwgIR0A4gZBJsr9pIAcsnEUvSMVtWOsfRuweSs4en57S4bunSmybGhUJVHHEg1C6jNoa5QbaRYKQcDvOmMVeOjIWHPUtDeh0RqaAQtKNCKFrbRFJ0m2Q22v/br7ixABozb5gzG8nygGLCrgYxF076xMGawzEPMOjt3i0X0dHZW6cCAsuVSdwDh6OYOkDGZOguJ7kLJ3hSjQNFD3XgXycHOJgX3Y6/sgb548zS//K4H0hKAwseJTO8NOR2B6u65o3rEXFZFtEowg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GYGCeWPjyvSq3Kjg97wPmJ5C6Hu403kllc8FZwCxaFg=;
 b=JT9qJ1t46pFGHZcqZ0XypNQAuGhstklum4oNd8aKGe8oroBSmva2KR9bD2xK/+xmPNCKD5KAm5gONY6BD5pd0zhOsP4GqNQjrzw3QCKNmYTSa7bgE++LTsbPBH6b9WJtVeYeKDH/LlCwNRt2Asyl5yhy7xFz2opPRc7ob8FH4XiX9IIY5CfC9hVnrdjiWNGxBLa/Ipn2H6UzOBXn+My5a/wzpz5MtPCb6Q4tfqAk7gCqe5zs8raHVs77S9AaFFkyYQuHgNCegFfdhDYxhLFzDxxz+TvSBGDziq7VJSKZ6VOksVzNTi5xuQ8X6Gi2rAiFTb3eqBPKIUmIDzs0Xef2TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GYGCeWPjyvSq3Kjg97wPmJ5C6Hu403kllc8FZwCxaFg=;
 b=nTOAYRhKgUxLgY699eRrjqCkbWbtDWhqO5rfRCHoDWFrs/XHdDQJaX0yBLDnlB2O+4I5cHjQoFBM7ooPQ0/A8hyRNY9lixhupRXL3Ewp8HYU5KlBmPe1eISGlhDi8uOHd6EY9i03GodQH9YpBgaF0zGbgQ3aQ0XcS3r6mwzC7ZE=
Received: from DS7PR10MB4926.namprd10.prod.outlook.com (2603:10b6:5:3ac::20)
 by DM4PR10MB7474.namprd10.prod.outlook.com (2603:10b6:8:18b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Mon, 6 Mar
 2023 11:45:49 +0000
Received: from DS7PR10MB4926.namprd10.prod.outlook.com
 ([fe80::9ee4:1e8a:76b6:959b]) by DS7PR10MB4926.namprd10.prod.outlook.com
 ([fe80::9ee4:1e8a:76b6:959b%2]) with mapi id 15.20.6156.028; Mon, 6 Mar 2023
 11:45:49 +0000
From: David Edmondson <david.edmondson@oracle.com>
To: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Juan Quintela
 <quintela@redhat.com>
Subject: Re: [PATCH] migration: move migration_global_dump() to
 migration-hmp-cmds.c
In-Reply-To: <20230302162631.10250-1-quintela@redhat.com>
References: <20230302162631.10250-1-quintela@redhat.com>
Date: Mon, 06 Mar 2023 11:45:43 +0000
Message-ID: <m2edq2hzmg.fsf@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0128.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:193::7) To DS7PR10MB4926.namprd10.prod.outlook.com
 (2603:10b6:5:3ac::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB4926:EE_|DM4PR10MB7474:EE_
X-MS-Office365-Filtering-Correlation-Id: fa6afb79-1175-4b6e-5a16-08db1e38547f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2hn7DmuZ+KRTj5wMeca0xfrVReV3sYsPRPqz1LsVmTemUw/EFAr2NPHNrAja3QC2gmv5hjlJr8CSsluNYXgLCnqpu2oG+K0cjRPMQsaKboW0KNIi3AyP2YxB7/89WVNdAUSpaFr6zUS/RKOY8gerM4U9asiKbAjAPW8GGis53e34c0iRaGf+CjY7NThG308+OyrtphrukgUlk5OEFNjTFLdJlwcGqBbd39JPIlgqBxFTm7VHryJuaNW6OLNGj5AhUWntequaTu0xmTWvYrS9m7bLXOy2cDDmXtt8SDSXyCn7BNoIFtonLmy60mN3GWSeFp95TlvnLXDUdtPAnNKUU6ls5FgtBmSrCksaUYJkUJgqzzfp7pjGLowjvI5bfc7gbSW5iSXCHCA4XDZlDpg75f9VGpAXET4Ry55XNRFhLLs56glAJuTE0HOY9aMjSTVjjHtXNWG2lhYIhnk5JudIL1TI+NWaO86InpIOb46vmQYEJbCbAxqgMA7oLzW+ZmlB3zBlzCE6x8Ye9T+iuAzcvpdiLau4sKFdwuXXWiQT8w9TfEuWGPECFanrL6XpLS0XQAaheGS/fTi+/XUr7IsF1zfaNk6e94gm4X34FvQqMtPCzKjItg10nlU17IBI0WryHCnpgnaWGAujlqtKeQkSQQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR10MB4926.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(136003)(39860400002)(346002)(396003)(376002)(366004)(451199018)(2906002)(38100700002)(6486002)(44832011)(6512007)(26005)(186003)(6506007)(6666004)(2616005)(5660300002)(8676002)(66476007)(66556008)(66946007)(4326008)(478600001)(8936002)(36756003)(41300700001)(83380400001)(316002)(86362001)(54906003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EFncb7IG1GSuTplh+6ZRZ23B+4A/YJmhFVSlhJ4sUQQGEitdrhNrK3mPHu7x?=
 =?us-ascii?Q?hIkFb5zz/yIJw2UmGIKDWaFdCopbsYfuWdsqkZN0kty6phJ/8lWSHCDyXwrs?=
 =?us-ascii?Q?VgOcniiS7MpfkrLA02V9MDrynZwrdjkg2xy97p+bTSHgVjpTiN0XDahDWXaY?=
 =?us-ascii?Q?5zPXZT23PhS4djW+TdC0Ay4qhAJpKbDkNSeDFhafwlxOI/NOjYHFAJQv7HHc?=
 =?us-ascii?Q?AXlVvRu9gIID9AUFIwCWzIY4jH9bP5RdwvGaKH0Uk0vFjVElx0652e1IHJGD?=
 =?us-ascii?Q?Hzg7NJGABxlRPV499Cdn17z+KWqKEMXsMvE6fHUq+e05AikIlw/khmXTbb9i?=
 =?us-ascii?Q?r4jYBPRXwrEizZdqppDv0CW91vFnaX3YCPaiRHkfsxiUOWV/GASj+b3zbWvl?=
 =?us-ascii?Q?NdVhmPGjYrbGZNaBnQ46z/XLEXPXFPJjFwOPk8GJVC+rRHfqloYHyLa3d7Uy?=
 =?us-ascii?Q?YLe32+KyD2sve+EzuA3i1uTWksbTygwKDosHCNiQrKG3Hj71D82yQy7QDpe2?=
 =?us-ascii?Q?XzvNcTlCzOOW0fwiLUV2TiXGFSXrrYOjNVkVFloh4UPv4/LtvPtNTd4EZilS?=
 =?us-ascii?Q?WMmgRpZ80XzXercehFUBfyj+5i/oFB6gEyeUXYzB5unfzlco6Za4kc2wCOy7?=
 =?us-ascii?Q?eT/XW3kdga0+/eS/EfHmMhfoIm3XiR3IydwWrYgm9F41g3n4JSQGG1NcF0zM?=
 =?us-ascii?Q?jgmOZqree3DUaQK4w9aSf2vk7B//LIsCR6S3c30pw36magClX8YIl3PQij4+?=
 =?us-ascii?Q?3VDiYgQvpQOaLEJqvQU5TVN8Z5rutCETc4FlLRF5Hm2IGYt0RsldAKs0Bftm?=
 =?us-ascii?Q?OCXPrwN7Wr+lOc6HPkDlZI5a9CwN4YGKDeGPvlVnwan2ZKYF82+pufBLuCg8?=
 =?us-ascii?Q?H7jhrRK1CNmawI6tlTsIorVemX9cF8cm5f7TbLsrP5zkyzC3uv2/762lq+zW?=
 =?us-ascii?Q?4hy4M6A6zO/TaAGlhbDBEchQqUZZL6DvfSY8kys1COFCTWk3W1nDtKdloo4i?=
 =?us-ascii?Q?lWr9E0O3Sx8rER/VwUKasKCotYLVfFPGhVhXAyrEDlkH4ZLJQtiSaRUe3R0B?=
 =?us-ascii?Q?Sp80/Muk+jPtU6oXfbP0SIj7ExTh7t2QG9p58gplc2fOq03+UylEBDJwkz5W?=
 =?us-ascii?Q?5ht3AlcmuafZqjht9H+wq3/vv9ggTg4kXVyzjPXoBzjM50BR2Dm2aWJKolz+?=
 =?us-ascii?Q?p55OCzuRcVuW1eed2qPt2/7+hSLwGZPxv8BcO/c5XOXSxlmsxgH4cJt9vTYX?=
 =?us-ascii?Q?q3zxfM3XQbSJNsmLRLanqnnw9NSMWuskpAt3OA6Zt49+6jYEFNssTPhgx+ZK?=
 =?us-ascii?Q?XN7v/G1n07YDtBG7yqB+xTOyIIdqjW52BK8izP+oHUNWLNqQOFtvtK+HUEBM?=
 =?us-ascii?Q?jeUC94CUYeOa0P4wRXYskbUre+VQtu7AaqPbUP1vXJ9oIO8iY/sNCwB/AMql?=
 =?us-ascii?Q?F0dCPffgLVOHNXg+UrjToMFXpizyzvyJ8VuZxdn1k5Hge/sm9g2bU0H7vPo3?=
 =?us-ascii?Q?8XB0+2i1olL5hGnc72HBFYAWzhd6iF4ByCEWVc2yx8oMvAZyAIxxe1kNa4Je?=
 =?us-ascii?Q?P6rCQk3Q5MRixviqUtE5xg0GHP1DnR3Fx61NnELWcg8zTHSyvclgKEOM642U?=
 =?us-ascii?Q?XQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: scXT8w/yLkkbiC5cbigAy8cQQUxCOfZA74dL/4uXw/oiQeAATYxfl1grnYnPOMSI7vvfZQXtSDDL3wqxC4IqTeHHs64RIakd8jxaBl7aHJ4MQ3pgSA+M9rWQHslqCjri8hRFCm8nLH6CAHhKQllI5OuD/mJIlxV+ln8LgHOsumXxXzOxJG2eiT0ix5jryAH9hFcl3kJxgW2PP0+jwtOpgOwGE8wnduu0iGAMZnGYB7ZefMqiiRl1ORVKkr19tkJ54JluWHGyjEXFSWW9sRn3OF5yQxa21ffwYlrhNHPOINVVMvFJAqppYxZ0SEjRnbQN5S54CV5Lkurp2/l0SRAEsw7/6Ka+547u4qnj2pOC7/AmyS5ABNvAtlWTdyz8BFnAgu01Ra4ya09YsrhfCuX9AUJoZGd0mG900NBThNh9ovVYRuQmyxFf6kx1JgrtFyhRcFMMyma6xcacIh18tD2B+gAd/qLGj8vYh1FRgN3bPzTy35x+MePBm4CFtpiPsRhadUmcxLS6k+miNN/xG8QPtZpYkMCL12UOAXUgeTvR0BEgJhMmQsYxj3chhxI8X3gJHjHuOtjs85NaIlKnFgeo5JuzVxh0CxpmyaqCvALKGl7EHk2XdmBjGkiCCiAV332GNf0ugC0L1FL3e4EnGNbbwEL4JeC1eUNJECrKDu98JJVmF6almOThW812x/ZYU9KA5ENAPSnrQL2eOjD2VKFpPWk/aPeZRb1E/SyPRvR/fBwgdMPyUJrHaMMKaVfCEJlQGsCwa22tJ5avKfLNflPSvA==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa6afb79-1175-4b6e-5a16-08db1e38547f
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB4926.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2023 11:45:49.0034 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rqFw/KRx9GZl36xJDQ6cMhRLZm31gkPohIXHtur2k3ffdkPQevoCqylkDfmOnOMW81SP+NZkWpUIOY41/n6wpLKfklt7Mo0bz2po9NfBQmY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB7474
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-06_04,2023-03-06_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxscore=0 adultscore=0
 spamscore=0 suspectscore=0 mlxlogscore=999 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303060103
X-Proofpoint-GUID: 4hP9zF45TzS2nc7yDiRsPjq9wdkEfMrE
X-Proofpoint-ORIG-GUID: 4hP9zF45TzS2nc7yDiRsPjq9wdkEfMrE
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=david.edmondson@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

> It is only used there, so we can make it static.
> Once there, remove spice.h that it is not used.

The removal of ui/qemu-spice.h seems like an unrelated change - should
be a different changeset?

>
> Signed-off-by: Juan Quintela <quintela@redhat.com>
> ---
>  include/migration/misc.h       |  1 -
>  migration/migration-hmp-cmds.c | 23 +++++++++++++++++++++--
>  migration/migration.c          | 19 -------------------
>  3 files changed, 21 insertions(+), 22 deletions(-)
>
> diff --git a/include/migration/misc.h b/include/migration/misc.h
> index 8b49841016..5ebe13b4b9 100644
> --- a/include/migration/misc.h
> +++ b/include/migration/misc.h
> @@ -66,7 +66,6 @@ bool migration_has_finished(MigrationState *);
>  bool migration_has_failed(MigrationState *);
>  /* ...and after the device transmission */
>  bool migration_in_postcopy_after_devices(MigrationState *);
> -void migration_global_dump(Monitor *mon);
>  /* True if incoming migration entered POSTCOPY_INCOMING_DISCARD */
>  bool migration_in_incoming_postcopy(void);
>  /* True if incoming migration entered POSTCOPY_INCOMING_ADVISE */
> diff --git a/migration/migration-hmp-cmds.c b/migration/migration-hmp-cmds.c
> index 72519ea99f..7dcb289c05 100644
> --- a/migration/migration-hmp-cmds.c
> +++ b/migration/migration-hmp-cmds.c
> @@ -15,7 +15,6 @@
>  
>  #include "qemu/osdep.h"
>  #include "block/qapi.h"
> -#include "migration/misc.h"
>  #include "migration/snapshot.h"
>  #include "monitor/hmp.h"
>  #include "monitor/monitor.h"
> @@ -29,7 +28,27 @@
>  #include "qemu/error-report.h"
>  #include "qemu/sockets.h"
>  #include "sysemu/runstate.h"
> -#include "ui/qemu-spice.h"
> +#include "sysemu/sysemu.h"
> +#include "migration.h"
> +
> +static void migration_global_dump(Monitor *mon)
> +{
> +    MigrationState *ms = migrate_get_current();
> +
> +    monitor_printf(mon, "globals:\n");
> +    monitor_printf(mon, "store-global-state: %s\n",
> +                   ms->store_global_state ? "on" : "off");
> +    monitor_printf(mon, "only-migratable: %s\n",
> +                   only_migratable ? "on" : "off");
> +    monitor_printf(mon, "send-configuration: %s\n",
> +                   ms->send_configuration ? "on" : "off");
> +    monitor_printf(mon, "send-section-footer: %s\n",
> +                   ms->send_section_footer ? "on" : "off");
> +    monitor_printf(mon, "decompress-error-check: %s\n",
> +                   ms->decompress_error_check ? "on" : "off");
> +    monitor_printf(mon, "clear-bitmap-shift: %u\n",
> +                   ms->clear_bitmap_shift);
> +}
>  
>  void hmp_info_migrate(Monitor *mon, const QDict *qdict)
>  {
> diff --git a/migration/migration.c b/migration/migration.c
> index ca52c8aab3..c0584481c7 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -4410,25 +4410,6 @@ void migrate_fd_connect(MigrationState *s, Error *error_in)
>      s->migration_thread_running = true;
>  }
>  
> -void migration_global_dump(Monitor *mon)
> -{
> -    MigrationState *ms = migrate_get_current();
> -
> -    monitor_printf(mon, "globals:\n");
> -    monitor_printf(mon, "store-global-state: %s\n",
> -                   ms->store_global_state ? "on" : "off");
> -    monitor_printf(mon, "only-migratable: %s\n",
> -                   only_migratable ? "on" : "off");
> -    monitor_printf(mon, "send-configuration: %s\n",
> -                   ms->send_configuration ? "on" : "off");
> -    monitor_printf(mon, "send-section-footer: %s\n",
> -                   ms->send_section_footer ? "on" : "off");
> -    monitor_printf(mon, "decompress-error-check: %s\n",
> -                   ms->decompress_error_check ? "on" : "off");
> -    monitor_printf(mon, "clear-bitmap-shift: %u\n",
> -                   ms->clear_bitmap_shift);
> -}
> -
>  #define DEFINE_PROP_MIG_CAP(name, x)             \
>      DEFINE_PROP_BOOL(name, MigrationState, enabled_capabilities[x], false)
>  
> -- 
> 2.39.2

