Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10488486A6F
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 20:18:07 +0100 (CET)
Received: from localhost ([::1]:53544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5YGz-0003ct-KI
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 14:18:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1n5YDF-0001s2-AN
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 14:14:13 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:55552)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1n5YDC-00087T-As
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 14:14:13 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 206HTK3n011025; 
 Thu, 6 Jan 2022 19:13:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=SiTrxJFN1za8jb/rEIV0W6xcag1CuKMPj5zVgby1DUY=;
 b=BJxeDYh7l26mlaBvHdj0BmPbAXIGRkni2OPoIwiIu19ghMpRsot6aqy1qfgxI+1QarMQ
 2Xf50OYNZLxmtoKYKwbBuPT9sXvigiLK0ZSGqRkXmteFs0gtESMMuIZKyPpCHP+gSix0
 qPAkFHOK5mIIrG4lMHPpKIDq+27ZqNDV15Tz7iBs4HSV9O1ImIUAC+g4UIvWO5uZNrl0
 spAuSPQmm3xJ2uD0OjYDT43JM+1saCRXQiypIC1kYEYNnBBaPZPnMOgdvUEBrzrveUoX
 C8ajqL8Mi9XGu/aIvPPBY7BhNL+XrD2MtiPZSejD7SpqFwXWeGdQ8ncHW1sLTCRT4n3V bQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3de4vb881v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 06 Jan 2022 19:13:51 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 206Iti2k146902;
 Thu, 6 Jan 2022 19:13:50 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1anam02lp2048.outbound.protection.outlook.com [104.47.57.48])
 by aserp3020.oracle.com with ESMTP id 3de4vv5bem-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 06 Jan 2022 19:13:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HfPA66MXER1PgmM90vAnE5T/oVgMPvgN7tbTmtweGhuoTAtW1/T3qgqJX7ogH1cS9g93VacKeNDafM/IVHhEf6AWXuA24C8ZH58Y+Kwq3Z0vdpPh3zOkzuw07O7aO3gs8+pLkv4jY/maxoppjONXWYgMUGd/xxuLiZQTCM9+Dv1f3hriuPTaEMrm61lvqI1qSPynMVFYhwvRCa1k2xzeG7totmedwLqmuQTn7H8HE7+imPSX4hjjaOtWwTS9FAhi9Za+DsXMoy/NCNLrbSYR4Pcihw6ANdBhRMP7AabbrJGAKrc8qRdjy/8I96raX1XydEZnouwCDvKFLeUx1p+VNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SiTrxJFN1za8jb/rEIV0W6xcag1CuKMPj5zVgby1DUY=;
 b=XY9Y5w6cQK54aEkwAHKfudCx4adVMOAvB49luUsmlzNSV60o7/J8OfMSGlnqK6Afpk2riDrqkruR/UFDAmCTIutE73CPDCf441ZctOxpnAo0vS9sqHGmitRemzAPGJZwzhZSJhYyqHi1fENpER0OT08mI96UQs1osmolZeXsfz9fM7Wwx5DjKNOpy1NnT8Rb6X2ycjIffAyPQ/vo4UMDVfbt6ocAHwSqgFgUdf/flox2j2KUpbxNSGx2UyXhHx+e0+2fzUTumuvL55zmbBdpkJpJ/vMT6EAJGUcAv7tK7KmJve/JgdqpY3nWR+iRx2nIC52S4mPRf9qkPfn8rrT1KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SiTrxJFN1za8jb/rEIV0W6xcag1CuKMPj5zVgby1DUY=;
 b=Gk7DBrdU0gkeqTeJ2oqQTAhh7TMaMGE53mneoG/OqMmZ7ckxuywdRaTkvASIXCnx1gbtCsIJaC+wT+5TZ4IE7Kt8KtccFPqaTK8dkEGlctWO3s/nCqjEO/VqKaEvJzazYBOtu53ClCrJHnD24487v9ZAuDk0netfeOf0y4Q1K0I=
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BY5PR10MB4339.namprd10.prod.outlook.com (2603:10b6:a03:20a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Thu, 6 Jan
 2022 19:13:48 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::d91d:1a8b:56bd:6623]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::d91d:1a8b:56bd:6623%5]) with mapi id 15.20.4844.017; Thu, 6 Jan 2022
 19:13:48 +0000
Message-ID: <c74374d4-9f1e-1cc9-c525-f039ffacb379@oracle.com>
Date: Thu, 6 Jan 2022 14:13:44 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH V7 19/29] vfio-pci: cpr part 1 (fd and dma)
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <1640199934-455149-1-git-send-email-steven.sistare@oracle.com>
 <1640199934-455149-20-git-send-email-steven.sistare@oracle.com>
 <20211222181003-mutt-send-email-mst@kernel.org>
 <f1cadf51-795b-200c-8abb-f8f97b34c228@oracle.com>
 <20220105161046-mutt-send-email-mst@kernel.org>
 <e95009cf-aea2-7fc7-c049-687c1badc471@oracle.com>
 <20220105180332-mutt-send-email-mst@kernel.org>
 <c080ec57-d9e1-3e1b-11ab-5bb3f9c13508@oracle.com>
 <20220106040130-mutt-send-email-mst@kernel.org>
From: Steven Sistare <steven.sistare@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <20220106040130-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA9PR11CA0027.namprd11.prod.outlook.com
 (2603:10b6:806:6e::32) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fc2ace77-14c4-4f27-4e1a-08d9d148aada
X-MS-TrafficTypeDiagnostic: BY5PR10MB4339:EE_
X-Microsoft-Antispam-PRVS: <BY5PR10MB43392DD918B8AD2BB4E97C23F94C9@BY5PR10MB4339.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dWOGyHl61RpXmsAor944KV5wyq0C7PLZ2UDGeg1VwMVVEZdhh1lFhGMejivM4a6oQW48w0p2eD5XfSg/qXtUy7R48m2XNBmZuK6oKqXaN8c8RlI9ksLmtiLtpuqq3Ws03Z874r41zhMVWBhkucRQ1jIobIKH7B4lFea8ntgJuq+AJmFFS4o3aqPPWynSLHbcjSO6dD0Vsll9nSrn5vALgTW1uyjnxTYZgv5oevYfvjFo/FoA8SGMeDRDGqIjY7AugTpLYNvvYu0yWv4MKgOUbkqqbW2p3vd72XXpdDh5L5QTqkCaHBYvNdQEgTt9+2hqu4eW021x1i+Esd5FKbYG7VZTlp2oNPh6QYG2hZs2lS6pLt/sQnj2R0BQ2+TWMmNPyqdyOPR64Jz3Zcme7HDNpGpqtbqZKrdi5Atajqn51TuVu2pc30pCV4kSs/IRgnFMVmqocp7Mnkf2BxRyqlPR/Ffaqap7x9ekVu7FGvcHsKXI3Rov+dcCkPwtqIwpElGrFGghLRbOQ8yQbpDD0sgNcVbbPSkn0z8PaJgPO34zCSnR1D8VttIlJgvCLPizDyRQ4N38hSugnRImxpBzKmsXGJ6fkrIhO9HWK5MAA6VEeVj7vKJpSo2jKG5OdacTO62737pop79FH6Us7i4xJGK8UhHAXpJlMldDUEyNxg56kla8xwBSUlvcwEvGTnUWAQgNNqaLqAx97VsqxQvvdASJV8PF6CWpZb7Gnp6PLKUXCnI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(316002)(186003)(6512007)(86362001)(83380400001)(5660300002)(38100700002)(2616005)(26005)(66476007)(4326008)(66946007)(6916009)(6506007)(53546011)(44832011)(2906002)(54906003)(36756003)(66556008)(36916002)(6486002)(508600001)(6666004)(7416002)(8936002)(31696002)(107886003)(31686004)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MGxKZ1RZTTArWVRiU1RWcEFVOHlpYndnZ28xdnIxQkVEYVVTclVseDhzUkNU?=
 =?utf-8?B?MG9jdUdWZ1MwakI5VFdwTGxLWUZBc2g0Q2dlZm9rUmpFV3FLNVFzT2dadW1o?=
 =?utf-8?B?UU04VFdGNHZDMWRIZC80M1lFajdPZ0hNVWErREJEcmVRNWFLeEVKUFNheCtV?=
 =?utf-8?B?b2Zhak5lcVR2SjVlRmJjWXExRXA1VVBtRGtlalJRdFRNTXRIdEF2ck1NKytj?=
 =?utf-8?B?Rmg3TVAwdDBUMWtLdFJyVndxZUZCeEdISzI1UHpoYUdJNUJqWDNkY09ZQ0NY?=
 =?utf-8?B?b29STUVRZ1hmaTRvVFhqaFNQSEJBOFJ4aXVwNWZwQ20ySUdRYTRGbkNjWDdZ?=
 =?utf-8?B?d1EwNHBzTEpBVEN6U3l0cnNOVXg1VXhaL0ZpcEwxTldtQ2VvaW5FeWhhUXVu?=
 =?utf-8?B?bHVGMG92WlAyRmNCZ1VJUHlPcmh5WEpWZnh2MFk1ckxFQW9QQWFOUE1OZ2pE?=
 =?utf-8?B?Zlk1eUQ1RWU3eTBWSFpwbnN1WXZnalBHdy9CV0FhZGpvQ2tDZUF6VVBMT2NP?=
 =?utf-8?B?NnhvTzBLWW1xSkF1Y0xQQ0NEV3ErZzJJdEt3V0ZmeGltNXAzRi9UclRnMmdW?=
 =?utf-8?B?ZjBNVDRVcVZ6UGJrdDBHRXFyU1ZiSTJKWmcvajJmSTVzMm5aUk9sa1pjci9u?=
 =?utf-8?B?aFhRRUNIWC9hUHdTRDNQOXJhZzZqN0hnUmFjUmpMZkpvM1cySmQ4WlZob2wx?=
 =?utf-8?B?Skk3MFV6ZVhZTGUxNjBSZ2c1SHVyMXM5cUpqMGVMMU5XZklITTJoV21JUTBZ?=
 =?utf-8?B?aVBXZ3VrckMrWWhxTEk5RGs3WFJ4L0lZYXoxbGJzRUNseHVOaVRzWDFMOFJu?=
 =?utf-8?B?djhKWm5ORk0vVzhpMTFWSklTYmZpOERXL2xVQzFGTXU2a3dlVFRWd2FQZVY5?=
 =?utf-8?B?ZWcvOGYrYTBQcFVUSndZVWdIWHZMYnl6c1FscEM1aG1PTUdwMTgxTWNBNlJy?=
 =?utf-8?B?T0lOOGpvenZBZ1ZYa1VHbXZBODhWS3FDbzY5SlEraTU5WEZKTDJHenoxc3F2?=
 =?utf-8?B?NHoyOS9LcWsxakJlMWlvblNSRjJWaTNJTk5TSzhVMUUrQ1ZBb1dWZlZLMmIw?=
 =?utf-8?B?OWt6VDJzUUVxTklMOHk2UHhxS29pUnZaWm5MQld2UmJGazZOSTBVTExBclNI?=
 =?utf-8?B?OWNBd2JEaHI3cHRkRDNWQitGZkZFbjE5RjBKcHNyWkJERUxvZDE1VVFNZXhX?=
 =?utf-8?B?ZmY3ZlZadUV1WW1HUWNDOU1FMjF1UXhkSGRaaFk3clExa1FKaiticmtNUWZG?=
 =?utf-8?B?U3ZlU004bFhOYkhzZXMxK3VQWDZyemRSdGZzWjZDczJOK0Faa3J1NXFGRnBy?=
 =?utf-8?B?eFU1U2FxZWZPZXBzWnNRWGNGTjhrZDd1Vk0wOFFQQWl2clhwc2RXZzNZMGYy?=
 =?utf-8?B?QnpaT0tZVFFSb3ZVRFhWclhmdnY2VCtDWCtyS0FFSjZod0Jyd2htdGR6SU1a?=
 =?utf-8?B?aXBKVVdiWWdGOUNRZFRuWU1vTmRDaWV5ZytKUFVpcWtWdHlmMzBOM2dlTDdz?=
 =?utf-8?B?anFKaDBmeThHOEVpK0NEU0ZsVGhKOFMrOTNNdDFDc1l5Ui96VmUvU3pBNnhJ?=
 =?utf-8?B?SFhzYzBmc1ppaWhmOVNTR3lXdHo1U3lLYm8xOXAzb0t6T1kyWjhhZnh4ZEhU?=
 =?utf-8?B?U3JzMUxXUzQyYitLaXk3V0ZNY1lyZGVlZ2czaC96YXVORmNCeHUyRkhuc1hj?=
 =?utf-8?B?L2NxOFllM0UyQ25aMTJXVmF2a1ZadFBzSldiWXJ4dzkwUlk3bUJBRUxKZ3Rv?=
 =?utf-8?B?RlV6WVQyWkxVeVIyV2NXK1VlSk5HSDh6dDdSSFhXOGFuQ3NMd1FUZVk4SkxG?=
 =?utf-8?B?dlFRcmJpNlJCeEd6ZFQ3UGtFaTIrd0ZmMEZGWElyWURZQ25xdklDTElpMFlS?=
 =?utf-8?B?c0F6Nzl4ZVFiV3VhUUpWZ0dkZW44d0dudXBhcE44elJnNWpid3dRcGNBWklu?=
 =?utf-8?B?MGNIVzI1Mmw3WDlmRlNKZSt5V09wQnVMdWlVU2o5U1d5ZzJ2NHgzNXBLUjNU?=
 =?utf-8?B?VmVqMWF3VktHU0pVYmxlV1pBVTVyR0FDSFdGaG9WZEYwMjBEb2t4SHlzRGdZ?=
 =?utf-8?B?UjRVdTNkbWtZTzlTc0oxYlBMZUF1K2V0MVFCTkhJS1BIcTFLYTNPYjBvN0hD?=
 =?utf-8?B?eXJ1d0llU0p6VnJiNHZNTGRrcExocTdpZ2hqQWZRSitSVUtaM1h3WE0yRlky?=
 =?utf-8?B?RXlVUFIzL3RLZWkrRm1Bd3VWTUtrcE5YYWp5T21DTi9XMjExb1REQ1B5RW8x?=
 =?utf-8?B?ck02a1JWUnVUSk1sOFVrVElWTnJRPT0=?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc2ace77-14c4-4f27-4e1a-08d9d148aada
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2022 19:13:48.6575 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vm5rHMrTZQJnfzDHKyI0HLMwnkPzkA8IvugyZ93WIs/fLbuFqaWybl+w6td5PmoP+6MOCwvy5CsHtGXPqgROix+9iD6TSXzj7F2UARk4cCo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4339
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10219
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 mlxlogscore=999 adultscore=0 phishscore=0 mlxscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201060123
X-Proofpoint-ORIG-GUID: 6w7B8dOmrmzrvXjWKK12nVVR-vudqbjw
X-Proofpoint-GUID: 6w7B8dOmrmzrvXjWKK12nVVR-vudqbjw
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.691,
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Eric Blake <eblake@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Zheng Chuan <zhengchuan@huawei.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/6/2022 4:12 AM, Michael S. Tsirkin wrote:
> On Wed, Jan 05, 2022 at 06:24:25PM -0500, Steven Sistare wrote:
>> On 1/5/2022 6:09 PM, Michael S. Tsirkin wrote:
>>> On Wed, Jan 05, 2022 at 04:40:43PM -0500, Steven Sistare wrote:
>>>> On 1/5/2022 4:14 PM, Michael S. Tsirkin wrote:
>>>>> On Wed, Jan 05, 2022 at 12:24:21PM -0500, Steven Sistare wrote:
>>>>>> On 12/22/2021 6:15 PM, Michael S. Tsirkin wrote:
>>>>>>> On Wed, Dec 22, 2021 at 11:05:24AM -0800, Steve Sistare wrote:
>>>>>>>> Enable vfio-pci devices to be saved and restored across an exec restart
>>>>>>>> of qemu.
>>>>>>>>
>>>>>>>> At vfio creation time, save the value of vfio container, group, and device
>>>>>>>> descriptors in cpr state.
>>>>>>>>
>>>>>>>> In cpr-save and cpr-exec, suspend the use of virtual addresses in DMA
>>>>>>>> mappings with VFIO_DMA_UNMAP_FLAG_VADDR, because guest ram will be remapped
>>>>>>>> at a different VA after exec.  DMA to already-mapped pages continues.  Save
>>>>>>>> the msi message area as part of vfio-pci vmstate, save the interrupt and
>>>>>>>> notifier eventfd's in cpr state, and clear the close-on-exec flag for the
>>>>>>>> vfio descriptors.  The flag is not cleared earlier because the descriptors
>>>>>>>> should not persist across miscellaneous fork and exec calls that may be
>>>>>>>> performed during normal operation.
>>>>>>>>
>>>>>>>> On qemu restart, vfio_realize() finds the saved descriptors, uses
>>>>>>>> the descriptors, and notes that the device is being reused.  Device and
>>>>>>>> iommu state is already configured, so operations in vfio_realize that
>>>>>>>> would modify the configuration are skipped for a reused device, including
>>>>>>>> vfio ioctl's and writes to PCI configuration space.  The result is that
>>>>>>>> vfio_realize constructs qemu data structures that reflect the current
>>>>>>>> state of the device.  However, the reconstruction is not complete until
>>>>>>>> cpr-load is called. cpr-load loads the msi data and finds eventfds in cpr
>>>>>>>> state.  It rebuilds vector data structures and attaches the interrupts to
>>>>>>>> the new KVM instance.  cpr-load then invokes the main vfio listener callback,
>>>>>>>> which walks the flattened ranges of the vfio_address_spaces and calls
>>>>>>>> VFIO_DMA_MAP_FLAG_VADDR to inform the kernel of the new VA's.  Lastly, it
>>>>>>>> starts the VM and suppresses vfio pci device reset.
>>>>>>>>
>>>>>>>> This functionality is delivered by 3 patches for clarity.  Part 1 handles
>>>>>>>> device file descriptors and DMA.  Part 2 adds eventfd and MSI/MSI-X vector
>>>>>>>> support.  Part 3 adds INTX support.
>>>>>>>>
>>>>>>>> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
>>>>>>>> ---
>>>>>>>>  MAINTAINERS                   |   1 +
>>>>>>>>  hw/pci/pci.c                  |  10 ++++
>>>>>>>>  hw/vfio/common.c              | 115 ++++++++++++++++++++++++++++++++++++++----
>>>>>>>>  hw/vfio/cpr.c                 |  94 ++++++++++++++++++++++++++++++++++
>>>>>>>>  hw/vfio/meson.build           |   1 +
>>>>>>>>  hw/vfio/pci.c                 |  77 ++++++++++++++++++++++++++++
>>>>>>>>  hw/vfio/trace-events          |   1 +
>>>>>>>>  include/hw/pci/pci.h          |   1 +
>>>>>>>>  include/hw/vfio/vfio-common.h |   8 +++
>>>>>>>>  include/migration/cpr.h       |   3 ++
>>>>>>>>  migration/cpr.c               |  10 +++-
>>>>>>>>  migration/target.c            |  14 +++++
>>>>>>>>  12 files changed, 324 insertions(+), 11 deletions(-)
>>>>>>>>  create mode 100644 hw/vfio/cpr.c
>>>>>>>>
>>>>>>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>>>>>>> index cfe7480..feed239 100644
>>>>>>>> --- a/MAINTAINERS
>>>>>>>> +++ b/MAINTAINERS
>>>>>>>> @@ -2992,6 +2992,7 @@ CPR
>>>>>>>>  M: Steve Sistare <steven.sistare@oracle.com>
>>>>>>>>  M: Mark Kanda <mark.kanda@oracle.com>
>>>>>>>>  S: Maintained
>>>>>>>> +F: hw/vfio/cpr.c
>>>>>>>>  F: include/migration/cpr.h
>>>>>>>>  F: migration/cpr.c
>>>>>>>>  F: qapi/cpr.json
>>>>>>>> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
>>>>>>>> index 0fd21e1..e35df4f 100644
>>>>>>>> --- a/hw/pci/pci.c
>>>>>>>> +++ b/hw/pci/pci.c
>>>>>>>> @@ -307,6 +307,16 @@ static void pci_do_device_reset(PCIDevice *dev)
>>>>>>>>  {
>>>>>>>>      int r;
>>>>>>>>  
>>>>>>>> +    /*
>>>>>>>> +     * A reused vfio-pci device is already configured, so do not reset it
>>>>>>>> +     * during qemu_system_reset prior to cpr-load, else interrupts may be
>>>>>>>> +     * lost.  By contrast, pure-virtual pci devices may be reset here and
>>>>>>>> +     * updated with new state in cpr-load with no ill effects.
>>>>>>>> +     */
>>>>>>>> +    if (dev->reused) {
>>>>>>>> +        return;
>>>>>>>> +    }
>>>>>>>> +
>>>>>>>>      pci_device_deassert_intx(dev);
>>>>>>>>      assert(dev->irq_state == 0);
>>>>>>>>  
>>>>>>>
>>>>>>>
>>>>>>> Hmm that's a weird thing to do. I suspect this works because
>>>>>>> "reused" means something like "in the process of being restored"?
>>>>>>> Because clearly, we do not want to skip this part e.g. when
>>>>>>> guest resets the device.
>>>>>>
>>>>>> Exactly.  vfio_realize sets the flag if it detects the device is reused during
>>>>>> a restart, and vfio_pci_post_load clears the reused flag.
>>>>>>
>>>>>>> So a better name could be called for, but really I don't
>>>>>>> love how vfio gets to poke at internal PCI state.
>>>>>>> I'd rather we found a way just not to call this function.
>>>>>>> If we can't, maybe an explicit API, and make it
>>>>>>> actually say what it's doing?
>>>>>>
>>>>>> How about:
>>>>>>
>>>>>> pci_set_restore(PCIDevice *dev) { dev->restore = true; }
>>>>>> pci_clr_restore(PCIDevice *dev) { dev->restore = false; }
>>>>>>
>>>>>> vfio_realize()
>>>>>>   pci_set_restore(pdev)
>>>>>>
>>>>>> vfio_pci_post_load()
>>>>>>   pci_clr_restore(pdev)
>>>>>>
>>>>>> pci_do_device_reset()
>>>>>>     if (dev->restore)
>>>>>>         return;
>>>>>>
>>>>>> - Steve
>>>>>
>>>>>
>>>>> Not too bad. I'd like a better definition of what dev->restore is
>>>>> exactly and to add them in comments near where it
>>>>> is defined and used.
>>>>
>>>> Will do.
>>>>
>>>>> E.g. does this mean "device is being restored because of qemu restart"?
>>>>>
>>>>> Do we need a per device flag for this thing or would a global
>>>>> "qemu restart in progress" flag be enough?
>>>>
>>>> A global flag (or function, which already exists) would suppress reset for all
>>>> PCI devices, not just vfio-pci.  I am concerned that for some devices, vmstate 
>>>> load may implicitly depend on the device having been reset for correctness, by 
>>>> virtue of some fields being initialized in the reset function.
>>>>
>>>> - Steve
> 
> I took a look and I don't really see any cases like this.
> I think pci_qdev_realize will initialize the pci core to a correct state,
> pci_do_device_reset isn't necessary right after realize.
> It seems safe to just skip it for all devices unconditionally.
> A bunch of devices do depend on reset to init them correctly,
> e.g. hw/ide/piix.c sets pci status in piix_ide_reset.
> But pci core does not seem to.

Cool.  After comparing pci_do_device_reset to pci_qdev_realize -> do_pci_register_device,
I concur.

This will do the trick.  Mode is set before reset is called, and cleared in cpr-load.

--------------------------
#include "migration/cpr.h"

static void pci_do_device_reset(PCIDevice *dev)
{
    int r;

    /*
     * A PCI device that is resuming for cpr is already configured, so do
     * not reset it here when we are called from qemu_system_reset prior to
     * cpr-load, else interrupts may be lost for vfio-pci devices.  It is
     * safe to skip this reset for all PCI devices, because cpr-load will set
     * all fields that would have been set here.
     */
    if (cpr_get_mode() == CPR_MODE_RESTART) {
        return;
    }
-----------------------------

- Steve

>>> So just so I understand, how do these other devices work with restart?
>>> Do they use the save/loadvm machinery? And the reason vfio doesn't
>>> is because it generally does not support savevm/loadvm?
>>
>> They all use save/loadvm.  vfio-pci also uses save/loadvm to preserve its soft state,
>> plus it preserves its device descriptors.  The only bit we are skipping is the reset
>> function for vfio-pci, because the hardware device is actively processing dma and 
>> interrupts, and they would be lost.  Reset is called unconditionally for all devices 
>> during qemu startup, prior to loadvm, by the path qdev_machine_creation_done() ->
>> qemu_system_reset().
>>
>> - Steve
> 

