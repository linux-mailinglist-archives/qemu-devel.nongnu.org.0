Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22BB75F96A2
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 03:32:59 +0200 (CEST)
Received: from localhost ([::1]:59158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohhf8-000879-2n
	for lists+qemu-devel@lfdr.de; Sun, 09 Oct 2022 21:32:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ohhcf-0006at-4f
 for qemu-devel@nongnu.org; Sun, 09 Oct 2022 21:30:25 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:44783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ohhcd-0007xJ-Ga
 for qemu-devel@nongnu.org; Sun, 09 Oct 2022 21:30:24 -0400
Received: by mail-pl1-x633.google.com with SMTP id x6so9101398pll.11
 for <qemu-devel@nongnu.org>; Sun, 09 Oct 2022 18:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=v+VKDQ7fgA14LUEq3waOCgY3QWSYG+tB6Kp2RRxnFPE=;
 b=ZQk0kOH31FU1bZaNrrqgB7ReSZczPGqde8YdE/kwtw++XXuVAhYyALqf39uRnW9yoL
 fQIgO1rAezKvvXRt4UX9di7UdSehxr195ImpBYB6Se6du1nU0gJYl+3cjSe0j2udo9Dd
 s/8Tf0suJMXhSgbz7GPfRmRMHAg+bzQNoseeTmsegvggIJ0vFRWrh4BZZgOrpKrXV+gG
 er2ZZl1qMibmd9BPY4MnEyoIqexZjqAJrMZt0A33GEn3Ki9xMZ9gAFYNFEmDDJdLSKvR
 QdNX3tRbz7nSTVH6a/RgitM5iqUz2Y8HC1I6c5wBqhjdwj8sIU04wtlZvuk9SsNobezH
 /wag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=v+VKDQ7fgA14LUEq3waOCgY3QWSYG+tB6Kp2RRxnFPE=;
 b=r43lqO7zPfVyl2pzT0z6a7g0CLGBRbzTBVQMftp6FmSnfNc8VXT60LZ6A6tqwF69nm
 4aBg0b274dRqPwL+jO1pEJng/BNWSLgCIFk/XiFL9gDwMcy1Hus2h61+sK8VIHv2nDDE
 5dz4egjqvoSctzq8OBdK4xBoPCaWvhoUr5RkOLzLrkYFLxPaw6LYaokkLaVxsFo2Lr3J
 Esg5M7TRKka6wNKAv38LtTi4cYyYPqYdA4f8tANLoJsdcveFmkQpLfT/PNznV2M1i64t
 r9OwB0PTmJoPX5vJ20AeA2HtPmO07B7eYLbsyonGxLrnXjcsQO0Sl8JMmmnFdcEJ71AM
 bmKA==
X-Gm-Message-State: ACrzQf10cgE3iF3JsTXHZMaxUHsfhfjR6foWg9kiZbx1pWYfWcHDHIsk
 aDE/s9uc+YKEi4cs3dcY1D+AixgknSCWDfABEvc=
X-Google-Smtp-Source: AMsMyM66k2eub6/bivdQRy4N2PUUd6Va16BjtaSK9b+Bv5OCDE9wPHCYlOezDaPA39pqhz495YofRZ1Tey+M2O2Ltbw=
X-Received: by 2002:a17:902:8693:b0:17a:f71:98fd with SMTP id
 g19-20020a170902869300b0017a0f7198fdmr16574380plo.25.1665365422019; Sun, 09
 Oct 2022 18:30:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220927005429.146974-1-wilfred.mallawa@opensource.wdc.com>
In-Reply-To: <20220927005429.146974-1-wilfred.mallawa@opensource.wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 10 Oct 2022 11:29:55 +1000
Message-ID: <CAKmqyKNc2OWytDTq7JNix1NKjvufFKnCMyHCgXNSv+EoM-mfQg@mail.gmail.com>
Subject: Re: [RFC v2] hw/registerfields: add `FIELDx_1CLEAR()` macro
To: Wilfred Mallawa <wilfred.mallawa@opensource.wdc.com>
Cc: alistair@alistair23.me, qemu-devel@nongnu.org, 
 Wilfred Mallawa <wilfred.mallawa@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=alistair23@gmail.com; helo=mail-pl1-x633.google.com
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

On Tue, Sep 27, 2022 at 10:58 AM Wilfred Mallawa
<wilfred.mallawa@opensource.wdc.com> wrote:
>
> From: Wilfred Mallawa <wilfred.mallawa@wdc.com>
>
> Changes from V1:
>         * Instead of needing all field bits to be set
>           we clear the field if any are set. If the field is
>           0/clear then no change.

The changelog should go

>
> Adds a helper macro that implements the register `w1c`
> functionality.
>
> Ex:
>   uint32_t data = FIELD32_1CLEAR(val, REG, FIELD);
>
> If ANY bits of the specified `FIELD` is set
> then the respective field is cleared and returned to `data`.
>
> If the field is cleared (0), then no change and
> val is returned.
>
> Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
> ---

Below this line.

Otherwise the patch looks good. Do you mind adding it to a series that
converts the OT SPI to use these macros?

>  include/hw/registerfields.h | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>
> diff --git a/include/hw/registerfields.h b/include/hw/registerfields.h
> index 1330ca77de..4a6a228339 100644
> --- a/include/hw/registerfields.h
> +++ b/include/hw/registerfields.h
> @@ -115,6 +115,28 @@
>                    R_ ## reg ## _ ## field ## _LENGTH, _v.v);              \
>      _d; })
>
> +/*
> + * Clear the specified field in reg_val if
> + * any field bits are set, else no changes made. Implements
> + * single/multi-bit `w1c`
> + *
> + */
> +#define FIELD8_1CLEAR(reg_val, reg, field)                                \

These should probably match the other macros with:

(storage, reg, field)

Alistair

