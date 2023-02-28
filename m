Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 119B86A5A70
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 14:56:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX0RB-0004eZ-0C; Tue, 28 Feb 2023 08:54:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pX0Qv-0004dk-WC
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 08:54:22 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pX0Qu-00053P-7H
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 08:54:21 -0500
Received: by mail-wr1-x42d.google.com with SMTP id bv17so9837491wrb.5
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 05:54:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bZKLH05Cgp31hRT5SgH5HMUanbSwsQbOHUxr/L/jnKM=;
 b=QzTYOmfSBT2+EWH4aaPx+KPIY4LtUafRtC6tGcGbh23mRmMZ9+izRvJ9Z+Wh7+vbiM
 X7qsMo7461A3fsgt4zoSRH5hfwtyNSqSeX5RHzaPOuDlzije8QcYgWEAvaBADu1xgupq
 FflJ9CDakNigJQGmrgEVyLRRIph+MdDcTQkxqjt8extpA/h436/s0BT34Ot9Yx8rFTXD
 3SPgy+P+Rhil0KmzuivzSsswRXXsFXSeRwcfAnAfvhROKujbkxKRJKiGUaTEvztEgs9U
 8ka/8M+olzaphYWcU72kHWzsxcS/9XH4qC6y7kFXsg9jHoF6sn2tc0OMboBgtlPnCGeI
 7HsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bZKLH05Cgp31hRT5SgH5HMUanbSwsQbOHUxr/L/jnKM=;
 b=iiZmX22KcqTw5i1FpZtt1LCzdRYf4lttlyoyE9HkiwHaafVPbGiMlCRYxldx9hXTg3
 TPFbBORZfsfI3RaxQWDlA3Yf/VesnEhRrGQ95y+UjpQ2iQgdNoXPEgVS06/UIOpDvEji
 xN2pNAbsiBKg2NAV5rvtNYG07fq3MXmdFrgNu+ZdA0BH/zYkhylQcRWw6Bf1yDnGMZHn
 8iWag4ZiDScuRlxbU/MUL8ilcZAtsrzJzWo7G0Wkm7PDrmXiXJipnZ4iHO53X1caYT2T
 Y1KJHAyYFrPKdPwpfvhK6Kk3UArfitxSnMMq55mwIhI25twcTPzex7hhtGn8w3syKpgG
 7+WA==
X-Gm-Message-State: AO0yUKXLIznIsWk6pMfx7UXtUBW6iSlgmXKk2qvGlPAQtadgKimyPz7S
 qsF1q6mXSoShpTuiJ8Mx4F4H/w==
X-Google-Smtp-Source: AK7set+boCdMf9ZF7gR3h2gFAH2rguSxiyRdlQSjZdSXjgDne4XftCm3W10sBlnHO2D31pF3D8WTWw==
X-Received: by 2002:a5d:4e4d:0:b0:2c7:1159:ea43 with SMTP id
 r13-20020a5d4e4d000000b002c71159ea43mr2453035wrt.51.1677592458450; 
 Tue, 28 Feb 2023 05:54:18 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 a5-20020a5d4565000000b002c3f81c51b6sm9738901wrc.90.2023.02.28.05.54.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Feb 2023 05:54:17 -0800 (PST)
Message-ID: <9d4b7238-23f4-1ea8-10d9-6b73f4c026ec@linaro.org>
Date: Tue, 28 Feb 2023 14:54:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 6/7] usb/ohci: Implement resume on connection status
 change
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <cover.1676916639.git.balaton@eik.bme.hu>
 <35c4d4ccf2f73e6a87cdbd28fb6a1b33de72ed74.1676916640.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <35c4d4ccf2f73e6a87cdbd28fb6a1b33de72ed74.1676916640.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.092,
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

On 20/2/23 19:19, BALATON Zoltan wrote:
> If certain bit is set remote wake up should change state from
> suspended to resume and generate interrupt. There was a todo comment
> for this, implement that by moving existing resume logic to a function
> and call that.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>   hw/usb/hcd-ohci.c | 23 +++++++++++++++++------
>   1 file changed, 17 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/usb/hcd-ohci.c b/hw/usb/hcd-ohci.c
> index bad8db7b1d..88bd42b14a 100644
> --- a/hw/usb/hcd-ohci.c
> +++ b/hw/usb/hcd-ohci.c
> @@ -1410,6 +1410,18 @@ static void ohci_set_hub_status(OHCIState *ohci, uint32_t val)
>       }
>   }
>   
> +/* This is the one state transition the controller can do by itself */
> +static int ohci_resume(OHCIState *s)

Preferably returning bool.

> +{
> +    if ((s->ctl & OHCI_CTL_HCFS) == OHCI_USB_SUSPEND) {
> +        trace_usb_ohci_remote_wakeup(s->name);
> +        s->ctl &= ~OHCI_CTL_HCFS;
> +        s->ctl |= OHCI_USB_RESUME;
> +        return 1;
> +    }
> +    return 0;
> +}
> +
>   /*
>    * Sets a flag in a port status reg but only set it if the port is connected.
>    * If not set ConnectStatusChange flag. If flag is enabled return 1.
> @@ -1426,7 +1438,10 @@ static int ohci_port_set_if_connected(OHCIState *ohci, int i, uint32_t val)
>       if (!(ohci->rhport[i].ctrl & OHCI_PORT_CCS)) {
>           ohci->rhport[i].ctrl |= OHCI_PORT_CSC;

// ConnectStatusChange

>           if (ohci->rhstatus & OHCI_RHS_DRWE) {

// DeviceRemoteWakeupEnable: ConnectStatusChange is a remote wakeup event.

> -            /* TODO: CSC is a wakeup event */
> +            /* CSC is a wakeup event */
> +            if (ohci_resume(ohci)) {
> +                ohci_set_interrupt(ohci, OHCI_INTR_RD);

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Gerd, if you Ack I can queue this.

> +            }
>           }
>           return 0;
>       }
> @@ -1828,11 +1843,7 @@ static void ohci_wakeup(USBPort *port1)
>           intr = OHCI_INTR_RHSC;
>       }
>       /* Note that the controller can be suspended even if this port is not */
> -    if ((s->ctl & OHCI_CTL_HCFS) == OHCI_USB_SUSPEND) {
> -        trace_usb_ohci_remote_wakeup(s->name);
> -        /* This is the one state transition the controller can do by itself */
> -        s->ctl &= ~OHCI_CTL_HCFS;
> -        s->ctl |= OHCI_USB_RESUME;
> +    if (ohci_resume(s)) {
>           /*
>            * In suspend mode only ResumeDetected is possible, not RHSC:
>            * see the OHCI spec 5.1.2.3.


