Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCBFF5666C4
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 11:49:43 +0200 (CEST)
Received: from localhost ([::1]:36292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8fBe-0004SQ-Vv
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 05:49:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o8f6l-0001s5-Bp; Tue, 05 Jul 2022 05:44:39 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:59904)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o8f6j-0006Gu-Ok; Tue, 05 Jul 2022 05:44:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xMgOnwWeI+9eKS3Uz4gIXVcbpnvZet6LOf8ZxI0XcOs=; b=TEuM8r1HFuGWWhPn284ntY5Aul
 Ldb/+ApYIMJiWYd67xWQPlKWec9aJicONks23anxg5fA3mBRFnb4wETEu1lb72d9QV5aO/FO3NjSJ
 OhooUDHh6Hr7Uiseu2EEs35adZYd2wp5vBPDjVvrLPIWC7yGqgqLQVkT1hPfxSxuHecSQewm21tGF
 txt93nr6uUDDF7Mxc2MWHwOaaOTWwVkg5e8eDWDSKHW+HHR304BFo4so4X78v78xFEUOgKipMq0S1
 hx4NugpEt4+XbPudQP4NljBrnHaXq6erP86Ebdbl3q8ZUG3R2lyza7mi2Sn6Cmv9tdPTy6wrBVkye
 hAPEZBA1475e7I8i5QwPlzRvEHZnfzwgYcRi++Apfu3Ct24eNEJ1Sn3X58O2eIjHD+5cHWzkxu4Ef
 q++kufxPEog3GBg9bZN995TjdVNI9v+vTKhCV1XE7yzKjXLBsR4X5+I5i8BQTMyr8PC4jPvhmzcW6
 Do+GK+hM1XbhbnC4KTPSXQj7Yu3dR0cmLSeQCOHvIi31DZg9+bhIMkVl7Bks/LGmM2HkJq6u2pcAJ
 81vZJZODuftovTzmmD5jyHzttYDIca5eDX3ioAJCZA4rA4Kuv9a+JqNsWtBR44Tf6wgddMxEvku+9
 eLQPHCnNpPR2whxfimouknbAjOdxH2By5Pj6pHTaw=;
Received: from [2a00:23c4:8ba5:df00:fd7d:1c3a:1dd0:c576]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o8f5R-000CWP-Uh; Tue, 05 Jul 2022 10:43:18 +0100
Message-ID: <14dfc11a-bd4c-5d80-4e18-3153a6dced77@ilande.co.uk>
Date: Tue, 5 Jul 2022 10:44:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org
References: <20220630194249.886747-1-danielhb413@gmail.com>
 <20220630194249.886747-3-danielhb413@gmail.com>
 <55014e2a-a668-4843-8338-850abeb5ff04@kaod.org>
 <47277f4f-a6a5-85dc-4806-67df8e2fc153@gmail.com>
 <6d37b1dc-5dfb-2513-f74e-3f58e84e8117@kaod.org>
 <1d2cd44f-fd61-4693-ecc0-f71c80131005@ilande.co.uk>
 <38468531-5eb0-a421-f90f-2a3c67222d40@gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <38468531-5eb0-a421-f90f-2a3c67222d40@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba5:df00:fd7d:1c3a:1dd0:c576
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 2/9] target/ppc: add errp to kvmppc_read_int_cpu_dt()
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05/07/2022 10:39, Daniel Henrique Barboza wrote:

> On 7/5/22 03:51, Mark Cave-Ayland wrote:
>> On 04/07/2022 18:34, Cédric Le Goater wrote:
>>
>>> On 7/2/22 15:34, Daniel Henrique Barboza wrote:
>>>>
>>>>
>>>> On 7/2/22 03:24, Cédric Le Goater wrote:
>>>>> On 6/30/22 21:42, Daniel Henrique Barboza wrote:
>>>>>> The function can't just return 0 whether an error happened and call it a
>>>>>> day. We must provide a way of letting callers know if the zero return is
>>>>>> legitimate or due to an error.
>>>>>>
>>>>>> Add an Error pointer to kvmppc_read_int_cpu_dt() that will be filled
>>>>>> with an appropriate error, if one occurs. Callers are then free to pass
>>>>>> an Error pointer and handle it.
>>>>>>
>>>>>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>>>>>> ---
>>>>>>   target/ppc/kvm.c | 16 +++++++++-------
>>>>>>   1 file changed, 9 insertions(+), 7 deletions(-)
>>>>>>
>>>>>> diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
>>>>>> index 109823136d..bc17437097 100644
>>>>>> --- a/target/ppc/kvm.c
>>>>>> +++ b/target/ppc/kvm.c
>>>>>> @@ -1925,15 +1925,17 @@ static uint64_t kvmppc_read_int_dt(const char *filename)
>>>>>>   /*
>>>>>>    * Read a CPU node property from the host device tree that's a single
>>>>>> - * integer (32-bit or 64-bit).  Returns 0 if anything goes wrong
>>>>>> - * (can't find or open the property, or doesn't understand the format)
>>>>>> + * integer (32-bit or 64-bit).  Returns 0 and set errp if anything goes
>>>>>> + * wrong (can't find or open the property, or doesn't understand the
>>>>>> + * format)
>>>>>>    */
>>>>>> -static uint64_t kvmppc_read_int_cpu_dt(const char *propname)
>>>>>> +static uint64_t kvmppc_read_int_cpu_dt(const char *propname, Error **errp)
>>>>>>   {
>>>>>>       char buf[PATH_MAX], *tmp;
>>>>>>       uint64_t val;
>>>>>>       if (kvmppc_find_cpu_dt(buf, sizeof(buf))) {
>>>>>> +        error_setg(errp, "Failed to read CPU property %s", propname);
>>>>>>           return 0;
>>>>>>       }
>>>>>> @@ -1946,12 +1948,12 @@ static uint64_t kvmppc_read_int_cpu_dt(const char 
>>>>>> *propname)
>>>>>>   uint64_t kvmppc_get_clockfreq(void)
>>>>>>   {
>>>>>> -    return kvmppc_read_int_cpu_dt("clock-frequency");
>>>>>> +    return kvmppc_read_int_cpu_dt("clock-frequency", NULL);
>>>>>
>>>>>
>>>>> This should be fatal. no ?
>>>>
>>>>
>>>> I'm not sure. I went under the assumption that there might be some weird
>>>> condition where 'clock-frequency' might be missing from the DT, and this
>>>> is why we're not exiting out immediately.
>>>>
>>>> That said, the advantage of turning this into fatal is that we won't need
>>>> all the other patches that handles error on this function. We're going to
>>>> assume that if 'clock-frequency' is missing then we can't boot. I'm okay
>>>> with that.
>>>
>>> I think so. Some machines behave badly when 'clock-frequency' is bogus,
>>> division by zero, no console, etc. We could check easily with pseries
>>> which is the only KVM PPC platform.
>>
>> Well not quite true ;)  I haven't tested it during the last release cycle, but the 
>> Mac machines were still working fine to boot OS X with KVM-PR on my G4 Mac Mini 
>> last time I checked.
> 
> 
> We can't just error_fatal by default then.
> 
> Each machine should be able to determine how to handle this missing DT
> element. If I want to error_fatal for pseries then I can do so in patch
> 9/9, but other than that I'll keep the existing behavior.

This wouldn't be a problem for the Mac machines since they pass the clock frequency 
from QEMU to OpenBIOS using the fw_cfg interface which builds the tree itself rather 
than using FDT. So I think using error_fatal should still be fine.


ATB,

Mark.

