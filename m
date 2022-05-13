Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C8E15266D6
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 18:14:34 +0200 (CEST)
Received: from localhost ([::1]:47558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npXw1-0004vA-58
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 12:14:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1npXdA-0006h0-IX
 for qemu-devel@nongnu.org; Fri, 13 May 2022 11:55:04 -0400
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a]:38763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1npXd5-0001g8-Uq
 for qemu-devel@nongnu.org; Fri, 13 May 2022 11:55:04 -0400
Received: by mail-yb1-xb2a.google.com with SMTP id m128so16031546ybm.5
 for <qemu-devel@nongnu.org>; Fri, 13 May 2022 08:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6UhJfUW8L+X68i9qleXVi3RrwzbG9BOloCbG9SFQF1c=;
 b=uWQn9my/die67dtUmuM9K21Yq4bd3xhwmdvcdRlliuxtc5vtEaIK7XpnzRVPEuboOx
 S6ZSVfOqu6cBHKawTeNBDuA4QZF0IhaNLD9axbVfH6h28pom+8x+9RNAailksw6mufZv
 lBX7fP5/TM9qJtwjUjVoNpB4lu9WS4QaBs1mAx/jneCmtMdN/i2fP94l11Z3Y9DV3F3c
 2Xx0rDppMINR4w+9xY+G5a96YbxNWInQK26tUtAonoXHrwLaXu+ThFQhGNajQX9LxgoL
 izppxmasNWMKGpSPLtvYtm/RdC5tCsYufGvepwQ8kQkglNcsD6s68SKSKFjVyEjOfTZG
 RQDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6UhJfUW8L+X68i9qleXVi3RrwzbG9BOloCbG9SFQF1c=;
 b=A4Z9SoY5T3cq5vm4rQTwtOtC95iC4kC0kekrXOMXkWY6BOFU2A5frbFE07/Ii+kF0g
 Yijz5l9umb4GsrAjbTH0lcrN0m6QbKnzhNeheaq71VcgPMUrTbMVTHUWUHh7XJiXsyIS
 pyomc3qDRxQVdee4Q8TZvEhvXH8+gPlSa+CUiqXihqavVO3bi/g8OOqY43OiOAMVlzM6
 pLl+tSWaPCbOcEbvjeMp7Yt/zyTvZVRA7DhZe5Oh5/tnIvO/JtfrG2dXmzcZboylWqBI
 ahfl4WBOv2ro2gS6CxvDJoCzDUY1uLX6mZao6V5oHKy6IJwPMnA2HFujzj1srXOllcDI
 513Q==
X-Gm-Message-State: AOAM532yYpkiqVqTUZ/jz+rw/yLJCnM7cDkxUQ+KtQj/0nYfDYo5nMTr
 5go/SYHx4MX8tu4++CPWJr7Djq0AbGTKC+AHdPniOQ==
X-Google-Smtp-Source: ABdhPJzMtjyAXEi3dwd+16W2d+px2r3k8knMvQUxVGy6gKIMDssbjWMwnUjY2x7nzlTL/a0zkoCD7rArRtJiVCaUif8=
X-Received: by 2002:a25:8f82:0:b0:64b:4d9:46fe with SMTP id
 u2-20020a258f82000000b0064b04d946femr5416770ybl.479.1652457298835; Fri, 13
 May 2022 08:54:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220504110521.343519-1-thuth@redhat.com>
 <20220504110521.343519-7-thuth@redhat.com>
In-Reply-To: <20220504110521.343519-7-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 13 May 2022 16:54:47 +0100
Message-ID: <CAFEAcA-smunqB+Q9NfD=1=QJT2pAZ+OqZTe==ZYbZkx9Rp=pMA@mail.gmail.com>
Subject: Re: [PULL 06/15] target/s390x: vxeh2: vector string search
To: Thomas Huth <thuth@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org, 
 qemu-s390x@nongnu.org, David Miller <dmiller423@gmail.com>, 
 David Hildenbrand <david@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

On Wed, 4 May 2022 at 12:55, Thomas Huth <thuth@redhat.com> wrote:
>
> From: David Miller <dmiller423@gmail.com>

Hi; Coverity thinks there might be an unintentional overflow
in a shift in this function (CID 1488734). This particular
Coverity heuristic seems to be very prone to false positives, so
if you think it's wrong I'll just mark it off as an FP in the web UI.

> +static int vstrs(S390Vector *v1, const S390Vector *v2, const S390Vector *v3,
> +                 const S390Vector *v4, uint8_t es, bool zs)
> +{
> +    int substr_elen, substr_0, str_elen, i, j, k, cc;
> +    int nelem = 16 >> es;
> +    bool eos = false;
> +
> +    substr_elen = s390_vec_read_element8(v4, 7) >> es;
> +
> +    /* If ZS, bound substr length by min(nelem, strlen(v3)). */

[..]

> + done:
> +    s390_vec_write_element64(v1, 0, k << es);

Specifically here, because k is 32 bit but s390_vec_write_element64()
takes a uint64_t argument, we will do the shift as a signed 32 bit
value before widening to 64 bits, so if the values of 'k' and 'es'
are such that we might shift beyond bit 32 we'll get the wrong
value. It looks like 'es' is one of the MO_* values, so generally
small, but the upper bound on 'k' is a bit less obvious to me.
Is the overflow-of-32-bits case impossible?

> +    s390_vec_write_element64(v1, 1, 0);
> +    return cc;
> +}

thanks
-- PMM

