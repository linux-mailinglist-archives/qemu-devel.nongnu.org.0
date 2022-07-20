Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3989D57B628
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 14:13:17 +0200 (CEST)
Received: from localhost ([::1]:47502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oE8Zo-0003aA-87
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 08:13:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oE8Wy-0000TD-GK
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 08:10:22 -0400
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131]:42500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oE8Ws-000289-Sv
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 08:10:17 -0400
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-2ef5380669cso171263277b3.9
 for <qemu-devel@nongnu.org>; Wed, 20 Jul 2022 05:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=X6Q5ooBaErYmH3Oa6IKafZzOXMKwJ2bqsNuizoTxp/I=;
 b=QoxBcAVi25+rS/PtEH5SwK1jfyntR2wXrA3ir7J4TPNoMKWxZRhJiZlVqlGepwjErE
 65ykgu9/ExLMoPwe3rYYYRPrQKdEHHO4Upm91dS6k7DXUrqmSvAGyhrBMAUh1z3plv7k
 xlbBVQCWo9TmMmBsHWuNeDEahX+4nIvreOG/oPEmeEMo40gZzq/pjgXXgn/F/DufFrch
 CI1VsSawLhWOR1nK7ifQ2hPPE2/s4pHhcMQn2r5tMmNhYobFSZJOODG3z+F67PeubwIY
 GhUQ6FqzUo3p7JlyWGtWwYzWzmQG+BPll8gV2q0Q7SGghKiGV2pUOcz8WhSdj25QRzY/
 gT/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=X6Q5ooBaErYmH3Oa6IKafZzOXMKwJ2bqsNuizoTxp/I=;
 b=d9xp2OHoTO1sOsfkNDLlUgQQy9wPpqgAMNKxZkLR+8xIv3KMBX7x0kXjvMNt3no3Mt
 VkjD4mpTGO5dHV3MN7JsbizaKmucib1VultXBvRYrpehXq0NdUureEQyStXD3InRM0Fb
 L8utOEMYGIvPfq07jSJ8dqDyUyj4/uZUZqmQZ52AuaxDykP09Wlgy8m9TF/k9RVby+T9
 76gguJUxN5a239nxxOi9E0Ay7KClThxfOzGmr4BflhwhTAzcrfGguaUqbPc8uScrQC9B
 rpSmIx/b7o2t8aT7bnLtpPcXuE61y4T1e7SIzmh0j38MNuXJCYNzrTVjyn3BcrDkQ4id
 KMpg==
X-Gm-Message-State: AJIora+4hv/mNxs+reEAqaGPn7AkPSFQQs6C9J86xXH2Ajbqf9IJeG8A
 pjx3138zguqnz79n6A0u7VZ7QCSyNb2UssQ/CV7rdw==
X-Google-Smtp-Source: AGRyM1vGUxbG6wPABKHJVzNkLYxmoBKdAm53pyspkQdtig3yPxqhNDO+ZYSisaXl4p608FuiPJiCQyb8KPd2n9RBwBI=
X-Received: by 2002:a81:106:0:b0:2d0:e682:8a7a with SMTP id
 6-20020a810106000000b002d0e6828a7amr40711682ywb.257.1658319013249; Wed, 20
 Jul 2022 05:10:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220719180000.378186-1-richard.henderson@linaro.org>
 <20220719180000.378186-21-richard.henderson@linaro.org>
In-Reply-To: <20220719180000.378186-21-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 20 Jul 2022 13:10:01 +0100
Message-ID: <CAFEAcA82Q60bvOxQ7HNzpiu-Uxgaq2zV8CMW3H9x+YntdG_Weg@mail.gmail.com>
Subject: Re: [PULL 20/21] hw/loongarch: Add acpi ged support
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, Xiaojuan Yang <yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1131.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 19 Jul 2022 at 19:16, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
>
> Loongarch virt machine uses general hardware reduces acpi method, rather
> than LS7A acpi device. Now only power management function is used in
> acpi ged device, memory hotplug will be added later. Also acpi tables
> such as RSDP/RSDT/FADT etc.
>
> The acpi table has submited to acpi spec, and will release soon.
>
> Acked-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
> Message-Id: <20220712083206.4187715-6-yangxiaojuan@loongson.cn>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Didn't notice this in the original CI, but this generates a compiler
warning on openbsd:

../src/hw/loongarch/acpi-build.c:416:12: warning: variable 'aml_len'
set but not used [-Wunused-but-set-variable]
    size_t aml_len = 0;
           ^

and we do indeed only ever seem to set and update that variable;
we never use it.

> +static void acpi_build(AcpiBuildTables *tables, MachineState *machine)
> +{
> +    LoongArchMachineState *lams = LOONGARCH_MACHINE(machine);
> +    GArray *table_offsets;
> +    AcpiFadtData fadt_data;
> +    unsigned facs, rsdt, fadt, dsdt;
> +    uint8_t *u;
> +    size_t aml_len = 0;
> +    GArray *tables_blob = tables->table_data;
> +
> +    init_common_fadt_data(&fadt_data);
> +
> +    table_offsets = g_array_new(false, true, sizeof(uint32_t));
> +    ACPI_BUILD_DPRINTF("init ACPI tables\n");
> +
> +    bios_linker_loader_alloc(tables->linker,
> +                             ACPI_BUILD_TABLE_FILE, tables_blob,
> +                             64, false);
> +
> +    /*
> +     * FACS is pointed to by FADT.
> +     * We place it first since it's the only table that has alignment
> +     * requirements.
> +     */
> +    facs = tables_blob->len;
> +    build_facs(tables_blob);
> +
> +    /* DSDT is pointed to by FADT */
> +    dsdt = tables_blob->len;
> +    build_dsdt(tables_blob, tables->linker, machine);
> +
> +    /*
> +     * Count the size of the DSDT, we will need it for
> +     * legacy sizing of ACPI tables.
> +     */
> +    aml_len += tables_blob->len - dsdt;

This comment claims we're going to use this value -- is it wrong ?

thanks
-- PMM

