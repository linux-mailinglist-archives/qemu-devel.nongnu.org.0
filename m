Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD69588557
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Aug 2022 03:21:01 +0200 (CEST)
Received: from localhost ([::1]:57462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJ34G-000702-1E
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 21:21:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oJ32V-0005Xs-NH
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 21:19:17 -0400
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31]:40592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oJ32T-0003AH-US
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 21:19:11 -0400
Received: by mail-qv1-xf31.google.com with SMTP id i4so11947143qvv.7
 for <qemu-devel@nongnu.org>; Tue, 02 Aug 2022 18:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vg619V22b1cfSTa8RtMERZJWYZCx/U2XrwjbreeX3r0=;
 b=hhvRWrMYgoH2dSizn+k/FEdkemNvBF9/cr42zLfRfB0AxpUHItLyayo4TuyDx5fUeo
 HR0TdZBYtQiuXNg3KpgKKYC9qb1hQah8xcAbS8vZZEJp9KEwZ1CB9tAHHtT23wPW32WF
 4Y6+XfxxF3A1xWPuY5CFyRhrQKodbXyYk8pI+l0iEBWova8QFmohdDu8RFRmiH9FfKqI
 VD0ivsJ1m6kugIKV8C4CDv01Xack03UA2H2mXawRGSolQIYrjFhpbzVKgqZsauV4RYaX
 k9Ifo2QdYBS/9gi5T3ymKHRdopnabU7oEIViyjJ7HXpnEGx9rOkjdZRTfhlrVt4SzMXu
 GJ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vg619V22b1cfSTa8RtMERZJWYZCx/U2XrwjbreeX3r0=;
 b=PPMzodkW4DslYbGB0uWzAy3HT7i9PmMj6gWPOMwcwOovnFgUrGTrWppp44RzFaUIUQ
 HfHbpS59ToFf12QVj5QTA0ew2JTdskz5MoTNpDhRmhTLrwRZJqfqTfOfef8/pEKlyMg+
 ch3qNklog/Ej1GQIA0DBOxSIByVxKyl1HE2gbdHTwynRI5aZL4bkSFBmQMO3q8Vx/jFl
 a3X3RpdFO0rxTsiDz6oczEncZ6hmI2AGYuwKO6MvZwRW9FfiQaFR2ZJLri7GdqQZDiG7
 NPCUyiWbLSrr6+ApgSHDfEG/oM9eb0ibfr7p8XYKhmm+h+Zj0mZGpr8BO0Od5w6AbZME
 EuaA==
X-Gm-Message-State: ACgBeo2QcYOFhco0A8z1IOe3a69T7mv7o4B8blf2AFU6a0x+Zev/mpEi
 0UoxleHFVpo452j5zwBtV6BYZafHakyKUWlqi8Y=
X-Google-Smtp-Source: AA6agR6CupeQde1LZdhzd+kskLfV2t2Rhd+s6EmHs+hnMIMWz3POLKstpXcup/XWTqHyVsTvm3TgWiE5/r16O1UlMNc=
X-Received: by 2002:a0c:a947:0:b0:474:55c3:21bb with SMTP id
 z7-20020a0ca947000000b0047455c321bbmr20254151qva.51.1659489548931; Tue, 02
 Aug 2022 18:19:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220728181926.2123771-1-danielhb413@gmail.com>
In-Reply-To: <20220728181926.2123771-1-danielhb413@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 3 Aug 2022 09:18:57 +0800
Message-ID: <CAEUhbmVTX6k3j=g2Kms-XzbuR5c=OP0Dp2USy7r=YN5LeOqkcQ@mail.gmail.com>
Subject: Re: [PATCH] hw/riscv: remove 'fdt' param from
 riscv_setup_rom_reset_vec()
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Vijai Kumar K <vijai@behindbytes.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f31;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qv1-xf31.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Fri, Jul 29, 2022 at 2:19 AM Daniel Henrique Barboza
<danielhb413@gmail.com> wrote:
>
> The 'fdt' param is not being used in riscv_setup_rom_reset_vec().
> Simplify the API by removing it. While we're at it, remove the redundant
> 'return' statement at the end of function.
>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Alistair Francis <alistair.francis@wdc.com>
> Cc: Bin Meng <bin.meng@windriver.com>
> Cc: Vijai Kumar K <vijai@behindbytes.com>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>  hw/riscv/boot.c            | 4 +---
>  hw/riscv/microchip_pfsoc.c | 2 +-
>  hw/riscv/shakti_c.c        | 3 +--
>  hw/riscv/spike.c           | 2 +-
>  hw/riscv/virt.c            | 2 +-
>  include/hw/riscv/boot.h    | 2 +-
>  6 files changed, 6 insertions(+), 9 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

