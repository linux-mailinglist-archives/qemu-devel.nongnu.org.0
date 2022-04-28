Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 075CE513155
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 12:33:39 +0200 (CEST)
Received: from localhost ([::1]:39754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk1Sr-0002Ft-RT
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 06:33:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk0vz-0001hc-ST
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 05:59:47 -0400
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136]:33568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk0vw-0001j9-7i
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 05:59:38 -0400
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-2f863469afbso22808877b3.0
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 02:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=E9ia14ThDKbyGKD53H2IwGmPo3bG2Bkov2wu6wBUF1M=;
 b=cAN+0VxmBDB2uTWvSe8ARTrNaB07j2lZQdIHXn7qgkWDdpyJgCNblklTshnHIlx0DT
 zPJB/O7bJjkXgyLNdLbhV9hBd5Ky4fRu21LA5p+NUbcTLHD2gNtnucn5uwSYNGnESX3P
 xkmX6yCDT1XB4I0q5KAyEtJXe0zdFyLENTfiesMW42pmGRUvWLf/22E7sSVgbWWzgtTW
 duCDS4KkEZ0EV95U16QLzu0PwzTVVm0RbzCKgd29pPSDMn9KkyDQCeNlwkU3lPikqe+E
 He0tV5FJviHsA5MCZXHshiW1dY/7/SX84zykE9MqYc3q2Evzy52ZhvRlAxiF3P5Kx2/e
 ZUgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=E9ia14ThDKbyGKD53H2IwGmPo3bG2Bkov2wu6wBUF1M=;
 b=PYuNRKuDexHtjL0uby/0cbD6nEkQ/+StI2xqZK74ov0ID2kYwnseM/Ex4Eu7/IODme
 8RaozNIY0PBamHlUnvSiibNwdF0k83r1L9DayNpOIR2muFj2HOC3S2RJth34z8EzxH6s
 MrD0e1cseK83hpZvBMde2ugNpyJqtgCyj06VVmGfoR+zRp4e+LHOkAEy2btC7xbEIG2A
 SuggRmzQtnzVeM7QsnG8NbrkTA+Bf0hahcd89c59bgyPS2h8T22o0OTddp1muoLD+VMR
 qs/LnohHwhq31ciOxKpxjCcxjSUV8Ohf575gW3Es1eflTVxcKrT9KmeTQusmt+0AbsLA
 pU0A==
X-Gm-Message-State: AOAM533RE2JBGXTqrC/9BRp3bDZ0bHIFD11RsSuJBKyVvgIX36Ne7NXw
 FzTdk0X1XahAW37WcAN58bymSvKGjY6xkuA5ocmkbA==
X-Google-Smtp-Source: ABdhPJww9lrTtQUCs4KK83ij0QiWQcUfrGTSH52DD7h/aGFg+IsqpkzkpXKZ5BflKEK1hvdZXCr2R74rohEzgG5F+ls=
X-Received: by 2002:a81:106:0:b0:2d0:e682:8a7a with SMTP id
 6-20020a810106000000b002d0e6828a7amr32395011ywb.257.1651139975373; Thu, 28
 Apr 2022 02:59:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220426163043.100432-1-richard.henderson@linaro.org>
 <20220426163043.100432-13-richard.henderson@linaro.org>
In-Reply-To: <20220426163043.100432-13-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Apr 2022 10:59:24 +0100
Message-ID: <CAFEAcA8pZqCYxDZ-AvWLJVSHiHcqmNLWmfPJJnt1Tqbqf6SYzQ@mail.gmail.com>
Subject: Re: [PATCH 12/47] target/arm: Use tcg_constant in disas_movw_imm
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1136.google.com
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

On Tue, 26 Apr 2022 at 17:40, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-a64.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

