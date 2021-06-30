Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A903B8990
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 22:11:06 +0200 (CEST)
Received: from localhost ([::1]:41626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lygY4-00074i-Uv
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 16:11:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lygWP-0005pw-2C
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 16:09:21 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:41522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lygWN-0001H8-7g
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 16:09:20 -0400
Received: by mail-ed1-x531.google.com with SMTP id m1so4968060edq.8
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 13:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Af3B+KVa/ctybINmaQW5A9fzKA2OLNpaYunwkCuh9Kk=;
 b=s+aBR5HGJFVAA4cxfWV+ghOpRCI05UBtF/bmomYKWZBzEyz6J7zBW65r8MTGClE4LX
 vItS/FymkpTvfztHOuWA+WF4Ue94RQo0oS26JyatJRwRZYi0gxri+YWKYXBuIWj3fIyg
 4wCxnYmPPUhFzoUSdwKXSCiNYYZSgPzOsPEKKdFAPbzBhRCjivYmgUQZ4chs9Uki+V6G
 arYb6OHlHTL8zdlqmz3V/JsYnAr3pcorHt3JAGXGm0w+M2IHp5NtFWCjrf7cBeWAQeok
 4lAIiX7ObBE1CKoYS4G1IYyQllge/e4r7m2tqTx60suEbhNsSHaOGY8iM7sHnPdUoulj
 vWEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Af3B+KVa/ctybINmaQW5A9fzKA2OLNpaYunwkCuh9Kk=;
 b=MeYKM4j2eqtEK1Id/Ojv2IqBl4zHtJk/CqgEeGM068AdkF1Nqn+X9QbyHezeu+qjNI
 mj/+AEJWQwlXfixXQZzGVOub0yMjLGM4e4JEt2iucdKIBSko7Ek5EVLeZMMSNTpioMNv
 NG2Zn7bU8ojPC9OwwG8OuBHt+zflTwrAKur6yM7RCzK1GWpdsuRENzZOREHxe31j1fTk
 8aW62indrF0nxL+ZZmMOomv+U7Jb35psU6pr1Vtptnusik/xwe8RrMT5qUiUby1QUbNZ
 HSuNF8VVjkMZGcnGLoFJzJ7qdATY4jlXGWHBrDGOyTKEUrmZINn6bzZon4Tu7u6YaSHt
 LUAg==
X-Gm-Message-State: AOAM533OGkJNYXRIQM4l5ius49HyubjIjYTYjelGZQdfBpaWxxb+qpTn
 5a6b6AWATdQNcG444vSvKimoUxb9+xrmdJBEp9w1ng==
X-Google-Smtp-Source: ABdhPJwCnClQQwTPaGFCrz2YvOIV2CdArPHewBM1AqYtH7ymUGp79BSI67+FCCnE1hglAsUOQSctaMP+xP4bAKR8spM=
X-Received: by 2002:a50:99cf:: with SMTP id n15mr1070967edb.146.1625083757409; 
 Wed, 30 Jun 2021 13:09:17 -0700 (PDT)
MIME-Version: 1.0
References: <1624986876-2264-1-git-send-email-tsimpson@quicinc.com>
In-Reply-To: <1624986876-2264-1-git-send-email-tsimpson@quicinc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 30 Jun 2021 21:08:40 +0100
Message-ID: <CAFEAcA_L0W4dA5A9Qj7_ub37gZdTk8a7D_Az_K6a7YqXxc99Yg@mail.gmail.com>
Subject: Re: [PULL v2 0/4] Hexagon (target/hexagon) bug fixes
To: Taylor Simpson <tsimpson@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
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
Cc: Alessandro Di Federico <ale@rev.ng>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Brian Cain <bcain@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 29 Jun 2021 at 18:14, Taylor Simpson <tsimpson@quicinc.com> wrote:
>
> The following changes since commit 13d5f87cc3b94bfccc501142df4a7b12fee3a6e7:
>
>   Merge remote-tracking branch 'remotes/rth-gitlab/tags/pull-axp-20210628' into staging (2021-06-29 10:02:42 +0100)
>
> are available in the git repository at:
>
>   https://github.com/quic/qemu tags/pull-hex-20210629
>
> for you to fetch changes up to fb858fb76b1b2dfdf64f82669df1270c0c19a033:
>
>   Hexagon (target/hexagon) remove unused TCG variables (2021-06-29 11:32:50 -0500)
>
> ----------------------------------------------------------------
> Fixes for bugs found by inspection and internal testing
> Tests added to tests/tcg/hexagon/misc.c
>

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

