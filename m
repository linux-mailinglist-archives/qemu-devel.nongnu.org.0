Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC0B56337A
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jul 2022 14:28:08 +0200 (CEST)
Received: from localhost ([::1]:57588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7Fki-0004ZE-PF
	for lists+qemu-devel@lfdr.de; Fri, 01 Jul 2022 08:28:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o7Feu-0000fI-IX
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 08:22:06 -0400
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b]:43892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o7Fes-0003mf-6q
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 08:22:04 -0400
Received: by mail-yb1-xb2b.google.com with SMTP id q132so3712655ybg.10
 for <qemu-devel@nongnu.org>; Fri, 01 Jul 2022 05:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2x45qChXzSiE6ttQterCyPPWgGWkWOtA75UESiFBCRc=;
 b=Oj5q6c8mov47b8ZbxdBnBujQJ7nqQNtPObWdbInUC9TpUHUrWdLFS+QSzmLKn7pETx
 KB1gm7WejSVrPgfkNaZl/vJwJbYDG/+Axk0gc1s9y8DKjFz46igZJp0LOufri2ypocZs
 hvXgqi8Ioy6Qs/hISv3TGgUD8s5boicP0Pgyxtfp1DfkidRRFiW1UrOIds6BAjWvwzUa
 Jy8oQZQ2RLoz85FB7KcKdFIECDsvX1Ywp3inlMCcoNitp4FS4/XdZAlNdonTr0rsi//Y
 9fuukcfuxucpHKkfeuTAJeIN7HY5veScFY6CUXWJpcfGlJXT87WodD5CsY8NfT4962V/
 IJcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2x45qChXzSiE6ttQterCyPPWgGWkWOtA75UESiFBCRc=;
 b=kVs8D+9qr19nE1UTmI64uPfQ+gOVWvV8bqy5il47Z3UlEYI8lczutVvokCWMyhJ7Zt
 /pRDEYDrA2faP7UhWUIlMCPGxYPJspSXfpIvAx3+MVdHVXqH6+TknPtHy/nycX9LO7Q/
 VJ8AVfO3cwf9q8XanTP+S7mf64WAW7ID5q/65UoYRApGMLR9c8BAERG9mmaEhtvtH6j/
 kpKLcShaka/3/5Al3o1oKNuTHW8V2ty2D20UipABBEvePyD0uqK6rAXFhV9L0gkcy9vt
 bMNaJbYlcKhIQ6/iON36ikktzlKClpxQPiItVhrwqCY37JPks5ytKknKehb9qm16ibep
 tk0Q==
X-Gm-Message-State: AJIora+qcyX8kFSftu0W2F/9OeFNgc6a2pdyAO3Aw1sAg+L+4nE1VUFM
 FEDaOSi9PdDobYEqzOcQ1VFIKFK3zKW5ogfHfEzeMw==
X-Google-Smtp-Source: AGRyM1tehTXex935coU+GbYlNd94KUeWkF/YWvzb8bjabF6yQL5PQW5OIq13lqTEI+6jSEPrwMjfI25iDDxPov9JUnc=
X-Received: by 2002:a25:2497:0:b0:66c:f49b:94cb with SMTP id
 k145-20020a252497000000b0066cf49b94cbmr15140770ybk.140.1656678121136; Fri, 01
 Jul 2022 05:22:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220628042117.368549-1-richard.henderson@linaro.org>
 <20220628042117.368549-9-richard.henderson@linaro.org>
In-Reply-To: <20220628042117.368549-9-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 1 Jul 2022 13:21:23 +0100
Message-ID: <CAFEAcA8MLOSojELEG1vmU84++hdka80KUDQr2YvfiJuye+bd4Q@mail.gmail.com>
Subject: Re: [PATCH v4 08/45] target/arm: Mark FTSMUL, FTMAD,
 FADDA as non-streaming
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2b.google.com
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

On Tue, 28 Jun 2022 at 05:28, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Mark these as a non-streaming instructions, which should trap
> if full a64 support is not enabled in streaming mode.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

