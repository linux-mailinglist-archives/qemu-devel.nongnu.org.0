Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0518D5131B6
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 12:55:00 +0200 (CEST)
Received: from localhost ([::1]:35170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk1nW-0003Is-VK
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 06:54:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk18H-0003id-7d
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 06:12:21 -0400
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e]:40553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk18D-0003xb-Qe
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 06:12:20 -0400
Received: by mail-yb1-xb2e.google.com with SMTP id y2so8104188ybi.7
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 03:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cVMnkHqCxX0hNDmKb4F5r+XusruWiAqJh8ozrVX/2Nc=;
 b=srA71nZha2OI5ffY+4Ee1wUoojQ9w8lGeMqhxSJLvkTNNT0r34Ij5kRLUngzxoROb2
 O6+WIrtrtvik9YvpZ/7V+/jrJyaU70ERXMZJdPoXGPlz5g52RhKaZRlgHcZX+z1+XI9m
 0Vk1s4jaZ2GZQH6RVPXV77CokbcZ5LY8Y+wDFnOGLx+QWnBXNmiXKCU0TN3EL3Mt0YND
 +K+KEUbAtD9XrPprPWDGj2NVyOs2diJkZJH3YBhXcexRw3mSncNswBgwOS5a+lKDyqcF
 xwnMgPT6Gt+fM2SNG9wS/XZsYB+4pA/b6bdbuv3+fVR99cCFWV9NzNXogx7bKjwmDyuP
 TC6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cVMnkHqCxX0hNDmKb4F5r+XusruWiAqJh8ozrVX/2Nc=;
 b=EneRHQZ6McMiYZQxlZdXYeY+62VL+n+bfmF4j2/U0pVHUm/wX89wY0W0Rm5Oc9ItdB
 ompyYpabKN3aovGMJgjr69n3TBARELrKNlPpvihA958dr2lDac6TJhShF9I6LRGado12
 gTpEAnGKoY11WH2+Y5h3D4yJaC7/1urtYVMxnduvsDn/oLHjAteSKgUvfc4MYIsR+egk
 ux9FTIL/Gs8LTieIhqwmz7cNmBcIPGI6hnn2Ju7/FC2DhcL7xqUx+HRs/SFePmJWP1Lz
 r7U5YBnzu1yvwdXKt6gKKdZJXcpn1B+ncyeLl1sJD+uJrzhqxr4mzJG0tqFPQIwoxth9
 ljFw==
X-Gm-Message-State: AOAM531X+3TeFQkhwYbfJ8jf/bGbsZVDXT/Nzz3Jgag+Q2s81tWxVLmK
 MOJCX4oQndooS0yFcOR3y+tJ/fwnXw0jaMndPNL8YQ==
X-Google-Smtp-Source: ABdhPJz0t5aYAdzwDrLj9Wd3a001+xzbG/FMJvQb8tPJtbh/yEwoYaE4CeYpK3FZbICWlPjuh4JFG+hycdzBJy0LXKY=
X-Received: by 2002:a25:bb46:0:b0:648:4d25:4b40 with SMTP id
 b6-20020a25bb46000000b006484d254b40mr19966419ybk.479.1651140736811; Thu, 28
 Apr 2022 03:12:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220426163043.100432-1-richard.henderson@linaro.org>
 <20220426163043.100432-22-richard.henderson@linaro.org>
In-Reply-To: <20220426163043.100432-22-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Apr 2022 11:12:05 +0100
Message-ID: <CAFEAcA_PdvKFLiQb3ssvUmzewC_2+0sC9Pvv0vifdXbOU1nCWQ@mail.gmail.com>
Subject: Re: [PATCH 21/47] target/arm: Use tcg_constant in balance of
 translate-a64.c
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2e.google.com
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

On Tue, 26 Apr 2022 at 17:47, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Finish conversion of the file to tcg_constant_*.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-a64.c | 20 ++++++++------------
>  1 file changed, 8 insertions(+), 12 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

