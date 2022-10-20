Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE889606460
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 17:25:56 +0200 (CEST)
Received: from localhost ([::1]:50874 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olXQg-0004FJ-QD
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 11:25:54 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olXJe-0007Nn-8I
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 11:18:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1olWmk-00018m-QN
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 10:44:48 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:33464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1olWmi-0004yc-50
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 10:44:38 -0400
Received: from pps.filterd (m0127839.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 29K8vhsP018649; Thu, 20 Oct 2022 07:44:31 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=content-type :
 message-id : date : subject : to : cc : references : from : in-reply-to :
 mime-version; s=proofpoint20171006;
 bh=KIuVYfx2QcH92RTwRNgpsNHYqfFKk9jt7msg21pS2+I=;
 b=R68HKSARC72uYl9/2ROisGUb99I+huQUczqDfNTMHgyh1nuh1AyMNxhmGWrQV/JKxhSv
 YIfrGlRvDQeNoEbtRdcR7B7TPS4v8JsmjNKuH47xsSJSgciLafOE7kJbjnWhmMSU1gL4
 9U/Y3qyVE6H1bzoPWtNgwHpY86w8vuA8Y6mq6k3fVsfC9EG4VdomT+Pgjt5KPJCJx6Fg
 RjC88hlY3yv+SHAjgNbB6FZ1dz52zBhiniirrFM/jjqfNa+tjLseoVB4yt90uYJSmM/j
 oZtvLC3jSvEoVQAbw429dPXXrIlHihHyl/ZM7e51fIcAFwlCloyOFuDjpRXbqAFbSBiY xA== 
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam04lp2176.outbound.protection.outlook.com [104.47.73.176])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3kb39fgmmp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Oct 2022 07:44:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N9LpsG1+U9+Z4rruCDmzyQDHDPtoyL7rVu0U2/U+w6kCTdlYTKLkk6cznFwV69IZnNAHzlmRlhi1G6cV8Fz/DytEZ6BTfQVbA1GXGN8RuoQ3GJjV2aDOLCqx0tXU5qqk227G607cYVLQCdzjIZFFJ6Og3ctdJkv4AoTAHKx++dmPAYFTGaybyYOYyw9/+9zt7Q7LxsI7SBmzEmksx6/JhAS37pPib5RA03TUtvb2S2ZRKOMQYf+e5Vvg46UV0XPFyaqJ9SeW1mHH24ZSojGf1lSosg5nF/HVCVyfWbotx0YTAKJ6iLj58cLwvMbdgrngYtcEkPeJIa+md4azhVyAXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KIuVYfx2QcH92RTwRNgpsNHYqfFKk9jt7msg21pS2+I=;
 b=LqHCYdq8O6dM7zQkUtTr5ghyOpWvHAoSMZEQKwAXVjpOVP3yXDGm5SZ1xVoXh0L8rVTNbv6lEQHrjMVnd/mUD6EMAm8XyNRCvtsz9t4YOVQABsjppNATgTkLynWmTEnhfpAupzf0lbpKoaMCGHFX3uzTf17Fg9jMhFqv+s24qD0ifHTILEW4gy8nJnSMxhnC+MvTPcA4f3R98U3pIXZnDbHGrLAIZRg3HKFjwrc0xQgB+X+mGjXLF/HX79r+7AEgJErha3okvrPL6lWly5H7Ci/G340JQncjin2/0OH9dW2AK1S/+FKMK8BZmZOe1jVhLRLLbt1ie0qUiL0KdKMJDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from PH0PR02MB7384.namprd02.prod.outlook.com (2603:10b6:510:12::12)
 by MW4PR02MB7492.namprd02.prod.outlook.com (2603:10b6:303:7c::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.35; Thu, 20 Oct
 2022 14:44:29 +0000
Received: from PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::a88:8114:7d28:5834]) by PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::a88:8114:7d28:5834%8]) with mapi id 15.20.5723.034; Thu, 20 Oct 2022
 14:44:29 +0000
Content-Type: multipart/alternative;
 boundary="------------unrvHPAtJb20O0pSuguecva9"
Message-ID: <4c1e4137-a686-427c-df3e-22f299a39478@nutanix.com>
Date: Thu, 20 Oct 2022 20:14:19 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.3
Subject: Re: MultiFD and default channel out of order mapping on receive side.
To: Peter Xu <peterx@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Prerna Saxena <prerna.saxena@nutanix.com>,
 "utkarsh.tripathi@nutanix.com  bhuvnesh.jain"@nutanix.com
References: <9f02255a-ceb9-9ca6-2606-b91c5e9e6459@nutanix.com>
 <Y0fJFcj9+wcnKYqd@redhat.com>
 <a4f67b8d-21ec-4261-6ffb-3162c854ce8f@nutanix.com>
 <Y00+tsrBs2m2CH6R@redhat.com> <Y03F97gmi7N4cyMM@x1n>
 <Y05hVC7AXdc0Ak4z@redhat.com> <Y069YMtwwOrmI6lM@x1n> <Y08T+DZQXh/89O/g@x1n>
From: "manish.mishra" <manish.mishra@nutanix.com>
In-Reply-To: <Y08T+DZQXh/89O/g@x1n>
X-ClientProxiedBy: MA0PR01CA0074.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::7) To PH0PR02MB7384.namprd02.prod.outlook.com
 (2603:10b6:510:12::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR02MB7384:EE_|MW4PR02MB7492:EE_
X-MS-Office365-Filtering-Correlation-Id: 35cf62ae-aee9-4f98-55da-08dab2a99786
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OuQ05bkUBYhlqyAYxafxh25998p6LHEYX+/DM82LSj1tfRuk8jaTNTwWLtWgekhlZ5SNK/Ib6EQYOn5+/XyA4VlWmv3ehiQsB0Pv+cgXMvshGOt7OkdeKHXebq4h2D6v0b1D8nxlH3R0Ok1Q6tzG2jkcPuFlFIaH8z2mtzsXLhYh43qTFi6WTDXeyjUa5DdDaXzW47aiQCQR2mgZ4XOMqweRepgnmlaJQ/Bt+24SG9mFbcZRzvA4panrnmz7DMJyKOjaLXQsB5HiYxUcNeV+KPxfvILxN50n5v9FMsltWmZfxOCvg622b5lqK0yvm+x2oIE2FgXd/tuvh/oPD9I94Mmm+iYXY908Qsb7Fn9iVGBK06o/rwoCcgjy9k4rBs3L0cJWqxs/EAJ664eF0+CYeFPTzYN/0sPJWL4l990ED8gDVcX2L8nQt2yo4Z/JdSOUexPHSYq9qw25yck9RaKHyJ7Tl5CJZ44rkwMWDqQq2heMjqeADNBIFi3nF/3Nb3PbSq3BOdwQ80DI4PCF/DoBwJYAx8HJbBPw//zvVEXk4/cLTI/h4RDtOuhIV2QtEWL+qy8WqSJ9lgKIXogx+w/x5jNW03sO8HsGIumFotHVM5IJztadrPzWFsPw8Apu4+4dNCL4hAC7XFsuyf8CaOccZ8Vd6+hOqKYf84adsZ+4nIRrvxVl2YZcELZL5saU+pn0OTgTEsVIsExgrXUThI3ykv5gS82dJEexMik12FLTW8Tbb2aenklZjlXAJXxBwlB8XMtoB7DocFtcV7uahQgyApCQdGjRxQhPYsjYmc6WLEs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR02MB7384.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(376002)(39860400002)(396003)(346002)(366004)(451199015)(83380400001)(53546011)(110136005)(54906003)(31696002)(86362001)(30864003)(5660300002)(2906002)(2616005)(6512007)(26005)(33964004)(6506007)(8936002)(186003)(36756003)(6666004)(107886003)(38100700002)(6486002)(66946007)(31686004)(316002)(41300700001)(4326008)(478600001)(8676002)(66556008)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YWIyb1N5dVh5UGlnZWVUeGZUbmxtWEJRcTJFUDRnZVdDMU9HdzQ0OXpRSisz?=
 =?utf-8?B?ZCsrUVZXZWhKQkd5YTJxNG1zQlBPYU5JclJ4T2pvNXlJcElvZU0zcGZUd3Zk?=
 =?utf-8?B?Q1hDbHo0bFgvbFFVdy84WHhLTzNBbXhVSXJqRjFPd1AwckxzcTNBVjZmMFBE?=
 =?utf-8?B?K3crdkVNM05peGlMVnFXTkpxelBxSndWQU9YMXdqTmpxUHJlUGp6NFcwcVpt?=
 =?utf-8?B?UVYzVUNsZWZLL2pxTjZ0T2pPQVMxYjdmbmxpc2ttREtFaThUSnVZdEJDbXkx?=
 =?utf-8?B?WVpKWi9NKzZFZUREdGR6VXZZelIzeHZpR2RFaFQvMGxCRXo4VFJOUnpVM3do?=
 =?utf-8?B?WjBwdnkxZEw1MDR1Uk9YWm1maTlOSU8zTnJJNHE3eXphL01wMkxGb1ZiM3Vm?=
 =?utf-8?B?dGdaUGl2ME84ZEZUdk1pbXdoTXZxaEoyOGM0YmhBRGtFY1BQZEdDKy8yUnFI?=
 =?utf-8?B?OUxOUlpaTGVGZ01EU3RsSEhyRGZDdm5CZkZ1ZVZjcUhYaHFPeDVxVkdzdjdn?=
 =?utf-8?B?cU8xWkhROTdUYko4WnB3TGh0aTVhbTFrZUdsTEdMNWNDUjhPaS9pY1FyLzFs?=
 =?utf-8?B?Q1Rzc2ZPOHY3M0NyL29BQkovRFZPTzdxZ3RHYjlLc21SRmZSUDJodlgzMUph?=
 =?utf-8?B?ODZvRGY3SXRiYmpjWTAxZlU4VDNwRjJha09Janh2V2V4YlBxdG9LbFl3dER3?=
 =?utf-8?B?RlllbDJUTWwrK1ErZHNnTTBibXFtdE9QbU9lRytza1BJWEZtT1Y3c0RmRW5p?=
 =?utf-8?B?QnhpTFZQOFlYWlJ3dFBnaWZxOFpMQ3k2R0h3L2pYKzFsckxsb2tuOTBnWFpJ?=
 =?utf-8?B?NlBqMXQxV1dPTzFBRldFRm5SeCtZM0pKRmVrWUF3enkzL0dRdFc1N01pSE5K?=
 =?utf-8?B?SFQ5cklSMWsrcGwyeUttWkg2TDh1dk4xRU94WkoxS0JkRTN3eGJ3ZFVtdUJP?=
 =?utf-8?B?d0VPVTE5TkRFai91THhVUDhqV3lNR2ZmdHUreER1US9aLzlBWEgvV040Sm5F?=
 =?utf-8?B?R0RCekhFQ0pYSk00ZXFvSWJjTmI3OEZEeFZDNzJEUHhNcFJ1OXUrMDJjekgx?=
 =?utf-8?B?WHRyRTNMRnNuRUE2M3NhdU1Cd1FWL0lVdUFOQkFQTFV5K0J2WVR1SzBadDBZ?=
 =?utf-8?B?ckZscnZvU2ZySnhaQkNBQy9SbTZqNHozYS9mRFFYeUoyZU1rRzBzaTZqUlcy?=
 =?utf-8?B?Uy83TXZ2L0dBa0s4RFVEZGNQT0MvY0tNOEI5NkREaGZBaWFkRzc5VVR1ZU1a?=
 =?utf-8?B?a3ZzRXJYcHVJQURaYjBTK2NmaFRFbnFWZk9Gd1hDL0xjQ3dwSzk2U1UxOUJ1?=
 =?utf-8?B?QTVQMU1WZGgxSXY3WWN5THh2WkVGeG9LQVFRUFJYSHo0eEdzY1lBb0VpR2h6?=
 =?utf-8?B?OXB5RTdtU1plMnowbDIrOVNwUEl6QVFodCtRS3lBd2xzOFNuakprOElOdDB0?=
 =?utf-8?B?S1JleFRObmo3SEY3ellPRi94WGtHN1d4RjBNUHoycFFPS3ZNbVhxZlpqVm5a?=
 =?utf-8?B?VTMzRWx3TFB3d2xxbnNPaFpwTkw1bVpKaG9kNTFQTVNYM0FhUU95b3NUSkVZ?=
 =?utf-8?B?WWc1djdmSEdnOWdqSW1Pdk55NTF3TW5MSFFPYUtZWXVUMWlmYnczV2VudENt?=
 =?utf-8?B?N2Z1bUpNcFpSWEV6S1pDWjBhbFpZd2RjRHRFY1VHYUtJU3B3YklXc0p3dy8y?=
 =?utf-8?B?U3JqQVN4aUF2Y2JFekE4MHh5SElvdDg3cldGUndMRWFZK09keWR2YUp3NS9z?=
 =?utf-8?B?S2dsM2F4dWRMYnhxSlBOMFJXQ0lBSWx6VDNrK3p1aGg2MjhRZTV2a3ZXSEZ3?=
 =?utf-8?B?VG90SWE0M01nZURUVUpOUkRWSGRSOU5oNWdkcmNoR25KZ2ZFb0xiREdodzJV?=
 =?utf-8?B?NmtMdFdKUC8vTk1QTm5vQ0M1dWV1THFaUUdObW16bkhRcWNoMnVpQ0dJS1No?=
 =?utf-8?B?VEw1RlFMelcwMUUrdmtYVndsOGJ6L3kzQ3RBc25FKy8ybmYwQ213TmpmNGE5?=
 =?utf-8?B?bWQwN0V0bTBKVzkxQmE4czFVRzYvc0lyTWxqQnVpMkxWMjB2N1R2UngwSmla?=
 =?utf-8?B?cktybDc4QlY5WmNaVThQUkhWdXpVSXkzQmpzUWpnOEcwNURKY050TnJsdjV6?=
 =?utf-8?B?QnF4SmVlY0NoQmg4RXpDdDdLL1FYWG9aRmlYRHJzRU9HbE5LY3FsNDNsb0cz?=
 =?utf-8?B?U3c9PQ==?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35cf62ae-aee9-4f98-55da-08dab2a99786
X-MS-Exchange-CrossTenant-AuthSource: PH0PR02MB7384.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2022 14:44:29.2726 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Az1RSWWXrUC30xpWLiP2OPm258jfBdnZIGSgESvzEd/6DsfiErMCLm5NhdVx6rpzdXFbJEgmBy1dOXDn3szljGMttRfDbTMOFuTuudVZsdc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR02MB7492
X-Proofpoint-ORIG-GUID: l86VRDY7BEpF1G9cnLfSrJu4DidYSQtL
X-Proofpoint-GUID: l86VRDY7BEpF1G9cnLfSrJu4DidYSQtL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-20_05,2022-10-20_01,2022-06-22_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=manish.mishra@nutanix.com; helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--------------unrvHPAtJb20O0pSuguecva9
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 19/10/22 2:30 am, Peter Xu wrote:
> On Tue, Oct 18, 2022 at 10:51:12AM -0400, Peter Xu wrote:
>> On Tue, Oct 18, 2022 at 09:18:28AM +0100, Daniel P. Berrangé wrote:
>>> On Mon, Oct 17, 2022 at 05:15:35PM -0400, Peter Xu wrote:
>>>> On Mon, Oct 17, 2022 at 12:38:30PM +0100, Daniel P. Berrangé wrote:
>>>>> On Mon, Oct 17, 2022 at 01:06:00PM +0530, manish.mishra wrote:
>>>>>> Hi Daniel,
>>>>>>
>>>>>> I was thinking for some solutions for this so wanted to discuss that before going ahead. Also added Juan and Peter in loop.
>>>>>>
>>>>>> 1. Earlier i was thinking, on destination side as of now for default
>>>>>> and multi-FD channel first data to be sent is MAGIC_NUMBER and VERSION
>>>>>> so may be we can decide mapping based on that. But then that does not
>>>>>> work for newly added post copy preempt channel as it does not send
>>>>>> any MAGIC number. Also even for multiFD just MAGIC number does not
>>>>>> tell which multifd channel number is it, even though as per my thinking
>>>>>> it does not matter. So MAGIC number should be good for indentifying
>>>>>> default vs multiFD channel?
>>>>> Yep, you don't need to know more than the MAGIC value.
>>>>>
>>>>> In migration_io_process_incoming, we need to use MSG_PEEK to look at
>>>>> the first 4 bytes pendingon the wire. If those bytes are 'QEVM' that's
>>>>> the primary channel, if those bytes are big endian 0x11223344, that's
>>>>> a multifd channel.  Using MSG_PEEK aviods need to modify thue later
>>>>> code that actually reads this data.
>>>>>
>>>>> The challenge is how long to wait with the MSG_PEEK. If we do it
>>>>> in a blocking mode, its fine for main channel and multifd, but
>>>>> IIUC for the post-copy pre-empt channel we'd be waiting for
>>>>> something that will never arrive.
>>>>>
>>>>> Having suggested MSG_PEEK though, this may well not work if the
>>>>> channel has TLS present. In fact it almost definitely won't work.
>>>>>
>>>>> To cope with TLS migration_io_process_incoming would need to
>>>>> actually read the data off the wire, and later methods be
>>>>> taught to skip reading the magic.
>>>>>
>>>>>> 2. For post-copy preempt may be we can initiate this channel only
>>>>>> after we have received a request from remote e.g. remote page fault.
>>>>>> This to me looks safest considering post-copy recorvery case too.
>>>>>> I can not think of any depedency on post copy preempt channel which
>>>>>> requires it to be initialised very early. May be Peter can confirm
>>>>>> this.
>>>>> I guess that could work
>>>> Currently all preempt code still assumes when postcopy activated it's in
>>>> preempt mode.  IIUC such a change will bring an extra phase of postcopy
>>>> with no-preempt before preempt enabled.  We may need to teach qemu to
>>>> understand that if it's needed.
>>>>
>>>> Meanwhile the initial page requests will not be able to benefit from the
>>>> new preempt channel too.
>>>>
>>>>>> 3. Another thing we can do is to have 2-way handshake on every
>>>>>> channel creation with some additional metadata, this to me looks
>>>>>> like cleanest approach and durable, i understand that can break
>>>>>> migration to/from old qemu, but then that can come as migration
>>>>>> capability?
>>>>> The benefit of (1) is that the fix can be deployed for all existing
>>>>> QEMU releases by backporting it.  (3) will meanwhile need mgmt app
>>>>> updates to make it work, which is much more work to deploy.
>>>>>
>>>>> We really shoulud have had a more formal handshake, and I've described
>>>>> ways to achieve this in the past, but it is quite alot of work.
>>>> I don't know whether (1) is a valid option if there are use cases that it
>>>> cannot cover (on either tls or preempt).  The handshake is definitely the
>>>> clean approach.
>>>>
>>>> What's the outcome of such wrongly ordered connections?  Will migration
>>>> fail immediately and safely?
>>>>
>>>> For multifd, I think it should fail immediately after the connection
>>>> established.
>>>>
>>>> For preempt, I'd also expect the same thing because the only wrong order to
>>>> happen right now is having the preempt channel to be the migration channel,
>>>> then it should also fail immediately on the first qemu_get_byte().
>>>>
>>>> Hopefully that's still not too bad - I mean, if we can fail constantly and
>>>> safely (never fail during postcopy), we can always retry and as long as
>>>> connections created successfully we can start the migration safely.  But
>>>> please correct me if it's not the case.
>>> It should typically fail as the magic bytes are different, which will not
>>> pass validation. The exception being the postcopy pre-empt  channel which
>>> may well cause migration to stall as nothing will be sent initially by
>>> the src.
>> Hmm right..
>>
>> Actually if preempt channel is special we can fix it alone.  As both of you
>> discussed, we can postpone the preempt channel setup, maybe not as late as
>> when we receive the 1st page request, but:
>>
>>    (1) For newly established migration, we can postpone preempt channel
>>        setup (postcopy_preempt_setup, resume=false) to the entrance of
>>        postcopy_start().
>>
>>    (2) For a postcopy recovery process, we can postpone preempt channel
>>        setup (postcopy_preempt_setup, resume=true) to postcopy_do_resume(),
>>        maybe between qemu_savevm_state_resume_prepare() and the final
>>        handshake of postcopy_resume_handshake().
Yes Peter, agree postcopy_start and postcopy_do_resume should also work, as by then we already have some 2-way communication, for e.g. for non-recovery case we send ping cmd, so probaly we can block in postcopy_start till we get reply of pong. Also for postcopy_do_resume too probably after response of |MIG_CMD_POSTCOPY_RESUME|.
>>
>> I need to try and test a bit for above idea.  But the same trick may not
>> play well on multifd even if it works.
I had one concern, during recover we do not send any magic. As of now we do not support multifd with postcopy so it should be fine, we can do explict checking for non-recovery case. But i remember from some discussion in future there may be support for multiFD with postcopy or have multiple postcopy preempt channels too, then proper handshake will be required? So at some point we want to take that path? For now i agree approach 1 will be good as suggested by Daniel it can be backported easily to older qemu's too.
> The sender side is relatively easy because migration thread can move on
> without the preempt channel, then the main thread will keep taking care of
> it, when connected it can notify the migration thread.
>
> It seems trickier with dest node where the migration loading thread is only
> a coroutine of the main thread, so during loading the vm I don't really see
> how further socket connections can be established.  Now it's okay with
> thread being shared because we only do migration_incoming_process() and
> enter the coroutine if all channels are ready.
>


--------------unrvHPAtJb20O0pSuguecva9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 19/10/22 2:30 am, Peter Xu wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:Y08T+DZQXh%2F89O%2Fg@x1n">
      <pre class="moz-quote-pre" wrap="">On Tue, Oct 18, 2022 at 10:51:12AM -0400, Peter Xu wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">On Tue, Oct 18, 2022 at 09:18:28AM +0100, Daniel P. Berrangé wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">On Mon, Oct 17, 2022 at 05:15:35PM -0400, Peter Xu wrote:
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">On Mon, Oct 17, 2022 at 12:38:30PM +0100, Daniel P. Berrangé wrote:
</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">On Mon, Oct 17, 2022 at 01:06:00PM +0530, manish.mishra wrote:
</pre>
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">Hi Daniel,

I was thinking for some solutions for this so wanted to discuss that before going ahead. Also added Juan and Peter in loop.

1. Earlier i was thinking, on destination side as of now for default
and multi-FD channel first data to be sent is MAGIC_NUMBER and VERSION
so may be we can decide mapping based on that. But then that does not
work for newly added post copy preempt channel as it does not send
any MAGIC number. Also even for multiFD just MAGIC number does not
tell which multifd channel number is it, even though as per my thinking
it does not matter. So MAGIC number should be good for indentifying
default vs multiFD channel?
</pre>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">
Yep, you don't need to know more than the MAGIC value.

In migration_io_process_incoming, we need to use MSG_PEEK to look at
the first 4 bytes pendingon the wire. If those bytes are 'QEVM' that's
the primary channel, if those bytes are big endian 0x11223344, that's
a multifd channel.  Using MSG_PEEK aviods need to modify thue later
code that actually reads this data.

The challenge is how long to wait with the MSG_PEEK. If we do it
in a blocking mode, its fine for main channel and multifd, but
IIUC for the post-copy pre-empt channel we'd be waiting for
something that will never arrive.

Having suggested MSG_PEEK though, this may well not work if the
channel has TLS present. In fact it almost definitely won't work.

To cope with TLS migration_io_process_incoming would need to
actually read the data off the wire, and later methods be
taught to skip reading the magic.

</pre>
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">2. For post-copy preempt may be we can initiate this channel only
after we have received a request from remote e.g. remote page fault.
This to me looks safest considering post-copy recorvery case too.
I can not think of any depedency on post copy preempt channel which
requires it to be initialised very early. May be Peter can confirm
this.
</pre>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">
I guess that could work
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">
Currently all preempt code still assumes when postcopy activated it's in
preempt mode.  IIUC such a change will bring an extra phase of postcopy
with no-preempt before preempt enabled.  We may need to teach qemu to
understand that if it's needed.

Meanwhile the initial page requests will not be able to benefit from the
new preempt channel too.

</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">
</pre>
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">3. Another thing we can do is to have 2-way handshake on every
channel creation with some additional metadata, this to me looks
like cleanest approach and durable, i understand that can break
migration to/from old qemu, but then that can come as migration
capability?
</pre>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">
The benefit of (1) is that the fix can be deployed for all existing
QEMU releases by backporting it.  (3) will meanwhile need mgmt app
updates to make it work, which is much more work to deploy.

We really shoulud have had a more formal handshake, and I've described
ways to achieve this in the past, but it is quite alot of work.
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">
I don't know whether (1) is a valid option if there are use cases that it
cannot cover (on either tls or preempt).  The handshake is definitely the
clean approach.

What's the outcome of such wrongly ordered connections?  Will migration
fail immediately and safely?

For multifd, I think it should fail immediately after the connection
established.

For preempt, I'd also expect the same thing because the only wrong order to
happen right now is having the preempt channel to be the migration channel,
then it should also fail immediately on the first qemu_get_byte().

Hopefully that's still not too bad - I mean, if we can fail constantly and
safely (never fail during postcopy), we can always retry and as long as
connections created successfully we can start the migration safely.  But
please correct me if it's not the case.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">
It should typically fail as the magic bytes are different, which will not
pass validation. The exception being the postcopy pre-empt  channel which
may well cause migration to stall as nothing will be sent initially by
the src.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Hmm right..

Actually if preempt channel is special we can fix it alone.  As both of you
discussed, we can postpone the preempt channel setup, maybe not as late as
when we receive the 1st page request, but:

  (1) For newly established migration, we can postpone preempt channel
      setup (postcopy_preempt_setup, resume=false) to the entrance of
      postcopy_start().

  (2) For a postcopy recovery process, we can postpone preempt channel
      setup (postcopy_preempt_setup, resume=true) to postcopy_do_resume(),
      maybe between qemu_savevm_state_resume_prepare() and the final
      handshake of postcopy_resume_handshake().</pre>
      </blockquote>
    </blockquote>
    Yes Peter, agree postcopy_start and postcopy_do_resume should also
    work, as by then we already have some 2-way communication, for e.g.
    for non-recovery case we send ping cmd, so probaly we can block in
    postcopy_start till we get reply of pong. Also for
    postcopy_do_resume too probably after response of <code class="Code-module__code_1c6VC test-blob
      Blob-module__blob-code_2w-Pp"><span class="hl-source hl-c"><span class="hl-meta hl-function hl-c"><span class="hl-meta hl-block
            hl-c"><span class="hl-meta hl-function-call hl-c"><span class="hl-meta hl-group hl-c"><span><span class="selection-highlight" style="cursor: pointer;">MIG_CMD_POSTCOPY_RESUME</span></span></span></span></span></span></span></code>.
    <blockquote type="cite" cite="mid:Y08T+DZQXh%2F89O%2Fg@x1n">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">

I need to try and test a bit for above idea.  But the same trick may not
play well on multifd even if it works.
</pre>
      </blockquote>
    </blockquote>
    I had one concern, during recover we do not send any magic. As of
    now we do not support multifd with postcopy so it should be fine, we
    can do explict checking for non-recovery case. But i remember from
    some discussion in future there may be support for multiFD with
    postcopy or have multiple postcopy preempt channels too, then proper
    handshake will be required? So at some point we want to take that
    path? For now i agree approach 1 will be good as suggested by Daniel
    it can be backported easily to older qemu's too.<br>
    <blockquote type="cite" cite="mid:Y08T+DZQXh%2F89O%2Fg@x1n">
      <pre class="moz-quote-pre" wrap="">
The sender side is relatively easy because migration thread can move on
without the preempt channel, then the main thread will keep taking care of
it, when connected it can notify the migration thread.

It seems trickier with dest node where the migration loading thread is only
a coroutine of the main thread, so during loading the vm I don't really see
how further socket connections can be established.  Now it's okay with
thread being shared because we only do migration_incoming_process() and
enter the coroutine if all channels are ready.

</pre>
    </blockquote>
    <p><br>
    </p>
    <p><br>
    </p>
  </body>
</html>

--------------unrvHPAtJb20O0pSuguecva9--

