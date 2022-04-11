Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 837154FC19E
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Apr 2022 17:54:36 +0200 (CEST)
Received: from localhost ([::1]:59480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndwN9-0006Ek-Lf
	for lists+qemu-devel@lfdr.de; Mon, 11 Apr 2022 11:54:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ndwJU-0002ug-1s
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 11:50:48 -0400
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134]:33072)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ndwJS-000210-KF
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 11:50:47 -0400
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-2eba37104a2so171287257b3.0
 for <qemu-devel@nongnu.org>; Mon, 11 Apr 2022 08:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xvMCgLopz9hgn5mCf4EbPeNTyc4yH1NBo9hEwUpSLFk=;
 b=zsVnawbd6e99sEJC6/laapFuvYXUFmG5ObtibKhCkcpW6RAE5V2btCBx0nCTqhgMxZ
 X2iAaUiLSPEDBpmunr+hicgAWdSNQKktkA8kQdICdM2+WrArSIgAN/yGNIhuC5oTMwhS
 fXl3Vvgy/O/4apyd/Nvum8Pdi1zUMFUrBUh/MBwC29F5gbx2lDPeDb3d4JtwPzK3Q4F4
 Mwyz+a/qeoKSPyDQrDP+MNGz0ewZnGrcu/zfkdr6FCQQdYUY5Wvm2BYbP6BP53tBfvgU
 KYTSY/NQvpzyXOlOP1bzYO1kk8XIzPV9SM+w1Oeh8cutT3C4lXa4QCMdpLqX8Z7nRGv9
 tg3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xvMCgLopz9hgn5mCf4EbPeNTyc4yH1NBo9hEwUpSLFk=;
 b=tYRccOTZ2pTQFkLZNLAz5gJhJ/kk0WCAIMPYQk2BTgetqY3Rtp57X7R08/7WzhsgPS
 PHy+zDAYBHuT/fsCwUtfKEt7pjs+DEG9CJ1XD8hsPGhTl022Qm2iaKvQ59EZ39zmPTt/
 SaeDIJ8zDYBIShDGXntzLMV9sFDUdkW/HI1DsXDd2wsQSJ0ChCR3yDnFzoJboDfNE38W
 MH4iNMQSOAOiWgjWefT6BKg25TW5wUhZuIgs9GpPS4uNOgL9JkIO/0nHZIXHi6JqYFWy
 /ASSukCNeUn5SS7+zgU3G3H8qz6i3b3R/2hi2uNicNN47RMxKAQWNsIiALTJKd0f+peY
 q/1w==
X-Gm-Message-State: AOAM531NqlbKpeyeZ31Mk4uRCI4Ofeh/CqpnAicnJfbxHnESRzTdRMZl
 whEqAd32HRRKqPicBSBpLPcbzqvSFFXDNrXzPLYLDw==
X-Google-Smtp-Source: ABdhPJzku4OdGE8FsFXE/vcc+uyaUP/PFiA+7TsYDflkyt9dPCxDVpGbiUxwYgEsmSSOzweE/jIWH1mSDnWVxp1a3IQ=
X-Received: by 2002:a81:106:0:b0:2d0:e682:8a7a with SMTP id
 6-20020a810106000000b002d0e6828a7amr27094564ywb.257.1649692245502; Mon, 11
 Apr 2022 08:50:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220409000742.293691-1-richard.henderson@linaro.org>
 <20220409000742.293691-13-richard.henderson@linaro.org>
In-Reply-To: <20220409000742.293691-13-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 Apr 2022 16:50:34 +0100
Message-ID: <CAFEAcA-KoHQym3nP969X-d+e4oNBTz=JdtNRoH_FrZUWinbx1w@mail.gmail.com>
Subject: Re: [PATCH 12/16] target/arm: Enable SCR and HCR bits for RAS
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1134.google.com
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

On Sat, 9 Apr 2022 at 01:11, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Enable writes to the TERR and TEA bits when RAS is enabled.
> These bits are otherwise RES0.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper.c | 9 +++++++++
>  1 file changed, 9 insertions(+)


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

