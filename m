Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0BA44D1C1
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 06:51:40 +0100 (CET)
Received: from localhost ([::1]:56532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ml2zq-0002g5-Qb
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 00:51:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1ml2xw-0001zj-FU
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 00:49:40 -0500
Received: from [2607:f8b0:4864:20::1030] (port=33455
 helo=mail-pj1-x1030.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1ml2xu-00029M-B0
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 00:49:40 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 w33-20020a17090a6ba400b001a722a06212so3357602pjj.0
 for <qemu-devel@nongnu.org>; Wed, 10 Nov 2021 21:49:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=Lfk3WJVPaLAaV2i1YMU+eU9CAekME2r1LmCxCNlfwFQ=;
 b=kAjt0TyIpm/VdDJwsn/zhaqIFjjnJPAyiWjtPqVpN1uYJsQV81l3zA5G5JNPkM953M
 GOJGzA3cI+M0oi/ehbnRtGPQYmNgfHzkKX8a4GSv+m88527oVIgJ9zVyM9ETvVl0+D33
 jvX1LLqMtiK0oRxzTA3F2r5c7TSwKRNvUy9ow6Lp5Tq8y0PR5jdjG0refAUJy4QdYGY4
 jDnRQkdH3Hwf661IU9Y2lVE3NsvOSR1eNhuG8O2vtXeJEikMRjmaEk7JoLMdrfnBloSy
 iL1Sn41ezX5DaD6fth1SDdA5xsYbpbjpMauaTjrWJ3HF93Oom8U4OXkDJbvoVkYGmxRS
 TDnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=Lfk3WJVPaLAaV2i1YMU+eU9CAekME2r1LmCxCNlfwFQ=;
 b=5BcDcxH8bDz4bWLsmkrMSlQN0beTYQL6C49h0yiU7Og7hA50X2wmcV792l0+oIB5nn
 +OeE9Qq4dfXFC8EmsVxR7b5oATM/pc+3DNjxWZIQ6gXCOjnsxIkozh6PneJEXKF1eIjM
 WaCwtCsPnNQOniMCy5Bnp50Zhlsw/gymApkluPwSCaH21Hb3FWWVmOlzjhndEvlWEj50
 Yk3/KWbKpniIObZrxwuYaRZffvuH4pSxhVT2D60nkzCLBWPmom2e+sGLVZDcgM+qsmzk
 vtVtdXItg3NVs1aDx0g2aHwIffr8xQWqo9cjC1SYQOQtOl1ZRSkjOz4B7GPI/2BfU3GV
 BOcQ==
X-Gm-Message-State: AOAM53159OVcpcosEJrSQ3yotkov+C780puyHe3khw7iekHiPdHHLVjF
 hXjgQskuDxRotpA/Z7CkuyoIfA==
X-Google-Smtp-Source: ABdhPJyQniobrhv76XGZMJmVNztGe552lwpwqevhxTzgsQjEQCJHXQK0BQwuHJLg71RrsRfIn1S4jA==
X-Received: by 2002:a17:90a:b015:: with SMTP id
 x21mr23890399pjq.84.1636609776703; 
 Wed, 10 Nov 2021 21:49:36 -0800 (PST)
Received: from anisinha-lenovo.lan ([49.207.211.103])
 by smtp.googlemail.com with ESMTPSA id lr6sm831156pjb.0.2021.11.10.21.49.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Nov 2021 21:49:36 -0800 (PST)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Thu, 11 Nov 2021 11:19:30 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH for 6.2 v2 4/5] hw/i386/acpi-build: Deny control on PCIe
 Native Hot-plug in _OSC
In-Reply-To: <20211110211140.3057199-5-imammedo@redhat.com>
Message-ID: <alpine.DEB.2.22.394.2111111104320.133428@anisinha-lenovo>
References: <20211110211140.3057199-1-imammedo@redhat.com>
 <20211110211140.3057199-5-imammedo@redhat.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1030
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::1030;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x1030.google.com
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
 qemu-devel@nongnu.org, kraxel@redhat.com, ani@anisinha.ca
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On Wed, 10 Nov 2021, Igor Mammedov wrote:

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

Based on v2, I think its more useful to have this comment where the
function is called.

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

See above. I think it helps to add a comment here saying native hotplug is
enabled when acpi hotplug is disabled for cold plugged bridges.


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
>

