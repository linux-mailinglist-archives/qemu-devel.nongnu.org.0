Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9BB1A450
	for <lists+qemu-devel@lfdr.de>; Fri, 10 May 2019 23:08:03 +0200 (CEST)
Received: from localhost ([127.0.0.1]:50018 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hPCkN-00017X-5E
	for lists+qemu-devel@lfdr.de; Fri, 10 May 2019 17:08:03 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45407)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1hPCj0-0000jo-97
	for qemu-devel@nongnu.org; Fri, 10 May 2019 17:06:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1hPCiu-0006tR-NZ
	for qemu-devel@nongnu.org; Fri, 10 May 2019 17:06:35 -0400
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144]:44324)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1hPCis-0006oG-4o
	for qemu-devel@nongnu.org; Fri, 10 May 2019 17:06:31 -0400
Received: by mail-lf1-x144.google.com with SMTP id n134so5073635lfn.11
	for <qemu-devel@nongnu.org>; Fri, 10 May 2019 14:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=6jTnuEXzTJR+gTGzoX15zcLwf+1xjKLlFx37y0+eLss=;
	b=Jee01n2YA15qS8DG2MEodHSkLIaZhIiCIUJlcM2cR1ctfw70vVfhlR2N34C9SDw+Vt
	Iyb+DV1brNsNvS+UPa2RzXIiBjOORbZTnUlnOEn0XmBvFjV5EP/9r4RNumo5xCi01+zN
	wG2A68i9e4FkAlG92UngIAQfJBZrjpli0uR64jV3RXa1FerkgGn3mi4+NiVSTJVe/oEp
	3qYHkb39om/TG72Fn2yWVwTbs0qbBLhIAlm7m/3WAKQ9v4i9tRYBOjadGYk2OsPVsfvO
	FczjXnkQhtlhzG0XweQsYmouiEG8MczaCSLiAVXJ+wwub0YIspO7fGSpRctI6Tw+uj6n
	GQVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=6jTnuEXzTJR+gTGzoX15zcLwf+1xjKLlFx37y0+eLss=;
	b=XdkQxkUbxiDa3HeQd+165O4/bkXANqRZKp3we7o7nfqF1G7wlOPv8pfwwcTIBB8d3G
	9O9QXwApU5FOPdy2GfgptZmzo8K8tZHGBfHjsSE4cCZCzGKC7+hBnPJ8GuLy3eZfob1V
	9WFCqr3ovm6MfzS+a2xoDllyZg1oZs3t0IUUYpjBAasNMWz0O59bKf4b+iqBloZoc2xA
	MVcp8l6AK8b/Cbq65+c2AFNjc6Nim4nsF+U7wskKesJHy6M21kDuWCZGQiJ1ksi+lpDX
	q4VqOekCxbPU+6jcP+QMZJWgfx1W+AxgVH5yKCfxfrhBvt8q+8CT2Y48C6ogfN77uNmr
	iYzw==
X-Gm-Message-State: APjAAAXpwv1jD8rtrnrfeGkY0bPCAXJ7JewY/xaJ2cXMz940yZ97z5yK
	paTZM73ZoVYhAByXS0ZjclfNn+Tci/Fp4W4Bprc=
X-Google-Smtp-Source: APXvYqzVpSOEG5uGbFawGt0Vde1d8gRJ28Z3vDPqo9UcLmp0asj7MEuwmN+OjftxqPTmMxKswJtMCCXEHHtAZq2Q0bs=
X-Received: by 2002:a19:4a04:: with SMTP id x4mr7026180lfa.124.1557522382620; 
	Fri, 10 May 2019 14:06:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190508000641.19090-1-richard.henderson@linaro.org>
	<20190508000641.19090-40-richard.henderson@linaro.org>
In-Reply-To: <20190508000641.19090-40-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 10 May 2019 14:04:14 -0700
Message-ID: <CAKmqyKNEbdeWnR_=PQGCrpMFi_xyLOSX9SJc3wSJzynbos2RVw@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::144
Subject: Re: [Qemu-devel] [PATCH v3 39/39] tcg/arm: Remove mostly
 unreachable tlb special case
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 7, 2019 at 5:34 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> There was nothing armv7 specific about the bic+cmp sequence, however
> looking at the set of guests more closely shows that the 8-bit immediate
> operand for the bic can only be satisfied with one guest in tree:
> baseline m-profile -- 10-bit pages with aligned 4-byte memory ops.
> Therefore it does not seem useful to keep this path.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  tcg/arm/tcg-target.inc.c | 23 ++++++++++++-----------
>  1 file changed, 12 insertions(+), 11 deletions(-)
>
> diff --git a/tcg/arm/tcg-target.inc.c b/tcg/arm/tcg-target.inc.c
> index ac813abfb8..e0fcc1d990 100644
> --- a/tcg/arm/tcg-target.inc.c
> +++ b/tcg/arm/tcg-target.inc.c
> @@ -1290,19 +1290,20 @@ static TCGReg tcg_out_tlb_read(TCGContext *s, TCGReg addrlo, TCGReg addrhi,
>      tcg_out_ld32_12(s, COND_AL, TCG_REG_R1, TCG_REG_R1,
>                      offsetof(CPUTLBEntry, addend));
>
> -    /* Check alignment, check comparators.  */
> -    if (use_armv7_instructions) {
> +    /*
> +     * Check alignment, check comparators.
> +     * Do this in no more than 3 insns.  Use MOVW for v7, if possible,
> +     * to reduce the number of sequential conditional instructions.
> +     * Almost all guests have at least 4k pages, which means that we need
> +     * to clear at least 9 bits even for an 8-byte memory, which means it
> +     * isn't worth checking for an immediate operand for BIC.
> +     */
> +    if (use_armv7_instructions && TARGET_PAGE_BITS <= 16) {
>          tcg_target_ulong mask = ~(TARGET_PAGE_MASK | ((1 << a_bits) - 1));
> -        int rot = encode_imm(mask);
>
> -        if (rot >= 0) {
> -            tcg_out_dat_imm(s, COND_AL, ARITH_BIC, TCG_REG_TMP, addrlo,
> -                            rotl(mask, rot) | (rot << 7));
> -        } else {
> -            tcg_out_movi32(s, COND_AL, TCG_REG_TMP, mask);
> -            tcg_out_dat_reg(s, COND_AL, ARITH_BIC, TCG_REG_TMP,
> -                            addrlo, TCG_REG_TMP, 0);
> -        }
> +        tcg_out_movi32(s, COND_AL, TCG_REG_TMP, mask);
> +        tcg_out_dat_reg(s, COND_AL, ARITH_BIC, TCG_REG_TMP,
> +                        addrlo, TCG_REG_TMP, 0);
>          tcg_out_dat_reg(s, COND_AL, ARITH_CMP, 0, TCG_REG_R2, TCG_REG_TMP, 0);
>      } else {
>          if (a_bits) {
> --
> 2.17.1
>
>

