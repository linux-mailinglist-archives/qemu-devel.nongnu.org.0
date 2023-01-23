Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 763CD6781F3
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 17:42:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJzsy-0000Hp-TV; Mon, 23 Jan 2023 11:41:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pJzsv-0000HY-Tb
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 11:41:29 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pJzsu-0006KK-5e
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 11:41:29 -0500
Received: by mail-wr1-x429.google.com with SMTP id n7so11386373wrx.5
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 08:41:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tWXOu7UZkYprU7FVvJ1dHULN2R/hsHttRxH9fu/yWgc=;
 b=FJNz9jJJmmOG/gyUSWYfLet252KVxdDLzI6qtfqns4h7EYSP6nb8sV988xwHZY5ML2
 giXoqPrHlvq8ZvkWATUSPd/ek+5lYYIrnccWs+uVbsqzVp0bSsBlEwrOe4cPwzXVbtvH
 NY3WH8LWPq5jHf6T8tXdhepW6m4i/oh5WeCI+5hMzC0QocHn+VbmrR6WTycJoc+uI6Ig
 I88uU5OwnVLmJCWqF5puAWBzosu0yxAYvGzRGAPZDuWh/fOnX2ZXNeN9ZVSdlfU4sYVM
 D8mEnUh+hrzF/IM5FKtxL5T/qjuMUxI9MXyaYMaSYOtuvlld2wgvYYw9qAZn6My4Rxlg
 RCTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tWXOu7UZkYprU7FVvJ1dHULN2R/hsHttRxH9fu/yWgc=;
 b=mHtY0jMYN2r99QyfLd9WlUdL0oXzErO5sF3Sd8tkI84WrotgqHS5QGgKdZDj1O8oWB
 CHw9Ho3mOYXUiNqaPp/GOyOP7q6pbh0chBzYPLsndC7AMfhI61HyMwgCC31oyqSP3A3j
 iEFG2swjlQmgQhzH+J3Fe8uV1PPEPrtJOzAUZ0YFNE15sY8l7obHcuxdos8oZQonc+F5
 xErFpI3rkaTgd17dXRk723kNjzzO8jvpC7zTl9Lxl2WRiVp5domq+fuAKkGiA0mIzg1G
 XEQVS49Cac7JDRanuCvZuEDfJKtm75bRFN7aeslr35jJN1WFEkRy+3TWhDIDDhi4XnX2
 d5xQ==
X-Gm-Message-State: AFqh2kpFjYHsbgAQAoWGVEhJXE9eCbOiGBkeA9ZkCBrCE3ErZvcVu3/E
 9Ez2+hKe/2AGWl/Rnc6vT6h5zg==
X-Google-Smtp-Source: AMrXdXuNjdOS+P3YkRW+QrkwW786C7XbZTJItTaAdvUZvVX+i2b8nx6MdlFDTl3A57mwpaclrLdcIA==
X-Received: by 2002:adf:b604:0:b0:242:1809:7e17 with SMTP id
 f4-20020adfb604000000b0024218097e17mr21318159wre.6.1674492086526; 
 Mon, 23 Jan 2023 08:41:26 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 j10-20020adfea4a000000b002bbdcd15e44sm2606151wrn.37.2023.01.23.08.41.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jan 2023 08:41:26 -0800 (PST)
Message-ID: <484f5d72-2186-c60c-112a-1ae76b7b7e45@linaro.org>
Date: Mon, 23 Jan 2023 17:41:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v3 5/5] hw/char/pl011: check if UART is enabled before RX
 or TX operation
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230120155447.31702-1-eiakovlev@linux.microsoft.com>
 <20230120155447.31702-6-eiakovlev@linux.microsoft.com>
 <fc01ef6d-73d7-af1a-3e59-bd4f1e3e83ba@linaro.org>
 <1937dbbf-579d-e236-4669-afdc633995a1@linux.microsoft.com>
 <04d950dc-bd01-d9ca-cbec-25b52ccd70e8@linaro.org>
 <CAFEAcA_93iF+oiYAs_tymHGSkFAZx3-1Rh=z22ggBggz+3KnKA@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA_93iF+oiYAs_tymHGSkFAZx3-1Rh=z22ggBggz+3KnKA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.147,
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

On 23/1/23 17:23, Peter Maydell wrote:
> On Mon, 23 Jan 2023 at 15:21, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>> pl011_can_receive() returns the number of bytes that pl011_receive() can
>> accept, pl011_can_transmit() returns a boolean.
>>
>> I was thinking of:
>>
>> -- >8 --
>> diff --git a/hw/char/pl011.c b/hw/char/pl011.c
>> index dd20b76609..ea5769a31c 100644
>> --- a/hw/char/pl011.c
>> +++ b/hw/char/pl011.c
>> @@ -221,6 +221,11 @@ static inline bool pl011_can_transmit(PL011State *s)
>>        return s->cr & PL011_CR_UARTEN && s->cr & PL011_CR_TXE;
>>    }
>>
>> +static inline bool pl011_can_receive(PL011State *s)
>> +{
>> +    return s->cr & PL011_CR_UARTEN && s->cr & PL011_CR_RXE;
>> +}
>> +
>>    static void pl011_write(void *opaque, hwaddr offset,
>>                            uint64_t value, unsigned size)
>>    {
>> @@ -299,12 +304,12 @@ static void pl011_write(void *opaque, hwaddr offset,
>>        }
>>    }
>>
>> -static int pl011_can_receive(void *opaque)
>> +static int pl011_receivable_bytes(void *opaque)
>>    {
>>        PL011State *s = (PL011State *)opaque;
>>        int r;
>>
>> -    if (!(s->cr & PL011_CR_UARTEN) || !(s->cr & PL011_CR_RXE)) {
>> +    if (!pl011_can_receive(s)) {
>>            r = 0;
>>        } else {
>>            r = s->read_count < pl011_get_fifo_depth(s);
>> @@ -459,7 +464,7 @@ static void pl011_realize(DeviceState *dev, Error
>> **errp)
>>    {
>>        PL011State *s = PL011(dev);
>>
>> -    qemu_chr_fe_set_handlers(&s->chr, pl011_can_receive, pl011_receive,
>> +    qemu_chr_fe_set_handlers(&s->chr, pl011_receivable_bytes,
>> pl011_receive,
>>                                 pl011_event, NULL, s, NULL, true);
>>    }
>>
>> ---
>>
>> with maybe a better name for pl011_receivable_bytes().
> 
> Our standard-ish name for the function you pass to
> qemu_chr_fe_set_handlers() is either foo_can_receive
> or foo_can_read, though. That is followed through in
> the name of the function argument (fd_can_read),
> its type (IOCanReadHandler), and the field it gets stored
> in (CharBackend::chr_can_read). It's not a great convention
> but at least it is a convention...

I agree this deserves a better name; maybe this is not a
convention but I'd expect functions starting with is_* / can_*
to return a boolean value, not a number:

/**
  * IOCanReadHandler: Return the number of bytes that #IOReadHandler can 
accept
  *
  * This function reports how many bytes #IOReadHandler is prepared to 
accept.
  * #IOReadHandler may be invoked with up to this number of bytes.  If this
  * function returns 0 then #IOReadHandler is not invoked.
  *
  * This function is typically called from an event loop.  If the number of
  * bytes changes outside the event loop (e.g. because a vcpu thread 
drained the
  * buffer), then it is necessary to kick the event loop so that this 
function
  * is called again.  aio_notify() or qemu_notify_event() can be used to 
kick
  * the event loop.
  */
typedef int IOCanReadHandler(void *opaque);

Also, maybe using unsigned or size_t type for the return value would
better fit. Anyhow, not really a priority :)

