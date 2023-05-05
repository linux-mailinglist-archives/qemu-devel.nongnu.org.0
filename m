Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5A76F82C5
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 14:16:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puuMV-00014u-Bq; Fri, 05 May 2023 08:16:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puuMO-0000kg-5O
 for qemu-devel@nongnu.org; Fri, 05 May 2023 08:16:29 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puuMM-00081i-DE
 for qemu-devel@nongnu.org; Fri, 05 May 2023 08:16:27 -0400
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-50bc4ba28cbso3068441a12.0
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 05:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683288984; x=1685880984;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=A5ZBvECdOvuPKA8ohfTv8Mvkg1bt9SeqkPAPAaEXcME=;
 b=hmNv/IzrYYP/rHMZUjXrJOgxuAb2U88kQBEU3euB1/XfavNAtCy2t16QiCiI6wjl4W
 5+y8aw4Q5/9TwggXyWhqXj3VZhiuqXdKT9JUhpMr2RZag2hR4gM1lCE+3Lpi5WIPornn
 pkE5qOEujYCI9fQDLpMOUbI+fttLqmezK69FB92nWSMYCzwjyG63CPCzvKMS8j2anahn
 uU9W5luUVL93L5SS8eG6FF7POrZpTORXLow2uelk9hdmTyUyFQaChSCfTj1wO30IfiAD
 8J5DArKTryXy3nGMZQFop/YM2isJLV+vzuo+atvmy3lOtjGmcO1JH1Wa9kYSGI2bN0Vl
 mYFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683288984; x=1685880984;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=A5ZBvECdOvuPKA8ohfTv8Mvkg1bt9SeqkPAPAaEXcME=;
 b=hoXcK3rkBc+lHrFMpIH9DHQbc/Rz2k7QJzsInSmmTwRc6NlRjr7xHDF40ZyhCBkaJP
 aNu7NdFRe8ccFjyumb1IWgel5pv4CmIaxKlwLinZzkbHk9BCct4YiiF0QaHW93Mx7j0c
 BH5jOTP6PyT/K3DnGNuz8A/kyU9LehM0CGzHpE9dH9demEo/29H2W/cNF3p/yQlb8zfp
 rwO3GyXLytuRcch6P1E/5ehbUbG6fLUEGnjNydeQLaH02D8lZQOOfHBF6lbwDWMCxmmI
 ecLPx3DHAuLW0TMZ09gcNkeFe5si+jIBrW2NcDxKYmET6GZNRGP4GGL7O4H1+AaiHggx
 jQZQ==
X-Gm-Message-State: AC+VfDwZx82udBjD+4Wm/wK2NjdD12wittiZYjs4gbSCW7SpctJQ2Bd2
 e1KVd9ilcP6QVnw8cV0ttkv1Glz6sWX3xGIpMs5ExQ==
X-Google-Smtp-Source: ACHHUZ5Ae3c1wTkF3Vhdy5yovXwrJIuwtERsI6sUeBDeKy69pn7lIF+WfWJEP3cTPQACMtHa84llSdrZ/P3n/6C+EoI=
X-Received: by 2002:aa7:d7d4:0:b0:50b:dcf6:8e6d with SMTP id
 e20-20020aa7d7d4000000b0050bdcf68e6dmr1100687eds.18.1683288984118; Fri, 05
 May 2023 05:16:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-30-richard.henderson@linaro.org>
In-Reply-To: <20230503070656.1746170-30-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 May 2023 13:16:13 +0100
Message-ID: <CAFEAcA_OEWj7_SLDYqoeqhZCiJeBgWkWZXzOhPb6PLeiR9+1=g@mail.gmail.com>
Subject: Re: [PATCH v4 29/57] tcg/s390x: Use full load/store helpers in
 user-only mode
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn, 
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, 3 May 2023 at 08:29, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Instead of using helper_unaligned_{ld,st}, use the full load/store helpers.
> This will allow the fast path to increase alignment to implement atomicity
> while not immediately raising an alignment exception.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

