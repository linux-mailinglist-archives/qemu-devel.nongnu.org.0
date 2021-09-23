Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF0C415F08
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 14:58:06 +0200 (CEST)
Received: from localhost ([::1]:42058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTOIf-0006zT-La
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 08:58:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mTOHh-0006J3-KO
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 08:57:05 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:45601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mTOHe-0004oR-OR
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 08:57:05 -0400
Received: by mail-wr1-x42b.google.com with SMTP id d21so16817581wra.12
 for <qemu-devel@nongnu.org>; Thu, 23 Sep 2021 05:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hjmfG52GJyUCnd3mWs2y5old/6/fkXzGIiWuRoWp7Xo=;
 b=ZjohTEUnBppmMHbM3hUmKsd8k/B7BHupKirKihHyT8T0wRLJWS9HZinePdkU7rC66y
 9oPNAbp8m/Ji0MyBC6VCSaZiY4LQYs6pBIES5m8lp4EEB0tA+0QJAYOuIQdCkUSBWfzY
 u5iAuENhnFR0s+OkQtQdADkNG7TPnCRbVLeTJf3s3h3wB+7X7cikAV+ecE/vFVFFDkrL
 SwWRPFJeWsDo29kvyqpKwUwGuYQJxLVPoj+YmUMMnbfqFg6QJevASISksoohzGN07f7W
 urWQw3Mu0EvXt5fhMLdPEEuXyR80P3Pgx88dPFYb9mOs0nm6lvj4BknUe/+gMmKu0aEO
 Qt9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hjmfG52GJyUCnd3mWs2y5old/6/fkXzGIiWuRoWp7Xo=;
 b=GRFfVf6afK5snIRelU9c/JXy3paHaovXy5UIW2NuTSi1AJBwlEgPGwC0do3suimp4c
 NeuQopEAAdJKwJSRD3QWnjkMa81YRaNMy7UxLgtyR7Ou1+OS8L5/OQ22zvJxNpzvCGsi
 HmOLVLzYSFz1nT+uvuzd6gCvLfsveNONrwsoGUZLg0xsC+w5/9AKAagSmAOQp6IuRA7G
 NbO8F/h6EZoFvJjpjGea7xaCl0PD34P2YnMnm2C6LMkgBv5H0nxbftNYoKACAQS7Smx6
 NwsT4UsmuEPIpoaDsaTE86jcD7s43vAosmlTrfzzI5S3B3Mb2Sb9nUKpuBvJG3q+zIXw
 vk9w==
X-Gm-Message-State: AOAM531bRTHqlSt5Kb0iCjqQOSwt/hC3feEfLg65ls2YjWpVb5qSfyFt
 N+VkzzpPYSPgErLIAHzYA1yfapmwzO9r7cfL0PG+Fw==
X-Google-Smtp-Source: ABdhPJyIjuFBxKfarXYRH4MNQcx/Nb3FNVD3S1Ulp6M19acNb3nrdeBOF4eRoAlwjKOVj78IzqNddvdJsoO3w4Qvcz0=
X-Received: by 2002:adf:fd12:: with SMTP id e18mr4938654wrr.275.1632401820683; 
 Thu, 23 Sep 2021 05:57:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210922025030.574829-1-richard.henderson@linaro.org>
In-Reply-To: <20210922025030.574829-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Sep 2021 13:56:08 +0100
Message-ID: <CAFEAcA_qdu-6xHc+oR+k=yw1ks9EDC96gSXuu04pUTuy=QnOTw@mail.gmail.com>
Subject: Re: [PULL 00/10] tcg patch queue, v3
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 22 Sept 2021 at 03:50, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Rebase and resolve minor conflict.
>
> r~
>
>
> The following changes since commit 2c3e83f92d93fbab071b8a96b8ab769b01902475:
>
>   Merge remote-tracking branch 'remotes/alistair23/tags/pull-riscv-to-apply-20210921' into staging (2021-09-21 10:57:48 -0700)
>
> are available in the Git repository at:
>
>   https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20210921
>
> for you to fetch changes up to 81c65ee223ba759c15c11068f9b292a59a900451:
>
>   tcg/riscv: Remove add with zero on user-only memory access (2021-09-21 19:36:44 -0700)
>
> ----------------------------------------------------------------
> Move cpu_signal_handler declaration.
> Restrict cpu_handle_halt to sysemu.
> Make do_unaligned_access noreturn.
> Misc tcg/mips cleanup
> Misc tcg/sparc cleanup
> Misc tcg/riscv cleanup
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.2
for any user-visible changes.

-- PMM

