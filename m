Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A37CE3B1AF0
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 15:17:41 +0200 (CEST)
Received: from localhost ([::1]:34656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lw2lA-00050N-8Y
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 09:17:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1lw2jn-0004EA-OD
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 09:16:15 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:5898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1lw2jk-0006RP-4i
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 09:16:15 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15NDBY74030264; Wed, 23 Jun 2021 13:16:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=imyV2TTrXBvfDnxCAkODQ8M4Z3rG39v1UNOwAjSF2Gs=;
 b=l9Qri8owioMGY87tIdsVUbry91cVVKKkXdhdtdxl6deldW+fLwunvD9HIeYQjSj8NcS/
 5jVjqrFOQjQkHp5v5rY6VzWhf6+0HGVSpWooBDfAZ2UXp+qT+BE1B3APn/3Jxt3UWRhI
 NxZYHuVCEIOtx/XepeCYou2XRf6M7nBUaF5wnU2kw11P271/q7eqVbwAylE1Z36OZj+0
 nFpSAykUb+8S0OnyxMk0n2hMduL+z40fYD8KF08mrpYs5Nu52KnpQC7XWjH6oVIf52Ze
 5lASe5kK1Ty3aK1soj2ss5SzuuadNhugnEqcY6i2mr95ZekqJLk3S2zK6SpYlgyUZ63M YQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 39aqqvwum0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 23 Jun 2021 13:16:07 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 15NDBVim183290;
 Wed, 23 Jun 2021 13:16:06 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
 by aserp3020.oracle.com with ESMTP id 3998d93gb1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 23 Jun 2021 13:16:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oV6oT3NOsDIwptAk4SO9sZxE06QJg4rRwwLWqksvq9yd7k5NL4jN/IFAjSuMoLM6WI7afRBw/Z0aJLfTi8lWDVqLXd7vKrZ280OVqUo+SJDDKlnFh8T2KkguySTyE3PT4EEKZBXQGk+GsqBUBsCpjSnly/NQLso+kUe/nt9XIHccdeTIasteEUZE7qJ7CBNTiwcAt7WqtpQ6A7UDCxAIdvHU0OpjZUvn7U5X+P3Bkd/c4Xc/GiLuY6M1eGx66vVtir4nn+0w+nxOP8VKiBIvFs+o3LjnhNCEIbpxYVWmB59SoROMgoA58UjOIUd53BJ6n1tIJy603lp2jTLVMUDVpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=imyV2TTrXBvfDnxCAkODQ8M4Z3rG39v1UNOwAjSF2Gs=;
 b=AFAK98uq4ugdzAdxX2xv/NetaNKr8K9Hehum8eGQHtYqoaAsqQAZQhJU5raeh16r8hqtdm2ntEbSLNttWZZZaOUYfAAj/Afzik0LR1kvM4uIPwICsAB5uYBdmv83OKxJYH1Y+jM/8xB5ZjclKU6oLWdB81WeCC6+HhddkczB3Q1ukWSIuSclASOmIUx91qQWswqKJ7SvO3bmg1JgkeJRieD5TWzgxyNk+NKwVjSkDwnh5ZBP9aZARTeKzu8KgTuSfMV1Wx80O6PrsaIx3Qn1PEMcJfmql2LwR7xEKQDnZunFT84k0BEpEutr2EBAXVPHQ4WgDuMwmwwjxeiDpy1mqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=imyV2TTrXBvfDnxCAkODQ8M4Z3rG39v1UNOwAjSF2Gs=;
 b=lAiCgLJwrdeDplFU1/AZSBSQY80Wc6/bJwpgSL6J9DfLydu1FU+vg/k3573gZ4vj0Fql7mazwJBvW23e5nkryqj1anB6afLbTp4v9cOfPygZhJKI9+0xG6hNljfMXSYaJWdQPF3M4t8GNTD7DiT0VJKW1MTTgEWs8qtLKYjLs8U=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by MN2PR10MB4287.namprd10.prod.outlook.com (2603:10b6:208:1da::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.19; Wed, 23 Jun
 2021 13:16:04 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::d875:3dd7:c053:6582]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::d875:3dd7:c053:6582%5]) with mapi id 15.20.4264.018; Wed, 23 Jun 2021
 13:16:04 +0000
Subject: Re: [PATCH RFC 0/6] i386/pc: Fix creation of >= 1Tb guests on AMD
 systems with IOMMU
To: Igor Mammedov <imammedo@redhat.com>
References: <20210622154905.30858-1-joao.m.martins@oracle.com>
 <20210622151629.6c75427c.alex.williamson@redhat.com>
 <23cff9d2-cc9b-07ba-1c21-9798854e14d9@oracle.com>
 <20210623135859.42ac55d0@redhat.com>
From: Joao Martins <joao.m.martins@oracle.com>
Message-ID: <85421a41-4fa3-5365-1a43-6b188d272906@oracle.com>
Date: Wed, 23 Jun 2021 14:15:58 +0100
In-Reply-To: <20210623135859.42ac55d0@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [94.61.1.144]
X-ClientProxiedBy: LO2P123CA0086.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:138::19) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.67] (94.61.1.144) by
 LO2P123CA0086.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:138::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.18 via Frontend Transport; Wed, 23 Jun 2021 13:16:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ea40ea56-82ab-4715-6f25-08d936490e08
X-MS-TrafficTypeDiagnostic: MN2PR10MB4287:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR10MB428761017CA50E81E7E00239BB089@MN2PR10MB4287.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BJnvHXAKSIDSSHUV77dhepLnmHBcpFUybvvSDbjyGX7Zb1B4yDX+T6KHrJDG4kSwKIr7qp3nyt7eyWJZIZ/EF46Ptmm/4/UMqrP5GPQfLJTbJgjpKtWYrMH4dw3XzwMr12nrhlLtlROcPYsY67AG1mg/KkPn2HtFCP2uJaJPJelL2obCabOdaep5gka7vxNYTe44QiDU5vUIW1EeMNCNhWVRCS7Yy/H8UcaLJe/FmnQINDq085fEvN7NLjGGphkvpgEVuFsjoX/ieTyxs6CQSrSZLhIHWVbGk5VxPWj+DgfUrxdXjA5nbrT9YTdhG64CGk1Jxzg/BB5NKa56ADH1f/UufWvtg1765IQWkhwpPG9tPhUl8Im0Lz/Yynr8dgLXU6qZYRz42Q8c3vg1Rg2MCXxq+j79/CpYq7xaUFaeiFK978ZXF0gddvt8T2KBW51IN4WJCIkkQnxSAWKPHmEHYbVa956wVkHDyCGB4Ud0sv/tQsoQLj6IFe/B3nBAmnXXNpg9ysgjcy3oOoMIvQPht1bxqsnOjQveg5MOElol83UIRB/t6zt/mDD6lRKWA4RUzCGD47d/t8mNlecPy9zCb2iH7i14o9exfyF+Tq46j/DZs0+oJgyqv5WOq2wwLh0jQ7ndKoREdbdAEfFCXOIRKo5UaGj45aWzsAftG5c8BEp+oBN+0x/WtKDuKUTEWe1GTsKhxq9mGZ/4pncLN0RNrav5NKLSS+KVtse/6HCzVheYQpLsnorAyjmVoSfh7f0I97gU/KEUocq2QFd7lF1DWUlmK1IXLbccfSGQGvJ7kDx6xb3xgy3/5vgdIc9C8Qke
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(39860400002)(136003)(376002)(346002)(366004)(478600001)(6916009)(66476007)(66946007)(66556008)(966005)(31686004)(54906003)(83380400001)(36756003)(316002)(5660300002)(38100700002)(16576012)(31696002)(86362001)(956004)(186003)(53546011)(16526019)(2616005)(2906002)(8936002)(6666004)(8676002)(6486002)(26005)(4326008)(45980500001)(43620500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L05MbHJlOW13c01DUW9HaDRzN1pyU0FmaEUreTFIK0wrejZZV2xhcUN5cUdr?=
 =?utf-8?B?VlM3R0xjV0V4TFNtbU9iTTZzcXhGaXNJZFU4Zm5WMk5XQ3Z5c3kyR3pKckM2?=
 =?utf-8?B?MUJEVWQ3WWt3N2t3ejc2NnJGL20xVjdLMGhRVlNOZlNXc0ZhR2FkN0JNREVl?=
 =?utf-8?B?VDg5dnc3Q2Z1WUF3K2RxVE4ydDRRdWxXZ3lqNDdzcW5GU2YrSVJkYVVsclov?=
 =?utf-8?B?VG9NWXhyVTBoNHY4a3dTeVNyYXQ3dXBnZENtRVBxN0hSVEQ4Nkd0YjRYSFpO?=
 =?utf-8?B?dklqcmlZRGE1T2duRHNoWVNsd3NDRmQzRDJjTzZ1a0hVaHlTUFJkS1RTY3dw?=
 =?utf-8?B?MUo5d3psWkNiMVRCMkVxREh5Mk5kMU9tWEx4WDg1Z3VsdEpaekVOOUFBQ25s?=
 =?utf-8?B?b3dMT3hKSW9kOWVDRlJjdDU0eFlYRTdidHlmRnVBSGQzMG80RHFsVUhkd3Y5?=
 =?utf-8?B?d0MxNVJLSmQyM1ZRY3ZMNlVnWE1nM1dwcmNUY1hWSHdkdG43WGErV2J1L05v?=
 =?utf-8?B?b3IwUXM4L3BTaXdLQ05Ua00xek10MXU4UU5zR3E3N0V6YzlIemVwQlZTT2Nn?=
 =?utf-8?B?R3hHeVlsQklCWEdnYVpnNTNYUUYwbVJVMEREanJUdVBueGMyV00zejlHdzZj?=
 =?utf-8?B?SHFDT1NBTm8zdFFzcGdHbzZHSVRRQWRpems2Y0QzOU5pTGYwTm1JbUFBNzBL?=
 =?utf-8?B?YXByT0JKM3lYOUtCU254TzZuY20yOHhra0R0NHE2N0Z1MFYxeml1SlhFZjlz?=
 =?utf-8?B?cG45N1Jtd2YyRlZtUHk0Z0JXWnVwanZhVFFmNFdRcXRlL1JCUHNMUHBMY25R?=
 =?utf-8?B?RXcwSW4rMUtlSkRyanBiMTBrMHZHUXBEVFpJQWozMUpoampnN1dCMjhnSm9C?=
 =?utf-8?B?Mi83OFIrYmxYdnp5RGRHMi9Vc20waHNMN3hrZWJrSDUvbEVqZ3hvSmZJMXJ4?=
 =?utf-8?B?TlAzKzZKKzcrREZLNk1zazVFU3VUd2VvdDlCYmtPVW56VllHeW1pZXdRZXlx?=
 =?utf-8?B?ZjlmOHorNkhaeTkvRk1BOThSRG1ZOGlyVUxZRFBlZlMxWjVOUDlsTS9NSlpV?=
 =?utf-8?B?VElCNWhteHp2RUdScFZmTXZJRDQ0K3J0dFF2RWp2c1QrRllTWFVQd245TGZm?=
 =?utf-8?B?UUhhM2lCcUtyaGpvZkExOXNjbFNDcEU5UDYxSk9COVMxMHY4MEtwOUJYTHI3?=
 =?utf-8?B?WEhMQUQ1VUdhTkpxbml1d2NURGM3RmZOOHN5NWZiS2VKaFlLNy9jRXRYMUtx?=
 =?utf-8?B?TEllUzlrRTlNSnRlQkF0SWpKZTRMbVQwVzVkdnB1bmtLYkdody8rOXBxclJK?=
 =?utf-8?B?MGlsWEdpalZBYnZCYkpiV21hWEQxRk1IcVRBZkcyeVNMbjdiOXZyNWErdjlH?=
 =?utf-8?B?VzU0b0R1MlNJbS8vZGhDS0RJZ1EzR0t0VkdCaWdxaWtiYkl6ajVLN2ZNZWtC?=
 =?utf-8?B?RFo5OEdFL2U3TXVTcDJNaEFTNDdvbkkrbFo4UFEwWkF5TUZFM1dSUDhIZ3E5?=
 =?utf-8?B?ZWQyQXc4UE1GZDZOZUxMQWhjUVdFNzd6RlEveE12d2x1UEtuZ0pHV042cGU5?=
 =?utf-8?B?dEVTanMxTjZERDRUTXkrZjNaaXNkeWJkRHBWbmZFQ0ZMTmN1YjRRM2p2Q21v?=
 =?utf-8?B?dSs4UCtyNDZ5VnN2cGx6bldhbFlGY0JkNnJCVEIxamxsaFBKNlBTM3N0THpT?=
 =?utf-8?B?UUlQYXNRdE5zVEFVN0daK0JrVldVMFJZOW9WSkNzZnprNnBNOVk3dlIwN2NN?=
 =?utf-8?Q?PuusqeqViZ+/PXdmxmPmKLxMXQk9wNzuUf28RjI?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea40ea56-82ab-4715-6f25-08d936490e08
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2021 13:16:04.6677 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BRdetmEho4ZDlavFtnKOamXD+S8U0/Z+WIz3f7NeTRTuFB9x8fs/a/nbysySOT+KxMWGc7XSaOBgF6HC0V8dYQP+JkBcsps/w0k7LPR7Nek=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4287
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10023
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxscore=0 adultscore=0
 mlxlogscore=999 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106230077
X-Proofpoint-ORIG-GUID: FdjBXKjhP5GCwDdUsUvvmGFtotTLvq-2
X-Proofpoint-GUID: FdjBXKjhP5GCwDdUsUvvmGFtotTLvq-2
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
 Auger Eric <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 6/23/21 12:58 PM, Igor Mammedov wrote:
> On Wed, 23 Jun 2021 10:30:29 +0100
> Joao Martins <joao.m.martins@oracle.com> wrote:
> 
>> On 6/22/21 10:16 PM, Alex Williamson wrote:
>>> On Tue, 22 Jun 2021 16:48:59 +0100
>>> Joao Martins <joao.m.martins@oracle.com> wrote:
>>>   
>>>> Hey,
>>>>
>>>> This series lets Qemu properly spawn i386 guests with >= 1Tb with VFIO, particularly
>>>> when running on AMD systems with an IOMMU.
>>>>
>>>> Since Linux v5.4, VFIO validates whether the IOVA in DMA_MAP ioctl is valid and it
>>>> will return -EINVAL on those cases. On x86, Intel hosts aren't particularly
>>>> affected by this extra validation. But AMD systems with IOMMU have a hole in
>>>> the 1TB boundary which is *reserved* for HyperTransport I/O addresses located
>>>> here  FD_0000_0000h - FF_FFFF_FFFFh. See IOMMU manual [1], specifically
>>>> section '2.1.2 IOMMU Logical Topology', Table 3 on what those addresses mean.
>>>>
>>>> VFIO DMA_MAP calls in this IOVA address range fall through this check and hence return
>>>>  -EINVAL, consequently failing the creation the guests bigger than 1010G. Example
>>>> of the failure:
>>>>
>>>> qemu-system-x86_64: -device vfio-pci,host=0000:41:10.1,bootindex=-1: VFIO_MAP_DMA: -22
>>>> qemu-system-x86_64: -device vfio-pci,host=0000:41:10.1,bootindex=-1: vfio 0000:41:10.1: 
>>>> 	failed to setup container for group 258: memory listener initialization failed:
>>>> 		Region pc.ram: vfio_dma_map(0x55ba53e7a9d0, 0x100000000, 0xff30000000, 0x7ed243e00000) = -22 (Invalid argument)
>>>>
>>>> Prior to v5.4, we could map using these IOVAs *but* that's still not the right thing
>>>> to do and could trigger certain IOMMU events (e.g. INVALID_DEVICE_REQUEST), or
>>>> spurious guest VF failures from the resultant IOMMU target abort (see Errata 1155[2])
>>>> as documented on the links down below.
>>>>
>>>> This series tries to address that by dealing with this AMD-specific 1Tb hole,
>>>> similarly to how we deal with the 4G hole today in x86 in general. It is splitted
>>>> as following:
>>>>
>>>> * patch 1: initialize the valid IOVA ranges above 4G, adding an iterator
>>>>            which gets used too in other parts of pc/acpi besides MR creation. The
>>>> 	   allowed IOVA *only* changes if it's an AMD host, so no change for
>>>> 	   Intel. We walk the allowed ranges for memory above 4G, and
>>>> 	   add a E820_RESERVED type everytime we find a hole (which is at the
>>>> 	   1TB boundary).
>>>> 	   
>>>> 	   NOTE: For purposes of this RFC, I rely on cpuid in hw/i386/pc.c but I
>>>> 	   understand that it doesn't cover the non-x86 host case running TCG.
>>>>
>>>> 	   Additionally, an alternative to hardcoded ranges as we do today,
>>>> 	   VFIO could advertise the platform valid IOVA ranges without necessarily
>>>> 	   requiring to have a PCI device added in the vfio container. That would
>>>> 	   fetching the valid IOVA ranges from VFIO, rather than hardcoded IOVA
>>>> 	   ranges as we do today. But sadly, wouldn't work for older hypervisors.  
>>>
>>>
>>> $ grep -h . /sys/kernel/iommu_groups/*/reserved_regions | sort -u
>>> 0x00000000fee00000 0x00000000feefffff msi
>>> 0x000000fd00000000 0x000000ffffffffff reserved
>>>   
>> Yeap, I am aware.
>>
>> The VFIO advertising extension was just because we already advertise the above info,
>> although behind a non-empty vfio container e.g. we seem to use that for example in
>> collect_usable_iova_ranges().
>>
>>> Ideally we might take that into account on all hosts, but of course
>>> then we run into massive compatibility issues when we consider
>>> migration.  We run into similar problems when people try to assign
>>> devices to non-x86 TCG hosts, where the arch doesn't have a natural
>>> memory hole overlapping the msi range.
>>>
>>> The issue here is similar to trying to find a set of supported CPU
>>> flags across hosts, QEMU only has visibility to the host where it runs,
>>> an upper level tool needs to be able to pass through information about
>>> compatibility to all possible migration targets.  
>>
>> I agree with your generic sentiment (and idea) but are we sure this is really something as
>> dynamic/needing-denominator like CPU Features? The memory map looks to be deeply embedded
>> in the devices (ARM) or machine model (x86) that we pass in and doesn't change very often.
>> pc/q35 is one very good example, because this hasn't changed since it's inception [a
>> decade?] (and this limitation is there only for any multi-socket AMD machine with IOMMU
>> with more than 1Tb). Additionally, there might be architectural impositions like on x86
>> e.g. CMOS seems to tie in with memory above certain boundaries. Unless by a migration
>> targets, you mean to also cover you migrate between Intel and AMD hosts (which may need to
>> keep the reserved range nonetheless in the common denominator)
>>
>>> Towards that end, we
>>> should probably have command line options that either allow to specify
>>> specific usable or reserved GPA address ranges.  For example something
>>> like:
>>> 	--reserved-mem-ranges=host
>>>
>>> Or explicitly:
>>>
>>> 	--reserved-mem-ranges=13G@1010G,1M@4078M
> 
> if we can do without adding any option at all it will be even better
> since user/mgmt won't need to care about it as well.
> 
Yeap.

But should folks want the --reserved-mem-ranges approach perhaps the default ought to be
'host', and let the user customize the memmap should it deem necessary.

>>>   
>> I like the added option, particularly because it lets everyone workaround similar issues.
>> I remember a series before that had similar issues on ARM (but can't remember now what it
>> was).
>>
>>>> * patch 2 - 5: cover the remaining parts of the surrounding the mem map, particularly
>>>> 	       ACPI SRAT ranges, CMOS, hotplug as well as the PCI 64-bit hole.
>>>>
>>>> * patch 6: Add a machine property which is disabled for older machine types (<=6.0)
>>>> 	   to keep things as is.
>>>>
>>>> The 'consequence' of this approach is that we may need more than the default
>>>> phys-bits e.g. a guest with 1024G, will have ~13G be put after the 1TB
>>>> address, consequently needing 41 phys-bits as opposed to the default of 40.
>>>> I can't figure a reasonable way to establish the required phys-bits we
>>>> need for the memory map in a dynamic way, especially considering that
>>>> today there's already a precedent to depend on the user to pick the right value
>>>> of phys-bits (regardless of this series).
>>>>
>>>> Additionally, the reserved region is always added regardless of whether we have
>>>> VFIO devices to cover the VFIO device hotplug case.  
>>>
>>> Various migration issues as you note later in the series.
>>>   
>> /me nods
>>
>>>> Other options considered:
>>>>
>>>> a) Consider the reserved range part of RAM, and just marking it as
>>>> E820_RESERVED without SPA allocated for it. So a -m 1024G guest would
>>>> only allocate 1010G of RAM and the remaining would be marked reserved.
>>>> This is not how what we do today for the 4G hole i.e. the RAM
>>>> actually allocated is the value specified by the user and thus RAM available
>>>> to the guest (IIUC).
> 
> it's partially true, we don't care about small MMIO regions that
> overlay on top of low memory. But concealing RAM behind large PCI
> hole would be a significant waste (especially when we are speaking
> about PCI hole below 4GB)
> 
> I wonder how it works on real hardware?
> i.e. does memory controller remap physical RAM at 1T hole region, just hides it
> or just doesn't place any DIMMs there?
> 
In real hardware you lose 12G of RAM IIUC (and the range is marked as reserved). But
whether the said range is actually backed by SPA or not it might depend on family. Suravee
is CCed can probably keep me honest here :)

>>>> b) Avoid VFIO DMA_MAP ioctl() calls to the reserved range. Similar to a) but done at a
>>>> later stage when RAM mrs are already allocated at the invalid GPAs. Albeit that
>>>> alone wouldn't fix the way MRs are laid out which is where fundamentally the
>>>> problem is.  
>>>
>>> Data corruption with b) should the guest ever use memory within this
>>> range as a DMA target.  Thanks,
>>>   
>> Yeap.
>>
>>> Alex
>>>    
>>>> The proposed approach in this series works regardless of the kernel, and
>>>> relevant for old and new Qemu.
>>>>
>>>> Open to alternatives/comments/suggestions that I should pursue instead.
>>>>
>>>> 	Joao
>>>>
>>>> [1] https://www.amd.com/system/files/TechDocs/48882_IOMMU.pdf
>>>> [2] https://developer.amd.com/wp-content/resources/56323-PUB_0.78.pdf
>>>>
>>>> Joao Martins (6):
>>>>   i386/pc: Account IOVA reserved ranges above 4G boundary
>>>>   i386/pc: Round up the hotpluggable memory within valid IOVA ranges
>>>>   pc/cmos: Adjust CMOS above 4G memory size according to 1Tb boundary
>>>>   i386/pc: Keep PCI 64-bit hole within usable IOVA space
>>>>   i386/acpi: Fix SRAT ranges in accordance to usable IOVA
>>>>   i386/pc: Add a machine property for AMD-only enforcing of valid IOVAs
>>>>
>>>>  hw/i386/acpi-build.c  |  22 ++++-
>>>>  hw/i386/pc.c          | 206 +++++++++++++++++++++++++++++++++++++++---
>>>>  hw/i386/pc_piix.c     |   2 +
>>>>  hw/i386/pc_q35.c      |   2 +
>>>>  hw/pci-host/i440fx.c  |   4 +-
>>>>  hw/pci-host/q35.c     |   4 +-
>>>>  include/hw/i386/pc.h  |  62 ++++++++++++-
>>>>  include/hw/i386/x86.h |   4 +
>>>>  target/i386/cpu.h     |   3 +
>>>>  9 files changed, 288 insertions(+), 21 deletions(-)
>>>>  
>>>   
>>
> 

