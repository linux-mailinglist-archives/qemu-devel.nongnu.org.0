Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B66DE410CC9
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Sep 2021 20:09:24 +0200 (CEST)
Received: from localhost ([::1]:50666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mS1Fj-0005aL-Nc
	for lists+qemu-devel@lfdr.de; Sun, 19 Sep 2021 14:09:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mS1Dv-0003l7-5W
 for qemu-devel@nongnu.org; Sun, 19 Sep 2021 14:07:31 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:36749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mS1Dt-0001tX-D3
 for qemu-devel@nongnu.org; Sun, 19 Sep 2021 14:07:30 -0400
Received: by mail-wr1-x42f.google.com with SMTP id g16so24556909wrb.3
 for <qemu-devel@nongnu.org>; Sun, 19 Sep 2021 11:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=h8D8QzGCTREb784btrp5vSTKwgEPs6TMhqRs4dldHdE=;
 b=BFkKvs6NxYT/fIhhryoVsA3KZKkZdZxTuOHxVUxS14lzn3bpVgO2zXYB1f2Z9490jh
 o4x1b7RERCiuRVesW1Pbbfryo3qhot0hIxt90Fo2dX4proAEYLxBkajlqAY5KOKf5TlT
 6Wozh8BN785xZN9oADkba8ttt1zKre37YS1Kx3BL2xTSKQrdMAyq8vjDPwkmUMnQzVlK
 a3GEu1ENgcErCg4TCoHPwOa4gGMYqNuTyH97tokrwD+BP4EoAcJ+usSV4zoGNYcdU29h
 Ler8LDqnimazC6SuGK8xmuuqRQxwdlh+sIRXQvVgPowUv7pQotZzz2mXK0hChw1Em9Bf
 UWBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h8D8QzGCTREb784btrp5vSTKwgEPs6TMhqRs4dldHdE=;
 b=N+U+K4hyxRdohynfvPVZZJk/z9Y3Wg8b3XUS5jlyJy//OWfV6gelA7dYU2OcPpS6AM
 ZUA+WKtIJHa2wtqw/NXKxcWTfgWEAtjmpmcjqCL76zXAk0zmwGeNqo9o7/rResJ51UzY
 cA+cTqMDa19/HYfU49HXcq8DOXtB21UMQDdyaTtuIDMI2ThcJ5mK+LC3f/1LMCFODrSr
 tFOZEXyySIS/jp5R43waUlHAhjd1rrv6MYsIrJnXKz3QxyJRDy6e4sXn7UWyjYjXwbYD
 xu+TZm4Q00fbio+6EZNk+mGvnmuMXku2jHDgVNTwNDb6vexSwAyZOmq+Uf0yJJmDEHr5
 iJQA==
X-Gm-Message-State: AOAM5317Fg8Rexs0fFm1JU6TPOloq+XxZn6pCgJSFzKFY6OZCR/7dT5j
 dqSf8kBBY6h4jc1S1DI92kIp2zZibhzd9cqWBg+mUA==
X-Google-Smtp-Source: ABdhPJz9mKUP6d+VddiJ4DT/ThykpY7Xyjev7njbtmghBduuKR6Mfrf2ZQhRQXuz8c3DfiedOHUbLuml8xS8SdB5qtU=
X-Received: by 2002:adf:fd12:: with SMTP id e18mr24272230wrr.275.1632074847486; 
 Sun, 19 Sep 2021 11:07:27 -0700 (PDT)
MIME-Version: 1.0
References: <CABip9V9nwDNAEg-620hG2r5pyhw_rig+2nf9Ja3s=WA-wmH=jQ@mail.gmail.com>
 <e53eecec-8897-767a-149f-51faffd76d67@amsat.org>
 <CABip9V88osKWXBqSLDscAup6wAoh+_W-6WZR_Okwj9GG60nGCw@mail.gmail.com>
In-Reply-To: <CABip9V88osKWXBqSLDscAup6wAoh+_W-6WZR_Okwj9GG60nGCw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 19 Sep 2021 19:06:35 +0100
Message-ID: <CAFEAcA8Mj=icVHh7Jw4UjRhm6W=M7=gpZCfrPuQrQMnaCKAC+A@mail.gmail.com>
Subject: Re: high cpu usage in idle state
To: Ali Vatankhah <alivatankhah72@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-discuss <qemu-discuss@nongnu.org>, qemu-ppc <qemu-ppc@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 18 Sept 2021 at 09:12, Ali Vatankhah <alivatankhah72@gmail.com> wrote:
> then to check what instructions are executing I run this command:
>
> qemu-system-ppc64 -nographic -M ppce500 -cpu e5500 -kernel uImage -singlestep -d in_asm -D target_asm.log
>
> Obviously this results in a Kernel panic, but the point is that after panic there is no guest
>  instruction running as there is no more log in the file but still CPU usage is 100.

The lack of further in_asm logging does not mean that guest instructions
are not running. in_asm logging happens at *translate* time,
which is to say the first time QEMU encounters any particular instruction.
After translation, QEMU can re-execute the translated code for that
instruction many times, and it will not show up in in_asm logs again.
In particular, if the guest CPU is doing either of:
 * a tight loop
 * an infinite loop of taking exceptions
it will just be re-running code that has been seen before.
Probably the code the kernel runs after it panic()s is just a loop.

If you want to log execution, you need to add 'exec' and/or 'cpu' to
your -d logging. (Warning: this can generate a lot of logging output
and massively slow down execution as a result.)

> also run this command to check generated host assembly code:
>
> qemu-system-ppc64 -nographic -M ppce500 -cpu e5500 -kernel uImage -singlestep -d out_asm -D host_asm.log

out_asm also is logged only at translate time, not at execution time.

-- PMM

