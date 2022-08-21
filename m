Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED3D59B6DC
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 01:53:03 +0200 (CEST)
Received: from localhost ([::1]:46706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oPukY-0005Np-GA
	for lists+qemu-devel@lfdr.de; Sun, 21 Aug 2022 19:53:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oPuci-0004wJ-UL
 for qemu-devel@nongnu.org; Sun, 21 Aug 2022 19:44:57 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:40867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oPucg-0003K4-Ck
 for qemu-devel@nongnu.org; Sun, 21 Aug 2022 19:44:55 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 t11-20020a17090a510b00b001fac77e9d1fso9645452pjh.5
 for <qemu-devel@nongnu.org>; Sun, 21 Aug 2022 16:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=QkrFh3xu7tU3khs49h5cTpJb4kY058GGqwee3kmbDlE=;
 b=KJ5CUpdbjIWKaX6CRJqGrSvV5ZTLWxYAVRB3+gJkugvjcB7SgAtsxsR8jRw2uUIhFX
 Yn3RNQmY1VVin3Y8yRrbSI3TRKemo3bCc/MjnGajZ/ZF4PAMqTR8ARFN1YuRd4py8AZt
 CxECIn+3wAdhxWbRXVu/QURc+IrVVir2vJdFQpv1wuO9kjCjaagkukwGMc3THXdi7700
 Z7p1v0jQvdSiKZqUvyt6RPdfBHtFQn8GUKEIdY0IpbFBbswvJrbRjyY8D21RN4tJDMa8
 2xVeeIqO8J8oMVM6j+l8s8VjvmBx50tEFbNpF145+fQ+0fDmxOlkyynqPzUsVw0RcgXU
 /VVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=QkrFh3xu7tU3khs49h5cTpJb4kY058GGqwee3kmbDlE=;
 b=vu1bIjhjq39e3TJrD9kXjw0VHyJYVBvzYNGABW6pIH1or/Op4SteXuYpfnYxbWT4Bk
 lgCWHIBw4Yeks8FbiscJ1MD6j8bMK8wb7xsDOyf0OugkQ3Ooq/VyVS0I56J1vKzwXWFy
 dgm0oJUUUyGbk77i6872B4Juiie/Z0zQyk1juAPKo2gw+eZlr2nO4xi4cSIiA0ekdISe
 BRLroAwnKN8/k5Fh6OpPMxbCh/kD5ZT+r0RWxfT/R7u3JqJKiqZGKZEu9sGA98+ZC4J1
 g6bu7jigNIK3O5rgYOMVjdCY74dLi1n2m2LK5rGOzCF1vZSs1syFSq1I5mrWsRm/n9bj
 ls4g==
X-Gm-Message-State: ACgBeo3Ybn80BBIigmuVbmoy7oqRs3TSazwcQpEWJdc2T7B2co4j7EIR
 pdUV1C3UZ9rrFzZoNuVDjQNpLrm+d77KgBvfS9bcCv0FkPA=
X-Google-Smtp-Source: AA6agR5Fc6XY2tGOcI25oXopRZNN2V5yLWFXZV4Lddx9G4VHGBJwc8gwe7gt98MNxdchUhjtMDcM+GX0DF/50VJ1vsk=
X-Received: by 2002:a17:903:2291:b0:16e:cf55:5c72 with SMTP id
 b17-20020a170903229100b0016ecf555c72mr17903097plh.121.1661125493011; Sun, 21
 Aug 2022 16:44:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220819032615.884847-1-richard.henderson@linaro.org>
 <20220819032615.884847-21-richard.henderson@linaro.org>
In-Reply-To: <20220819032615.884847-21-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 22 Aug 2022 09:44:26 +1000
Message-ID: <CAKmqyKOBFuc77kgktiODwyLBryDFYhWVZyof35yp4aWfYr48gA@mail.gmail.com>
Subject: Re: [PATCH v6 20/21] target/riscv: Add MAX_INSN_LEN and insn_len
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Laurent Vivier <laurent@vivier.eu>, iii@linux.ibm.com, 
 dramforever@live.com, Alistair Francis <alistair.francis@wdc.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=alistair23@gmail.com; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

On Fri, Aug 19, 2022 at 1:42 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> These will be useful in properly ending the TB.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/translate.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 38666ddc91..a719aa6e63 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -1022,6 +1022,14 @@ static uint32_t opcode_at(DisasContextBase *dcbase, target_ulong pc)
>  /* Include decoders for factored-out extensions */
>  #include "decode-XVentanaCondOps.c.inc"
>
> +/* The specification allows for longer insns, but not supported by qemu. */
> +#define MAX_INSN_LEN  4
> +
> +static inline int insn_len(uint16_t first_word)
> +{
> +    return (first_word & 3) == 3 ? 4 : 2;
> +}
> +
>  static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16_t opcode)
>  {
>      /*
> @@ -1037,7 +1045,7 @@ static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16_t opcode)
>      };
>
>      /* Check for compressed insn */
> -    if (extract16(opcode, 0, 2) != 3) {
> +    if (insn_len(opcode) == 2) {
>          if (!has_ext(ctx, RVC)) {
>              gen_exception_illegal(ctx);
>          } else {
> --
> 2.34.1
>
>

