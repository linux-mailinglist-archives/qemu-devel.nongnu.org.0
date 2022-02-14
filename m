Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D00724B5ABD
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 20:55:20 +0100 (CET)
Received: from localhost ([::1]:34754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJhRP-0003fa-VO
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 14:55:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nJhPo-0001sE-7w
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 14:53:40 -0500
Received: from [2a00:1450:4864:20::434] (port=40882
 helo=mail-wr1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nJhPm-000782-KA
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 14:53:39 -0500
Received: by mail-wr1-x434.google.com with SMTP id j26so17788291wrb.7
 for <qemu-devel@nongnu.org>; Mon, 14 Feb 2022 11:53:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oEYQpMOglnRW2+Gzdi3CoFRdJv4c64B672xXSXTgcVE=;
 b=TipEoZcT58JDYDw6T4m5BiU++3g3ufDoyqM/Hw+E3AYK/lNgB1UhhPC1SCwce/Pqa+
 Z9DCIgyqczzLXGdwUOlasJbYMzPDb3Wus3TmbdmgF3kVFcCvHcK0keAmHPB3nU8SYQex
 fxvOgylJ9FcE0X5V1g5hbdymOYh+o8uviaXwSx58d5yKxSVARk0igdat86TWuBqAb2/E
 25uEZoUXnooUlKgRIhIJ8+2qvzgedXLJJFw7mU3n0YgW3rRr+Oo2oZCHcsadfjMI6Ukv
 klSsTU+4tMqPORjnd5N/DLwxqfIGeAelyhHRkSo24xAajA6bfB4ncdbycJ/9+3li6Xtu
 FSww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oEYQpMOglnRW2+Gzdi3CoFRdJv4c64B672xXSXTgcVE=;
 b=KH7liJTg7sW53LGaMa51TgP9HdffPnUYWuEWdUpuoiRqNEP5vU7DgVxHpB6RUEyv28
 OhSywkA9Ut8VIO5D0aCMIb7Dv4lBefHiXB0SCwuh2dg9Dk7gs2HtHcIjr6kfdepo5cXQ
 qENQFBfCPSYR9+umsFqUHlxLe6Oeke29QMUfm9FE86xWu/xFlZo16MI2sXCVZeTyxu6g
 sUd87U4x7EcXgP38cZPDoM0vGIrVsPoCE4wUDQk4cM0aplHhR5x5gtsUrZWGRummqU2q
 ynQCCdXfTR9Jgtvg4BVz09eHtl6IdF1semk7pB6iaLvsdVVA4cKZF56PPeXJDa5SQx38
 uJtw==
X-Gm-Message-State: AOAM530zFvgCLK2yYI5EmOrf+5T/RJXYzFzkS7C6l0PsqgpBZ4rmDqM2
 oPDZrEHyph+baUCJkJBlN8mPhgc0irf+SKkDhrdRs+vURQw=
X-Google-Smtp-Source: ABdhPJwFenaVzCucNmG8zfJ6UxnlzsGTv3sx2gmkg2Ns0C9H4tqVVfsII9sKgt8Q9q7EdeD7QsFPcORPBfsqntaHCyo=
X-Received: by 2002:a5d:6d09:: with SMTP id e9mr527836wrq.2.1644868417277;
 Mon, 14 Feb 2022 11:53:37 -0800 (PST)
MIME-Version: 1.0
References: <20220211013059.17994-1-richard.henderson@linaro.org>
In-Reply-To: <20220211013059.17994-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Feb 2022 19:53:26 +0000
Message-ID: <CAFEAcA8=bNRBJocJV3YxbikPW3zf3E7Jcyf7H0YGCr8PJxtviQ@mail.gmail.com>
Subject: Re: [PULL 00/34] tcg patch queue
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::434
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.635, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 11 Feb 2022 at 01:31, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The following changes since commit 0a301624c2f4ced3331ffd5bce85b4274fe132af:
>
>   Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20220208' into staging (2022-02-08 11:40:08 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20220211
>
> for you to fetch changes up to 5c1a101ef6b85537a4ade93c39ea81cadd5c246e:
>
>   tests/tcg/multiarch: Add sigbus.c (2022-02-09 09:00:01 +1100)
>
> ----------------------------------------------------------------
> Fix safe_syscall_base for sparc64.
> Fix host signal handling for sparc64-linux.
> Speedups for jump cache and work list probing.
> Fix for exception replays.
> Raise guest SIGBUS for user-only misaligned accesses.



Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

