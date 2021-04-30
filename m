Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC96370391
	for <lists+qemu-devel@lfdr.de>; Sat,  1 May 2021 00:36:35 +0200 (CEST)
Received: from localhost ([::1]:40270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcbkQ-0000Fy-DS
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 18:36:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1lcbh7-0007mC-Vg
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 18:33:10 -0400
Received: from aserp2130.oracle.com ([141.146.126.79]:37278)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1lcbh1-0002WC-Pq
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 18:33:09 -0400
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13UMP7jZ015501;
 Fri, 30 Apr 2021 22:32:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=BcknvryAxb5FbQnKfgrt0DIgvueoQlpLD6EGR9eudF4=;
 b=nfD+InPOvKGXmIBzOWd7kWHcFl2PYnMCEfvh5eil7jFMC3jJ9gVNnmQSM8Xtmjh38I9x
 J0RHGOwrUR4iuFajENBPetVdRc+dwEo5sUpU690BuTnQLRFKt66tXOr8z4T1Do7GPqU1
 a1V3M0IBF0DeLiGBaWBStI6MLojnyfSNyOnV9XQvrASPoN29rLgJU7fcdhc5D5KD5JSA
 X7VDTfLid7d38T6Kh0/nBTEWcSK+rw3iDtXWWjkC3hAIb829Kshy11pYtz1bLIArEHXr
 waZ40eE4p8x6vP65T7cWiUJrBMUPs8UJQuwN70rxt6tDd37xU8T4jZkpSdZyMOS3jT7l TQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2130.oracle.com with ESMTP id 385afq975j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 30 Apr 2021 22:32:59 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13UMV14r194408;
 Fri, 30 Apr 2021 22:32:58 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2176.outbound.protection.outlook.com [104.47.58.176])
 by aserp3030.oracle.com with ESMTP id 3874d5h5dd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 30 Apr 2021 22:32:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LgCVXKsqQ4nWkHxaUp0JEp7TC64RTYmVgI++NoBna7PlD7m7XZUBoMs5rYaAu+9NsJJAFj3nGNxtZkvWMCRq9XZbr0KJnmZQyTmFSA+4wFYtOpLuXwMqnJAqq/klZB2uoVOgQBug/vkXNgrAZYSpqgUlt9v9bCRRMloVloa6siSzNlwrwu8TR87WAlw4ltF3z75eSFlSmhz8t3drzqjPUVTQrP2A5wHsoDd5cI/SPRq0a/BxBC2/barS5F5oSYVQEnRGDI6WQ7v2qmjE+9rTPRq9ykGCcdEzIs2ylevMSCantwvzNB2YcVtWnU5F3PcJpiBriC2jz063woWVqKbtRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BcknvryAxb5FbQnKfgrt0DIgvueoQlpLD6EGR9eudF4=;
 b=oEz/NAGUb5jx3vdrJ2ht+I4loKAPYm+DxqnCg6Xm/QA3xtCxOmMs5MQ7IhkIZI2Pu9LSrsIBRYE6AXZm7zsOUOPE/7NZhckcC/FTXkeV18J0Gi7vMGy5TJ2GkipWHHY23g3RDSURAd9+nL9SfwefvqgqMtiXvmUQts2ar8UmOCNChj0DTmiHoz/Jl3lakKy9wxgf6uvgr6eZIf7hjg0uW9SoFBEOn1ZEQN8cqYWjUpDWib/aUcMzJee73F3x/X+aMrbleg0iMjg5aCWdxEAQaXtluONWzpkp/MKLUW7SW0bcp4oHj6t4iMKTZYrCKKhmB/6SBkpMdqMamAQNeH7DWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BcknvryAxb5FbQnKfgrt0DIgvueoQlpLD6EGR9eudF4=;
 b=j8Djm7oD2ejUAV7A5+tWfk896CdqJjSAqHHWZT1rveok7tEUsIGdMX0JaYHU3ogpBUIoMqIqpYWRNMg/8hHywsw9Y8YUQlBxxL2Ql8lrS0ctRq7774Lvye6+SMp7TPTnpWikfkHQl5+JVoj3nMMMNGHoQsKuKkf1fLqsFk6KBxk=
Authentication-Results: nvidia.com; dkim=none (message not signed)
 header.d=none;nvidia.com; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3287.namprd10.prod.outlook.com (2603:10b6:a03:15c::11)
 by BYAPR10MB3367.namprd10.prod.outlook.com (2603:10b6:a03:15d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.25; Fri, 30 Apr
 2021 22:32:57 +0000
Received: from BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::5dc9:c808:6bd2:7f80]) by BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::5dc9:c808:6bd2:7f80%7]) with mapi id 15.20.4065.027; Fri, 30 Apr 2021
 22:32:57 +0000
Subject: Re: [PATCH 2/2] vhost-vdpa: doorbell mapping support
To: Jason Wang <jasowang@redhat.com>, mst@redhat.com, qemu-devel@nongnu.org
References: <20210415080444.44645-1-jasowang@redhat.com>
 <20210415080444.44645-3-jasowang@redhat.com>
From: Si-Wei Liu <si-wei.liu@oracle.com>
Organization: Oracle Corporation
Message-ID: <c2a0e640-4f76-c6a3-12a7-756204473030@oracle.com>
Date: Fri, 30 Apr 2021 15:32:54 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
In-Reply-To: <20210415080444.44645-3-jasowang@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [73.223.250.27]
X-ClientProxiedBy: SJ0PR03CA0268.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::33) To BYAPR10MB3287.namprd10.prod.outlook.com
 (2603:10b6:a03:15c::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (73.223.250.27) by
 SJ0PR03CA0268.namprd03.prod.outlook.com (2603:10b6:a03:3a0::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.27 via Frontend
 Transport; Fri, 30 Apr 2021 22:32:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1356749a-eb5e-4790-0f63-08d90c27e6fc
X-MS-TrafficTypeDiagnostic: BYAPR10MB3367:
X-Microsoft-Antispam-PRVS: <BYAPR10MB3367644766B91D70B9FBA2F7B15E9@BYAPR10MB3367.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iHoY8nx/Z+bBu4kQkGxmPk9dmAjR2r9UURI/cqkFHfvwqFitTY+/VBo/aPGcrdF63swWZEP1TgyJ+PVoPuRu8C1R/aKeOsFSmZuMmVXqYUlzKX0nljbRaiPj7Xy50fu7nhmaNHV0rYAY21eTOhYKlRGLxO1Q3EGjBdZstV27b7aBBn2VImyO/iTyaYAu8fGqXPWjFW+6rAWL/LbzKZV1pCbzxiiOdwVV7g/+upmAc2CrP9FDDOo/9nXa6Rrmu8gErgGZGUZkF0LAXftODlQNiZ/RMwR25qRVLCfKSGH0s4E22DsuxavVARxJq0LQX/rNsZR+oZm7FjwVGbCtqPSWo6HwZjqR7TlbsvbMK18YFBKMEVOMkn+pp3OyyyAcDfDFF68noCxKrHAscyX8WXdx1t3ewrzvdVRnJy962yj9wwq8hQ6gEr5tnWQSreYZl0H5S3tQtFLnibBPVS+sIR4vrDUvoTSMHolw4cQ27F1P+oOuQP6F74VvOl2hFJ4Lwqccd17Q8Y6pPF8vXRzEXBv4GVvyHKZMzd1xuLyVFFEANmFcmvuNoo+lEByoNSOB6jeYYxu0Y9EpEDoSX0CQ2O8TYKkXRGolMnIoWelPAL91VAEVKlFli7tf8u6xl5AP6jE0bWN1CK2DDtSMG8guWeo7CioKT9e2DUP8YPH5mx+yJDBNtw0UcGPd8xbk+0vN2Q+9
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3287.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(136003)(366004)(376002)(396003)(346002)(66556008)(66946007)(16526019)(66476007)(26005)(16576012)(36756003)(6486002)(478600001)(2906002)(5660300002)(31686004)(186003)(316002)(8676002)(31696002)(956004)(83380400001)(38100700002)(86362001)(8936002)(2616005)(53546011)(4326008)(36916002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RDZMcGJxUFlRZXd5ZGdFdXlPRHUyRlJBa0s4S1hvZW5CdE1uNk9GaHd4WFZI?=
 =?utf-8?B?OUFSRnorMnZPaUh3TUVxWVk5S2ZPTGp4Zmljb1BkYkdNdWViVXVJR0p6MVFB?=
 =?utf-8?B?aUUrSnVPa3c5SGk2eHQxbWJzL0xaMjhvT3hUc0lock4vMVY1TmVHS09uYzVH?=
 =?utf-8?B?Ym0zNVRNZm4vT2tYRHFXaEpyanlORXROYkRQMW1lTjBHZzNQcnllelJZd2c0?=
 =?utf-8?B?bFA1Qmg2OGZLNXJxK20xejlrdlNxOHQwU3hzaGt0ZVIyaHJxTzhocHNsN0Ra?=
 =?utf-8?B?V3dZVFkxZ2Rla2ZPMDhaYk5ubkg0ZkNUU2hPUGFyYnRCeVhkQkMvTDNSMzBj?=
 =?utf-8?B?dFVrZXNBMzlhRXlRVzRoNTM0bk9STzM1THJNSXNQSHB6ZUpoSEI4UmY5WkRl?=
 =?utf-8?B?d0RYd0orc2xzVEZzRlFuTVpXYU5IVkFnTGd0NFhoNkZXa2dHY05WclZ1R3li?=
 =?utf-8?B?c0M3UXRRKzZtSTZRaytGTDlwb1d4c1hjaDJua09FR0hLcjNKU29JZWd2TVQz?=
 =?utf-8?B?UlhKQ0tsNUxhTlYzRXZXeURJVkZzL0tJWVVUY3FkaDlUQ3dGV0xtM29sOCt2?=
 =?utf-8?B?aTczall3Q1N6K3hrb2twYTNabThTWDhMQ3VxakJubEdieEZCTFJZWU5Qa29h?=
 =?utf-8?B?YW8yT2E3SUFjdlF5TDArRCtBNjdvYTZla0EyMS8wdnFERmxYVWt1U1M3TEhJ?=
 =?utf-8?B?K1hXMnAzbXdVdjZ4N0JTOWdETEhvSnFIK2kvWDFnTGc0TmtaNkdFSXpHd3h6?=
 =?utf-8?B?dk0yaWNXNHdoVElZcG9jUlRFOWQxYlYxZXN6NVhFTDZSSWRvQ0VPRGV4ejZ4?=
 =?utf-8?B?Nkt0MGZXM1hkVThOOUsrajFKR3pJSFV1bXV2bTlDQjBHcWdzSzhHRlhSK2VM?=
 =?utf-8?B?MUpMQmNhTGtKWjErb21mUkpySnFRT2JiZFB0NElNWGRhL1pkakxmdXRoYjFl?=
 =?utf-8?B?d3dhZk9UMTgwa0hja0tCdEt0SXo1bmZQRTdEd05LOTN1N3V5Y09NVmJXajE0?=
 =?utf-8?B?SFpqcXhJTHRuV1plekZya2pESTM4MHVjSEdIRlZsQXhqOURvcDVHL2Y1YTNs?=
 =?utf-8?B?T1RLTmN4MXVIZHVwTHpVQVRTaUJlMHp0dnlIS1hqeEdWM21zZXhRYU1IYjlh?=
 =?utf-8?B?cHNDNkJKZEt6YWZUSU44dEJGSnQ4bTUxeGpkbHQ4SGJYaGViZ09YUG9oQ3Bp?=
 =?utf-8?B?dUFUekFLTkNhZ2huTjJtTDZsdDJURU9laElrUHNzREpnZVRaZ291RVdtc014?=
 =?utf-8?B?UEtselU0emJ3aXFJV2FGMkZ3WldqaC9JM1E4eEREa3hNdHlGYkZtTFJXUnRq?=
 =?utf-8?B?YnkzdEtWMTNBSXlqcUZKYkg1S0gybEZqd0F5T1dEV1JoZ0E0ZEU2TkVqTkty?=
 =?utf-8?B?dVBmVmRXcWhRVk9jVnpSRTdKSXV4SGpDRUxxNTZmSWdDZ0Q4dUpiU0ZUeHRv?=
 =?utf-8?B?S0JBRzFnOXVIdE9VajJod3RWKzNkWmlKdjhaRERFUFVNM2tiblp3WVFuU1JS?=
 =?utf-8?B?V0NsWks5UVlxbmRLcnJvS1IyeUZsRXFtbDJBbys1WGU4MEx2ZTZ0eWZGdHpt?=
 =?utf-8?B?bnE1ekQxaVd5Ui9ma2t3cFQ1OGlnZE9kSUtyL1VoR1hCOGgyVmlCcWtuNWht?=
 =?utf-8?B?TjZWSjV4YUt4RjlaTk93b3B2WmxxY0pJTFQ1K09ORi9FWXVpL1ljWW5kQjNs?=
 =?utf-8?B?NWNQblhFalhoQjFCTEEwbnBJN0ZybGc4blk0eGdrQ2VsTGJOR3hPMVA3ekJj?=
 =?utf-8?Q?ErvFj/q5cEFfN4Jai0QLxVLSHKf88QE7B77Tf4k?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1356749a-eb5e-4790-0f63-08d90c27e6fc
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2021 22:32:57.0221 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s9ZXH038TC/zdiaFCiV2ynq9GQHpEv0cp306R8144ib89rmmouWSa4yHekEV6g12HXGV4qcragsBRE2HLYipBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3367
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9970
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 spamscore=0 adultscore=0
 suspectscore=0 mlxscore=0 mlxlogscore=999 malwarescore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104300158
X-Proofpoint-ORIG-GUID: qGhVaIBsGDqs8lUyOkPLQhcCg_-54D8d
X-Proofpoint-GUID: qGhVaIBsGDqs8lUyOkPLQhcCg_-54D8d
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9970
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 spamscore=0 phishscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 mlxlogscore=999 mlxscore=0
 adultscore=0 malwarescore=0 impostorscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104300157
Received-SPF: pass client-ip=141.146.126.79;
 envelope-from=si-wei.liu@oracle.com; helo=aserp2130.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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



On 4/15/2021 1:04 AM, Jason Wang wrote:
> This patch implements the doorbell mapping support for
> vhost-vDPA. This is simply done by using mmap()/munmap() for the
> vhost-vDPA fd during device start/stop. For the device without
> doorbell support, we fall back to eventfd based notification
> gracefully.
>
> Signed-off-by: Jason Wang <jasowang@redhat.com>
> ---
>   hw/virtio/vhost-vdpa.c         | 85 ++++++++++++++++++++++++++++++++++
>   include/hw/virtio/vhost-vdpa.h |  7 +++
>   2 files changed, 92 insertions(+)
>
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index dd4321bac2..c3a3b7566f 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -285,12 +285,95 @@ static int vhost_vdpa_init(struct vhost_dev *dev, void *opaque)
>       return 0;
>   }
>   
> +static void vhost_vdpa_host_notifier_uninit(struct vhost_dev *dev,
> +                                            int queue_index)
> +{
> +    size_t page_size = qemu_real_host_page_size;
> +    struct vhost_vdpa *v = dev->opaque;
> +    VirtIODevice *vdev = dev->vdev;
> +    VhostVDPAHostNotifier *n;
> +
> +    n = &v->notifier[queue_index];
> +
> +    if (n->addr) {
> +        virtio_queue_set_host_notifier_mr(vdev, queue_index, &n->mr, false);
> +        object_unparent(OBJECT(&n->mr));
> +        munmap(n->addr, page_size);
> +        n->addr = NULL;
> +    }
> +}
> +
> +static void vhost_vdpa_host_notifiers_uninit(struct vhost_dev *dev, int n)
> +{
> +    int i;
> +
> +    for (i = 0; i < n; i++) {
> +        vhost_vdpa_host_notifier_uninit(dev, i);
> +    }
> +}
> +
> +static int vhost_vdpa_host_notifier_init(struct vhost_dev *dev, int queue_index)
> +{
> +    size_t page_size = qemu_real_host_page_size;
> +    struct vhost_vdpa *v = dev->opaque;
> +    VirtIODevice *vdev = dev->vdev;
> +    VhostVDPAHostNotifier *n;
> +    int fd = v->device_fd;
> +    void *addr;
> +    char *name;
> +
> +    vhost_vdpa_host_notifier_uninit(dev, queue_index);
> +
> +    n = &v->notifier[queue_index];
> +
> +    addr = mmap(NULL, page_size, PROT_WRITE, MAP_SHARED, fd,
> +                queue_index * page_size);
> +    if (addr == MAP_FAILED) {
> +        goto err;
> +    }
> +
> +    name = g_strdup_printf("vhost-vdpa/host-notifier@%p mmaps[%d]",
> +                           v, queue_index);
> +    memory_region_init_ram_device_ptr(&n->mr, OBJECT(vdev), name,
> +                                      page_size, addr);
> +    g_free(name);
> +
> +    if (virtio_queue_set_host_notifier_mr(vdev, queue_index, &n->mr, true)) {
> +        munmap(addr, page_size);
> +        goto err;
> +    }
> +    n->addr = addr;
> +
> +    return 0;
> +
> +err:
> +    return -1;
> +}
> +
> +static void vhost_vdpa_host_notifiers_init(struct vhost_dev *dev)
> +{
> +    int i;
> +
> +    for (i = 0; i < dev->nvqs; i++) {
> +        if (vhost_vdpa_host_notifier_init(dev, i)) {
Shouldn't (hdev->vq_index + i) be used instead of i? or it's assumed to 
be single QP for vhost-vdpa for the moment? If the latter, would be good 
to add some comment.
> +            goto err;
> +        }
> +    }
> +
> +    return;
> +
> +err:
> +    vhost_vdpa_host_notifiers_uninit(dev, i);
I'm not sure if it is really the intent to leave other vqs behind - I 
presume that either none of them is mapped, or all mappable should be 
mapped. Why here just uninit the first unmappable vq?

> +    return;
> +}
> +
>   static int vhost_vdpa_cleanup(struct vhost_dev *dev)
>   {
>       struct vhost_vdpa *v;
>       assert(dev->vhost_ops->backend_type == VHOST_BACKEND_TYPE_VDPA);
>       v = dev->opaque;
>       trace_vhost_vdpa_cleanup(dev, v);
> +    vhost_vdpa_host_notifiers_uninit(dev, dev->nvqs);
>       memory_listener_unregister(&v->listener);
>   
>       dev->opaque = NULL;
> @@ -467,6 +550,7 @@ static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
>       if (started) {
>           uint8_t status = 0;
>           memory_listener_register(&v->listener, &address_space_memory);
> +        vhost_vdpa_host_notifiers_init(dev);
>           vhost_vdpa_set_vring_ready(dev);
>           vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_DRIVER_OK);
>           vhost_vdpa_call(dev, VHOST_VDPA_GET_STATUS, &status);
> @@ -476,6 +560,7 @@ static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
>           vhost_vdpa_reset_device(dev);
>           vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE |
>                                      VIRTIO_CONFIG_S_DRIVER);
> +        vhost_vdpa_host_notifiers_uninit(dev, dev->nvqs);
>           memory_listener_unregister(&v->listener);
>   
>           return 0;
> diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-vdpa.h
> index 9b81a409da..0f11ecff34 100644
> --- a/include/hw/virtio/vhost-vdpa.h
> +++ b/include/hw/virtio/vhost-vdpa.h
> @@ -14,11 +14,18 @@
>   
>   #include "hw/virtio/virtio.h"
>   
> +typedef struct VhostVDPAHostNotifier {
> +    MemoryRegion mr;
> +    void *addr;
> +} VhostVDPAHostNotifier;
> +
>   typedef struct vhost_vdpa {
>       int device_fd;
>       uint32_t msg_type;
>       MemoryListener listener;
>       struct vhost_dev *dev;
> +    VhostVDPAHostNotifier notifier[VIRTIO_QUEUE_MAX];
> +    bool host_notifier_set;
What this host_notifier_set is used for? Doesn't seem it's ever set or 
referenced?

>   } VhostVDPA;
>   
>   extern AddressSpace address_space_memory;
Thanks,
-Siwei

