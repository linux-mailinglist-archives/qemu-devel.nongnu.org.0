Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 999643E1100
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 11:17:14 +0200 (CEST)
Received: from localhost ([::1]:42954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBZV3-0005cj-6e
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 05:17:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mBZTm-0004eX-Ta
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 05:15:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33259)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mBZTk-0002nc-Gu
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 05:15:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628154951;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M8r4d9ueg65z/LmUWfsO7PyPU1Z4EaFiXOvxid8ltsg=;
 b=PUgS0GbXzSmuHMyVrd2u0CXjCMbI19cW7lWwPrigXHdfYWWjpsngHAZiQx+FRgl1cKWMpl
 xRNbbQhi6OizIp0xjvU6fM3gKO1xjQvBHK79EK+xVAg83cqAaWQOEQD2r5rOtDJ3egvqJu
 qjpd4K+CFJytlIUpV2XmCV04snaZmfM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-446-lsbqiVgdO02ZJ1ZbY6BHSQ-1; Thu, 05 Aug 2021 05:15:48 -0400
X-MC-Unique: lsbqiVgdO02ZJ1ZbY6BHSQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 y186-20020a1c32c30000b02902b5ac887cfcso1277614wmy.2
 for <qemu-devel@nongnu.org>; Thu, 05 Aug 2021 02:15:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M8r4d9ueg65z/LmUWfsO7PyPU1Z4EaFiXOvxid8ltsg=;
 b=TSdp7HqB+XZ6AiaFDAWIBZjEI8ZjcGCzzdGV9BWtQ6EP7Fm6aPDPE9MnOPpTtAzxBF
 2VUTeSLnE4Rb4kZ8xjbSMi1oTEuyPwV1HPaig6RMV88iBbEUhbgJAv7gC0okfhPtAYl0
 n7tZiBW9dUWVxJ0BV1mcLd5zQsSyp5jA84MQFtKpvKTjuT9nfQT6y67DA8Ok+HI/uyy5
 n/9K/LkqKkXU7vpkPJqI3kVnbs34YyA+zVbrWSPiYyVeZvAxSnZDOm89kQl6cT+9zeem
 n8fe2iL11MSM9YcMpux6Y6+TjTnUCGJobSdMYQuvBWiBpW/EoMmiLJsQA3+F8oz10jq3
 /DlQ==
X-Gm-Message-State: AOAM531AofsX6VTaywnXh7fzd9rbWmmNOoBjqvVtMZd8bTCXsiCAvTOa
 Zxx7JjMil3VHjbUQyI98iCQ8GVO3BTe08mDVD1SRal7e6lkUQjWTJ24Qis3Nx3AhaGzMaxDOJaa
 7igpFrHvwufZpYoc=
X-Received: by 2002:a05:600c:22c1:: with SMTP id
 1mr6802729wmg.37.1628154947293; 
 Thu, 05 Aug 2021 02:15:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyBRckCrhzuusChkNZJOh1VoUCKBSidjYcSMIPReD+wTXv5uxQwr1kdmHeao09ztXfhbJRxRg==
X-Received: by 2002:a05:600c:22c1:: with SMTP id
 1mr6802711wmg.37.1628154947120; 
 Thu, 05 Aug 2021 02:15:47 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id c16sm5522328wru.82.2021.08.05.02.15.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Aug 2021 02:15:46 -0700 (PDT)
Date: Thu, 5 Aug 2021 11:15:43 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Subject: Re: [PATCH v3] hw/acpi: add an assertion check for non-null return
 from acpi_get_i386_pci_host
Message-ID: <20210805111543.5fb99abf@redhat.com>
In-Reply-To: <20210726165743.232073-1-ani@anisinha.ca>
References: <20210726165743.232073-1-ani@anisinha.ca>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, jusual@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 26 Jul 2021 22:27:43 +0530
Ani Sinha <ani@anisinha.ca> wrote:

> All existing code using acpi_get_i386_pci_host() checks for a non-null
> return value from this function call. Instead of returning early when the value
> returned is NULL, assert instead. Since there are only two possible host buses
> for i386 - q35 and i440fx, a null value return from the function does not make
> sense in most cases and is likely an error situation.
> 
> Fixes: c0e427d6eb5fef ("hw/acpi/ich9: Enable ACPI PCI hot-plug")
> 
> Signed-off-by: Ani Sinha <ani@anisinha.ca>
> ---
>  hw/acpi/pcihp.c      |  8 ++++++++
>  hw/i386/acpi-build.c | 15 ++++++---------
>  2 files changed, 14 insertions(+), 9 deletions(-)
> 
> changelog:
> v1: initial patch
> v2: removed comment addition - that can be sent as a separate patch.
> v3: added assertion for null host values for all cases except one.
> 
> diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
> index f4d706e47d..054ee8cbc5 100644
> --- a/hw/acpi/pcihp.c
> +++ b/hw/acpi/pcihp.c
> @@ -116,6 +116,12 @@ static void acpi_set_pci_info(void)
>      bsel_is_set = true;
>  
>      if (!host) {
> +        /*
> +         * This function can be eventually called from
> +         * qemu_devices_reset() -> acpi_pcihp_reset() even
> +         * for architectures other than i386. Hence, we need
> +         * to ignore null values for host here.
> +         */
>          return;
>      }

I suspect it's a MIPS target that call this code unnecessarily.
It would be better to get rid of this condition altogether.
Frr that I can suggest to make acpi_pcihp_reset() stub and
replace pcihp.c with stub (perhaps use acpi-x86-stub.c) when building
for MIPS.

then a bunch of asserts/ifs won't be necessary,
just one in acpi_get_i386_pci_host() will be sufficient.

  
> @@ -136,6 +142,8 @@ static void acpi_pcihp_disable_root_bus(void)
>          return;
>      }
>  
> +    assert(host);
> +
>      bus = PCI_HOST_BRIDGE(host)->bus;
>      if (bus) {
>          /* setting the hotplug handler to NULL makes the bus non-hotpluggable */
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index 17836149fe..83fb1d55c0 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -321,9 +321,7 @@ static void acpi_get_pci_holes(Range *hole, Range *hole64)
>  
>      pci_host = acpi_get_i386_pci_host();
>  
> -    if (!pci_host) {
> -        return;
> -    }
> +    assert(pci_host);
>  
>      range_set_bounds1(hole,
>                        object_property_get_uint(pci_host,
> @@ -1769,9 +1767,9 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
>  
>          pci_host = acpi_get_i386_pci_host();
>  
> -        if (pci_host) {
> -            bus = PCI_HOST_BRIDGE(pci_host)->bus;
> -        }
> +        assert(pci_host);
> +
> +        bus = PCI_HOST_BRIDGE(pci_host)->bus;
>  
>          if (bus) {
>              Aml *scope = aml_scope("PCI0");
> @@ -2389,9 +2387,8 @@ static bool acpi_get_mcfg(AcpiMcfgInfo *mcfg)
>      QObject *o;
>  
>      pci_host = acpi_get_i386_pci_host();
> -    if (!pci_host) {
> -        return false;
> -    }
> +
> +    assert(pci_host);
>  
>      o = object_property_get_qobject(pci_host, PCIE_HOST_MCFG_BASE, NULL);
>      if (!o) {


