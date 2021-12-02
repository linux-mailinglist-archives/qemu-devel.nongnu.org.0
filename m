Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EFAC465DB4
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 06:17:21 +0100 (CET)
Received: from localhost ([::1]:35412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mseTA-00022b-0Q
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 00:17:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>)
 id 1mseR1-0000t8-Q3; Thu, 02 Dec 2021 00:15:07 -0500
Received: from mga17.intel.com ([192.55.52.151]:43172)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>)
 id 1mseQw-0006xR-If; Thu, 02 Dec 2021 00:15:07 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10185"; a="217319744"
X-IronPort-AV: E=Sophos;i="5.87,281,1631602800"; d="scan'208";a="217319744"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2021 21:14:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,281,1631602800"; d="scan'208";a="576626330"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by fmsmga004.fm.intel.com with ESMTP; 01 Dec 2021 21:14:59 -0800
Received: from orsmsx604.amr.corp.intel.com (10.22.229.17) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 1 Dec 2021 21:14:59 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Wed, 1 Dec 2021 21:14:59 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Wed, 1 Dec 2021 21:14:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CWArsFVjiKNqD797RQuZNYFgMxoCyduK7s57UAtsipSGCI+YeYrXWRkeF8Gi/kq/N1uU9flt/0Uxqlxd7ybhcFd3hjl5HT8Fn41Kgwx5kR7dYjNnPpUbIavvSQYTGEl7AxekzLeFb7qFQqB+VKwD/BXitX71QEk89bB4X22r22CzvxxUsX5e55YALlCLu59clAcxhvVEybF1rcOaSmpImKmWnlKaf/HpLtozYLr/EuRGbGTyO0Ndb2spdR6FWKXpLjElM5bUBtXIjwShEyO+LEpGH0qk+vTQC2PHCvPTb+Ijw1xvse8fenjs+/Q/Ly0FI2Cnh63eRQzZsLWo74nt7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ShvqWVOzNQD475p2Fl23v4NNsb2QrEDhDKl7rJ2oIpo=;
 b=EY1xYmRWEaABV/dGcy9lrIz3XWoOfhB/zHdGROYlnOY4FMWFG+Mm061sNPlDJk8aGT1zbkQbO772t889jJO/7IeTj3XvivPB+KSrWtwPHxm0AEFPigEhMUFVtjNOlYh81IjpfIH3LWTIqOi4KtLETbK9aigzRvVgrF0MWnYRtWv1p4rPblEXTgCq9bumtBef7/ZLMogUKhDhSbYJshYxJ7C5Pr9ZyU2mqFj3ES+Iqdpcd3YBsZbGveNe2LphSo/YtdEcX7OCOB4Tms97LtG9Tr1SC6tmJKl883fdPXqR/5eo4lBwwksf1VSe3LRBhH1WhH9g8CZ+bqdpQHJVqAdCBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ShvqWVOzNQD475p2Fl23v4NNsb2QrEDhDKl7rJ2oIpo=;
 b=N2jU/KuEtWpBCHqCdLpQ50qi9ImSetfRs8dCzP1ViL5bKbZvSFoJmu8X3AIscFGksnG0flFeklU5XfeYZt9oB5hkRCcx74U7YoZjegr7eyd2JVoj70G2dnmTv/ueSIRuaXLHk/hNVT8/R+5mAcu34NJLEnnaNSBSQjd6lKLoGqw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5640.namprd11.prod.outlook.com (2603:10b6:8:3f::14) by
 DM4PR11MB5568.namprd11.prod.outlook.com (2603:10b6:5:39a::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4734.22; Thu, 2 Dec 2021 05:14:57 +0000
Received: from DM8PR11MB5640.namprd11.prod.outlook.com
 ([fe80::9c4d:5c63:9fdd:53da]) by DM8PR11MB5640.namprd11.prod.outlook.com
 ([fe80::9c4d:5c63:9fdd:53da%3]) with mapi id 15.20.4755.015; Thu, 2 Dec 2021
 05:14:57 +0000
Message-ID: <836f8fe3-5262-d179-a66a-325935ec7005@intel.com>
Date: Thu, 2 Dec 2021 13:14:47 +0800
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
From: "Rao, Lei" <lei.rao@intel.com>
In-Reply-To: <a1706788-2f28-9948-f68f-a6fd51b81fa3@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR02CA0076.apcprd02.prod.outlook.com
 (2603:1096:4:90::16) To DM8PR11MB5640.namprd11.prod.outlook.com
 (2603:10b6:8:3f::14)
MIME-Version: 1.0
Received: from [10.238.128.151] (192.198.142.11) by
 SG2PR02CA0076.apcprd02.prod.outlook.com (2603:1096:4:90::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.11 via Frontend Transport; Thu, 2 Dec 2021 05:14:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dbb4c563-d439-4c0c-d121-08d9b552aecc
X-MS-TrafficTypeDiagnostic: DM4PR11MB5568:
X-Microsoft-Antispam-PRVS: <DM4PR11MB5568341677AE9B038C8CF593FD699@DM4PR11MB5568.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8AcqN2D4KWohXTMZSL0+96mdaSWWG3t6SrpKNUtDTWl01h9tFpKO4NBo7tadE45r+PX5a2cjUKE2UJLPjEufQ6wrZ+NFG0goRseKVFPPPG3clYvsh5L4p4HvIwKicbLZfUGFN2TARviRSoa9YDtIhi1JGhpxaS9QIt2Hn9w18XAt2S72X4+Id3WGlYsW7mKcgujSY6YDU0b2u2EmtAOujS7H7Hc3TwXdmqOuTweUZYHTFcRtGqfrGbpyCzJT99QqVLk3AVYw4xEVhyjL998vcoJ45hS1H8hX6Qm6seoNC6sYFYSFn9wJ4KR9owGS8sff+DxKx+xQXyOfiIttuc8qNIia2cSPPosBChD7gNbn6ZguKNzKQfkorXPRHcz0goJgn3DlZrWRPR+IT4Bu5X95RIV+WtSqkNltDhV1ffCY9wGwDwzkp5CZGOkIEVviNrIt3Frb7+JPToRGMRPt0a4FjLKo4zJmsxkudRd0TnMP5dfbaL93oLqV2H6wptavk6+7oZtMkbeTBM388pTcOViTGQQqWy63Uvd2I3UwF2409ZiwcbVUkNmWf5P0ExqZB0od6zeBzYyG2Tn7pVLMp+vULUNR9xWJQBNXpB53zJicMK3cXfSMciaCBJD2svQRuq8YxcziRNTAqgJ3ljCCTdgvYXnG+6voj3rAZDbGXKTJwa0IvL7YPaYWYem6xaMztFOKAThUuorqGNMfiRqhgtutKQvqYQjuWk/OBPP2CKGPSsXCTtiqWB+OznGt3ODIK0CVqlAlQCvQjO2ASMs5nNUTgQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5640.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(83380400001)(110136005)(2906002)(66946007)(54906003)(16576012)(6666004)(66476007)(316002)(66556008)(6486002)(82960400001)(86362001)(31686004)(53546011)(8936002)(38100700002)(8676002)(186003)(30864003)(36756003)(956004)(508600001)(4326008)(2616005)(31696002)(5660300002)(26005)(21314003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OE1sc0RhUC9Gem1rSG5oQlkyMlRzSGdKYmdhN1dIVDhZM0JQMlYwYVErOUJv?=
 =?utf-8?B?bUtzdkdtZjZYVVJRSDZKUndlTE44M1hIOW95SFNKZmZqZnRZangvQ3hTY0xH?=
 =?utf-8?B?Tjh2Z0NmY3ZzRisybE5QMTBIaVN0TDdIY1dxbW1TTmcyZHl4RDlTY3ExbnhR?=
 =?utf-8?B?SUIxMk5yd2lEVUdSbE9JU2xDVkJmRXNxUjFPN2dIMTFKdWVZQTM4MzBGVnZ3?=
 =?utf-8?B?eWZEZWc4SjkzVmdCVnE0ck95ZkdHUzQyQktrcUJaNGNxMnZIMmFqODB4b0gv?=
 =?utf-8?B?c1B4YWRYb3JidjFlNUlPYnpmOXIwNjVUZkRvZStxUG5XZk5PVjExRk1ZbjJ2?=
 =?utf-8?B?alZFdkJoRm9wbUZSZXhaUk81blFia0I0UUpVVjExRGMwdGNrbzdJOHozOVRS?=
 =?utf-8?B?QXYwWllTNjVSaDZKby91aDZtRzR5NUJEa2Y5dEw1Z1FrMG5GVlZRRDhiT3Ja?=
 =?utf-8?B?Rm5xdE9LbWViTlU3RTJLRUVvVERJbkdsbDBaeFArMHdTQ1dmYVpaSTlIQ0RC?=
 =?utf-8?B?aWJGWi9Rdlc3bm5BSlhOSkdSR1Y0NlhaVzVqbzZ5RmpoV1hldjRyeHBUUzJB?=
 =?utf-8?B?SGlDb21jT3lsNVVvdHNKY08zUjBYUGdocEczbGdaWktKUWtHT0NacDEreXUx?=
 =?utf-8?B?THR0a2dMUjI0T1ZUWTcvN0FLVWljK1Y5MzNoMnI2WFlPMmhEV1pBSlhsQjYr?=
 =?utf-8?B?cnFjT2ZIZHlneXRkYnhTcWF5VzRIRVVER3BVMTZVR2dtN1RXc0lQQi9tZzFT?=
 =?utf-8?B?bUhHaEhrYyttUjkrU3RIbUZYOFFvMzJ4b1FlZUNXYXV0Y2d6REdVc0hITFZY?=
 =?utf-8?B?eUJyOERUUVBoaEtuaUJnQWNreXI4OVpnNlNUSGhaNjNzcHhCU2dwYzFQU0dS?=
 =?utf-8?B?eS9SOGxJRkdSRG95b0VUUk1WMjFxTU44bGY1RG1MVUNwRFRteVNZTUlIbzFR?=
 =?utf-8?B?NnpJUGF1Ymp4bnFPREczam9HSjB0KzVQS25vbW11UEpBQzROb1IvNmx0WEV6?=
 =?utf-8?B?TnFDWk5FS3kwQjZxeTl3dnJBZzBzUUZKbDlLbWFmUU41Ym10WlZJa0FUcHcy?=
 =?utf-8?B?RGFBRWJ5aEd0eHRnSkp2dnp5RDZMK2owUGZpS0Vac3JBTk4xRGpZLzBxakRH?=
 =?utf-8?B?RUszMndOU1VEN1drV3c5RDBlL3VoZGNTWEM3TXZEUVVvSnRCcFBDK2o2a3cx?=
 =?utf-8?B?VFluZGRFUjdiNTNBL1VmeUtkZXNZbzlFUlZvdzRkZ1hsWUVvOGpHbnAwbW84?=
 =?utf-8?B?aUJjZ1VsSHBzUmM4eDc4aDJTNVBGTTh1eTRWZ0RQUXJiK2VSeDFtM3Y5NmN4?=
 =?utf-8?B?ZFpVUFJ0NFhlTlIwcGd2dFFiYmhvOGF5MCtvaWxEZmVPYXlVbjVTeWdaclkx?=
 =?utf-8?B?c0p2QnRLaFMxeVc5ZFNOeHlNMnpQR0dMTU5pMU5LY1NqeTJza2hidnI1blFt?=
 =?utf-8?B?bXkxRDVLY2laR2tpYnRvdDJlSUEwbWhJMW14cVB6V29USkJ1U0dFT0VSV2ZX?=
 =?utf-8?B?VVZnWTN4c3BvcDVyTGttNmxtaDBNSmtTZTZveUoySGd1YVZGeDhUb2pCUi9i?=
 =?utf-8?B?d080dTFNK0lTdWxyKzlIbkZNcEdBR0VUbjFVTnI0T1VhbE1BZHhQOE40RlZZ?=
 =?utf-8?B?U0tuM1g4MDVhanZVM21WVmwvVk8xNitzekhLWUtQbmhvRGJqcEoxbHMycmpD?=
 =?utf-8?B?ZG9mVkp4dVRPREdkVVlZM1I1T1A5SjE2VG1rYU1Kd0JQZzJxTk9HclEwYlZy?=
 =?utf-8?B?Z3p1Umh4RHNvc0w3cVduL1FtUnNoTUJqTFJPeVBMUm9UQnM1dDNqZ2lxT0VI?=
 =?utf-8?B?cDQ0MDl4N3puWmFVaGxLNHVqZTlQZ3grVFlaZ3pNTjBHdmdOVXJsOHpZek9H?=
 =?utf-8?B?VnhrNklIUFZhdXZ0ckNwbzRlMTh3TzN6WlZWUG9uNkJ5bXUxR1FrMFFhMklC?=
 =?utf-8?B?WE85SUZzVG5QUkthQnE1Wit6ZmZTZElFd3UvSE5aQ296YlhwUXBaNDUyL1hl?=
 =?utf-8?B?eDl0S3RPOEdUa3laQ01GS2dBUGpIK0c3a2J5RjNQVkN3Y1JLYUNGRFA2d0dl?=
 =?utf-8?B?Qmw2c3VDdVpoaFp5enFIdDlYYWdXWkRFV1FaVk1ZcG01alMzaW80aUhsWE1Y?=
 =?utf-8?B?dHpjN2xiWk1mRTg5TGUxdWJzbTRqTW9lT2NSN3NXeG92T0FHY2RTNkNaV2Rx?=
 =?utf-8?Q?S/UvpnDT/9a7euUm3uy7f6s=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dbb4c563-d439-4c0c-d121-08d9b552aecc
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5640.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2021 05:14:57.7087 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cdyqsixfz/npng4Ejs1QY522FFMtYoPrYyU06p9VLx3q8ISNwlIsyyIYteQ+eQCCA1wwvZht49wY8udzT2Y9vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5568
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.151; envelope-from=lei.rao@intel.com;
 helo=mga17.intel.com
X-Spam_score_int: -63
X-Spam_score: -6.4
X-Spam_bar: ------
X-Spam_report: (-6.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-2.211,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: "kwolf@redhat.com" <kwolf@redhat.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "Zhang,
 Chen" <chen.zhang@intel.com>, "hreitz@redhat.com" <hreitz@redhat.com>,
 "eblake@redhat.com" <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Sorry, resending with correct indentation and quoting.

On 12/1/2021 10:27 PM, Vladimir Sementsov-Ogievskiy wrote:
> 01.12.2021 12:48, Rao, Lei wrote:
>>
>>
>> -----Original Message-----
>> From: Daniel P. Berrangé <berrange@redhat.com>
>> Sent: Wednesday, December 1, 2021 5:11 PM
>> To: Rao, Lei <lei.rao@intel.com>
>> Cc: Zhang, Chen <chen.zhang@intel.com>; eblake@redhat.com; vsementsov@virtuozzo.com; kwolf@redhat.com; hreitz@redhat.com; qemu-block@nongnu.org; qemu-devel@nongnu.org
>> Subject: Re: [PATCH] QIO: Add force_quit to the QIOChannel to ensure QIO exits cleanly in some corner case
>>
>> On Wed, Dec 01, 2021 at 03:54:27PM +0800, Rao, Lei wrote:
>>>      We found that the QIO channel coroutine could not be awakened in some corner cases during our stress test for COLO.
>>>      The patch fixes as follow:
>>>          #0  0x00007fad72e24bf6 in __ppoll (fds=0x5563d75861f0, nfds=1, timeout=<optimized out>, sigmask=0x0) at ../sysdeps/unix/sysv/linux/ppoll.c:44
>>>          #1  0x00005563d6977c68 in qemu_poll_ns (fds=0x5563d75861f0, nfds=1, timeout=599999697630) at util/qemu-timer.c:348
>>>          #2  0x00005563d697ac44 in aio_poll (ctx=0x5563d755dfa0, blocking=true) at util/aio-posix.c:669
>>>          #3  0x00005563d68ba24f in bdrv_do_drained_begin (bs=0x5563d75ea0c0, recursive=false, parent=0x0, ignore_bds_parents=false, poll=true) at block/io.c:432
>>>          #4  0x00005563d68ba338 in bdrv_drained_begin (bs=0x5563d75ea0c0) at block/io.c:438
>>>          #5  0x00005563d689c6d2 in quorum_del_child (bs=0x5563d75ea0c0, child=0x5563d7908600, errp=0x7fff3cf5b960) at block/quorum.c:1063
>>>          #6  0x00005563d684328f in bdrv_del_child (parent_bs=0x5563d75ea0c0, child=0x5563d7908600, errp=0x7fff3cf5b960) at block.c:6568
>>>          #7  0x00005563d658499e in qmp_x_blockdev_change (parent=0x5563d80ec4c0 "colo-disk0", has_child=true, child=0x5563d7577d30 "children.1", has_node=false, node=0x0,errp=0x7fff3cf5b960) at blockdev.c:4494
>>>          #8  0x00005563d67e8b4e in qmp_marshal_x_blockdev_change (args=0x7fad6400ada0, ret=0x7fff3cf5b9f8, errp=0x7fff3cf5b9f0) at qapi/qapi-commands-block-core.c:1538
>>>          #9  0x00005563d691cd9e in do_qmp_dispatch (cmds=0x5563d719a4f0 <qmp_commands>, request=0x7fad64009d80, allow_oob=true, errp=0x7fff3cf5ba98)
>>>              at qapi/qmp-dispatch.c:132
>>>          #10 0x00005563d691cfab in qmp_dispatch (cmds=0x5563d719a4f0 <qmp_commands>, request=0x7fad64009d80, allow_oob=true) at qapi/qmp-dispatch.c:175
>>>          #11 0x00005563d67b7787 in monitor_qmp_dispatch (mon=0x5563d7605d40, req=0x7fad64009d80) at monitor/qmp.c:145
>>>          #12 0x00005563d67b7b24 in monitor_qmp_bh_dispatcher (data=0x0) at monitor/qmp.c:234
>>>          #13 0x00005563d69754c2 in aio_bh_call (bh=0x5563d7473230) at util/async.c:89
>>>          #14 0x00005563d697555e in aio_bh_poll (ctx=0x5563d7471da0) at util/async.c:117
>>>          #15 0x00005563d697a423 in aio_dispatch (ctx=0x5563d7471da0) at util/aio-posix.c:459
>>>          #16 0x00005563d6975917 in aio_ctx_dispatch (source=0x5563d7471da0, callback=0x0, user_data=0x0) at util/async.c:260
>>>          #17 0x00007fad730e1fbd in g_main_context_dispatch () from /lib/x86_64-linux-gnu/libglib-2.0.so.0
>>>          #18 0x00005563d6978cda in glib_pollfds_poll () at util/main-loop.c:219
>>>          #19 0x00005563d6978d58 in os_host_main_loop_wait (timeout=977650) at util/main-loop.c:242
>>>          #20 0x00005563d6978e69 in main_loop_wait (nonblocking=0) at util/main-loop.c:518
>>>          #21 0x00005563d658f5ed in main_loop () at vl.c:1814
>>>          #22 0x00005563d6596bb7 in main (argc=61, argv=0x7fff3cf5c0c8,
>>> envp=0x7fff3cf5c2b8) at vl.c:450
>>>
>>>      From the call trace, we can see that the QEMU main thread is waiting for the in_flight return to zero. But the in_filght never reaches 0.
>>>      After analysis, the root cause is that the coroutine of NBD was not awakened. Although this bug was found in the COLO test, I think this is a
>>>      universal problem in the QIO module. This issue also affects other modules depending on QIO such as NBD. We dump the following data:
>>>      $2 = {
>>>        in_flight = 2,
>>>        state = NBD_CLIENT_QUIT,
>>>        connect_status = 0,
>>>        connect_err = 0x0,
>>>        wait_in_flight = false,
>>>        requests = {{
>>>            coroutine = 0x0,
>>>            offset = 273077071872,
>>>            receiving = false,
>>>          }, {
>>>            coroutine = 0x7f1164571df0,
>>>            offset = 498792529920,
>>>            receiving = false,
>>>          }, {
>>>            coroutine = 0x0,
>>>            offset = 500663590912,
>>>            receiving = false,
>>>          }, {
>>>            ...
>>>          } },
>>>        reply = {
>>>          simple = {
>>>            magic = 1732535960,
>>>            error = 0,
>>>            handle = 0
>>>          },
>>>          structured = {
>>>            magic = 1732535960,
>>>            flags = 0,
>>>            type = 0,
>>>            handle = 0,
>>>            length = 0
>>>          },
>>>          {
>>>            magic = 1732535960,
>>>            _skip = 0,
>>>            handle = 0
>>>          }
>>>        },
>>>        bs = 0x7f11640e2140,
>>>        reconnect_delay = 0,
>>>        saddr = 0x7f11640e1f80,
>>>        export = 0x7f11640dc560 "parent0",
>>>      }
>>>      From the data, we can see the coroutine of NBD does not exit normally when killing the NBD server(we kill the Secondary VM in the COLO stress test).
>>>      Then it will not execute in_flight--. So, the QEMU main thread will hang here. Further analysis, I found the coroutine of NBD will yield
>>>      in nbd_send_request() or qio_channel_write_all() in nbd_co_send_request. By the way, the yield is due to the kernel return EAGAIN(under the stress test).
>>>      However, NBD didn't know it would yield here. So, the nbd_recv_coroutines_wake won't wake it up because req->receiving is false. if the NBD server
>>>      is terminated abnormally at the same time. The G_IO_OUT will be invalid, the coroutine will never be awakened. In addition, the s->ioc will be released
>>>      immediately. if we force to wake up the coroutine of NBD, access to the ioc->xxx will cause segment fault. Finally, I add a state named force_quit to
>>>      the QIOChannel to ensure that QIO will exit immediately. And I add the function of qio_channel_coroutines_wake to wake it up.
> 
> If qio_channel_shutdown() can't kill request that is in qio_channel_write_all() - it's not a reponsibility of nbd driver, qio channel layer should take care of this..
> 
> Or, you probably need some keep-alive settings set up.
> 
>>>
>>> Signed-off-by: Lei Rao <lei.rao@intel.com>
>>> Signed-off-by: Zhang Chen <chen.zhang@intel.com>
>>> ---
>>>   block/nbd.c          |  5 +++++
>>>   include/io/channel.h | 19 +++++++++++++++++++
>>>   io/channel.c         | 22 ++++++++++++++++++++++
>>>   3 files changed, 46 insertions(+)
>>>
>>> diff --git a/block/nbd.c b/block/nbd.c index 5ef462db1b..5ee4eaaf57
>>> 100644
>>> --- a/block/nbd.c
>>> +++ b/block/nbd.c
>>> @@ -208,6 +208,8 @@ static void nbd_teardown_connection(BlockDriverState *bs)
>>>       assert(!s->in_flight);
>>>       if (s->ioc) {
>>> +        qio_channel_set_force_quit(s->ioc, true);
>>> +        qio_channel_coroutines_wake(s->ioc);
>>>           qio_channel_shutdown(s->ioc, QIO_CHANNEL_SHUTDOWN_BOTH,
>>> NULL);
>>
>> Calling shutdown here should already be causing the qio_chanel_readv_all to wakeup and break out of its
>> poll() loop. We shouldn't need to add a second way to break out of the poll().
>>
>> Calling shutdown can wake up the coroutines which is polling. But I think it's not enough. I tried to forcibly wake up the NBD coroutine,
>> It may cause segment fault. The root cause is that it will continue to access ioc->xxx in qio_channel_yield(), but the ioc has been released and set it NULL such as in
>> nbd_co_do_establish_connection(); I think call shutdown will have the same result. So, I add the force_quit, once set it true, it will immediately exit without accessing IOC.
>>
> 
> What do you mean by "the NBD coroutine" and by "forcibly wake up"?
> 
> In recent Qemu there is no specific NBD coroutine. Only request coroutines should exist.
> 
> Forcibly waking up any coroutine is generally unsafe in Qemu, most of the code is not prepared for this, crash is normal result for such try.
> 
> Also, there is good mechanism to debug coroutines in gdb:
> 
> source scripts/qemu-gdb.py
> qemu coroutine <coroutine pointer>
> 
> - it will dump stack trace of a coroutine, it may help.
> 
> Also, to find coroutines look at bs->tracked_requests list, all requests of bs are in the list with coroutine pointers in .co field.

I am sorry for the unclear description. The NBD coroutine means the request coroutines.

About "the forcibly wake up" I just set the receiving to true before qio_channel_writev_all() in nbd_co_send_request()
to ensure that the request coroutines can be awakened by nbd_recv_coroutine_wake_one(). But that's just a test.

The issue is, only waking up the request coroutine or shutdown the QIO is not enough because there will be a synchronization issue.
For example, When the NBD request coroutine is awakened in qio_channel_writev_full_all(), it will continue to access the ioc->xxx,
but the ioc has been set to NULL in nbd_co_do_establish_connection(); it will cause segment fault.

Since this is caused by QIO yielding that the upper layer is not aware of, How about we don't yield in QIO?
That is, when the request can't be sent, QIO can return to the caller directly, so the caller can decide whether to yield or not.

Thanks,
Lei

> 
>> Thanks
>> Lei
>>
>>>           yank_unregister_function(BLOCKDEV_YANK_INSTANCE(s->bs->node_name),
>>>                                    nbd_yank, s->bs); @@ -315,6 +317,7
>>> @@ int coroutine_fn nbd_co_do_establish_connection(BlockDriverState
>>> *bs,
>>>       /* successfully connected */
>>>       s->state = NBD_CLIENT_CONNECTED;
>>> +    qio_channel_set_force_quit(s->ioc, false);
>>>       qemu_co_queue_restart_all(&s->free_sema);
>>>       return 0;
>>> @@ -345,6 +348,8 @@ static coroutine_fn void
>>> nbd_reconnect_attempt(BDRVNBDState *s)
>>>       /* Finalize previous connection if any */
>>>       if (s->ioc) {
>>> +        qio_channel_set_force_quit(s->ioc, true);
>>> +        qio_channel_coroutines_wake(s->ioc);
>>
>> Isn't this code path just missing a qio_channel_shutdown call or a qio_channel_close call to make the socket trigger wakeup from poll.
>>
>> I don't think it can solve the bug even if it is added, the reason is as above.
>> Thanks,
>> Lei
>>
>>>           qio_channel_detach_aio_context(QIO_CHANNEL(s->ioc));
>>>           yank_unregister_function(BLOCKDEV_YANK_INSTANCE(s->bs->node_name),
>>>                                    nbd_yank, s->bs); diff --git
>>> a/include/io/channel.h b/include/io/channel.h index
>>> 88988979f8..bc5af8cdd6 100644
>>> --- a/include/io/channel.h
>>> +++ b/include/io/channel.h
>>> @@ -78,6 +78,7 @@ struct QIOChannel {
>>>       AioContext *ctx;
>>>       Coroutine *read_coroutine;
>>>       Coroutine *write_coroutine;
>>> +    bool force_quit;
>>>   #ifdef _WIN32
>>>       HANDLE event; /* For use with GSource on Win32 */  #endif @@
>>> -484,6 +485,24 @@ int qio_channel_set_blocking(QIOChannel *ioc,
>>>                                bool enabled,
>>>                                Error **errp);
>>> +/**
>>> + * qio_channel_force_quit:
>>> + * @ioc: the channel object
>>> + * @quit: the new flag state
>>> + *
>>> + * Set the new flag state
>>> + */
>>> +void qio_channel_set_force_quit(QIOChannel *ioc, bool quit);
>>> +
>>> +/**
>>> + * qio_channel_coroutines_wake:
>>> + * @ioc: the channel object
>>> + *
>>> + * Wake up the coroutines to ensure that they will exit normally
>>> + * when the server terminated abnormally  */ void
>>> +qio_channel_coroutines_wake(QIOChannel *ioc);
>>> +
>>>   /**
>>>    * qio_channel_close:
>>>    * @ioc: the channel object
>>> diff --git a/io/channel.c b/io/channel.c index e8b019dc36..bc1a9e055c
>>> 100644
>>> --- a/io/channel.c
>>> +++ b/io/channel.c
>>> @@ -136,6 +136,9 @@ int qio_channel_readv_full_all_eof(QIOChannel *ioc,
>>>           if (len == QIO_CHANNEL_ERR_BLOCK) {
>>>               if (qemu_in_coroutine()) {
>>>                   qio_channel_yield(ioc, G_IO_IN);
>>> +                if (ioc->force_quit) {
>>> +                    goto cleanup;
>>> +                }
>>>               } else {
>>>                   qio_channel_wait(ioc, G_IO_IN);
>>>               }
>>> @@ -242,6 +245,9 @@ int qio_channel_writev_full_all(QIOChannel *ioc,
>>>           if (len == QIO_CHANNEL_ERR_BLOCK) {
>>>               if (qemu_in_coroutine()) {
>>>                   qio_channel_yield(ioc, G_IO_OUT);
>>> +                if (ioc->force_quit) {
>>> +                    goto cleanup;
>>> +                }
>>>               } else {
>>>                   qio_channel_wait(ioc, G_IO_OUT);
>>>               }
>>> @@ -543,6 +549,9 @@ void coroutine_fn qio_channel_yield(QIOChannel *ioc,
>>>       }
>>>       qio_channel_set_aio_fd_handlers(ioc);
>>>       qemu_coroutine_yield();
>>> +    if (ioc->force_quit) {
>>> +        return;
>>> +    }
>>>       /* Allow interrupting the operation by reentering the coroutine other than
>>>        * through the aio_fd_handlers. */ @@ -555,6 +564,19 @@ void
>>> coroutine_fn qio_channel_yield(QIOChannel *ioc,
>>>       }
>>>   }
>>> +void qio_channel_set_force_quit(QIOChannel *ioc, bool quit) {
>>> +    ioc->force_quit = quit;
>>> +}
>>> +
>>> +void qio_channel_coroutines_wake(QIOChannel *ioc) {
>>> +    if (ioc->read_coroutine) {
>>> +        qio_channel_restart_read(ioc);
>>> +    } else if (ioc->write_coroutine) {
>>> +        qio_channel_restart_write(ioc);
>>> +    }
>>> +}
>>
>> None of this should be needed AFAICT, as the poll/coroutine code shuld already break out of poll if the socket is closed, or is marked shutdown.
>>
>>
>> Regards,
>> Daniel
>>
> 
> 

