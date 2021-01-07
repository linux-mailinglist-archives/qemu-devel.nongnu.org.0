Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 790E82ED66C
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 19:10:14 +0100 (CET)
Received: from localhost ([::1]:56690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxZjh-0004Mv-Ik
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 13:10:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxZij-0003tZ-88
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 13:09:13 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:39322)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxZig-0007EN-Du
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 13:09:11 -0500
Received: by mail-ej1-x62d.google.com with SMTP id n26so10959502eju.6
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 10:09:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cIIuTgNRyKID9yjQ32FWSWEzEkIIk33qEaSqd01OmUU=;
 b=HJrp2Itg3uW05Z3J3Du0VXfM/BUEohZnDkd3sNinpDWcPro3HIJQ5F7rtX/i4TSsbC
 NXElXoAXhpDrj9JykkiSUd5k58ZNwBpyayuzUwtXwI3HcWiyGEmaDJEoNWLIv+zb3pol
 X2aLsO1IHSw9dXz9h4ve5qVSftCTBGaoYRg+HthOcwIkV8ZzoZhL+kRxkpjJYZGSLyDU
 DF7NFkx81lKhBHc88xR3Xyoo5+bK529te5YfJ4W+0z9aIfSmiF3sBNSAd8D3Tfql9tv0
 50nPsItI3KYi1W9DWLC6kwDmPM0D9xH/l3VBTf1/i//d+r0iiUPEtwN06dqWwaiMsJhq
 gfoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cIIuTgNRyKID9yjQ32FWSWEzEkIIk33qEaSqd01OmUU=;
 b=rN47lcjisAo11ul2YvfCnQbqVyy+eJgW7Gaq0ESYAwMb17hgDdNP8Yg5+XppIPx/8F
 B+CLppgQPl8UVXDTFS9Eryh6IErqZ9Z3EqMURlb655EH+bY350LUpi7sA3LjVie3IR/O
 TDwdnC3NbNv7G61/80+YuH3V53J7I7J0sDmE4SF8DVLtdSJRqRgrV5BpiTgV6kkiid7+
 foWPoGy7WLInh5HL435L2Bet9WCktSEmhhpxhMP3D8xtYlSo4Uqn21pflXZYm4EADqpN
 238jXQ/OK+3hmkroJNwK+jn3woFkGGdqwPhDTYSRqfd+l9kCWdM9Q2/c5ftYs40CFTLo
 oJVA==
X-Gm-Message-State: AOAM532kGVds1eviUZFqlEAdDCImpGgR6i2E4uML7mfTzatpst8aiVVG
 ZSIXA+qLqrK0rXPxYvSRpKjEGw6XcvnU8vD5/nSldQ==
X-Google-Smtp-Source: ABdhPJzom+hUbTQh6vW0LzVPVc8yJqNxhzQpwMjJMIj2C9gI70j2jIBfCc2DLlNMn0qiuGl+9ltwOPCEOTmYFG14k+8=
X-Received: by 2002:a17:906:3d4a:: with SMTP id
 q10mr7213419ejf.85.1610042948755; 
 Thu, 07 Jan 2021 10:09:08 -0800 (PST)
MIME-Version: 1.0
References: <20201223060204.576856-1-richard.henderson@linaro.org>
 <20201223060204.576856-19-richard.henderson@linaro.org>
In-Reply-To: <20201223060204.576856-19-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Jan 2021 18:08:57 +0000
Message-ID: <CAFEAcA8UDVsG=5EgwJ3007OXei+BXoJ8pb5y+HNW_+W6ZQk7MA@mail.gmail.com>
Subject: Re: [PATCH 18/22] tcg/riscv: Convert to tcg-target-conset.h
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62d.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 23 Dec 2020 at 06:25, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/riscv/tcg-target-conset.h | 25 +++++++++++
>  tcg/riscv/tcg-target.h        |  1 +
>  tcg/riscv/tcg-target.c.inc    | 83 ++++++++++-------------------------
>  3 files changed, 49 insertions(+), 60 deletions(-)
>  create mode 100644 tcg/riscv/tcg-target-conset.h
>
> diff --git a/tcg/riscv/tcg-target-conset.h b/tcg/riscv/tcg-target-conset.h
> new file mode 100644
> index 0000000000..116dd75db2
> --- /dev/null
> +++ b/tcg/riscv/tcg-target-conset.h
> @@ -0,0 +1,25 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * RISC-V target-specific constaint sets.

"constraint"

> + * Copyright (c) 2020 Linaro
> + */
> +

(Also "conset.h" looks really like a typo for "const.h" which
is kinda confusing :-))
-- PMM

