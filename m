Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 401384D1442
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 11:08:30 +0100 (CET)
Received: from localhost ([::1]:48070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRWlZ-0006TR-B0
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 05:08:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRWjj-0004Au-8l
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 05:06:36 -0500
Received: from [2607:f8b0:4864:20::1136] (port=42033
 helo=mail-yw1-x1136.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRWjh-0007dg-P6
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 05:06:34 -0500
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-2dbd97f9bfcso195206517b3.9
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 02:06:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cZivUjemjqls9M294ZxpNZJ7KTtY8SOWJs2eewMcSnE=;
 b=bjUWoNTaQXDMeIT42R+VwRS88QlMwqjHhpC0bm6NHE/Z3MsPq01p9kROiqHESCnO8h
 YF9sMRhg+qEWa3fuGQynxSr5Bbom/ls7L+wGNKR8rl3eaEie5lfshAv/JHhxXLIBALMl
 pazkGoyS9l3lW45dfOZ5i2nM4nxZKQNhyatx25UP2MDihg6wqMsg27PGvcKKKjHVNlgS
 eFeOYxTCV8xRqIPD2gtM2bWwHBy/0loXYCFrN2+28orBLZ3wn5Rv1pBrfGqn8Ys9njqv
 2yF+8erRq7x4Gs4UBDAFxHUkwQhHf8zg10B39+MTcQIQe8fliKNu/0DAVm1rmPvC3WDS
 zIDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cZivUjemjqls9M294ZxpNZJ7KTtY8SOWJs2eewMcSnE=;
 b=s6xwK9SDAENKE23GCUb6gaq/qsubfxl8+CpfuIPPeljxjLHO9gjnN/uGPkmnIWWYoe
 4R6QcuTDENaMI3p8RNOG7sRAv5ZVkfOUSywnnStykvO1xRdoQ0h1Gm+XGYsMGfeWaT8n
 Js30jMW0ahTzUJ6Lv6/JBxKG78bh02QDXi5fVaB0+d4EOC7wRJ9l5e9r6xznveA6/nq5
 I+7BGhmRVTvVD/h/iRg+nqRqS4vSKfpKjcY326KtANyzk9nkE1egMPXxj4bAo7TL84gL
 ouOK839Rx9Qi7SdIuojZP/datdJVD47jXIKZJc2+yRwIJbY1ITKlijrXYTs6GLJ823Q9
 8ZJw==
X-Gm-Message-State: AOAM533364Qh31zX54UGcn7552ms+g4hbw89vPNL0zyzW8GMpcF1B1G+
 CCVnPoMGa/cE0wSrkvf3W6BNDodPXKF0eV+uJkIucQ==
X-Google-Smtp-Source: ABdhPJxtMSMPmUbZx1tnAc1tLcbFFhwU/siZ2NOLVUTfjL0mWelK2onoX/FFtudHU/mdYah5i3D+D++1qZ0HzToFohw=
X-Received: by 2002:a81:106:0:b0:2d0:e682:8a7a with SMTP id
 6-20020a810106000000b002d0e6828a7amr12719875ywb.257.1646733989959; Tue, 08
 Mar 2022 02:06:29 -0800 (PST)
MIME-Version: 1.0
References: <20220308072005.307955-1-richard.henderson@linaro.org>
 <20220308072005.307955-11-richard.henderson@linaro.org>
In-Reply-To: <20220308072005.307955-11-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Mar 2022 10:06:18 +0000
Message-ID: <CAFEAcA8EEDQqm9iLm1cwiKowugG9j_WKBdBs46ojy+3G7fcUOw@mail.gmail.com>
Subject: Re: [PATCH v4 10/33] target/nios2: Clean up nios2_cpu_dump_state
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1136
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1136.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: marex@denx.de, amir.gonnen@neuroblade.ai, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 8 Mar 2022 at 07:20, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Do not print control registers for user-only mode.
> Rename reserved control registers to "resN", where
> N is the control register index.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

