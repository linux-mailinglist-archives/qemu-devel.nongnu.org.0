Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 097BE34ED67
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 18:18:51 +0200 (CEST)
Received: from localhost ([::1]:36682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRH4r-0002tC-P1
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 12:18:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lRH3q-0002Ri-3O
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 12:17:46 -0400
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35]:39695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lRH3o-0006Am-Du
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 12:17:45 -0400
Received: by mail-io1-xd35.google.com with SMTP id k25so17029281iob.6
 for <qemu-devel@nongnu.org>; Tue, 30 Mar 2021 09:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=j2UtHIp4PoAjMtx1BqTM2nivJS0N7/GFXqZK1Ct7ww8=;
 b=LMmAZsJ/8TiKHwthgvmWT15IaRemDGn74u2naSSXEqRs1a32mjtrM7WGcKJt0kge3Y
 LkQi0SYwAl+yFNZIVLSjS/Xs7BYUE5l/An3HnwtfVf8iWYpByLpYQLmIP04MG+pZoTbA
 CjMMsH4hS9co7feB58KJCCm95avL3z5MnqcXXuu1m0ZMgLtjNKpdCy3mvRjkIAnPOypD
 BZECghorBevu7+hgcK058Vs855IJ/XiJRURB3zkZt91JTxM85UGWj73hG4MnrQHlK/N/
 xPy3roO48iJ2LkX2Tg/74gqvWgcUbUWPp98Q5gHXxmTIyk0pbUEBnmg4QpOWlNGSn+T+
 Z1Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=j2UtHIp4PoAjMtx1BqTM2nivJS0N7/GFXqZK1Ct7ww8=;
 b=b54Vl+xXZK3CXimrvUl+Zk1XNvE0Qswys8czA8NKbQf5KB0ztIF7e/pgbiIu16qHJD
 7mi41oZfRdHOjGnDWlLLNEixLU8H50m9ad4jO8EvvhMcT168wWDwKDaTs4FFRvzJ7+3G
 UL7QzHwLbDQmCIRfCeufiBOUhSakd1I1diug9mN8FmbCfUnDQFuS8OL5oBFR5ZgmDqlG
 IRoYvJNZ90zT1a5V+OhjIMlFFHWJLStsz+djmpgjeh73iCuLwMaXnU8hqPeXp8879o/d
 BI2AWDvaIVByse6hvM7/TyT+6h60vTkDVeggSMjUE2fXSYdJGKMIUibPe8jhaZeOLwNu
 KIpg==
X-Gm-Message-State: AOAM530a8JYlO/iPSErGyQvBzEW2/rVK0MIhECeYF3zPuPa3Kl910XlM
 Ss7ud0serhe7sFJy54w5Q3+4My3djg5XXUu0CSc=
X-Google-Smtp-Source: ABdhPJx8OxUIHZlm8gHdmLmB6IoDFBlsRSUn3C6XgrVaUMDpZgbGbdasvqAYn7m/Tx5BbvwoC7v63iOJkLTdPFMM20M=
X-Received: by 2002:a02:11c9:: with SMTP id 192mr29933430jaf.135.1617121062713; 
 Tue, 30 Mar 2021 09:17:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210326062140.367861-1-bmeng.cn@gmail.com>
In-Reply-To: <20210326062140.367861-1-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 30 Mar 2021 12:15:34 -0400
Message-ID: <CAKmqyKNu+5FZJEvu=to5LfQ1m4xEYSbpqeM+05bP7wR6LHT5Zw@mail.gmail.com>
Subject: Re: [PATCH] nsis: Install *.elf images
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d35;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd35.google.com
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
Cc: Stefan Weil <sw@weilnetz.de>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 26, 2021 at 2:22 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> As of today, the QEMU Windows installer does not include the
> following two RISC-V BIOS images:
>
> - opensbi-riscv64-generic-fw_dynamic.elf
> - opensbi-riscv32-generic-fw_dynamic.elf
>
> Update the installer script to include them.
>
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

>
> ---
> Based on:
> https://repo.or.cz/qemu/ar7.git/commit/657a6a90b69da971afdc71501c30275ba307ff6c
>
> The above commit does not land on QEMU master. I am not sure what
> the process is, sending it here for comments.
>
>  qemu.nsi | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/qemu.nsi b/qemu.nsi
> index 96c5534254..aeabe3bdbe 100644
> --- a/qemu.nsi
> +++ b/qemu.nsi
> @@ -142,6 +142,7 @@ Section "${PRODUCT}" QEMU_System_File_Section_Description
>
>      File "${DATADIR}\*.bin"
>      File "${DATADIR}\*.dtb"
> +    File "${DATADIR}\*.elf"
>      File "${DATADIR}\*.fd"
>      File "${DATADIR}\*.img"
>      File "${DATADIR}\*.lid"
> @@ -258,6 +259,7 @@ Section "Uninstall" Uninstall_Section_Description
>      Delete "$INSTDIR\*.bin"
>      Delete "$INSTDIR\*.dll"
>      Delete "$INSTDIR\*.dtb"
> +    Delete "$INSTDIR\*.elf"
>      Delete "$INSTDIR\*.fd"
>      Delete "$INSTDIR\*.img"
>      Delete "$INSTDIR\*.lid"
> --
> 2.25.1
>
>

