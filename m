Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D446D1A69B7
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Apr 2020 18:19:53 +0200 (CEST)
Received: from localhost ([::1]:46248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jO1oO-00030P-UW
	for lists+qemu-devel@lfdr.de; Mon, 13 Apr 2020 12:19:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60565)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent.desnogues@gmail.com>) id 1jO1nG-0002X7-Is
 for qemu-devel@nongnu.org; Mon, 13 Apr 2020 12:18:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent.desnogues@gmail.com>) id 1jO1n2-0000jG-8Z
 for qemu-devel@nongnu.org; Mon, 13 Apr 2020 12:18:33 -0400
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44]:40278)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent.desnogues@gmail.com>)
 id 1jO1n2-0000ia-0i; Mon, 13 Apr 2020 12:18:28 -0400
Received: by mail-io1-xd44.google.com with SMTP id w1so9885768iot.7;
 Mon, 13 Apr 2020 09:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mzPHCw6k3Pu8SILTY74WR97yZG/8zldYlE/UmI9Oxfw=;
 b=BxSh0R4ypxaasNyCRZSHTvLhTLpjwkOWU6zR2afdxlsp9H8sATX2DEFIHIphpjPVJd
 1isTPCAYW9/N46CnT7bQovV4W/Z9DzViiJQRPwUQ1Lx7Wd4vANHuHxcZYM6EMHj3842T
 D3CpLNcsFvDb9E5M90AAKy9/Q1BrHIF6w+UZOmGgyiOKbmgbnAOqv8+Cw9MNVAR5Kgb5
 lr8T3SQK/D5YOEYjFHyRab5N9I0tMt+sjcT4KbfMlbEZbOlwY8xSyM4FlMTjpHPyZN5t
 zT0WL8iY/St82s0/QfabhbAt2qUuih3UjCenFdtoGkf9+7i00oRBnpc0fH/zg9KwYIXp
 ZXeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mzPHCw6k3Pu8SILTY74WR97yZG/8zldYlE/UmI9Oxfw=;
 b=P5FMGnUmFe7luvJ2S0rdG6U53uoqKmRrBGpHdi//34Uje0N+yuo2HNwUJh2D3cKUSK
 R4JHPt6dWGYydM4ftQuwbgVkmD7TPI1G+DHHP9xBw3PZZxKCx/R3B3pjoCH+C/BFgeao
 +6JPKwsdTbUYHCUCaPTXy6HNIAqutwiL5Uu8XpGGAa4sXJK1FKmcSfyq5oRrjYTQGSET
 rWKcyeG7PYwu8UUVBuCjwcRzzqzOqYoQDYG2mRyqMpHX+LRqyoY8ujKzqU0BTjxao7EP
 k1M7yAY0jMqhLN0731g+8CU11UMSwAPUtjwCuBA7epAcxWygV0h3kLlUC+Od26GgPwI+
 k3hA==
X-Gm-Message-State: AGi0PuZKxnm116HaycR5aD2apmJrnMpewaLRqkoy51rmFv5Qe1MKgfCR
 NdBOqogdSxiS2wMD2mtltTtUv+ZTv3arqpM7tUgb1fN1IHE=
X-Google-Smtp-Source: APiQypKq45FTmSYWlNHE3GiBs0EYMUYz3pj1XwmEfghVLI9laq/vE1/M2JdFTRj6QX5H6K2GqkhdN7cZlr09krV0qZ4=
X-Received: by 2002:a6b:148:: with SMTP id 69mr16744386iob.189.1586794707213; 
 Mon, 13 Apr 2020 09:18:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200326230838.31112-1-richard.henderson@linaro.org>
 <20200326230838.31112-23-richard.henderson@linaro.org>
In-Reply-To: <20200326230838.31112-23-richard.henderson@linaro.org>
From: Laurent Desnogues <laurent.desnogues@gmail.com>
Date: Mon, 13 Apr 2020 18:18:23 +0200
Message-ID: <CABoDooN62TE-g69wZSz8ky9NOdEgRJS7FiH9q+Q5auwL-464MA@mail.gmail.com>
Subject: Re: [PATCH 22/31] target/arm: Implement SVE2 integer add/subtract
 long with carry
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::d44
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
Cc: rajav@quicinc.com, qemu-arm <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, apazos@quicinc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 27, 2020 at 12:17 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
[...]
> diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
> index a0995d95c7..aa330f75c3 100644
> --- a/target/arm/sve_helper.c
> +++ b/target/arm/sve_helper.c
[...]
> +void HELPER(sve2_adcl_d)(void *vd, void *va, void *vn, void *vm, uint32_t desc)
> +{
> +    intptr_t i, opr_sz = simd_oprsz(desc);
> +    int sel = extract32(desc, SIMD_DATA_SHIFT, 1) * 32;
> +    uint64_t inv = -(uint64_t)extract32(desc, SIMD_DATA_SHIFT + 1, 1);
> +    uint64_t *d = vd, *a = va, *n = vn, *m = vm;
> +
> +    for (i = 0; i < opr_sz / 8; i += 2) {
> +        Int128 e1 = int128_make64(a[i]);
> +        Int128 e2 = int128_make64(n[i + sel] ^ inv);
> +        Int128 c = int128_make64(m[i + 1] & 1);
> +        Int128 r = int128_add(int128_add(e1, e2), c);
> +        d[i + 0] = int128_getlo(r);
> +        d[i + 1] = int128_gethi(r);
> +    }
> +}

sel should not be multiplied by 32.

Laurent

