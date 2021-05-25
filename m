Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B954039010D
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 14:35:08 +0200 (CEST)
Received: from localhost ([::1]:33548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llWH5-0004Qa-Jn
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 08:35:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llWFo-0003jv-6R
 for qemu-devel@nongnu.org; Tue, 25 May 2021 08:33:48 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:39673)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llWFm-00037Q-Hw
 for qemu-devel@nongnu.org; Tue, 25 May 2021 08:33:47 -0400
Received: by mail-ed1-x533.google.com with SMTP id h16so35950914edr.6
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 05:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mmmwMRaz9Wf79lG7wsU2BHRoMM0Aqs887we5fHHQH0s=;
 b=FpWvb6gDbGGU+tF0zuV/hN6y89SY0P8r9tmwFa7g75vQNTqkKTCQjuD7FtKXzZoEFn
 yaRQG0q2ANwLnHGEu6pF5G+Kv+ktctZ8gnmglX/wevb+uYC3dwYl9l++zfrFDrZmhUex
 vbi2f4MIGyH1/seZViyPsWfbGVbX1oGKgik9rFSoMxIIUBVokI/dtrLkGpzr3U+bJWfK
 3tNAU4fRxschLrOUUnEPtOQY0ABsmMcoPs9uUdZZZ0evv0LuhBtoXwsopQgfLUu16MKw
 afmn9VVoZ21Q1R3G+S8u5YdhMY2x8/Ue5XPYuYBJ3+i4Tacwe20okw3RTHQbs4TtqbWQ
 PlZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mmmwMRaz9Wf79lG7wsU2BHRoMM0Aqs887we5fHHQH0s=;
 b=aZEChadBSH6bOb8eBqFrkSfpGwDT+UeNe40nUFNlEGRyfJGOF/AGLHBT3qCFx1X+tw
 qa4ai8KeztAzPoWO+kxVsOKCYsgIRa2CZDzDFKdPFTCW6r0ur07zY0bxvJVWA/sliGWj
 LToc4XpvTP8HJ1MyjGc9Ju2Kxnqid99OaQr27yRnB+RnoMpMUlhifmKs+lyZJR7y4qN+
 jYTsPT90TA3ZbE+8bsQgAcaYDORo66yP9RdgCOwZyDFccZd3XncuwazAR2zHwbccSVJy
 Bo8VYCGMXKkaGl4J4C+i1WodSUveBC+YsOi84ZKgjCmjQLcACEoXXNLV0o7Et1TltDxH
 es0w==
X-Gm-Message-State: AOAM532DWOyDSALwMoM0dY3WTwrQ3hADw0+gi97IL+0xmljYcNNzQOfx
 Luo00yDWtc/6dmiIXaw+sSwcuHtuttAvWavJG6Mphg==
X-Google-Smtp-Source: ABdhPJz7KxWHcbDAxN6azNXss4GOvpkWj5MsE1NOdTFpKXkKc/JtZrLhIlsexlQRMPG0LIPVe+d1REJVG29OqGXRglM=
X-Received: by 2002:a05:6402:3548:: with SMTP id
 f8mr30778409edd.251.1621946024976; 
 Tue, 25 May 2021 05:33:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210525010358.152808-1-richard.henderson@linaro.org>
In-Reply-To: <20210525010358.152808-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 May 2021 13:33:21 +0100
Message-ID: <CAFEAcA-t3bCVnzDnUZzvYTf3Wi+GHO6Q3SHDDHybtJ8s6eW4vw@mail.gmail.com>
Subject: Re: [PATCH v7 00/92] target/arm: Implement SVE2
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 25 May 2021 at 02:07, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Changes for v7:
>   * Incorporate patch review, some of which broke out new patches.
>   * Recover 4 patches which somehow got dropped during the v6 rebase.
>     This should have been caught by risu testing, but I must have
>     thought the rebase trivial enough to skip that step.  Oops.
>
> The patches lacking r-b are:
>
>  06-target-arm-Implement-SVE2-saturating-rounding-bit.patch
>  48-target-arm-Use-correct-output-type-for-gvec_sdot_.patch
>  60-target-arm-Implement-SVE2-multiply-add-long-index.patch
>  61-target-arm-Implement-SVE2-integer-multiply-long-i.patch
>  62-target-arm-Implement-SVE2-complex-integer-multipl.patch
>  63-target-arm-Implement-SVE2-complex-integer-dot-pro.patch
>  64-target-arm-Macroize-helper_gvec_-s-u-dot_-b-h.patch
>  65-target-arm-Macroize-helper_gvec_-s-u-dot_idx_-b-h.patch
>  75-target-arm-Implement-SVE2-FLOGB.patch
>  76-target-arm-Share-table-of-sve-load-functions.patch
>  77-target-arm-Tidy-do_ldrq.patch
>  81-target-arm-Move-endian-adjustment-macros-to-vec_i.patch
>  86-target-arm-Fix-decode-for-VDOT-indexed.patch
>  87-target-arm-Split-out-do_neon_ddda.patch
>  92-target-arm-Enable-SVE2-and-related-extensions.patch
>

I've reviewed the patches that were missing review and applied
the whole thing to target-arm.next; thanks.

-- PMM

