Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 788744C42DC
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 11:56:01 +0100 (CET)
Received: from localhost ([::1]:46656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNYGW-00082w-3o
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 05:56:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nNXxH-0003Zb-Hy
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 05:36:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50554)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nNXxE-0008RA-HV
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 05:36:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645785358;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=B8J/neq0roGBkjVZCzDQlwf7iVDZ4qNu20x/5d4pkVk=;
 b=MnKaD3CJ2qYRLKzX7EUO8w7VmszzRll5Lh0vxC1Y5o672DMflltvSCFRvBlouvwqE4q7CL
 DFzqkh56HoTBnwye9XMHeMFGw/8WeEJaXXlCHS+G8SBbOyVoi4ki6F4BhxjZLdDIHv8bTa
 0Rxa3pxKRQEidsjqctdE7PpiGQS2wx8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-674-SHlbiyOyPba0y56p_fhSHQ-1; Fri, 25 Feb 2022 05:35:57 -0500
X-MC-Unique: SHlbiyOyPba0y56p_fhSHQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 ay7-20020a05600c1e0700b003813d7a7d03so334298wmb.1
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 02:35:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=B8J/neq0roGBkjVZCzDQlwf7iVDZ4qNu20x/5d4pkVk=;
 b=7jBSNO7Ke7jvaJzTZ7GSZx4JSzHUsBaYwsOVpbfrm9xu7LaAuyho3sLSFX3nkhoZWC
 aaoBLdxWCRLwyvrSW4oDFYHL5yMogIW6Eh7wnoYcawoJoZYkDfz0M+tENBFl7MkxclT6
 hXkoHghb0UdLEg0vtJVCajbKxWwooer8RE4Tw1NvOb7MluRh4BVYlTjcoSctmuajIZsX
 fAMdRv5FFNH/lNMk0zcBnU+xryB69Dfb/82QzkDa+GWawvK82/+53vT2k+MgJH5q6/eB
 1UxXNBgGqlwutZiro8qEpYwGz065DkCILX1Z3v5IRrDQj7U0gJYUooDnccUsNX9cIaWe
 sxvA==
X-Gm-Message-State: AOAM532/ulp90aOeer99Fmd+UPX+0ATdYgdXdjerwlfI6V5H/OUsA7Ya
 287jCJEWEzSJfPi56hDB+4QQ+eYbN5gvu/6EcDdJNjQ8mqgHNU1w68v+SM0XAyIdzNKars3QbQS
 v4YnxK/8WwuWnzz0=
X-Received: by 2002:a7b:c347:0:b0:37e:68e6:d85c with SMTP id
 l7-20020a7bc347000000b0037e68e6d85cmr2106863wmj.176.1645785356028; 
 Fri, 25 Feb 2022 02:35:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJys+hLjOqd/e6Zzs9W0Ypl59LVBTnRfFqLAMEj0OMklT6CFLBiCFT7jznP0+OxJnqUvMiLm/A==
X-Received: by 2002:a7b:c347:0:b0:37e:68e6:d85c with SMTP id
 l7-20020a7bc347000000b0037e68e6d85cmr2106849wmj.176.1645785355795; 
 Fri, 25 Feb 2022 02:35:55 -0800 (PST)
Received: from redhat.com ([2.55.165.55]) by smtp.gmail.com with ESMTPSA id
 g17-20020a5d5411000000b001e688b4ee6asm2117267wrv.35.2022.02.25.02.35.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Feb 2022 02:35:55 -0800 (PST)
Date: Fri, 25 Feb 2022 05:35:51 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH 2/4] pcie: update slot power status only is power control
 is enabled
Message-ID: <20220225051940-mutt-send-email-mst@kernel.org>
References: <20220224174411.3296848-1-imammedo@redhat.com>
 <20220224174411.3296848-3-imammedo@redhat.com>
 <20220225101259.begp7wy5o3jlafcf@sirius.home.kraxel.org>
MIME-Version: 1.0
In-Reply-To: <20220225101259.begp7wy5o3jlafcf@sirius.home.kraxel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Feb 25, 2022 at 11:12:59AM +0100, Gerd Hoffmann wrote:
>   Hi,
> 
> >    pcie_cap_slot_post_load()
> >        -> pcie_cap_update_power()
> >            -> pcie_set_power_device()
> >                -> pci_set_power()
> >                    -> pci_update_mappings()
> 
> > Fix it by honoring PCI_EXP_SLTCAP_PCP and updating power status
> > only if capability is enabled.
> 
> > diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
> > index d7d73a31e4..2339729a7c 100644
> > --- a/hw/pci/pcie.c
> > +++ b/hw/pci/pcie.c
> > @@ -383,10 +383,9 @@ static void pcie_cap_update_power(PCIDevice *hotplug_dev)
> >  
> >      if (sltcap & PCI_EXP_SLTCAP_PCP) {
> >          power = (sltctl & PCI_EXP_SLTCTL_PCC) == PCI_EXP_SLTCTL_PWR_ON;
> > +        pci_for_each_device(sec_bus, pci_bus_num(sec_bus),
> > +                            pcie_set_power_device, &power);
> >      }
> > -
> > -    pci_for_each_device(sec_bus, pci_bus_num(sec_bus),
> > -                        pcie_set_power_device, &power);
> >  }
> 
> The change makes sense, although I don't see how that changes qemu
> behavior.
> 
> 'power' defaults to true, so when SLTCAP_PCP is off it should never
> ever try to power off the devices.  And pci_set_power() should figure
> the state didn't change and instantly return without touching the
> device.
> 
> take care,
>   Gerd

And making sure power is actually up might be a bit cleaner just in
case down the road we start plugging devices in a powered off state.

-- 
MST


