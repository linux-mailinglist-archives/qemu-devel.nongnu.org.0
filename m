Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE9E8508E55
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 19:20:35 +0200 (CEST)
Received: from localhost ([::1]:53308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhE0H-0001wC-Si
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 13:20:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nhDyk-0000fE-3x
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 13:18:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33013)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nhDyd-0001Nd-6W
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 13:18:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650475104;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YKzkk+93v+JWLyJPXu67+Rrh4nIMdIi2q6Nnz3nI8Gk=;
 b=Pl2a3Khu6Xkenmf/2rqVM80lgj0q8zfezdE4F6Qy+HhYBL3rOBrjSFBT6tY0ePZfDB1+/G
 CgvcXjTPHffKMh0DBEGD0bYYUdfSjuns6xkz8gfkGSvHURBEPArnjqBD23jdLeZJNkmo8K
 ng0Ff6tfkVhOPi2hazoIhCHP2FUTMTE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-367-fzKKKWjgN_mqbXG3Ufvjjg-1; Wed, 20 Apr 2022 13:18:23 -0400
X-MC-Unique: fzKKKWjgN_mqbXG3Ufvjjg-1
Received: by mail-wm1-f71.google.com with SMTP id
 r9-20020a1c4409000000b0038ff033b654so1176260wma.0
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 10:18:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YKzkk+93v+JWLyJPXu67+Rrh4nIMdIi2q6Nnz3nI8Gk=;
 b=H3uyaTNETvK4qYC/Ig/T3S64qLWiSPcibPOTot/D2GtJ74Pg7KDBC8WDv2YqtY6B8A
 GYLwqFm3Jp4FMaM2pC4weX0glheMR8nLwkPhcIsMQeZrVsbBdJkuTvUFeC4zzGu5H+03
 WxUVXf2iZ0KcKbfVEYewFMtyMBA7V+vDemVVRhCAd/2RvBZprprEsIX/ziAHe3/PiWM/
 hU0riskCkzhuo3UmqW1KCNF6s7/9n5IAxcKSfBMPNCTHBsFbj+dN5KfqrN2F0n/Rj4xD
 XTz2gXbDhEpHRqnZu6pCqcwL3B56N/6oHpwYK88+3pf9Sg7k7CAr56qoKzUBO0YhdMrT
 2lwg==
X-Gm-Message-State: AOAM530x2jvz0r/dPfamJ4TIgqzaCbK2nekaNTR0tmVFccw24YGCLrbe
 I5ZOnu8c5F3moh39HarokI+m1Q/yAekjL6czd2BIVW7t5dBkWgFvIt4sQo0NjFTrOaax+Ir2IEL
 Z9KhpY+ze7goKpWM=
X-Received: by 2002:a05:600c:35c9:b0:392:8e2a:d7aa with SMTP id
 r9-20020a05600c35c900b003928e2ad7aamr4829802wmq.34.1650475102102; 
 Wed, 20 Apr 2022 10:18:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJypxetSfXdq5fOInpeVDoGnzs3wWF7wBnaum1+0vZyPWG5LETqIRqFHo+s88cOjlE3pa+aEIw==
X-Received: by 2002:a05:600c:35c9:b0:392:8e2a:d7aa with SMTP id
 r9-20020a05600c35c900b003928e2ad7aamr4829779wmq.34.1650475101819; 
 Wed, 20 Apr 2022 10:18:21 -0700 (PDT)
Received: from redhat.com ([2.53.17.80]) by smtp.gmail.com with ESMTPSA id
 t2-20020a1c4602000000b003917d43d339sm394090wma.4.2022.04.20.10.18.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 10:18:21 -0700 (PDT)
Date: Wed, 20 Apr 2022 13:18:17 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Frederic Barrat <fbarrat@linux.ibm.com>
Subject: Re: [PATCH v2 1/2] pcie: Don't try triggering a LSI when not defined
Message-ID: <20220420131755-mutt-send-email-mst@kernel.org>
References: <20220408131303.147840-1-fbarrat@linux.ibm.com>
 <20220408131303.147840-2-fbarrat@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220408131303.147840-2-fbarrat@linux.ibm.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, clg@kaod.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 08, 2022 at 03:13:02PM +0200, Frederic Barrat wrote:
> This patch skips [de]asserting a LSI interrupt if the device doesn't
> have any LSI defined. Doing so would trigger an assert in
> pci_irq_handler().
> 
> The PCIE root port implementation in qemu requests a LSI (INTA), but a
> subclass may want to change that behavior since it's a valid
> configuration. For example on the POWER8/POWER9/POWER10 systems, the
> root bridge doesn't request any LSI.
> 
> Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>


Reviewed-by: Michael S. Tsirkin <mst@redhat.com>


Feel free to merge with the second patch. Thanks!

> ---
>  hw/pci/pcie.c     | 5 +++--
>  hw/pci/pcie_aer.c | 2 +-
>  2 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
> index 67a5d67372..68a62da0b5 100644
> --- a/hw/pci/pcie.c
> +++ b/hw/pci/pcie.c
> @@ -353,7 +353,7 @@ static void hotplug_event_notify(PCIDevice *dev)
>          msix_notify(dev, pcie_cap_flags_get_vector(dev));
>      } else if (msi_enabled(dev)) {
>          msi_notify(dev, pcie_cap_flags_get_vector(dev));
> -    } else {
> +    } else if (pci_intx(dev) != -1) {
>          pci_set_irq(dev, dev->exp.hpev_notified);
>      }
>  }
> @@ -361,7 +361,8 @@ static void hotplug_event_notify(PCIDevice *dev)
>  static void hotplug_event_clear(PCIDevice *dev)
>  {
>      hotplug_event_update_event_status(dev);
> -    if (!msix_enabled(dev) && !msi_enabled(dev) && !dev->exp.hpev_notified) {
> +    if (!msix_enabled(dev) && !msi_enabled(dev) && pci_intx(dev) != -1 &&
> +        !dev->exp.hpev_notified) {
>          pci_irq_deassert(dev);
>      }
>  }
> diff --git a/hw/pci/pcie_aer.c b/hw/pci/pcie_aer.c
> index e1a8a88c8c..92bd0530dd 100644
> --- a/hw/pci/pcie_aer.c
> +++ b/hw/pci/pcie_aer.c
> @@ -290,7 +290,7 @@ static void pcie_aer_root_notify(PCIDevice *dev)
>          msix_notify(dev, pcie_aer_root_get_vector(dev));
>      } else if (msi_enabled(dev)) {
>          msi_notify(dev, pcie_aer_root_get_vector(dev));
> -    } else {
> +    } else if (pci_intx(dev) != -1) {
>          pci_irq_assert(dev);
>      }
>  }
> -- 
> 2.35.1


