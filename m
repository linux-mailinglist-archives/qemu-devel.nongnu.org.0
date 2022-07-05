Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9B75676FC
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 20:58:08 +0200 (CEST)
Received: from localhost ([::1]:55130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8nkM-0000Lc-Sn
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 14:58:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1o8nIc-0006CT-5v
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 14:29:26 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:46046)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1o8nIZ-0002bX-RW
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 14:29:25 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 265HElui000548;
 Tue, 5 Jul 2022 18:29:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=D42JAxqFTtUwSgU8ZLuBUzUO1YWz4NSYFqmQV8IR8Zs=;
 b=rNrwsQGC3jePFMwvJCEU2+d9WF7qt8+iVRYIemXaLy5m8XgDQfYwwNBmjDMoi++Yy1QK
 izusG4kJhMyvY3pn71a7icF8xQWDGcbV/n/X4t+z8mNX5tvoYL7dQ9Ad5Qrx3VOqdYqR
 oDJBQHspMXYplhwCbBbTn1yHqCRTlm2qde0OXOAqQgxbdNoJgjLZ2jEY71VNYRxN5flR
 ZKJVSeLBKppeAdnuhMuWzXTDG4cIsjlhSXedxMFNx5x1p6V7qfbSE0bXAtWlTTT+YtAq
 w8TUBVyehlJDlBdsDrfrhfoVoRG2vBQ48poEHtFTwgbNba+k2O0SlCWxQhPqpLPQbfy2 vg== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3h2dwapu23-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 05 Jul 2022 18:29:11 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 265IPur5014485; Tue, 5 Jul 2022 18:29:10 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam04lp2173.outbound.protection.outlook.com [104.47.73.173])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3h2cf2kf6n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 05 Jul 2022 18:29:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NpyjDUEdTq5NnrTBQQUj41hs9GxtSq7resOlQ8HHu6vRfQKoUxbwDl3j3MIrQ6ftv67N8IdWBUsGw58ReUuuVhqDkxMqKeAOmKbQZ/YOJhxTV8BE6UUjAugr/BBhWr0FpScy2fxp/cN+ZR0RcLYiZ46oj03Ks2PIC4BuWzkvG4GpmNrkPxIEIKP4i3GRinCWqMZw4B2Jo7eT31pzM1TxV/EsD7JFmaDe3jrzOVwkmTJZXPFvRzNwMZE66tgT1V7UmtnIRXdJ1lPQCBC155WuWWOlVQo2nHwAEijw0Yxzlaz/nONgZ1hoMa/z8bZ4Sf2L6XwZ2Cl65znNT4rntaf3Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D42JAxqFTtUwSgU8ZLuBUzUO1YWz4NSYFqmQV8IR8Zs=;
 b=RJzo/4yrIzNjQObbBjqM8lIrAUGCy7i7z4dVkoLLDXna8COR7Z8UFokjaPDfOYoCh7VXdvNS3tK5z/CTOp6uuhIXv4qk/d1JV86ay3cM3nRLdstuj1MBugTSUhqXKLD4CubItv4mgt6+o60MyoUQXIyn8qmaOkz9iXw0Xw12Z5mBJvqn5KKB6jQ4y8oFGEWPWDCcYL4S3S00TShbKwg8QE8pC5ohNjFemTv5+kS9SVQkw2hToK5XdBio0ZtAHZmp5UAZwMc3gXCEQp9NZouDMlE3qA6SnbjInbEwSnmiq2GVh3vXPgduIU9U2zK0gCKIP9xxlpc+KTo90EccfsWPkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D42JAxqFTtUwSgU8ZLuBUzUO1YWz4NSYFqmQV8IR8Zs=;
 b=LYB9GO+reGOCVd3Gy4M9HD7y7UL6uaZ9HwAvmfyyPviRwM0niYpT9zTPVlfWNuIZtudPxShrzkOmu1Fq+UnVlUjaW9By8X9QuUO589mnUyZx20FcuM3N6KrY6BdAHK9niccV4EoBJ2zjwRJ3x+ax+DltHbuqkyxKusH78U5lvSI=
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by DS7PR10MB5341.namprd10.prod.outlook.com (2603:10b6:5:38d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Tue, 5 Jul
 2022 18:29:08 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::dc4d:56f4:a55b:4e9]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::dc4d:56f4:a55b:4e9%6]) with mapi id 15.20.5395.021; Tue, 5 Jul 2022
 18:29:08 +0000
Message-ID: <24166b92-f96b-7eda-f480-c654d5e93e63@oracle.com>
Date: Tue, 5 Jul 2022 14:29:02 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V8 20/39] cpr: restart mode
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
 <1655304746-102776-21-git-send-email-steven.sistare@oracle.com>
 <2533a4a5-e117-5ea2-c62f-db7fed3d64b1@gmail.com>
From: Steven Sistare <steven.sistare@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <2533a4a5-e117-5ea2-c62f-db7fed3d64b1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DS7PR05CA0049.namprd05.prod.outlook.com
 (2603:10b6:8:2f::27) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5613e42e-5721-411d-a9de-08da5eb43f6a
X-MS-TrafficTypeDiagnostic: DS7PR10MB5341:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6CYvKCOfmKX2X+CaEv0TvgsZ9MC1d0uGWn+Oc7mGV7HaGTNPNUpstJ8zHBe9kj8jpNXlC0Ww2pHiI1CYyuYD9OwUq6T3PFqSxSNMel5mEnZVOwce8Y2mnbTTdCuQTILasVWizcHfxvX8CC0q44joal8B2OA8Z/I74ydSm4R/a0ZfSKKMDjakLnp1uluuCXoggFEsiN7hym0cQQhCk3B2sQSca6+JvGo2PUt0zo8TWgkhkuH+inise5aRBuz3LDwUF2wF5sbjlCoGkNA8CTjL0SJMJhP0zFw5r6lMmN6rpyRUOxYx22NNvMOs9bsdiwgM+6LVejw3dkA9AALdVL9/8FNBUfgEYjhWG7mJBpvYFRFPF2przDLzuz/QOXD3eZtzjD35nmjeJAM8P4aYm9LnViJinaehlKHELAF4gk3ie2ktsxmCIhzZE+T9pVQcYD6ixIivYSZk5xkkWQw+iSm7jC0PDJvic1kzMaQW01bAMJtpeTmmbE09ebnbTqxKyZX/WXZ5OVE0xaK8bIFaEiSCg8g7JzcpNvfQQtqS8BdqZYT4l/HFOsx6uRtswHbIMUjuPRtNug1A1CNxhswRr0i6LjO3lQIhbDNvjKoQjFwvgONAiINfY/gloU8e9+OOlYvBxYzeLFqXMEsRi31/CSkUgbac/g4Q4GGN1vnfjQoW2UOvsDSwRT5aj5fZ89atyrS08H77zMVGoqOdEYtrJ3yb+dVYcCl41Q1GnARwq9FUf5dE6D1fSKLMtqV60gHbodZBERrSjrgg4rvck2XDDbp/L9YhhQpy3q3M7njzuifszqKfyi4uzkwvdTXtjKg2EluFBdazHqlIRMh5hSztni2dofDhhovWXCw9mRjkX8jW/RA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(366004)(39860400002)(376002)(346002)(396003)(36916002)(8936002)(7416002)(5660300002)(54906003)(4326008)(8676002)(66476007)(66556008)(66946007)(41300700001)(86362001)(31696002)(6666004)(316002)(186003)(6486002)(26005)(36756003)(6512007)(2616005)(6506007)(2906002)(53546011)(38100700002)(44832011)(31686004)(83380400001)(478600001)(43740500002)(45980500001)(309714004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K0RGcklLVTdBdVljcFdyZTd6dWNmdTMzVEVUanEwbnBSRmJEMFNmdmxZMWdI?=
 =?utf-8?B?bng1OGxWS0I1Zm05TFBzaFJiYVIzTmdkemk4Yi80djZtY1pSTmlNZEEyRkZr?=
 =?utf-8?B?V3ZRQkdHZ1JjdGVoeXdEUmgwbFMvT25mWFp2R2dOS0Q2MXl0dEFXVUtFV1hU?=
 =?utf-8?B?RUZnOGJRUDFnM2V0L2xRaG84Q3RlbklIYXIrYjE1bUlTUGdGcUJIRzZSajdL?=
 =?utf-8?B?Q21MOVZKd3pXWEpqV0pkbTdYaHVWMWd3ekNHMjhEQXpTNW1SMVlQcE9la1VK?=
 =?utf-8?B?K3I2aHNTUkpGTXFzRUZWOWtLQXNpYllIa3lkbXh0dC94MVdyYkcyZG52dEVa?=
 =?utf-8?B?a25RWERKQkRlbGwveC91c3pia0xQNFlLM2pKcW5LMUhzWWxoamszLytxV3Yr?=
 =?utf-8?B?ckwxNU44OFBJMCs1NVRUc1pDSkF2dGFubjdJbUpiRXNEeGJmdmRpeDFZak82?=
 =?utf-8?B?L1M4VU5xVDlKT3Q5eTNDNktLSGVlUXVmV2FuN09RaE1URXBvR0Q0TjRqZnNC?=
 =?utf-8?B?aFJ5azBhbXVZWERvTE5URHlIbzQwM2VrUk5qem5YUjRMcXA1ZElOUU1SMVBI?=
 =?utf-8?B?ciszOUFQejFCYnBhTVc5aWg5RE1ONE15M0UwZGl2c1VvSGc0bXFkLzZHcHNC?=
 =?utf-8?B?TDNrSDFZMFZFbjVUNU1pMzgvTVdkeEp1K3ExbjNydUlFYnRXWjdGYjd5Y2lp?=
 =?utf-8?B?Qlh0V2VoYkM0LzdHUnVuSU04SjFqQlZIc3VPU0JYYUlyaDEyYnQyZ3UrSytv?=
 =?utf-8?B?OHd0dUF1VlozZ3EzdjhYcUk0VEY0M2JxWjZVVmlBbTlvVUhVOU1DUUgvTWJB?=
 =?utf-8?B?SDZOMm4wMHlSbG1VZSszbm1iSFU1YVJIOTcyY1d2Ynd6eFdMeFNyWmo3anRn?=
 =?utf-8?B?R0ljRk1heGhCMWlGekJESEtGUmV5aDVieXBQSHJNUVRmK0dWdFhXSUVsL1A0?=
 =?utf-8?B?S01UdW1oUXM4VXNudjBkanBiMjI0Y3FGSnFYazRpbjMwSWt0d2RGQ2gzV0Fi?=
 =?utf-8?B?YVUvZHllcmVxNGVKNWU2ZXVqTXhWOXpMVEVFRzRlckhscTdsOG1YUXpJa25E?=
 =?utf-8?B?MVhrcWJqSDdnbVlXdis5cXM5SXoyTGZ4UUtOa0JsZ3hyTm5CUURST2FjVGw2?=
 =?utf-8?B?M21nMnhrWlJtSzdTZHZtckZtcE93Y0FWVFFPSERuQ3BVQjhwOEdsYnNMNHdr?=
 =?utf-8?B?TFdSY1VRaDU3N0ZPZURabE1xa0hHSFZyYjA5UGV3RGdkc1FPQytNTTg5UWx1?=
 =?utf-8?B?dzd2d09iZTVNTDZYZEpKb0xXbDhaSXl3RlNZNFNKZXRxOTZybnlzaDI0aXVP?=
 =?utf-8?B?ZGllOHV3S0ZudG9DdklMdjc2ejNMRS93cHllUWVvaXB5R0VhTmt4akdnUVh3?=
 =?utf-8?B?NUVCUW92SkcyZW9mWGNueTlyZlplWXZ0NmljZWlvTitEelBZTUE0NEpXbTFP?=
 =?utf-8?B?cUtRanNLbzFVTjlEbHcrcGdWVzU3aitjVnhCUVVWbHREZ3VreWptMVpsN0FT?=
 =?utf-8?B?SVRDSXZxOGpyd2JNOUFFdFdXWUFrQTRrbGxZM1VtS0Z4aWN1clBDdzhwODhz?=
 =?utf-8?B?eXpmaFQ4MVN4SmE5cElFWlUyL1pSZW1RTitycnAzUEpNRVZwNlExYlRrQkhZ?=
 =?utf-8?B?NG1rdmxabzFzMVBpd0tEbUI3ejc2YnRSNDlRWkd1bTQyU2d2NUNoMEZEQ2NC?=
 =?utf-8?B?MkE2N1B4aTB5T3V5eVA1QzZqc2QxcVZ4TExIMlhSeDZFenl0Z3BPc0JxOTVa?=
 =?utf-8?B?TVJPTmV3TlhuTlZVdEFxNmYvc1JGUXZ6SU9KaklmdVNDamRRRzBXRjNabGVW?=
 =?utf-8?B?RUFFOFhHb1lQQ0xZMEdlRGl1S0tBTml3Mzd5TzRqY3RCZ3ZTS0RnZVpzSGJk?=
 =?utf-8?B?Z1pJcW5meEdlcmxxUHFTajdjUnJNbGhjR1N1YTI4MXVKVG1Qa2NLMUR0a0lV?=
 =?utf-8?B?R1hEN0lFekd1b256azNXNXV0WHp3azFySW1wSDdLd2x1OFloREVwdXp3eXdr?=
 =?utf-8?B?UGU4YXlxV0Zqc0UwNVYvaHh2emFoMjZKUTVlK3hQcEFsWWZCL21QMytsMkw1?=
 =?utf-8?B?RXZpOXpTVURGNkNLQmN1bEJRR3VKa1NleVkycnpIa0VINGloRzhIT2tGazV4?=
 =?utf-8?B?M2pRRjhLWlNMaTVNVWMyU0lVYnNzZDRkWC94S1lndjBhUmNUZmZJeHE2bVMz?=
 =?utf-8?B?RXc9PQ==?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5613e42e-5721-411d-a9de-08da5eb43f6a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2022 18:29:08.2894 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bu6tT/AuW1u1watvusTOKjVkzgMpaGyQB3aKp/1dTsg7iRmN3rAAFb3R+HYo7oiUnvtnHcsYyYNmpOMV8Wt5tx6FH10zGCaBLIyb9Qdyh8s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5341
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.883
 definitions=2022-07-05_15:2022-06-28,
 2022-07-05 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 suspectscore=0 mlxscore=0
 mlxlogscore=999 adultscore=0 spamscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2207050079
X-Proofpoint-ORIG-GUID: sUZPFgZTLl1Brlrg48Kj-L1Gqy79UewB
X-Proofpoint-GUID: sUZPFgZTLl1Brlrg48Kj-L1Gqy79UewB
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

On 7/3/2022 4:15 AM, Peng Liang wrote:
> On 6/15/2022 10:52 PM, Steve Sistare wrote:
>> Provide the cpr-save restart mode, which preserves the guest VM across a
>> restart of the qemu process.  After cpr-save, the caller passes qemu
>> command-line arguments to cpr-exec, which directly exec's the new qemu
>> binary.  The arguments must include -S so new qemu starts in a paused state.
>> The caller resumes the guest by calling cpr-load.
>>
>> To use the restart mode, guest RAM must be backed by a memory-backend-file
>> with share=on.  The '-cpr-enable restart' option causes secondary guest
>> ram blocks (those not specified on the command line) to be allocated by
>> mmap'ing a memfd.  The memfd values are saved in special cpr state which
>> is retrieved after exec, and are kept open across exec, after which they
>> are retrieved and re-mmap'd.  Hence guest RAM is preserved in place, albeit
>> with new virtual addresses in the qemu process.
>>
>> The restart mode supports vfio devices and memory-backend-memfd in
>> subsequent patches.
>>
>> cpr-exec syntax:
>>   { 'command': 'cpr-exec', 'data': { 'argv': [ 'str' ] } }
>>
>> Add the restart mode:
>>   { 'enum': 'CprMode', 'data': [ 'reboot', 'restart' ] }
>>
>> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
>> ---
>>  migration/cpr.c   | 35 +++++++++++++++++++++++++++++++++++
>>  qapi/cpr.json     | 26 +++++++++++++++++++++++++-
>>  qemu-options.hx   |  2 +-
>>  softmmu/physmem.c | 46 +++++++++++++++++++++++++++++++++++++++++++++-
>>  trace-events      |  1 +
>>  5 files changed, 107 insertions(+), 3 deletions(-)
>>
>> diff --git a/migration/cpr.c b/migration/cpr.c
>> index 1cc8738..8b3fffd 100644
>> --- a/migration/cpr.c
>> +++ b/migration/cpr.c
>> @@ -22,6 +22,7 @@ static int cpr_enabled_modes;
>>  void cpr_init(int modes)
>>  {
>>      cpr_enabled_modes = modes;
>> +    cpr_state_load(&error_fatal);
>>  }
>>  
>>  bool cpr_enabled(CprMode mode)
>> @@ -153,6 +154,37 @@ err:
>>      cpr_set_mode(CPR_MODE_NONE);
>>  }
>>  
>> +static int preserve_fd(const char *name, int id, int fd, void *opaque)
>> +{
>> +    qemu_clear_cloexec(fd);
>> +    return 0;
>> +}
>> +
>> +static int unpreserve_fd(const char *name, int id, int fd, void *opaque)
>> +{
>> +    qemu_set_cloexec(fd);
>> +    return 0;
>> +}
>> +
>> +void qmp_cpr_exec(strList *args, Error **errp)
>> +{
>> +    if (!runstate_check(RUN_STATE_SAVE_VM)) {
>> +        error_setg(errp, "runstate is not save-vm");
>> +        return;
>> +    }
>> +    if (cpr_get_mode() != CPR_MODE_RESTART) {
>> +        error_setg(errp, "cpr-exec requires cpr-save with restart mode");
>> +        return;
>> +    }
>> +
>> +    cpr_walk_fd(preserve_fd, 0);
>> +    if (cpr_state_save(errp)) {
>> +        return;
>> +    }
>> +
>> +    assert(qemu_system_exec_request(args, errp) == 0);
>> +}
>> +
>>  void qmp_cpr_load(const char *filename, CprMode mode, Error **errp)
>>  {
>>      QEMUFile *f;
>> @@ -189,6 +221,9 @@ void qmp_cpr_load(const char *filename, CprMode mode, Error **errp)
>>          goto out;
>>      }
>>  
>> +    /* Clear cloexec to prevent fd leaks until the next cpr-save */
>> +    cpr_walk_fd(unpreserve_fd, 0);
>> +
>>      state = global_state_get_runstate();
>>      if (state == RUN_STATE_RUNNING) {
>>          vm_start();
>> diff --git a/qapi/cpr.json b/qapi/cpr.json
>> index 11c6f88..47ee4ff 100644
>> --- a/qapi/cpr.json
>> +++ b/qapi/cpr.json
>> @@ -15,11 +15,12 @@
>>  # @CprMode:
>>  #
>>  # @reboot: checkpoint can be cpr-load'ed after a host reboot.
>> +# @restart: checkpoint can be cpr-load'ed after restarting qemu.
>>  #
>>  # Since: 7.1
>>  ##
>>  { 'enum': 'CprMode',
>> -  'data': [ 'none', 'reboot' ] }
>> +  'data': [ 'none', 'reboot', 'restart' ] }
>>  
>>  ##
>>  # @cpr-save:
>> @@ -38,6 +39,11 @@
>>  # issue the quit command, reboot the system, start qemu using the same
>>  # arguments plus -S, and issue the cpr-load command.
>>  #
>> +# If @mode is 'restart', the checkpoint remains valid after restarting
>> +# qemu using a subsequent cpr-exec.  Guest RAM must be backed by a
>> +# memory-backend-file with share=on.
>> +# To resume from the checkpoint, issue the cpr-load command.
>> +#
>>  # @filename: name of checkpoint file
>>  # @mode: @CprMode mode
>>  #
>> @@ -48,6 +54,24 @@
>>              'mode': 'CprMode' } }
>>  
>>  ##
>> +# @cpr-exec:
>> +#
>> +# Restart qemu by directly exec'ing @argv[0], replacing the qemu process.
>> +# The PID remains the same.  Must be called after cpr-save restart.
>> +#
>> +# @argv[0] should be the path of a new qemu binary, or a prefix command that
>> +# in turn exec's the new qemu binary.  The arguments must match those used
>> +# to initially start qemu, plus the -S option so new qemu starts in a paused
>> +# state.
>> +#
>> +# @argv: arguments to be passed to exec().
>> +#
>> +# Since: 7.1
>> +##
>> +{ 'command': 'cpr-exec',
>> +  'data': { 'argv': [ 'str' ] } }
>> +
>> +##
>>  # @cpr-load:
>>  #
>>  # Load a virtual machine from the checkpoint file @filename that was created
>> diff --git a/qemu-options.hx b/qemu-options.hx
>> index 6e51c33..1b49360 100644
>> --- a/qemu-options.hx
>> +++ b/qemu-options.hx
>> @@ -4484,7 +4484,7 @@ SRST
>>  ERST
>>  
>>  DEF("cpr-enable", HAS_ARG, QEMU_OPTION_cpr_enable, \
>> -    "-cpr-enable reboot    enable the cpr mode\n",
>> +    "-cpr-enable reboot|restart    enable the cpr mode\n",
>>      QEMU_ARCH_ALL)
>>  SRST
>>  ``-cpr-enable reboot``
>> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
>> index 822c424..412cc80 100644
>> --- a/softmmu/physmem.c
>> +++ b/softmmu/physmem.c
>> @@ -44,6 +44,7 @@
>>  #include "qemu/qemu-print.h"
>>  #include "qemu/log.h"
>>  #include "qemu/memalign.h"
>> +#include "qemu/memfd.h"
>>  #include "exec/memory.h"
>>  #include "exec/ioport.h"
>>  #include "sysemu/dma.h"
>> @@ -1962,6 +1963,40 @@ static void dirty_memory_extend(ram_addr_t old_ram_size,
>>      }
>>  }
>>  
>> +static bool memory_region_is_backend(MemoryRegion *mr)
>> +{
>> +    return !!object_dynamic_cast(mr->parent_obj.parent, TYPE_MEMORY_BACKEND);
>> +}
> 
> Maybe or mr->owner is more readable?

Maybe OBJECT(mr)->parent.

mr->owner is not always the same as mr->parent_obj.parent.

- Steve

>> +
>> +static void *qemu_anon_memfd_alloc(RAMBlock *rb, size_t maxlen, Error **errp)
>> +{
>> +    size_t len, align;
>> +    void *addr;
>> +    struct MemoryRegion *mr = rb->mr;
>> +    const char *name = memory_region_name(mr);
>> +    int mfd = cpr_find_memfd(name, &len, &maxlen, &align);
>> +
>> +    if (mfd >= 0) {
>> +        rb->used_length = len;
>> +        rb->max_length = maxlen;
>> +        mr->align = align;
>> +    } else {
>> +        len = rb->used_length;
>> +        maxlen = rb->max_length;
>> +        mr->align = QEMU_VMALLOC_ALIGN;
>> +        mfd = qemu_memfd_create(name, maxlen + mr->align, 0, 0, 0, errp);
>> +        if (mfd < 0) {
>> +            return NULL;
>> +        }
>> +        cpr_save_memfd(name, mfd, len, maxlen, mr->align);
>> +    }
>> +    rb->flags |= RAM_SHARED;
>> +    qemu_set_cloexec(mfd);
>> +    addr = file_ram_alloc(rb, maxlen, mfd, false, false, 0, errp);
>> +    trace_anon_memfd_alloc(name, maxlen, addr, mfd);
>> +    return addr;
>> +}
>> +
>>  static void ram_block_add(RAMBlock *new_block, Error **errp)
>>  {
>>      const bool noreserve = qemu_ram_is_noreserve(new_block);
>> @@ -1986,6 +2021,14 @@ static void ram_block_add(RAMBlock *new_block, Error **errp)
>>                  qemu_mutex_unlock_ramlist();
>>                  return;
>>              }
>> +        } else if (cpr_enabled(CPR_MODE_RESTART) &&
>> +                   !memory_region_is_backend(new_block->mr)) {
>> +            new_block->host = qemu_anon_memfd_alloc(new_block,
>> +                                                    new_block->max_length,
>> +                                                    errp);
>> +            if (!new_block->host) {
>> +                return;
>> +            }
>>          } else {
>>              new_block->host = qemu_anon_ram_alloc(new_block->max_length,
>>                                                    &new_block->mr->align,
>> @@ -1997,8 +2040,8 @@ static void ram_block_add(RAMBlock *new_block, Error **errp)
>>                  qemu_mutex_unlock_ramlist();
>>                  return;
>>              }
>> -            memory_try_enable_merging(new_block->host, new_block->max_length);
>>          }
>> +        memory_try_enable_merging(new_block->host, new_block->max_length);
>>      }
>>  
>>      new_ram_size = MAX(old_ram_size,
>> @@ -2231,6 +2274,7 @@ void qemu_ram_free(RAMBlock *block)
>>      }
>>  
>>      qemu_mutex_lock_ramlist();
>> +    cpr_delete_memfd(memory_region_name(block->mr));
>>      QLIST_REMOVE_RCU(block, next);
>>      ram_list.mru_block = NULL;
>>      /* Write list before version */
>> diff --git a/trace-events b/trace-events
>> index bc71006..07369bb 100644
>> --- a/trace-events
>> +++ b/trace-events
>> @@ -45,6 +45,7 @@ ram_block_discard_range(const char *rbname, void *hva, size_t length, bool need_
>>  # accel/tcg/cputlb.c
>>  memory_notdirty_write_access(uint64_t vaddr, uint64_t ram_addr, unsigned size) "0x%" PRIx64 " ram_addr 0x%" PRIx64 " size %u"
>>  memory_notdirty_set_dirty(uint64_t vaddr) "0x%" PRIx64
>> +anon_memfd_alloc(const char *name, size_t size, void *ptr, int fd) "%s size %zu ptr %p fd %d"
>>  
>>  # gdbstub.c
>>  gdbstub_op_start(const char *device) "Starting gdbstub using device %s"

