Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D564303DB
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Oct 2021 19:06:54 +0200 (CEST)
Received: from localhost ([::1]:55616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbn93-0003J0-6T
	for lists+qemu-devel@lfdr.de; Sat, 16 Oct 2021 13:06:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mbn71-0002Gf-Vg
 for qemu-devel@nongnu.org; Sat, 16 Oct 2021 13:04:47 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:54601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mbn70-0001E6-3J
 for qemu-devel@nongnu.org; Sat, 16 Oct 2021 13:04:47 -0400
Received: from [192.168.100.1] ([82.142.24.54]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1McpW6-1nAZhL3N58-00Zy41; Sat, 16 Oct 2021 19:04:41 +0200
Subject: Re: [PATCH 4/8] mac_via: add GPIO for A/UX mode
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20211013212132.31519-1-mark.cave-ayland@ilande.co.uk>
 <20211013212132.31519-5-mark.cave-ayland@ilande.co.uk>
 <0f7cc593-a9ca-d549-b317-25e1432408ae@vivier.eu>
 <b4a9202b-c6a4-8063-554b-111ff5f3ddd5@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <dc308850-ffaf-1195-0024-65639b5e8902@vivier.eu>
Date: Sat, 16 Oct 2021 19:04:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <b4a9202b-c6a4-8063-554b-111ff5f3ddd5@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:TsLXgz+qEhezpJMbSCR5fmAjVgAjuHPtIPc6ytUx2f8nF+LVp+J
 atVLc9GZkTKM0064fGUiwr6bxLt5q3zf4SU9DrkyNLgT3xognaRyJR1TKX4au6nEmypIf72
 QcmZbsJhkH4p8guqfcU1wQdcazpp1DwTXH6PCYZot0jMHWpS7Tp3QhU4a/BXZSofXgQVqm+
 QbK7EjHj280R27Pq2UQvg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:j/E79c8YkOg=:o8OG1smL6GVkxy7hKC2KBt
 E4EH6c4ZA63A7IPdH2w9qluiRxvoLkvDZlREmvJA2YRqu8lckm28xw5Q6itJW1I/kzEcgNkRF
 BFnq54FK7OlDqK5+xDbEE+GhsrsBXWKegAQM/XR322vP7V5kcETafmRixery9JMdim1mbLQPO
 lXvQykgwIDlGjwAkUg6eCrqLYVoSw4brPdOB6g005X28CSiJprewh6hMI0WM25U63664SuP/P
 4H2m43/r6OgYUohsQ3TsM2jNa3DtrB6ZmDiNXgV90pZj4yKdHylRsN2G7BbRYJvqoXtjCE+qf
 O072w2hPcPrEUIlM6Sw2b9S0IgtzxTLI2NTXD0ibo19WntfB8wfXRTCmvWxOcq6kF3+quN291
 atfzS6lmA2tMApkJM8q3Lv1SxO/7FXdip9RbKCqRcxBLxAZ4LFxqrURGRAQH5R0JfFw/jQNZU
 b50SLcMijQYO/7Z0tg4cDbqCppYEyU0AE7AchU7hD3jRaPku+rFfjW2TgxiDQiu21wUINcO2K
 fW+Lk6wyTaSv5xXbPCajGspA3JlOrmblVjucBJFtPNf+Sw7g5IKlZ0XOI7L7Wa6PgpHE9p7dA
 ddvPJDw3jQSjHVedKPhpxqMvDHWJsN2tJ6M0uq3GyV7F6y4BAZ6eHUPIDNz5FZkxjmvsR/0KV
 jFe6/3wqgItsO4tkE1y0GnhnJbftrXYPvyK5/UY8+0j0cMh06P+i3rHO6YrZYNp5H8ITpdDyl
 n6RgS5bpIXp1a620VjxbwKHeT3rLU74KMgpY8g==
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 15/10/2021 à 21:50, Mark Cave-Ayland a écrit :
> On 15/10/2021 07:58, Laurent Vivier wrote:
> 
>> Le 13/10/2021 à 23:21, Mark Cave-Ayland a écrit :
>>> Add a new auxmode GPIO that is updated when port B bit 6 is changed indicating
>>> whether the hardware is configured for A/UX mode.
>>>
>>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>>> ---
>>>   hw/misc/mac_via.c         | 18 ++++++++++++++++++
>>>   hw/misc/trace-events      |  1 +
>>>   include/hw/misc/mac_via.h |  1 +
>>>   3 files changed, 20 insertions(+)
>>>
>>> diff --git a/hw/misc/mac_via.c b/hw/misc/mac_via.c
>>> index 7a53a8b4c0..a08ffbcd88 100644
>>> --- a/hw/misc/mac_via.c
>>> +++ b/hw/misc/mac_via.c
>>> @@ -880,6 +880,20 @@ static void via1_adb_update(MOS6522Q800VIA1State *v1s)
>>>       }
>>>   }
>>>   +static void via1_auxmode_update(MOS6522Q800VIA1State *v1s)
>>> +{
>>> +    MOS6522State *s = MOS6522(v1s);
>>> +    int oldirq, irq;
>>> +
>>
>> Please, add a comment to explain what happens here as "vMystery" is not self-explicit.
> 
> Would something simple like:
> 
> /* Check to see if the A/UX mode bit has changed */
> 
> suffice here?

Yes

> 
>>> +    oldirq = (v1s->last_b & VIA1B_vMystery) ? 1 : 0;
>>> +    irq = (s->b & VIA1B_vMystery) ? 1 : 0;
>>
>> For me, it would be clearer with:
>>
>>      oldirq = !!(v1s->last_b & VIA1B_vMystery);
>>      irq = !!(s->b & VIA1B_vMystery);
>>
>> but it's a matter of taste.
> 
> I had to think carefully about that one :)  If you're fine with the existing version I'd prefer to
> keep it as I find it easier to read.

Up to you, as I said, a matter of taste.

> 
>>> +
>>> +    if (irq != oldirq) {
>>> +        trace_via1_auxmode(irq);
>>> +        qemu_set_irq(v1s->auxmode_irq, irq);
>>> +    }
>>> +}
>>> +
>>>   static uint64_t mos6522_q800_via1_read(void *opaque, hwaddr addr, unsigned size)
>>>   {
>>>       MOS6522Q800VIA1State *s = MOS6522_Q800_VIA1(opaque);
>>> @@ -902,6 +916,7 @@ static void mos6522_q800_via1_write(void *opaque, hwaddr addr, uint64_t val,
>>>       case VIA_REG_B:
>>>           via1_rtc_update(v1s);
>>>           via1_adb_update(v1s);
>>> +        via1_auxmode_update(v1s);
>>>             v1s->last_b = ms->b;
>>>           break;
>>> @@ -1046,6 +1061,9 @@ static void mos6522_q800_via1_init(Object *obj)
>>>                 TYPE_ADB_BUS, DEVICE(v1s), "adb.0");
>>>         qdev_init_gpio_in(DEVICE(obj), via1_irq_request, VIA1_IRQ_NB);
>>> +
>>> +    /* A/UX mode */
>>> +    qdev_init_gpio_out(DEVICE(obj), &v1s->auxmode_irq, 1);
>>>   }
>>>     static const VMStateDescription vmstate_q800_via1 = {
>>> diff --git a/hw/misc/trace-events b/hw/misc/trace-events
>>> index ede413965b..2da96d167a 100644
>>> --- a/hw/misc/trace-events
>>> +++ b/hw/misc/trace-events
>>> @@ -228,6 +228,7 @@ via1_rtc_cmd_pram_sect_write(int sector, int offset, int addr, int value) "secto
>>>   via1_adb_send(const char *state, uint8_t data, const char *vadbint) "state %s data=0x%02x
>>> vADBInt=%s"
>>>   via1_adb_receive(const char *state, uint8_t data, const char *vadbint, int status, int index,
>>> int size) "state %s data=0x%02x vADBInt=%s status=0x%x index=%d size=%d"
>>>   via1_adb_poll(uint8_t data, const char *vadbint, int status, int index, int size) "data=0x%02x
>>> vADBInt=%s status=0x%x index=%d size=%d"
>>> +via1_auxmode(int mode) "setting auxmode to %d"
>>>     # grlib_ahb_apb_pnp.c
>>>   grlib_ahb_pnp_read(uint64_t addr, uint32_t value) "AHB PnP read addr:0x%03"PRIx64" data:0x%08x"
>>> diff --git a/include/hw/misc/mac_via.h b/include/hw/misc/mac_via.h
>>> index 4506abe5d0..b445565866 100644
>>> --- a/include/hw/misc/mac_via.h
>>> +++ b/include/hw/misc/mac_via.h
>>> @@ -43,6 +43,7 @@ struct MOS6522Q800VIA1State {
>>>       MemoryRegion via_mem;
>>>         qemu_irq irqs[VIA1_IRQ_NB];
>>> +    qemu_irq auxmode_irq;
>>>       uint8_t last_b;
>>>         /* RTC */
>>>
>>
>> Reviewed-by: Laurent Vivier <laurent@vivier.eu>
> 
> 
> ATB,
> 
> Mark.


