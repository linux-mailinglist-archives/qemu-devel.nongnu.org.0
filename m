Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 511642D3298
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 20:22:21 +0100 (CET)
Received: from localhost ([::1]:32934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmiZ2-0002Fc-6S
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 14:22:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kmhry-0004kK-IR
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 13:37:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25952)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kmhrr-0001qF-DV
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 13:37:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607452661;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QGtyrbM4rPScpm3jjA9KpDwetPNSHDI0wX14JeqeWEI=;
 b=YRNj69y0kngx1qyDGXtdUbEbG9qItd2tNuqZ9BT6eo2Wo7ffr+q+eG0PbxkP5jOQGYlfRb
 LemF05vraY3es611b3AFxOjqW3NGfQ5hb/GwLv8qYe7SnbWgyGlXUpAj28Zn167zmn97sX
 dF5K1wsstUO8X3SfLcUFR3c9qUN0734=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-379-ofB-1ztOP9-mI1rVO8-C6Q-1; Tue, 08 Dec 2020 13:37:39 -0500
X-MC-Unique: ofB-1ztOP9-mI1rVO8-C6Q-1
Received: by mail-wr1-f72.google.com with SMTP id y5so2555319wrs.15
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 10:37:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QGtyrbM4rPScpm3jjA9KpDwetPNSHDI0wX14JeqeWEI=;
 b=doeGohlVT2tsb1yA7fkizJ66PAPFsiTiFr2jZ+Df2gMlrV+kK1fOKONmPGFe86Gxno
 HM4eQrnbpISpII1XBL1PoG1HkZdccKeYpTTZoWY5wRg3sTUDI4K496Kc8urdkA5ZDJ5z
 jA2VzFpyY4Sq915JxY5jA55rn+83ZWOokU3CZqPiWDD7AhhGqEyd2BUFH8JSKn/V6Q36
 d97+5mYeLF5nys0NXzn9nzAwjWjJzKSUe1UPX6DQyRemxpa8rlY2MioBA05rZspYocBV
 PS3NNT6W1n4KA8uJstZ5NIoG/3qM1EGLjA5U3bHIbkrMksa+na7sAKkvjwfD8u43NqVp
 uESw==
X-Gm-Message-State: AOAM533A/KNLBgVXrRnz6iyIlOlgKZAIB6t+myf+BY4Hqf2X7ZZgomci
 664wAnMaWzpeII6YzNRavRHbNNov/dcesLfN+yRqXPXRPChUf5NqaZ+Xl3YEOxoYkzZDCsSrzHr
 37oGegeIvxnaQF1Y=
X-Received: by 2002:a1c:4156:: with SMTP id o83mr4994645wma.178.1607452658616; 
 Tue, 08 Dec 2020 10:37:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyGsJl9X4EFwHzJeJFR41E6vathjIrYkvEEJ4A+T4HekEIrfQtkwhrqz6LUPXe1O2j6xy6BFg==
X-Received: by 2002:a1c:4156:: with SMTP id o83mr4994629wma.178.1607452658356; 
 Tue, 08 Dec 2020 10:37:38 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id y6sm4995485wmg.39.2020.12.08.10.37.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 10:37:37 -0800 (PST)
Date: Tue, 8 Dec 2020 13:37:35 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: andrew@daynix.com
Subject: Re: [PATCH v4 2/2] hw/virtio-pci Added AER capability.
Message-ID: <20201208133524-mutt-send-email-mst@kernel.org>
References: <20201203110713.204938-1-andrew@daynix.com>
 <20201203110713.204938-3-andrew@daynix.com>
MIME-Version: 1.0
In-Reply-To: <20201203110713.204938-3-andrew@daynix.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: berrange@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 03, 2020 at 01:07:13PM +0200, andrew@daynix.com wrote:
> From: Andrew <andrew@daynix.com>
> 
> Added AER capability for virtio-pci devices.
> Also added property for devices, by default AER is disabled.
> 
> Signed-off-by: Andrew Melnychenko <andrew@daynix.com>
> ---
>  hw/virtio/virtio-pci.c | 16 ++++++++++++++++
>  hw/virtio/virtio-pci.h |  4 ++++
>  2 files changed, 20 insertions(+)
> 
> diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
> index ceaa233129..f863f69ede 100644
> --- a/hw/virtio/virtio-pci.c
> +++ b/hw/virtio/virtio-pci.c
> @@ -1817,6 +1817,12 @@ static void virtio_pci_realize(PCIDevice *pci_dev, Error **errp)
>           */
>          pci_set_word(pci_dev->config + pos + PCI_PM_PMC, 0x3);
>  
> +        if (proxy->flags & VIRTIO_PCI_FLAG_AER) {
> +            pcie_aer_init(pci_dev, PCI_ERR_VER, last_pcie_cap_offset,
> +                          PCI_ERR_SIZEOF, NULL);
> +            last_pcie_cap_offset += PCI_ERR_SIZEOF;
> +        }
> +
>          if (proxy->flags & VIRTIO_PCI_FLAG_INIT_DEVERR) {
>              /* Init error enabling flags */
>              pcie_cap_deverr_init(pci_dev);

My only issue here is that if requested for a non express device,
it will assert instead of a graceful failure.
Can be fixed as a patch on top though.

> @@ -1858,7 +1864,15 @@ static void virtio_pci_realize(PCIDevice *pci_dev, Error **errp)
>  
>  static void virtio_pci_exit(PCIDevice *pci_dev)
>  {
> +    VirtIOPCIProxy *proxy = VIRTIO_PCI(pci_dev);
> +    bool pcie_port = pci_bus_is_express(pci_get_bus(pci_dev)) &&
> +                     !pci_bus_is_root(pci_get_bus(pci_dev));
> +
>      msix_uninit_exclusive_bar(pci_dev);
> +    if (proxy->flags & VIRTIO_PCI_FLAG_AER && pcie_port &&
> +        pci_is_express(pci_dev)) {
> +        pcie_aer_exit(pci_dev);
> +    }
>  }
>  
>  static void virtio_pci_reset(DeviceState *qdev)
> @@ -1911,6 +1925,8 @@ static Property virtio_pci_properties[] = {
>                      VIRTIO_PCI_FLAG_INIT_PM_BIT, true),
>      DEFINE_PROP_BIT("x-pcie-flr-init", VirtIOPCIProxy, flags,
>                      VIRTIO_PCI_FLAG_INIT_FLR_BIT, true),
> +    DEFINE_PROP_BIT("aer", VirtIOPCIProxy, flags,
> +                    VIRTIO_PCI_FLAG_AER_BIT, false),
>      DEFINE_PROP_END_OF_LIST(),
>  };
>  
> diff --git a/hw/virtio/virtio-pci.h b/hw/virtio/virtio-pci.h
> index 06e2af12de..d7d5d403a9 100644
> --- a/hw/virtio/virtio-pci.h
> +++ b/hw/virtio/virtio-pci.h
> @@ -41,6 +41,7 @@ enum {
>      VIRTIO_PCI_FLAG_INIT_LNKCTL_BIT,
>      VIRTIO_PCI_FLAG_INIT_PM_BIT,
>      VIRTIO_PCI_FLAG_INIT_FLR_BIT,
> +    VIRTIO_PCI_FLAG_AER_BIT,
>  };
>  
>  /* Need to activate work-arounds for buggy guests at vmstate load. */
> @@ -80,6 +81,9 @@ enum {
>  /* Init Function Level Reset capability */
>  #define VIRTIO_PCI_FLAG_INIT_FLR (1 << VIRTIO_PCI_FLAG_INIT_FLR_BIT)
>  
> +/* Advanced Error Reporting capability */
> +#define VIRTIO_PCI_FLAG_AER (1 << VIRTIO_PCI_FLAG_AER_BIT)
> +
>  typedef struct {
>      MSIMessage msg;
>      int virq;
> -- 
> 2.29.2


