Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D95DB69A960
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 11:49:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSyIN-0006D7-E4; Fri, 17 Feb 2023 05:48:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1pSyIL-00069u-1I
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 05:48:49 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1pSyII-00025S-UV
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 05:48:48 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31H7iK63001690; Fri, 17 Feb 2023 10:48:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : in-reply-to : references : date : message-id : content-type :
 mime-version; s=corp-2022-7-12;
 bh=5+WyQWvTsKUmA1XZBbYQHRRiTMwMXm4s3+a9fis502o=;
 b=P+idjlgihQyeqpvMubcBdOr9Ryo/4XAnrkeBZ4AfSymawZTk8wZSN+iNWRDyOvzVRS0A
 yto24qPyum3nJPq4NmTWcwyCWCcz+DLOdGDFpKnDyZwcRgG/BFSlykfoUTCUdt3cPktl
 Bf4whPiXI2IeNfwbbVN6xjDvnAfgnqUb90Bdhj2jZMWLPWR8Of5+pNaJ3L4ShN8USU6E
 dZJjnHYHf/7yqqru3NRT2lO/HvLIjH/8IzTy2UGK4O5WqUUGC6F2ssMNxrBL9O7aLmNf
 +PAL+pZt8C652FCIxU6gkgetFGmSBThndptKo/OuysWjFkw3xVF/OzWO/aGEGnCh2AW7 Jw== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3np1edngsm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 17 Feb 2023 10:48:42 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 31HA3dvb019943; Fri, 17 Feb 2023 10:48:41 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam04lp2048.outbound.protection.outlook.com [104.47.74.48])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3np1fagfex-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 17 Feb 2023 10:48:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NYkYwhb9+5uAbWDSGBjCMh5SQuy6Ld6klGgVBWFgUozLvwmKjnSoXhUQePpttvU7xNSMjlRBeu7mmO1O81tIoeuJZ/IbyMEWGmD7tEzNJAvbczyWBS+2SK/usXB3NmILp0J01/br3cehN2ZSlRjK0z8NHew46OEwgBPgPANxVZGeg7BnnRB+/3S0EbTz4+5xhm3aZfEKOK9owKS6m2Bvb5ozm4xoV5EamocY5leNPmzVnsEo0YGMjQFujElcrfaRelsy5Q3s1t3dI2c/+UbMDNeSUbyB2AosI+3F0gd/O/Xe0Ew3zEKp2RRYhH1g94ttrYEmJiYgH2dOHB3AdlTVvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5+WyQWvTsKUmA1XZBbYQHRRiTMwMXm4s3+a9fis502o=;
 b=f30oVxtsNNUaMgrC1tOL6Nu2H77o5JBRTVQZ1OZSQN4VU+fcuONISUkZOZubx2Qr5r7jKLbYcOmLSLtwNHz1j04RMY6uhLRw+6doJPcH1ajrRr/ZDf7ZefX39JNmynFS1cnpgv7tw0UGCKV4Q+gw/oSgZIYnkPR6M7GTzRRpSQvTaqzbLXcyn6EOnPdaXtxPsvvEwQhaWrSFZmUDyaBTW3PuZG5UthL9SiGMtqQngEBYPtaOq2AIeKWgpr7POMDwXC9NdadVZLSkabycbsl6TGCDO6owzxNUG24aj3bPlg5VjgZdfARj+lz3ZmMu/cu77hx+AiMZhA82xR184FEAuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5+WyQWvTsKUmA1XZBbYQHRRiTMwMXm4s3+a9fis502o=;
 b=pawM7Xdhy8Ng0FtpHXVLGykSgokdCS+wAqWfp+DJhQ0/AgvlLpl3GWPeW+XCCGgTCJmgD2+a1cLp6FuknRtUeVzNBfzjF+16nvVZPj1fI6T5rq8dmxxz0NyBZCzbGu3I4dc2jQaM/DMAXf+hUp52KeSuQQ/JzddVJw6tr1uHVdM=
Received: from BLAPR10MB5138.namprd10.prod.outlook.com (2603:10b6:208:322::8)
 by PH0PR10MB4663.namprd10.prod.outlook.com (2603:10b6:510:34::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.6; Fri, 17 Feb
 2023 10:48:40 +0000
Received: from BLAPR10MB5138.namprd10.prod.outlook.com
 ([fe80::8a7d:60c:7965:98c3]) by BLAPR10MB5138.namprd10.prod.outlook.com
 ([fe80::8a7d:60c:7965:98c3%6]) with mapi id 15.20.6134.012; Fri, 17 Feb 2023
 10:48:39 +0000
From: Darren Kenny <darren.kenny@oracle.com>
To: Alexander Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Alexander Bulekov <alxndr@bu.edu>, Paolo
 Bonzini <pbonzini@redhat.com>, Bandan Das <bsd@redhat.com>, Stefan
 Hajnoczi <stefanha@redhat.com>, Thomas Huth <thuth@redhat.com>, Qiuhao Li
 <Qiuhao.Li@outlook.com>, Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PULL 02/10] fuzz: add fuzz_reset API
In-Reply-To: <20230217040855.16873-3-alxndr@bu.edu>
References: <20230217040855.16873-1-alxndr@bu.edu>
 <20230217040855.16873-3-alxndr@bu.edu>
Date: Fri, 17 Feb 2023 10:48:33 +0000
Message-ID: <m2cz68efem.fsf@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: DUZPR01CA0251.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b5::23) To BLAPR10MB5138.namprd10.prod.outlook.com
 (2603:10b6:208:322::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB5138:EE_|PH0PR10MB4663:EE_
X-MS-Office365-Filtering-Correlation-Id: 93701e2f-5811-4d48-eb38-08db10d48791
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PLXrZq9ekCP9oueYWzwfNDMbwH+ynTi5wgzuP+QS2OpI89BPnRQC4t93N1xEyy+j4XdUnDxwQj8jHd4iCgWoFR5o5Xjv/4UTB6PqiShLM3FVmfOopfJdvjcCfVhBZYyhcvSwmR1s+qXqJfu4t4d7XxO/Qk2AGHT6uRvWXyEWGg4BD2Zyc0YvjNOOhDGaEC2ecaUlwJP28gqVYQL7Dqe3J0QsKmGUYFJGDIujPinl6jDlgmWmAbmuJrovEfa0sUIHbrzMctga+gJbu90GAVpJN+PUVpmtL57Lokxu1o9CXgS7JQEsoj271gEV8/V7zsE+MlRXPs/m5VrVgl2M8twkbM9StlQiJzLbIGhiDWnjfMln3iYtlGFFbXnAcI0qem8haYfDb104oHZGMl/HiYcGK6IWbXfUdex/zN3OxRWjed2vuVzEKVmuNRu1p9WB8RIvf748q/i2c8Syk0z6fTb7qFlejkUIoWQcyf5UteVNd/9MdCnm6agUr/JVFrmXTsYHLi80Etcja9dQRx0IuhR97d+qL5dsuQjWC5MtBdRX/LNeifeyAdMakAFmceXWP2nwyk9XbdAxW3Q4OtZDDfb11RPpI0P0SNCUXanOvIsguW1aH4xD/g5S/9TG8NxyPsDG9Lvy9JNsZZg+CeFrElbKFw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB5138.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(376002)(39860400002)(396003)(136003)(346002)(451199018)(83380400001)(38100700002)(86362001)(36756003)(44832011)(2906002)(8676002)(66476007)(66946007)(66556008)(8936002)(41300700001)(54906003)(316002)(4326008)(2616005)(5660300002)(6506007)(478600001)(6666004)(6486002)(26005)(186003)(6512007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7qkrJ7ldSaqqkYfSSBhcD79LnIu4vvSvg6YcGqyeiUdwSqUs42enLXacBLrD?=
 =?us-ascii?Q?Yx7mKoPS2vzF5eKUFcRalepKcSw7YbU0e6wYqC9I79pj/N0/rfnXgNo6sIJP?=
 =?us-ascii?Q?3tLH8sSpej5NbDbt3OyGA0wT8XJXFMt5WB9UmFWj7FCbnUFMPNAi+Vnhhs9Z?=
 =?us-ascii?Q?qf8QkviL9fw3Na2IJWYtXg9jtDPiZ48ej4NKMRKN985vk1wZo7ZbHmA5NGti?=
 =?us-ascii?Q?2ALiwSwQ/+qKgvwJ/ujSBviFt8l1zqrquaO+Vo9r0dtLDqXflgTZei2K1M+k?=
 =?us-ascii?Q?qo7VCjRk/P21W8yg5PV8vMWwW16FT+4tYEmiZawyK6gbGvF306fRdxeHcOzT?=
 =?us-ascii?Q?lO1WoF2LuoeB6xmu8QlzsgsQTUqcaqIBM30qqJf9skXH1YXg2C4zmUcj7yhv?=
 =?us-ascii?Q?tllIYufZ9wBFFA0mAUqlf+yOlnftrFy+is0yP+hf7iNDxB5gkr4BEU4rPwg4?=
 =?us-ascii?Q?PvNr6YD7tviN73PpNDqmrPExTp+6NYzcfH2LO6YM/AROB9bdd4mzCErQiJRA?=
 =?us-ascii?Q?W9VU9+zHMhJrRHd85cygNY0VrRp0GJ4+sk49qgNFK8ZB4A+tgFifToHaM7Mv?=
 =?us-ascii?Q?tNt86d5p8p/QIBwyLwQPRZlcYsHhuRS6I2nV1JTQQR7LLSGtQJsOrz1rnf99?=
 =?us-ascii?Q?19L96+9vv/M/QQPlccpSybWZNbZy0epSAgUdpGJEnaT1RMWO7eC81BCGpNUm?=
 =?us-ascii?Q?kjPNzlrW4lDLiWHkjOOCBA+SQMl3ujUMf9QggCC8td12fFblDLW6pOepS2IG?=
 =?us-ascii?Q?am2WxSVDLwlRIwNK9dGwbu4iWrv8Ma3QUnPYJbGbmUXaCyu6wLM0055BUmj7?=
 =?us-ascii?Q?lWX/8F7gqZnS6OFwV5aynkmUxMTNV4OyATlyBnBbItI3wTljtp1a4KI+km43?=
 =?us-ascii?Q?8HaqWx3CVQ0ItpfWVD+z3PjdNtPLftdTjnzkaddSKR6XUOVKzDtXEC0O3wAi?=
 =?us-ascii?Q?sY5+Iz9pCelO0aLzpuLf502ql96KZUtvNfNCHsnx2VQXks85nYZbXAnqJu+i?=
 =?us-ascii?Q?6+XgjKM7l6/oRKIuDnKvtk3pA7XWHYQPVgn5dVZWsf7c0XWmm27vy/tK3MEn?=
 =?us-ascii?Q?72LrKDdz3lypKrB5ADWpNP0FWP7AQowXRlIhEOE6iciqkxdtd/aAgFFMA0ZD?=
 =?us-ascii?Q?6hlrDOaFj5524jdPu4HkHaxP+Fg0KoDQuNUtyj99eTDvFHK8Y4HZDoCmDPZR?=
 =?us-ascii?Q?oMOTyPa/LYoOsQDAnU8KB0O9GmSFTzaAmY90aYdPcThsBnYzBB6R/phch2Pa?=
 =?us-ascii?Q?EGwl1mjLOnvL5vdbyUyoDVUjx5YECv06e1pMTyfifC6jOeDSYzu9g7xF0A0l?=
 =?us-ascii?Q?/RR6FivxHX6oNQCWQWxI5y6dV9uLQW8qiDinR2w/YEtHk8d5nF+zkl2Md9DV?=
 =?us-ascii?Q?jV9lTS0SsLw8AD1qjg4AmVgiYmZZo5IrXqLxq16nNHdJwDFADAfKv77A7a6V?=
 =?us-ascii?Q?+RpDaU7G977hSYGK1yJpKVndeE3EvV8NTmEyB0jwfcDwcR43QssRNPCR1hCq?=
 =?us-ascii?Q?lUz5rJkp9klJJnDfC2Jgf7AlMYAV1z+/++eJ81O8xIEFas68EqFsuP0yCvK9?=
 =?us-ascii?Q?Qp2p2AIPIiQWUayoUhHz98hBi3M6/rXurykl59Kjy7UyQuP83V5+p2IL8vBS?=
 =?us-ascii?Q?+A=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: N4s1ei6l5O/zKI8kjN5ZlFIVH4LOL3c5CRo6uhhuEvM7zK5cB3+X6Ucm2NkS6vSVHsij3iyFt2mm5nlEyZvLtpvgM6U2J+k0Kqxp602HW2ov88+1cCZo/sbSJSqIHJskdKK6WvKGPuVfbjzq+CWQA+2NLS5RL8SjFL10bin+jGWLOk0tZM71GNqPF6ro4xmNePtdLJH5+MvDMmbw7hyI3suk/TCQ8ZVtFMCwsJmEH8lxzLDng5n/E2DfCSh6w7yA5eJjSp8HyyzTTt5h9xDUuNWCStpb298I1r+XbTRBuQ/1aGNkUfb6TtVRc9woMr4fuvBNwur4qgKmkdZZpKW6Dq5sJtPQQUnRCOSwrDlDiutH8rBNXTsS+8cMuQE4eF8QnP08jPQGpkTrOLw9o0YjB4JfSCmfuTFUMueq8uYs9XTzydIuQZ+getyW20WSNmB18GmCl9687QRdB8RQkf49X/NXYM4t0bYeQckA4z2f32zSGOGSDnCRpoIrTmRoGYLqrVD9C+09CMlQd4q0AXAfnOPvtfPajYDnp8ZAit2BpRfYfRB4iktLq+kmU94adPRCzKhXSugCREQJy6itim8bVymSbYDaBNwnmFkxALEZuSKF+SrOr9ynLeJGhovs8aZVVsNb+4bPBhAu1TfR2TrLEsD7gPBAzAQ1zxURXZVf1zqGZYBgNhVyhMgRFoeVJfK2NO8qV3Xmk4y036i3hLFczYuoNdHhWZbEBjNh7JSdXFka6V5x0iJl+cQTITQqpqd83V+pcjxTbgimUng6U5OfRk8YDM4bkyRuQbLhJQBIuRuYUdfkCtddBHl3B5kFMceO0+tKAxdRI0sDdP8TwbsZKeeqH1R2POwOIlfWsib7x+c=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93701e2f-5811-4d48-eb38-08db10d48791
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5138.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2023 10:48:39.8842 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9IcelF+LzG1R23ZoTUF/m6UvbztHi6ZPXSgjrKs5zksdmPm4zNPbzd4qEtPzZ8rrexAkFVKtvbnkMq4JoHjS8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4663
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-17_06,2023-02-17_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 mlxscore=0 adultscore=0
 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302170098
X-Proofpoint-GUID: 5yWXyMwbBMQUMC7qyx3L1uWHO7nJ0Bem
X-Proofpoint-ORIG-GUID: 5yWXyMwbBMQUMC7qyx3L1uWHO7nJ0Bem
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=darren.kenny@oracle.com; helo=mx0b-00069f02.pphosted.com
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

I know this is a pull request, but if you prefer to have all the patches
with and R-b, you can add mine here too, but I'll leave it up to you.

Reviewed-by: Darren Kenny <darren.kenny@oracle.com>

Thanks,

Darren.

On Thursday, 2023-02-16 at 23:08:47 -05, Alexander Bulekov wrote:
> As we are converting most fuzzers to rely on reboots to reset state,
> introduce an API to make sure reboots are invoked in a consistent
> manner.
>
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> ---
>  tests/qtest/fuzz/fuzz.c | 6 ++++++
>  tests/qtest/fuzz/fuzz.h | 2 +-
>  2 files changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/tests/qtest/fuzz/fuzz.c b/tests/qtest/fuzz/fuzz.c
> index eb7520544b..3bedb81b32 100644
> --- a/tests/qtest/fuzz/fuzz.c
> +++ b/tests/qtest/fuzz/fuzz.c
> @@ -51,6 +51,12 @@ void flush_events(QTestState *s)
>      }
>  }
>  
> +void fuzz_reset(QTestState *s)
> +{
> +    qemu_system_reset(SHUTDOWN_CAUSE_GUEST_RESET);
> +    main_loop_wait(true);
> +}
> +
>  static QTestState *qtest_setup(void)
>  {
>      qtest_server_set_send_handler(&qtest_client_inproc_recv, &fuzz_qts);
> diff --git a/tests/qtest/fuzz/fuzz.h b/tests/qtest/fuzz/fuzz.h
> index 327c1c5a55..21d1362d65 100644
> --- a/tests/qtest/fuzz/fuzz.h
> +++ b/tests/qtest/fuzz/fuzz.h
> @@ -103,7 +103,7 @@ typedef struct FuzzTarget {
>  } FuzzTarget;
>  
>  void flush_events(QTestState *);
> -void reboot(QTestState *);
> +void fuzz_reset(QTestState *);
>  
>  /* Use the QTest ASCII protocol or call address_space API directly?*/
>  void fuzz_qtest_set_serialize(bool option);
> -- 
> 2.39.0

