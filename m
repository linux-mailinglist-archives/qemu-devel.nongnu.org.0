Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E647D9B355
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Aug 2019 17:32:07 +0200 (CEST)
Received: from localhost ([::1]:58198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i1BXq-00083y-0Y
	for lists+qemu-devel@lfdr.de; Fri, 23 Aug 2019 11:32:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60613)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i1BU9-0005jj-83
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 11:28:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i1BU6-0001uS-BA
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 11:28:16 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:33249)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i1BU5-0001tl-IF
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 11:28:13 -0400
Received: by mail-oi1-x244.google.com with SMTP id l2so7311133oil.0
 for <qemu-devel@nongnu.org>; Fri, 23 Aug 2019 08:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5jAYDDB3lCSLU+65B73F7Ar26W0xJd6Pmtx86gV3/bY=;
 b=DVeaBycwMbrRzc2FFUjS96Dm+pw6eXuSd/7Lig7cUoawLtWib0zhUs0fWHhyF9h+5g
 mjols23JZyMxXCLzBYRJwBvEORctINvDHApde78ydKU3NexHaCqTev366JoJGrAV00Ye
 MgkTG6gSoulk2qKTXUjKypkzS2a0excLzZZrHpxibuyh6OcS3zE3dKXmsoTb5HlY/kQi
 CCNNffBlYZDDThneaC0LXqLRkxfZKzR1IQ5xD9rYqEvIkfm/RbTZI8X/9wb4feRY3Ovt
 oDVDY3jqATPSeCWHikmF9j8qpBv3jq+/Ode6RieGTgKH8AQUrDds6pNxVNUcrN+9SrMy
 lbPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5jAYDDB3lCSLU+65B73F7Ar26W0xJd6Pmtx86gV3/bY=;
 b=q4Ys1Ha2v5YWFOmuw+FcQVnOAgQvlP0DIY5MeGZUF7ESe5Ex4Gdl7yUCtKSq4V+V44
 A6366aaFW6L/8L+6Y/fwmTDzoFxFDAJFZjo9IJaQdy9XVAZvGCx1etnHvKbqpGnIeLQJ
 1C7o3wNMn205l1As58KJ0jpmsdqutGG2W+b+H9VrMKn0Hs0ds2fHuV1dDlGjRW3Lq0/v
 1nEg0l10742ty/BW9czsaeaoqZPUm0O9C7/k82qCAOeFy3G3x30eTwD9+NFarL5te0C0
 yq/ipfdX2+qBaIzmnE3vwtG/wrYcDYmGQis00TD+kHfzdEej8J1vXat6oUAtKesd3AfU
 cRTQ==
X-Gm-Message-State: APjAAAW/5nk5QcsbIc24mTejX8enztq5a9ImxoyNANbrn1WMvkoNpOJT
 8nHZgLMGGmeHm/6vvnXx0caD+RHBX7PCjsuaKOObBriV
X-Google-Smtp-Source: APXvYqwSahFejDnM75VWEOsAHYfVUaDnwHTipLDEHkhXIf9yfoHkhaKLTYslxon84wuIhfmUtnGnuv9dxEf2rn+WeB4=
X-Received: by 2002:aca:4b86:: with SMTP id y128mr3572357oia.163.1566574092537; 
 Fri, 23 Aug 2019 08:28:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190819213755.26175-1-richard.henderson@linaro.org>
 <20190819213755.26175-22-richard.henderson@linaro.org>
In-Reply-To: <20190819213755.26175-22-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Aug 2019 16:28:01 +0100
Message-ID: <CAFEAcA9VyafAcmhy2t_rSLBM7LEjn7qhGzbETjcnNbFnQw0GhQ@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::244
Subject: Re: [Qemu-devel] [PATCH v2 21/68] target/arm: Convert
 Synchronization primitives
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 19 Aug 2019 at 22:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 560 ++++++++++++++++++++++-------------------
>  target/arm/a32.decode  |  48 ++++
>  target/arm/t32.decode  |  46 ++++
>  3 files changed, 396 insertions(+), 258 deletions(-)

> +static bool op_stl(DisasContext *s, arg_STL *a, TCGMemOp mop)
> +{
> +    TCGv_i32 addr, tmp;
> +
> +    if (!ENABLE_ARCH_8) {
> +        return false;
> +    }
> +    addr = load_reg(s, a->rn);
> +
> +    tmp = load_reg(s, a->rt);
> +    tcg_gen_mb(TCG_MO_ALL | TCG_BAR_STRL);
> +    gen_aa32_st_i32(s, tmp, addr, get_mem_index(s), mop | s->be_data);
> +    disas_set_da_iss(s, mop, a->rt | ISSIsAcqRel | ISSIsWrite);
> +
> +    tcg_temp_free_i32(tmp);
> +    tcg_temp_free_i32(addr);
> +    return true;
> +}
> +


> -                                rm = insn & 0xf;
> -                                tmp = load_reg(s, rm);
> -                                switch (op1) {
> -                                case 0: /* stl */
> -                                    gen_aa32_st32_iss(s, tmp, addr,
> -                                                      get_mem_index(s),
> -                                                      rm | ISSIsAcqRel);
> -                                    break;
> -                                case 2: /* stlb */
> -                                    gen_aa32_st8_iss(s, tmp, addr,
> -                                                     get_mem_index(s),
> -                                                     rm | ISSIsAcqRel);
> -                                    break;
> -                                case 3: /* stlh */
> -                                    gen_aa32_st16_iss(s, tmp, addr,
> -                                                      get_mem_index(s),
> -                                                      rm | ISSIsAcqRel);
> -                                    break;

Any particular reason for doing separate gen_aa32_st_i32()
and disas_set_da_iss() calls rather than using the _gen_aa32_st32_iss()
function that the old decoder did?

either way
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

