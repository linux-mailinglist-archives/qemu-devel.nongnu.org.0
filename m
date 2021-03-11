Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60258338066
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 23:36:00 +0100 (CET)
Received: from localhost ([::1]:39864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKTuQ-000449-Rf
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 17:35:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lKTt7-0003ZU-2Q
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 17:34:37 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:40342)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lKTt5-0003aN-9L
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 17:34:36 -0500
Received: by mail-wr1-x435.google.com with SMTP id l11so3720105wrp.7
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 14:34:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=O9dC/4jSLDXtNqDy3lRrloyibr/BJp0uaASdHBBupvs=;
 b=Ujyc4QmlXAynEIlRBfPpB9bYtfBuLyf/MfJqyX+zTPCXSyoi9VImnASlUa3ImiBin+
 DdH2tqXu+S4j1K8kokDHb60CYRUxln9pDIen4xVN95Gl+LUY+zyXJLPRBrXvjXtyLHlR
 3MpTk6Zqy937BqW/kMgFO9ExVMtBmbyiw4MLgs/cvgr/avIIBbQo9a6cPRHN1oxaiENO
 qAKRcQXr14LQEusnK2/vwm0dBzUr8FTOIbFG8fLPYM5fojdwTZC5+VpCe2SGo5vd8iJO
 1SN5EWhcZCQ32KJI6XSJS7ax8AOvZJg1kqEJwqu7KjCg6wSIqkb4EmoqzpydpXLxS5Pr
 /Z3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=O9dC/4jSLDXtNqDy3lRrloyibr/BJp0uaASdHBBupvs=;
 b=daVtbHmUjCwlNE46n+kVPCn51bcB/SMIfj6A5fEldCFlXq83kVHx8kxxTgObwhlZdT
 fIMjRv1o0rmwvQNAQpGpKBlo8gjPwxw0B4pnzLivGIDtd64xFKCZzncffq3y6DC08iRk
 sdaob8UCo5BGsFGg4tS0VGVoJ3sNWGnM69VR4VEg+0GlIEWx3b4FBejBAZ4r/JiJWhiY
 Wp7nc0kmsemE88yVlscBIdQwqzeSu0/VtlNCAfXa43tK2mcLIz6DYgh+UisybYHtpZ60
 hFx1eIlRxDQ9H9w8ali28Gh0mvj4KMhtfIODqCOyKcm3CLylX9kaRnMcMyI3ZUMd7Voj
 IFPA==
X-Gm-Message-State: AOAM53258vB+BIpJ6y5dzQYgeFPhtzUjHMt+j/bT0Mpkm8iXuAqibPil
 p6m4sPDvQiKwEznoK1H7K+y+98dPCL4=
X-Google-Smtp-Source: ABdhPJyWZ/0zqd3a3eu92uP/Rj21okaq/qY7DROlczUc4xT+DHPU1vIwbVqAEiITjGBBegLpXZM8hA==
X-Received: by 2002:adf:e805:: with SMTP id o5mr11238841wrm.196.1615502073005; 
 Thu, 11 Mar 2021 14:34:33 -0800 (PST)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id r2sm5465704wrt.8.2021.03.11.14.34.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Mar 2021 14:34:32 -0800 (PST)
Subject: Re: [PULL 5/9] char: add goldfish-tty
To: Laurent Vivier <laurent@vivier.eu>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210311210934.1935587-1-laurent@vivier.eu>
 <20210311210934.1935587-6-laurent@vivier.eu>
 <CAFEAcA8jAYc06s8N4hsYYDN2=PSB4SxQwvoBeAea7_4Yj1XptQ@mail.gmail.com>
 <e52c7b57-8aa8-42b8-1002-dc52a80658ed@vivier.eu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <302a7840-b7f5-2abf-68ab-2b44aeb44402@amsat.org>
Date: Thu, 11 Mar 2021 23:34:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <e52c7b57-8aa8-42b8-1002-dc52a80658ed@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/11/21 11:04 PM, Laurent Vivier wrote:
> Le 11/03/2021 à 22:57, Peter Maydell a écrit :
>> On Thu, 11 Mar 2021 at 21:22, Laurent Vivier <laurent@vivier.eu> wrote:
>>>
>>> Implement the goldfish tty device as defined in
>>>
>>> https://android.googlesource.com/platform/external/qemu/+/master/docs/GOLDFISH-VIRTUAL-HARDWARE.TXT
>>>
>>> and based on the kernel driver code:
>>>
>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/tty/goldfish.c
>>>
>>> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
>>> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>> Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>> Message-Id: <20210309195941.763896-2-laurent@vivier.eu>
>>> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
>>
>> I didn't notice this earlier, but this looks odd:
>>
>>> +static uint64_t goldfish_tty_read(void *opaque, hwaddr addr,
>>> +                                  unsigned size)
>>> +{
>>> +    GoldfishTTYState *s = opaque;
>>> +    uint64_t value = 0;
>>> +
>>> +    switch (addr) {
>>> +    case REG_BYTES_READY:
>>> +        value = fifo8_num_used(&s->rx_fifo);
>>> +        break;
>>> +    case REG_VERSION:
>>> +        value = 0;
>>
>> You report as a version 0 Goldfish TTY device.
>> This is the old kind that used guest virtual addresses,
>> unlike the more sensible version 1 ("ranchu") kind that uses
>> physical addresses.
>>
>> You can see this in the kernel driver code:
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/tty/goldfish.c
>> where it looks at qtty->version.


>>
>>> +    case CMD_WRITE_BUFFER:
>>> +        len = s->data_len;
>>> +        ptr = s->data_ptr;
>>> +        while (len) {
>>> +            to_copy = MIN(GOLFISH_TTY_BUFFER_SIZE, len);
>>> +
>>> +            address_space_rw(&address_space_memory, ptr,
>>> +                             MEMTXATTRS_UNSPECIFIED, data_out, to_copy, 0);
>>> +            qemu_chr_fe_write_all(&s->chr, data_out, to_copy);
>>> +
>>> +            len -= to_copy;
>>> +            ptr += to_copy;
>>> +        }
>>> +        break;
>>> +    case CMD_READ_BUFFER:
>>> +        len = s->data_len;
>>> +        ptr = s->data_ptr;
>>> +        while (len && !fifo8_is_empty(&s->rx_fifo)) {
>>> +            buf = (uint8_t *)fifo8_pop_buf(&s->rx_fifo, len, &to_copy);
>>> +            address_space_rw(&address_space_memory, ptr,
>>> +                            MEMTXATTRS_UNSPECIFIED, buf, to_copy, 1);
>>> +
>>> +            len -= to_copy;
>>> +            ptr += to_copy;
>>> +        }
>>
>> ...but here you're treating the data pointer value from the
>> guest like a physical address. I'm not sure how this works.
>>
>> (This is one of the areas where you need to be really cautious about
>> using the goldfish devices -- "device model gets virtual addresses from
>> guest OS" is a really bad design.)
> 
> Thank you Peter.
> 
> I will resend the pull request without the virt m68k machine part.

Laurent, if the issue Peter reported is only for the goldfish-tty,
you might consider merging the m68k-virt with only virtio-serial
console for 6.0...

