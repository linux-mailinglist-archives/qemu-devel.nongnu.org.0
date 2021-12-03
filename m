Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8F2466F1D
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 02:28:53 +0100 (CET)
Received: from localhost ([::1]:34464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msxNc-0005hR-3H
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 20:28:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>)
 id 1msxLr-0004Sa-Dd; Thu, 02 Dec 2021 20:27:03 -0500
Received: from mga01.intel.com ([192.55.52.88]:50353)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>)
 id 1msxLY-0004F5-Ga; Thu, 02 Dec 2021 20:26:54 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10186"; a="260889390"
X-IronPort-AV: E=Sophos;i="5.87,283,1631602800"; d="scan'208";a="260889390"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2021 17:26:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,283,1631602800"; d="scan'208";a="513097046"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga007.fm.intel.com with ESMTP; 02 Dec 2021 17:26:40 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 2 Dec 2021 17:26:39 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Thu, 2 Dec 2021 17:26:39 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Thu, 2 Dec 2021 17:26:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PJniBHQ3glpFRnIZC4ZDBocfs4p/0vW/UaqR9XQOZruiopzggkxe8xSam21NvCv/zsQpgwhNQ4nDf03y3/EsoeYCXhVBvDO7l6qksMDOApZHAsoIBJmr6MOwJOiEEOQxJQelQa57QJMf/FCwiezJEcB2mgr2sP0pyxFyQpyPVd6HR70ACz51BanAQjAsHwYDS52koOX7aAcg6eZZy6o4XlHQahSrIcoUgq8HMNf+jJUFchLxfafG62nuLggHKSQz2sBNoqJjHgFd2JhlGZ421iT1OcZwbAiDmdj30WYwjBNkeMqkIxAcm/RyllHstRqn6BZ92oKSNyYvvSF5ysaesQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NBm6jI7Hv8n9gKPXxPQtnXcQ/tP2Bm7C05qZjRBjUKM=;
 b=ni8Fy/XlhlNk1tCRCZpKqMArIS5yfu3jIPD3fdUvAcybrSRNF/Yxf82doazqDfvyNXEw/CKdq2GFgrXO4/FAwlqi0RbnG2U2tw2WhCOuZDUxo8YaeRwyobd9yGR5HD9vr/lTKFK/NH8Kpq8ne+gy2OOISU39289bNU0ft2JeQl0cWzZsjQhavg13tllCOVZtLqdJh0tF1LxbfFcIObQOi0NLbmz33unrOQX2XFrMWfKyPPlsPt8WQekhS3n2ktBrEPGr5S6XT1z2dEs76Asw+nDBHwMe5M6p/IwQNbTjy2/7prsnLNZykdSPp7pvGpi9N14gz+eAY8Ij6dr+/B6daw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NBm6jI7Hv8n9gKPXxPQtnXcQ/tP2Bm7C05qZjRBjUKM=;
 b=KmgPpYDR2Q9htXLc5mg8JqpNN5NiUTj/+MHbU2fCbV4IAOkM7A5oK/koG+xyQwUd6/suyBVNFyYW7szaCKUv3IQbnNWtErnaIJZL0E9OHMTBl+Za3gufevIwkHRFszFIYS4YTmMCzGsxLHf4nSXOC6b4EtoKwFGMEFf096oQLLg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5640.namprd11.prod.outlook.com (2603:10b6:8:3f::14) by
 DM8PR11MB5638.namprd11.prod.outlook.com (2603:10b6:8:27::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.11; Fri, 3 Dec 2021 01:26:38 +0000
Received: from DM8PR11MB5640.namprd11.prod.outlook.com
 ([fe80::9c4d:5c63:9fdd:53da]) by DM8PR11MB5640.namprd11.prod.outlook.com
 ([fe80::9c4d:5c63:9fdd:53da%3]) with mapi id 15.20.4755.015; Fri, 3 Dec 2021
 01:26:38 +0000
Message-ID: <22da77b0-114a-49b0-9ec5-588556697fa2@intel.com>
Date: Fri, 3 Dec 2021 09:26:26 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.3.2
Subject: Re: [PATCH] QIO: Add force_quit to the QIOChannel to ensure QIO exits
 cleanly in some corner case
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20211201075427.155702-1-lei.rao@intel.com>
 <Yac8B76dAulyx+2T@redhat.com>
 <DM8PR11MB5640D2F156E53A0CD644AC71FD689@DM8PR11MB5640.namprd11.prod.outlook.com>
 <a1706788-2f28-9948-f68f-a6fd51b81fa3@virtuozzo.com>
 <836f8fe3-5262-d179-a66a-325935ec7005@intel.com>
 <YaiJgpEahjc1OyR4@redhat.com>
 <baf86cd2-7b88-7206-a215-a9ed91c16fa2@virtuozzo.com>
From: "Rao, Lei" <lei.rao@intel.com>
In-Reply-To: <baf86cd2-7b88-7206-a215-a9ed91c16fa2@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: HK0PR01CA0060.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::24) To DM8PR11MB5640.namprd11.prod.outlook.com
 (2603:10b6:8:3f::14)
MIME-Version: 1.0
Received: from [10.238.128.162] (192.198.142.0) by
 HK0PR01CA0060.apcprd01.prod.exchangelabs.com (2603:1096:203:a6::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23 via Frontend
 Transport; Fri, 3 Dec 2021 01:26:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c15be053-20c7-43c4-5e99-08d9b5fbf3cd
X-MS-TrafficTypeDiagnostic: DM8PR11MB5638:
X-Microsoft-Antispam-PRVS: <DM8PR11MB56380FA8DD30AD6366F6A271FD6A9@DM8PR11MB5638.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nZyZtp5XjyzyEGacKlmCdmCwM1pB7TTr4KO00pGROvgSFpvDen0ULdm+s+BgxyIxLwz/o0btlMhoIoSaMxYiEgrVU/iceOfPMa4BGiui/IlrVRAO/6+nHFywaYXSH6KG8q9k4ERaVgtrjpEdNLRqa85kbXS2wNL+fAOX4TWJ9wx0zo8bOvWx0BebB0u3Xt3DoOi+Gev+g+6zli5b+sBFm0U+Vmeg2qN1pbr5bwFWBCSzuBOW9cqAkCVHHT1eXwZokIULxHlKtesB6ez3qLiIX3Kd9us/NJ1gA5XI+eyO4QV5g81DRaEWpjpF+vhkz+qXr5IziyHlA8s7xAMmJJKEfXKW9Pe5Uip9TMXrkSnZqeXIZZGFSVNCV+aMWzQSlxZj6zBCs8r9AHGTiu1gRKDxRA3C3Qs6VfGQcmXyr8LHZxK4DlhKqF+jUCwzFXlNqXlv3awPBRHHlgVaA0Qs5JT4wdkcBrFMpAcSRtDYuxq31xWvKsDrD5EGcLWNClwhglTsmo3zM5WFU8I/0tmnQki+HWdUyvPuprNyds6K95vQSbiWv2VfgDxupuSD9tsDr+efwo4rrSAdC1Gs9pR+Mp3fN9q6gVVPa/UN8W36h5zwYEuTbS9mgqVqEtVBdg3WI2mo30K8MYdrrH5J7UVTAd17h1oimX6V6kqLRWNWpbXpxqY7wQzQ0RgXnE4biFPKdH3QCRAalBcg3xkggUmUNvIG9wjfxevxP/0aHRZlbQgYgl0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5640.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(316002)(38100700002)(86362001)(956004)(5660300002)(110136005)(4326008)(31686004)(6666004)(2616005)(26005)(16576012)(66556008)(508600001)(82960400001)(30864003)(54906003)(53546011)(8936002)(2906002)(83380400001)(8676002)(6486002)(186003)(66476007)(36756003)(31696002)(66946007)(21314003)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a29PNkF4YUN1Q3JHbWdNRTJCQkNURnVISEdwU0JMTUFadElPTWo1eDdFMElJ?=
 =?utf-8?B?c01qZjYxR3RCdnc4bytjTmVmZENvMU44SVBJa05mR3d5bUptNmwrd0dPS2kv?=
 =?utf-8?B?QUhRUlhqYjBFcU1ESjJVQTc2UnZLdm1mRXpxRkx2Q052Nm0zQ3RXSnFBTG56?=
 =?utf-8?B?VjV4dTdNUFlWTDY3T1FuWEVIcThwVzlMaGUySDd3YU5xUStkWlZlY0JYMHNE?=
 =?utf-8?B?b0MvK1pJOXppWU5kN25NMUNxN1NYdnBReU0yNzBOL05tTmtSdmpkb1E0dU9E?=
 =?utf-8?B?a2wrMHZQWWh5eDdudWtMYmxGTkZ4OVM1eDZQL1dmajNmdFBpNlZQK0dUcFRS?=
 =?utf-8?B?MGhuajh1QkJlaUNRbThKQk1MTmt0QnhGN0RVQUo4NUIyL0ZiWlkvREJiOGlB?=
 =?utf-8?B?TGUwb2ZXZEZwR0JUL2lYeDFYVlVPclpzZit2d2Rsek92OForSlJ4UVBPdC9n?=
 =?utf-8?B?RnFhYVdoWXpzdEhhNjNteW5mNGJqUEY5RVlCZnFsbWRzNU9UY000VW8xTzRM?=
 =?utf-8?B?dFM4T3VRbk1ORXFpOHBURmlXK0VoSHg3UUdRREw1dUJFTm9HalNUQVJ4bnVa?=
 =?utf-8?B?czNmSSt2STdNbzR6YlU2bGtnQUZTYWxka3h1bDdxeUF0d0RiaGpvcmVqLzAx?=
 =?utf-8?B?TjB5aGJRY2hkRC9LaDYzTUZEOUpzOXhmeDJFWWxDVlFINFFiVXdFL1YvblBI?=
 =?utf-8?B?RjYrd0o2Vzh1Z3BYWVdHdWdnQWZmWTQ3cjRkNmI1M1FBOWFiMVZqeGZzNFJP?=
 =?utf-8?B?bW5TQXFBZGRDSDdlNTR1dndVM0R5NTJMQWpQQjN5RWk3V3RmdUV4QU9Ob1U3?=
 =?utf-8?B?NEMyRjAzMHMrdWVrSC9DS3FFOU5uZHVFY3FDOHkrRnRWNmhZUzBmQnhGZ0xO?=
 =?utf-8?B?Tm9aWnBnU011dE1yaTV2VVR2NytSVSt1c1AycXpEc2pJVTM4QmtqL1ByMlRY?=
 =?utf-8?B?YW1ISVo4bmFXbkRpR28yWFI1bk5GclF5Q2hKSWd0K0R4Y2lZcWo1RGE3aDZW?=
 =?utf-8?B?K0VsQ05DdG8wSWQ0OFRZRFFYRmxQc1gydnJNbzUwam9XT0pOQXRUbUtpdWdv?=
 =?utf-8?B?T1Q5cHpNdGdDQnlqVE5wWlgwU3lrbnFUdVRmZFlPcGxZS2lrUFZVZk9UMWlH?=
 =?utf-8?B?STYvdnBPR2FaaC92cHJIV0VVL0pTQXQvQkJGdmhrOVZaSlFpYlQ0SmRSZEg5?=
 =?utf-8?B?RlRCemVMOWdFbkRsYmcvQ05uMkF2ODJYS3dpaHptK2RsUllhSjhDNE5BZUNm?=
 =?utf-8?B?WmVwZzNUaGx4WUVSZlNqOHBVZUc2ZzRCNDRBczEzN0xyN2dqTys5empUUnQ0?=
 =?utf-8?B?V0ZLOWdGL2IyU0NHWHNiT09qSUR0TWd5UWtjYWVqOFR2N25Sbkkvc1RteWZi?=
 =?utf-8?B?S1haVFdlblpqYmFDbSttN1FXZk1VSlN5M1FxQ1Erc3RWeWVTS2JxTWhTcTU3?=
 =?utf-8?B?VmdzbEJ2aG9majQ0d0ZjTXRwS1dMbDc5TFJ4Y2h4RXMzQlJNTGFVaUh5b05T?=
 =?utf-8?B?emVkUnBFalhKMTZEOWNqYnNtSVhEWEZEZWs0dGxHZXV4ZVhML0hwbXl5enRv?=
 =?utf-8?B?ZEtaV1NMOTNreE9DUGRMUWlxU3Q1Y0RETHBvWm1tV1o2SGNva3VqSmVid1hk?=
 =?utf-8?B?ZjFJaHhyWkNheXFOd2lvSEt3ditHeWVmbmR0bjZGRDE4Q2RDZVZVY1ZpL0Qx?=
 =?utf-8?B?RmtmTzNoSmwrVjJmS1NMNkN2RzV2SFE4dk0wajdQNVNMaUc2ZjJBQ1pCUU9w?=
 =?utf-8?B?V01vNTE5U1BZUjlEeTQzdTdWb0hINXBvSTY2VWtuNDc3UkRaSHNCUnVPbHYz?=
 =?utf-8?B?T2xPMytndk9wL1N1RnBWUlJrSUFGQnFGeW1zNHFrZVJ0UFVjdmJVZVE5dEhh?=
 =?utf-8?B?aWRDVktpUGVNSnliZFBFMTZ2Y0d5UTFhUjhZcmJVYVB2WHM1NlZJMUs4T3M2?=
 =?utf-8?B?Y1I5WXZGaGxCK2grdzVHR2FYL2oxbGEwNkEyYjM5OFBMaVAzSEdQYTlJeEV1?=
 =?utf-8?B?aDZaSytXUW90UXR1QUFURGZLQXkvNXI1KzV4dFRhRGcwS0tiRkdxbXhVTTIy?=
 =?utf-8?B?Nkg3OUsvdEt2RDl5QnY3MUFVNXdlWkVieUFrNWl0aHN0QTJiVVN4Z3RoMXor?=
 =?utf-8?B?SXNUTUZ3NGZINzBIQzlKOFVPV3RJTDNWNEl3QXZ6aHBKRm9xNkxkdisvWDk3?=
 =?utf-8?Q?bl/wj05/YVi9jjn7PQ9zB80=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c15be053-20c7-43c4-5e99-08d9b5fbf3cd
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5640.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2021 01:26:38.4851 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MyD15znIxMQ4UrSmIQP5tB8hdqgSo6cMvOkm1ZCAbb5pZiKLYVrz2+umVgijx40gLlFc4D+mS3ddBFTe+8jZxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5638
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.88; envelope-from=lei.rao@intel.com;
 helo=mga01.intel.com
X-Spam_score_int: -101
X-Spam_score: -10.2
X-Spam_bar: ----------
X-Spam_report: (-10.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-3.3,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "kwolf@redhat.com" <kwolf@redhat.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "Zhang,
 Chen" <chen.zhang@intel.com>, "hreitz@redhat.com" <hreitz@redhat.com>,
 "eblake@redhat.com" <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 12/2/2021 5:54 PM, Vladimir Sementsov-Ogievskiy wrote:
> 02.12.2021 11:53, Daniel P. Berrangé wrote:
>> On Thu, Dec 02, 2021 at 01:14:47PM +0800, Rao, Lei wrote:
>>> Sorry, resending with correct indentation and quoting.
>>>
>>> On 12/1/2021 10:27 PM, Vladimir Sementsov-Ogievskiy wrote:
>>>> 01.12.2021 12:48, Rao, Lei wrote:
>>>>>
>>>>>
>>>>> -----Original Message-----
>>>>> From: Daniel P. Berrangé <berrange@redhat.com>
>>>>> Sent: Wednesday, December 1, 2021 5:11 PM
>>>>> To: Rao, Lei <lei.rao@intel.com>
>>>>> Cc: Zhang, Chen <chen.zhang@intel.com>; eblake@redhat.com; vsementsov@virtuozzo.com; kwolf@redhat.com; hreitz@redhat.com; qemu-block@nongnu.org; qemu-devel@nongnu.org
>>>>> Subject: Re: [PATCH] QIO: Add force_quit to the QIOChannel to ensure QIO exits cleanly in some corner case
>>>>>
>>>>> On Wed, Dec 01, 2021 at 03:54:27PM +0800, Rao, Lei wrote:
>>>>>>       We found that the QIO channel coroutine could not be awakened in some corner cases during our stress test for COLO.
>>>>>>       The patch fixes as follow:
>>>>>>           #0  0x00007fad72e24bf6 in __ppoll (fds=0x5563d75861f0, nfds=1, timeout=<optimized out>, sigmask=0x0) at ../sysdeps/unix/sysv/linux/ppoll.c:44
>>>>>>           #1  0x00005563d6977c68 in qemu_poll_ns (fds=0x5563d75861f0, nfds=1, timeout=599999697630) at util/qemu-timer.c:348
>>>>>>           #2  0x00005563d697ac44 in aio_poll (ctx=0x5563d755dfa0, blocking=true) at util/aio-posix.c:669
>>>>>>           #3  0x00005563d68ba24f in bdrv_do_drained_begin (bs=0x5563d75ea0c0, recursive=false, parent=0x0, ignore_bds_parents=false, poll=true) at block/io.c:432
>>>>>>           #4  0x00005563d68ba338 in bdrv_drained_begin (bs=0x5563d75ea0c0) at block/io.c:438
>>>>>>           #5  0x00005563d689c6d2 in quorum_del_child (bs=0x5563d75ea0c0, child=0x5563d7908600, errp=0x7fff3cf5b960) at block/quorum.c:1063
>>>>>>           #6  0x00005563d684328f in bdrv_del_child (parent_bs=0x5563d75ea0c0, child=0x5563d7908600, errp=0x7fff3cf5b960) at block.c:6568
>>>>>>           #7  0x00005563d658499e in qmp_x_blockdev_change (parent=0x5563d80ec4c0 "colo-disk0", has_child=true, child=0x5563d7577d30 "children.1", has_node=false, node=0x0,errp=0x7fff3cf5b960) at blockdev.c:4494
>>>>>>           #8  0x00005563d67e8b4e in qmp_marshal_x_blockdev_change (args=0x7fad6400ada0, ret=0x7fff3cf5b9f8, errp=0x7fff3cf5b9f0) at qapi/qapi-commands-block-core.c:1538
>>>>>>           #9  0x00005563d691cd9e in do_qmp_dispatch (cmds=0x5563d719a4f0 <qmp_commands>, request=0x7fad64009d80, allow_oob=true, errp=0x7fff3cf5ba98)
>>>>>>               at qapi/qmp-dispatch.c:132
>>>>>>           #10 0x00005563d691cfab in qmp_dispatch (cmds=0x5563d719a4f0 <qmp_commands>, request=0x7fad64009d80, allow_oob=true) at qapi/qmp-dispatch.c:175
>>>>>>           #11 0x00005563d67b7787 in monitor_qmp_dispatch (mon=0x5563d7605d40, req=0x7fad64009d80) at monitor/qmp.c:145
>>>>>>           #12 0x00005563d67b7b24 in monitor_qmp_bh_dispatcher (data=0x0) at monitor/qmp.c:234
>>>>>>           #13 0x00005563d69754c2 in aio_bh_call (bh=0x5563d7473230) at util/async.c:89
>>>>>>           #14 0x00005563d697555e in aio_bh_poll (ctx=0x5563d7471da0) at util/async.c:117
>>>>>>           #15 0x00005563d697a423 in aio_dispatch (ctx=0x5563d7471da0) at util/aio-posix.c:459
>>>>>>           #16 0x00005563d6975917 in aio_ctx_dispatch (source=0x5563d7471da0, callback=0x0, user_data=0x0) at util/async.c:260
>>>>>>           #17 0x00007fad730e1fbd in g_main_context_dispatch () from /lib/x86_64-linux-gnu/libglib-2.0.so.0
>>>>>>           #18 0x00005563d6978cda in glib_pollfds_poll () at util/main-loop.c:219
>>>>>>           #19 0x00005563d6978d58 in os_host_main_loop_wait (timeout=977650) at util/main-loop.c:242
>>>>>>           #20 0x00005563d6978e69 in main_loop_wait (nonblocking=0) at util/main-loop.c:518
>>>>>>           #21 0x00005563d658f5ed in main_loop () at vl.c:1814
>>>>>>           #22 0x00005563d6596bb7 in main (argc=61, argv=0x7fff3cf5c0c8,
>>>>>> envp=0x7fff3cf5c2b8) at vl.c:450
>>>>>>
>>>>>>       From the call trace, we can see that the QEMU main thread is waiting for the in_flight return to zero. But the in_filght never reaches 0.
>>>>>>       After analysis, the root cause is that the coroutine of NBD was not awakened. Although this bug was found in the COLO test, I think this is a
>>>>>>       universal problem in the QIO module. This issue also affects other modules depending on QIO such as NBD. We dump the following data:
>>>>>>       $2 = {
>>>>>>         in_flight = 2,
>>>>>>         state = NBD_CLIENT_QUIT,
>>>>>>         connect_status = 0,
>>>>>>         connect_err = 0x0,
>>>>>>         wait_in_flight = false,
>>>>>>         requests = {{
>>>>>>             coroutine = 0x0,
>>>>>>             offset = 273077071872,
>>>>>>             receiving = false,
>>>>>>           }, {
>>>>>>             coroutine = 0x7f1164571df0,
>>>>>>             offset = 498792529920,
>>>>>>             receiving = false,
>>>>>>           }, {
>>>>>>             coroutine = 0x0,
>>>>>>             offset = 500663590912,
>>>>>>             receiving = false,
>>>>>>           }, {
>>>>>>             ...
>>>>>>           } },
>>>>>>         reply = {
>>>>>>           simple = {
>>>>>>             magic = 1732535960,
>>>>>>             error = 0,
>>>>>>             handle = 0
>>>>>>           },
>>>>>>           structured = {
>>>>>>             magic = 1732535960,
>>>>>>             flags = 0,
>>>>>>             type = 0,
>>>>>>             handle = 0,
>>>>>>             length = 0
>>>>>>           },
>>>>>>           {
>>>>>>             magic = 1732535960,
>>>>>>             _skip = 0,
>>>>>>             handle = 0
>>>>>>           }
>>>>>>         },
>>>>>>         bs = 0x7f11640e2140,
>>>>>>         reconnect_delay = 0,
>>>>>>         saddr = 0x7f11640e1f80,
>>>>>>         export = 0x7f11640dc560 "parent0",
>>>>>>       }
>>>>>>       From the data, we can see the coroutine of NBD does not exit normally when killing the NBD server(we kill the Secondary VM in the COLO stress test).
>>>>>>       Then it will not execute in_flight--. So, the QEMU main thread will hang here. Further analysis, I found the coroutine of NBD will yield
>>>>>>       in nbd_send_request() or qio_channel_write_all() in nbd_co_send_request. By the way, the yield is due to the kernel return EAGAIN(under the stress test).
>>>>>>       However, NBD didn't know it would yield here. So, the nbd_recv_coroutines_wake won't wake it up because req->receiving is false. if the NBD server
>>>>>>       is terminated abnormally at the same time. The G_IO_OUT will be invalid, the coroutine will never be awakened. In addition, the s->ioc will be released
>>>>>>       immediately. if we force to wake up the coroutine of NBD, access to the ioc->xxx will cause segment fault. Finally, I add a state named force_quit to
>>>>>>       the QIOChannel to ensure that QIO will exit immediately. And I add the function of qio_channel_coroutines_wake to wake it up.
>>>>
>>>> If qio_channel_shutdown() can't kill request that is in qio_channel_write_all() - it's not a reponsibility of nbd driver, qio channel layer should take care of this..
>>>>
>>>> Or, you probably need some keep-alive settings set up.
>>>>
>>>>>>
>>>>>> Signed-off-by: Lei Rao <lei.rao@intel.com>
>>>>>> Signed-off-by: Zhang Chen <chen.zhang@intel.com>
>>>>>> ---
>>>>>>    block/nbd.c          |  5 +++++
>>>>>>    include/io/channel.h | 19 +++++++++++++++++++
>>>>>>    io/channel.c         | 22 ++++++++++++++++++++++
>>>>>>    3 files changed, 46 insertions(+)
>>>>>>
>>>>>> diff --git a/block/nbd.c b/block/nbd.c index 5ef462db1b..5ee4eaaf57
>>>>>> 100644
>>>>>> --- a/block/nbd.c
>>>>>> +++ b/block/nbd.c
>>>>>> @@ -208,6 +208,8 @@ static void nbd_teardown_connection(BlockDriverState *bs)
>>>>>>        assert(!s->in_flight);
>>>>>>        if (s->ioc) {
>>>>>> +        qio_channel_set_force_quit(s->ioc, true);
>>>>>> +        qio_channel_coroutines_wake(s->ioc);
>>>>>>            qio_channel_shutdown(s->ioc, QIO_CHANNEL_SHUTDOWN_BOTH,
>>>>>> NULL);
>>>>>
>>>>> Calling shutdown here should already be causing the qio_chanel_readv_all to wakeup and break out of its
>>>>> poll() loop. We shouldn't need to add a second way to break out of the poll().
>>>>>
>>>>> Calling shutdown can wake up the coroutines which is polling. But I think it's not enough. I tried to forcibly wake up the NBD coroutine,
>>>>> It may cause segment fault. The root cause is that it will continue to access ioc->xxx in qio_channel_yield(), but the ioc has been released and set it NULL such as in
>>>>> nbd_co_do_establish_connection(); I think call shutdown will have the same result. So, I add the force_quit, once set it true, it will immediately exit without accessing IOC.
>>>>>
>>>>
>>>> What do you mean by "the NBD coroutine" and by "forcibly wake up"?
>>>>
>>>> In recent Qemu there is no specific NBD coroutine. Only request coroutines should exist.
>>>>
>>>> Forcibly waking up any coroutine is generally unsafe in Qemu, most of the code is not prepared for this, crash is normal result for such try.
>>>>
>>>> Also, there is good mechanism to debug coroutines in gdb:
>>>>
>>>> source scripts/qemu-gdb.py
>>>> qemu coroutine <coroutine pointer>
>>>>
>>>> - it will dump stack trace of a coroutine, it may help.
>>>>
>>>> Also, to find coroutines look at bs->tracked_requests list, all requests of bs are in the list with coroutine pointers in .co field.
>>>
>>> I am sorry for the unclear description. The NBD coroutine means the request coroutines.
>>>
>>> About "the forcibly wake up" I just set the receiving to true before qio_channel_writev_all() in nbd_co_send_request()
>>> to ensure that the request coroutines can be awakened by nbd_recv_coroutine_wake_one(). But that's just a test.
> 
> I'm not sure that it's safe. On nbd_channel_error() we call qio_channel_shutdown() - it should wake up everything that sleep in qio_channel code. The .receiving field is only for nbd.c specific internal yield point.
> 
> Could your change itself lead to the crash I'm not sure too.
> 
> Still, on normal execution paths, there shouldn't be a situation when some qio_channel_writev_full_all() is still executing during nbd_co_do_establish_connection(). If it is - it's a bug in nbd.c of course.
> 
> To check it without changing the .receiving field, you should print all stacks of nbd request coroutines at the point of qemu hang. What they all are doing?
> 
> If one of them is in nbd_co_do_establish_connection() and another is in nbd_co_do_establish_connection()  - that's a bug.

OK，I will try to reproduce this bug again, but this may take some time. Previously in our stress test, it usually takes two or three days to hit this issue.

> 
>>>
>>> The issue is, only waking up the request coroutine or shutdown the QIO is not enough because there will be a synchronization issue.
>>> For example, When the NBD request coroutine is awakened in qio_channel_writev_full_all(), it will continue to access the ioc->xxx,
>>> but the ioc has been set to NULL in nbd_co_do_establish_connection(); it will cause segment fault.
> 
> Could you provide a call stack of this segmentation fault? And coroutine stack of coroutine which is in qio_channel_writev_full_all() at the moment. And value of s->in_flight?
> 
>>
>> That is a serious bug. Nothing is permitted to free the QIOChannel while a
>> qio_channel_writev_full_all API call (or any other I/O call is in progress).
> 
> I understand this.. There are only two paths that calls nbd_co_do_establish_connection():
> 
> If it's nbd_co_send_request() -> nbd_reconnect_attempt() -> nbd_co_do_establish_connection()
> 
> Then in nbd_co_send_request() we should have been waiting until s->in_flight becomes 0. And we are under mutex.. So there should not be any parallel qio_channel_writev_full_all() or any other qio_channel requests.
> 
> Another path is nbd_open() -> nbd_do_establish_connection(). Here for sure can't be any requests yet..
> 
>>
>> If multiple threads are involved, then each needs to be holding a reference
>> the QIOChannel to stop it being freed while in use.
>>
> 
> 
> 

