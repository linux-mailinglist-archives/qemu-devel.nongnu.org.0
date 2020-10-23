Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4712979B7
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Oct 2020 01:43:08 +0200 (CEST)
Received: from localhost ([::1]:58098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kW6iB-0002w9-Ds
	for lists+qemu-devel@lfdr.de; Fri, 23 Oct 2020 19:43:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kW6gt-0002Pm-2g; Fri, 23 Oct 2020 19:41:47 -0400
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41]:35088)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kW6gp-0003it-BO; Fri, 23 Oct 2020 19:41:46 -0400
Received: by mail-io1-xd41.google.com with SMTP id k6so3952065ior.2;
 Fri, 23 Oct 2020 16:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QOjIifyOMlsHMcEATifMPzRz6INY1rsPpltrCqwAVzk=;
 b=AvOHXrEPcGAvCvznQ2OuAWdFggjd7Xp8zCEaKzQfQKSAGcAUu1U73OuSA9Op8L/LLG
 TLmwEW2k78Nw7QG98lmWHMoMYJkoQjDJtST5D66ncdjqMfxt65UE5Kyby/NqxwBwEZsH
 p40y2pNsz//ptFfmPaZmRS2fxKEt2w2we8bbsrmmqwzyIC7FfkcQ7oxzvFo9BpjZmwOE
 VD47lzPpzj8+Tt/LDsoP+RSMuqKbAyol3bK0Ro/8Jc0cZj5Gum2pyqYfyspj5GOhhwMA
 Z/LkCJ++z0MTfYvtZZujxxiKbweAcuOyA+Gv0uxPn2e55VdBhEHwFBD3llsbzivQKrVA
 vtqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QOjIifyOMlsHMcEATifMPzRz6INY1rsPpltrCqwAVzk=;
 b=BCTQCrXe3/JnBlbEVB+5IJfcPeRjaRXXpHymBUtP4QbcsBAHMX6+6PcDPeULrw0IPd
 GahBw6GL2rF0mrGeYeL87P5ZZxWcUXUVC8McRB3vOUNR7Enlgm0urjVAJ8Ktb/UzgKyI
 kVyv3wIzE11VfQzjzv8NmJL0ZYmwVRaha28RFYPk4wo+icIOyXDs+e4+n2AWvSdFkJWM
 7mCgRF0FkfTyDU7rRWC+rMETDYJwPDSSTSSaDHrKSWVwwZ1vpf3NIQ0rqz9JSAeOYozE
 TATvXib5qwhzojXK9OZ66jxIVyEe8DU/52XJj/L8OGikNuJeSQN3z2zwjNpP32F7lgAB
 MKBg==
X-Gm-Message-State: AOAM530cwoanFqmlG9myX97IqcYkkKKnsrkFsHmnkHQQ3KFG/WKt6WMT
 4YMuEUEfrSqbaQUjS7sT8/g3SJmrSu2D/MrDtSw=
X-Google-Smtp-Source: ABdhPJwaLo/yO4HrSiOdWmiV8tKI2IKzLOtR8D/C9el0WUl0IBCg8OIRX9VG4YyR0yeaCWXnVhd9ow9nla3KWceeQW0=
X-Received: by 2002:a05:6638:25cc:: with SMTP id
 u12mr4084469jat.26.1603496499213; 
 Fri, 23 Oct 2020 16:41:39 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1603466725.git.alistair.francis@wdc.com>
 <16213739a6232aa4824c5a008e2f669e6e58fbcf.1603466725.git.alistair.francis@wdc.com>
 <bec11f34-9cfe-4aa2-2f9c-3781d7f5e8ad@linaro.org>
In-Reply-To: <bec11f34-9cfe-4aa2-2f9c-3781d7f5e8ad@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 23 Oct 2020 16:29:52 -0700
Message-ID: <CAKmqyKNRRa2-0tOv0GMqRAkRTmRED40tDpnOQ7LHhF_vVpgzAw@mail.gmail.com>
Subject: Re: [PATCH v1 1/5] target/riscv: Add a virtualised MMU Mode
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d41;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd41.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bmeng.cn@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Oct 23, 2020 at 12:13 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 10/23/20 8:26 AM, Alistair Francis wrote:
> > +++ b/target/riscv/cpu-param.h
> > @@ -18,6 +18,6 @@
> >  # define TARGET_VIRT_ADDR_SPACE_BITS 32 /* sv32 */
> >  #endif
> >  #define TARGET_PAGE_BITS 12 /* 4 KiB Pages */
> > -#define NB_MMU_MODES 4
> > +#define NB_MMU_MODES 8
>
> Is there really a PRV_M + virt enabled state?

No, there isn't.

>
> > +#define TB_FLAGS_PRIV_MMU_MASK                3
> ...
> > -    int mode = mmu_idx;
> > +    int mode = mmu_idx & 0x3;
>
> Use that MASK here?

Good idea.

Alistair

>
>
> r~

