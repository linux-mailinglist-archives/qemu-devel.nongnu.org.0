Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B165C2F8D19
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Jan 2021 12:35:45 +0100 (CET)
Received: from localhost ([::1]:54676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0jrs-0005i8-78
	for lists+qemu-devel@lfdr.de; Sat, 16 Jan 2021 06:35:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l0jqf-00054p-8N; Sat, 16 Jan 2021 06:34:29 -0500
Received: from mail-db8eur05on2102.outbound.protection.outlook.com
 ([40.107.20.102]:1761 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l0jqZ-0007zH-DW; Sat, 16 Jan 2021 06:34:28 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J3vewKrkTcmUezM36nTnszobAeqHJKPfis84gcD1ucayjWDH5boYuU6aGMkiwTDV5N89JExkptnKBIGhlk73PWJSzVCD1DBBQY+ochPAGd9ejCy38ON3oWwIYK88jjEskM29EmWqUztUAtG4cEVDCTkxtbtc3NroB+acvuGCJdQZo3DckwPop7NJI02DjHXYzaUYtE6CQcRBOzkcH1/GOf+ndY3zJOJK6N+T46IQ8zRtwVDrNI7/BCFTIcjdkdDYMvHh333Igho9JHOUUF0LSzE8gxTHHXR41nAy3earzU+nI5UxSmGJ1h+f2MfC4TaB7LCJueyXk7vIY+GBo2KvRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E5YN6pPjqU/IvAanfp5rlWC6NhULF7kxVcvoogflGvs=;
 b=R6BfySZMSjTvMusCZHK3aqX2jZLix1IYOUodt/XIQW/Bw0ufC0hpFoENl/fM1csiPaNjH+4KWcYfpNHo9ISZpJyQZXd3rCpZ2AHLEQpy7KaV6hiflwcRyGKLjHT2UznKJOIVINktzIokdTmqsahxcP8S7HYR1R/qQdGOH81/xUB866nyEP/F6tzZNVdbumiuUQBJ24opyXIVzX/pM+Vc6M85pivfR5JNv+ybv32GxltjnATePbRLQncg4l+tKukMd6NMDJFsRMIrtFkmAwcUFcJaTMOr86lNkvFv6PPcUuEB7JEzITG6KvIr66xaGpkHa6nDrbK9FyunTYUD9W2x+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E5YN6pPjqU/IvAanfp5rlWC6NhULF7kxVcvoogflGvs=;
 b=Xpq8VHHa4vHf/b4vRuPW84K++CIM2hnnkLGiBGI31zPk+uwE6KTQDfi0lDp/nEtns+iShj/6T28dKhaVd6+fF9pLCgQ9oSAsshJkZxtcNNUmq3vo48gjtfJP2MOIUpXv/mLMcMbtVtlo0ggY5I+zQZqcj0kgxwltEJvroCf5Qok=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from VI1PR08MB5503.eurprd08.prod.outlook.com (2603:10a6:803:137::19)
 by VI1PR08MB5294.eurprd08.prod.outlook.com (2603:10a6:803:de::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Sat, 16 Jan
 2021 11:19:16 +0000
Received: from VI1PR08MB5503.eurprd08.prod.outlook.com
 ([fe80::44c9:5ac7:5302:7179]) by VI1PR08MB5503.eurprd08.prod.outlook.com
 ([fe80::44c9:5ac7:5302:7179%4]) with mapi id 15.20.3763.013; Sat, 16 Jan 2021
 11:19:16 +0000
Subject: Re: [PATCH v6 08/11] iotests: add testenv.py
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: Kevin Wolf <kwolf@redhat.com>
References: <20210109122631.167314-1-vsementsov@virtuozzo.com>
 <20210109122631.167314-9-vsementsov@virtuozzo.com>
 <20210115111827.GB5429@merkur.fritz.box>
 <6fbbcc18-3f14-bcd6-05a2-a40e0352710d@virtuozzo.com>
 <20210115124555.GC5429@merkur.fritz.box>
 <41e62d69-30f1-eb86-6cc3-cdd052aadb26@virtuozzo.com>
 <20210115132019.GD5429@merkur.fritz.box>
 <7e520790-bc1e-739e-3822-ca78799f5a3f@virtuozzo.com>
 <c52d0f46-116f-5f28-a15f-0bc128fca7eb@virtuozzo.com>
Message-ID: <cc2cff98-2b25-ac5c-ad71-964466175373@virtuozzo.com>
Date: Sat, 16 Jan 2021 14:19:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <c52d0f46-116f-5f28-a15f-0bc128fca7eb@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.72]
X-ClientProxiedBy: AM0PR02CA0219.eurprd02.prod.outlook.com
 (2603:10a6:20b:28f::26) To VI1PR08MB5503.eurprd08.prod.outlook.com
 (2603:10a6:803:137::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.72) by
 AM0PR02CA0219.eurprd02.prod.outlook.com (2603:10a6:20b:28f::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11 via Frontend
 Transport; Sat, 16 Jan 2021 11:19:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c29b7f75-0d04-4901-322e-08d8ba108f95
X-MS-TrafficTypeDiagnostic: VI1PR08MB5294:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR08MB52943D0C3562194727E660F2C1A60@VI1PR08MB5294.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BfQOtGPgLT5DZahxjwATgXmlDbS1dfQZrq7y9jmr4XtEQl7w2yAgqg91tkdBME+nLs0EiTnOQS4apLl3VVs1drqVR6oywHtNEmNs7FJ4P/B+t+BtE28yKOtk+nTitiZK1RHZZ3QLRUiKkAbJz25Dp1htwPeH71XyvavkV9o8OKoy7ZTAFxb06ZMeP+UCZfPdwx3r5dDSy7PCWWv83S/Ukyjgoq3C3Sd0RgVG7JbStPJtMflF3d1uaGC+tt4IQ/PVDPdkafUxTZdcQhp70PAub3M48jxkShhNhqX074OE12TSGOjemFPAXqVygAik4xkH9zmg6HiVLhI/86yX558b0WTPeiWf8tqCUIj9ytRMy4Ngp9xkErcCMPGN/zMMrgaW6YOak3mQJaBCSDEg0kQLqD6cE3G3b1Zj72OSHerCIZKkgBV1FxfQ7AYYIRdnp11vS3Yg8AERd6HTjLsV90I/Ndfm3vaEdo2XRwfDjIzWDWw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR08MB5503.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39830400003)(366004)(376002)(396003)(136003)(4326008)(16576012)(36756003)(8676002)(6916009)(6486002)(26005)(5660300002)(16526019)(478600001)(66946007)(31686004)(2616005)(956004)(186003)(52116002)(66476007)(8936002)(2906002)(86362001)(66556008)(31696002)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?QTVKNjNoOFJFTmpCbEVXM20wbVhVZHBtcGVCZGMxelcyQWdHeEtYeXE0TE8w?=
 =?utf-8?B?K05rZXVRSzh0SnZlaStkOHJDa2lsbmpxc0pnYk9xclFQK0hSaGxGUHI2Y29E?=
 =?utf-8?B?RkFURGNJVzZ5ZnljTTRwcUtQclhTOHV5M0lTdVV4eW1MY3ZHVnpaOWZsVzVN?=
 =?utf-8?B?cUZqdzIyU3FpSG9ENzdLcjN0ZFBvbVd6UEk2ZHRScG9JVjFWL3hBQnovQ3RB?=
 =?utf-8?B?ODBJTVpxeDFZWHZ0RVhiN3hVdjdURStoR2YzQzVGbEVXV3l4U05qT1ZXa09L?=
 =?utf-8?B?ekFzOXAvZ1Bvc0dhcWEybTBzN2VSeTI1S2hyeXJhRjRBck5UU2thN2pEbHgy?=
 =?utf-8?B?Tm1Wd0ZiWWp1R2lCUXZBb1REcm1CbjRrOXJxbG5EWjMxV05aMStGVFFxSWhj?=
 =?utf-8?B?YWg3akJ6Q3hJTlErK2ZHYmdiZHQxZHdVaExmK3ZpSDVCNmFaVFdZZGx6NytX?=
 =?utf-8?B?enBHNE5HeEdOMVlROFk5WmNmN0o1bU9vQjBsRk84d1pIYmwwL1NQdktjSUpY?=
 =?utf-8?B?ZlhDNzkrcXdSckVndzNQcGwvTnB1dUw2SzlkZTJ0bzNhUTNJcDJYQ1FPSHRN?=
 =?utf-8?B?YzVWd014aDczZm5oeHNRc1JvVS9ONmZ5Qlo2M0NZbTJCUjZlUUxQZTZOR3U5?=
 =?utf-8?B?Wk5FeVA4Y1Q4R05YRjVWbnVHR2ozN01JeTJ0UE9tQStVZ1IycXU4bGt0NExJ?=
 =?utf-8?B?Y3o1V011YXdoWStUenpaNnVyaEMydU9ZY09SK2xRNTVVSnhzZXRJbFlrMDJs?=
 =?utf-8?B?MElTVmJyUm9Ub0JhcGhQWmZDak1oQ3dNNDlBSEluZ0NqK3ZMbEhOcmQ3R2w2?=
 =?utf-8?B?WUgzQzJ4ZzhpSlJYV25KUEFqcm04VHBKU2toWVpCQ2gwTnhTYlV1TkdpMGYw?=
 =?utf-8?B?elJtR2h2SXA4V1kvOTJFNW9xYko0MGhWNmZPa3hvaVk3VTBESDU4MDlIZ2Iw?=
 =?utf-8?B?ZW5ka21XTlBUR2ZyeUxhTmdLSk5wRDREODE5Z0UvTEFxSEhQT1Jva24yQ1lm?=
 =?utf-8?B?Zy8yMGxkREJiSDJ4eGp5Zm9Ec2xGM0wvNEJiL1pQYUlLYTNtUHloc3c1eHNJ?=
 =?utf-8?B?UHlNN3pkVXNGZVNDZnVwd1NQQUhDY0swQUFPZ0E5NjVxZGtzNTMxV3I5aGlX?=
 =?utf-8?B?UjhCMUR5WjVsUUR0K3N2TjlZR1FZdUxuUUlCUTFmclA4d3l2MCt3MjBYM0dH?=
 =?utf-8?B?K2ptaC9BaFJrVXlLaytMM3Z4bld1T2FaNDlsQW5TUGswODhlV3VDaDMzZXRQ?=
 =?utf-8?B?MGVRZVdJT1NvUndPYXhXeW1URFA1cXFCbExzeTRlbUcrMTBLRjFaYmhkZ201?=
 =?utf-8?Q?KGg6yaoHCuncWvw5/LjDX5J/VJlPHhT3U5?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c29b7f75-0d04-4901-322e-08d8ba108f95
X-MS-Exchange-CrossTenant-AuthSource: VI1PR08MB5503.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2021 11:19:16.5760 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nycpzs8ddy7z/7FyR914AOllZyGor+S54oxYtY4qHD4pdGrfpEub22fyViLq7nsn7rcbJXcLHMkxpOrxTg3rHbKhps/UjxAwNV95K7DyRVc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5294
Received-SPF: pass client-ip=40.107.20.102;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, mreitz@redhat.com,
 den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

16.01.2021 14:03, Vladimir Sementsov-Ogievskiy wrote:
> 15.01.2021 16:30, Vladimir Sementsov-Ogievskiy wrote:
>> 15.01.2021 16:20, Kevin Wolf wrote:
>>> Am 15.01.2021 um 14:10 hat Vladimir Sementsov-Ogievskiy geschrieben:
>>>> 15.01.2021 15:45, Kevin Wolf wrote:
>>>>> Am 15.01.2021 um 13:19 hat Vladimir Sementsov-Ogievskiy geschrieben:
>>>>>> 15.01.2021 14:18, Kevin Wolf wrote:
>>>>>>> Am 09.01.2021 um 13:26 hat Vladimir Sementsov-Ogievskiy geschrieben:
>>>>>>>> Add TestEnv class, which will handle test environment in a new python
>>>>>>>> iotests running framework.
>>>>>>>>
>>>>>>>> Difference with current ./check interface:
>>>>>>>> - -v (verbose) option dropped, as it is unused
>>>>>>>>
>>>>>>>> - -xdiff option is dropped, until somebody complains that it is needed
>>>>>>>> - same for -n option
>>>>>>>>
>>>>>>>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>>>>>>>> ---
>>>>>>>>     tests/qemu-iotests/testenv.py | 328 ++++++++++++++++++++++++++++++++++
>>>>>>>>     1 file changed, 328 insertions(+)
>>>>>>>>     create mode 100755 tests/qemu-iotests/testenv.py
>>>>>>>>
>>>>
>>>> [..]
>>>>
>>>>>>>> +    def init_binaries(self):
>>>>>>>> +        """Init binary path variables:
>>>>>>>> +             PYTHON (for bash tests)
>>>>>>>> +             QEMU_PROG, QEMU_IMG_PROG, QEMU_IO_PROG, QEMU_NBD_PROG, QSD_PROG
>>>>>>>> +             SOCKET_SCM_HELPER
>>>>>>>> +        """
>>>>>>>> +        self.python = '/usr/bin/python3 -B'
>>>>>>>
>>>>>>> This doesn't look right, we need to respect the Python binary set in
>>>>>>> configure (which I think we get from common.env)
>>>>>>
>>>>>> Oh, I missed the change. Then I should just drop this self.python.
>>>>>
>>>>> Do we still get the value from elsewhere or do we need to manually parse
>>>>> common.env?
>>>>
>>>> Hmm.. Good question. We have either parse common.env, and still create self.python variable.
>>>>
>>>> Or drop it, and include common.env directly to bash tests. For this we'll need to export
>>>>
>>>> BUILD_IOTESTS, and do
>>>>   . $BUILD_IOTESTS/common.env
>>>>
>>>> in common.rc..
>>>
>>> check uses it, too, for running Python test cases.
>>>
>>
>> But new check (written in python) doesn't.. Should I keep bash check, which will have only one line to call check.py with help of PYTHON?
>>
>>
> 
> Or finally, may be just drop it? Can we just use system python for tests, now when we are already in a python3 world?
> 

Oh, I know. We just need to use "self.python = sys.executable", so that tests uses the interpreter that runs check.

-- 
Best regards,
Vladimir

