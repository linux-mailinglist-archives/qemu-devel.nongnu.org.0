Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A003D578247
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 14:26:21 +0200 (CEST)
Received: from localhost ([::1]:54638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDPpM-0004RY-Rh
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 08:26:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDPas-0000Xc-DS
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 08:11:22 -0400
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a]:36470)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDPar-0000MU-0d
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 08:11:22 -0400
Received: by mail-yb1-xb2a.google.com with SMTP id n74so20388741yba.3
 for <qemu-devel@nongnu.org>; Mon, 18 Jul 2022 05:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0bEvq4JZ2l4t0TpcPn060hVTc5d5n0yzJI79z4Fhha8=;
 b=T4+twIJbuIS9giIRbxP0Y7zXZznjys6mzyJLSEJ7EnmMJx6pLE968YOPzTN3NTkLFL
 Z8PXBsFZwprQlh/D0xCRwLBa9LepyY1idM3+oEpW09tBMVAmdyxWYBdBp2KEvsIxC2UH
 bOLE4Gza/F0r3f1EgR+5WsYwe19edZCUAWLnygOs/ehnRDAaha2JxwO0JQkLBZw1x8xa
 aKqtPaflcUykFYLL1+vXJzRvEkoG3Qj1LKdAFVj4pJxxtb3ViX2ho4+GxpbhYMqP639z
 7ElX7y36EjWEwdnu0iqgjlDtonXAfRJZ5emPg0799eS7XYBc2zytsUl5hM/UsmH0eufp
 7peA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0bEvq4JZ2l4t0TpcPn060hVTc5d5n0yzJI79z4Fhha8=;
 b=pxIHqvTSnmbpmh9TF/6QSj/Jw5OqVEAAW0dcW7S3R8k1Rsizl3T2LkvHvEFCTlgIFX
 Xi5zauNeuUj6eQtG120k9/od80w+vnpHaTjgQnCHwF08Jvb00L9W3MZXkjwDCp2zpdIs
 2R/0wrDBn1gTLJifD/8URc/WFJwLqkudrUullIvwwc8xT2gTvm+M0hQ0eCnUxHNBSNEh
 PKXeYNKAqKiiD4R2rWuEULSLL5KPaBU/73S59F0ztr1pQPMm0rb1wCQsuyj89KKXesBZ
 5hm1048igGxqeYjTXcLL7M/qFm2uyse1EkpbkdshxkYvBMu5A1S149FCfaOyyzEODOOU
 8ksA==
X-Gm-Message-State: AJIora8r1bzA/NboSWUoFIx+g+sLWYdLjiKxaapoqMVvlccFQCpViblO
 /j7i0x4q4Gu0dm4duYlewqH/iMtq0CXCFHpXf1SQNVII0Mc=
X-Google-Smtp-Source: AGRyM1t+87pX6lTDRx+EEGfOBbYVcsI/gvTCdc42undONt10MwS0bijBueofr5TNhu/lZiQEZnrYfjSueayPsGZTsXM=
X-Received: by 2002:a25:2f58:0:b0:66e:cf9a:6a2 with SMTP id
 v85-20020a252f58000000b0066ecf9a06a2mr29033649ybv.193.1658146280004; Mon, 18
 Jul 2022 05:11:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220708154700.18682-1-richard.henderson@linaro.org>
 <20220708154700.18682-30-richard.henderson@linaro.org>
In-Reply-To: <20220708154700.18682-30-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 Jul 2022 13:11:09 +0100
Message-ID: <CAFEAcA9x-2eX3U-xfUyhnFmp-MZAuEtAmjs5NqLi+PkvZGhzTg@mail.gmail.com>
Subject: Re: [RISU PATCH v4 29/29] aarch64: Trivial SME test
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2a.google.com
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

On Fri, 8 Jul 2022 at 17:59, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  test_sme_aarch64.s | 55 ++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 55 insertions(+)
>  create mode 100644 test_sme_aarch64.s
>
> diff --git a/test_sme_aarch64.s b/test_sme_aarch64.s
> new file mode 100644
> index 0000000..a5ef909
> --- /dev/null
> +++ b/test_sme_aarch64.s
> @@ -0,0 +1,55 @@
> +       .arch_extension sme

Can we have the usual copyright-and-license comment at the
top of the file, please?

thanks
-- PMM

