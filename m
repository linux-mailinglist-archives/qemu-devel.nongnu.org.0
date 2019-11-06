Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5BAF2164
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Nov 2019 23:08:18 +0100 (CET)
Received: from localhost ([::1]:35556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iSTTN-0003Iu-QR
	for lists+qemu-devel@lfdr.de; Wed, 06 Nov 2019 17:08:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59182)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1iSTOw-0007Xl-8j
 for qemu-devel@nongnu.org; Wed, 06 Nov 2019 17:03:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1iSTOv-0002Yg-5Z
 for qemu-devel@nongnu.org; Wed, 06 Nov 2019 17:03:42 -0500
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242]:33453)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1iSTOu-0002XN-UU
 for qemu-devel@nongnu.org; Wed, 06 Nov 2019 17:03:41 -0500
Received: by mail-lj1-x242.google.com with SMTP id t5so27967837ljk.0
 for <qemu-devel@nongnu.org>; Wed, 06 Nov 2019 14:03:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1EhDd1V18IdhIH3D8wncLZlO5OnMjk0B/mA92do25dI=;
 b=hzgNhzzUXp7P5MI2Pv+OLOttSY0WKSBjH9grMqAD4nUfTEOTMqvqoSAtldjahqFv4k
 nx42/y4laYrWjhW5lUI1WrT4toXDZ4k7jS/nL6YImNd+tCaxh8zTSV012Z6leLdyC6bR
 ktwnxk9s7yDtwfjDyT/OOd7nBIHvhZm1w7iOI6Luv4xcTIMCs2m68aFSAr6QFOTwWeOU
 VZ7AwwipGZuexT0D9LT05LdXCFOrk2FzOc2Q5qdywWPBBAC76zbyPMieoMhU1PR0T2SB
 YCD9bjjN9fzJkW4Xf/1SWdfHAWPoR34/FU9yGM/MmAsaHH4zRCxC8l5e3jDAAiW9XQ6A
 4sbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1EhDd1V18IdhIH3D8wncLZlO5OnMjk0B/mA92do25dI=;
 b=glOtcKKp7REjeGLH2Blu9kgTNgGVHvedAAwUezbGNhFw0f0nSvvJDtM9XVuOYDqptS
 HixU0WWZhrsMjK5qKz5kB++GR316AIkq4O/LWOQ5PrN2ChCBPdy8BUAjKbiyluGfl12s
 FRmPb6b1KHl1yyvILXUq2cBDKAJqwmivgk6gB+f9Hb3NvGd3GSIO+zIeIqHxEoCX1EOX
 jVToo4cotHjrZZv6B0jrZA8Ro6Uqxa0VrWJUDPttMOwg5P+JlnKBy1aRqZ/j7YEUtRhU
 V7RCqiHgIUnKKYOpX/uhP5LhgduEOca2XOQeP8/+OkWDGUVHECXicOB9M2hkLToOMnJf
 LqMA==
X-Gm-Message-State: APjAAAXIJ+G5QTO80VPUKjjMlRunn8PpLauNuEQFHUiE5GAYoRxqRtGm
 OWFoP3BUgvAVYo4h9lADdkwJH+lpf0N6FrxqtRg=
X-Google-Smtp-Source: APXvYqwcA5RpvK3ZGQAH9N7JPGxBN+yriZhQr+WkoXdSXKyKRMGNbOd67ZZ0WCDvtvsdyzQgfJ5UeKNXD08X1UfUKFE=
X-Received: by 2002:a2e:b54d:: with SMTP id a13mr3625562ljn.4.1573077819839;
 Wed, 06 Nov 2019 14:03:39 -0800 (PST)
MIME-Version: 1.0
References: <20191106141424.27244-1-edgar.iglesias@gmail.com>
 <20191106141424.27244-4-edgar.iglesias@gmail.com>
In-Reply-To: <20191106141424.27244-4-edgar.iglesias@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 6 Nov 2019 13:57:59 -0800
Message-ID: <CAKmqyKM5kyRJ+A8BO-5-71mxm64vYP7HvyD7tDe+cJu-L8_xDQ@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] target/microblaze: Plug temp leak around
 eval_cond_jmp()
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::242
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
Cc: figlesia@xilinx.com, Peter Maydell <peter.maydell@linaro.org>,
 Edgar Iglesias <edgar.iglesias@xilinx.com>,
 Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
 Francisco Iglesias <frasse.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 6, 2019 at 6:17 AM Edgar E. Iglesias
<edgar.iglesias@gmail.com> wrote:
>
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
>
> Plug temp leak around eval_cond_jmp().
>
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/microblaze/translate.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/target/microblaze/translate.c b/target/microblaze/translate.c
> index e9ff9e650d..93e22a89ac 100644
> --- a/target/microblaze/translate.c
> +++ b/target/microblaze/translate.c
> @@ -1705,7 +1705,10 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns)
>                  dc->tb_flags &= ~D_FLAG;
>                  /* If it is a direct jump, try direct chaining.  */
>                  if (dc->jmp == JMP_INDIRECT) {
> -                    eval_cond_jmp(dc, env_btarget, tcg_const_i64(dc->pc));
> +                    TCGv_i64 tmp_pc = tcg_const_i64(dc->pc);
> +                    eval_cond_jmp(dc, env_btarget, tmp_pc);
> +                    tcg_temp_free_i64(tmp_pc);
> +
>                      dc->is_jmp = DISAS_JUMP;
>                  } else if (dc->jmp == JMP_DIRECT) {
>                      t_sync_flags(dc);
> --
> 2.20.1
>
>

