Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A883B582910
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 16:54:22 +0200 (CEST)
Received: from localhost ([::1]:42656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGiQX-0004sH-0h
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 10:54:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tobias.roehmel@rwth-aachen.de>)
 id 1oGfST-0003jt-Pe
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 07:44:09 -0400
Received: from mail-out-2a.itc.rwth-aachen.de ([2a00:8a60:1:e501::5:45]:53924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tobias.roehmel@rwth-aachen.de>)
 id 1oGfSO-00012p-8X
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 07:44:06 -0400
X-IPAS-Result: =?us-ascii?q?A2DeBgCuI+Fi/5sagoZaHgEBCxIMQIR0gVkDhEuQXS4Dg?=
 =?us-ascii?q?RObeoFoCwEBAQEBAQEBAQgBOQkEAQGFBgKEcyY4EwECBAEBAQEDAgMBAQEBA?=
 =?us-ascii?q?QEDAQEGAQEBAQEBBgSBHIUvOQ2GQwEBAQIBIw8BBTwFBQsLDgQIAiYCAkkOB?=
 =?us-ascii?q?gEMAQUCAQGCeQGCdSUTqi2BMYEBg08BhEyBXwYJAYEHLIdchzg3gVVEgRUng?=
 =?us-ascii?q?kw3PoQqg3CCZQScURwmBA4DGisvEoEfbAEIBAMDBwoFLgYCDBgUBAITElMWA?=
 =?us-ascii?q?hIFDxkOFBsiFwwPAxIDDwEHAgkQCBElCAIDCAMCAxsLAgMWBg4DHQgKGBIQE?=
 =?us-ascii?q?gIEERoLBgMWPgkCBA4DQAgOAxEEAw8YCRIIEAQGAzIMJQsDBQ8MAQYDBgUDA?=
 =?us-ascii?q?QMbAxQDBSQHAx8PIw0NBBgHHQMDBSUDAgIbBwICAwIGFQYCAk45CAQIBCsjD?=
 =?us-ascii?q?wUCBy8FBC8CHgQFBhEIAhYCBgQEBAQWAhAIAggnFwcTGBsZAQUyJxAJIRwKB?=
 =?us-ascii?q?BoKBgUGEwMgbQUKOw8oMzU8Kx8bCoESKisWAwQEAwIGGgMDIgIQLjEDFQYpE?=
 =?us-ascii?q?xItCSp3CQIDInEDAwQqLgMJPgcJJAEdnGCCBwGBDysggTAyDAU7GpImrlI0B?=
 =?us-ascii?q?4IWgT6BPgYMiVKUYQZAlmaSAZZ8II0YmXMCBAIEBQIWgXiBfjMaJIM4EQE+F?=
 =?us-ascii?q?wIPjiwWiGSFTHUBOAIGAQoBAQMJjwYBAQ?=
IronPort-Data: A9a23:qRhwXqPKtWDfXNzvrR3xlsFynXyQoLVcMsEvi/4bfWQNrUoi0WFUz
 2cZCGCPbPmLZ2X9fNx1Ydu/9UkDvcLWxtNlQXM5pCpnJ55oRWspJvzEdBuqb3PKRiHnZBg6h
 ynLQoCYdKjYdleF+lH1dOGJQUBUjclkfJKlYAL/En03FFQMpBsJ00o5wbZm2NEw2LBVPivU0
 T/Mi5yHULOa82MsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3ecldG0DFrrx8RYZWc
 c6elu3jrjOBl/saIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0o2HKJ0VKtZt9mGt/xL5
 9hT7Jq3cF5zZ5bOsd49UwFFAhgraMWq+JefSZS+mfas823rQz7XmbBESlspIY1d8+oxDWwmG
 f4wcWtRKEnY36TsnvTiF7QEascLdaEHOKsDvXthxCqfF/ErQZXOR43Q+sNYmT45jcBDG7DSa
 qL1bBI2M0mcP0USaj/7DrocvOKij1jBdARxuU2nlPEW4DP/1wVIhe2F3N39P4biqd9utl+Fp
 2nx437+AhQXMPSG1DuO83SnwOTImEvTQY8XCfi0++BnhHWVwWocDgBQUkG0ydGhh1KzQZRaI
 l0Y9y4qhawz8kWxSZ/6RRLQnZKflgQDR9pdA6ghskSHjLDL/wbcD2RCQjMphMEaifLajAcCj
 jeh9+4FzxQ22FFJYRpxLoupkA4=
IronPort-HdrOrdr: A9a23:1JtruaFMyEfD8axrpLqE38eALOsnbusQ8zAXP0AYc203TiXqra
 GTdZMgpHnJYVcqKRYdcL+7VZVoLUmskKKdpLNhWYtKPzOLhILLFutfBOLZqlWKJ8S9zJ8+6U
 4JSdkGNDSaNzZHZKjBgDVQX+xO/DHRm5rY/ts2mE0dNT1XVw==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.93,195,1654552800"; d="scan'208";a="17544058"
Received: from rwthex-s2-b.rwth-ad.de ([134.130.26.155])
 by mail-in-2a.itc.rwth-aachen.de with ESMTP; 27 Jul 2022 13:43:49 +0200
Received: from [IPV6:2a02:908:1088:5920:fe70:a0bd:d090:94f1]
 (2a02:908:1088:5920:fe70:a0bd:d090:94f1) by RWTHEX-S2-B.rwth-ad.de
 (2a00:8a60:1:e500::26:155) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.9; Wed, 27 Jul
 2022 13:43:48 +0200
Message-ID: <1bd12eb5-86fa-fe28-c07c-2b538156ece2@rwth-aachen.de>
Date: Wed, 27 Jul 2022 13:43:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 0/9] Add Cortex-R52
Content-Language: en-US
To: Tobias Roehmel <quic_trohmel@quicinc.com>, <qemu-devel@nongnu.org>
CC: <peter.maydell@linaro.org>
References: <20220718115433.802-1-quic_trohmel@quicinc.com>
From: Tobias Roehmel <tobias.roehmel@rwth-aachen.de>
In-Reply-To: <20220718115433.802-1-quic_trohmel@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [2a02:908:1088:5920:fe70:a0bd:d090:94f1]
X-ClientProxiedBy: rwthex-s1-b.rwth-ad.de (2a00:8a60:1:e500::26:153) To
 RWTHEX-S2-B.rwth-ad.de (2a00:8a60:1:e500::26:155)
Received-SPF: pass client-ip=2a00:8a60:1:e501::5:45;
 envelope-from=tobias.roehmel@rwth-aachen.de;
 helo=mail-out-2a.itc.rwth-aachen.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 27 Jul 2022 10:30:41 -0400
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

On 18.07.22 13:54, Tobias Roehmel wrote:

> v2:
> PATCH 1:
> I have left the flag in for now because there there is a lot of use for it in the MPU translation code.
> The PMSAv8r differs in quite a view ways from the implementation in the Cortex-M. I think using
> !ARM_FEATURE_M in all of those cases might run into problems down the road when new things are added.
> But I'll gladly change that if those concerns are not valid.
> PATCH 2:
> Patch was moved and I removed the ATCM... registers.
> PATCH 3:
> The issue here is that the R52 has the MPUIR register which shares the encoding with one of the
> MIDR alias registers. It's now changed to not add that register for ARM_FEATURE_V8_R.
> PATCH 4:
> Added RVBAR for all v8 CPUs instead of just ARMv8r
> PATCH 7:
> Instead of setting TTBCR_EAE to 1, change all functions that rely on that value and are
> relevant for Cortex-R52
> PATCH 10:
> SPSR_hyp changes removed
> PATCH 11:
> Removed the r52_machine. The issue with adding the Cortex-R52 to the virt board is that target_page.bits
> is expected to be 12 but is set to 10 for ARM_FEATURE_PMSA. Simply changing that or using
> virt2.7(which doesn't have that restriction) leads to problems with memory accesses. It might be
> best to model an existing board.
>
> These patches add the ARM Cortex-R52. The biggest addition is an implementation of the armv8-r MPU.
>
> All information is taken from:
> - ARM Cortex-R52 TRM revision r1p3
> - ARM Architecture Reference Manual Supplement
>      -ARMv8 for the ARMv8-R AArch32 architecture profile Version A.c
>
> Functionality that is not implemented:
> - Changing between single and double precision floats
> - Some hypervisor related functionality (HCR.T(R)VM,HADFSR,...)
>
> Tobias Röhmel (9):
>    target/arm: Add ARM_FEATURE_V8_R
>    target/arm: Don't add all MIDR aliases for Cortex-R
>    target/arm: Make RVBAR available for all ARMv8 CPUs
>    target/arm: Make stage_2_format for cache attributes optional
>    target/arm: Add ARMCacheAttrs to the signature of pmsav8_mpu_lookup
>    target/arm: Enable TTBCR_EAE for ARMv8-R AArch32
>    target/arm: Add PMSAv8r registers
>    target/arm: Add PMSAv8r functionality
>    target/arm: Add ARM Cortex-R52 cpu
>
>   target/arm/cpu.c          |   6 +-
>   target/arm/cpu.h          |  11 +++
>   target/arm/cpu_tcg.c      |  42 +++++++++
>   target/arm/debug_helper.c |   3 +-
>   target/arm/helper.c       | 183 +++++++++++++++++++++++++++++++++++-
>   target/arm/internals.h    |  16 ++--
>   target/arm/m_helper.c     |   3 +-
>   target/arm/ptw.c          | 191 ++++++++++++++++++++++++++++++++------
>   target/arm/tlb_helper.c   |   3 +-
>   9 files changed, 417 insertions(+), 41 deletions(-)
>
ping

https://patchew.org/QEMU/20220718115433.802-1-quic._5Ftrohmel@quicinc.com/
https://lore.kernel.org/qemu-devel/20220718115433.802-1-quic_trohmel@quicinc.com/

I didn't reply to the previous review, because I did what was suggested 
and summarized it here.
I hope that did break the etiquette.

BRs

Tobias


