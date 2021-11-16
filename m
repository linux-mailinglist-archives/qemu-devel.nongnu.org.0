Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F8C7452A69
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 07:18:05 +0100 (CET)
Received: from localhost ([::1]:44236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmrnA-00082o-16
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 01:18:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mmrjt-0007CJ-FR
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 01:14:41 -0500
Received: from [2607:f8b0:4864:20::52a] (port=39644
 helo=mail-pg1-x52a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mmrjo-00060O-BP
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 01:14:41 -0500
Received: by mail-pg1-x52a.google.com with SMTP id r5so10774611pgi.6
 for <qemu-devel@nongnu.org>; Mon, 15 Nov 2021 22:14:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=/TJxax5aLJYqKlTDvtWlnM+hYxAUYHR/zBmmE1vhjCs=;
 b=VHg6qjtNuZwLkF5owqKIiIdNOwtf3GvpCMoPvys+5n+b594l5PQVNMlVptF2G8dcJK
 9krUNi5TP62rPvnXGsMVFZhD6my8P2AZIvLfBm+5MFQhTYub9ESFGuhKiAvCx45S6aZC
 V2JE2xOfQfjt4Msb8P9BCOzEof8STzhCw8KifMA0h5J4AmaBA7yKYPWtBAy6shMDLyrf
 BXzuNgsvabgqal0n5A3coZgut2RIXKRNlgPohuMaXcKE8J2M6IJ+Z3wXdOQ0nk4wB3AU
 3E9WrwWfQJRCSTCnZ5c5RAeUJ0njqbUNaOfDFV80kumTZQEyY9IK14uqie6pw8suTyUo
 hFcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=/TJxax5aLJYqKlTDvtWlnM+hYxAUYHR/zBmmE1vhjCs=;
 b=qBmUKStfbZEWgRDVENdVAKLDIMJAl6FxhWotOKArKiOF5efM7sRJ+PlRkE2bFkWitx
 Hj4feEFGbjpZ8r5hns62K9+JZ3pBqxWdKLPvWKyUOuhbiJZ57KZt1GpDLZ6gx78H056K
 lQW3/4dZqYB8t8q3zUS6IlQ5RhIgrgF+efVyNeTgnlZhupangdY2Ge3zTUhS+x3Itvg3
 9gwdCxAhuINZKesGFURFNi+DXPD4XQxngK540oSvEpNTOS/tJzJ/+wYHJO8g7eR0AnU4
 ehh9w6VSJKyfdFIOdRuId6IjkAZd9gmHEK2v3iImXl4+zcV57NRCt9L99AmF/2i3FqGG
 jKXA==
X-Gm-Message-State: AOAM530I1UL0Nb0OeBa0zX8tfQz35OVGbKhQYdgFZ0Wr8LQwnEl8hLZJ
 n4ZTYYD/WVoKR05rC9N6wsmKfQ==
X-Google-Smtp-Source: ABdhPJxx8JXbcqv1a2nEmd+irid0uVnH9C5w61NTXGCyro1aKbZqLZlOFAgFPO6eoMMaFA3iMg9tbw==
X-Received: by 2002:a62:760a:0:b0:494:6fa0:60a2 with SMTP id
 r10-20020a62760a000000b004946fa060a2mr38241075pfc.39.1637043274540; 
 Mon, 15 Nov 2021 22:14:34 -0800 (PST)
Received: from anisinha-lenovo ([49.207.215.112])
 by smtp.googlemail.com with ESMTPSA id z16sm13242843pgl.29.2021.11.15.22.14.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Nov 2021 22:14:33 -0800 (PST)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Tue, 16 Nov 2021 11:44:27 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH] q35: flip acpi-pci-hotplug-with-bridge-support default
 back to off
In-Reply-To: <20211111095203.961122-1-kraxel@redhat.com>
Message-ID: <alpine.DEB.2.22.394.2111161143020.543876@anisinha-lenovo>
References: <20211111095203.961122-1-kraxel@redhat.com>
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On Thu, 11 Nov 2021, Gerd Hoffmann wrote:

> Switch qemu 6.2 back to 6.0 behavior (aka native pcie hotplug) because
> acpi hotplug for pcie ports caused all kinds of regressions and a fix
> for those is not in sight.
>
> Add compat property for 6.1 to keep it enabled there.  Use a separate
> compat property list so we can apply it to 6.1 only.

I think we are not going this route anymore. ACPI will continue to be the
default for 6.2 and future and we will continue to fix the issues on the
ACPI hotplug side. I see Michael sent PRs for some of the fixes from Igor
and Julia.

>
> Fixes: https://gitlab.com/qemu-project/qemu/-/issues/641
> Fixes: https://bugzilla.redhat.com/show_bug.cgi?id=2006409
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  hw/acpi/ich9.c   |  2 +-
>  hw/i386/pc.c     |  1 -
>  hw/i386/pc_q35.c | 14 +++++++++++++-
>  3 files changed, 14 insertions(+), 3 deletions(-)
>
> diff --git a/hw/acpi/ich9.c b/hw/acpi/ich9.c
> index 1ee2ba2c508c..6e7d4c9eb54a 100644
> --- a/hw/acpi/ich9.c
> +++ b/hw/acpi/ich9.c
> @@ -427,7 +427,7 @@ void ich9_pm_add_properties(Object *obj, ICH9LPCPMRegs *pm)
>      pm->disable_s3 = 0;
>      pm->disable_s4 = 0;
>      pm->s4_val = 2;
> -    pm->use_acpi_hotplug_bridge = true;
> +    pm->use_acpi_hotplug_bridge = false;
>
>      object_property_add_uint32_ptr(obj, ACPI_PM_PROP_PM_IO_BASE,
>                                     &pm->pm_io_base, OBJ_PROP_FLAG_READ);
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 2592a821486f..4fed82dafcf0 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -106,7 +106,6 @@ GlobalProperty pc_compat_6_0[] = {
>      { "qemu64" "-" TYPE_X86_CPU, "model", "6" },
>      { "qemu64" "-" TYPE_X86_CPU, "stepping", "3" },
>      { TYPE_X86_CPU, "x-vendor-cpuid-only", "off" },
> -    { "ICH9-LPC", ACPI_PM_PROP_ACPI_PCIHP_BRIDGE, "off" },
>  };
>  const size_t pc_compat_6_0_len = G_N_ELEMENTS(pc_compat_6_0);
>
> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> index 797e09500b15..735dd3cff4ed 100644
> --- a/hw/i386/pc_q35.c
> +++ b/hw/i386/pc_q35.c
> @@ -375,8 +375,20 @@ static void pc_q35_6_1_machine_options(MachineClass *m)
>      m->smp_props.prefer_sockets = true;
>  }
>
> +/* 6.1 only compat property (not applied to 6.0 + older) */
> +static GlobalProperty pc_compat_6_1_only[] = {
> +    { "ICH9-LPC", ACPI_PM_PROP_ACPI_PCIHP_BRIDGE, "on" },
> +};
> +static const size_t pc_compat_6_1_only_len = G_N_ELEMENTS(pc_compat_6_1_only);
> +
> +static void pc_q35_6_1_only_machine_options(MachineClass *m)
> +{
> +    pc_q35_6_1_machine_options(m);
> +    compat_props_add(m->compat_props, pc_compat_6_1_only, pc_compat_6_1_only_len);
> +}
> +
>  DEFINE_Q35_MACHINE(v6_1, "pc-q35-6.1", NULL,
> -                   pc_q35_6_1_machine_options);
> +                   pc_q35_6_1_only_machine_options);
>
>  static void pc_q35_6_0_machine_options(MachineClass *m)
>  {
> --
> 2.33.1
>
>

