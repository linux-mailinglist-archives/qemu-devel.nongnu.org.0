Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E420F5F69BB
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 16:37:43 +0200 (CEST)
Received: from localhost ([::1]:58760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogS0M-0005vG-Oa
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 10:37:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogRwV-0001vj-Sv
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 10:33:44 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:39619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogRwU-00077u-1M
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 10:33:43 -0400
Received: by mail-pf1-x42e.google.com with SMTP id d10so2213643pfh.6
 for <qemu-devel@nongnu.org>; Thu, 06 Oct 2022 07:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Lff+mqFsvwdItVLA5cp1wud2MEDAw1eufDdyjUtzXQ8=;
 b=oCQop3wvl3CSgJJGZtrM7Tq01s+tCWd/ohhzntY7joop1EGhg1zbBJmiUHZbis7Jrk
 Cb4jpQYbQObXOMYNuIHDB7ZW1/PpGVxwzMDX69w4uSGTGKavYix10iTTX58qjmMOG4CZ
 8bPh1tjuZjaygRWGw4PShUnm8ixYcTTMvtj4NJZa7AXcYCbFoXrS2QzVQ8/jSijIJgg9
 Yel3JRQIIsg+Q66NuYC1KCLFkorj1Jb+DXEWA1jJMZmqtCH40kZ6MHNCp2YwWSCn1Yol
 udZqWO1Pen+56mfP5yhvoTd4+tD6fxJ8wr/fAnAUVO69DVrcukxBLYBqq6ibW1F/SY3V
 zrHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Lff+mqFsvwdItVLA5cp1wud2MEDAw1eufDdyjUtzXQ8=;
 b=6vlpXkBRCbGKy1Y18fq//Tv4/prWco4F16MGsuX38oiKEM5b+KIfegQvTt/3IASrpr
 t8PQJvVvWYGubJVn9kpvYFz29T/2e8EMI8njUIpwdZ9NFfpVAz/R6pIGUkSwC1DHBXRu
 lW6+RKKd4e15CWA66PqHuubiMr+bY6TCqqwqcMzd1BGYxXlzIbvO9dE0QzzbSEQNa3df
 6FMhuuN6Em2WXESqPxq/YR3a+8pnESUlyBb2IaaZPoQ1R2LUwvoMD3jBJf472TmEvJLY
 +yDqhrl3+7gBfAE53xxAxCtoWI6PAP38/Kl8sgGNuSp77F495E9ELEViAvCs44bP+Udl
 LO/w==
X-Gm-Message-State: ACrzQf0YPDh93N6ctKuW0lHv5XKv4hPbB9VjPepBDmG6niZcWowa9IDu
 AvRLCfQIBl+H4YYSD7ogdq5Y5VNycfp0ZE+yivwrbw==
X-Google-Smtp-Source: AMsMyM7VTNRpqtHxVZDdZG6BE+VmgVgtvA9izZBAjIGPsSirtR7ZqIOeSbfjiVHCBOaJ/bAdWSh+g7ImDaxVWOJ//Vg=
X-Received: by 2002:a63:89c3:0:b0:452:f2ad:52b9 with SMTP id
 v186-20020a6389c3000000b00452f2ad52b9mr171193pgd.105.1665066819234; Thu, 06
 Oct 2022 07:33:39 -0700 (PDT)
MIME-Version: 1.0
References: <20221001162318.153420-1-richard.henderson@linaro.org>
 <20221001162318.153420-20-richard.henderson@linaro.org>
In-Reply-To: <20221001162318.153420-20-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 Oct 2022 15:33:27 +0100
Message-ID: <CAFEAcA_F-bKsZ93d-bGa0npXZ_wQtZDOFQr8SBWNwgxvv8s9Hg@mail.gmail.com>
Subject: Re: [PATCH v3 19/42] target/arm: Fix cacheattr in
 get_phys_addr_disabled
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42e.google.com
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

On Sat, 1 Oct 2022 at 17:53, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Do not apply memattr or shareability for Stage2 translations.
> Make sure to apply HCR_{DC,DCT} only to Regime_EL10, per the
> pseudocode in AArch64.S1DisabledOutput.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v3: Do not use a switch or a goto.
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

