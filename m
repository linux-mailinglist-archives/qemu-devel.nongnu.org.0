Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4869A4299C3
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 01:20:26 +0200 (CEST)
Received: from localhost ([::1]:55938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ma4am-0001k7-Nu
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 19:20:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ma4Xj-0000kj-RS
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 19:17:16 -0400
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136]:42535)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ma4Xh-0000PC-6j
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 19:17:15 -0400
Received: by mail-il1-x136.google.com with SMTP id y17so19778522ilb.9
 for <qemu-devel@nongnu.org>; Mon, 11 Oct 2021 16:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BoFxW8++pQqWhbOMyb9BQt1kPQaKWljwXV0yf+KduQQ=;
 b=YgSmFI8nwtvdkDdyE+Wg6GPrMFMF3azQ0l5dMgeV5evSasHwu8+ld/dFt9njuz3xpq
 zd9BJoAiMWSGVHuv2Sve+PEhbCQEOaeU7TFHd1AWuuSBPikZoX+YLxVKg2uasqkAJqdD
 WhLr2axQvVwBrlQNiVoTwMIx5KOk91OIOHG+mhCNya3lGiIm1jr77KmmlnD7VVwqvF5C
 ZxBGxAF4wK0dPpp/yCTSAoir2FGcE4UmsdWa3gfCiaqQWGdRkGTir/qp5HdP44PvB+s3
 9EtRrk0F8a9SvuKqotLMue3d2AFdbSbKzL4LZTJU9bKp5L5TgYFH5aDf0VBBwLCPNxOY
 d+fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BoFxW8++pQqWhbOMyb9BQt1kPQaKWljwXV0yf+KduQQ=;
 b=nyWmM5xRCZQjB5vwXMsesEpbCunArw+163FeuzG7lF5ZDD57c7QXAYbSQQtRtkYdoQ
 C+MS+HbY03PesCmGLisZxJkxPjaPBCUvARWdjmmUFiiHLqQ4juwtuRr8zvi/3LOVYpNv
 J6Ps5N/QyVE2bdv0M3B0C/gviZ1P92jTejj3aSwePrclfFbDnrVuh6gpp5Mp8GVPZtJZ
 U10VEl2vG+9nvmTSeeOguL82pFkQwtGhjIkVW7c1I+9goOr3cTBrU06g3fm5ePNy4PCt
 0p9P4Jg99og3+yzwOS9cycCFFnhkf7lV45a0kN+f9lw42FIschvwNtfFpq8s5GK4Z7T1
 ZUQQ==
X-Gm-Message-State: AOAM531YzuXJ308XI3CcUlsOVvjbTX0rbwTCCMm+JzuIsdRL4D9s++f2
 ipXmGXR9MMliKuda2bHZsUkY/v0xI+T8CdN8G3s=
X-Google-Smtp-Source: ABdhPJzvg30BJ1lzoCE+bnbnZIILaiX5W6fUdI0qcsyVIoLJDWxKlgZivlzb8WcfP4bM6+E0XX8qHWMXjvS2RRC9dJ8=
X-Received: by 2002:a05:6e02:164a:: with SMTP id
 v10mr20475106ilu.74.1633994231618; 
 Mon, 11 Oct 2021 16:17:11 -0700 (PDT)
MIME-Version: 1.0
References: <20211010174401.141339-1-richard.henderson@linaro.org>
 <20211010174401.141339-2-richard.henderson@linaro.org>
In-Reply-To: <20211010174401.141339-2-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 12 Oct 2021 09:16:45 +1000
Message-ID: <CAKmqyKP8AN-1=dFmunzKff+-5xxh8T1fWg2UF2ERakoLRwOcxg@mail.gmail.com>
Subject: Re: [PATCH 1/8] tcg: Add TCG_TARGET_SIGNED_ADDR32
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::136;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x136.google.com
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
Cc: git@xen0n.name, Alistair Francis <Alistair.Francis@wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Oct 11, 2021 at 3:49 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Define as 0 for all tcg hosts.  Put this in a separate header,
> because we'll want this in places that do not ordinarily have
> access to all of tcg/tcg.h.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  tcg/aarch64/tcg-target-sa32.h | 1 +
>  tcg/arm/tcg-target-sa32.h     | 1 +
>  tcg/i386/tcg-target-sa32.h    | 1 +
>  tcg/mips/tcg-target-sa32.h    | 1 +
>  tcg/ppc/tcg-target-sa32.h     | 1 +
>  tcg/riscv/tcg-target-sa32.h   | 1 +
>  tcg/s390x/tcg-target-sa32.h   | 1 +
>  tcg/sparc/tcg-target-sa32.h   | 1 +
>  tcg/tci/tcg-target-sa32.h     | 1 +
>  9 files changed, 9 insertions(+)
>  create mode 100644 tcg/aarch64/tcg-target-sa32.h
>  create mode 100644 tcg/arm/tcg-target-sa32.h
>  create mode 100644 tcg/i386/tcg-target-sa32.h
>  create mode 100644 tcg/mips/tcg-target-sa32.h
>  create mode 100644 tcg/ppc/tcg-target-sa32.h
>  create mode 100644 tcg/riscv/tcg-target-sa32.h
>  create mode 100644 tcg/s390x/tcg-target-sa32.h
>  create mode 100644 tcg/sparc/tcg-target-sa32.h
>  create mode 100644 tcg/tci/tcg-target-sa32.h
>
> diff --git a/tcg/aarch64/tcg-target-sa32.h b/tcg/aarch64/tcg-target-sa32.h
> new file mode 100644
> index 0000000000..cb185b1526
> --- /dev/null
> +++ b/tcg/aarch64/tcg-target-sa32.h
> @@ -0,0 +1 @@
> +#define TCG_TARGET_SIGNED_ADDR32 0
> diff --git a/tcg/arm/tcg-target-sa32.h b/tcg/arm/tcg-target-sa32.h
> new file mode 100644
> index 0000000000..cb185b1526
> --- /dev/null
> +++ b/tcg/arm/tcg-target-sa32.h
> @@ -0,0 +1 @@
> +#define TCG_TARGET_SIGNED_ADDR32 0
> diff --git a/tcg/i386/tcg-target-sa32.h b/tcg/i386/tcg-target-sa32.h
> new file mode 100644
> index 0000000000..cb185b1526
> --- /dev/null
> +++ b/tcg/i386/tcg-target-sa32.h
> @@ -0,0 +1 @@
> +#define TCG_TARGET_SIGNED_ADDR32 0
> diff --git a/tcg/mips/tcg-target-sa32.h b/tcg/mips/tcg-target-sa32.h
> new file mode 100644
> index 0000000000..cb185b1526
> --- /dev/null
> +++ b/tcg/mips/tcg-target-sa32.h
> @@ -0,0 +1 @@
> +#define TCG_TARGET_SIGNED_ADDR32 0
> diff --git a/tcg/ppc/tcg-target-sa32.h b/tcg/ppc/tcg-target-sa32.h
> new file mode 100644
> index 0000000000..cb185b1526
> --- /dev/null
> +++ b/tcg/ppc/tcg-target-sa32.h
> @@ -0,0 +1 @@
> +#define TCG_TARGET_SIGNED_ADDR32 0
> diff --git a/tcg/riscv/tcg-target-sa32.h b/tcg/riscv/tcg-target-sa32.h
> new file mode 100644
> index 0000000000..cb185b1526
> --- /dev/null
> +++ b/tcg/riscv/tcg-target-sa32.h
> @@ -0,0 +1 @@
> +#define TCG_TARGET_SIGNED_ADDR32 0
> diff --git a/tcg/s390x/tcg-target-sa32.h b/tcg/s390x/tcg-target-sa32.h
> new file mode 100644
> index 0000000000..cb185b1526
> --- /dev/null
> +++ b/tcg/s390x/tcg-target-sa32.h
> @@ -0,0 +1 @@
> +#define TCG_TARGET_SIGNED_ADDR32 0
> diff --git a/tcg/sparc/tcg-target-sa32.h b/tcg/sparc/tcg-target-sa32.h
> new file mode 100644
> index 0000000000..cb185b1526
> --- /dev/null
> +++ b/tcg/sparc/tcg-target-sa32.h
> @@ -0,0 +1 @@
> +#define TCG_TARGET_SIGNED_ADDR32 0
> diff --git a/tcg/tci/tcg-target-sa32.h b/tcg/tci/tcg-target-sa32.h
> new file mode 100644
> index 0000000000..cb185b1526
> --- /dev/null
> +++ b/tcg/tci/tcg-target-sa32.h
> @@ -0,0 +1 @@
> +#define TCG_TARGET_SIGNED_ADDR32 0
> --
> 2.25.1
>
>

