Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB9F38B03F
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 15:42:55 +0200 (CEST)
Received: from localhost ([::1]:48974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljiwr-0004Rr-EP
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 09:42:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ljiv8-0003dv-K6
 for qemu-devel@nongnu.org; Thu, 20 May 2021 09:41:03 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:43686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ljiv6-0004zP-Iz
 for qemu-devel@nongnu.org; Thu, 20 May 2021 09:41:02 -0400
Received: by mail-ej1-x631.google.com with SMTP id l4so25342998ejc.10
 for <qemu-devel@nongnu.org>; Thu, 20 May 2021 06:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Chru3fcjdYBD1Ork3gJ2EWKQv+k7ilFsYFF63K3qb5o=;
 b=hwKEvwh6eCYHunOTdhyt7980QHD8DX+wiqHSVCmMysBtAm/ssO70XJCNTSrOGUqo4s
 SaWR+eFmzuEBKKHjaKUb2GhFUJ2ZLdXBLM96kHHmQ7RVQLLd8P/99a9ZYwl6YV89NA+a
 LDgxPnkJ4nf6T89zZaKtc216ESlrQFmJQnAAKwy5VYGB76mt4HLqEpNe7LkEQ0FvSE0g
 qGU7zNR/gw2h4C9GSJhRemQDqyHxDPeZmylEz3TinYwSX9qTF45t4aHQ81H1FDRBVTdf
 cHb3F0zstHgiI8xty/I3SVolyX+cSTKYw4xQGzEM6OTId1nKIVIBStmeKEhFqT4FzZyJ
 LX0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Chru3fcjdYBD1Ork3gJ2EWKQv+k7ilFsYFF63K3qb5o=;
 b=joGcsyKyjpaG3T/7JbgI2ekC/5OpY1Pi5HVHpZpEUV4lo6tGgcY0F8lS3ehmLuKtKj
 KRcibkzmSqRpo42sCBLSXYlvo2Byxh2en4+/re+u1aaSOaleV77sWT8FImH3yA/zLCL9
 grFx1lTZvRPMBsFeJ3PefU4s36bvtOyeq0cEcBjBfr+fFKXrWP7itxLE7PO1wYzKQr9z
 QbUT3Vn3Rt9n4+fO/JksMwlIug/DsJ0aMu2x3+FlXv+KRvmEhiW18wZGPTDlpDqVa59Y
 J4TK6kUowIPU9SBa/q2tNxXcJfoXVNAubp43B9ExIfCuJZAVWjhoikGhirj4P6IuoR+r
 HLCQ==
X-Gm-Message-State: AOAM5317DTzBn+AO+FYIxALq7xRjGdK/8CCh2/21ilyo/o7hurrpgan1
 0rC0J3w0HNIzOmxnP07jXfhn32qUun0YneW38/9URA==
X-Google-Smtp-Source: ABdhPJybzQtU5nL2PIOUWugKCBAzKtBX5O1/LMJ+GD7CAj+CVm67lTMTHKhL5JvFQTEvDXb2E0ETSvYLKhzvaiQ8TpY=
X-Received: by 2002:a17:906:d8cb:: with SMTP id
 re11mr4800184ejb.482.1621518058657; 
 Thu, 20 May 2021 06:40:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210516123431.718318-1-richard.henderson@linaro.org>
 <20210516123431.718318-43-richard.henderson@linaro.org>
In-Reply-To: <20210516123431.718318-43-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 20 May 2021 14:40:40 +0100
Message-ID: <CAFEAcA_qmHQr8C_xGqixqNEiU_c6P37=ZEEo07k0X7_=EJWY-g@mail.gmail.com>
Subject: Re: [PULL 42/46] softfloat: Move div_floats to softfloat-parts.c.inc
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x631.google.com
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 16 May 2021 at 13:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Rename to parts$N_div.
> Implement float128_div with FloatParts128.
>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

> +static bool frac64_div(FloatParts64 *a, FloatParts64 *b)
> +{
> +    uint64_t n1, n0, r, q;
> +    bool ret;
> +
> +    /*
> +     * We want a 2*N / N-bit division to produce exactly an N-bit
> +     * result, so that we do not lose any precision and so that we
> +     * do not have to renormalize afterward.  If A.frac < B.frac,
> +     * then division would produce an (N-1)-bit result; shift A left
> +     * by one to produce the an N-bit result, and return true to
> +     * decrement the exponent to match.
> +     *
> +     * The udiv_qrnnd algorithm that we're using requires normalization,
> +     * i.e. the msb of the denominator must be set, which is already tru=
e.
> +     */
> +    ret =3D a->frac < b->frac;
> +    if (ret) {
> +        n0 =3D a->frac;
> +        n1 =3D 0;
> +    } else {
> +        n0 =3D a->frac >> 1;
> +        n1 =3D a->frac << 63;
> +    }
> +    q =3D udiv_qrnnd(&r, n0, n1, b->frac);

Hi -- Coverity is suspicious about this line (CID 1453209),
because udiv_qrrnd()'s prototype is
static inline uint64_t udiv_qrnnd(uint64_t *r, uint64_t n1,
                                  uint64_t n0, uint64_t d)

but here we pass n0, n1 rather than n1, n0...

Bug, or false positive ?

thanks
-- PMM

