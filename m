Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 431BE51321E
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 13:08:39 +0200 (CEST)
Received: from localhost ([::1]:55566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk20k-0001aV-Be
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 07:08:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk1M0-00072v-KO
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 06:26:32 -0400
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b]:40033)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk1Lx-0006zi-MA
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 06:26:32 -0400
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-2f7ca2ce255so47456777b3.7
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 03:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0pxI2wVqd0Dug5YULil1Ey1Xq1IQDlDFV2kYJ4XQoJc=;
 b=RPevlgOgH643RYHgEn3lTLfGFzJFGtz3qT6qPZq79GWO1U3IdMy3hgYcaxnaBenWn/
 8yQjzfr3mw36Y420p8wOPuxDJwO2KAleMnPnjkmzNZRDKs/U8jUu6S7zOXz7pyUrzY4d
 EZ2K5dLdJoHti9SWmTDvbzNCi0xdMerCH5KkdLvtid1OPrTtvRuwy4dE/kRzUFenUsSR
 Foc6lw4lhjgSYTHa76jIsIPYHxiFeshwqI4VO7LcTb3eHnLuV5ouSmyyeBfq0jNOItlC
 Jhwe0vut5F+vqGRCQWsVSIOw7Oiy9sOcANFg98Z/tJ6kkp68XM++QWadkmhpxK6+OWCI
 qqcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0pxI2wVqd0Dug5YULil1Ey1Xq1IQDlDFV2kYJ4XQoJc=;
 b=DUOLG0X1eN29piQ4gPsHKctHrnsStXBEo0Pj4TMW4VcLdbEbHxh9Xnasp50x2wA233
 x78S2CJMZNDh4REYTrR9SJoWtPcacCTef8Uv7hLnPgE6BF/OYiNRsP6FIiweWz4GUhbl
 kez968kryyoV8McTzLjk5ypr6D8+hqLVO01NJu/8cXNxSx9cO2JVP4VZZgZO0roly2xv
 G+Y0/7gCWDgjV6k5xvPBsBccNT+qjuTygbLA+xEi02iQgXXaR1pkhdPVNElSU8KL0VCm
 6qmWv8PRf9VLhxwDK8pvxG9QBZxNonQ0Blxs+27EDvpPUlp/K5IKGoh9xXMS340B/5ER
 0irw==
X-Gm-Message-State: AOAM533fJR0D3oOBOlm85UlVaKcy1Oet+Z9aLb9bIphyNYM3ZyNePctG
 s1supj3PNENLAr+YkCd5wdlREXuk2ijtiFjqOiN2cg==
X-Google-Smtp-Source: ABdhPJwff4W/rDnDEVcvIy63aggNC4aDVy7+Hnhr4DdKq01EuJnD8roR0fjBktn4R6NVKj0RapoLUZFpc5BTglANxbQ=
X-Received: by 2002:a81:106:0:b0:2d0:e682:8a7a with SMTP id
 6-20020a810106000000b002d0e6828a7amr32508088ywb.257.1651141569842; Thu, 28
 Apr 2022 03:26:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220426163043.100432-1-richard.henderson@linaro.org>
 <20220426163043.100432-26-richard.henderson@linaro.org>
In-Reply-To: <20220426163043.100432-26-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Apr 2022 11:25:58 +0100
Message-ID: <CAFEAcA8vM=y1fuBVmi0juJP_3yatJAWRT36d9nVnawk=e8rT6w@mail.gmail.com>
Subject: Re: [PATCH 25/47] target/arm: Use tcg_constant for vector shift
 expanders
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112b.google.com
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

On Tue, 26 Apr 2022 at 17:50, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

