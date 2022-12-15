Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C8D64DD10
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Dec 2022 15:45:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5pTw-0003AN-FO; Thu, 15 Dec 2022 09:45:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p5pTq-00039R-Tb
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 09:45:05 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p5pTp-0007YT-5v
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 09:45:02 -0500
Received: by mail-pl1-x62d.google.com with SMTP id t2so7110342ply.2
 for <qemu-devel@nongnu.org>; Thu, 15 Dec 2022 06:45:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=hXehntAdbtJdyM8Ox9xrSfJBNRO71waBhmPFNZlD380=;
 b=iu5lM/AciatA4mfUWhEVgNo/UZnOuaol624749agrmKJ84NIMqS+ojxO599d2rygwB
 bNMfqR4eDj3HEpQ4cDBDG3kA3CuXf0QpRUCvMqGFCrRkGtR4jkjlO5Fd6rvjxacp3oxY
 TumLotr4bcvIcV238aN6iY8/YNlkW0J+WuGYkVaWj9f0eYQ5+EuERLjD8UjpjzbaZTbo
 bqggd6xdko9dRKVrVp6/CSqz5leAtXgJolJ763xZ6QvXMm/65gy97veFKCbzyv9Bbi3O
 l4G1OLPZvASBcQtoFk2KSF0xpquGb8YmIMwzu2WCID8jIoh8t1XpCWh+oSqPNOpnf1pu
 yhYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hXehntAdbtJdyM8Ox9xrSfJBNRO71waBhmPFNZlD380=;
 b=crsc+DoYa23JFhWQkm9RWN5S+G5Qp8jaQTZjROzq+hcDhVW/133kN77E7AVE14eFGq
 fW9BulVqQznCk4ZfxGOp79PK0N6GqsSjEM8B/nSB9+y4KuW2X+5Ouk6naj1oqj2hE0pu
 nScYGQBpVkr28N8QVu0MM4x7zEo4bJoOdQQV28/ITH2BuQJZaUCCIb960Lufe0jsGITp
 5Ey8RzPGsdlefsjApfIdQkPASCQIISWe7O2vI9alAHY1bikSTOMb/YWLwlQutMPsfB0c
 Xdio7WX9Qpa8G2BsS/Y3CgM5QOWPE71IQcXrgeYLdDfeMGk/RfTKJ08/SPkoyMh8mGwL
 8K3Q==
X-Gm-Message-State: ANoB5pkb8Kge35Kd7VusKrVcj+K0937MhvY1FWtY0MjHDlSQkBMGI66C
 x9ZRr4jL1+/n/Pdezw1NcSsa+DD+N39DsPLRXby3Dw==
X-Google-Smtp-Source: AA0mqf7J+pwFsJNVGFojxPlpEn5le+YsYAJA1wdB8G/CZ9G3GfHqIIE3buFz7vc6zmtiRdh8Xg/kr3pR685K6akJqYs=
X-Received: by 2002:a17:902:70c5:b0:189:b0a3:cf4a with SMTP id
 l5-20020a17090270c500b00189b0a3cf4amr36445772plt.60.1671115499290; Thu, 15
 Dec 2022 06:44:59 -0800 (PST)
MIME-Version: 1.0
References: <20221215115900.30044-1-kwolf@redhat.com>
In-Reply-To: <20221215115900.30044-1-kwolf@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 15 Dec 2022 14:44:48 +0000
Message-ID: <CAFEAcA9niEUk+JwDhOTqa6owskGmJq0jSJXxeRmUtfG3mp_4mA@mail.gmail.com>
Subject: Re: [PULL v2 00/51] Block layer patches
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62d.google.com
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

On Thu, 15 Dec 2022 at 11:59, Kevin Wolf <kwolf@redhat.com> wrote:
>
> The following changes since commit 5204b499a6cae4dfd9fe762d5e6e82224892383b:
>
>   mailmap: Fix Stefan Weil author email (2022-12-13 15:56:57 -0500)
>
> are available in the Git repository at:
>
>   https://repo.or.cz/qemu/kevin.git tags/for-upstream
>
> for you to fetch changes up to 347fe9e156a3e00c40ae1802978276a1f7d5545f:
>
>   block: GRAPH_RDLOCK for functions only called by co_wrappers (2022-12-15 10:11:45 +0100)
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

This fails to compile on the FreeBSD 12 and 13 jobs:
https://gitlab.com/qemu-project/qemu/-/jobs/3479763741
https://gitlab.com/qemu-project/qemu/-/jobs/3479763746

The compiler is producing -Wthread-safety-analysis
warnings on code in qemu-thread-posix.c, which are a
compile failure because of -Werror.

thanks
-- PMM

