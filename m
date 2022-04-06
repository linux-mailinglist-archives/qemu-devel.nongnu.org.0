Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 507BB4F5A16
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 11:37:12 +0200 (CEST)
Received: from localhost ([::1]:44666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nc26A-0000FI-Vj
	for lists+qemu-devel@lfdr.de; Wed, 06 Apr 2022 05:37:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nc23y-0007vK-By
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 05:34:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22105)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nc23v-0005ML-GT
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 05:34:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649237690;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QdK4m+Dr0XfIYR//0q1Y6q8BvbcswOcAj5LV+ozvqKM=;
 b=H5qtNDZo3rxgWIp06lKwsOY/CU0qN+HYxWyIU4bficKo5wyR3MtAlk5eiaJtaCAUclsrSy
 gNGeGnJTn9z66uAy+poReu65NNnbtIfbr40pqZPfNRvMYGvA0FOR9R0D1GDBsu3xoyiWi8
 PTgMhpd5U5AF6HqZuH4XdofSdGAOpB8=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-108-C6vJKu7fMguIq5gUw_PFEg-1; Wed, 06 Apr 2022 05:34:49 -0400
X-MC-Unique: C6vJKu7fMguIq5gUw_PFEg-1
Received: by mail-ej1-f72.google.com with SMTP id
 nb40-20020a1709071ca800b006e80357f051so884594ejc.18
 for <qemu-devel@nongnu.org>; Wed, 06 Apr 2022 02:34:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QdK4m+Dr0XfIYR//0q1Y6q8BvbcswOcAj5LV+ozvqKM=;
 b=SI/8cBbQuXX28lYWapXITnh/DSFssu5oCxiJ7mLxmufKx/C1yKTPOkvSTlQLvUiJu4
 udc9iyZKFYYTxpK8seYkV9vJJBZ6rsUez3c4Uyr6zJLnXdcxHH1qJ0xxQZi7REZ79hU3
 U7bVP0tHH1ZsyWw8YnuZwM/t15scXEhRiRw7IQM6fmkwR1Fua6W5KwX3cXNaWz5EOB6q
 BAK0VojLHg4Gp5G/uVXozn6OZ3TWFp8CE3aM5G+C+Y+Jz5ViS4IqkdUKFOwxOFCNMC6p
 BGK9mBczuPmv+LdhrA/tajF/StVF/t5LbMBDlkNs6rwIWrOVvQG9qMEdYoSKKb5usKBm
 JEYA==
X-Gm-Message-State: AOAM533Iq1DxeH70n8tSzWAt8+g+GGeCg0/V6vI/QrgkbpihqEqbdbho
 6I2oaHLNPUPL7dnXhB0HcVCivaEXn93OGPmKWz02GZst986BFjZKy+oL+Y/Zv8K0Z+UzBUcNThz
 GEszMoxKyC6L7TkA=
X-Received: by 2002:a17:906:9c82:b0:6e1:2c94:1616 with SMTP id
 fj2-20020a1709069c8200b006e12c941616mr7445486ejc.64.1649237688463; 
 Wed, 06 Apr 2022 02:34:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxLyc7nh5XkdTYUlLY4q3otcbLiw0wupz9YtAQZ94mFtpUK0oN5E5yMGJR0u+Q4f7d1lT0lZw==
X-Received: by 2002:a17:906:9c82:b0:6e1:2c94:1616 with SMTP id
 fj2-20020a1709069c8200b006e12c941616mr7445466ejc.64.1649237688168; 
 Wed, 06 Apr 2022 02:34:48 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 n19-20020a170906165300b006a625c583b9sm6429270ejd.155.2022.04.06.02.34.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 02:34:47 -0700 (PDT)
Date: Wed, 6 Apr 2022 11:34:46 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Subject: Re: [PATCH] acpi: Bodge acpi_index migration
Message-ID: <20220406113446.73ab4e1b@redhat.com>
In-Reply-To: <20220406083531.10217-1-dgilbert@redhat.com>
References: <20220406083531.10217-1-dgilbert@redhat.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
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
Cc: peter.maydell@linaro.org, quintela@redhat.com, mst@redhat.com,
 qemu-devel@nongnu.org, peterx@redhat.com, alex.williamson@redhat.com,
 leobras@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed,  6 Apr 2022 09:35:31 +0100
"Dr. David Alan Gilbert (git)" <dgilbert@redhat.com> wrote:

> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> 
> The 'acpi_index' field is a statically configured field, which for
> some reason is migrated; this never makes much sense because it's
> command line static.

that's true only for the field that's part of PCIDEvice,
however AcpiPciHpState::acpi_index is runtime state and _must_
be migrated if set, otherwise guest might get wrong index
if it's in process of querying it

 
> However, on piix4 it's conditional, and the condition/test function
> ends up having the wrong pointer passed to it (it gets a PIIX4PMState
> not the AcpiPciHpState it was expecting, because VMSTATE_PCI_HOTPLUG
> is a macro and not another struct).  This means the field is randomly
> loaded/saved based on a random pointer.  In 6.x this random pointer
> randomly seems to get 0 for everyone (!); in 7.0rc it's getting junk
> and trying to load a field that the source didn't send.  The migration
> stream gets out of line and hits the section footer.

I'm a bit confused by description,
do you have a reproducer for me to try?

> The bodge is on piix4 never to load the field:
>   a) Most 6.x builds never send it, so most of the time the migration
>     will work.
>   b) We can backport this fix to 6.x to remove the boobytrap.
>   c) It should never have made a difference anyway since the acpi-index
>     is command line configured and should be correct on the destination
>     anyway
>   d) ich9 is still sending/receiving this (unconditionally all the time)
>     but due to (c) should never notice.  We could follow up to make it
>     skip.
> 
> It worries me just when (a) actually happens.
> 
> Fixes: b32bd76 ("pci: introduce acpi-index property for PCI device")
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/932
> 
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>  hw/acpi/acpi-pci-hotplug-stub.c |  4 ----
>  hw/acpi/pcihp.c                 |  6 ------
>  hw/acpi/piix4.c                 | 11 ++++++++++-
>  include/hw/acpi/pcihp.h         |  2 --
>  4 files changed, 10 insertions(+), 13 deletions(-)
> 
> diff --git a/hw/acpi/acpi-pci-hotplug-stub.c b/hw/acpi/acpi-pci-hotplug-stub.c
> index 734e4c5986..a43f6dafc9 100644
> --- a/hw/acpi/acpi-pci-hotplug-stub.c
> +++ b/hw/acpi/acpi-pci-hotplug-stub.c
> @@ -41,7 +41,3 @@ void acpi_pcihp_reset(AcpiPciHpState *s, bool acpihp_root_off)
>      return;
>  }
>  
> -bool vmstate_acpi_pcihp_use_acpi_index(void *opaque, int version_id)
> -{
> -    return false;
> -}
> diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
> index 6351bd3424..bf65bbea49 100644
> --- a/hw/acpi/pcihp.c
> +++ b/hw/acpi/pcihp.c
> @@ -554,12 +554,6 @@ void acpi_pcihp_init(Object *owner, AcpiPciHpState *s, PCIBus *root_bus,
>                                     OBJ_PROP_FLAG_READ);
>  }
>  
> -bool vmstate_acpi_pcihp_use_acpi_index(void *opaque, int version_id)
> -{
> -     AcpiPciHpState *s = opaque;
> -     return s->acpi_index;
> -}
> -
>  const VMStateDescription vmstate_acpi_pcihp_pci_status = {
>      .name = "acpi_pcihp_pci_status",
>      .version_id = 1,
> diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
> index cc37fa3416..48aeedd5f0 100644
> --- a/hw/acpi/piix4.c
> +++ b/hw/acpi/piix4.c
> @@ -267,6 +267,15 @@ static bool piix4_vmstate_need_smbus(void *opaque, int version_id)
>      return pm_smbus_vmstate_needed();
>  }
>  
> +/*
> + * This is a fudge to turn off the acpi_index field, whose
> + * test was always broken on piix4.
> + */
> +static bool vmstate_test_never(void *opaque, int version_id)
> +{
> +    return false;
> +}
> +
>  /* qemu-kvm 1.2 uses version 3 but advertised as 2
>   * To support incoming qemu-kvm 1.2 migration, change version_id
>   * and minimum_version_id to 2 below (which breaks migration from
> @@ -297,7 +306,7 @@ static const VMStateDescription vmstate_acpi = {
>              struct AcpiPciHpPciStatus),
>          VMSTATE_PCI_HOTPLUG(acpi_pci_hotplug, PIIX4PMState,
>                              vmstate_test_use_acpi_hotplug_bridge,
> -                            vmstate_acpi_pcihp_use_acpi_index),
> +                            vmstate_test_never),
>          VMSTATE_END_OF_LIST()
>      },
>      .subsections = (const VMStateDescription*[]) {
> diff --git a/include/hw/acpi/pcihp.h b/include/hw/acpi/pcihp.h
> index af1a169fc3..7e268c2c9c 100644
> --- a/include/hw/acpi/pcihp.h
> +++ b/include/hw/acpi/pcihp.h
> @@ -73,8 +73,6 @@ void acpi_pcihp_reset(AcpiPciHpState *s, bool acpihp_root_off);
>  
>  extern const VMStateDescription vmstate_acpi_pcihp_pci_status;
>  
> -bool vmstate_acpi_pcihp_use_acpi_index(void *opaque, int version_id);
> -
>  #define VMSTATE_PCI_HOTPLUG(pcihp, state, test_pcihp, test_acpi_index) \
>          VMSTATE_UINT32_TEST(pcihp.hotplug_select, state, \
>                              test_pcihp), \


