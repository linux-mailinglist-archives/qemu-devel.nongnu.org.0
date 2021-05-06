Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 555A6375CB3
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 23:17:05 +0200 (CEST)
Received: from localhost ([::1]:55216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lelMl-0001mW-Vs
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 17:17:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1lelLJ-0001Dl-Ds
 for qemu-devel@nongnu.org; Thu, 06 May 2021 17:15:33 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:50306)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1lelLG-0007Cr-JC
 for qemu-devel@nongnu.org; Thu, 06 May 2021 17:15:32 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 146LESQJ131387;
 Thu, 6 May 2021 21:15:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=Qi75J74Su1R4tJn3KFfOrObldJOeIqPLBEuv0YyYit4=;
 b=sJcfg0Zvma/Qd1762mmfOyjQepBg6ccyy8FQkmSnzFLRdlVHS8LeL2lIjMuU0EghrAXA
 ChmX4Br5N8yfQ/0iZ/DdY2XMK6JCN7jnt1tldIt6oo0Ovy7p/MJIHpexsZJmtahrDzMw
 0VQ9W8esN2CmvWOsM0WGccj8gufMAuj6ZYCqbx30M/kqJeaFrpclhQQvbglc6hvJjcaz
 Poto/PPpnaDDuDfZNmU8kmoEU0WeTzVUS90bKVgjNjXLypCBH3TXOqo8jQFUOE46ihxM
 7XlWctwOaIGJECCqQFePn+3G2KO4mr1HMb6xva8zXAV58Xb38HrYGelLx/rL9NLhNwcD Cg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2120.oracle.com with ESMTP id 38bebc6bqd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 06 May 2021 21:15:26 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 146LAO5A138295;
 Thu, 6 May 2021 21:15:25 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2107.outbound.protection.outlook.com [104.47.58.107])
 by aserp3020.oracle.com with ESMTP id 38bebn6jxe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 06 May 2021 21:15:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZLO47yT0NEwROJvx6G44gUph45gK42ZMHWnV2W0hO81i0gZMlezQKGDCv6t3mc+twkbceKqAm/G8Agx713WhmrIpLRsiGQdVX0PVeeHsLkllGT4lkLXeWJhGHcVK8DFqQTmcDCMFTt8+Mjn03x/ojsB9B9QbCIYltEJQDrg46GU82xcIjXjlsLv/khR2/pZAsw/SZlONWhEPYacZNOUS7IZ90V23Rinenq8YnZvAx30jwBrag5BiZwGkdmzeUKn3yGAeAdkx8ViRwsGoum2Y8oiKeZaVAEifKpsD4ToXJb/eSxH71zFI4HAsSl1B6sv7VnsWCtehG2d6/7UvMOneXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qi75J74Su1R4tJn3KFfOrObldJOeIqPLBEuv0YyYit4=;
 b=UzlKCeKuqhvrt5xu6MeJzO7LX5wgr0J1gC+mprfdTF5qEikp/LbHKuyb26ebVhigSexFgWyhGwrGsox6X+mR6QNzG+2D2gSIVCwZC8gPAjRV2id0lw3pGgnTszO/OHC2JRJKrV5//0y0Tdwu0j6xa90rEQcEmxbnqRqQbO1Ms4t0yadUeQR6Kl/knVnxjerkzC1tZZ6H7j4qsg3IgaMWor+n7o6lgjg/0mR4mAlbmCTp3hI5s9qdw7Rq4L2eNs37KG6W8GSmCwdwQAfnaK+mDLS34lC+myVPsdgL1WmAQx8+wsZ//ith2+kB0ax4/k1z+F0cDaro9ZLAWPKhyyjOsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qi75J74Su1R4tJn3KFfOrObldJOeIqPLBEuv0YyYit4=;
 b=hN0CeiJpFt7k5+egVKuwySFMXYvqNP4RH77jUR7XpfDuGJqganuoZf6/RBaECZIPiewfHtXRaee1g3n+V/UL655GP2AB4Mh43Tv9Z/iMT0kAP8sodS/vdHLjqeRbxBEvsQvK98iLneCTCGvbEoelzXVFxAX1guhwVXpby37bdsk=
Authentication-Results: nvidia.com; dkim=none (message not signed)
 header.d=none;nvidia.com; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3287.namprd10.prod.outlook.com (2603:10b6:a03:15c::11)
 by SJ0PR10MB4543.namprd10.prod.outlook.com (2603:10b6:a03:2d9::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25; Thu, 6 May
 2021 21:15:10 +0000
Received: from BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::572:1b89:6a87:b18a]) by BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::572:1b89:6a87:b18a%5]) with mapi id 15.20.4108.026; Thu, 6 May 2021
 21:15:10 +0000
Subject: Re: [PATCH 2/2] vhost-vdpa: doorbell mapping support
To: Jason Wang <jasowang@redhat.com>, mst@redhat.com, qemu-devel@nongnu.org
References: <20210415080444.44645-1-jasowang@redhat.com>
 <20210415080444.44645-3-jasowang@redhat.com>
 <c2a0e640-4f76-c6a3-12a7-756204473030@oracle.com>
 <cb97a251-ed9e-4417-4aab-527a428c86d0@redhat.com>
From: Si-Wei Liu <si-wei.liu@oracle.com>
Organization: Oracle Corporation
Message-ID: <ac0f3498-f57a-7b4f-24f7-5d8e58912b40@oracle.com>
Date: Thu, 6 May 2021 14:15:07 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
In-Reply-To: <cb97a251-ed9e-4417-4aab-527a428c86d0@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [73.231.200.235]
X-ClientProxiedBy: SJ0PR03CA0116.namprd03.prod.outlook.com
 (2603:10b6:a03:333::31) To BYAPR10MB3287.namprd10.prod.outlook.com
 (2603:10b6:a03:15c::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (73.231.200.235) by
 SJ0PR03CA0116.namprd03.prod.outlook.com (2603:10b6:a03:333::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25 via Frontend
 Transport; Thu, 6 May 2021 21:15:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ad7683fb-0a93-42a3-8ca0-08d910d407d5
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4543:
X-Microsoft-Antispam-PRVS: <SJ0PR10MB45436A0DF5004481E03ADB9FB1589@SJ0PR10MB4543.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mHPZoehS3bKOQxf+/yWJvrh79Gu5oWcqJKAAwWgHyIuT+27Z7kYHfUxDDtEfWiuaZPwRkKqckS8js2tPp3BtXjXGTzPU0inTVpcUI8bONYBffMCY8Hp+keStWRidiN3lkE8jee88FcborRaFi2vjQWfAQvaNCrzpa3NAV5VuiRjXA1kyqcWKMsFzF47hbMwnh7bEpU0byAT6KfKdNDtg04ccxOAeo/p/xIwWrnRo4KxCnQKEJ/pFQgu2bBJZflq6CLQHzBgLXno0JWfDhIXtGVXxPdkYxT+QI2tzRNMvU9QWEgEnVefAVgb1NkU4SFw1Q7AWtIIrdxzjxnhyXrppP6lC+BvZmUFCGimBbQ2m0TdRHCVWTsCvt3IvIppRnjbGAL/A1Bo2tZw3yHA7XGOXzbjOkr5BppMvr7giKbTzKs8NUy+M5iYwAOa4AN6hfmfM9PYuMupNsoAQk47ZaBENo3TM5nPSPBZ2jX5l4LnFPk4NHPsO78Wm9hi40U/YQVYg8hvgUuOEFGGDaTuyBiWyrHmoLPrjBR0UcFMErX0S96WGq+4ZcpR3ZjB+IA7fsR+1zXRI5LWb20CS8l22gj8/z5AfLdQN4B6Y6vs/RDQdvYIZeR45baxgZ3E5kwLVZ60+rRchfFTCBXfr9H12u7uw2gOlMOpOpBhjSv7dRtrXguHw4/xbKxEM80NyY2G5/ews
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3287.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6486002)(186003)(8676002)(83380400001)(16526019)(5660300002)(86362001)(36756003)(956004)(36916002)(2616005)(31686004)(4326008)(38100700002)(66476007)(66556008)(2906002)(498600001)(16576012)(31696002)(8936002)(66946007)(26005)(53546011)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MlBTTTU4WThBMWFkeFJzSTJKQWJXcGFVT3dwaEEreHU2UnZMSXpMcUJSd2xk?=
 =?utf-8?B?Rlk2ME9tZk55bFd1UHBnOGwzYzZpZEFsSlA0aXZYd0NSS1dNWVdIbVQ0TWZk?=
 =?utf-8?B?WjRaZ3NFVU1SVDFEbEFPNmpRc1o1ZURpMkk3dlZMNG11a3UzSkhmcEtRZ0tB?=
 =?utf-8?B?M09waE1adlZtZHhHSzIyeVlQR0VZend1dEphek9XVTRnVWwvQ09rcnVpaG5G?=
 =?utf-8?B?QWNBbTRrOFlNUWdYbDhUZURYZC8wTnYxb0dMU3VrUlFHY2tjc1FSNHMxTlNt?=
 =?utf-8?B?b2dJMko3aW5oZEpFK3FNL0pwcVpFQmx1LzV4am55T1RlQmU5OWo3OWpaRWtS?=
 =?utf-8?B?d2lUSWdXUytJNkJaelBkSTF0SXNLaG9sd0cxMHZqSXkrajdmVjJxNHhBMHJY?=
 =?utf-8?B?Z3ZGYXd5QWVmMjd3Nm0rYXZPUDlOdzR0YVRiTWJBNTVsOVZRai80K005dUdi?=
 =?utf-8?B?RVk5TVpGOWJuMk81QmpYcUZjYXFKMnk2cURlN2owbUE0NG9LK3dLdUpxTjIw?=
 =?utf-8?B?M1RHd0pvdVBRSmhpSWJ4a1V4Z1hoaFdIemR5aTRvdHRYbFdVVFd3TUJjZTRU?=
 =?utf-8?B?dy9EYyt5Q2ZhZEhPc3hOckxoWmRMd1ZqM0UrbUpqRGxrVCtVVk1VZ2hQcE5L?=
 =?utf-8?B?dmNyaTZYSUk0YWdkZCs2VDcyV0JHcm1LOXdNQk9oR0I5VDhEOTdBMk84bjhp?=
 =?utf-8?B?Vm1sUnc0WHh0MktQa0R5S21uQzE5WVlLbitaMC90R3dXZ3hwUUZrOEwxRUVF?=
 =?utf-8?B?Ty9xTmNCOFg3V0RRaTk1VVlKUkVWL1N0N1pQbkN0dE1WWmxSdWo3NUpEZDNt?=
 =?utf-8?B?L3F2VnJFa0dURUhKZS9vSGNSR1dyNUhDbTljamVOVnJRcVJRM0NwL0tleDM4?=
 =?utf-8?B?b1BJS1pVMmRKU0RYNEpUd056UDkrQ1JCVk1Cd3ZoMldFTmoyRSt1cU43bnF2?=
 =?utf-8?B?WVFoRTBHRTRzc094WVZGcHpkU2ZmV0dFZlJHTlVtL29KOXp4MXc4OUxpUFFF?=
 =?utf-8?B?SUJaV3RxNDhkZnRsU05Taks4c2dKa2Z5ZFY2Y1RyTjZpRVlzbXNZZzgyRUdX?=
 =?utf-8?B?dXVBV3NsdUM5bjI2bk5Pc1JMZmxLOWszd0cveEJZV2hjWXFnNmpwM2pPMXVY?=
 =?utf-8?B?OHN5S0hzemRpVkdLOWRLNmlvZ1ZOd0NrNTdXN3hPTG91eE5ERmxMcWZTVDJ3?=
 =?utf-8?B?UTBHeXhIeWZXWmFnRU51UEpFVVAwVXdUVFU3eHhkVjN3SnRCb0hKQ2h3dU5a?=
 =?utf-8?B?MnUzUXRzeUwybjVCS1NLdTgzRVVPVEQrT01IbHp5amtRbTQ3b2llTS9PMHZF?=
 =?utf-8?B?N245SWNxd2tCZjBuRTkxUG43dTJRQVV0aTA2ajVndXJFSWJqcHEwZWUrRllW?=
 =?utf-8?B?N01nTkQ1Tk5tYk14QmJQVUs4VjRVcWk2Vmk4Rml5Q1VTK0RndGFXU0pLMHpH?=
 =?utf-8?B?U2N3MWsyQU9zdGFWZ01renRwYittSC8vUjlERVFRRm1QZ0tEOWdMbjV1dEQ0?=
 =?utf-8?B?aklJZ0U2WThIZTN6d0t4MWYwQW1UcTR2bkRZWUp0T2txU3MrZ1QrRVcvUG5C?=
 =?utf-8?B?T0J6MlZ2NVBvdXRwZ0ZUOVh4ak5pejJxclVQTC94aEFvV094UFNNQ0tRTnFY?=
 =?utf-8?B?bGdkdDhuSFBmWjRIOC9aL1FmanZqOHhPbldFMytZN3lpNWRUcktRQjlDeW5V?=
 =?utf-8?B?a0VUdW1VMHYxaC9SdHNwU01JQk96TzkrNEFOeExSREpmdml1YVV4LzBYbm54?=
 =?utf-8?Q?XgsH4lIwqnCQ8dRuqu08eqJhEfFly75zw/ecOLZ?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad7683fb-0a93-42a3-8ca0-08d910d407d5
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2021 21:15:10.1991 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ysbsc8hut3Mwq8iS5xgRHzZk82Uiek/5aj14NrzMMekdDy2pmKSr9ktDg/2e5mTs4KBGtmoUJg5PbAYCm0js0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4543
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9976
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 adultscore=0
 bulkscore=0 malwarescore=0 mlxlogscore=999 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2105060149
X-Proofpoint-ORIG-GUID: JxjgfQHyWWbR7RIJ2Y5Y9aToNuXC2aAg
X-Proofpoint-GUID: JxjgfQHyWWbR7RIJ2Y5Y9aToNuXC2aAg
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9976
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 lowpriorityscore=0
 phishscore=0 spamscore=0 adultscore=0 clxscore=1015 mlxscore=0
 malwarescore=0 mlxlogscore=999 impostorscore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2105060149
Received-SPF: pass client-ip=156.151.31.85; envelope-from=si-wei.liu@oracle.com;
 helo=userp2120.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: elic@nvidia.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 5/5/2021 7:17 PM, Jason Wang wrote:
>
> 在 2021/5/1 上午6:32, Si-Wei Liu 写道:
>>
>>
>> On 4/15/2021 1:04 AM, Jason Wang wrote:
>>> This patch implements the doorbell mapping support for
>>> vhost-vDPA. This is simply done by using mmap()/munmap() for the
>>> vhost-vDPA fd during device start/stop. For the device without
>>> doorbell support, we fall back to eventfd based notification
>>> gracefully.
>>>
>>> Signed-off-by: Jason Wang <jasowang@redhat.com>
>>> ---
>>>   hw/virtio/vhost-vdpa.c         | 85 
>>> ++++++++++++++++++++++++++++++++++
>>>   include/hw/virtio/vhost-vdpa.h |  7 +++
>>>   2 files changed, 92 insertions(+)
>>>
>>> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
>>> index dd4321bac2..c3a3b7566f 100644
>>> --- a/hw/virtio/vhost-vdpa.c
>>> +++ b/hw/virtio/vhost-vdpa.c
>>> @@ -285,12 +285,95 @@ static int vhost_vdpa_init(struct vhost_dev 
>>> *dev, void *opaque)
>>>       return 0;
>>>   }
>>>   +static void vhost_vdpa_host_notifier_uninit(struct vhost_dev *dev,
>>> +                                            int queue_index)
>>> +{
>>> +    size_t page_size = qemu_real_host_page_size;
>>> +    struct vhost_vdpa *v = dev->opaque;
>>> +    VirtIODevice *vdev = dev->vdev;
>>> +    VhostVDPAHostNotifier *n;
>>> +
>>> +    n = &v->notifier[queue_index];
>>> +
>>> +    if (n->addr) {
>>> +        virtio_queue_set_host_notifier_mr(vdev, queue_index, 
>>> &n->mr, false);
>>> +        object_unparent(OBJECT(&n->mr));
>>> +        munmap(n->addr, page_size);
>>> +        n->addr = NULL;
>>> +    }
>>> +}
>>> +
>>> +static void vhost_vdpa_host_notifiers_uninit(struct vhost_dev *dev, 
>>> int n)
>>> +{
>>> +    int i;
>>> +
>>> +    for (i = 0; i < n; i++) {
>>> +        vhost_vdpa_host_notifier_uninit(dev, i);
>>> +    }
>>> +}
>>> +
>>> +static int vhost_vdpa_host_notifier_init(struct vhost_dev *dev, int 
>>> queue_index)
>>> +{
>>> +    size_t page_size = qemu_real_host_page_size;
>>> +    struct vhost_vdpa *v = dev->opaque;
>>> +    VirtIODevice *vdev = dev->vdev;
>>> +    VhostVDPAHostNotifier *n;
>>> +    int fd = v->device_fd;
>>> +    void *addr;
>>> +    char *name;
>>> +
>>> +    vhost_vdpa_host_notifier_uninit(dev, queue_index);
>>> +
>>> +    n = &v->notifier[queue_index];
>>> +
>>> +    addr = mmap(NULL, page_size, PROT_WRITE, MAP_SHARED, fd,
>>> +                queue_index * page_size);
>>> +    if (addr == MAP_FAILED) {
>>> +        goto err;
>>> +    }
>>> +
>>> +    name = g_strdup_printf("vhost-vdpa/host-notifier@%p mmaps[%d]",
>>> +                           v, queue_index);
>>> +    memory_region_init_ram_device_ptr(&n->mr, OBJECT(vdev), name,
>>> +                                      page_size, addr);
>>> +    g_free(name);
>>> +
>>> +    if (virtio_queue_set_host_notifier_mr(vdev, queue_index, 
>>> &n->mr, true)) {
>>> +        munmap(addr, page_size);
>>> +        goto err;
>>> +    }
>>> +    n->addr = addr;
>>> +
>>> +    return 0;
>>> +
>>> +err:
>>> +    return -1;
>>> +}
>>> +
>>> +static void vhost_vdpa_host_notifiers_init(struct vhost_dev *dev)
>>> +{
>>> +    int i;
>>> +
>>> +    for (i = 0; i < dev->nvqs; i++) {
>>> +        if (vhost_vdpa_host_notifier_init(dev, i)) {
>> Shouldn't (hdev->vq_index + i) be used instead of i? or it's assumed 
>> to be single QP for vhost-vdpa for the moment?
>
>
> Only single queue pair is supported, I'm working on the multiqueue 
> support.

OK, I see.
>
>
>> If the latter, would be good to add some comment.
>
>
> I agree, and I think it's better to use vq_index + i to avoid future 
> changes.

That'll be fine. I think that depends on the way how mq will be modeled 
for vhost-vdpa, i.e. it doesn't need to be 1:1 between struct vhost_dev 
and a queue pair, like what vhost-kernel is modeled after for mq.

>
>
>>> +            goto err;
>>> +        }
>>> +    }
>>> +
>>> +    return;
>>> +
>>> +err:
>>> +    vhost_vdpa_host_notifiers_uninit(dev, i);
>> I'm not sure if it is really the intent to leave other vqs behind - I 
>> presume that either none of them is mapped, or all mappable should be 
>> mapped. Why here just uninit the first unmappable vq?
>
>
> I'm not sure I get here, there's a loop in 
> vhost_vdpa_host_notifiers_uninit(), so we either:
>
> 1) map all doorbells
>
> or
>
> 2) no doorell is mapped

Oops, I missed the 's' in vhost_vdpa_host_notifiers_uninit() and thought 
it was vhost_vdpa_host_notifier_uninit(). Sorry for the false alarm. The 
error handling looks fine then.

Thanks!
-Siwei

>
>
>>
>>> +    return;
>>> +}
>>> +
>>>   static int vhost_vdpa_cleanup(struct vhost_dev *dev)
>>>   {
>>>       struct vhost_vdpa *v;
>>>       assert(dev->vhost_ops->backend_type == VHOST_BACKEND_TYPE_VDPA);
>>>       v = dev->opaque;
>>>       trace_vhost_vdpa_cleanup(dev, v);
>>> +    vhost_vdpa_host_notifiers_uninit(dev, dev->nvqs);
>>>       memory_listener_unregister(&v->listener);
>>>         dev->opaque = NULL;
>>> @@ -467,6 +550,7 @@ static int vhost_vdpa_dev_start(struct vhost_dev 
>>> *dev, bool started)
>>>       if (started) {
>>>           uint8_t status = 0;
>>>           memory_listener_register(&v->listener, 
>>> &address_space_memory);
>>> +        vhost_vdpa_host_notifiers_init(dev);
>>>           vhost_vdpa_set_vring_ready(dev);
>>>           vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_DRIVER_OK);
>>>           vhost_vdpa_call(dev, VHOST_VDPA_GET_STATUS, &status);
>>> @@ -476,6 +560,7 @@ static int vhost_vdpa_dev_start(struct vhost_dev 
>>> *dev, bool started)
>>>           vhost_vdpa_reset_device(dev);
>>>           vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE |
>>>                                      VIRTIO_CONFIG_S_DRIVER);
>>> +        vhost_vdpa_host_notifiers_uninit(dev, dev->nvqs);
>>>           memory_listener_unregister(&v->listener);
>>>             return 0;
>>> diff --git a/include/hw/virtio/vhost-vdpa.h 
>>> b/include/hw/virtio/vhost-vdpa.h
>>> index 9b81a409da..0f11ecff34 100644
>>> --- a/include/hw/virtio/vhost-vdpa.h
>>> +++ b/include/hw/virtio/vhost-vdpa.h
>>> @@ -14,11 +14,18 @@
>>>     #include "hw/virtio/virtio.h"
>>>   +typedef struct VhostVDPAHostNotifier {
>>> +    MemoryRegion mr;
>>> +    void *addr;
>>> +} VhostVDPAHostNotifier;
>>> +
>>>   typedef struct vhost_vdpa {
>>>       int device_fd;
>>>       uint32_t msg_type;
>>>       MemoryListener listener;
>>>       struct vhost_dev *dev;
>>> +    VhostVDPAHostNotifier notifier[VIRTIO_QUEUE_MAX];
>>> +    bool host_notifier_set;
>> What this host_notifier_set is used for? Doesn't seem it's ever set 
>> or referenced?
>
>
> Right, will remove it.
>
> Thanks
>
>
>>
>>>   } VhostVDPA;
>>>     extern AddressSpace address_space_memory;
>> Thanks,
>> -Siwei
>>
>


