Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 785CF3FD949
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 14:13:39 +0200 (CEST)
Received: from localhost ([::1]:55692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLP7a-0000E7-9r
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 08:13:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mLP5K-0006H2-Ud; Wed, 01 Sep 2021 08:11:18 -0400
Received: from mail-eopbgr20113.outbound.protection.outlook.com
 ([40.107.2.113]:2972 helo=EUR02-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mLP5I-0005Dx-Fp; Wed, 01 Sep 2021 08:11:18 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gffh7ms7bDnOdQMpJzNh8x9aSfEZ0q/5lwh6K6YUU+JDJEy3zGr132olXicTXKaQnexHYQ+K5LJlvusdNC8Hdg5GvwkJKVjg5CtBDBfKjzNgQZ4YEhSveL4v9pdUn9nb8TGdF8hkkcHl0VWQNkHXCfO1uRTiKN7IGlp20Li+8jbOqLNXn5VEkI2PHJcxwPkrnxxkI7qTv+IAT2HIJ8cc6LQtpLOxIdmhsiM5OrSlwZOaRt9BTGlA89iRHCguoL8oZRrCdUVE7tgrF8RiGsPUxQ+1IwNfJs7xdJ+bNV6TROXz1IajYn3dFmJgMzdWDfdMFXUE//mIZ1tZAhZ7oPLZPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=4IXnaVXprWFAuOQU8PKbZXQVNllpdOU4xfnpWW8BszE=;
 b=k5eMF/Ue4iDkOxehOwRs/BJElKf1Dq3TcoLGHvKlo1mFZ7InGTMo1Esrv/HdpIJf+PCnZm6pOV4WsiAlO4nLatf5tOuq6XP/wRTeRW9XYMSGJNCEOcLZRlv6Yb4q4nCbjARQfJXK1t1sntS1qYX7J96hAc4tJAMUEQgie6v0bhM1TfWlSQgYSpdyouwONZEuCf5DaYwwcL/Xp1VPZ9V08SVqL7EnlkQCtQW+1G2ycLPgTZ6LSqx9x9nb6WtxUl4lWLYiTnrO8fAXj7mytRc2apLefw6owUc2rwgrwve17Er2cf1ce/vM24OEwgk7DBr0hz50AGkpivp9pu0iIkgBBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4IXnaVXprWFAuOQU8PKbZXQVNllpdOU4xfnpWW8BszE=;
 b=UZD5fGTY7u+MmDf95DVMxUi9qkQKDaZ1n0HqBxvVMI2TLDrAsaitqYAa8ZdycjiEeIYf3dtTHCzOWLOJTwuJYhIPIhinva8/BHi+EDNZhOH1nOd/Pi94BliOLhQIKXw0tD7kwkfddWDnxJATjWfGO+Zxhdfqd7l7ywzwA1UQJGo=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from VI1PR08MB5503.eurprd08.prod.outlook.com (2603:10a6:803:137::19)
 by VI1PR08MB3472.eurprd08.prod.outlook.com (2603:10a6:803:80::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Wed, 1 Sep
 2021 12:11:06 +0000
Received: from VI1PR08MB5503.eurprd08.prod.outlook.com
 ([fe80::2082:8a88:6ff1:2dd8]) by VI1PR08MB5503.eurprd08.prod.outlook.com
 ([fe80::2082:8a88:6ff1:2dd8%5]) with mapi id 15.20.4478.017; Wed, 1 Sep 2021
 12:11:06 +0000
Subject: Re: [PATCH for-6.2 v3 09/12] mirror: Check job_is_cancelled() earlier
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>
References: <20210806093859.706464-1-mreitz@redhat.com>
 <20210806093859.706464-10-mreitz@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <729491a7-9c56-ee91-9ea2-d66e4ec44e15@virtuozzo.com>
Date: Wed, 1 Sep 2021 15:11:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210806093859.706464-10-mreitz@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM4PR0701CA0036.eurprd07.prod.outlook.com
 (2603:10a6:200:42::46) To VI1PR08MB5503.eurprd08.prod.outlook.com
 (2603:10a6:803:137::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.196) by
 AM4PR0701CA0036.eurprd07.prod.outlook.com (2603:10a6:200:42::46) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.10 via Frontend
 Transport; Wed, 1 Sep 2021 12:11:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fc1d9c2a-3d6d-4401-ede6-08d96d419341
X-MS-TrafficTypeDiagnostic: VI1PR08MB3472:
X-Microsoft-Antispam-PRVS: <VI1PR08MB34727F17F15770D5F197EF1CC1CD9@VI1PR08MB3472.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: K8CKrkSaHaMPt908xVWYvEe+gW8Le+nMs22QcUF5vdCwsihD/cIKBOoYsFGY+a38M3g8o8KZf0fygt8julk4TvuCCk1+pb2G/fwuLLKeHaIK6IQgAQj+fW0gUmXyzLouYWiyW06nFoC3Bw8mLa0ojVcBvaSAEm675oJF7axkhf4fIUp9X9j9atDPHa0XRUM2lgzZ9BcALUl72y3CZ6gcnIFuFaXFfSC2l5V4c2+lEVNbrv7CCHciVW2gxXEKUzefKuJ6dQr0S/3NcbqB+DJ5tkXGbXYhTAiUNRHgwb8xW9H1FUCsybInGpeRJy0AJ6je0C8O4/igrxZYFqgWEX3TSNF258lcd9SeTWPZrD636kuEjK6rvVx6cat6ijhTRQUdqcVLS9a7gkK84WJEdS6/nNXsFCpDGLhVl7nD1AfwqMXGdR6dEijnpUj44tPGdv6KZzHTpIk0Qei3mHeSNEisLwg4pWFpaZ6oGQMARURaNm8t2s/DDuiaQAFy0xeiLSpuLhrK+d53REKhXRFyuGUREN80jsUo4Uc/4N14h3Rri25eU8B5YgnF3gK/vDyCMbqwARF9z1z3bKrSF4VLcjJzkSI6LLPQU6Npj6Y9HbLFg92Ri4kOeaaeLhtmM8YXfN9O53M6MIT2gIrimV9+F6cBKjaWp15MAWs4jyroveMNBngI0BWNNGQZkphwgbuqIOe8yjlni7RqDdpgB9whJzo+2G6zx0Cr5az3Rdqah/zqxBT5EtJtN7CJTYeoyszAHkX24oTbeWZiAJI3eewID/PW3JE+r1GsAt2od3Ic/6cykrbAMx31UNlFqj/wUp+4DY3zyek482MTZUsENggXekTNSvIknZ25r7HfFeJDRBz+ebs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR08MB5503.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39850400004)(346002)(396003)(366004)(376002)(2906002)(478600001)(83380400001)(4326008)(86362001)(16576012)(31696002)(36756003)(52116002)(186003)(26005)(31686004)(316002)(38100700002)(38350700002)(2616005)(956004)(4744005)(8676002)(66946007)(8936002)(6486002)(5660300002)(66476007)(66556008)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VSs3YmhOekVNMmdxb3lZTVNEUXdXQUhJNk1oczlhUWN2NXY5ZlVVRnZPWTRs?=
 =?utf-8?B?MmRnUVNveHBWZ2ZaektYb1BSQnFJOWYwUXFkZEtWRmNrMXYvQ3A5TktMSG12?=
 =?utf-8?B?VlcrUGtpaC81S25PQVVQMld4di9KbEpubEtSMWpLeXh0UXUvSC9YL01EaFhV?=
 =?utf-8?B?ck9pL1dPOXZ6REcraVUxMWpnd0I3aVdSYkdIdGxLR1lteFdSVnp2WU1sVFRH?=
 =?utf-8?B?aG5NTWtTeW9VL3llUnJ4Sm9Dd2pHR1RLUURJL1BzMGo1VVhqTTR0aEVpN2tv?=
 =?utf-8?B?Q0h3YlBrVkluUGpIYXQ3U1hvR3cyOGtXUyt0R0pyT2FDcHE5dUZybEl0MGZK?=
 =?utf-8?B?aGNoVnN5V3Ayc3BrUlErUG52dWhTN3pYbytvS1JtNWVJYk16UjA4cmkzMWo5?=
 =?utf-8?B?OU9GSHpIN0R2NjJkTEVkNXFmVWZ0YkpWQXB1d29jYmw2NVgyRDkvdEM2YjRE?=
 =?utf-8?B?VGdHQytCYmVFbUExVjM4YWpZM3ZWU3czYVVuUlBCdjYxeVo1REc5RGxHMTl3?=
 =?utf-8?B?WjhhbzVmSlViM1F4cHMwb1QzYUtxUjJBTFBIaDRlSGRpbFZCKzhtRFZhc0w4?=
 =?utf-8?B?K3prS1pYZ3E3SFJnOEFyajgvR0pWTzIxOW9BekZLUEQ5RGlldmRpUTdRaFBM?=
 =?utf-8?B?YVluSU0zUWtDTXFpanplc0F5Um92ZEs0MlVObmdwOTdvai9ZQXFMcTFSUTRZ?=
 =?utf-8?B?QzNreUxIS1hXcUxGNHVWL3MybUY0U1pKS1JKbDdNS3ppUlpXTmFDN1U2QUFs?=
 =?utf-8?B?N3NtOHhtcmtoL3VoMTdjNzM1V3NxQ2ZUQ0k3RHlYV2plWEQwTUtHUGVRaTNL?=
 =?utf-8?B?K0UrNGs3bFFjZE5yeUtKQks4U3h3eUhFb2ZwcUNPSkEwbnJqenBOVm1Zb1Z6?=
 =?utf-8?B?NmVwMkNyTzVGMUVUenpxY3hMTnBRbEUvSEl6L0JuOUpVMFd5VW5jVTVKUmtO?=
 =?utf-8?B?dG9OWGhPN0lFdUdpM1BKRmJYNU9JbGpaSVVET25GaUFCQ28ya0lFWkJQY1JI?=
 =?utf-8?B?MkthNTBvd3hPMjlQclI3T2lDRnE5bjZ4T2Z6aFhGZURhbDNWdEovc1JtbmlV?=
 =?utf-8?B?eEdpalViNXhGTzVONmRxWWJacnJkY2xUKy93RlNOcmR0SDJ0TGUvWitQUkNn?=
 =?utf-8?B?S2ptSE1uZElRZnZXRHZMc3ViajZqb2RTMk04OHZwMzRZY1g2NnBRdktvUEhM?=
 =?utf-8?B?Q0NwTzJLczlJVGkrMWUvWVU2VXRkTjZzZndPdVZzeUNYb2JtTm53ZVMrV01S?=
 =?utf-8?B?VWVpbk1rV1p6ZVJxMzIrMHdheXdNOGpsRUQ4UWQwOHpzV3grMnRpanNjUzg1?=
 =?utf-8?B?WjdEaXh2M01UWFh3cFZwcWpJWXM3VVhtczZaVTR4VkNHU3BPRlhVSWdGU1Ju?=
 =?utf-8?B?U2JSaE1JVUlyUTFZWnN6WHRic2dHMlNQV1pTTThXRlZwMWQ2WmNDWjQ5NXNH?=
 =?utf-8?B?dFQrTUttZW5uVWEwUzVRbGNXcm1UMC9Edkhvc1dLUUt4TWRTcEZEdlpoYllO?=
 =?utf-8?B?R2czSUxHSDVrKzVSVlYyY0J6aHdkZGMyekxZajN3cjdMNW5lTFQ4UXNxK3VI?=
 =?utf-8?B?TVYzbnJEVnF3WFhaelU1OWhVWnVsaVIvMWs3NlJxYjk1UTdIZkMycC9pQ1h1?=
 =?utf-8?B?TzI0RjVOQ2dKZkZTUXVjY0lkOUUxcW1XaTNPUzFKTVB3dEh1bEpLQmxCdmxS?=
 =?utf-8?B?N2ZGZjMzQmlUeC94OG9Ub2VKaFR6UkNtR2VpSHhabzlkcmxyYUhQN21PWFVW?=
 =?utf-8?Q?/pBPvVCOT/mY0ks+jAXjPDIvY7qdctQkVSuXDIG?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc1d9c2a-3d6d-4401-ede6-08d96d419341
X-MS-Exchange-CrossTenant-AuthSource: VI1PR08MB5503.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2021 12:11:06.1763 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: brOiiz+QsOmj/TIKcFJjHqilIVuifANzzlaRkzCWnO1rwtZSQuXTF3MlAVCWEDDOwBykvcTsp/FLXObXDfvp2hGZ1MMUVGyPhReNr74cNY4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3472
Received-SPF: pass client-ip=40.107.2.113;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-VE1-obe.outbound.protection.outlook.com
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

06.08.2021 12:38, Max Reitz wrote:
> We must check whether the job is force-cancelled early in our main loop,
> most importantly before any `continue` statement.  For example, we used
> to have `continue`s before our current checking location that are
> triggered by `mirror_flush()` failing.  So, if `mirror_flush()` kept
> failing, force-cancelling the job would not terminate it.
> 
> Jobs can be cancelled while they yield, and once they are
> (force-cancelled), they should not generate new I/O requests.
> Therefore, we should put the check after the last yield before
> mirror_iteration() is invoked.
> 
> Buglink:https://gitlab.com/qemu-project/qemu/-/issues/462
> Signed-off-by: Max Reitz<mreitz@redhat.com>


Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

