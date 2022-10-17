Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF61F600BC5
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 11:58:59 +0200 (CEST)
Received: from localhost ([::1]:49572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okMte-0001iB-Rg
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 05:58:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1okMoW-00008R-9y
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 05:53:41 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:36855)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1okMoU-0006qC-Az
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 05:53:39 -0400
Received: by mail-pg1-x52e.google.com with SMTP id s196so8695570pgs.3
 for <qemu-devel@nongnu.org>; Mon, 17 Oct 2022 02:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=InBEvrR5F1yAb7upyuC8RjxehX9cAs/sZp2Ps7/s6zo=;
 b=cPCDLijDDwMfeSNPextX7P28t9c5f0uYHwJtvlpjh91pI5qSWuXvPYyNdF+xf4wFik
 MDmicUxq6AGpvsw8sEFv7YPrLNdcbajAi6puut9teHgkwZIM1OXOWAo8J1hmtW+jUWV8
 WWYzDnLWoSlCaZliB1Za++fDt/WbtnREOSfHJ3mJlJZ2uVqVyxfQ3PVWM6ZWvbnQ6cmQ
 K9eFz/P0wGEFTH24RWF44tojUdiU2eqpzVlPtkUEGfti4j1JJPCz85C/FxjWakl4stHL
 FJV6Xwyq97tbKXLF7fqg8GXyJEOar+50XvdMHCXywlaHneIF6Drhkx/e09O/nuAOkGlG
 NgPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=InBEvrR5F1yAb7upyuC8RjxehX9cAs/sZp2Ps7/s6zo=;
 b=2NLBQ1mYhn0PPSVDHRgZO2gTCW40kG5IffEMI6VNL6b7PK0CBag+IRS1GkWATDSBk+
 zQ5EuCLkLhpjF69rI93bfDlhDF2GqJP9J9+6T/tid9W5yA56ypa4oxM7uTaAdztqF1CP
 GIfUt2sL48lzAhe/3CpD3yot+W7qMnPZxO+/3DCVQBVR6tKUx5nnJBsUbDtuteGUNJSf
 2QbzaYzq1I8OM7rmCBmMsBR43OF+VgSWN1PUgkJ0BkyDiB+JNatitQqqEnv51enSH3k3
 zaM+tCUl/tTGJjDAETYCy6ndlF03RTAaOwH7dKM3tA8UEmKak7jEB2l6v3ZKjz22wqzw
 YJxQ==
X-Gm-Message-State: ACrzQf3gYRrW1wOkRrFZomw8UcsdlRN1ROfH8M0jJZnzMzLuacaDiW72
 sInspCqyLSYUMaGLAkVUBlsZfBIclut3Oy0Fm/ai3w==
X-Google-Smtp-Source: AMsMyM6WgBseO0XXUagDDwI5d4ZAovyGqsMKxuuZlKwDdAVMUj4ZXdR4IqJA3dLs8hkiDlIZIIXFvJ403kPQJAta7DE=
X-Received: by 2002:a05:6a00:1595:b0:563:8fb6:ae53 with SMTP id
 u21-20020a056a00159500b005638fb6ae53mr11731076pfk.51.1666000415670; Mon, 17
 Oct 2022 02:53:35 -0700 (PDT)
MIME-Version: 1.0
References: <20221011031911.2408754-1-richard.henderson@linaro.org>
 <20221011031911.2408754-8-richard.henderson@linaro.org>
In-Reply-To: <20221011031911.2408754-8-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 17 Oct 2022 10:53:24 +0100
Message-ID: <CAFEAcA-6foX1onAD7e66BDwYUsWmF+u0G=9KNjTtZepZ9ja_3Q@mail.gmail.com>
Subject: Re: [PATCH v4 07/24] target/arm: Split out S1Translate type
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52e.google.com
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

On Tue, 11 Oct 2022 at 04:27, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Consolidate most of the inputs and outputs of S1_ptw_translate
> into a single structure.  Plumb this through arm_ld*_ptw from
> the controlling get_phys_addr_* routine.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v4: Replaces a different S1TranslateResult patch, and plumbs the
>     structure further out in the function call tree.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

