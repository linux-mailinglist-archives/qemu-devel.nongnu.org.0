Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A2A3B1AB8
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 15:06:12 +0200 (CEST)
Received: from localhost ([::1]:53486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lw2a3-0005g0-G2
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 09:06:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1lw2Yg-0004o9-Mi
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 09:04:46 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:5058)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1lw2Yc-0002Lq-HV
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 09:04:46 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15NCv0G2023247; Wed, 23 Jun 2021 13:04:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=2UpujsF64Tsh3C+oYjK7MH9l3K+FgtZwwxcxeEOGM3M=;
 b=Skhq75DvzQTc9gAEYmfRaR3qCDBUZpe4+EGzHouBd3uizxXznhAgsVYrzS/x9jkjpqkE
 yW7EIN6V69zE5xoakr9hkQ1XQpxpPV3x+XF9L7VZNjckD+FhkdTwmn8tll6ndrQgcKG9
 GWd6Mcc8a/iqLvXuxNQsdfOKt61hytNxh90i3S317zmBJXaZwHiAMbL9z0DLA/rEQWqK
 5pDMXNPYKIHlFaX21fJ6YN+OzBna11jecBjwSg6NuueRfPJRjFhTMvS4i+rHCZJbwlAk
 qy5eE6348g/MqNx8h+sdxVV+OGzZ9jXBvR7Cnq6lPU+QPQUVbTSczuBDSlhcWoJ0ky+Y sA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 39c2wngb0k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 23 Jun 2021 13:04:38 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 15NCtuAU076018;
 Wed, 23 Jun 2021 13:04:36 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2171.outbound.protection.outlook.com [104.47.58.171])
 by userp3020.oracle.com with ESMTP id 399tbuf7fk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 23 Jun 2021 13:04:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ea+r5uO/Ee5jojxVTsCBCfkBWDXayh2qsPUaiCTsbhO5BhN07jv567JO8qXka28mqCevZRaLU7jvCPenEKwpehvYsQU4um7e5LfG6bP4YvbkLapHfEXUYfxJczJozgYAU8mzxd4OlooRcGCRMkPVdjh8f/FGeTyrdao2+7qvij12TtEdvrEoCMH7vd9CZDqXAfcmnKz25HAaLNFTt2S/uIBIyzu008Oa2ynLONO8lWiPR6twE/DmDY/tDRPCucagCyro3+D5IAGcSSzKsSq08jI0fxgx4dt9z8qwBVFaPY/KZOHjIAI1x1SF5RASYVGu8x52gSza5XsdsvY3qIFMjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2UpujsF64Tsh3C+oYjK7MH9l3K+FgtZwwxcxeEOGM3M=;
 b=YKzTn/Tn0o8sUfmFZ9pJv8M6gWnoEaPejZQrzVs9KEfCXaI1DUZ1EPcsLpqHHmtnJAYPqVe3KPDwabVkcXO0Q9Be9hi69Oq/A4zOO5eg1gBugPJt8AFHTzB3Y0Q8vUa9/D0WFLL+TpIgoqG7da/I5oVAwuevzC/wpYVF3qidnB9iEDwB7ZnAjlOA8gxpX3W0R8Lhnhz48DYSftv4QEw9C6R72SinltrQaYN3METRtHBgZ6dJpHlHtZB9DsNE6TuGKmuHeorR/KM5fF9i7Z5lh3cuC6dHmXpGk/XMpsPT3o7OQ3+G4PkiHvl6E92mWeFCAXGb2MSvx891Vs4iNuumMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2UpujsF64Tsh3C+oYjK7MH9l3K+FgtZwwxcxeEOGM3M=;
 b=KSVuIG1huUFRneYK3NB3De032VnTH8x/327CzCWp0K48Tr2sAerx4z5x8PUTHUOvSN51U8Vybr3XfQVN9u+H+Y6uKEqOnTdjl0/x9QoDJvwtVhGCymLDsJedLCmQsnh1I00MDV/np607DH+drq2zV2EcLxo1+mq4KxFM0MFmXdE=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=oracle.com;
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by BLAPR10MB4818.namprd10.prod.outlook.com (2603:10b6:208:30e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18; Wed, 23 Jun
 2021 13:04:34 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::d875:3dd7:c053:6582]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::d875:3dd7:c053:6582%5]) with mapi id 15.20.4264.018; Wed, 23 Jun 2021
 13:04:34 +0000
Subject: Re: [PATCH RFC 1/6] i386/pc: Account IOVA reserved ranges above 4G
 boundary
To: Igor Mammedov <imammedo@redhat.com>
References: <20210622154905.30858-1-joao.m.martins@oracle.com>
 <20210622154905.30858-2-joao.m.martins@oracle.com>
 <20210623091138.2f7828dd@redhat.com>
 <ea55dc1b-b48a-3af1-be03-e72abc358f46@oracle.com>
 <20210623133954.2be8f24e@redhat.com>
From: Joao Martins <joao.m.martins@oracle.com>
Message-ID: <a8668c8d-22c5-6168-3f29-3f5055d99c32@oracle.com>
Date: Wed, 23 Jun 2021 14:04:19 +0100
In-Reply-To: <20210623133954.2be8f24e@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [94.61.1.144]
X-ClientProxiedBy: SG2PR0601CA0001.apcprd06.prod.outlook.com (2603:1096:3::11)
 To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.67] (94.61.1.144) by
 SG2PR0601CA0001.apcprd06.prod.outlook.com (2603:1096:3::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.18 via Frontend Transport; Wed, 23 Jun 2021 13:04:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 13c6db43-2871-499b-3aba-08d93647722c
X-MS-TrafficTypeDiagnostic: BLAPR10MB4818:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BLAPR10MB4818B00FDE539DB79D417054BB089@BLAPR10MB4818.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XjL6s3pzUxWrqPVFXZEtkugPXeDEwWXUH63PNb/kGAvp76vYo/JlrlZV/yGxRFS2NSIuIydgx/Xyh/IAc0LSEe/EsHAIpzil7TSjG8J/nhKvWJtuWAvU7YsKBUMqxNuP3iqv8PNgSTZPgCIG53F7IHiiB6p6RxoBkh0/ZV2vkbkzP3CEie/tl6wcgoNiVb/eBxgMQw+JMOcma0aJxuSzm3wOTS5ED3OtX0DKw0urfgkiMBx/M2tJUZ3KIkyjLS+aO7BPqCRrN0I7gj8RUySjPQvPw5Dv1wanrLXXWpaKLGgrtbPfVyHHb4CYHhh2IO9KQpuHrlxeOLLQdpjPRp5p0wHx5kHP7PM8rwlZ0OyF1frqn0jB00QImfgnzBTQwqTHn7nY5b6wp/qp/Jji28EebDJLspGDPWmx+kbaLmFbYCCBITBDT2AYl6aV6VNXkUEnJrOnt03iQDLw/A+aQVY6/4Gcoy9wW4Ec95tyCWFsrOEXLJiB+2xQBi/ax/gCoZN3McUDTEwJDCW/ppetHGdj7Jwr5RYPOyxslzHOdyuahXg4bTR2aw/D97P3eNtacKHJbAT/0Cja2qdZIgODe3jQ3C/cMALaPlss1AOMlt4QrlVdIQ9VXTwWaKi26fOvLCKUfrFrvt50A8CmRTbmkwsxJ7RAPYAosorhodH6kYwMRb6CE1/RUJdpV0E42oQpUqzHGeM4u9Fril5H9rTgMXbUVw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(376002)(346002)(136003)(39860400002)(366004)(31696002)(16576012)(6666004)(38100700002)(4326008)(5660300002)(15650500001)(54906003)(2906002)(6916009)(83380400001)(31686004)(66946007)(956004)(36756003)(316002)(186003)(66476007)(26005)(53546011)(8676002)(6486002)(16526019)(66556008)(86362001)(478600001)(8936002)(2616005)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NVNsOXpzdVU5RE05NlFkVkRCQzNMZWxGU0gzamRmMzIrUjd3OWVIb3NWcVdv?=
 =?utf-8?B?NG41OWZlNU9BZWxxQkNuZkgxR2k3T25mSWFSNFlwRFlzQVJscmdhOVNERmJQ?=
 =?utf-8?B?UUsyU3llZjdndkpocVhUSWRtUnE0SU52SWJicmsxcHh4eS9pYndCWSswdk5a?=
 =?utf-8?B?WGNWbzc2c1RoNm1BWGdnR25IZ0F5cDFwTGZwSXJHRG1ISjFVNWM0SFhxMnlO?=
 =?utf-8?B?SWN6ekpUeFhrYVNQY2l3dzJvdXo5V0FhaWhNa3hzenlTc1pianFWQUkvR2Rv?=
 =?utf-8?B?Q3NzZlBhLzFWY21GMlY2N3hMNm5vRGx6M1dwSStKNXFEeXpiVnFvT2hySXdY?=
 =?utf-8?B?RG5MdUVaZjJ1Z1ZueStRd1V0dkQ4NXBsZW1tOEZOVCtITzh1RlNZUlZlQ2dP?=
 =?utf-8?B?SU00eCt6QlA1Z0w3OEszeG1Zck5NN0NJWXU4KzhOWjQ0Q0QxSWFwa3ZsTGh3?=
 =?utf-8?B?c3Q3WjJIOFVRbjRENG1ORGNCU1dQM2MrNlZTRSs2TVd5eGdQbVhEa3M3UnFV?=
 =?utf-8?B?bXNGSnRaQ1RKamFmZWVyQVVFMEdlRXNDeThvaXhyelIyUHZyRngxUkNMcWwx?=
 =?utf-8?B?SU82dXk2Qy96RzgxakorRWFkNmZiWlRPZWRuSmc4ZFFVd21jTVZ1QVh4Q3Zk?=
 =?utf-8?B?M29Yb1NTY2hPcjNKMHZzcUJXV1B1Z0xGQTdqWlllWGpLZHZnRkZOdUxxb1I2?=
 =?utf-8?B?dmhEQkFWa2wwdURHMzQzUFJMN29BbWIwQXhsZ2tiN2dQMm84NUEwUFc0eEo2?=
 =?utf-8?B?Z1A2YmZ3MjNBM28vaVBrYlg2cm1VSTJSVnl2Ynh5KzFNYW51NG5OZzZoL0tZ?=
 =?utf-8?B?N1ZyUmlEbjVyb0NiOEttQjFMeXljRzhNSDAvMDl0N0lXRDE0T0ZMbmgwRlha?=
 =?utf-8?B?SzlOTWNHTktLajhmdFQ4T0IxaHdHNWhjT1NGKy9PK0hLblUxSzFuOUd0TUF4?=
 =?utf-8?B?KzA0RkVJS1U1Nk9TK1Rnem8xWkFocXE5akVCMTVFVXpnMEJ0TUhxbzlvSlRx?=
 =?utf-8?B?OWlLMjJ2d1AwdUdtTi9GRzJ5T3JtdEtVRWJzUUV1QnZKY0RFNTUxa3hMOHdQ?=
 =?utf-8?B?TUY0cGZObHVob3BBaGZSVm1FN2gyL0pBc252M3V5cEIrV1NqMDR1NEkzQitS?=
 =?utf-8?B?M1E4ZHVNWklMR3pBV3RadjMwN0kxTHozQXBlRXpYM2pYYURMODFKOVFIenlu?=
 =?utf-8?B?NnJtYy9jWU1QM3VvZW5BbGJPSXdxZE01a0c2ZWpYQmt4ZklvQlBOcmQ1OHQ1?=
 =?utf-8?B?SEo5THNpWlZNNHdFQUJ4Wi80bUg5L0NkUGRVRHRpNW81dnIzL0U2RzcwYmMy?=
 =?utf-8?B?dXNsLzQwckVvSkFqMFJzcTB0MHV6UG1tWkF0TlgySFk2Z0U1cndGNmZBM3pw?=
 =?utf-8?B?UEF0cGUzamNIbXBaRU5QcEttdUZtNEt1dkZlSkZYQW85c2NRWmJLcXRrOGtj?=
 =?utf-8?B?L1UwVTJiaEY1eC95eXJXTDhxK0NwTERNMjQxaTU3OFpEOWo1bFBLRlFkdUlN?=
 =?utf-8?B?NmZKait4UjNTVWFpN01JV1NJYnFRVkNUNld4MlRpWENsLzdxaEdrV0NyOVho?=
 =?utf-8?B?L2UwMEdCWFJ2VTFiV1U1bmN1Y3NmMzdMbFZlYWJNeHRtRkpBTDlVd2tNQlRJ?=
 =?utf-8?B?T3ltUXhETHRTT2p0TitXYmRUZmhJb0JuNFRGdXpjV1BKVHp6d3EveHhwckhw?=
 =?utf-8?B?dER0dHpOZGpjZVVaSG5aNk5uc1EvOGRNOU11VFVKSEVWTFZTZFZReXpEN3lX?=
 =?utf-8?Q?X3Yai+MbzGo1WjUXAaXCvyWDFnG3B3H6Z6C3IDE?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13c6db43-2871-499b-3aba-08d93647722c
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2021 13:04:33.9747 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6aQzAcoKWv7NEP6B0W8rzwtzljfOdU+zyyj90wfexI4hYLthc87NvDswh6Wqc+JRQ7LRas6W53HDWE12Xb5MaEFT7F8i+3U/F+qTUj5P9rQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB4818
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10023
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0 mlxscore=0
 spamscore=0 mlxlogscore=980 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106230075
X-Proofpoint-GUID: q5eGsr81nQgPPsfXAj2D1DISQkdNwGIZ
X-Proofpoint-ORIG-GUID: q5eGsr81nQgPPsfXAj2D1DISQkdNwGIZ
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Daniel Jordan <daniel.m.jordan@oracle.com>,
 David Edmondson <david.edmondson@oracle.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 6/23/21 12:39 PM, Igor Mammedov wrote:
> On Wed, 23 Jun 2021 10:37:38 +0100
> Joao Martins <joao.m.martins@oracle.com> wrote:
> 
>> On 6/23/21 8:11 AM, Igor Mammedov wrote:
>>> On Tue, 22 Jun 2021 16:49:00 +0100
>>> Joao Martins <joao.m.martins@oracle.com> wrote:
>>>   
>>>> It is assumed that the whole GPA space is available to be
>>>> DMA addressable, within a given address space limit. Since
>>>> v5.4 based that is not true, and VFIO will validate whether
>>>> the selected IOVA is indeed valid i.e. not reserved by IOMMU
>>>> on behalf of some specific devices or platform-defined.
>>>>
>>>> AMD systems with an IOMMU are examples of such platforms and
>>>> particularly may export only these ranges as allowed:
>>>>
>>>> 	0000000000000000 - 00000000fedfffff (0      .. 3.982G)
>>>> 	00000000fef00000 - 000000fcffffffff (3.983G .. 1011.9G)
>>>> 	0000010000000000 - ffffffffffffffff (1Tb    .. 16Pb)
>>>>
>>>> We already know of accounting for the 4G hole, albeit if the
>>>> guest is big enough we will fail to allocate a >1010G given
>>>> the ~12G hole at the 1Tb boundary, reserved for HyperTransport.
>>>>
>>>> When creating the region above 4G, take into account what
>>>> IOVAs are allowed by defining the known allowed ranges
>>>> and search for the next free IOVA ranges. When finding a
>>>> invalid IOVA we mark them as reserved and proceed to the
>>>> next allowed IOVA region.
>>>>
>>>> After accounting for the 1Tb hole on AMD hosts, mtree should
>>>> look like:
>>>>
>>>> 0000000100000000-000000fcffffffff (prio 0, i/o):
>>>> 	alias ram-above-4g @pc.ram 0000000080000000-000000fc7fffffff
>>>> 0000010000000000-000001037fffffff (prio 0, i/o):
>>>> 	alias ram-above-1t @pc.ram 000000fc80000000-000000ffffffffff  
>>>
>>> why not push whole ram-above-4g above 1Tb mark
>>> when RAM is sufficiently large (regardless of used host),
>>> instead of creating yet another hole and all complexity it brings along?
>>>   
>>
>> There's the problem with CMOS which describes memory above 4G, part of the
>> reason I cap it to the 1TB minus the reserved range i.e. for AMD, CMOS would
>> only describe up to 1T.
>>
>> But should we not care about that then it's an option, I suppose.
> we probably do not care about CMOS with so large RAM,
> as long as QEMU generates correct E820 (cmos mattered only with old Seabios
> which used it for generating memory map)
> 
OK, good to know.

Any extension on CMOS would probably also be out of spec.

>> We would waste 1Tb of address space because of 12G, and btw the logic here
>> is not so different than the 4G hole, in fact could probably share this
>> with it.
> the main reason I'm looking for alternative, is complexity
> of making hole brings in. At this point, we can't do anything
> with 4G hole as it's already there, but we can try to avoid that
> for high RAM and keep rules there simple as it's now.
> 
Right. But for what is worth, that complexity is spread in two parts:

1) dealing with a sparse RAM model (with more than one hole)

2) offsetting everything else that assumes a linear RAM map.

I don't think that even if we shift start of RAM to after 1TB boundary that
we would get away top solving item 2 -- which personally is where I find this
a tad bit more hairy. So it would probably make this patch complexity smaller, but
not vary much in how spread the changes get.

> Also partitioning/splitting main RAM is one of the things that
> gets in the way converting it to PC-DIMMMs model.
> 
Can you expand on that? (a link to a series is enough)

> Loosing 1Tb of address space might be acceptable on a host
> that can handle such amounts of RAM
> 

