Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31925421896
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 22:42:55 +0200 (CEST)
Received: from localhost ([::1]:43366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXUnW-0006sw-5S
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 16:42:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mXUlb-00065l-G5
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 16:40:55 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:59564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mXUlZ-0005HH-0d
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 16:40:55 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 194KUOGU019448; 
 Mon, 4 Oct 2021 20:40:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=moH0R14p658/+U4bnCjuwDye7VnOmK+AmRJyTY+vZSc=;
 b=upYPK+bVG0TaLnaFqGZ7T7euU3RpWK6DEPijdh/z3eAW4NHGIvmnzDeKZ6ni5UVpv3zK
 cQDJeReUlgfCeSOa73iUbREerL3SN5Sy6h1BUQYf1ou+VYxaNnLVU1KgOKS5afjeW2K+
 d+cbuyKfgJYQlabBoIyy7CyqIp9huBc9MleJ6iRyrGYzdLqFdWukZafp++fvwGl00M+7
 +RSdUg//PY6PKtjqK2imcpVHs5AHwNe4wIXDe8Q1X8kGvrEpUBt7jReaHOYmhfYw7zep
 se4VXvL+41uNQUVN2DGez5jH4yDAprTp372DUh35aVFFA+OIiKWTcqiLvTPStm5oJcHp Yw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bg3p5atrf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 04 Oct 2021 20:40:49 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 194KUcIK086006;
 Mon, 4 Oct 2021 20:40:45 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2103.outbound.protection.outlook.com [104.47.55.103])
 by userp3020.oracle.com with ESMTP id 3bf16s0erq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 04 Oct 2021 20:40:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VxTLhOrQHiNAl1xSj4bPl6lIlyMDcf/Kzpvldt6TN71rHwCA7RXoJ3LvRqyUUjX9m069PCg8e4HvCPo9LxpS9TbCtCg2PtMLjTmKRTmlgLTnfIfRvOxqp0mlRWZejUf3ps8JOSOkYp7cUBL2rbUS728M3097evpatwEsU+YZUwZpGYLdLCEswHbAORIIMvbRVjviMYRVTi8XBsDVgmUUc8fJOuqK3bXaVgjy4dgVWxMFN2JXMQH4QqgUIyhf5N0CnSbxUbH6Dy466are6p+ez7W85eRcv00PLrSlx1RRo/wS3SG2WwO1sW0eafgJWwNHfu2JGwP6Z0OEuuCeO1zlpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=moH0R14p658/+U4bnCjuwDye7VnOmK+AmRJyTY+vZSc=;
 b=h8Plnmt+Bc1YGDzk6ZAa3Lk7HKNQVygmvnIA8c5vPz05XQu40iOVx2SIIvSLH2hKN6gpscOmp3Ql8oEgNdijjxFYx+pe5FXimR4FJMtQbtxip8ZZ4Ou4NzZibAJA4/+PT9H91JUbBA42qL4mlBikWfCUw+hOvQHvuKOrXZzA4WOXzUwxHg+FAA9hzr0hpCyHgdnC2GKhglK0sOkonvduQbWEeLnaYO4mnd4SHgiePrW2bxYwINKEykJXFzMiOZQog3s+zyMRTlcImz+6nyZw7VZAqLSimDqj2D6OyY/1opbVWLktOVT1jVDW4jd25ckhI3w1EyraudhvF48CzrCbWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=moH0R14p658/+U4bnCjuwDye7VnOmK+AmRJyTY+vZSc=;
 b=vnCKtoeIaki7giS3e2rk+O1b2nbBN423qqSMjnxfYwm3FWjtegFVErA4DNBvvJw1WGdKIIkw0hQCrZTtkFPmS+DHPB6x0oEPFjIvt0B3YA4rei9qq2Jpoo6oVjRkKAwws2MI+CvKbDpTXRNWNy+rH3DhJU7UfF7mJqi/iOVfcoY=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by CO6PR10MB5634.namprd10.prod.outlook.com (2603:10b6:303:149::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14; Mon, 4 Oct
 2021 20:40:42 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::90ef:e061:a4c2:acd6]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::90ef:e061:a4c2:acd6%7]) with mapi id 15.20.4566.022; Mon, 4 Oct 2021
 20:40:42 +0000
Subject: Re: [PATCH v6 02/10] ACPI ERST: specification for ERST support
To: Igor Mammedov <imammedo@redhat.com>
References: <1628202639-16361-1-git-send-email-eric.devolder@oracle.com>
 <1628202639-16361-3-git-send-email-eric.devolder@oracle.com>
 <20210920153825.70bcaf1a@redhat.com>
From: Eric DeVolder <eric.devolder@oracle.com>
Message-ID: <84fa8e3c-5794-35ef-f433-312a7de770d8@oracle.com>
Date: Mon, 4 Oct 2021 15:40:39 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210920153825.70bcaf1a@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA0PR11CA0062.namprd11.prod.outlook.com
 (2603:10b6:806:d2::7) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
Received: from [IPv6:2606:b400:414:8061:221:28ff:fea5:27c8]
 (2606:b400:8024:1010::112a) by SA0PR11CA0062.namprd11.prod.outlook.com
 (2603:10b6:806:d2::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend
 Transport; Mon, 4 Oct 2021 20:40:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d488354f-7cc9-4726-259b-08d987773bd7
X-MS-TrafficTypeDiagnostic: CO6PR10MB5634:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR10MB5634E0A4F1D6638F58DDBF7E97AE9@CO6PR10MB5634.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WQIp/OBYmadQ0dOeReQkPNn4lQgUqJJrsUoaq23fChmy7lzFWRUn/CSbdvttQEobs1RmfREZDqr7+FdlySC1Dr3JTi0vSXJzedD1o73NE09LmuxTkDhmqPkyD+0y6oALUaQU9GFbd5HCwl0GtEWCU/15ZuF1m8R9XXZxXRGuF4DSJiBodSaJo4a7KxCsGNwURbJg6DzC2KvvZozz1BuoE3F82ZQqo8vWXsnLjKOTuDFmUFZlYDOHcAYVZKyKTNqBJgqP9kaTDZw0tkvyBsMrtb1G9vaoNV1T5/VJ0vAbaoJYZHQDdSAbae6z05yJRfHRyXVoUNfbGGJFgahzqzNXH19dl7gsZPHkD0B1frA8DrUO/Bd1CH4Oe9cW43GteqGvs0ri2iVtdz7P5qLcQBS8Gz3riz/aE+RC+wI7FQUvRCKN9olW5lz3SaAgHiCXY0bgng8qOHrNw3upUeU28RYW7wZFRanCcsrwp3WBOkto9P/VB5fHoKq9aAv9sUzgvYisbR/fshNID3lQP/EoO+IFutPEmEE/9Nn83n5wFr8zeTuwValzv46lOe72CmEUtjyvNZon0Q0piQgCsnVrouskI5g9nJ8j3Gf1re111r3SCQzcVFa6IXPcgyYbQKgiOWNscrmeTQMoEC3H79DvVy5mVEaiBKEaajJbJN1vkZsRDdF9YH8oNahwNc7uF4vcl9x04e+4VyWc9n5p9F5ZgFG6dpt302bM+m8xGG/MIU4VaKZ9zgIGOg+cNPhjrbh3zDaU
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(36756003)(8936002)(2616005)(6486002)(8676002)(6916009)(38100700002)(508600001)(53546011)(83380400001)(4326008)(5660300002)(31696002)(66476007)(31686004)(186003)(45080400002)(86362001)(2906002)(66556008)(316002)(66946007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZFdncEVieVk5alIyMGJuQTRpVTVLT0NISy9qdkdZdFRaN0wyUmpaYW0yRVJu?=
 =?utf-8?B?c2IwQ0FGakkzMTVoWWNyOVJVcFVLaEMxVDhoSmxPQXRWNEJpOVk2TjV2dXgv?=
 =?utf-8?B?Mzh5dDVJREdUTW9QU3U1NzdCQkxuVXpOUSsvaFBHZnY3bjA3RDlMM0h5ZXZs?=
 =?utf-8?B?a0NjNXBsWVQ3cGp0YXhuMlNGdkREblZVbUp4V2ZLc2IraHdSSmdUYnBwTGVs?=
 =?utf-8?B?eVBKNGNTcEZ0UlRpeFBZME0yMkU0dDVFZUxIVmhXYXpsQi9SMElURFdxUWN4?=
 =?utf-8?B?Y1VpcE9yQTQ5UkRCUnhnbnJ2Z0tKaFMzOWxpL09ZdVg5K3AxNVB6dDIxaDUy?=
 =?utf-8?B?SnoxWXA4MU9pbkdqeFpjSW95Z2ZpVFlYYUIvK2s5enprVzdsSFdoNVpLSG01?=
 =?utf-8?B?czlQS0F0ZjhTVnRTd1krL3dhdnpDd2pVQmpmUjVycVJGQjNtUTFMbDNBM05Y?=
 =?utf-8?B?ZEs2dVZYZU94bEFCS1dRdHlISGxHWk1rVGRTZU9sWDR2VUxVSyt6RDdDSmxk?=
 =?utf-8?B?SHlhaXdRQVFTZlFkSFRyc1R0M0hpOGF3OEdweEFzRkV1clhhUEFicTJZdVo2?=
 =?utf-8?B?UzloaTE1Y3VzNlBhbkdXNE9oZEhlWDNUNVpPVlZBRXpKSmNxZ2VoNVAreDBp?=
 =?utf-8?B?V3ZYUFpHNTViTnNPN3BjK2RIWDhCcUNQNjVHQnZZdFlueFBoeGxicFBrdWhZ?=
 =?utf-8?B?VHBUcGZWUTF6M3J1cEc5TlVOQm5YTFlwZWhTS2ZaenpVVFRaMkhhS0tjaGJH?=
 =?utf-8?B?cUEzM1dlYVBiSnAvcEFIdFFPRkNEMmJQWERSaXowUmVnWkNkaHBXU2NCdHUx?=
 =?utf-8?B?bUFhZUNWN1p6blVnN3pNNmpLNjhueDRieW5pUHExMjNzUFY5TkJBendQdExX?=
 =?utf-8?B?VmFxM0tuTzNxKythUUdNbjIwN1d3NzB0RXFuNVo1SEpHaFFsRXVpTzNKbmlq?=
 =?utf-8?B?N2FKUTN1WXlGVm91bGZNLzNEMmNKSWwxbG9XM0ZlelVOOEtpYWtiVnI2NWha?=
 =?utf-8?B?MEdiWVBqbjgvYVV5WE80VlQ1OWU1akR3VnZpUjNjZkRoZ0pWZmtLbzBzUzBR?=
 =?utf-8?B?eVgydHdlMmlKdmcrTnM3UkJ1OTJUd0NiSGx6S01CMEVZQXlhNVFTZUpLeE4w?=
 =?utf-8?B?OTVCaUZXS3FwMkRPdUlmcWZlT2p6aUUzcyt3NTkyQjlaRWhGRFpLVDZ3dDVF?=
 =?utf-8?B?MG85M0Q0bi9lWjlyZkpHYkcxZSsxbHZXVFcrTlFZV3ZKZkpZWm85cDN0c2JV?=
 =?utf-8?B?NkJVNEJ4dmNaMkNuOW5wUmJmNnJMRHdSY0o1dnYwMWZNNk00UXFVWUkwQ0M4?=
 =?utf-8?B?aUg3WXB0K0NJbmRyK3ZWanFUczhyYVB0Qzc3Sm1ENzdya2k5dThsNnNTaE5F?=
 =?utf-8?B?NVFMeDdKSXdxaUNXdkxyU0xMc0R3ckRGV3BUdE0xYTdvbTh3WTR1RDMyZGFv?=
 =?utf-8?B?L2xiajc3KzdxN3FxdC9IaUl0NnBUMnpOcWlkZEMwZVZGN3pLVzloL0tnMmZT?=
 =?utf-8?B?WGJyNHFlTXZ2bnJhdUJqc1l5WmVZNEttV3J3bUFWVHR1b1FwTmR6SUpDZzEx?=
 =?utf-8?B?SkxvSnZ0WUp6UmNReUxzb0RxRlBVOHk1ZkZ2U0V5YzBxVGF1Yno4eVE0TWFI?=
 =?utf-8?B?WUQ3YVh1TWVwcllwUkVjbm0vVGRSeDNKMW56cEZzSjJLMkxtbzBKcko3M05o?=
 =?utf-8?B?c3lSWjdVVmR1UVM2QlF6M3lBd042MEVZVXZzajZzK0Z3UUVIOEU4Y2tKb1Vl?=
 =?utf-8?B?VHY5R3hqekZqK3JpWmRZVW9HSWdDOTRQbjE2ZzRkSVVOeW85U3p5MjlFUThr?=
 =?utf-8?Q?zZi2znFiM46qymirB5X3C+qNqDRv6UxheuFyM=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d488354f-7cc9-4726-259b-08d987773bd7
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2021 20:40:42.6520 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6nYV7uQlrudcPMIteZ02tczdm2OEkA/VlNhr5aGEGSm6Ebgo/vLhpx/WACb6U2qnFicaI+qCgXziIj2AF2m3ehrtSSqen7G7xtxoGPYnwr0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5634
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10127
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0
 phishscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110040138
X-Proofpoint-ORIG-GUID: Qb89ZLUfJvhq8Bu5fiWdbhKLZs6evxdR
X-Proofpoint-GUID: Qb89ZLUfJvhq8Bu5fiWdbhKLZs6evxdR
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
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 ehabkost@redhat.com, mst@redhat.com, konrad.wilk@oracle.com,
 qemu-devel@nongnu.org, pbonzini@redhat.com, boris.ostrovsky@oracle.com,
 eblake@redhat.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 9/20/21 8:38 AM, Igor Mammedov wrote:
> On Thu,  5 Aug 2021 18:30:31 -0400
> Eric DeVolder <eric.devolder@oracle.com> wrote:
> 
>> Information on the implementation of the ACPI ERST support.
>>
>> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
> 
> modulo missing parts documentation looks good to but
> I'm tainted at this point (after so many reviews) so
> libvirt folks (CCed) can take look at it and see if
> something needs to be changed here.

OK. I'll wait for Daniel's feedback before posting v7.

> 
>> ---
>>   docs/specs/acpi_erst.txt | 147 +++++++++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 147 insertions(+)
>>   create mode 100644 docs/specs/acpi_erst.txt
>>
>> diff --git a/docs/specs/acpi_erst.txt b/docs/specs/acpi_erst.txt
>> new file mode 100644
>> index 0000000..7f7544f
>> --- /dev/null
>> +++ b/docs/specs/acpi_erst.txt
>> @@ -0,0 +1,147 @@
>> +ACPI ERST DEVICE
>> +================
>> +
>> +The ACPI ERST device is utilized to support the ACPI Error Record
>> +Serialization Table, ERST, functionality. This feature is designed for
>> +storing error records in persistent storage for future reference
>> +and/or debugging.
>> +
>> +The ACPI specification[1], in Chapter "ACPI Platform Error Interfaces
>> +(APEI)", and specifically subsection "Error Serialization", outlines a
>> +method for storing error records into persistent storage.
>> +
>> +The format of error records is described in the UEFI specification[2],
>> +in Appendix N "Common Platform Error Record".
>> +
>> +While the ACPI specification allows for an NVRAM "mode" (see
>> +GET_ERROR_LOG_ADDRESS_RANGE_ATTRIBUTES) where non-volatile RAM is
>> +directly exposed for direct access by the OS/guest, this device
>> +implements the non-NVRAM "mode". This non-NVRAM "mode" is what is
>> +implemented by most BIOS (since flash memory requires programming
>> +operations in order to update its contents). Furthermore, as of the
>> +time of this writing, Linux only supports the non-NVRAM "mode".
>> +
>> +
>> +Background/Motivation
>> +---------------------
>> +
>> +Linux uses the persistent storage filesystem, pstore, to record
>> +information (eg. dmesg tail) upon panics and shutdowns.  Pstore is
>> +independent of, and runs before, kdump.  In certain scenarios (ie.
>> +hosts/guests with root filesystems on NFS/iSCSI where networking
>> +software and/or hardware fails), pstore may contain information
>> +available for post-mortem debugging.
>> +
>> +Two common storage backends for the pstore filesystem are ACPI ERST
>> +and UEFI. Most BIOS implement ACPI ERST.  UEFI is not utilized in all
>> +guests. With QEMU supporting ACPI ERST, it becomes a viable pstore
>> +storage backend for virtual machines (as it is now for bare metal
>> +machines).
>> +
>> +Enabling support for ACPI ERST facilitates a consistent method to
>> +capture kernel panic information in a wide range of guests: from
>> +resource-constrained microvms to very large guests, and in particular,
>> +in direct-boot environments (which would lack UEFI run-time services).
>> +
>> +Note that Microsoft Windows also utilizes the ACPI ERST for certain
>> +crash information, if available[3].
>> +
>> +
>> +Configuration|Usage
>> +-------------------
>> +
>> +To use ACPI ERST, a memory-backend-file object and acpi-erst device
>> +can be created, for example:
>> +
>> + qemu ...
>> + -object memory-backend-file,id=erstnvram,mem-path=acpi-erst.backing,size=0x10000,share=on \
>> + -device acpi-erst,memdev=erstnvram
>> +
>> +For proper operation, the ACPI ERST device needs a memory-backend-file
>> +object with the following parameters:
>> +
>> + - id: The id of the memory-backend-file object is used to associate
>> +   this memory with the acpi-erst device.
>> + - size: The size of the ACPI ERST backing storage. This parameter is
>> +   required.
>> + - mem-path: The location of the ACPI ERST backing storage file. This
>> +   parameter is also required.
>> + - share: The share=on parameter is required so that updates to the
>> +   ERST backing store are written to the file.
>> +
>> +and ERST device:
>> +
>> + - memdev: Is the object id of the memory-backend-file.
>> +
>> +
>> +PCI Interface
>> +-------------
>> +
>> +The ERST device is a PCI device with two BARs, one for accessing the
>> +programming registers, and the other for accessing the record exchange
>> +buffer.
>> +
>> +BAR0 contains the programming interface consisting of ACTION and VALUE
>> +64-bit registers.  All ERST actions/operations/side effects happen on
>> +the write to the ACTION, by design. Any data needed by the action must
>> +be placed into VALUE prior to writing ACTION.  Reading the VALUE
>> +simply returns the register contents, which can be updated by a
>> +previous ACTION.
>> +
>> +BAR1 contains the 8KiB record exchange buffer, which is the
>> +implemented maximum record size.
>> +
>> +
>> +Backend Storage Format
>> +----------------------
>> +
>> +The backend storage is divided into fixed size "slots", 8KiB in
>> +length, with each slot storing a single record.  Not all slots need to
>> +be occupied, and they need not be occupied in a contiguous fashion.
>> +The ability to clear/erase specific records allows for the formation
>> +of unoccupied slots.
>> +
>> +Slot 0 is reserved for a backend storage header that identifies the
>> +contents as ERST and also facilitates efficient access to the records.
>> +Depending upon the size of the backend storage, additional slots will
>> +be reserved to be a part of the slot 0 header. For example, at 8KiB,
>> +the slot 0 header can accomodate 1024 records. Thus a storage size
>> +above 8MiB (8KiB * 1024) requires an additional slot. In this
>> +scenario, slot 0 and slot 1 form the backend storage header, and
>> +records can be stored starting at slot 2.
>> +
>> +Below is an example layout of the backend storage format (for storage
>> +size less than 8MiB). The size of the storage is a multiple of 8KiB,
>> +and contains N number of slots to store records. The example below
>> +shows two records (in CPER format) in the backend storage, while the
>> +remaining slots are empty/available.
>> +
>> + Slot   Record
>> +        +--------------------------------------------+
>> +    0   | reserved: storage header                   |
> 
> typically reserved means 'not used', so I'd drop mentioning reserved
> an leave it just as storage header.
done

> 
> Also header format should be described here
done

> 
>> +        +--------------------------------------------+
>> +    1   | empty/available                            |
>> +        +--------------------------------------------+
>> +    2   | CPER                                       |
>> +        +--------------------------------------------+
> 
> how can one distinguish empty vs used slots (i.e define empty somewhere here)
done; explained in v7.

> 
>> +    3   | CPER                                       |
>> +        +--------------------------------------------+
>> +  ...   |                                            |
>> +        +--------------------------------------------+
>> +    N   | empty/available                            |
>> +        +--------------------------------------------+
>> +        <------------------ 8KiB -------------------->
>> +
>> +
>> +
>> +References
>> +----------
>> +
>> +[1] "Advanced Configuration and Power Interface Specification",
>> +    version 4.0, June 2009.
>> +
>> +[2] "Unified Extensible Firmware Interface Specification",
>> +    version 2.1, October 2008.
>> +
>> +[3] "Windows Hardware Error Architecture", specfically
>> +    "Error Record Persistence Mechanism".
> 

