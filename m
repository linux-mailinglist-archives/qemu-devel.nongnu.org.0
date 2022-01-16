Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A083048FF09
	for <lists+qemu-devel@lfdr.de>; Sun, 16 Jan 2022 22:16:40 +0100 (CET)
Received: from localhost ([::1]:41460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9CtD-0002OU-OO
	for lists+qemu-devel@lfdr.de; Sun, 16 Jan 2022 16:16:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n9Cqr-0001Tj-Du
 for qemu-devel@nongnu.org; Sun, 16 Jan 2022 16:14:13 -0500
Received: from [2a00:1450:4864:20::536] (port=45821
 helo=mail-ed1-x536.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n9Cqp-0001bY-Ss
 for qemu-devel@nongnu.org; Sun, 16 Jan 2022 16:14:13 -0500
Received: by mail-ed1-x536.google.com with SMTP id z22so57319467edd.12
 for <qemu-devel@nongnu.org>; Sun, 16 Jan 2022 13:14:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=h4gZK+61DEVqTLq+cpUd8en/y1r0q7Cn4h1uexMuhPY=;
 b=Q+l/Wxi3sEFrcj07Oq0lahaDMA9KXyR6RxaT/qHnTev2c7N1+7bmFoVDKtnY0vj/dt
 1WRWfOIiX1IayUUF4p47Wh0xs8SAPVRdPbnnkrfWcP9xj0GSX22I4cmA1Cjl5yWROhB1
 Q3RylBYLUAHnzhu/EK4k09Pk507LzdpME0ZvKCLJYfGxmslXSTkRsZPHE4MFrJcYWeB/
 nYG+tc2+LkFfMj/pi9UzJroBl13IYcy42t2iZBawgU/c+ADmnj+gfdZ6MRI0Kav4Efhi
 LW/9A3hLjlCkWZ3C8RJeTRkl/nOjYwlxpznQUE6ClVUq01XDasUjOG4lqSUvH1YOUM/2
 fh9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=h4gZK+61DEVqTLq+cpUd8en/y1r0q7Cn4h1uexMuhPY=;
 b=JZuTIed08eVNlHOF1Wi7RifPy+z6LQ8JFym7aam9BqA6wYGIKqg7kGjpTIQG26TU5e
 mBkjphkd9mu1aSbtY5RsFF1r4ehFr7UOE4YuorBGbNA6y1CubZuYy44ZiNpkTpj1OC7X
 r0JLvXIHTBUn+d+wko8IGj8pnlxrdxNYsfXgbGxIz1psL5fEp1wtqhTgNOcS0Y3dEShS
 jNwu3jy+RWjHQr9gxF5xxL4ncBuajAxTCz7VHXjbsPjyD0lPwy42CmBD6K3f+fhb/3+W
 vmzNDd1qQT/k6Sws+eVGp8IpbEYiAu1BgsheztHQJUT7gHN5IlpMR33EBksDwXjF2ndy
 HF2A==
X-Gm-Message-State: AOAM532gcs1rJLd7VSOk6jTUOlgIwwPb1TJSDLu0nN7h2dAyg6hs0tCz
 asjTvz4ErKM2SQ+IeKthfrI=
X-Google-Smtp-Source: ABdhPJxhPpXRGv83rjgvjl577LAtW1B6xq6399/gaLQZckHRT+Cqnu4ZXT8VIcuaEA7gU3Gig/PdNA==
X-Received: by 2002:a17:906:f74d:: with SMTP id
 jp13mr6948873ejb.91.1642367650362; 
 Sun, 16 Jan 2022 13:14:10 -0800 (PST)
Received: from [10.101.1.234] ([185.224.57.167])
 by smtp.gmail.com with ESMTPSA id bi21sm686545ejb.189.2022.01.16.13.14.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 Jan 2022 13:14:10 -0800 (PST)
Message-ID: <0a5528c5-9b4c-eb9c-58ef-489efd3dc291@amsat.org>
Date: Sun, 16 Jan 2022 22:14:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [PATCH 3/5] usb/ohci: Move USBPortOps related functions together
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>
References: <cover.1642339238.git.balaton@eik.bme.hu>
 <8e2deb83f2bf2846f9115962e1e2fedf5a56317f.1642339238.git.balaton@eik.bme.hu>
In-Reply-To: <8e2deb83f2bf2846f9115962e1e2fedf5a56317f.1642339238.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::536
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x536.google.com
X-Spam_score_int: 26
X-Spam_score: 2.6
X-Spam_bar: ++
X-Spam_report: (2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 16/1/22 14:20, BALATON Zoltan wrote:
> This also allows removing two forward declarations
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>   hw/usb/hcd-ohci.c | 204 +++++++++++++++++++++++-----------------------
>   1 file changed, 100 insertions(+), 104 deletions(-)

> +static const MemoryRegionOps ohci_mem_ops = {
> +    .read = ohci_mem_read,
> +    .write = ohci_mem_write,
> +    .endianness = DEVICE_LITTLE_ENDIAN,
> +};
> +
> +/* USBPortOps */
> +static void ohci_attach(USBPort *port1)
> +{
> +    OHCIState *s = port1->opaque;
> +    OHCIPort *port = &s->rhport[port1->index];
> +    uint32_t old_state = port->ctrl;
> +
> +    /* set connect status */
> +    port->ctrl |= OHCI_PORT_CCS | OHCI_PORT_CSC;
> +
> +    /* update speed */
> +    if (port->port.dev->speed == USB_SPEED_LOW) {
> +        port->ctrl |= OHCI_PORT_LSDA;
> +    } else {
> +        port->ctrl &= ~OHCI_PORT_LSDA;
> +    }
> +
> +    /* notify of remote-wakeup */
> +    if ((s->ctl & OHCI_CTL_HCFS) == OHCI_USB_SUSPEND) {
> +        ohci_set_interrupt(s, OHCI_INTR_RD);
> +    }
> +
> +    trace_usb_ohci_port_attach(port1->index);
> +
> +    if (old_state != port->ctrl) {
> +        ohci_set_interrupt(s, OHCI_INTR_RHSC);
> +    }
> +}
> +
>   static void ohci_async_cancel_device(OHCIState *ohci, USBDevice *dev)
>   {
>       if (ohci->async_td &&
> @@ -1799,11 +1735,71 @@ static void ohci_async_cancel_device(OHCIState *ohci, USBDevice *dev)
>       }
>   }

We could have ohci_attach() just before ohci*_detach(),
anyhow:

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> -static const MemoryRegionOps ohci_mem_ops = {
> -    .read = ohci_mem_read,
> -    .write = ohci_mem_write,
> -    .endianness = DEVICE_LITTLE_ENDIAN,
> -};
> +static void ohci_child_detach(USBPort *port1, USBDevice *child)
> +{
> +    OHCIState *s = port1->opaque;
> +
> +    ohci_async_cancel_device(s, child);
> +}
> +
> +static void ohci_detach(USBPort *port1)
> +{
> +    OHCIState *s = port1->opaque;
> +    OHCIPort *port = &s->rhport[port1->index];
> +    uint32_t old_state = port->ctrl;
> +
> +    ohci_async_cancel_device(s, port1->dev);
> +
> +    /* set connect status */
> +    if (port->ctrl & OHCI_PORT_CCS) {
> +        port->ctrl &= ~OHCI_PORT_CCS;
> +        port->ctrl |= OHCI_PORT_CSC;
> +    }
> +    /* disable port */
> +    if (port->ctrl & OHCI_PORT_PES) {
> +        port->ctrl &= ~OHCI_PORT_PES;
> +        port->ctrl |= OHCI_PORT_PESC;
> +    }
> +    trace_usb_ohci_port_detach(port1->index);
> +
> +    if (old_state != port->ctrl) {
> +        ohci_set_interrupt(s, OHCI_INTR_RHSC);
> +    }
> +}

