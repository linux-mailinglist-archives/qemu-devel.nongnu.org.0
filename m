Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A5E421944
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 23:28:44 +0200 (CEST)
Received: from localhost ([::1]:59240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXVVr-00075K-58
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 17:28:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mXVHW-0000SA-RL
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 17:13:54 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:60634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mXVHU-0005kU-NC
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 17:13:54 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 194KaxD1019244; 
 Mon, 4 Oct 2021 21:13:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=IKUraiCuBqL2FBXaX5r8uoVNicDcev+aYVU/vXtJ4iQ=;
 b=hYZVMJ9/Ml2bZZ+aHPeaWycYSb6d1SgH5F/p0o5WgNSHynFNscFS5iSyILQ2aTqyXRWc
 B+gWGQsNvXLHbkSb77XNx5N8as8DZTB/sudAzBYk76z3xQCwhEQPyeO5kV6mNvz2ukga
 qFrZaCcDJzwXfAjYwh/DjVBEqLRckifpHSRHr4ZKG44XOOzKgbJZCoIg9wOKka5sbM8S
 xOCnujLWikEZN12uk3I53x/87VOPLrBO3ee/wrdl+TEt0BVJfqExVf4hcRqSu4wqz0a8
 RbrI1ggA9Z+8jvVlbCnj5NuUauCKAvUvVvyizRLwcfzDxWrifWfK6G2El/zOuHv1k4fr Iw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bg3p5b11r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 04 Oct 2021 21:13:48 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 194L4c4D039796;
 Mon, 4 Oct 2021 21:13:47 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2102.outbound.protection.outlook.com [104.47.55.102])
 by userp3020.oracle.com with ESMTP id 3bf16s1npj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 04 Oct 2021 21:13:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZvoFA1Sq7F+y23O+hTwxypX8u8Q2SleI5ssLDWhPJeg+/v/scCrsoen2Lp4aU78uik4BkQKExfd8ZG2RfD4G7Zm8QDo7fSpGPs53QQl1ao+i57OAnMrvvrvK2DQgA0wQxdYhzYF7YbMXNeXmG2YUS1nJ8FBV7Q2Yx6Iflny1Xx2QPQi6bhkIF1QBtRoRds420pi0aSkQQoQN5y9FqkBzZlNqdKmk5I/zArGP9aSIQayignSJ9o7wkBeFkcpOvKybUCGAdGsdK1BjPem746T6BAsEF9r9smPKsUu7wks7GQ9mSZjFG3qQrL8/j/yEnY3jSo/dphz+N2uH6s0NKK2imA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IKUraiCuBqL2FBXaX5r8uoVNicDcev+aYVU/vXtJ4iQ=;
 b=c37aEvlQ4GK6L7SFstOVMgixF97tHc9pZ8a2jljAdZHs8lHF333PNhqoQt2GZ3MugEQOw3OLqzpY5YdTmtP3kJT13efaB1BjdqXYkqJol+2/a93yOx2N+udvrVyKoz1IAFilzPDnrN/sSZkA2Uj5NQTZXJAioWsFIh0jXWfK+Lw8rgkmGhz8H++xGREtGXLviOC6Q9eUGtTAGW7ykIY9C0S3NEN5Ko+s9T47+r5H1vH1YuQDUQNjGHsoDLaf7XtRYKa7Dxvb5vUdLE/ersr4c98zvYXMBVkq3rsWSqMN9DJUxhEsgRxBpckYczQC6P9XqPySnANXFlMAoXljv7Kx/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IKUraiCuBqL2FBXaX5r8uoVNicDcev+aYVU/vXtJ4iQ=;
 b=oXNl54NGGx5g5J4zJz6T1wOnqb0oDlN0DzYM4aOTIt4dfEnU+SfcD+1zSfAUAjkiSou3rI/lNB1JGqQcU910px0zvEDTpSQO9eVHIUMmPcTmPaYSmVnhhdMeCTahz53IS7CroSPR1KH7y7APKRNOCJoGdBJsouqNUCeH+2/19jA=
Authentication-Results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by CO1PR10MB4401.namprd10.prod.outlook.com (2603:10b6:303:6d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.17; Mon, 4 Oct
 2021 21:13:44 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::90ef:e061:a4c2:acd6]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::90ef:e061:a4c2:acd6%7]) with mapi id 15.20.4566.022; Mon, 4 Oct 2021
 21:13:44 +0000
Subject: Re: [PATCH v6 09/10] ACPI ERST: bios-tables-test testcase
To: Igor Mammedov <imammedo@redhat.com>
References: <1628202639-16361-1-git-send-email-eric.devolder@oracle.com>
 <1628202639-16361-10-git-send-email-eric.devolder@oracle.com>
 <20210921133202.28e05608@redhat.com>
From: Eric DeVolder <eric.devolder@oracle.com>
Message-ID: <87e17395-ac50-4743-27ca-951bc8e935e9@oracle.com>
Date: Mon, 4 Oct 2021 16:13:41 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210921133202.28e05608@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7PR04CA0091.namprd04.prod.outlook.com
 (2603:10b6:806:122::6) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
Received: from [IPv6:2606:b400:414:8061:221:28ff:fea5:27c8]
 (2606:b400:8024:1010::112a) by SN7PR04CA0091.namprd04.prod.outlook.com
 (2603:10b6:806:122::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.22 via Frontend
 Transport; Mon, 4 Oct 2021 21:13:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 47614729-7404-40b2-9c4e-08d9877bd914
X-MS-TrafficTypeDiagnostic: CO1PR10MB4401:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO1PR10MB4401ADEA17D0405989ED37C897AE9@CO1PR10MB4401.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1923;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZqrOcOMsdQG0Fw3wOfPaL8+f/2piZRv1M0Kkm4G/KskpOCA80PqEgXvJ0Y2zTLVbhGdiKqf92T6ArP0qPXTXKcBQUMUWKmQioK9WvubNycw7g+VFH1rx3T3J7WnC3fLZZxdOAx6CXeLELmysp7oT6qUKjpZkQ2tL01z8ttL0Yshqtv4oEaNkQM1pFdYozjOVcwPuAOKfU60ncrYVZoOY7hufSXbcOK7HuJeTxQ5skt2+SuC0w7w6uGrSjIT8NrvQaJ9kxQif03xqg/EQeSj7liBK4GV180t90j54RPHOJNn6FDJFNYzjMC72wBaObueI6n5g+0qR0vUFYZTkT/+CMc9AvYx9XCz8Za724pfZnJSd9q/Q04/JEv/3WM1/8W1g6bDSp1pBhd4MUhd55vHUzOLpwzjJ4ZYIRqAx1RZUnZxmzpDWshpGKNiOzrz7ENBm7J8M9IVol3HOAMcqebr5rY5c1uNWitTkvYC7DpaKjd3kSpqM0AvXIpzj+7VneAE/2vC/ALJ0BFopP1pZ+uXseMa1ZjP/sg24zK3l2lYdvSo06vzudWhr6PyFlTGUny5MmOcZ3rK8Evjrv75Ny+jS10x+40oGanxyTEsxF8mhlGH+TwxVT+jLQf8EC2+rqV/cQYwEXWgHpwrdTXas5jUED2+ocA5m2yTZBXfJ3ISPin1PH6gJhzD9rPG/zsDUfyfww3ymexQKzxKOC/8oaycuFJyfDbMNkl9FlU7ihiJIYUs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(53546011)(36756003)(4326008)(6916009)(6486002)(316002)(31686004)(38100700002)(86362001)(66946007)(8676002)(107886003)(186003)(66556008)(66476007)(508600001)(5660300002)(8936002)(2906002)(2616005)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WTlsMmxFVlJyL3czN3NJaElJTFJsZzViZnVWV01YOGpFQlhhdXhuL005TnVK?=
 =?utf-8?B?VDVaY2tTa3VOT1pRUFlGNFV6VlFXTTQyUWxKK005SmpldWQyMFpUd0J2dXV5?=
 =?utf-8?B?OVNXN1FTK3pHN1BjQzNNeGwvcFE5OWsvRUZ5dDhSbmtiY0srMDNHNUJiMXA4?=
 =?utf-8?B?N1VwcmJPMlNid2J5S2tMSDNEd1AvTVhKblJWU3htNyt1ZHJ4bmZ4T3JETEpJ?=
 =?utf-8?B?REtib3pobzR4YmRtZm1xSW5MQUhLeWNuL2lEVDcrQkVYNmJjVlVhampHT29z?=
 =?utf-8?B?YkRSN2Ura0JieEN4c2hrNFRnYzFkQ0xwYXR2VWFFNy9VNEc4Szhrc3NZSC9j?=
 =?utf-8?B?SVJyOW90K1dKQmdTTnZnUEk3N0hzVHNTV3A0TnQ2M2N0QW5pSW1YYlIxdDZh?=
 =?utf-8?B?dzNBV1NJUGVDMGIrcjhHd3VXa3ZOU3lNbWZtUzF6aU0wc2lQVzFYTVIzZlJh?=
 =?utf-8?B?ZXlqRklQVGVWUTVkbHRPWjdpZ05BdE1CVDVteWtEQkRWdUFzUWlhYnBnV242?=
 =?utf-8?B?NzZDaDJ6aU1nekZmU0dsdm1CVllnMVdYckV6eVpQZ2ltVGp3QlNqNGYvckVu?=
 =?utf-8?B?cndCQ1IxWjF2OThpUGlRZkg2TFJScHNtcDdteWNtNUVMZ2R2NjJ6ajdiVXg0?=
 =?utf-8?B?Tnl3bXNqTzN2YTdEQUh1c2JXNzUwSTNtVi9nb2srbVg3d0x6c1FxL3dUZXoz?=
 =?utf-8?B?YkxLdkI2T2x6SXBiRnRFU2NkYWVjaEd6OXEzTlJOQTliSkNxUUIyS28wUzdo?=
 =?utf-8?B?UkI2dTlvbnN1RG90WU00YlhmMFJ6RWVrSlFKL2ZxVm52Y3ZXcVdlRHNzbk45?=
 =?utf-8?B?QkpmM05oUkVHZGQyOWFTNHZ1UEhmcVo4aXBxNS9XWDVRK3pQbEFMVWRiM28v?=
 =?utf-8?B?Y1JZdFVUeWJ6akhHWmRoU3ZLVWlOWWZrVDNxOWxiTG10SzVCcHBjSXZHcTF5?=
 =?utf-8?B?RW5zbmI1UUtheE4xUHJJM0Vwd2k1NVBJbWhuaGhGN2hJNmdibWtDV3g4V0t4?=
 =?utf-8?B?WnhnL3h4SnA2bzZPcXQ0ejhjV3ZKTENlbGtEOW1vejlWMklIekpETFQ1OFY4?=
 =?utf-8?B?WFdYTk9ldkVhcWdhRWh6bmowb1BaWkxBWU0zMTBsQ0YzSXlqSk1UNzNuWFJR?=
 =?utf-8?B?RFVVWTBQYWllbHh3d0syZWNOOEluODVIYnVXak1sM2F5c0NJNm1YbHlQbUZj?=
 =?utf-8?B?dUo3TVNjOGRRZno3OXVWL1A4bGExUjFscXJxNVQwcks4MVZlN1JzOG1qemxj?=
 =?utf-8?B?RThXejY2cUFBQlBMSGQyOEhDYm9EMDA3NDlvYXhscmFMSDE2SHR5UzdhNHFR?=
 =?utf-8?B?c2wxVm9mVnpmOGlWWjZvWFNvV0lzMm9YdGxvSGJaVGFCQkY0emNZUkQxOU1k?=
 =?utf-8?B?OVZrMTZQajk3YkFXckxaM0V1eUgrTkhFVWJlS2l2OFp1MEtEdUg3VzRVNURa?=
 =?utf-8?B?VGtOVUUzUWhHS2NUYmhjWnFka2g3Y1YrWDIxNDNkZWduMVhSVC9RcXNlRTAv?=
 =?utf-8?B?MDBrZnZnRWJDOEROVEpBamppd1MyNDhnNXd3dDRHRGtmR2xsU2JMRVdncUE5?=
 =?utf-8?B?aTh6MnlIMXdLRy9tMnFsQlU4ejVvSDhWYkV1V242cExoMlFIVENGM0w0L1Fn?=
 =?utf-8?B?ZnZHNTdWc0tiU0pRSGxEaVdqT0J0UytRUE5YVS9xSmp5bkV5cUNxT3MrdlZW?=
 =?utf-8?B?eEZGbStuYk56V1IxRmF1eWRhOXRPS0dKY1RCcW52NmFla0VGQlZ5OWE0ZldH?=
 =?utf-8?B?Y0lpcithYitBRG51MlltUG45RnVjUGxScFo5N2V1eFNBYVpEVnJFbnQ3aDVO?=
 =?utf-8?B?Y29UTDVLTEsyK0dRWFVoQT09?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47614729-7404-40b2-9c4e-08d9877bd914
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2021 21:13:44.3434 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8LyVZajIFtp15d0hc730Chwhw9DXBXYTIuWN5K6LuAUAvxLlryNSj+1Lp9E2uQVugJCjLN/JHeNX57QogBrCphaKRJobP4TgCi3Th7FOfpg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4401
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10127
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0
 phishscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110040141
X-Proofpoint-ORIG-GUID: u1s3Ol7PHEHEO-CaEsxFGB3JxPFXDx_z
X-Proofpoint-GUID: u1s3Ol7PHEHEO-CaEsxFGB3JxPFXDx_z
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0a-00069f02.pphosted.com
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



On 9/21/21 6:32 AM, Igor Mammedov wrote:
> On Thu,  5 Aug 2021 18:30:38 -0400
> Eric DeVolder <eric.devolder@oracle.com> wrote:
> 
>> This change implements the test suite checks for the ERST table.
>>
>> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
>> ---
>>   tests/qtest/bios-tables-test.c | 43 ++++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 43 insertions(+)
>>
>> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
>> index 51d3a4e..6ee78ec 100644
>> --- a/tests/qtest/bios-tables-test.c
>> +++ b/tests/qtest/bios-tables-test.c
>> @@ -1378,6 +1378,45 @@ static void test_acpi_piix4_tcg_acpi_hmat(void)
>>       test_acpi_tcg_acpi_hmat(MACHINE_PC);
>>   }
>>   
>> +static void test_acpi_erst(const char *machine)
>> +{
>> +    test_data data;
>> +
>> +    memset(&data, 0, sizeof(data));
>> +    data.machine = machine;
>> +    /*data.variant = ".acpierst";*/
>> +    test_acpi_one(" -object memory-backend-file,id=erstnvram,"
>> +                    "mem-path=tests/acpi-erst.XXXXXX,size=0x10000,share=on"
>> +                    " -device acpi-erst,memdev=erstnvram",
>> +                  &data);
>> +    free_test_data(&data);
>> +}
>> +
>> +static void test_acpi_piix4_erst(void)
>> +{
>> +    test_acpi_erst(MACHINE_PC);
>> +}
>> +
>> +static void test_acpi_q35_erst(void)
>> +{
>> +    test_acpi_erst(MACHINE_Q35);
>> +}
>> +
>> +static void test_acpi_microvm_erst(void)
>> +{
>> +    test_data data;
>> +
>> +    test_acpi_microvm_prepare(&data);
>> +    data.variant = ".pcie";
>> +    data.tcg_only = true; /* need constant host-phys-bits */
>> +    test_acpi_one(" -machine microvm,acpi=on,ioapic2=off,rtc=off,pcie=on "
>> +                    "-object memory-backend-file,id=erstnvram,"
>> +                    "mem-path=tests/acpi-erst.XXXXXX,size=0x10000,share=on "
>                                   ^^^^
> shouldn't the path be generated with g_dir_make_tmp() & co + corresponding cleanup
done!

> 
>> +                    "-device acpi-erst,memdev=erstnvram",
>> +                  &data);
>> +    free_test_data(&data);
>> +}
>> +
>>   static void test_acpi_virt_tcg(void)
>>   {
>>       test_data data = {
>> @@ -1560,7 +1599,11 @@ int main(int argc, char *argv[])
>>           qtest_add_func("acpi/microvm/oem-fields", test_acpi_oem_fields_microvm);
>>           if (strcmp(arch, "x86_64") == 0) {
>>               qtest_add_func("acpi/microvm/pcie", test_acpi_microvm_pcie_tcg);
>> +            qtest_add_func("acpi/microvm/acpierst", test_acpi_microvm_erst);
>>           }
>> +        qtest_add_func("acpi/piix4/acpierst", test_acpi_piix4_erst);
>> +        qtest_add_func("acpi/q35/acpierst", test_acpi_q35_erst);
>> +
>>       } else if (strcmp(arch, "aarch64") == 0) {
>>           qtest_add_func("acpi/virt", test_acpi_virt_tcg);
>>           qtest_add_func("acpi/virt/numamem", test_acpi_virt_tcg_numamem);
> 

