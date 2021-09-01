Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 663FE3FDB95
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 15:17:56 +0200 (CEST)
Received: from localhost ([::1]:59554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLQ7n-00009y-Gs
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 09:17:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mLQ4g-0005hv-Fb; Wed, 01 Sep 2021 09:14:42 -0400
Received: from mail-eopbgr70101.outbound.protection.outlook.com
 ([40.107.7.101]:15429 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mLQ4d-00082W-I1; Wed, 01 Sep 2021 09:14:41 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yv/16pMqWnrsOJ4Fu3a5yD73VsaaQ0qAJAjUiLgtlvYcAVRfkk53eTWqJ74AQAEr80dcNnMCaMQ6iQH+pRsemXQNPfT0O71av/A/41pm5r+eDg40uj0MSa0laB8ebd5E8WRE2ZEempwErCbSCvzgzxsyY5Lb6xvhkjbAOaTY8msSVVq6rxzL9HxKdEcn7YJiY6jWht1gPeZdSMrGuC5lp8f+yhajO1PRu9L1UY5xXVigYRj/cCw4S5fN2f5WPmVM1WLXC7naVi7FftJzwLDBvfklRtzoG2ggAXu21i9r4hMIl4El/L2Mhz9qwtG9esxkoaNnb5BSqMlGhlB6wuEpwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=i1qvae2Ssst5TcR1ZMMmhBI8O+ZTK2EB2Op+7xxFooc=;
 b=gJ7RaVpxzCAV2cYy01eAAsGEZXhDrVJp686N9xUIeS2fUeV3bxoxk6aiDQG5lktSDkPvLeZsTWtcjVuNuhcOrOVrECpffAc5uUDY3QwiNuIlAj5Lfs+G79HpI4NibJoJDe3s/VL6KkMAbCfLVQtuQj0XAC8sMEKo/SScu+7FvYP9Wn6Iuns8lfgHj7iBQSEKT7CX1JbsClozmxqE6gbMDgZie2wtzc4VI4xRZGePzNDM+sPr6rFwWFY0xTOo7BAZbowjNcvnuki1kGKJ+1nDsNPpF5ozGTkU4PJAySq4UvQHmtsvK3LHH2hLkgpUy/szGjD/Bxr2cSjWmxy0Dl/xJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i1qvae2Ssst5TcR1ZMMmhBI8O+ZTK2EB2Op+7xxFooc=;
 b=LRiMWk3bmW/YQxKjsIyCzozC+h9TWPFT+rJ3ANv3QLE0ak+kBYAepY0F35+qtYxG5WZAPGBPB/3k+NAhwonEGlEjnXwAOpcJ9EhwND7h4aGrmHFAafSTrPu7O3vX9K6rtzcHVBsbE968x1ZQKwolnI/SQ1yptkOgtowFJEWPpJY=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from VI1PR08MB5503.eurprd08.prod.outlook.com (2603:10a6:803:137::19)
 by VE1PR08MB5662.eurprd08.prod.outlook.com (2603:10a6:800:1a9::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Wed, 1 Sep
 2021 13:14:34 +0000
Received: from VI1PR08MB5503.eurprd08.prod.outlook.com
 ([fe80::2082:8a88:6ff1:2dd8]) by VI1PR08MB5503.eurprd08.prod.outlook.com
 ([fe80::2082:8a88:6ff1:2dd8%5]) with mapi id 15.20.4478.017; Wed, 1 Sep 2021
 13:14:34 +0000
Subject: Re: [PATCH v2 00/17] iotests: support zstd
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 den@openvz.org, jsnow@redhat.com
References: <20210720113832.586428-1-vsementsov@virtuozzo.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <443f2fd4-700b-f4a6-7a7e-65e499a89b96@virtuozzo.com>
Date: Wed, 1 Sep 2021 16:14:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210720113832.586428-1-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR04CA0069.eurprd04.prod.outlook.com
 (2603:10a6:208:1::46) To VI1PR08MB5503.eurprd08.prod.outlook.com
 (2603:10a6:803:137::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.196) by
 AM0PR04CA0069.eurprd04.prod.outlook.com (2603:10a6:208:1::46) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Wed, 1 Sep 2021 13:14:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 27c2328d-f50f-4392-dc52-08d96d4a70f9
X-MS-TrafficTypeDiagnostic: VE1PR08MB5662:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR08MB566280BC291FDBF951E00103C1CD9@VE1PR08MB5662.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:32;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: O2zs+PVwNaBK267J8DHvTbUFJ+ivHI8vcgKmQ9toparwHcYA400KbOVVjjhvZpZVOeYD08m+/urRK3kL2/iwKPs672isXSteiGrFEk9JKtN3c6/7I/uGt6XOv1LSmFQTzGHRdlfgqeuzl3XE2YFax7hNs6lNQPA0wNPujHFXTb+aA4ycwvdMLL1HHfCsUkMYItZdTfX+fMd0R43CGe9EzIEneDeH0qTDLT/UI/KUAKHtC2d4iJWn5berLmiczDH9G3vwg0bQIG8Jhm+8ebW7eo+Rinpepw+TTLjo5uWjN+R+tRi33OJ/BCLYMUivPjGhMa3Ho7LhJM400I5svqaHHk4cXh/Kl4nZ/S0MpwS0wP/s1Zyf0INKjz3E92xf1joM7cue0nYQsaaeTbcJ8/kYzoZS/YyYSw6dpAsdoBrszbPf5ny+vVPWRK8OB6AUceeq5yEcjvuH84UP95ONyCPhVy4u3yW59GCupPtaHBgpGbf/pcnDVaVMnYj2dX7DkLEz3W0pVA1Vb7RR0I9qTu6oWss73PR29UnMUfL6p9JPXblUJcLzy0wAnquukt5TQS/yVwlX1YU+uTKJqydiX5y0DITJEztrDdieiCh8LGPzdT5X8zofwUos7EfEB7D54e9gyOoYJ0hx3bzB1VxWOUQbEDsPgbmGDr++VImdFdTaBJF2EaDrnVm/pIuNKWW3crNZ9/JqrQmubNPKClQJejHdcEFEzw9EyFXrF8YbO6KdnLCHaccyfMhTqkOimNKhaEp2iyrfGyTVde0p7XKszV80OQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR08MB5503.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2906002)(2616005)(83380400001)(36756003)(6486002)(38350700002)(26005)(16576012)(186003)(508600001)(8676002)(38100700002)(316002)(66556008)(66476007)(31686004)(5660300002)(4326008)(66946007)(6916009)(86362001)(8936002)(31696002)(52116002)(956004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WFNJeG5lU3BudXVCY2JPaG9XcWdkTkFLNUlDa2Q4NzRKSUJrZlMyekxxamdy?=
 =?utf-8?B?dFdKcS9tbWNUVEUwZW1CLzgzRUthTTB2ZnhOT3FoNEJ4TnRFaUlTSGdnNjJt?=
 =?utf-8?B?Tms0Y1U3bml0Mnc1cGVjRG5jSnVKUlA0Ky9WOURDNUVqQ3RkaXFDWEN6WkEz?=
 =?utf-8?B?c2Fnd2VSampuSlVrc2xPTitxWFdzblpDQnYvS2tvMFgxeWt4Vkp3czkzR0Fm?=
 =?utf-8?B?azg5UEJsWEVvVm5rc3oxWnFhS082WnN2bUhyNVVCUVNCMUVHbjV2YzB0SGp4?=
 =?utf-8?B?SVFXQkFPU0x5NnZVdGRPT1d2RWtUaTFKY1FCYzJDZ3hvTFYxbzl4ZEVFSEF0?=
 =?utf-8?B?enhaMEJpSVJZRXRpcGc2amtkcTBTYWVUb21RMXh4aHlaWExvTkZtZDl3RjVB?=
 =?utf-8?B?N2RlenYxdy9yNHlCaXlXMVUwUWlvK2JmOGl5NUdaV2s5TzBYc3B1K090dXNm?=
 =?utf-8?B?aHJCL25HbjhPUmJSdFhjVUhmNStKdzZ0eUozaWhBSXFWcjlzVE9uZU1tUGp3?=
 =?utf-8?B?dk5xMFFqeFRIRnh2bzZNYVdwd05kSzNXVVRmR25Td1VUb2lURHJuM3dVNWR6?=
 =?utf-8?B?Y2lvUG54NFZkckd5NmlmTDFRZmIxMjIrNHVIZjE3d09sMklyaEJsNXZycHVn?=
 =?utf-8?B?SE45QU5kZG15R204VkdiRVFyeEZJanF4N2hNV0E4dWdaazBNWkpRNC91YlJN?=
 =?utf-8?B?dk9JcEhIWmhpUWpQR1pTSjVTNjZuYWR3aVo5MDZGVmNUVEdYb3ljSmF4QXNE?=
 =?utf-8?B?azFjT0pUZ2lZc2tESENaTVZ5Ylp3Wm9HcGw2RDU2U2VjYmdORkRqTW9kQUhH?=
 =?utf-8?B?SWlEVzA2dmVxZEdwOURMaXgzT2Z2RVgxY3gwMFNUVm0rK1NBUmlFT2pBeEZN?=
 =?utf-8?B?eGJMTzhFN25BZW5kMTFzU2NWZ1IzV2RjQ2o1MEpyZmtmWlI0V1U3c3I2MjEv?=
 =?utf-8?B?UzU3VTYvWlh2cVozblhMRUo1TSt6VndrMTNwd1puamZJekNvd0ppUnNvQjcz?=
 =?utf-8?B?ckkrMllrTkY3ZE1Kb1ZwNHJqMnlVbE10Vk5zVnlTaC9OUTd0M0tuTlRmNlho?=
 =?utf-8?B?emdKM0UxaC9OOGxvY0JYVzh4cDhrMVNtN3M0QlFHWEpvYVFpRi9CeGhCUm9q?=
 =?utf-8?B?amtPcExuV21HQ2JlZzhYWnBUb1NjZUFuTVU1SnUwS2pVcnllZ0FOaEpZNEtq?=
 =?utf-8?B?Z0UrSkZlUHVNZTBUak5DZGpWWnUrMUY4aWJKSFc4OVBpZWFxYTcxdllHeDc3?=
 =?utf-8?B?WEs0RGg3UjNxbGRjR2tlMSt3UFkzYnZiQkk5cW8vTGNQbnNQd1lzWDJxUmdW?=
 =?utf-8?B?bWExTE1RdXo1SGlMS2d1WHFzNHh0bVlEdEdOVWo5eUNvQk1xVExPWTRxUUhF?=
 =?utf-8?B?Y0Z4czJkdUEvdFFmNEhveTR4dEo5L1p3TTc4Zk9EemppVkJaZnlEdkpSbWtR?=
 =?utf-8?B?d3NxQnBmdnBmRE5XTGY3RDk4NExsSHJvbmNJVC94SE1vVFU3SENDN0g2Qnl6?=
 =?utf-8?B?OWloWllDM3hQZlNMNFJmUVd1TmpmUWZhUktPU2EvbERzYlI5dkEyNDdzTjlD?=
 =?utf-8?B?WDBHZDNBTDFZaDd0UW5sRzJhdnRLRkQ4TjNTdktHUXVOdk9nRDZUNDArY1Bu?=
 =?utf-8?B?dlJBYnR5NEdOSjRwVGt2dmVEMTFjWW1kSkZZaWFHZXNZUjh5dVNNZVh2QVEy?=
 =?utf-8?B?cVlrUGRBR00raTZEaDhBeHhvU0VzbTF4TGtxK2twNlNWNlNOUFh6aFhrcG11?=
 =?utf-8?Q?V6j99g6VkRX41AI3mmc5dE1ZndCM0FzJafOQLLy?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27c2328d-f50f-4392-dc52-08d96d4a70f9
X-MS-Exchange-CrossTenant-AuthSource: VI1PR08MB5503.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2021 13:14:34.2814 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YGMjH3Ai4viZMrhd//S6uMbEf2engfRUCHqk9XWh4P2h9Ky1YacK9AnL0TQINHtxli3h8WQIFJBTjhPMgZqWTALBrR2XYyYFYQ1JVzQ8dCA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5662
Received-SPF: pass client-ip=40.107.7.101;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-1.029, RCVD_IN_DNSWL_NONE=-0.0001,
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

Ping.

This applies to current master with a small obvious conflict in tests/qemu-iotests/common.filter

20.07.2021 14:38, Vladimir Sementsov-Ogievskiy wrote:
> These series makes tests pass with
> 
>     IMGOPTS='compression_type=zstd'
> 
> Also, python iotests start to support IMGOPTS (they didn't before).
> 
> v2:
> 01: add Max's r-b
> 02: simplify a lot: just add separate -o for IMGOPTS.
>      also, don't bother with catching compat=0.10
> 03,04: new
> 05: add Max's r-b
> 06: one more explict compression_type=zlib
> 07: new
> 08: reduced to only update filter_img_info
> 09: adjust commit message, add comment, add Max's r-b
> 10: s/ = 0/ &= ~QCOW2_INCOMPAT_COMPRESSION/
>      add Max's r-b
> 11-13: add Max's r-b
> 14: one more regex for "2, 3, 4" case
> 15-16: add Max's r-b
> 17: new
> 
> Vladimir Sementsov-Ogievskiy (17):
>    iotests.py: img_info_log(): rename imgopts argument
>    iotests.py: qemu_img*("create"): support
>      IMGOPTS='compression_type=zstd'
>    iotests: drop qemu_img_verbose() helper
>    iotests.py: rewrite default luks support in qemu_img
>    iotest 303: explicit compression type
>    iotest 065: explicit compression type
>    iotests.py: filter out successful output of qemu-img crate
>    iotests.py: filter compression type out
>    iotest 302: use img_info_log() helper
>    qcow2: simple case support for downgrading of qcow2 images with zstd
>    iotests/common.rc: introduce _qcow2_dump_header helper
>    iotests: massive use _qcow2_dump_header
>    iotest 39: use _qcow2_dump_header
>    iotests: bash tests: filter compression type
>    iotests 60: more accurate set dirty bit in qcow2 header
>    iotest 214: explicit compression type
>    iotests: declare lack of support for compresion_type in IMGOPTS
> 
>   block/qcow2.c                    | 58 +++++++++++++++++++++-
>   tests/qemu-iotests/031           | 11 +++--
>   tests/qemu-iotests/036           |  6 +--
>   tests/qemu-iotests/039           | 22 ++++-----
>   tests/qemu-iotests/044           |  5 +-
>   tests/qemu-iotests/044.out       |  1 +
>   tests/qemu-iotests/051           |  5 +-
>   tests/qemu-iotests/060           | 22 ++++-----
>   tests/qemu-iotests/060.out       |  2 +-
>   tests/qemu-iotests/061           | 42 ++++++++--------
>   tests/qemu-iotests/061.out       | 12 ++---
>   tests/qemu-iotests/065           | 16 +++---
>   tests/qemu-iotests/082.out       | 14 +++---
>   tests/qemu-iotests/112           |  3 +-
>   tests/qemu-iotests/137           |  2 +-
>   tests/qemu-iotests/198.out       |  4 +-
>   tests/qemu-iotests/206.out       | 10 ++--
>   tests/qemu-iotests/209           |  7 +--
>   tests/qemu-iotests/209.out       |  2 +
>   tests/qemu-iotests/210           |  8 +--
>   tests/qemu-iotests/214           |  2 +-
>   tests/qemu-iotests/242.out       | 10 ++--
>   tests/qemu-iotests/255.out       |  4 --
>   tests/qemu-iotests/274.out       | 39 ++-------------
>   tests/qemu-iotests/280.out       |  1 -
>   tests/qemu-iotests/287           |  8 +--
>   tests/qemu-iotests/290           |  2 +-
>   tests/qemu-iotests/302           |  4 +-
>   tests/qemu-iotests/302.out       |  7 ++-
>   tests/qemu-iotests/303           | 25 ++++++----
>   tests/qemu-iotests/303.out       | 30 +++++++++++-
>   tests/qemu-iotests/common.filter |  8 +++
>   tests/qemu-iotests/common.rc     | 22 +++++++++
>   tests/qemu-iotests/iotests.py    | 84 ++++++++++++++++++++------------
>   34 files changed, 310 insertions(+), 188 deletions(-)
> 


-- 
Best regards,
Vladimir

