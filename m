Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9985C355876
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 17:49:07 +0200 (CEST)
Received: from localhost ([::1]:46820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTnww-0006Vi-OA
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 11:49:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lTnun-0005gq-K6
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 11:46:53 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:40854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lTnul-00018l-PS
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 11:46:53 -0400
Received: by mail-ed1-x536.google.com with SMTP id w23so5905047edx.7
 for <qemu-devel@nongnu.org>; Tue, 06 Apr 2021 08:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=F9tY0mQ4Z7Z6ZurznALx8Kcqrgjc4DTOqEujl/YdLpw=;
 b=kg993oyeyzn8r4gVg0mJa7w5ul4NeLwos74IPr5ugjDnn0uk4yz83K4l9eKBz2A2OI
 xuczizpIOOt2fzQm5X9oOnTEqTdu7QbrJtl0Y4n243uXs8jZ5SW65/r+PUxZ/nwcaud0
 D/uAAJifYhIHfkpkLKNFUEu1ayEE2ImYqmycnNkmS8Dk5wJw5UOl0rSrjNWrMTcDW+GM
 frnlknWej3QTknIb4AvCAv4JNQxPHH7FpY+pm9DUf5ce6vITEfcpRNHmqVA9kFhMRXsx
 TUOrj0O+aPmLFuXjUTtd74vPhG6HtSeyYm8CJou3MkAyj+aGKWA678km0VoAdg5P2Kgq
 ve8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=F9tY0mQ4Z7Z6ZurznALx8Kcqrgjc4DTOqEujl/YdLpw=;
 b=Fv8suie5jBCmeSwx4b8Y/gu5IRBt3jSSsCk/8C5P4T2IKnNAIxAaiVR6qLxSgZf3jy
 2T3G0WH2G20D05lltDctlaDnTxgvXwtasZdjWmwimnfKTEQa5O+vGStsVuo80Mds9kbx
 5yZ4sj4i3Eii+NlRjLlbkbWIhV97mz7BETE6Q+xXBaLeqcdfUwQ13ozmVLivsToogjVM
 hgc5Q6ZhPvRXZbA8/Z5X4Dx8tbeF8MkXfOQHQ4f1YrdE5+AkJZu3iWyLO65PPGldx3JO
 SRbCGvlEpfvEdUPnaGSJhWYiIlHCQMmj9MsrLG4zuHu65+4WGJxupH55XKsL6Z0VWlon
 u7JA==
X-Gm-Message-State: AOAM530HsmihzCBvC8ya4AGdMu+ewum8Qv3JhiO42mKhOT71ItZ3B2ln
 wXvba9bhNDnCw+iVd19B8EXN+r8fMpanymOp7wQOZw==
X-Google-Smtp-Source: ABdhPJzNTuWoxso7xlBWbosKq6C9TuHwkSEjSXS2imNdhr0tAI9xIQbbfSg8TajGFIaRQICm5NrMj+L1IpV6KPUayPE=
X-Received: by 2002:a05:6402:4244:: with SMTP id
 g4mr38501215edb.204.1617724009965; 
 Tue, 06 Apr 2021 08:46:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210406132344.21476-1-Filip.Vidojevic@Syrmia.com>
In-Reply-To: <20210406132344.21476-1-Filip.Vidojevic@Syrmia.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 6 Apr 2021 15:46:11 +0000
Message-ID: <CAFEAcA_ZVtmfG9RRF35TQ7MiwACBBec4Tfj6eQmcPgSo4XJy6g@mail.gmail.com>
Subject: Re: [PATCH] Revert "target/mips: Deprecate nanoMIPS ISA"
To: Filip Vidojevic <Filip.Vidojevic@syrmia.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paul Burton <paulburton@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 6 Apr 2021 at 15:53, Filip Vidojevic <Filip.Vidojevic@syrmia.com> wrote:
>
> NanoMIPS ISA is supported again, since mediaTek is taking over
> nanoMIPS toolchain development (confirmed at
> https://www.spinics.net/linux/fedora/libvir/msg217107.html).
>
> New release of the toolchain can be found at
> (https://github.com/MediaTek-Labs/nanomips-gnu-toolchain/releases/tag/nanoMIPS-2021.02-01).
>
> Reverting deprecation of nanoMIPS ISA requires following changes:
>         MAINTAINERS: remove nanoMIPS ISA from orphaned ISAs
>         deprecated.rst: remove nanoMIPS ISA from deprecated ISAs
>
> Signed-off-by: Filip Vidojevic <Filip.Vidojevic@Syrmia.com>
> ---
>  MAINTAINERS                |   4 -
>  docs/system/deprecated.rst | 251 ++++++++++++++++++++++++++++++++++---
>  2 files changed, 235 insertions(+), 20 deletions(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 69003cdc3c..498dbf0ae4 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -254,10 +254,6 @@ F: include/hw/timer/mips_gictimer.h
>  F: tests/tcg/mips/
>  K: ^Subject:.*(?i)mips
>
> -MIPS TCG CPUs (nanoMIPS ISA)
> -S: Orphan
> -F: disas/nanomips.*
> -
>  Moxie TCG CPUs
>  M: Anthony Green <green@moxielogic.com>
>  S: Maintained
> diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
> index 80cae86252..88b35a43da 100644
> --- a/docs/system/deprecated.rst
> +++ b/docs/system/deprecated.rst
> @@ -228,12 +228,20 @@ to build binaries for it.
>  ``Icelake-Client`` CPU Models are deprecated. Use ``Icelake-Server`` CPU
>  Models instead.
>
> -MIPS ``I7200`` CPU Model (since 5.2)
> -''''''''''''''''''''''''''''''''''''
> +System emulator devices
> +-----------------------
> +
> +``ide-drive`` (since 4.2)
> +'''''''''''''''''''''''''
> +
> +The 'ide-drive' device is deprecated. Users should use 'ide-hd' or
> +'ide-cd' as appropriate to get an IDE hard disk or CD-ROM as needed.

[etc]

Something has gone wrong with your reversion of the changes to
deprecated.rst -- they should not be inserting 235 lines unrelated
to MIPS...

thanks
-- PMM

