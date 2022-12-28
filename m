Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A29DC657284
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Dec 2022 05:23:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pANxh-00080V-4J; Tue, 27 Dec 2022 23:22:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pANxe-0007zv-Uz
 for qemu-devel@nongnu.org; Tue, 27 Dec 2022 23:22:39 -0500
Received: from mail-vk1-xa2e.google.com ([2607:f8b0:4864:20::a2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pANxd-00033i-B0
 for qemu-devel@nongnu.org; Tue, 27 Dec 2022 23:22:38 -0500
Received: by mail-vk1-xa2e.google.com with SMTP id r3so6958045vkq.13
 for <qemu-devel@nongnu.org>; Tue, 27 Dec 2022 20:22:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=gqKyST8jHGgverXxkXQpR+PAhEb+JxEh8k6PE2vrnR4=;
 b=aeingBGx5WqI8mqaVFuOjMmK5Md1KeE1j0U37cPm9yMvZY9u3KX0LO9S2mDcNRtLaw
 LCxDhUkhCCWhyhCJJKd0GcsGSNcHkexaJeCfpjr2QdOtyemDq2YWn6MtBf8qy8+c+0/j
 iG9XEpwO8ZsXd9rx/NUI45GbJwHRgV6DDMpYtw8glDY3CTfDpGwAyq/CTwrmGT9xopOK
 ANAiDO7qV4lhqDhYq3X8z6Wn0HNq4LFTfMuLGGn+Qfh7fyTqpaJsm5DeWkrv+NfbbxBo
 RU3ymxw+yIQ4uVLYXPi7ysko2ETSv1VTa7toK1LCRPRGxBmAwtX17CnRSIFUFN95Z60s
 SZmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gqKyST8jHGgverXxkXQpR+PAhEb+JxEh8k6PE2vrnR4=;
 b=nHMH1havObltiwhdKWqGtRYiIxvJh3b7RHXIztjkP2IeEhvrWCFH04+hnE5G1nZVzC
 DNMK48I/1CEgINhbVJX/mX+dNA2czTGROpmk0UJkkdwOArgDB43590jAyT7Rlu0dOh4A
 QZmJojpG865y4HOGJVu5g5aSNWiMkq5QOMmdeafmQaF3xpIF4QCHH6GZXqDFnsW+tWUo
 QtGTc8LH5V6YTG1Nv8OP/AOMDz674VeYwswdu4eOOiJOQWQb2FAuSoab7eT5UJU2h0nu
 F0VrLUrkr1JuIpG0bKm4biGgRxUTr16Xb7LjPKUeY8I2Is4InGnXhGXg6xwP8v49B2YN
 GdQg==
X-Gm-Message-State: AFqh2koMmXj2C/7edCmcTae6yv17kLGewYFd/SB33FC6uwd4N9fVSZPx
 LYiixL23FwUBKTTrY5GX9oZuJbJ16GTAfws7LLY=
X-Google-Smtp-Source: AMrXdXvvTPaUJNprxJSH1BLeAUIaEwsBdRHG9V7qaOLTAe6bfDfrDLkCGaXDE5/O6d3uvUhfgn4MIG4K0t9OTROwErQ=
X-Received: by 2002:ac5:ccdb:0:b0:3b7:cbb8:bbf1 with SMTP id
 j27-20020ac5ccdb000000b003b7cbb8bbf1mr2559948vkn.25.1672201356204; Tue, 27
 Dec 2022 20:22:36 -0800 (PST)
MIME-Version: 1.0
References: <20221227064812.1903326-1-bmeng@tinylab.org>
 <20221227064812.1903326-7-bmeng@tinylab.org>
In-Reply-To: <20221227064812.1903326-7-bmeng@tinylab.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 28 Dec 2022 14:22:09 +1000
Message-ID: <CAKmqyKOyac7DN8oNUTK-d5cSz5ArfM+RhL+23mG3LquA92mKRg@mail.gmail.com>
Subject: Re: [PATCH 06/12] hw/char: riscv_htif: Remove forward declarations
 for non-existent variables
To: Bin Meng <bmeng@tinylab.org>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2e;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa2e.google.com
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
> There are forward declarations for 'vmstate_htif' and 'htif_io_ops'
> in riscv_htif.h however there are no definitions in the C codes.
>
> Signed-off-by: Bin Meng <bmeng@tinylab.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
>  include/hw/char/riscv_htif.h | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/include/hw/char/riscv_htif.h b/include/hw/char/riscv_htif.h
> index 55cc352331..9e8ebbe017 100644
> --- a/include/hw/char/riscv_htif.h
> +++ b/include/hw/char/riscv_htif.h
> @@ -40,9 +40,6 @@ typedef struct HTIFState {
>      uint64_t pending_read;
>  } HTIFState;
>
> -extern const VMStateDescription vmstate_htif;
> -extern const MemoryRegionOps htif_io_ops;
> -
>  /* HTIF symbol callback */
>  void htif_symbol_callback(const char *st_name, int st_info, uint64_t st_value,
>      uint64_t st_size);
> --
> 2.34.1
>
>

