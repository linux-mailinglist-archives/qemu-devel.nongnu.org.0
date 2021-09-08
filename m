Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5FCF4033C2
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 07:26:19 +0200 (CEST)
Received: from localhost ([::1]:55596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNq6E-00035X-VK
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 01:26:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mNq4X-0001mc-CP
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 01:24:33 -0400
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34]:39559)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mNq4U-0003G2-Ng
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 01:24:33 -0400
Received: by mail-yb1-xb34.google.com with SMTP id y13so1800652ybi.6
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 22:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=icfVIsIDt1OFttGoRsFT85NX8Sg8AAuXzrdD2zbqEsQ=;
 b=gDLoY5bezW3ygK4sa4/+97hrHN0JjodC4cMOuF7awituz9DwjZtCqR2FCy3vnFvzdt
 ub4RxDYtu7IcxBpOVOOwvRkVO95rae9OaD+20REU/yXKBWjgC76gluywLu869rTzECMu
 cu8WbiW6P6rPuyyiJH+Wx39dYUPeTCK4d/+/5lctBdI0ltuD4f0oe20snZTCjlZrYOgZ
 5qNeOuhjMG1XaB/bI5FrATaz1/8f7HC2eMjQjzzGeubfBBh7MQAHkObKSw70nEBmhbMe
 /xlo7wIixmSuDgp2w+wGg0fgyP4CtcY5zPTdjvjChlH8VcYM3vmaaSIOR/GQx+k+Sz5a
 gLyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=icfVIsIDt1OFttGoRsFT85NX8Sg8AAuXzrdD2zbqEsQ=;
 b=lnjDxlQ5pu8XP8plTrBQd5NbBLOJ4otXQTToJJBHmsa25FdciwWQHlx+5LoUnpkIsd
 jyy92ImxNgeH7lv66zbya8shZiJOjB73vSIMLiFkf+J7pezEtCiYUI4U1OmyAmooVVg7
 BKwfW2LrXAzPflSPSLQ6DvrTGZtyxbamf6dsxy0ZkyPvP1pCf1UIT7mnBlemKTfIXVH+
 0ESTk4cZ/TdrNmV+SsSkC2wz7fTpq6yyu4Fy2jwki1tl597OojBPxRhSlFsgOOgRsSQP
 lgdyMCNhHbrMVl3EZ4BjxRz8Kw0fR0/+ZHaL+LY4FXw1kf2Tx4cXSVqEPwEd+U8EdDM6
 k70Q==
X-Gm-Message-State: AOAM532KOuVdrbRros2SKS/gQjz6x8ecGYOeRRQpS95PFGp5ORgtfHQu
 a5FpE57DjRv0HyphY4sumxwPcpZiKehvXsxHw/I=
X-Google-Smtp-Source: ABdhPJzsQOrTwZxFtoNKgvr8EEp5oFalgEC9qXOtH9zBhaUnxolhAMZVwMsZfiiQD9t9JJ+EHdMFhUAup37rACZ5u8Y=
X-Received: by 2002:a25:2e42:: with SMTP id b2mr2555352ybn.313.1631078669813; 
 Tue, 07 Sep 2021 22:24:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210904203516.2570119-1-philipp.tomsich@vrull.eu>
 <20210904203516.2570119-11-philipp.tomsich@vrull.eu>
In-Reply-To: <20210904203516.2570119-11-philipp.tomsich@vrull.eu>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 8 Sep 2021 13:24:19 +0800
Message-ID: <CAEUhbmV8YwrSyW40n8qB7Hw1VgiA6uLf0cLvz5WAkMVSTm0RHA@mail.gmail.com>
Subject: Re: [PATCH v10 10/16] target/riscv: Reassign instructions to the
 Zbb-extension
To: Philipp Tomsich <philipp.tomsich@vrull.eu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb34.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Kito Cheng <kito.cheng@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Sep 5, 2021 at 4:38 AM Philipp Tomsich <philipp.tomsich@vrull.eu> wrote:
>
> This reassigns the instructions that are part of Zbb into it, with the
> notable exceptions of the instructions (rev8, zext.w and orc.b) that
> changed due to gorci, grevi and pack not being part of Zb[abcs].
>
> Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>
> (no changes since v3)
>
> Changes in v3:
> - The changes to the Zbb instructions (i.e. use the REQUIRE_ZBB macro)
>   are now in a separate commit.
>
>  target/riscv/insn32.decode              | 40 ++++++++++---------
>  target/riscv/insn_trans/trans_rvb.c.inc | 51 ++++++++++++++-----------
>  2 files changed, 50 insertions(+), 41 deletions(-)
>

Acked-by: Bin Meng <bmeng.cn@gmail.com>

