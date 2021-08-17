Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE6263EEEE5
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 17:03:37 +0200 (CEST)
Received: from localhost ([::1]:41400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mG0cq-000237-As
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 11:03:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mG0YB-00008l-Kz; Tue, 17 Aug 2021 10:58:47 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:54178)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mG0Y9-0005QY-9P; Tue, 17 Aug 2021 10:58:47 -0400
Received: from [192.168.15.170] (unknown [195.68.53.70])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 2EAD721A87;
 Tue, 17 Aug 2021 14:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1629212322;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YCF5cdmZsNkTiaPdXgKsHaf6LD6QB9B555ShGMKcOyk=;
 b=2TLkY+JhY38h1LXG/WhmcAyilK+FR8omvvzoYCh51yjp3cCG8pND0ecS7k7IJD1DZtS8XD
 XJq41tJ+wqE/CKAZnMWkWZM6Rw2e3nbxIdvSbdFgXfIjw1FlU/h3IYi63U9lKQU0iLJeWc
 7g4ZnML/SwmKnOIR9uenNk+3Jj74uLE=
Subject: Re: [PATCH for-6.2 09/25] clock: Provide builtin multiplier/divider
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210812093356.1946-1-peter.maydell@linaro.org>
 <20210812093356.1946-10-peter.maydell@linaro.org>
 <37605028-f1c7-93d7-ce51-dc78f4ed8d8b@greensocs.com>
 <CAFEAcA9eU8h586eiK9dy_Jy7aDaeQzLC901SYf68FCi_LC+6GA@mail.gmail.com>
From: Damien Hedde <damien.hedde@greensocs.com>
Message-ID: <d8303168-9ea4-35ec-d530-2135782c99ea@greensocs.com>
Date: Tue, 17 Aug 2021 16:58:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9eU8h586eiK9dy_Jy7aDaeQzLC901SYf68FCi_LC+6GA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US-large
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.961,
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
Cc: Luc Michel <luc@lmichel.fr>, Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Joel Stanley <joel@jms.id.au>, Alexandre Iooss <erdnaxe@crans.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 8/17/21 12:46 PM, Peter Maydell wrote:
> On Tue, 17 Aug 2021 at 10:59, Damien Hedde <damien.hedde@greensocs.com> wrote:
>>
>>
>>
>> On 8/12/21 11:33 AM, Peter Maydell wrote:
> 
>>> +void clock_set_mul_div(Clock *clk, uint32_t multiplier, uint32_t divider)
>>> +{
>>> +    assert(divider != 0);
>>> +
>>> +    clk->multiplier = multiplier;
>>> +    clk->divider = divider;
>>> +}
>>> +
>>>  static void clock_initfn(Object *obj)
>>>  {
>>>      Clock *clk = CLOCK(obj);
>>>
>>> +    clk->multiplier = 1;
>>> +    clk->divider = 1;
>>> +
>>>      QLIST_INIT(&clk->children);
>>>  }
>>>
>>>
>>
>> Regarding migration, you made the vmstate_muldiv subsection optional. I
>> suppose it is to keep backward migration working in case of simple
>> mul=1,div=1 clocks.
> 
> Yes -- we only send the subsection if the mul,div are
> something other than 1,1; an inbound migration stream without
> the subsection then means "use 1,1".
> 
>> Do we need to ensure multiplier and divider fields are set to 1 upon
>> receiving a state if the vmstate_muldiv subsection is absent ? I
>> remember there are post_load() tricks to achieve that.
> 
> I was relying on "we set the default in clock_initfn()" (by analogy
> with being able to assume that fields in device state are at their
> reset values when an inbound migration happens, so if the migration
> doesn't set them then they stay at those reset values). But
> thinking about it a bit more I think you're right and we do have to
> have a pre_load function to set them to 1. Otherwise we would get
> wrong the case where a board/SoC/device sets a clock up on reset
> to have a non-1 multiplier, and then later the guest programs it to
> be 1, and then we migrate like that. (That is, the mul/div at point
> of migration will be the value-on-reset as set by the device etc
> code that created the clock, which might be different from what
> clock_initfn() set it to.)

Yes, I think we cannot expect the machine init or reset to keep all
clocks in div=1,mul=1 state.

> 
> So we need to add something like
> 
> static int clock_pre_load(void *opaque)
> {
>     Clock *clk = opaque;
>     /*
>      * The initial out-of-reset settings of the Clock might have been
>      * configured by the device to be different from what we set
>      * in clock_initfn(), so we must here set the default values to
>      * be used if they are not in the inbound migration state.
>      */
>     clk->multiplier = 1;
>     clk->divider = 1;
> }
> 

With this callback registered in the main vmsd section,
Reviewed-by: Damien Hedde <damien.hedde@greensocs.com>

Thanks,
--
Damien

