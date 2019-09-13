Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 883B7B18F4
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Sep 2019 09:31:15 +0200 (CEST)
Received: from localhost ([::1]:40894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i8g30-0004UA-HD
	for lists+qemu-devel@lfdr.de; Fri, 13 Sep 2019 03:31:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34382)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <luc.michel@greensocs.com>) id 1i8fyw-0003dF-3P
 for qemu-devel@nongnu.org; Fri, 13 Sep 2019 03:27:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <luc.michel@greensocs.com>) id 1i8fyu-0005UU-W9
 for qemu-devel@nongnu.org; Fri, 13 Sep 2019 03:27:02 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:35120)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <luc.michel@greensocs.com>)
 id 1i8fyr-0005Rl-Si; Fri, 13 Sep 2019 03:26:58 -0400
Received: from [172.16.11.100] (tiramisu.bar.greensocs.com [172.16.11.100])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 8AEB896F52;
 Fri, 13 Sep 2019 07:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1568359615;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0EOHWVvRO5ck0my6R8sA23AG3urugwWFr7f28jlU3zg=;
 b=ofUXViYNc9+1qOur8yGnesAqCF0gXv8e/8T1YmqN/TqV6KF8E6scU11Yfo1VyFo9yfpISz
 hzx5U1gH+6K6Y/IakMv/+l67469r3nFZbfWNKFcL1fOVAWV4xujc8fJRuhVlpjVHexclMO
 OYTVfE8DNtJZ3X+gjExG4NqGumSVnyE=
To: Peter Maydell <peter.maydell@linaro.org>
References: <20190912110103.1417887-1-luc.michel@greensocs.com>
 <CAFEAcA-WO=O5zwRDQoNz2zT4sx61j8Jy5px0uFPiWgF_JUpa+A@mail.gmail.com>
From: Luc Michel <luc.michel@greensocs.com>
Message-ID: <204007b1-1c1e-432b-399f-b3784f812710@greensocs.com>
Date: Fri, 13 Sep 2019 09:26:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-WO=O5zwRDQoNz2zT4sx61j8Jy5px0uFPiWgF_JUpa+A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-PH
Content-Transfer-Encoding: 7bit
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com; 
 s=mail; t=1568359616;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0EOHWVvRO5ck0my6R8sA23AG3urugwWFr7f28jlU3zg=;
 b=Zd4YdRvvbCg01FufL2aWj8ycUP8pks4S1P8YznRsbJkjYNIgYivGlfCq+0iQJDt4H48Bsa
 oKOTFVz9GaZyNSYND9YL+x8DbK+keMnkD86pbTf1TRjMtNf3hgCLorpuMzc7VMngWQ6hwz
 v85dp88O3wy9wffZtFU4+txyrhhiuE4=
ARC-Seal: i=1; s=mail; d=greensocs.com; t=1568359616; a=rsa-sha256; cv=none;
 b=frexEyCCpKj99l1Ak4CaTpdLYQBD/Cry8kwwvhKGhvpuNmRp3JNGQf/IR1JUn3UgmSrDFs
 nzIuglNJ825TSO/SPI0ixH19zZqVo9rHaEyhf3hStGY/L4gLvUM4SEZiVVcyqSYirtpR+h
 10F4ONuJapiKDtmuMd8ieqVDcMvFb5U=
ARC-Authentication-Results: i=1; ORIGINATING;
 auth=pass smtp.auth=luc smtp.mailfrom=luc.michel@greensocs.com
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 5.135.226.135
Subject: Re: [Qemu-devel] [PATCH] target/arm: fix CBAR register for AArch64
 CPUs
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter,

On 9/12/19 6:03 PM, Peter Maydell wrote:
> On Thu, 12 Sep 2019 at 12:01, Luc Michel <luc.michel@greensocs.com> wrote:
>>
>> For AArch64 CPUs with a CBAR register, we have two views for it:
>>   - in AArch64 state, the CBAR_EL1 register (S3_1_C15_C3_0), returns the
>>     full 64 bits CBAR value
>>   - in AArch32 state, the CBAR register (cp15, opc1=1, CRn=15, CRm=3, opc2=0)
>>     returns a 32 bits view such that:
>>       CBAR = CBAR_EL1[31:18] 0..0 CBAR_EL1[43:32]
>>
>> This commit fixes the current implementation where:
>>   - CBAR_EL1 was returning the 32 bits view instead of the full 64 bits
>>     value,
>>   - CBAR was returning a truncated 32 bits version of the full 64 bits
>>     one, instead of the 32 bits view
>>   - CBAR was declared as cp15, opc1=4, CRn=15, CRm=0, opc2=0, which is
>>     the CBAR register found in the ARMv7 Cortex-Ax CPUs, but not in
>>     ARMv8 CPUs.
>>
>> Signed-off-by: Luc Michel <luc.michel@greensocs.com>
>> ---
>>  target/arm/helper.c | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/target/arm/helper.c b/target/arm/helper.c
>> index 507026c915..755aa18a2d 100644
>> --- a/target/arm/helper.c
>> +++ b/target/arm/helper.c
>> @@ -6740,12 +6740,12 @@ void register_cp_regs_for_features(ARMCPU *cpu)
>>              ARMCPRegInfo cbar_reginfo[] = {
>>                  { .name = "CBAR",
>>                    .type = ARM_CP_CONST,
>> -                  .cp = 15, .crn = 15, .crm = 0, .opc1 = 4, .opc2 = 0,
>> -                  .access = PL1_R, .resetvalue = cpu->reset_cbar },
>> +                  .cp = 15, .crn = 15, .crm = 3, .opc1 = 1, .opc2 = 0,
>> +                  .access = PL1_R, .resetvalue = cbar32 },
> 
> This will break the Cortex-A9 &c which use the 15/0/4/0 encoding
> and the un-rearranged value for this register.
I don't think so because we are in the "if (arm_feature(env,
ARM_FEATURE_AARCH64))" branch of the code. The else branch still maps
15/0/4/0 for non-AArch64 CPUs.

> 
> I think we need to check through the TRMs to confirm which CPUs use
> which format for the CBAR, and have a different feature bit for the
> newer format/sysreg encoding, so we can provide the right sysregs for
> the right cores.
I checked all the AArch64 Cortex's TRMs, for those having a PERIPHBASE
signal and CBAR register (namely Cortex-A53, 57, 72, 73), they all match
the mapping I put in this patch, so I think we don't need to split the
CBAR feature further. I believe more recent Cortex's address the GIC
using coprocessor registers, and CBAR does not exist in those ones.

-- 
Luc

> 
> thanks
> -- PMM
> 

