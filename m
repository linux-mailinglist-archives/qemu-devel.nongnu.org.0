Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07FD64247C4
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 22:13:35 +0200 (CEST)
Received: from localhost ([::1]:58924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYDID-0005kE-Q9
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 16:13:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mYDD0-0001nA-8N
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 16:08:10 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:51132)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mYDCp-0001aG-Dz
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 16:08:09 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 196K2cSm027986; 
 Wed, 6 Oct 2021 20:07:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=g/R65oGBsdmnWMmPytUxU7KQjCbR8f6k6PQ+ITn8Kdc=;
 b=LfFWYniTHUQCjpdkBzgDME1/CBVVfq2gNdVjoDvRzVJGRw+ItWoyZgh+/tkaweEBVapd
 NW7pGbARwUQNZTSQC+FmInitWjiLmiyYsK3THPFZEWV/019QGvCcd+ylEyMeuANm04O8
 xmNpBqwKdhWV5oy9wIy7JymVSrtAbh4DL3DY5HD8RI8XfZ9sweHEjVGyyZZGQdOJs0zz
 JhoT7Wu+Pz+/XDlMxTg+ozPZ1NdLLx8Feq6PQLlB0/ekVAqbIERS4LQus184EMQ/liBM
 il/dm5sNTFdM5XfOGVCf91+X2vTm9mCR173ZLvjij7aVtTe5AAmzXqe3gr66IaYXnbe7 7w== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bh10gft23-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 06 Oct 2021 20:07:51 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 196K62Yv176236;
 Wed, 6 Oct 2021 20:07:26 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2103.outbound.protection.outlook.com [104.47.58.103])
 by aserp3030.oracle.com with ESMTP id 3bev7vekrg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 06 Oct 2021 20:07:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KXOOpYBfZofO1wQikGi00SBjxMTWtR9vj/+05NvI2dvovZq9q2WfgjWjJxgicEqNqBBqZehdUVfqAAbOUnONVLyhx8PwNJXw4GpK0lv0qugLNhV8CJU8e1NefShJfC6rvPoWMIAZQzmq6G411JuylTvD6gicn0vPELRjeWIXXRdoi9njMeyBCu5T9bh9RkzyZzzFewdtU3/OCZqUwto7VriN1iz4VZDcczYqEch0QTX/aim4EqZz7hyyG2RnOaj8XWN+DSWtR2A9e26sAJmn0oOSeU2wp/9dRgbaqxNqYYJNeOcTPk3PRCxFwkUy1B3Sg2lE1dR7Qt5RlHbh/IeGNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g/R65oGBsdmnWMmPytUxU7KQjCbR8f6k6PQ+ITn8Kdc=;
 b=LdwwWKGr7AwsGkb7mWDr/veXZ8r6kJ6KD74Y5EM1AiBFUgTSW0nIuufv7FcskLrfzBJ3zuHnFC4q4C8Me8ldpvFiJX6OlGO7pLy/8Kx4TNMnkwPHkw8kd5SMEZRWj3RIJ3wO6+/8DIIOQexM44Mk5D34abPLVvJpIKLLmjgryFyXNPOth3Gc3kvp9YN6yRBDdtVJ1S3tvwJVn1OeK6P0mV/Lf9QrVM+u7B/U4vpc5VMKHUvhhpOUC/710m4LwiYxNBMD5kL8zC3yj8zMv8Bsp99Mm/JHiuiOmmm7GhKIgrwHVtk8CrX8DBpgI4f22QUdIdHaSRoMpadxGlMXXHxkqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g/R65oGBsdmnWMmPytUxU7KQjCbR8f6k6PQ+ITn8Kdc=;
 b=Pw+1GetuBo4lXAcCzSfXGig24o11QvvgxHP9qNahabHMGiWJOHRwV6f1GtnA28mTLvxrXo9OA/3IGn5ZvOsJ1XSEF8IEOhZCCREjdJo2YpOoCTGVh/dSKJM6HJTofBhlyid6hBZdOZi3ewDsdFf+RL0Ol9TTCqB8nlmuhr2D8z8=
Authentication-Results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by CO6PR10MB5649.namprd10.prod.outlook.com (2603:10b6:303:14c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.17; Wed, 6 Oct
 2021 20:07:25 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::90ef:e061:a4c2:acd6]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::90ef:e061:a4c2:acd6%7]) with mapi id 15.20.4566.023; Wed, 6 Oct 2021
 20:07:25 +0000
Subject: Re: [PATCH v6 02/10] ACPI ERST: specification for ERST support
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <1628202639-16361-1-git-send-email-eric.devolder@oracle.com>
 <1628202639-16361-3-git-send-email-eric.devolder@oracle.com>
 <20211006041132-mutt-send-email-mst@kernel.org>
From: Eric DeVolder <eric.devolder@oracle.com>
Message-ID: <9a7b7686-51bd-2a23-0220-b8f0044ba781@oracle.com>
Date: Wed, 6 Oct 2021 15:07:21 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20211006041132-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR17CA0058.namprd17.prod.outlook.com
 (2603:10b6:a03:167::35) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
Received: from [IPv6:2606:b400:414:8061:221:28ff:fea5:27c8]
 (2606:b400:8024:1010::112a) by BY5PR17CA0058.namprd17.prod.outlook.com
 (2603:10b6:a03:167::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15 via Frontend
 Transport; Wed, 6 Oct 2021 20:07:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 72e6b499-af7f-428d-f4bc-08d98904e9f3
X-MS-TrafficTypeDiagnostic: CO6PR10MB5649:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR10MB56497B4D24E80B527AFA4BD697B09@CO6PR10MB5649.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Py74rG+Lg+zDB5IU6mAaPxb52nwpJ+vDkyhAx8xxKw8SQudVaHr6CfVLwakcb4qRshJj/Z/rjoNzI6vzZr+IDTMeN+73zm1Dd+nFjuBRYDGtd0R5AlIa7QUQfmPcc2lNsgBZoz23jmqSVPd4w8QpxZ/nXrkpF0Q/nvSmiosQZLOu0QZAsuncKw2LDvhSDMF+z8riZZ1bU4vCg4TjCy4EYiUrDwXQFxmO2ksUMide2UcUS+a1H/S87doU83TOy6T7+uaQtcukTUGzTcUlsMbREpW9bNaYwknnjUvdJjZ4tlvZJ/VxFlfIB15I4CBW+VYpXJGjDkrIQ0WNk0Fsg48wWik7q2yCgkHpHFVxoKaPi4g8NZ7tPjmnAiYJXShOyCkljrkzIavdF89iyzZJBdPC4lbwxPgxt2h/twL/1Ur6LNE5osTnwlJWNOArfbF16hbO98fZKaal+Fk0g0Epu/EQ9OtUG/PxFCJ8UQLDCq9Tq7TWnQ63bjM4x50pR+fKFt/8mEjppt3j6W/93rAQ/Bo4/5+jksEOqzTJKDmA9SFaO8OpFTEJ8+5q7CD2Sm9a9QVtf0nSUX3yFUG3pfBf+FtQxJZzJvkq3GHLq1NVCISLdcBHmAHEKAoo9nZ4KeVhFMoIWCbnUFF7TzdKA/7zReFml0iGnqiyTSuiBJ7kN/3inGVOwaMt+EScgURtqd8CYXMGMyFm0ZzKhLUqHxPZ50zT+u2mmStcr31R4T7Woe+CNok=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(31686004)(5660300002)(6486002)(38100700002)(2906002)(186003)(8936002)(2616005)(4326008)(86362001)(6916009)(36756003)(53546011)(508600001)(316002)(66556008)(66476007)(4744005)(31696002)(107886003)(66946007)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aUxYK1IxRDhMTUdBazY3S3d5OGFmWlhLaG8rZXhEQnM1cXZucmhPeDVJakxE?=
 =?utf-8?B?eHh5eFRqRkUyU3M4RmhaYmlHVGlMNGYxMGV4Sm1kZC83cWFwcklQd3lvMFBJ?=
 =?utf-8?B?c3BqcmhkSWlldkdiZjhzSEpMRkdtcjA1YUVkVVhmTVJlUlQwVWFsU0VPRksz?=
 =?utf-8?B?VnJWbDVWZ1I3N3dYcndoUmRETWFpc211aFRhZXJQSTFZckVBa1hPYnlLaWE4?=
 =?utf-8?B?QlVwNUpob1NUTzc3QVNFeklYbGg3WHhXUzZvSG9VemlzWHRKRmZlNGJaTXdM?=
 =?utf-8?B?SXM5bThGOEZxQjBONkFiRC9YMENMVDByY0owM1BsQXEyVWs3WU1SY0E3KzZD?=
 =?utf-8?B?N0htY2JuRXRFaFFhTTlIeVBLclZuUW5Gd3B0RlN5bTdZekJUUmZUNzN1Q2Fm?=
 =?utf-8?B?TGpnZWFyMzJvTFJMc0M4U05TMHM2bTFxR0UzMjZjZFEzN0pnOEp0S3BwdmlZ?=
 =?utf-8?B?bW5JRXd2Nnd1K0JhRHRYZEJEaGZRNHBvWWFHREo0azJGK3N3d0Z1QnRWRU51?=
 =?utf-8?B?dW53MTBqOU1zMzY0WnBZeDlHK0FzbGdxUmlIRkpRaWxJdE5kTk52ZVgxejNz?=
 =?utf-8?B?bGlJL3JHbWhBUWo2OGR4SGZWZnBiKzZ4amx6THgxNnhXREFhUmxQSDMweG5V?=
 =?utf-8?B?eVVQOUNueXdJNXBMRkxONkRwODlHVGpOVE5iSE1HVzJKUUlUQ1ZmYUJpUUZq?=
 =?utf-8?B?UkIzRjRlVFVhUmZRVkRLSHU5MFBlN0lYb3RnUW9sUDFacEFHbXJQV09aRU55?=
 =?utf-8?B?Q1FseVpVdjU1TmF4cTNrZG1ycjZxSi9JL0l0RW9ZUzBEbmFWWWplMDhzaWV5?=
 =?utf-8?B?MVFQL1NzWEgza0huNmFEc1ZNeTFENEhHM1F1V1FRZHpoSWhVN0VMdHUxaVlq?=
 =?utf-8?B?UHhpdDBmRjFPUFNTT0RlOXVCbXhLZ0NhNktDQkJHNG1VaThmbGpRTFhmZXRJ?=
 =?utf-8?B?ZjNPNzFyUEI3dWcwcVR5YURyNFVFWkN6U3VmeTBmd3NlV0REMXRpVmkyRkZx?=
 =?utf-8?B?V0tGSzNzemhCazdrSXFoWVpOL3E3L3Z5dFZMbmVRdEVGL1FSVkRKWVpyWmdw?=
 =?utf-8?B?elJ1K2NpTFlKdjZuS3VLOVE2dXRzOEE3WGk0YU5ubGN6NkJnZEZuWmIxaTB1?=
 =?utf-8?B?ajBJL1BTK1ltSXNjc1dob3RQYTFlNEpyRTJaZWJkY2hOVktIbGNpUTNWc2Vv?=
 =?utf-8?B?WDdsK29xUGVHSGRkZ3FLMkNBdktJTjJTalF6R3U3MXhHUWp3TE4wQWVCQnY5?=
 =?utf-8?B?b2RqWG4xb1dFKzQ2U0swdFJPOHZ6VzU4TUhiTXlZTXZaRlhVTzZrNVpMRWgz?=
 =?utf-8?B?SzAxUU9vM29MUXJIV0hxL25PbTY4N0lhWUtneFEzREdMS1F1YmRDOU5pYmFN?=
 =?utf-8?B?Z3c4WVdaUG41TGIrdkRXTnVZYVUwb1FiSnhUdG5Bby80cC9kSE1FWDNTTldM?=
 =?utf-8?B?N3hTZGJ1NVhEOWpnTDlwTjRudks4dGtSNExyN3dZZk42Mzd1cDBQdnIvQWUz?=
 =?utf-8?B?TnFJMkhHaC9rcGFnZnA5eXYwYk1OYi9qdjlnS0Z6TWVxMXVDS1BudVR0eDZm?=
 =?utf-8?B?NHQwTGh2WWNHdzdack9yTlFTbVM0cS9aUXhJSkd0bkF6ejdHdnZvUTYrQnBm?=
 =?utf-8?B?Z1FVd2pwUmpTVVppbStZQ1VSeUNrNFM1QWJoVEhINUkxNURhT3pzZzNScEsr?=
 =?utf-8?B?OGR2N2JqQmplRTFjTmpuaE9mdFJjSnJJWCtvRjlKNUpkQkcvdzhWQ2U0TXhq?=
 =?utf-8?B?NUF6anhNVUYyemU4ZWJaaEQ4ODJ6cnRTc2tkekdBRUh5dlZIbDdXMktTMmNR?=
 =?utf-8?B?bktubGFYdVNtM0JCUnBEQT09?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72e6b499-af7f-428d-f4bc-08d98904e9f3
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2021 20:07:24.9272 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K7es1RAhcUaA7WEaMmHPsVxAEW6Vst9iyq1uQoiTKUJUd3E1XZSssl265Hzv7tOoVvNWauUzVpPvMyf3ZmJnK/hsZLmhCQGDOhJe2D5jfmg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5649
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10129
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 mlxlogscore=999 adultscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110060125
X-Proofpoint-GUID: hL0g4-ezjlJKg6vtlSJyrLWD86-i0IjF
X-Proofpoint-ORIG-GUID: hL0g4-ezjlJKg6vtlSJyrLWD86-i0IjF
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-1.964, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: ehabkost@redhat.com, konrad.wilk@oracle.com, qemu-devel@nongnu.org,
 pbonzini@redhat.com, imammedo@redhat.com, boris.ostrovsky@oracle.com,
 rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 10/6/21 3:12 AM, Michael S. Tsirkin wrote:
> On Thu, Aug 05, 2021 at 06:30:31PM -0400, Eric DeVolder wrote:
>> Information on the implementation of the ACPI ERST support.
>>
>> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
>> ---
>>   docs/specs/acpi_erst.txt | 147 +++++++++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 147 insertions(+)
>>   create mode 100644 docs/specs/acpi_erst.txt
> 
> It's probably a good idea to have new documents in the rst
> format.
> 
done!

