Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 392C84AD081
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 06:18:03 +0100 (CET)
Received: from localhost ([::1]:48138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHIt7-00028U-Ln
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 00:18:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nHIqG-0000RD-KV
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 00:15:06 -0500
Received: from [2607:f8b0:4864:20::1034] (port=37422
 helo=mail-pj1-x1034.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nHIqD-0000EV-Ve
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 00:15:04 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 v5-20020a17090a4ec500b001b8b702df57so1099818pjl.2
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 21:15:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=pT/zm/rTMEImGvG+Za1M7niAoIZlMdv/mFUDuqOrqA8=;
 b=XZ5mqEm4mst8Js6/8gjvWuyYEIuy/P3zIm/DFf3M+bWkLgSwxCpo5lCpHNWfgHgS43
 OnnFRM6IQwv6G62xyirS6o0PCDeoDdPI/WTyH2u3asaFPWdBYFDnJT7pqSGZKbHB0kCP
 PSlnnQCKrxAXG1uHqcQ8+CBDnSGzuoEMXY/aq47ldLxxaip2kPIRLALEWLzx8MXKt4g4
 RvOlYt3KOgn6nGv1hMW+ar6P8a/wIYfYS2n6uc7fIza5mAgLBJL6/CzJvwb2Xa72opRF
 NNNM9mMEHPJfFZg6VhWPKsQtmnDjfSK8j//x7nsWCBsgSm50iYe4lnLz2RzpNz2zgDuS
 9ENA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=pT/zm/rTMEImGvG+Za1M7niAoIZlMdv/mFUDuqOrqA8=;
 b=WPwDbfWObI9MoTzw2wUXWHUulb/krKwq3D4I6qE0ywNzFusSDFBRCoHsJsYjdZoBzv
 N/RVRA7sNI9PWxuwwOvMth2a45s9DI1N1aojVFw7dlVb9AUiYBPJ65UIEnnsiDiRKVjK
 YvSNAIRcMVAwGiFRHv8pC5jDcN4yZY46DC5PbaQx0sXta2/UlZ1+gpQCjPtNdDkoQpwL
 1ZV1Id/lrqO5AhH+Rq1VI0ird6zv+QZla15aZjDTCpdP3tfAbzvmy8l8bybrWKNhYF4v
 i0514c7BoAnRZcdTvE2SMp10y9QVzSmiIfVGpF27YI4jzfQsakAbvvbcuyXLEHdLsD5/
 U/SQ==
X-Gm-Message-State: AOAM532H1Ew0Qu/V7SvZiaWeGmOdEOxOs1lpoltOEvXEsq3GzjOYaPci
 6IF9MREMwD4akJ9cCy9HFwc=
X-Google-Smtp-Source: ABdhPJzCPhFpbAeUT7bJEicbFumegPXUO8/iRAA8C6xZgCEfkiCRW7uccHx+CKVUCvCC9ex2RwpJNQ==
X-Received: by 2002:a17:902:ba94:: with SMTP id
 k20mr2807133pls.155.1644297300465; 
 Mon, 07 Feb 2022 21:15:00 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id me4sm1077626pjb.26.2022.02.07.21.14.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Feb 2022 21:15:00 -0800 (PST)
Message-ID: <71542eb1-fc8f-8f30-81e0-35c9df764825@amsat.org>
Date: Tue, 8 Feb 2022 06:14:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH 08/11] mos6522: add "info via" HMP command for debugging
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>, Laurent@vivier.eu,
 qemu-devel@nongnu.org
References: <20220127205405.23499-1-mark.cave-ayland@ilande.co.uk>
 <20220127205405.23499-9-mark.cave-ayland@ilande.co.uk>
 <CAFEAcA8ZiLTgeG_2aUHBoV0io52623VRybG0NL0uY8=9Fg59Kg@mail.gmail.com>
In-Reply-To: <CAFEAcA8ZiLTgeG_2aUHBoV0io52623VRybG0NL0uY8=9Fg59Kg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1034
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 7/2/22 20:34, Peter Maydell wrote:
> On Thu, 27 Jan 2022 at 21:03, Mark Cave-Ayland
> <mark.cave-ayland@ilande.co.uk> wrote:
>>
>> This displays detailed information about the device registers and timers to aid
>> debugging problems with timers and interrupts.
>>
>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>> ---
>>   hmp-commands-info.hx | 12 ++++++
>>   hw/misc/mos6522.c    | 92 ++++++++++++++++++++++++++++++++++++++++++++
>>   2 files changed, 104 insertions(+)
> 
> 
> I'm not sure how keen we are on adding new device-specific
> HMP info commands, but it's not my area of expertise. Markus ?

HMP is David :) IIRC it is OK as long as HMP is a QMP wrapper.

> 
> (patch below for context)
> 
> thanks
> -- PMM
> 
>>
>> diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
>> index e90f20a107..4e714e79a2 100644
>> --- a/hmp-commands-info.hx
>> +++ b/hmp-commands-info.hx
>> @@ -879,3 +879,15 @@ SRST
>>     ``info sgx``
>>       Show intel SGX information.
>>   ERST
>> +
>> +    {
>> +        .name       = "via",
>> +        .args_type  = "",
>> +        .params     = "",
>> +        .help       = "show guest 6522 VIA devices",
>> +    },
>> +
>> +SRST
>> +  ``info via``
>> +    Show guest 6522 VIA devices.
>> +ERST
>> diff --git a/hw/misc/mos6522.c b/hw/misc/mos6522.c
>> index aaae195d63..cfa6a9c44b 100644
>> --- a/hw/misc/mos6522.c
>> +++ b/hw/misc/mos6522.c
>> @@ -30,6 +30,8 @@
>>   #include "hw/misc/mos6522.h"
>>   #include "hw/qdev-properties.h"
>>   #include "migration/vmstate.h"
>> +#include "monitor/monitor.h"
>> +#include "qapi/type-helpers.h"
>>   #include "qemu/timer.h"
>>   #include "qemu/cutils.h"
>>   #include "qemu/log.h"
>> @@ -415,6 +417,95 @@ void mos6522_write(void *opaque, hwaddr addr, uint64_t val, unsigned size)
>>       }
>>   }
>>
>> +static int qmp_x_query_via_foreach(Object *obj, void *opaque)
>> +{
>> +    GString *buf = opaque;
>> +
>> +    if (object_dynamic_cast(obj, TYPE_MOS6522)) {
>> +        MOS6522State *s = MOS6522(obj);
>> +        int64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
>> +        uint16_t t1counter = get_counter(s, &s->timers[0]);
>> +        uint16_t t2counter = get_counter(s, &s->timers[1]);
>> +
>> +        g_string_append_printf(buf, "%s:\n", object_get_typename(obj));
>> +
>> +        g_string_append_printf(buf, "  Registers:\n");
>> +        g_string_append_printf(buf, "    %-*s:    0x%x\n", 4,
>> +                               mos6522_reg_names[0], s->b);
>> +        g_string_append_printf(buf, "    %-*s:    0x%x\n", 4,
>> +                               mos6522_reg_names[1], s->a);
>> +        g_string_append_printf(buf, "    %-*s:    0x%x\n", 4,
>> +                               mos6522_reg_names[2], s->dirb);
>> +        g_string_append_printf(buf, "    %-*s:    0x%x\n", 4,
>> +                               mos6522_reg_names[3], s->dira);
>> +        g_string_append_printf(buf, "    %-*s:    0x%x\n", 4,
>> +                               mos6522_reg_names[4], t1counter & 0xff);
>> +        g_string_append_printf(buf, "    %-*s:    0x%x\n", 4,
>> +                               mos6522_reg_names[5], t1counter >> 8);
>> +        g_string_append_printf(buf, "    %-*s:    0x%x\n", 4,
>> +                               mos6522_reg_names[6],
>> +                               s->timers[0].latch & 0xff);
>> +        g_string_append_printf(buf, "    %-*s:    0x%x\n", 4,
>> +                               mos6522_reg_names[7],
>> +                               s->timers[0].latch >> 8);
>> +        g_string_append_printf(buf, "    %-*s:    0x%x\n", 4,
>> +                               mos6522_reg_names[8], t2counter & 0xff);
>> +        g_string_append_printf(buf, "    %-*s:    0x%x\n", 4,
>> +                               mos6522_reg_names[9], t2counter >> 8);
>> +        g_string_append_printf(buf, "    %-*s:    0x%x\n", 4,
>> +                               mos6522_reg_names[10], s->sr);
>> +        g_string_append_printf(buf, "    %-*s:    0x%x\n", 4,
>> +                               mos6522_reg_names[11], s->acr);
>> +        g_string_append_printf(buf, "    %-*s:    0x%x\n", 4,
>> +                               mos6522_reg_names[12], s->pcr);
>> +        g_string_append_printf(buf, "    %-*s:    0x%x\n", 4,
>> +                               mos6522_reg_names[13], s->ifr);
>> +        g_string_append_printf(buf, "    %-*s:    0x%x\n", 4,
>> +                               mos6522_reg_names[14], s->ier);
>> +
>> +        g_string_append_printf(buf, "  Timers:\n");
>> +        g_string_append_printf(buf, "    Using current time now(ns)=%"PRId64
>> +                                    "\n", now);
>> +        g_string_append_printf(buf, "    T1 freq(hz)=%"PRId64
>> +                               " mode=%s"
>> +                               " counter=0x%x"
>> +                               " latch=0x%x\n"
>> +                               "       load_time(ns)=%"PRId64
>> +                               " next_irq_time(ns)=%"PRId64 "\n",
>> +                               s->timers[0].frequency,
>> +                               ((s->acr & T1MODE) == T1MODE_CONT) ? "continuous"
>> +                                                                  : "one-shot",
>> +                               t1counter,
>> +                               s->timers[0].latch,
>> +                               s->timers[0].load_time,
>> +                               get_next_irq_time(s, &s->timers[0], now));
>> +        g_string_append_printf(buf, "    T2 freq(hz)=%"PRId64
>> +                               " mode=%s"
>> +                               " counter=0x%x"
>> +                               " latch=0x%x\n"
>> +                               "       load_time(ns)=%"PRId64
>> +                               " next_irq_time(ns)=%"PRId64 "\n",
>> +                               s->timers[1].frequency,
>> +                               "one-shot",
>> +                               t2counter,
>> +                               s->timers[1].latch,
>> +                               s->timers[1].load_time,
>> +                               get_next_irq_time(s, &s->timers[1], now));
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static HumanReadableText *qmp_x_query_via(Error **errp)
>> +{
>> +    g_autoptr(GString) buf = g_string_new("");
>> +
>> +    object_child_foreach_recursive(object_get_root(),
>> +                                   qmp_x_query_via_foreach, buf);
>> +
>> +    return human_readable_text_from_str(buf);
>> +}
>> +
>>   static const MemoryRegionOps mos6522_ops = {
>>       .read = mos6522_read,
>>       .write = mos6522_write,
>> @@ -547,6 +638,7 @@ static const TypeInfo mos6522_type_info = {
>>   static void mos6522_register_types(void)
>>   {
>>       type_register_static(&mos6522_type_info);
>> +    monitor_register_hmp_info_hrt("via", qmp_x_query_via);
>>   }
>>
>>   type_init(mos6522_register_types)
>> --
>> 2.20.1
> 


