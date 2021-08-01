Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF2E3DCCAD
	for <lists+qemu-devel@lfdr.de>; Sun,  1 Aug 2021 18:14:24 +0200 (CEST)
Received: from localhost ([::1]:48234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAE6Y-00050p-Ok
	for lists+qemu-devel@lfdr.de; Sun, 01 Aug 2021 12:14:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mAE5n-0004Lz-5v
 for qemu-devel@nongnu.org; Sun, 01 Aug 2021 12:13:35 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:51150
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mAE5l-0007lK-9K
 for qemu-devel@nongnu.org; Sun, 01 Aug 2021 12:13:34 -0400
Received: from host109-158-241-102.range109-158.btcentralplus.com
 ([109.158.241.102] helo=[192.168.50.176])
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mAE5V-0006Vx-A5; Sun, 01 Aug 2021 17:13:21 +0100
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210729004647.282017-1-richard.henderson@linaro.org>
 <20210729004647.282017-15-richard.henderson@linaro.org>
 <CAFEAcA8izWZrXSjQ5i-JB=YEtEYQODLi1fQdsf9GMrU7PyhHzw@mail.gmail.com>
 <563efaa1-6e18-75ac-7884-913ec045802f@ilande.co.uk>
 <CAFEAcA-LweAa6NjvvW7xWCcP9fEc4+GemENTAKPf=9qgHND-UQ@mail.gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <a7f326c8-4cfa-1438-9bab-446521c3c862@ilande.co.uk>
Date: Sun, 1 Aug 2021 17:13:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-LweAa6NjvvW7xWCcP9fEc4+GemENTAKPf=9qgHND-UQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 109.158.241.102
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH for-6.2 14/43] target/sparc: Set fault address in
 sparc_cpu_do_unaligned_access
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.08,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01/08/2021 16:59, Peter Maydell wrote:

> On Sun, 1 Aug 2021 at 16:56, Mark Cave-Ayland
> <mark.cave-ayland@ilande.co.uk> wrote:
>>
>> On 29/07/2021 15:51, Peter Maydell wrote:
>>
>>> On Thu, 29 Jul 2021 at 02:01, Richard Henderson
>>> <richard.henderson@linaro.org> wrote:
>>>>
>>>> We ought to have been recording the virtual address for reporting
>>>> to the guest trap handler.  Mirror the SFSR FIXME from the sparc64
>>>> version of get_physical_address_data.
>>>>
>>>> Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>>>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>>>> ---
>>>>    target/sparc/ldst_helper.c | 8 ++++++++
>>>>    1 file changed, 8 insertions(+)
>>>>
>>>> diff --git a/target/sparc/ldst_helper.c b/target/sparc/ldst_helper.c
>>>> index 974afea041..7367b48c8b 100644
>>>> --- a/target/sparc/ldst_helper.c
>>>> +++ b/target/sparc/ldst_helper.c
>>>> @@ -1963,6 +1963,14 @@ void QEMU_NORETURN sparc_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
>>>>        SPARCCPU *cpu = SPARC_CPU(cs);
>>>>        CPUSPARCState *env = &cpu->env;
>>>>
>>>> +#ifdef TARGET_SPARC64
>>>> +    /* FIXME: ASI field in SFSR must be set */
>>>> +    env->dmmu.sfsr = SFSR_VALID_BIT; /* Fault status register */
>>>> +    env->dmmu.sfar = addr;           /* Fault address register */
>>>> +#else
>>>> +    env->mmuregs[4] = addr;
>>>> +#endif
>>>> +
>>>>        cpu_raise_exception_ra(env, TT_UNALIGNED, retaddr);
>>>>    }
>>>>    #endif
>>>
>>> The architecture manual seems to be gratuitously opaque about
>>> whether and where the fault address for an alignment fault gets
>>> recorded, but Linux at least for 64-bit seems to pull it out of the
>>> sfar, so I guess that's right.
>>
>> Yeah, this part is actually contained within the UltraSPARC II specification - it can
>> be found in section 6.4 "MMU-Related Faults and Traps" table 6-3 which indicates that
>> for *_mem_address_not_aligned traps the D-SFSR and SFAR registers within the MMU are
>> updated.
> 
> Do you know what 32-bit CPUs do? The Linux kernel sources don't help
> here because they don't bother to report the fault address...

The SFSR and SFAR for the 32-bit sun4m machines is described in the Sun4m 
Architecture manual section 4.4 "Synchronous Fault Registers". Unaligned access 
behaviour isn't explicitly mentioned AFAICS but fault type 1 is "Invalid Address 
Error" which seems like a possibility.


ATB,

Mark.

