Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE4E253BC06
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 17:59:46 +0200 (CEST)
Received: from localhost ([::1]:48680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwnEf-00025o-Qq
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 11:59:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1nwnC7-0007Wx-TA
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 11:57:07 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:46623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1nwnC6-0007HY-8H
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 11:57:07 -0400
Received: by mail-wr1-x42b.google.com with SMTP id u8so2681471wrm.13
 for <qemu-devel@nongnu.org>; Thu, 02 Jun 2022 08:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MM3mMEivldLecO+UU0mDd8XMP8uEMTo0FCOozFyR/Lg=;
 b=COh3eGwS0aEHuRliFsF6AY5NEfn34uRiOsoJR4NtIOdJLaQzja95ZhhmcByf3PRXwq
 pLlt+eiSN5jxz/ZYVrfx72oFk43YzKA58oU0XTTnWJRLHGZeoSGGwr3yn/RV23BwCnzl
 INJALvytLO1tOFV+PInA6v+Q06r5t8ZiE7vgyU0EWNGNhtJIgatgbO2XQVjqMCNq092R
 9k3/jxZvY+qwzLhHpringgZf+1LG7fMGT+EM9/GAdOL1UpW0T8X4dek1/qKwVHnMx/BZ
 h5MD7TogDIIJF05Z7pYMLsm1DXhsaJMe2nNgo8q9Je+igtp+Z/MaiRNkUIwEAVBkO7+3
 T8UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MM3mMEivldLecO+UU0mDd8XMP8uEMTo0FCOozFyR/Lg=;
 b=zlKOPWIq6JHw5O2590BCDwL79bs/dMeB9hZJd64VetwtxZGYYr2z/xwsQLKyj7qPxE
 P5WSldbPBmmmpdx/VRL7/mcpDBnXMtef17bEXE3XameXpi6Y2DQe6utjGgL7BTLntGS0
 qAjtVPofdfV26tVJoOkMJX5OQcomJ1p+FjT8t3weEW/6ehcCPolBePZh4Tudbn5AoC6M
 cskHF8a2gPfJa/7jrMaXFeaOIdt7Bflmv90zfw1DgUV9qbSY4K2RI5b5X2o1c6wmY7Di
 TbS98RmYT2Pd57pLWkBFMQyBqLpFjIwRw7bZ4PiL+w5dNoLFMdSLUada3koIhr2CtnO0
 QPzg==
X-Gm-Message-State: AOAM530BZ4MYiHVt0kxyUp2HghK6jVOKm1zM4vKjKcPbbWSBHfH9ItzL
 OpZfGw7fZeA9vj+DlcmkyGUafToVpQzUCK2Fj2j62g==
X-Google-Smtp-Source: ABdhPJzEU7RHvLmAXZcJx45FW8jlYOhvqw1Dw2G7Bz/adOh5gPNrqDmpcmZTAOiSJY9e1BYXAbc50SfDwyQrlWibeUM=
X-Received: by 2002:a5d:5942:0:b0:210:131c:a81 with SMTP id
 e2-20020a5d5942000000b00210131c0a81mr4276490wri.306.1654185424084; Thu, 02
 Jun 2022 08:57:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220602134017.155357-1-cmuellner@gcc.gnu.org>
 <1b930ae7-7e7d-b8f5-5202-2242abe994de@linaro.org>
In-Reply-To: <1b930ae7-7e7d-b8f5-5202-2242abe994de@linaro.org>
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
Date: Thu, 2 Jun 2022 17:56:52 +0200
Message-ID: <CAAeLtUCpqcH9r9gk62+uPhVg+VJUnY2ymARXX3jDewomX7ukSg@mail.gmail.com>
Subject: Re: [RFC PATCH v2] RISC-V: Add Zawrs ISA extension support
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Christoph Muellner <cmuellner@gcc.gnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 qemu-riscv@nongnu.org, 
 qemu-devel@nongnu.org, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko.stuebner@vrull.eu>,
 Aaron Durbin <adurbin@rivosinc.com>,
 Christoph Muellner <christoph.muellner@vrull.eu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Thu, 2 Jun 2022 at 17:07, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 6/2/22 06:40, Christoph Muellner wrote:
> > diff --git a/target/riscv/insn_trans/trans_rvzawrs.c.inc b/target/riscv/insn_trans/trans_rvzawrs.c.inc
> > new file mode 100644
> > index 0000000000..38b71d0085
> > --- /dev/null
> > +++ b/target/riscv/insn_trans/trans_rvzawrs.c.inc
>
> Typo in the filename -- s/rvz/rz/.

z = standard extension
a = atomics family
wrs = extension name

The full extension name indeed is Zawrs (see also
https://wiki.riscv.org/display/HOME/Specification+Status).

> > +#define REQUIRE_ZAWRS(ctx) do {         \
> > +    if (!ctx->cfg_ptr->ext_zawrs) {     \
> > +        return false;                   \
> > +    }                                   \
> > +} while (0)
> > +
> > +static bool trans_wrs(DisasContext *ctx, arg_sfence_vm *a)
> > +{
> > +    REQUIRE_ZAWRS(ctx);
>
> No point in the macro for what will only ever be a single user.
>
> Otherwise, the implementation looks correct.
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>
>
> r~

