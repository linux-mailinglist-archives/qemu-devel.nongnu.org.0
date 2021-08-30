Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFAF33FB078
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 06:46:44 +0200 (CEST)
Received: from localhost ([::1]:33702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKZBz-0003A9-Bl
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 00:46:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mKZAR-0002O8-Sf
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 00:45:07 -0400
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a]:45770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mKZAP-0007xB-Dx
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 00:45:07 -0400
Received: by mail-il1-x12a.google.com with SMTP id v2so14653206ilg.12
 for <qemu-devel@nongnu.org>; Sun, 29 Aug 2021 21:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xlHV/oMYQKAEMZambxd68P2NO/Ho6LN0nOybC6eq1Mo=;
 b=tlXdC4U0UKDbSY6gw/9Csnpola4jWJ5Y+52oBA4xfEgj29/tGWW83zaV9dliio1w7s
 flkYUj5OfMFCLElAKEDfCX7grtIqrjpmUVLzHRVIXvBCrwGR8uRiYOKMozCwZ2yzOkGk
 GCsGDGkfc6ue1pd/lQIg6oZKw+o7quVaksAUaLAwGz3BvdIvFQD1Drk0P4y9FfUHo2wO
 EaDOATPr5+bJpM1h/Jj9Qm+hGOMtTUZOh2HfUXjFGbd4PQyndVcxWfhCWC+n4AGJDEiy
 BNAkp43HRCfCVhM8K/fOv2rObGqQwFvi9247EFkcViukxkuKfDsyl4F94H9zY8P1Ncnf
 ugGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xlHV/oMYQKAEMZambxd68P2NO/Ho6LN0nOybC6eq1Mo=;
 b=trBT2Qp7b/5607TWJIzvdTgd8oHm/6FDlP/y/JjlAv+d8C8HuAj4lP8B2pgqgwz1EK
 VlFyQIQbbrPiPOzvk8EZYTldVx5aUB/DYT51hsGztw/RDECdoTtpEWuf6C6AQD5AYXBo
 4yQuEjuUCZ3CTektjcRc3I5L/0yqUIRrBzM92oZpfUmJirL/DJkHNpjUQwGQyFE2roMK
 GVWAZYcTM/Gbk4/NkwNMpsQIhJH/AO3Sf20zbbm0Fnz9LuzwQLpr0JNw66+e9VMO+qdT
 J+FzJrkzJllhKrcMH+YuPPJIOzzcJAABxayztAer+ffMhoWRllsW/pkDmR4X/IAUyHig
 UVzw==
X-Gm-Message-State: AOAM530DgtLLCVNyIyIsecVugg1DszJw04Ah7f0s4az+avLCwOSyzVPc
 8dJCpYQSkI/abhlBU4VTjbjqiiidfELHcMGN+Uo=
X-Google-Smtp-Source: ABdhPJwEcx7Uqlx/JaiV6mDXIso2383EYdtVG/sGDrKyx4DD34cRF25CBEPdi+K37YO/n59uA6rGPrrEQdxSdxpr5og=
X-Received: by 2002:a92:ce03:: with SMTP id b3mr15002327ilo.267.1630298703884; 
 Sun, 29 Aug 2021 21:45:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210825165907.34026-1-philipp.tomsich@vrull.eu>
 <20210825165907.34026-2-philipp.tomsich@vrull.eu>
In-Reply-To: <20210825165907.34026-2-philipp.tomsich@vrull.eu>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 30 Aug 2021 14:44:37 +1000
Message-ID: <CAKmqyKNM75orG9KvGeuiMEQA-xvdcuTgq+3hs8XDot70aODniw@mail.gmail.com>
Subject: Re: [PATCH v6 01/14] target/riscv: Add x-zba, x-zbb,
 x-zbc and x-zbs properties
To: Philipp Tomsich <philipp.tomsich@vrull.eu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12a;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12a.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Kito Cheng <kito.cheng@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Aug 26, 2021 at 3:01 AM Philipp Tomsich
<philipp.tomsich@vrull.eu> wrote:
>
> The bitmanipulation ISA extensions will be ratified as individual
> small extension packages instead of a large B-extension.  The first
> new instructions through the door (these have completed public review)
> are Zb[abcs].
>
> This adds new 'x-zba', 'x-zbb', 'x-zbc' and 'x-zbs' properties for
> these in target/riscv/cpu.[ch].
>
> Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
> (no changes since v3)
>
> Changes in v3:
> - Split off removal of 'x-b' property and 'ext_b' field into a separate
>   patch to ensure bisectability.
>
>  target/riscv/cpu.c | 4 ++++
>  target/riscv/cpu.h | 4 ++++
>  2 files changed, 8 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 991a6bb760..c7bc1f9f44 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -585,6 +585,10 @@ static Property riscv_cpu_properties[] = {
>      DEFINE_PROP_BOOL("u", RISCVCPU, cfg.ext_u, true),
>      /* This is experimental so mark with 'x-' */
>      DEFINE_PROP_BOOL("x-b", RISCVCPU, cfg.ext_b, false),
> +    DEFINE_PROP_BOOL("x-zba", RISCVCPU, cfg.ext_zba, false),
> +    DEFINE_PROP_BOOL("x-zbb", RISCVCPU, cfg.ext_zbb, false),
> +    DEFINE_PROP_BOOL("x-zbc", RISCVCPU, cfg.ext_zbc, false),
> +    DEFINE_PROP_BOOL("x-zbs", RISCVCPU, cfg.ext_zbs, false),
>      DEFINE_PROP_BOOL("x-h", RISCVCPU, cfg.ext_h, false),
>      DEFINE_PROP_BOOL("x-v", RISCVCPU, cfg.ext_v, false),
>      DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index bf1c899c00..7c4cd8ea89 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -293,6 +293,10 @@ struct RISCVCPU {
>          bool ext_u;
>          bool ext_h;
>          bool ext_v;
> +        bool ext_zba;
> +        bool ext_zbb;
> +        bool ext_zbc;
> +        bool ext_zbs;
>          bool ext_counters;
>          bool ext_ifencei;
>          bool ext_icsr;
> --
> 2.25.1
>
>

