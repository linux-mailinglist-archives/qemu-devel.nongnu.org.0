Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C13696BB654
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Mar 2023 15:41:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcSJ4-0008QK-IR; Wed, 15 Mar 2023 10:40:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>) id 1pcSIw-0008Pa-WA
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 10:40:39 -0400
Received: from mga07.intel.com ([134.134.136.100])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>) id 1pcSIu-0000FE-IZ
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 10:40:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678891236; x=1710427236; h=message-id:date:to:from:subject:
 content-transfer-encoding:mime-version;
 bh=gC0OjEe+yHUfPdnXcnDTQ9F3Z5oF9QAVCNadWMrLOcc=;
 b=GaFHI0Kf7qoLJowvT00orUoWlynPIyfchhOQv4Pt1avo6+jj/QCutIi+
 p4VYKLKOw1tSLOzkYKI1nJeUGutDo97bkQzrQpP5AngjTzRwNkSiRpz3u
 vWUy11Mfc38PLdcaWO0bUpC2lBa/wE3A3UWB5jmy5SpNK5TA0jpYXg1qr
 tAJLUyqk6plhA4Z0DcbOqpe5Wl8iVeKq+84bg2isyiJVq2uVTKfQ+WyPg
 lrAdPsKtw/Uqjab2mOfdZUeGXVz64guY3LTwDcj6Wfebf7aMmUGemfoo9
 5e0Eo9m6//OLUBeXmoZstZnkB5z/zrcFT1PMgT26PO/ky4RslMhtUOleO Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="402589132"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; d="scan'208";a="402589132"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2023 07:40:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="709704980"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; d="scan'208";a="709704980"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga008.jf.intel.com with ESMTP; 15 Mar 2023 07:40:32 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 15 Mar 2023 07:40:32 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 15 Mar 2023 07:40:32 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 15 Mar 2023 07:40:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CYCr3Od9fIQ94xOD0Cwee86pG7clpv/fSdGnbiVBNaS6qScd9fglXPv8s3+y/bhLBaEjF1fsuoE3+a9Of/qf1VTUZiB8myBFo/MDhwYxFvmiedwHzZXWQkJQsJgTd0aDznBi46UdeqQUFSjyEYmPuFqOP4XJppg4FiFm4Qdj9hFL0elJQjPTphidJ1jTj6rQ/eIoRUc+jJ97grT3Epil337OtrCoCIx6DqDUduxiLOksZq0NeXx0wkl32vfzfyrW/k7kAP7xV+X5gwEMSNGgbnuBeg7bpL3VeJJDmuHiNgbCq/rZjzM1ZcXEfc5wFnaFMBgtjrxk8xjgRley6UpKfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ddU/SdTHdp1qjTkVGu54MIzWf04vI7aR4J/Kdh0K4f4=;
 b=itdJn0hLTCsOD/tZV65l0BCKYB0WFmZMw3VWDKJgsidSi7mlJ0/qQv8gd6K/OMgkfeGck1gW32D1YZzZI4YZ1kKV2yXJgfW0lC+VnTTCThqI25q+cdIVSWSre/g81m++29t3mUwI6/IinWVQxc5C9V4C0C94mlB9DplpHYGEF/OBnWx5C5Pxx/o7gCBC03vzhnOUM0IzVet2QD7O3XG+OZnV1vhWlwufUH69m9JElhk4x42UNAqCCXQp4hERoIUcBRU3YEpDd9GQNaAX5KMynLZvlDLZGAUYfUCoQUFpG8Sg4bJFc3sypV/1nPrwa+KFqjU/lpCFDKBAr481nNsAcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4500.namprd11.prod.outlook.com (2603:10b6:a03:1c3::24)
 by SJ2PR11MB7618.namprd11.prod.outlook.com (2603:10b6:a03:4cb::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Wed, 15 Mar
 2023 14:40:25 +0000
Received: from BY5PR11MB4500.namprd11.prod.outlook.com
 ([fe80::68a4:ef95:6726:3fc5]) by BY5PR11MB4500.namprd11.prod.outlook.com
 ([fe80::68a4:ef95:6726:3fc5%4]) with mapi id 15.20.6178.026; Wed, 15 Mar 2023
 14:40:25 +0000
Message-ID: <60517f41-a5db-a907-03d1-545b69615a62@intel.com>
Date: Wed, 15 Mar 2023 22:40:17 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: <qemu-devel@nongnu.org>, <richard.henderson@linaro.org>
From: "Wu, Fei" <fei2.wu@intel.com>
Subject: Enable cross-page block chaining for user mode tcg
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR01CA0130.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::34) To BY5PR11MB4500.namprd11.prod.outlook.com
 (2603:10b6:a03:1c3::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4500:EE_|SJ2PR11MB7618:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fd16a42-c0b7-41d4-fdfd-08db2563360f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LBE4lvI0CZ1BhLULc6A2T0a4KC62KUmCydqt7I9f5lrZRFPri45yYXOnKakvKUynyRunXDsk6xcfAL6Je7ThQjF8WyaLICeN38gBrRhnmcastIIxz/pl4rhb6wzTvBFwRZJtodhG9KJISicn7npnW7cYphuqdaJq539sFQwPM37y6lCgNJSTxf9CKo2tzRrunaCcdyJrinsdCI/edrBzddIe1qN1A57mP/OeggwjHiePsc6L0/fXD8rVCyXXWzLudX8LX+JkM8MktYJm8VwgvC1aGM++bfTUvof1K71FasedIY95Q4Rbdeu3LIwTZU3xA2ZfBBXNd+ZQdJJf3ECUIURoaqQVz3zmVM/JoMqJ9FRCR1pW2a/txQSEg/6Q5mjFrcgFpw4UPGQx/IEzstnpEUGYfGozUHcm+EnzpTB9XruFOx1b0e2BkkORV3g0uproS+dIY690q7P70xudV65LmctA/EdR6O4FchUwrCuTi1kGD/RsGWqhehR5WT0uq+tvePsGlLN32HofPXv74oum24A8jPg59MIk2IgL4mi7eIMyq7ABQTbLYBFfwgBOyGZisZkUHvCQeJXJil6io2HT350pTrVPdKORE4MMZpl3w9LX2dBbphImcon8Wgjf/af+o8mPRa4surbdawnwc3u4MNgx2cTwVvm3fn0e3U8zmgAGtmbHsxy8xZjTPDuTvE7+/O1IK3gsgVrwV0XC92JvAp+/SObxjD1oLI1RZuXrWH0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4500.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(396003)(136003)(366004)(346002)(376002)(451199018)(31696002)(86362001)(316002)(36756003)(82960400001)(38100700002)(66946007)(41300700001)(66476007)(66556008)(8936002)(8676002)(478600001)(2906002)(2616005)(5660300002)(83380400001)(6486002)(6666004)(186003)(26005)(6512007)(6506007)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UU4rMGV4MlNiU01CTFVZaVJvMUJFQ1FYNlhRQlFMWjRiVG1qMXl2aTBRYkRT?=
 =?utf-8?B?Qlk5cjF2blNVSFFONHZZY01LcUhXVVFTVEx2Uk00Tm9reFlMdVN4UE1QQlR6?=
 =?utf-8?B?Z2daNEdUVEwzRWk2bXAyL1UyYk1VOEMzN243aGV4dXhJTStqbmNlTXVLYjZr?=
 =?utf-8?B?QWhNSFVkK2RuaDBQUXZNdUxVdFNwTkZzYUpUUkkzZWRuV2NCeW16bmk2dURR?=
 =?utf-8?B?UnlhOXQrVG13QlkvK29mVktwczNYcHBqbnVsVk1ndWVpblBlZHlQb3RybkNN?=
 =?utf-8?B?VUlRLzlBWnV2V2lmbC9MUVJMR3JjakZFbmxualEzczBzTTU1V083bGRhRHNE?=
 =?utf-8?B?cSt5MnhGMEE1czAwVjd1Z2JyMGU0SXRobTBHWWJ0RmIwdkc1NXNPRmg1cEVZ?=
 =?utf-8?B?elBHUGUxZlpOblVpekVmVk5aSTBpUUN1bkh6eElHMFJFbkhLTVhOVXFWZS9O?=
 =?utf-8?B?TE9HOVV5N1luUGZRbWtHN0FHZHg0VWxnWlNScUxzWlFKYWUzRGhKVXBmL3hr?=
 =?utf-8?B?aXlXMC9KM1QvZnRlZldqR28zak1aS1FXSTJnV1VnSXFvVGxvcDJScTZNemln?=
 =?utf-8?B?dVh5MjVJTWNEZVVHUTAzdlRyRmxZcFUvSjg4d1RZOEhlN1k5TmVWdFFiRnE4?=
 =?utf-8?B?Q2o4dGdtclBLRUFhdHJUd0plRmRnZmNJaUZ0c09TU0xEekxZd1RTdFo2YTF0?=
 =?utf-8?B?WUVBWmpwemM3RjlDYzczaTVIMjl3S3piL2NaTE1OQ3NzaTY0K0N0YktldUx2?=
 =?utf-8?B?d3NQdTdoOVJrbmdLRHpKbVZleVgzaE5seVJXRXFZencvQkNlcW85QWc1Q1VG?=
 =?utf-8?B?bEU4U2NlNGp5UXo0NmFvSURENXpZZWROM0dFSFc4OHpybTlVVVlRelBQb1F0?=
 =?utf-8?B?SGcwc3Q1T2UwNEJwYlg3dEdESThIVmZ1cHVwS2F5cHlRYURIcTVXUHVIOFg0?=
 =?utf-8?B?d0RFWEM2blh1Z1FIeksrRFM1aC85L2R2bGZmNHRRbVpkTUpDNmZsV0d3M2hw?=
 =?utf-8?B?aUszRjU2aEdVcjE0QzdydGk1SkRpVzc0MzlnSENZT09aRDRvSENqMVROMXdU?=
 =?utf-8?B?QmRYQkRlMG0yNnl0ejlOZ29YNGNQWVZ5aWd4anRLeUdYU3dhc0ZhQzByazJM?=
 =?utf-8?B?b0xLR1p4TUt4WVBRdDdyUHFDWmxrOS9IWHUzOFVlc0JEa2FzU284RElaaCtB?=
 =?utf-8?B?bEQ2a0JBNzlBLysrYmJyeWVmRXZrM2ZCK3FiWmFrQjdIdEV2STExeFdXUjJ5?=
 =?utf-8?B?bzg1b2hrMk1KRFM3RklRZHl4SXkzLzRNVHN4MHp2d0Rvei9LZm84eHJreTlQ?=
 =?utf-8?B?a3FDSlEza2UvUldhYW5zSVRlR0t6aUFtQnArOUtzdjBYN2NwZkJYYWF6allS?=
 =?utf-8?B?aUJtR3Ntc0o0dnlHMmQybDN6dkFOMFdYbERIbkd4aHh3aGp6MUhIaTBMMVRE?=
 =?utf-8?B?b2ZSTlZ6WXZ4eWFyV0pORXo5dzAxTHZwTzJRYWdwTVpZa3RNWmJxSGpBRWV4?=
 =?utf-8?B?S0plSnNVdm9YRFRBdXlUQjdpaDJBK1RDbjkvUWtneWJOZnJlK0liemVyaytQ?=
 =?utf-8?B?bVB6bExCcEVKQ09TNVJ2TlJNaG5oWkJVcllMcW45NVZodTB0aDQxbHdCQWtW?=
 =?utf-8?B?S0ZnTU1DWGw4YTlUMzh5NFFuTFhtUG54ZVdNR3hwNkgyNjhHbXJLVE9jeUJx?=
 =?utf-8?B?cUJHQjg1SmdoTUczWXdHbUZuN0s4T2hrWGl2bFJHT2hNeklieXhKdDZKRkFW?=
 =?utf-8?B?dS9WNkRpai9PRWtrUTZvQm5HV0d1dEY4SGZrUEJrcGhjYUx2TU9iMjlrNVlo?=
 =?utf-8?B?TmVOSlBpNFNSSGJ6TzFtdFpjRGdyRk85TWNkUFd5d05qVWxINVpKZS9MdkFH?=
 =?utf-8?B?UHNXZmU4Wnhad3k1UGoxTENFc0oxanowdmFNTVNFalVjWWhrc1JLNW1OV0wy?=
 =?utf-8?B?citwWDZLUXZydGNDdFhVWSt5blhZNFJZZUtnVDdaemhtZHhoZGdzWVdnREZn?=
 =?utf-8?B?WTlhK0VucEtXSHdqcC8rMlZaL1V6dEVUWWNSMUxPUXM3KzlNZFVJajJTL2l6?=
 =?utf-8?B?QkEvNlhpRXhsUWpQb3dUUlAvVGpIT0FoUVlzYWpmM0lyblZ3UzJiejRoZ29K?=
 =?utf-8?Q?eQCcSZG/o535jYVg+c7VnseiC?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fd16a42-c0b7-41d4-fdfd-08db2563360f
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4500.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2023 14:40:24.9876 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mZ+BNAA/JmmVWsrNuRto32/+AI32I2MEdezSE7ul/06/5xuAoL+bTklACSrA5EQJDpJzyqLWWHGRYIAe7Q6LDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7618
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.100; envelope-from=fei2.wu@intel.com;
 helo=mga07.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Block chaining is one of the key performance factors of tcg. Currently
tcg doesn't allow chaining across page boundary, an example can be found
in gen_goto_tb() in target/riscv/translate.c.

For user-mode tcg, it's possible to enable cross-page chaining with
careful attentions, assume there are chains like this:
    preceding page -> 1st page -> 2nd page
                      Nth page -> 2nd page

There are 2 situations to consider:
1. First page should not jump to 2nd page directly anymore, if there is
a new breakpoint added to 3rd page, otherwise the breakpoint might not
be hit. One method to address this problem is when receiving gdb
commands, call tb_flush() to invalidate all the TBs, and make sure each
TB can only contain single instruction later, no matter the new JIT-ed
TBs use chain or not, the tcg core loop always has the chance to check
if there is any breakpoint on each instruction. There could be other
methods, but current tcg has already done this.

2. The protection of 2nd page has changed by mprotect/munmap, e.g. from
executable (X) to non-executable (NX), it's an error if the 1st page
jumps to 2nd page without checking the new protection. The point here is
to invalidate TBs in 2nd page and unlink all the TBs which jumps to it,
including 1st page and others(Nth in above chart). This is already done
in page_set_flags(). A small testcase runs on user-mode guest:

        void *page = mmap(NULL, pagesize,
			  PROT_READ | PROT_WRITE | PROT_EXEC,
                          MAP_ANONYMOUS | MAP_PRIVATE, -1, 0);
        memcpy(page, func_add, pagesize);
        f = (FUNC)page;

	f(1, 1); // good
	mprotect(f, pagesize, PROT_READ | PROT_EXEC);
	f(1, 2); // good
	mprotect(f, pagesize, PROT_READ);
	f(1, 3); // segfault

So it looks like current tcg implementation is ready to enable
cross-page chaining for user-mode. Correct?

diff --git a/accel/tcg/translator.c b/accel/tcg/translator.c
index 7bda43ff61..822644c7a4 100644
--- a/accel/tcg/translator.c
+++ b/accel/tcg/translator.c
@@ -25,8 +25,12 @@ bool translator_use_goto_tb(DisasContextBase *db,
target_ulong dest)
         return false;
     }

+#ifdef CONFIG_USER_ONLY
+    return true;
+#else
     /* Check for the dest on the same page as the start of the TB.  */
     return ((db->pc_first ^ dest) & TARGET_PAGE_MASK) == 0;
+#endif
 }

 void translator_loop(CPUState *cpu, TranslationBlock *tb, int *max_insns,


Thanks,
Fei.

