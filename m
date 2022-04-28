Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75EA25132D1
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 13:49:00 +0200 (CEST)
Received: from localhost ([::1]:47454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk2dn-0006Pd-Ij
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 07:48:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk1g1-0005sM-QF
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 06:47:16 -0400
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a]:40160)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk1g0-0001vn-6c
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 06:47:13 -0400
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-2f7ca2ce255so48139217b3.7
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 03:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ftcG1UMoPISvDyEvmfyNuVQlesGvyIR/ez35ybPwW3U=;
 b=DnRr39ON84BqLxv+7MNQ0ZCixs+O016BVNllOAe3JzkW2FwfeHnefFtHpboiGlJrr3
 SLpEzNDpzbbNCfx9w16EQVGxjcFsG0TNUwmuBFFJUZwLElQhTQHAS038pFY6N4LT/7bs
 C0gtHosjPzH4soEhLuxYZSxKqZSZrF9MWKEF+IPjnwueRZ4ywSW4JnsSHA5eFaKAGuzl
 Q8cCTF9Mk//a6ykXhhoe/w3QQ8/nyhS4dr/U+Wit9yxN9lkKKQVqLPGr1gxMKejGAPkx
 ovk0LzChOro0wKuIB2OWWTGTTbPC264/lXXSFh7uKkPee/sPnYDioF6UbT9ovNXrL64s
 rAtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ftcG1UMoPISvDyEvmfyNuVQlesGvyIR/ez35ybPwW3U=;
 b=8IVmOGzHcQU2nhk89Kz1cmKUfqaT9qX7jXt5DwFW8RnB4BPhWjfQwvWRNMoqHvrtbO
 y2n/3wPkGyvQZ2BvhSRI6aNj0n4rxossaRUXLqpY18KSnZ/LADGl+ELpx/lHwWwFaS9Z
 trH3abAze7T37tHqpeK5dQJg5ppiVmA8Mdp0OMQO+dXE16f2RdxfPV5EPbPm3xfabLfY
 kR27GWrRb84MAWRDvw0Dgjayacpyp6LtQUXDnHuuRR7hcNoA7HG5NgDq4JSJRaVlstn8
 VQiazNowd/4OcqYyNt1V0QCUDNizfM5nGBaltPd/o8FjkqdWgergZT7+uJfKH4grAgGO
 ZU3A==
X-Gm-Message-State: AOAM531N2iJh4awRAZCO5Ll72vwmEsFbf/g+LVRJRbrUgU4lmxD6Anh/
 DXMXhlezwMvvusJSy6Yf4PlMFaKPRYCqzzWQ6lhy2A==
X-Google-Smtp-Source: ABdhPJyRnCSO87xKhY0pwnMGlSfVv6nz2hGqXF08unsAeMO99iMtn/Unkk/1D9iFLQqvUu+PMW/X6vnCTU7hhAUTeww=
X-Received: by 2002:a81:6642:0:b0:2eb:c364:b8e1 with SMTP id
 a63-20020a816642000000b002ebc364b8e1mr31224025ywc.64.1651142830785; Thu, 28
 Apr 2022 03:47:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220426163043.100432-1-richard.henderson@linaro.org>
 <20220426163043.100432-43-richard.henderson@linaro.org>
In-Reply-To: <20220426163043.100432-43-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Apr 2022 11:46:59 +0100
Message-ID: <CAFEAcA-mNhGMo2VG0hqUgxO1-z=K6xh04H1KHJPdmPJQZ7h8fQ@mail.gmail.com>
Subject: Re: [PATCH 42/47] target/arm: Use tcg_constant in LD1, ST1
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

On Tue, 26 Apr 2022 at 18:18, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

