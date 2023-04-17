Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F4E6E4925
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Apr 2023 15:02:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poOUl-00031e-8v; Mon, 17 Apr 2023 09:02:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>) id 1poOUf-0002pc-SK
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 09:02:08 -0400
Received: from mga02.intel.com ([134.134.136.20])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>) id 1poOUc-0005Wg-8t
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 09:02:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681736522; x=1713272522;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=oVtPwDcJi4Vfqhh6yg4YzHwlrDxkCSlRyptIlt8+goI=;
 b=Vk2ypM+8+NovLOfVWo3eBLC4O5YwW75n9y7NtVeeYrvYiRe6Ky+prRc1
 J24GCUD4owqvWT9DbcnbWdNBnu0MYxrOYaD3PhL0iTG1Yrjl6US2Mh2AV
 r5XNvaorNPiEmaHSL4zp9lucV568xRmfH0XglOMcrbqleCGe/FtvsK3p+
 EXd6smZK/VDTIaoFKAlBXKHwCFC18k7302YUM3ud3AtXxrJ61r9zrrxKi
 T/ICaSTRWal6ySedcvNusZ+FkMdy8IXdloAoQYG93LwRvDKtCu9j3RPa0
 lRx+b8uM/Rip5BSlp90bJCfD/65lvbE22B7QlaYb2TkBkP8PPleGLcl3x w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10682"; a="333680716"
X-IronPort-AV: E=Sophos;i="5.99,204,1677571200"; d="scan'208";a="333680716"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2023 06:01:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10682"; a="684151404"
X-IronPort-AV: E=Sophos;i="5.99,204,1677571200"; d="scan'208";a="684151404"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga007.jf.intel.com with ESMTP; 17 Apr 2023 06:01:45 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 17 Apr 2023 06:01:45 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 17 Apr 2023 06:01:45 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 17 Apr 2023 06:01:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WDetLIFX+r2AB/wsId9io+pSgbnWqDYKI0DqitjOZRju9hr3GnKGG8dCapjB+AgbdCJWSmIuVPzIECkQgTmjlaQMq6TBGuUqJFLT7ljhBTsODszKeaVutVLiJNPXPGwVc9Y7SfrBmLKiW9GigpwLXMQ6rArh5rfOHC08Y0nInT/C6ye/Jzgo1F5cjfIMHPV3wn/fQDC2fzwv/5Evv87aydfmiqYELXH4EXIarT6tSjW5TXiniU0gzZZMUoMXN8khez+aN7QwFJvlMrpyoaXiypAe4Mi70fT2NKi/npoSLS49R0fOO5LSEkiHvGvDcIKxku3np3QXAWz4PrpLbs/IyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sXFzT2x6iE5/GD4OsoOc0sR4dkZjvVwK56xtgkgEC8M=;
 b=ATVW5oQbaCRCJHQSHTRhWZFH58ysEvH3rzu1NSOZ0iyZ+bQSWo1ExyEyVXGETmQVSZkQaltg6lR8McH2LjN+qnvT+HAgGqa/Qomf8+sv9cVr7B1OGwStsasUv1iBJKHACZdNA2rpx+24N5FOcWL2qkQJlqN9SZ6Lygl6gYJaNzrjbnq3QAdaqAG+S6Oib+MdMwN91A8wA4DGnX+VxzmBiFY9rSKDDbMhKoVW1Sa2i4bobmsrUo1v4qvrWLTK4EQicfbszZrXShhOHFexGjvhqzqWOzs4Oq4JZJaSyELePAnCmfBWsSLx1qcguLzfMerMULCcPDytGn/g8zADkPngkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4500.namprd11.prod.outlook.com (2603:10b6:a03:1c3::24)
 by IA1PR11MB7367.namprd11.prod.outlook.com (2603:10b6:208:421::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Mon, 17 Apr
 2023 13:01:43 +0000
Received: from BY5PR11MB4500.namprd11.prod.outlook.com
 ([fe80::cf58:e1db:41d4:ee3f]) by BY5PR11MB4500.namprd11.prod.outlook.com
 ([fe80::cf58:e1db:41d4:ee3f%6]) with mapi id 15.20.6298.045; Mon, 17 Apr 2023
 13:01:43 +0000
Message-ID: <7eb6366d-c91d-c769-534d-383dfb11fe32@intel.com>
Date: Mon, 17 Apr 2023 21:01:34 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 1/2] accel/tcg/plugin: export host insn size
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
CC: Richard Henderson <richard.henderson@linaro.org>, <pbonzini@redhat.com>,
 <erdnaxe@crans.org>, <ma.mandourr@gmail.com>, <qemu-devel@nongnu.org>
References: <20230406022751.757980-1-fei2.wu@intel.com>
 <20230406022751.757980-2-fei2.wu@intel.com> <87v8i9jviv.fsf@linaro.org>
 <ce65c074-ff12-1f29-ee64-44fb7ff643c7@linaro.org> <87ttxoc8wq.fsf@linaro.org>
 <0f237ccb-dcbe-87c7-d9f2-653962d30520@intel.com> <87v8i2ri3w.fsf@linaro.org>
 <6ac7805f-8fc5-f598-258c-b0b55a1a35d6@intel.com> <87y1mqemd5.fsf@linaro.org>
From: "Wu, Fei" <fei2.wu@intel.com>
In-Reply-To: <87y1mqemd5.fsf@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR02CA0007.apcprd02.prod.outlook.com
 (2603:1096:3:17::19) To BY5PR11MB4500.namprd11.prod.outlook.com
 (2603:10b6:a03:1c3::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4500:EE_|IA1PR11MB7367:EE_
X-MS-Office365-Filtering-Correlation-Id: d7831b0b-ccb1-45a6-3a6d-08db3f43e460
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C9pAbTiZosz8ACvskYRmE5ZJsiiJog0MpTKzNvT/beA0sohPmOk13SIfUdf3u035XDJliXZWRUpD5V+biD+uVSmCXdVAEoB3F+QeWnnR6Ln0Q2KMNfESbnUIB2nKVkMDx/vY90qxUmRs70mzkuRtEH360QSBkbe5/PbhYiY5WJIliNTF8WpQD+jj4qV1zSORZvMm3KpwSdkPpSJ1oIRjm+RE0r1rAF/lrjHs24iwxwv+SnCYOWE0BVS//cdcI4rM2Taomt12XCGJMx8sJDoVBf3rKhOsgvsqoIINdtxOHxj3Gf85xN5KkOBW9rxz45d5WnUSxrFJU0fi1yKSXdcjReW6JyZHGEtOfW3UUpKo/6J8XJh6ULJQAanlYJ7VGSshyHI++hEIAScfkG6wtXQv2i9AmYfV7TsKHU+wyCM8mnJ37Uos3/7GGs6qaouJqayVqi/vtG5AXUeTzZ/Tch6/sy7jHx3m7sA6Xm3kV+sdVD/kEzPn7ibaF+4SdfqHW60Q9UU6+Xc8YXOpyS6bu9ik4lcb5y/Jk6kY06CjVyz5KmCsCSu0lZu1MKhX6s31dOxfn9gUmg6H9jJwR/2h0DFOd/HJfdbOCyQ7TZvWVPzsJkT3OFQqhI5pGuKZavq+VUKoVfRUBFwRswOk51QwDlfzgAxq4rgDNAlcq16uyeCcpL6F/IkEG99457evi3Pd/qvL
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4500.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(376002)(366004)(39860400002)(136003)(346002)(451199021)(36756003)(6916009)(4326008)(316002)(66556008)(66946007)(66476007)(966005)(6486002)(478600001)(6666004)(5660300002)(8936002)(8676002)(41300700001)(2906002)(86362001)(31696002)(82960400001)(38100700002)(2616005)(26005)(6512007)(6506007)(186003)(53546011)(83380400001)(66574015)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T0dVaFgwaUhmUzgrNE5XVWhOWm00R0c3ZXc1SzRWZFM3WFU1ODVLVUtxQTBC?=
 =?utf-8?B?TEhjRFNjTHU5eGdYOVQwY0dxRmc0ZUljY3RWcUdlMmNJY2NYMzdCV082V214?=
 =?utf-8?B?VWMyL0s1Ni9UYit5V2FabXJ2WHM4LzJDck5ZQy93UnRaZnk3bklhK09mRWlV?=
 =?utf-8?B?L1VGU1NxY2Vla0lwUGl4M1hMa2xFdk1vSlJQREFDbzJVWkZhdkxRcnV4TXlJ?=
 =?utf-8?B?cFRQbGsxSjRiL2h6M2JrdmFaOHVrdGhrV1B6RExFaWROQUd1R1hSR1BBZTdL?=
 =?utf-8?B?SkhmWGdhcmFaZjlHazZDUkx6a1Z3cDlDNFNyTjAyRGxLblZvUThNUWdZZWw1?=
 =?utf-8?B?aTZPVEg0akVVc1Rydm4zYWZ4b1k3UTVWNFdQc2xxeGRwdlFxS3NGN1ZxSmNp?=
 =?utf-8?B?Sk9rOVlDVDhvd01OQUZxTmtISk56eHNGOUc4b01kbEMrNkRVbDVPK01EdW8w?=
 =?utf-8?B?VkxKaGZOV2c3QmY5YWJucFhPZ1ZBb3dqaHhGK2w3NHB2WlEvMUFLNlZ0dC9R?=
 =?utf-8?B?Q0FXdmVmaWN4OHJqMFJNQktWejZhSGxzMFNXZUtYUElGTFhVSzNKVzQ0OXAx?=
 =?utf-8?B?SW5Fa2tsNjNVTmtBOEdBZHZnUFVHWXRYdUZYWXVSWXl6Lzl1VXZqNFNFOVY3?=
 =?utf-8?B?dDlCanBFNDNDdTBjRThnSDU2WlU2R1BiM2JWM3dKUXRGak5mUS9sWUUwZk5H?=
 =?utf-8?B?bnlOa2diQm85cWFSSnNEMmNSYUR5dW1VckRzY1FucjJjdkVXUkNHR0ZJd0I5?=
 =?utf-8?B?NERhM0NqYmVDUFRnS3RNVVFuS2h6VEpxT2J6dDN3MFNWZ1RZWVd4TktnK1U1?=
 =?utf-8?B?MkI2QndBeDdFVnNYbzdWUndkUlgrYVo1M1ZYUXNKeUJPVE95T1gxeExRc2JW?=
 =?utf-8?B?dUllMUMzdHBjazBZYmN2Rm8yWXVDOXp1aUJqbzRTcXA4QUF4S083dTdmZHVJ?=
 =?utf-8?B?ajJRQ3ZwSkpXYlZNYW53NEZITE1LbzNmU0tNeXBlUXJGczdIZmQ5a2NhbUJF?=
 =?utf-8?B?cElWRXppRkxMb25ORHVZTUdqbFd4MHcvV1R4Yldpd0hIam9nVytHSExGWlB0?=
 =?utf-8?B?U21QY2YrbmI0OXU0dTR2MEhwdjFiOWdISFVuMUlkNFptTkpiQTRQU2VycnpL?=
 =?utf-8?B?NGVRWkNWNGZVUTNkSURxbHcvMG9nVmRLYUg1V1M4SjZwWDBFOTdZTU15dFYy?=
 =?utf-8?B?akwyZEpxNUdUUFEzdjkxYmFBSkJwTHNTa2dUczZROVRjcm15S25BTjBPejRZ?=
 =?utf-8?B?a1hKNy9qeVZXcjVtWkZmR2VCbFl2SEs2ZkxWTHRXSFhHOEZWeFpKYzIwTWJ4?=
 =?utf-8?B?WHVmUGxGc2xiekl3NmxRMmxINm9pRm5IellmOFNpUEN2VzdFZVVUdktIYWFX?=
 =?utf-8?B?QlJLV0ZaZ3V4RWNlWWtNUC90SFVUZ1hsaHQzVXQrVms5RWpEV3oyNmlya1A3?=
 =?utf-8?B?TmhYemc1RFZiYUpISU5MM1BWNTVDUm9YMXQrR3dlemRjWGE5QUtPenVKa0pa?=
 =?utf-8?B?cENNUTZ4VlVUZ3pMQ0JJZ1RPdXNwbjlpQ1N1UHBDU2c3NVQ0NktCcVRCZnI0?=
 =?utf-8?B?Zk91RXFKbDVGbnBXeUR0dVpiT01jMDNwUEhaekt0K0xXVGpNVFdKUVFQVjRB?=
 =?utf-8?B?VU4zSVVBUTNnQ0E0aWJsU3EzdjgybUk4a1RXUkVoS1lTbmhnNVNQcllLZ1p1?=
 =?utf-8?B?a0c4Z0VRblhEN1BIWThqd1R1cHNzbjVUajdJUjVYOXpGM3BwTmRPbE9zZ3NX?=
 =?utf-8?B?TTIwTjVTdHNoMDRGNWpZOHIxWUxPVHZjcnZIc3lVTDhQS0JjZEtSWWpyZUhW?=
 =?utf-8?B?TjhlVGNhdmdYTFBITU1zUkUwbS9OMGJ1NzdrRUFJcUZHSG5HK2NWTEt5SWs2?=
 =?utf-8?B?N2E2U3lRUDBXNUN2OWlISGFDRnJLK1hkc2d0bGhJb3dWaDlwYkVQUzhmY0g5?=
 =?utf-8?B?NkNmNkUvM2NMcXNXcmF4bmZSc3l4T1FIS3B2aTdIb1dpS3hjUGI5U3RON0M1?=
 =?utf-8?B?NytPR1JNdlZaMG9ESXdUdTNkSGtWK2VpaUdPYVJnbCtaWmd6QWJXNXIrU3FH?=
 =?utf-8?B?YitmM2pqTUtHWWJ1TlA2S1IwNjcvTFRPdVl2bUp0bld1VzVLNDl4V2M1d004?=
 =?utf-8?Q?UamZUPFpia1nRKoft0R0Meyne?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d7831b0b-ccb1-45a6-3a6d-08db3f43e460
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4500.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2023 13:01:43.3192 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JqHLYO5yEUiFFgaSd+ltdGHvxhMuJf0lZpLGW7bDDcgtV6MrWA44aYBf7U6Nrxztt0mvDlFmOTUJZCoXWZEi8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7367
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.20; envelope-from=fei2.wu@intel.com;
 helo=mga02.intel.com
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.284, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 4/17/2023 8:11 PM, Alex Bennée wrote:
> 
> "Wu, Fei" <fei2.wu@intel.com> writes:
> 
>> On 4/11/2023 3:27 PM, Alex Bennée wrote:
>>>
>>> "Wu, Fei" <fei2.wu@intel.com> writes:
>>>
>>>> On 4/10/2023 6:36 PM, Alex Bennée wrote:
>>>>>
>>>>> Richard Henderson <richard.henderson@linaro.org> writes:
>>>>>
>>>>>> On 4/6/23 00:46, Alex Bennée wrote:
>>>>>>> If your aim is to examine JIT efficiency what is wrong with the current
>>>>>>> "info jit" that you can access via the HMP? Also I'm wondering if its
>>>>>>> time to remove the #ifdefs from CONFIG_PROFILER because I doubt the
>>>>>>> extra data it collects is that expensive.
>>>>>>> Richard, what do you think?
>>>>>>
>>>>>> What is it that you want from CONFIG_PROFILER that you can't get from perf?
>>>>>> I've been tempted to remove CONFIG_PROFILER entirely.
>>>>>
>>>>> I think perf is pretty good at getting the hot paths in the translator
>>>>> and pretty much all of the timer related stuff in CONFIG_PROFILER could
>>>>> be dropped. However some of the additional information about TCG ops
>>>>> usage and distribution is useful. That said last time I had a tilt at
>>>>> this on the back of a GSoC project:
>>>>>
>>>>>   Subject: [PATCH  v9 00/13] TCG code quality tracking and perf integration
>>>>>   Date: Mon,  7 Oct 2019 16:28:26 +0100
>>>>>   Message-Id: <20191007152839.30804-1-alex.bennee@linaro.org>
>>>>>
>>>>> The series ended up moving all the useful bits of CONFIG_PROFILER into
>>>>> tb stats which was dynamically controlled on a per TB basis. Now that
>>>>> the perf integration stuff was merged maybe there is a simpler series to
>>>>> be picked out of the remains?
>>>>>
>>>>> Fei Wu,
>>>>>
>>>>> Have you looked at the above series? Is that gathering the sort of
>>>>> things you need? Is this all in service of examining the translation
>>>>> quality of hot code?
>>>>>
>>>> Yes, it does have what I want, I suppose this wiki is for the series:
>>>>     https://wiki.qemu.org/Features/TCGCodeQuality
>>>
>>> Yes.
>>>
>>>>
>>>> btw, the archive seems broken and cannot show the whole series:
>>>>     https://www.mail-archive.com/qemu-devel@nongnu.org/msg650258.html
>>>
>>> I have a v10 branch here:
>>>
>>>   https://github.com/stsquad/qemu/tree/tcg/tbstats-and-perf-v10
>>>
>>> I think the top two patches can be dropped on a re-base as the JIT/perf
>>> integration is already merged. It might be a tricky re-base though.
>>> Depends on how much churn there has been in the tree since.
>>>
>> I have rebased the patches to upstream here:
>>     https://github.com/atwufei/qemu/tree/tbstats
>>
>> I try to keep the patches as possible as they are, but there are lots of
>> changes since then, so changes are inevitable, e.g. CF_NOCACHE has been
>> removed from upstream, I just removed its usage in the corresponding
>> patch, which might not be preferred.
> 
> Yeah that fine. CF_NOCACHE was removed to avoid special cases in the
> generation code - we simply don't link or store the TBs in the QHT
> anymore. As long as the guest isn't executing a lot of non-RAM code we
> won't run out of translation buffer too quickly.
> 
>>
>> I did some basic tests and they worked (the output of info goes to qemu
>> console, instead of telnet terminal), including:
>>     * tb_stats start
>>     * info tb-list
>>     * info tb 10
>>
>> Alex, would you please take a look?
> 
> That looks pretty good, glad it wasn't too painful a re-base.
> 
> The next question is do you want to pick up the series and put through a
> review cycle or two to get merged? It would probably be worth checking
> the last posting thread to see if their are any outstanding review
> comments.
> 
Yes, I can do it. I have something else in hand right now, so the review
request may be sent out in a few days.

Thanks,
Fei.

