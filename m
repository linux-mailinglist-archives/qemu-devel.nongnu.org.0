Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7994355B815
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 09:05:27 +0200 (CEST)
Received: from localhost ([::1]:44488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5ioF-0006UU-DE
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 03:05:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1o5ikz-0005Ce-R8
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 03:02:01 -0400
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29]:39873)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1o5iku-0000hE-Bw
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 03:02:01 -0400
Received: by mail-yb1-xb29.google.com with SMTP id r3so15153178ybr.6
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 00:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aLN80trak9GFXzASdT2oj/4CVlTYZPUHoQzGhAMByUk=;
 b=V9XmOoW4JzkzAHetbiR+2NA0+034A8ab7qOg554mw47KLh3H6x71fwzvDoO862ihRw
 7peIt2788i+aruPrndyMneij3wA30lgGpmJ/cHgxbWz/e93ISRDdguYIXnswYwrC1kUz
 BnG5eumZxcn298ZRT0IDO5svS6dwentwzqGKw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aLN80trak9GFXzASdT2oj/4CVlTYZPUHoQzGhAMByUk=;
 b=KbDB428JnqrfnIu5KjsFhP/AyD5GHlnHZnsiE03/1vCMbzhtV2MFhxBNYXfuYnQDYH
 X89OvA+H4hh3cHLbVPk5EJbHdmVNJ+suAN6+BeOU9sYf/xFunpHwcGyb7hoJespkGj78
 RX8uhtZtqovzKmeWtq2qwdW3LMJrlds5/PClGe38IT4EgvO8DJAB9iUmomt7ieXbgTVQ
 +DViuIbKJPId82KBqQSpubyNb01FIS1L7VQxxSjXMJT06teApIpGvHmU6Rq0rnCYHwH0
 6nLBNYbRuUNfKL3O5HXseK2Bq2W20STCmsEveb7+5df6yztufdHSu43+e3lwY8lwEzeS
 RhHw==
X-Gm-Message-State: AJIora/+fsen4zV7ZHJGyg4VxkctuMd0zf6mlG82yr14fLoO3MHwu02+
 wiNo8aMvFOg5lw/ZJJIlsYP3/S8RLDEzr2d0nOkD
X-Google-Smtp-Source: AGRyM1uV35/WYmS989DInmu/6VT4x6G6Ovlu6YKOG2Vf5kMmmMCNIIAk/hh+t/cNOjwBEcLysWsqJveLvBo36USkT9I=
X-Received: by 2002:a05:6902:136c:b0:649:81aa:5f7b with SMTP id
 bt12-20020a056902136c00b0064981aa5f7bmr11983455ybb.303.1656313314777; Mon, 27
 Jun 2022 00:01:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220608062015.317894-1-alistair.francis@opensource.wdc.com>
In-Reply-To: <20220608062015.317894-1-alistair.francis@opensource.wdc.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 27 Jun 2022 00:01:44 -0700
Message-ID: <CAOnJCUJWvF_hMitqhBSJevqaFmpfL6V74+Cud=MH-tQ0kFpK4Q@mail.gmail.com>
Subject: Re: [PATCH] hw/riscv: boot: Reduce FDT address alignment constraints
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=atishp@atishpatra.org; helo=mail-yb1-xb29.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Tue, Jun 7, 2022 at 11:21 PM Alistair Francis
<alistair.francis@opensource.wdc.com> wrote:
>
> From: Alistair Francis <alistair.francis@wdc.com>
>
> We previously stored the device tree at a 16MB alignment from the end of
> memory (or 3GB). This means we need at least 16MB of memory to be able
> to do this. We don't actually need the FDT to be 16MB aligned, so let's
> drop it down to 2MB so that we can support systems with less memory,
> while also allowing FDT size expansion.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/992
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  hw/riscv/boot.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
> index 57a41df8e9..e476d8f491 100644
> --- a/hw/riscv/boot.c
> +++ b/hw/riscv/boot.c
> @@ -226,11 +226,11 @@ uint64_t riscv_load_fdt(hwaddr dram_base, uint64_t mem_size, void *fdt)
>      /*
>       * We should put fdt as far as possible to avoid kernel/initrd overwriting
>       * its content. But it should be addressable by 32 bit system as well.
> -     * Thus, put it at an 16MB aligned address that less than fdt size from the
> +     * Thus, put it at an 2MB aligned address that less than fdt size from the
>       * end of dram or 3GB whichever is lesser.
>       */
>      temp = (dram_base < 3072 * MiB) ? MIN(dram_end, 3072 * MiB) : dram_end;
> -    fdt_addr = QEMU_ALIGN_DOWN(temp - fdtsize, 16 * MiB);
> +    fdt_addr = QEMU_ALIGN_DOWN(temp - fdtsize, 2 * MiB);
>
>      ret = fdt_pack(fdt);
>      /* Should only fail if we've built a corrupted tree */
> --
> 2.36.1
>
>

Reviewed-by: Atish Patra <atishp@rivosinc.com>

-- 
Regards,
Atish

