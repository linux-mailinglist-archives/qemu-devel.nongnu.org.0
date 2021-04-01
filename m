Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4DB351487
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 13:42:45 +0200 (CEST)
Received: from localhost ([::1]:36572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRvig-0007XO-Pn
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 07:42:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lRvhT-0006sy-Se
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 07:41:24 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:43957)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lRvhK-0000yR-80
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 07:41:17 -0400
Received: by mail-wr1-x42b.google.com with SMTP id x7so1484185wrw.10
 for <qemu-devel@nongnu.org>; Thu, 01 Apr 2021 04:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=klgHHPvuXBlY1hZvBiWgUS3A+Cmysru/g2lajsi/nIQ=;
 b=RqP+AeCJyv5R92B3lQOGmZXRugTycj95dRkPVYm5P2SZzDt0q/NMj9+5+6N2zSeoFG
 K0VWqAwkbQpei3+vbQYgGmB+D7iBnyBBHzzeE0djym71im+9tMl4whxRImvUoUaaIz/3
 s5UEgSv5QjfDUYLya+EV7dkq53mo5Uahg8BzYh8+LKFeg7xIITyIElTkAj5efVdKYqsr
 75yjFqc9ptLS7TMKTeDkOcHc+OkdJL2OZ2ADPLQB0fZ2O8bydcNiuWTQtn3TduhBAbeH
 Y8ksH5NZWuSjLAVVnDO421Rny7q9VeuIJrnhl1givuDELQiNbuwxbC7HweVJrHovFflq
 it+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=klgHHPvuXBlY1hZvBiWgUS3A+Cmysru/g2lajsi/nIQ=;
 b=KEfOCbM9nGpl34h+UfoMeN80LRc94HUasKClnw5dKGbcwYO3h4bKLjxQwZ0v39pwf4
 MjNfSfdMoxP5rhW7FyNQp0I0EGgX2Tlu7z9kW7HbEOAdVCT1E0ZDvg1RSncIKodczjrg
 A1QY5xBy+qWLcLWRaLGxcNhKZS+iNwRGVo5jmMD72JPYcPqJj8evLKYDu1xztkIGxgJo
 ASbba9qsY1Ox1My0MEQjgmpLc4MjgZoHaveywNwIOF3DZgG0iMvG+0e8dljI3o9aQnBx
 uBQLuF8CPM/ivewXq43OoJBr/XIo0nyFLf371UjCJKchuAyVlbXNB8f5xEs2eOc0c6dA
 iBFg==
X-Gm-Message-State: AOAM532ucjpq+Y20vKAGYY/7yTrgl4lDK48BZFFkf+PqpwTuxLYHIspT
 4VhCPb7z7B5HqJBah0uis6lQ+A==
X-Google-Smtp-Source: ABdhPJwhjFzalb8XR+Und+KnlzHuhjug0D6PafCAhopDgH4qaH7BfQwfF+yVn/h5TjXoFjXCXtN4Tw==
X-Received: by 2002:a5d:670f:: with SMTP id o15mr9296695wru.349.1617277266921; 
 Thu, 01 Apr 2021 04:41:06 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id j30sm10585803wrj.62.2021.04.01.04.41.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 04:41:05 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1AD2A1FF7E;
 Thu,  1 Apr 2021 12:41:05 +0100 (BST)
References: <20210401100457.191458-1-kele.hwang@gmail.com>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Kele Huang <kele.hwang@gmail.com>
Subject: Re: [1/1] tcg/mips: Fix SoftTLB comparison on mips backend
Date: Thu, 01 Apr 2021 12:40:50 +0100
In-reply-to: <20210401100457.191458-1-kele.hwang@gmail.com>
Message-ID: <87mtui1bce.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, f4bug@amsat.org, alistair.francis@wdc.com, j@getutm.app
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Kele Huang <kele.hwang@gmail.com> writes:

> The addrl used to compare with SoftTLB entry should be sign-extended
> in common case, and it will cause constant failing in SoftTLB
> comparisons for the addrl whose address is over 0x80000000 on the
> emulation of 32-bit guest on 64-bit host.
>
> This is an important performance bug fix. Spec2000 gzip rate increase
> from ~45 to ~140 on Loongson 3A4000 (MIPS compatible platform).
>
> Signed-off-by: Kele Huang <kele.hwang@gmail.com>
> ---
>  tcg/mips/tcg-target.c.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
> index 8738a3a581..8b16726242 100644
> --- a/tcg/mips/tcg-target.c.inc
> +++ b/tcg/mips/tcg-target.c.inc
> @@ -1201,13 +1201,13 @@ static void tcg_out_tlb_load(TCGContext *s, TCGRe=
g base, TCGReg addrl,
>             load the tlb addend for the fast path.  */
>          tcg_out_ld(s, TCG_TYPE_PTR, TCG_TMP2, TCG_TMP3, add_off);
>      }
> -    tcg_out_opc_reg(s, OPC_AND, TCG_TMP1, TCG_TMP1, addrl);
>=20=20
>      /* Zero extend a 32-bit guest address for a 64-bit host. */
>      if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS) {
>          tcg_out_ext32u(s, base, addrl);
>          addrl =3D base;
>      }
> +    tcg_out_opc_reg(s, OPC_AND, TCG_TMP1, TCG_TMP1, addrl);
>=20=20
>      label_ptr[0] =3D s->code_ptr;
>      tcg_out_opc_br(s, OPC_BNE, TCG_TMP1, TCG_TMP0);

Looks reasonable to me:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>


--=20
Alex Benn=C3=A9e

