Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F2B96F5970
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 15:59:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puD0P-0007xC-5N; Wed, 03 May 2023 09:58:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puD0L-0007wq-CD
 for qemu-devel@nongnu.org; Wed, 03 May 2023 09:58:49 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puD0J-0002T6-Jt
 for qemu-devel@nongnu.org; Wed, 03 May 2023 09:58:48 -0400
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-50b8d2eed3dso7162234a12.0
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 06:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683122325; x=1685714325;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=9maEE6tQz53GhLXpKDh6d/bbjPlwCbTv1HWNYvTGW5s=;
 b=Yc2jinFqPqXeliOemaUJnII/KO3CPsEnItibFXQrZd5TRBgguignJScynydsqbTfXQ
 n7Dr4qUfTendJGOTb5UVfDluH+2KhgzYCN5fVTa7frXgcIzDUrAnZBkU9qrFT3qfqADu
 ek6D16VwlClI/aCFLelR7ZtCJa3mCuTxnp9Cqok5ExUNtS1+WGfifUrZCEQgBi0vC0B6
 DQhOklgdIV46PnBs9BTMnAfoN+CfXrg1u27RmWFLHfCUxO1gO/4BZJqtyOOtLcDcjFY/
 yNj1zYqUJOvXZEDWUc24BjtSO3imLpd0EChblUCEPrET238lYAMZ7T0xPH1FbeBcr+iL
 fxig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683122325; x=1685714325;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9maEE6tQz53GhLXpKDh6d/bbjPlwCbTv1HWNYvTGW5s=;
 b=WMgTL7//ZS53rI0LVXDTaqx+UTelhRvoE59vT61nPlKSnI05ao8kw7GT4oYQjJftmg
 Vw/7vZm/1nMIGQ6tH1Z/+RLGz8vUE+F92r78Ow8WWZIhgVSdzPvAUeRmq+Nl9YdZ/MOJ
 5BbsaAu1JBqShscq3Bt/L3hEEApkhYPAroPwESZhlpGw2ofPqsY6RpdqQxJG1mL1Bj3K
 5NgYE7QTQpEVEEb1LdzUistl2kEynChvb4E6nOCsMEC3n1FbkSxWLr3Npd6F89qjqhsP
 +d9Qu81OmA4Dp8AYxqStacPk+5LDL6B8+81yquRq/mMQjpEiGvtiJH13mUfttEupXIB9
 vJ0Q==
X-Gm-Message-State: AC+VfDzUNKxxZxU+rrj3bStMR+piQ41MGcjaIZCSD8rBtoPZBkETqRya
 fqv7xCsIhTKKD1o+a1h9s9Yb2QeZgw0EEc1mNNeR0A==
X-Google-Smtp-Source: ACHHUZ4meB4eILtYB6JLGFKLriBRTYSQMFInuDQFX38FdhdrpqXm+jWaLNG8RsiwMT01O2eASZqvfVdRZAtPwqg/3Ho=
X-Received: by 2002:a17:907:60ce:b0:94a:67a9:6052 with SMTP id
 hv14-20020a17090760ce00b0094a67a96052mr3522383ejc.67.1683122324870; Wed, 03
 May 2023 06:58:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230428191203.39520-1-quintela@redhat.com>
 <5f76c54c-b300-8597-1b4e-fd29b3603d35@linaro.org>
 <87jzxrt3u7.fsf@secure.mitica>
 <CAFEAcA_G734ap+L-YfLt5Pd65VXFm2xcx_SFwD_ke8B7pcQGbQ@mail.gmail.com>
 <87lei5sriq.fsf@secure.mitica>
 <CAFEAcA-gu1Xxp49wOdtpif-C04fFd3nFrC+qNa8NizmPq9HGLQ@mail.gmail.com>
 <87ttwtr1a9.fsf@secure.mitica>
In-Reply-To: <87ttwtr1a9.fsf@secure.mitica>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 3 May 2023 14:58:30 +0100
Message-ID: <CAFEAcA9dQH15z05LqEi7nVQLBzBVQLbad+iptVgbCrAEpxraJw@mail.gmail.com>
Subject: Re: [PULL 00/21] Migration 20230428 patches
To: quintela@redhat.com
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org, 
 Leonardo Bras <leobras@redhat.com>, Thomas Huth <thuth@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Xu <peterx@redhat.com>, 
 Lukas Straub <lukasstraub2@web.de>, "Daniel P. Berrange" <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, 3 May 2023 at 14:29, Juan Quintela <quintela@redhat.com> wrote:
> So now we are between a rock and a hard place.
>
> We have slowed down the bandwidth for migration test because on non
> loaded machines, migration was too fast to need more than one pass.
>
> And we slowed it so much than now we hit the timer that was set at 120
> seconds.
>
> So .....
>
> It is going to be interesting.
>
> BTW, what procesor speed do that aarch64 machines have? Or are they so
> loaded that they are efectively trashing?

The 4 failures listed in this thread are all jobs running
on Gitlab's standard x86-64 shared runners, not on the
private aarch64 runner.

thanks
-- PMM

