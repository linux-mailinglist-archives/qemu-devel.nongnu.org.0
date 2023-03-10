Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C08C56B4D0C
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 17:31:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pafdd-0004gU-8Q; Fri, 10 Mar 2023 11:30:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pafdC-0004ct-QW
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 11:30:15 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pafd7-0005t2-28
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 11:30:10 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 qa18-20020a17090b4fd200b0023750b675f5so10392739pjb.3
 for <qemu-devel@nongnu.org>; Fri, 10 Mar 2023 08:30:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678465803;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=65BWp2E6jptNzr8QnxwDtV2FZVH8YvfO0/Dktdrz8ZM=;
 b=d7BSMARB1NO5c2Ra9TEKMuKeH+KpXvUXcLBjldW1hV1Ygg8xb6fzZL+Km8nkFJi9QK
 HM02GA/suubvGqS/E3vIXiSQTvwwpl+iAKZKS8s2FsMZ8C5oW0VNXAv+oBVGm12BQaBt
 CSRFS7L8C08h7V92GZ7TL/cVwotEmBruwpfSCluZtcitrHyFR2nO4YO8x/Fbstc0Mtct
 KcFanw2ic5ykyBxVsVPi9WGlGHVHT13OoYgw6rxNcSKGkSGqGdNLkHQYVN1ov4pyyEpc
 pusNogZ9sl7jMqLD30/0UFl4ScdKmF14pZlE6hjT/itFvFm7Ez+O3GsmCtpg2OmBMDX+
 ArfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678465803;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=65BWp2E6jptNzr8QnxwDtV2FZVH8YvfO0/Dktdrz8ZM=;
 b=Dj2bPssrWeFySlmFDrLqZqiuD+2wTZOP1lyrqR6j+yONBwRBk2CJMwDy65A6ESJaRw
 UWE1wqiVkeG9S+TsbhZByHPPPgHS/yxGAga4RWKfIcwSReMuxsYI2mzX6TdMZxDZfKGM
 BW2UAjJmomQPU0d7ZrYSG9rHTmULlzfDc8pyTJC/0l0ufywUv6mI6nFKDMYorY2yUXj3
 0X+VPm6eOK7ppnxbWheCfVKfn82KW44A95InKl7U1+jhz7Tuy+Eq3DNe7hyaiUawIoVR
 tvP2hLiXSQ4m73OBnScP2EMmreL6vLklr6+KF7xh6afG5YQHbYAj8ndzuOugu7ZDFa1x
 1AAA==
X-Gm-Message-State: AO0yUKUX4gFhK5hL6oHcgwxiFPo18OvNRTuOSq+O/GZY6bjXs+uJ2vIV
 kRRo54NU8sCJqGo3G2CzCBHWZ/hr9SN4U9GigFeLPQ==
X-Google-Smtp-Source: AK7set9dT/lOkL5pNYV1g4LhToC5CQSgrveKbapcJgHa+Coh1kEwCvwGPSln8WvJVeo1SDMjsYB+iNMgfHcEcbJGnQw=
X-Received: by 2002:a17:902:efce:b0:19b:5233:51d8 with SMTP id
 ja14-20020a170902efce00b0019b523351d8mr10404510plb.13.1678465803488; Fri, 10
 Mar 2023 08:30:03 -0800 (PST)
MIME-Version: 1.0
References: <20230302114102.32236-1-qianfanguijin@163.com>
 <CAPan3Wr=jqP5CVzsMtNmUTj-NvPZouxPWwC9DivY=GL65XJX4Q@mail.gmail.com>
In-Reply-To: <CAPan3Wr=jqP5CVzsMtNmUTj-NvPZouxPWwC9DivY=GL65XJX4Q@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Mar 2023 16:29:51 +0000
Message-ID: <CAFEAcA-vnac6CD36fsaoGD2zXVKe2L_FuGQDWHnBscy6iyiHYw@mail.gmail.com>
Subject: Re: [RFC PATCH v1 00/12] *** Add allwinner R40 device support ***
To: Niek Linnenbank <nieklinnenbank@gmail.com>
Cc: qianfanguijin@163.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Beniamino Galvani <b.galvani@gmail.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102d.google.com
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

On Wed, 8 Mar 2023 at 20:47, Niek Linnenbank <nieklinnenbank@gmail.com> wrote:
> Thanks for contributing this work to Qemu! With your contribution, we would get yet another Allwinner SoC supported, making it three in total (A10/H3/R40). That's great.
> My thoughts are that maybe we should try to re-use commonality between these SoCs where we can. Ofcourse, that may be difficult as the internals/peripherals of these SoCs often really are different.

Thanks for having had a look at this patchset, Niek -- it
has saved me a job :-)

> Your patches look good already, and I saw patches 02 and 03 are already merged too. I did a quick regression test with
> avocado for cubieboard/orangepi-pc with your patches applied and that went OK:
>
> $ ARMBIAN_ARTIFACTS_CACHED=yes AVOCADO_ALLOW_LARGE_STORAGE=yes ./build/tests/venv/bin/avocado --show=app,console run -t machine:orangepi-pc -t machine:cubieboard tests/avocado/boot_linux_console.py
> ...
> PASS (22.09 s)
> RESULTS    : PASS 8 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 | CANCEL 0
> JOB TIME   : 169.73 s
>
> For now, I have only two suggestions for you to consider:
> 1) You could add a new acceptance test for the new bananapi board to ./tests/avocado/boot_linux_console.py.
> This helps in your current work to (re)test your code quickly, and after the code is merged it helps to keep to board working when other changes are done.
> 2) If time permits, it may be interesting to document your board for example in a new file at ./docs/system/arm/bananapi.rst
>    If you do this, it will make the board a lot more valuable for other people to use, since you can add some basic instructions on how to use the board with qemu there.
>    Additionally, it also helps yourself to store this information somewhere, since it can be easy to forget all the specific commands/flags/arguments and links to board specific images.

I think I would raise this to "definitely provide board documentation".
All our board models should have at least a basic documentation
page that says what the board model is, lists what QEMU does or
doesn't implement, and describes any QEMU-specific oddities.

thanks
-- PMM

