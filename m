Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B7844D3D2
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 10:12:05 +0100 (CET)
Received: from localhost ([::1]:38110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ml67n-0000a9-N5
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 04:12:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1ml666-00086r-C5; Thu, 11 Nov 2021 04:10:18 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:8800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1ml663-0002Nl-TT; Thu, 11 Nov 2021 04:10:18 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AB97w6G008247; 
 Thu, 11 Nov 2021 09:10:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=content-type :
 message-id : date : subject : to : cc : references : from : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=f6QlXraprmtSnxduzcElsA8T2RBJ3S8CFJm2NVBTcPI=;
 b=yvg2I5CA7mqOTpyGhcVdpS6cDTZNpKPNXP1C4PHw4TlQ9KJ8ZKW3mNBueh5cZWhzlp3h
 FxnDTldiyruC5h3OD6ae9yj7hKDSenTcKhgnD67+W+N6AoGBtlJ++g5jne+BGm/Fu3Sc
 5KuKcpSK6L39A/1FlROYUTTGhZZLSSxtbFip6jTdLIBayjKOfzoCvIG8jRoA2oiWxNqT
 pRV9g4ZyDs8/M47pMENzVQKC9UPObyV+rP0YJW9M1dmW0XX0+Yv4HU+bPoIw0NnuE7on
 ZayykYADztDGsM/VUcjnxwhywrk++lhDgMLtD16qZb19wJPcBIRgB+RPR4yk1/mMfRAg wg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3c880s0nnt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 11 Nov 2021 09:10:04 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1AB968GZ060624;
 Thu, 11 Nov 2021 09:10:03 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2109.outbound.protection.outlook.com [104.47.58.109])
 by aserp3030.oracle.com with ESMTP id 3c5frgw3fs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 11 Nov 2021 09:10:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WA9CpYNF0tNsHjOU0r++/1IScJWSqnnhcJng1B4pQxTlQkcX3iOC/AuambgJTWdH/UmNw4hDztPJpNLv/86MPV4GpNuUPZMJrmyW4eLr1wHwJIelQ7zxQYR6mf0xvc69AfEyj3SkU+sx0zJTDco5HoKMn9L1tWsTVrskg8R0oHZzAkwqIz5Ve2vdkz4M6+wbsnRTXqujpip2B/AGd3k+awfUOV7N34GmpcrIFbyA6yqi7LD5HPkhUalhPUupXPw/P0zU2CrFzY3GKmSbySDWMJJfgS2LDobqOh9Az7q7TzR9bxVZB108XztUQdN+XvDAH9wbehIjDj9vwgwbLpkVuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f6QlXraprmtSnxduzcElsA8T2RBJ3S8CFJm2NVBTcPI=;
 b=cy+U1jNwCxMAv60nO1oTuiTdR772NRNGhTkQexfw+ZOZ9rON6nYENhRRCv7aVhkGho+9a6s7IKKb1xuTs9ikIj/hnXZR7bUUpc7J5FuJYTwOiuPLxw9YHXuMhawq9XnaoOXZwlB6SyZVPbS1mvxZYQLPVkDM+f6hpqyh1xX7uQe1Vv++HwtuuYuApRFXzkUQuYsRPx5DoQeWZoA+saGsQwBo0l1u4ny+mFCq4rkB+L4wHh8K9Yq9Baz0+w4zxDfu+6+49MJbw/ScOk4xQlbgp53wtQ4Lh7d9n2wiIu09GIzaX/CweAzdu0+0KSss96B52QVEdPdPNDMiceA+/0jUNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f6QlXraprmtSnxduzcElsA8T2RBJ3S8CFJm2NVBTcPI=;
 b=PQirEfUxPoWpY1I6poDHQnYC364qEoJO7hlt2Uu/ZM4GtuMjTicruQqwMSTVAe9Hb/ktjB6wvnuKGlZDNRlH/iPMz7JJVZzcZh3Q1jF72ziJiOYgwxyAUI1Lc46QHlpFeF8nLHuwMESKCQpv27sR0qDYAGiP49tkgelylUkcCcc=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
Received: from PH0PR10MB4664.namprd10.prod.outlook.com (2603:10b6:510:41::11)
 by PH0PR10MB4744.namprd10.prod.outlook.com (2603:10b6:510:3c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Thu, 11 Nov
 2021 09:10:00 +0000
Received: from PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::3446:f4ea:c037:4517]) by PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::3446:f4ea:c037:4517%5]) with mapi id 15.20.4669.016; Thu, 11 Nov 2021
 09:10:00 +0000
Content-Type: multipart/alternative;
 boundary="------------DqvnBl8qfdnBtO4sO92waPUe"
Message-ID: <bef45343-cf5a-e4d4-7dde-c1992581617c@oracle.com>
Date: Thu, 11 Nov 2021 04:09:56 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v9 4/8] qmp: add QMP command x-query-virtio-status
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>
References: <1636539792-20967-1-git-send-email-jonah.palmer@oracle.com>
 <1636539792-20967-5-git-send-email-jonah.palmer@oracle.com>
 <875yt0xinl.fsf@dusky.pond.sub.org>
From: Jonah Palmer <jonah.palmer@oracle.com>
In-Reply-To: <875yt0xinl.fsf@dusky.pond.sub.org>
X-ClientProxiedBy: SN4PR0501CA0111.namprd05.prod.outlook.com
 (2603:10b6:803:42::28) To PH0PR10MB4664.namprd10.prod.outlook.com
 (2603:10b6:510:41::11)
MIME-Version: 1.0
Received: from [10.39.203.104] (209.17.40.41) by
 SN4PR0501CA0111.namprd05.prod.outlook.com (2603:10b6:803:42::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.12 via Frontend
 Transport; Thu, 11 Nov 2021 09:09:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3a098170-6216-456a-1f0b-08d9a4f30a31
X-MS-TrafficTypeDiagnostic: PH0PR10MB4744:
X-Microsoft-Antispam-PRVS: <PH0PR10MB474406708E409815A753BCCFE8949@PH0PR10MB4744.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fshye0w/sE9Pt7cAwKaQxYXdBpswZVY6rUFmYYs3EsTPdnrCNx5Hvv+tVmNXbkLuefcG8X5kv3VRIRgn+51WWFqm4n0IcQFhP7fsZZKrGs/mQuEFakQ5tuYzCDit0AUrYeopa0Fn6zW9jQYSoSCtU5o4GwADL5t8WyQMeEn95KIuBxNlW3JxbEdIrFiiXiiqt/lgyt83jbJ7beOaihYpBwc5MKL4Cj35If5xrSXGnUcLJPjhDYAx7UzZxBP5pdcluSb5BY/8Yvq2Ia+h6rcRhGshIxc0pxIbfX4fLh6PQHHNqSsMF7orrtfgleoQacSbYxzQaI4sn5RXAQwpNdvQB8bXxgOChrc2WPHU2YlVlkTL1EMau16StocOLLGFa+kcYeZMg0njCecu9bqeiCogZyPVhndBMrNKc50SFVCMSC8VMh2ifu9wT1TG8ngzInu0a9i9L3l5GBl43ZkxVp398CAewa5cSLc5exPfYtm6gEQeMFAIZh1mWfaIXDHBOW5+gF7dwej8k+uQgc5SzPnVKPveOG6DyVT+G1HC3XUbtZVxt7XwGmUxIXjNLkmpI+/bFyJsEX+fkYYMZlpuSqvvLmTLP9C2TR2sPqdSYzWPwS6I14TYpAUOPpmlN2XMBHQPaFJB/5ufwyO0lKFUhM4/L5//iV1j6tTuKmhpDc+660qU3SpWc+GMcI+VTQwjIVdqmqB7lviT8jDnoR11EoJoGz92wWsqUlray0OSDlKtgkA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4664.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(956004)(7416002)(66946007)(36756003)(83380400001)(30864003)(33964004)(6486002)(44832011)(26005)(2906002)(66476007)(5660300002)(2616005)(66556008)(186003)(16576012)(38100700002)(31696002)(6916009)(53546011)(8676002)(86362001)(31686004)(316002)(8936002)(508600001)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NHA0a01jL09qYXV6dVhyN2hYVjQwZzRRNkhhdjdNRndiOTQrbXBpZHFET0tI?=
 =?utf-8?B?RDhaN0k2RzBmTEFMb2VsbTdwZmdFblFsamtMZzhwN0pOOENGZ2hvQ3pUNzMv?=
 =?utf-8?B?VnpVOFBwT0pDUnNUMFBwemg3TE1OTUVtUXRCT1dYR2xkVnFqeUJuVGpRZk9E?=
 =?utf-8?B?bStTV3ZaYTdiMXlIS0JEM1dtd0NodGxxZlJMdEdnVjZGSFh6RnBRRTFmTThE?=
 =?utf-8?B?Y2ZmSjJ6dlEwNFh0LzZLV3F6SW95YzQ4NFl2Vjl6RmpESGdobUF3ajVaL0Rr?=
 =?utf-8?B?NkE2bVg1dmh0VWRpSkYyVmVPaW0xQlk5Q0c5YjFDdW5sNXdkazhEZkE1cStP?=
 =?utf-8?B?VHpaV1R2WDVDSk4zVktvZDA2TVNVNXIyNk1XYjZ1dzI2TlpNWHFDb0RrVGdt?=
 =?utf-8?B?Z1VmSndQVW9uRlF3Z3k5L0Q3WDVrK3Z6bGwxVGFkVmlQNkRHNVRYdEhPb0xK?=
 =?utf-8?B?MUlVdmovUHhOWjdMd2U3bGVlSEd2VENwR0tFVUZVbEN2MGFqT2VyZGkvQmpy?=
 =?utf-8?B?clNYVjhvYVVuWS9IMll2emVqSDRyYThUUnY3MDNpYndSQ0dTcDJqMm9FME02?=
 =?utf-8?B?TDRmeVdUQU9PMURYWDNWRnlBTEpuQkN2ODNYcmpHaUNsSmUyeTE4OEFFWHM3?=
 =?utf-8?B?KzkyaUNab0EydTBwc05EQ3pVWDVGUFZnZ3BieTNOSjIzQU9uSWFWTzhhRVFz?=
 =?utf-8?B?eERxVC9aZXRMaEI0WUhUdVQxeG9rNk1sTENNR2FqdWdTQmswVzQxVkJEbzBk?=
 =?utf-8?B?N25EaVRBU1poNGF1TXlvbFlPUEhFQ1R0bVpWMGhqU3RpeCtQb3ZIK3QrNUgv?=
 =?utf-8?B?aXkxRWtndHh1T0kwdnE4Q3NJTTJpcU04Vm9KV1lqc1BJMzJhOUwxOExLb01F?=
 =?utf-8?B?TVhFSlUzTzRidHp5OUhINFYvYnNkQlY5VUV6TTVTY2FNc2YrVkJoSm1lRDc2?=
 =?utf-8?B?dXF4UUliOW8zSk9iRnh5V1RyV2tLb3EvMzZhVVd3WklKL2hpblpRdGVaVTVV?=
 =?utf-8?B?akd3aC9YNlAxYjhHaDdGVG9MR0h1bzBBY2N2UzlrVmROa1o3Q25YaXhNREpj?=
 =?utf-8?B?OUZpRGpzYUloSmw2ZVRCUzk1alFYNy9oRGhBSWFjcFEzYzR4dVhSckc2S0VD?=
 =?utf-8?B?QmNHeFZLNXNWb1dCbEVSZnZGTGxzODhRa0krNE5xUEk4OXNhbnY4bWdzNDBX?=
 =?utf-8?B?QitlZTVRMnRHNTlDWXA0RUFyc0ZRb1MrVVZpQWc2dHY1VjR0NjNTUmE5SGlQ?=
 =?utf-8?B?SXVJVER4bHZGcTNFRnBmMWY3T2F5S2hNV3RZT1N0WmhzM05DV0VMK0RrOHlN?=
 =?utf-8?B?Uk0xZFBScXVSRUVObW9KQ3dEV2VVN3dZdHNuSDNlSm51OW5QRTc4ZnNyZ2xQ?=
 =?utf-8?B?ekdTdU4yVUJ0bS9Qd013YzlJRDl6RUFtTGVNS3hLMEdYZ1BhNGdaRE9Ud2Vs?=
 =?utf-8?B?MSt3eFhWV3A3d1crcjBBR0ZuY29KejlvNHRlbExPREJwUmNCUXRMVlJDdERh?=
 =?utf-8?B?bDI3MXlhajRHZFp1UHUzUXhkUmZlNWZyWVZBUnVYNzIyN1hvb1diVHV3Ylcv?=
 =?utf-8?B?MmJCTUprZTVRK3RnaHJIeVBYU2VQZllUWVlTcHpQQ0YrQU5hdENLcVA5NUxE?=
 =?utf-8?B?eGYxZUZsUVJhQ2ZFY0xSL3J1NVVhZHFtRkRVZXM4b1NWN3JnbktVeUhlUDVx?=
 =?utf-8?B?N3Z0VGwyWUtjaWxWcVR2aXBZaVQxQ2hzTHhITHVuNkxQM0VzREJIS3djVEk4?=
 =?utf-8?B?ZFZ5U1VXUDc5aDBobTRxYzc2Z0lLS1BGRjc3RmdxY3c1ZHdzNS80YnAzVjkw?=
 =?utf-8?B?Q3RqOUZYWWFiM2dOaFNqL2lJR3VHejd6elJHRGptTWRWQ2FDZDh1ZGNBS3pk?=
 =?utf-8?B?VG9DZm55MVltYU9lWVBWTFVxTzV3ZWhqTUFCc0NmMW5tOGF6cEVJQ0ZjRlYy?=
 =?utf-8?B?V1RiWHl1U3M1Q3NYNVlLcytFMHY1dWNHMFpFRmZ1TEU4VFJHOUYwN3kyczkw?=
 =?utf-8?B?TEdIZmpaU3ZDdHRoUjRlWkpXWVBxejFoNTJpVGE0U2poUEJEeTlLNHJwb252?=
 =?utf-8?B?cCtRanlmMklYOUx2WXBBZFpVZmcrK0NDblg2RTdkTUI5bTV3QzRVZmRVb2dF?=
 =?utf-8?B?cWRsQ1BzdWc1V1c1Q3JWN2crREFXMnN6WHlaSUpsQnRkYVV6WkYyLzlISmZ3?=
 =?utf-8?Q?5g0Ep0IQAZGRAQaEq2cVZFk=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a098170-6216-456a-1f0b-08d9a4f30a31
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4664.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2021 09:10:00.5959 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d8mCPlSvD0m/EezA1V1MC/kdjmSzYqwAteENVOVfGovEmWrKqsGhENRGDfADSKwrISVWx3b1e3cIkvnwcCIpJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4744
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10164
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 mlxscore=0
 suspectscore=0 bulkscore=0 spamscore=0 phishscore=0 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111110054
X-Proofpoint-GUID: riepeTPO1ozzDr-b0xdVzlFfeXzx0Vgx
X-Proofpoint-ORIG-GUID: riepeTPO1ozzDr-b0xdVzlFfeXzx0Vgx
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=jonah.palmer@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-3.999, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: mst@redhat.com, qemu_oss@crudebyte.com, qemu-devel@nongnu.org,
 kraxel@redhat.com, si-wei.liu@oracle.com, joao.m.martins@oracle.com,
 eblake@redhat.com, qemu-block@nongnu.org, david@redhat.com,
 arei.gonglei@huawei.com, marcandre.lureau@redhat.com, lvivier@redhat.com,
 thuth@redhat.com, michael.roth@amd.com, groug@kaod.org, dgilbert@redhat.com,
 eric.auger@redhat.com, stefanha@redhat.com, boris.ostrovsky@oracle.com,
 kwolf@redhat.com, mathieu.poirier@linaro.org, raphael.norwitz@nutanix.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--------------DqvnBl8qfdnBtO4sO92waPUe
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 11/10/21 08:08, Markus Armbruster wrote:
> Jonah Palmer<jonah.palmer@oracle.com>  writes:
>
>> From: Laurent Vivier<lvivier@redhat.com>
>>
>> This new command shows the status of a VirtIODevice, including
>> its corresponding vhost device status (if active).
>>
>> Next patch will improve output by decoding feature bits, including
>> vhost device's feature bits (backend, protocol, acked, and features).
>> Also will decode status bits of a VirtIODevice.
>>
>> Next patch will also suppress the vhost device field from displaying
>> if no vhost device is active for a given VirtIODevice.
>>
>> Signed-off-by: Jonah Palmer<jonah.palmer@oracle.com>
> [...]
>
>> diff --git a/qapi/virtio.json b/qapi/virtio.json
>> index 324ba8c..54212f2 100644
>> --- a/qapi/virtio.json
>> +++ b/qapi/virtio.json
>> @@ -53,3 +53,249 @@
>>   
>>   { 'command': 'x-query-virtio', 'returns': ['VirtioInfo'],
>>     'features': [ 'unstable' ] }
>> +
>> +##
>> +# @VirtioStatusEndianness:
>> +#
>> +# Enumeration of endianness for VirtioDevice
>> +#
>> +# Since: 6.3
>> +##
>> +
>> +{ 'enum': 'VirtioStatusEndianness',
>> +  'data': [ 'unknown', 'little', 'big' ]
>> +}
>> +
>> +##
>> +# @VhostStatus:
>> +#
>> +# Information about a vhost device. This information will only be
>> +# displayed if the vhost device is active.
>> +#
>> +# @n-mem-sections: vhost_dev n_mem_sections
>> +#
>> +# @n-tmp-sections: vhost_dev n_tmp_sections
>> +#
>> +# @nvqs: vhost_dev nvqs. This is the number of virtqueues being used
>> +#        by the vhost device.
>> +#
>> +# @vq-index: vhost_dev vq_index
>> +#
>> +# @features: vhost_dev features
>> +#
>> +# @acked-features: vhost_dev acked_features
>> +#
>> +# @backend-features: vhost_dev backend_features
>> +#
>> +# @protocol-features: vhost_dev protocol_features
>> +#
>> +# @max-queues: vhost_dev max_queues
>> +#
>> +# @backend-cap: vhost_dev backend_cap
>> +#
>> +# @log-enabled: vhost_dev log_enabled flag
>> +#
>> +# @log-size: vhost_dev log_size
>> +#
>> +# Since: 6.3
>> +#
>> +##
>> +
>> +{ 'struct': 'VhostStatus',
>> +  'data': { 'n-mem-sections': 'int',
>> +            'n-tmp-sections': 'int',
>> +            'nvqs': 'uint32',
>> +            'vq-index': 'int',
>> +            'features': 'uint64',
>> +            'acked-features': 'uint64',
>> +            'backend-features': 'uint64',
>> +            'protocol-features': 'uint64',
>> +            'max-queues': 'uint64',
>> +            'backend-cap': 'uint64',
>> +            'log-enabled': 'bool',
>> +            'log-size': 'uint64' } }
>> +
>> +##
>> +# @VirtioStatus:
>> +#
>> +# Full status of the virtio device with most VirtIODevice members.
>> +# Also includes the full status of the corresponding vhost device
>> +# if the vhost device is active.
>> +#
>> +# @name: VirtIODevice name
>> +#
>> +# @device-id: VirtIODevice ID
>> +#
>> +# @vhost-started: VirtIODevice vhost_started flag
>> +#
>> +# @guest-features: VirtIODevice guest_features
>> +#
>> +# @host-features: VirtIODevice host_features
>> +#
>> +# @backend-features: VirtIODevice backend_features
>> +#
>> +# @device-endian: VirtIODevice device_endian
>> +#
>> +# @num-vqs: VirtIODevice virtqueue count. This is the number of active
>> +#           virtqueues being used by the VirtIODevice.
>> +#
>> +# @status: VirtIODevice configuration status (e.g. DRIVER_OK,
>> +#          FEATURES_OK, DRIVER, etc.)
>> +#
>> +# @isr: VirtIODevice ISR
>> +#
>> +# @queue-sel: VirtIODevice queue_sel
>> +#
>> +# @vm-running: VirtIODevice vm_running flag
>> +#
>> +# @broken: VirtIODevice broken flag
>> +#
>> +# @disabled: VirtIODevice disabled flag
>> +#
>> +# @use-started: VirtIODevice use_started flag
>> +#
>> +# @started: VirtIODevice started flag
>> +#
>> +# @start-on-kick: VirtIODevice start_on_kick flag
>> +#
>> +# @disable-legacy-check: VirtIODevice disabled_legacy_check flag
>> +#
>> +# @bus-name: VirtIODevice bus_name
>> +#
>> +# @use-guest-notifier-mask: VirtIODevice use_guest_notifier_mask flag
>> +#
>> +# @vhost-dev: corresponding vhost device info for a given VirtIODevice
>> +#
>> +# Since: 6.3
>> +#
>> +##
>> +
>> +{ 'struct': 'VirtioStatus',
>> +  'data': { 'name': 'str',
>> +            'device-id': 'uint16',
>> +            'vhost-started': 'bool',
>> +            'guest-features': 'uint64',
>> +            'host-features': 'uint64',
>> +            'backend-features': 'uint64',
>> +            'device-endian': 'VirtioStatusEndianness',
>> +            'num-vqs': 'int',
>> +            'status': 'uint8',
>> +            'isr': 'uint8',
>> +            'queue-sel': 'uint16',
>> +            'vm-running': 'bool',
>> +            'broken': 'bool',
>> +            'disabled': 'bool',
>> +            'use-started': 'bool',
>> +            'started': 'bool',
>> +            'start-on-kick': 'bool',
>> +            'disable-legacy-check': 'bool',
>> +            'bus-name': 'str',
>> +            'use-guest-notifier-mask': 'bool',
>> +            'vhost-dev': 'VhostStatus' } }
>> +
>> +##
>> +# @x-query-virtio-status:
>> +#
>> +# Poll for a comprehensive status of a given virtio device
>> +#
>> +# @path: Canonical QOM path of the VirtIODevice
>> +#
>> +# Features:
>> +# @unstable: This command is meant for debugging.
>> +#
>> +# Returns: VirtioStatus of the virtio device
>> +#
>> +# Since: 6.3
>> +#
>> +# Examples:
>> +#
>> +# 1. Poll for the status of virtio-crypto (no vhost-crypto active)
>> +#
>> +# -> { "execute": "x-query-virtio-status",
>> +#      "arguments": { "path": "/machine/peripheral/crypto0/virtio-backend" }
>> +#    }
>> +# <- { "return": {
>> +#          "device-endian": "little",
>> +#          "bus-name": "",
>> +#          "disable-legacy-check": false,
>> +#          "name": "virtio-crypto",
>> +#          "started": true,
>> +#          "device-id": 20,
>> +#          "vhost-dev": {
>> +#               "n-tmp-sections": 0,
>> +#               "n-mem-sections": 0,
>> +#               "max-queues": 0,
>> +#               "backend-cap": 0,
>> +#               "log-size": 0,
>> +#               "backend-features": 0,
>> +#               "nvqs": 0,
>> +#               "protocol-features": 0,
>> +#               "vq-index": 0,
>> +#               "log-enabled": false,
>> +#               "acked-features": 0,
>> +#               "features": 0
>> +#          },
>> +#          "backend-features": 0,
>> +#          "start-on-kick": false,
>> +#          "isr": 1,
>> +#          "broken": false,
>> +#          "status": 15,
>> +#          "num-vqs": 2,
>> +#          "guest-features": 5100273664,
>> +#          "host-features": 6325010432,
>> +#          "use-guest-notifier-mask": true,
>> +#          "vm-running": true,
>> +#          "queue-sel": 1,
>> +#          "disabled": false,
>> +#          "vhost-started": false,
>> +#          "use-started": true
>> +#      }
>> +#    }
>> +#
>> +# 2. Poll for the status of virtio-net (vhost-net is active)
>> +#
>> +# -> { "execute": "x-query-virtio-status",
>> +#      "arguments": { "path": "/machine/peripheral-anon/device[1]/virtio-backend" }
>> +#    }
>> +# <- { "return": {
>> +#          "device-endian": "little",
>> +#          "bus-name": "",
>> +#          "disabled-legacy-check": false,
>> +#          "name": "virtio-net",
>> +#          "started": true,
>> +#          "device-id": 1,
>> +#          "vhost-dev": {
>> +#               "n-tmp-sections": 4,
>> +#               "n-mem-sections": 4,
>> +#               "max-queues": 1,
>> +#               "backend-cap": 2,
>> +#               "log-size": 0,
>> +#               "backend-features": 0,
>> +#               "nvqs": 2,
>> +#               "protocol-features": 0,
>> +#               "vq-index": 0,
>> +#               "log-enabled": false,
>> +#               "acked-features": 5100306432,
>> +#               "features": 13908344832
>> +#          },
>> +#          "backend-features": 6337593319,
>> +#          "start-on-kick": false,
>> +#          "isr": 1,
>> +#          "broken": false,
>> +#          "status": 15,
>> +#          "num-vqs": 3,
>> +#          "guest-features": 5111807911,
>> +#          "host-features": 6337593319,
>> +#          "use-guest-notifier-mask": true,
>> +#          "vm-running": true,
>> +#          "queue-sel": 2,
>> +#          "disabled": false,
>> +#          "vhost-started": true,
>> +#          "use-started": true
>> +#      }
>> +#    }
>> +#
>> +##
>> +
>> +{ 'command': 'x-query-virtio-status', 'data': { 'path': 'str' },
>> +  'returns': 'VirtioStatus', 'features': [ 'unstable' ] }
> There's precedence for this style, but I find
>
>     { 'command': 'x-query-virtio-status',
>       'data': { 'path': 'str' },
>       'returns': 'VirtioStatus',
>       'features': [ 'unstable' ] }
>
> easier to read.

I agree. I will format all QMP commands like so in the next series.

Jonah

>
--------------DqvnBl8qfdnBtO4sO92waPUe
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 11/10/21 08:08, Markus Armbruster
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:875yt0xinl.fsf@dusky.pond.sub.org">
      <pre class="moz-quote-pre" wrap="">Jonah Palmer <a class="moz-txt-link-rfc2396E" href="mailto:jonah.palmer@oracle.com">&lt;jonah.palmer@oracle.com&gt;</a> writes:

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">From: Laurent Vivier <a class="moz-txt-link-rfc2396E" href="mailto:lvivier@redhat.com">&lt;lvivier@redhat.com&gt;</a>

This new command shows the status of a VirtIODevice, including
its corresponding vhost device status (if active).

Next patch will improve output by decoding feature bits, including
vhost device's feature bits (backend, protocol, acked, and features).
Also will decode status bits of a VirtIODevice.

Next patch will also suppress the vhost device field from displaying
if no vhost device is active for a given VirtIODevice.

Signed-off-by: Jonah Palmer <a class="moz-txt-link-rfc2396E" href="mailto:jonah.palmer@oracle.com">&lt;jonah.palmer@oracle.com&gt;</a>
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
[...]

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">diff --git a/qapi/virtio.json b/qapi/virtio.json
index 324ba8c..54212f2 100644
--- a/qapi/virtio.json
+++ b/qapi/virtio.json
@@ -53,3 +53,249 @@
 
 { 'command': 'x-query-virtio', 'returns': ['VirtioInfo'],
   'features': [ 'unstable' ] }
+
+##
+# @VirtioStatusEndianness:
+#
+# Enumeration of endianness for VirtioDevice
+#
+# Since: 6.3
+##
+
+{ 'enum': 'VirtioStatusEndianness',
+  'data': [ 'unknown', 'little', 'big' ]
+}
+
+##
+# @VhostStatus:
+#
+# Information about a vhost device. This information will only be
+# displayed if the vhost device is active.
+#
+# @n-mem-sections: vhost_dev n_mem_sections
+#
+# @n-tmp-sections: vhost_dev n_tmp_sections
+#
+# @nvqs: vhost_dev nvqs. This is the number of virtqueues being used
+#        by the vhost device.
+#
+# @vq-index: vhost_dev vq_index
+#
+# @features: vhost_dev features
+#
+# @acked-features: vhost_dev acked_features
+#
+# @backend-features: vhost_dev backend_features
+#
+# @protocol-features: vhost_dev protocol_features
+#
+# @max-queues: vhost_dev max_queues
+#
+# @backend-cap: vhost_dev backend_cap
+#
+# @log-enabled: vhost_dev log_enabled flag
+#
+# @log-size: vhost_dev log_size
+#
+# Since: 6.3
+#
+##
+
+{ 'struct': 'VhostStatus',
+  'data': { 'n-mem-sections': 'int',
+            'n-tmp-sections': 'int',
+            'nvqs': 'uint32',
+            'vq-index': 'int',
+            'features': 'uint64',
+            'acked-features': 'uint64',
+            'backend-features': 'uint64',
+            'protocol-features': 'uint64',
+            'max-queues': 'uint64',
+            'backend-cap': 'uint64',
+            'log-enabled': 'bool',
+            'log-size': 'uint64' } }
+
+##
+# @VirtioStatus:
+#
+# Full status of the virtio device with most VirtIODevice members.
+# Also includes the full status of the corresponding vhost device
+# if the vhost device is active.
+#
+# @name: VirtIODevice name
+#
+# @device-id: VirtIODevice ID
+#
+# @vhost-started: VirtIODevice vhost_started flag
+#
+# @guest-features: VirtIODevice guest_features
+#
+# @host-features: VirtIODevice host_features
+#
+# @backend-features: VirtIODevice backend_features
+#
+# @device-endian: VirtIODevice device_endian
+#
+# @num-vqs: VirtIODevice virtqueue count. This is the number of active
+#           virtqueues being used by the VirtIODevice.
+#
+# @status: VirtIODevice configuration status (e.g. DRIVER_OK,
+#          FEATURES_OK, DRIVER, etc.)
+#
+# @isr: VirtIODevice ISR
+#
+# @queue-sel: VirtIODevice queue_sel
+#
+# @vm-running: VirtIODevice vm_running flag
+#
+# @broken: VirtIODevice broken flag
+#
+# @disabled: VirtIODevice disabled flag
+#
+# @use-started: VirtIODevice use_started flag
+#
+# @started: VirtIODevice started flag
+#
+# @start-on-kick: VirtIODevice start_on_kick flag
+#
+# @disable-legacy-check: VirtIODevice disabled_legacy_check flag
+#
+# @bus-name: VirtIODevice bus_name
+#
+# @use-guest-notifier-mask: VirtIODevice use_guest_notifier_mask flag
+#
+# @vhost-dev: corresponding vhost device info for a given VirtIODevice
+#
+# Since: 6.3
+#
+##
+
+{ 'struct': 'VirtioStatus',
+  'data': { 'name': 'str',
+            'device-id': 'uint16',
+            'vhost-started': 'bool',
+            'guest-features': 'uint64',
+            'host-features': 'uint64',
+            'backend-features': 'uint64',
+            'device-endian': 'VirtioStatusEndianness',
+            'num-vqs': 'int',
+            'status': 'uint8',
+            'isr': 'uint8',
+            'queue-sel': 'uint16',
+            'vm-running': 'bool',
+            'broken': 'bool',
+            'disabled': 'bool',
+            'use-started': 'bool',
+            'started': 'bool',
+            'start-on-kick': 'bool',
+            'disable-legacy-check': 'bool',
+            'bus-name': 'str',
+            'use-guest-notifier-mask': 'bool',
+            'vhost-dev': 'VhostStatus' } }
+
+##
+# @x-query-virtio-status:
+#
+# Poll for a comprehensive status of a given virtio device
+#
+# @path: Canonical QOM path of the VirtIODevice
+#
+# Features:
+# @unstable: This command is meant for debugging.
+#
+# Returns: VirtioStatus of the virtio device
+#
+# Since: 6.3
+#
+# Examples:
+#
+# 1. Poll for the status of virtio-crypto (no vhost-crypto active)
+#
+# -&gt; { &quot;execute&quot;: &quot;x-query-virtio-status&quot;,
+#      &quot;arguments&quot;: { &quot;path&quot;: &quot;/machine/peripheral/crypto0/virtio-backend&quot; }
+#    }
+# &lt;- { &quot;return&quot;: {
+#          &quot;device-endian&quot;: &quot;little&quot;,
+#          &quot;bus-name&quot;: &quot;&quot;,
+#          &quot;disable-legacy-check&quot;: false,
+#          &quot;name&quot;: &quot;virtio-crypto&quot;,
+#          &quot;started&quot;: true,
+#          &quot;device-id&quot;: 20,
+#          &quot;vhost-dev&quot;: {
+#               &quot;n-tmp-sections&quot;: 0,
+#               &quot;n-mem-sections&quot;: 0,
+#               &quot;max-queues&quot;: 0,
+#               &quot;backend-cap&quot;: 0,
+#               &quot;log-size&quot;: 0,
+#               &quot;backend-features&quot;: 0,
+#               &quot;nvqs&quot;: 0,
+#               &quot;protocol-features&quot;: 0,
+#               &quot;vq-index&quot;: 0,
+#               &quot;log-enabled&quot;: false,
+#               &quot;acked-features&quot;: 0,
+#               &quot;features&quot;: 0
+#          },
+#          &quot;backend-features&quot;: 0,
+#          &quot;start-on-kick&quot;: false,
+#          &quot;isr&quot;: 1,
+#          &quot;broken&quot;: false,
+#          &quot;status&quot;: 15,
+#          &quot;num-vqs&quot;: 2,
+#          &quot;guest-features&quot;: 5100273664,
+#          &quot;host-features&quot;: 6325010432,
+#          &quot;use-guest-notifier-mask&quot;: true,
+#          &quot;vm-running&quot;: true,
+#          &quot;queue-sel&quot;: 1,
+#          &quot;disabled&quot;: false,
+#          &quot;vhost-started&quot;: false,
+#          &quot;use-started&quot;: true
+#      }
+#    }
+#
+# 2. Poll for the status of virtio-net (vhost-net is active)
+#
+# -&gt; { &quot;execute&quot;: &quot;x-query-virtio-status&quot;,
+#      &quot;arguments&quot;: { &quot;path&quot;: &quot;/machine/peripheral-anon/device[1]/virtio-backend&quot; }
+#    }
+# &lt;- { &quot;return&quot;: {
+#          &quot;device-endian&quot;: &quot;little&quot;,
+#          &quot;bus-name&quot;: &quot;&quot;,
+#          &quot;disabled-legacy-check&quot;: false,
+#          &quot;name&quot;: &quot;virtio-net&quot;,
+#          &quot;started&quot;: true,
+#          &quot;device-id&quot;: 1,
+#          &quot;vhost-dev&quot;: {
+#               &quot;n-tmp-sections&quot;: 4,
+#               &quot;n-mem-sections&quot;: 4,
+#               &quot;max-queues&quot;: 1,
+#               &quot;backend-cap&quot;: 2,
+#               &quot;log-size&quot;: 0,
+#               &quot;backend-features&quot;: 0,
+#               &quot;nvqs&quot;: 2,
+#               &quot;protocol-features&quot;: 0,
+#               &quot;vq-index&quot;: 0,
+#               &quot;log-enabled&quot;: false,
+#               &quot;acked-features&quot;: 5100306432,
+#               &quot;features&quot;: 13908344832
+#          },
+#          &quot;backend-features&quot;: 6337593319,
+#          &quot;start-on-kick&quot;: false,
+#          &quot;isr&quot;: 1,
+#          &quot;broken&quot;: false,
+#          &quot;status&quot;: 15,
+#          &quot;num-vqs&quot;: 3,
+#          &quot;guest-features&quot;: 5111807911,
+#          &quot;host-features&quot;: 6337593319,
+#          &quot;use-guest-notifier-mask&quot;: true,
+#          &quot;vm-running&quot;: true,
+#          &quot;queue-sel&quot;: 2,
+#          &quot;disabled&quot;: false,
+#          &quot;vhost-started&quot;: true,
+#          &quot;use-started&quot;: true
+#      }
+#    }
+#
+##
+
+{ 'command': 'x-query-virtio-status', 'data': { 'path': 'str' },
+  'returns': 'VirtioStatus', 'features': [ 'unstable' ] }
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
There's precedence for this style, but I find

   { 'command': 'x-query-virtio-status',
     'data': { 'path': 'str' },
     'returns': 'VirtioStatus',
     'features': [ 'unstable' ] }

easier to read.</pre>
    </blockquote>
    <pre>I agree. I will format all QMP commands like so in the next series.

Jonah
</pre>
    <blockquote type="cite" cite="mid:875yt0xinl.fsf@dusky.pond.sub.org">
      <pre class="moz-quote-pre" wrap="">

</pre>
    </blockquote>
  </body>
</html>
--------------DqvnBl8qfdnBtO4sO92waPUe--

