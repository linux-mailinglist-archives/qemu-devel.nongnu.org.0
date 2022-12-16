Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E033664F3CB
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 23:13:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6IV3-0006h6-Qt; Fri, 16 Dec 2022 16:44:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p6IUa-0006Ed-K8
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 16:43:45 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p6IUY-0000lC-Fx
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 16:43:44 -0500
Received: by mail-pj1-x102d.google.com with SMTP id gt4so3751671pjb.1
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 13:43:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=9bh7ZU8f1SvoMyl2SNZHFh8wfyvrdB29fPYPNfszw1c=;
 b=VZywZoBSBpLFcURE6ST2y0N9FTof+MgM9Ymafbm2ERh5/VQHUsz4yh7LGLHPckIfqb
 /T6tqldp9RpJw5FzjOesMAUsYwDc76ooeAIgpe1TTXl1If3DGlwnXtqorGyzHUDYbd4n
 IlcfcuvI72ob5E9Mkj5mInc9Azf6nrByhKwh2ZNayjfyP5JSH9uuO+0g++FcP+z3jDcq
 Y39TcSGCkc1aNoJMHRasMAaWgrd60X2YYKjeKv/xdL+g6K+oN81u+ZCQRoShjh+Re440
 rhdf28fC40kJLWi1ZLwUmCM2EXl+Syauj13o108zt6Wpdd8syRkor1LVgupmKpcbrPGu
 Kb0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9bh7ZU8f1SvoMyl2SNZHFh8wfyvrdB29fPYPNfszw1c=;
 b=YyBf8qOcdbMMqEYia9KtqGxhRkO9SjQqnM53cPzy0HZ2e/ilT05MPmwt81M3DNxG4a
 fshqq6PWiiOUqQly61JN1OxNA2RpFW45hIDOEmcMLU0E/BQSw9Mw3ytqh/g/iBzA/YvZ
 hPBVvKXWjBBNucbMSn1Q95ZFvpZIB63QV1vLUnldACTyYn43FB7MNFP6SGtOB7yTSssU
 7CHHFCtwGQV87y58ZblxqgaPN838MPcOjK6/YwJn/K4bbKtpoikmu7NAF/TyyJf0qx8y
 nzzU6H/gomP+Qs+bhUI5T2X4e3sZPNBgemMHymoRPHXpr1N8audwYjjWvkLcP220J/7J
 5rHg==
X-Gm-Message-State: ANoB5pnd04xgDq2iteZSL2CHJIrcLOxsroyrE+OmddJB2kXskanjIL4w
 1cdM3hF98lloIrx7sFRji/wVjGNv9CTvqUtXhdaz0g==
X-Google-Smtp-Source: AA0mqf6LgpTNuwyMBd6W4k+fV3o2TkIrq3wiVvuLo9DwTgNxx5hDGj98QPTF4ZnFaoJxs/Y6SJWzka+goxUhqpTLgQA=
X-Received: by 2002:a17:902:f292:b0:189:91b8:bf92 with SMTP id
 k18-20020a170902f29200b0018991b8bf92mr50007012plc.19.1671227021160; Fri, 16
 Dec 2022 13:43:41 -0800 (PST)
MIME-Version: 1.0
References: <20221215152407.201278-1-kwolf@redhat.com>
In-Reply-To: <20221215152407.201278-1-kwolf@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 16 Dec 2022 21:43:30 +0000
Message-ID: <CAFEAcA8d_8+u66g2OY0kwF=TYqa2NxMWUF2AsNrgFDZ6ASh2LA@mail.gmail.com>
Subject: Re: [PULL v3 00/50] Block layer patches
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org
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

On Thu, 15 Dec 2022 at 15:24, Kevin Wolf <kwolf@redhat.com> wrote:
>
> The following changes since commit 48804eebd4a327e4b11f902ba80a00876ee53a43:
>
>   Merge tag 'pull-misc-2022-12-14' of https://repo.or.cz/qemu/armbru into staging (2022-12-15 10:13:46 +0000)
>
> are available in the Git repository at:
>
>   https://repo.or.cz/qemu/kevin.git tags/for-upstream
>
> for you to fetch changes up to 1b3ff9feb942c2ad0b01ac931e99ad451ab0ef39:
>
>   block: GRAPH_RDLOCK for functions only called by co_wrappers (2022-12-15 16:08:23 +0100)
>
> v3:
> - Dropped "configure: Enable -Wthread-safety if present" because FreeBSD
>   has TSA annotations in its pthread locking functions, so we would have
>   to annotate the use of every lock in QEMU first before we can enable
>   it.
>
> v2:
> - Changed TSA capability name to "mutex" to work with older clang
>   versions. The tsan-build CI job succeeds now.
>
> ----------------------------------------------------------------
> Block layer patches
>
> - Code cleanups around block graph modification
> - Simplify drain
> - coroutine_fn correctness fixes, including splitting generated
>   coroutine wrappers into co_wrapper (to be called only from
>   non-coroutine context) and co_wrapper_mixed (both coroutine and
>   non-coroutine context)
> - Introduce a block graph rwlock


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

