Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DEF36FA4C5
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 12:03:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pvxhb-0001Ph-7e; Mon, 08 May 2023 06:02:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>) id 1pvxhV-0001PH-Gd
 for qemu-devel@nongnu.org; Mon, 08 May 2023 06:02:38 -0400
Received: from mga05.intel.com ([192.55.52.43])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>) id 1pvxhS-0003rp-C0
 for qemu-devel@nongnu.org; Mon, 08 May 2023 06:02:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683540154; x=1715076154;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=h9t5NF5+T2vNaoZMkrCyRi2m6RreuWdPcsVZY8ticoQ=;
 b=gOt4YNQacPt5LLqmrDP1gIdtpOqUzq+1QB+4WRtwUcC/Kz028iralAIB
 JrkIVx0JHLA7s8fP367TkzxoD/Tq28i798gMzbDojd5XAOS+/QDPdcv/v
 uhzrwco4IanI9MnG7AkT5j24IgbqxK53+hN3Rm+d5mtP636lMbK/QK+DR
 t+ZQlDEF2cHfYu9DquMTdQikmMD1Dast/6NDwkZENJn/wH/BJaK/qb2zY
 n0ihsn4BshrqqQ51weNdhxUdrq7GNnGmU+6fBbFK3uwsk5G7Gmu5ycPWD
 ZuRzgbl+jydTFFB/I9tFij9+tErWrxkhbsWenWKTMX0bY4xbEMMUTInGp A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="435923256"
X-IronPort-AV: E=Sophos;i="5.99,258,1677571200"; d="scan'208";a="435923256"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2023 03:02:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="1028357444"
X-IronPort-AV: E=Sophos;i="5.99,258,1677571200"; d="scan'208";a="1028357444"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga005.fm.intel.com with ESMTP; 08 May 2023 03:02:31 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 8 May 2023 03:02:29 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 8 May 2023 03:02:29 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.170)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 8 May 2023 03:02:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cPf1bqMls93c4q43lvllWrRn0z9t19bEokakvejZlB2cO6wzMDrJzGvjDQO+Te9m2sbL0M9y+8q79Nl/DrpQ1hJ2Oi1q8zVGUL9t8+2S/NQtUrleKM5QCGdEDQOrBs1YJyeolsJ0amtBG0Ii9bn4kmHS8Ro1YhFgXUm8dPDT90x3XyfB2NvjybtQ3IQssHpUXqSJVgcmdykz47dtb3I0ikmAbfc1YFWMKXrsCBdrLN5npcXOlQExdwUM1IHii0Fz0od7tmVVsi3HHDQ8cyZmSU3pgY+543h5fCw5OS4/kMCvYfIHAq81EO54dvqPWZKfOwZxOKs0FwjDeW4vWF6chQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=koLGBN63i861BrG0cfknGrwkdoE/ctABn6kMv5VkNXU=;
 b=M2xgW/+/i8xcjmZgJpt9RdUu7C9NhwrgkMIZt8MXIQdvmVYchTIPuhCHza4GHoAjuaD9dRplo7YQuUCRPLpI+RZaYquiSiqqq0lR77pAzUuEXrxEEyQRRrPgI11BptyVYj16IdSJbdV2R206cQLX1N1t8l2D4U3etHXgWkgc5W8EyGje6Znr5o5KhYsC+zV9ZzSdmjByqkac5x4eaZTVTtvaiHjk+vTygHUVHej26rjJJXdDdUT38Awkmqgycvky9LiHqyb1jG7xe+nE7NCX59guiNVL/VCYQmyFSSPrbIBojkwP2eOjHHDZlAH3tIIA1/Agu9FyeqPMNw2HVMZQtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4500.namprd11.prod.outlook.com (2603:10b6:a03:1c3::24)
 by BY1PR11MB7983.namprd11.prod.outlook.com (2603:10b6:a03:52b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Mon, 8 May
 2023 10:02:28 +0000
Received: from BY5PR11MB4500.namprd11.prod.outlook.com
 ([fe80::6f32:84de:47b1:3bc2]) by BY5PR11MB4500.namprd11.prod.outlook.com
 ([fe80::6f32:84de:47b1:3bc2%5]) with mapi id 15.20.6363.032; Mon, 8 May 2023
 10:02:28 +0000
Message-ID: <d179f530-176f-3b4a-acaf-4fa77194f0e7@intel.com>
Date: Mon, 8 May 2023 18:02:20 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v11 02/14] accel: collecting TB execution count
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 <alex.bennee@linaro.org>, <qemu-devel@nongnu.org>
CC: "Vanderson M. do Rosario" <vandersonmr2@gmail.com>, Paolo Bonzini
 <pbonzini@redhat.com>
References: <20230421132421.1617479-1-fei2.wu@intel.com>
 <20230421132421.1617479-3-fei2.wu@intel.com>
 <a8b66b75-c698-6247-0cfe-c9438df570b8@linaro.org>
From: "Wu, Fei" <fei2.wu@intel.com>
In-Reply-To: <a8b66b75-c698-6247-0cfe-c9438df570b8@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SGAP274CA0007.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::19)
 To BY5PR11MB4500.namprd11.prod.outlook.com
 (2603:10b6:a03:1c3::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4500:EE_|BY1PR11MB7983:EE_
X-MS-Office365-Filtering-Correlation-Id: 97fafb3c-fda4-4889-f909-08db4fab547d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iBD6soEATYx3iplu8V571nw/x9Yko4+GRcpmdvY8df1MmC4KgNyeQs7s6miWtTDmoqlVqVU/055bBWh8ln1CxofFXS3ZmzSqWX+2bw1n1/lSQD+53M6K2kPVC3aAiXIwcnCR/QXNRUQ/Pb9GbM/v5usBdV+SzCyEaLg7YVmpi9ftrDkoZm7Ut8sgW8Fsa3jSgHCTes+YF6brSgQqw6Q1Cp3y4YQSiCM2kW+0OJzG7WyTAV2LWQ/jhBQMiL9hHzEOJ/zegvVFZ0fKKLFY+Kb5L8d2czlU4j/GBtkVFBRxU6OWZxeQVObE0euNTZlu22IesRS60hzDFkbLRSHINu1ENQra2GEiI/ltFEEbAQWeFhPYE1oY2CD7Qp/eEgPKXmk6w2lTRrTjsQ5XXA32J0VW1s9PIkZUNFfaFZVtwL3uOIm8x51LqfTwY2Nwtw5SCn6+NoXxjftXcmpq5pKeuTK3FZ6dr5B1xye01xXwM+8RtCC4CFuiuuNPhctlQcRw3dSTIG/iGwt7LtcEGhESmxbxXghXniOljUpR8kzSuZEO45VDi36SCXOnlUQdkfP/Q7ZbKclqAR/55bBTlv7IAMi2VAy+Q2d8HsRDuy4BbMDYb8iRUh0xZcrHeYkhAuU8ggYO9VoxuYWYZ4FGzBewxL70qQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4500.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(366004)(39860400002)(396003)(376002)(346002)(451199021)(83380400001)(66574015)(6486002)(478600001)(6666004)(54906003)(2616005)(6512007)(6506007)(26005)(53546011)(186003)(2906002)(38100700002)(36756003)(66946007)(82960400001)(66476007)(4326008)(66556008)(41300700001)(8676002)(8936002)(31696002)(86362001)(5660300002)(316002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bzhpOStET1prUHFCNmUrMy9zSGVQeHJkNXgzcUYveTVCemFibkxsb1RFeCsv?=
 =?utf-8?B?QThKdnROdkYrMENMbWREUkMzbXFEMEZrc0VvTndzbWZ6bE1tcUVBZUJuVWhs?=
 =?utf-8?B?Nlo2WGwzUGZiK0FXUUZXbnJObW14dUlUc0dvK3NraWN6K2wxRVNPK3NPTHI2?=
 =?utf-8?B?L3VwZTJrUmdSQlZLRGQwMWtqK0ljeUFCbU4ySkJ0TnRhQnh4QUhCOHB2WVgw?=
 =?utf-8?B?bW11Z2R6WFZKaFhoQ1pjcnFVR1FuUU16VkxiakJkeDdSaDROdlM2Z1dOMmJG?=
 =?utf-8?B?OUxmaFhLeFBqcTJ3ajV1Q2tsaVJMbWNLTWZHTmJXemdJbDA2UE9uSnlIbHJ3?=
 =?utf-8?B?UkVRRmVkRWdCclpXc3pFWCtMTFFJZXhTbGpGVURLZC9vTnBtVVAycFZnZXFG?=
 =?utf-8?B?Y05hTE9ocXdjMERXdnBicldZeHhnVDFuSWFadVN1Y2hSdm84Tzd1cVg5dHZ3?=
 =?utf-8?B?Y2xhMFhvRWcrRDRPblZaUkdWMjE4bUl1Y1RGMTJsbUpjbTYyQ1QvdG01NWhj?=
 =?utf-8?B?TVhvbElkeThoeVd5UnpHL2txNVpHVHF5Mk03dVdQVlFIQWxDakJZWm1hWG1h?=
 =?utf-8?B?NjJvYmxIaEF4elJES3NwYmhMZFZ4QzZYVnk3VDlSaGVvSXpDamxIUjF4V0cw?=
 =?utf-8?B?c2tZbkdtQWU4NVVsRDFoK1ZWOTlkNmZ4ak5WZjVjUU5QZlk5RnVoV2c3Z0xI?=
 =?utf-8?B?T0lhRHhDeVIrUlFmckVSNWlza2ZNVWcwV0RSdjd4T0xZNTJ5WW5lUjBjYTQw?=
 =?utf-8?B?aGZJNytTaTZsQ3NOUWJIRmZlRHhOZ00zRHR2eXlEN3BPSGVma0RKRlNRQXdB?=
 =?utf-8?B?MVc0ZUJGTmpJVFF0QmZOZThDZDBSN3lubHlzcklUVHBLbkw4cENET0UyUUNI?=
 =?utf-8?B?aVE4bURLa1AxK3g3RGZIS0M0VEVTQnpVa1F3akFFL3AxUUFWM0hmU2VhZ3dG?=
 =?utf-8?B?cjQyTmFWeDAzVmpJakVtaVQwNWdhaXo0b1lxQmJZWm81UE50RGQxejNXTSt5?=
 =?utf-8?B?ZEVVSU9TS2daYVlheVBRdDR0U0lNSms1UHdZT0FjSENjMDdIeE0vRko0L0pG?=
 =?utf-8?B?V3ZycDFtbWVvSWFtVXppYkl1L3BzZTF5aFM4V0hnK1A3NU11VzdRT1lLSmdn?=
 =?utf-8?B?QU8zTXBoSGx3aGhKaEFtaEVvL0hNZWlydmQ1Y0RGb2c5dFpGUlZreTZTWUo3?=
 =?utf-8?B?Uy96d3M3ZnJnMzQzMlVONUlyQTltN1pvV2h0NDhQWW1tUEdIeklSSlY1R3BX?=
 =?utf-8?B?VTg2d0pxUHZ1YTJpQUhKb0oxcWRVWkI3Yk5VUmVoWjltaGR0NFVlNXlZR1ZD?=
 =?utf-8?B?dFBqUFVsQWxRN0xOb1NlRTg4RkY5ZEVHWFJmVHNmSHhHbmhaMVhDcEUwdWlh?=
 =?utf-8?B?bjduOGVvN2oyM0gvVmZJNXpkdnpCUkVveWpwaDdwLzZ1QnRzSkFudHNEQmo1?=
 =?utf-8?B?QWhQN3Y3RkRTVmpJRGJxdzIrYW5tRWJuOGl6cmovWHZUbWN2eVpiejhzOWdx?=
 =?utf-8?B?ZjdGd2RIWWpjVVVaUjNacTZER29ubTAySTlTdDFXVDFpQWx0WmJDYmovYWpZ?=
 =?utf-8?B?bi9zV1pnbjR4b0VoSU5BdzlIeG1CT3JpNlkyZVhzTTRJbGZvMmJzSjl2Qk5w?=
 =?utf-8?B?bm9LUjNOd20yZHJidDE5TlkyQVpvTzBSSVhjQWoyUmJ3S1JJbWJnQWgzRzdl?=
 =?utf-8?B?dW5oaVdvRkxSQnI5YXQ1ajdSVEdDZGoyZlNWNmtETTJuZi9lUHBXNzNYMHdI?=
 =?utf-8?B?SERoVDlodXlxYnlsYlk2a3RtUm5zT0VQRXRzT3JxT0I5K0lnY0VhSXJBaENz?=
 =?utf-8?B?UXVCQkZMK1RkNS9EbklVLzlqaTMxOFRudTJxTkJnNEZLSEZteHlTTzAvSnhD?=
 =?utf-8?B?MTUwY0NLZ1N6MlJFRHh4Q0x0ZGNpZnEvb2dGRGJ6OHlvekpIZUs2bnIwTDFX?=
 =?utf-8?B?Wk12aUMwSW8zRnRnRVFQV0QwcEVReGZmT2dIMzB0SHhpdE1UbFlsZUo4RzNW?=
 =?utf-8?B?VGx4YUV5THNrQW1WSXBocTRxelpqdU5tUnhMYTROall4TUxXaFVTQ2tvU245?=
 =?utf-8?B?cGYrcWxzTHQ1M3dUNFdwRjJPK3k5WTBKRmV6eXcvN3pSZkxtWUdvVHJtMXVw?=
 =?utf-8?Q?M2r7vWDG6dIOFx2v8CA2IjGIl?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 97fafb3c-fda4-4889-f909-08db4fab547d
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4500.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2023 10:02:28.1512 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BnmkswMJlfcBM4TlWO9SGu1kz6jvNf8pycpaDpyOhQiqxxvMEa2GSRPBEY43L23e4EcjpID37d1CW36S7deTiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB7983
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.43; envelope-from=fei2.wu@intel.com;
 helo=mga05.intel.com
X-Spam_score_int: -73
X-Spam_score: -7.4
X-Spam_bar: -------
X-Spam_report: (-7.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.964, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 5/3/2023 4:28 PM, Richard Henderson wrote:
> On 4/21/23 14:24, Fei Wu wrote:
>> From: "Vanderson M. do Rosario" <vandersonmr2@gmail.com>
>>
>> If a TB has a TBS (TBStatistics) with the TB_EXEC_STATS
>> enabled, then we instrument the start code of this TB
>> to atomically count the number of times it is executed.
>> We count both the number of "normal" executions and atomic
>> executions of a TB.
>>
>> The execution count of the TB is stored in its respective
>> TBS.
>>
>> All TBStatistics are created by default with the flags from
>> default_tbstats_flag.
>>
>> Signed-off-by: Vanderson M. do Rosario <vandersonmr2@gmail.com>
>> Message-Id: <20190829173437.5926-3-vandersonmr2@gmail.com>
>> [AJB: Fix author]
>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>> ---
>>   accel/tcg/cpu-exec.c      |  6 ++++++
>>   accel/tcg/tb-stats.c      |  6 ++++++
>>   accel/tcg/tcg-runtime.c   |  8 ++++++++
>>   accel/tcg/tcg-runtime.h   |  2 ++
>>   accel/tcg/translate-all.c |  7 +++++--
>>   accel/tcg/translator.c    | 10 ++++++++++
>>   include/exec/gen-icount.h |  1 +
>>   include/exec/tb-stats.h   | 18 ++++++++++++++++++
>>   8 files changed, 56 insertions(+), 2 deletions(-)
>>
>> diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
>> index c815f2dbfd..d89f9fe493 100644
>> --- a/accel/tcg/cpu-exec.c
>> +++ b/accel/tcg/cpu-exec.c
>> @@ -25,6 +25,7 @@
>>   #include "trace.h"
>>   #include "disas/disas.h"
>>   #include "exec/exec-all.h"
>> +#include "exec/tb-stats.h"
>>   #include "tcg/tcg.h"
>>   #include "qemu/atomic.h"
>>   #include "qemu/rcu.h"
>> @@ -564,7 +565,12 @@ void cpu_exec_step_atomic(CPUState *cpu)
>>               mmap_unlock();
>>           }
>>   +        if (tb_stats_enabled(tb, TB_EXEC_STATS)) {
>> +            tb->tb_stats->executions.atomic++;
>> +        }
> 
> The write is protected by the exclusive lock, but the read might be
> accessible from the monitor, iiuc.  Which means you should use
> atomic_set(), for non-tearable write after non-atomic increment.
> 
The writes are serialized, 'atomic' is an aligned integer (unsigned
long), the read in parallel with write should not be a problem? It
returns the value either before increment or after, not part of.

>> @@ -148,3 +149,10 @@ void HELPER(exit_atomic)(CPUArchState *env)
>>   {
>>       cpu_loop_exit_atomic(env_cpu(env), GETPC());
>>   }
>> +
>> +void HELPER(inc_exec_freq)(void *ptr)
>> +{
>> +    TBStatistics *stats = (TBStatistics *) ptr;
>> +    tcg_debug_assert(stats);
>> +    qatomic_inc(&stats->executions.normal);
>> +}
> 
> Ug.  Do we really need an atomic update?
> 
> If we have multiple threads executing through the same TB, we'll get
> significant slow-down at the cost of not missing increments.  If we
> allow a non-atomic update, we'll get much less slow-down at the cost of
> missing a few increments.  But this is statistical only, so how much
> does it really matter?
> 
This sounds reasonable to me. Alex, what's your point here?

Richard, could you please review all this series? I just saw your
reviews on patch 01 and 02.

Thanks,
Fei.
> 
> r~


