Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D7251328C
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 13:33:59 +0200 (CEST)
Received: from localhost ([::1]:51616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk2PG-0005iW-RT
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 07:33:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk1bq-0003LV-B5
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 06:42:54 -0400
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e]:44863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk1bo-00016w-Qn
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 06:42:54 -0400
Received: by mail-yb1-xb2e.google.com with SMTP id e12so8204177ybc.11
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 03:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XYZSHUBHvQx5MSum1c+TBChx9UAsxyxU1MuxeOkPMb0=;
 b=NpbmPzvD+4AI2celowuCpUBxzjXzTY8q+1HgNkBj/EMdhPefVjTxKV3CwpIksh1SwZ
 9sNBtxQF09s4kPlFKAP66MMLQ0q4EdroJQPNfseRXP4QCsl47xIeCFX+t1ycUD+QHCbD
 bdomT1OqI9lL2Okv/yKnxqJaum73KraXpN1PTmExr0u3zMtUt0Ep10TuqpP5Lx4Xjefb
 ojXE6vjB57wu3YCkdoQJqQqMSOy/p4n3xaG4osF0gqLBitQiSXadGQcPpvtyxT5/xAEo
 eMfTEBXOHw6zJ/D42Uv6Jh/CLQ1Jk1mXOSN8LLsg9dR6Stca0712gHH5O7VfEOHtDB4A
 T6fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XYZSHUBHvQx5MSum1c+TBChx9UAsxyxU1MuxeOkPMb0=;
 b=SS0V5HqNO+tOQLbYnfKFmWi2OIrOhw2ODXdGAE0jpA8uxFftXsl8/DqzYu1Tv3+Fk4
 QeeWv4hli7JslXuol4wxgmqsW+3rFRhdCQvRIMOYYDW9x00x5bevXl/noGDgkLXXY950
 ACVKoaII7NB5VF/Etv3rauxLu/EJT1/LlXJwCr0p0/MGLVaHSjpQgnJhT67o8LzOiQSw
 WC4vwT+yOESj2b6RGngqs231Md+qhIQ7URwegEnB8pgf9i8r2WBZI7+pBJcUlFr4qilf
 rmgxN8LV0LvPx+vVyHeIMtf+t/F8RV38MxJ29pVlaOe6UWXxqiKTTubqhAznWgrQZW/r
 Hj4Q==
X-Gm-Message-State: AOAM532sHuY2f3k/W/9l2couq1cIc8sQ5+be2VD8+D6FpuhihabUYieb
 lVFt7igbKOP9+fe1PBIKtjSrHLkE2rl7ugNlZiUFLw==
X-Google-Smtp-Source: ABdhPJwMXaLSZLLtK+VVKYASQrh7xzdZHa9M2dC1HQE+5cc89WLqnZk7oNtS2MlA4+hes7EIxRUdzc48FHZ/w5FvUmw=
X-Received: by 2002:a05:6902:34f:b0:645:463a:b824 with SMTP id
 e15-20020a056902034f00b00645463ab824mr29693229ybs.39.1651142571968; Thu, 28
 Apr 2022 03:42:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220426163043.100432-1-richard.henderson@linaro.org>
 <20220426163043.100432-41-richard.henderson@linaro.org>
In-Reply-To: <20220426163043.100432-41-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Apr 2022 11:42:40 +0100
Message-ID: <CAFEAcA_vgP5=8D3azMAdvtwvNFk2-51A6ywgPkBdj+MJMA8=6Q@mail.gmail.com>
Subject: Re: [PATCH 40/47] target/arm: Use tcg_constant in do_clast_scalar
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2e.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 26 Apr 2022 at 18:07, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-sve.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

