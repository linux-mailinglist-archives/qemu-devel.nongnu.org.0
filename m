Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E09D2AF0BA
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 13:37:22 +0100 (CET)
Received: from localhost ([::1]:55824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcpNI-0002X0-Ti
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 07:37:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kcpMT-00024a-MA
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 07:36:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:34283)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kcpMP-0006zj-31
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 07:36:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605098154;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GmvlA3sfqJShiwUYqg8yJbDj/xLESBHaRs2MiFncIEM=;
 b=Z3Qwjex+R6BrC8POQTxhKnE5S1AV3PmrkMnOD92gOtY0O3cUlI1RQ/sXdBxbop10LV0K9n
 73gTapyofewCTZRJHTZvmriiqb7PqjE+bzcEyWKzvrilQP/5TSUvGOIqJ96+BR6ywNJPMJ
 aEN9l8ndT5Brhc3nTiqlNFWays3CtSY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-298-gL2-M2FFOHCkA6ww8_XPYg-1; Wed, 11 Nov 2020 07:35:53 -0500
X-MC-Unique: gL2-M2FFOHCkA6ww8_XPYg-1
Received: by mail-wr1-f70.google.com with SMTP id v5so553732wrr.0
 for <qemu-devel@nongnu.org>; Wed, 11 Nov 2020 04:35:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=GmvlA3sfqJShiwUYqg8yJbDj/xLESBHaRs2MiFncIEM=;
 b=q2/YxnHjCVnRysvbkvs6TZHV9LPH6nF/7b7ulRGB+efxZZWahlQDEed7DiHqlNkeFs
 UkzTFeVMv5lScqMjyyKHvo4V9eQMfPaN/NkvMfolRp3Em+gtRnL7ehN0pniTLMeEghVC
 8Ggccv+uY40sPnty4BpT+oPzauBDcHD2s58ASg9q2yHExSUu2NRG2GH3OGijRrC8+WXY
 7QArXzojoGWqSSIM+67lLN1mHzR+FWxwGk52k9ZwqA3q82ku4N+NX5w6RuvGCM47LDfS
 9knNQF25TunmRduj8SDyb9GoVyjzYwfRpXH5iclKA7n+/0HvSWwx/L1VzYEN83BNuPZS
 okWA==
X-Gm-Message-State: AOAM533ZZgxYX0A6t923TZf5qlp/pG52mAfjlI+DeLhshyHZgpOneOht
 FDwtJi0fgK12VuTL3aZjx0xOAqHf/vi+OgiviQiSca+0eMZ286IaWe7iNZdIzNBXd4srt0Y5zGV
 X37oPEDU0ie3n/wo=
X-Received: by 2002:adf:f9c5:: with SMTP id w5mr238474wrr.69.1605098151893;
 Wed, 11 Nov 2020 04:35:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwItW/RUfxuEw5pXE28ubWKJIxrRfPpLTNAGvSH6MQ0QpBVp/UzSHA2n8zY/VbpGb+Z7qwaTA==
X-Received: by 2002:adf:f9c5:: with SMTP id w5mr238451wrr.69.1605098151684;
 Wed, 11 Nov 2020 04:35:51 -0800 (PST)
Received: from redhat.com (bzq-109-66-2-153.red.bezeqint.net. [109.66.2.153])
 by smtp.gmail.com with ESMTPSA id
 x1sm2336053wrl.41.2020.11.11.04.35.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2020 04:35:50 -0800 (PST)
Date: Wed, 11 Nov 2020 07:35:47 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: Re: [PATCH] pci: Refuse to hotplug PCI Devices when the Guest OS is
 not ready
Message-ID: <20201111073443-mutt-send-email-mst@kernel.org>
References: <20201022114026.31968-1-marcel.apfelbaum@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20201022114026.31968-1-marcel.apfelbaum@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 01:42:46
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: dgibson@redhat.com, jusual@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Oct 22, 2020 at 02:40:26PM +0300, Marcel Apfelbaum wrote:
> From: Marcel Apfelbaum <marcel@redhat.com>
> 
> During PCIe Root Port's transition from Power-Off to Power-ON (or vice-versa)
> the "Slot Control Register" has the "Power Indicator Control"
> set to "Blinking" expressing a "power transition" mode.
> 
> Any hotplug operation during the "power transition" mode is not permitted
> or at least not expected by the Guest OS leading to strange failures.
> 
> Detect and refuse hotplug operations in such case.
> 
> Signed-off-by: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>


Going back to this I have another question: could we get
a bit more detail on when do we get into this situation?
When does guest start blinking the indicator without us
first starting a hotplug operation?

> ---
>  hw/pci/pcie.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
> index 5b48bae0f6..2fe5c1473f 100644
> --- a/hw/pci/pcie.c
> +++ b/hw/pci/pcie.c
> @@ -410,6 +410,7 @@ void pcie_cap_slot_pre_plug_cb(HotplugHandler *hotplug_dev, DeviceState *dev,
>      PCIDevice *hotplug_pdev = PCI_DEVICE(hotplug_dev);
>      uint8_t *exp_cap = hotplug_pdev->config + hotplug_pdev->exp.exp_cap;
>      uint32_t sltcap = pci_get_word(exp_cap + PCI_EXP_SLTCAP);
> +    uint32_t sltctl = pci_get_word(exp_cap + PCI_EXP_SLTCTL);
>  
>      /* Check if hot-plug is disabled on the slot */
>      if (dev->hotplugged && (sltcap & PCI_EXP_SLTCAP_HPC) == 0) {
> @@ -418,6 +419,12 @@ void pcie_cap_slot_pre_plug_cb(HotplugHandler *hotplug_dev, DeviceState *dev,
>          return;
>      }
>  
> +    if ((sltctl & PCI_EXP_SLTCTL_PIC) == PCI_EXP_SLTCTL_PWR_IND_BLINK) {
> +        error_setg(errp, "Hot-plug failed: %s is in Power Transition",
> +                   DEVICE(hotplug_pdev)->id);
> +        return;
> +    }
> +
>      pcie_cap_slot_plug_common(PCI_DEVICE(hotplug_dev), dev, errp);
>  }
>  
> -- 
> 2.17.2


