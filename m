Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B01CA3D10EF
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 16:13:56 +0200 (CEST)
Received: from localhost ([::1]:51964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6Cyx-00011L-PE
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 10:13:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1m6Cxc-00086D-7r
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 10:12:32 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:38437)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1m6Cxa-00040t-9j
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 10:12:31 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 me13-20020a17090b17cdb0290173bac8b9c9so4085985pjb.3
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 07:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20150623.gappssmtp.com; s=20150623;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=SGQ3Z6atbYqmriSYqpFX41TK0AIwU3wsyXW2kuOsI4Y=;
 b=z3R4IE8dJcVe6Xr3ATCSdLF4vSo8dmRdV99m+W7CpzqPhxR6Nt5esmesEpEeZ69Z1W
 TIV/Cv+KUfzLA9EbuIlBBB5YBZM0b2u70G56Ti6rHtnJcdAKdudLzyjH3K6NIjEX7O42
 tdwkJW/SZ1w+SWKHPW2OrHq1an1zhi79sdyg+eDAmmYHy2mL6urqTj7UgoKNFRpvcxos
 FRIKPSd1XroRQiSqfOQUmLvIHFg7yfY60qhmzZtWYZcRXk9snuSohkPVN0d4EkepsZpG
 322iya4rwYAXjn1xcQa4eHONeEjn9NxIX3JP5o4+tVedh5JsPd269rUT9KAEcu380FpS
 D8Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=SGQ3Z6atbYqmriSYqpFX41TK0AIwU3wsyXW2kuOsI4Y=;
 b=k/bk6Vxsep5mSf/m2ZoHOiNNv4kfTsPt99UxCJb36+OiDczpEpTQ8LNok6UC6KQEg+
 EF851wICteOIPvPw0flnX5zMT5xA8LiqosXHU13G2aHFnPrspzn7qrPIt+7EDvetp1Kp
 rb7B7U8R2s1WhGZI/cG/ymUM5+hR60ehIdthwRLp8TY1dVSrGpTgeEInoMBsneQdVwCt
 YX9EqYt7iFoHzNt+IzdP9m0VKb736ZNOp4vYkIw9CZp+7ICOFfkyTFt+DC9UJMstOWtF
 rtktxlmACE0UJqm9MbgAFuHcuAYm2DSXp02Bb1P5x2XXkHb/hTYXQM/c7j20DbJjw5Qz
 TYVQ==
X-Gm-Message-State: AOAM533xJUvyE0IQzm5bZ0PW4eAlElxJRRjAl9DKim0RiaXkKrgvTa2z
 URvDHG4MBBP5mdaLTvXA4+tfAQ==
X-Google-Smtp-Source: ABdhPJx83KePSpM3T9koZ6XkI3Vm+3jXMwIJa8z/GDMd+EQAOrlFQk9p4RZ6X6IYIHUM1LglOvln/A==
X-Received: by 2002:a17:902:c941:b029:12b:27b:a7b0 with SMTP id
 i1-20020a170902c941b029012b027ba7b0mr27433853pla.10.1626876748751; 
 Wed, 21 Jul 2021 07:12:28 -0700 (PDT)
Received: from 192.168.1.6 ([203.163.236.27])
 by smtp.googlemail.com with ESMTPSA id g71sm2880609pfb.139.2021.07.21.07.12.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 07:12:28 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Wed, 21 Jul 2021 19:41:59 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: Ani Sinha <ani@anisinha.ca>
Subject: Re: [PATCH] hw/acpi: some cosmetic improvements to existing code
In-Reply-To: <20210721140714.138638-1-ani@anisinha.ca>
Message-ID: <alpine.DEB.2.22.394.2107211940580.136581@anisinha-lenovo>
References: <20210721140714.138638-1-ani@anisinha.ca>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: none client-ip=2607:f8b0:4864:20::102e;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x102e.google.com
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
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org,
 Ani Sinha <anirban.sinha@nokia.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Please scratch this. I will resend with my nokia email removed. This work
does not involve Nokia.

Ani


On Wed, 21 Jul 2021, Ani Sinha wrote:

> From: Ani Sinha <anirban.sinha@nokia.com>
>
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

