Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17DDB22E216
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Jul 2020 20:53:21 +0200 (CEST)
Received: from localhost ([::1]:36228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jzllv-0002WH-IZ
	for lists+qemu-devel@lfdr.de; Sun, 26 Jul 2020 14:53:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jzlkt-000251-I8
 for qemu-devel@nongnu.org; Sun, 26 Jul 2020 14:52:15 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:44855)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jzlkr-0001YU-Lc
 for qemu-devel@nongnu.org; Sun, 26 Jul 2020 14:52:15 -0400
Received: by mail-ot1-x344.google.com with SMTP id o72so5172762ota.11
 for <qemu-devel@nongnu.org>; Sun, 26 Jul 2020 11:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7lPWu1Ttfozs5tqK12Hg8Vc1z21OYO1T7Qw9387a8SA=;
 b=I2b2E4eFqvjgZCQVkyhSMySKO4STRH8YzvNofVKoHgl+gDWCjDnDfv5aXp03yWiiyW
 6Ud4wjDQ8UD0hMH5/Ou3O+DfaQDpyDrj2Eqkt2JZKp62XnTF5kWHyIqjzdfQzm34+i8G
 ZCNnUoYMed3/yZ4HmQ1G6QSBqlgXZOdiBpJb4EAWMi5cTY6ez16NC9QcHzBokxiyAfCW
 ZOVWrzE6wnGX9mjoyfmUzq65qewcQHxd8gSCpQl6kV+fS8GzptphGtuZbWN67xsBEzPv
 nPh3n0aOHnGfj5I97rGid0Ku/0L6aVYBexFVuZGLcv2Qh2iE9wvi/arunBQLU5/GLH8p
 kyZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7lPWu1Ttfozs5tqK12Hg8Vc1z21OYO1T7Qw9387a8SA=;
 b=c3x6JP+E08K6JXOlf27RIdeofs+4sfRc1B6NvXYBwln5MA6VXuEM5/yGlwAf4REdV9
 GV4oDpgsLesQtubpQ1FC4/r5Bf66YMadRAddSJWUNIUltN4ReP/J7W75fZ5HES8uRaeH
 p3FedF85TAOyRIMHu/ZTPYJWe5Ru+QkvNC+je1Vk/EvrjpGX+cFlvb2q2OlZMliVHAmh
 7+d5c7CPGOaWxVZUbitsc4G/A50LlP479BARME2bzf3ZBRIxzhQivyvEdRxlToK8nm7g
 yN5ZYOz2v0KtEZfbrLCOvlFCsXLlwzQglNePSsbeBRYTcGqn95dG+ivp/h72bIyKM9aj
 +2Lg==
X-Gm-Message-State: AOAM533LhVVej0EeFi+xI9Y/PAkW95WC1xsShHTzh/aVCgRwP/K50L5a
 Pcw7iMZqGxrYe3Fqt8+V8W8kwZXETPPU/ZrHwzf1Qg==
X-Google-Smtp-Source: ABdhPJz/4gSk+9tMmMTFVna8qWF2NhJCkSwtm50VzYazuWi2PxGxT5F9gYlmV5H0cBkgQsetSodBZYBV8Ei+myl3EGE=
X-Received: by 2002:a9d:7303:: with SMTP id e3mr16773632otk.221.1595789532159; 
 Sun, 26 Jul 2020 11:52:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200725160548.750749-1-richard.henderson@linaro.org>
In-Reply-To: <20200725160548.750749-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 26 Jul 2020 19:52:01 +0100
Message-ID: <CAFEAcA8wWGYshM9kHeSxPPwXaPKZJ-wL0tTrnrEC=ztXKbAu6g@mail.gmail.com>
Subject: Re: [PULL 0/3] misc tcg-related patches
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::344;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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

On Sat, 25 Jul 2020 at 17:05, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The following changes since commit 7adfbea8fd1efce36019a0c2f198ca73be9d3f18:
>
>   Merge remote-tracking branch 'remotes/ehabkost/tags/x86-next-for-5.1-pull-request' into staging (2020-07-24 10:52:20 +0100)
>
> are available in the Git repository at:
>
>   https://github.com/rth7680/qemu.git tags/pull-tcg-20200725
>
> for you to fetch changes up to 3cb3a7720b01830abd5fbb81819dbb9271bf7821:
>
>   target/i386: Save cc_op before loop insns (2020-07-24 14:29:35 -0700)
>
> ----------------------------------------------------------------
> Fix some cputlb commentary
> Fix an hppa temporary leak
> Fix an i386 translation issue with loop insns
>
> ---------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.1
for any user-visible changes.

-- PMM

