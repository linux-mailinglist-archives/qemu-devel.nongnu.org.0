Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD6EA396DD6
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 09:17:43 +0200 (CEST)
Received: from localhost ([::1]:43708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnyek-0006Xn-Sc
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 03:17:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lnydc-0005iM-Nx; Tue, 01 Jun 2021 03:16:32 -0400
Received: from mail-eopbgr60104.outbound.protection.outlook.com
 ([40.107.6.104]:46756 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lnydZ-000627-G6; Tue, 01 Jun 2021 03:16:31 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wg+Ujg+3JLMgHiNpsahZP5Qwyl+ji7bkOAHqOV2WsNT33ouu/VpOZqZl3csz02F1WQEzBfv+msz7eB7MnfQZiHkp86zUcJl6eS9JtYunSrP+ljK/fT/2THE4yIfU2Yx2tSMdyV5zOPrs8PDI0GjCgwaJPWHIpOQ0kJ30+kzH8Swq9NpQRTRqjYXa5pfblTx4f0yyPP9d4HDZZGjn2zehuUiibWc8/r5Xd9KhqJDJ9YTyzfISPzV1IQV5VANhmib5RGBCcOvznjACQ01g1OQFJu8QKJbv1YvwPAciUrDjUxxSTZTtwnA2fuo+Ws82cmRQy1Vo7l3Q55kJC16x5w22Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9YI+we0qFpfbCr5U8BNhOimZA4XHeD/jxYbnsom3z2Q=;
 b=dLgOpvIA9tnOGUllWOQz+lAa8o2/avkzulTacM1eud0F+36VYSi7qSt/OQ1Y0e8rM88lyjhUtegQimZo31LycyA765e050nf+XVTagiAozEMnGzc2gMVP3gwekgOvHZ9pQsaV63c/2l6sTgn3ZtsGhKE1npzLSlXKWzh4Zn3b8oTmfS6B65/22h1o8qBtPBE5ADmvTxOgs+rhuH62c7rtDcocP66g1jtBdmcljL9HaNvLdH0i1yXjl/eethHDPcipsBka6CVQyPZnZxOtC7bg7ww8YFXkaFCE6gZKjMzDpggmVXmiCXLWgCEd3QmpRon8Vq7ZTD2CLPr22lvyoy4LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9YI+we0qFpfbCr5U8BNhOimZA4XHeD/jxYbnsom3z2Q=;
 b=Gy2SZbu5Y78WBTLwUN/a3FTyxGHdMFYn3/f3K5uWmPleLrjcb1S71nMxVIcZY1za9uArKOZePSRj70Np0j072spw/WkUEHsnqst9JcjClwlXq36x4KknlUyTT4zTTE4GLKzzkBqX5bwRSTlo5XCP5IV2Y275o0VLiHDhW814d1E=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3623.eurprd08.prod.outlook.com (2603:10a6:20b:48::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.24; Tue, 1 Jun
 2021 07:16:25 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%7]) with mapi id 15.20.4173.030; Tue, 1 Jun 2021
 07:16:25 +0000
Subject: Re: [PATCH v3] docs/secure-coding-practices: Describe how to use
 'null-co' block driver
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org
Cc: Max Reitz <mreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Bandan Das <bsd@redhat.com>, Prasad J Pandit <ppandit@redhat.com>
References: <20210601053503.1828319-1-philmd@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <e471903c-71c2-77a3-c235-0608986d09de@virtuozzo.com>
Date: Tue, 1 Jun 2021 10:16:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <20210601053503.1828319-1-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.210]
X-ClientProxiedBy: AM0PR02CA0129.eurprd02.prod.outlook.com
 (2603:10a6:20b:28c::26) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.210) by
 AM0PR02CA0129.eurprd02.prod.outlook.com (2603:10a6:20b:28c::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20 via Frontend
 Transport; Tue, 1 Jun 2021 07:16:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 627e15c1-5769-41da-a22b-08d924cd2a8b
X-MS-TrafficTypeDiagnostic: AM6PR08MB3623:
X-Microsoft-Antispam-PRVS: <AM6PR08MB36234B9CEC9DF882CB96361DC13E9@AM6PR08MB3623.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:923;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bak5r6Z9hjOS8ael0FREcl7szOLmWs/yDc9tV2cc4qDRnjczTZHFL7jdbzhaQUorK6OJN8OQwTa4mXePTLWDv3s/tWRVuIf8wh1kFTIuPz77uTiax5OzvvQBtXVkPEqESyYSRx1WWt8j7AJjiC0LaQrDZFPd0xVvgvAmwXjzPHqstni1B/rz4hC+Xyd/CUqoJx7WKC+/olgYrhxxtiHmIKOF1ytxTPu4VFfcoIuYJGPABnii10uz5JzIJKa1BHSiUvICCD8cX/u3b9Zo6XTRddNVATQYLQ0rH5UJee4obnIMQ+xjFimvR2GuNTcKmqT0K3aNfqPUs4B5XqTLClrC5agfJ2Pnrnir3G8H5JUU9C6TYYO8AEahzhXtcHwRQ7YLzGVNWfsREshyCVouMV/WBqpaTlIbtrkQZ9mkKm1AgQugF4g+xUYmw5YUqsSnAiaEQORxdFUQeQutgVf6cI3NbIqHJrt2iNrLUULgl31kqR40NmjRpQ682FFr/HOyGED+dF6UbN+p1yDSbTbZPkKXCwPCbWVXqLbMs8vMGv37OlSvQ/rQAsWfv9EvCpwaqJplmCsb/k7132NpiVVm/8Mz5YX+T1x8oBZUCKg7Djs1j50YtV24tu2yoW3JQWraqTZL6ExukZCBEXcb5AeFFtavR10IAsvELR51v6EEtzhKrUcT4t2XPSD3Au8n+vjCbSqUPIBNISirDdZPIr4h/9ySEw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(346002)(396003)(136003)(366004)(376002)(66476007)(66946007)(86362001)(31686004)(66556008)(83380400001)(956004)(36756003)(316002)(8676002)(54906003)(26005)(2906002)(6486002)(478600001)(8936002)(16576012)(5660300002)(52116002)(4744005)(186003)(16526019)(38350700002)(110136005)(4326008)(31696002)(38100700002)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?cHNybk5xL0d0empOV0NURENFbG1LUWlpTU9qWU11RVdCZDVUVFFYdU1iTUVF?=
 =?utf-8?B?MlFjcnhQQ0d0U2ZtTFQ4djRXait2K2ZEM1U3alhOZUdKQStWZUgvWmtET0dm?=
 =?utf-8?B?RG5PRkNVTjd6TG10SGRSbEdhUTB1RndQa0xCZmlBZWdrMHhRclN5eGV1TFk2?=
 =?utf-8?B?Z3l5c2RMUmthRWw5VnpzQU8xNDdQYWM2ellFQWxzS0c1QnlwNXVmL0IxM0JH?=
 =?utf-8?B?bldqaGhiZy9PblkxL0hzb09QMWo5RG1RS0V4NzZyVWJhcVAwWUlraTBWeU5O?=
 =?utf-8?B?VDBVSmZwN1F4aEpYeWZFcjhPM1F6Y3hic2MySi9vNVVOQ2FJTDE1MW5YK2xo?=
 =?utf-8?B?cmN6ejlscEphUEY1UFByKzFjRnVtR3FnR2sxVEN1anpjeXZtcENFa0FZQ29k?=
 =?utf-8?B?ZHRyRk5mN25pUVMxSGhRYUYrb0NpUHg2Wm9MeGROUCt3ZlpZalU2K0RCSkw5?=
 =?utf-8?B?WCtyVzV6cUFsMk9vZFRrdjBzUkVtbVQvbzEyc1pEeFFQU2kyeE1TS1RPTlJC?=
 =?utf-8?B?QmJEaUZ6UjhJUWZQeFJNU2lXTERiVjBMVFpBWE5nRk5zT3NpRWxHVHkzbDZQ?=
 =?utf-8?B?SkZtYzJnQUlXTGgrM2tjTWt6ZDViYWN5QUprOGlBS3FRcm1ERXJFWTFURmEz?=
 =?utf-8?B?QldHQm83VExjbkNhNTBISEtmTWZaaXFlSVZta25yVW15NUdnS1lQMk5YQUpi?=
 =?utf-8?B?MlRTNFJtYmtaakNRWFpabFlhaUV3bnZIUGFWOUZmR0hGM3lqSU5lTUJKbjl6?=
 =?utf-8?B?S0VCYkMxYTVlM2JKTDRmT2x0Rk1lcmRQZml2QXQ1ZFYvQU1CWjJlQW5UMXhU?=
 =?utf-8?B?NjFYclhEcDdOSXExSnFGR2FudjlMSS9FaGdqYjMrUm9hTk1tZGJlNktNa2pE?=
 =?utf-8?B?NGpNcVRIYSs4NlJKdzAzNjhIZ3dBUTlXdG1mY01jNUJFcUtpQU1mdUJFMy85?=
 =?utf-8?B?T0xVaDZudDFPdlNzODBZeGZyQnQraGt0UlBpdUVic0VDdkJBQm9ubzFQd1pY?=
 =?utf-8?B?THJ1cEFPSlFIUVhrclNpSEZoQkJxM3hpRm5IMkU5bXBpRlp0Y3FwZnpxSjYz?=
 =?utf-8?B?ZDVPYms5N0FqRG5KeEQ5WThsN05lT21ESmx3ajNES2lwMG9EUzFUaG9XeGJ1?=
 =?utf-8?B?ZlE0eVkvTVR6M3c4UFB1WEVidlpSM1NoeGpTekFrTGU5ZG5DSEtuV2ExVzZW?=
 =?utf-8?B?ZXhBWXR3UVV2YlhMZkJ4YzloOGJROElBK1ZybEp1OStwTEo3anY0ZEczbll0?=
 =?utf-8?B?SjNwc2lRdWFlRFFTUVArQXVnbURxSTkxc3hVdk16aUowT29Lck8vZGNLT01a?=
 =?utf-8?B?Y3lNUG5VQ2xQOFJZZmoySUUzYUI5OENnczZYMWMvZjFOMmtrck5MSEUxMUJD?=
 =?utf-8?B?ZDJVS3dTK1k3WXRvQUJPR052djBuMnZzdFdIZWkrbzU5c1ptcnlPMURTWTkw?=
 =?utf-8?B?ZVhsSFZwbW9MRXRFSHJkQkJ1My9CN2xJNTVyUXNtbEhhaVpHWHJVMDcvcEhm?=
 =?utf-8?B?VG5XcjBFR2htVlZ5QWRpZVV0TlBMeUNWUXlId3IvWi92NThLcXFoR3Bjb1hv?=
 =?utf-8?B?ck9pZFAyUm1DYWtISUZsSjVnVktvNHRiY2pvR2xhdm5vU3BwRy9hT3liQ1hN?=
 =?utf-8?B?TXNzNjI0bEtlWGFqRTR0cFFlTXkwbWR4ZVQya1ZXWjdoaTlaQm9tbVpZYlpo?=
 =?utf-8?B?Y3ViS0ZhdzRUWG1jMjBUZWNnYUdHZW9xNVN6MGJJWWZIalllL29mekVLMTNJ?=
 =?utf-8?Q?TIgdJ9r+k6TSuZ9UVGlRst2kf33bhrMkSktGet7?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 627e15c1-5769-41da-a22b-08d924cd2a8b
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2021 07:16:25.2276 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Puf6vBFLaF5N/TxckT43tr6c4m1nmGQja6FaIRM99XtswoTsDTKgRicRACs2aHvfOkUm4Zc+QhEKCmI/kA4EQjBteJR+kiScOkLzEEc6yIc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3623
Received-SPF: pass client-ip=40.107.6.104;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.591, RCVD_IN_DNSWL_NONE=-0.0001,
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

01.06.2021 08:35, Philippe Mathieu-Daudé wrote:
> Document that security reports must use 'null-co,read-zeroes=on'
> because otherwise the memory is left uninitialized (which is an
> on-purpose performance feature).
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

