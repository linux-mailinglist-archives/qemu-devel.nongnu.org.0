Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D81DB5F0C29
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 15:03:29 +0200 (CEST)
Received: from localhost ([::1]:34910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeFfn-0000ts-Te
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 09:03:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chigot@adacore.com>)
 id 1oeFas-0005w8-Mc
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 08:58:19 -0400
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a]:46027)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chigot@adacore.com>)
 id 1oeFaq-0000Bq-N7
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 08:58:18 -0400
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-357208765adso2299627b3.12
 for <qemu-devel@nongnu.org>; Fri, 30 Sep 2022 05:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=adacore.com; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=KoLu5WkdXhx7hLmkR4lLA85JNYlpdlccvZ6ubucH6bQ=;
 b=ZfT/RH2KwTNu/80gp+t9CR0nGGgj8ST4YBgZookrEZt0aT8OPyCuhcL3CHPr+vENLB
 udjMY24DxJFGGJW1FiW5/Z9f6jftE2NNXfoqbTxN2bXRCAoGXO+MyykMm7H6ua8z6XHR
 fSAzOowQZQMBkuH3Erk2Cey+f4BfIQvdj0qp8vKCUVZMmvgHVvQY2UwJDfDdSkczi4Kw
 l+c2w/Yrq/NgurPr7U4vNs7h/m6DSliaoy5V5jsuZCLpLtOJrpwMPCe2g1dCmA7m/Xpx
 EmpbhjzSAl44oT+/wJUYhqwOfhLZku/AtA7ERuW9IVdoMcJUvNNN8b/BH/AfUSSDnEM9
 q77A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=KoLu5WkdXhx7hLmkR4lLA85JNYlpdlccvZ6ubucH6bQ=;
 b=yd3i5g6nfkvJXCAfTIYyLXXbd+yBtyxRkjZiW3woF1U9waRg63/ohh9i2LrKkkQIw3
 fFtsUi17azGv9SK97UWznISeF9j5dJXcqk6DO/JSBBk+3GHFwgs3Kh03pb4XISbrzUn4
 PlRfE0oIOlIEQGZ76mnpqwPNAZVYE6M/VrP/W5GF3zbocZrXeGE1q0oJQ7BSf9d7V6vq
 HYEkZ1i29bqZ/K9N8QBldxRlrFvU1KxK5hzTHLUCfmnvUaEbMy6tQn+ubEan10aqNp9M
 Q5lB7TuTmO8kXtEpxYmmBrk+chTb34kdIrqCqBujfGprTl3qUy9kpG/7Rj7mlP7o57Vp
 7yVg==
X-Gm-Message-State: ACrzQf3TjvHamdyvTC5SsasNBu88ylHdUz4MZCbztNef+lIPXRnc9401
 CxaFL29Zndd4T17L08GhEs+UCyr59KDA1c3wqTQ9xw==
X-Google-Smtp-Source: AMsMyM527OMWKxTvz8Ae04ZJpdu+3r3Q9fSiWzzFvN9DlOE1diyuDVg0nbzAlxCAlG6Hbb51O8P45SMYmVvtx74IzNo=
X-Received: by 2002:a81:2513:0:b0:350:5c50:3d9e with SMTP id
 l19-20020a812513000000b003505c503d9emr8764016ywl.454.1664542693933; Fri, 30
 Sep 2022 05:58:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220930123239.15515-1-jim.shu@sifive.com>
 <20220930123239.15515-3-jim.shu@sifive.com>
In-Reply-To: <20220930123239.15515-3-jim.shu@sifive.com>
From: =?UTF-8?Q?Cl=C3=A9ment_Chigot?= <chigot@adacore.com>
Date: Fri, 30 Sep 2022 14:58:03 +0200
Message-ID: <CAJ307Ehp8Juy74EpmxyOTq6sVuPF+d-uLYD3T93ba4ZtRLxdBA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] hw/intc: sifive_plic: change interrupt priority
 register to WARL field
To: Jim Shu <jim.shu@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Alistair Francis <Alistair.Francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112a;
 envelope-from=chigot@adacore.com; helo=mail-yw1-x112a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Jim,

On Fri, Sep 30, 2022 at 2:32 PM Jim Shu <jim.shu@sifive.com> wrote:
>
> PLIC spec [1] requires interrupt source priority registers are WARL
> field and the number of supported priority is power-of-2 to simplify SW
> discovery.
>
> Existing QEMU RISC-V machine (e.g. shakti_c) don't strictly follow PLIC
> spec, whose number of supported priority is not power-of-2. Just change
> each bit of interrupt priority register to WARL field when the number of
> supported priority is power-of-2.
>
> [1] https://github.com/riscv/riscv-plic-spec/blob/master/riscv-plic.adoc#=
interrupt-priorities
>
> Signed-off-by: Jim Shu <jim.shu@sifive.com>
> ---
>  hw/intc/sifive_plic.c | 21 +++++++++++++++++++--
>  1 file changed, 19 insertions(+), 2 deletions(-)
>
> diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
> index f864efa761..218ccff8bd 100644
> --- a/hw/intc/sifive_plic.c
> +++ b/hw/intc/sifive_plic.c
> @@ -180,7 +180,15 @@ static void sifive_plic_write(void *opaque, hwaddr a=
ddr, uint64_t value,
>      if (addr_between(addr, plic->priority_base, plic->num_sources << 2))=
 {
>          uint32_t irq =3D ((addr - plic->priority_base) >> 2) + 1;
>
> -        if (value <=3D plic->num_priorities) {
> +        if ((plic->num_priorities + 1) & (plic->num_priorities)) {

That's the opposite. If n is a power of 2, n & (n-1) =3D=3D 0 (eg 8 & 7 =3D=
=3D
 0, 9 & 8 =3D=3D 8).
Note that n must be positive too. But I'm not sure it matters here.
I'll let you decide.

> +            /*
> +             * if "num_priorities + 1" is power-of-2, make each register=
 bit of
> +             * interrupt priority WARL (Write-Any-Read-Legal). Just filt=
er
> +             * out the access to unsupported priority bits.
> +             */
> +            plic->source_priority[irq] =3D value % (plic->num_priorities=
 + 1);
> +            sifive_plic_update(plic);
> +        } else if (value <=3D plic->num_priorities) {
>              plic->source_priority[irq] =3D value;
>              sifive_plic_update(plic);
>          }
> @@ -207,7 +215,16 @@ static void sifive_plic_write(void *opaque, hwaddr a=
ddr, uint64_t value,
>          uint32_t contextid =3D (addr & (plic->context_stride - 1));
>
>          if (contextid =3D=3D 0) {
> -            if (value <=3D plic->num_priorities) {
> +            if ((plic->num_priorities + 1) & (plic->num_priorities)) {

Same.

> +                /*
> +                 * if "num_priorities + 1" is power-of-2, each register =
bit of
> +                 * interrupt priority is WARL (Write-Any-Read-Legal). Ju=
st
> +                 * filter out the access to unsupported priority bits.
> +                 */
> +                plic->target_priority[addrid] =3D value %
> +                                                (plic->num_priorities + =
1);
> +                sifive_plic_update(plic);
> +            } else if (value <=3D plic->num_priorities) {
>                  plic->target_priority[addrid] =3D value;
>                  sifive_plic_update(plic);
>              }
> --
> 2.17.1

Cl=C3=A9ment

