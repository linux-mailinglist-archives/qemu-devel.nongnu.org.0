Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F22F56339B
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jul 2022 14:43:53 +0200 (CEST)
Received: from localhost ([::1]:48934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7G00-0002Kp-5F
	for lists+qemu-devel@lfdr.de; Fri, 01 Jul 2022 08:43:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o7FqL-0003Pd-Qi
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 08:33:53 -0400
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134]:37381)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o7FqK-0006B6-9G
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 08:33:53 -0400
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-31772f8495fso22285237b3.4
 for <qemu-devel@nongnu.org>; Fri, 01 Jul 2022 05:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2x45qChXzSiE6ttQterCyPPWgGWkWOtA75UESiFBCRc=;
 b=KQFbt0109Ht1Ai+c8JFNfCKUdAMiP9OaAhmY2rrjODWXoX5LyDk6AI6hPAio8GHmOM
 dM3ESsvTI3lOicsAQq17fkjWVYkOf0L+5qAFna/p3XAbSg/3Au4oCkVBeiZVPVn/LznA
 dOBpCIhE67UFItZshAYh+bSL8Cbvgf/AY47J7HdCwuGSHcx4k49Yi2isTcX5rnJJW3gF
 OZzIYAwqJS8z87oPkDYrQXYUVBrX9Cvxau7F/tJyu2x9BgBoOkzld1E28tpXzuFl4sG3
 ReQ8c1fs0LGJMsE7lr8bVVfPKi6ErwaLz2bveygocHRQMy7APrPVkT66DsQy0kfgXNo+
 KxOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2x45qChXzSiE6ttQterCyPPWgGWkWOtA75UESiFBCRc=;
 b=526b4JaZPV+iPNh9Dp8NdFr8B4vpi0aBgYrjRxqSvoi5xU0v7kayDJuDN15Z0tlJjL
 pRiYXH/TKWgoZC/rWPU25/OC46WUZkreYCIzlW32MEjnGXGkfKrwaQ38eskSDh3Zvdo1
 3bJKRQKd+0ebcNsDCHmMxS81nx+cWw4QXJqic3AhY4N/ILlJ1dqMMg4qZjLEw1GJw/mg
 3BVOpG/8DL7gGstzi4Rp55FdBefJL6I08jdHtulknhjiOWWbYJexLTqo+OY765bbMyLp
 UEnxOpkm26Jsp0nlqLT9NUqH928dTzts7Q7gl6zbQgVffc/xCyxrrA2BjwLa7gToE7YL
 +X4g==
X-Gm-Message-State: AJIora+RXvyaHQ3JDAVMMufeV5b99qRsBzHvvVTH54pNfy5d6RpAq+47
 lvW26sX4Dfa+rEghE0gibGvWg9NaDKahCZu3qGqIdg==
X-Google-Smtp-Source: AGRyM1saFSou+RhQYmIkeocbRsSatr91ecLAI7CnplZ80UYVHn9VBTbOSLHTOXSEsZ0V65BAzfw1wMCE/rMH46KXRwE=
X-Received: by 2002:a0d:db55:0:b0:31b:71d8:21af with SMTP id
 d82-20020a0ddb55000000b0031b71d821afmr17348810ywe.469.1656678825041; Fri, 01
 Jul 2022 05:33:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220628042117.368549-1-richard.henderson@linaro.org>
 <20220628042117.368549-14-richard.henderson@linaro.org>
In-Reply-To: <20220628042117.368549-14-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 1 Jul 2022 13:33:07 +0100
Message-ID: <CAFEAcA-QHdQZz36BZNTswQBY1t1-NXsr3FtPAh1=+iOJRTM3GA@mail.gmail.com>
Subject: Re: [PATCH v4 13/45] target/arm: Mark LDFF1 and LDNF1 as non-streaming
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1134.google.com
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

