Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE24D5288DD
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 17:29:55 +0200 (CEST)
Received: from localhost ([::1]:36486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqcfR-00086J-Rq
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 11:29:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nqcRM-0000Xj-P9
 for qemu-devel@nongnu.org; Mon, 16 May 2022 11:16:04 -0400
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a]:35668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nqcRE-000489-9y
 for qemu-devel@nongnu.org; Mon, 16 May 2022 11:15:15 -0400
Received: by mail-yb1-xb2a.google.com with SMTP id f16so3540185ybk.2
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 08:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=v3tWJQ4AZiyfejMb5vhpI0Buub11iEIZZDM7zwwEubQ=;
 b=TMX7lzE+5Za0Uk3RfT48ekMIS5GzEaZnC4KEXNjQcuuYxji5n/yqiFFHgDS2272+e4
 jEM5+WJILckqLBWdDkWw3HP9F/s7PivhR1YJoRdSZOYrgSBQHxky3G6BIkND4IgGSmL7
 MtQO/hZNrb6GmEBx0NDUbt5z/94DZFPOFIFQEl8mldCSMKVqGo6QcBbAlpw4qYcy3qEA
 loVncLmW19kbgsz76qIVk7yiDNeVcssOpiP8VMZqXTz52TML9jmNYpn2/bbCgdETvovs
 u/EpiN2robCOPmzc7NZLiU4U1OSJ7zoirsrf86y8MilrQWbpgsyA8unPjh6VAPvOQhym
 lJtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=v3tWJQ4AZiyfejMb5vhpI0Buub11iEIZZDM7zwwEubQ=;
 b=KCy4+45tIuhJf5GummbsOAW6DTNOhhuWWl+jbxpFYfOdsbpopZVNU+GRNNfLZjVci6
 T4BetB/FsgnZYUNmN7aNGkja2QLLc9cTjqzw5398yI8ICr2dkw6uuj8ZOK3prwHVm5Uo
 tNwRpAFLwVbIdcvi7i8G69msWWlfo0JjuVt/Pq6qcCz9Gsg84/X4H6mtRpDURRzYLtf5
 lREVDWnFVa5ui5lkj8RF4a+rlsSF74J7f5qzBHbCoHqiFth4WnhEI99tfBahE0J9WRHe
 LH1vbv/z6526ABCjlkeJAYVGdVqfylJPhBh5Wzh/M1zphyUvULLjTtz4EGlwZAkowX1Q
 uLMg==
X-Gm-Message-State: AOAM532m0iENgL3dJ+GLzIl/7HioaG7M25gqXoCHli/q0hrQQh8tTDrK
 stekZOu2Tzqs3OpwTAEJzw+Ww/q0h8G62VOVPTM3gg==
X-Google-Smtp-Source: ABdhPJx8I+kPQZPpckgBETjnJPFeRwuYFfjqGO4NaRuK0saoLfQh0VIdvXNacCWLjHGL0KJbmQJ27+7UZEszVc4nxEE=
X-Received: by 2002:a25:2e06:0:b0:64d:b6a5:261a with SMTP id
 u6-20020a252e06000000b0064db6a5261amr4462872ybu.140.1652714109010; Mon, 16
 May 2022 08:15:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220503194843.1379101-1-richard.henderson@linaro.org>
 <20220503194843.1379101-8-richard.henderson@linaro.org>
In-Reply-To: <20220503194843.1379101-8-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 May 2022 16:14:58 +0100
Message-ID: <CAFEAcA-YxELopj2XPvs14yZTU=A=ufq0PyxpsM0pkrPUoTx89g@mail.gmail.com>
Subject: Re: [PATCH v2 07/74] semihosting: Split out guestfd.c
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Tue, 3 May 2022 at 21:02, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> In arm-compat-semi.c, we have more advanced treatment of
> guest file descriptors than we do in other implementations.
> Split out GuestFD and related functions to a new file so
> that they can be shared.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  configs/targets/aarch64-linux-user.mak    |   1 +
>  configs/targets/aarch64_be-linux-user.mak |   1 +
>  configs/targets/arm-linux-user.mak        |   1 +
>  configs/targets/armeb-linux-user.mak      |   1 +
>  configs/targets/riscv32-linux-user.mak    |   1 +
>  configs/targets/riscv64-linux-user.mak    |   1 +
>  include/semihosting/guestfd.h             |  40 +++++++
>  semihosting/arm-compat-semi.c             | 125 +---------------------
>  semihosting/guestfd.c                     | 116 ++++++++++++++++++++
>  semihosting/meson.build                   |   4 +
>  10 files changed, 168 insertions(+), 123 deletions(-)
>  create mode 100644 include/semihosting/guestfd.h
>  create mode 100644 semihosting/guestfd.c
>
> diff --git a/configs/targets/aarch64-linux-user.mak b/configs/targets/aar=
ch64-linux-user.mak
> index d0c603c54e..db552f1839 100644
> --- a/configs/targets/aarch64-linux-user.mak
> +++ b/configs/targets/aarch64-linux-user.mak
> @@ -2,4 +2,5 @@ TARGET_ARCH=3Daarch64
>  TARGET_BASE_ARCH=3Darm
>  TARGET_XML_FILES=3D gdb-xml/aarch64-core.xml gdb-xml/aarch64-fpu.xml
>  TARGET_HAS_BFLT=3Dy
> +CONFIG_SEMIHOSTING=3Dy
>  CONFIG_ARM_COMPATIBLE_SEMIHOSTING=3Dy

Is it not possible to make CONFIG_ARM_COMPATIBLE_SEMIHOSTING=3Dy
imply CONFIG_SEMIHOSTING=3Dy somehow?


> --- /dev/null
> +++ b/include/semihosting/guestfd.h
> @@ -0,0 +1,40 @@
> +/*
> + * Hosted file support for semihosting syscalls.
> + *
> + * Copyright (c) 2005, 2007 CodeSourcery.
> + * Copyright (c) 2019 Linaro
> + * Copyright =C2=A9 2020 by Keith Packard <keithp@keithp.com>
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#ifndef SEMIHOSTING_GUESTFD_H
> +#define SEMIHOSTING_GUESTFD_H
> +
> +typedef enum GuestFDType {
> +    GuestFDUnused =3D 0,
> +    GuestFDHost =3D 1,
> +    GuestFDGDB =3D 2,
> +    GuestFDFeatureFile =3D 3,
> +} GuestFDType;
> +
> +/*
> + * Guest file descriptors are integer indexes into an array of
> + * these structures (we will dynamically resize as necessary).
> + */
> +typedef struct GuestFD {
> +    GuestFDType type;
> +    union {
> +        int hostfd;
> +        unsigned featurefile_offset;
> +    };
> +} GuestFD;
> +
> +int alloc_guestfd(void);
> +void dealloc_guestfd(int guestfd);
> +GuestFD *get_guestfd(int guestfd);
> +
> +void associate_guestfd(int guestfd, int hostfd);
> +void init_featurefile_guestfd(int guestfd);

If these are moving from being static functions local to a file
to being global, they should get kerneldoc style doc-comments here in
the header file.

thanks
-- PMM

