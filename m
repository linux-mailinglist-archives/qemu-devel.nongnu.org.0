Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3DE8400C3B
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Sep 2021 19:14:10 +0200 (CEST)
Received: from localhost ([::1]:36450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMZF3-0003XL-6n
	for lists+qemu-devel@lfdr.de; Sat, 04 Sep 2021 13:14:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1mMZEB-0002gb-Ql; Sat, 04 Sep 2021 13:13:15 -0400
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236]:34528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1mMZE9-0005qP-L5; Sat, 04 Sep 2021 13:13:15 -0400
Received: by mail-oi1-x236.google.com with SMTP id p2so3297283oif.1;
 Sat, 04 Sep 2021 10:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:to:cc:references:from:subject:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=TUSynKinh2aqtLM+qwXcGSQBrw5nhE2brZQkIAMZaxM=;
 b=e5zTGVif6XdOz07tLFhQcaExBlRAlzFNUFCuAYflfQNro0wrq2FSN0ae9S4FK9n16O
 F8LUGLBvqcNsp5lPGNgkXZn554ceG1XwU6BlVX7mFSNuEqEJ20r/PFnu6xkv/7FdpqMJ
 JUkiSwSaqWp+J4WrL5Jz9Fkgm/tN9vZyzikwk/iEVyd8yBZxI+e/+7+QcvAUhHttUswV
 QWc/bhOv/B4xQ6InwkiAXxEj6M9QFa9rTAWtOmIlD0OrqI/b3KZA1985RMXNoxH50Saz
 VYjixJbaWgHLFYkdwQCk8Nw+yBOlZVRGTHf9cRUQtZ7Xsz2To4P0tg0U4H6yJZGQIIm4
 pSeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:to:cc:references:from:subject:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TUSynKinh2aqtLM+qwXcGSQBrw5nhE2brZQkIAMZaxM=;
 b=CU78/wHUz09lPB3Ec74GZlm54kNa++J86tHYFssaoG91i/lmU2Dy2qhOZXCT5E8SHr
 CNhKwcgy4zCzTtrqiQc6FEDZXZXN6OrrcvsPeRHrGpFfbORZ8B7I9PSLOaEqPTNSWOu3
 WYCmomwDIt9hKJ5e7WBefPuKUIipVl8E/xalufCEudAhJ+pdguvKRY7BpvfAAEnveJTV
 1JjNV4CwGO1V/UVKYzN3iKEouVY1DdDyQ9Osx2tNJNlD9z8RiPEG98nUl9rTCfsT4xPC
 u46Lp4G00IPAnB3mLQlvOQ6PmqQFfTEZF+usaxuYiBObPUPT+OBUyrc0RLF6uk6N7J8H
 IEaQ==
X-Gm-Message-State: AOAM532FwXdJJn5/hUytrsqI7mmZw3JQAu/xzBeoOGUnLb7v3j/bl+Qn
 zigGaUdjojdy2/W+N+lyhIsWGL8D1ow=
X-Google-Smtp-Source: ABdhPJwiNY12izUrUqpoyupyBh77ZJtTx4CQQo7Wn2CbuLyY1SGh1aUGPkLhSOca1f4gw5gmC2DptA==
X-Received: by 2002:a05:6808:220e:: with SMTP id
 bd14mr3175413oib.41.1630775590978; 
 Sat, 04 Sep 2021 10:13:10 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 w9sm616070oti.35.2021.09.04.10.13.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 04 Sep 2021 10:13:10 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210808013406.223506-1-linux@roeck-us.net>
 <CAFEAcA8+o69ztRaaMvqh+zNaFs_6reSHX_ijknay6_0VePSE2w@mail.gmail.com>
 <a34c10d4-fc90-0186-3214-c3c5e77b4eea@roeck-us.net>
 <CAFEAcA_cAp6kWTE6Lpx6QF1zfTYfQXiOPgdfkztS3iuJkRB0xQ@mail.gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] hw/ssi: imx_spi: Improve chip select handling
Message-ID: <b5e43e87-c1bd-3265-298e-346413a22a82@roeck-us.net>
Date: Sat, 4 Sep 2021 10:13:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_cAp6kWTE6Lpx6QF1zfTYfQXiOPgdfkztS3iuJkRB0xQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=groeck7@gmail.com; helo=mail-oi1-x236.google.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-3.832,
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
Cc: Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/2/21 12:29 PM, Peter Maydell wrote:
> On Thu, 2 Sept 2021 at 17:09, Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> On 9/2/21 8:58 AM, Peter Maydell wrote:
>>> On Sun, 8 Aug 2021 at 02:34, Guenter Roeck <linux@roeck-us.net> wrote:
>>>>
>>>> The control register does not really have a means to deselect
>>>> all chip selects directly. As result, CS is effectively never
>>>> deselected, and connected flash chips fail to perform read
>>>> operations since they don't get the expected chip select signals
>>>> to reset their state machine.
>>>>
>>>> Normally and per controller documentation one would assume that
>>>> chip select should be set whenever a transfer starts (XCH is
>>>> set or the tx fifo is written into), and that it should be disabled
>>>> whenever a transfer is complete. However, that does not work in
>>>> practice: attempts to implement this approach resulted in failures,
>>>> presumably because a single transaction can be split into multiple
>>>> transfers.
>>>>
>>>> At the same time, there is no explicit signal from the host indicating
>>>> if chip select should be active or not. In the absence of such a direct
>>>> signal, use the burst length written into the control register to
>>>> determine if an access is ongoing or not. Disable all chip selects
>>>> if the burst length field in the configuration register is set to 0,
>>>> and (re-)enable chip select if a transfer is started. This is possible
>>>> because the Linux driver clears the burst length field whenever it
>>>> prepares the controller for the next transfer.
>>>> This solution  is less than perfect since it effectively only disables
>>>> chip select when initiating the next transfer, but it does work with
>>>> Linux and should otherwise do no harm.
>>>>
>>>> Stop complaining if the burst length field is set to a value of 0,
>>>> since that is done by Linux for every transfer.
>>>>
>>>> With this patch, a command line parameter such as "-drive
>>>> file=flash.sabre,format=raw,if=mtd" can be used to instantiate the
>>>> flash chip in the sabrelite emulation. Without this patch, the
>>>> flash instantiates, but it only reads zeroes.
>>>>
>>>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>>>> ---
>>>> I am not entirely happy with this solution, but it is the best I was
>>>> able to come up with. If anyone has a better idea, I'll be happy
>>>> to give it a try.
>>>>
>>>>    hw/ssi/imx_spi.c | 17 +++++++----------
>>>>    1 file changed, 7 insertions(+), 10 deletions(-)
>>>>
>>>> diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
>>>> index 189423bb3a..7a093156bd 100644
>>>> --- a/hw/ssi/imx_spi.c
>>>> +++ b/hw/ssi/imx_spi.c
>>>> @@ -167,6 +167,8 @@ static void imx_spi_flush_txfifo(IMXSPIState *s)
>>>>        DPRINTF("Begin: TX Fifo Size = %d, RX Fifo Size = %d\n",
>>>>                fifo32_num_used(&s->tx_fifo), fifo32_num_used(&s->rx_fifo));
>>>>
>>>> +    qemu_set_irq(s->cs_lines[imx_spi_selected_channel(s)], 0);
>>>> +
>>>>        while (!fifo32_is_empty(&s->tx_fifo)) {
>>>>            int tx_burst = 0;
>>>>
>>>> @@ -385,13 +387,6 @@ static void imx_spi_write(void *opaque, hwaddr offset, uint64_t value,
>>>>        case ECSPI_CONREG:
>>>>            s->regs[ECSPI_CONREG] = value;
>>>>
>>>> -        burst = EXTRACT(s->regs[ECSPI_CONREG], ECSPI_CONREG_BURST_LENGTH) + 1;
>>>> -        if (burst % 8) {
>>>> -            qemu_log_mask(LOG_UNIMP,
>>>> -                          "[%s]%s: burst length %d not supported: rounding up to next multiple of 8\n",
>>>> -                          TYPE_IMX_SPI, __func__, burst);
>>>> -        }
>>>
>>> Why has this log message been removed ?
>>
>> What I wanted to do is:
>>
>> "Stop complaining if the burst length field is set to a value of 0,
>>    since that is done by Linux for every transfer."
>>
>> What I did instead is to remove the message entirely.
>>
>> How about the rest of the patch ? Is it worth a resend with the message
>> restored (except for burst size == 0), or is it not acceptable anyway ?
> 
> I did the easy bit of the code review because answering this
> question is probably a multiple-hour job...this is still on my
> todo list, but I'm hoping somebody who understands the MIX
> SPI device gets to it first.
> 

Makes sense. Of course, it would be even better if someone can explain
how this works on real hardware.

In this context, it would be useful to know if real SPI flash chips
reset their state to idle under some conditions which are not covered
by the current code in hw/block/m25p80.c. Maybe the real problem is
as simple as that code setting data_read_loop when it should not,
or that it doesn't reset that flag when it should (unless I am missing
something, the flag is currently only reset by disabling chip select).

Thanks,
Guenter

