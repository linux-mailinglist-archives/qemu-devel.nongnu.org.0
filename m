Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD5978DD7
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Jul 2019 16:27:41 +0200 (CEST)
Received: from localhost ([::1]:52608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hs6cl-0001Qt-Se
	for lists+qemu-devel@lfdr.de; Mon, 29 Jul 2019 10:27:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58424)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hs6c4-000122-Ob
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 10:26:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hs6c3-0007AW-Qf
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 10:26:56 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:45650)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hs6c3-0007A7-Lc
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 10:26:55 -0400
Received: by mail-oi1-x243.google.com with SMTP id m206so45392192oib.12
 for <qemu-devel@nongnu.org>; Mon, 29 Jul 2019 07:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WDo+MdWnXv2rn0jkx3UgOUpQoU5HO3vfEk+x0LJuISw=;
 b=Z2GDvN8ESQLeUCoAie3A+zs/932fJkIuxy8z1wdxfj5N88v2oMNWSJjz/suicfWLWm
 64v1GAFqVP3w5EQVEKn1UGz1HohqoW0LD57LozBDXQ5tMzTKtYmvFuQbeC/GwdP8J0Tv
 uuZpWQ+238vJXZ9ETG5zO4r+giQwZjglKz25AMCc2jrul0rkORvksyEnE55hT8e7CHIA
 XvF5Pou3hQltsq35P6gkLK4Mu24riRBOFSUvWVuEah0PPHB6qVChDq76C6Fh0Ag7Tqqr
 qgYUMxIBSEjQuJu1l+lB8K+cB+jlCZJcckHSdKOnJigREZqIYQz1lp8XpBDjAOi4fsuj
 r0Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WDo+MdWnXv2rn0jkx3UgOUpQoU5HO3vfEk+x0LJuISw=;
 b=KeNHqeV6JdaV7fp5m0uPlKvPuQ9YZW2eW/pxLXvCZqVod+Xr00G7u9ucT0Z7XUIVQ5
 gBFh6jgOb2txc0R788lCs5PnOnb5xZ1UWfxsn2BmeeECdvAViIu1kbOFvWwIvt64g8on
 F5fFXGnOuTj827VaZMxwg9Za6UPHgsYwLomorZO8tm3vQwjSZyNc9eesJTKy4a3Uu2a/
 tYEvVbmzh7LGgtTw8x9wKx6qn0uHz9b7ubZBTsz3EVR/DCKheNT63sRBHa5IXZfC3Ltx
 ohdOcV4tsbMjXsk2o18CC7nUQOyRehNEONbo6IJlEyBUdNHoe1lfhBjHn7ipcKouqXOA
 yOAA==
X-Gm-Message-State: APjAAAUVlMkuAk/gWOL7oo75CVEJHbXxw+hj9rT8sBFaxfRuxNgvUL+z
 fc1Xz1O6zo6Kh9F+b2YnG5S0GgqbUbhhpFeosD5Vcw==
X-Google-Smtp-Source: APXvYqykypGIxzp1UmbsUjLs5TNa7ACnuL6WGhhC6U59zGJeZU7Z/RjjuKB8DopQCRFP//9xJ4XJbbo4y668d7WNvFw=
X-Received: by 2002:aca:5cd7:: with SMTP id
 q206mr49146229oib.146.1564410414592; 
 Mon, 29 Jul 2019 07:26:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190726175032.6769-1-richard.henderson@linaro.org>
 <20190726175032.6769-9-richard.henderson@linaro.org>
In-Reply-To: <20190726175032.6769-9-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 29 Jul 2019 15:26:43 +0100
Message-ID: <CAFEAcA9twN1i6GLORiu0ygpxcjCUQB2Srm6g7-TcWSXXTyRbwA@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::243
Subject: Re: [Qemu-devel] [PATCH 08/67] target/arm: Use store_reg_from_load
 in thumb2 code
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 26 Jul 2019 at 18:50, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> There is an extra always-true ARMv5 test, but this will
> become more obvious once we start unifying the
> implementation of A32+T32.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 12 +++---------
>  1 file changed, 3 insertions(+), 9 deletions(-)
>
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index 5e2dd8bb16..e316eeb312 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -9773,13 +9773,11 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
>                          /* Load.  */
>                          tmp = tcg_temp_new_i32();
>                          gen_aa32_ld32u(s, tmp, addr, get_mem_index(s));
> -                        if (i == 15) {
> -                            gen_bx_excret(s, tmp);
> -                        } else if (i == rn) {
> +                        if (i == rn) {
>                              loaded_var = tmp;
>                              loaded_base = 1;
>                          } else {
> -                            store_reg(s, i, tmp);
> +                            store_reg_from_load(s, i, tmp);
>                          }
>                      } else {
>                          /* Store.  */

I thought at first this would change behaviour if rn == 15
but in practice it doesn't because 15 is the end of the loop
anyway. (This is an UNPREDICTABLE case, but if they get in our
way it might be better to explicitly make them UNDEF rather than
just behaving like whatever falls out from the implementation.)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

