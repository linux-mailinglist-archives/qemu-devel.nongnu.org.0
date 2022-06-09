Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 878B354533E
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 19:43:53 +0200 (CEST)
Received: from localhost ([::1]:58480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzMCG-0001oT-Iq
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 13:43:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzLAY-0001vJ-Mc
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 12:38:02 -0400
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d]:32947)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzLAX-0004im-8N
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 12:38:02 -0400
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-30fa61b1a83so241632477b3.0
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 09:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=A5AYgoCIZuweZdBNd7YVgGhy32HDQHHrgOjJeSFJHM8=;
 b=XpR7lSs0QNutGBZKV9812Nrp6furQLO7OxCOxCxRn6cSHrr+E0kptVyJIMSr5Olew4
 tPU8mUXPJdmsOpb3Oj7UYI9jxTNAfEYitJ6TBlpDmolQc6Z5Xf73hxjmsH/CosA8o6fC
 IoIh4ADiUOHXyWlghGlQPnrJ3cjMKpmUmfCM3NalU0Nv/ggDATWObpwTx9qJaYnh1bQe
 KHlF0cJXOy8SHrph+SXEDxDGXNEOjiCzjN37mw/8Xwqg3VaXufh5/WdpmkRsRqIWugyo
 cdC16hzX1sF38s++dVKJIRiNuSEMdrOV7MeK1N89HDu24Ndyhs1TkoREiHpHVuQn7Io1
 dTyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=A5AYgoCIZuweZdBNd7YVgGhy32HDQHHrgOjJeSFJHM8=;
 b=QVXSkgQnFD3GNouMtcmt0xGZG8ABpjaz6oTwAizIWmfLBdbXRMaXncHBtTNgIx7Icy
 G8uGasvCK8w+8k4pLpRIFsd8AD0MZ24UkdNSgL2qasz2y4HdE1niR9Np4Y6vKRbiuouc
 pDUgWMOW28RitZlh7CsDmc2Ji3pXfge/4V/PL4zR926XETsU9JCq9zJ1F6tvpsyX9u3s
 Tui75FpFiMvmLP7s8i51lrQt8Pszpn4Fq4QbLbD/ecQ5204gCU8E6pl0UowOWy/GCkKw
 BiAGdXaLYNrD63FMHDA9n1jeuNIRewApZxiQvkkkXuGW1/pUYNK/1PQfd98c+b1ZvOBk
 Vjzg==
X-Gm-Message-State: AOAM533i3KoBqUnkZj0WiRZSWaZHZGGDPFvxOzm7bHF6MsMyvGVyaQEu
 tTXqiGH8uCIsZxN5XxoOXHpqm7im4lLrS1oauWdQZw==
X-Google-Smtp-Source: ABdhPJwF8X4ACF7GuG6jIfaDEETsbjXrrILEa2fmdbr/dvoB3XiTDvnkkrcOvoGNpUHs9nkdChWaO2M/i3VgovAZ8q0=
X-Received: by 2002:a81:6589:0:b0:2ff:e11d:3fb3 with SMTP id
 z131-20020a816589000000b002ffe11d3fb3mr43414203ywb.10.1654792680368; Thu, 09
 Jun 2022 09:38:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220607024734.541321-1-richard.henderson@linaro.org>
 <20220607024734.541321-18-richard.henderson@linaro.org>
In-Reply-To: <20220607024734.541321-18-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jun 2022 17:37:50 +0100
Message-ID: <CAFEAcA-wYmz8x90Vr9bdhSBEJiOL8du+qdu=N+0pe6nOyE_y4Q@mail.gmail.com>
Subject: Re: [PATCH v2 17/25] target/arm: Rename gen_exception to
 gen_exception_el
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112d.google.com
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

On Tue, 7 Jun 2022 at 03:58, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

