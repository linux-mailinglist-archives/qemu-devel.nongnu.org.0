Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C4C30C1F9
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 15:38:50 +0100 (CET)
Received: from localhost ([::1]:60230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6wpN-0004uG-1o
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 09:38:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6wgT-0003D8-Ls
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 09:29:38 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:35019)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6wgM-0003y4-0G
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 09:29:33 -0500
Received: by mail-ej1-x62c.google.com with SMTP id a9so11890102ejr.2
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 06:29:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3sM1b9rglurvdDr6uApRFjz6YG7nhxkqX/wQy8bfVoA=;
 b=g5BNMHsEet4fWRMQyiPIelAaQclF0iFaqOEvYl8A5n73Es7XA1jlSCmGQuNGlPxZTk
 jLKIbnyTbJj37vWMlPyrlka9T5uXUDW7Tj705l+y/j7Im/oM5Ow7ObkmgEJ42oRRLelF
 Z3TIvMnUb6+J8MGqTb1r0sB7UXv/F5drH9tbiSGv8NkCXgYWcmUMboXo4qp5gVff25HP
 WhK4FHWd8XFOVFqIdQQiWQMNTlMWCAwOa3faNqLXfro7Rkd/kR7+md19kAtLyhIsSHSA
 ZmLN89tu0m/fQjrRZvq2YGYbm1yuoNT8idZeSMDiC35PcK85RPVWNjlEBu8LDIU4tlDi
 /2Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3sM1b9rglurvdDr6uApRFjz6YG7nhxkqX/wQy8bfVoA=;
 b=GashR3AJUkmCZrCIJgNI/JZfpwRDJRYCWtTRkSN9RV3RrvhB1SbYLFAUO0aCt2NKM5
 w84rVoZjkt9hzd93t0x7nywsWwvM7XroGqWj34LenK+9+MXkmYrPUPN7AR1H8841o/Vh
 ETMR5xNs+bqgws/Umo7S3TuDWmsqeAka9XU9ULv91Pd4t3fywTPLBm5cdSt9q3t5sUkk
 wuSmnwK9UvZDyUdLFcWYrWYlZex46zlW5w0iQlGwkIhFRXDrFSxqKhNgjD9PhKbgBXmH
 +wKSm7z5j1IwrLODAsJB56jcZG9RJNz4CRrzLIfhNW42gwy75zoNb2/oi9EmHsvN/tnI
 SJuA==
X-Gm-Message-State: AOAM530Qs0AUa+0THfEg4Pb9Lt9vIKNWnAzKfcvacJlfRg2Q16TMxR3w
 ftiC3llYM6Gn9a1axl4VJVAkWkxG6kT5pHIdO76OlA==
X-Google-Smtp-Source: ABdhPJzTtFRovIKLE7cUceDv6PJncQ8pNo/7qHssnujL3Vd0Eq1QM++6UE8ZOB3sBs/m8ju4QxVgOi2qFrHxFxzMnDg=
X-Received: by 2002:a17:906:494c:: with SMTP id
 f12mr22915345ejt.56.1612276167342; 
 Tue, 02 Feb 2021 06:29:27 -0800 (PST)
MIME-Version: 1.0
References: <20210128224141.638790-1-richard.henderson@linaro.org>
 <20210128224141.638790-2-richard.henderson@linaro.org>
In-Reply-To: <20210128224141.638790-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Feb 2021 14:29:16 +0000
Message-ID: <CAFEAcA8r5+ciCFb0kPC1bAi-kU53iJBiLf7Jiso-gr2cOBtxeQ@mail.gmail.com>
Subject: Re: [PATCH v4 01/23] tcg: Introduce target-specific page data for
 user-only
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 28 Jan 2021 at 22:41, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This data can be allocated by page_alloc_target_data() and
> released by page_set_flags(start, end, prot | PAGE_RESET).
>
> This data will be used to hold tag memory for AArch64 MTE.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v3: Add doc comments; tweak alloc so that the !PAGE_VALID case is clear.
> ---
>  include/exec/cpu-all.h    | 42 +++++++++++++++++++++++++++++++++------
>  accel/tcg/translate-all.c | 28 ++++++++++++++++++++++++++
>  linux-user/mmap.c         |  4 +++-
>  linux-user/syscall.c      |  4 ++--
>  4 files changed, 69 insertions(+), 9 deletions(-)

I reviewed this (and some of the other patches) in v3, but
you didn't pick up the tags :-(

Here it is again:
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

