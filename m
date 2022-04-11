Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D3AA4FC1E5
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Apr 2022 18:09:36 +0200 (CEST)
Received: from localhost ([::1]:46012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndwbf-0008T7-5t
	for lists+qemu-devel@lfdr.de; Mon, 11 Apr 2022 12:09:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ndwTY-0000sf-Kn
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 12:01:13 -0400
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f]:36464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ndwTW-0003s5-1D
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 12:01:12 -0400
Received: by mail-yb1-xb2f.google.com with SMTP id f38so28311093ybi.3
 for <qemu-devel@nongnu.org>; Mon, 11 Apr 2022 09:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=v0I2JaqxtIsEx5SmzX+favuz5CQeeHHWeNGeBomrWEY=;
 b=Foj8fV9i5zpWW/BXF9p5XYMXz+Z2ymOqtG8iLgRBAkXPNl/ueNF4LJ3UXmdOYhjY1L
 ElbPPjIeZCJA0cxbZL7Cjp7M3tD+7aR/dSVn30WWwv2oeNPa4aeBSFPQgN7fkFnXbCHo
 9F2PZPrT5UK9RoUe2TWRrFnCQxH5KS7s8CSrBJEiyP6VfG3ELzz6DqzgT3rdfgXm7rpG
 THMPLA/pDViTki+CNYJbyhpdKBpZ2aSUe4ZIf5LJU/CRXI6T8x7s6lT7mWkQp4vJslUM
 yspApWwD1ngb80w1MHjqbzwOqS96qvzvBhmTG6vf0Qiwf3btg/vl26zBswgjvuSjSzEf
 +0MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=v0I2JaqxtIsEx5SmzX+favuz5CQeeHHWeNGeBomrWEY=;
 b=zZFARpcjbgWr6nbxeV6Gk8YVRZ3Lso6VmWLFwiuluDKMOxRVf1v4zLSGl57ui8WfW8
 tQOfshpxYLvzE+Rk7L5HM1+eC2posjUHPAhd27X/DADhWwbpGB21XrSRz9Xd9ISrLeCN
 PQ7ri1TFh4pzGQh5RhZi2Re5LYSXQ5cPvwkRHzywdu9EK8xFp/CCkX9xzCxQouTMWhof
 1YkR7lQUds4vi9YMSGQtpo5daftDCgkynm6RfP6pBd8fhVeTwJYn5pbUfXlK+eQS5H2Z
 GvEgnpQBuvsxzUVkcV5K/fOwP5s/iQcWD04JPflVTFB+WFaeKMNe6U+iURCN6DceR2dZ
 H7WA==
X-Gm-Message-State: AOAM530TLDdwdfpJEQEUIqxD6q9Idp6UhadRaFZ5hKAnTSzVBi39kV/v
 d7yMquYPr7omHmK/fHS5bswT423hLSqWhsFTUXS45g==
X-Google-Smtp-Source: ABdhPJz79pxUtj5YyNnwGhpbVKIN2nySEhdK8mS+l0C2M+l4tdjREQuAx3lsQtUEANORqBB+EN2yIJ92KtJefUyPZuE=
X-Received: by 2002:a5b:6c1:0:b0:633:b5c7:b9b7 with SMTP id
 r1-20020a5b06c1000000b00633b5c7b9b7mr22941998ybq.67.1649692868919; Mon, 11
 Apr 2022 09:01:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220409000742.293691-1-richard.henderson@linaro.org>
 <20220409000742.293691-14-richard.henderson@linaro.org>
In-Reply-To: <20220409000742.293691-14-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 Apr 2022 17:00:58 +0100
Message-ID: <CAFEAcA84JRXpwUzigYAUoN5Oz4RgQhpvFmukB5q2JhCqFPcD4w@mail.gmail.com>
Subject: Re: [PATCH 13/16] target/arm: Implement virtual SError exceptions
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2f.google.com
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

On Sat, 9 Apr 2022 at 01:11, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Virtual SError exceptions are raised by setting HCR_EL2.VSE,
> and are routed to EL1 just like other virtual exceptions.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.h       |  2 ++
>  target/arm/internals.h |  8 ++++++++
>  target/arm/syndrome.h  |  5 +++++
>  target/arm/cpu.c       | 38 +++++++++++++++++++++++++++++++++++++-
>  target/arm/helper.c    | 29 ++++++++++++++++++++++++++++-
>  5 files changed, 80 insertions(+), 2 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

