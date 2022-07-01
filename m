Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A207563367
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jul 2022 14:18:59 +0200 (CEST)
Received: from localhost ([::1]:46754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7Fbt-0004sA-P5
	for lists+qemu-devel@lfdr.de; Fri, 01 Jul 2022 08:18:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o7FYW-0003CA-3M
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 08:15:31 -0400
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134]:41884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o7FYT-0002U4-Kp
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 08:15:27 -0400
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-31780ad7535so21582127b3.8
 for <qemu-devel@nongnu.org>; Fri, 01 Jul 2022 05:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8zW6HuQW+Q9owFdRfUwy7eQosYL7295C7BS/kkwANIc=;
 b=itaJIVE74dPR0kd8ZbhysqWDifxvGaOaD8fr+pVgdr7pENoXdY67f+wouz+KH6YKy3
 x3pz33Fhc9OQXt+jtPprAKzkL+82jmUHzhEZJJoHq8lS2VFslKYRWabD6jP7iyakOSae
 /BEpbk8hNd4GI/pkNyS3PyUVUa7CewWRasdgVi1j+/OjyKq9aD4LjZpxjc4+Ja1XuMxn
 hYc90Bb8xUMRYRbITsCeAeie2uCqMEc3BwKiy61msThSLWOERZt16J/0Kv0AQwdSgPNn
 IrsHld5veuyVD+c0jFNvYyOWzs7hdxD3sC4xUe2s8aP4xry3LDmUoq3+8+F6FVcEaAAt
 vSlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8zW6HuQW+Q9owFdRfUwy7eQosYL7295C7BS/kkwANIc=;
 b=dJI6ipWK++MqrDWoc21YasRLSBgv/cxMi/BG0ztu4onNnulClAlLdQCh3f83V21mEW
 2vJElDvtJBfRzlGIfCwxtwp8axPsm+2g/aw+7+BDg6qBJXnP4rlVgbfvMJe4U67/34PS
 2WK1ljNxDYheVycJOgghk3dA12N4KVbGBAxUXbFwTuyeu4lFY4tahvbIpfuD3Oadfmyg
 NYYew0oJbV1lbBUAnBf4E3x7DHAtu5F10ecy12L7uJNqZMVGse/Wofv5UKeS7D+wKWIT
 oiVI9krWOzkKuAEi+C6E87Mmu87Q/G3HZwH4aYp4nWyRKKAHifzo+u/Cy+uO2ygqq0v9
 WMkA==
X-Gm-Message-State: AJIora/jG3FxRpCfnbsNPMpAqzGOw9f94de02+9QQxu2bLNnHvRMqRqT
 68sDllBU2HSSTPbDjSWYcSNkU4dIHxRMqzNwwXI2DA==
X-Google-Smtp-Source: AGRyM1ttb7Z4tdo7VbgTXI4sYR1GvesRAOCuBf0+vcibhOmvuf04kvS15jM+It5/VCndagtk/wtMWsMBYRAyliizvDM=
X-Received: by 2002:a81:1cc:0:b0:317:a0fa:7a61 with SMTP id
 195-20020a8101cc000000b00317a0fa7a61mr16136271ywb.10.1656677723087; Fri, 01
 Jul 2022 05:15:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220628042117.368549-1-richard.henderson@linaro.org>
 <20220628042117.368549-7-richard.henderson@linaro.org>
In-Reply-To: <20220628042117.368549-7-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 1 Jul 2022 13:14:45 +0100
Message-ID: <CAFEAcA-bZExqks1kSJA66KtoeQuaVxa0XfmBiDGeVqLQRTqvag@mail.gmail.com>
Subject: Re: [PATCH v4 06/45] target/arm: Mark BDEP, BEXT, BGRP, COMPACT,
 FEXPA, FTSSEL as non-streaming
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1134.google.com
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

On Tue, 28 Jun 2022 at 05:28, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Mark these as a non-streaming instructions, which should trap
> if full a64 support is not enabled in streaming mode.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/sme-fa64.decode |  3 ---
>  target/arm/translate-sve.c | 22 ++++++++++++----------
>  2 files changed, 12 insertions(+), 13 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

