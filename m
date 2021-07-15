Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 567773CAD7E
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Jul 2021 22:02:15 +0200 (CEST)
Received: from localhost ([::1]:36768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m47Yj-0001Nm-Ot
	for lists+qemu-devel@lfdr.de; Thu, 15 Jul 2021 16:02:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m47Xa-0000X5-I4; Thu, 15 Jul 2021 16:01:03 -0400
Received: from mail-eopbgr70130.outbound.protection.outlook.com
 ([40.107.7.130]:15454 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m47XW-00049B-KV; Thu, 15 Jul 2021 16:01:02 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kqXvnusllIN9XvwNmVjUF+e09mA6nzb+32iRuNxTeVtOHlGCCFT+oAESQxLB7bUo4zD1/U/uyLdmiBC5s4B7Dv4/etoRFhhgNgWvBgKa70bxCYTICjjpXtuXjQ6PdgMficoNziv0vfa6h1eVsdo+cE6l7FXo6BRoJpn20HmaKOHqSO8nDfFSzyNaIyJwG66BYXXllRpNZ6Fs+aM6it7liPJ0ZhRuMMDTQ/XeWpQGp3oqOhhmNbQwhXcY3HD3BmhLCasvNtZB/+s92y0U+pNjvqrBVLnst1N9earFwWfRDOxz3t+uEBmYeRX1a8Va5M8XjpuMHsufHpywYNhWYPNr2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ogo3gnFH12ORDvPH1EWeppxy9Uz/33wfJbfSqeNy6os=;
 b=N9Kkb0Ma9vHXTjzaQrEA1r0DsSqu4WYMipznYtXJm692Rj1u9Sqj4UamtF1B3zTZLHFnkdqQ++xRAlSoZj2CXH2ML0HyMC/34y6Kg2iXe9ntSnpJolYSCr9XSBeLnapaoNUAAgcuIjdAxlCHSl9RdJCbdYatTumibnO24jH/RaPYvNasN9e1AbLOtYwmggFrcLoZnnGtrcU8S4DMiolfYSp567CX60xVlC1dDxxv979qUOkzhMbvqNHO6xLZp9x++nYNUKH+QfCmU0qUEdKXXnmazC7QaKAPaa66fdvmCi2vkl8wQMgmIuml6T1OHF/D17Nirz+wJt8Pp+ISPwKg/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ogo3gnFH12ORDvPH1EWeppxy9Uz/33wfJbfSqeNy6os=;
 b=rBQtCUVxYIJlDenz2ID8oigYX9Du91J6dhXPs+ZgDFbADRl2ruBGrBflEoZ0fXljbv3o0y1ILPCQDcLugAOC8lJ3esHzAqpLjarexlEPu7X+wxfHVYAJU5U+SNQjkKcekpMu4SPrSkiulT/3k1fcnzLvAcx2eUPF+MKl6mQSNcM=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5446.eurprd08.prod.outlook.com (2603:10a6:20b:107::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.23; Thu, 15 Jul
 2021 20:00:54 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%6]) with mapi id 15.20.4308.027; Thu, 15 Jul 2021
 20:00:54 +0000
Subject: Re: [PATCH v2] docs: document file-posix locking protocol
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, mreitz@redhat.com,
 eblake@redhat.com, den@openvz.org, berrange@redhat.com, armbru@redhat.com
References: <20210703135033.835344-1-vsementsov@virtuozzo.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <5534503c-373e-2d58-9906-d1c690a91037@virtuozzo.com>
Date: Thu, 15 Jul 2021 23:00:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210703135033.835344-1-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0249.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100::21)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.193) by
 PR0P264CA0249.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Thu, 15 Jul 2021 20:00:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3248514c-af5a-422a-c8ab-08d947cb40b5
X-MS-TrafficTypeDiagnostic: AM7PR08MB5446:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR08MB5446D922B40A0EF01104471EC1129@AM7PR08MB5446.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cGDdkkMiLcPEFNjUUYpf1YYkqUgSn03jUwm9f4Kud7n+gG6c4JcCuMVGCrETabLN3TJzKTEk6UZruXJXpsP2i6yLEoUU383ehVx0V+fqUvM20ONX2ETLITrBNhO4edAXC4glr2JGDKhBQlQsSRXugJwOcS+6xprqgjiewb68rnEmODVAfiAUD2bYPb6pJuUJt+wfv1wMx2cZwtpmEl030d69hY1cIWqoa3DPqpRiEC8JnS7k8oWRDM5PCEokQy4jDrjwC5rwC0woe9Nnf9iUohkvKhQhZwgsvIxm+l9S9NuQywtwDCxQolcf9bBkjkroN4arnr8VyO5Tk8LXmj3mQBZyQwcwOxrHoCidbz8O6QnnCrkw+MLYLm9UHqYlmSZxnA+o4SoVmj8Wrr9/dS/aZy0B5QO9oKokqqWiuu9agR1F2vK2l0MpA0fygOKFbzgm5HjsbDsVKg4+3fK1Q1WqXgUN+0eqKo2a0X3lHDO7fff/QCoyNw7q3tnfKn99cnvByUNERS5ez3VtukW6BmKgIwt0g9umK4yqvBFxtEcRrsezmCK2YcAThGvThlLUN9ekZqhSJgJ45V21VTxAmsgQBUY0DgcaBkW3RdNJgaVHj1H0i8plOVhYs55fd2HVuykVLsUJqv6pftC19G8UVH014tIR+ZdystWABqlwc3vkVQzUfU49+eJeSf84g2T2NQIA7swTSWI/ON2J6ZaXPctQeZv/CE40meU4vU1B+32HnRbf3jBonBSZtKEmZxCXdxZrSxISFZLy4omKQe7VxhccPw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(366004)(346002)(376002)(39840400004)(4326008)(6486002)(31696002)(66556008)(6916009)(2616005)(86362001)(956004)(8936002)(5660300002)(66946007)(8676002)(478600001)(16576012)(38100700002)(38350700002)(36756003)(186003)(31686004)(66476007)(316002)(2906002)(52116002)(26005)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SW5iME5sMVN1RFZFWnpYNjMzMDdQWGlJaldwdm1jcWF3ZnFPT3NpMmNyZHEy?=
 =?utf-8?B?RDF6L1pXMk5XS0lHMUVWQy9iWkJTSFZkc0lIejhTU1ExVk5RZjkya3VVQjdJ?=
 =?utf-8?B?ZVpoT1NiVFNKL0NHbitQMk9PNG1kT1VicDVmLy9HaU1TTUk0RXh0L1c3Uk85?=
 =?utf-8?B?QzVDTGdCWE1JTVdZdGlBOTNsSVptNVkxQ21ZanEvVU9XUVF4TUErOStBNUwx?=
 =?utf-8?B?ajBFaU1mR29LVEJRclRHZTdLMmlpNEtMMkdwQjRXa3lXODZZYlhHTXA2ZFBH?=
 =?utf-8?B?U0MxSjJMcFFiYnd6TWViY0k5UmJBTDd1TGxqb1JTSmJYYSt0Y3lsc29rcVRr?=
 =?utf-8?B?ZUg4MU5CTHRrRXpHOVMyVjVUamxuV212aVBldFN2M1IwVy9DaDBCSG1wb25J?=
 =?utf-8?B?cVd3eEpla01IM1FxWmtwM0xhQnBOaXFLeUZGR0VKMkh1Q1RSUUo0L2pkNTZx?=
 =?utf-8?B?YzYyVzJiUmY1d1RLN1hxUExnVUZHcDNtc3ZveGVNQlJ0aktXcVM2bHFXWUZm?=
 =?utf-8?B?ck1DY29rRWNmZGNYQnhXdnZRYU9weDJNM2g3WjlXS1FzTEJNZmdLemhUcVND?=
 =?utf-8?B?SmovbjF5SW52aEc3OGEwMXFsTVZ1TUhEQnh2V2d6MHBtT2t3UW4xWkdkdCsy?=
 =?utf-8?B?VTB3RzRaUWNXbVVCUXQ2emRvQ3llQVdpZG1INzhlUThtVHNSM0JQOXlTWGxQ?=
 =?utf-8?B?WDVWVHQ1VEhEdlMvU1Zzbll4SHYvMlVSQWtzNTkyV0drUW96QmdZaFNGTlRZ?=
 =?utf-8?B?UzFBbzRFVWowY0JPVHNVaXI5SGNBMzA2TzN1dGtSMmlndytsWDcwelQvOVIr?=
 =?utf-8?B?VTZ6ZmJvbm90bmt1UHkwZGRQemNRSDQxVUFJYnlxSXhmSW0yNnFjTHZJN3JE?=
 =?utf-8?B?U3hCTXdPRFJQcFRMcGUyaDVBUkQ4Vit3V2xaSHBRUis2aDJ5OFVuRE11Z3d0?=
 =?utf-8?B?QUNqTWVTb0JFRVhPZ0VlNFJDeDlTSHRSUG5ZVVZJMmZtV0NqSmU2VkJBcmF4?=
 =?utf-8?B?VkV2WUpTdXdpMCtHYWdkL0hWVW8ybTB6bmg2WkIwaHRDbEZLTUM2MVlrK3RR?=
 =?utf-8?B?YXZsWFFCWDdobWk1ODRYbS9MZEhUNDhLUE92L3BrcitlQVp4dTNmdWxyK3NS?=
 =?utf-8?B?SXB3NlV6K24zd1dxMlBoRmFrWVJwNU9uRTVOeUQ3Qmt4cmRMczdUYmVOM3RN?=
 =?utf-8?B?cExVODBnZ0xKOWI3V295TVNwUXJYWHFhOWxyMFFCUkpoYVRlemZpeERiRzFn?=
 =?utf-8?B?TCsvakJ4eDBQQ1RUVzR5THJqQ2pZOUwyNHVWMHFwQUJJaDY0M0hPUUdldUZp?=
 =?utf-8?B?WldLUWJoVkhQR0UzZk9sZDVwM3RHMlRDR0ZUYnRxaDJCb0xKUHRULzVuVktS?=
 =?utf-8?B?QlZRR3FJbWVpdkpJNlFTUGpqZFFHTUNMd29YZGMxRXhxV1FOSUlPSlkyYXRN?=
 =?utf-8?B?ZWY4MStrYmd4UUFuRDFxeEM3dkpZSHFlNHVnUWhpUkJVLzNkRlN6QllZL3Ft?=
 =?utf-8?B?OEZlZVNGb0x2eW4xbDdHZ0s0ZHZ3MVFWQzNwMkcxWFVZK2tlbE5DUmxuQmlz?=
 =?utf-8?B?dnNNL281MHpFYlBka3ZZSy9pUW9QNm5kcHlzb1NoaC9EekZUQ0F5bUJ5Z1Ay?=
 =?utf-8?B?WjVDM2R6OEtmRUxMM2ZwaVRQcmZxM2pWc2VYNGdmSFdrSFM3aUZmeksyanJG?=
 =?utf-8?B?bk93Q0F3MTRxeXphTHNNb2xvZmw4dGo5d0E3UFlVTTZBRkV1bG1kNHBKUlZj?=
 =?utf-8?Q?b3z0VEaF6WAvR8nFjBMFNcIV0DZWpWiqVM23LMF?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3248514c-af5a-422a-c8ab-08d947cb40b5
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2021 20:00:54.0707 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e1qilqz2rwntIEwai01QjfOs5/n6Wwm/lY62C+uTlfceKBJ8n5y1QLiAK77z1FAP9caXMiMfoFOiEYn7yvJBUWjYMxvkp5A0qIaDaXCuVms=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5446
Received-SPF: pass client-ip=40.107.7.130;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

03.07.2021 16:50, Vladimir Sementsov-Ogievskiy wrote:
> +Permission bytes. If permission byte is rd-locked, it means that some process
> +uses corresponding permission on that file.
> +
> +Byte    Operation
> +100     read
> +          Lock holder can read
> +101     write
> +          Lock holder can write
> +102     write-unchanged
> +          Lock holder can write same data if it sure, that this write doesn't
> +          break concurrent readers. This is mostly used internally in Qemu
> +          and it wouldn't be good idea to exploit it somehow.

Let's make it more strict:

New software should never lock this byte and interpret this byte locked by other process like write permission (same as 101).

> +103     resize
> +          Lock holder can resize the file. "write" permission is also required
> +          for resizing, so lock byte 103 only if you also lock byte 101.
> +104     graph-mod
> +          Undefined. QEMU may sometimes locks this byte, but external programs
> +          should not. QEMU will stop locking this byte in future
> +
> +Unshare bytes. If permission byte is rd-locked, it means that some process
> +does not allow the others use corresponding options on that file.
> +
> +Byte    Operation
> +200     read
> +          Lock holder don't allow read operation to other processes.
> +201     write
> +          Lock holder don't allow write operation to other processes. This
> +          still allows others to do write-uncahnged operations. Better not
> +          exploit outside of Qemu.
> +202     write-unchanged
> +          Lock holder don't allow write-unchanged operation to other processes.

And here, correspondingly:

New software should never lock this byte and interpret this byte locked by other process like write permission unshared (same as 201).

> +203     resize
> +          Lock holder don't allow resizing the file by other processes.
> +204     graph-mod
> +          Undefined. QEMU may sometimes locks this byte, but external programs
> +          should not. QEMU will stop locking this byte in future
> +
> +Handling the permissions works as follows: assume we want to open the file to do
> +some operations and in the same time want to disallow some operation to other
> +processes. So, we want to lock some of the bytes described above. We operate as
> +follows:
> +


-- 
Best regards,
Vladimir

