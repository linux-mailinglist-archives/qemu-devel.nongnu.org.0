Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 244583FBF12
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 00:41:15 +0200 (CEST)
Received: from localhost ([::1]:56160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKpxp-0001Bc-OA
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 18:41:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mKpw6-0000O9-Sm
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 18:39:27 -0400
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34]:36846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mKpw5-0007Gf-Ca
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 18:39:26 -0400
Received: by mail-io1-xd34.google.com with SMTP id q3so22237748iot.3
 for <qemu-devel@nongnu.org>; Mon, 30 Aug 2021 15:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Urt7tCr7Xm+jyEn/d1KU2GTmLdRoq3Y1faOqj4L12Co=;
 b=qXKCLd7rArMvpWogNJNAfb0MyqrOahwolq7phB48n8udiOzpxHjSA8VKthUkSXW0Ey
 1pe/fPUrXHvy1M3nXk5+OetS48rEKG3eF9Na3wQzQRnNkyO22LxaFIlulvpcmQ+2R2Gi
 GsPlswVBiQIL5ybsKrylkMineWd3IAk+KBhxaei95IX7b/+rmjfmuExDwhODAkW90Skn
 3g93wZvIIqBp4qKZaD3Ytjt2dbTsgowXg9w0TIkeKMO5RgwqO4LSaE5owl7Jq7XHjRPP
 ghGioErzFHQGkrRtJ41teBPfCCfQmotvVhEclo6VFt36yyMo3hSeYCFmKYETPk7zkNLv
 PCTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Urt7tCr7Xm+jyEn/d1KU2GTmLdRoq3Y1faOqj4L12Co=;
 b=UwusAQPI8vEakfbsdyZekk4Erejk7FU12oHwBxGtuPUTOxgbk3lAuR+cH6Re1H79oj
 kTCPd5fRPHSTfunpvm4ODCUwHr5sRoOwCX96rdcyYMQJRyyjKuXLrFp87pawZzSe1pfi
 /1VpPN2e382PJ60JTeC1ffCWjmtHAX8T9mKjg6QuXM2Jg6R9Z50U86Gqhx8VtIGOFhpG
 oIfzNAJRVrhGWPtJMabojANirQuRG+5tqQHYioxX9a6SmU8Vz/3tsUZg/snVNh9Twuzc
 0+kb49WffJ1OkrUlgVaRP9yM9pUG9TlZP/ugBMr4gNMNKhtQD6eQnbMQm+bQ6LPzGa81
 yx9Q==
X-Gm-Message-State: AOAM530qwefILIm2fXcZYnIM9LK/682/MdFfKgwgOfabd3XMVqWIL0RN
 RTzidFgUaIJNgmFhCATY67x+lCnX4f6JsuxijDIC18Xsc6emoZah
X-Google-Smtp-Source: ABdhPJzJAIkrQ86Kc+CVaeMVgnGCz3qZqIz0JzEtAhHCtPRcvoEpEYthvK4isOkKziFXUu5pJke+SdbSxxDiiA6Tt48=
X-Received: by 2002:a02:ad17:: with SMTP id s23mr623986jan.135.1630363164149; 
 Mon, 30 Aug 2021 15:39:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210818191920.390759-1-richard.henderson@linaro.org>
 <20210818191920.390759-67-richard.henderson@linaro.org>
In-Reply-To: <20210818191920.390759-67-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 31 Aug 2021 08:38:58 +1000
Message-ID: <CAKmqyKOQVW6WO1FUdQThmj76+5j6+cGvVyJ5GPkKe3nTB=NJ-Q@mail.gmail.com>
Subject: Re: [PATCH v3 66/66] tcg/riscv: Remove add with zero on user-only
 memory access
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d34;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd34.google.com
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
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Aug 19, 2021 at 6:18 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  tcg/riscv/tcg-target.c.inc | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
> index f75dcf88f8..b84a4e876b 100644
> --- a/tcg/riscv/tcg-target.c.inc
> +++ b/tcg/riscv/tcg-target.c.inc
> @@ -1182,9 +1182,7 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is_64)
>      if (a_bits) {
>          tcg_out_test_alignment(s, true, addr_regl, a_bits);
>      }
> -    if (guest_base == 0) {
> -        tcg_out_opc_reg(s, OPC_ADD, base, addr_regl, TCG_REG_ZERO);
> -    } else {
> +    if (guest_base != 0) {
>          tcg_out_opc_reg(s, OPC_ADD, base, TCG_GUEST_BASE_REG, addr_regl);
>      }
>      tcg_out_qemu_ld_direct(s, data_regl, data_regh, base, opc, is_64);
> @@ -1256,9 +1254,7 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is_64)
>      if (a_bits) {
>          tcg_out_test_alignment(s, false, addr_regl, a_bits);
>      }
> -    if (guest_base == 0) {
> -        tcg_out_opc_reg(s, OPC_ADD, base, addr_regl, TCG_REG_ZERO);
> -    } else {
> +    if (guest_base != 0) {
>          tcg_out_opc_reg(s, OPC_ADD, base, TCG_GUEST_BASE_REG, addr_regl);
>      }
>      tcg_out_qemu_st_direct(s, data_regl, data_regh, base, opc);
> --
> 2.25.1
>
>

