Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 585953CC9E4
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Jul 2021 18:37:16 +0200 (CEST)
Received: from localhost ([::1]:45178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m59mz-0003Y0-Uy
	for lists+qemu-devel@lfdr.de; Sun, 18 Jul 2021 12:37:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m59mC-0002rT-VD
 for qemu-devel@nongnu.org; Sun, 18 Jul 2021 12:36:25 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:36441)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m59mB-0001zq-6A
 for qemu-devel@nongnu.org; Sun, 18 Jul 2021 12:36:24 -0400
Received: by mail-ej1-x632.google.com with SMTP id nd37so24064355ejc.3
 for <qemu-devel@nongnu.org>; Sun, 18 Jul 2021 09:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=usNqVtrsFMlOUtUcg2N5ct69mKU+z5plHisZphscZ+c=;
 b=IXDk8tJ2ee9kUeB0m7gB4qR2qWrnOgj+0dE+T5qosdXFuVW1NJk23W0MZI65Zpgw59
 YLZaJgF6rmJHJP8fUKnkUyoOvcC/CzyuNSZ49/fc1iXa1wiu+ncSKw9ls8w1ZisziN/j
 7CNgVrd9yusAttiQhFyLikmMCtsYt7/3XQskOnnSROpzahDZ9UnWWc3+B2K+GZw0Ah3A
 cOCHVklK0hXtsT1rgFmN7qxBH3Fdvc1HBqPE4o3C7vEcCaH/l3mTwNdNGh5QksCfeHz6
 fq872Q2X804FnR0lfwI4gIcMiV6MaNKkzJKiyjRJjeeskqs8vW1OT8oRU2Od2lpUMOtP
 UVHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=usNqVtrsFMlOUtUcg2N5ct69mKU+z5plHisZphscZ+c=;
 b=mWXjtNRUzGNiXxyMyhiyolRHEm0YUwNMh1eKjcJhMpa6GIWF2T3Mabzui4A9L7dKFI
 q/Vvz68FNNqAqhmZLPtJ/lUiTcKiLe03p9HcZwOFy/moo1OCHaj9kHPpuK4YtG9/w5RJ
 Kf0qbgnbTAPC1ervdyW6AwsIjsCVFGdEVan4tCsm5GCiz2DBgukMW2KTzOGhaDknfDiR
 /S+BIkTxcGp08feJiePLZIMKCM8w4PkMojpuvBINTlAtLpmeNUryXD+gaADoUKG815Fu
 rgIBWDeF6LVQHN24MEhxCw+aRNJIHwK6DbEcxRBHTG2lAKz2yxLUJkpizZ7E0Yg6TqWo
 5Waw==
X-Gm-Message-State: AOAM530X4SbX05Y5By74lbMsicUbOrqQVzhyEa6e0PU8jKAMxkYFBtyF
 azv7BGODOW22Z41kBRWZxkU5UfB1KZG5yqw7TvTRPPYNKss=
X-Google-Smtp-Source: ABdhPJzoQIYdiMkvuvUG3iWeXkXcPiYDPvYKPiVgmNgaW+bpeYl0I2HORDhY+l11e3mx3mXbb90e/eZ0A4rSPVFWOUs=
X-Received: by 2002:a17:907:3e02:: with SMTP id
 hp2mr23053283ejc.4.1626626181222; 
 Sun, 18 Jul 2021 09:36:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210718124621.13395-1-peter.maydell@linaro.org>
In-Reply-To: <20210718124621.13395-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 18 Jul 2021 17:35:40 +0100
Message-ID: <CAFEAcA9CZczXM4pYOiYkC+czHB8S97hBP9gE9PvNUqR+5cvDBA@mail.gmail.com>
Subject: Re: [PULL 00/12] target-arm queue
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 18 Jul 2021 at 13:46, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Last few changes before rc0: a few bug fixes, but mostly
> docs stuff.
>
> -- PMM
>
> The following changes since commit a97fca4ceb9d9b10aa8b582e817a5ee6c42ffbaf:
>
>   Merge remote-tracking branch 'remotes/mst/tags/for_upstream3' into staging (2021-07-16 16:34:42 +0100)
>
> are available in the Git repository at:
>
>   https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20210718
>
> for you to fetch changes up to 8fe612a183dec4c63afdc57537079bc742d024ca:
>
>   target/arm: Remove duplicate 'plus1' function from Neon and SVE decode (2021-07-18 10:59:47 +0100)
>
> ----------------------------------------------------------------
> target-arm queue:
>  * Remove duplicate 'plus1' function from Neon and SVE decode
>  * Fix offsets for TTBCR for big-endian hosts
>  * docs: fix copyright date
>  * docs: add license/version info to HTML footers
>  * docs: add an About section
>  * docs: document some more arm boards
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

