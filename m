Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A6763EE678
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 08:04:02 +0200 (CEST)
Received: from localhost ([::1]:50994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFsCe-0003Gt-5k
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 02:04:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tao3.xu@intel.com>) id 1mFsAI-0001wK-Gx
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 02:01:36 -0400
Received: from mga03.intel.com ([134.134.136.65]:36529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tao3.xu@intel.com>) id 1mFsAE-0003jO-Ma
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 02:01:34 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10078"; a="216032782"
X-IronPort-AV: E=Sophos;i="5.84,328,1620716400"; d="scan'208";a="216032782"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2021 23:01:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,328,1620716400"; d="scan'208";a="441380753"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by orsmga002.jf.intel.com with ESMTP; 16 Aug 2021 23:01:19 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Mon, 16 Aug 2021 23:01:18 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Mon, 16 Aug 2021 23:01:18 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.177)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Mon, 16 Aug 2021 23:01:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CyhPM6k2Rw2RXS3TzmUVCrVDv0ERvTeYeiPagzNEAS8LCqwAd/DihkoMrwqzjZVxlY5DTnC8sF4xXhh3Re5syxgwtsBwKE125VMtKZ2oNd4HSD27hyppJZ7e2ze8+Ay7J6e/NbMuwcYRl2EEm0uaTFdIzztQmxDo/IRilDn/BK3Mg/KcHHtroqGqNnPaStPnrjWdME06AiEfXCG8yUmJvA8W6NwarmVFgXVW4OvkwNQD5KOoSUypfTMATmpYDRcYYhQekdN35E7YSyZFBf2q8kGQ0cURXoSMBjydEMpBc9PnfIGlr+c12Hg1TDsBq90ptyqx9T23ygVRWlcXVg59XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QwsHw095ogcI43heAUrd6UwpmixCCtwL6gN0YEwElWs=;
 b=KY8i66fpJ/2CXuJvP8KNRLDLhARBnwR7e7XV352RuvHTkzjI6D9rM/td+neB23lLLTImarBBXTspB2dsixA86UvhHp+M/DroMnJ6jr00BmaOZ9lkAxYmHmZRvp+Jnc/03nS8DO75/Vtqz1pkh7VNEWR8eJQuuIeCEPgb8syC/fv7PxaFYJq/AlVDJ8Njpetqx71uAifZZ4xc8GxgGOBYhCFKhs76VaSoHBMOTg9SphXxZDBsEX7h7P/X6LIptMHQo3Y4fTeDkzeQeieIgDzmp0nwKvS8UwP+pVtaqbUylbPI4u2cr1DovxaGCZiJWo9hpbNqV9ihlHRu0NRaZ0MN4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QwsHw095ogcI43heAUrd6UwpmixCCtwL6gN0YEwElWs=;
 b=tMqNGFttsTJNE4kK8uIDM4NSi9snTywKZSq5Ik0IDgOC6sxS5uT6xgFQQCs8t3GnBGBfQzXYv7bHcJNZiCthBL85BXYlFfkBABUbC+HOqSA3LfRNmcMvcb8hOHjEhHMJBA5EIZ8d/hSJM0hoSGVKvwXH1lP8vRn41gio6Aw/6hE=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5579.namprd11.prod.outlook.com (2603:10b6:510:e6::10)
 by PH0PR11MB5580.namprd11.prod.outlook.com (2603:10b6:510:e5::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.16; Tue, 17 Aug
 2021 06:01:17 +0000
Received: from PH0PR11MB5579.namprd11.prod.outlook.com
 ([fe80::e8cb:c28c:b1ea:13e4]) by PH0PR11MB5579.namprd11.prod.outlook.com
 ([fe80::e8cb:c28c:b1ea:13e4%9]) with mapi id 15.20.4415.024; Tue, 17 Aug 2021
 06:01:17 +0000
Subject: Re: [PATCH] net/colo: check vnet_hdr_support flag when using
 virtio-net
To: Jason Wang <jasowang@redhat.com>, "Zhang, Chen" <chen.zhang@intel.com>,
 "lizhijian@cn.fujitsu.com" <lizhijian@cn.fujitsu.com>
References: <20210806060837.62774-1-tao3.xu@intel.com>
 <60604ba9-73e2-5ce1-e005-6c23e22d9341@redhat.com>
From: Tao Xu <tao3.xu@intel.com>
Message-ID: <dc5cd7c9-41cb-b635-347f-938af41c8fdb@intel.com>
Date: Tue, 17 Aug 2021 14:01:11 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
In-Reply-To: <60604ba9-73e2-5ce1-e005-6c23e22d9341@redhat.com>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: HK2PR02CA0154.apcprd02.prod.outlook.com
 (2603:1096:201:1f::14) To PH0PR11MB5579.namprd11.prod.outlook.com
 (2603:10b6:510:e6::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.238.4.175] (192.198.143.12) by
 HK2PR02CA0154.apcprd02.prod.outlook.com (2603:1096:201:1f::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.14 via Frontend Transport; Tue, 17 Aug 2021 06:01:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0a793169-17d1-4640-e692-08d961446d81
X-MS-TrafficTypeDiagnostic: PH0PR11MB5580:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR11MB55808E9479C456353F304F83A5FE9@PH0PR11MB5580.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1148;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8nOwQ7rcHtDebYhepHra42JA+XOUjrMdsAXQ6jO8XGjmgkRb4YlBG3TYtRkp5zmoaVd7EPuJW4HI4Q4hf7xT/AdSkx1dggnsICkXBVsfzyoJe8mqD4voHlgRbCln0e6zhP6EnqrYwkAIpuPw3v5kzL+5iC1DJ5NiyiRAu5pHqVO7wyIlK9BNg70qfihSHmVApvuPBuIpcigSjN2jo9oXYdAfyHGip0h124FBxRdN0TjWxA0pm7EIE5bv5ElozCFw0RerhWFv0s7EI0ALUaMF7FUrymFF4NhfjpyhiH2txXXXlxiC/2yVMNF/nnLvzYO28dCLmfrSf/Dr0FAOLdPGR+wsLkcMnnxNK2y5Kp4rY2QWyDKoUXfheS1cRKTkxI5Hn4Fp1KHstk/BxPG+o+wKClh+ALJy90PvIzNza9tA63U87ytWcX1xndEGVHaGaNw8hpNWKiPdUZ66hseWLi1gg9ZZ5K+6mWNuSTnnIeV8w2ojC3iMk/PIqqyPyFuEOx684Is6UvbuLINi1+U2YVwN9eiwpWlLewRaTXjjacBuZKVd+oJfbfJ9p3T6XQ6lUMRHqt3EuXjnb6UlP8E2mJfDVDGRHFFDIGFMY+iTXdKcY0YbFuwcXi29BVwsQkFvN4peYf/pd+HfPB9TTDXQ3RV/7TvWWMACE4J37sHk3SdQHzrOY2WitcHGkL+H8d6CWmyWfQ/PjqJHtQGgH+fulLI04hfI3s1TtmS9qd1at/6WkzT+jvE5wnb+/1GBMNRe3J9N
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5579.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(39860400002)(136003)(396003)(346002)(8676002)(16576012)(26005)(8936002)(478600001)(956004)(53546011)(5660300002)(110136005)(2616005)(316002)(36756003)(6486002)(38100700002)(83380400001)(6666004)(31686004)(4326008)(186003)(2906002)(31696002)(86362001)(66556008)(66946007)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?gb2312?B?bDVhK1FBQUZ6dGFpdGJkZmhhQk9ENXk0cFVnbTFhYWRaM3NWVEVXcitPVDRE?=
 =?gb2312?B?YXVncHlVMHRML0hXM2YwdHltclBqek5ERm9iVmtZREtnVjRKNUlySjlnSXVH?=
 =?gb2312?B?blpxUzhoNGEzUE1RdjU3QzE3WXNRQno4bC8wcnIydENQb0dueExuUkVDcDlD?=
 =?gb2312?B?aEVoMmVISmplaXB0dzVjUkZDbGVFcVZscStSK1JTU0V4MTRuaTRHOUlTdVUz?=
 =?gb2312?B?U0xOeUpQRnRQb3JwN2pWeHROTFJvWFFscHN0eC9xQzhSYXRzd09MdG1taWNX?=
 =?gb2312?B?cHRZblRianN6Q1F1dXY0UmtmWTk1WjduRDlkOURqYkNNTjllYWgvajdOUmhu?=
 =?gb2312?B?NEtaZmwwcSttcGtYTmVFNXQwdG1KM25hTFRiQU5nTXJkd05DNzFtVUdhbnhP?=
 =?gb2312?B?eVFDVDQ4UVFjZ3J1bEFvbDY0TjNnRVVWc0N6MHhFQ1NiWVFFK3R1MGpnWUpZ?=
 =?gb2312?B?WHMrc2VBeklPZHh6L2kremlDR0x3WU9iamRJSTBRUEVrRS9Zb1orMGVHN2Za?=
 =?gb2312?B?M1JFNHhya1dFbERZS0dHeGpDODJOOEpibWwzZzNBcXo4M2dDdlZRc09obHZR?=
 =?gb2312?B?aUFpeXlQdEJJM0N6YWZta25QQzRhUHdNUktmaHRKcTBtVkN4cFJQSEc2YXZj?=
 =?gb2312?B?TnBxOHk1TU14UThJSm5xTlhNWW9KT0NraTRUQ0l1NFBUeC9hdDZSQnFCWkpa?=
 =?gb2312?B?bVlnSVN6WFZmWmhlSFdNTHE4ZUlBY2tDOTdabEJPUng1VGhlYVU5REJoMkdI?=
 =?gb2312?B?Z1VSdUIxL1BCditSUnA3RklxRVNYdUUyZWhWNWFtNGI0UFFSVDBTUFlWRHJG?=
 =?gb2312?B?K3RyYW93eHlJSXRDU2ZheEJRalFrZnRaTUpraEJ4VE9OdWNWVWt5RXNRd0RN?=
 =?gb2312?B?MFgrN0ZLZUJVTW1NTzcxUi83TGZIeE1TdjRiSGVtR1BmanY0L1ZxZXorL04v?=
 =?gb2312?B?QlBrYXBlRXcrVU15UFF6cVhXcGZ6YURnUDZudzRJbnpyRU92eW5jSlp3WWFZ?=
 =?gb2312?B?ZU0zRFpzbzEwWndCS0hPZVZSNFQ2em1RSXFEZ0V0NEtZN1pYUndRYjlmTjN0?=
 =?gb2312?B?azMwZzNHTUE1bG1ydHVTdW1kaFdlTldXZFJFeG5uNDM5Q1FVSHR0SCtqNjFl?=
 =?gb2312?B?bzgxWXoxMUxwbUYrcmdXdlU2UDNrUkd1QjUwcWlsdjlKd1RwRXAwczlmSkdO?=
 =?gb2312?B?OGZUYTBQZE1MM1RBTGl2QWk3WmFFM3BRU0lwK1pXS3BiTTl0VldRT0pGRjNh?=
 =?gb2312?B?N2NOdWZOVEdLSWNXcytjVnNjRGl1UU1ERzZHLzlUVTQxaVVkZEVIU3p4bG02?=
 =?gb2312?B?YTdhK0xud1BSdXI0dWZBUk81aHZPcjEzRDFXR3NHYmgzTkpYWFRtdkVqOUFB?=
 =?gb2312?B?TzVISEppTjJLWWtkeUlEUlhrcDd1TmhNazBramVBSGRFMXB1T3ppU1hWelZn?=
 =?gb2312?B?Rm53ZGJwYkpTbCtqdXYyeGhCM3NNdDB0TUpDVWtEcGJ3Y2tacm5CNHpLK0U3?=
 =?gb2312?B?cnkxbjlVSzZJeklaTXkweGRtR3BJQTRNc2Z2b2JoZFZFOEQyS2oyM2VUQWsr?=
 =?gb2312?B?Mk45N1F4Ym9zcVZ6KzVXeDBmeXlhWlBzSnFTQXJMZHY2NWF6NnFIYndsTWtM?=
 =?gb2312?B?Z2NHT1pzZzRMT2M3T2tLdFU2TEVpUlNFSG9hTUZQb3RSWWRHbklFMlN5N0pC?=
 =?gb2312?B?a3ZvU000Z09jTTVQaXZTckcxL2hSVHMvc2RIRS8wUXFDTElVcTJPL2NvVlI2?=
 =?gb2312?Q?EsAin/MD1+BMqTVaGF46t9IjvGZiUQmNseCcTaP?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a793169-17d1-4640-e692-08d961446d81
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5579.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2021 06:01:17.3521 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TKYrO7ou5RcLWwSwNhSThJy90PxcWeEy+YK+LnLrY2IMvwCRgkzKOBEd3+IU9XNMkRoPz/hFokUmZRXIhqJP6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5580
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.65; envelope-from=tao3.xu@intel.com;
 helo=mga03.intel.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, MIME_CHARSET_FARAWAY=2.45, MSGID_FROM_MTA_HEADER=0.001,
 NICE_REPLY_A=-3.71, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 8/16/2021 10:58 AM, Jason Wang wrote:
> 
> ÔÚ 2021/8/6 ÏÂÎç2:08, Tao Xu Ð´µÀ:
>> When COLO use only one vnet_hdr_support parameter between
>> COLO network filter(filter-mirror, filter-redirector or
>> filter-rewriter and colo-compare, packet will not be parsed
>> correctly. Acquire network driver related to COLO, if it is
>> nirtio-net, check vnet_hdr_support flag of COLO network filter
>> and colo-compare.
>>
>> Signed-off-by: Tao Xu <tao3.xu@intel.com>
>> Signed-off-by: Zhang Chen <chen.zhang@intel.com>
>> ---
>>    net/colo-compare.c    | 25 +++++++++++++++++++++++++
>>    net/colo.c            | 20 ++++++++++++++++++++
>>    net/colo.h            |  4 ++++
>>    net/filter-mirror.c   | 17 +++++++++++++++++
>>    net/filter-rewriter.c |  9 +++++++++
>>    5 files changed, 75 insertions(+)
>>
>> diff --git a/net/colo-compare.c b/net/colo-compare.c
>> index b100e7b51f..bc1cc951c0 100644
>> --- a/net/colo-compare.c
>> +++ b/net/colo-compare.c
>> @@ -838,6 +838,23 @@ static int compare_chr_can_read(void *opaque)
>>        return COMPARE_READ_LEN_MAX;
>>    }
>>    
>> +/* check vnet_hdr_support flag through COLO filter modules */
>> +static int colo_vnet_driver_check(void *opaque, QemuOpts *opts, Error **errp)
>> +{
>> +    const char *colo_obj_type;
>> +
>> +    colo_obj_type = qemu_opt_get(opts, "qom-type");
>> +
>> +    if (strcmp(colo_obj_type, "filter-mirror") == 0 ||
>> +        strcmp(colo_obj_type, "filter-redirector") == 0 ||
>> +        strcmp(colo_obj_type, "filter-rewriter") == 0) {
>> +        if (qemu_opt_get(opts, "vnet_hdr_support")) {
>> +            return 1;
>> +        }
>> +    }
>> +    return 0;
>> +}
>> +
>>    /*
>>     * Called from the main thread on the primary for packets
>>     * arriving over the socket from the primary.
>> @@ -1289,6 +1306,14 @@ static void colo_compare_complete(UserCreatable *uc, Error **errp)
>>            return;
>>        }
>>    
>> +    if (!s->vnet_hdr &&
>> +        qemu_opts_foreach(qemu_find_opts("object"),
>> +                          colo_vnet_driver_check, NULL, NULL)) {
>> +        error_setg(errp, "colo compare needs 'vnet_hdr_support' "
>> +                   "when colo filter modules work on virtio-net");
>> +        return;
>> +    }
> 
> 
> I wonder if we can detect virtio-net and apply vnet_hdr automatically.
> 
> Thanks
> 
For filter-mirror, filter-redirector and filter-rewriter, we can detect 
and add it automatically, because these netfilter is attached to netdev, 
for example,

     if (!s->vnet_hdr &&
         qemu_opts_foreach(qemu_find_opts("device"),
                          vnet_driver_check, nf->netdev_id, NULL)) {
         s->vnet_hdr = true.
     }


But for colo-compare, it isn't attached to netdev, only can check colo 
netfilter to check vnet_hdr_support. In this situation, if all netfilter 
vnet_hdr_support is missing, colo_vnet_driver_check() will return 0, it 
can't find vnet_hdr_support is missing.

So can we apply vnet_hdr automatically for filter-mirror, 
filter-redirector and filter-rewriter? And keep report error for 
colo-compare?

