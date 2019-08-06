Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3A7832A8
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Aug 2019 15:24:19 +0200 (CEST)
Received: from localhost ([::1]:33240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1huzRq-00055i-N9
	for lists+qemu-devel@lfdr.de; Tue, 06 Aug 2019 09:24:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55886)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <groeck7@gmail.com>) id 1huzRI-0004Mm-LO
 for qemu-devel@nongnu.org; Tue, 06 Aug 2019 09:23:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groeck7@gmail.com>) id 1huzRH-00034T-It
 for qemu-devel@nongnu.org; Tue, 06 Aug 2019 09:23:44 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:33476)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <groeck7@gmail.com>) id 1huzRH-00033H-Dg
 for qemu-devel@nongnu.org; Tue, 06 Aug 2019 09:23:43 -0400
Received: by mail-pf1-x441.google.com with SMTP id g2so41516515pfq.0
 for <qemu-devel@nongnu.org>; Tue, 06 Aug 2019 06:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1X+KJzZdF1h/+qkJF98PmRQ3tlXWYL+KJvdnoOekqXM=;
 b=BZ8HciTlk40PxCefGd3z9kuxKJAXe3r2tzi9n69XNzVuS30dddIUfjJ3DChR6vDlWD
 xbvYUmFQqiVe3yBIm239xRY7s/nGUeQZWMU3U6Js7tKR9WsRtInar4G3vGgWVDrFbygl
 F87EPZCX/Sd3v1TUuyLhkbr2VHLQ5pFFY88GjhDr4C2x9Li++oSrsAmZNy6ohmv9mKQz
 Pt0xMbSy0e2IIvCydteAMrMQmD5ZpLCG0WvH19bB3DofVyqEL0u0DCnxKSa4X/VJV1Cm
 WJ/zObKScOzYZHawjnFXePzmoOWXjSbxBMDK+9rIrAi3erFIHzOyE7y/4xosIi8d8BRQ
 Y2GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1X+KJzZdF1h/+qkJF98PmRQ3tlXWYL+KJvdnoOekqXM=;
 b=EBbqVc8Mm49HImetgQ8w6kQb3CT9InAizQAiZsCNSSsGhDAPlupUhs7iwjRWtxxiTn
 OY1Io3V9Nq0iyLq8w7PMeAjwsOZhnCYwnY8M8oSuVtyBWMqAEs3HDyBLzrO9kQ3X69hU
 A7WIJklkTHqkIOnBw2ab+EKfVnJ/V7Bu8Z8d4cMsZPBCIAeOKPzs1GhvDISo8L5oA3G/
 pASKZckyl2S7FQ+m3rvTx3x9IGo1Y97XvLs3dsjSz+MZxo2VGBDS1o/k6vYOkgKAMeOV
 yfFJe89Y3qNp9ntn7YjUulooj7X/1hO7L6onL+N7H7sWXEEmVBQemWe+Dlq3A4mf3uPX
 e5jQ==
X-Gm-Message-State: APjAAAWjr9rmFyWKvyk17O3gA7cv+mPwIuXjf3Lf1VU+J5GA2/04bRNS
 PpTGpz+8fV034gUJw68uoPo=
X-Google-Smtp-Source: APXvYqxyNGV+1zCeczWT4rTapFoHEhwxcu0NdSshN+LqkuJCGTPkgum3Wt/0XUFjK3cJ5ZpsRvV3ag==
X-Received: by 2002:a63:904:: with SMTP id 4mr2850493pgj.19.1565097821435;
 Tue, 06 Aug 2019 06:23:41 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 w132sm89992755pfd.78.2019.08.06.06.23.39
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 06 Aug 2019 06:23:40 -0700 (PDT)
To: Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <1564508710-22909-1-git-send-email-linux@roeck-us.net>
 <160cda6c-63b3-4d52-018e-d282514be2a3@redhat.com>
 <20190802141149.dj7zv5p5wscftvnr@sirius.home.kraxel.org>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <14dfe5ce-d74c-dccd-a62b-753b2efa924b@roeck-us.net>
Date: Tue, 6 Aug 2019 06:23:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190802141149.dj7zv5p5wscftvnr@sirius.home.kraxel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::441
Subject: Re: [Qemu-devel] [PATCH] ehci: Ensure that device is not NULL
 before calling usb_ep_get
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/2/19 7:11 AM, Gerd Hoffmann wrote:
> On Wed, Jul 31, 2019 at 01:08:50PM +0200, Philippe Mathieu-Daudé wrote:
>> On 7/30/19 7:45 PM, Guenter Roeck wrote:
>>> The following assert is seen once in a while while resetting the
>>> Linux kernel.
>>>
>>> qemu-system-x86_64: hw/usb/core.c:734: usb_ep_get:
>>> 	Assertion `dev != NULL' failed.
>>>
>>> The call to usb_ep_get() originates from ehci_execute().
>>> Analysis and debugging shows that p->queue->dev can indeed be NULL
>>> in this function. Add check for this condition and return an error
>>> if it is seen.
>>
>> Your patch is not wrong as it corrects your case, but I wonder why we
>> get there. This assert seems to have catched a bug.
> 
> https://bugzilla.redhat.com//show_bug.cgi?id=1715801 maybe.
> 
>> Gerd, shouldn't we call usb_packet_cleanup() in ehci_reset() rather than
>> ehci_finalize()? Then we shouldn't need this patch.
> 
> The two ehci_queues_rip_all() calls in ehci_reset() should clean up everything
> properly.
> 
> Can you try the patch below to see whenever a ehci_find_device failure is the
> root cause?
> 
> thanks,
>    Gerd
> 
> diff --git a/hw/usb/hcd-ehci.c b/hw/usb/hcd-ehci.c
> index 62dab0592fa2..2b0a57772ed5 100644
> --- a/hw/usb/hcd-ehci.c
> +++ b/hw/usb/hcd-ehci.c
> @@ -1644,6 +1644,10 @@ static EHCIQueue *ehci_state_fetchqh(EHCIState *ehci, int async)
>           q->dev = ehci_find_device(q->ehci,
>                                     get_field(q->qh.epchar, QH_EPCHAR_DEVADDR));
>       }
> +    if (q->dev == NULL) {
> +        fprintf(stderr, "%s: device %d not found\n", __func__,
> +                get_field(q->qh.epchar, QH_EPCHAR_DEVADDR));
> +    }
>   
Turns out I end up seeing that message hundreds of times early on each boot,
no matter which architecture. It is quite obviously a normal operating condition.

Guenter

