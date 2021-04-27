Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1AF36C708
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 15:30:42 +0200 (CEST)
Received: from localhost ([::1]:51788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbNnV-0002Em-D8
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 09:30:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lbNkj-0001Or-Ro
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 09:27:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25217)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lbNkg-00016F-P2
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 09:27:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619530065;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dNqeYUj8G1K/xtfKa5EvOd3IGr3Wsr0i+9smF4Nmq4c=;
 b=CtHppd4WfRXSSdngZCopJ6gKUxtSAKVZ5xeuYm/Bq7dyj8QA/5z5ogebc4uzFuV/ZxURXl
 37O0NL/jg2urYNfKTd5jfnPOIUhdnYtm069MNZ89O2H3bOKzC5XxF45VFubi8TMYM3CBgv
 b8oH3E87B5Vz76NKPveuJvk+ABYdQV4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-369-F22M5ho2MaSS7QqP1gb1Cw-1; Tue, 27 Apr 2021 09:27:43 -0400
X-MC-Unique: F22M5ho2MaSS7QqP1gb1Cw-1
Received: by mail-wr1-f71.google.com with SMTP id
 93-20020adf80e60000b0290106fab45006so16190934wrl.20
 for <qemu-devel@nongnu.org>; Tue, 27 Apr 2021 06:27:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dNqeYUj8G1K/xtfKa5EvOd3IGr3Wsr0i+9smF4Nmq4c=;
 b=A8GUIxfUejS9f2uFvMetlFzgD0LGvaDRMw2uE+iUF2gltbmM0TqKSXu+U+/Ofs7yJB
 4eynUSwk+bvhmIXSOzSrQPmftd9mU7PqtKKygM6P7zZc16V9UQ/u5LNPPamWErur3H+T
 KkGvrhkW7McN/R8BYZez8uEfGDH6l+UHhto3cRK12re/ABb3GYvkgrcJr91s/eWerlyZ
 Lq4pye8W2FZt0uX9w8lRISlVFjJ4WsM8GOOoYZCozGFFag6YLNjeTcWv8mV7uQnoucSV
 jidK/ARnNu9e0/YU/D2t4z/698qnoQhunNjcn8o8Ad7QTx7OB3p+CmPmukU9+mzU4YGd
 fBgw==
X-Gm-Message-State: AOAM5309RJnzDkvRmZta64a8WSR6Bs/2PHq3tTDqZHL5rHzjYLHNRWnK
 VW4DSzPI4RTlXzxQdA53D9ezRwkwyoBLbBxuIefWC3BILGwXIXJT15APCvpZXR80dFGBg/7nTom
 iGzydjddFKDu9zQw=
X-Received: by 2002:a5d:4805:: with SMTP id l5mr10161712wrq.40.1619530062633; 
 Tue, 27 Apr 2021 06:27:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyVeCAUXkt8GPMq/hPf1HUFLjpbDVsdCMeqQ6oryIjIyfG/Cwufelj/3MJqAlZukEwkj5NOFw==
X-Received: by 2002:a5d:4805:: with SMTP id l5mr10161681wrq.40.1619530062352; 
 Tue, 27 Apr 2021 06:27:42 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id b1sm4839013wru.90.2021.04.27.06.27.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Apr 2021 06:27:41 -0700 (PDT)
Subject: Re: [PATCH] hw/ide: Fix crash when plugging a piix3-ide device into
 the x-remote machine
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20210416125256.2039734-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <4c1c6e99-066e-f916-31dc-acb50caa5320@redhat.com>
Date: Tue, 27 Apr 2021 15:27:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210416125256.2039734-1-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.218,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>, qemu-block@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Thomas,

On 4/16/21 2:52 PM, Thomas Huth wrote:
> QEMU currently crashes when the user tries to do something like:
> 
>  qemu-system-x86_64 -M x-remote -device piix3-ide
> 
> This happens because the "isabus" variable is not initialized with
> the x-remote machine yet.

The qdev contract is everything must be ready at realize() time,
so your safe check in pci_piix_ide_realize() seems alright.

But something doesn't sound right... If no ISA bus is present,
we shouldn't have executed so many code, rather have bailed out
earlier.

How does it work with the x-remote machine? The bus will become
available later upon remote connection?

piix3-ide is a PCI function device. Personally I consider it part
of the PIIX3 chipset, but we prefer to instantiate it separately.
So per Kconfig, piix3-ide is user-creatable by any machine providing
a PCI bus.

See hw/ide/Kconfig:

config IDE_CORE
    bool

config IDE_PCI
    bool
    depends on PCI
    select IDE_CORE

config IDE_ISA
    bool
    depends on ISA_BUS
    select IDE_QDEV

config IDE_PIIX
    bool
    select IDE_PCI
    select IDE_QDEV

and x-remote machine:

config MULTIPROCESS
    bool
    depends on PCI && PCI_EXPRESS && KVM
    select REMOTE_PCIHOST

1/ This KVM check is dubious, and isn't enforced at runtime
   in the machine.

2/ There is no Kconfig dependency IDE_PIIX -> ISA_BUS, apparently
   we need it.


Anyhow I think it would be easier to manage the ISA code if the bus
were created explicitly, not under our feet. I have a WIP series
doing that, but it isn't easy (as with all very old QEMU code/devices).

> Add a proper check for this condition
> and propagate the error to the caller, so we can fail there gracefully.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  hw/ide/ioport.c           | 16 ++++++++++------
>  hw/ide/piix.c             | 22 +++++++++++++++++-----
>  hw/isa/isa-bus.c          | 14 ++++++++++----
>  include/hw/ide/internal.h |  2 +-
>  include/hw/isa/isa.h      | 13 ++++++++-----
>  5 files changed, 46 insertions(+), 21 deletions(-)

>  static void pci_piix_ide_realize(PCIDevice *dev, Error **errp)
>  {
>      PCIIDEState *d = PCI_IDE(dev);
>      uint8_t *pci_conf = dev->config;
> +    int rc;
>  
>      pci_conf[PCI_CLASS_PROG] = 0x80; // legacy ATA mode
>  
> @@ -158,7 +166,11 @@ static void pci_piix_ide_realize(PCIDevice *dev, Error **errp)
>  
>      vmstate_register(VMSTATE_IF(dev), 0, &vmstate_ide_pci, d);
>  
> -    pci_piix_init_ports(d);
> +    rc = pci_piix_init_ports(d);
> +    if (rc) {
> +        error_setg_errno(errp, -rc, "Failed to realize %s",
> +                         object_get_typename(OBJECT(dev)));
> +    }
>  }


