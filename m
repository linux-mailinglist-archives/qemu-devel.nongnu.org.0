Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C675949125F
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 00:31:30 +0100 (CET)
Received: from localhost ([::1]:45054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9bTD-0008D3-Fm
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 18:31:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n9bR8-0007Hq-1M; Mon, 17 Jan 2022 18:29:18 -0500
Received: from [2607:f8b0:4864:20::d2a] (port=37686
 helo=mail-io1-xd2a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n9bR6-0005sk-03; Mon, 17 Jan 2022 18:29:17 -0500
Received: by mail-io1-xd2a.google.com with SMTP id n137so17437415iod.4;
 Mon, 17 Jan 2022 15:29:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=hv4e0eFjPteOHCscHt470YqgSB9ejD4/SOAoCC9IMHk=;
 b=H/XDwOA8pNls4Jp3rmHQVi/yg37IUlHtxTcCIFic+c/RqQodbrPN8BSm0d4DOe6gGj
 QJIKA+cK7LzEvhM8QNNXqEczWXN742RUosyX10vnTSTTzKHA3u4YrUKaLu7vmRLa0M3r
 TXw+GyNlDTeAKdnst2iNTx1L+oqro26+kPrgIEcH/6UmCgub6nCVTRJAz8HEx9QeBgwg
 bg7xgDqx791jjKnOqtyt48DXMkOVlP381VJTmbPZqlu/RuS+AfHWvNOkNvyotJn0dwrX
 LzRXDKE9SC6aBJ5Z8NhBk6AyJTKGIW459vhbVYRuSmlRB9KxE9HqlV/ldthKZtdwt5+Y
 CsKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=hv4e0eFjPteOHCscHt470YqgSB9ejD4/SOAoCC9IMHk=;
 b=VxxcWv5kbshLqxL2aOca+hvYlVu76rrCKBUxjrqV/IGINRkDzWsPlIt0hJJIwysLmb
 BC70serQwOOIY6wLpiXttoVaNWnCx0gWB94KQcR6aChBuXgDI8OpTlrKy5/hYWaH2V3K
 W9e87fqloSGYdCNzbhd8pHboQ7VEMRhA/oSXvIknY3vGcdosJ7IHYlOiZ5vgQZHcVQZ0
 hCa5mtYtJLJm9uzdUJ3MRJzGBlNklxVWzF1Rh87F0F6Gem0Jz+XIOwhs8OmFvnZX0GRw
 pVrvqmkOgpdDKw8Q7iV3F2iyfmcWE9HxPzxoxX33l96dqRivg9y49q1bG62zSK5QWDYv
 mXaw==
X-Gm-Message-State: AOAM531GZYJBQvvV18+gWPfFREK8ah8ZWGLkYotptyAlvlq3ph3gOtzL
 wq+F+ME+J9e8FGHu6mD71D6iqNVpqK4wabCbvSg=
X-Google-Smtp-Source: ABdhPJyB4fjHSjpKF7JFwHSeBQkS77uRRkD4zJKb9ntu/C2FdzfeQMKFy3fdrvy2fL21spZif/8H/q9pTVe9n5/UkN4=
X-Received: by 2002:a02:7702:: with SMTP id g2mr11189980jac.206.1642462152482; 
 Mon, 17 Jan 2022 15:29:12 -0800 (PST)
MIME-Version: 1.0
References: <20220111035124.9468-1-liweiwei@iscas.ac.cn>
 <20220111035124.9468-4-liweiwei@iscas.ac.cn>
In-Reply-To: <20220111035124.9468-4-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 18 Jan 2022 09:28:46 +1000
Message-ID: <CAKmqyKPcrR_jEzhGsXPvJpRaCU163KxXS+GjSu8V=HgvAPciaw@mail.gmail.com>
Subject: Re: [PATCH v4 3/7] crypto include/crypto target/arm: move sm4_sbox to
 crypto
To: Weiwei Li <liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2a;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2a.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: lazyparser@gmail.com, "open list:RISC-V" <qemu-riscv@nongnu.org>,
 lustrew@foxmail.com, wangjunqiang <wangjunqiang@iscas.ac.cn>,
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, luruibo2000@163.com,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 11, 2022 at 1:57 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>
>    - share it between target/arm and target/riscv
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Do you mind fixing up the commit title?

Maybe something more like:

crypto: move sm4_sbox from target/arm

Otherwise:

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

Alistair

> ---
>  crypto/meson.build         |  1 +
>  crypto/sm4.c               | 49 ++++++++++++++++++++++++++++++++++++++
>  include/crypto/sm4.h       |  6 +++++
>  target/arm/crypto_helper.c | 36 +---------------------------
>  4 files changed, 57 insertions(+), 35 deletions(-)
>  create mode 100644 crypto/sm4.c
>  create mode 100644 include/crypto/sm4.h
>
> diff --git a/crypto/meson.build b/crypto/meson.build
> index 95a6a83504..f659fc9035 100644
> --- a/crypto/meson.build
> +++ b/crypto/meson.build
> @@ -38,6 +38,7 @@ crypto_ss.add(when: 'CONFIG_SECRET_KEYRING', if_true: f=
iles('secret_keyring.c'))
>  crypto_ss.add(when: 'CONFIG_AF_ALG', if_true: files('afalg.c', 'cipher-a=
falg.c', 'hash-afalg.c'))
>  crypto_ss.add(when: gnutls, if_true: files('tls-cipher-suites.c'))
>
> +util_ss.add(files('sm4.c'))
>  util_ss.add(files('aes.c'))
>  util_ss.add(files('init.c'))
>  if gnutls.found()
> diff --git a/crypto/sm4.c b/crypto/sm4.c
> new file mode 100644
> index 0000000000..9f0cd452c7
> --- /dev/null
> +++ b/crypto/sm4.c
> @@ -0,0 +1,49 @@
> +/*
> + * QEMU crypto sm4 support
> + *
> + * Copyright (C) 2013 - 2018 Linaro Ltd <ard.biesheuvel@linaro.org>
> + *
> + * This library is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU Lesser General Public
> + * License as published by the Free Software Foundation; either
> + * version 2.1 of the License, or (at your option) any later version.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "crypto/sm4.h"
> +
> +uint8_t const sm4_sbox[] =3D {
> +    0xd6, 0x90, 0xe9, 0xfe, 0xcc, 0xe1, 0x3d, 0xb7,
> +    0x16, 0xb6, 0x14, 0xc2, 0x28, 0xfb, 0x2c, 0x05,
> +    0x2b, 0x67, 0x9a, 0x76, 0x2a, 0xbe, 0x04, 0xc3,
> +    0xaa, 0x44, 0x13, 0x26, 0x49, 0x86, 0x06, 0x99,
> +    0x9c, 0x42, 0x50, 0xf4, 0x91, 0xef, 0x98, 0x7a,
> +    0x33, 0x54, 0x0b, 0x43, 0xed, 0xcf, 0xac, 0x62,
> +    0xe4, 0xb3, 0x1c, 0xa9, 0xc9, 0x08, 0xe8, 0x95,
> +    0x80, 0xdf, 0x94, 0xfa, 0x75, 0x8f, 0x3f, 0xa6,
> +    0x47, 0x07, 0xa7, 0xfc, 0xf3, 0x73, 0x17, 0xba,
> +    0x83, 0x59, 0x3c, 0x19, 0xe6, 0x85, 0x4f, 0xa8,
> +    0x68, 0x6b, 0x81, 0xb2, 0x71, 0x64, 0xda, 0x8b,
> +    0xf8, 0xeb, 0x0f, 0x4b, 0x70, 0x56, 0x9d, 0x35,
> +    0x1e, 0x24, 0x0e, 0x5e, 0x63, 0x58, 0xd1, 0xa2,
> +    0x25, 0x22, 0x7c, 0x3b, 0x01, 0x21, 0x78, 0x87,
> +    0xd4, 0x00, 0x46, 0x57, 0x9f, 0xd3, 0x27, 0x52,
> +    0x4c, 0x36, 0x02, 0xe7, 0xa0, 0xc4, 0xc8, 0x9e,
> +    0xea, 0xbf, 0x8a, 0xd2, 0x40, 0xc7, 0x38, 0xb5,
> +    0xa3, 0xf7, 0xf2, 0xce, 0xf9, 0x61, 0x15, 0xa1,
> +    0xe0, 0xae, 0x5d, 0xa4, 0x9b, 0x34, 0x1a, 0x55,
> +    0xad, 0x93, 0x32, 0x30, 0xf5, 0x8c, 0xb1, 0xe3,
> +    0x1d, 0xf6, 0xe2, 0x2e, 0x82, 0x66, 0xca, 0x60,
> +    0xc0, 0x29, 0x23, 0xab, 0x0d, 0x53, 0x4e, 0x6f,
> +    0xd5, 0xdb, 0x37, 0x45, 0xde, 0xfd, 0x8e, 0x2f,
> +    0x03, 0xff, 0x6a, 0x72, 0x6d, 0x6c, 0x5b, 0x51,
> +    0x8d, 0x1b, 0xaf, 0x92, 0xbb, 0xdd, 0xbc, 0x7f,
> +    0x11, 0xd9, 0x5c, 0x41, 0x1f, 0x10, 0x5a, 0xd8,
> +    0x0a, 0xc1, 0x31, 0x88, 0xa5, 0xcd, 0x7b, 0xbd,
> +    0x2d, 0x74, 0xd0, 0x12, 0xb8, 0xe5, 0xb4, 0xb0,
> +    0x89, 0x69, 0x97, 0x4a, 0x0c, 0x96, 0x77, 0x7e,
> +    0x65, 0xb9, 0xf1, 0x09, 0xc5, 0x6e, 0xc6, 0x84,
> +    0x18, 0xf0, 0x7d, 0xec, 0x3a, 0xdc, 0x4d, 0x20,
> +    0x79, 0xee, 0x5f, 0x3e, 0xd7, 0xcb, 0x39, 0x48,
> +};
> +
> diff --git a/include/crypto/sm4.h b/include/crypto/sm4.h
> new file mode 100644
> index 0000000000..9bd3ebc62e
> --- /dev/null
> +++ b/include/crypto/sm4.h
> @@ -0,0 +1,6 @@
> +#ifndef QEMU_SM4_H
> +#define QEMU_SM4_H
> +
> +extern const uint8_t sm4_sbox[256];
> +
> +#endif
> diff --git a/target/arm/crypto_helper.c b/target/arm/crypto_helper.c
> index 28a84c2dbd..390020672a 100644
> --- a/target/arm/crypto_helper.c
> +++ b/target/arm/crypto_helper.c
> @@ -15,6 +15,7 @@
>  #include "exec/helper-proto.h"
>  #include "tcg/tcg-gvec-desc.h"
>  #include "crypto/aes.h"
> +#include "crypto/sm4.h"
>  #include "vec_internal.h"
>
>  union CRYPTO_STATE {
> @@ -694,41 +695,6 @@ DO_SM3TT(crypto_sm3tt2b, 3)
>
>  #undef DO_SM3TT
>
> -static uint8_t const sm4_sbox[] =3D {
> -    0xd6, 0x90, 0xe9, 0xfe, 0xcc, 0xe1, 0x3d, 0xb7,
> -    0x16, 0xb6, 0x14, 0xc2, 0x28, 0xfb, 0x2c, 0x05,
> -    0x2b, 0x67, 0x9a, 0x76, 0x2a, 0xbe, 0x04, 0xc3,
> -    0xaa, 0x44, 0x13, 0x26, 0x49, 0x86, 0x06, 0x99,
> -    0x9c, 0x42, 0x50, 0xf4, 0x91, 0xef, 0x98, 0x7a,
> -    0x33, 0x54, 0x0b, 0x43, 0xed, 0xcf, 0xac, 0x62,
> -    0xe4, 0xb3, 0x1c, 0xa9, 0xc9, 0x08, 0xe8, 0x95,
> -    0x80, 0xdf, 0x94, 0xfa, 0x75, 0x8f, 0x3f, 0xa6,
> -    0x47, 0x07, 0xa7, 0xfc, 0xf3, 0x73, 0x17, 0xba,
> -    0x83, 0x59, 0x3c, 0x19, 0xe6, 0x85, 0x4f, 0xa8,
> -    0x68, 0x6b, 0x81, 0xb2, 0x71, 0x64, 0xda, 0x8b,
> -    0xf8, 0xeb, 0x0f, 0x4b, 0x70, 0x56, 0x9d, 0x35,
> -    0x1e, 0x24, 0x0e, 0x5e, 0x63, 0x58, 0xd1, 0xa2,
> -    0x25, 0x22, 0x7c, 0x3b, 0x01, 0x21, 0x78, 0x87,
> -    0xd4, 0x00, 0x46, 0x57, 0x9f, 0xd3, 0x27, 0x52,
> -    0x4c, 0x36, 0x02, 0xe7, 0xa0, 0xc4, 0xc8, 0x9e,
> -    0xea, 0xbf, 0x8a, 0xd2, 0x40, 0xc7, 0x38, 0xb5,
> -    0xa3, 0xf7, 0xf2, 0xce, 0xf9, 0x61, 0x15, 0xa1,
> -    0xe0, 0xae, 0x5d, 0xa4, 0x9b, 0x34, 0x1a, 0x55,
> -    0xad, 0x93, 0x32, 0x30, 0xf5, 0x8c, 0xb1, 0xe3,
> -    0x1d, 0xf6, 0xe2, 0x2e, 0x82, 0x66, 0xca, 0x60,
> -    0xc0, 0x29, 0x23, 0xab, 0x0d, 0x53, 0x4e, 0x6f,
> -    0xd5, 0xdb, 0x37, 0x45, 0xde, 0xfd, 0x8e, 0x2f,
> -    0x03, 0xff, 0x6a, 0x72, 0x6d, 0x6c, 0x5b, 0x51,
> -    0x8d, 0x1b, 0xaf, 0x92, 0xbb, 0xdd, 0xbc, 0x7f,
> -    0x11, 0xd9, 0x5c, 0x41, 0x1f, 0x10, 0x5a, 0xd8,
> -    0x0a, 0xc1, 0x31, 0x88, 0xa5, 0xcd, 0x7b, 0xbd,
> -    0x2d, 0x74, 0xd0, 0x12, 0xb8, 0xe5, 0xb4, 0xb0,
> -    0x89, 0x69, 0x97, 0x4a, 0x0c, 0x96, 0x77, 0x7e,
> -    0x65, 0xb9, 0xf1, 0x09, 0xc5, 0x6e, 0xc6, 0x84,
> -    0x18, 0xf0, 0x7d, 0xec, 0x3a, 0xdc, 0x4d, 0x20,
> -    0x79, 0xee, 0x5f, 0x3e, 0xd7, 0xcb, 0x39, 0x48,
> -};
> -
>  static void do_crypto_sm4e(uint64_t *rd, uint64_t *rn, uint64_t *rm)
>  {
>      union CRYPTO_STATE d =3D { .l =3D { rn[0], rn[1] } };
> --
> 2.17.1
>
>

