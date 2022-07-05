Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E5445676F7
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 20:56:43 +0200 (CEST)
Received: from localhost ([::1]:53012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8nj0-0007Jq-6G
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 14:56:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1o8nJ6-0006ke-Lo
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 14:29:56 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:46812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1o8nJ4-0002dM-L1
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 14:29:56 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 265HEX9R009213;
 Tue, 5 Jul 2022 18:29:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=Nu0RCwPLCUyvWpHZjzdsl9gp1HZwFAvKHELhVGfj/oQ=;
 b=HcgdEy1lJC5ZIUKI5Vp9wEuuU2760G9lkVY9es8c3sEjvpZHg7Ffj2aVawjzqkuev3ed
 +Gxc7K91290uMbj8GF9NW1ju6WFYCWq+inZriHxxTmkJYLaVgj520PCRU9YpZDV4a+ca
 reXNXDyyyW8AcBxTXgMEY1ECObE26wXZB2KC8EBZP337NSGsx5EciB2OeTCFB5dLLjJM
 a7wMaooJfJ/rL9476NDhrouQjc8CBt250Rk0+N/3AMkTKnijoaGpBgHBh5B9FfM3Eu9a
 7/cSkr1PC8EZotTfeXoqblacyVYxXYTFPaJCWL64HSqUzBWIeuJhfRtzpG031fgK5ZXi ww== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3h2cm0q35r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 05 Jul 2022 18:29:44 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 265IRG2U010397; Tue, 5 Jul 2022 18:29:43 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam04lp2176.outbound.protection.outlook.com [104.47.73.176])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3h2cf2krwq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 05 Jul 2022 18:29:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=emM1SVqQtoNiv66cb91BQOpUo/6SeZ3JDRxk9ekmNfE5CyZuI2ri88RksGFwmiZ5dijPE2F8TQqH9XWvGBvttykQrXpiYBCL9z+l0vWZv3LbPdg17l9clKvLKMzt0CDk0YxBQ37CIq5iqqXxcCqTwHiS4hz2lEL/MZ6D1hxRiVk3MfSaJ1b3YNkdd4ruoQTENo+fE/n0M4f9CzWJNFvjiwseiAKGKh/CcbdEudit2O3UjkeqfxMjvLM6LvuZFEfAyIEaLiaRL6FJe16vvyzOWD17mwrLDJSrjN/9H9SbqPW1ntMScRMcA9LvGRYbReLFPveCMzGQr8D4rbYbNJOZFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nu0RCwPLCUyvWpHZjzdsl9gp1HZwFAvKHELhVGfj/oQ=;
 b=mNdoHF2wp2l7rhQJRM2VWACYke2e+Zj/bfYrTCgWGJ4MLHkv7i0uK4rAOs8Vwga9uCQYYb4CQ0tTzbQk0Xt8vY6Ws2Vs+PNxlWDVTdr2OlIoTPjOX6brRZUkjvo1toMuMmXzBZJDymNHqoZtfxEmWLakF/zNaNROqEwVP23crvHFBw+qX5JOV+Ibo1JNkZPhc3lSPkTx9mkdTmxhbi/LxGcI0SpQhrwS0x3IhC17DudpdxtkTI0Vg+7atX3Zpq0EUVvFnZAw21SG9I16LuPFF4a8CUzyncU/GifUZ1TWDDtsgWyP6hTkM2F3de648uhmu2aGEHE+CCaMA92u5EfbHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nu0RCwPLCUyvWpHZjzdsl9gp1HZwFAvKHELhVGfj/oQ=;
 b=NKGG2qkwQmPZRHZGHXSqf1jZCXW1va3REY6J6Cpa393Ep5/xCIK3hkBOcqswrP4lTAgvyBN1gjYM5pbUdE46U2nAb0iSqet9kHmnxYUuWdGI6JV1ZCtnmO8XZEwg1aA+wyCCGDe9X9su4nEYmqSkqE+mCK1hsRc8067jOChPf04=
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by DS7PR10MB5341.namprd10.prod.outlook.com (2603:10b6:5:38d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Tue, 5 Jul
 2022 18:29:41 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::dc4d:56f4:a55b:4e9]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::dc4d:56f4:a55b:4e9%6]) with mapi id 15.20.5395.021; Tue, 5 Jul 2022
 18:29:41 +0000
Message-ID: <1d6030fb-d593-6210-c0e7-f39ae487d39a@oracle.com>
Date: Tue, 5 Jul 2022 14:29:35 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V8 27/39] vfio-pci: cpr part 1 (fd and dma)
Content-Language: en-US
To: Peng Liang <tcx4c70@gmail.com>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 Jason Zeng <jason.zeng@linux.intel.com>,
 Zheng Chuan <zhengchuan@huawei.com>,
 Mark Kanda <mark.kanda@oracle.com>, Guoyi Tu <tugy@chinatelecom.cn>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philippe.mathieu.daude@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>,
 David Hildenbrand <david@redhat.com>, John Snow <jsnow@redhat.com>
References: <1655304746-102776-1-git-send-email-steven.sistare@oracle.com>
 <1655304746-102776-28-git-send-email-steven.sistare@oracle.com>
 <4bf35a50-03ea-66e5-a5ae-ebb3a785dd43@gmail.com>
From: Steven Sistare <steven.sistare@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <4bf35a50-03ea-66e5-a5ae-ebb3a785dd43@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7PR18CA0022.namprd18.prod.outlook.com
 (2603:10b6:806:f3::21) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d33df908-9b0f-4fd5-842e-08da5eb45339
X-MS-TrafficTypeDiagnostic: DS7PR10MB5341:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yrMVj50PPHgW7lsNBOWpBzaGcV6J0ouKP/RKr/DwdORvio/rZJCrrU5ccAtOF8mAPNybBouB7p0VFOoQxNVDMCv6X15UhRRFo0X8voZt8aPi9hcnLQF29qsnWVvpmhBE8DyB50FfN9uGu2ApSRE/feKSWgh+ZieGPpDeuxt4hORamP77XLPFBPQ/U3jDYkihmTwqjonF6vT3qVsIZ0JRquOr2XIMqJ+q4UtwzKxRpO3dArf6AwGkmGak7rKnA2ZdBGqKXOp04y9Xl00Mog9AmtUyYcAMdyT7LwNXZFZ/HbTMZyZC1pl0rrvpb2l4njNPabUCBftvytS4CbJb10Kay+ZdYVkY5fihUAmLwXgTfLlVM2AukELyjzvTx5oiSN/cVMxnlx9saavqYrY34iHz2ox+fjKBWzeKSk7/35DtD7TZoi5mwsLMPS4S1aU7JyW08fY0QiQr1c9vti97FpqTPzqTyIyBhESGlNe+yKNttre/SjyW2EGxIsMyCUDsX2s0R39JsDid8UA+ususQjzfxGgBQboyk+TCtYsSpVmoDnBzcCqa9MfnoRnpurnHT6cfXtXqg5tE7pHmI7qSg2uYOTVixlEVmvWbTzK2+j95h5XyXhB1BoAO2DFiCEW/IGqZA5rxGHQEPm6uklQAUcU01WLY1tXHwbtORsU8WRQPjEWFgaPmS1u3PO3mMREyeMsWyfDeCG9lh8BgCKRodeELyGOELq9PYO3yewyVffMXVYo8rFcB7n1tgAGGsKiE9mnG0oOaFkHCuiTGluqzv/g0NTyjMYbJNYkCHLC3Xh3uMh8C4hH82CrPgtf+xgscSdjr1q76wusjnMSiaUk1w0rk7w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(366004)(39860400002)(376002)(346002)(396003)(36916002)(8936002)(7416002)(5660300002)(54906003)(4326008)(8676002)(66476007)(66556008)(66946007)(41300700001)(86362001)(31696002)(6666004)(316002)(4744005)(186003)(6486002)(26005)(36756003)(6512007)(2616005)(6506007)(2906002)(53546011)(38100700002)(44832011)(31686004)(478600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NjFGZWJvMHVBUGwycTIvUW5jS25GVjUyaHQ0SlE2L3dreHcwTGFXcDVINDc3?=
 =?utf-8?B?TmNwR3VNa3FXaEhZeW92eG9BVk14SDhvVHhkUklGZXFjVFE1UEFPZTF6a200?=
 =?utf-8?B?OXAyNVVrU0d4aXFWbGIra2E0WDdjTTFnM1l2SWEzMkNDbWpaU25JZ0Q3VTNI?=
 =?utf-8?B?SU8zL01WanQwVHNpdjQ4RU81WWhRNmxTQkRoWXo1Ri9aRGJwOWNoR1dpZlVQ?=
 =?utf-8?B?U3dKYW9ERm5pQXh2RjQyY2kyalcxVlJHWFpyVmFTZDRVVjBFVmZFeUV6NUNY?=
 =?utf-8?B?aERwbzQrcTAzdmJmUit5Uk1SbHd2QmFVNkJ5THhINDVwc2YxbWdIb3YrV0l3?=
 =?utf-8?B?NlNJNzdnTGpCeXRNNUtWSjN3b0hLRUdUK0NWWGxYSkFISWxJUDJLb0g3alBm?=
 =?utf-8?B?SDlSODhpL0x2MnpUSXFPajZHNFRkVldEM3FGRkpXYk92UzV6bXg4Njg2aFZ2?=
 =?utf-8?B?Y1hRdFl1T0UzbkhvUTkrRyt0Tzl6RnBNWnBJY1hZaGJsZDlMOEVkYzhCdjFi?=
 =?utf-8?B?TnZvQkEyNU4vMGU3R0ZvY2EvVmJVVXI0ZWlvZmtNZk01aEErWloxSnRrcFBK?=
 =?utf-8?B?SGkyNnlWOTZKWTJPSWE3NGtvT0k5Rmc2Z3pqUDNWUjRaWVc5alplSGIvMjRO?=
 =?utf-8?B?TmpWV2JmUVZQemh2b3FwTURlMzFvS2NUWDBSZmNWK2p5YXpiQk9YMnZ3K29u?=
 =?utf-8?B?c2h3MmhtKzNSQk4raDVaZ2dzRWdxN2g4SlgvZHB3RjlmTkVDRi80aldrUEFP?=
 =?utf-8?B?Vk1Qc2p2NklrMFJ1QW1maHE2WDlaNk1samVkMkdXc0ZNZlU5WnhFN2Vqd09z?=
 =?utf-8?B?K3ZOaC9qRUVQdlNtSTZES3VKZDlZdmpnYk5qTG4yME9iOFNxZTBHdXpIYStZ?=
 =?utf-8?B?dnZBQTdtUW1hSTNyMnhWczlDbVpEVGVzUHhQTFVDeUhpclRTM01jQkxQRlBm?=
 =?utf-8?B?aTkzQVlqUEdYKzBJUGpzUFprQXpWdUlrV2JVZ3d5enlYOTMwVHF1ZWNlSW5X?=
 =?utf-8?B?dTZaNVdQSmhJc1FBd1dPV01QRlBNZ2RpZkhmbUhCN1NXeHZlUWhmTjBJeFNa?=
 =?utf-8?B?Ukd4cmlJeEpaTVl5cUZMQ3UvRDVnek1KaTRSNXFPSjRsai9HNVByS3JodEdN?=
 =?utf-8?B?K3dwMnZlekRZZFJBZ2l2czNTMU1XZEp5RHYzUjZoTGcrNFhvZWx5WEwzNzZW?=
 =?utf-8?B?WlJjR1pCUDU0bVFUME53M3dWckgvYmN6OWZNVlRMSWN3YU5lZ1NBcWtxMDU0?=
 =?utf-8?B?aDhIWlJaSk45cmRxMnV3YU1wL1NIazM0U0MvMHh4a0tRVTg2MUNRVElIQmJx?=
 =?utf-8?B?aTdYa2syTWQ0MzI3OTVFWmdQUkZxalBwK0VqWlRWdnJDR2hudVEvdVpqUmNi?=
 =?utf-8?B?ZW42RTZGNWxYc2VVUmtQQmxqWG1QR2hIQkxNVW92M0c5NEpCMWNiWkpHZnlZ?=
 =?utf-8?B?MFF1UFhramZCWEVlTVlRdW8rUDJINCtVdEQ3ZDlGTWRqNmF2YThQRWwvUEZJ?=
 =?utf-8?B?ZzdVd0s3cVp3V0VWQlRjbm9wcE1EaVhSYUJzeWdXSEhkRmFMUVdRWmFRdm44?=
 =?utf-8?B?UFJ2OVJGZXUycjhsaUtQam40Y3dBclVLZGIzbHFHdmx1TDNvMTRwS0RITHo2?=
 =?utf-8?B?QmNWbXVJSlRVVXMwa2trdTlrazFwaXFLR3RhVnpBVENjdGZaWU1IVzRlcno3?=
 =?utf-8?B?QU5XZlFRL0tSTklsZ2VZaDJ3eGlsZS9xc1dxeGYrMlkrUndpWjVZSjlta0VU?=
 =?utf-8?B?a3VFcGJoZzVleDRCZWFLK0I5RTBpNjBwUE9tUU4yT3Y1cWFlN004SWZGVkk3?=
 =?utf-8?B?dW9oMVZ6cVQ0Vlg5OHZFVkdHL2ZGeE1vS0lKVkU3WkFaNGFCTU5Ec1dIeURy?=
 =?utf-8?B?U2RCYXcybUtyemdFK2MzVTg2VnArNmppcHBUOWhuSDA4R0IwenlSSUszZzEv?=
 =?utf-8?B?a09jdjVkLzZndkxGckl3T0dEbHdOcGdGckNUKzIrQUhLcGtxN21YTTJ2UlZ1?=
 =?utf-8?B?S0Rkb3U1Y0huWTdYVnVLUk9KeG9TVjhuUm8yaDMrbmlHb3pxOXRrSmhLOS9W?=
 =?utf-8?B?bHZhNzlyblBVM3RiTmdkYWFtOGozcXI5SjhDditMTVFnaUc3ak9SaVZUcnB3?=
 =?utf-8?B?cDJlaU1WNzd1Lzdkdmt5VTRKeTY1ZmxWcjB4SHZjTlBVZGJyUldPTjlwakpv?=
 =?utf-8?B?Smc9PQ==?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d33df908-9b0f-4fd5-842e-08da5eb45339
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2022 18:29:41.2092 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lA/aLFu46pKqhZHJaeoFDvqMNlX7i+Zj9P9M36XHd+v3CCKA0BqDM6yUCMr0w6ogiO/x/yVLKeBlCKUYEGzf7TLyuzFwfinMbMHeieb3ZLk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5341
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.883
 definitions=2022-07-05_15:2022-06-28,
 2022-07-05 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0 adultscore=0
 mlxlogscore=999 bulkscore=0 malwarescore=0 mlxscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2207050079
X-Proofpoint-GUID: Fdobs9-s5T8X7zHNYWSXBrcb8GGAA1rD
X-Proofpoint-ORIG-GUID: Fdobs9-s5T8X7zHNYWSXBrcb8GGAA1rD
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/3/2022 4:32 AM, Peng Liang wrote:
> On 6/15/2022 10:52 PM, Steve Sistare wrote:
[...]  
>> diff --git a/hw/vfio/cpr.c b/hw/vfio/cpr.c
[...]
>> +static int vfio_container_pre_save(void *opaque)
>> +{
>> +    VFIOContainer *container = (VFIOContainer *)opaque;
>> +    Error *err;
> 
> According to the description of error_setg, local Error variables should be
> initialized to NULL. The following coccinelle script from Markus should be helpful
> to auto fix the problem :) :

Thanks!  I will fix this and the other instances in my code.

- Steve

> 
> @ r @
> identifier id;
> @@
> (
>   static Error *id;
> |
>   Error *id
> + = NULL
>   ;
> )
> 
[...]

