Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5DC5421883
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 22:39:13 +0200 (CEST)
Received: from localhost ([::1]:39502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXUjv-00048b-FL
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 16:39:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mXUiY-00039T-GL
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 16:37:46 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:33450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mXUiW-0002eM-5W
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 16:37:46 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 194JRrRs023925; 
 Mon, 4 Oct 2021 20:37:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=RCb+OLuay2YjffGpvLRNxbYrn02eiUsdwoxWMLVuhtY=;
 b=lKv7DlD1cm9ALdQJ5JOwBsGozAPQkPKwNAgcAT4qdjBcdtG4Zfw3wdYU1YkGR0Yu4RWf
 A1qPoQ86IBsu149bn5FqNdnOqQ51agXFn48y0I4e5ME1PerQ0l1ovgk6dPbn46Y3G3bL
 oU0JCRXoPKIsPVYWYLFA704evyEqpTtGqauRb13o8gTzLUTPvAqTWuTrZKOeSes9g51N
 KJx39KnGUsQLZpS1x0G4ioiPcW3Sm0T/SZHnS3zx9/GPUN882kf31D/RzLJfr8Em77IB
 IYPJJTSZ2hJuLt7dOvukLI0eJwnJv2LzXTnk7xT3DjT1hKV10XwyvUna3kBjP6sNM8Fn Bg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bg43gj9j2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 04 Oct 2021 20:37:39 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 194KUblA041730;
 Mon, 4 Oct 2021 20:37:38 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2170.outbound.protection.outlook.com [104.47.57.170])
 by userp3030.oracle.com with ESMTP id 3bf0s5ey33-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 04 Oct 2021 20:37:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OjEvnJxUuRXzy+MlWaQxUejk0MiUnzv+cUE0GyUBDPssQ4qyhazB6Zbd0+JuGIfAKaTC4NTgSHOMHMiDatkHMgQc7dvQWjdBHeWxY45a/ByySSebqcL7g64Wtli82T1UdgvvJl3kWtSS/2SfoW7SkXJwEEOWUdybJZUegm0E/bf+vvJawCMLvRlhp7xRj3B1F7b94kBnz+rHP5uTADvA0S5VUOueCXCCdVZ4s5NaZPsR3lzM0YZRUURqjMZPfHRx8tbTThhJOwjtR8ftSligcjkaaXNKkkhbNBoABCyvBZQJ5K9QVYxWlLff0BZi51KcbZCLJR1tBfmsC67X5UYg3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RCb+OLuay2YjffGpvLRNxbYrn02eiUsdwoxWMLVuhtY=;
 b=nbzD9B0xKaY1kxrQzRANsCRR/hKwNWnm4YQL8q5z5dEFxyHo7SenJvZto5iPStc2gA4Es8Um6OfOJfInsCjZFaegHOxKseIHVzRl0Je63KgdjyKRwAYRxf5ENcuZwt2QatySE+MQCio5jMDQ9zLZSc7kDi+xkea49+d912HfDQ/LNCabo70l7QPpJTykht017xKZSqhGh0va8m4/LP15dM9l1+3LfD77cOxxA7uL9CWDkYmLNl8Avveu3n+s6D0G2NI/1k4Zzd3YX7YeFZ6QFHLo0BZ9/1DeGXiCsPSn8CiCYe0FyGIWkMvA21nLxClzbHStvAHA88DfTaU+IOJgBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RCb+OLuay2YjffGpvLRNxbYrn02eiUsdwoxWMLVuhtY=;
 b=USZDBhF07TuGN/IPkAKNLdRkdorRqE4/tLmRe/oe5ynJree7NnvYss9xwksPvQ8s2ki8Yaj9kRfvhzjnsB6z/44aYZLS4pA0eDMLplxYyXMHQs8lP5MeQ0719BqjW6OsOskoIq5tgwkGQuh+L8xaWJQwt4IzaaFOkE1kACPEhYU=
Authentication-Results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by MWHPR1001MB2110.namprd10.prod.outlook.com (2603:10b6:301:35::34)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14; Mon, 4 Oct
 2021 20:37:36 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::90ef:e061:a4c2:acd6]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::90ef:e061:a4c2:acd6%7]) with mapi id 15.20.4566.022; Mon, 4 Oct 2021
 20:37:36 +0000
Subject: Re: [PATCH v6 01/10] ACPI ERST: bios-tables-test.c steps 1 and 2
To: Igor Mammedov <imammedo@redhat.com>
References: <1628202639-16361-1-git-send-email-eric.devolder@oracle.com>
 <1628202639-16361-2-git-send-email-eric.devolder@oracle.com>
 <20210920150507.17110ed1@redhat.com>
From: Eric DeVolder <eric.devolder@oracle.com>
Message-ID: <04de2ac5-3b6f-6340-0d47-1635ebf66eb2@oracle.com>
Date: Mon, 4 Oct 2021 15:37:32 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210920150507.17110ed1@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN4PR0201CA0063.namprd02.prod.outlook.com
 (2603:10b6:803:20::25) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
Received: from [IPv6:2606:b400:414:8061:221:28ff:fea5:27c8]
 (2606:b400:8024:1010::112a) by SN4PR0201CA0063.namprd02.prod.outlook.com
 (2603:10b6:803:20::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15 via Frontend
 Transport; Mon, 4 Oct 2021 20:37:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4d64d200-2166-4eba-ecc0-08d98776cc94
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2110:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR1001MB2110F14AC799E76E4441BDCB97AE9@MWHPR1001MB2110.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2201;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eLvgqFLcRpRl9GhCNGJp602pOuupPtzqTnXafGLiB9tymD5d+ekS3n5tKWySNr4w2EeFMpG0omLXbNWIE+2L4PrrLXGjiqvPy0vS6myzs7yyONLJGf42UQrejjD1WL7WSnsGaQpW6pb3m2kDFrS3R4BYWKHemZ7bz+fwywBGl6qzIA4x/yeB3xCHiVGbvtFVgvdGV+6r9xclJ55Z7uZD1wiIhoiKM9wrh0Jk+PdSn/CotUX0S3md7js/Sc1R4JGgd8Kmcg9sNQyqbx6lxCIJy+bC+kyG5tXn1fkPQO9lEjc2fUWyKhoICGhz+aEqSaN1ocioeRo9MX0Ci1JxiUF0haTEpVsl6pd52i4iDP+mmJ5HMLYH4YZvKIJ5YqSH7lMJjeRYkDBt773OM66E0D9rCQtrTCWBvh2U1nnRckBIDBpc15of8Z3HB5CH5va6QATp+B6BVdRmx7tXp0sFiwHwnYhI+F3T1yDzuhyNmk/3EihL71vGmCeJqUN6leUeK3g78SEQM7NrYBQDy8yDS8raxpaczx09F+qStHNZEb6u9TbQ5cR/Ewajnd3XRt5gFsjd7B5AwpnG0dqdv9JEp+U/KSATBQyhV3VnWP0MfmmcbRWZ3haNbZAdsNLuA2wZW/wKuOfSOJ7lm0vY/2gswWvOCML78hUGCwEhqUX6zzLhcbmsxq4rZCzNYamqJ7IcSp5zWYRAy773mZXxgeZXFauhe3YIinOi2nQAexonbwOey84=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(107886003)(2906002)(86362001)(8936002)(8676002)(2616005)(316002)(508600001)(6916009)(4326008)(38100700002)(31686004)(53546011)(6486002)(186003)(66556008)(66946007)(31696002)(36756003)(66476007)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UzNiVVRZenhWZ3hCbjRpMjQ0TVU1bDJiQmtqeUNaL21PTHB1VmZ1c1ZHcEpQ?=
 =?utf-8?B?UlAzSGhWQnVJMFNTRGhMQVVZQWFSNGthdkdzdVBaSEM2RmthMVJxVkZDQXRM?=
 =?utf-8?B?WVhZTVp4Yks2enJBUEgxQ0ZhQkRlR0VwSDJnQWhoU3MveEEycmtHSys3cjgz?=
 =?utf-8?B?eURzN2Y3TnM0cEcrSjhGZnp3YXdUMGFtTXVTQjZ4Y0lNbEE2TEMvbC9lVmV4?=
 =?utf-8?B?aW9yNC91RkhzR0gweTdiT0ovdmJmM1pycnIvUkt1NDl1SjJYSnFrL2pUV0M0?=
 =?utf-8?B?RHBxejJVZjlkd0F1VHNYZXNTampmWjkrNE1ueitqdStwalZTeDdBYUtuQ0F2?=
 =?utf-8?B?cVhjdFcwbDFJWjRjOU8reUNKc3VtY1NES0tSL1NuTU1ZQnUyNTBrVXdET1B2?=
 =?utf-8?B?ZmZIYWJRRFd2NXdwaTJTeE8zOHl6Q2IrM1ZUQU41d3M1dnFDVmxIRUNxa29W?=
 =?utf-8?B?cm16clYvWjdZRFQvSW53RHZ0bDJDNXc3UWRkMHpzSk1TZ29ScjNRZldRU1M1?=
 =?utf-8?B?aTZydkh5NzVId2ZFL2lINTU4elV6ZDNkT2dla3U0dDVNNzBLaHB6RGxpNWRD?=
 =?utf-8?B?K0dvSUp2RlM0MHlsMEpLSUhXQXR5VTJ6QVZHMGRXc0ZzL2UxeHpxNTVLK09a?=
 =?utf-8?B?NVB2REZUVXU2eVZvU0Y0TStQS3p0YjFGRC85OU9PUkhJOHJhMmRRM2RWL2RL?=
 =?utf-8?B?QlROWnNDQk90Zkt2RXhMb0l5aVdJSTd2TGtkRSt2K1VLSlpKL2owQzBlNDBh?=
 =?utf-8?B?d3FYM09yQzNnclNwWUMrWUJOVnk5VHBvVUJNMjJXUU8vdVVrakdIWVRvY3dX?=
 =?utf-8?B?eWE2QU40d3Ayd1JOVnQ3MHlpb0tlVWhVVzVSN1hXS3BHSVJHb0tkOHVqR0ZJ?=
 =?utf-8?B?ZDQ1N1A0Umd2aVU2VEZBeVI4RS95QnBGeE5sRXphYXU3c0NkQ1ZzTVJSSnVH?=
 =?utf-8?B?Mk1UaDUxQWUyRDVRKzRPd010V2dxZUhVRzIybzFoWCs1ZktXQjFLTjRYRnlS?=
 =?utf-8?B?MFhtWkRxcjVNRGNIM2x0eEpCS0Z0ZGFRcTFWbERrbDFQMzFkZXE3Qnk1Wlo5?=
 =?utf-8?B?aTdnRUZLeEdJR08xOFlJb1VMZWQyaE9FQkN2NWdrZGMxeG1tbVIydzdqbGRx?=
 =?utf-8?B?S083bUt6WENrYWhFM09KTVRUZjRYMWFyVDhMelBybGtEV0ZsZ2pPb1pyeXQ0?=
 =?utf-8?B?Vmw1a2IxRzdaQzlIb3J3ZUlqcnZHNEpycnU3WDU1VGxNTDlJZk9lZlBHUEt6?=
 =?utf-8?B?VHd2ZWFCQ0hEd2Qycnh4YnRTS3cvMSttRVk2VmhXK3pTb1lWTXdIbVRIWVIy?=
 =?utf-8?B?Zk5mR1MzdHdYOHZ2enVIUEhpZlRkSFlCdXQ4SHI4SDBBc3hPaG1XaGpCdjhC?=
 =?utf-8?B?QnB5VkQ4Vkpxd3JGTDF5aDYyRHdHVEdEVFNJc0dqbWdLZnlLejBKQVAxVUty?=
 =?utf-8?B?UHllekhCdHZ4SFErUy85NkdUTENrTW1nSmtFcXUrMUp1UDB0Yk4wY1FJZzMy?=
 =?utf-8?B?MGpKS0FNYi9LaGY0NUpRRGJYbVVhbkcxNThtNUtnKzZDcHJxdUxYa1B6TE9v?=
 =?utf-8?B?WXNYMjRQMElXbkozbE5DSFFHR1laOTFBbk1JQmFtcElmRzEvWDRKeVFKNnlY?=
 =?utf-8?B?R3luVWxqNk85ZHFVR3RsTG44YTN2YnVEUlVIeTFZcXIyUkdMS2tjbmU5QlF3?=
 =?utf-8?B?L25Dc1g4VktTRUtKZ2tXc2RwMTJWMkttZXBidG52UFdiK3JzdEIyTnJvOXV2?=
 =?utf-8?B?OXVVSmNpNXk3aUFOK092Y0R4OVdVMGFhRlQ2RXJOSldUY3R4RFFXWW5xdlpT?=
 =?utf-8?B?MU9ORVlWQXh1cm5DTkNydz09?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d64d200-2166-4eba-ecc0-08d98776cc94
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2021 20:37:36.0745 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E7dbAmKCkhLXE6pIQ0ovFXPoPMT/vZiCGm3zq4CUtQfdb6cxR8kzgZRLW3pjMgmCIk01jNkv2yZaTZoo2ftniJSE7rBged3cXEVKhR72mCc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1001MB2110
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10127
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 suspectscore=0 adultscore=0
 mlxscore=0 phishscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110040138
X-Proofpoint-GUID: jyKrb22XTTme49zpdkx5ZjvhObsbVf07
X-Proofpoint-ORIG-GUID: jyKrb22XTTme49zpdkx5ZjvhObsbVf07
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: ehabkost@redhat.com, mst@redhat.com, konrad.wilk@oracle.com,
 qemu-devel@nongnu.org, pbonzini@redhat.com, boris.ostrovsky@oracle.com,
 rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 9/20/21 8:05 AM, Igor Mammedov wrote:
> On Thu,  5 Aug 2021 18:30:30 -0400
> Eric DeVolder <eric.devolder@oracle.com> wrote:
> 
>> Following the guidelines in tests/qtest/bios-tables-test.c, this
>> change adds empty placeholder files per step 1 for the new ERST
>> table, and excludes resulting changed files in bios-tables-test-allowed-diff.h
>> per step 2.
>>
> 
> I'd move this right before 10/10

done

> 
>> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
> 
> Acked-by: Igor Mammedov <imammedo@redhat.com>
> 
> 
>> ---
>>   tests/data/acpi/microvm/ERST                | 0
>>   tests/data/acpi/pc/ERST                     | 0
>>   tests/data/acpi/q35/ERST                    | 0
>>   tests/qtest/bios-tables-test-allowed-diff.h | 6 ++++++
>>   4 files changed, 6 insertions(+)
>>   create mode 100644 tests/data/acpi/microvm/ERST
>>   create mode 100644 tests/data/acpi/pc/ERST
>>   create mode 100644 tests/data/acpi/q35/ERST
>>
>> diff --git a/tests/data/acpi/microvm/ERST b/tests/data/acpi/microvm/ERST
>> new file mode 100644
>> index 0000000..e69de29
>> diff --git a/tests/data/acpi/pc/ERST b/tests/data/acpi/pc/ERST
>> new file mode 100644
>> index 0000000..e69de29
>> diff --git a/tests/data/acpi/q35/ERST b/tests/data/acpi/q35/ERST
>> new file mode 100644
>> index 0000000..e69de29
>> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
>> index dfb8523..b3aaf76 100644
>> --- a/tests/qtest/bios-tables-test-allowed-diff.h
>> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
>> @@ -1 +1,7 @@
>>   /* List of comma-separated changed AML files to ignore */
>> +"tests/data/acpi/pc/ERST",
>> +"tests/data/acpi/q35/ERST",
>> +"tests/data/acpi/microvm/ERST",
>> +"tests/data/acpi/pc/DSDT",
>> +"tests/data/acpi/q35/DSDT",
>> +"tests/data/acpi/microvm/DSDT",
> 

