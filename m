Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11112525952
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 03:20:39 +0200 (CEST)
Received: from localhost ([::1]:51746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npJyv-0002Ge-IV
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 21:20:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hnarukaw@yahoo-corp.jp>)
 id 1npJwz-0001EO-ND; Thu, 12 May 2022 21:18:38 -0400
Received: from corp-ob10.yahoo-corp.jp ([182.22.125.210]:52288)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hnarukaw@yahoo-corp.jp>)
 id 1npJwv-0000y7-T7; Thu, 12 May 2022 21:18:36 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01lp2174.outbound.protection.outlook.com [104.47.23.174])
 by corp-ob10.yahoo-corp.jp (Postfix) with ESMTPS id A80EC19FB183;
 Fri, 13 May 2022 10:18:27 +0900 (JST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo-corp.jp;
 s=default; t=1652404707;
 bh=g/O9NjTLcGnzOiySeHpjAPvZ3eLLHIT5RBgaskg9TD8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=qOPtJPByBRnN3D06rVtG2dA3cShKOfY/W4dh6qvWd9BWXpwlzfC21ZkKw/6yQ/VHt
 9KVkhjGy6xg5TXBzBmQsXzpxSCxbkXGt+guysxskBT3JnmSsdnyPX4BKmsVx8YiEd0
 9lzgBNFt7atlJ3+4dyymROIJWYEIagYYEt5uHCJs=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X3BWxY4yhE3lHy+iM/olHR5kIgqXx3L6K8NxpcTfZ9kzEomFXidrjyw2fhpKFHpAVcHMlh1EudwQSjCteLNVHsEV9mam9Nq+b2YBNq7a7yGGnRPXf4BDqqBI5V8b6j8S3OVaeJ0/9FE+0VjhBUpSYeWtDfpOKDzguQ/cJDPyLzB0Vtb7rUueSlbE8QOnZRmOz13HqJkD/KXsp2iVzwhqyYcKSDxaDqPb+1WZsMAixZgxv4LsVxceor8sebW0LxFSgOxh1FGYZ999tTz9qitET9qAg6MAUy0dbDeTXsIZ5y9YZaGerm7eOBS09eLAMoMNrwmqd9T6dKXO+2tFUDfhMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g/O9NjTLcGnzOiySeHpjAPvZ3eLLHIT5RBgaskg9TD8=;
 b=jPlCoQKrErBl4ethKqvIUqiB3NQGcIZWaFfq8sIC4ijiW9TYORsXb21v0FjQK2E7j6oaVABVtb1iWhSjcyc/U8mIT/K7vMXQnNozQUe30TLHk3N0mn7zvS7bLnzMjYxoAKVCQ23eViR3qMxAhsVL0GeX3lTcz3PAMwaIebDNv3Q5h2xBbce6K8lh4Fm/0+BB7MC8vBrONg7yklzHLlVhsP4nSZQYk/vPcJ4PEbZvipLW6byZlTUthfXIpJPqjA6OsYO8BO/IcYTd01k+SEiEobuvimsuOGkrHLgE6yI7lNGHCWC5d2NuMv0oJgtcjFm29X9BeZHCezI6ti4nbJAsOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=yahoo-corp.jp; dmarc=pass action=none
 header.from=yahoo-corp.jp; dkim=pass header.d=yahoo-corp.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yjcorp.onmicrosoft.com; s=selector1-yjcorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g/O9NjTLcGnzOiySeHpjAPvZ3eLLHIT5RBgaskg9TD8=;
 b=l3Tfm8kae8JPKKM2MOmCsCSi0SKVPcCWhu/OmcZdKZFRZ0KIOttRzWLVsJsdoNCUIl8JuJDWHsw1gEyiavVGWqpWEZchoChgUGaItLI3trQSsLDnzGpZQZZSramy3nArVMyDgUPDaPDokvw2P4Wr9/k9yyIBi7PkfKqq9HOYdck=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=yahoo-corp.jp;
Received: from TYWPR01MB10194.jpnprd01.prod.outlook.com (2603:1096:400:1e6::5)
 by OS3PR01MB9802.jpnprd01.prod.outlook.com (2603:1096:604:1ec::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.14; Fri, 13 May
 2022 01:18:25 +0000
Received: from TYWPR01MB10194.jpnprd01.prod.outlook.com
 ([fe80::9d9a:354d:e1f6:70c1]) by TYWPR01MB10194.jpnprd01.prod.outlook.com
 ([fe80::9d9a:354d:e1f6:70c1%6]) with mapi id 15.20.5250.014; Fri, 13 May 2022
 01:18:25 +0000
Message-ID: <72869ff6-ee01-c444-048b-53811fb0928a@yahoo-corp.jp>
Date: Fri, 13 May 2022 10:18:24 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 2/2] coroutine: Revert to constant batch size
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Cc: Kevin Wolf <kwolf@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 qemu-stable <qemu-stable@nongnu.org>
References: <20220510151020.105528-1-kwolf@redhat.com>
 <20220510151020.105528-3-kwolf@redhat.com>
 <41c8f1d4-be27-4110-33c0-b53a701a9cb6@yahoo-corp.jp>
 <CAAdtpL7+g7tLHt5zbq7LGogXA4Qv+75Big4QupTwe=fUzHa+NA@mail.gmail.com>
From: =?UTF-8?B?5oiQ5bedIOW8mOaouQ==?= <hnarukaw@yahoo-corp.jp>
In-Reply-To: <CAAdtpL7+g7tLHt5zbq7LGogXA4Qv+75Big4QupTwe=fUzHa+NA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TYXPR01CA0044.jpnprd01.prod.outlook.com
 (2603:1096:403:a::14) To TYWPR01MB10194.jpnprd01.prod.outlook.com
 (2603:1096:400:1e6::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 54f8787f-dffd-4c4a-58d5-08da347e7acc
X-MS-TrafficTypeDiagnostic: OS3PR01MB9802:EE_
X-Microsoft-Antispam-PRVS: <OS3PR01MB98026563636A3D673D4EDF0C80CA9@OS3PR01MB9802.jpnprd01.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NzQOTZdo+WOyq4iHFDDkefK+4dtn6yKFesBV3JyHm6EuqhwIMKUFP35Ja+DAX1ezZoVOsst+0RoCiDXeOnffRX9R+6FYt6f2afHf1KVEsfftCZSWAoednHiEZb7k3k9mgji6Gp2OAzs2U/sVHUX7SwiTY18lYq0N3wIzdq3DJQUJ+LM/asMbNU3HJ/Zw4ng9dWLlIexwYRtRiIz80ql5ysHBM3xDZRZP4fH1mG/Jw62iIDm23um9xIPd8Np9G/8oBfDNmnnNrVb5Y35DyMk4YLV/EOYrQlqpbsQEGZoGjtbKyZt/2dWoJojXuG8RblPNoIuTINOZeT9WHeNHTHNurgpFqczpz3Hh3Z8qV/0aFGRf3nrf+npRn880wHpYDjmAoEqerFvifUmxRtUUV7kJqoiz2hkpQssCkjsxT4kaqNJl3J32mgAQKVUdboLiwx2ROSH0zgW04zq/n8Yguc9+hR+dfNOTzOVJWsDF+c8Ejue04FOinTUPOOXPFH0OgyM5ASlRY6a9q4MWArs1mAqa2OMzn771tOBAnuo3pCAc30UZnyXTCJ6Xp4yH9wbYVr8gVjVAxKR/mAiHPXjUWM74dXhvHV2pMDjhvoQMdvvuBali6wuIsEpWeFcy1kaKUgivRHjbhAjMLnbY01N0+JHTxNqnJWVgYrUYRi+g0iqhsvsyT/Iu3L5Qj+jkRHefiKnzywqbOLjSs6o1KWxOZMOSlEfhe9GWj8QUliSyFS2DTrji3rXNmL0/st4t7OnUkrKp3RKENws7cx/83aSXTlBiGGIfLuutYGr3znJE9QZF0qJdSq1eC10PapEZf57aPjcwhdK2vZL6oZwvw9P09uio4fGBow16cN26GHDs+vKV+og=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYWPR01MB10194.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(316002)(66946007)(6916009)(52116002)(83380400001)(66556008)(8676002)(26005)(4326008)(6512007)(82960400001)(66476007)(966005)(85182001)(54906003)(8936002)(186003)(6506007)(53546011)(2906002)(38100700002)(38350700002)(31696002)(5660300002)(86362001)(45080400002)(36756003)(31686004)(2616005)(6486002)(508600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Wm5mRkxzMEZyWUVRdnQ1WHlhTzdzWTgycVViaE5yek1odGQzWHpucG9HQzRN?=
 =?utf-8?B?cGlPTElYQWROWkh4b2ZKNGU2QXZ5Vm5KQVh4TUJCdjlhYS81cmRKeFdhNnFr?=
 =?utf-8?B?ZG9lbGpRVjltNE5aUERtNXRRU2Q4YW40V0F2TU9EQjNza0tjUFNYd3dkMnZk?=
 =?utf-8?B?dXB4WFowM2V4NXVndjdOZmIwRFBwcTl2d21QWHVlOUdiSHVPT3hiRzA5Vlh3?=
 =?utf-8?B?S1B4eW8vWkV1anY1aHFqMHhCbjFqZ1NMNU5sbGk1WlV3MSttTjBQTXFhSnFl?=
 =?utf-8?B?Tm54VWY4VHplN0RYL1FXZHZhOU1MOUZpZm1CMlRoeGNadm5SUlNYS3hObHRp?=
 =?utf-8?B?RjBhYlpydDkvTitmT3VDZVNxWm1MVnVCdnFqQTJMKzZYdjE3K21yaEt2cXZa?=
 =?utf-8?B?WlQrd0NoQnVOK0tzQ0plK3R2VmtleWZSRnhxUVFaWVBqbDE0cHkxWkVobmN0?=
 =?utf-8?B?SDdWZU14cDZaamR4Q29DcU5Xa0p1cWJid29zaTV5MnB1MlRDN3VsaWF5Vksr?=
 =?utf-8?B?bC83NHJ1dEppaXIxd3JrSGtVeWFoRWNHWjFSNWRpM2lHdWVhR2xkN3cvbmxq?=
 =?utf-8?B?SCtxeGVpb01pZFhoVVFhK2xEWWp4WUt2Z1UxUDBLUjc1VFlwRms4RTJENlRy?=
 =?utf-8?B?RnZlWGdDcmVJQW5CYzVWcjMxS3hxVUEzeVM3cnRBajUxbDZaL2tlUEtQQTZj?=
 =?utf-8?B?dUhjUUl6T1drbzBqKzBnekhWQ3hnMFBGeDM5VE4zMzZtcytBWnRoV2pIb2Zk?=
 =?utf-8?B?Q3pjdXdGR0UyTTFyVDFZV25wcjFZV3kwT0lXYVFBcW14aTlRTDJXajRvSXlJ?=
 =?utf-8?B?eFB4cHNpMHhsMm82WWkrdDE4TkJ2TFJmSmxzcW8rYU83czVPYTlZUnZNejZV?=
 =?utf-8?B?a0prS2VaWmI4RjdXMDlVYnJMTS9EVW85a0FjNGxCWmhZZUNKUkltYXlsL1hT?=
 =?utf-8?B?cHNzelNJVUZsNC9lSG95SWZsU3ZBc0hXblZSejAwUjh6aEk1MDY4akZUMGk2?=
 =?utf-8?B?NWJCZFFMS2pBdENPcmZ2NWo5WUlMcWFHNlNxeTZhcDBjNysrOGx3REE1WEh0?=
 =?utf-8?B?ZFkzVkh0Sko0clVoVDBJdSt2QzV3K0N1ZFh1WlpuZ2lNTGFQNm5HMlMveFhx?=
 =?utf-8?B?WllsczNIcWp2aHpZUU5UZWFGMitmVk1lS3BqZzIrK0lXeUljTE9BaCsvK2Fj?=
 =?utf-8?B?UzVrak5zd1h0clkvMkprM3pPVDJwRTNLejkxWDNyVDBXSTFXdnA1aXprMTB1?=
 =?utf-8?B?bEVQRzdmM25XTmplSVNLaEdnWm1kSnZwaXdkMElDSEZ3UlA2bnQ1ZGNiQVBx?=
 =?utf-8?B?NVRQZjliV3luKzIxK3BlbXNXamNhYmZmRk9pK3U3djFrZkhacmprN28yR1o2?=
 =?utf-8?B?d1JZSmV6TkhlR3cycm0zQ0p1L0JHQVFVRnlHb21LUjBUN0dYV3FFL0JlU0NH?=
 =?utf-8?B?eCtVajUzN216clFKdTFiWWI0algzSVkwaC9VTlJSZXh0Rk9PdmowTkJ1MEs1?=
 =?utf-8?B?dWlBbEpnTXVoSzlrS1dWQkhCMGprWndNcnU5eE1CNHcrU0VaS01UVUdXTytj?=
 =?utf-8?B?ME5pa2xXWSs2NmdvZXVhWC93RWkvL2dQT3VSL2w3eW9uaXBaK3ZmSGFYelpE?=
 =?utf-8?B?cW1TS3pUNmErRFZFNzRKa1FTTEs2SW01TlFnSzkrcTFQNndiMG11ajR0QTAy?=
 =?utf-8?B?WTZTaFRLK1lKWU90WFFXdXNLMHE4eUs5c1Ixak4yL05FM3JkYklpeU5tSW1t?=
 =?utf-8?B?RG83Y0xhTUFxeEI3ZHNvQyt0YVpTT3JqbjFXMGdkSU52SkFjTUNmUnl4NTZM?=
 =?utf-8?B?MmFPWDhKQnA0WjR6bUI4c05NS2dxYURTZmRjb3BnV1RURy9LOEp4cDVMaTRY?=
 =?utf-8?B?dFdoZ2J5djYvMlV5dUFQcFJUMitMeEp6V09jUk95b0dRZDRta2VrMzJVNURo?=
 =?utf-8?B?djljbU92blQvNjRySks0Y1A4d0VFM3UveHlTclpzTkZFVkZ3di81S3RqajFD?=
 =?utf-8?B?RnEwSldPanA5cWIwVElSTkNXZHpNZ3RIM1ZMZ0hTeXo2SUJ0c0d3cm8rSUxk?=
 =?utf-8?B?djhiQ3pqcERMeU51LzhkUytjaDk3TnBGcm1nMEZxOXZ2L3AweTRKeW1od0s3?=
 =?utf-8?B?NGJGTTUvSmo3WW1BQk5ZZ21tY3BnaW1hckJaM21lTitEVGcrWjB3UTQwQnBY?=
 =?utf-8?B?Z3ZWdEd0aG5YMXhXM3JxQkcrbzNiSWZIUklNdXlqU0tVODM5RjR6aC9xTlpO?=
 =?utf-8?B?bkhxQmtFbDlQdjYvMjZMUHNkUnVwa3IyNW53R3EzTVQ2a1dRV285VzM2bzJR?=
 =?utf-8?B?ODhlVFByT3JyT0grZUp6eHRaa2E4RnVPZ2kxZ0QvTXdORW5UWnA0d1V5NW9G?=
 =?utf-8?Q?p732eJ6z/Mq6Af7s=3D?=
X-OriginatorOrg: yahoo-corp.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 54f8787f-dffd-4c4a-58d5-08da347e7acc
X-MS-Exchange-CrossTenant-AuthSource: TYWPR01MB10194.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2022 01:18:25.8488 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a208d369-cd4e-4f87-b119-98eaf31df2c3
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0sW1rI1coGVptJAz6l8IYsytnQhuZWIBGRn/o7Ww7Fb3tTTh2TFxqYScE4up4Bqa4rs8U/IRJC97vgDdYKWVTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9802
Received-SPF: pass client-ip=182.22.125.210;
 envelope-from=hnarukaw@yahoo-corp.jp; helo=corp-ob10.yahoo-corp.jp
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

I'm not sure how much testing is expected for "Tested-by".

If just checking my perspective is enough, yes. But I did not check that 
this patch fixes the problem of excessive resource consumption.


On 2022/05/12 21:50, Philippe Mathieu-Daudé wrote:
> Hi Hiroki,
> 
> On Thu, May 12, 2022 at 8:57 AM 成川 弘樹 <hnarukaw@yahoo-corp.jp> wrote:
>>
>> Thank you for your fix.
>>
>> I confirmed that after applying this patch, my intended performance
>> improvement by 4c41c69e is still kept in our environment.
> 
> Is that equivalent to a formal
> Tested-by: Hiroki Narukawa <hnarukaw@yahoo-corp.jp>
> tag?
> 
>> On 2022/05/11 0:10, Kevin Wolf wrote:
>>> Commit 4c41c69e changed the way the coroutine pool is sized because for
>>> virtio-blk devices with a large queue size and heavy I/O, it was just
>>> too small and caused coroutines to be deleted and reallocated soon
>>> afterwards. The change made the size dynamic based on the number of
>>> queues and the queue size of virtio-blk devices.
>>>
>>> There are two important numbers here: Slightly simplified, when a
>>> coroutine terminates, it is generally stored in the global release pool
>>> up to a certain pool size, and if the pool is full, it is freed.
>>> Conversely, when allocating a new coroutine, the coroutines in the
>>> release pool are reused if the pool already has reached a certain
>>> minimum size (the batch size), otherwise we allocate new coroutines.
>>>
>>> The problem after commit 4c41c69e is that it not only increases the
>>> maximum pool size (which is the intended effect), but also the batch
>>> size for reusing coroutines (which is a bug). It means that in cases
>>> with many devices and/or a large queue size (which defaults to the
>>> number of vcpus for virtio-blk-pci), many thousand coroutines could be
>>> sitting in the release pool without being reused.
>>>
>>> This is not only a waste of memory and allocations, but it actually
>>> makes the QEMU process likely to hit the vm.max_map_count limit on Linux
>>> because each coroutine requires two mappings (its stack and the guard
>>> page for the stack), causing it to abort() in qemu_alloc_stack() because
>>> when the limit is hit, mprotect() starts to fail with ENOMEM.
>>>
>>> In order to fix the problem, change the batch size back to 64 to avoid
>>> uselessly accumulating coroutines in the release pool, but keep the
>>> dynamic maximum pool size so that coroutines aren't freed too early
>>> in heavy I/O scenarios.
>>>
>>> Note that this fix doesn't strictly make it impossible to hit the limit,
>>> but this would only happen if most of the coroutines are actually in use
>>> at the same time, not just sitting in a pool. This is the same behaviour
>>> as we already had before commit 4c41c69e. Fully preventing this would
>>> require allowing qemu_coroutine_create() to return an error, but it
>>> doesn't seem to be a scenario that people hit in practice.
>>>
>>> Cc: qemu-stable@nongnu.org
>>> Resolves: https://jpn01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fbugzilla.redhat.com%2Fshow_bug.cgi%3Fid%3D2079938&amp;data=05%7C01%7Chnarukaw%40yahoo-corp.jp%7Cff781f6380a7429d939208da3415f686%7Ca208d369cd4e4f87b11998eaf31df2c3%7C1%7C0%7C637879566175459621%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=1Sy3MvmkDTBSHZQxcEQUGZabBz%2FzTTYj4p0kFfTRTYM%3D&amp;reserved=0
>>> Fixes: 4c41c69e05fe28c0f95f8abd2ebf407e95a4f04b
>>> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
>>> ---

