Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55FE5545254
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 18:51:00 +0200 (CEST)
Received: from localhost ([::1]:60314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzLN5-0000df-9A
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 12:50:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzKCH-0002SI-HM
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 11:35:45 -0400
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30]:47071)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzKCF-0002o9-84
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 11:35:45 -0400
Received: by mail-yb1-xb30.google.com with SMTP id r82so42333676ybc.13
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 08:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7RyrKD33/Nh1oTqfp2KPkfxJKWqGtPCiPeeEOQuP+Xg=;
 b=rXNBLcGuMprbY/ZB+xuXOV41cyZXzIqtKzd6fIrhfoQk15c9MvqYiKd7y8sYHQosuv
 ixI8dVGdPMquoXlfwaMrStd2S6m/skKWIvPINr0tFveYWOEg48CYVMax6Lk0PNVN4QF7
 1uQW24fgp/JdcU+LfARTyAb8Dei2W0VQyT2jAWYCJfZf91AZizNOU+abfff5EGvYOlES
 YX2iFs5qJGnDZ4NnoQYwFB7kkFDq1L8EWYgaqO6sQAYHbe+VsBJGMWfQej3E/2yiq912
 WzTIrXic2Afq0raZLBVTEKuR2TW0LFXrg+ortiEu3m3UHvZUfEcSZGLjkIWIOcpfvKgY
 PUIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7RyrKD33/Nh1oTqfp2KPkfxJKWqGtPCiPeeEOQuP+Xg=;
 b=pfVuefEuV1iaaXHk6f1HJc+HqoBjF1+qTvIZ2i/jDG+m0hZUexR7K124A/22ZaYQnu
 vyv7XkyFVIxgd5pKvSuTy/I2IzmNnVd8JgIJSvrQ8iagU3vj7BujHAb2u6/zb6Cxj5mV
 cz42EhAx5C6ODQk6jQYdMaQnE0XCms0b11heWGQT42P3nElNYpCPa+hGpF055NDW2FWA
 lnuYbYXXJxbAV+kgZ8nNdN2aIYemit8doQh5nPMtGx18Dk8U3739kEOX7CSyUZaPumCQ
 xcODZWgkzdJ/E7mBr1dSp2jnWff8enNg46JuQFYKQxuVQOXdHBwFD6usgrQnjYMUI5D2
 N9MQ==
X-Gm-Message-State: AOAM533aPD5mW1bYPMpBkx/ezUJ+Ryc4k9Z1tc1OfMVN1tio4xLK8ge8
 WWuCmum8YUEReY7pJvoHKlZS2PY9XnTC4yKOlj0Rag==
X-Google-Smtp-Source: ABdhPJxAVJb/jhxrYN9EKV0yn6zvTky7l7Ref9wzaaf/p/pfEs/NyZAj9BeNoTXkpbKZvef7fEP/QgAdbhjo/b9dQ0Q=
X-Received: by 2002:a5b:d42:0:b0:65c:a0d7:4c6 with SMTP id
 f2-20020a5b0d42000000b0065ca0d704c6mr40056375ybr.193.1654788942163; 
 Thu, 09 Jun 2022 08:35:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220607203306.657998-1-richard.henderson@linaro.org>
 <20220607203306.657998-42-richard.henderson@linaro.org>
In-Reply-To: <20220607203306.657998-42-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jun 2022 16:35:31 +0100
Message-ID: <CAFEAcA9jEYarLY_srx8bo5EUhW5+-pP_3pcbv+H4MomYve25ZQ@mail.gmail.com>
Subject: Re: [PATCH v2 41/71] target/arm: Add infrastructure for disas_sme
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb30.google.com
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

On Tue, 7 Jun 2022 at 21:36, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This includes the build rules for the decoder, and the
> new file for translation, but excludes any instructions.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-a64.h |  1 +
>  target/arm/translate-a64.c |  7 ++++++-
>  target/arm/translate-sme.c | 35 +++++++++++++++++++++++++++++++++++
>  target/arm/meson.build     |  2 ++
>  target/arm/sme.decode      | 20 ++++++++++++++++++++
>  5 files changed, 64 insertions(+), 1 deletion(-)
>  create mode 100644 target/arm/translate-sme.c
>  create mode 100644 target/arm/sme.decode
>
> diff --git a/target/arm/translate-a64.h b/target/arm/translate-a64.h
> index f0970c6b8c..789b6e8e78 100644
> --- a/target/arm/translate-a64.h
> +++ b/target/arm/translate-a64.h
> @@ -146,6 +146,7 @@ static inline int pred_gvec_reg_size(DisasContext *s)
>  }
>
>  bool disas_sve(DisasContext *, uint32_t);
> +bool disas_sme(DisasContext *, uint32_t);
>
>  void gen_gvec_rax1(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
>                     uint32_t rm_ofs, uint32_t opr_sz, uint32_t max_sz);
> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
> index b1d2840819..8a38fbc33b 100644
> --- a/target/arm/translate-a64.c
> +++ b/target/arm/translate-a64.c
> @@ -14814,7 +14814,12 @@ static void aarch64_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
>      }
>
>      switch (extract32(insn, 25, 4)) {
> -    case 0x0: case 0x1: case 0x3: /* UNALLOCATED */
> +    case 0x0:
> +        if (!disas_sme(s, insn)) {
> +            unallocated_encoding(s);
> +        }
> +        break;

I still think we should check bit 31 here.


Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

