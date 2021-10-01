Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C49941E71C
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 07:24:01 +0200 (CEST)
Received: from localhost ([::1]:44174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWB1c-0004P4-CQ
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 01:24:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mWB0N-0003h3-BJ
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 01:22:43 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:54132)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mWB0L-0003fQ-0j
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 01:22:43 -0400
Received: by mail-pj1-x1029.google.com with SMTP id r7so5724631pjo.3
 for <qemu-devel@nongnu.org>; Thu, 30 Sep 2021 22:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=hnVCxblzqfvl+y0SUyLazanr0CiVflioJAkhf4g8Rlw=;
 b=VWLkAn5t42zXpfudYuYP7201/CxVLc2mFF3kt1iI7Z64Yx1pl0rDuUmVviOOzUiF8D
 OSU5cjFTLxjNC0O6FKpW50k9wDZ/VIUeVXBwN1g7l0W9dYn5ErA++mb2WZGg52rRocoy
 1W4a5uDFHTD6nhEOY3pxHCCnwt1l4F9YWD2MHZGnmci9FC1AX4A246HIAryZQoAahPuf
 xZQMOeQyQHDjlWoyp7MC6UnxrlaTmE++rxD9OCb7Nm4MqHhl7VXktyCH4wslUijLLxRK
 BiMKrpBUPNRlWexwpb1wGmW0zHRBpCiGiWSg+Yy4vJtkrWMlQBiijg/q3jY07Ophc1jK
 1Xeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=hnVCxblzqfvl+y0SUyLazanr0CiVflioJAkhf4g8Rlw=;
 b=aNjSdpuc7B4Za6gAaYQEvtlHWEPjWeTVspEnHUGEAhzJm5FKqukgEdEhKaa+GKWtVp
 VEt8YRgkFAq6J1SR94Z/mDBFTZ3LzjeRfaUEX1iaaR47g6jweFUP/1sTRESZLgsjL2G+
 UEbh3HhfkulVyT9gT/xDd9kFz5gaAXjR+5jB9pv3D2G5nJLf4MhytfD/TGDiq0WvlY3W
 cw4i61kqk4auplSlDlv1ykUNuNSBy9h+aCAhPEmbUM2lZiqx6ZLCKkPvq484ZdfQ5iqZ
 V230WuBiPI8MubustbYogJHJvRt4pNjL0bBiZW1HJZ4Rt4Nl8oq2ZW0O49oAn2das5Vi
 5MOg==
X-Gm-Message-State: AOAM531hwjDIKHdPTJP9LrQ6IZWcRL8b/rvbCfevFx2o+Ws50qjkyVtn
 IrsU5GO16yNwUnadG4zZfZEzMA==
X-Google-Smtp-Source: ABdhPJwfx/vHs+4Steq9Gu5LdE3JLjxmGbBJfwNcdAGLGEHkcMjJSDPsrnDixJsXWoQKvI3YCOCsHQ==
X-Received: by 2002:a17:90a:67c1:: with SMTP id
 g1mr11259949pjm.177.1633065759091; 
 Thu, 30 Sep 2021 22:22:39 -0700 (PDT)
Received: from anisinha-lenovo ([115.96.125.135])
 by smtp.googlemail.com with ESMTPSA id k2sm6551842pjq.28.2021.09.30.22.22.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Sep 2021 22:22:38 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Fri, 1 Oct 2021 10:52:33 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH v2] failover: fix unplug pending detection
In-Reply-To: <20210930100815.1246081-1-lvivier@redhat.com>
Message-ID: <alpine.DEB.2.22.394.2110011049220.579856@anisinha-lenovo>
References: <20210930100815.1246081-1-lvivier@redhat.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: none client-ip=2607:f8b0:4864:20::1029;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Juan Quintela <quintela@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>, Jens Freimann <jfreimann@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On Thu, 30 Sep 2021, Laurent Vivier wrote:

> Failover needs to detect the end of the PCI unplug to start migration
> after the VFIO card has been unplugged.
>
> To do that, a flag is set in pcie_cap_slot_unplug_request_cb() and reset in
> pcie_unplug_device().
>
> But since
>     17858a169508 ("hw/acpi/ich9: Set ACPI PCI hot-plug as default on Q35")
> we have switched to ACPI unplug and these functions are not called anymore
> and the flag not set. So failover migration is not able to detect if card
> is really unplugged and acts as it's done as soon as it's started. So it
> doesn't wait the end of the unplug to start the migration. We don't see any
> problem when we test that because ACPI unplug is faster than PCIe native
> hotplug and when the migration really starts the unplug operation is
> already done.
>
> See c000a9bd06ea ("pci: mark device having guest unplug request pending")
>     a99c4da9fc2a ("pci: mark devices partially unplugged")
>
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>

Modulo the comment suggestion below,
Reviewed-by: Ani Sinha <ani@anisinha.ca>

> ---
>
> Notes:
>     v2: move partially_hotplugged to acpi_pcihp_eject_slot()
>
>  hw/acpi/pcihp.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
>
> diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
> index f610a25d2ef9..7bbf13492a4f 100644
> --- a/hw/acpi/pcihp.c
> +++ b/hw/acpi/pcihp.c
> @@ -222,9 +222,13 @@ static void acpi_pcihp_eject_slot(AcpiPciHpState *s, unsigned bsel, unsigned slo
>          PCIDevice *dev = PCI_DEVICE(qdev);
>          if (PCI_SLOT(dev->devfn) == slot) {
>              if (!acpi_pcihp_pc_no_hotplug(s, dev)) {
> -                hotplug_ctrl = qdev_get_hotplug_handler(qdev);
> -                hotplug_handler_unplug(hotplug_ctrl, qdev, &error_abort);
> -                object_unparent(OBJECT(qdev));
> +                if (dev->partially_hotplugged) {

Please add a comment here as to why you are skipping full unplug and what
this flag signifies and where it is set from.

> +                    qdev->pending_deleted_event = false;
> +                } else {
> +                    hotplug_ctrl = qdev_get_hotplug_handler(qdev);
> +                    hotplug_handler_unplug(hotplug_ctrl, qdev, &error_abort);
> +                    object_unparent(OBJECT(qdev));
> +                }
>              }
>          }
>      }
> @@ -396,6 +400,7 @@ void acpi_pcihp_device_unplug_request_cb(HotplugHandler *hotplug_dev,
>          return;
>      }
>
> +    pdev->qdev.pending_deleted_event = true;
>      s->acpi_pcihp_pci_status[bsel].down |= (1U << slot);
>      acpi_send_event(DEVICE(hotplug_dev), ACPI_PCI_HOTPLUG_STATUS);
>  }
> --
> 2.31.1
>
>

