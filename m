Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C143A4996
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 21:46:36 +0200 (CEST)
Received: from localhost ([::1]:35594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrn6x-0001Uc-TH
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 15:46:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1lrn4Z-0007h1-VH
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 15:44:07 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:13160)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1lrn4W-0003BN-PG
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 15:44:07 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15BJau0U022653; Fri, 11 Jun 2021 19:44:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : from : to :
 cc : references : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=77NAEH1eQql1v+ZXQMwYDVDEnFNxFNpp52TUifXIX+c=;
 b=RDKb0ltzE10e3Gx5rV5p/mRNW2Wdd1K4+MdWuSfwXohewLNHM6lAs0Itn9nCgrWNTkEy
 39hv3ESpoT7x0eHu6Qrvz7WAamlUGoPHHsfAaS6eUTMo5c8uJ8UoAYhiB3akkqbToSTG
 AsfLvNGIpRNmXJIwSoRdJQuwbvHhIMtvn6ea8KEyKglda6a7iQR7LRkmpQDtaNfZMuI5
 4o+xmMdvdrQTIsyGa41tbP+3Dg3Fe8QFg0bebo5VGwJuZF8/r1+ecfwMqm0IfF3Cyu1m
 4s04y2omCmZIz3h3daSxpxonQ1uiZuiH/TG8YnTkvAX96UBeoY5MKwQ+oVoFXLgonDPY bQ== 
Received: from oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3944hn0679-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 11 Jun 2021 19:43:59 +0000
Received: from userp3030.oracle.com (userp3030.oracle.com [127.0.0.1])
 by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 15BJhwmh149579;
 Fri, 11 Jun 2021 19:43:58 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2108.outbound.protection.outlook.com [104.47.58.108])
 by userp3030.oracle.com with ESMTP id 3949cw9tva-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 11 Jun 2021 19:43:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DNbvedvBs3mSzaE+gQo6VsoYbHKoAwHO7AXEdWR40kHcVgIYzNv1hGHEChtFrGKU8sCaDNzJg+LqXB9ovBYvH0NwIKKf3gXrEu2gVWqpBoTyr5j48AmoLhuC4Q8nC5zVQsxRpoFU7fA0G546ldwpzenK9gfgZk9PSdM8uanH4rdsREhBO3Tn6KxfQ61k0iuIdyDENVl2tBHBvAeUarAhibLaj6O4iTz2NMcZUtjsbEKQe7kFkSRPvezmaH74CMyFo87LVMIelM28Ibo6Uk6tGCySTQcjKZh8+btMfn1Va8aieaXb0k7ueD/uew2IDIcp8pFWof/QZSfrjhV/UcyCqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=77NAEH1eQql1v+ZXQMwYDVDEnFNxFNpp52TUifXIX+c=;
 b=hSNELCHm8JiWtcfQcwSdu2T25aJwpAuh7qB/8fra9SJYpUK+gu9OMPSVoTVSDfYAuUK3VDn6w39PfJcBhAKqLBtxzctsjzCqr0uFQmRxvtvax1n898a2MPNTuAP0gjsJGNw/Ojdl/CxqWr/7uwdJM9/M8kNaMllnA+aIeWyUueLdmu48ijUnOVBrVNYW6OIA+RNQEo56DznaAL2aHkViS4u0zxJgEWhFO/VKtW7igTkHEX/vUiK0Xp7P9sLOwdNLd8L1ZgQfFg3i9EUiWkDir5dwj8kYYeW1kY0uE6yI7FJ6jV3/VWl8+GeuoUysJrnAXncUSg6JUZ3YeOkwRvAc0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=77NAEH1eQql1v+ZXQMwYDVDEnFNxFNpp52TUifXIX+c=;
 b=BDpxrYLfFyDx5JR2Hp3iRFOPsj9EW+7OBwM7H4SfrkXd+W+7Kqc0ym0r3OMlrqS6ScvXFoMrpdzKQGzTjvdqo75I9wtGwzswOyiU4Xq3/Pxrcg8DJdySeEWzTDTb2WFWWZ/PxF6Dxl8UDUuz9tYnJbAfHoxRygkQCWWbfTo+hQ0=
Authentication-Results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BYAPR10MB2599.namprd10.prod.outlook.com (2603:10b6:a02:b2::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.22; Fri, 11 Jun
 2021 19:43:56 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::6ce3:f0a3:c303:f851]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::6ce3:f0a3:c303:f851%7]) with mapi id 15.20.4219.024; Fri, 11 Jun 2021
 19:43:56 +0000
Subject: Re: [PATCH V3 12/22] vfio-pci: cpr part 1
From: Steven Sistare <steven.sistare@oracle.com>
To: Alex Williamson <alex.williamson@redhat.com>
References: <1620390320-301716-1-git-send-email-steven.sistare@oracle.com>
 <1620390320-301716-13-git-send-email-steven.sistare@oracle.com>
 <20210521162444.2ef31f42.alex.williamson@redhat.com>
 <85b5ee22-a6cf-9a64-8086-6db28126d8ba@oracle.com>
 <132153d0-902c-1e3e-99fe-f5ceaa87ed0e@oracle.com>
Organization: Oracle Corporation
Message-ID: <d4737285-00ef-2bc6-361c-4a5e7e5d627c@oracle.com>
Date: Fri, 11 Jun 2021 15:43:51 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <132153d0-902c-1e3e-99fe-f5ceaa87ed0e@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [24.62.106.7]
X-ClientProxiedBy: BL1PR13CA0437.namprd13.prod.outlook.com
 (2603:10b6:208:2c3::22) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.92] (24.62.106.7) by
 BL1PR13CA0437.namprd13.prod.outlook.com (2603:10b6:208:2c3::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.10 via Frontend
 Transport; Fri, 11 Jun 2021 19:43:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d6ffa074-0e0f-4ffe-e6ba-08d92d113fd0
X-MS-TrafficTypeDiagnostic: BYAPR10MB2599:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB25994CFB74D6CC6C60DB78C6F9349@BYAPR10MB2599.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dTTtYDwC3WWgI0w3WDV//ysu61Nx6I3YzX1Kxih4vQoeCLX7N93nqCt3ijnUKq7xtWTa0LZhKLMWjehxwswzB+okunPMf0e68AyXe0fL45qhg1IrbFBROO6YUh1mMeAnQo0+/k68wALx2+Xn9/6ixSgYWdqupnh1W4UTrb4g9mQF7EgP7QVW1YDZuB5UwPImbGPNcJk/lbN2R4YONAkhXH8ix6HruD8aT9CfwtSh/TM4+oKcbKWcPDocjqqw0CSuEJXr5r0FIlAECjuhxJHokCuV4uRt9qZ6HTA4sPS4rBtLL3ftLfEegCexfGSxAstJ6qVdYvLCe8r3edsPnZ5HRDORmwfCbn+I2CD+Sbr+nZxMJ5i4t2jFSuB97L8fnWBMcVf9Uih27Aiaf6bFt0Sk5BOQ/HQqDdKfmDKRYBn+6uPr1WjGpZrx2HXma2nv2g9g6cMZ1ihSJ2Fnvau8HMwbOjyt+iBBUvdFiffqylCh//coaSPOEX9vCcj4i48drvsMtPKGBTQyzF1MJ10ln7/PQ1fDNSIK4fUKuoqiKC1p6UwJ3cl7OjlbCuuWAXlu5eQjau4zLFxagNseDiZe58+Mx0WtPHdYl7yWBi0VDHvdbIyY8ZO7w9+G1CvPtpS0GJryGpbK9VGEy7Dg5bXL8bwJubiUjw672vjV2mZLmT8zEQk1Shlj4kb18+5QXPf+rAVg
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(366004)(39860400002)(396003)(136003)(376002)(4326008)(66476007)(54906003)(36756003)(66556008)(16576012)(2616005)(16526019)(66946007)(186003)(5660300002)(31696002)(956004)(6666004)(6916009)(53546011)(478600001)(8936002)(26005)(36916002)(86362001)(316002)(83380400001)(6486002)(8676002)(2906002)(7416002)(31686004)(44832011)(107886003)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eTBZeFY0cUFjOUp0ZXQ3NnhDNVhyQWpKWlMwdnhFdTV2QWQ4akpPVktlOGNL?=
 =?utf-8?B?eWFtVk9zWkU0V29qUERWQVpUUm1LMWhFeUowQk1pSVJZUDQ1T3hDVVMvV0px?=
 =?utf-8?B?czV5OThFbDJZV1pZUUlwL0F5YW1PeWlQZEhhVkRtZGNVbFAyWDRFMTE2VkVa?=
 =?utf-8?B?NXhIZkt2c2pqeWlmNTE2Wk9LbW1ZVXFrWGpieUxYUFBDVDBWS1RrNkVkWEd2?=
 =?utf-8?B?RmhnWTRNOUUrQkRzNUJJMGx0K29SWkdlejBpbFZDaElQcXNpMDl4RHNuQzhk?=
 =?utf-8?B?cTJYY21odU11NnhkblFNTDVFVkxLWlJjVnBoUEUxckZVMlJXTUhjUmEzT1M5?=
 =?utf-8?B?WEtLWWszb2hGTXN3VTNEalN1UnR5NVhnaFRkMzNuRTg5NGdDM3FPMTFhYmhz?=
 =?utf-8?B?VEptMXpVaDhhVVRyNXdDR2ovTThQcUVGRUEvWXZFL2t0ekIyS09XZnV6RGtz?=
 =?utf-8?B?YVh2bERwT29oM3JCemdNVzZZZ29KcUhLcE1zRW1URkcvWUwrMld4blpGNmsy?=
 =?utf-8?B?UkdJUDIxQnRQYmwwNS9WaUltQ1NydXp0VXJ2WmN4Z1hETW50KytVVE1JRUl4?=
 =?utf-8?B?M0g4UVhjRkZJRU1nRGU1WkFDN1JIQStHMENEZ3ZzWVBGaWM0ak9aU0ZFYTRF?=
 =?utf-8?B?WXZWWDVNS0RVM3Ntd0VGdHJueU5sL2YzRmlCMnllTzV0S3dXN0RzMWx1YzJ0?=
 =?utf-8?B?d1ljanhYd3lJMnZ3ZnFTaHJERzc5cm1PTVBkSUZ3cm1vanlFSXlUSmVwdnVI?=
 =?utf-8?B?THZwV1IzNVQ5dyszZUdCSStJTytDV2U2MlBIdDlRcU1JTUZzTTZ1NFpXMFJ4?=
 =?utf-8?B?L0txb01XdVdVc1FNaUZNWExLSWRWekVjL3o1RHBTQy9uZjZUNmUvNlhnQ2RP?=
 =?utf-8?B?QUJTQTNnaGxLWmcyd0RTYUJJTXBnTTN0b3hrYU52MGZpa0ZGVmx2Nm1tQks4?=
 =?utf-8?B?QnROL2tMWlVBUnhPRmp4L25WT2tkVUdVM3VRSmRwUEZEWVZWRmlqT2dJMHg2?=
 =?utf-8?B?ODRxelQrb291VkxWTVJuMi9FcTBMTHVoM2YrNlJsVWdvR2JKWThwNlRLMkRB?=
 =?utf-8?B?Zkg0TkVYbnBvWnhDWmNTbHNpK2FOSzBISGVOVDBUd0FjZkJ3dVpLYU50QmUv?=
 =?utf-8?B?WHl3S3BESEVxVW9NNFhIMWtBcy81dkNUaWZEMFJET2J6TUJ5a0lJMVMxamc1?=
 =?utf-8?B?TGExRDYrZVJDeXkzR3dRQjhDR3hqWEZVR3l0dFE5TmxSWE1rVW04OWVDQ1pz?=
 =?utf-8?B?aWNyb1lLZjhCRGtLNkVSaTFGRjFPWlgzZC9rWXhGRWVoQkRkUTd4UFBnTTUw?=
 =?utf-8?B?RVBwTExySnhHdWd3MTFwd1ZjditCbUhZc056Tkp5NFg3WDdlMEtFb0s4czlU?=
 =?utf-8?B?WTIxWTdMZDdFVy9GcU1BTWd6SWNEdXVMTWFVdTJLVDYra21JT21DRFhvSFBW?=
 =?utf-8?B?djRFZGlwMXBXVVk0UkhIVGdOeE9MWlY0aTZnSmNRcW5IK05UNDJWWTFveDFY?=
 =?utf-8?B?U1VwNGs0WFFPWVd4QWlkNjVMSk84MllrMjdod21jNXNZSXdkSnlOMmxnV1NW?=
 =?utf-8?B?YmFicU1PSzErdUl6UVJnYkhsMGp3bmZkdGFjZ1c2cGlzUTBjNGN2TkxBMCtS?=
 =?utf-8?B?V0dFbFBWQ3JzV0tOaHVJU09jT2JBeEZSSkNXdG85SHhPRG5pRnNkVEJxRmFa?=
 =?utf-8?B?ZWxWb0I3Wmk4NHYyOVVnQTFNeTBNV1VaNnRoUktWQjgxai8zaUVFZmV5Nkdk?=
 =?utf-8?Q?UC9Efz4jJ2WVGM+pL+kJEcav3YhtFgbWkTfT5XW?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6ffa074-0e0f-4ffe-e6ba-08d92d113fd0
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2021 19:43:56.0583 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pz/yIdHDOfTvD/5wezkL0G1Wo/6GcIChHjw7Byvz018unN0MohRXzR/MW+jddej2O/7fefeOS0AI4/GkE/4nKgYjNKdmwMTSp6ItB2or6Lk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB2599
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10012
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 mlxscore=0 spamscore=0
 adultscore=0 malwarescore=0 phishscore=0 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106110124
X-Proofpoint-ORIG-GUID: _cwJVX3_DGuQ-kbJh6PRPAmtL7xw7trd
X-Proofpoint-GUID: _cwJVX3_DGuQ-kbJh6PRPAmtL7xw7trd
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Eric Blake <eblake@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/11/2021 2:15 PM, Steven Sistare wrote:
> On 5/24/2021 2:29 PM, Steven Sistare wrote:
>> On 5/21/2021 6:24 PM, Alex Williamson wrote:> On Fri,  7 May 2021 05:25:10 -0700
>>> Steve Sistare <steven.sistare@oracle.com> wrote:
>>>
>>>> [...]
>>>> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
>>>> index 7a4fb6c..f7ac9f03 100644
>>>> --- a/hw/vfio/pci.c
>>>> +++ b/hw/vfio/pci.c
>>>> @@ -29,6 +29,8 @@
>>>>  #include "hw/qdev-properties.h"
>>>>  #include "hw/qdev-properties-system.h"
>>>>  #include "migration/vmstate.h"
>>>> +#include "migration/cpr.h"
>>>> +#include "qemu/env.h"
>>>>  #include "qemu/error-report.h"
>>>>  #include "qemu/main-loop.h"
>>>>  #include "qemu/module.h"
>>>> @@ -1612,6 +1614,14 @@ static void vfio_mmap_set_enabled(VFIOPCIDevice *vdev, bool enabled)
>>>>      }
>>>>  }
>>>>  
>>>> +static void vfio_config_sync(VFIOPCIDevice *vdev, uint32_t offset, size_t len)
>>>> +{
>>>> +    if (pread(vdev->vbasedev.fd, vdev->pdev.config + offset, len,
>>>> +          vdev->config_offset + offset) != len) {
>>>> +        error_report("vfio_config_sync pread failed");
>>>> +    }
>>>> +}
>>>> +
>>>>  static void vfio_bar_prepare(VFIOPCIDevice *vdev, int nr)
>>>>  {
>>>>      VFIOBAR *bar = &vdev->bars[nr];
>>>> @@ -1652,6 +1662,7 @@ static void vfio_bars_prepare(VFIOPCIDevice *vdev)
>>>>  static void vfio_bar_register(VFIOPCIDevice *vdev, int nr)
>>>>  {
>>>>      VFIOBAR *bar = &vdev->bars[nr];
>>>> +    PCIDevice *pdev = &vdev->pdev;
>>>>      char *name;
>>>>  
>>>>      if (!bar->size) {
>>>> @@ -1672,7 +1683,10 @@ static void vfio_bar_register(VFIOPCIDevice *vdev, int nr)
>>>>          }
>>>>      }
>>>>  
>>>> -    pci_register_bar(&vdev->pdev, nr, bar->type, bar->mr);
>>>> +    pci_register_bar(pdev, nr, bar->type, bar->mr);
>>>> +    if (pdev->reused) {
>>>> +        vfio_config_sync(vdev, pci_bar(pdev, nr), 8);
>>>
>>> Assuming 64-bit BARs?  This might be the first case where we actually
>>> rely on the kernel BAR values, IIRC we usually use QEMU's emulation.
>>
>> No asssumptions.  vfio_config_sync() preads a piece of config space using a single 
>> system call, copying directly to the qemu buffer, not looking at words or calling any
>> action functions.
>>
>> [...] 
>>>> @@ -3098,6 +3115,11 @@ static void vfio_realize(PCIDevice *pdev, Error **errp)
>>>>      vfio_register_req_notifier(vdev);
>>>>      vfio_setup_resetfn_quirk(vdev);
>>>>  
>>>> +    vfio_config_sync(vdev, pdev->msix_cap + PCI_MSIX_FLAGS, 2);
>>>> +    if (pdev->reused) {
>>>> +        pci_update_mappings(pdev);
>>>> +    }
>>>> +
>>>
>>> Are the msix flag sync and mapping update related?  They seem
>>> independent to me.  A blank line and comment would be helpful.
>>
>> OK.
>>
>>> I expect we'd need to call msix_enabled() somewhere for the msix flag
>>> sync to be effective.
>>
>> Yes, vfio_pci_post_load in cpr part 2 calls msix_enabled.
>>
>>> Is there an assumption here of msi-x only support or is it not needed
>>> for msi or intx?
>>
>> The code supports msi-x and msi.  However, I should only be sync'ing PCI_MSIX_FLAGS
>> if pdev->cap_present & QEMU_PCI_CAP_MSIX.  And, I am missing a sync for PCI_MSI_FLAGS.
>> I'll fix that.
> 
> Hi Alex, FYI, I am making more changes here.  The calls to vfio_config_sync fix pdev->config[]
> words that are initialized during vfio_realize(), by pread'ing from the live kernel config.
> However, it makes more sense to suppress the undesired re-initialization, rather than undo
> the damage later.  Thus I will add a few more 'if (!pdev->reused)' guards in msix and pci bar
> init functions, and delete vfio_config_sync.
> 
> Most of the config is preserved in the kernel across restart.  However, the bits that are
> purely emulated (indicated by the emulated_config_bits mask) may be rejected when they 
> are written through to the kernel, and thus are currently lost on restart.  I need to save 
> pdev->config[] in the vmstate file, and in vfio_pci_post_load, merge it with the kernel 
> config using emulated_config_bits.
> 
> Sound sane?

Furthermore, there is no need to check reused and suppress initialization of msix and pci bar, 
as the vmstate loader fixes them up.

- Steve

