Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1665BED30
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 20:55:07 +0200 (CEST)
Received: from localhost ([::1]:41450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaiOg-0001vR-1u
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 14:55:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oaeVE-0007YJ-Nn
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 10:45:36 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:44948)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oaeVD-0000pI-3A
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 10:45:36 -0400
Received: by mail-ej1-x62f.google.com with SMTP id r18so6671260eja.11
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 07:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=f52s2jYyqe8EPPhbdNSwlwC6T2E3o40jSd9G667UvxE=;
 b=vCAjQPP6XC19dI8UV/eIQK/j41uEzIc24EzBDBUHYurRN7qUx03MICCxZNtW/np/lk
 nf2225SQLydb6I2Mr22hh1CAL5dyc8FjUOfRc/WBrAplO/okl2jgzv6k0iKdR1NPzDgj
 csPQ1X2z7S5nUjY68aXsyQKDZwXvjvaRIOb0z8MJjxXcxBrojUxrcpuRasT01+i002C1
 IPhOmVWC5bIoLa4GZCzB0k012Pe1y6Z9Bk3Y3iyH4T6X1h4wxUmM3XmBWLRfpcmhN4tA
 kpMppspNPGMzrqLhrFBa/YPVPlRnxwt0hnGiCO1Rj3nG+Clj69Tqmj9GeZlAxesh9jwE
 UhOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=f52s2jYyqe8EPPhbdNSwlwC6T2E3o40jSd9G667UvxE=;
 b=F8UGejMQcKeYGl9u7J2/YklBjbMyQk0ExbGxDY3yrWENlbcSgHgpP3zS1rMIVf8vts
 OqF8Pbj8QCwg3nH4GhyoejWotlksJidujc2ecrP1p/+uZHkCJjEO4PaAOVBeHOyRge98
 q7A2mjcS5LTSAQFApMt3QmdeSWyvurgnTF5xUo0OfwJ/BDr8ZTHheMen2hUGrJ5bB6ly
 WKilUlyYlXUj0meKDzjgYIsNO1hn9vTrdcuAD7CY3ye23u7ldVvXOmP0+UscxysUfqXU
 7BYfb/vJ6zIchdP5RJ1T3F67zRdHRbtdD1no8WUlwJ2rjWXlNQAZYtlRyv/jUFaoc2SQ
 3OfA==
X-Gm-Message-State: ACrzQf0rvbHORZ960WvvSf3uCOKHD1pTn098i9OFGTvyxhxMKkOsvIP3
 CPmeHVtgImEWY0Pb3wqqAz6qSMQt7U+ZhyATCiN5kQ==
X-Google-Smtp-Source: AMsMyM7h9srkWN+QVyQTCCtQQ2iYXBuSVslNkDaxN5RIv0MR1bJfXvVs8Y7nrwm8CJImrWnENM6qmeU1JVVRwzCPONc=
X-Received: by 2002:a17:907:7209:b0:778:e86e:568 with SMTP id
 dr9-20020a170907720900b00778e86e0568mr17757820ejc.659.1663685133755; Tue, 20
 Sep 2022 07:45:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
 <20220822152741.1617527-15-richard.henderson@linaro.org>
In-Reply-To: <20220822152741.1617527-15-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Sep 2022 15:45:21 +0100
Message-ID: <CAFEAcA-PgR_dX_2310wLnV1=r+KA9cRHjq5kboVFhRn-jmyqdA@mail.gmail.com>
Subject: Re: [PATCH v2 14/66] target/arm: Add is_secure parameter to
 get_phys_addr_v6
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Mon, 22 Aug 2022 at 16:54, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Remove the use of regime_is_secure from get_phys_addr_v6,
> passing the new parameter to the lookup instead.
>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

