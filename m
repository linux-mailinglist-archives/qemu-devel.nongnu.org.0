Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F324368DF14
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 18:37:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPRuG-0003pA-B5; Tue, 07 Feb 2023 12:37:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pPRuF-0003p2-0s
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 12:37:23 -0500
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pPRuD-0004FT-Dh
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 12:37:22 -0500
Received: by mail-pf1-x434.google.com with SMTP id n2so11300784pfo.3
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 09:37:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8EFvFYppua3ANVEsvvVtBU5mHBwkpaXwQL8zsT7i9sk=;
 b=TUkB5g8WGHlSe4ESXjDkBm7hBy1aeI+BWm4k61ozLbJP+OCqr1ANq7rMjHL27HaoIO
 2ArH3qFOeWM3qG8uvMZchD9g+vBKq3XVjvjXJzZFNMwRzWIUfWBGNzFV9MjRzDrAxYuL
 DOMlU6AaYKop+blkr175I8/O/wKFNHtsWlS6gtHMY51E3oDm+8vdEg5cbLUUk6SdcgDg
 V46V+ySbqwS7QR6XWgPQv+Y3UieLxn7F2tonOHxJtaHo7T3K1Hh0/f7014+k/oACR8qY
 53gEjdcKuiUZfR/QvdRmq1y19J1eWepz6lh4JKhP6lw1KLZwoaO4w+Y8HoUSZ7SYRlEp
 Sgyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8EFvFYppua3ANVEsvvVtBU5mHBwkpaXwQL8zsT7i9sk=;
 b=R/5zJeJRk+XZpImYsUMitDrtkDrRBP5wKqvhAefXQGD7TJx1ZsduWnY+qP6tr7up+W
 3VxiigrlIBYpWmP5WNw2+MRDK3GXo5Lry5hNq+U9H1YfdvdVzOEXXg6rCitf9Ini2gvR
 OcYu+U8pHGqEROIY+4unCRk6ntp+UsrdiJ0YlxbWYyIft5Bl3w5Rbt1CyXtB9gXZDGld
 tilqliivj58rvzRAhfDCb9oXs2thuYvyVEjJdp3f27qTuO0rbPbCnUAMb+wT6HGlljGx
 sZBeamyEAWehwe25VECnOk8ZpvJLMDJRSZ6Y0t++u1Or+5Tlh4bkzYcXFUTwmoa7Gzup
 vHgg==
X-Gm-Message-State: AO0yUKUbh4Du7HSKestWsrszJ00mQIEQ01cxsqfnDq+W3nYK7DvRlpPC
 9aY1/Taf1rQF8ECCym14v+Cr/X5Yw8JevkaxRmaogw==
X-Google-Smtp-Source: AK7set/MjyXIcdcHBxHybmwKPhfFH/Nu8+mJjyD3gTLsROrrUmMecCMZQptKriBCmAhO95ReJA5RWM/VDiYfFrySpec=
X-Received: by 2002:a63:7207:0:b0:4fa:b562:f29a with SMTP id
 n7-20020a637207000000b004fab562f29amr729098pgc.120.1675791438889; Tue, 07 Feb
 2023 09:37:18 -0800 (PST)
MIME-Version: 1.0
References: <cover.1675193329.git.balaton@eik.bme.hu>
 <ca6b5e2b87d9e0c9edb361227bb45c29b3ceeff6.1675193329.git.balaton@eik.bme.hu>
In-Reply-To: <ca6b5e2b87d9e0c9edb361227bb45c29b3ceeff6.1675193329.git.balaton@eik.bme.hu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Feb 2023 17:37:07 +0000
Message-ID: <CAFEAcA9A8rhFqfgGfZXfuDCiTdogL7j41g74ZgcxPxoeMDc3AQ@mail.gmail.com>
Subject: Re: [PATCH 6/6] usb/ohci: Implement resume on connection status change
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>, 
 Howard Spoelstra <hsp.cat7@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Tue, 31 Jan 2023 at 19:39, BALATON Zoltan <balaton@eik.bme.hu> wrote:
>
> If certain bit is set remote wake up should change state from
> suspended to resume and generate interrupt. There was a todo comment
> for this, implement that by moving existing resume logic to a function
> and call that.
>
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>  hw/usb/hcd-ohci.c | 23 +++++++++++++++++------
>  1 file changed, 17 insertions(+), 6 deletions(-)
>
> diff --git a/hw/usb/hcd-ohci.c b/hw/usb/hcd-ohci.c
> index c5bec4e4d7..7f98ab8924 100644
> --- a/hw/usb/hcd-ohci.c
> +++ b/hw/usb/hcd-ohci.c
> @@ -1401,6 +1401,18 @@ static void ohci_set_hub_status(OHCIState *ohci, uint32_t val)
>      }
>  }
>
> +/* This is the one state transition the controller can do by itself */
> +static int ohci_resume(OHCIState *s)
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
>  /*
>   * Sets a flag in a port status reg but only set it if the port is connected.
>   * If not set ConnectStatusChange flag. If flag is enabled return 1.
> @@ -1417,7 +1429,10 @@ static int ohci_port_set_if_connected(OHCIState *ohci, int i, uint32_t val)
>      if (!(ohci->rhport[i].ctrl & OHCI_PORT_CCS)) {
>          ohci->rhport[i].ctrl |= OHCI_PORT_CSC;
>          if (ohci->rhstatus & OHCI_RHS_DRWE) {
> -            /* TODO: CSC is a wakeup event */
> +            /* CSC is a wakeup event */
> +            if (ohci_resume(ohci)) {
> +                ohci_set_interrupt(ohci, OHCI_INTR_RD);
> +            }
>          }
>          return 0;
>      }
> @@ -1820,11 +1835,7 @@ static void ohci_wakeup(USBPort *port1)
>          intr = OHCI_INTR_RHSC;
>      }
>      /* Note that the controller can be suspended even if this port is not */
> -    if ((s->ctl & OHCI_CTL_HCFS) == OHCI_USB_SUSPEND) {
> -        trace_usb_ohci_remote_wakeup(s->name);
> -        /* This is the one state transition the controller can do by itself */

I think we should retain this comment in the factored-out function.

> -        s->ctl &= ~OHCI_CTL_HCFS;
> -        s->ctl |= OHCI_USB_RESUME;
> +    if (ohci_resume(s)) {
>          /*
>           * In suspend mode only ResumeDetected is possible, not RHSC:
>           * see the OHCI spec 5.1.2.3.

Otherwise I'll leave this one for Gerd to review since it's
USB spec stuff.

thanks
-- PMM

