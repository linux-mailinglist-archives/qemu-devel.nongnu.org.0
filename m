Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98FB95599C5
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 14:43:05 +0200 (CEST)
Received: from localhost ([::1]:53978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4ieO-0003qG-LP
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 08:43:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4ibu-0001zA-G0
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 08:40:30 -0400
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b]:42667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4ibs-0002SV-UL
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 08:40:30 -0400
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-2ef5380669cso23323507b3.9
 for <qemu-devel@nongnu.org>; Fri, 24 Jun 2022 05:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HXiyYsRDcy+goWf33NkgqqZbH4DExYqILi5Tpqs6LBQ=;
 b=E+8Kyz07bH9d2+CVPfruVeBEe5QvffXwPxCFspsHn6YT3/uPjNOWHLH7bzQ2ZcEcGh
 NtWtHzt480TzT39+PsWzJ23n1FGfW4EmI7eSUeJ32odljSUPsRgCKMZFIT5XP8HU5ySU
 8s0yqUyeOmLmdgF9zdJH16YLXxobHt0l1RDH9eFk1mrWDR+1znPJLV+q9Rulo3C8vnDZ
 fFzXHlGFtbQuq5jIXaDsLgRt9vLdGLjGWGBZAdf2AXcqALmISTaBVMxC6qm3qFO567Su
 MeGybYwWsDcfaI9BjNiw8flEReFBcg38WvodruvEfZSYX9cPHIKe9JQ/lTVDovCNzvo/
 OUDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HXiyYsRDcy+goWf33NkgqqZbH4DExYqILi5Tpqs6LBQ=;
 b=IhtDLUyYRstNs8j0R7j5NRtSrsN8zBPoicGSUtjhZ0a+gcVHmRH95CH+fqh1RuKPrT
 SYzVom6T9MNpqGLe9DwTXqzmcBZ/H63q5nt8yWTCkD8FFIXyuJYrFedPv2D4O6rNHnxW
 57LR6ytSP9NJlNhaiwS2JO1o1zwn7p1d5XPuUTzGslHWOJehHWUk/HleaHtmMeQXkJBm
 Z3HJCesL33wUXESrmQ7hsDsGF14uZprOxoeko0VJWCHCPMQLPBQfc4IGCUkVS4Ln9RAc
 wnxoWxcV+rTDRlBdrcaLi2I1AdyIC+bus523GftpQCDijqFeiLcsKF6K+5q0bvc9K4rQ
 p2hQ==
X-Gm-Message-State: AJIora93EsXBO4g2uWG4dVWiHfSV46DmLS6iA0lHDIXhc/PngJI48BUM
 fAma/vLwerws//GM0q255pIVmHrzyRwj6J+Cs44M0Q==
X-Google-Smtp-Source: AGRyM1tW8MjoPEtDLAD1/RV6BRWSAhVA0GYUaRHU0DHdYaglDuGm/J7H6LzKxS1tDR6t+YXaYAsjrk0bN926VDO4MtA=
X-Received: by 2002:a81:8486:0:b0:317:a4af:4e0a with SMTP id
 u128-20020a818486000000b00317a4af4e0amr16796298ywf.455.1656074427839; Fri, 24
 Jun 2022 05:40:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220620175235.60881-1-richard.henderson@linaro.org>
 <20220620175235.60881-34-richard.henderson@linaro.org>
In-Reply-To: <20220620175235.60881-34-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Jun 2022 13:39:50 +0100
Message-ID: <CAFEAcA9cC0MauM9AjcSBw=BKmaD8fP3eLjKOaA96nkjeU4KRCg@mail.gmail.com>
Subject: Re: [PATCH v3 33/51] target/arm: Implement SME integer outer product
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112b.google.com
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

On Mon, 20 Jun 2022 at 19:29, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This is SMOPA, SUMOPA, USMOPA_s, UMOPA, for both Int8 and Int16.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper-sme.h    | 16 ++++++++
>  target/arm/sme.decode      | 10 +++++
>  target/arm/sme_helper.c    | 82 ++++++++++++++++++++++++++++++++++++++
>  target/arm/translate-sme.c | 14 +++++++
>  4 files changed, 122 insertions(+)

>  /* TODO: FEAT_EBF16 */
>  TRANS_FEAT(BFMOPA, aa64_sme, do_outprod, a, MO_32, gen_helper_sme_bfmopa)
> +
> +TRANS_FEAT(SMOPA_s, aa64_sme, do_outprod, a, MO_32, gen_helper_sme_smopa_s)
> +TRANS_FEAT(UMOPA_s, aa64_sme, do_outprod, a, MO_32, gen_helper_sme_umopa_s)
> +TRANS_FEAT(SUMOPA_s, aa64_sme, do_outprod, a, MO_32, gen_helper_sme_sumopa_s)
> +TRANS_FEAT(USMOPA_s, aa64_sme, do_outprod, a, MO_32, gen_helper_sme_usmopa_s)
> +
> +TRANS_FEAT(SMOPA_d, aa64_sme_i16i64, do_outprod,
> +           a, MO_64, gen_helper_sme_smopa_d)
> +TRANS_FEAT(UMOPA_d, aa64_sme_i16i64, do_outprod,
> +           a, MO_64, gen_helper_sme_umopa_d)
> +TRANS_FEAT(SUMOPA_d, aa64_sme_i16i64, do_outprod,
> +           a, MO_64, gen_helper_sme_sumopa_d)
> +TRANS_FEAT(USMOPA_d, aa64_sme_i16i64, do_outprod,
> +           a, MO_64, gen_helper_sme_usmopa_d)

I think this is one of those places where I'd say that wrapping the
lines reads worse than not wrapping them. But either way

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

