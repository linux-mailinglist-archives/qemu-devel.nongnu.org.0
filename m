Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D356A9DB0
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 18:29:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY9Dc-0005v1-JS; Fri, 03 Mar 2023 12:29:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY9Da-0005p1-5r
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 12:29:18 -0500
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY9DX-00075L-Iw
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 12:29:17 -0500
Received: by mail-pf1-x436.google.com with SMTP id bd34so2051108pfb.3
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 09:29:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677864554;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=aNps1/FowZmxOx2hlK5agPTOt7fAGsvKEYSNaTUjzYg=;
 b=cf4pvQciX92KSrmXZmahY9k8P3fBP4VR2zZ5DWYntYI152R9pBZQIGzXpATPv1ZI7n
 JbpdV/he3jrvHKX7WuzZbgxfUKgt11eM1FFRzTRGizWRi20eE8m3fcMZ/QJPp608Wxuf
 3n/Z7kczicP9O+4C93a+A/VTNiRdUix+BWTir2YS7fVMbi7IWl4ivwNtS9V4OkO2zjnO
 qVMP8YHVOs9wOcj3rmOKthD0ARUmK3uzbgZWPJQ/lt5xuaKEAFizfPtsopkSx28TWDRb
 cI9/u5su+7OuP3+8EpAOMo/3sF2zuD3MJMp+4coRAKZYYLsTE7NZg2mVfKk4jKhYXKIF
 8M4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677864554;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aNps1/FowZmxOx2hlK5agPTOt7fAGsvKEYSNaTUjzYg=;
 b=FxSDTh29YfuLoJuHe6tqtZG7qtBlBllE28azwKC5FN7v2+funI7vb/4HXpDsGt45kS
 qYXglXYypGrLMsD/wiRAMZojLrHo90JAuJLriFR1PR0Odv9S0tpuffnm2T35CGVP58MK
 7NWURdznyT8R8MGxZQ2PTvhQnGWZ0fjgA3F0cMOjkQgH9CgQlE96gkUEtYQeSalr1FWV
 f6+spC1Qb3XAPawuMmRnYPreTTyAiRDG66QYPkynemaH+ZqZenC9VgnekUmbHIA+37Uo
 fyo8RMTBofr4AI2VCNDy+mKuf0PU3OwyxDI2+TK+MQBimaT0TVG7rLjUXZSX2h8JUDMa
 1FGw==
X-Gm-Message-State: AO0yUKU9npsWl3JVAkyZHYjy3rG/kaRbcZHGpfxvw3bzCRDbAHV7+hRg
 KZfFnBCDvndJnJmJ5slJpZgrkdrIJN/46nK/17vqtw==
X-Google-Smtp-Source: AK7set82x40Ko3S3a7VXwbvS2PfV03a9vjPmoWD+YqP0CFB8c957YgCFwOFifXq3AIKoX/59Y6jlKljawhI2F0x8k4E=
X-Received: by 2002:a62:8348:0:b0:5ef:95c9:6a88 with SMTP id
 h69-20020a628348000000b005ef95c96a88mr1203980pfe.5.1677864554075; Fri, 03 Mar
 2023 09:29:14 -0800 (PST)
MIME-Version: 1.0
References: <20230227052505.352889-1-richard.henderson@linaro.org>
 <20230227052505.352889-6-richard.henderson@linaro.org>
In-Reply-To: <20230227052505.352889-6-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 17:29:02 +0000
Message-ID: <CAFEAcA9RY-_h_xCYpmS0qh_FSOkL8CvzJhifZ1TQi2W2Gx4cCA@mail.gmail.com>
Subject: Re: [PATCH v2 05/76] target/arm: Remove value_global from DisasCompare
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, 
 kbastian@mail.uni-paderborn.de, ysato@users.sourceforge.jp, 
 gaosong@loongson.cn, jiaxun.yang@flygoat.com, tsimpson@quicinc.com, 
 ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x436.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 27 Feb 2023 at 05:26, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This field was only used to avoid freeing globals.
> Since we no longer free any temps, this is dead.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.h | 1 -
>  target/arm/translate.c | 5 -----
>  2 files changed, 6 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

