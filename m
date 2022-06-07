Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C543453F8CC
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 10:54:16 +0200 (CEST)
Received: from localhost ([::1]:45756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyUyd-0001xM-PS
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 04:54:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nyUpG-0001E7-63
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 04:44:34 -0400
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c]:41939)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nyUpE-0002cW-Ih
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 04:44:33 -0400
Received: by mail-yb1-xb2c.google.com with SMTP id e184so29967858ybf.8
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 01:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iyISAeioh2CaW8L/inA2jGkm3DFaAWCMGjH+BtYaVTA=;
 b=eKGdEPlr74ZIb0j97Zf3F7/K9xeSK94WqZbeMr0U+tw1/FxS8BTmfU2Lgium5TqvfI
 3oh5Z/LJyFsQc1pPNibqQrHKxuQuBNDFK8wDKcs8FYjocJBYtRnepzS1n4QFzsrlDj98
 r5FOdezCx+9ToXSozRcGsNMvypPF6EeRRGjKrPSQ7xjiK8dSj0xerCFfu/GCX//3n0U2
 wUes+UQvMQ812CUIVv+Zfb4ffYVIA2kyFJZfO0GmyzAQ3tMMJNIHIJmSrsq9PEbE/i8W
 nIcKU73Sr3JgkObR33ky7orlZb1rSHFmq7y4IpgpPDrAin+Uh4JKJl4lazVL4ft1ZWMT
 z4Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iyISAeioh2CaW8L/inA2jGkm3DFaAWCMGjH+BtYaVTA=;
 b=urzdM7D5j0KuO14VBUDpxPVavFMuj8f5zO7/75/GH323hpHspDimemARGrV4uUFeeK
 sdS5+KsdnAn4tF2nDvoYqCCqYfvEr8yAWqgNmRyajeIKUK2FRQWyLkNuj9Tg2Bff6af8
 yrPZguCI5WDKpKtuKE4ooN4yBL1aGbloBx/gyZA/v21/0QOjio2Y7DuUQYf/k1X1iOru
 Evm/ivarTyCjjUsLzIScijh7wfE9YQDaBewrg4K3i1E1wkqLOeP38+TCWxfcvdL4L3h2
 r5wkX2KNaQPG5Ka0qd4MPdGP0PntAvmJIq5tNGtqmAt1eF0D4LN85gSQh9o43PK18Ioi
 oE+A==
X-Gm-Message-State: AOAM533zqKiPrGz7qvT28OvH6o4MTrhJk3prsY98sUZyQ16Y7XgB+Lgp
 x38GDJ1oaEEoeBL6i8tWwD39orYhiTFqbXTDJRZN+Q==
X-Google-Smtp-Source: ABdhPJwX13rDjzItZgsvvagWeRrU3yeyQ1u+BYZgEK/2g7XgvSOiTSRDcryPXSPP4TdiojvVfHa+PnILkQnYyyxlTk4=
X-Received: by 2002:a25:47d4:0:b0:65d:510e:c8de with SMTP id
 u203-20020a2547d4000000b0065d510ec8demr28896849yba.39.1654591471695; Tue, 07
 Jun 2022 01:44:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220602214853.496211-1-richard.henderson@linaro.org>
 <20220602214853.496211-32-richard.henderson@linaro.org>
In-Reply-To: <20220602214853.496211-32-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Jun 2022 09:44:21 +0100
Message-ID: <CAFEAcA_uU32pw0Z4hQ1rmL3irhjvVFhchVL7is0LLzWcSgLSeA@mail.gmail.com>
Subject: Re: [PATCH 31/71] target/arm: Move error for sve%d property to
 arm_cpu_sve_finalize
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2c.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 2 Jun 2022 at 23:10, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Keep all of the error messages together.  This does mean that
> when setting many sve length properties we'll only generate
> one error, but we only really need one.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu64.c | 15 +++++++--------
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

