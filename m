Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6E23D4C81
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Jul 2021 09:15:09 +0200 (CEST)
Received: from localhost ([::1]:38460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7YLr-0002bX-90
	for lists+qemu-devel@lfdr.de; Sun, 25 Jul 2021 03:15:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1m7YL4-0001wB-80
 for qemu-devel@nongnu.org; Sun, 25 Jul 2021 03:14:18 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:38905)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1m7YL2-0005pA-ED
 for qemu-devel@nongnu.org; Sun, 25 Jul 2021 03:14:17 -0400
Received: by mail-pl1-x630.google.com with SMTP id e21so3508239pla.5
 for <qemu-devel@nongnu.org>; Sun, 25 Jul 2021 00:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20150623.gappssmtp.com; s=20150623;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=y+P6Z0agPS1gjNar6o8kMnxsMC3JqAJqLtGEmX0J3BA=;
 b=1XPXkKreFcobsguI7bvAReEGczsfFMIwzQsDtMQqnCou08qaDQGP27P8xzoPUUWuHO
 PKrONVLcOcoCYF8CYfzhvOom3C1mZQnuwVAmtamcz6slUcipMS2Ybkz+EgZQQZyhAFb1
 H5Uhe2d0avuKbSz6uC5P4YsvSejC87/AusOXhTHb0NEMvmb1W+Em/NON5qZ5e0JOqI8h
 bDsuuDsqkYVWXexpB/RO4hDrCHRfMQ01Kgq6ssQ+lWpUjn1tKexAm3G4eaLFw4LS6RNL
 Xk7ZPRCdkkZhi1YVj/joZH2665vO5ihmvUY6Yx5mTxyCYR9fjOVG9g7mEmjJuBd9XVtR
 fOiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=y+P6Z0agPS1gjNar6o8kMnxsMC3JqAJqLtGEmX0J3BA=;
 b=ANl/ZJQ4I/ATZLIad7MJPp6r9R3RiaH5Dy69vh0aW+IlQwd6F0/7rFPUE4AblmBAch
 ASEnuZM7EtwWsZhld6uhd2UtkLtCsMGbVwKJeOTSnNWfFs7xkLoszqvny8iuyjE61V5+
 +oFQtNdnY04EDVbsSWmxuTwlm3ZeCieBzIKynZ5H/bUa0IlQOrwrOJGo5gluGYPxmIx3
 gUTFsSXqJAzXZvdCzd04dCSvsevpK6qm2CBUlIHD604tAWbhQZ9/b7spEKCpx8AyPpkb
 cId7Nury0weyKTGUvo+ErCSvmhjJZ2BRDhNQwQBE/WnVi04Xe4HtO0afMSL/jfVC4ocZ
 X7kg==
X-Gm-Message-State: AOAM533efCkplLWhHIPA7uEA7glR4hD35GPyL+/cMWIf4s5eifNMmJNI
 EhNV5tKq6v3/TQkdxTDTcG6Q4g==
X-Google-Smtp-Source: ABdhPJxLBfymTqn/vvMbXjPksgfxL1gwe5bUkkWmSbbxJ2cniQ0hpwwXJZccVeD0PGdMbd64uejntw==
X-Received: by 2002:aa7:8154:0:b029:310:70d:a516 with SMTP id
 d20-20020aa781540000b0290310070da516mr12341152pfn.63.1627197254082; 
 Sun, 25 Jul 2021 00:14:14 -0700 (PDT)
Received: from anisinha-lenovo ([115.96.151.208])
 by smtp.googlemail.com with ESMTPSA id b17sm35306790pfm.54.2021.07.25.00.14.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jul 2021 00:14:13 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Sun, 25 Jul 2021 12:44:02 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: Ani Sinha <ani@anisinha.ca>
Subject: Re: [PATCH] hw/acpi: some cosmetic improvements to existing code
In-Reply-To: <20210721141610.139310-1-ani@anisinha.ca>
Message-ID: <alpine.DEB.2.22.394.2107251243510.59477@anisinha-lenovo>
References: <20210721141610.139310-1-ani@anisinha.ca>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: none client-ip=2607:f8b0:4864:20::630;
 envelope-from=ani@anisinha.ca; helo=mail-pl1-x630.google.com
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
Cc: Igor Mammedov <imammedo@redhat.com>, jusual@redhat.com,
 qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping ...

On Wed, 21 Jul 2021, Ani Sinha wrote:

> All existing code using acpi_get_i386_pci_host() checks for a non-null
> return from this function call. This change brings the same check to
> acpi_pcihp_disable_root_bus() function. Also adds a comment describing
> why we unconditionally pass a truth value to the last argument when calling
> acpi_pcihp_reset() from ich9 platform.
>
> Fixes: c0e427d6eb5fef ("hw/acpi/ich9: Enable ACPI PCI hot-plug")
>
> Signed-off-by: Ani Sinha <ani@anisinha.ca>
> ---
>  hw/acpi/ich9.c  | 1 +
>  hw/acpi/pcihp.c | 5 +++++
>  2 files changed, 6 insertions(+)
>
> diff --git a/hw/acpi/ich9.c b/hw/acpi/ich9.c
> index 778e27b659..58d8430eb9 100644
> --- a/hw/acpi/ich9.c
> +++ b/hw/acpi/ich9.c
> @@ -281,6 +281,7 @@ static void pm_reset(void *opaque)
>      pm->smi_en_wmask = ~0;
>
>      if (pm->use_acpi_hotplug_bridge) {
> +        /* on root PCIE bus, we always use native or SHPC based hotplug */
>          acpi_pcihp_reset(&pm->acpi_pci_hotplug, true);
>      }
>
> diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
> index f4d706e47d..856c6e1b47 100644
> --- a/hw/acpi/pcihp.c
> +++ b/hw/acpi/pcihp.c
> @@ -136,6 +136,11 @@ static void acpi_pcihp_disable_root_bus(void)
>          return;
>      }
>
> +    if (!host) {
> +        root_hp_disabled = true;
> +        return;
> +    }
> +
>      bus = PCI_HOST_BRIDGE(host)->bus;
>      if (bus) {
>          /* setting the hotplug handler to NULL makes the bus non-hotpluggable */
> --
> 2.25.1
>
>

