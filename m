Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B3A557C6C
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 15:03:13 +0200 (CEST)
Received: from localhost ([::1]:40930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4MUK-0004u6-DA
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 09:03:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4MPT-0002oq-At
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 08:58:11 -0400
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131]:40635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4MPR-000870-Q8
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 08:58:11 -0400
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-317a66d62dfso132294247b3.7
 for <qemu-devel@nongnu.org>; Thu, 23 Jun 2022 05:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ko7ME7+w5VjeJMsrwGq5U2qPP5wbHBuC21S8nSLJTzY=;
 b=iMjg58UE+9Embz91PXP/aiKB9M1MqzkHJwF11dAyVccMXKd+gpI+6gywucwCx2XGAW
 5Ab7OWLnFUgvFZVYDkip9hsAzQUO/9YGHTHHa2VHpTQ+Jzenxnbwoo3fBbhabeMyY8I+
 F43UM7ppBs1bkoxNZ3lO5tzspiImCQ/YYabMhiCkeT57P45kDqdqGk6VeXsr/8makJpx
 y8j8FM+CG7VgB0ue0NS/PN7qxyWkIcj3ELbfINpQHsGSdTo82yae2pyMC+dS1oBXrpID
 NC/D0OlUTM2TlIKfuo7MOjv8EX6PdDqClPEjDl4w8UVgTcIdy3ColS2aWqkUhI1no0J3
 rQww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ko7ME7+w5VjeJMsrwGq5U2qPP5wbHBuC21S8nSLJTzY=;
 b=h6IoWMrSGhv8ulRZ2kR3DE0CketO/fBLLHQOwq/8gp2FMHOe6OvvPr4Nx5CjCsXTmF
 dh0plISWW/TPQ+Xd+O40oP7iFnbWXKTBoESerKzlZBR66oNOnwSfoghLsmOhauHXWoej
 zLGQhCbRSh8ctkoiJBCRDIeFVIELZb3Yy0KQZZjyql4X+7NasWPIbgOBUC0XTRXueEod
 qcMOqrmo9Xjh0VYymiMozB+F4It0DglCsDnyfDlARSabhabU1RCUwhY5QcCBjW8gfeyR
 gsyAgLucIXi3H8gD/vN5tHZSbXCY26XHq9tFOXF+4wd8A8ywvxKMZ3yK1zAWj5tz7ovP
 qdIw==
X-Gm-Message-State: AJIora97Kxc6gohhLFH1sfe7GoHIJfhtFbII9keUOavb6aNOXiUXumL1
 wUam5NI62JwYZo99bS7OhOYuaKODkbkKeZP9Tgb4SQ==
X-Google-Smtp-Source: AGRyM1soiGVo/oTti3dxT46n6pYK0t9VT6omrlNA07fGyDiBiwloAu3SwMYGmRCuSCuLcunAJH+/vxzBPuTwahhyGWE=
X-Received: by 2002:a0d:d712:0:b0:317:a108:9778 with SMTP id
 z18-20020a0dd712000000b00317a1089778mr10312102ywd.64.1655989087842; Thu, 23
 Jun 2022 05:58:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220623102617.2164175-1-pdel@fb.com>
 <20220623102617.2164175-9-pdel@fb.com>
In-Reply-To: <20220623102617.2164175-9-pdel@fb.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Jun 2022 13:57:57 +0100
Message-ID: <CAFEAcA9GAr=Rv9GMsnUux3_PNk1gRPBOcSyPzD9MRP5UzOZO1Q@mail.gmail.com>
Subject: Re: [PATCH 08/14] aspeed: Replace direct get_system_memory() calls
To: Peter Delevoryas <pdel@fb.com>
Cc: clg@kaod.org, andrew@aj.id.au, joel@jms.id.au, pbonzini@redhat.com, 
 berrange@redhat.com, eduardo@habkost.net, marcel.apfelbaum@gmail.com, 
 richard.henderson@linaro.org, f4bug@amsat.org, ani@anisinha.ca, 
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, kvm@vger.kernel.org
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

On Thu, 23 Jun 2022 at 13:37, Peter Delevoryas <pdel@fb.com> wrote:
>
> Note: sysbus_mmio_map(), sysbus_mmio_map_overlap(), and others are still
> using get_system_memory indirectly.
>
> Signed-off-by: Peter Delevoryas <pdel@fb.com>
> ---
>  hw/arm/aspeed.c         | 8 ++++----
>  hw/arm/aspeed_ast10x0.c | 5 ++---
>  hw/arm/aspeed_ast2600.c | 2 +-
>  hw/arm/aspeed_soc.c     | 6 +++---
>  4 files changed, 10 insertions(+), 11 deletions(-)
>
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 8dae155183..3aa74e88fb 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -371,7 +371,7 @@ static void aspeed_machine_init(MachineState *machine)
>                           amc->uart_default);
>      qdev_realize(DEVICE(&bmc->soc), NULL, &error_abort);
>
> -    memory_region_add_subregion(get_system_memory(),
> +    memory_region_add_subregion(bmc->soc.system_memory,
>                                  sc->memmap[ASPEED_DEV_SDRAM],
>                                  &bmc->ram_container);

This is board code, it shouldn't be reaching into the internals
of the SoC object like this. The board code probably already
has the right MemoryRegion because it was the one that passed
it to the SoC link porperty in the first place.

thanks
-- PMM

