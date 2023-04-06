Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CDCE6D9132
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 10:08:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkKfD-0000N5-IH; Thu, 06 Apr 2023 04:08:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pkKf5-0000Mh-PW
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 04:08:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pkKf3-0003j5-RF
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 04:08:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680768478;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u1wO99hBWe8bSAcXQhfqOeUoeh0AsctxvSKAnK1k27o=;
 b=NkWqnFVYbZJf+XjcwHuhzwHI7AMr6m5d+NjDCg+S+nb+3QRR8snVjtbJLG/UlyBzDorIJh
 bmR6pntSlIxbSyhMt1tI63/rZdIyBZQ07vjC0usZohv4chfQbMjr+d10OblL0d9SPFfTpK
 yW1qEmg0RTLs+1s4gkV8O38rkVby5d4=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-67-h753x4v6MxuupHiNTREXHA-1; Thu, 06 Apr 2023 04:07:57 -0400
X-MC-Unique: h753x4v6MxuupHiNTREXHA-1
Received: by mail-ed1-f71.google.com with SMTP id
 x35-20020a50baa6000000b005021d1b1e9eso52682928ede.13
 for <qemu-devel@nongnu.org>; Thu, 06 Apr 2023 01:07:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680768474;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u1wO99hBWe8bSAcXQhfqOeUoeh0AsctxvSKAnK1k27o=;
 b=WE+y53v9b1j4mWa4J+hZpIWi8AJU3h1PDeJH8w1r1OBMQbZIjJhiVd8cpYfD5TLWMF
 iFF7gPGtnZUnqOi/jQAuUn+Csl7Rq1biy6ke8v68elbcrQFl0SLP/ot78LJkn19uX9RW
 nfHzefTaYRLspaP+Nk+ioKMlA4jxCAUs7t0iR1cr1icgmzvdxvX2t2dPwhFyeoxyF4/k
 gkoCYWAmBBCm/s2U5Ohi7U8JAHmXRgkqvcjzUsX5GYEnqRMTjN3oIgjqkCBJKujulRl+
 phAkplMU3FK/+k36soI48DupmA8TpR3SnrgOgppg0tJBQlZ98lhOppC5y4yA1TDvHkHl
 FDDg==
X-Gm-Message-State: AAQBX9eIELrjE+9hKFxgW9LVuxpKO+KZCHd0Uc1ytIHDjl3vJDs1Ub8B
 DLGF9hZINvHIivFCiJv2I+B1XS0KF89ANkSZ5eG8mQe3qywZFJvG+2SEotsHeJGnrMHH1+jS4fR
 UR335iZfAPEWMF/Q=
X-Received: by 2002:a17:906:8056:b0:884:3174:119d with SMTP id
 x22-20020a170906805600b008843174119dmr6599747ejw.14.1680768474777; 
 Thu, 06 Apr 2023 01:07:54 -0700 (PDT)
X-Google-Smtp-Source: AKy350aICWnOgaotYSFtVEifmtZrb2v/fgtzKmtZac7IaRgQWdfzd6ioSimBp21FumKHp32gKbNPng==
X-Received: by 2002:a17:906:8056:b0:884:3174:119d with SMTP id
 x22-20020a170906805600b008843174119dmr6599729ejw.14.1680768474453; 
 Thu, 06 Apr 2023 01:07:54 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 hd10-20020a170907968a00b008d606b1bbb1sm484470ejc.9.2023.04.06.01.07.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 01:07:53 -0700 (PDT)
Date: Thu, 6 Apr 2023 10:07:53 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Ani Sinha <anisinha@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>, Richard
 Henderson <richard.henderson@linaro.org>, Eduardo Habkost
 <eduardo@habkost.net>, qemu-devel@nongnu.org
Subject: Re: [PATCH v2] hw/acpi: limit warning on acpi table size to pc
 machines older than version 2.3
Message-ID: <20230406100753.12719a7f@imammedo.users.ipa.redhat.com>
In-Reply-To: <20230329045726.14028-1-anisinha@redhat.com>
References: <20230329045726.14028-1-anisinha@redhat.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, 29 Mar 2023 10:27:26 +0530
Ani Sinha <anisinha@redhat.com> wrote:

> i440fx machine versions 2.3 and newer supports dynamic ram
> resizing. See commit a1666142db6233 ("acpi-build: make ROMs RAM blocks resizeable") .
> Currently supported all q35 machine types (versions 2.4 and newer) supports
> resizable RAM/ROM blocks.Therefore the warning generated when the ACPI table
> size exceeds a pre-defined value does not apply to those machine versions.
> Add a check limiting the warning message to only those machines that does not
> support expandable ram blocks (that is, i440fx machines with version 2.2
> and older).
> 
> Signed-off-by: Ani Sinha <anisinha@redhat.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/i386/acpi-build.c | 6 ++++--
>  hw/i386/pc.c         | 1 +
>  hw/i386/pc_piix.c    | 1 +
>  include/hw/i386/pc.h | 3 +++
>  4 files changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index b19fb4259e..91be76e61f 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -2616,7 +2616,8 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
>          int legacy_table_size =
>              ROUND_UP(tables_blob->len - aml_len + legacy_aml_len,
>                       ACPI_BUILD_ALIGN_SIZE);
> -        if (tables_blob->len > legacy_table_size) {
> +        if ((tables_blob->len > legacy_table_size) &&
> +            !pcmc->resizable_acpi_blob) {
>              /* Should happen only with PCI bridges and -M pc-i440fx-2.0.  */
>              warn_report("ACPI table size %u exceeds %d bytes,"
>                          " migration may not work",
> @@ -2627,7 +2628,8 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
>          g_array_set_size(tables_blob, legacy_table_size);
>      } else {
>          /* Make sure we have a buffer in case we need to resize the tables. */
> -        if (tables_blob->len > ACPI_BUILD_TABLE_SIZE / 2) {
> +        if ((tables_blob->len > ACPI_BUILD_TABLE_SIZE / 2) &&
> +            !pcmc->resizable_acpi_blob) {
>              /* As of QEMU 2.1, this fires with 160 VCPUs and 255 memory slots.  */
>              warn_report("ACPI table size %u exceeds %d bytes,"
>                          " migration may not work",
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 7bebea57e3..2b66985013 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -1936,6 +1936,7 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
>      pcmc->acpi_data_size = 0x20000 + 0x8000;
>      pcmc->pvh_enabled = true;
>      pcmc->kvmclock_create_always = true;
> +    pcmc->resizable_acpi_blob = true;
>      assert(!mc->get_hotplug_handler);
>      mc->get_hotplug_handler = pc_get_hotplug_handler;
>      mc->hotplug_allowed = pc_hotplug_allowed;
> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index 2f16011bab..8f7b3ae11b 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -745,6 +745,7 @@ static void pc_i440fx_2_2_machine_options(MachineClass *m)
>      compat_props_add(m->compat_props, hw_compat_2_2, hw_compat_2_2_len);
>      compat_props_add(m->compat_props, pc_compat_2_2, pc_compat_2_2_len);
>      pcmc->rsdp_in_ram = false;
> +    pcmc->resizable_acpi_blob = false;
>  }
>  
>  DEFINE_I440FX_MACHINE(v2_2, "pc-i440fx-2.2", pc_compat_2_2_fn,
> diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
> index 8206d5405a..6008eb045a 100644
> --- a/include/hw/i386/pc.h
> +++ b/include/hw/i386/pc.h
> @@ -127,6 +127,9 @@ struct PCMachineClass {
>  
>      /* create kvmclock device even when KVM PV features are not exposed */
>      bool kvmclock_create_always;
> +
> +    /* resizable acpi blob compat */
> +    bool resizable_acpi_blob;
>  };
>  
>  #define TYPE_PC_MACHINE "generic-pc-machine"


