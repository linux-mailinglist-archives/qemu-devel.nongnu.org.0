Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D166A69C3E0
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 02:03:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pTuZH-0004QN-Uw; Sun, 19 Feb 2023 20:02:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qianfanguijin@163.com>)
 id 1pTuZD-0004O4-Dd; Sun, 19 Feb 2023 20:02:07 -0500
Received: from m12.mail.163.com ([220.181.12.217])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <qianfanguijin@163.com>)
 id 1pTuZ9-0002TT-9s; Sun, 19 Feb 2023 20:02:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Message-ID:Date:MIME-Version:Subject:From:
 Content-Type; bh=JDU2jchFSjeFiZv4v3OfI8HcYKm9V0cGLMFE9v6l+dw=;
 b=JIv+ADoxDw9WLDBLTY/gjqTq1+VWWvxntNDl60hTUocPzTyx8SjwwRy9H9Ct/F
 GiDQP1ME87SytMPNmXWN5ZRVspehQC47SN6+qF/dAYvk0+ml+TF/U6enGSO38Xtp
 GUcV6r7YafLHQ3GCg5F78/klev1l/IwIBeDFStY/s9yKM=
Received: from [172.21.25.67] (unknown [218.201.129.20])
 by zwqz-smtp-mta-g4-2 (Coremail) with SMTP id _____wDnmVxzxvJjKNzEAQ--.32377S2;
 Mon, 20 Feb 2023 09:01:39 +0800 (CST)
Message-ID: <f0eff552-197c-3f7e-051c-691633ab0b39@163.com>
Date: Mon, 20 Feb 2023 09:01:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v1 1/2] hw: allwinner-i2c: Make the trace message more
 readable
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>
References: <20230217094207.16882-1-qianfanguijin@163.com>
 <1e0cbd22-18c1-dfdc-b3a9-8961903bfa6a@linaro.org>
Content-Language: en-US
From: qianfan <qianfanguijin@163.com>
In-Reply-To: <1e0cbd22-18c1-dfdc-b3a9-8961903bfa6a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDnmVxzxvJjKNzEAQ--.32377S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3Ar13uFWUGw45Jw4fZFWkWFg_yoW3Xryfpr
 Z0krsxKF15Ca4qqr1SyF1DJF1rJryDKr12yr4Ik347ZF93CwnxZryfKF4Yk3909w12qr42
 kFW5AFy2gFZ0yaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jbvtZUUUUU=
X-Originating-IP: [218.201.129.20]
X-CM-SenderInfo: htld0w5dqj3xxmlqqiywtou0bp/1tbiGhsc7VaEEUIBEAAAsg
Received-SPF: pass client-ip=220.181.12.217;
 envelope-from=qianfanguijin@163.com; helo=m12.mail.163.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.09, SPF_HELO_NONE=0.001,
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



在 2023/2/20 6:30, Philippe Mathieu-Daudé 写道:
> Hi,
>
> On 17/2/23 10:42, qianfanguijin@163.com wrote:
>> From: qianfan Zhao <qianfanguijin@163.com>
>>
>> Next is an example when allwinner_i2c_rw enabled:
>>
>> allwinner_i2c_rw write   CNTR[0x0c]: 50 { M_STP BUS_EN  }
>> allwinner_i2c_rw write   CNTR[0x0c]: e4 { A_ACK M_STA BUS_EN INT_EN  }
>> allwinner_i2c_rw  read   CNTR[0x0c]: cc { A_ACK INT_FLAG BUS_EN INT_EN }
>> allwinner_i2c_rw  read   STAT[0x10]: 08 { STAT_M_STA_TX }
>>
>> Signed-off-by: qianfan Zhao <qianfanguijin@163.com>
>> ---
>>   hw/i2c/allwinner-i2c.c | 90 +++++++++++++++++++++++++++++++++++++++++-
>>   hw/i2c/trace-events    |  4 +-
>>   2 files changed, 89 insertions(+), 5 deletions(-)
>>
>> diff --git a/hw/i2c/allwinner-i2c.c b/hw/i2c/allwinner-i2c.c
>> index a435965836..36b387520f 100644
>> --- a/hw/i2c/allwinner-i2c.c
>> +++ b/hw/i2c/allwinner-i2c.c
>> @@ -129,6 +129,39 @@ enum {
>>       STAT_IDLE = 0x1f
>>   } TWI_STAT_STA;
>>   +#define TWI_STAT_STA_DESC(sta)  [sta] = #sta
>> +static const char *twi_stat_sta_descriptors[] = {
>> +    TWI_STAT_STA_DESC(STAT_BUS_ERROR),
>> +    TWI_STAT_STA_DESC(STAT_M_STA_TX),
>> +    TWI_STAT_STA_DESC(STAT_M_RSTA_TX),
>> +    TWI_STAT_STA_DESC(STAT_M_ADDR_WR_ACK),
>> +    TWI_STAT_STA_DESC(STAT_M_ADDR_WR_NACK),
>> +    TWI_STAT_STA_DESC(STAT_M_DATA_TX_ACK),
>> +    TWI_STAT_STA_DESC(STAT_M_DATA_TX_NACK),
>> +    TWI_STAT_STA_DESC(STAT_M_ARB_LOST),
>> +    TWI_STAT_STA_DESC(STAT_M_ADDR_RD_ACK),
>> +    TWI_STAT_STA_DESC(STAT_M_ADDR_RD_NACK),
>> +    TWI_STAT_STA_DESC(STAT_M_DATA_RX_ACK),
>> +    TWI_STAT_STA_DESC(STAT_M_DATA_RX_NACK),
>> +    TWI_STAT_STA_DESC(STAT_S_ADDR_WR_ACK),
>> +    TWI_STAT_STA_DESC(STAT_S_ARB_LOST_AW_ACK),
>> +    TWI_STAT_STA_DESC(STAT_S_GCA_ACK),
>> +    TWI_STAT_STA_DESC(STAT_S_ARB_LOST_GCA_ACK),
>> +    TWI_STAT_STA_DESC(STAT_S_DATA_RX_SA_ACK),
>> +    TWI_STAT_STA_DESC(STAT_S_DATA_RX_SA_NACK),
>> +    TWI_STAT_STA_DESC(STAT_S_DATA_RX_GCA_ACK),
>> +    TWI_STAT_STA_DESC(STAT_S_DATA_RX_GCA_NACK),
>> +    TWI_STAT_STA_DESC(STAT_S_STP_RSTA),
>> +    TWI_STAT_STA_DESC(STAT_S_ADDR_RD_ACK),
>> +    TWI_STAT_STA_DESC(STAT_S_ARB_LOST_AR_ACK),
>> +    TWI_STAT_STA_DESC(STAT_S_DATA_TX_ACK),
>> +    TWI_STAT_STA_DESC(STAT_S_DATA_TX_NACK),
>> +    TWI_STAT_STA_DESC(STAT_S_LB_TX_ACK),
>> +    TWI_STAT_STA_DESC(STAT_M_2ND_ADDR_WR_ACK),
>> +    TWI_STAT_STA_DESC(STAT_M_2ND_ADDR_WR_NACK),
>> +    TWI_STAT_STA_DESC(STAT_IDLE),
>> +};
>> +
>>   static const char *allwinner_i2c_get_regname(unsigned offset)
>>   {
>>       switch (offset) {
>> @@ -155,6 +188,59 @@ static const char 
>> *allwinner_i2c_get_regname(unsigned offset)
>>       }
>>   }
>>   +static const char *twi_cntr_reg_bits[] = {
>> +    [2] = "A_ACK",
>> +    [3] = "INT_FLAG",
>> +    [4] = "M_STP",
>> +    [5] = "M_STA",
>> +    [6] = "BUS_EN",
>> +    [7] = "INT_EN",
>> +};
>> +
>> +static void trace_buffer_append_bit_descriptors(char *s, size_t sz,
>> +                                                unsigned int value,
>> +                                                unsigned int start,
>> +                                                unsigned int end,
>> +                                                const char 
>> **desc_arrays)
>> +{
>> +    for (; start <= end; start++) {
>
> You call this once, so no need to pass a desc_arrays[] argument.
> Directly iterate over twi_cntr_reg_bits[] and its ARRAY_SIZE().

create desc_arrays is useful if there has more register need dump. such as
trace_buffer_append_bit_descriptors(..., twi_cntr_reg_bits)
or trace_buffer_append_bit_descriptors(..., twi_line_cntr_reg_bits)

>
>> +        if (value & (1 << start)) {
>> +            strncat(s, desc_arrays[start], sz - 1);
>
> Watch out, desc_arrays[start] could be NULL.

if ((value & (1 << start)) && desc_arrays[start]) is better.

>
>> +            strncat(s, " ", sz - 1);
>> +        }
>> +    }
>> +}
>> +
>> +static void allwinner_i2c_trace_rw(int is_write, unsigned int offset,
>
> Please use 'bool' for 'is_write' which is a boolean.
>
>> + unsigned int value)
>> +{
>
> You can call trace_event_get_state_backends() to check if a
> trace event is enabled and return early without further processing.

got it.

>
>> +    char s[256] = { 0 };
>> +
>> +    snprintf(s, sizeof(s), "%s %6s[0x%02x]: %02x ",
>
> Please prefix hexadecimal values with 0x.
>
OK.

>> +             is_write ? "write": " read",
>> +             allwinner_i2c_get_regname(offset), offset,
>> +             value);
>
> We prefer the safer g_autofree ... g_strdup_printf().

The next trace_buffer_append_bit_descriptors will appending to a pre-alloced buffer,
so I create a buffer. Total 256 bytes seems enough for the trace strings.

>
>> +    switch (offset) {
>> +    case TWI_CNTR_REG:
>> +        strncat(s, "{ ", sizeof(s) - 1);
>> +        trace_buffer_append_bit_descriptors(s, sizeof(s), value,
>> +                                            2, 7, twi_cntr_reg_bits);
>> +        strncat(s, " }", sizeof(s) - 1);
>> +        break;
>> +    case TWI_STAT_REG:
>> +        if (STAT_TO_STA(value) <= STAT_IDLE) {
>> +            strncat(s, "{ ", sizeof(s) - 1);
>> +            strncat(s, twi_stat_sta_descriptors[STAT_TO_STA(value)],
>> +                    sizeof(s) - 1);
>> +            strncat(s, " }", sizeof(s) - 1);
>> +        }
>> +        break;
>> +    }
>> +
>> +    trace_allwinner_i2c_rw(s);
>> +}
>> +
>>   static inline bool allwinner_i2c_is_reset(AWI2CState *s)
>>   {
>>       return s->srst & TWI_SRST_MASK;
>> @@ -271,7 +357,7 @@ static uint64_t allwinner_i2c_read(void *opaque, 
>> hwaddr offset,
>>           break;
>>       }
>>   - trace_allwinner_i2c_read(allwinner_i2c_get_regname(offset), 
>> offset, value);
>> +    allwinner_i2c_trace_rw(0, (unsigned int)offset, (unsigned 
>> int)value);
>>         return (uint64_t)value;
>>   }
>> @@ -283,7 +369,7 @@ static void allwinner_i2c_write(void *opaque, 
>> hwaddr offset,
>>         value &= 0xff;
>>   - trace_allwinner_i2c_write(allwinner_i2c_get_regname(offset), 
>> offset, value);
>> +    allwinner_i2c_trace_rw(1, (unsigned int)offset, (unsigned 
>> int)value);
>>         switch (offset) {
>>       case TWI_ADDR_REG:
>> diff --git a/hw/i2c/trace-events b/hw/i2c/trace-events
>> index 8e88aa24c1..fa5e8d5021 100644
>> --- a/hw/i2c/trace-events
>> +++ b/hw/i2c/trace-events
>> @@ -16,9 +16,7 @@ i2c_recv(uint8_t address, uint8_t data) 
>> "recv(addr:0x%02x) data:0x%02x"
>>   i2c_ack(void) ""
>>     # allwinner_i2c.c
>> -
>> -allwinner_i2c_read(const char* reg_name, uint64_t offset, uint64_t 
>> value) "read %s [0x%" PRIx64 "]: -> 0x%" PRIx64
>> -allwinner_i2c_write(const char* reg_name, uint64_t offset, uint64_t 
>> value) "write %s [0x%" PRIx64 "]: <- 0x%" PRIx64
>> +allwinner_i2c_rw(const char *s) "%s"
>
> Please do not remove the other events. The tracing framework provides
> multiple backends. Some can be processed by scripts, and providing
> integer values are simpler to parse than a string.
>
> That said, your event would be more useful for other backends as:
>
> allwinner_i2c_rw(unsigned is_write,
>                  const char *regname,
>                  uing8_t regaddr,
>                  uing8_t value,
>                  const char *desc)
>                  "wr:%u   %s[0x02x]: 0x%02x { %s }"

I am a beginner for qemu and don't know how to use scripts to parse trace strings. Could you please
give me an example for that? In my opinion the trace string is for humal, not machine, so I convert
the register value to a humal readable string.

I had merge the allwinner_i2c_read and allwinner_i2c_write to allwinner_i2c_rw, but it is good to
split them, someone may interested the write events only.

How about this?

allwinner_i2c_read(const char *regname, uint8_t offset, uint8_t value, const char *desc);
allwinner_i2c_write(const char *regname, uint8_t offset, uint8_t value, const char *desc);

And I had a question: which type is better for offset and value, uint8_t or uint64_t?

>
> Regards,
>
> Phil.


