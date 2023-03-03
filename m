Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D10806A9DCD
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 18:37:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY9KO-0003Eg-QF; Fri, 03 Mar 2023 12:36:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY9KM-0003Dl-Mz
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 12:36:18 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY9KH-0001aK-IP
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 12:36:18 -0500
Received: by mail-pj1-x102c.google.com with SMTP id oj5so3285221pjb.5
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 09:36:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677864972;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=n2uzFW9k8BefPFcSpW3FfpQkumhKuKk5wcl0yvFDZIs=;
 b=PKU/oOKjFSmAT3MEyaSd36VK9jdl2q0iX/nWcUGvaS857ovup/RX3NuCQYxwOeIVlh
 ba4KdBD+GJUNQHaMtebPBx7XDuwBi3DX7FSMCEAJDTac6KVxV3z9WeVS8kYhKMi8uIe0
 hNIfOTgXIF1OM6b7kHWudkyHlAMnCkOgTwcCJu/GMnCP9jl0Ip/Lu5kbzzqrVqPI+kXu
 7FUd2iKYtHlq7zux4JteufqS+6AV3ooXN5o7/6GApGr4vopHrTUzAqNkXbXnQMSczo02
 WP5hG9dIYw+nE1YS23AsEWj+nlkaYuCiAb6sgLAlDWlePGikMNeXT4LVpMfeDzdyqVfy
 kMow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677864972;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=n2uzFW9k8BefPFcSpW3FfpQkumhKuKk5wcl0yvFDZIs=;
 b=mymx4Oaqa8/LSOjsJHcWK6ZaAks9HX3GEiI+XttIvC9VzsgxrbblXtGnHIsptyuZYu
 17opAukuKN7MpON5G2uDrJ6J3A+l9eCeTEcLyIjd3689nqtJQtAlc9ycRGxBTQO4OcKu
 BKC6aMhDMA9afnp6P9D++cgsSyPBj2u7j6A+zZqYUzM7Bh8gbNcLF/c8tc/4/PUajcZL
 fwUEZB0y3C7VA3ypoUPz4pXVuuod2fnD9VcYrVDK0rJxLLnAepEOA9M+LM3cxL4FjbDt
 4Xk4quwHYgxNoFKreLT+9sdE0TMwDaigBthhjqpIYtwlNUMNUbhoCpQu5MyU6pFfIgbz
 mdgw==
X-Gm-Message-State: AO0yUKXygO5xw2lkChanBTnqNeNYA2+gdgYh70lSLOO1bVD72uNqm6pt
 iwNCUY4iCDbeTvJZ8VBHYAjEZ4UmERGVXcjqtyj1qA==
X-Google-Smtp-Source: AK7set9iFts6h/m1zRglWvYIkM2E1tbejK2+qyJhMK2cEKyc4HOKYiiKtoEspFXutegzZW1EjHMHkH8Znl/OpWgK9p0=
X-Received: by 2002:a17:90b:241:b0:237:ea76:41ed with SMTP id
 fz1-20020a17090b024100b00237ea7641edmr923483pjb.0.1677864972091; Fri, 03 Mar
 2023 09:36:12 -0800 (PST)
MIME-Version: 1.0
References: <20230227052505.352889-1-richard.henderson@linaro.org>
 <20230227052505.352889-11-richard.henderson@linaro.org>
In-Reply-To: <20230227052505.352889-11-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 17:36:00 +0000
Message-ID: <CAFEAcA-0EgYyMEt8a92b7qdxfoghgWLrAp3Q_vmLjhJbi9NYsw@mail.gmail.com>
Subject: Re: [PATCH v2 10/76] target/arm: Drop tcg_temp_free from
 translator-a64.c
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, 
 kbastian@mail.uni-paderborn.de, ysato@users.sourceforge.jp, 
 gaosong@loongson.cn, jiaxun.yang@flygoat.com, tsimpson@quicinc.com, 
 ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102c.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 27 Feb 2023 at 05:28, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Translators are no longer required to free tcg temporaries.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-a64.c | 468 +------------------------------------
>  1 file changed, 11 insertions(+), 457 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

