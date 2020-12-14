Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF2A42D9CC4
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 17:33:56 +0100 (CET)
Received: from localhost ([::1]:36522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koqnL-0003Jd-Sk
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 11:33:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.duyck@gmail.com>)
 id 1koqlP-0002NQ-Py
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 11:31:57 -0500
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41]:34584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alexander.duyck@gmail.com>)
 id 1koqlM-0007Mr-Ro
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 11:31:55 -0500
Received: by mail-io1-xd41.google.com with SMTP id i18so17458172ioa.1
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 08:31:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Nv58MUdpB9ubSeR3Rp7F7zFWbdJGuJYvWF+YDGXL1aA=;
 b=Jnjq5tGvJ138exAW59qwAkY8we1//GkuYWh7NqpLzYrXaeVNvhJCNe2VqpuR4qU0fg
 541aI+5TQFd0HUZmaxsCg7oqCT3/ULqTYDRkd+39KWCvp3VKU7lp0NuhDBA6Ohyo+Ezg
 g7UAWYW4nP5izg71JuaXDyawJPpZKh3rAqoJLu4ixS/LRFQgkkM/5VXUa+vVwk5ZFdw1
 FC7XrqRin3o9hVfautAeqikgZGgJlnc4ZJ6KCIvOiEGBhQuCY/I2st2vG9hQADILK9k1
 0QbwmuTiyopEq4h2rAfJxkhzVNm8Q4iRJCv7AmxNwCvwlFmOiyqPhcBKp3VB5u2mO0w5
 KVkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Nv58MUdpB9ubSeR3Rp7F7zFWbdJGuJYvWF+YDGXL1aA=;
 b=lo0qcdwX1B4+nbpP9ZndAHQwSRSavKVEjNoRLibjq2wm4ZQ2BWrVZeCDmBKQJndNAD
 EAiJkolUTqIcd0bma2+kogIDQCquyl0fPlKtzicopSB4SnIwS0iIfHKDIX/7DImpgfjd
 OXS8RR1z4cb1UKC7YCJriNlyfDK4jRXUL57gpJCtE/CwYq5FJVX8ztO/7S5X+1/gwi2K
 DLRZrjABpUcuJtelmCfc/DXnDX6YIyK9KfT9UB8GtWGM3mWJfWZqOciGswfOJ8FT1f9O
 ByMZtUsp8SEm/graBKpjVPwZJPiDqBhZ9TtuT6ZCeUTf95uR+K2UPq56WS+mGtGy3gYN
 /RpQ==
X-Gm-Message-State: AOAM531mx0u92YoZqW5wOF+KAs5kiALtu9YauhMr2vQvnoL2jXcj3ras
 FQkb6B4jUkwBp30ClZrpEvFNOYcSWzUUKM0ELtM=
X-Google-Smtp-Source: ABdhPJwfmzK8WCTYha4UWKB9Uku2esxfwx+5arc8g2JQSduSOpdw5bJ6849YO0DK3prH04tPLo/GVeh6jkEjZnmqVGo=
X-Received: by 2002:a05:6602:152:: with SMTP id
 v18mr33036091iot.187.1607963511213; 
 Mon, 14 Dec 2020 08:31:51 -0800 (PST)
MIME-Version: 1.0
References: <20201203133236.222207-1-andrew@daynix.com>
 <CAKgT0UeoKDcDeMMG7KGMSKXP26txrwNuc73HKFPa57y=Vuo-kg@mail.gmail.com>
 <CABcq3pG78o4ttn8R_a-4hHVaqnx9MXg4CyA0ozS2W9trK4qJPg@mail.gmail.com>
In-Reply-To: <CABcq3pG78o4ttn8R_a-4hHVaqnx9MXg4CyA0ozS2W9trK4qJPg@mail.gmail.com>
From: Alexander Duyck <alexander.duyck@gmail.com>
Date: Mon, 14 Dec 2020 08:31:35 -0800
Message-ID: <CAKgT0Uc9Z93M_7QtbJMRzJ6k6Pr=bi8MsoteDhV_GVA2Eceb=A@mail.gmail.com>
Subject: Re: [PATCH v2] e1000e: Added ICR clearing by corresponding IMS bit.
To: Andrew Melnichenko <andrew@daynix.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d41;
 envelope-from=alexander.duyck@gmail.com; helo=mail-io1-xd41.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: intel-wired-lan <intel-wired-lan@lists.osuosl.org>, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Okay. That sounds reasonable. You should repost this with your more
thorough explanation of the problem and how this solves it in the
patch description.

Thanks.

- Alex

On Mon, Dec 14, 2020 at 3:09 AM Andrew Melnichenko <andrew@daynix.com> wrote:
>
> Hi,
> The issue is in LSC clearing. So, after "link up"(during initialization), the next LSC event is masked and can't be processed.
> Technically, the event should be 'cleared' during ICR read.
> On Windows guest, everything works well, mostly because of different interrupt routines(ICR clears during register write).
> So, I've added ICR clearing during read, according to the note by
> section 13.3.27 of the 8257X developers manual.
>
> On Thu, Dec 3, 2020 at 7:57 PM Alexander Duyck <alexander.duyck@gmail.com> wrote:
>>
>> On Thu, Dec 3, 2020 at 5:00 AM Andrew Melnychenko <andrew@daynix.com> wrote:
>> >
>> > Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=1707441
>>
>> So the bugzilla seems to be reporting that the NIC operstate is being
>> misreported when qemu has configured the link down. Based on the
>> description it isn't clear to me how this patch addresses that. Some
>> documentation on how you reproduced the issue, and what was seen
>> before and after this patch would be useful.
>>
>> > Added ICR clearing if there is IMS bit - according to the note by
>>
>> Should probably be "Add" instead of "Added". Same for the title of the patch.
>>
>> > section 13.3.27 of the 8257X developers manual.
>> >
>> > Signed-off-by: Andrew Melnychenko <andrew@daynix.com>
>> > ---
>> >  hw/net/e1000e_core.c | 10 ++++++++++
>> >  hw/net/trace-events  |  1 +
>> >  2 files changed, 11 insertions(+)
>> >
>> > diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
>> > index 095c01ebc6..9705f5c52e 100644
>> > --- a/hw/net/e1000e_core.c
>> > +++ b/hw/net/e1000e_core.c
>> > @@ -2624,6 +2624,16 @@ e1000e_mac_icr_read(E1000ECore *core, int index)
>> >          e1000e_clear_ims_bits(core, core->mac[IAM]);
>> >      }
>> >
>> > +    /*
>> > +     * PCIe* GbE Controllers Open Source Software Developer's Manual
>> > +     * 13.3.27 Interrupt Cause Read Register
>> > +     */
>> > +    if ((core->mac[ICR] & E1000_ICR_ASSERTED) &&
>> > +        (core->mac[ICR] & core->mac[IMS])) {
>> > +        trace_e1000e_irq_icr_clear_icr_bit_ims(core->mac[ICR], core->mac[IMS]);
>> > +        core->mac[ICR] = 0;
>> > +    }
>> > +
>> >      trace_e1000e_irq_icr_read_exit(core->mac[ICR]);
>> >      e1000e_update_interrupt_state(core);
>> >      return ret;
>>
>> Changes like this have historically been problematic. I am curious
>> what testing had been done on this and with what drivers? Keep in mind
>> that we have to support several flavors of BSD, Windows, and Linux
>> with this.
>>
>> > diff --git a/hw/net/trace-events b/hw/net/trace-events
>> > index 5db45456d9..2c3521a19c 100644
>> > --- a/hw/net/trace-events
>> > +++ b/hw/net/trace-events
>> > @@ -237,6 +237,7 @@ e1000e_irq_icr_read_entry(uint32_t icr) "Starting ICR read. Current ICR: 0x%x"
>> >  e1000e_irq_icr_read_exit(uint32_t icr) "Ending ICR read. Current ICR: 0x%x"
>> >  e1000e_irq_icr_clear_zero_ims(void) "Clearing ICR on read due to zero IMS"
>> >  e1000e_irq_icr_clear_iame(void) "Clearing ICR on read due to IAME"
>> > +e1000e_irq_icr_clear_icr_bit_ims(uint32_t icr, uint32_t ims) "Clearing ICR on read due corresponding IMS bit: 0x%x & 0x%x"
>> >  e1000e_irq_iam_clear_eiame(uint32_t iam, uint32_t cause) "Clearing IMS due to EIAME, IAM: 0x%X, cause: 0x%X"
>> >  e1000e_irq_icr_clear_eiac(uint32_t icr, uint32_t eiac) "Clearing ICR bits due to EIAC, ICR: 0x%X, EIAC: 0x%X"
>> >  e1000e_irq_ims_clear_set_imc(uint32_t val) "Clearing IMS bits due to IMC write 0x%x"
>> > --
>> > 2.29.2
>> >

