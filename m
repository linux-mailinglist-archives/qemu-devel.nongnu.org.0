Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE85344D063
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 04:26:32 +0100 (CET)
Received: from localhost ([::1]:56552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ml0jP-0005oD-Fb
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 22:26:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1ml0iZ-00052V-An
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 22:25:39 -0500
Received: from [2607:f8b0:4864:20::52a] (port=33380
 helo=mail-pg1-x52a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1ml0iX-0008S3-8H
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 22:25:39 -0500
Received: by mail-pg1-x52a.google.com with SMTP id r28so4040664pga.0
 for <qemu-devel@nongnu.org>; Wed, 10 Nov 2021 19:25:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=YsB2LkzQqdoTYjqaJrnp4xF3ymCASyGeaUobf//cJMU=;
 b=6ElMoP+bkqMidfD2xUyiWlyn6cxGwpWUekfpkH9OBgbDYB4iIhdu/1kCx506uA5IFr
 BWFSu9RjoREXlLHxzmcrEjkQkpq5paoNcbAqEMiX0Re5CI/8NgcUcMQHbLIO+CdHtMjQ
 vAo6oQKhUxNlJ4eR9B/OOpbjdPDMFu/oGU/Ee8Hz52t+o3susn8wFJbmX31ltd/yA3vX
 3Pu5MoZNsxrrnnyN7lah3oCkWhzLc1FUchKy958kbPvq4RB/ESMIHLHjrTf5i4BYezX4
 eVccyIV8G4ZOfU81ZwZUhC7G3Scqbdgh5Zk+6KPJUWJ2tOz4EJOGbscnRaRBhicde/G3
 GZkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=YsB2LkzQqdoTYjqaJrnp4xF3ymCASyGeaUobf//cJMU=;
 b=2lO1AcqAUxWt+vrYcT3rOJ44rKK9d61nDOYEPXHVfPglptorJMKeA3j5rvbam7O3sJ
 gZXmf3MhVUNGwCsUcc2qM8FUHCubxJ5+ZYnoKQhzoq4hI5AKQwGrTuU7Xu3crQbdbMxy
 XhvDBmnbSEP5GmJg/tpdo30SaxiXCu6a5xPbdo3Q3rnMGapVFrZb7mpgeAr1c1iUYiis
 ELSsbJsUhhW1qltYqrX07ia8xZSRZeg5/K66TIwu4232glDHfzBwvdDA7U8GigplXybl
 v1CjeXqCqQKg/7swOm28/3/SulYDi7iw5As8yNB8kR/n1i9dL6xrpYzGgcIa+nbYbLZQ
 /WOw==
X-Gm-Message-State: AOAM532+guo9f0phTXQlzg4Pal+u1dcgp8PiVFfCX9j6TNCDsKBnJAcQ
 J/OgnQAkCooVTivl9yg12pGaMg==
X-Google-Smtp-Source: ABdhPJwaXFZOARyXlXqGhPmQthgY1+sIIIfwg76qMizFfh2tFHFdQDqQ20hI19m9/pcasJNRLp7OiQ==
X-Received: by 2002:aa7:8081:0:b0:49f:adfd:4be4 with SMTP id
 v1-20020aa78081000000b0049fadfd4be4mr3761350pff.85.1636601129934; 
 Wed, 10 Nov 2021 19:25:29 -0800 (PST)
Received: from anisinha-lenovo.lan ([49.207.211.103])
 by smtp.googlemail.com with ESMTPSA id t80sm765771pgb.26.2021.11.10.19.25.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Nov 2021 19:25:29 -0800 (PST)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Thu, 11 Nov 2021 08:55:24 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH for 6.2 v2 1/5] pcie: rename 'native-hotplug' to
 'x-native-hotplug'
In-Reply-To: <20211110211140.3057199-2-imammedo@redhat.com>
Message-ID: <alpine.DEB.2.22.394.2111110853010.133428@anisinha-lenovo>
References: <20211110211140.3057199-1-imammedo@redhat.com>
 <20211110211140.3057199-2-imammedo@redhat.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52a
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::52a;
 envelope-from=ani@anisinha.ca; helo=mail-pg1-x52a.google.com
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
Cc: mapfelba@redhat.com, mst@redhat.com, jusual@redhat.com,
 qemu-devel@nongnu.org, qemu-stable@nongnu.org, kraxel@redhat.com,
 ani@anisinha.ca
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On Wed, 10 Nov 2021, Igor Mammedov wrote:

> Mark property as experimental/internal adding 'x-' prefix.
>
> Property was introduced in 6.1 and it should have provided
> ability to turn on native PCIE hotplug on port even when
> ACPI PCI hotplug is in use is user explicitly sets property
> on CLI. However that never worked since slot is wired to
> ACPI hotplug controller.
> Another non-intended usecase: disable native hotplug on slot
> when APCI based hotplug is disabled, which works but slot has
> 'hotplug' property for this taks.
>
> It should be relatively safe to rename it to experimental
> as no users should exist for it and given that the property
> is broken we don't really want to leave it around for much
> longer lest users start using it.
>
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>

Barring the comment below,

Reviewed-by: Ani Sinha <ani@anisinha.ca>

> ---
> CC: qemu-stable@nongnu.org
> ---
>  hw/i386/pc_q35.c   | 2 +-
>  hw/pci/pcie_port.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> index 797e09500b..fc34b905ee 100644
> --- a/hw/i386/pc_q35.c
> +++ b/hw/i386/pc_q35.c
> @@ -243,7 +243,7 @@ static void pc_q35_init(MachineState *machine)
>                                            NULL);
>
>      if (acpi_pcihp) {
> -        object_register_sugar_prop(TYPE_PCIE_SLOT, "native-hotplug",
> +        object_register_sugar_prop(TYPE_PCIE_SLOT, "x-native-hotplug",
>                                     "false", true);

Let us document the fact that this property is experimental. It was not at
once obvious to me that an "x-" prefix meant to indicate experimental
status.


>      }
>
> diff --git a/hw/pci/pcie_port.c b/hw/pci/pcie_port.c
> index da850e8dde..e95c1e5519 100644
> --- a/hw/pci/pcie_port.c
> +++ b/hw/pci/pcie_port.c
> @@ -148,7 +148,7 @@ static Property pcie_slot_props[] = {
>      DEFINE_PROP_UINT8("chassis", PCIESlot, chassis, 0),
>      DEFINE_PROP_UINT16("slot", PCIESlot, slot, 0),
>      DEFINE_PROP_BOOL("hotplug", PCIESlot, hotplug, true),
> -    DEFINE_PROP_BOOL("native-hotplug", PCIESlot, native_hotplug, true),
> +    DEFINE_PROP_BOOL("x-native-hotplug", PCIESlot, native_hotplug, true),
>      DEFINE_PROP_END_OF_LIST()
>  };
>
> --
> 2.27.0
>
>

