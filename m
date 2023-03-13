Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D05D6B775E
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 13:23:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbhBZ-0000W4-IF; Mon, 13 Mar 2023 08:21:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1pbhBR-0000Vm-Tf
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 08:21:46 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1pbhBQ-00034d-0W
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 08:21:45 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32D00cm8008636; Mon, 13 Mar 2023 12:21:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : in-reply-to : references : date : message-id : content-type :
 mime-version; s=corp-2022-7-12;
 bh=gaPeXRWPAASzqe2Tr7OR/UBUVOMI39cfkus50fqtMUU=;
 b=cSd9MiOfpKAUrkRGXhnwgaT5iUVIwaz/g3HaB7iUOWDsp2DZEQRY9a+IYzo4KhQocV7V
 mCKr6g6aaXJ/++bHod36QvgQVTVLlRb5+ABS85XEqAPESSMRUjptdXotyGUE8Z/LhYqJ
 PIzCGTHGDcu8BYi+gndlDRzebUivNUoEqr1PTP9yJ3ZyMD12u+YD6/enI5mmlWVO3dM3
 tuJI2W+fR8n3TiXsg4QpP29ggC6mfEiUi03J788fJdGjznNSjnWhKEEeRhl3eWig2x53
 aOWm1E1IF2HOSu2tiBWjSv5rQdZq4qFgOWQjVkyG8FMUiV+1GKVU/u4VePEgb0MJHhH4 yQ== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3p8g2dknb4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Mar 2023 12:21:37 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 32DBFoOU025172; Mon, 13 Mar 2023 12:21:36 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2104.outbound.protection.outlook.com [104.47.58.104])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3p8g34jee3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Mar 2023 12:21:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FDWe0Z85tOaC+uyh4bUeEEm36TjK3BMbKzZhW5eLS0gogLWxo/tMV7ra036vyAIzPMhIkuboI07aoEcc5SWEjcgVxweCY7jgB43qLY8kNDA9PlTH09EomTGhA8LRDuP+r9y+g62VipAteS98G5ONZw+GDSGW5St7CiG1rgbUoL/eREpt7atME9jNNVNwfhuXn1Hv3W7GqBxICG5ShNtsKu0BKhOmwEGKWKSK2krZlzNqhJTdgN0VIqKOXMjEe/PTX/TvWXABahXk8k5Un2HNG1OxAV7vZ838LabMwEFSzvj8qo3EqupI42giMo30ZGa4sEiCnGx3saONgAX36/sLCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gaPeXRWPAASzqe2Tr7OR/UBUVOMI39cfkus50fqtMUU=;
 b=THVMrp/S9nmn37+uDIMstymfiNQvbncjr6l5ZDVxuHEIyeYM2G8uEHX9c/Bf0B7ScRrr0mbNX/t5RXLuoJsx9Ke6kNzpvDHBQRvMr3h/4F6bONjVdbjNM+oVVoNTlAyLGWj4S1Hfhi4WIjc4j8sPiZP8czQz7xo9ad1dTkWeG+k1EQmu3NB8rpbxJ8Uv5RQSquglLSjtvtJsahMSbaDQzTct7BOe09AZjdd7lEiOHI6VagBoNWgIFQ/0bpvQtkP7eUcNuiC40FO0nk3R9R2xyTx98UzHaqkkZ9+cDwnpqGoALFc6u1BosbNuNODVAzYJhdoYz/IAQKuvfMPopBqWjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gaPeXRWPAASzqe2Tr7OR/UBUVOMI39cfkus50fqtMUU=;
 b=Yrbnx5UKYUTPz7Jmm3ZEGsganmA6RrB0b+SkJI++NAmcLAUbM9habSlpOltR56bTNZ9yNTMOK6H/EUi77urGVgFtTYKOayBaInJA5msDKEzFHN9WYMgTh/0uW8wxtyUY18jutxT6cPhjdSf3yP6DxW/MkAQcsEhWwht+m/ML9ww=
Received: from BLAPR10MB5138.namprd10.prod.outlook.com (2603:10b6:208:322::8)
 by IA0PR10MB7181.namprd10.prod.outlook.com (2603:10b6:208:400::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.23; Mon, 13 Mar
 2023 12:21:33 +0000
Received: from BLAPR10MB5138.namprd10.prod.outlook.com
 ([fe80::8a7d:60c:7965:98c3]) by BLAPR10MB5138.namprd10.prod.outlook.com
 ([fe80::8a7d:60c:7965:98c3%5]) with mapi id 15.20.6178.025; Mon, 13 Mar 2023
 12:21:33 +0000
From: Darren Kenny <darren.kenny@oracle.com>
To: Alexander Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org
Cc: Alexander Bulekov <alxndr@bu.edu>, Stefan Hajnoczi <stefanha@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Mauro
 Matteo Cascella <mcascell@redhat.com>, Peter Xu <peterx@redhat.com>, Jason
 Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>, Gerd
 Hoffmann <kraxel@redhat.com>, Thomas Huth <thuth@redhat.com>, Laurent
 Vivier <lvivier@redhat.com>, Bandan Das <bsd@redhat.com>, "Edgar E .
 Iglesias" <edgar.iglesias@gmail.com>,
 Bin Meng <bin.meng@windriver.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?utf-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, Eduardo
 Habkost <eduardo@habkost.net>, Jon Maloy <jmaloy@redhat.com>,
 Siqi Chen <coc.cyqh@gmail.com>
Subject: Re: [PATCH v7 5/6] memory: Allow disabling re-entrancy checking per-MR
In-Reply-To: <20230313082417.827484-6-alxndr@bu.edu>
References: <20230313082417.827484-1-alxndr@bu.edu>
 <20230313082417.827484-6-alxndr@bu.edu>
Date: Mon, 13 Mar 2023 12:21:29 +0000
Message-ID: <m25yb47sfq.fsf@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: DB6PR0501CA0042.eurprd05.prod.outlook.com
 (2603:10a6:4:67::28) To BLAPR10MB5138.namprd10.prod.outlook.com
 (2603:10b6:208:322::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB5138:EE_|IA0PR10MB7181:EE_
X-MS-Office365-Filtering-Correlation-Id: a6da27c7-5c6e-46cf-7cad-08db23bd7bc1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eVeS7wSJlMLIDPqZ516GkQIS2ZTgcn+Epv7xcqn2WhjntrDf4NqTKzs6RoPpqc20mOV1wLtcYyuzDToaPx/2VMtAj6Cqv+tnLHPUJxvNXkgrIlftVnxWCbrVvqxLf1kYupMag9t/+8pVPIlKzrw4WmHixTHG+qXJbTSXvEO0NSa3KyYKPYi8/egTogM2Q4OHKRUbP14Ag+8pLGZ+UqWaBSX/J0LE75RVv4Dq6M2NjWg0dU4a8xkTQcMCIC+vKd3x+ac6PquEIolXKj7EAjTBjvOtGv9nxvjrTmuIdLwmdtdbX3D9iwXYKTywvbZ67u1zC3PX3re1gd4c1ZgX3ujeE9XjjSiix3W/hN3y/hRxt2NmfEGYoqmGdd98oRKf6WDW+XymAtvpe+JhVt1HAfx3jkYhn5hAdjRUfQGfL4aQEJ2np/rvWNIV1bNpUu3usypEKoCEHPhzdSZvGXnv6j1X45nU2Udbkoyy9soBN475CcDIeRGrBw4Y6zhpFX9wHchi25Cwji38+v2UuIKpwraHZM01DmziGAlKJEoJVmbCFHJEcDUQHgY1MZuPnpURdmnemweN2+gXOsZqaRB3welxJ8gRr1srcdYeqpPMinhG5wBH/WllWliD4L2y3EUK9czQVqUJ1O8EJ/nQXmZy4aweBA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB5138.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(39860400002)(366004)(346002)(376002)(136003)(451199018)(38100700002)(36756003)(2906002)(7416002)(4326008)(66946007)(5660300002)(8936002)(41300700001)(8676002)(44832011)(66476007)(66556008)(2616005)(186003)(83380400001)(54906003)(316002)(478600001)(6512007)(6506007)(6666004)(26005)(86362001)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0XGegBUxrqlaxyYJtCN2gRirPAYCGU2xm1PGKPs7ibL2UABmNe+Qp95ZbR8w?=
 =?us-ascii?Q?82pzwas7FeZESfYK/2CsMCWh+f3zHh4E0gT5XyCpmnbLzvmuokiKxOT+1Bsq?=
 =?us-ascii?Q?qrGBDiDYrya1fZMtDV5B2Si/8GLvgXdeQ9ygTWrxe62fB2FaSJkr0xD9ODFt?=
 =?us-ascii?Q?U8UVj6foC8Nu1oHS7D/nfxWJBLfiZNKXhhwsJaAtUmAhBadWNmW3djxX1Bx/?=
 =?us-ascii?Q?c0vA84s3IpKtnd1Q1k7LFKzr+k4T49edkGpgu2E8tB7kb6ZyrXJWBJGYC8FZ?=
 =?us-ascii?Q?y+43wcpDOcae6Asvp14byzFSZiGhH3Y4FTdI3Dj/PY4muQLTdVNtlvil8f5k?=
 =?us-ascii?Q?/55NZnwIO++Let8US4P0gQP1NRaqMB7yVpU/VzVjsxrk6xpfoS8iJFEgD+ki?=
 =?us-ascii?Q?30zVE6+Abauf3eyTLrKlcrppu+jWd0+bPgFs0ZDLwDrY7ZODh9g0NILrA0LA?=
 =?us-ascii?Q?HXziE4mktl/8LzD4tMxcdbqJsSgRSwUk71bcPcJId63rNQ1ekpqtTacLOomK?=
 =?us-ascii?Q?w/Nd6fyoa+FpENvpQmHTc+3Il3L108m+4Pkt6kwCqUZKNBAQ+KWmvzdRPiTS?=
 =?us-ascii?Q?3q4fmZgbfUpQVnC7AdMjFAstI7HypWxbigMrYa8f8r+7ans9WrzT3gv/1dxx?=
 =?us-ascii?Q?e077CP1dxPe1HunrxUY4vuFLEhSVnwR7JZdxH2tvyI6CP2d8mlhsjeIvOCmV?=
 =?us-ascii?Q?tUH90CsP516LO38ISyeRMU+iDdOFITimhnJYK9xzbtiXyWjYW7IjksojobYw?=
 =?us-ascii?Q?dpQmdHg3WdcYYtnPQ240T8lvnpVIVk40xmYoQ3muShYyNSe3lH/+GsI2qcnn?=
 =?us-ascii?Q?junr3FOmG6IIuijf3HenNGIAQvODeduKWmaLaoR65nbv2WGTINwDfNdmEeXK?=
 =?us-ascii?Q?ICWXNYwibEheh12bQi9hn7mEMsPrGU80Gxn3A2KXoADKGM+4cW35MmhvxfvG?=
 =?us-ascii?Q?hFo1ducRw6Op2hawhLw/btmIElFBYYqabmZk7fHHXTtj0pea4K/YwrivYcWP?=
 =?us-ascii?Q?CxLHHcTJOsjjyyQyM+KqzJb6uXpO+p/Xf/eD8or0DHXbMFtIb/27O9L9auuH?=
 =?us-ascii?Q?USJn98LgGiK57wpZvdB8ANI8FdcnraTyxOguS5b4345E0LdkxOu7/Dvs9mE1?=
 =?us-ascii?Q?9KR5QQjIWI5EPuCdBh0pv5uI5JdExpQwsp9cTdyrci7nLmrGGNsHHXBXlyht?=
 =?us-ascii?Q?+ndvur4nnrPpuU3jpu48TKKvWHAMRRjkojdBYIY5kULxa6jLJezyj3hTCvsM?=
 =?us-ascii?Q?iv0A1UEjdEyMznc7AqmC8Ttzc4ngODyfkZelcGABm7XrUjGkM8rT5BmPY/+e?=
 =?us-ascii?Q?u/eJ3ygae0UtzNIFR7ivnHcj421eeYpHuRy83pajPJj9zepoYu+Jj7c1l13T?=
 =?us-ascii?Q?pFG24skN9X5k04mg9hc1Pxu4nG+ogtR0u/QsSdZIZWLt4CKtW/k9roS8SRfb?=
 =?us-ascii?Q?R8soqHxrwoAg/1wUG9w7UF8c9SW7E9QY3WrUmwnRfWFIL/3ATO4ee1O4NeYO?=
 =?us-ascii?Q?2SSBp/Bummaz6oaot7owIdwEpEEJTc8kjq13QsVPvUsglXx+eGPGlrhYv3tg?=
 =?us-ascii?Q?P2EbmqSV9ETeDSzL3wEhcJ7zPaU/BPgQga6kieRHIjGIS/JQ265Y5HikgMl3?=
 =?us-ascii?Q?rw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 60Qs13gufYK0ljgl29wzPwWsnqMvvjCdQxiMK2U8fO0V8+JGyxaFFiifOBLTioM5EhqkexfL1gK9rVIBW2XTYKmLCFM0tA8x7kjqctN7q9Ed9gt1PrO9wmO6LxcnU9//+FobVlj+Izbs/inkT2+u+2WKaUjSwOfZ0sYe+7ut9O/U+Yso0vkZHkGOPJddNR50M9KMBMdzGIYqmkpCNdTjb0STb9YCiCuO3alFl00VKAmcHLKx8sKnhwwviaFb5KkVqU/ojVCOfOFXWj7QG/Db+U/mwKejTIPRJRSUYv+tM0Q27t+ARj2f20UoahKJAg9wbUmbjTXCF087sV9VEJsGcK9c4Rfya4WbXyf3R/rJjgwy1dl0yV6Z2AFbp74wgDg02JzYeh7vzBY8hWS3HBITj460O9wNMx3hvpWqnjoQ4/tTJMKqwf+zumHEMYvWABu31T2f4JKh0lulvojxP8x6mEnh4XXfPcWb7oKoMzVK7MfMPPqtgTbH6b9a4OyzRkWg8A/nGGdpE5WRbSleoT3aV8SK1aRrl3sS9fu0jjPhMxzaIfLJlIr/rTP9yizEzpeiONW5AO74s2TCOZn/v7ASg5wDWCyA4NlSv6KB3aJ3AVRwU1sO5Za6p8dWzPqPHLZKrucMAB6RydCvuiY4xVlFFuDAhJj2DT6/eYT3RQo8qWZBZ3KpvxBYB2VDCW9GEUgC1HchFJqjOC8GVRlEcS/saYtnw/Ztum/XJ7u84EVGpwkT4dlq8SnhpA7rQ0GALCvES2Mo3TUPoDtQDEBRWpY792o664+knoR92XsAMJMu39lVSZ+xtbfrG9rbZNeO0cTPShABrq2w/BPuUiDervYTGLV2jIc7tjM+6j2omliJ8HG4PSrYwSbe4m3jVFj26MjT8/BbHLAfqKGH4HbTMgYZlLTmNlyZvjb0T+xdOitnKvE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6da27c7-5c6e-46cf-7cad-08db23bd7bc1
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5138.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2023 12:21:33.7469 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mBied1FbN59e50C9geM8PHZmY2tpikkWMmsg3Zj52ylqk/e+EdGEFg8mdq8CQTpgttDpLYj2SGLZxcCeCWHnDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7181
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-13_05,2023-03-13_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 adultscore=0 malwarescore=0
 mlxlogscore=999 mlxscore=0 suspectscore=0 bulkscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303130101
X-Proofpoint-GUID: Jq4_ezwnlcAE5ZcFEEEuLy0U0YKmX4K_
X-Proofpoint-ORIG-GUID: Jq4_ezwnlcAE5ZcFEEEuLy0U0YKmX4K_
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

On Monday, 2023-03-13 at 04:24:16 -04, Alexander Bulekov wrote:
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>

Reviewed-by: Darren Kenny <darren.kenny@oracle.com>

> ---
>  include/exec/memory.h | 3 +++
>  softmmu/memory.c      | 2 +-
>  2 files changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/include/exec/memory.h b/include/exec/memory.h
> index 6fa0b071f0..5154b123d8 100644
> --- a/include/exec/memory.h
> +++ b/include/exec/memory.h
> @@ -791,6 +791,9 @@ struct MemoryRegion {
>      unsigned ioeventfd_nb;
>      MemoryRegionIoeventfd *ioeventfds;
>      RamDiscardManager *rdm; /* Only for RAM */
> +
> +    /* For devices designed to perform re-entrant IO into their own IO MRs */
> +    bool disable_reentrancy_guard;
>  };
>  
>  struct IOMMUMemoryRegion {
> diff --git a/softmmu/memory.c b/softmmu/memory.c
> index 57bf18a257..3018fa2edb 100644
> --- a/softmmu/memory.c
> +++ b/softmmu/memory.c
> @@ -544,7 +544,7 @@ static MemTxResult access_with_adjusted_size(hwaddr addr,
>      }
>  
>      /* Do not allow more than one simultanous access to a device's IO Regions */
> -    if (mr->owner &&
> +    if (mr->owner && !mr->disable_reentrancy_guard &&
>          !mr->ram_device && !mr->ram && !mr->rom_device && !mr->readonly) {
>          dev = (DeviceState *) object_dynamic_cast(mr->owner, TYPE_DEVICE);
>          if (dev) {
> -- 
> 2.39.0

