Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4785F1F3609
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Jun 2020 10:23:09 +0200 (CEST)
Received: from localhost ([::1]:39762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jiZXI-0005Bi-BQ
	for lists+qemu-devel@lfdr.de; Tue, 09 Jun 2020 04:23:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiZWH-0004go-6Z
 for qemu-devel@nongnu.org; Tue, 09 Jun 2020 04:22:05 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:53950
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiZWG-0007cJ-9v
 for qemu-devel@nongnu.org; Tue, 09 Jun 2020 04:22:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591690923;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=21NyEacVBP4fp1aZWC6hKRegx6q9PK+3ZBJQYeJUGzw=;
 b=WvTSvvCIPhXqEbY8mwf2FS6LUKH6tUVAiYvztD7cDQHM1FsykigtSAh4047K6vhyT0RhEj
 S0uWA9VukkOMyffPxQUgjrK/ntqVdYRnzk43+fI4kRn0tBsEkEJLhjbQLCbL/UAuYkRWWO
 Tc1+BbLWiE5CKyLoyRaCRBw9LeVK9MU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-97-LR4sjRtxMWq8JbewDRflzA-1; Tue, 09 Jun 2020 04:22:02 -0400
X-MC-Unique: LR4sjRtxMWq8JbewDRflzA-1
Received: by mail-wr1-f71.google.com with SMTP id c14so8267385wrm.15
 for <qemu-devel@nongnu.org>; Tue, 09 Jun 2020 01:22:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=21NyEacVBP4fp1aZWC6hKRegx6q9PK+3ZBJQYeJUGzw=;
 b=Oi38nlQfPusVvYxcLjBFqQ84vrPCBxRLq+iw3lfN4UbG5ZfOM5Jo/3QLWjVd1ZO2Mj
 KssSEwaoyN39jpWcY9nkO+rZvVrMnvzC3+YDyLs2jrd4nI//NTXOHqiD+3i9tc53qhN9
 6kvT0k3L4O8dn/HvC9Xl2NHpJnq2bfbcSWVy+HvyOD2JS31tZ7DHQRzYEL0RSJGlbEdI
 lwV0K3vzXl5WZCRnGtTeL33iiR2V+vSJCVNh4MQrT9YNDSvGr5xJJilVKvhcrXEYGNtc
 MdyM0NQZ2AVx/YvenvzAxglTkpp3CFoiICK4Jh5xWONw4oLjdewhGEqpLE7D+3kXV2qQ
 vB6Q==
X-Gm-Message-State: AOAM532Tcr+LcNx9mRBkOt6XRXFSCfos1UHyPljdDkTw6Jhoojjz6mUY
 aFeLzB5Jj4hVONOOm75lfiEHnhzJpc5dXN2VsHO2vCEiZ/XI8ELe4bY+DpgQyYMbaQk35vqFPvM
 hWhh+hrfooTo+wx0=
X-Received: by 2002:a1c:7e52:: with SMTP id z79mr2953596wmc.104.1591690921139; 
 Tue, 09 Jun 2020 01:22:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzDIGGC1nOOdgfhaXHBjzkx/oYvosy2VSSKNynKeVlsUxde3G8aHNjiJGMzz42+W/PZgKKFng==
X-Received: by 2002:a1c:7e52:: with SMTP id z79mr2953578wmc.104.1591690920899; 
 Tue, 09 Jun 2020 01:22:00 -0700 (PDT)
Received: from [192.168.1.38] (181.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id o6sm2428408wrp.3.2020.06.09.01.21.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jun 2020 01:22:00 -0700 (PDT)
Subject: Re: [PATCH v2 26/58] usb: New usb_new(), usb_realize_and_unref()
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20200529134523.8477-1-armbru@redhat.com>
 <20200529134523.8477-27-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Autocrypt: addr=philmd@redhat.com; keydata=
 mQINBDXML8YBEADXCtUkDBKQvNsQA7sDpw6YLE/1tKHwm24A1au9Hfy/OFmkpzo+MD+dYc+7
 bvnqWAeGweq2SDq8zbzFZ1gJBd6+e5v1a/UrTxvwBk51yEkadrpRbi+r2bDpTJwXc/uEtYAB
 GvsTZMtiQVA4kRID1KCdgLa3zztPLCj5H1VZhqZsiGvXa/nMIlhvacRXdbgllPPJ72cLUkXf
 z1Zu4AkEKpccZaJspmLWGSzGu6UTZ7UfVeR2Hcc2KI9oZB1qthmZ1+PZyGZ/Dy+z+zklC0xl
 XIpQPmnfy9+/1hj1LzJ+pe3HzEodtlVA+rdttSvA6nmHKIt8Ul6b/h1DFTmUT1lN1WbAGxmg
 CH1O26cz5nTrzdjoqC/b8PpZiT0kO5MKKgiu5S4PRIxW2+RA4H9nq7nztNZ1Y39bDpzwE5Sp
 bDHzd5owmLxMLZAINtCtQuRbSOcMjZlg4zohA9TQP9krGIk+qTR+H4CV22sWldSkVtsoTaA2
 qNeSJhfHQY0TyQvFbqRsSNIe2gTDzzEQ8itsmdHHE/yzhcCVvlUzXhAT6pIN0OT+cdsTTfif
 MIcDboys92auTuJ7U+4jWF1+WUaJ8gDL69ThAsu7mGDBbm80P3vvUZ4fQM14NkxOnuGRrJxO
 qjWNJ2ZUxgyHAh5TCxMLKWZoL5hpnvx3dF3Ti9HW2dsUUWICSQARAQABtDJQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoUGhpbCkgPHBoaWxtZEByZWRoYXQuY29tPokCVQQTAQgAPwIbDwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4AWIQSJweePYB7obIZ0lcuio/1u3q3A3gUCXsfWwAUJ
 KtymWgAKCRCio/1u3q3A3ircD/9Vjh3aFNJ3uF3hddeoFg1H038wZr/xi8/rX27M1Vj2j9VH
 0B8Olp4KUQw/hyO6kUxqkoojmzRpmzvlpZ0cUiZJo2bQIWnvScyHxFCv33kHe+YEIqoJlaQc
 JfKYlbCoubz+02E2A6bFD9+BvCY0LBbEj5POwyKGiDMjHKCGuzSuDRbCn0Mz4kCa7nFMF5Jv
 piC+JemRdiBd6102ThqgIsyGEBXuf1sy0QIVyXgaqr9O2b/0VoXpQId7yY7OJuYYxs7kQoXI
 6WzSMpmuXGkmfxOgbc/L6YbzB0JOriX0iRClxu4dEUg8Bs2pNnr6huY2Ft+qb41RzCJvvMyu
 gS32LfN0bTZ6Qm2A8ayMtUQgnwZDSO23OKgQWZVglGliY3ezHZ6lVwC24Vjkmq/2yBSLakZE
 6DZUjZzCW1nvtRK05ebyK6tofRsx8xB8pL/kcBb9nCuh70aLR+5cmE41X4O+MVJbwfP5s/RW
 9BFSL3qgXuXso/3XuWTQjJJGgKhB6xXjMmb1J4q/h5IuVV4juv1Fem9sfmyrh+Wi5V1IzKI7
 RPJ3KVb937eBgSENk53P0gUorwzUcO+ASEo3Z1cBKkJSPigDbeEjVfXQMzNt0oDRzpQqH2vp
 apo2jHnidWt8BsckuWZpxcZ9+/9obQ55DyVQHGiTN39hkETy3Emdnz1JVHTU0Q==
Message-ID: <ba191edb-1b8f-5159-9a55-5fec74da97d8@redhat.com>
Date: Tue, 9 Jun 2020 10:21:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200529134523.8477-27-armbru@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/09 01:38:49
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/29/20 3:44 PM, Markus Armbruster wrote:
> I'm converting from qdev_create()/qdev_init_nofail() to
> qdev_new()/qdev_realize_and_unref(); recent commit "qdev: New
> qdev_new(), qdev_realize(), etc." explains why.
> 
> USB devices use qdev_create() through usb_create().
> 
> Provide usb_new() and usb_realize_and_unref() for converting USB
> devices.
> 
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  include/hw/usb.h |  2 ++
>  hw/usb/bus.c     | 10 ++++++++++
>  2 files changed, 12 insertions(+)
> 
> diff --git a/include/hw/usb.h b/include/hw/usb.h
> index 1cf1cd9584..2d2730f161 100644
> --- a/include/hw/usb.h
> +++ b/include/hw/usb.h
> @@ -534,6 +534,8 @@ USBBus *usb_bus_find(int busnr);
>  void usb_legacy_register(const char *typename, const char *usbdevice_name,
>                           USBDevice *(*usbdevice_init)(USBBus *bus,
>                                                        const char *params));
> +USBDevice *usb_new(const char *name);
> +bool usb_realize_and_unref(USBDevice *dev, USBBus *bus, Error **errp);
>  USBDevice *usb_create(USBBus *bus, const char *name);
>  USBDevice *usb_create_simple(USBBus *bus, const char *name);
>  USBDevice *usbdevice_create(const char *cmdline);
> diff --git a/hw/usb/bus.c b/hw/usb/bus.c
> index d28eff1b5c..6b0d9f9e4d 100644
> --- a/hw/usb/bus.c
> +++ b/hw/usb/bus.c
> @@ -314,6 +314,16 @@ void usb_legacy_register(const char *typename, const char *usbdevice_name,
>      }
>  }
>  
> +USBDevice *usb_new(const char *name)
> +{
> +    return USB_DEVICE(qdev_new(name));
> +}
> +
> +bool usb_realize_and_unref(USBDevice *dev, USBBus *bus, Error **errp)
> +{
> +    return qdev_realize_and_unref(&dev->qdev, &bus->qbus, errp);
> +}
> +
>  USBDevice *usb_create(USBBus *bus, const char *name)
>  {
>      DeviceState *dev;
> 

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


