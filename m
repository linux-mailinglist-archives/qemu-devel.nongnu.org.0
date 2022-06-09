Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF4205453DE
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 20:14:48 +0200 (CEST)
Received: from localhost ([::1]:49588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzMgB-0003fs-35
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 14:14:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzLSh-00022C-5v
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 12:56:47 -0400
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134]:46071)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzLSf-0007s9-Of
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 12:56:46 -0400
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-3137eb64b67so46142147b3.12
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 09:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fyVQo7wdhjYapRoaYjhTIqTT7TmyaWOnqvPALxrP9T8=;
 b=z8ZsMAhpiql7KBj25fvlPecbgG88E2F6GJX5Bz2XpmlzEt2N47j/zG1sZipwOK79zd
 CquzH1ZXDew0rM9QCDmoVM+6qD6boV2q0WLH+tAAUrkuqgvw2n76+iXCb41m/e0JMYNI
 SosFSlwKty4p5BK6h7KHa/XGT4zlodD5fJDpWLOl15LaRLQLAuxv745Mqazl9pwlbQrT
 C+3AXvyrKgUBsCSl09H2Z71v5xlNh0tjtkMhlKyigJbqBfEmxGDZ5XpeONEznlzmWi4s
 wQw2jx4dyM/Fd01/NZr5XXnL/BzTSOgI3bV2d3B8N8q31zVCxlSN8HlkwSXjfgrjImOH
 hkIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fyVQo7wdhjYapRoaYjhTIqTT7TmyaWOnqvPALxrP9T8=;
 b=iyiweSxCVHHCBcIwWvmYzdI1jyZ5jcxx5EHqQ884ZDyfLPBKwipPkvvrU5Zyw9xmIM
 LeRhp9ORn1O4KfLVWCmk6ECf+wSs0TDpjPKwrG8onkdoAkJOau1le3zvZxQtpOpmKb85
 IOlnYySwPIYqzWw+8wSVtnwYLvSj0aHP2WqL4WmWOGdy+5b3Rif7cAV4cOA5atjwQ6dK
 x81/THH8LZIrIfYCnfiHMt/qC5of0QYZercYWST42LJg69lKPOo011GdXzyRsw4D8m5X
 unQlwYKgX9MKthS1oNtQ3ARhIYbiN2p62n1RVoeR3IMWa1EmOkpJ0YSKDugnA+PgTDwz
 nC0Q==
X-Gm-Message-State: AOAM5327o+AmWUG6NEnzDcwOVTaZ3ZrWDHP+35+hZM5gqWr96nnk7yXX
 1R0l1j3TYQTIrpS/oE6zYJSzUhAqlu6PDb3Bfwp6og==
X-Google-Smtp-Source: ABdhPJzGtaD1kd2Vppb0wgr9lBtZkcRm/MMZ6Ra58JyhdcRQJyHOFE5DvRy4NT2KBNf5jat6PPx0nCTLtP6as8xJWHA=
X-Received: by 2002:a81:1a4c:0:b0:30c:8363:e170 with SMTP id
 a73-20020a811a4c000000b0030c8363e170mr42594315ywa.455.1654793803376; Thu, 09
 Jun 2022 09:56:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220607024734.541321-1-richard.henderson@linaro.org>
 <20220607024734.541321-26-richard.henderson@linaro.org>
In-Reply-To: <20220607024734.541321-26-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jun 2022 17:56:32 +0100
Message-ID: <CAFEAcA_7neMttTok4r4tq6SdWzweYjE=wYMQgtSQdBF==AouuA@mail.gmail.com>
Subject: Re: [PATCH v2 25/25] target/arm: Fix Secure PL1 tests in
 fp_exception_el
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

On Tue, 7 Jun 2022 at 04:02, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We were using arm_is_secure and is_a64, which are
> tests against the current EL, as opposed to
> arm_el_is_aa64 and arm_is_secure_below_el3, which
> can be applied to a different EL than current.
> Consolidate the two tests.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

