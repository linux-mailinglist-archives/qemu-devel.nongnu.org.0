Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C52B51322E
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 13:13:04 +0200 (CEST)
Received: from localhost ([::1]:35428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk251-0007Wh-Dz
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 07:13:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk1HT-000326-R6
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 06:21:53 -0400
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a]:42421)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk1HS-00068R-8l
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 06:21:51 -0400
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-2ef5380669cso47356927b3.9
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 03:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IZRaRWIau/dzvEMUUkWTsujiYnz8AzW1fjbZ0KSb3Jc=;
 b=fAFuaIVhB6bNcKD7Ii5CPlXkOLv9RyPJ74KC2cboIcmTqY1J2jR1SIHSdMt41iVbgy
 3K243yRH1662BEHX5QyX2YZPEgf7NDfJosAXpl6Ydt6QcR8ciWshcdGS3i/VX58lk+q8
 tTlN1QWm8g+nTw8YrSqattO35maAarjwRuf81wlf8H44mvQDFpfzGzecnhZvIbPYAnSw
 1bscDhI0fK7ydlIxQOqqnLvY3lqhPniXyOwnVev9rVxdwCwlVpHFWPXTaK607E8+UJQu
 RRg/bJ67xCeDQ4C2k1iWsDgsb0gr8gpMw6yD0g7oczoJSnc6x8RTkB5ANgARxPQ/28i0
 BJYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IZRaRWIau/dzvEMUUkWTsujiYnz8AzW1fjbZ0KSb3Jc=;
 b=BcIEpK/JMWtL03bW6UuXszdJxW94OvhFQch8VGSFK/FnQ7mhlrfuA7843EItdRUfdB
 5mXu52XgDu616ZcUrIEZ758h+0bfmGSRaLEhBVJYTnC0WvHRMTgXkDEHN9PEFHw2hq47
 +6r8RwbSxGiEXX2kswa9wBHFtj52X1LUo1ZdmQWS0dNAdtbP/uoQ80V+JN1922CjDNdi
 Bxs/c0NUhubV1lu/IJYWvqChQkK52VAkdqyJsQE/Hy7DKvbzZonj83z6RfJuxB9Ezn/g
 sMDApCNBpEyj+BIA/y39W7nv6bhmZVjB232WlH9YrheLkUejzTgOFNPIyLOv2p54pFsb
 Oc1Q==
X-Gm-Message-State: AOAM532pSGHAwszOAWEFCJsj90ryw1WzgMZOjFRw1NrK4lBgvGKLlu/B
 5YqC//WlAIdaHQ1/BNkusAk+JzoJUzA/4wte+rCPGOWS2Tw=
X-Google-Smtp-Source: ABdhPJzSXGO09Xl69zZSi2mSuIiflQXZKEM4f/FSS9poa6UbStMF8bWkZdzjLqdY83g5vIULZISecoTzFguC9X5m+do=
X-Received: by 2002:a0d:fc83:0:b0:2e5:b0f4:c125 with SMTP id
 m125-20020a0dfc83000000b002e5b0f4c125mr32151188ywf.347.1651141309234; Thu, 28
 Apr 2022 03:21:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220426163043.100432-1-richard.henderson@linaro.org>
 <20220426163043.100432-23-richard.henderson@linaro.org>
In-Reply-To: <20220426163043.100432-23-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Apr 2022 11:21:38 +0100
Message-ID: <CAFEAcA9+m6LBNB=YVNA8Kw0362N55Nh_-ckUUeP5Jh7okPy1Xg@mail.gmail.com>
Subject: Re: [PATCH 22/47] target/arm: Use tcg_constant for aa32 exceptions
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

On Tue, 26 Apr 2022 at 17:49, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

