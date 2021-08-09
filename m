Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE9F3E4465
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 13:07:45 +0200 (CEST)
Received: from localhost ([::1]:45094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD38C-0005Ay-J6
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 07:07:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1mD36f-00042x-5N; Mon, 09 Aug 2021 07:06:09 -0400
Received: from mail-am6eur05on2135.outbound.protection.outlook.com
 ([40.107.22.135]:45344 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1mD36b-0008IB-C5; Mon, 09 Aug 2021 07:06:08 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=itnm0fVt5+J1JWZM2ojLEBEPnm0wkwJ4GK5oUn+h1V2s3v8XrVGu9q7GgGTP2Mi8LT6fjFXcDqbe5q9AjR5wV9HSOd+3zxSOSHZ9TcIvdt3Nt7Hzvk5tDPNez0f03fpyqqdvOToOe5BaJ7Kvyii3uE3gjJeGDQPfqlthMJEDOAfytQPsKdayTZZmaU40V7SDyPFlZluNtT9bRgcrFxT1CWSEQvU8zD37dYTwNHUD84WmeU+T6L5qZfp5svGyawEHmzhoVAV1W+FJBwd4mTewAN6xPBiayfZdAPla1M4InPB2OGMKWmDVr3wj7+dOSh05E7xXoBEbGvEnotcBJJvUTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xMdXbPwS6Aw54LehZk7O2015c6ue/vHP9jAvHBml5jI=;
 b=anzc/fPMkfHw1TEEeZNwMiEuzKD+wsoocglw06XhI9gt2aIiIqMnGSXVM2lrba9/pK3xgLr+Vm/ixuvjZNfgWXKq3bMx7rQsIfd80zqMZ++YComLS6lMOm3hs0Pp6ZTD3wA+dUjU8gqP5YUR6ccb8r+rX7CKmvvyzbfC1gUZw2XCDNXq5KGaORXKXv5Jt+i1zO8scXuWyhRUE+ywaU7xtx8a1PojsgQosLj0lHjLKR0lOqswGHSpCbQ6Eq5/xv/CvmIGUywPK0dDhGIMZJ5s/cPjtSDvb0qwOkKqPckRRMBqcy8fcktlWSh+A3QpwhsxqFDnF5kxlYWHrgLE0QiIAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none header.from=openvz.org;
 dkim=pass header.d=openvz.org; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=openvz.org;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xMdXbPwS6Aw54LehZk7O2015c6ue/vHP9jAvHBml5jI=;
 b=eL3ODm1UlpH1cfF1XnpBhNUmwWmrrGB9ZysDAOYEvMfFubKCVWp8ZGI+9bnO+AfUZky/M02OdAtW8ZS27YbvOJ7LHfjn9HRRmXQclp1ZLQtuHPVpLO3QhDutebshfDMNzETggZp/stE1zqKYwODLw6qO1BfeRI9x/Upbi9WSvOs=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=openvz.org;
Received: from AM6PR08MB4214.eurprd08.prod.outlook.com (2603:10a6:20b:8d::30)
 by AM6PR08MB4533.eurprd08.prod.outlook.com (2603:10a6:20b:b5::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.19; Mon, 9 Aug
 2021 11:06:00 +0000
Received: from AM6PR08MB4214.eurprd08.prod.outlook.com
 ([fe80::4cd2:24f4:d151:6501]) by AM6PR08MB4214.eurprd08.prod.outlook.com
 ([fe80::4cd2:24f4:d151:6501%3]) with mapi id 15.20.4394.023; Mon, 9 Aug 2021
 11:06:00 +0000
Subject: Re: [PATCH-for-6.1 v2] block/export/fuse.c: fix musl build
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, qemu-devel@nongnu.org
References: <20210809095101.1101336-1-fontaine.fabrice@gmail.com>
 <89081202-f46d-7345-1ddd-0c2f9418483d@redhat.com>
From: "Denis V. Lunev" <den@openvz.org>
Message-ID: <b8fbce34-aff3-c4ad-76bd-e8925f27296b@openvz.org>
Date: Mon, 9 Aug 2021 14:05:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <89081202-f46d-7345-1ddd-0c2f9418483d@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: HE1P190CA0007.EURP190.PROD.OUTLOOK.COM (2603:10a6:3:bc::17)
 To AM6PR08MB4214.eurprd08.prod.outlook.com
 (2603:10a6:20b:8d::30)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.56] (31.148.204.195) by
 HE1P190CA0007.EURP190.PROD.OUTLOOK.COM (2603:10a6:3:bc::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.15 via Frontend Transport; Mon, 9 Aug 2021 11:05:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7d0a2d38-082e-4950-2238-08d95b25ab83
X-MS-TrafficTypeDiagnostic: AM6PR08MB4533:
X-Microsoft-Antispam-PRVS: <AM6PR08MB45335CEF7EFA25AD7288F5F7B6F69@AM6PR08MB4533.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:561;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5fQ03eWE9RMD7uZE39Hx4uc/5JBhkWUuoT0rDU0w2hbvAgosSj/AstaM0bUbzcfNjtOwE6wsjNKDany2pyVx/WB+G2y3VUH6wCHRPq74AF5RjxsUTyYYnZB1xtjeEdMUCzllOjc6GTEWArXyIsp+S+G5G2o6VWa9mljzyo+bGW66Q5eAxPwv3LeMzsKKTTfNqYEUjLA02tBop4jYuMsfAiu7isFgnpdABpFTxBbw10Sx27Ak3Hf1brF/34T8E+78lQCf1CG46muuhw71VQtCodfgbihA4eHFTOnksypGIyA8nwFl6xzI5Cpgs/QHtP9qcJ6F2HJUevMpf24u8QWnzlPpgQ54QSuKFP//ZPlJ/XcosMR+VB6af42pL4mAOqK7NKgvI9n3Lv3pheamz8ZHsM5PQkXZV9Y0xrbwJ29we0YSMcdhbXY9EIlbj+sybX2jcnfN4P3GO7yJaAVsaqLwngWexC/z17K6oFKyIGX4Eyl4+whflvTd3ikXFhCY0ltbLaqXV6mGMogWzJ8rFEO1vFztEiwRZ8ZX+XafblFhn7DVoL4a6czqseC+x+P5XS9p48pUpteB3zwvts1PQlZPZdm03uzBsAyQ4H4hggQ0v1DYvHg2nlIEd+sr5pjjvbmt8YyNuZUii5Tx/yiZo910O0F7/iULcEVCiP1QvaOQtB42T7LfMq4nu+Bj+xcGgO1/pwJqhnWDObeiI1jSO0PZmSTf+R0cJadBCpiTMZ9jKKvXk7Z62y817MAmdutspYgb6IR68XjTaQBVUx4O/J8lKHvSMMaPrER9WRoAAy2yKGFcpU+u4xrQgDcxdNKHPjaE73GioiKW7RGYbrcgMdVOjPIqz8GX5fmVWoNXgqqs2V8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR08MB4214.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(346002)(376002)(39830400003)(366004)(26005)(66946007)(42882007)(66556008)(4326008)(83170400001)(956004)(2616005)(31686004)(66476007)(186003)(83380400001)(36756003)(38100700002)(2906002)(38350700002)(478600001)(110136005)(54906003)(52116002)(6486002)(5660300002)(8936002)(53546011)(8676002)(31696002)(16576012)(316002)(966005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Qk5Qc0M2b0djMUF4VXpTUTdjZU5FaUhRTHkveThheUg2Ylo2cCtQU2JiWHpm?=
 =?utf-8?B?NHNjTHZZNG52K1FEaVhBalRuNG85WFFSekEvUkt6N051SFJmRkIycmx1OTBH?=
 =?utf-8?B?R0thUXNxajBDUFdKYjZZRzN1UUYyRzBzRjVobnVrazFvQ0NXVTZtSHdHckNa?=
 =?utf-8?B?enZ4aUUxWUlSaDduOXk5aEsxcW13N2JoY21Mc0NJQ0NFNTNFZXZmMTVmU1JD?=
 =?utf-8?B?QlRvY3kvZFNFS01VOVg4dUd5eWFlR0hmcHArb1BSNFJEdEhLZzcrT1VwWVJm?=
 =?utf-8?B?RTY4UjdlRHY0UGxzZzZWL0pubFNNWDhpS1k1MGQzb0RtcEhab2UzaWZGMGJ4?=
 =?utf-8?B?YnBUT3pKZWdGSTNZY0ZCRWVSdnljdjlTMU5oeGhadmJNQTBkNHY1aUtyNG9r?=
 =?utf-8?B?Z0pPS3ZBVXJzZEFZU3JmcVkxbXc5MWhFUXRYM0RkOUhGYldOaXpBT1d5OWNG?=
 =?utf-8?B?WmIrNTdnYm40ZDBOaDR3KzdxdGhrczhwVmhzM0ZuRVdReEx1MmFOY1MyTEcr?=
 =?utf-8?B?dGpSbzBKcktPWEwvcS9Ya2t6WUxpUkE4VE9jRGMwamNZanhxZS9CT3JKdG5Q?=
 =?utf-8?B?VjhxbWRMZzI0djI2Rm9iZ2NoeU0reEJBak9XYkh5ZFM0OEl6eDVxa1BXL3JF?=
 =?utf-8?B?NThVL0ltTXFaZTlDck00TEUvUHRuTzZZRThJc2NRaUJuM1BneVVCenRtTmZ2?=
 =?utf-8?B?UDdxWlA3c0EzVHJsaURqVjR4T3R3eUhxRExOR2N3cWJPY01Ranp1TTEwSi83?=
 =?utf-8?B?azRYZThJM0FWNUhDemZZTDRlVXhrd0s0cVEyc1pmcDFsRWx0UGlGYlZtMGN3?=
 =?utf-8?B?VndGVkZKaHQyRkxMN2t6dEhHQnl6cW5XZ2pPRnUxZXpRbktjRGZveXJYKzlD?=
 =?utf-8?B?clNmZ2hMZDNNYm1IaU1QWENIU01Hckhic3E0ZFJkWXdYbkV3cHhKNmVta2dO?=
 =?utf-8?B?STBXRVB3dEpaVUZ4ODh1THJkOEMwSmNtTVlIdWdsc295ZFRJaG5zem53Q1l4?=
 =?utf-8?B?QUswem1mMVJjZWNyRzNDRWpacWZjT2xVWGsxODNwaXVaU3V6eU4weHF4Umhj?=
 =?utf-8?B?UVROdkM2SzBMWmx6cU9HTEw2QlJ2WFlVM3d1U00vOXd3MzJXUGxtK0FpQWIv?=
 =?utf-8?B?bW12ZS8rWVBPRmtyNElybTdERy85dE8veWZCS2J2K29BQi8vR1Fna0g4ZVph?=
 =?utf-8?B?R1NhQmpGTFdYUmxlWnFJMFBjMW5YZXNsS2dpay9Fb29iZW4reEZmaGk5V1Js?=
 =?utf-8?B?ZS9LMW9BalBBRk8zaWRPNEpyZTJZVnZaTWpobXh3eXBrV2tCWEladXQzZ2xH?=
 =?utf-8?B?VDhUQlFGQkxSWlQ2eHhOeXNTbnF1UC94SUlvU0RvYmFpb3dnYUNWZC9XdEtx?=
 =?utf-8?B?TDRaUEpwREN3ejRKSWVKY3ZvNithdVpWYTEycnN6YThhV1RyOTBUWW42Nnpj?=
 =?utf-8?B?WlI1Y0VqQWJuQ3ovQTNCOFVNVU9saktvU0huMGhZZmRQM0MxL3lLYUU1cXdh?=
 =?utf-8?B?WWpTSTN2THp6d054OStmZlBMeWhVdHFIc2VES1RZUjd0SUo0NDdQU3B0WUgr?=
 =?utf-8?B?OXoxTlRrQVhrelBTRnlWN0liNFBFZWNNTVJBQVQxZEpBOXZCYmpnUkhDWVNV?=
 =?utf-8?B?NFJMdUdmd1NnbkFYQUFhTCszT2NqQVBwZXVFU3VZZnpFcC9xeTFQbnQ5cGtB?=
 =?utf-8?B?d2NQUlEzeHZKM1RINzRobG9ZZU5xLzIyRUdYQ2NHNUgraUozWDNiZjl4L2Ey?=
 =?utf-8?Q?5PljBP7m9JYyAMx+6D+7LEK9Sbq4d0TliYxflu0?=
X-OriginatorOrg: openvz.org
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d0a2d38-082e-4950-2238-08d95b25ab83
X-MS-Exchange-CrossTenant-AuthSource: AM6PR08MB4214.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2021 11:06:00.0640 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MaP/uKV9yTb2CFzMJw6UOV0wHYs+owrvsxdQU9plOtN9w68FGTvNKB9e+HteNc3rRl5UNe+HnlOAKoUd3LaOFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4533
Received-SPF: pass client-ip=40.107.22.135; envelope-from=den@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Qemu-block <qemu-block@nongnu.org>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/9/21 1:27 PM, Philippe Mathieu-Daudé wrote:
> On 8/9/21 11:51 AM, Fabrice Fontaine wrote:
>> Fix the following build failure on musl raised since version 6.0.0 and
>> https://gitlab.com/qemu-project/qemu/-/commit/4ca37a96a75aafe7a37ba51ab1912b09b7190a6b
>> because musl does not define FALLOC_FL_ZERO_RANGE:
>>
>> ../block/export/fuse.c: In function 'fuse_fallocate':
>> ../block/export/fuse.c:563:23: error: 'FALLOC_FL_ZERO_RANGE' undeclared (first use in this function)
>>   563 |     } else if (mode & FALLOC_FL_ZERO_RANGE) {
>>       |                       ^~~~~~~~~~~~~~~~~~~~
>>
>> Fixes:
>>  - http://autobuild.buildroot.org/results/b96e3d364fd1f8bbfb18904a742e73327d308f64
>>
>> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>> ---
>> Changes v1 -> v2 (after review of Philippe Mathieu-Daudé):
>>  - Use CONFIG_FALLOCATE_ZERO_RANGE and make safer #ifdef'ry
>>
>>  block/export/fuse.c | 8 ++++++--
>>  1 file changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/block/export/fuse.c b/block/export/fuse.c
>> index ada9e263eb..fc7b07d2b5 100644
>> --- a/block/export/fuse.c
>> +++ b/block/export/fuse.c
>> @@ -635,7 +635,9 @@ static void fuse_fallocate(fuse_req_t req, fuse_ino_t inode, int mode,
>>              offset += size;
>>              length -= size;
>>          } while (ret == 0 && length > 0);
>> -    } else if (mode & FALLOC_FL_ZERO_RANGE) {
>> +    }
>> +#ifdef CONFIG_FALLOCATE_ZERO_RANGE
>> +    else if (mode & FALLOC_FL_ZERO_RANGE) {
>>          if (!(mode & FALLOC_FL_KEEP_SIZE) && offset + length > blk_len) {
>>              /* No need for zeroes, we are going to write them ourselves */
>>              ret = fuse_do_truncate(exp, offset + length, false,
>> @@ -654,7 +656,9 @@ static void fuse_fallocate(fuse_req_t req, fuse_ino_t inode, int mode,
>>              offset += size;
>>              length -= size;
>>          } while (ret == 0 && length > 0);
>> -    } else if (!mode) {
>> +    }
>> +#endif /* CONFIG_FALLOCATE_ZERO_RANGE */
>> +    else if (!mode) {
>>          /* We can only fallocate at the EOF with a truncate */
>>          if (offset < blk_len) {
>>              fuse_reply_err(req, EOPNOTSUPP);
>>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>
Reviewed-by: Denis V. Lunev <den@openvz.org>

