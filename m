Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C42CD513281
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 13:32:32 +0200 (CEST)
Received: from localhost ([::1]:47794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk2Np-0002xE-PW
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 07:32:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk1gK-0005vS-V5
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 06:47:34 -0400
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a]:38147)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk1gJ-0001wx-Hx
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 06:47:32 -0400
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-2f7d7e3b5bfso48256637b3.5
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 03:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=blsmPiQ4ekaunwzbPPrACXghB2YeBqJ/CATsw0osXqI=;
 b=ZiWlzYE65o+Gxc857qTm+pZ8Vm/Itbn+yZXpEwsETdSZz1mh64wXcJmOgkBO0/DOXZ
 W5OTk9FFMf28zgoIRtX8JR5XttnRw+yat+LGrj54NyuSbzOkPS07GQ7aR5QwPesfEw9A
 o17jCbTLytdkrxdyeopymO5roKU2If5YBbPQA+e68DmDdJEaqT09Tq9GQjfwrg1a23gF
 Qrjw1SrMnEA1KAfW85zUyiQU+ULpdoNFCu0nO1owgyG2fDXTJQn+NTQL3C4Z/Lb9Yr8q
 IXjroiXI3Y3ETKww1cpMgZP7oke9Q2vuNkI6rHlSIju+2adHZCu4/2M0gs3H1yoJpnvz
 UrAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=blsmPiQ4ekaunwzbPPrACXghB2YeBqJ/CATsw0osXqI=;
 b=1Jbf21gOJew7zaQLOPjUZs6TrvWvrrlq+3UzNpLdQPtHGOalAtr0tonojDYzjl8USS
 9smVLQp2VzOykF+JQcdJ2Bw5S8zbXp5MFlJKGnwrAta1naE2blKZyL6LNMAj6riV60Nm
 z+oweYFiSPjidb/M5Xi0nRFwn6B1noYFfEIbzyJeZspih4AMJ+RlrNB2VA1FH6829EOi
 xAiqadHulHCJyXVZeZrSP1ATT6V7gGS9Q2YkcKj6W72uYQ/j1SyKdf/MyFK0mx/pUH4+
 8s5XmHoefJJKnEHhdQfq5162z5XZGM6OjSatRoIR+Mv9YkFamvpmUR20iQomD/Us5/8b
 V4LA==
X-Gm-Message-State: AOAM530bBpmurmyX7GWLGul+SEafmvg7gGrQXN7myObLRz1xM1kdxI2h
 bIR4FeFsN9qV/fBU5GAmyWpDQ4vgW9bOF7/CgFZYag==
X-Google-Smtp-Source: ABdhPJyFPkP1AlcSj/48sr0rxa4SdGUylV8Cy1jc5vY0eN5AxsAI/pqSiDpqrJuGgG4Fuv1RJSXRKYwbHMwc8fBPVZY=
X-Received: by 2002:a0d:db4a:0:b0:2f8:3968:e808 with SMTP id
 d71-20020a0ddb4a000000b002f83968e808mr9377905ywe.455.1651142850734; Thu, 28
 Apr 2022 03:47:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220426163043.100432-1-richard.henderson@linaro.org>
 <20220426163043.100432-44-richard.henderson@linaro.org>
In-Reply-To: <20220426163043.100432-44-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Apr 2022 11:47:19 +0100
Message-ID: <CAFEAcA8XUkQ9HSXqTA08b4Jd+yg3h2VAAABh3gDxK=jXq-ar8A@mail.gmail.com>
Subject: Re: [PATCH 43/47] target/arm: Use tcg_constant in SUBR
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112a.google.com
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

On Tue, 26 Apr 2022 at 18:12, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-sve.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

