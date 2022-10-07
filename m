Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B5875F7668
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 11:44:46 +0200 (CEST)
Received: from localhost ([::1]:44478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogjuP-0003Rg-HZ
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 05:44:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogjjc-0004kX-3T
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 05:33:36 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:35563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogjja-0000Uu-8u
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 05:33:35 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 i7-20020a17090a65c700b0020ad9666a86so6767788pjs.0
 for <qemu-devel@nongnu.org>; Fri, 07 Oct 2022 02:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/2t1nU8OsYeNfHsZn398luF5EshR8ZGqpWaAdBvWkhY=;
 b=iYisFl5FW7WuZJpTaMCIM9rlafMrpuS+hIhGZ0+TJc9lYp2hklSGuCVlnqizczFZy1
 PWcLVF5wGr9eb/aNqQ7VOr2NdJO0ZdwN/d2hrn04nryf4qxaGSO0o2c3MKekwxrkF+Cr
 OVl2aa3doh3ZEaCLynenTsHm2kUnAKHZUr/FG5TXOyDK982K2/Ku3+5Ny/HMmdbAZdVc
 YGmc9HU/ATlIB2/dnAgbRl1IJVYhE+HWqKh4RWW5VImxPc4lnL1TxxDHtK5tAJg/yvKO
 SuTdbPrraylSaiZnyITWz8AY+2ojB+Ghh702ByFiEY0DY9Y59aTU3d1ZMeTMTkFYIq39
 ULdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/2t1nU8OsYeNfHsZn398luF5EshR8ZGqpWaAdBvWkhY=;
 b=grmLnM/i5xtwKj2C3UWO/9wQfLJoQ+TXE1jwCRHneu/CJTbsux5OCuV/SZ9lwhehLI
 cPFKlZBn7pVBSSn6VRH8NNAR9sCvormb6wbR2EOCWNHfFGQzSF66hMesp5IwZ7wXjYLp
 CwlL+SUUPUCnOHClcZKykcnbalX/ULRCHhPFHvY6RjQ/LZJyLHzYVT/NDNWh5E5e2hkY
 A54hg0pUS5zrXnMkZZt/hafIxZ4/79RptwmQZkvSkeOEgerd/J6dOkoT3y22drhp0VrJ
 TtkodxPDFNXgalsdpMKTaWTssekm5CCAwGh8439FO7LYid/dWS2saj+UxqvM0ZQ2Q54a
 NVCg==
X-Gm-Message-State: ACrzQf2VXtzYduUCjAshW5qptUVCl1U6UO47bbH17DZtxzR7avD2fzGf
 Q8K4NL+DiKyHKOgvmNkqMlHUZD7bouhlL2uo4oR+Tw==
X-Google-Smtp-Source: AMsMyM5h2kEd/5eA8izUjO0+tmJgGkov9VmZQMeGT+XaEIQISZ81nkSuHYgohKaURpORgsISV3Dtc7+JfpkwwCdwtgk=
X-Received: by 2002:a17:90b:1d04:b0:20b:cb40:4b3 with SMTP id
 on4-20020a17090b1d0400b0020bcb4004b3mr1177405pjb.215.1665135212236; Fri, 07
 Oct 2022 02:33:32 -0700 (PDT)
MIME-Version: 1.0
References: <20221001162318.153420-1-richard.henderson@linaro.org>
 <20221001162318.153420-36-richard.henderson@linaro.org>
In-Reply-To: <20221001162318.153420-36-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 7 Oct 2022 10:33:20 +0100
Message-ID: <CAFEAcA8hBdQFVSriFXmKCsd6W6E2i4XkPN1hvtd9Kgr7VaFjoA@mail.gmail.com>
Subject: Re: [PATCH v3 35/42] target/arm: Move S1_ptw_translate outside
 arm_ld[lq]_ptw
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Sat, 1 Oct 2022 at 18:11, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Separate S1 translation from the actual lookup.
> Will enable lpae hardware updates.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

