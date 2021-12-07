Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ECCD46B1C3
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 05:15:03 +0100 (CET)
Received: from localhost ([::1]:46568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muRsa-0001Ff-SA
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 23:15:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1muRrF-0000So-O8
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 23:13:37 -0500
Received: from [2607:f8b0:4864:20::633] (port=34759
 helo=mail-pl1-x633.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1muRrD-0004YS-IB
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 23:13:37 -0500
Received: by mail-pl1-x633.google.com with SMTP id y8so8544658plg.1
 for <qemu-devel@nongnu.org>; Mon, 06 Dec 2021 20:13:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=Vx6ojtgtMgH8nezTtFoPIsH0F1mdYQYen4H+gtN6IFM=;
 b=fCuGSzaH5G63eb0W4K0DgnqciM89a1pyD/ZYBpnVw3xIQJQ6pM+kIou0VjoQYd3SS4
 L3WSHva1ADSvLOCTESekvK8t01VHiLDY8nbeBjNuyo2DXnn7q0lJulMPNg+vtH4aLz7T
 OXM2zAnoB/sa1PfwwAWkwlVfrc0C5puPot6ml11xAmH6XwKSEKN3DTctiyrd0/vKOrRm
 sRfmuHaWyqJr7bhLGXsY0nU+wABwqD35pefenNJdC8qI74mcxkTRkfp/sNzuSQiPGLHm
 wHBiRfpJ+HZ1cFE0slg8CnbCGKCYYhM6/S30ts1UeVcHQHw0Pr4nF8E3TzJBqhHzOSxj
 Dchg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=Vx6ojtgtMgH8nezTtFoPIsH0F1mdYQYen4H+gtN6IFM=;
 b=vtBsuCLaDD3Xb49ULFt2Ljv2u1uAs4XSUZz6AeiojTKNy6eOUBp1JmvagNsMMREgwK
 CrzKYQBRquJath29DnAc3ONwu33Eyzybq4C1q2pGiyuvbdyq+M4C4Kx0O4W+b49yI0XJ
 dagzV5v3WQbLaAw3H7P3mcQNHHVmhXeMnxjRyeEupLGao4C8oigbby83EvZBeNnv//57
 9UiVlfVFtXBb398c2mk8kis5T/fd0+3B1xd/1P9j7dz1ZEojUn2pMJwCOKzkP903+h3W
 Fxh8G+dq6JQ2UOima/mQDZT2buoOEc2+zGjV/EhH7eXFoXAuEN3jZREFYKNCY+9GwOEb
 U/Sg==
X-Gm-Message-State: AOAM533WKTeMfLzyivVO6Cg1l9yuh6K/y+z6Fq7z6Kpcl7bZ2AGGFDjn
 J1Um4TqqgSR9lGDG5p/QvvjRgA==
X-Google-Smtp-Source: ABdhPJxdwr21xah5Ha3Zln/j9OqQTBkDgR5Or7vHB03TFmdBz1FpGbnyRGjwpwmM7t1ZMmzbdyRvQQ==
X-Received: by 2002:a17:902:b716:b0:141:d36c:78fc with SMTP id
 d22-20020a170902b71600b00141d36c78fcmr48394057pls.59.1638850413923; 
 Mon, 06 Dec 2021 20:13:33 -0800 (PST)
Received: from anisinha-lenovo ([115.96.110.120])
 by smtp.googlemail.com with ESMTPSA id j4sm8462113pgp.58.2021.12.06.20.13.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Dec 2021 20:13:33 -0800 (PST)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Tue, 7 Dec 2021 09:43:28 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH v6 3/6] failover: fix unplug pending detection
In-Reply-To: <20211206222040.3872253-4-lvivier@redhat.com>
Message-ID: <alpine.DEB.2.22.394.2112070939570.40413@anisinha-lenovo>
References: <20211206222040.3872253-1-lvivier@redhat.com>
 <20211206222040.3872253-4-lvivier@redhat.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::633
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::633;
 envelope-from=ani@anisinha.ca; helo=mail-pl1-x633.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, Ani Sinha <ani@anisinha.ca>,
 Paolo Bonzini <pbonzini@redhat.com>, Jens Freimann <jfreimann@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On Mon, 6 Dec 2021, Laurent Vivier wrote:

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

This has already been merged upstream:
https://git.qemu.org/?p=qemu.git;a=commit;h=9323f892b39d133eb69b301484bf7b2f3f49737d

Not sure why you resent this one.

> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> Reviewed-by: Ani Sinha <ani@anisinha.ca>
> ---
>  hw/acpi/pcihp.c | 30 +++++++++++++++++++++++++++---
>  1 file changed, 27 insertions(+), 3 deletions(-)
>
> diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
> index f610a25d2ef9..30405b5113d7 100644
> --- a/hw/acpi/pcihp.c
> +++ b/hw/acpi/pcihp.c
> @@ -222,9 +222,27 @@ static void acpi_pcihp_eject_slot(AcpiPciHpState *s, unsigned bsel, unsigned slo
>          PCIDevice *dev = PCI_DEVICE(qdev);
>          if (PCI_SLOT(dev->devfn) == slot) {
>              if (!acpi_pcihp_pc_no_hotplug(s, dev)) {
> -                hotplug_ctrl = qdev_get_hotplug_handler(qdev);
> -                hotplug_handler_unplug(hotplug_ctrl, qdev, &error_abort);
> -                object_unparent(OBJECT(qdev));
> +                /*
> +                 * partially_hotplugged is used by virtio-net failover:
> +                 * failover has asked the guest OS to unplug the device
> +                 * but we need to keep some references to the device
> +                 * to be able to plug it back in case of failure so
> +                 * we don't execute hotplug_handler_unplug().
> +                 */
> +                if (dev->partially_hotplugged) {
> +                    /*
> +                     * pending_deleted_event is set to true when
> +                     * virtio-net failover asks to unplug the device,
> +                     * and set to false here when the operation is done
> +                     * This is used by the migration loop to detect the
> +                     * end of the operation and really start the migration.
> +                     */
> +                    qdev->pending_deleted_event = false;
> +                } else {
> +                    hotplug_ctrl = qdev_get_hotplug_handler(qdev);
> +                    hotplug_handler_unplug(hotplug_ctrl, qdev, &error_abort);
> +                    object_unparent(OBJECT(qdev));
> +                }
>              }
>          }
>      }
> @@ -396,6 +414,12 @@ void acpi_pcihp_device_unplug_request_cb(HotplugHandler *hotplug_dev,
>          return;
>      }
>
> +    /*
> +     * pending_deleted_event is used by virtio-net failover to detect the
> +     * end of the unplug operation, the flag is set to false in
> +     * acpi_pcihp_eject_slot() when the operation is completed.
> +     */
> +    pdev->qdev.pending_deleted_event = true;
>      s->acpi_pcihp_pci_status[bsel].down |= (1U << slot);
>      acpi_send_event(DEVICE(hotplug_dev), ACPI_PCI_HOTPLUG_STATUS);
>  }
> --
> 2.33.1
>
>

