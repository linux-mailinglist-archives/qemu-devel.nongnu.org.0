Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 460AF3CF492
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 08:34:48 +0200 (CEST)
Received: from localhost ([::1]:36548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5jL4-0004Y8-R9
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 02:34:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1m5jK5-0003rU-Da
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 02:33:46 -0400
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f]:40768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1m5jK3-0005WW-A0
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 02:33:45 -0400
Received: by mail-io1-xd2f.google.com with SMTP id l5so22840732iok.7
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 23:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=puRB0YDhnEl+Mbdf6iwEQYH7EaK0gzfw7chql7UUYH4=;
 b=uul+GY9r8xDzNoxAdfXQSHvT6WiC0koHSMYpVN2+BB2HC6EIR6uu1+Ly7lftt/N29r
 V08r7B9tisbvmbKnKHgvjHTO/mHQeROva6vdZrZ9BRdienEg1KxmmCLzotHToQSzgvXx
 mjMwp9dbvk0JiEqk/DgRSLXAlkxEMha2XqKyR7MqHwBYZrW7zHY37AuVGWx0NKXywwhL
 E5y8brJaJVdAqOKlOxehL+8P45/c9c/dUB5QlMYpjim7BWVLmb0+w1EZuBTWN6pyB+Wz
 NI4wLq8fPOmjuFJlMkFmtGYi8Zl7IPuoaww/HWPE2Qx2LjisB7+n1kkBaNDa71F5yPYv
 35YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=puRB0YDhnEl+Mbdf6iwEQYH7EaK0gzfw7chql7UUYH4=;
 b=dx8CAAf3WVvZJ3a0/TLf7LTObfdgxHQ39ULUptohXPlv3DIzoo9u7ErjxZLkrkHhSw
 EnKZsgdwLTI3/HZTjEftv292uSqkgO827ZzC85vVTG1B9uHp2xjY3TznFj1kTQ6TV3se
 WnVN+feYyegId1XSqAGruoI2C1cb0aixte4UJUx64Af8uLUGvu1K1+qELKm8f+w10i8L
 uqhl2TqZ/OZQv+Pggi6AQdbZLHG/dBh4HfMuWL7jJhRIl1zG4jsBCwB2qJH/A7T+HJ7h
 6L1lVMyQ93JohL8cCR4STpseaXk+sim9xJRheHyjMy6jg2HgcyzURxmX1Pp41XXq2iO2
 2rZA==
X-Gm-Message-State: AOAM532RqJIUFfwfEMtlW2+Bjah29MQz4gU2jPou9hYZ0A0zRaX8TvxB
 1U2xNkq8tLweOstGHF6X4m8EHT3zCcED9LIgrOI=
X-Google-Smtp-Source: ABdhPJxT2cyGPa8gW74EAEYZIQ5++5f0YX92zeNAg4v+GtRv4dNczMuj9/B2yJnU9oRx76aKs00qEy9ryiWG6HcES84=
X-Received: by 2002:a02:90d0:: with SMTP id c16mr25087075jag.106.1626762821697; 
 Mon, 19 Jul 2021 23:33:41 -0700 (PDT)
MIME-Version: 1.0
References: <1626732165-137461-1-git-send-email-joe.komlodi@xilinx.com>
 <1626732165-137461-2-git-send-email-joe.komlodi@xilinx.com>
In-Reply-To: <1626732165-137461-2-git-send-email-joe.komlodi@xilinx.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 20 Jul 2021 16:33:15 +1000
Message-ID: <CAKmqyKNaZvusYajpN9SEUr9m9QnCfxHgRP7SAvRKgd8sXqCJLA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] hw/core/register: Add more 64-bit utilities
To: Joe Komlodi <joe.komlodi@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2f;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2f.google.com
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
Cc: Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 20, 2021 at 8:05 AM Joe Komlodi <joe.komlodi@xilinx.com> wrote:
>
> We already have some utilities to handle 64-bit wide registers, so this just
> adds some more for:
> - Initializing 64-bit registers
> - Extracting and depositing to an array of 64-bit registers
>
> Signed-off-by: Joe Komlodi <joe.komlodi@xilinx.com>
> ---
>  hw/core/register.c          | 12 ++++++++++++
>  include/hw/register.h       |  8 ++++++++
>  include/hw/registerfields.h |  8 ++++++++
>  3 files changed, 28 insertions(+)
>
> diff --git a/hw/core/register.c b/hw/core/register.c
> index d6f8c20..ab20258 100644
> --- a/hw/core/register.c
> +++ b/hw/core/register.c
> @@ -300,6 +300,18 @@ RegisterInfoArray *register_init_block32(DeviceState *owner,
>                                 data, ops, debug_enabled, memory_size, 32);
>  }
>
> +RegisterInfoArray *register_init_block64(DeviceState *owner,
> +                                         const RegisterAccessInfo *rae,
> +                                         int num, RegisterInfo *ri,
> +                                         uint32_t *data,

This should be uint64_t

Alistair

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
> index b480e38..0197e45 100644
> --- a/include/hw/register.h
> +++ b/include/hw/register.h
> @@ -204,6 +204,14 @@ RegisterInfoArray *register_init_block32(DeviceState *owner,
>                                           bool debug_enabled,
>                                           uint64_t memory_size);
>
> +RegisterInfoArray *register_init_block64(DeviceState *owner,
> +                                         const RegisterAccessInfo *rae,
> +                                         int num, RegisterInfo *ri,
> +                                         uint32_t *data,
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
>

