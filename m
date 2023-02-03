Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D6768A24F
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 19:56:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pO1DG-0001jf-IH; Fri, 03 Feb 2023 13:55:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pO1DA-0001j3-N7
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 13:55:03 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pO1D9-0003nP-1C
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 13:55:00 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 nm12-20020a17090b19cc00b0022c2155cc0bso5782029pjb.4
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 10:54:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VorpZTi8GATFKvZeb8TgqcJt6X78j/vCT2yw0Hum7gI=;
 b=HbwvGt+f/lF2FUzDBwubzigbumLuRCK6V7RwS8dBZxZo2scygqkpaSelpv6CFilyLs
 3axsOnaozGLxbkuNd26iN3xb+lXQE8fPXXIQzJsVFzyTY0Uy4tdRtpddBwfAsxIuFIma
 yFXjrzDbBFokTc67rlOel3RRJbNBCi+lqEHKlQ8Qz+U7KusNE0DJpXIZcG0vsXygpIQt
 jaAMU9tnzdCfChHBFOx1HDbPtJPlsBr80Ugo3DIAX0U2kqM/naFAhj+TaDbTDfO6VMgW
 r2Py8soxdxAy2myN9oOImwQ8uISc9wjtt3egLLLPxxuholLzNM7xl+MJu1/Ukbfglman
 kuOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VorpZTi8GATFKvZeb8TgqcJt6X78j/vCT2yw0Hum7gI=;
 b=c89d58k+3RxV1+5Un/qh4EX0xgCRloVDXdUFXCnfP4qMxrhECMXOe1erssZCkrIm7E
 r5rbguHlM1PTBW1FHNPuwYk4SIx7Zzx9chJOEgnc0acNCOhihp8E1mmg4wwulnmPUeG7
 cf9Q+vfi5vdcOylZStGx+RrfHGncw8OxU++ZYld8xZKUAu88fXKvKjIjvB6US4Ezw8Jg
 ipSSjlrLirEdvEr7GUP6M/BBMuIctcpwwKlqnG+UiMhW6pZh3ojyvFcXKm95LLfDuMYB
 UmgXaRNDT+Flcy3Ze+OVF2rMK+DYRyF2nV0MDhGqGgXVqvc8W49Z6ikiZCis2y7svN1N
 AbSA==
X-Gm-Message-State: AO0yUKX9L/93kUvfRgmQxNmXV8ngw3SNfZUHWOKf1ZYAXreIJl+j/B8K
 PzJWr3z8Agln6lXGPv5JR50WCwmJBdwyq5qtLGcCr7BnMoSv0g==
X-Google-Smtp-Source: AK7set+8Kl2coF5uexDb1MgLgCHWqEzidcHFIbJff44y41xzh9fex0vzWa1NkyhMc8WWaqP7KlX7jlMEIgQJSa3lF9c=
X-Received: by 2002:a17:902:f552:b0:198:a5da:bf6c with SMTP id
 h18-20020a170902f55200b00198a5dabf6cmr2785714plf.9.1675450497149; Fri, 03 Feb
 2023 10:54:57 -0800 (PST)
MIME-Version: 1.0
References: <20230203142927.834793-1-peter.maydell@linaro.org>
In-Reply-To: <20230203142927.834793-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Feb 2023 18:54:46 +0000
Message-ID: <CAFEAcA8w1iCAWuyzL-8c+zJzMukPsLoc=Jw5Az1U+hKjmsOYpg@mail.gmail.com>
Subject: Re: [PULL 00/33] target-arm queue
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Fri, 3 Feb 2023 at 14:29, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> The following changes since commit bf4460a8d9a86f6cfe05d7a7f470c48e3a93d8b2:
>
>   Merge tag 'pull-tcg-20230123' of https://gitlab.com/rth7680/qemu into staging (2023-02-03 09:30:45 +0000)
>
> are available in the Git repository at:
>
>   https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20230203
>
> for you to fetch changes up to bb18151d8bd9bedc497ee9d4e8d81b39a4e5bbf6:
>
>   target/arm: Enable FEAT_FGT on '-cpu max' (2023-02-03 12:59:24 +0000)
>
> ----------------------------------------------------------------
> target-arm queue:
>  * Fix physical address resolution for Stage2
>  * pl011: refactoring, implement reset method
>  * Support GICv3 with hvf acceleration
>  * sbsa-ref: remove cortex-a76 from list of supported cpus
>  * Correct syndrome for ATS12NSO* traps at Secure EL1
>  * Fix priority of HSTR_EL2 traps vs UNDEFs
>  * Implement FEAT_FGT for '-cpu max'


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

