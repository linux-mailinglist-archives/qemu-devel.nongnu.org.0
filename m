Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E3D4130C5
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 11:33:39 +0200 (CEST)
Received: from localhost ([::1]:33584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSc9h-00030f-Mf
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 05:33:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mSc5y-0001WX-0C
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 05:29:46 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:38463)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mSc5t-0000t8-EP
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 05:29:42 -0400
Received: by mail-wr1-x432.google.com with SMTP id u18so35415517wrg.5
 for <qemu-devel@nongnu.org>; Tue, 21 Sep 2021 02:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Q8ynlPhS2r+cVd/Q54uLGmJd2GdFx++/A6mS2ZdmWRw=;
 b=A8n2vCqslqy8UzW/IneEvOTTm3WUzjjn2V1ugR4oWT/aPfnh5Ir+ZdaHWODsdKrJew
 pH1lwcsfcU0dilERDd23FUVWx9si5gdLzy8a1ti8nCwIOBaCelbiCSLNf5RzTZ6CLYgH
 rzRSwzhu1A9XvhvpJf0WnwPa/v4HKjvBTQcdQU9ukBQhg/6kcd6h4PehgEIuQ+azQYE7
 SjdqQYqqJotbTHMuvdjEYTZYtYM1Vbun1XP8u6tjDAPA3tGP0gQPgfJCvqLSEWwS9fUx
 bDGUzwtVC2w/ClecvB/7rNCRAm/lz+Xry+k4EwLZC/wjroeU//puNvccZtz9X84GQVeZ
 vrCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Q8ynlPhS2r+cVd/Q54uLGmJd2GdFx++/A6mS2ZdmWRw=;
 b=hBVK57el6apleUC04op5ikf0tAM6kixvR/LIZjk0OMc/ni24ezvYe/0g17mfC1+gJO
 fUb2rO22D2lZFqAVo1/Hi9rzFmHFVzbyzlM5hqPqp8FwUWeE5UaNOEP1zDkA55N1H+Kd
 jEvAxRcnsx2uosUoIkQmMKpdfRp3xIhRJ0fxU8aa9pQyGaNwQoZyb6vt21hIPX4GtHvF
 cfhchfNlWUQBZW4lDB+AHvfqNnyh5ljzbSm02duyK/UuNJZRRww6NFX2Lnld9U7UM9Lq
 BSiuHWRub9ZgPTUYk8xp2uc7N80pDT2DmN2bpZKWjIbt7t4Ft7Ai0mw+YxMvgDnaxHS7
 OGhg==
X-Gm-Message-State: AOAM533u60syLE5F0dH0S02ikFegeuV3fF79yCCzGsQ9DPJTf3KpSRun
 neUuyzn1KbTpcI+gITjBUd5jYMkJqoxO1VO15+5zzQ==
X-Google-Smtp-Source: ABdhPJxSXpLnaRKKk3yN1fLTli33QUJmLrPtpUjU9DX2smhA4KYB1ArpzhWrYjBn3eeSUeOczmscC0qoGKyIIYclPmU=
X-Received: by 2002:a5d:4a08:: with SMTP id m8mr33113506wrq.263.1632216579281; 
 Tue, 21 Sep 2021 02:29:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210916153025.1944763-1-richard.henderson@linaro.org>
 <CAFEAcA9XxgFYj6jzNGEhgMHhB2UQF_X3ZLigu4sRPrR3Zfj8sg@mail.gmail.com>
 <a0f85ea3-c677-bc7a-995a-ddc8d4856b4f@amsat.org>
 <a85376bc-c986-4f47-2e07-2476a1a63b35@amsat.org>
 <b4d17773-b226-b537-0374-46a668df0af2@amsat.org>
In-Reply-To: <b4d17773-b226-b537-0374-46a668df0af2@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Sep 2021 10:28:47 +0100
Message-ID: <CAFEAcA-+pwETXYtSawvCRjLk2qio8PdEhnhW4yFhF85VvijVeQ@mail.gmail.com>
Subject: Re: [PULL 00/35] tcg patch queue
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 20 Sept 2021 at 22:16, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
> Forget this crap. The missing piece was:
>
> -- >8 --
> diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
> index 0d5adccf1a7..da348938407 100644
> --- a/target/arm/cpu_tcg.c
> +++ b/target/arm/cpu_tcg.c
> @@ -23,6 +23,11 @@
>  #if !defined(CONFIG_USER_ONLY) || !defined(TARGET_AARCH64)
>
>  #if !defined(CONFIG_USER_ONLY) && defined(CONFIG_TCG)
> +static bool arm_v7m_cpu_has_work(CPUState *cs)
> +{
> +    return cs->interrupt_request & CPU_INTERRUPT_HARD;
> +}

Is this really all that's needed ? I would have expected
at least a check on the power_state.

-- PMM

