Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 741AD37C3BA
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 17:23:55 +0200 (CEST)
Received: from localhost ([::1]:39516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgqiI-0000Ro-Ji
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 11:23:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgqg8-0007Ar-Cl
 for qemu-devel@nongnu.org; Wed, 12 May 2021 11:21:40 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:34581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgqg6-0002T7-Ra
 for qemu-devel@nongnu.org; Wed, 12 May 2021 11:21:40 -0400
Received: by mail-ej1-x62c.google.com with SMTP id a4so35602042ejk.1
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 08:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yQzqJujMg8+OBARjbP9X4fTPf7LBFaB4n42rLPvtzHA=;
 b=tlnNykyHPpAE4NIfWe9+1DBQA2kReTfoeDRRw6G1O/wUu9B30YMj0NQpO/C/4yqn3S
 kYPGSlmNAA0QmGaMsuInygtlOHRAdnwOeuxZxcmSKJqrO/vorymnFMXAA7joGED1XqTY
 QjHuaAPHKuRkCCCjrG0l/XHzeRUCZwDAL3iZAAXn8MixCb9t9SyMIEWIPp6vMVCVPTXv
 SijJ7s6XQdr5UTUn/P9wlySK/n4bW/cKiwU/lxUqoIi7Hz9UHW/ByJbKkyLNMX+NAjxK
 e1zDdTRqkVhI95H2l+dUGSJKvwa6dyR2xWd+7f1IuPqOTdHpZyH7o2os7IIzeR2VVTOU
 GMUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yQzqJujMg8+OBARjbP9X4fTPf7LBFaB4n42rLPvtzHA=;
 b=h8IDmzuvaexiwrAE0amFp640+lbulYH0G1+v8XVMgoCAKGMpWk260H7WmBhK3fXvVa
 dzSlr1pwg1M5UDWDgD2Uy2XQLsKJF+gd8NdMUgEWjIkmZfgTJbgKp8XJZVZJ9YeFkA8F
 AG/t2NvpP8l4ajyt2EiuFyD5OADHEUVt9R87JVtDPV+SEJP3HfCYdJismdVo+Qd0SRaq
 89t1VlqoXSlaQA6vWtb0f/ITYGoBAMVg58jwyaBGgqvzPVr4RgYL9VnLLbSkFDeoRoj1
 fCcthrWYBOThssXN2TVSo5F61HcDg2vc2UCpka5bXlwUSKoLmnSbbV5iPwrzpeZxF8B1
 Go5Q==
X-Gm-Message-State: AOAM530FyJz6EZ+gsBisvk5rRiQOCbi2sgVY6p8phbOSezJ9dvyM1Fmf
 VVlo41nSDP+INBlSoQxwh/gWeiu/ycHQs8o9fRw+sg==
X-Google-Smtp-Source: ABdhPJzI6V57/9wXuR1v7S3Hpt/FrnkY0vFORgPDOMOPunuryzvgVdPhT0Pd4ukWLim6mrWGDq5yNj7SM1DEeuXpYp4=
X-Received: by 2002:a17:906:eced:: with SMTP id
 qt13mr37868587ejb.382.1620832897492; 
 Wed, 12 May 2021 08:21:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-38-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-38-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 12 May 2021 16:20:23 +0100
Message-ID: <CAFEAcA_SFRDtiB6v3xfkE44tNRypX7JDD_FKXgpyevkwo3cP7w@mail.gmail.com>
Subject: Re: [PATCH v6 37/82] target/arm: Implement SVE2 complex integer
 multiply-add
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 30 Apr 2021 at 22:00, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v2: Fix do_sqrdmlah_d (laurent desnogues)
> ---

> @@ -1448,6 +1448,48 @@ DO_SQDMLAL(sve2_sqdmlsl_zzzw_d, int64_t, int32_t,     , H1_4,
>
>  #undef DO_SQDMLAL
>
> +#define DO_CMLA(NAME, TYPE, H, OP) \
> +void HELPER(NAME)(void *vd, void *vn, void *vm, void *va, uint32_t desc) \
> +{                                                               \
> +    intptr_t i, opr_sz = simd_oprsz(desc) / sizeof(TYPE);       \
> +    int rot = simd_data(desc);                                  \
> +    int sel_a = rot & 1, sel_b = sel_a ^ 1;                     \
> +    bool sub_r = rot == 1 || rot == 2;                          \
> +    bool sub_i = rot >= 2;                                      \
> +    TYPE *d = vd, *n = vn, *m = vm, *a = va;                    \
> +    for (i = 0; i < opr_sz; i += 2) {                           \
> +        TYPE elt1_a = n[H(i + sel_a)];                          \
> +        TYPE elt2_a = m[H(i + sel_a)];                          \
> +        TYPE elt2_b = m[H(i + sel_b)];                          \
> +        d[H(i)] = OP(elt1_a, elt2_a, a[H(i)], sub_r);           \
> +        d[H(i + 1)] = OP(elt1_a, elt2_b, a[H(i + 1)], sub_i);   \
> +    }                                                           \
> +}
> +
> +#define do_cmla(N, M, A, S) (A + (N * M) * (S ? -1 : 1))

Could we rename this just so it's not different-in-case-only to
the other macro ?

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

