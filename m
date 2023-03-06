Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C156ACE64
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 20:46:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZGmf-00077T-6E; Mon, 06 Mar 2023 14:46:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pZGmM-000776-GG
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 14:45:50 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pZGmK-0004me-Hc
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 14:45:50 -0500
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 326HSvdG019556; Mon, 6 Mar 2023 19:45:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=z3KI3E1pTh/9gE4B3h1H44pTiIjG/veRQTejm1n820E=;
 b=K+J035duDwkOAzXi4i+/bKpfwpzfByM4+RvMAvL9D83QZPiYaY0B0RzaWeBeL76xIQ+U
 sp1Q+Ji1onmpgI5mBTwyYa2yDpwcQM5mK4iyW3zBYz+3WkHEuBD4orByMKa98NyAeN0m
 5+qvAbF2xsCezuDKZtxG8uI5Yd0gW9szC3h4jpQ67fE8oh9fOBRS2f9OBmEGcPADMhDG
 BKEQeEpEOUDONJ2UPB4jyx4qFKLOhoZqtPOhaM3ppAkyrS0Q6XBTb/8wuUDfoUK9DY+X
 33ykrfjQbKVHtlskHjnSlto1XtMHTNSybfheDkX8p0zOvR+rpEAbMKD39Q5vuKbpbt82 bw== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3p417cbtbe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 06 Mar 2023 19:45:46 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 326JLLAF026623; Mon, 6 Mar 2023 19:45:46 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3p4u1dyanw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 06 Mar 2023 19:45:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jXwsHasR2pEtQvJPhN3A+eIjXyND9ib/WgrLpFn6I35gYj6Y/BQxWumhHEPBpLy1PmCSrVvv+3PDK/QdB6zklcu8dOe2oHGMCx6kXbPG5sVicgpXj2qp1U7Hl0gwtvBSHy4nOR0wUSQNXwj0MsFODczwaljuQIVuYTNEdMY8/65wptWTqq7qhs6qtS0HXkusLusD5vJY6LqeFJEgzomGV9DhJhMKzA7hLu97ssa7D8Mfw+V6Wa0xPpA54oCcvrI2zpwGwr5JTfliXEL7jgQqkCM+8GCtXNB3I2LFXfXTQHWj+HHneY1ydwJVPb54RrAi32LCANY1X2jSNqydkDJu6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z3KI3E1pTh/9gE4B3h1H44pTiIjG/veRQTejm1n820E=;
 b=YAPWtqOpviWdZmPuT9L6trAB/5whs/tM/VyRC/+habYExkkhYOt5l3GSpxUv9yPMqT5mGNBugrmzKJxLB0/ealgRw/kSKhpj6bXfzOSwlQy7KMJh54Ql3FFFPgLG+7ZonouEQFAXX6VkQjv5IzsdbOxt8xHwYRLaWpc+6a+fX0qvlUJwTyf5RzApSneYs339wy5vrRwOejmtLxKzwWm4Du2fqtfjMX0HzXbVTxbqZ8OfEawH0pLVCqIGjyRszGG3y+QeKh6+pOnGv2cTKx0Gh/djigj1VZYCQrq7HMpSaHIQzKxmsBtEVf363PMpmpyZ8Pp+LtWgL83r0Z+CXwXlBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z3KI3E1pTh/9gE4B3h1H44pTiIjG/veRQTejm1n820E=;
 b=SgZo4mhzs+vTjf3tzAd2H8w4DH2IEcBQq58owMVOtkZVMYMLPuNjdq9Atd1Wfipn7wJr4fsCaKWFp8EECpl7qZ1tLjg+Lz4AeNZ2tbTZz4mwh5mmy4nh0p1IwQhVNRoPdJCqy6ExBrYkNoooEJA3zjH862ff0jrOJYipCT0cBfs=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by DM6PR10MB4220.namprd10.prod.outlook.com (2603:10b6:5:221::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Mon, 6 Mar
 2023 19:45:43 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::9b30:898b:e552:8823]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::9b30:898b:e552:8823%6]) with mapi id 15.20.6156.028; Mon, 6 Mar 2023
 19:45:43 +0000
Message-ID: <de96c6af-b521-1ffa-1ecf-d96d95820bdd@oracle.com>
Date: Mon, 6 Mar 2023 19:45:36 +0000
Subject: Re: [PATCH v3 07/13] vfio/common: Record DMA mapped IOVA ranges
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>, Avihai Horon <avihaih@nvidia.com>,
 qemu-devel@nongnu.org
References: <20230304014343.33646-1-joao.m.martins@oracle.com>
 <20230304014343.33646-8-joao.m.martins@oracle.com>
 <aa74d068-2897-88b2-a829-be477e832f20@redhat.com>
From: Joao Martins <joao.m.martins@oracle.com>
In-Reply-To: <aa74d068-2897-88b2-a829-be477e832f20@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0192.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:311::20) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB4835:EE_|DM6PR10MB4220:EE_
X-MS-Office365-Filtering-Correlation-Id: 87ed38b9-9b09-44da-2dba-08db1e7b5f51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: o7ilMDK+/t1632fvL/h8kBxgP6AT/mKKTNcx1apzTH0sWkJSqS1q3QvAzDOIeqrblpvcLT3hb2rXaysoKHPKi1xTxkivPh9l/VJ6XSq3/GqJ3wBHl6/qutz8Daz3QZPen8/xKkmxVF7pqp3tBirnBQav+Ry9bfqvX1w2mqXbpNqvMyPNmKrhkv3ZhCa3Q6Kz+OcUMUhPfvXrRyl0YsLp+jv4uWd1/XWU2aODBM8hKIP4DnaxR0LFpc5QH+63AcjildOS2BkggrTRmgzRyRbBXcrwoUbdNWwGxOQQbSDeIi6XZssAZo4xkXdn7Qjja0wLxyYXKaNB4xdP7dWjPXVndPUAX1owPXCqS/zUXIVibEPgMwML6+znXhQLpAHzhVKxvvzjI7cP2BWYNWEJKcBATwbFxv7b0Je/lxgL8+J8ul/Rloc2yCxjLgb+6lRMzr92SKpdLt7szviFGZCyrUY5GJ9JWTP0gqmOhFDiDUsFcW7QoUSOcnqzTEE6iCBbqTNHcyQFlvndVwgT7eG1I27CNFbk53CSI2A88B7+/b3QG57E5Dg8NiLlFe6wa7rThRwOrrKhr+MH5aC24gOK2qqZfL6330u5IkWzX9FKAlgoJ3si0EfLUozaQe16ywX8JhyyAzABapx49oIJIuqvmou+ZhCAHaUmWZq8inWVkickiEU6fxvPInej1opuSr9/a4gCUEH29RW84RMzrd63Hp3xRg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(396003)(366004)(136003)(376002)(346002)(451199018)(6512007)(2906002)(26005)(54906003)(36756003)(83380400001)(38100700002)(53546011)(6506007)(478600001)(186003)(2616005)(31686004)(66574015)(316002)(6486002)(6666004)(8936002)(5660300002)(41300700001)(86362001)(4326008)(6916009)(66476007)(66556008)(66946007)(8676002)(31696002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R3p0V3lzNVRGRjJ3TFVoQmtSb1h2MklJeU96ZzQ2S2hHQm9YSjF2RlFkWTBO?=
 =?utf-8?B?cjFONklHN3M2TllHekZ5WFBGZTZQbGRPT0RhZFBYS2hOWFBoeVVYcWxhSURu?=
 =?utf-8?B?U1oranZLU0kyYUNhNlFUcmQ2WHVTWHVHRWE0dUlKNzJGVjlGQ3BDUHUwS3pS?=
 =?utf-8?B?MUxNY3d5b05leUxLWjBhcXlSbGRONEtaL1JnbEp3KzF2Z0k3OEdPYldEK2xi?=
 =?utf-8?B?ano1Uy91d01iSHlVMzB2ZmdUOUFER1E0TzZ4dUxCdFJWMzN3VHRtWmg1SC9K?=
 =?utf-8?B?eUw5aXlxaGxUWUFESUhQdDdNZFFTYSswTVp1dzJvUUJGQlIwUjlPak9nS3dX?=
 =?utf-8?B?WmQ5YyszS3RKVHhVS3AxbVU2QlNEN1lOUGVEbHMycUc0NDNtTWwvUFhKZlpm?=
 =?utf-8?B?U3p5STV0TTNQODFJSDd5blhlaGFSYzVmQXJ6OHRnYWJQc2R1eEpMbThzSlBm?=
 =?utf-8?B?VWRDWkNWWXdPOXRYM2c3cVpkeXg3VXQ0RmhjYkhWanlRbzVqNEY0UUNnb0dF?=
 =?utf-8?B?Y3NOMjIwL0xPNkx3M1dHS3RhQUt5dnFUMFBZR3Y2UlVoUlFUWkljY09JNmRk?=
 =?utf-8?B?OTE0d3ROclNoTU1hOG1WUXYvVFlxZUYydXBhYTAyMTBLU09rQk80aDd3MjdJ?=
 =?utf-8?B?NHJhcWh2d3ZIMGFNcWoxUk9xZDRUMnRiTktSZTlWbVRpNTBpa1BNT0dWN3VB?=
 =?utf-8?B?b2FLQWw2eU9uazBuTlIySFdMem9ScUJxa0JLQktYRCtKVVlqRVlMSkJYUWNY?=
 =?utf-8?B?aHh0azkxUjgzRWkzbW4wWW1uVDZhcGJiU2o1ZEExdEdiZ0l3WVVjbi8rWmlQ?=
 =?utf-8?B?Qnh6Mzk5K0pQOEFXSm43K0czVS9yMGFoQWx3VVlqN2U2NllDZkpSSVFrTDZt?=
 =?utf-8?B?bENIb3p5YzB6Tzl4a0R3YUJMbGRDdi9ld1BvQU1ERlIvYm4vVnF0Y3p2OXVk?=
 =?utf-8?B?OFpLbyt3MUlyNy8yUWE3TlFMeGVjSVhmNGE5WlpXWEhtQUZsN3MzSjJrdXVu?=
 =?utf-8?B?bXRKeHlYSU1uWFNsRHpKWnpETGxkRW4zTHBiZm8zais0VFdjUUVTd3I0ZEpU?=
 =?utf-8?B?RzZhUDFMZkRZSlhMUlBpRStWZ1pmYUlrZmtZaEd6VXpCVEFLalczUXd5U3B6?=
 =?utf-8?B?VlVvOVBCWUhweERjTHVGSGZ0VWJ0ckFHUVdQMFpRR0RFU2lFRkc0YmVXNGVJ?=
 =?utf-8?B?cC8wb1M1ZGhqdDVIeGNiK1FOVG5TbXRwMXJWdHhxY0hVbE4rL1FKOW5oRmFC?=
 =?utf-8?B?V0oxVWliOVVqU0xYU1lzejNKLytLTll5NDErczFZQjVRUUttMDdmOVdqV3Rn?=
 =?utf-8?B?bTQ1dzZYVFNKRC9iOGNPamptWHg1Mys2VURteHBYVjQwUzF4MWl6MGZXbE5s?=
 =?utf-8?B?ajM4TlhsdkVXV3ZFci9NcTNVL0NHQTFXOXpYNzQzV0o4bGNTUEl2cTZpa3NW?=
 =?utf-8?B?Yk1CVlY1K2p3NVVxTlJYY09uNm9ra0ZoeElrWWx4Q2sxZXc4WkY5dXdaUXNy?=
 =?utf-8?B?bHNSM3ZRa1NYOVJtQ2RIakJLWGYyZFpFKzRWc2h1eUwxVTJJQ1d6N2RmdXZL?=
 =?utf-8?B?cnNsbi9LanJvaExoYnhvM01yQW90OENaWEMrRitzOXYrVUJOcUl6RnVOM280?=
 =?utf-8?B?VWdXR3d2dGt5VnpvWUh5V0NDNzdDR3BZMzdvcytDTjVBRXV2WXhYUEdnMHZl?=
 =?utf-8?B?YVVmOHppV0t1K29kUWtCeEE5N1ZEMnRGaS94MEhCRjRSd2czcmsxL3FUdS9p?=
 =?utf-8?B?UldjaWZWQWhkTURFMjUyWS83ZmkxeC8zb3RkY29qU3BSa2FaNlladUZLaDJV?=
 =?utf-8?B?MiswMStBeU5keHFnSGFVTVpJRUhVNE1Za0dSdkVONzRISS93NGM5aFdCbzMz?=
 =?utf-8?B?WVJyRlk3aFNha3dDU0hTaEttR2dTSDZTVERBYXpZcXNDcDB4dldhM1k1b2Vu?=
 =?utf-8?B?QmJpMldVT3VPTDRlUGw5QkVha0F0VDhCQVpteG8rVk5icmJnb1BiTEc0VDdD?=
 =?utf-8?B?cTRQcGY1ZzRjb25tWHhick5mK1RzMUhqNzNXcnpNK3J1VGtRLzdzWDBhQjM1?=
 =?utf-8?B?aGpRdEp6Y3RjM3JIdzlJQ2pMUXNqMldDNEljZ2RwVkNibTlReGk2MU50WHNv?=
 =?utf-8?B?eGovNXBkeGlxeWcrSEhJVmlzQnBZTVduemIxVXByR0huRHA1V1dIRUZTTFdo?=
 =?utf-8?B?bVE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 8gihL1UVgOF4WLZAlL1O5YmPsUbqwkQ/hHUbaHwcXAcDtHufHLXIHntkz1j262IgDqK0k4iMsHTxpfiZBL71UgPO+IZVsiURdkQm1lyi1kc9LXqU+SD+7mHVO0oUsOyFRSxzrYOuwwnRpaKdr9xfD8wg4HdfhPkX3QHXgP2Aa+fN42953osIvi1m41jmkppee66HRTtkWUtaUwINHn55CQSBOKBwKCEjSdHjkfdLdRvDEo+MJm3K+jPhC8cw0wvaNh6TdgtgYAMliOWWHlz9QagH/YaUk0w+Bd66hbq1go/JtbSX7V/Y2HUInt6nMhSLJPWVt8strzj6fMlZzHZRCMyjIOntUS/DLqe5se0Rqfv/NyJMIykrXOuXJnwvVBoe4F5rL1G/ZJeICqmGrfjHUjiIQ4/SNch8d5FRIaLzOlu48JVtlI7x5eY53QJlpT/Z7o1ANq1IWfLEYyOVdQtwAa6JJgJFWlDvXdumwO4gMf4edyWo6G4sQTVBCcgeUledEjOEm+oGAM5KX2+XMVYwDlTy36KUsxkgcx0tTkJpnNXF3gc8Ay+CQ9o8dhwoUY+NII0yHfmeKQoOwMaXiwmoS+NpTM+mo7lZ6S1It3C2p9ir9cUt6ojG6HRtzLt3YtL268wNaPExjZ+hd28aupDsXx7gaz7qlFaKxnTtkrceBSuMjfwcLJNLNmI7MS9zxltKp6QDYYdb4L2Q7+CFzdlKMNFH30PEXSYdxvoau5zZ9VA4kJ2U4tDagPWte6vfpsjj0gcNZyqxdrGwgFQXpjqcP8h2ZfbgZnBKxt9aykSx7zvRLsAkbDGOA4MEMSfe4c+6
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87ed38b9-9b09-44da-2dba-08db1e7b5f51
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2023 19:45:43.3585 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qdKRXHQJlu3916BQbP5vKBYDzkSSVqDSdeuI6lBj8DByLhC/ceG7AAefmWbq2Z0X99RD95OvY1ajv9Qf9cz9VaeSst8kFoURg/Ps4M1PPi8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4220
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-06_12,2023-03-06_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 phishscore=0 bulkscore=0
 adultscore=0 suspectscore=0 spamscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303060171
X-Proofpoint-GUID: l4qTyyAYX7dUPcNXZE0kVDO1JlAP55AB
X-Proofpoint-ORIG-GUID: l4qTyyAYX7dUPcNXZE0kVDO1JlAP55AB
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0b-00069f02.pphosted.com
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



On 06/03/2023 18:05, Cédric Le Goater wrote:
> On 3/4/23 02:43, Joao Martins wrote:
>> According to the device DMA logging uAPI, IOVA ranges to be logged by
>> the device must be provided all at once upon DMA logging start.
>>
>> As preparation for the following patches which will add device dirty
>> page tracking, keep a record of all DMA mapped IOVA ranges so later they
>> can be used for DMA logging start.
>>
>> Note that when vIOMMU is enabled DMA mapped IOVA ranges are not tracked.
>> This is due to the dynamic nature of vIOMMU DMA mapping/unmapping.
>>
>> Signed-off-by: Avihai Horon <avihaih@nvidia.com>
>> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
> 
> One question below,
> 
> Reviewed-by: Cédric Le Goater <clg@redhat.com>
> 
> Thanks,
> 
> C.
> 
>> ---
>>   hw/vfio/common.c              | 84 +++++++++++++++++++++++++++++++++++
>>   hw/vfio/trace-events          |  1 +
>>   include/hw/vfio/vfio-common.h | 11 +++++
>>   3 files changed, 96 insertions(+)
>>
>> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
>> index ed908e303dbb..d84e5fd86bb4 100644
>> --- a/hw/vfio/common.c
>> +++ b/hw/vfio/common.c
>> @@ -44,6 +44,7 @@
>>   #include "migration/blocker.h"
>>   #include "migration/qemu-file.h"
>>   #include "sysemu/tpm.h"
>> +#include "qemu/iova-tree.h"
>>     VFIOGroupList vfio_group_list =
>>       QLIST_HEAD_INITIALIZER(vfio_group_list);
>> @@ -1313,11 +1314,94 @@ static int vfio_set_dirty_page_tracking(VFIOContainer
>> *container, bool start)
>>       return ret;
>>   }
>>   +/*
>> + * Called for the dirty tracking memory listener to calculate the iova/end
>> + * for a given memory region section. The checks here, replicate the logic
>> + * in vfio_listener_region_{add,del}() used for the same purpose. And thus
>> + * both listener should be kept in sync.
>> + */
>> +static bool vfio_get_section_iova_range(VFIOContainer *container,
>> +                                        MemoryRegionSection *section,
>> +                                        hwaddr *out_iova, hwaddr *out_end)
>> +{
>> +    Int128 llend;
>> +    hwaddr iova;
>> +
>> +    iova = REAL_HOST_PAGE_ALIGN(section->offset_within_address_space);
>> +    llend = int128_make64(section->offset_within_address_space);
>> +    llend = int128_add(llend, section->size);
>> +    llend = int128_and(llend, int128_exts64(qemu_real_host_page_mask()));
>> +
>> +    if (int128_ge(int128_make64(iova), llend)) {
>> +        return false;
>> +    }
>> +
>> +    *out_iova = iova;
>> +    *out_end = int128_get64(llend) - 1;
>> +    return true;
>> +}
>> +
>> +static void vfio_dirty_tracking_update(MemoryListener *listener,
>> +                                       MemoryRegionSection *section)
>> +{
>> +    VFIOContainer *container = container_of(listener, VFIOContainer,
>> +                                            tracking_listener);
>> +    VFIODirtyTrackingRange *range = &container->tracking_range;
>> +    hwaddr max32 = (1ULL << 32) - 1ULL;
>> +    hwaddr iova, end;
>> +
>> +    if (!vfio_listener_valid_section(section) ||
>> +        !vfio_get_section_iova_range(container, section, &iova, &end)) {
>> +        return;
>> +    }
>> +
>> +    WITH_QEMU_LOCK_GUARD(&container->tracking_mutex) {
>> +        if (iova < max32 && end <= max32) {
>> +                if (range->min32 > iova) {
> 
> With the memset(0) done in vfio_dirty_tracking_init(), min32 will always
> be 0. Is that OK ?
> 
While it's OK, it's making an assumption that it's zero-ed out. But Alex
comments will make this more clear (and cover all cases) and avoid assumption of
always having a range starting from 0.

>> +                    range->min32 = iova;
>> +                }
>> +                if (range->max32 < end) {
>> +                    range->max32 = end;
>> +                }
>> +                trace_vfio_device_dirty_tracking_update(iova, end,
>> +                                            range->min32, range->max32);
>> +        } else {
>> +                if (!range->min64 || range->min64 > iova) {
>> +                    range->min64 = iova;
>> +                }
>> +                if (range->max64 < end) {
>> +                    range->max64 = end;
>> +                }
>> +                trace_vfio_device_dirty_tracking_update(iova, end,
>> +                                            range->min64, range->max64);
>> +        }
>> +    }
>> +    return;
>> +}
>> +
>> +static const MemoryListener vfio_dirty_tracking_listener = {
>> +    .name = "vfio-tracking",
>> +    .region_add = vfio_dirty_tracking_update,
>> +};
>> +
>> +static void vfio_dirty_tracking_init(VFIOContainer *container)
>> +{
>> +    memset(&container->tracking_range, 0, sizeof(container->tracking_range));
>> +    qemu_mutex_init(&container->tracking_mutex);
>> +    container->tracking_listener = vfio_dirty_tracking_listener;
>> +    memory_listener_register(&container->tracking_listener,
>> +                             container->space->as);
>> +    memory_listener_unregister(&container->tracking_listener);
>> +    qemu_mutex_destroy(&container->tracking_mutex);
>> +}
>> +
>>   static void vfio_listener_log_global_start(MemoryListener *listener)
>>   {
>>       VFIOContainer *container = container_of(listener, VFIOContainer, listener);
>>       int ret;
>>   +    vfio_dirty_tracking_init(container);
>> +
>>       ret = vfio_set_dirty_page_tracking(container, true);
>>       if (ret) {
>>           vfio_set_migration_error(ret);
>> diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
>> index 669d9fe07cd9..d97a6de17921 100644
>> --- a/hw/vfio/trace-events
>> +++ b/hw/vfio/trace-events
>> @@ -104,6 +104,7 @@ vfio_known_safe_misalignment(const char *name, uint64_t
>> iova, uint64_t offset_wi
>>   vfio_listener_region_add_no_dma_map(const char *name, uint64_t iova,
>> uint64_t size, uint64_t page_size) "Region \"%s\" 0x%"PRIx64" size=0x%"PRIx64"
>> is not aligned to 0x%"PRIx64" and cannot be mapped for DMA"
>>   vfio_listener_region_del_skip(uint64_t start, uint64_t end) "SKIPPING
>> region_del 0x%"PRIx64" - 0x%"PRIx64
>>   vfio_listener_region_del(uint64_t start, uint64_t end) "region_del
>> 0x%"PRIx64" - 0x%"PRIx64
>> +vfio_device_dirty_tracking_update(uint64_t start, uint64_t end, uint64_t min,
>> uint64_t max) "section 0x%"PRIx64" - 0x%"PRIx64" -> update [0x%"PRIx64" -
>> 0x%"PRIx64"]"
>>   vfio_disconnect_container(int fd) "close container->fd=%d"
>>   vfio_put_group(int fd) "close group->fd=%d"
>>   vfio_get_device(const char * name, unsigned int flags, unsigned int
>> num_regions, unsigned int num_irqs) "Device %s flags: %u, regions: %u, irqs: %u"
>> diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
>> index 87524c64a443..96791add2719 100644
>> --- a/include/hw/vfio/vfio-common.h
>> +++ b/include/hw/vfio/vfio-common.h
>> @@ -23,6 +23,7 @@
>>     #include "exec/memory.h"
>>   #include "qemu/queue.h"
>> +#include "qemu/iova-tree.h"
>>   #include "qemu/notify.h"
>>   #include "ui/console.h"
>>   #include "hw/display/ramfb.h"
>> @@ -68,6 +69,13 @@ typedef struct VFIOMigration {
>>       size_t data_buffer_size;
>>   } VFIOMigration;
>>   +typedef struct VFIODirtyTrackingRange {
>> +    hwaddr min32;
>> +    hwaddr max32;
>> +    hwaddr min64;
>> +    hwaddr max64;
>> +} VFIODirtyTrackingRange;
>> +
>>   typedef struct VFIOAddressSpace {
>>       AddressSpace *as;
>>       QLIST_HEAD(, VFIOContainer) containers;
>> @@ -89,6 +97,9 @@ typedef struct VFIOContainer {
>>       uint64_t max_dirty_bitmap_size;
>>       unsigned long pgsizes;
>>       unsigned int dma_max_mappings;
>> +    VFIODirtyTrackingRange tracking_range;
>> +    QemuMutex tracking_mutex;
>> +    MemoryListener tracking_listener;
>>       QLIST_HEAD(, VFIOGuestIOMMU) giommu_list;
>>       QLIST_HEAD(, VFIOHostDMAWindow) hostwin_list;
>>       QLIST_HEAD(, VFIOGroup) group_list;
> 

