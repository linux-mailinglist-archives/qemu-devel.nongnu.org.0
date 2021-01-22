Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02AD8300418
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 14:26:14 +0100 (CET)
Received: from localhost ([::1]:58816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2wS4-0008Ca-Tu
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 08:26:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2wO8-0007Pp-JE
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 08:22:08 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:41963)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2wO6-0001Jl-AS
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 08:22:08 -0500
Received: by mail-ed1-x532.google.com with SMTP id bx12so6503220edb.8
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 05:22:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aE3V7jeuUdZOH8oF3ccmuz3mOcpTb5Dz+Hy4dLCviiQ=;
 b=cMY4abpAg834T1jK5+WBxj3wEE+1PkJhOIMsIRMpjpdCDZfigRLm7iM+G3Lvd4yukL
 xLbtBJ6VhyAjQc6jgw+vcwtvtGGGZs7fQTpH6SFcxBUdlQGbh9TR18mxxrVyQbtiWnv7
 I4CuRkPv6thi4xmeGJPemSg50NIlMxteKVs0z+vispukwC0eR4kesrErvUu6k6LPa95W
 OeVA6smjh2Zll3cNMMPRoOvymhSKAO/uiqMsE3B3ZVpKb/oa4xbSM1aHtqPdVtufwnDr
 k/N88Hh3TNtlZ44JE7KIjhj8r8JCi8odzJeuDl39JBOcBYC6cGwvg/wXQgBqAKcisvCA
 7Iig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aE3V7jeuUdZOH8oF3ccmuz3mOcpTb5Dz+Hy4dLCviiQ=;
 b=aUXjd/7mnCB8feN9cNTmNqvvex7n73zYmdjnBtbv+8Rinoj1aV4wko2fSpmhEKdVC7
 RCwDLE2VULe1NlOYM5vVYpXVxykqmk2r6UKgfbZJPJzX1TcY9L3/+hxy10NI4BQM4Ywr
 SDmNGulkEwx4Cw44D1jgehi1UIecVVZdKF/7pO45zOWpIHklEKwIVqMAojyTmIiN7XwS
 eDFDKuMFG9fabFdfvXjtzqUXEVA9c22n7CG6MF5AU1JbwkVEMid0aEfdragaA6Msw+zl
 ym0TWSSod9pwCtvcZtfqcd1SeerZZRZZxRgsl7Dsv96L+JdlnbWnkKgB5XSnit5b2tqz
 UDig==
X-Gm-Message-State: AOAM531+vh/u3hM0P+Dq9SYPgHAiRsSYzXiWVEqE8gX1Lpiqb37UPLlr
 em+zTNLGifqO9NmZUcMtQXMJE7MGseXyi/G+XDfSYg==
X-Google-Smtp-Source: ABdhPJzWwDxNB8hNeUuaEP3MTAiy1KOh4l5CRv1ZQtpb0pxOClrANcEJuIfP/WJM1rcUcyi4FleFJMcy4wl9gsjtxlU=
X-Received: by 2002:a05:6402:5107:: with SMTP id
 m7mr3166595edd.52.1611321724789; 
 Fri, 22 Jan 2021 05:22:04 -0800 (PST)
MIME-Version: 1.0
References: <20210118162537.779542-1-pbonzini@redhat.com>
In-Reply-To: <20210118162537.779542-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Jan 2021 13:21:53 +0000
Message-ID: <CAFEAcA_En1xo10n3121r3ZRANkhiH0dRRwT5QwMZ1wRTeLyFWA@mail.gmail.com>
Subject: Re: [PATCH] arm: rename xlnx-zcu102.canbusN properties
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Vikram Garhwal <fnu.vikram@xilinx.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Just noticed this wasn't cc'd to the Xilinx folks. Would one
of you like to review it?

thanks
-- PMM

On Mon, 18 Jan 2021 at 16:25, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The properties to attach a CANBUS object to the xlnx-zcu102 machine have
> a period in them.  We want to use periods in properties for compound QAPI types,
> and besides the "xlnx-zcu102." prefix is both unnecessary and different
> from any other machine property name.  Remove it.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  hw/arm/xlnx-zcu102.c        |  4 ++--
>  tests/qtest/xlnx-can-test.c | 30 +++++++++++++++---------------
>  2 files changed, 17 insertions(+), 17 deletions(-)
>
> diff --git a/hw/arm/xlnx-zcu102.c b/hw/arm/xlnx-zcu102.c
> index 4ef0c516bf..c9713638c5 100644
> --- a/hw/arm/xlnx-zcu102.c
> +++ b/hw/arm/xlnx-zcu102.c
> @@ -219,12 +219,12 @@ static void xlnx_zcu102_machine_instance_init(Object *obj)
>      s->secure = false;
>      /* Default to virt (EL2) being disabled */
>      s->virt = false;
> -    object_property_add_link(obj, "xlnx-zcu102.canbus0", TYPE_CAN_BUS,
> +    object_property_add_link(obj, "canbus0", TYPE_CAN_BUS,
>                               (Object **)&s->canbus[0],
>                               object_property_allow_set_link,
>                               0);
>
> -    object_property_add_link(obj, "xlnx-zcu102.canbus1", TYPE_CAN_BUS,
> +    object_property_add_link(obj, "canbus1", TYPE_CAN_BUS,
>                               (Object **)&s->canbus[1],
>                               object_property_allow_set_link,
>                               0);
> diff --git a/tests/qtest/xlnx-can-test.c b/tests/qtest/xlnx-can-test.c
> index 3d1120005b..54de71a686 100644
> --- a/tests/qtest/xlnx-can-test.c
> +++ b/tests/qtest/xlnx-can-test.c
> @@ -138,9 +138,9 @@ static void test_can_bus(void)
>      uint8_t can_timestamp = 1;
>
>      QTestState *qts = qtest_init("-machine xlnx-zcu102"
> -                " -object can-bus,id=canbus0"
> -                " -machine xlnx-zcu102.canbus0=canbus0"
> -                " -machine xlnx-zcu102.canbus1=canbus0"
> +                " -object can-bus,id=canbus"
> +                " -machine canbus0=canbus"
> +                " -machine canbus1=canbus"
>                  );
>
>      /* Configure the CAN0 and CAN1. */
> @@ -175,9 +175,9 @@ static void test_can_loopback(void)
>      uint32_t status = 0;
>
>      QTestState *qts = qtest_init("-machine xlnx-zcu102"
> -                " -object can-bus,id=canbus0"
> -                " -machine xlnx-zcu102.canbus0=canbus0"
> -                " -machine xlnx-zcu102.canbus1=canbus0"
> +                " -object can-bus,id=canbus"
> +                " -machine canbus0=canbus"
> +                " -machine canbus1=canbus"
>                  );
>
>      /* Configure the CAN0 in loopback mode. */
> @@ -223,9 +223,9 @@ static void test_can_filter(void)
>      uint8_t can_timestamp = 1;
>
>      QTestState *qts = qtest_init("-machine xlnx-zcu102"
> -                " -object can-bus,id=canbus0"
> -                " -machine xlnx-zcu102.canbus0=canbus0"
> -                " -machine xlnx-zcu102.canbus1=canbus0"
> +                " -object can-bus,id=canbus"
> +                " -machine canbus0=canbus"
> +                " -machine canbus1=canbus"
>                  );
>
>      /* Configure the CAN0 and CAN1. */
> @@ -271,9 +271,9 @@ static void test_can_sleepmode(void)
>      uint8_t can_timestamp = 1;
>
>      QTestState *qts = qtest_init("-machine xlnx-zcu102"
> -                " -object can-bus,id=canbus0"
> -                " -machine xlnx-zcu102.canbus0=canbus0"
> -                " -machine xlnx-zcu102.canbus1=canbus0"
> +                " -object can-bus,id=canbus"
> +                " -machine canbus0=canbus"
> +                " -machine canbus1=canbus"
>                  );
>
>      /* Configure the CAN0. */
> @@ -317,9 +317,9 @@ static void test_can_snoopmode(void)
>      uint8_t can_timestamp = 1;
>
>      QTestState *qts = qtest_init("-machine xlnx-zcu102"
> -                " -object can-bus,id=canbus0"
> -                " -machine xlnx-zcu102.canbus0=canbus0"
> -                " -machine xlnx-zcu102.canbus1=canbus0"
> +                " -object can-bus,id=canbus"
> +                " -machine canbus0=canbus"
> +                " -machine canbus1=canbus"
>                  );
>
>      /* Configure the CAN0. */
> --
> 2.26.2

