Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A896E53F8C3
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 10:54:03 +0200 (CEST)
Received: from localhost ([::1]:45156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyUyQ-0001W0-Hn
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 04:54:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nyUuY-0006yZ-38
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 04:50:02 -0400
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a]:39782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nyUuW-0003UO-K1
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 04:50:01 -0400
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-2f83983782fso167849747b3.6
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 01:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GOGDM0p1S3KdiCzeCMUbY863jmhI2O528m1k1ZQ29eQ=;
 b=Ik4eznygGdb81JTIO6t+K09C6y4Es4ympdCzXE7L9ppcgG0Aeb8cwCXIFBOe83njXe
 gpgT476nb8fK6Ruilx+Ohovpwwj1IunK5zFB59Wy2H9dlYKTKzs8EnM3lo+K7ZI8lJZR
 rO6rcxHy72ybQTTrag/C5hav6+70YBBL+EpWbQscvOZwA0lNxC402SkOW0ut4vC9+svL
 Oy9vKFHKcCZupOCIbzWA1YuN2C9djaeQ32kukavZIy0bB03IxHeH8CwX0Al7U/HZjPof
 DgWDsHuTCxwf9ZA/XrI1ua5g2rfVzbF0aZUkgZIHsMMPaJidklrMqpeXUKnBI5KiYatD
 N5SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GOGDM0p1S3KdiCzeCMUbY863jmhI2O528m1k1ZQ29eQ=;
 b=F/8a84yCFXYzdk7CuUjbxmDBRyBGjFbcuhlpyF3XR28j8BgQM2rbowbWT8rPYk8i4L
 VWcaQVzbkJwMjg9qhmqwvam+PmMycM+Av+qhiFQkr43DSaI31WdGalihTDjA7hIOTf2W
 LaCdZUkgYEuVClLv8BsO99wdmeE7CzzoRkZ4cXeeyButokb6PfXz4TAppf1Z7AFFztGR
 dtHH1h9gLci/Fj9uK7TazsjXO7IDkZ+/7YynDX6vFJmBEDCi5iwe8UX736tm+EYrr1xc
 zY7QR48TljVzuzeQk0/5O7eCeF75IoBhFvMttu8fKpkf1bAgVdrse9yJ9BsC3dSRb5pX
 V76g==
X-Gm-Message-State: AOAM530VGMZ29Y1dxhgbpInSe8tuxoDCHyApNZTlhwO1O8PfZ4dpAHdA
 zU7LrzkSLu79Uo/yJQPn5v00Qgtv+xS5wxLGYX9Ojg==
X-Google-Smtp-Source: ABdhPJx+6IirALW3iqZVWwqT57dJd7dvso/AwL0If+mKU9Q/o4p2FKR8s+i3aH1s976nOl0BY/owxSWPsGNaN64ZD4Y=
X-Received: by 2002:a81:6589:0:b0:2ff:e11d:3fb3 with SMTP id
 z131-20020a816589000000b002ffe11d3fb3mr30307185ywb.10.1654591799547; Tue, 07
 Jun 2022 01:49:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220602214853.496211-1-richard.henderson@linaro.org>
 <20220602214853.496211-35-richard.henderson@linaro.org>
In-Reply-To: <20220602214853.496211-35-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Jun 2022 09:49:49 +0100
Message-ID: <CAFEAcA-DFxys7UnnrJuMrwKmDocKr3qWR-FK+DRER=2j=mvKKA@mail.gmail.com>
Subject: Re: [PATCH 34/71] target/arm: Generalize cpu_arm_{get,
 set}_default_vec_len
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 2 Jun 2022 at 23:10, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Rename from cpu_arm_{get,set}_sve_default_vec_len,
> and take the pointer to default_vq from opaque.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu64.c | 27 ++++++++++++++-------------
>  1 file changed, 14 insertions(+), 13 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

