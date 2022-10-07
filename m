Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 752FD5F76D8
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 12:26:46 +0200 (CEST)
Received: from localhost ([::1]:37092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogkZ2-0000YA-40
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 06:26:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogkT5-00061K-1S
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 06:20:38 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:47026)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogkT2-0007LN-Cl
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 06:20:33 -0400
Received: by mail-pl1-x636.google.com with SMTP id l1so4115974pld.13
 for <qemu-devel@nongnu.org>; Fri, 07 Oct 2022 03:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3DbUMGitbMy6esaYizF14zFSnk0Tfx9h+t4pbVOaOF0=;
 b=uMkzFr5bvFVKqAEc7xmvruT8m+DXzWyaoYDZI9eNReYCqIkoWGCJRAu78fXTvL0lFc
 huWTIbQI5L9I80lEn9rQknmU8V4uqP9GiKuDF2Pyw6m2gqchvGLKC4X3dycXf7p/N9qB
 v9AjJT8VE7tZaRp9HKRIVVHRwA81pHxx4U/z/DbwbwHD90yVzUPjgdD0n/UVhR626cNa
 GX081ses53fny6k/fieABJcU1T4VigCQb4mr9VI++b1NG+WDQjxbeLiRLhPWTW3lkydk
 +1TafL/05OWR9Z5pnBUxA1uVuyYllWKKnQbLgynHqgGZ3OeSeX9ToGc79uAilS09uJbT
 HDJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3DbUMGitbMy6esaYizF14zFSnk0Tfx9h+t4pbVOaOF0=;
 b=Xdwht7MSS4rFKDHVct3pE5c4ECDqewkSo+AS9LLd6NNbuBrAyf8MQG6Jdn/+6w62us
 vG9GNPpK6+9O/3IqP/hAcooR8KRbEWAwzqkAiSX6BvVCyppWEY1ApITYFu93A6HRJeOl
 eHGkieBMuldYzQ16CMmeXb147SnCK9YMHgyx7hUK/YgXhAIYHDSA0ApMtVCuVo6pgyH3
 GoEju/lLinJljdIG6hApWBprGrRuLF6ad6TMtW1HLRmLcEHKXV0mukXmDd8YdVODgYze
 y3RxftVPvx9n2BvK+ZR81HetKG+3vD3oCjsjWUXSiTjVfCFuIHTrl3RcW2f6f5U9k6X3
 Rpag==
X-Gm-Message-State: ACrzQf1yEFgSwRw0PkR7H8dt7v4dr0/gHt7lYNVvzone4T406EP7QjcM
 p6blmcAxXQCRWhsLrMjCI6q5xJvaEPqlLmO5IwAiEw==
X-Google-Smtp-Source: AMsMyM46HS4JKXcUU0AXw7e7n+Tvhqfxj52gv6E52MIFwxMBhLiy5sCyDJF9YayRsXQEKYNvnm5ue1fUsq2ONqgDG5o=
X-Received: by 2002:a17:90b:4b8e:b0:20a:f240:9b23 with SMTP id
 lr14-20020a17090b4b8e00b0020af2409b23mr4581331pjb.19.1665138030662; Fri, 07
 Oct 2022 03:20:30 -0700 (PDT)
MIME-Version: 1.0
References: <20221001162318.153420-1-richard.henderson@linaro.org>
 <20221001162318.153420-38-richard.henderson@linaro.org>
In-Reply-To: <20221001162318.153420-38-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 7 Oct 2022 11:20:18 +0100
Message-ID: <CAFEAcA-nbiL3tbNckVuZ0yukJ3kq+-BBbh9ZSwL70Jvqm2fdNw@mail.gmail.com>
Subject: Re: [PATCH v3 37/42] target/arm: Remove loop from get_phys_addr_lpae
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Sat, 1 Oct 2022 at 18:02, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The unconditional loop was used both to iterate over levels
> and to control parsing of attributes.  Use an explicit goto
> in both cases.
>
> While this appears less clean for iterating over levels, we
> will need to jump back into the middle of this loop for
> atomic updates, which is even uglier.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/ptw.c | 176 +++++++++++++++++++++++------------------------
>  1 file changed, 88 insertions(+), 88 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

