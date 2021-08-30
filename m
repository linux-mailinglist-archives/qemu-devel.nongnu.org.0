Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F02D3FB0C5
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 07:18:29 +0200 (CEST)
Received: from localhost ([::1]:36978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKZgi-0000Jv-Ha
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 01:18:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mKZfH-0007NH-AE
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 01:16:59 -0400
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a]:42951)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mKZfD-0000uj-OQ
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 01:16:58 -0400
Received: by mail-il1-x12a.google.com with SMTP id s16so14748226ilo.9
 for <qemu-devel@nongnu.org>; Sun, 29 Aug 2021 22:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mWvHtMlQcsB1sOGFN0iW3ZTOBy8IHtP5C0YHl5epV3c=;
 b=HOLwZluncAMUsGH8OdwMKLJ8ysHtqVaT0pLoHVHBjjNR1gKF2Cq2ZpzQptoVjLuJRn
 oLwlBP6FmnC2jSuMSxzGWSNKkexQXUs+ORb3/n484t5Tl8+2FtPoMtzWqX4AZHkBi9xK
 S8XeyLtc2EKQutfF5bB3xgIP3byPtyhzYq3pH/y7X+sxkRpfr+29+lLyei81+ZXD5tLl
 DbXygypYPYLn6vQ5mro5K/oMlzP/KCv8V+wXuCnAQsVSGHrlcFrwboxMceXzQeHqfohQ
 TR+kLIDYvLJxwZokbkCO8xC7RMuhQwh7qQhg4UysoW3yhUPrlapvtb9PCqv06vf4k5Fv
 ANqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mWvHtMlQcsB1sOGFN0iW3ZTOBy8IHtP5C0YHl5epV3c=;
 b=UIRoLpdCpkx0HOUcT+/faq07LwTWXXxfSfHAkbl/s3VEK+miI+COkTX6VamCG0TFuk
 oc4J56dTCAgNfbVMaONbJ86dXEKN6vW+YwIVivS5w1zTQ+6yyuEtLdDsuJKsKhR+nqOb
 QzZIryyzWEpinTckRtVhcsdQ1FvHfE6n6QzMR8pVkrTnvRcOo8mzvgya7qine8OwKcMp
 vOJmTawww4EA4SLM35HxHSeyiwmLcbrXE6Lh1brbKrtIBytya/XyeXgHlLjuOCGXbeos
 qWrt+qqJEKe0vuaGjE6VCtRemFFs7gHpdrPJaK49XVymPHQjNxDyiRFoJF0kJTCUr3y5
 vNtg==
X-Gm-Message-State: AOAM531qE7zy8z+d4QtNT5Zye7LBRO11kNbaF2FA6FacgOPsmsNa5jPG
 qE9kwffDUxg64RzgG0i0kcBSNh3kPZLXHrNICio=
X-Google-Smtp-Source: ABdhPJxKZHRTd85Fz8AGXhqunQZ/25ncCJyV9aAOeaUgYM1CFsIKuI/GaJ+QALq0utrvoum/13sqjXPHfDjlIjmxSLc=
X-Received: by 2002:a92:ce03:: with SMTP id b3mr15071456ilo.267.1630300614768; 
 Sun, 29 Aug 2021 22:16:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210825165907.34026-1-philipp.tomsich@vrull.eu>
 <20210825165907.34026-11-philipp.tomsich@vrull.eu>
In-Reply-To: <20210825165907.34026-11-philipp.tomsich@vrull.eu>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 30 Aug 2021 15:16:28 +1000
Message-ID: <CAKmqyKMjUs+4Bbikut7dEjZ1+mAR8ufXFqKey-S6gUi93ti0CQ@mail.gmail.com>
Subject: Re: [PATCH v6 10/14] target/riscv: Add a REQUIRE_32BIT macro
To: Philipp Tomsich <philipp.tomsich@vrull.eu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12a;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12a.google.com
X-Spam_score_int: 1
X-Spam_score: 0.1
X-Spam_bar: /
X-Spam_report: (0.1 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Kito Cheng <kito.cheng@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Aug 26, 2021 at 3:15 AM Philipp Tomsich
<philipp.tomsich@vrull.eu> wrote:
>
> With the changes to Zb[abcs], there's some encodings that are
> different in RV64 and RV32 (e.g., for rev8 and zext.h). For these,
> we'll need a helper macro allowing us to select on RV32, as well.
>
> Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
> (no changes since v3)
>
> Changes in v3:
> - Moved the REQUIRE_32BIT macro into a separate commit.
>
>  target/riscv/translate.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 5c099ff007..aabdd44663 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -417,6 +417,12 @@ EX_SH(12)
>      }                              \
>  } while (0)
>
> +#define REQUIRE_32BIT(ctx) do { \
> +    if (!is_32bit(ctx)) {       \
> +        return false;           \
> +    }                           \
> +} while (0)
> +
>  #define REQUIRE_64BIT(ctx) do { \
>      if (is_32bit(ctx)) {        \
>          return false;           \
> --
> 2.25.1
>
>

