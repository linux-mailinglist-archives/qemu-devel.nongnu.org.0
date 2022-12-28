Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F2365725C
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Dec 2022 04:33:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pANBZ-0005Cs-Kn; Tue, 27 Dec 2022 22:32:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pANBU-0005CO-OA
 for qemu-devel@nongnu.org; Tue, 27 Dec 2022 22:32:52 -0500
Received: from mail-vs1-xe2d.google.com ([2607:f8b0:4864:20::e2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pANBT-00049X-Cu
 for qemu-devel@nongnu.org; Tue, 27 Dec 2022 22:32:52 -0500
Received: by mail-vs1-xe2d.google.com with SMTP id i188so14462063vsi.8
 for <qemu-devel@nongnu.org>; Tue, 27 Dec 2022 19:32:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=N7eg1bWpQSWdAx7QOV9RFjWMXvQOF+PtLHCf1ZJ1mX0=;
 b=jk+s4iSt0UOqGCWMBF/XzBSnYDzVdfgd8hK/ajgc7ibwLUlAXl3mKRaulaDpt2P6X7
 va64lLrOzBQ7AGZy5mJGEIGHc52D3S9xma6BtnIUM+v/Ln/tQftB+ZSpIbMfHsyGFk3v
 RjwMN0EWZFE/U7OQp6SZxA0zNqDay/306gAtydP3K4AXYGYYHTsMpBww9MpVeEUdi9rl
 ifJgMfgNb7sGWz9tJPTvCZKk1lSgDSnTwwIRiXB9HipByw5T2Fxxc3x0pLJDUnGSFCzR
 CCLnPG3CvB7f1CPgCweb9o6UbpTvA3Ls19bZwgs5IfKTHC3H9cOdiI/xFXVvtRMoyrI2
 3gzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=N7eg1bWpQSWdAx7QOV9RFjWMXvQOF+PtLHCf1ZJ1mX0=;
 b=efiW8d0OFvrie2KTwQbhvRmeOlzpbYkPJIRH+wS1HEPDE24zaJk+dGBLDk5fhO6bvD
 T23COywX7coT17QuaRLS6BeH1OkoGJeMQfyuam6A66syxA3/mdocUEtpG30rJc2RM97S
 wudmWn8TafcoK135YyWxx0rDyESAHNHZlAV8Sb9fPlxXfTnojf+qQRVVflq13nTTabj6
 0EqAfxVAphLoYyelIXFnfvT8x96kr4uRAVrrO0DRSVO1dHd3PnXwwOKZd7sDK61zZXYf
 SFJfDIK1DBo2UItxKzGwLHKCp0V9N3gmL/i2pt2N8QmPnI2JBT9oTqCoU9PmGDFe8pCu
 HGNg==
X-Gm-Message-State: AFqh2kp4FanPFGeSTqIkXA9VZNM/plEyDJTpWE05xcLp6zBd4i3JT89N
 VcWENZnr3UGhHzAegGiCruKQHDlS6ZMKBew4WOk=
X-Google-Smtp-Source: AMrXdXsqkjADrcd9JYnIma8XKEMmZgWGoe27VYXulqReBQi7wYYqwNrSPshxFPkL0mOp8wJWbwU6B/MgVgDps5a1P54=
X-Received: by 2002:a05:6102:510e:b0:3b1:2b83:1861 with SMTP id
 bm14-20020a056102510e00b003b12b831861mr2657110vsb.10.1672198370229; Tue, 27
 Dec 2022 19:32:50 -0800 (PST)
MIME-Version: 1.0
References: <20221227064812.1903326-1-bmeng@tinylab.org>
 <20221227064812.1903326-3-bmeng@tinylab.org>
In-Reply-To: <20221227064812.1903326-3-bmeng@tinylab.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 28 Dec 2022 13:32:23 +1000
Message-ID: <CAKmqyKP3g+WJoOE+u=i9aEMxVPrwqwh2H6R4DTjBrdPhAQa9gA@mail.gmail.com>
Subject: Re: [PATCH 02/12] hw/char: riscv_htif: Drop {to,
 from}host_size in HTIFState
To: Bin Meng <bmeng@tinylab.org>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2d;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2d.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Dec 27, 2022 at 4:56 PM Bin Meng <bmeng@tinylab.org> wrote:
>
> These are not used anywhere. Drop them.
>
> Signed-off-by: Bin Meng <bmeng@tinylab.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
>  include/hw/char/riscv_htif.h | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/include/hw/char/riscv_htif.h b/include/hw/char/riscv_htif.h
> index f888ac1b30..3eccc1914f 100644
> --- a/include/hw/char/riscv_htif.h
> +++ b/include/hw/char/riscv_htif.h
> @@ -33,8 +33,6 @@ typedef struct HTIFState {
>
>      hwaddr tohost_offset;
>      hwaddr fromhost_offset;
> -    uint64_t tohost_size;
> -    uint64_t fromhost_size;
>      MemoryRegion mmio;
>      MemoryRegion *address_space;
>      MemoryRegion *main_mem;
> --
> 2.34.1
>
>

