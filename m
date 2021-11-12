Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9164144E727
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Nov 2021 14:13:45 +0100 (CET)
Received: from localhost ([::1]:38206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlWNE-0006NS-8f
	for lists+qemu-devel@lfdr.de; Fri, 12 Nov 2021 08:13:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mlWLA-0005hU-QM
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 08:11:36 -0500
Received: from [2a00:1450:4864:20::534] (port=43686
 helo=mail-ed1-x534.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mlWL7-0007P2-Ue
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 08:11:36 -0500
Received: by mail-ed1-x534.google.com with SMTP id w1so37616938edd.10
 for <qemu-devel@nongnu.org>; Fri, 12 Nov 2021 05:11:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fCrFGESCWdN/0+Ozk0fuJhJYWR9TULIGXii8VQY6mBU=;
 b=xyHvHr+0fVdMlVXCHZYP9mdqt0tRgVZr/PUgRxIcRcvmVoMoCmCzs/wDfs6YWgoku/
 xrCgQExevSfpcVALVb0TBSLvW1Tcgg+ZqOjPRneMqsACzjPJUruz/GQA7eGVbnfVBfVL
 UMeOx2GalgTMtWNOA4Z4ta2Fxa9/R2eUrRJGxr9z4qJzVNigM5OQOn+FHsCgPNaCZbpN
 dWZ9Qbfr4lIYCYr8gt7yMmc+eUKOFhtC+74TvLTOwftqTRWVALIVju/gy8w814J6xOrg
 58zEmWc9cV98bArzpDzX5Vy7tEj8hIhFob+BRBS7flgH3SnYa7G+FYzjTvu4gG0dhEXW
 yvGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fCrFGESCWdN/0+Ozk0fuJhJYWR9TULIGXii8VQY6mBU=;
 b=Lhki6z4jVhYne3BwpP0WRMBNYI5RyGwgr7H9P1ihVaCuz7DeS674GUMW/buxnK2Vml
 vZmxJdCCM+7XIK1At/0nXVVDv0BMSXO01TyYxqdSI/Z2hE5Ti/HI4bSbAUzHU2a1XUiS
 CYc/TBoffQcGqY3RXv9UQ3FaXIluI37yGu5GQZUynAjjh2xXRAWSTqRCbWWzU1k579oy
 A6qUE0Cc2q85OJK0MhhnEEB0ouc3SFuvrooNE+a23pRnK+OvylfagwCHyR+VBEsZ7SYD
 B9RF7LUUHiL9ZzEgsTt4+NwpUX2tpFWVx7WJ6XdosFJY6nhokrwrXykrgUDQmPZtdGZk
 DBGQ==
X-Gm-Message-State: AOAM532mlz7mL1zz9ukZEJZvTTJbAidivdG43VmfvKQf9mkc710cttZm
 n8QJKdkJEGaeREFEzmhBR4iNz1358j5RR3GtDOHdYw==
X-Google-Smtp-Source: ABdhPJzPdHTt7Fj5vXw3YtsrmVH1Qr7sWJ8CtfAY0Aj+W0IlvVjSeGCztcBKprWQgUqd6VNapaUDtc9GXxecIm9jhfk=
X-Received: by 2002:a17:907:e8b:: with SMTP id
 ho11mr20169211ejc.430.1636722691424; 
 Fri, 12 Nov 2021 05:11:31 -0800 (PST)
MIME-Version: 1.0
References: <20211112110857.3116853-1-imammedo@redhat.com>
 <20211112110857.3116853-5-imammedo@redhat.com>
In-Reply-To: <20211112110857.3116853-5-imammedo@redhat.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Fri, 12 Nov 2021 18:41:20 +0530
Message-ID: <CAARzgwwy0V5FejMZwuq2H3M4H_2YdL5dpwr3Yp=F3uMKsRjr=g@mail.gmail.com>
Subject: Re: [PATCH for 6.2 v3 4/5] hw/i386/acpi-build: Deny control on PCIe
 Native Hot-plug in _OSC
To: Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::534
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::534;
 envelope-from=ani@anisinha.ca; helo=mail-ed1-x534.google.com
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
 qemu-devel@nongnu.org, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Nov 12, 2021 at 4:41 PM Igor Mammedov <imammedo@redhat.com> wrote:
>
> From: Julia Suvorova <jusual@redhat.com>
>
> There are two ways to enable ACPI PCI Hot-plug:
>
>         * Disable the Hot-plug Capable bit on PCIe slots.
>
> This was the first approach which led to regression [1-2], as
> I/O space for a port is allocated only when it is hot-pluggable,
> which is determined by HPC bit.
>
>         * Leave the HPC bit on and disable PCIe Native Hot-plug in _OSC
>           method.
>
> This removes the (future) ability of hot-plugging switches with PCIe
> Native hotplug since ACPI PCI Hot-plug only works with cold-plugged
> bridges. If the user wants to explicitely use this feature, they can
> disable ACPI PCI Hot-plug with:
>         --global ICH9-LPC.acpi-pci-hotplug-with-bridge-support=off
>
> Change the bit in _OSC method so that the OS selects ACPI PCI Hot-plug
> instead of PCIe Native.
>
> [1] https://gitlab.com/qemu-project/qemu/-/issues/641
> [2] https://bugzilla.redhat.com/show_bug.cgi?id=2006409
>
> Signed-off-by: Julia Suvorova <jusual@redhat.com>
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>

Reviewed-by: Ani Sinha <ani@anisinha.ca>

> ---
> v2:
>   - (mst)
>       * drop local hotplug var and opencode it
>       * rename acpi_pcihp parameter to enable_native_pcie_hotplug
>         to reflect what it actually does
>
> tested:
>   with hotplugging nic into 1 root port with seabios/ovmf/Fedora34
>   Windows tested only with seabios (using exiting images)
>   (installer fails to install regardless on bios)
> ---
>  hw/i386/acpi-build.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index a3ad6abd33..a99c6e4fe3 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -1337,7 +1337,7 @@ static void build_x86_acpi_pci_hotplug(Aml *table, uint64_t pcihp_addr)
>      aml_append(table, scope);
>  }
>
> -static Aml *build_q35_osc_method(void)
> +static Aml *build_q35_osc_method(bool enable_native_pcie_hotplug)
>  {
>      Aml *if_ctx;
>      Aml *if_ctx2;
> @@ -1359,8 +1359,10 @@ static Aml *build_q35_osc_method(void)
>      /*
>       * Always allow native PME, AER (no dependencies)
>       * Allow SHPC (PCI bridges can have SHPC controller)
> +     * Disable PCIe Native Hot-plug if ACPI PCI Hot-plug is enabled.
>       */
> -    aml_append(if_ctx, aml_and(a_ctrl, aml_int(0x1F), a_ctrl));
> +    aml_append(if_ctx, aml_and(a_ctrl,
> +        aml_int(0x1E | (enable_native_pcie_hotplug ? 0x1 : 0x0)), a_ctrl));
>
>      if_ctx2 = aml_if(aml_lnot(aml_equal(aml_arg(1), aml_int(1))));
>      /* Unknown revision */
> @@ -1449,7 +1451,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
>          aml_append(dev, aml_name_decl("_CID", aml_eisaid("PNP0A03")));
>          aml_append(dev, aml_name_decl("_ADR", aml_int(0)));
>          aml_append(dev, aml_name_decl("_UID", aml_int(pcmc->pci_root_uid)));
> -        aml_append(dev, build_q35_osc_method());
> +        aml_append(dev, build_q35_osc_method(!pm->pcihp_bridge_en));
>          aml_append(sb_scope, dev);
>          if (mcfg_valid) {
>              aml_append(sb_scope, build_q35_dram_controller(&mcfg));
> @@ -1565,7 +1567,9 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
>              if (pci_bus_is_express(bus)) {
>                  aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A08")));
>                  aml_append(dev, aml_name_decl("_CID", aml_eisaid("PNP0A03")));
> -                aml_append(dev, build_q35_osc_method());
> +
> +                /* Expander bridges do not have ACPI PCI Hot-plug enabled */
> +                aml_append(dev, build_q35_osc_method(true));
>              } else {
>                  aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A03")));
>              }
> --
> 2.27.0
>

