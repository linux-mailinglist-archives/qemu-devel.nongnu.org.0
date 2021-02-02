Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8025B30C608
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 17:37:56 +0100 (CET)
Received: from localhost ([::1]:54384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6ygd-0003rk-5W
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 11:37:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6yKQ-0002Lg-Mp
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 11:14:59 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:40292)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6yKG-0002nF-9n
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 11:14:55 -0500
Received: by mail-ej1-x62a.google.com with SMTP id i8so14363555ejc.7
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 08:14:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=/i1b0ULHEmtngJUztz+JovHxBsNAZ1WiZtVCUw7Vp7c=;
 b=o39brbmka0rroBOCbdxY5xoYONerfbRFKamSphsg1TJYT4HEj36O2txmPQ7ty3eNTJ
 NRvKQgJsExNbA3uO4VpB0YZ0A6WXpmNHwf240/jYud9LCET52N851QzeQPQMyY2WiHCs
 NbXVlU2TaS7XMRQJqUF0uHe3ioY+Ze+ZLMJyERHZQIZZYKDver+LMg+O+oNc0lPLFsnG
 wmSqMOGB5tx5A+VSa//FNvPkTyr1j0y14tiN3HOzkcaSWBmBI5rHDPSPZUraXEiqGh5J
 mCttFvZco4sk4WIpw9TNqrDiy6zsq7sOdfGWsXAF0Dx+hVLD0oZ+bjAJrbft226X0PKO
 6icg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/i1b0ULHEmtngJUztz+JovHxBsNAZ1WiZtVCUw7Vp7c=;
 b=EXBT2bXnUNOmZdb23s8fM1TD9EkqnxwDmTa8lqAhURhZbMXSu4uv9E13ynCQFGMYgo
 06i+3IvYNdMMhWfxCoq39Zlf8u3E6OfYUj/jHqGsFpi/FunhDQFGNMlcQqatWcQXkuFX
 abolP97IjImUlcaWJr1KNzO/69DtpbgT+2Ff7FgzT73wjMCECThcmymZUHxJfGGjJBue
 JmaKAHgRnWQsvdic4nADM3fC31/kEXow1W4DMaYr7klEKeW7ivNYB7ZxYsbWla4FZ9s1
 NQ4dmtgmD/JmCylOej01Meahp+Yf6uczO8fgkm8FwL0JYX/5oA+GBtzR+etp+eidEG24
 8hcw==
X-Gm-Message-State: AOAM530V45WBcIgTHdiFVDT7Xfh9N3A6gytu+dFY9L1KpsG4JqR8OBjZ
 l5ryaKxBftelQiHSyFeANqM7XwrCJSva8mNWekrrAw==
X-Google-Smtp-Source: ABdhPJw5QfogqkEkDd+RDYxRaulqbk2cPkcvw1ieI++BMg7OmCbsAXfaIO9KY93EzT3TcUYY/Atv2hDtQ5GpdtFdkKA=
X-Received: by 2002:a17:906:494c:: with SMTP id
 f12mr23365374ejt.56.1612282486549; 
 Tue, 02 Feb 2021 08:14:46 -0800 (PST)
MIME-Version: 1.0
References: <20210131164406.349825-1-f4bug@amsat.org>
 <20210131164406.349825-5-f4bug@amsat.org>
In-Reply-To: <20210131164406.349825-5-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Feb 2021 16:14:35 +0000
Message-ID: <CAFEAcA_A=ishoh7UR_RMEXSsJHJu2ks3KePdeks_QHUi9fPLTg@mail.gmail.com>
Subject: Re: [PATCH 4/5] target/arm/cpu: Update coding style to make
 checkpatch.pl happy
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 31 Jan 2021 at 16:44, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> We will move this code in the next commit. Clean it up
> first to avoid checkpatch.pl errors.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  target/arm/cpu.c | 12 ++++++++----

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

