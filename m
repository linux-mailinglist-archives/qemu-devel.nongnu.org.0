Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E3E9530EBF
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 14:57:04 +0200 (CEST)
Received: from localhost ([::1]:58490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nt7cN-0003yp-3c
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 08:57:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nt7Yl-0001Br-BG
 for qemu-devel@nongnu.org; Mon, 23 May 2022 08:53:20 -0400
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f]:36266)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nt7Yj-00016x-N4
 for qemu-devel@nongnu.org; Mon, 23 May 2022 08:53:18 -0400
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-2fee9fe48c2so147002847b3.3
 for <qemu-devel@nongnu.org>; Mon, 23 May 2022 05:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+vrQWuBJsV0zTWOieEgP+MGT/FNfLdQFUVCiETNkS2c=;
 b=LhsQDDzIvPTXVBAyUiA14njrvKwQreE7IEL7BdeJB4PSROotrUlWR8smqgY7Rn6Ju8
 7nzrkc+VzNp2atKZmGfb5ySTGKc55CWWZsvLz4Ibj5s/DC6bGOuUJda3EW+8PFn7nhEk
 glgR9Zkf+aPOWMxm31dYqwE8hTJKjm+5MINW77cEkA+t55fBkd1S9G97QfD2pmJ+WGpg
 jp7tUi11yG/8Hah7lKWI92tLLPRatHp3ktjuegk2SyhYNhbGiybEUoLRr3tBlAhiUKs3
 u2J4muI0kF4Wxg8TyMAW0Dh9j5K1cf1wOgCfPnWcIAJDnduLIlhCni/xeNUnGldujaFQ
 Hwkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+vrQWuBJsV0zTWOieEgP+MGT/FNfLdQFUVCiETNkS2c=;
 b=PyEzkOBFAZGsbrEhhOLciXrXFSPw6S9abDGgeY0+tVxrlXu87TuAEVdpB0Hf3KYxkz
 vW1a/PAsKGe3P6z6kqA7njh670cCk0MiHvQO96oWtmvRpJylvF8LAmiLO4V6NwOe/gBU
 iQFzda2KToqZf83tc/Py+o3QQ0WMCzPy58nZwuLTe+WLnwKa/bIskFynQpRY2ypKSnI3
 bn0UaxhjmLlvca+5Z+hQwm1XAjX/rSklJxENae+H7/ZnhF8tdfD+XkUvUo5X4GFLAmGa
 76vLFyv4q36vIChPKm3A6YpzJ6jNYTMcq/E1LIT+5PYjwcykoQf1/m4D3b0PynuGaeEG
 qJyg==
X-Gm-Message-State: AOAM532bTmf1Mpy0Mm9ET4PqGNnknqq+3SqI4lwG+u3rtzCEh8sW1u6a
 7wtfo/K9CZ0u/8ZwssCRNmPAzId9zPQvJCnE78kHpQ==
X-Google-Smtp-Source: ABdhPJzxDy3fwEVsjYYNi47Vy+Q/wisIaFWuvLubolccd8apms0Qi1jx8DSf92EdHaGiVc8FQ4aIFNlo3aWhKxoGlhE=
X-Received: by 2002:a0d:fc83:0:b0:2e5:b0f4:c125 with SMTP id
 m125-20020a0dfc83000000b002e5b0f4c125mr23564938ywf.347.1653310396553; Mon, 23
 May 2022 05:53:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220521000400.454525-1-richard.henderson@linaro.org>
 <20220521000400.454525-22-richard.henderson@linaro.org>
In-Reply-To: <20220521000400.454525-22-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 23 May 2022 13:53:05 +0100
Message-ID: <CAFEAcA9K8ZLQGUo3OW6TZGGjG1O3TOwNguBpnSa7RvH24JB+DA@mail.gmail.com>
Subject: Re: [PATCH v3 21/49] semihosting: Use env more often in
 do_common_semihosting
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, alex.bennee@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 21 May 2022 at 01:04, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We've already loaded cs->env_ptr into a local variable; use it.
> Since env is unconditionally used, we don't need a dummy use.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/common-semi-target.h   |  62 ++++++++++++++++++
>  target/riscv/common-semi-target.h |  50 +++++++++++++++
>  semihosting/arm-compat-semi.c     | 101 ++----------------------------
>  3 files changed, 116 insertions(+), 97 deletions(-)
>  create mode 100644 target/arm/common-semi-target.h
>  create mode 100644 target/riscv/common-semi-target.h

Commit message doesn't match contents -- two changes accidentally
squashed together here ?

thanks
-- PMM

