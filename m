Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0CA3404421
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 05:59:57 +0200 (CEST)
Received: from localhost ([::1]:34366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOBEC-0004TQ-Mz
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 23:59:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mOBDE-0003nJ-Rn
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 23:58:56 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:38891)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mOBDD-0000rB-67
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 23:58:56 -0400
Received: by mail-pg1-x52a.google.com with SMTP id w8so479573pgf.5
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 20:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20150623.gappssmtp.com; s=20150623;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=trhxy/YcJSNS/q6kYUL/0o5y6SNeOMA3jIsZaoiVvak=;
 b=OXD4RzhDazMgF89dIjsZnDCLQS2Tqx0yj84eFds+bElO7xFQb90lKxb+alyUvvKk6D
 s2mZ/Y/z+ebl/qfEgPNhgyZNN1BOIukVIJzdSGEaYYfoUG76BRTDwwttbL2auYhlA/l6
 UhUsnEwd6Qwz54LE31/DirBWLyIMKDix8DA/LUBPPzy4DtdgxUtGU7FYzFjSZwqtX5Kl
 MR7gZyuxcvzyW+lrocznKT8Cc4K+bT7OXT7OKr1HNyfu8gbt/cnWNfeLWANlO8y64F6h
 kInwzvbe+yDFXfMxtcaDfY42aTXKrBPuzpU2icvoDWU9or7UtCzSQ5q44l7IJon8R5YR
 +GXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=trhxy/YcJSNS/q6kYUL/0o5y6SNeOMA3jIsZaoiVvak=;
 b=sT9J/gLTD0SOyiCPyqKK/Owni1v+BpRAbGm73kMJC593KSSIgYWx0fbxHfOaO6OEtn
 aJOnfcMlt8RE8SkWv6JUXX+dU6HuDDo/ilFRLCkz62XJqj1O6/ygVL8IsbPbDHXTBSkZ
 NgC+PSkJli7xlJQAH2or0ltwP5pRlx6pnEtt4QwnqS2d3LihWtlo2XEC8rx8JoLYBM/f
 iBOap8eNjw0N6dN0vUUGDXCvHTKS1Le8iPmPzlmlTHtrsbwT8q7vZSJsDvLa4v4hvHUf
 Opwwlocv68u/0SfBfnJlr/stNw/F/EmstJw4ARk3vW+YEKEFE0RTz7iGaz8xZrH0BTVR
 D/JA==
X-Gm-Message-State: AOAM532s9bQJMmZDcDD9XOtUR1+Esji97lWiKi+FY8mAktMbomrDMaAd
 OCzrrUsrgFziZAgYbkUyGNbJOQ==
X-Google-Smtp-Source: ABdhPJxik5fFgDXaPRmJ0ipgyUpfHRTYVcEvjWeNnbvrT14JX2RQ7afzjXRHFNZU+SPQsN+2NWKdSA==
X-Received: by 2002:a62:1450:0:b0:411:26a5:ba7e with SMTP id
 77-20020a621450000000b0041126a5ba7emr1078093pfu.77.1631159933385; 
 Wed, 08 Sep 2021 20:58:53 -0700 (PDT)
Received: from anisinha-lenovo ([115.96.125.41])
 by smtp.googlemail.com with ESMTPSA id ch19sm387657pjb.33.2021.09.08.20.58.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 20:58:52 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Thu, 9 Sep 2021 09:28:46 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH] hw/i386/acpi-build: Fix a typo
In-Reply-To: <20210908222157.2377282-1-philmd@redhat.com>
Message-ID: <alpine.DEB.2.22.394.2109090809210.2574878@anisinha-lenovo>
References: <20210908222157.2377282-1-philmd@redhat.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="2088271309-476658317-1631159932=:2574878"
Received-SPF: none client-ip=2607:f8b0:4864:20::52a;
 envelope-from=ani@anisinha.ca; helo=mail-pg1-x52a.google.com
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--2088271309-476658317-1631159932=:2574878
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT



On Thu, 9 Sep 2021, Philippe Mathieu-Daudé wrote:

> Fix 'hotplugabble' -> 'hotpluggabble' typo.
>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>

Reviewed-by: Ani Sinha <ani@anisinha.ca>

> ---
>  hw/i386/acpi-build.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index d1f5fa3b5a5..478263e12c9 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -1916,7 +1916,7 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
>      PCMachineState *pcms = PC_MACHINE(machine);
>      int nb_numa_nodes = machine->numa_state->num_nodes;
>      NodeInfo *numa_info = machine->numa_state->nodes;
> -    ram_addr_t hotplugabble_address_space_size =
> +    ram_addr_t hotpluggabble_address_space_size =
>          object_property_get_int(OBJECT(pcms), PC_MACHINE_DEVMEM_REGION_SIZE,
>                                  NULL);
>
> @@ -2022,10 +2022,10 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
>       * Memory devices may override proximity set by this entry,
>       * providing _PXM method if necessary.
>       */
> -    if (hotplugabble_address_space_size) {
> +    if (hotpluggabble_address_space_size) {
>          numamem = acpi_data_push(table_data, sizeof *numamem);
>          build_srat_memory(numamem, machine->device_memory->base,
> -                          hotplugabble_address_space_size, nb_numa_nodes - 1,
> +                          hotpluggabble_address_space_size, nb_numa_nodes - 1,
>                            MEM_AFFINITY_HOTPLUGGABLE | MEM_AFFINITY_ENABLED);
>      }
>
> --
> 2.31.1
>
>
--2088271309-476658317-1631159932=:2574878--

