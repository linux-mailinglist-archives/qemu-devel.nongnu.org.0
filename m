Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8372A6A9DCF
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 18:37:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY9LO-0004zA-1Q; Fri, 03 Mar 2023 12:37:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY9LL-0004vZ-GR
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 12:37:19 -0500
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY9LI-0001z7-I4
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 12:37:19 -0500
Received: by mail-pg1-x52f.google.com with SMTP id h31so1938439pgl.6
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 09:37:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677865035;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=hu2ySv+s0ME25NP8rUSj2eMw2O7Zk+8hzmVMllciejQ=;
 b=gosqHzQSTN7QojeLtpuwxAP7ml1TRAY/426ZE88DOaSZyAm+qdtVYULQzqurFFKP4u
 0uNDtkI5qulJLCYGMGA8KKuseyR25Hh3vk+geN5itKo6/FTBDZGtR372c71vOf/hcfqn
 X6euEGMDM+Ou6crSl9J5J8JJVJhyk+yUo98bFUQxgaxydiQtHsNhQGEv6AW05bVvW4ny
 C8Vnb1KJLy14tbCmFwEDFyTTDeZK6CsMfYz5wljeEd3H4qgvSuchVDhqCssBNe6mp3E3
 DQev4jDjfh+GOiDWOoHyEexGke4kLtG9iqhqplJtkhli3Wg4kXtovu9s3ZqAqw/LNDcI
 JlNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677865035;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hu2ySv+s0ME25NP8rUSj2eMw2O7Zk+8hzmVMllciejQ=;
 b=qzCmkl40tHTEfgvgWbnZg1U+cZV3PTQlvw6S2YjCL1DVpQL23iHUlEsqYeqJK7pm+L
 YhYgmK3iZeRTCnQzk4UFqzZq8Bl55Y7LVd+iyjIeJFB4uwX9syBzc31kCRWSVpdSoKA0
 7w2pE9vTStZ9P8lHcWS9IoJuDdXfaQQ+HdMu9fhT46+x5WDQClhcsoOwFWNKgvkSh4qV
 c62WlZC+xl2YwuAwBVO7JMkSHN8cA4KoCaEcw3LZYCwKKYaXzFNsswPLRVwU+qkJjv07
 7FDemGkRryE4vcJZKB1DubIGtWitQschMN3Gr0b32k4/Iz8UzdTv+RdcHAYLHUPE1kJ6
 hauw==
X-Gm-Message-State: AO0yUKVk5YmQup3qAyBe8oXsXqXkw+JZVRj/wMh9beRhYB3MWDaKOoGh
 SRnaF3ijJJYX10GK7WvdQjvor4FslIbSMSI4LZMc7Q==
X-Google-Smtp-Source: AK7set9XsBhdU1Tge1X0DniiCg0p9jcC05LYyHXM6RyMhzfuwbsHKRkk7Fm+9hX3hoO6/5LKiJBICcnEoU8vwz9Bvw4=
X-Received: by 2002:a63:291e:0:b0:503:77ce:a1ab with SMTP id
 bt30-20020a63291e000000b0050377cea1abmr753261pgb.9.1677865034940; Fri, 03 Mar
 2023 09:37:14 -0800 (PST)
MIME-Version: 1.0
References: <20230227052505.352889-1-richard.henderson@linaro.org>
 <20230227052505.352889-13-richard.henderson@linaro.org>
In-Reply-To: <20230227052505.352889-13-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 17:37:03 +0000
Message-ID: <CAFEAcA-65PHOBWYwErsoMx0vfP8yYEdZAEVN_C9nH+xt0tuF3Q@mail.gmail.com>
Subject: Re: [PATCH v2 12/76] target/arm: Drop tcg_temp_free from
 translator-mve.c
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, 
 kbastian@mail.uni-paderborn.de, ysato@users.sourceforge.jp, 
 gaosong@loongson.cn, jiaxun.yang@flygoat.com, tsimpson@quicinc.com, 
 ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Mon, 27 Feb 2023 at 05:35, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Translators are no longer required to free tcg temporaries.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-mve.c | 52 --------------------------------------
>  1 file changed, 52 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

