Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 216AB250017
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Aug 2020 16:47:08 +0200 (CEST)
Received: from localhost ([::1]:60126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kADkZ-0006xx-5Q
	for lists+qemu-devel@lfdr.de; Mon, 24 Aug 2020 10:47:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kADag-0003V1-9Z
 for qemu-devel@nongnu.org; Mon, 24 Aug 2020 10:36:54 -0400
Received: from mail-yb1-xb41.google.com ([2607:f8b0:4864:20::b41]:36887)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kADae-00040x-Fp
 for qemu-devel@nongnu.org; Mon, 24 Aug 2020 10:36:53 -0400
Received: by mail-yb1-xb41.google.com with SMTP id e14so5282347ybf.4
 for <qemu-devel@nongnu.org>; Mon, 24 Aug 2020 07:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mBpCtNCJOphd8OWWLOWNjBpI9AG+nfDHme3gqY3ytX0=;
 b=lRexftFr8PEel8o9eV98pEs9m6hXq92jiw4Ivd97HhgIwjjN7NpGJA/WyT5LR8z9ko
 ZaDaKNsram+KfQiJhqVPkZjAR2X0RmZBHuz/LYcsfMfKZpk2V91cI1+k4dfpxSAGJtyo
 /2KsWKkOTP7JlBfTL3xIFfMSVLCApZpqYx/+0IRY6gmNIrHfYjNqBA2/bgqlB439Vloq
 DiwiW0S1bqy4NUh6WOYpu1IgB0o7t7gz+02sObafpKEG3UamzpMrKwr+iYaNPtrN/JQV
 u5qaWDNt29HRdy9EY5itLiWIfn/grA+Jcr/bogK+m1Lc5+luKaaYzaScSPMDxFD+Qa1J
 m+tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mBpCtNCJOphd8OWWLOWNjBpI9AG+nfDHme3gqY3ytX0=;
 b=jTuP1dSUEgqBpIT+ydrMuI8iaxkbh4cIk0JDoF99Ijmy3QV77gOe+n6aPTDjfT9xzu
 l2qGGCnUhMNUXi6iaLVzhp1iuK+837i/LY8I4ZGPSULTZl5Ty+Nd6AKwTWp8uOTbPBpG
 taZH7GXGiqiPrwIHyo7sE/ByGyNG9edVaGKeSsAMAnIDVufx5xAyEQ8/VtPz621msm7J
 s8JLLbkCshfVDRNYjjfUDwIlrM/zh5lSNySnPngXSvZdSvcrzQHax4fIPf6JFP9t4/61
 jxklcGRlBFaaT7AAHfljuDyfCeA0fL5rCHE2cSTYFH3rFBFVw3QcCxS9qvp6OHQMpnF8
 eWAw==
X-Gm-Message-State: AOAM531/Rczo7BTLYdcQoIXnjRN66UiqcMp5rCKJkSgnr/0R2BcPR7bc
 X9jrWSIXZJ+Kp4FxMEOkiIA/k2EScrGuF7dOIeo=
X-Google-Smtp-Source: ABdhPJyjwQtqKNZtDiZXLM/031nSQrJOXjxkI5xy01vUvUO2bCXrLai1g1+5/Xn8cPeTtT6l5EjAJl3qCv6kaDVJYAs=
X-Received: by 2002:a25:37ca:: with SMTP id e193mr8505438yba.387.1598279811002; 
 Mon, 24 Aug 2020 07:36:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200824074057.3673-1-kraxel@redhat.com>
In-Reply-To: <20200824074057.3673-1-kraxel@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 24 Aug 2020 22:36:37 +0800
Message-ID: <CAEUhbmU+cZCVqupiCXmLc2V65O4h2TcNbhsrh5Mx6Y99DfPAUw@mail.gmail.com>
Subject: Re: [PATCH] meson: drop keymaps symlink
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b41;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb41.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Mon, Aug 24, 2020 at 3:42 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> We are building the keymaps by default now.  Drop the keymaps symlink
> so the generated files are actually written to the build tree not the
> source tree.
>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  configure | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/configure b/configure
> index 67832e3bab76..428fa33be140 100755
> --- a/configure
> +++ b/configure
> @@ -8119,7 +8119,7 @@ DIRS="$DIRS roms/seabios"
>  LINKS="Makefile"
>  LINKS="$LINKS tests/tcg/lm32/Makefile"
>  LINKS="$LINKS tests/tcg/Makefile.target"
> -LINKS="$LINKS pc-bios/optionrom/Makefile pc-bios/keymaps"
> +LINKS="$LINKS pc-bios/optionrom/Makefile"
>  LINKS="$LINKS pc-bios/s390-ccw/Makefile"
>  LINKS="$LINKS roms/seabios/Makefile"
>  LINKS="$LINKS pc-bios/qemu-icon.bmp"

This fixes the annoying pc-bios/keymaps/* file changes every time
after a new build. Thanks!

Tested-by: Bin Meng <bin.meng@windriver.com>

Regards,
Bin

