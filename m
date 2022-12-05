Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40DA8642A9C
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Dec 2022 15:46:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2Cjd-0006UV-7N; Mon, 05 Dec 2022 09:46:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p2Cjb-0006TS-4S
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 09:46:19 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p2CjZ-0001FC-KW
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 09:46:18 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 125-20020a1c0283000000b003d076ee89d6so9239405wmc.0
 for <qemu-devel@nongnu.org>; Mon, 05 Dec 2022 06:46:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XmeoPIkqvV0diBgCZk559jASci896UvKo7rOcv01GGo=;
 b=dJm+6JdEsJe4rZ39BfEuP+uiBRfOoIhPS2XaSo4+hGyG0UgB1X+NdvTR9ao77fKeZC
 Txcyui7hCG+a2Vx2zYCUsmmGtjuJ0WYQT74ZYvdXrbk1eKOCnUNBaQN6MMInv3raHHZn
 Wl6JgDvPDXpc5gCeJ6dAHsZAK1/Q3dFrF27WVVeaqL0x1QKF29LUXKYhnOXauT2rrbaB
 ZhlOODDl1UPs0yIx3JMqn+8RAP4v8dANrUsabaK6B8Rb0ZC8viHRNjP0qBufct3AfGEm
 woEPPOFQ1Y5YpIRr4sQ3NbWa2QyCBL1/IuUzciaz1l7p5acBzekFHQ/FCwF3W0CCrqLX
 nHdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XmeoPIkqvV0diBgCZk559jASci896UvKo7rOcv01GGo=;
 b=Tp0H+1MFO3R/orF/1UOOYvS8g2tDAefZohjoisK0rf+H6u/JRu6jqkO17kP2GIC7Oo
 NbAgmAb/WfpuRPKs9ri+cPG6jLdpxipORGlBS+bioyC8vTIjkr7g0pbS81Q/zxexyIUi
 vVZ2E9I19zOpZhu1tN9FkKOVXnrV0Bbjn4+hGTHtvhbTklClX4oeKKg5LTC9ajPSyP6c
 C94Pmg8kTnLMXSoZskDHwMa2mATGWxPnDapsqgJ/bQELceqAqadcdvmE7yJv+SyXdqT0
 7/wkS2Z3BxCZQGSW9wGVOibh8q/upoE14sXGGPL9cGLlDRwnmAKm1VYIB9BciDXDLHCT
 vlaw==
X-Gm-Message-State: ANoB5plR0aAapWZ5k6hxqoVefsWvoXuG40ac9G4UugHtINyhjhit24qN
 t+XTU2i+eATaNNZ+tsExRL2+At03rO5WpLcXROfUFV0dLvwKAQ==
X-Google-Smtp-Source: AA0mqf440zloVarx8vSKdPqDOyPNJu5HqDcByCVGFxSS+ctjh9R7u17uqWqyEittM69k1+lZCoROhSRW9kOUu5t6Esw=
X-Received: by 2002:a05:600c:5388:b0:3cf:37b1:e581 with SMTP id
 hg8-20020a05600c538800b003cf37b1e581mr58363349wmb.96.1670251575983; Mon, 05
 Dec 2022 06:46:15 -0800 (PST)
MIME-Version: 1.0
References: <20221127132112.300331-1-tobias.roehmel@rwth-aachen.de>
 <20221127132112.300331-8-tobias.roehmel@rwth-aachen.de>
In-Reply-To: <20221127132112.300331-8-tobias.roehmel@rwth-aachen.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 5 Dec 2022 14:46:03 +0000
Message-ID: <CAFEAcA9httOBVG-WAekW6OZHNAg9YDKyE99iDQ71-2tQnPCzMg@mail.gmail.com>
Subject: Re: [PATCH v5 7/7] target/arm: Add ARM Cortex-R52 CPU
To: tobias.roehmel@rwth-aachen.de
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Sun, 27 Nov 2022 at 13:21, <tobias.roehmel@rwth-aachen.de> wrote:
>
> From: Tobias R=C3=B6hmel <tobias.roehmel@rwth-aachen.de>
>
> All constants are taken from the ARM Cortex-R52 Processor TRM Revision: r=
1p3
>
> Signed-off-by: Tobias R=C3=B6hmel <tobias.roehmel@rwth-aachen.de>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

