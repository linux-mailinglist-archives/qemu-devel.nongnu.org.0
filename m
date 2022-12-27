Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B2166567E2
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Dec 2022 08:36:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pA4U5-0000tz-JV; Tue, 27 Dec 2022 02:34:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tobias.roehmel@rwth-aachen.de>)
 id 1pA4Tr-0000r8-Vt
 for qemu-devel@nongnu.org; Tue, 27 Dec 2022 02:34:37 -0500
Received: from mail-out-4.itc.rwth-aachen.de ([2a00:8a60:1:e501::5:49])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tobias.roehmel@rwth-aachen.de>)
 id 1pA4Tl-0001Vw-HD
 for qemu-devel@nongnu.org; Tue, 27 Dec 2022 02:34:34 -0500
X-IPAS-Result: =?us-ascii?q?A2DeDwBDn6pj/5sagoZaHgEBCxIMQIFRhQoXAYQ2kHExn?=
 =?us-ascii?q?TqBfQ8BAQEBAQEBAQEIAUQEAQGFBQKFECY6BA0BAgQBAQEBAwIDAQEBAQEBA?=
 =?us-ascii?q?wEBBgEBAQEBAQYEgR2FL0aGVgEBAQEDIw8BBUEQCxUDAgImAgJXBg0BBQIBA?=
 =?us-ascii?q?YJ6gyOuY3qBMoEBoBiBJwkBgQotiQ6IFIJQgTwMgkA3PogbgmcEhByKR4o0C?=
 =?us-ascii?q?oE9fYEnDkgcJQQOAxkrHUACAQs7MgpBNQkCDEsrGhsHgQoqKBUDBAQDAgYTA?=
 =?us-ascii?q?yICDSgxFAQpEw0nJmsJAgMiYQUDAwQoLQlABxURJDwHVjcBBAMCDx83BgMJA?=
 =?us-ascii?q?wIfT3IuERUFAwsVKkcECDYFBhs2EgIIDxIPBiZEDkI3NhMGXAEqCw4TA1CBT?=
 =?us-ascii?q?wQvXoEJBikonQ2CLVpGAcNCB4IigU+gSwZBlwQGkhqXRqIVhUACBAIEBQIWg?=
 =?us-ascii?q?XwIgXNxgzZSFwIPnHF0OwIHAQoBAQMJgjqEDYRIAYETAQE?=
IronPort-Data: A9a23:VQTGgaiW9zu3QWtKPGinEH1LX161PxEKZh0ujC45NGQN5FlHY01je
 htvW2CBO6mIZWagedtzaNux80lS6sDUxoNkGgBprS40HihjpJueD7x1DKtR0wC6c5efFhI3t
 63yTvGacajYm1eF/k/F3oDJ9CU6j+fRLlbFILasEjhrQgN5QzsWhxtmmuoo6qZlmtHR7zml4
 LsemOWCfg77s9JIGjhMsfja8kkw5K2aVA4w5zTSW9ga5DcyqFFIVPrzFYnpR1PkT49dGPKNR
 uqr5NlVKUuAon/Bovv8+lrKWhViroz6ZGBiuVIKM0SWuSWukwRpukoNHKdGNR0H223hc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TEzutjT0QwHa8kveMuIDBf6
 +A0DCgAcUXW7w626OrTpuhEvPsfDOTbebhF/1sm1y7FDbMvTdbPTs0m5/cBh2t235sWW6yAI
 ZNENFKDbzyZC/FLEksQApM3h6GygXT/djBcgEiKuapy6mHYzAF3lrTgWDbQUoXUG5sLwRrE+
 woq+UzbWTsraf6cyQDb1WvzgNbArx32X60dQejQGvlCxQf7KnYoIAUbSVah5/ywm0KzX9Z3L
 00S8zAp668o+ySDV9T4Qli0rWCJujYaXNxfFfB87xuCopc4+C6DGXQEQy4Ec4ZjvoksWiAqk
 1aF2d/kbdByjICopbum3u/8hVuP1eI9dAfuuQdsodM53uTe
IronPort-HdrOrdr: A9a23:oiS8wKmORqWM17W+MePFj+WoZMvpDfIb3DAbv31ZSRFFG/Fxl6
 iV/MjzpiWE6gr5P0tQ/+xoWZPwJk80mqQZ3WB8B8bGYOCighrNEGgA1+ffKl/bcREWn9Q1vc
 xdmupFeb7N5DBB/L/HCWKDferIruPnzEnlv4jjJyAHd3AQV0g21XYANjqm
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.96,277,1665439200"; d="scan'208";a="166667445"
Received: from rwthex-s2-b.rwth-ad.de ([134.130.26.155])
 by mail-in-4.itc.rwth-aachen.de with ESMTP; 27 Dec 2022 08:34:20 +0100
Received: from [137.226.252.249] (137.226.252.249) by RWTHEX-S2-B.rwth-ad.de
 (2a00:8a60:1:e500::26:155) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.20; Tue, 27 Dec
 2022 08:34:19 +0100
Message-ID: <6f3ade73-b856-cac6-1881-52ddbe2e3010@rwth-aachen.de>
Date: Tue, 27 Dec 2022 08:34:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v6 0/7] Add ARM Cortex-R52 CPU
To: Peter Maydell <peter.maydell@linaro.org>
CC: <qemu-devel@nongnu.org>
References: <20221206102504.165775-1-tobias.roehmel@rwth-aachen.de>
 <CAFEAcA9AoyxpnCG2wBq1LOAZQ7=7i31TmgsuOW6bYkix==MbzA@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Tobias_R=c3=b6hmel?= <tobias.roehmel@rwth-aachen.de>
In-Reply-To: <CAFEAcA9AoyxpnCG2wBq1LOAZQ7=7i31TmgsuOW6bYkix==MbzA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [137.226.252.249]
X-ClientProxiedBy: rwthex-w2-b.rwth-ad.de (2a00:8a60:1:e500::26:159) To
 RWTHEX-S2-B.rwth-ad.de (2a00:8a60:1:e500::26:155)
Received-SPF: pass client-ip=2a00:8a60:1:e501::5:49;
 envelope-from=tobias.roehmel@rwth-aachen.de;
 helo=mail-out-4.itc.rwth-aachen.de
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.147,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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

Thanks for all the help, I learned a lot!

Best regards,

Tobias

On 19.12.22 18:05, Peter Maydell wrote:
> On Tue, 6 Dec 2022 at 10:25, <tobias.roehmel@rwth-aachen.de> wrote:
>> From: Tobias Röhmel <tobias.roehmel@rwth-aachen.de>
>>
>> Sorry for the "Reviewed-by" messup. I missed that on the explanation
>> page. Thanks again for the review :)
>>
>> v6:
>> patch 5:
>> - I also changed HPRENR from ARM_CP_ALIAS to ARM_CP_NO_RAW.
>>    Its state is also present in the HPRLAR registers,
>>    but it doesn't make sense to access it raw. (I think)
>> - I'm freeing the PRBAR/... strings explicitly now since
>>    I don't know how to use autofree in this setup correctly.
>>    Maybe {} around the part were the string is created/used,
>>    such that it is dropped at }?
>>
> Applied to target-arm.next; thanks for your efforts in getting
> this patchset through the code review process.
>
> -- PMM

