Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B1B6A9EB1
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 19:28:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYA8Q-0001Up-HT; Fri, 03 Mar 2023 13:28:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYA8H-0001KR-MT
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 13:27:53 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYA8G-0003AI-7s
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 13:27:53 -0500
Received: by mail-pl1-x630.google.com with SMTP id z2so3609983plf.12
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 10:27:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677868071;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=X4VLl2CDxTjXb3LQSI4/pgGmc7rKupnLRH9WiHNF9Gk=;
 b=PZO92VnWC5+/GRuNZaOSoKRXuJdx17VekQvN+KnJtsajSF/qNxwNL8ilql7beoz+sI
 jsrr5PqGFjJc0w1GOMYfUcYOa2UzghjdZdNfW9RQaeWTQBVnLstjA1ZlgrTJEfFIoFTj
 AqWmtzShj3AcVjV0rF2jeJbQ9Q1hC7ZPlaD2WqsEstbdp5vVA3aecYqh8wnDSGYWiC9H
 0rBPYDkQ+1BlNzwPimaWKkX4+nmqkSFkZRX/zA9DNw2eQ1OjWm2fnh4jygZm3QDS5yvu
 3NNraci4TFV8D4SEFCRJtsTYeW8czVgI6nmyhtmJAefqMF152Y7Da7XB0TfSTgW+atdm
 jjxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677868071;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=X4VLl2CDxTjXb3LQSI4/pgGmc7rKupnLRH9WiHNF9Gk=;
 b=si4Teu/Sxu4ke6tl4f2DXcaydXLJau5g0FzQ2KGY0zPO1ea+k0UCgcmLrAkCZ+BFvy
 FhzDLFtR/OqT7+2QnLS51ve06c5oKZBVjZlkkAbB2fscKyYGSovFRF3R1WTgacYTEo5X
 aMRywMR5dW7mJ3ggBQ6BxNanYbsBy2mDRchhvcfC/+Gv4AL+CYD3pU5RGXSwjOp352kt
 LGVigBJS+qHMoi1xZ2FkSyJi3pTvu6iAhZoYicdhDzKl2aDqOhivmJ+O2PliJmDzQ5g0
 YP4UAkOsZXgcQiS/k+o3AW8gUvmv9sU7FdS9UJPouzPuMhLWPTdffzAfQZMbH7G6kRDy
 kIoQ==
X-Gm-Message-State: AO0yUKUVHTRLSaeuTj3EFVBWsfghv0hEetN8c0qIuoPq+3akQal/+OYj
 RRkFOxCnms9v0QEwgq2RVonv/W7CadMdCCf8nTOGDA==
X-Google-Smtp-Source: AK7set8/6+XqcLDcUnDlOoZDzb65s0uZ3kXxtMKdvU+WYFeejXMeT5oss1hjWLPJi/KEVFSPcRIyo+gXF8CmChpalaU=
X-Received: by 2002:a17:903:2616:b0:199:4a4f:9d2a with SMTP id
 jd22-20020a170903261600b001994a4f9d2amr1075307plb.13.1677868071039; Fri, 03
 Mar 2023 10:27:51 -0800 (PST)
MIME-Version: 1.0
References: <20230227052505.352889-1-richard.henderson@linaro.org>
 <20230227052505.352889-18-richard.henderson@linaro.org>
In-Reply-To: <20230227052505.352889-18-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 18:27:39 +0000
Message-ID: <CAFEAcA8yj3+Kw7ZxZoNrRUbeCdjU6RpVi=t1e4d0yRybNH8_3w@mail.gmail.com>
Subject: Re: [PATCH v2 17/76] target/arm: Drop tcg_temp_free from translator.h
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, 
 kbastian@mail.uni-paderborn.de, ysato@users.sourceforge.jp, 
 gaosong@loongson.cn, jiaxun.yang@flygoat.com, tsimpson@quicinc.com, 
 ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x630.google.com
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

On Mon, 27 Feb 2023 at 05:29, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Translators are no longer required to free tcg temporaries.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.h | 2 --
>  1 file changed, 2 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

