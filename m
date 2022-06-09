Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7AFC5452DB
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 19:23:11 +0200 (CEST)
Received: from localhost ([::1]:59596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzLsE-0006DV-Jj
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 13:23:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzKZb-0005Qb-6s
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 11:59:51 -0400
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c]:41715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzKZY-0006ti-NH
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 11:59:50 -0400
Received: by mail-yb1-xb2c.google.com with SMTP id e184so42500669ybf.8
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 08:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=h0YcuJxgCeGIzDv6jeVaiLcG8NuF46NXLSOxrbEXG3Y=;
 b=Xr3srn0PkrdHhNV5smTVKd2qTRGbtf8iTuEjkPMzS5hMM7FktpWtE9zgHiQDAg6Kuc
 yq8HsyWUcMW3T5R+OruV2oGnot6T8XcwI/1HVJ5gnartykywKN0zVwkLwQ6Lt8JK0FzF
 ef5YG089ipumaqFsE/2ykZrgbPpPF4O/ZpEeDZ1Lb3W2u+/INh0+40LxKkfEQILi20K+
 s74SitNhQdiAOd5FTvEyj05P/MNW4Hv9JVO1+Ee2Be8qKHeVayKr7hY5wpZqVGL9egIy
 neNX94cSH/GYElkWQNwNoQ7ExzTWElbSpLbgejIvQykbr0oRjc5gmBd9HKe6eB5qaps3
 SnyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h0YcuJxgCeGIzDv6jeVaiLcG8NuF46NXLSOxrbEXG3Y=;
 b=SisL4Z7VP9mmJpYu2vIJDGn16QV/xhPS0RbjXsvM2hu6DyW2N6bfjv+0iWucOIfn1Z
 gtyGO6D251y0PV2SKDPww4amK+KPKe4Lnz6d2jpjhJoipMZqAcP//Gbl5UOpGiDxRbgf
 WxLAWVN3oS+aFRqXonMQ8cIz5mzUzSooO+aNsYkfGwVWY2/1KD3Ad8PEWPvT0qpYC0Zs
 DKq+8I+uT2fkKG5RV8wVmhFUsjyUfbtkQAAgul4rbKHXUWKzJt6KMKXZYSE67XQVMZra
 vo64VdOvi/1o1ExCFwpfbDIh7OiQPEfxNgHQqcIzuEVhSZSIZ+/wUHWxWDvZUGpb0ApZ
 Qc4g==
X-Gm-Message-State: AOAM531o2AA/RBUeRMz/hTSxaNWu/MVSNvFqYEU2gyEaBGMjy5nMztoI
 yYO659hru/FpGYze+HYI454f20Hz8Co0hhb0MRWQBvFqh+8=
X-Google-Smtp-Source: ABdhPJwUzKreQoVgLAY8wIGJUVzX07CdN06aLhrFXjEJHpf77YcxC5hfEKVvcCnVQr9zMuaEOPQijFblGwIV0Ge4ycc=
X-Received: by 2002:a25:47d4:0:b0:65d:510e:c8de with SMTP id
 u203-20020a2547d4000000b0065d510ec8demr40514235yba.39.1654790387730; Thu, 09
 Jun 2022 08:59:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220607024734.541321-1-richard.henderson@linaro.org>
 <20220607024734.541321-4-richard.henderson@linaro.org>
In-Reply-To: <20220607024734.541321-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jun 2022 16:59:37 +0100
Message-ID: <CAFEAcA-02v3Mcz7Ozubeekanmus2GOj8bNVH7MfVQ78YfN1_tw@mail.gmail.com>
Subject: Re: [PATCH v2 03/25] target/arm: Move fp access syndrome adjust out
 of raise_exception
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2c.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 7 Jun 2022 at 03:50, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Create helper_exception_advsimdfp_access to handle both
> the routing and the syndrome contents, depending on the
> eventual target EL and mode.

Bit awkward to have "TGE means go to EL2, not EL1" in two places
now, but I'm going to assume that either (a) this gets cleaned up
later in the series or (b) that it's the least-worst option, so

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

