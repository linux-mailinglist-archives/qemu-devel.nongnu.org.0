Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D8A6ABE2A
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 12:29:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZ91J-0001QK-Q2; Mon, 06 Mar 2023 06:28:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1pZ91H-0001Pu-Do
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 06:28:43 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1pZ91E-0007Vy-HT
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 06:28:43 -0500
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3268JMj2013232; Mon, 6 Mar 2023 11:28:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : in-reply-to : references : date : message-id : content-type :
 mime-version; s=corp-2022-7-12;
 bh=XlPhnrLbJsM6xxV9ro0Fpl83G2zzM8AjqLUyfj114vI=;
 b=Ar+tl1GCK6JYO3C6LXaIQe8MVfLfuYYGjedXeES4VBFQJ78UQLE/1ywm+8cNO4hHRKqo
 vsCNOxuvu5o20pDBn4+BGFYyDXzpeqBvms7qc107KhrwMn+HlGDLJqW86yC9/l3fJ9UX
 +kdqh6BuKmio4F8SWKT5q7lmj8kfH2GIkCr8yh/4nC3vMHeN8jtV55+jh3iQ46XUyxST
 7rCMCWeV7oK3IvrFGrVvyqGvuB1RAZ6i7ANF6ToxzBlY0MUVwPfaXRRplwuw7ny1C9zm
 LZr1SSvAfMQRrXB2d63m5BYOXc+v0DhPzowOsIeMtkoR6S28l40Phz41WQUAVGKMqAwD AA== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3p41562nfp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 06 Mar 2023 11:28:34 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 3269jHDt016232; Mon, 6 Mar 2023 11:28:33 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2106.outbound.protection.outlook.com [104.47.58.106])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3p4tupme2s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 06 Mar 2023 11:28:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UnFDLdYz5zJFI4prRTb4LFDma7345aljFMkQs6wLrZkh/48ohO3x6zv4CrKqncBa0UFWQku7wBpUgGB6E7KZaATWJfZ4XZwL4SKI48fNxk/8Z8fNomcRYffve0xqyJb6xxka3pUWaY5ubk3tt8CLekRACEgKTsAHGip8c/PvovGxwBHX7nOLQZEhn6IrjilQcMfu8dvlTnpLK2QTtoAKWWf3nFUjoLNv8LhbbLvMg/q8rgN9JQ6HGjbQZBh1NWFI5RGlOsn3K10rAJsXOK83M+sBbsERhMVR5viz1BAZQu1LAWHuRV790U/cm7OIb2FTRhOWjs5jZuflWpBqSQCDwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XlPhnrLbJsM6xxV9ro0Fpl83G2zzM8AjqLUyfj114vI=;
 b=BpSkFpFMiZ4t6gKm4sc7KdRE3FEF2kIwCbM22EDkrwD0KKtAZafxdXXbTtjvJ96RlnYKYPLDft/PqN831JaopcSNvt0YPPdgd9zQwmVr2VMlnJUL0eKugDcfmCTgY6nuncuIWCnLswhHUUgywRgzCKW++ZWfT0zEibbJZgztA5qfSiuURNt5fVw8Pc2y3doNIlaBt1dxMy712fRzXKdfrJTvH+4rpSoNMrEK0Dxie0hXrYN/McGX/bY1wRvQck1n87ETurnFRdzudGoILX3rB4u8O5mpVyC5P3vFppDcpiQLRmYdH421O7z9D4VIP84azo4XfkrmYrbpM6dWg/2qoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XlPhnrLbJsM6xxV9ro0Fpl83G2zzM8AjqLUyfj114vI=;
 b=BicipKvKtOVXIvsbklQxWb6TBfSvdenzN76ugfbA3jlBOPbXG2i+VP7llz+GqMLuBrvTFO+fv1U7nwX9ea8l7coLNbqcsoG9cl2Xh0VGBoXxOFb+bFNrqMRfP5ExkOBssEhvhcydkqG0AVVfpigGPYzi2H5iJYpZQtcwCdrEI0Q=
Received: from DS7PR10MB4926.namprd10.prod.outlook.com (2603:10b6:5:3ac::20)
 by CO1PR10MB4594.namprd10.prod.outlook.com (2603:10b6:303:9a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Mon, 6 Mar
 2023 11:28:30 +0000
Received: from DS7PR10MB4926.namprd10.prod.outlook.com
 ([fe80::9ee4:1e8a:76b6:959b]) by DS7PR10MB4926.namprd10.prod.outlook.com
 ([fe80::9ee4:1e8a:76b6:959b%2]) with mapi id 15.20.6156.028; Mon, 6 Mar 2023
 11:28:30 +0000
From: David Edmondson <david.edmondson@oracle.com>
To: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Juan Quintela
 <quintela@redhat.com>
Subject: Re: [PATCH v2 1/3] migration: Merge ram_counters and
 ram_atomic_counters
In-Reply-To: <20230302162138.10076-2-quintela@redhat.com>
References: <20230302162138.10076-1-quintela@redhat.com>
 <20230302162138.10076-2-quintela@redhat.com>
Date: Mon, 06 Mar 2023 11:28:20 +0000
Message-ID: <m2h6uyi0ff.fsf@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: LO2P123CA0039.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600::27)
 To DS7PR10MB4926.namprd10.prod.outlook.com
 (2603:10b6:5:3ac::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB4926:EE_|CO1PR10MB4594:EE_
X-MS-Office365-Filtering-Correlation-Id: f9b17813-0153-4813-7eee-08db1e35e94c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NQ79kzRzAQ/7Aw8i3hDGuNKgYg6lnTtqtEEgjTO4o5RVqMpWN2/lINnNGr+lOBCNTOVuSm2LhzCBVugtAUBB9BkS+sOU8aO8kZtIlQvI8VVXfR5X1Sc9OkzDPkZVSqfmlwt/SSVJrgbm7ICDlixxEN1nxrhuXQe0Fa8Hmyy3+siaMVOIP3df91NUTTa1ui2djiAI78CtHbWHaPpE4CE4yCBr5whzZByTZjRsAAt3EGL4Ssg0+C5x53YfgCLAQ+sFjDIXZjYDkwiZ9RbuJiobpeI+DbKwgI/4231rHoilP+mTkdKT3/s9KhdqCyUxjXYVQ12VNZbwPAWbo9SlroZf3wvYFjOigKw/VgVcbyw6y2JynBoCOsMhvtXB7BPm9tqic+qc31mAlAcB2f1+BpPbsIDSOBV+KpEqEtGS2GlUcIEdI0rd1khBPNS3sqe8uuxs3XH0AlQZRo8AYH524YDLYdjE2kg9nSJheOUPPCxc/W0ymuLbnnGIX9UjxwRCTOE587+X2VC1GN9+XOJtHR+JZWoLchIxuQsXq/fAkq8QOwitVy/w87a5Lx4KKrEbqWMvhy2GkyVB16WzyUmbKYLKiAIEzK+OL17Yy0gF9iDIBbqXec7HYoxHOyJs1dDaMII+WexHH7tls80LI2vnY4U+Ig==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR10MB4926.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(39860400002)(376002)(136003)(396003)(366004)(451199018)(86362001)(36756003)(41300700001)(8676002)(4326008)(66556008)(5660300002)(8936002)(66476007)(54906003)(66946007)(316002)(2906002)(44832011)(83380400001)(38100700002)(6512007)(186003)(6506007)(6666004)(26005)(6486002)(478600001)(2616005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?H9wSDENIYFjsGyEsLiPFmAQ2/hEeQP42nXMRBYsHhuibEs2vCWVwfVIU/ZoH?=
 =?us-ascii?Q?Bg04ygy8N3Lj/bDsZhPpGtr57phbgjO58C9XMyX9rg0IxgxjhPeoSIY1JQkV?=
 =?us-ascii?Q?0oLdDiCdgWxfQUQ/sa0JBWwk3vKx36oHm7ZqZFqQ8odwgmJAvdi3vGQm+F3n?=
 =?us-ascii?Q?I2p9M89Z09uYYJM0SdJOGoySGZkeJaEk8KKDVi1zlZ+62rlEkRflBUW1UFBr?=
 =?us-ascii?Q?r+TFFngjeoL0+9Plr/CpPyZCkoHfSIxsgvotImGSYrca0lu4zMTzuTgMv1aW?=
 =?us-ascii?Q?vrLrQnrWY+8ZTcubFWsv9q+Fz7v607wWxhTwjFFdkwZ606kypdXeEfFpE2lq?=
 =?us-ascii?Q?ylV367wOzz5BIzO8hcHgljTecLxo/dhWtRmb+rIfqmrwNnKbk38dFb2VNa93?=
 =?us-ascii?Q?D6iH3MGs1Wqog28EBAQq/VmqyWgb1554vT5847LMZbSf/49mYdwEiW8qnjDV?=
 =?us-ascii?Q?FM7JSM7nIebUiHVfejMpwyGhh4GiH/vfPZ8UNzvTCfnM0mL716GRexBFtWV+?=
 =?us-ascii?Q?cvWo7lmAryyUAIiS1TXglKOO79F4pfqoRTPheTf5CW+5Vw+SrlJtnZHbYjcK?=
 =?us-ascii?Q?8iWJTa/ibZh5PdI9hSX/p6dFP0v8O+xsTwcIybBL5Xzn2uFhMebbdhvGP+Q5?=
 =?us-ascii?Q?qd8D9eGHrzqWB5+fct66vW7CBqgRHmVc0WxPq8o7lDppm11fqUzP8Q8PFNRz?=
 =?us-ascii?Q?GldRuLH5DrBrAGfjTCulyDm7Y4hRDiZZ3dGxMiRl+E6Mm0GiDlghJ7dWfaBS?=
 =?us-ascii?Q?wAPDI24FruFtU4K3Oj6tNLvOjVBmBM/UO+fo414dZPg/ZZGK7Qr0BGV3zQ9I?=
 =?us-ascii?Q?X02iNHs/1DzBY2PCTh6q+ddBxMK7gaj1dICMj2HYO77mpiO0HXa1UxHXM4Mp?=
 =?us-ascii?Q?ZSC7XRZ7chtAUJZHxpd6UNB0HjIUCpi+s4cEY023y/bRX4JZiCmDYfB4RBlP?=
 =?us-ascii?Q?Tss8ovmZDRtwNMXaAa98PARv1AXJEIgYCNzQY5wVfTFRaGoh0Lnyx8XR/G0w?=
 =?us-ascii?Q?j2M/NcAHfXEE48dQ8hDm1AB0VRalPVwKY0oa2kaXqCh+XMW7gfPtusDmdk+f?=
 =?us-ascii?Q?Naie2aS9ekddg/vvSho709jX7WfsQ6YCaFL932tN9TaeaT+5xBxaNiY60tqI?=
 =?us-ascii?Q?k9BrfNC7rkhJvvTsbJQBVzsudYDPsCQBYG6czQoY11A5SXbwYUXyXMu0lqBR?=
 =?us-ascii?Q?fMfw/iXlJ7BRPwCEhh46dFknz9X4CE1DU+JiF/pgwocjcfvDPRRcRIWRqqBf?=
 =?us-ascii?Q?/jFaL+yoTLwP8KUVv/2i+gKtwZg45WI0o4EH0a87qh5FsWBup4j/0H6uLtSQ?=
 =?us-ascii?Q?EDuQqvPJ3nQdNXXM0BPTBvzEXNYn+hqYFfwqKdHSJWvDVBoozPnKujs6NJPM?=
 =?us-ascii?Q?BPopurBWJTrXIaLL6OPZPty0A+lrE2kyxJnrzV8oXIUJRQfsQ1DarTzKe0Eg?=
 =?us-ascii?Q?wOP3sRf7rcjnXoT/K8feKbNWF1qlR1a6gVnyL4Th5TcMoTmlHecIywZGcTj5?=
 =?us-ascii?Q?7ewT2Ckn3VZVube4Ut/tUXTXVYWuv+WTKNlj4CDzilHzOrSW5tUKEKLp/wq8?=
 =?us-ascii?Q?St0e4LuLTsAMApCLryCO4ddoYueixYt69GM05Px26ZpuL0ypbywluLc9eLWP?=
 =?us-ascii?Q?aQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: ZHQhG0ShsUhzDR8oYs2spgTGeBLy45CK3RxeT/BarvaUO/10hm0QeJ5FszDun9jq6r5Sff2duuI0zPeg51huNSqARQGpfaXYpHRexCVX6X4SYrsNh2zLbvGhoKSnu14/uCkaHsJve7L3aeUNSmWq6uA0UJvI39+kKvbtT2cVQ0hZRcBIiPUwruCrf6gq9/MwCfQRzN60P8P9RZWJQog6PpmmjiJrBEQOdXSPCQUJ5u3JerYl4PqSnyBt267wlYEMW9E6X8r2n0kiAb/dPd7BNexqFJrYkGA0TN0xm1baN6rTp3Fj7qQUiRi6VV1v5jIzqOfTiBYJOKMySnhWZQxZ7XXImNWachbVzQZyJXt0xVjvET24a3f+4eLCL/ZkptUrevERA2a6v647l8ej87bnf4x7yOisPOs+kHF/Ye/JPuYeOHjtCmm28r/l/J7upWlREonsVLBTsh1Yf0aQnC4wO0VQSlwOvIjjNxnMVOpq8+fTRvaDEpsafsSKTK9i4D47DSHMbDDgytQY9am8KpSLzKADU5vQpcxJ3oW+XpSMEOYTgdpJTi1p19t53XRWEvl13THiQUMwHjA7OzBx0DoFmSMC02/9dV6zbHrCgEkj4w6ZyeX6lVPxgtXReSAp/BSMZoQueNEx/9sCcujdOgi3PkRMkEMcsKdWbRT55DFdM+mK7MUZI9gbdZWiX/kGYszICC6L/7t3I5ZSUSVCd1j7T7I7MvEthPXGZIIdmsQyWVOVCYMT1Q73FF/bxWehxXyquDICjsQJzbT/aCNHw5oZ7w==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9b17813-0153-4813-7eee-08db1e35e94c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB4926.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2023 11:28:30.1761 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tjKOQYXqb8gMqrcnwvYDnxbGF9PShGFQsE3G8egvzLyKNVittJ5klNVWwdI+AOHZdbtlNqcCTP1o412FZ9MoPGc/cRHdbaJDz09EWQML1C8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4594
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-06_04,2023-03-06_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 bulkscore=0
 malwarescore=0 spamscore=0 mlxscore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303060100
X-Proofpoint-GUID: TA_8Np-8vZ2B0DLFb3uhl5muQmbrMSBX
X-Proofpoint-ORIG-GUID: TA_8Np-8vZ2B0DLFb3uhl5muQmbrMSBX
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

> Using MgrationStats as type for ram_counters mean that we didn't have

Minor typo - MigrationStatus.

> to re-declare each value in another struct. The need of atomic
> counters have make us to create MigrationAtomicStats for this atomic
> counters.
>
> Create RAMStats type which is a merge of MigrationStats and
> MigrationAtomicStats removing unused members.
>
> Signed-off-by: Juan Quintela <quintela@redhat.com>
>
> ---
>
> Fix typos found by David Edmondson
> ---
>  migration/ram.h       | 26 ++++++++++++++------------
>  migration/migration.c |  8 ++++----
>  migration/multifd.c   |  4 ++--
>  migration/ram.c       | 39 ++++++++++++++++-----------------------
>  4 files changed, 36 insertions(+), 41 deletions(-)
>
> diff --git a/migration/ram.h b/migration/ram.h
> index 81cbb0947c..64fb92ccd4 100644
> --- a/migration/ram.h
> +++ b/migration/ram.h
> @@ -35,25 +35,27 @@
>  #include "qemu/stats64.h"
>  
>  /*
> - * These are the migration statistic counters that need to be updated using
> - * atomic ops (can be accessed by more than one thread).  Here since we
> - * cannot modify MigrationStats directly to use Stat64 as it was defined in
> - * the QAPI scheme, we define an internal structure to hold them, and we
> - * propagate the real values when QMP queries happen.
> - *
> - * IOW, the corresponding fields within ram_counters on these specific
> - * fields will be always zero and not being used at all; they're just
> - * placeholders to make it QAPI-compatible.
> + * These are the ram migration statistic counters.  It is loosely
> + * based on MigrationStats.  We change to Stat64 any counter that

Given that the comment should reflect the final state rather than any
progression, how about:

"We use Stat64 for any counter..."

> + * needs to be updated using atomic ops (can be accessed by more than
> + * one thread).
>   */
>  typedef struct {
>      Stat64 transferred;
>      Stat64 duplicate;
>      Stat64 normal;
>      Stat64 postcopy_bytes;
> -} MigrationAtomicStats;
> +    int64_t remaining;
> +    int64_t dirty_pages_rate;
> +    int64_t dirty_sync_count;
> +    int64_t postcopy_requests;
> +    uint64_t multifd_bytes;
> +    uint64_t precopy_bytes;
> +    uint64_t downtime_bytes;
> +    uint64_t dirty_sync_missed_zero_copy;
> +} RAMStats;
>  
> -extern MigrationAtomicStats ram_atomic_counters;
> -extern MigrationStats ram_counters;
> +extern RAMStats ram_counters;
>  extern XBZRLECacheStats xbzrle_counters;
>  extern CompressionStats compression_counters;
>  
> diff --git a/migration/migration.c b/migration/migration.c
> index ae2025d9d8..923f4762f4 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -1140,12 +1140,12 @@ static void populate_ram_info(MigrationInfo *info, MigrationState *s)
>      size_t page_size = qemu_target_page_size();
>  
>      info->ram = g_malloc0(sizeof(*info->ram));
> -    info->ram->transferred = stat64_get(&ram_atomic_counters.transferred);
> +    info->ram->transferred = stat64_get(&ram_counters.transferred);
>      info->ram->total = ram_bytes_total();
> -    info->ram->duplicate = stat64_get(&ram_atomic_counters.duplicate);
> +    info->ram->duplicate = stat64_get(&ram_counters.duplicate);
>      /* legacy value.  It is not used anymore */
>      info->ram->skipped = 0;
> -    info->ram->normal = stat64_get(&ram_atomic_counters.normal);
> +    info->ram->normal = stat64_get(&ram_counters.normal);
>      info->ram->normal_bytes = info->ram->normal * page_size;
>      info->ram->mbps = s->mbps;
>      info->ram->dirty_sync_count = ram_counters.dirty_sync_count;
> @@ -1157,7 +1157,7 @@ static void populate_ram_info(MigrationInfo *info, MigrationState *s)
>      info->ram->pages_per_second = s->pages_per_second;
>      info->ram->precopy_bytes = ram_counters.precopy_bytes;
>      info->ram->downtime_bytes = ram_counters.downtime_bytes;
> -    info->ram->postcopy_bytes = stat64_get(&ram_atomic_counters.postcopy_bytes);
> +    info->ram->postcopy_bytes = stat64_get(&ram_counters.postcopy_bytes);
>  
>      if (migrate_use_xbzrle()) {
>          info->xbzrle_cache = g_malloc0(sizeof(*info->xbzrle_cache));
> diff --git a/migration/multifd.c b/migration/multifd.c
> index 5e85c3ea9b..7cb2326d03 100644
> --- a/migration/multifd.c
> +++ b/migration/multifd.c
> @@ -433,7 +433,7 @@ static int multifd_send_pages(QEMUFile *f)
>      transferred = ((uint64_t) pages->num) * p->page_size + p->packet_len;
>      qemu_file_acct_rate_limit(f, transferred);
>      ram_counters.multifd_bytes += transferred;
> -    stat64_add(&ram_atomic_counters.transferred, transferred);
> +    stat64_add(&ram_counters.transferred, transferred);
>      qemu_mutex_unlock(&p->mutex);
>      qemu_sem_post(&p->sem);
>  
> @@ -628,7 +628,7 @@ int multifd_send_sync_main(QEMUFile *f)
>          p->pending_job++;
>          qemu_file_acct_rate_limit(f, p->packet_len);
>          ram_counters.multifd_bytes += p->packet_len;
> -        stat64_add(&ram_atomic_counters.transferred, p->packet_len);
> +        stat64_add(&ram_counters.transferred, p->packet_len);
>          qemu_mutex_unlock(&p->mutex);
>          qemu_sem_post(&p->sem);
>      }
> diff --git a/migration/ram.c b/migration/ram.c
> index 96e8a19a58..af749b369b 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -458,25 +458,18 @@ uint64_t ram_bytes_remaining(void)
>                         0;
>  }
>  
> -/*
> - * NOTE: not all stats in ram_counters are used in reality.  See comments
> - * for struct MigrationAtomicStats.  The ultimate result of ram migration
> - * counters will be a merged version with both ram_counters and the atomic
> - * fields in ram_atomic_counters.
> - */
> -MigrationStats ram_counters;
> -MigrationAtomicStats ram_atomic_counters;
> +RAMStats ram_counters;
>  
>  void ram_transferred_add(uint64_t bytes)
>  {
>      if (runstate_is_running()) {
>          ram_counters.precopy_bytes += bytes;
>      } else if (migration_in_postcopy()) {
> -        stat64_add(&ram_atomic_counters.postcopy_bytes, bytes);
> +        stat64_add(&ram_counters.postcopy_bytes, bytes);
>      } else {
>          ram_counters.downtime_bytes += bytes;
>      }
> -    stat64_add(&ram_atomic_counters.transferred, bytes);
> +    stat64_add(&ram_counters.transferred, bytes);
>  }
>  
>  void dirty_sync_missed_zero_copy(void)
> @@ -757,7 +750,7 @@ void mig_throttle_counter_reset(void)
>  
>      rs->time_last_bitmap_sync = qemu_clock_get_ms(QEMU_CLOCK_REALTIME);
>      rs->num_dirty_pages_period = 0;
> -    rs->bytes_xfer_prev = stat64_get(&ram_atomic_counters.transferred);
> +    rs->bytes_xfer_prev = stat64_get(&ram_counters.transferred);
>  }
>  
>  /**
> @@ -1131,8 +1124,8 @@ uint64_t ram_pagesize_summary(void)
>  
>  uint64_t ram_get_total_transferred_pages(void)
>  {
> -    return  stat64_get(&ram_atomic_counters.normal) +
> -        stat64_get(&ram_atomic_counters.duplicate) +
> +    return stat64_get(&ram_counters.normal) +
> +        stat64_get(&ram_counters.duplicate) +
>          compression_counters.pages + xbzrle_counters.pages;
>  }
>  
> @@ -1193,7 +1186,7 @@ static void migration_trigger_throttle(RAMState *rs)
>      MigrationState *s = migrate_get_current();
>      uint64_t threshold = s->parameters.throttle_trigger_threshold;
>      uint64_t bytes_xfer_period =
> -        stat64_get(&ram_atomic_counters.transferred) - rs->bytes_xfer_prev;
> +        stat64_get(&ram_counters.transferred) - rs->bytes_xfer_prev;
>      uint64_t bytes_dirty_period = rs->num_dirty_pages_period * TARGET_PAGE_SIZE;
>      uint64_t bytes_dirty_threshold = bytes_xfer_period * threshold / 100;
>  
> @@ -1256,7 +1249,7 @@ static void migration_bitmap_sync(RAMState *rs)
>          /* reset period counters */
>          rs->time_last_bitmap_sync = end_time;
>          rs->num_dirty_pages_period = 0;
> -        rs->bytes_xfer_prev = stat64_get(&ram_atomic_counters.transferred);
> +        rs->bytes_xfer_prev = stat64_get(&ram_counters.transferred);
>      }
>      if (migrate_use_events()) {
>          qapi_event_send_migration_pass(ram_counters.dirty_sync_count);
> @@ -1333,7 +1326,7 @@ static int save_zero_page(PageSearchStatus *pss, RAMBlock *block,
>      int len = save_zero_page_to_file(pss, block, offset);
>  
>      if (len) {
> -        stat64_add(&ram_atomic_counters.duplicate, 1);
> +        stat64_add(&ram_counters.duplicate, 1);
>          ram_transferred_add(len);
>          return 1;
>      }
> @@ -1370,9 +1363,9 @@ static bool control_save_page(PageSearchStatus *pss, RAMBlock *block,
>      }
>  
>      if (bytes_xmit > 0) {
> -        stat64_add(&ram_atomic_counters.normal, 1);
> +        stat64_add(&ram_counters.normal, 1);
>      } else if (bytes_xmit == 0) {
> -        stat64_add(&ram_atomic_counters.duplicate, 1);
> +        stat64_add(&ram_counters.duplicate, 1);
>      }
>  
>      return true;
> @@ -1404,7 +1397,7 @@ static int save_normal_page(PageSearchStatus *pss, RAMBlock *block,
>          qemu_put_buffer(file, buf, TARGET_PAGE_SIZE);
>      }
>      ram_transferred_add(TARGET_PAGE_SIZE);
> -    stat64_add(&ram_atomic_counters.normal, 1);
> +    stat64_add(&ram_counters.normal, 1);
>      return 1;
>  }
>  
> @@ -1460,7 +1453,7 @@ static int ram_save_multifd_page(QEMUFile *file, RAMBlock *block,
>      if (multifd_queue_page(file, block, offset) < 0) {
>          return -1;
>      }
> -    stat64_add(&ram_atomic_counters.normal, 1);
> +    stat64_add(&ram_counters.normal, 1);
>  
>      return 1;
>  }
> @@ -1499,7 +1492,7 @@ update_compress_thread_counts(const CompressParam *param, int bytes_xmit)
>      ram_transferred_add(bytes_xmit);
>  
>      if (param->zero_page) {
> -        stat64_add(&ram_atomic_counters.duplicate, 1);
> +        stat64_add(&ram_counters.duplicate, 1);
>          return;
>      }
>  
> @@ -2634,9 +2627,9 @@ void acct_update_position(QEMUFile *f, size_t size, bool zero)
>      uint64_t pages = size / TARGET_PAGE_SIZE;
>  
>      if (zero) {
> -        stat64_add(&ram_atomic_counters.duplicate, pages);
> +        stat64_add(&ram_counters.duplicate, pages);
>      } else {
> -        stat64_add(&ram_atomic_counters.normal, pages);
> +        stat64_add(&ram_counters.normal, pages);
>          ram_transferred_add(size);
>          qemu_file_credit_transfer(f, size);
>      }
> -- 
> 2.39.2

