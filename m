Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B03318F97
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 17:12:14 +0100 (CET)
Received: from localhost ([::1]:52382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAEZg-0001av-MD
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 11:12:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rosbrookn@gmail.com>)
 id 1lAETf-0002Z8-78
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 11:05:59 -0500
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130]:36177)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rosbrookn@gmail.com>)
 id 1lAETc-0006L5-B3
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 11:05:57 -0500
Received: by mail-lf1-x130.google.com with SMTP id f1so8838009lfu.3
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 08:05:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IjfuZ67VbjjWaTMEiyg9dFXZSVe5S8AOmUmwSF43FA4=;
 b=E7maDihgV90h0zU6bhbT0I1sVeyHa24BV4GZlhCWkVDtbo/TSZJ9cCjeg00qsLuZcL
 qb6Dayyy0QGhzQ7MAUUvjUzH/u/17btLKboUh3GDc5jHiBhMvQyzy/zanRuuKOEZs+tD
 X7oBBnRq36U0H+fY04fVDLH1q6yFp4DLZnMHymDyB6GiDIToEh0uxP59g1puYob3soK8
 MX3RH2z5pzH3ZAoWHkaKDw1goljKISbRftAYmcovurEN/7y2fv4nDpgZSNH/h0FW5y8K
 /PYspuPnWvAIbFL15T0b0KrPB3ZRBEM/iNOhFevudP/2b9+ewGSLT48R0hDU1Y+TIfmY
 DM4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IjfuZ67VbjjWaTMEiyg9dFXZSVe5S8AOmUmwSF43FA4=;
 b=oM3gq2b3ueNPmKhPggwermMC0Lb/ELbrlu9v3AGt4Hbtgg9vs/tZXqK7afMD4gRX15
 JGFWL7Q4oRHu/ot7GtV4yJAlpZwPLNZLW342IhOUaetmAC50ogjX+gx0QtZ26sz2Fo9/
 AdImIcYV7BZEkk6/E56uZmsQ99RMXD/JabtjBlPP3ZFmsHWOPWw9ZJvFvL0ukbXtb03B
 62Q/iUVcyFwyyY83+UVLWGIUiTLfXjbLYaIOaiaIJFRemyVqDPoiWhkmlYV4ttxlq97D
 8gzCmI3Uez4IslKLw4eFKMjCktq3TKzqsdHkO1DcvaNz71gpS6WZvRJcq/fHTWG6jYem
 nIWg==
X-Gm-Message-State: AOAM532eCjJuntEO7u+RLtOSH0ZK88HlwjMEiWX6jlR5A2QuHLNcIX/x
 lhvRQkIGR9TknmhqzRGsdtsfd6TUvIZZu0bsrB1950YYGIjiKg==
X-Google-Smtp-Source: ABdhPJz8Wzh4dXcKuQ0x+2X3S3xf90OaWtumCAnb+51v9vN0kkZQJBo1mFyLPqfE6hgiCAXH4B3gA33wkVcU0m+p9m8=
X-Received: by 2002:a05:6512:b15:: with SMTP id
 w21mr4683863lfu.645.1613059552704; 
 Thu, 11 Feb 2021 08:05:52 -0800 (PST)
MIME-Version: 1.0
References: <20210201213021.500277-1-rosbrookn@ainfosec.com>
In-Reply-To: <20210201213021.500277-1-rosbrookn@ainfosec.com>
From: Nick Rosbrook <rosbrookn@gmail.com>
Date: Thu, 11 Feb 2021 11:05:41 -0500
Message-ID: <CAEBZRScKAU3PdbiZQvXou41J+5cFXcOj=KUB0dYnC2y1BCbH-w@mail.gmail.com>
Subject: Re: [PATCH] usb-host: use correct altsetting in usb_host_ep_update
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::130;
 envelope-from=rosbrookn@gmail.com; helo=mail-lf1-x130.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

Just wanted to ping this. Patchwork link is here:
https://patchwork.kernel.org/project/qemu-devel/patch/20210201213021.500277-1-rosbrookn@ainfosec.com/.

Thanks,
NR

On Mon, Feb 1, 2021 at 4:30 PM Nick Rosbrook <rosbrookn@gmail.com> wrote:
>
> In order to keep track of the alternate setting that should be used for
> a given interface, the USBDevice struct keeps an array of alternate
> setting values, which is indexed by the interface number. In
> usb_host_set_interface, when this array is updated, usb_host_ep_update
> is called as a result. However, when usb_host_ep_update accesses the
> active libusb_config_descriptor, it indexes udev->altsetting with the
> loop variable, rather than the interface number.
>
> With the simple trace backend enable, this behavior can be seen:
>
>   [...]
>
>   usb_xhci_xfer_start 0.440 pid=1215 xfer=0x5596a4b85930 slotid=0x1 epid=0x1 streamid=0x0
>   usb_packet_state_change 1.703 pid=1215 bus=0x1 port=b'1' ep=0x0 p=0x5596a4b85938 o=b'undef' n=b'setup'
>   usb_host_req_control 2.269 pid=1215 bus=0x1 addr=0x5 p=0x5596a4b85938 req=0x10b value=0x1 index=0xd
>   usb_host_set_interface 0.449 pid=1215 bus=0x1 addr=0x5 interface=0xd alt=0x1
>   usb_host_parse_config 2542.648 pid=1215 bus=0x1 addr=0x5 value=0x2 active=0x1
>   usb_host_parse_interface 1.804 pid=1215 bus=0x1 addr=0x5 num=0xc alt=0x0 active=0x1
>   usb_host_parse_endpoint 2.012 pid=1215 bus=0x1 addr=0x5 ep=0x2 dir=b'in' type=b'int' active=0x1
>   usb_host_parse_interface 1.598 pid=1215 bus=0x1 addr=0x5 num=0xd alt=0x0 active=0x1
>   usb_host_req_emulated 3.593 pid=1215 bus=0x1 addr=0x5 p=0x5596a4b85938 status=0x0
>   usb_packet_state_change 2.550 pid=1215 bus=0x1 port=b'1' ep=0x0 p=0x5596a4b85938 o=b'setup' n=b'complete'
>   usb_xhci_xfer_success 4.298 pid=1215 xfer=0x5596a4b85930 bytes=0x0
>
>   [...]
>
> In particular, it is seen that although usb_host_set_interface sets the
> alternate setting of interface 0xd to 0x1, usb_host_ep_update uses 0x0
> as the alternate setting due to using the incorrect index to
> udev->altsetting.
>
> Fix this problem by getting the interface number from the active
> libusb_config_descriptor, and then using that as the index to
> udev->altsetting.
>
> Signed-off-by: Nick Rosbrook <rosbrookn@ainfosec.com>
> ---
>  hw/usb/host-libusb.c | 18 +++++++++++++++---
>  1 file changed, 15 insertions(+), 3 deletions(-)
>
> diff --git a/hw/usb/host-libusb.c b/hw/usb/host-libusb.c
> index fcf48c0193..6ab75e2feb 100644
> --- a/hw/usb/host-libusb.c
> +++ b/hw/usb/host-libusb.c
> @@ -810,7 +810,7 @@ static void usb_host_ep_update(USBHostDevice *s)
>      struct libusb_ss_endpoint_companion_descriptor *endp_ss_comp;
>  #endif
>      uint8_t devep, type;
> -    int pid, ep;
> +    int pid, ep, alt;
>      int rc, i, e;
>
>      usb_ep_reset(udev);
> @@ -822,8 +822,20 @@ static void usb_host_ep_update(USBHostDevice *s)
>                                  conf->bConfigurationValue, true);
>
>      for (i = 0; i < conf->bNumInterfaces; i++) {
> -        assert(udev->altsetting[i] < conf->interface[i].num_altsetting);
> -        intf = &conf->interface[i].altsetting[udev->altsetting[i]];
> +        /*
> +         * The udev->altsetting array indexes alternate settings
> +         * by the interface number. Get the 0th alternate setting
> +         * first so that we can grab the interface number, and
> +         * then correct the alternate setting value if necessary.
> +         */
> +        intf = &conf->interface[i].altsetting[0];
> +        alt = udev->altsetting[intf->bInterfaceNumber];
> +
> +        if (alt != 0) {
> +            assert(alt < conf->interface[i].num_altsetting);
> +            intf = &conf->interface[i].altsetting[alt];
> +        }
> +
>          trace_usb_host_parse_interface(s->bus_num, s->addr,
>                                         intf->bInterfaceNumber,
>                                         intf->bAlternateSetting, true);
> --
> 2.17.1
>

