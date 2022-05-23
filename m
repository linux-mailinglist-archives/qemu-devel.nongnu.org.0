Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BB8B530C66
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 11:50:58 +0200 (CEST)
Received: from localhost ([::1]:38540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nt4iH-0001MR-H9
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 05:50:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1nt4dC-0007TL-9y
 for qemu-devel@nongnu.org; Mon, 23 May 2022 05:45:43 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:41636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1nt4d7-0000e7-KV
 for qemu-devel@nongnu.org; Mon, 23 May 2022 05:45:39 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24N9TApx011883;
 Mon, 23 May 2022 09:45:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=9fMj9ohsGuz1ztnLUV0WQIz9zGzNgZ8mEqJCA7/w3Uo=;
 b=doT4I5BnM96mWIFgEm18JF9ksZdO/fSzaYMpUWsA6CO5CII4qZ3iah7iBZSMwk43NtbL
 V4ggkcYetr3Z2U9AUZxmhdLfZ8xOzKQyx87zbAuYteV8O/FIuh38eSA3fDkrmNC1xf3+
 lJM9XgKEc9/5OrZqJJXZbgT2C+MucTMPt8BmJFWxRPg2c9bI5K99YRki4NTlFyr9XE9j
 mkWEpk6QlN4N00rxp2m4GVtj1SwdY61qJeU86iwYK1ZnpmizDzvNwMJ70iUhHyCW4pyc
 X3pLmoqki0yLHnoRdDOGE2O1fmr8mFesXW1bbeYPCrD5l1xGxPveJY835VZ8e9jAOV27 Tw== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3g6pp02unx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 23 May 2022 09:45:32 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 24N9g0MK038559; Mon, 23 May 2022 09:45:32 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam08lp2049.outbound.protection.outlook.com [104.47.73.49])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3g6ph1607c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 23 May 2022 09:45:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AzwlLi3oYKZoWhCSPHeiiaaV4I/Gduvstvyixja5jRQ4SijK+4I48TgCywkBJGEFty1ZVpgsXhm+ThQA2YeqvwEawjUzrKwS64xhpnIab0+hPO+AMJTnWNrLPBN1B1clH7TXga/7A1C5R6A44xKk8fl8VCnNkRrhyOAAFgAvqYD6adT/pp5l60pXoPGzZ/jt2XribJjuVdl7dKJdEDVJCpXBCAVjpXWhngttl2DboYtMffax/Tze9hMh2OVkFzgfeXzwRcn9q++0QgI/jLrJPrb6eu74GD8srVSxRjo4OpwQHXrscKo8AT85FQ+k8B7JW2hzSyD9z6eLYLiDrvdsIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9fMj9ohsGuz1ztnLUV0WQIz9zGzNgZ8mEqJCA7/w3Uo=;
 b=lg2Y9bID3dWSXVXb3fyqFuzWYs9HpOqzY8qWLBj92WMhHnQVrri70yh6jJlGtyUim8MV5Z3ORhy+adetZQVWtie8l0cxwGAuZ15gfB2t5LasOpp7CRrCd1/A64jksrsUtnOzgDJTAaZ7qXkvZlVZ5v8VXGC8g+JtP6Lox4WYi34IKpyn7SP+k5AUFkZxiDueHIGKFLUQniLaRjPZz2Ggr/sK5Efl6PR2YUUaDBuT19gh9lGycmSE5CrCD8vwv3GT2Y49gIi5gpAFzOPYFFCxSZOoMC97rWYfh0/7CO2OqSQxsOhh/0QvsmXmzIRaoJYzvbZkHcdbj0ypO30hFdQryg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9fMj9ohsGuz1ztnLUV0WQIz9zGzNgZ8mEqJCA7/w3Uo=;
 b=v6edcCapX8HRXWpWaiFd9MjLLI6dX0qlrUh9b8Ygu/RtQgEhOCSc3peajw9cX/9inQrHvJKz7B5anELOSE1HrrqfAGu78ihPqtkPEhEuQjYllW1o8SODbgAqEnlav0OdbG2JOaxjGH/pYuji51E4NEqTRLIeTEjcnmg306+nS6o=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by CO1PR10MB5523.namprd10.prod.outlook.com (2603:10b6:303:162::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Mon, 23 May
 2022 09:45:24 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::b9e5:d1b6:b4be:f9d]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::b9e5:d1b6:b4be:f9d%5]) with mapi id 15.20.5273.023; Mon, 23 May 2022
 09:45:24 +0000
Message-ID: <06552cba-c4f1-0990-6112-0573caadc5d2@oracle.com>
Date: Mon, 23 May 2022 10:45:15 +0100
Subject: Re: [PATCH 4/9] vfio/migration: Skip pre-copy if dirty page tracking
 is not supported
Content-Language: en-US
To: Avihai Horon <avihaih@nvidia.com>
Cc: Yishai Hadas <yishaih@nvidia.com>, qemu-devel@nongnu.org,
 Jason Gunthorpe <jgg@nvidia.com>, Juan Quintela <quintela@redhat.com>,
 Mark Bloch <mbloch@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20220512154320.19697-1-avihaih@nvidia.com>
 <20220512154320.19697-5-avihaih@nvidia.com>
 <49f27f66-33e8-e6ed-c791-fb6e7b7a7938@oracle.com>
 <9d3084ab-2b5f-8ccf-5384-11d5679ae294@nvidia.com>
From: Joao Martins <joao.m.martins@oracle.com>
In-Reply-To: <9d3084ab-2b5f-8ccf-5384-11d5679ae294@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0173.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:312::18) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d61271ec-8517-424c-559e-08da3ca0f5f6
X-MS-TrafficTypeDiagnostic: CO1PR10MB5523:EE_
X-Microsoft-Antispam-PRVS: <CO1PR10MB5523D521EDB9BB8176185F1EBBD49@CO1PR10MB5523.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OhvuFJ+ErxptvnesOrmnQq5O7zUphy0w9Sa/YYQasyW6U9IbvLeqGsigO6Uck2WB6KA0CckDjFgCYgpfrwzgy4ffMBuDBN3ZGdcwFe4PepF//nqdsCuCsdVE+hGPreis3l7f5cTREU8JyyjcoWRcKlSqtor3wZKvLixaCZZkkBb5s0TJyhhsxlF9yzdNgzxfYSK0ETAM2c1Q6Ko/Lf2QuJJVg9/QJ6aH1pnuG83ZWQ3/6uZCHbbQhzN5uaElqHaPuJPdPFhZyezSUvjrdlmgc7qAlo1Lz5q10vIhHKqP4Fu2mgogu3IJUAd/JmPR9LZQLK9qM1F/Gw08px0nDXqD084HLZfuspFo61qlBOjUXT+I21kuL66Q8+BWmlG6M5qT4XGtlJPVr2NErqUW/52NBUfEBDyQ/y9hvF76gujY3XhadRhHJau/5PomslqWShL8UpwPJQxWO8oH4PvmHOwQX7iTGZ4HFqTFZym4kPM+IIifXqmz5kDQGYIZFiWeBZYhgJf/cXUYQRt7oCbTq9suHhl0+OWSCJqOLWLN/pE7t8j++M/zUKNRUFzMkvWdLNkobTe5j6JtGWowLpys4/U6WV0HcqJO/2gNe08lEZZVnhfhUjot/tVz6YrOGR11JlLIz/A+vWLzI0ugw93aQwpXFOL5fvr4i8Uck3rmR3RJJY0KcsIofeOuj0qZp2kwKu2sdZ7VmKgoGvDLVf4qGK0tcG+cEKrGCr2SIX04nanOVBluVaTxEu8LrT6bopSwU5tD09wExa92kOXY+ghgiHlcjmCQwqEDVkUMNQLnstO3FKo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(53546011)(6506007)(508600001)(5660300002)(8676002)(4326008)(38100700002)(8936002)(6666004)(7416002)(66946007)(66556008)(66476007)(86362001)(31696002)(186003)(26005)(6512007)(2906002)(2616005)(31686004)(6486002)(316002)(36756003)(54906003)(6916009)(14143004)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZGt4RFJObGFZS05Zd05FWWxKWC9WOFByU3V2bVdVMXIxcUh4V3ZnS0JyenRB?=
 =?utf-8?B?UzJQTTlkaGdrMS9lVTZxaHNiNkdIRDdJYXRaMW1OdStHUTNWQzBxWUMvb3lQ?=
 =?utf-8?B?ZW1UbFppU2JHd0FHTkpyTlQ1cDlhc0hNR3lTeDd0aTVNMm54M1gzQ1J6a1Nt?=
 =?utf-8?B?cy9nelB3WUpjYnJCdkx4V0traTZtN3Jhb2E2c0lwckZDQWlXd0tkaW9lUlpr?=
 =?utf-8?B?YkEvb3lHUFVmVkxLSFN4OEVPQnFtUnhFeFdMWmFYaGgzWFF5T3VVWDhlL3Za?=
 =?utf-8?B?NVhXRDU0U3hPRnVlcmZ5ekYwUjZWdWh4QlZtNXJoZ21BWUs3QTI5MHNMNFBh?=
 =?utf-8?B?alRuYi9DRlJPamxTM3JBZEtwaGhnVzhjNlNncmh3TWxvZWFqZTZ4bXdNdEc5?=
 =?utf-8?B?L2c2QnZGaXp5VUFMUTAxRGdCMWhXSnd1SlBWWGhDNGtEd0dBTi8xR3YzbDFH?=
 =?utf-8?B?KzVINVJJTVI3S2kwKzZpMTNmMm5QMnEyZDcwRjNJOVhkeFJ6UjlWcWdocU9C?=
 =?utf-8?B?UEtLRjladkRodUxjdGs0dmY3LzZsNkFPM3YybXNtc3A2STRJMFUwSnhkNUpz?=
 =?utf-8?B?cHhpYnRxV1dNNzg3THNmTkhrM01DL1g0Ni9RK2h0dkhvbS9QQVZWaEpJWk9H?=
 =?utf-8?B?bFBCemNTbzJzN1RjcjVySXB3L2hjZ0RWTU8zbkFKNlo2MXBrQS9ZZlI5VGRE?=
 =?utf-8?B?MDFPMlZ0KzJsVnJDS0poblB4cGxKQlkvVWJIejU2UWRFSlUyd0laYXErUnFh?=
 =?utf-8?B?Q1psZ1ZOc1UzMzFqZCsreHIzcTFnaWhOemR3N3ZHN3pyUGdwYzBoWkkxZUpM?=
 =?utf-8?B?YTZPbTJGL0xJTFI1WVduRG1EOEt6ZDZCeFd0bEd1V0t5Z2YxN3d2M3NhYXRM?=
 =?utf-8?B?T0RCL0ExblBBTkUvU3psZ3VMMUNqTmpzM0tBVjJ2aW12SEpoRi9vK25mbWpJ?=
 =?utf-8?B?ZlI4VTUwWGVuOWdBU3lyUHI2cUp0bkR4ODhKdzNmWUtHZk4xVTlDMG1LQUVW?=
 =?utf-8?B?YnZwT3Rtd0w1QjZIQ0xJNE1qS1Q0QVMyTENiYjVQdEk5ejEzYVJOK0tuVFN2?=
 =?utf-8?B?d2k2cllvY0VKYU44SzBkcGFnUERmYmtqbHhJcURGdWpYcDdaNXUxNm9ITENN?=
 =?utf-8?B?NWNNYzlvT3BxVjJYMG9IcDc3eXIyek5lMzVQUzVsM1pTM3RHVXNMdjk0ZUZ3?=
 =?utf-8?B?NERTNTBMMVRkTVdZdlROS2JEYjhYT0ozblRuK2g2SFo0aUZTM1ZLa1BOUlRN?=
 =?utf-8?B?YjRoeDNnTXRVMjBxZW5mYWc2ZFpodlZvcDQ4RHhsNVBRdGlOSm53a2xuYThH?=
 =?utf-8?B?UXhXR3VUY0IwdU1zOXoxYUwzMkRPR1VmM1RVN2hXMTN3czNYSGk4ZmJUQVZZ?=
 =?utf-8?B?a3o3WXo2ZGl3UXozZ2UzbGxickpuUzB0TXhnZGZjWVBvSmwzTWFtYjhQZjhB?=
 =?utf-8?B?c3VMQTBPeFRsVXFYM2NVbU0zN1J1aTlGcU1obGw2U3pxM00rL0RHWW5Jbkpw?=
 =?utf-8?B?aGd2ektvWHFZdzYvOU5WenNkWTZIMFFpeE50MXdmdzlxWUtZMWgrcXdheGdM?=
 =?utf-8?B?a2I2SDVXeFhrT21GUlIzRllvU2drQm9RV0g3UHVuSTBJdWlWUXNSN1lZd0pE?=
 =?utf-8?B?U29uY20yWHZWcG5QbHl0akMxQXg4SzgwVnZleVJrMEtLQXRXTjgzTHk1TW9p?=
 =?utf-8?B?WnQyK1pQa0M2TWI1WTloT0VjZVhLOTVlc0RpUldoSDhaVTR3RVZ6WlcvYkpz?=
 =?utf-8?B?Z3Nibzc5Nkdma0x4dUVSVHNCTHE3bG1iaC9lVDNCV2piM0wwRHBabElMKzha?=
 =?utf-8?B?WVhrS2pyVzdFejJFUGorckdhNk42aGVjUjdsc2tRT0pLcXlJcjIyc05HMm1U?=
 =?utf-8?B?RldOQm03WEd3eVdQaDU5RnV1VCtoa3VqczVUdFdSSWpSR2ZQTStWTmhyYjhw?=
 =?utf-8?B?Vy94NjVRcEROTVBhREpPWVd2RTZmWENNajNOVWhUVDZVT3VVWWFTMmEyTWVa?=
 =?utf-8?B?QWg5eDZmbCsxMGovN3VQaUVPaWxQQmo0Ynd2UWVhVzhCR1g4MWlUTS8weGI2?=
 =?utf-8?B?bW9aTUdVcGRnMnhBOFNYbzJaU3BWVE9uZUFHWEpqNGxBZm5UblVJcVVkdTBj?=
 =?utf-8?B?dFI5U05QWW5QT1pRRkFZMTZWbkxwano3bHd0N3JUSTQxbWhXTldvcUJnNlFs?=
 =?utf-8?B?Q1JCNlAzaE1aQXdnVTBhWHhJVkQ1QnZoeEpYbldWanNtajduYzQvMTIySXdk?=
 =?utf-8?B?YUVIRC9KSG5wQTFMRVN6dVN3cmN4NXpSMGJpZGQvQTJacVExUEp4emlPdDNI?=
 =?utf-8?B?dm5PQ2I0NURaVmhBc1FHWUhqaERjaVRvSWw4dEF3ZUFMTFVqenVpMHBIS3dt?=
 =?utf-8?Q?56NelTHtPU+AwPzI=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d61271ec-8517-424c-559e-08da3ca0f5f6
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2022 09:45:24.6904 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qQGnIfMQySPflCjxasLrUILh0j9JNXfE/lE0C6855spIqqEE3pX+Zudq1J/ZrjiZ8URX3Ya4NI7RKgsnhZSYvsZmxtlDuEq3Lsyo351Hsrs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB5523
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.874
 definitions=2022-05-23_03:2022-05-20,
 2022-05-23 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 bulkscore=0
 mlxscore=0 mlxlogscore=999 suspectscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205230052
X-Proofpoint-ORIG-GUID: Jz_Gv10sUBXEqyZJoX56r428PgLT0nNr
X-Proofpoint-GUID: Jz_Gv10sUBXEqyZJoX56r428PgLT0nNr
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 5/23/22 07:11, Avihai Horon wrote:
> On 5/20/2022 1:58 PM, Joao Martins wrote:
>>> +        migrate_get_current()->skip_precopy = true;
>>> +    }
>>> +
>> Perhaps it might be easier to reuse the existing knob to disable pre-copy
>> per device that Kirti added some time ago, rather than changing migration core just
>> yet (e.g. you might wanna bail of the migration preemptively because the CPU is dirtying
>> too many pages for example?):
>>
>> if (!container->dirty_pages_supported) {
>>      warn_report_once(...)
>>      pre_copy_dirty_page_tracking = ON_OFF_AUTO_OFF;
>> }
> 
> But this doesn't prevent the VFIO device from dirtying RAM pages during 
> pre-copy phase.
> The VFIO device can dirty RAM pages during pre-copy and it won't have a 
> way to report the dirtied pages to QEMU and migration will be faulty.
> 

You're quite right, sorry for the noise. I was a little too obsessed in reusing the
existing field that forgot that letting the iterate stage go the PCI device could
also be driven into dirtying RAM too.

