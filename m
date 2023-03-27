Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 686D86CA91D
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 17:35:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgorB-0001kZ-2Z; Mon, 27 Mar 2023 11:34:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minhquangbui99@gmail.com>)
 id 1pgor9-0001kQ-F7
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 11:33:59 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minhquangbui99@gmail.com>)
 id 1pgor7-0000Gu-J8
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 11:33:59 -0400
Received: by mail-pf1-x432.google.com with SMTP id y2so5940849pfw.9
 for <qemu-devel@nongnu.org>; Mon, 27 Mar 2023 08:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679931235;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BunCQZSRaviaWAE/dJiQkVyM0eHaku9I3L8mtadQp+U=;
 b=W5nuyOx7MQyRnL5UNhg1t5uMoc6XttDAtGTAvM3rRlFvYQvFNpDOmWhyKIFNsC21Dx
 si0cSX+PRSlJOKmc90Lvc6Oqh2K1Dh1GxgomBsIfDgE7+NyFeqimWlag7SK5hVcOMJfd
 26G9fKrI+baNGAC3X+GOxP1hmERcNKUvTuTLZEqpBUfsXSL697Y7QxjjK0dF6K2rTwBT
 SSWFu/ttecOuCq2nshl4wVKGfYrdDJN99mEsgBuFT9kyKpPWPkpkqScF2k0NbKNCczem
 U/M1cWQBNSZJdfDCOLCpp9i20LfIUzLhrOxbIzYZb/sy+QEghnt3UCPk39EhyE9i0+2d
 bZ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679931235;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BunCQZSRaviaWAE/dJiQkVyM0eHaku9I3L8mtadQp+U=;
 b=RXyq16K/v1314pgAeZnBSK7Vfgk4YpexNsnrmip2PgaOWTS4xL0fhT07iVyqyS6EnE
 nEEV50H0CCR/X63zHDzQvYWlv1mPdhVyc0KwGU6oxiUOx5VYDYJEIsVLjflIUPXQbUZq
 fs73R56H4sJhj18PeQZQs8CqZKhL6FfwMyLPhVVKBMAw2c9Y9ar5D8sfAm/fmviWnuZl
 v+uXjyP5XcoUJd8SuEBoYvFRXA3S9iqBK0pkxamksHe2HxFJLRFQjtT2JKlA9qXq3dxZ
 /hCgNxOUyK4Uo3aiEQcbBGRWS9GiOs1AOpT4ALtYURQPdpxXytiA1f/cnitpklAqv9fN
 eH1Q==
X-Gm-Message-State: AAQBX9fTfkkP/Fi+i8NoFiI99Z5RqjbBamEd+BYTGyeGy71LUwn8NRKw
 hi+ze3CrK4ZxjE6XIzWRRsk=
X-Google-Smtp-Source: AKy350Yn1cvauW7LfkfXhlDHvvtDLYXvscMI9dIZzcgQWl+loO6Hhg5pBRhLvuhqz+3HLTaMZHSGhg==
X-Received: by 2002:a62:1948:0:b0:627:f740:51f9 with SMTP id
 69-20020a621948000000b00627f74051f9mr11749137pfz.3.1679931235236; 
 Mon, 27 Mar 2023 08:33:55 -0700 (PDT)
Received: from [192.168.0.115] ([113.173.97.170])
 by smtp.gmail.com with ESMTPSA id
 d9-20020aa78e49000000b005cd81a74821sm15467117pfr.152.2023.03.27.08.33.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Mar 2023 08:33:54 -0700 (PDT)
Message-ID: <05d55576-f703-18a1-7f9f-4c15b8c54490@gmail.com>
Date: Mon, 27 Mar 2023 22:33:48 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 2/5] apic: add support for x2APIC mode
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, "Michael S . Tsirkin"
 <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <20230326052039.33717-1-minhquangbui99@gmail.com>
 <20230326052039.33717-3-minhquangbui99@gmail.com>
 <a8ea36d901a1b713ab8bc0f5bcd1b7d26ad6f9cb.camel@infradead.org>
Content-Language: en-US
From: Bui Quang Minh <minhquangbui99@gmail.com>
In-Reply-To: <a8ea36d901a1b713ab8bc0f5bcd1b7d26ad6f9cb.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=minhquangbui99@gmail.com; helo=mail-pf1-x432.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 3/27/23 18:04, David Woodhouse wrote:
> On Sun, 2023-03-26 at 12:20 +0700, Bui Quang Minh wrote:
>> This commit extends the APIC ID to 32-bit long and remove the 255 max APIC
>> ID limit in userspace APIC. The array that manages local APICs is now
>> dynamically allocated based on the max APIC ID of created x86 machine.
>> Also, new x2APIC IPI destination determination scheme, self IPI and x2APIC
>> mode register access are supported.
>>
>> Signed-off-by: Bui Quang Minh <minhquangbui99@gmail.com>
>> ---
>>   hw/i386/x86.c                   |   8 +-
>>   hw/intc/apic.c                  | 229 +++++++++++++++++++++++---------
>>   hw/intc/apic_common.c           |   8 +-
>>   include/hw/i386/apic.h          |   3 +-
>>   include/hw/i386/apic_internal.h |   2 +-
>>   5 files changed, 184 insertions(+), 66 deletions(-)
>>
>> diff --git a/hw/i386/x86.c b/hw/i386/x86.c
>> index a88a126123..fa9b15190d 100644
>> --- a/hw/i386/x86.c
>> +++ b/hw/i386/x86.c
>> @@ -132,11 +132,11 @@ void x86_cpus_init(X86MachineState *x86ms, int default_cpu_version)
>>        * Can we support APIC ID 255 or higher?
>>        *
>>        * Under Xen: yes.
>> -     * With userspace emulated lapic: no
>> +     * With userspace emulated lapic: yes.
> 
> Are you making this unconditional? It shall not be possible to emulate
> a CPU *without* X2APIC?

You are right, this should report error when APIC ID is higher than 255 
and x2APIC is not supported by the CPU.

> 
>>        * With KVM's in-kernel lapic: only if X2APIC API is enabled.
>>        */
>>       if (x86ms->apic_id_limit > 255 && !xen_enabled() &&
>> -        (!kvm_irqchip_in_kernel() || !kvm_enable_x2apic())) {
>> +        kvm_irqchip_in_kernel() && !kvm_enable_x2apic()) {
>>           error_report("current -smp configuration requires kernel "
>>                        "irqchip and X2APIC API support.");
>>           exit(EXIT_FAILURE);
> ...
>> @@ -276,16 +288,17 @@ static void apic_bus_deliver(const uint32_t *deliver_bitmask,
>>                    apic_set_irq(apic_iter, vector_num, trigger_mode) );
>>   }
>>   
>> -void apic_deliver_irq(uint8_t dest, uint8_t dest_mode, uint8_t delivery_mode,
>> +void apic_deliver_irq(uint32_t dest, uint8_t dest_mode, uint8_t delivery_mode,
>>                         uint8_t vector_num, uint8_t trigger_mode)
> 
> We can make this 'static' while we're here. It isn't actually called
> from anywhere else, is it?

I'll fix it in the next version.

>>   
>>   static void apic_get_delivery_bitmask(uint32_t *deliver_bitmask,
>> -                                      uint8_t dest, uint8_t dest_mode)
>> +                                      uint32_t dest, uint8_t dest_mode)
>>   {
>>       APICCommonState *apic_iter;
>>       int i;
>>   
>> +    memset(deliver_bitmask, 0x00, max_apic_words * sizeof(uint32_t));
>> +
>> +    /* x2APIC broadcast id for both physical and logical (cluster) mode */
>> +    if (dest == 0xffffffff) {
>> +        apic_get_broadcast_bitmask(deliver_bitmask, true);
>> +        return;
>> +    }
>> +
>>       if (dest_mode == 0) {
> 
> Might be nice to have a constant for DEST_MODE_PHYS vs.
> DEST_MODE_LOGICAL to make this clearer?

I'll fix it in the next version.

>> +        apic_find_dest(deliver_bitmask, dest);
>> +        /* Broadcast to xAPIC mode apics */
>>           if (dest == 0xff) {
>> -            memset(deliver_bitmask, 0xff, MAX_APIC_WORDS * sizeof(uint32_t));
>> -        } else {
>> -            int idx = apic_find_dest(dest);
>> -            memset(deliver_bitmask, 0x00, MAX_APIC_WORDS * sizeof(uint32_t));
>> -            if (idx >= 0)
>> -                apic_set_bit(deliver_bitmask, idx);
>> +            apic_get_broadcast_bitmask(deliver_bitmask, false);
> 
> 
> Hrm... aren't you still interpreting destination 0x000000FF as
> broadcast even for X2APIC mode? Or am I misreading this?

In case the destination is 0xFF, the IPI will be delivered to CPU has 
APIC ID 0xFF if it is in x2APIC mode, and it will be delivered to all 
CPUs that are in xAPIC mode. In case the destination is 0xFFFFFFFF, the 
IPI is delivered to all CPUs that are in x2APIC mode. I've created 
apic_get_broadcast_bitmask function and changed the apic_find_dest to 
implement that logic.

>> @@ -366,7 +370,7 @@ static const VMStateDescription vmstate_apic_common = {
>>           VMSTATE_UINT8(arb_id, APICCommonState),
>>           VMSTATE_UINT8(tpr, APICCommonState),
>>           VMSTATE_UINT32(spurious_vec, APICCommonState),
>> -        VMSTATE_UINT8(log_dest, APICCommonState),
>> +        VMSTATE_UINT32(log_dest, APICCommonState),
>>           VMSTATE_UINT8(dest_mode, APICCommonState),
>>           VMSTATE_UINT32_ARRAY(isr, APICCommonState, 8),
>>           VMSTATE_UINT32_ARRAY(tmr, APICCommonState, 8),
> 
> 
> Hm, doesn't this need to be added in a separate subsection, much as
> ide_drive/pio_state in the example in docs/devel/migration.rst? Or did
> I *not* need to do that in commit ecb0e98b4 (unrelated to x2apic, but
> similar addition of state)?
> 
> Can you confirm that you've tested the behaviour when migrating back
> from this to an older QEMU, both for a guest *with* X2APIC enabled
> (which should fail gracefully), and a guest without X2APIC (which
> should work).

Oh, thank you for pointing out, I actually don't understand the use of 
vmstate before, I'll look at the document more and fix it.

>> diff --git a/include/hw/i386/apic.h b/include/hw/i386/apic.h
>> index 2cebeb4faf..d938bfa8e0 100644
>> --- a/include/hw/i386/apic.h
>> +++ b/include/hw/i386/apic.h
>> @@ -3,7 +3,8 @@
>>   
>>   
>>   /* apic.c */
>> -void apic_deliver_irq(uint8_t dest, uint8_t dest_mode, uint8_t delivery_mode,
>> +void apic_set_max_apic_id(uint32_t max_apic_id);
>> +void apic_deliver_irq(uint32_t dest, uint8_t dest_mode, uint8_t delivery_mode,
>>                         uint8_t vector_num, uint8_t trigger_mode);
> 
> Making it static means this can be removed, of course.

I'll fix it in next version.

Thanks,
Quang Minh.

