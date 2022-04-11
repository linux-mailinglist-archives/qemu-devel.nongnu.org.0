Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA514FBC3E
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Apr 2022 14:37:48 +0200 (CEST)
Received: from localhost ([::1]:38110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndtIh-0006gi-Bt
	for lists+qemu-devel@lfdr.de; Mon, 11 Apr 2022 08:37:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ndtFP-0004Pb-13
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 08:34:23 -0400
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30]:41894)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ndtFM-0005U9-An
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 08:34:22 -0400
Received: by mail-yb1-xb30.google.com with SMTP id e71so12651418ybf.8
 for <qemu-devel@nongnu.org>; Mon, 11 Apr 2022 05:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2SzjeWyGNgo+UFU5clrJfgD018XUH1VS6uMg7Z0Uip8=;
 b=WJcFrO0gHcayjre4xzB3eiFuYfg8TCFfbR97tqtZaEEFVtN9o5FSRlytdrdf7p6rZ4
 wRSbEdMe0iKqmHxItyoRVMfWJRPG5hmgJb6Ig0mDkh8HDwHodQM4xcgBQeviDMOBi2DV
 FV8wZQFpZ6KIY7HRaEcEtmhsYqhVHYSwbRCtrO/12niOTeKKoQBSUo12GvbDUDoUl+IB
 W6ApH28Gbct5q1tGwQCOFyXpv2ZYKrwzqNh/jlHl794UUGabf/Vz1mdBhiBnvakk/Ds7
 v9ZEGOLflgmd48r1xDV/Fp2t98RdtYfu2kT1/TuuloN4gULlWOPquu2x3brgOp8UCWEL
 cZXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2SzjeWyGNgo+UFU5clrJfgD018XUH1VS6uMg7Z0Uip8=;
 b=YQ4i14psoZfIRrMwvgnZA0bfD4yDu5+ijVTuFhap2zkQ2dqszs3ET/OR0zJIxoq7EK
 s94srYI6buMt6eObUoaTqMvT6zxaXW/q1fiQFNI2qJTKP+ip7eQyeXsmQrzn3uOQITXR
 gqVSOQHHOKF0f3rhNRuK0ZSQBKWeVZayTTWdrT0c68sKSXZnGa6GkmMrxBFMltzv8AXZ
 MI9MOnIVa9jRYrP32BYebsL1aUstZ+IABUr1nFeU/dyZZDi9AzjbThpWWPGuG6TXtYRs
 3bIQs2HaCl/0t7KvZuaIUbECQFaugWP2KHXv+SsOEtamqCKSlm3Jj1wtwwFxU8P9WRG1
 zurA==
X-Gm-Message-State: AOAM531X8LQUaAuBh5+suTpxuBf95Bu0Ptj8OuHiBo7iXqwzPXGy7ePV
 prRgbx0qd7fJn9NTbLK7LkFRHlLH55pzVUMP2Toz9A==
X-Google-Smtp-Source: ABdhPJw1HyZWcBQuXZMwKYg0ajGGHbyhc9jGV+YZ8QoGrTX8borW8DxPxWzUtWulvZtw2Fj4H68OZD3vy456r5qB814=
X-Received: by 2002:a25:ae54:0:b0:641:1aaf:c89 with SMTP id
 g20-20020a25ae54000000b006411aaf0c89mr7993375ybe.479.1649680459443; Mon, 11
 Apr 2022 05:34:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220409000742.293691-1-richard.henderson@linaro.org>
 <20220409000742.293691-3-richard.henderson@linaro.org>
In-Reply-To: <20220409000742.293691-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 Apr 2022 13:34:08 +0100
Message-ID: <CAFEAcA8-THDxrBoo3wB0OPEz_8Zu_xjs4+xTXQ2+FHzJaS60CA@mail.gmail.com>
Subject: Re: [PATCH 02/16] target/arm: Adjust definition of CONTEXTIDR_EL2
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb30.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Sat, 9 Apr 2022 at 01:09, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This register is present for either VHE or Debugv8p2, and is
> RES0 from EL3 when EL2 is not present.  Move the definition
> out of vhe_reginfo and provide a fallback for missing EL2.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper.c | 25 +++++++++++++++++++++----
>  1 file changed, 21 insertions(+), 4 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

