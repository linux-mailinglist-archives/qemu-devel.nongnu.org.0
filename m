Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80EBC546703
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 15:03:48 +0200 (CEST)
Received: from localhost ([::1]:37690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzeIl-0000Lv-GS
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 09:03:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nze9H-0000Ls-6E
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 08:54:00 -0400
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132]:46969)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nze9F-0001mH-SH
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 08:53:58 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-3137c877092so71114887b3.13
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 05:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nFl1ynvr1uhEcB3rmbTJ0VXwIQDyuN2T1XrvQVdal/4=;
 b=VrjsrilleEY+GQF1p7btjuKFhxJLfL26Q0TepQDSRHvj8gHKBgEP39eZ5s0/t7BERh
 vwrFNBcbNQC0fb+tF8sxyKPsqL1DWRw+noK2UnU/tdwRjXUmHPifEPIUeIkDFoD5hle2
 Jq5mIhBIVG/fOXwE+OZyhYvngtbU3+n4UV+EhObPlFN6BZrUo+YwCn9PCMnWf8bEb0Ad
 E6v/YONZQAoPQ8eqg9dX27JbIKls213uudkgw3XGIdG2OoiLqllf5XeAIgvKuAGWEzHz
 0uVE5CButeZiJ4Twa8dfr2o7gXcWz/yJjLqva5y2hAiYHgcEh/PhOrUEbUg88Mu9hmkK
 7eIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nFl1ynvr1uhEcB3rmbTJ0VXwIQDyuN2T1XrvQVdal/4=;
 b=QL2PHQlttpg5Ku0e2/ZpwbLPspDjy5J7yHq6CAcK7orDmG+O+EKVoHOEuuIqlntfFt
 lVBnKpaETIuJpZHpTTp8fRJnL3rfFQW2iH+SnX2TtChgJSELKj5tSMgnQXXkwt1jplc+
 Zz2kl8AzCUPnk/VN7+WOb4Ocr/rX8h3AuOniK5h9zytKRmT9IEDtt7Zee32SPpsfoBsE
 X6IrgagDjoTNeZrEeGARbjdRTUPNDOKJH1f4aeEHguPIFGYRe6k64Za7PMqeE/ScQowo
 ioT/5CaHUvX9FyqNLjDSdiH72GyRZif+8leMxu9rbLnGMQ992BzyfeCUD8LeGHDwZdVj
 mKZA==
X-Gm-Message-State: AOAM533nK1UvVgJOFshEg47v/Mz2yN8HCCj4bSEvDf5oqCPShpn6gxFB
 sY5XBZYdgAigyCBU11K4TwmTUnQE9LOp7eEW5dQNEA==
X-Google-Smtp-Source: ABdhPJwO9oP7cRZ0m0J/KCmAIcdfGcW8mPjGev6ih1EytQFp4MevvRL+s6NgAqUINJwat7V/wX4ZO3yyIiyJnW/XfCQ=
X-Received: by 2002:a0d:fc83:0:b0:2e5:b0f4:c125 with SMTP id
 m125-20020a0dfc83000000b002e5b0f4c125mr49278843ywf.347.1654865635981; Fri, 10
 Jun 2022 05:53:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220609214125.4192212-1-wuhaotsh@google.com>
In-Reply-To: <20220609214125.4192212-1-wuhaotsh@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Jun 2022 13:53:45 +0100
Message-ID: <CAFEAcA_ioevQQAmahyx6UXaFxUnzQ5=uJSr8JoFayC41SsCqVA@mail.gmail.com>
Subject: Re: [PATCH] tests/qtest: Reduce npcm7xx_sdhci test image size
To: Hao Wu <wuhaotsh@google.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, venture@google.com, 
 Avi.Fishman@nuvoton.com, kfting@nuvoton.com, hskinnemoen@google.com, 
 f4bug@amsat.org, bin.meng@windriver.com, qemu-block@nongnu.org, 
 stmao@google.com, richard.henderson@linaro.org, jsnow@redhat.com, 
 lvivier@redhat.com, pbonzini@redhat.com, thuth@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1132.google.com
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

On Thu, 9 Jun 2022 at 22:41, Hao Wu <wuhaotsh@google.com> wrote:
>
> Creating 1GB image for a simple qtest is unnecessary
> and could lead to failures. We reduce the image size
> to 1MB to reduce the test overhead.
>
> Signed-off-by: Hao Wu <wuhaotsh@google.com>
> ---
>  tests/qtest/npcm7xx_sdhci-test.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)



Applied to target-arm.next, thanks.

-- PMM

