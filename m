Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2353400DC7
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Sep 2021 04:07:06 +0200 (CEST)
Received: from localhost ([::1]:43708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMhYn-0006NB-HV
	for lists+qemu-devel@lfdr.de; Sat, 04 Sep 2021 22:07:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1mMhXk-0005QB-Ox; Sat, 04 Sep 2021 22:06:00 -0400
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231]:36440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1mMhXi-0006w3-Kr; Sat, 04 Sep 2021 22:06:00 -0400
Received: by mail-oi1-x231.google.com with SMTP id s20so4295872oiw.3;
 Sat, 04 Sep 2021 19:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:to:cc:references:from:subject:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xHHKsJV8jUra9RSH39UfLrOjtBcR7nyaZm5o0qPFZ+E=;
 b=Awcl+zUzr8gZ9i/y0CeIkCo3MGwEheKFIceKm3owF5GkFVsTtpUimuJrP3TafK1dQS
 E/pGbsUkwyyRf1btUznsHoetEHCMITW4cbl602mKKTCH1PtkkiAWVQqa9LPKEbKdYcWq
 qiS3I9tF7dSB8PxrH13DWzhyBX0aO0Ho230NjsJxZXEnb59o3hvNzgnwIcoyq40Kp8FV
 nV5RGvNhuZ85fotrgjZOAwiOLzeidB7g3wgb409f9dyz14kL/O82b2jB/SbcqZMWM2fT
 V7vWKmO0xE8EZGxDESD1KOqFu/n0tx1rvTMTojUO/cB/egcivTo2sa4KOEfcBRAR0+gb
 ZdkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:to:cc:references:from:subject:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xHHKsJV8jUra9RSH39UfLrOjtBcR7nyaZm5o0qPFZ+E=;
 b=RIJqZyz17aa/Hynt7xJE4wrGqeA3OPvL4quyL+zkQTGcR62EmuzuKzXBpmVLVnql7k
 Ve3lGzMQXhs48I3/UwLC+knsdZbhJ5j0xBXrueUEzP9vO/kFgsEumimqxIGKh4OCy/4d
 kWMyo1G/7m+u7vWFmVBLjjfQfMfLvSY/307dj4So+4HSVPlAQnMl11PMfYq21kwp6oT4
 2T1m4hCGcxbTjkY1CfEc6mH8gus0nmUk6sv4X7FN8ylUs9005u1UsRF+Plua9b+oiVva
 hxlu00qXG5eyR6pW3A5XXZ59Ikrxdl6EdOlevegWwpiPRK3mYLx3Z7Hgrux8T7Jub5Lk
 YCOw==
X-Gm-Message-State: AOAM5311Nue86Afofgx2AVtv1SJcPvekPivpbZPT5UWl8T6o+Q4psaqf
 in+typ6n+EVvub6sfbHWvaA=
X-Google-Smtp-Source: ABdhPJwciK4m2Z3m7csmgG1GHGXp5DD0nHJVwJlzvszmS5p3/LJlMDaXRUvJuxeqFK7mBp+TURwavw==
X-Received: by 2002:a05:6808:1787:: with SMTP id
 bg7mr4347191oib.39.1630807557028; 
 Sat, 04 Sep 2021 19:05:57 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 x13sm915817otk.42.2021.09.04.19.05.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 04 Sep 2021 19:05:56 -0700 (PDT)
To: Bin Meng <bmeng.cn@gmail.com>
References: <20210808013406.223506-1-linux@roeck-us.net>
 <CAFEAcA8+o69ztRaaMvqh+zNaFs_6reSHX_ijknay6_0VePSE2w@mail.gmail.com>
 <a34c10d4-fc90-0186-3214-c3c5e77b4eea@roeck-us.net>
 <CAFEAcA_cAp6kWTE6Lpx6QF1zfTYfQXiOPgdfkztS3iuJkRB0xQ@mail.gmail.com>
 <b5e43e87-c1bd-3265-298e-346413a22a82@roeck-us.net>
 <CAEUhbmWN1=j=hPntg1j6aOv-AZNDm1UrDFB364Qqf0SAccyJew@mail.gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] hw/ssi: imx_spi: Improve chip select handling
Message-ID: <64557547-e243-dc98-8df7-0439fb917ffd@roeck-us.net>
Date: Sat, 4 Sep 2021 19:05:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAEUhbmWN1=j=hPntg1j6aOv-AZNDm1UrDFB364Qqf0SAccyJew@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::231;
 envelope-from=groeck7@gmail.com; helo=mail-oi1-x231.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/4/21 4:06 PM, Bin Meng wrote:
> On Sun, Sep 5, 2021 at 1:13 AM Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> On 9/2/21 12:29 PM, Peter Maydell wrote:
>>> On Thu, 2 Sept 2021 at 17:09, Guenter Roeck <linux@roeck-us.net> wrote:
>>>>
>>>> On 9/2/21 8:58 AM, Peter Maydell wrote:
>>>>> On Sun, 8 Aug 2021 at 02:34, Guenter Roeck <linux@roeck-us.net> wrote:
>>>>>>
>>>>>> The control register does not really have a means to deselect
>>>>>> all chip selects directly. As result, CS is effectively never
>>>>>> deselected, and connected flash chips fail to perform read
>>>>>> operations since they don't get the expected chip select signals
>>>>>> to reset their state machine.
>>>>>>
>>>>>> Normally and per controller documentation one would assume that
>>>>>> chip select should be set whenever a transfer starts (XCH is
>>>>>> set or the tx fifo is written into), and that it should be disabled
>>>>>> whenever a transfer is complete. However, that does not work in
>>>>>> practice: attempts to implement this approach resulted in failures,
>>>>>> presumably because a single transaction can be split into multiple
>>>>>> transfers.
>>>>>>
>>>>>> At the same time, there is no explicit signal from the host indicating
>>>>>> if chip select should be active or not. In the absence of such a direct
>>>>>> signal, use the burst length written into the control register to
>>>>>> determine if an access is ongoing or not. Disable all chip selects
>>>>>> if the burst length field in the configuration register is set to 0,
>>>>>> and (re-)enable chip select if a transfer is started. This is possible
>>>>>> because the Linux driver clears the burst length field whenever it
>>>>>> prepares the controller for the next transfer.
>>>>>> This solution  is less than perfect since it effectively only disables
>>>>>> chip select when initiating the next transfer, but it does work with
>>>>>> Linux and should otherwise do no harm.
>>>>>>
>>>>>> Stop complaining if the burst length field is set to a value of 0,
>>>>>> since that is done by Linux for every transfer.
>>>>>>
>>>>>> With this patch, a command line parameter such as "-drive
>>>>>> file=flash.sabre,format=raw,if=mtd" can be used to instantiate the
>>>>>> flash chip in the sabrelite emulation. Without this patch, the
>>>>>> flash instantiates, but it only reads zeroes.
>>>>>>
>>>>>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>>>>>> ---
>>>>>> I am not entirely happy with this solution, but it is the best I was
>>>>>> able to come up with. If anyone has a better idea, I'll be happy
>>>>>> to give it a try.
>>>>>>
>>>>>>     hw/ssi/imx_spi.c | 17 +++++++----------
>>>>>>     1 file changed, 7 insertions(+), 10 deletions(-)
>>>>>>
>>>>>> diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
>>>>>> index 189423bb3a..7a093156bd 100644
>>>>>> --- a/hw/ssi/imx_spi.c
>>>>>> +++ b/hw/ssi/imx_spi.c
>>>>>> @@ -167,6 +167,8 @@ static void imx_spi_flush_txfifo(IMXSPIState *s)
>>>>>>         DPRINTF("Begin: TX Fifo Size = %d, RX Fifo Size = %d\n",
>>>>>>                 fifo32_num_used(&s->tx_fifo), fifo32_num_used(&s->rx_fifo));
>>>>>>
>>>>>> +    qemu_set_irq(s->cs_lines[imx_spi_selected_channel(s)], 0);
>>>>>> +
>>>>>>         while (!fifo32_is_empty(&s->tx_fifo)) {
>>>>>>             int tx_burst = 0;
>>>>>>
>>>>>> @@ -385,13 +387,6 @@ static void imx_spi_write(void *opaque, hwaddr offset, uint64_t value,
>>>>>>         case ECSPI_CONREG:
>>>>>>             s->regs[ECSPI_CONREG] = value;
>>>>>>
>>>>>> -        burst = EXTRACT(s->regs[ECSPI_CONREG], ECSPI_CONREG_BURST_LENGTH) + 1;
>>>>>> -        if (burst % 8) {
>>>>>> -            qemu_log_mask(LOG_UNIMP,
>>>>>> -                          "[%s]%s: burst length %d not supported: rounding up to next multiple of 8\n",
>>>>>> -                          TYPE_IMX_SPI, __func__, burst);
>>>>>> -        }
>>>>>
>>>>> Why has this log message been removed ?
>>>>
>>>> What I wanted to do is:
>>>>
>>>> "Stop complaining if the burst length field is set to a value of 0,
>>>>     since that is done by Linux for every transfer."
>>>>
>>>> What I did instead is to remove the message entirely.
>>>>
>>>> How about the rest of the patch ? Is it worth a resend with the message
>>>> restored (except for burst size == 0), or is it not acceptable anyway ?
>>>
>>> I did the easy bit of the code review because answering this
>>> question is probably a multiple-hour job...this is still on my
>>> todo list, but I'm hoping somebody who understands the MIX
>>> SPI device gets to it first.
>>>
>>
>> Makes sense. Of course, it would be even better if someone can explain
>> how this works on real hardware.
>>
> 
> I happened to notice this patch today. Better to cc people who once
> worked on this part from "git blame" or "git log".
> 

I copy people and mailing lists as provided by scripts/get_maintainer.pl.
I don't think it would be appropriate to copy additional people; anyone
interested in patches for a specific file should be listed in
MAINTAINERS. After all, that is what it is for.

>> In this context, it would be useful to know if real SPI flash chips
>> reset their state to idle under some conditions which are not covered
>> by the current code in hw/block/m25p80.c. Maybe the real problem is
>> as simple as that code setting data_read_loop when it should not,
>> or that it doesn't reset that flag when it should (unless I am missing
>> something, the flag is currently only reset by disabling chip select).
>>
> 
> One quick question, did you test this on the latest QEMU? Is that
> Linux used for testing? There have been a number of bug fixes in
> imx_spi recently.
> 

I implemented and tested this patch on top if qemu v6.0.0, and since then
there has been no patch applied to the affected file. The patch still works
on top of qemu v6.1.0.

Guenter

