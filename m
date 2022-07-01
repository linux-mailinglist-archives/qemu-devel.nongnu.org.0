Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A40E563383
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jul 2022 14:36:40 +0200 (CEST)
Received: from localhost ([::1]:41142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7Ft0-00051q-Te
	for lists+qemu-devel@lfdr.de; Fri, 01 Jul 2022 08:36:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o7Fom-0002EJ-Rj
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 08:32:17 -0400
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32]:44759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o7Fol-0005dD-2d
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 08:32:16 -0400
Received: by mail-yb1-xb32.google.com with SMTP id i7so3755093ybe.11
 for <qemu-devel@nongnu.org>; Fri, 01 Jul 2022 05:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Mi1p9K6K9fweGmybPfhP0Bh/ETz0sKcyTNWyLt0js6Y=;
 b=Bz94pSn4O6EmyQbvr97IWa/o8XwqJ6MdLc8zeerGk990sgtMIEYghhcEla4NjWRqzt
 5j8Hyf39YQYRlZYdLS6IIHuDJrixd9mNISK1/7UTh6UurHUarHZxlsUJ6LGOUdodEp5X
 iQvVbENcoiV9x7o7OmZLFBO6Tl5mxAuxdXU2LtjxjKJm0L0eAPyoz61TUwa4/5lN1ljm
 21ECHAg8PFhz6eW3cm3y7G2nBiwqr9zt+z3sKduF0DVQMOuQZ5emsZrMm9wPR4GqlWZP
 zTt8fyAwdO9PP0RArWz5ol2GGv3F2ZPdJTflgs0MRwCUG8gosjNgiMHLfiM8k/2IaIpF
 rPhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Mi1p9K6K9fweGmybPfhP0Bh/ETz0sKcyTNWyLt0js6Y=;
 b=OA8v8sTjn2+fS5IgvuBQCOAB5A8C2103VeALezQc/LPYzAkvthAzI1nSpX2Zm1FPEu
 ji8v3AC3FMgi/YgVgBzoN4c0t3AV5tckV/JD4OUyknrtoPT8mmH+qgxZ7PmfcWu91OGO
 +6+vNQNwB9LP2KFqvVxwSHR95BCXP/mZHIvM5EPhXI2V5k/Cm9bYhk0BFdZLZOLHKfXz
 r3T6RR9z4xJMzL8TOcPd3nel2upweHm4nKoMmviS/KvviFsFUEgHTWdgMOxOrgcRlXMl
 oxY9Xhc0X3n1ZF5SwCx+JidCK7mN54Dmb67ii95dLw5gBKmOAZKC5L2jnxQ+asTvowpk
 jUWw==
X-Gm-Message-State: AJIora+yuQWJWYxLZc8JZfGYFIf/iAx6qJ717y3EqpRAVl8EKB3VZ6S6
 NKTd0q2tr32WudNQnBXFj2L9KJ/izqLB+o8/wsFWoPCyc08=
X-Google-Smtp-Source: AGRyM1treenyZPf61cJ4PIC0gxu6Psc4WrZfbEEaFBuQhTz2btunm/vm3kEprz/2+k9uOhYZlq0EIK7IE0j4QoqTfIg=
X-Received: by 2002:a25:5c5:0:b0:66c:b809:ddde with SMTP id
 188-20020a2505c5000000b0066cb809dddemr14887386ybf.67.1656678732847; Fri, 01
 Jul 2022 05:32:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220628042117.368549-1-richard.henderson@linaro.org>
 <20220628042117.368549-13-richard.henderson@linaro.org>
In-Reply-To: <20220628042117.368549-13-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 1 Jul 2022 13:31:34 +0100
Message-ID: <CAFEAcA-1Ds-EYL5sybAb5BNh7LAVF_0N9itw8FRyqW1CGrview@mail.gmail.com>
Subject: Re: [PATCH v4 12/45] target/arm: Mark gather prefetch as non-streaming
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb32.google.com
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

On Tue, 28 Jun 2022 at 05:42, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Mark these as a non-streaming instructions, which should trap if full
> a64 support is not enabled in streaming mode.  In this case, introduce
> PRF_ns (prefetch non-streaming) to handle the checks.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/sme-fa64.decode |  3 ---
>  target/arm/sve.decode      | 10 +++++-----
>  target/arm/translate-sve.c | 11 +++++++++++
>  3 files changed, 16 insertions(+), 8 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

