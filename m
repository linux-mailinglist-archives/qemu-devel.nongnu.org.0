Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5610F4D164D
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 12:31:31 +0100 (CET)
Received: from localhost ([::1]:51638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRY3t-000332-SS
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 06:31:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRXxy-00015k-0Y
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 06:25:22 -0500
Received: from [2607:f8b0:4864:20::112c] (port=45931
 helo=mail-yw1-x112c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRXxr-0004C1-39
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 06:25:20 -0500
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-2db569555d6so197347117b3.12
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 03:25:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WV/mTMN8XidEOCyhyhdAHavdWWY4/si/zVzV2FXVf4I=;
 b=k4v41yfx6NVdqhmPsh0+oIigXRa90fJupfrf1/AXYX74d78zhGjykA96vue0klwfAF
 otKh2GrSbXpyUHco/hAcla3apU6g5NO0k6062jYDJw1HznhZHiK071w1miLjVUC4IiWl
 wc/XIQ3kTkEKijgEcldAuUXm/U7UiTACnBDROnVqs4KVXfxlVXZ7dtNxn/RjikVZfFzm
 8B+t+JXJiaGubRrPhDk580P/a9Gasm2/yYYcHNhSm1xxEPKSz2Bfk+/K2cfWE2wtiVY7
 Bq7couQ9SdPHfutcvNM1+C6mXiC9YP9rxCjDIYZ8sQ3dF6RKqH7pFh2eADBUUMkZNDZ/
 MtbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WV/mTMN8XidEOCyhyhdAHavdWWY4/si/zVzV2FXVf4I=;
 b=xC9UXMWaYtUAmOCVoZOCYL8Uz4hTakvt64WbNg6Kyjl0B1NYKFHPgCJfLKBvXJ9byc
 aU0sRY06QtHy9tHiGYzrwQAiw31OvZhyn9lT4EWUOM0QbTE2Ub9Z5bHctZ+T7Tz6GttZ
 CVe7RFii61aebkITCohHOzwdRJNIv2zpxoa8Z7aC6Dqgxf/l4k2phWlXgJNYUeYzw+tM
 kdR65w2k2gKRsDb/VxSZHoW5Z8Ar2guu/+n8jLt3Ly7TQ5H2zqB5XBoPXay58lrmqKx2
 YJNw7jCQXYqzuv1SuQv8F28wA/tcwT29RMgZk7UYaZOCQ+0doVGE1Pn6JsZ+OtiUKaCP
 iB8A==
X-Gm-Message-State: AOAM531Xkvd2GJNI0PdojFaJDMdipCZowwROMwKEscaCxxt/BqIOCtci
 2cxPCc9rTtmT/qsnVuaXTkutJsm3SJdT6j0PV1XGHg==
X-Google-Smtp-Source: ABdhPJyLV+z2Wy5gYiapTLuuTmNTvRjoDO3J5YSODO5223YhdKX1hAIP2T6/XXQ9UFip4B6zQIBoGBWxoZMApWVRVT0=
X-Received: by 2002:a81:12c3:0:b0:2dc:5f5a:38ec with SMTP id
 186-20020a8112c3000000b002dc5f5a38ecmr12460548yws.347.1646738709260; Tue, 08
 Mar 2022 03:25:09 -0800 (PST)
MIME-Version: 1.0
References: <20220308072005.307955-1-richard.henderson@linaro.org>
 <20220308072005.307955-28-richard.henderson@linaro.org>
In-Reply-To: <20220308072005.307955-28-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Mar 2022 11:24:58 +0000
Message-ID: <CAFEAcA-kDWSoLYXLC-pMH8wg+aSuca3K9MaUyg0fNOVgzvnmpQ@mail.gmail.com>
Subject: Re: [PATCH v4 27/33] target/nios2: Create EXCP_SEMIHOST for
 semi-hosting
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::112c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112c.google.com
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
> Decode 'break 1' during translation, rather than doing
> it again during exception processing.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/nios2/cpu.h       |  1 +
>  target/nios2/helper.c    | 15 ++++++---------
>  target/nios2/translate.c | 17 ++++++++++++++++-
>  3 files changed, 23 insertions(+), 10 deletions(-)
>
> diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
> index c48daa5640..13e1d49f38 100644
> --- a/target/nios2/cpu.h
> +++ b/target/nios2/cpu.h
> @@ -162,6 +162,7 @@ FIELD(CR_TLBMISC, EE, 24, 1)
>
>  /* Exceptions */
>  #define EXCP_BREAK    0x1000
> +#define EXCP_SEMIHOST 0x1001
>  #define EXCP_RESET    0
>  #define EXCP_PRESET   1
>  #define EXCP_IRQ      2
> diff --git a/target/nios2/helper.c b/target/nios2/helper.c
> index 007496b957..a338d02f6b 100644
> --- a/target/nios2/helper.c
> +++ b/target/nios2/helper.c
> @@ -146,17 +146,14 @@ void nios2_cpu_do_interrupt(CPUState *cs)
>          env->pc = cpu->exception_addr;
>          break;
>
> +    case EXCP_SEMIHOST:
> +        qemu_log_mask(CPU_LOG_INT, "BREAK semihosting at pc=%x\n", env->pc);
> +        env->pc += 4;
> +        do_nios2_semihosting(env);
> +        return;

Ah, here's the "return" I asked for in the earlier patch :-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

