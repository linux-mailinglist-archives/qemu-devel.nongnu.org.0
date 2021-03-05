Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC7032E44C
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 10:06:01 +0100 (CET)
Received: from localhost ([::1]:42616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lI6PI-0000rs-C7
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 04:06:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lI6Nd-0000MU-LK
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 04:04:17 -0500
Received: from mx2.suse.de ([195.135.220.15]:53802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lI6NZ-0000ty-Tf
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 04:04:17 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1152CAF47;
 Fri,  5 Mar 2021 09:04:12 +0000 (UTC)
Subject: Re: [RFC v1 00/38] arm cleanup experiment for kvm-only build
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20210221092449.7545-1-cfontana@suse.de>
 <875z2k53mn.fsf@linaro.org> <a3ed4064-6dec-24c6-8138-ce8301f01e1e@redhat.com>
 <63847c79-93c2-5ee3-d568-9091fedf325c@suse.de> <87a6rmkffo.fsf@linaro.org>
 <8d4a427a-94dd-7472-e8ae-98c4efa44ce0@suse.de>
 <CAFEAcA_eWrgo9CcLF3ZpAPeK08_PmKNLjqKAzuBPcSGh+1SFCA@mail.gmail.com>
 <5fb3cf49-fc09-7e7c-d34e-299f04e9842a@suse.de>
 <335966c3-9f31-5868-54e5-edb28a37c50c@suse.de>
 <a9190376-ba0b-02d5-124d-a336c586ad5d@linaro.org>
 <dabd15eb-109a-802a-6abc-3831d7b1c203@suse.de>
 <1b92cbea-8abf-40b9-337a-15f34ef40f61@linaro.org>
 <38f0a65d-b5e4-3795-03a3-d6b1b3346816@amsat.org>
 <CAFEAcA9q4vbyi85ZAYAfW-F-SCDNt=XScDkb78TN8MEO7VvbAA@mail.gmail.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <e3192d91-238d-1ce9-3a6b-5407a19466f1@suse.de>
Date: Fri, 5 Mar 2021 10:04:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9q4vbyi85ZAYAfW-F-SCDNt=XScDkb78TN8MEO7VvbAA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/4/21 8:24 PM, Peter Maydell wrote:
> On Thu, 4 Mar 2021 at 16:39, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> On 3/3/21 7:54 PM, Richard Henderson wrote:
>>> On 3/3/21 10:45 AM, Claudio Fontana wrote:
>>>> It is a bit weird that qemu-system-aarch64 runs with a cortex-a15
>>>> model tbh, as cortex-a15 is not capable of aarch64.
>>>
>>> No, but qemu-system-aarch64 is capable of 32-bit emulation (because most
>>> 64-bit cpus retain 32-bit mode).  It takes no extra effort to run
>>> cortex-a15 than it does a cortex-a57.
>>
>> IIRC qemu-system-arm starts the aa64 cores in 32-bit mode, while
> 
> ...no, it simply doesn't have them at all; it only has
> the 32-bit-only cores. We only support '64-bit core that
> starts in 32-bit mode' for KVM; it would be nice to have the
> TCG support for that but nobody's ever written it.
> 
>> qemu-system-aarch64 in 64-bit (this gave me trouble because the
>> kernels for the raspi 64-bit SoCs are in 32-bit mode -- because
>> the GPU starts them in this mode).
>>
>>> I have wondered if we should have just one qemu-system-arm that does it
>>> all and drop the separate qemu-system-aarch64 -- or vice versa.  But
>>> we've had the separation around so long I'm sure someone would be confused.
>>
>> That would be great cleanup IMHO.
> 
> I figure it's not really worth the bother until/unless we ever
> some day get to the holy grail of "one binary that supports
> multiple target architectures", at which point we could have
> one qemu-system for everything...
> 
> -- PMM
> 

"one small binary, with optionally pluggable modules for multiple target architectures and optional features" ?

Ciao,

Claudio









