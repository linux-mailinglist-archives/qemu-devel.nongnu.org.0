Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 410D53D33F3
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 07:14:25 +0200 (CEST)
Received: from localhost ([::1]:60268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6nVw-0006YG-05
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 01:14:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1m6nUJ-0005eB-8q
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 01:12:43 -0400
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133]:35362)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1m6nUH-0004ve-Fs
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 01:12:42 -0400
Received: by mail-il1-x133.google.com with SMTP id k3so520400ilu.2
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 22:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=70l4HnC/zje5m4F6fwb2asYz4/8tP8svxk4g8F0+jBI=;
 b=tAKB+uYldhXyWYPzncGagimA8CNlWyMA4MBmwFh+zEgHrFu4erH9RJW+ue7azi2QCo
 DhxuVFMc0dLeQ9T3M6QEaLipyPrJqZGrDcdfGvEp2tVx9SgHB77VJKeJ6Qv4toJr4TKv
 32UB47t39vYzCv6CI47VkwiE7rSWkKi37rLbPu+XzwQl2LWfAJwXmxU+uUXdewLuNCjD
 XEkRCYyJF2DqDi/g51/Jq5QULJS6vERpzRaIxcbitrP9BTMo99BnItGYekkqXLp9Fu8a
 x0HBssuUqns6XtwqSPVuXeR5ZM13Iz1fe6UlSUAV6q0cAGIg+kldpTaXZhBTR+jK85FK
 7RIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=70l4HnC/zje5m4F6fwb2asYz4/8tP8svxk4g8F0+jBI=;
 b=K/6I2jLqX8wGsNxhKyEqaWC9qTw1Z3clfKgh4G3sSPmYRQlOVBXff7cq0Ut51vXY49
 NQ+a3zRHGk6UVC1MX3pf3ZPyXyTSEN8KRRfzOiQ/o487Lx9F1bylxGV0Qe652++ybz/P
 PL4PCMgywB0FMlRahvjZuIzCEQotQ+bKIm4wigduLd27NiidZRFz4Cr5Zbi2EpNIs7w3
 0ItDK1ix8yTDNw+D8WylECo2nHdl4any26sRStWRgoVLTSkNousaQ7eSuhQDQHbgHsG4
 yJ7aesH8P8cyQlxeMl8pQVrqi22ioAJ4qo2Y9jXBbd0x7LN4fU+z9f6erDIhdd0XLvIO
 NPPg==
X-Gm-Message-State: AOAM531eZ9ydGU1HB3NCSiQwhqkrH1/GnlqBLZIRMWl1wlqwUB7UmRmT
 xUyg3C0+zdPAulqj2uaUKZVciriI34dVQZTfuJ8=
X-Google-Smtp-Source: ABdhPJwEAfMaRt8+1/usy1iG4hmNGtqCNUDErBImlhDiqcy9/n4MsKW6owGW0WCjIb02Wfb/FBTg4aE/m0uk7ZOgx2w=
X-Received: by 2002:a05:6e02:1d8d:: with SMTP id
 h13mr2358217ila.40.1627017159937; 
 Thu, 22 Jul 2021 22:12:39 -0700 (PDT)
MIME-Version: 1.0
References: <1626805903-162860-1-git-send-email-joe.komlodi@xilinx.com>
 <1626805903-162860-2-git-send-email-joe.komlodi@xilinx.com>
In-Reply-To: <1626805903-162860-2-git-send-email-joe.komlodi@xilinx.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 23 Jul 2021 15:12:14 +1000
Message-ID: <CAKmqyKOqxqk8zUaAP6SEaGcLRN0d=zN8E8qW28jhuF71ptN8Yw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] hw/core/register: Add more 64-bit utilities
To: Joe Komlodi <joe.komlodi@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::133;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x133.google.com
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
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 21, 2021 at 4:31 AM Joe Komlodi <joe.komlodi@xilinx.com> wrote:
>
> We already have some utilities to handle 64-bit wide registers, so this just
> adds some more for:
> - Initializing 64-bit registers
> - Extracting and depositing to an array of 64-bit registers
>
> Signed-off-by: Joe Komlodi <joe.komlodi@xilinx.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/core/register.c          | 12 ++++++++++++
>  include/hw/register.h       |  8 ++++++++
>  include/hw/registerfields.h |  8 ++++++++
>  3 files changed, 28 insertions(+)
>
> diff --git a/hw/core/register.c b/hw/core/register.c
> index d6f8c20..95b0150 100644
> --- a/hw/core/register.c
> +++ b/hw/core/register.c
> @@ -300,6 +300,18 @@ RegisterInfoArray *register_init_block32(DeviceState *owner,
>                                 data, ops, debug_enabled, memory_size, 32);
>  }
>
> +RegisterInfoArray *register_init_block64(DeviceState *owner,
> +                                         const RegisterAccessInfo *rae,
> +                                         int num, RegisterInfo *ri,
> +                                         uint64_t *data,
> +                                         const MemoryRegionOps *ops,
> +                                         bool debug_enabled,
> +                                         uint64_t memory_size)
> +{
> +    return register_init_block(owner, rae, num, ri, (void *)
> +                               data, ops, debug_enabled, memory_size, 64);
> +}
> +
>  void register_finalize_block(RegisterInfoArray *r_array)
>  {
>      object_unparent(OBJECT(&r_array->mem));
> diff --git a/include/hw/register.h b/include/hw/register.h
> index b480e38..6a076cf 100644
> --- a/include/hw/register.h
> +++ b/include/hw/register.h
> @@ -204,6 +204,14 @@ RegisterInfoArray *register_init_block32(DeviceState *owner,
>                                           bool debug_enabled,
>                                           uint64_t memory_size);
>
> +RegisterInfoArray *register_init_block64(DeviceState *owner,
> +                                         const RegisterAccessInfo *rae,
> +                                         int num, RegisterInfo *ri,
> +                                         uint64_t *data,
> +                                         const MemoryRegionOps *ops,
> +                                         bool debug_enabled,
> +                                         uint64_t memory_size);
> +
>  /**
>   * This function should be called to cleanup the registers that were initialized
>   * when calling register_init_block32(). This function should only be called
> diff --git a/include/hw/registerfields.h b/include/hw/registerfields.h
> index 93fa4a8..9a03ac5 100644
> --- a/include/hw/registerfields.h
> +++ b/include/hw/registerfields.h
> @@ -30,6 +30,10 @@
>      enum { A_ ## reg = (addr) };                                          \
>      enum { R_ ## reg = (addr) / 2 };
>
> +#define REG64(reg, addr)                                                  \
> +    enum { A_ ## reg = (addr) };                                          \
> +    enum { R_ ## reg = (addr) / 8 };
> +
>  /* Define SHIFT, LENGTH and MASK constants for a field within a register */
>
>  /* This macro will define R_FOO_BAR_MASK, R_FOO_BAR_SHIFT and R_FOO_BAR_LENGTH
> @@ -58,6 +62,8 @@
>  /* Extract a field from an array of registers */
>  #define ARRAY_FIELD_EX32(regs, reg, field)                                \
>      FIELD_EX32((regs)[R_ ## reg], reg, field)
> +#define ARRAY_FIELD_EX64(regs, reg, field)                                \
> +    FIELD_EX64((regs)[R_ ## reg], reg, field)
>
>  /* Deposit a register field.
>   * Assigning values larger then the target field will result in
> @@ -99,5 +105,7 @@
>  /* Deposit a field to array of registers.  */
>  #define ARRAY_FIELD_DP32(regs, reg, field, val)                           \
>      (regs)[R_ ## reg] = FIELD_DP32((regs)[R_ ## reg], reg, field, val);
> +#define ARRAY_FIELD_DP64(regs, reg, field, val)                           \
> +    (regs)[R_ ## reg] = FIELD_DP64((regs)[R_ ## reg], reg, field, val);
>
>  #endif
> --
> 2.7.4
>

