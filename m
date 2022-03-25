Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 361B64E7348
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 13:24:27 +0100 (CET)
Received: from localhost ([::1]:41724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXizS-0008OO-A9
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 08:24:26 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nXisD-0003xT-Gh
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 08:16:57 -0400
Received: from [2607:f8b0:4864:20::1130] (port=46589
 helo=mail-yw1-x1130.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nXisA-0007DW-Ur
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 08:16:56 -0400
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-2e5e176e1b6so80740727b3.13
 for <qemu-devel@nongnu.org>; Fri, 25 Mar 2022 05:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xx1Clygi4T+OeBUvtZ39GpyQk6v+E7nZmHCU0gmtMEw=;
 b=Ns9De7nEGDoJksZP2oBNX4SIulnC4AoZtCEwfBWYXabg8gmIYVrDxP+TvY4yO1Xh+v
 1FTUALFIGu5iqwihSKBi2R2zOaLDuZVC3XjqbYvjM5XixDTnpgtHISBSLWF8fXPE48y4
 LpYPJ//pzGAt0p15TbftozI7OkVjg+kxgKIGQs0lj8IhyRVkzfML+lf3/vOJtahe7B0Q
 eNhwvj89XBj5ymB01pcGsQQeGbi17KwnSnHlN+MjeGHgoFEHo0Uzq8q/hfYCe4nNHGwK
 hnmLd/s0ua/NNl7UxsvD72BblpF9EDPhCKIcj2Kr/tqH+Wvjv/WmppYjTrYnfeTLm0Lg
 Ug8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xx1Clygi4T+OeBUvtZ39GpyQk6v+E7nZmHCU0gmtMEw=;
 b=sF2tglON2MGbORH+vSZaGAZ/FsQVgV40MrIJ3HfP3YvHyV5Vnb+LmRE7Di6eFHL3jc
 4Ky9jk9+V36tddRGSIkePvtceVSiJleNg0K44esxTS7sTQe5Efc0gRSKwlN/b71r/zvM
 Tg7TuF7qM+8oZXTfBEBFCTlMwg96ZZBCJdakxEh2L0iOAYCeAzQA8tlCon4UqM0YKKN+
 Tikftze39QIgNp1gnf+24BlL3LWHI2AUf/JQADfYnacASEhuq7R/fKwmZZ3OyVprt6Ws
 8BdCPDB+ykKLIOIUvyLl6T8FGMQWFNxdBRuySB9Mv1mdietqUMWdO/H4+336fEr4/Clz
 Qo6w==
X-Gm-Message-State: AOAM530Uw/+JWI0qdSvhH4AAQ/inuXhnLPOTHMyqeUUmdbxtxBcBUp4i
 LUYCpkmN2jgles61Z6+G93vl1QzBABVKLyyGXS8ksA==
X-Google-Smtp-Source: ABdhPJwiO+Cfl+oyUTxlFFthvebIMr4NvSn1iezMUBYc4oXok4oOdD8rVzqozSNhU0FlG2jHf+GqxSqPlFdoTU0okUI=
X-Received: by 2002:a81:a4e:0:b0:2e5:9946:525a with SMTP id
 75-20020a810a4e000000b002e59946525amr10018652ywk.455.1648210613994; Fri, 25
 Mar 2022 05:16:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220320160009.2665152-1-richard.henderson@linaro.org>
 <20220320160009.2665152-8-richard.henderson@linaro.org>
In-Reply-To: <20220320160009.2665152-8-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 25 Mar 2022 12:16:41 +0000
Message-ID: <CAFEAcA99Z1Ku0f31fM+RsOzyjJxU6bytU7SwFTs7ZDfoRXAsfg@mail.gmail.com>
Subject: Re: [PATCH 7/7] tests/tcg/nios2: Re-enable linux-user tests
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1130
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1130.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: alex.bennee@linaro.org, qemu-devel@nongnu.org, Laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 20 Mar 2022 at 16:14, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Now that signal handling has been fixed, re-enable tests.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tests/tcg/nios2/Makefile.target | 11 -----------
>  1 file changed, 11 deletions(-)
>  delete mode 100644 tests/tcg/nios2/Makefile.target

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

