Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD842BAF6C
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 16:58:59 +0100 (CET)
Received: from localhost ([::1]:48914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg8oM-0003Ch-DC
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 10:58:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kg8iA-0005fL-VL
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 10:52:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:25335)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kg8i8-0005Ig-LZ
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 10:52:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605887552;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mgds7dJJS0AiMGu1qKmnFZWDy8n7UhvuJUeYIATnLE0=;
 b=IfH9Z6b8QZoRxBmXd/ZSeiV05Rf7Jge+hXmwcMoSytI9RD/g7rAMnKsuVKZRlakDzn9oIF
 OZiGHC1+EuFNWa8YlMXUvGxRMLlmOrYk1R3yOES74y01xRzKHXfREkiMjnxzDWCglfudCX
 DDt9BKov65DtR16gh/yoL/QIZtx2U9k=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-444-WoIVrL1sMq6J6k-EaRz2YQ-1; Fri, 20 Nov 2020 10:52:30 -0500
X-MC-Unique: WoIVrL1sMq6J6k-EaRz2YQ-1
Received: by mail-wr1-f70.google.com with SMTP id w17so3517053wrp.11
 for <qemu-devel@nongnu.org>; Fri, 20 Nov 2020 07:52:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mgds7dJJS0AiMGu1qKmnFZWDy8n7UhvuJUeYIATnLE0=;
 b=ssNhQHHWLtYfZ9fpLbLiF4VGGNqGOk4o403Z0sYMAaRHIaq8sFPTsXrAKz39Uvi0Ii
 axKsIRZpgC4aAd2lVARJ52nwWCULlhtw91RZa0zUALcfla6JT/kIR/3ovUCnmeIzsroI
 LYdUMFKX0FUX0c+93nACWqkEC5m0FwkhHvZBaSCqj1R40hnsF5v1lEf8nAaDloXaIXIP
 K0/s4mjYoVFde6mwoUdj7XtyikznSmNOPBaBOquZs85nVo+AaOInaINu8xMkcpT80BeZ
 zJyOjBAFmfb3cR07g1A+rw+WM62JNKVfFMSd1s7xHnFc2E/XPXe+Ufx1T4f4LJRyAsyW
 vyJg==
X-Gm-Message-State: AOAM531lf3tbPXnhsJc1sMZaECpgQzE2gLjIHwGKLWv8zrXYxvZnOcCX
 BqDG2Ploj83W1vEcDG5X9hkFJ0ATA4UQ6+MKvru776y/3UF18xFomiTNK58C6MYFw6jEbIrW4bS
 aZv4ZKUZdJJZQAKk=
X-Received: by 2002:adf:ffc9:: with SMTP id x9mr16919391wrs.148.1605887549038; 
 Fri, 20 Nov 2020 07:52:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzt8cNVfC+IwZJdTUpGffE1ZDSAV0u/8lOnSI6/j4hkCX3HnZfzxmv7R3vd1TB4bDb6VJd+NA==
X-Received: by 2002:adf:ffc9:: with SMTP id x9mr16919384wrs.148.1605887548898; 
 Fri, 20 Nov 2020 07:52:28 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id p21sm4827290wma.41.2020.11.20.07.52.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Nov 2020 07:52:28 -0800 (PST)
Subject: Re: [PATCH v2] usb: fix kconfig for usb-xhci-sysbus
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20201120154506.2496906-1-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <97fa7a8c-d3d5-9191-b89d-a09bac05ade4@redhat.com>
Date: Fri, 20 Nov 2020 16:52:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201120154506.2496906-1-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, Bruce Rogers <brogers@suse.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/20/20 4:45 PM, Paolo Bonzini wrote:
> Remove the "default y" for USB_XHCI_SYSBUS because
> sysbus devices are not user creatable; boards that use them will
> specify them manually with "imply" or "select" clauses.
> 
> It would be nice to keep the ability to remove PCIe and USB from microvm,
> since thos can be disabled on the command line and therefore should not

Typo "those"

> be included if QEMU is configured --without-default-devices.  However
> it's too late for 5.2 to figure out a place for the DSDT creation code.

:(

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> 
> Reported-by: Bruce Rogers <brogers@suse.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  hw/usb/Kconfig | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/hw/usb/Kconfig b/hw/usb/Kconfig
> index 3b07d9cf68..7fbae18bc8 100644
> --- a/hw/usb/Kconfig
> +++ b/hw/usb/Kconfig
> @@ -47,7 +47,6 @@ config USB_XHCI_NEC
>  
>  config USB_XHCI_SYSBUS
>      bool
> -    default y
>      select USB_XHCI
>  
>  config USB_MUSB
> 


