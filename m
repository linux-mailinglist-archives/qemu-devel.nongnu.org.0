Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB2B86A5B68
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 16:10:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX1bi-0003aV-EV; Tue, 28 Feb 2023 10:09:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pX1bP-0003Wr-D8
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 10:09:16 -0500
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pX1bN-0004pk-OJ
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 10:09:15 -0500
Received: by mail-pg1-x534.google.com with SMTP id d6so5860718pgu.2
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 07:09:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/rMW8Z73j11hDxUN0CVXpUF7knWhm3EqEzgA5DMwvGo=;
 b=kqivlg/pGrRlecogkcI2L1/sWqBd/Op9nboRtUbHk/5RrBW7Zwr9pOT+2jtkWg66l0
 waipxqn9gyChZl7jUlW0wJ6H5gmnFNA/UILwiSr4FlNWYZGXZ9xoiL6PdM/X+6Lfb/T0
 kSLsMwlWU+WB22HPhhSz2BTszMnUiwDl5DYvdQW2AZYnkb9qLQzV7YEjL25HCCLnz59D
 mHPNQ5dt3fSjh7zdf2cXtvxscu3pJ+AfBHdDymbn0An3SodarQlIHBv9/S9bZL2pfw+a
 zqC4pNnnfO3zucC0g0iQDZ+zb5RCNUhGLwHcZhZsUTovQ5UJATaAr/yVmmDmcXLgg/Ei
 84Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/rMW8Z73j11hDxUN0CVXpUF7knWhm3EqEzgA5DMwvGo=;
 b=A5lmpdsrWXgMOiXAVR0iUshiHJFisJUMCsRYnq/sfUWJyJ2Day4suUMjYQvUMLkSnF
 UrhpBoO0O3NajI4OUqZzERX6o2ilsl21izyMIMoGL+ZE1tawQUm8FmYBa0Sp13gNbkqe
 1VunaYPoX4ifaU3qLqa1LL3a2Lq0znHLlVOngRWH/rcROb9aV5462wr+oNLxA6/7y/op
 o/uYfaLbaXaVGFlMfm2k+a1fDUwSHfkcuz9MZUT0EPNXLfxwePo9b8ntD9AL94ex8ogI
 J8+JIn/x6bbtBi+WbuTBStkGV8d+Ah5yxcog6UimEc2EXWpacPGmaE5yqTzOwIzoobLH
 CW7A==
X-Gm-Message-State: AO0yUKVeI6jgQo7Gv8mhdwfrOjpWcqUF7JrxsIMxnlLUsN8HX2+YSikO
 0oZk953HLMqU+P1ybIj5Pq9nwmUwx2DanIDf4m2aXg==
X-Google-Smtp-Source: AK7set8WqLDp1aigiY+te2rYOlp53cxfm9mmi7dqucZer7eYHbsp9GlsqnPec18NUOhPvvG2mHK7iOYcqeHdXQghokI=
X-Received: by 2002:a63:3707:0:b0:503:77ce:a1ab with SMTP id
 e7-20020a633707000000b0050377cea1abmr872796pga.9.1677596951701; Tue, 28 Feb
 2023 07:09:11 -0800 (PST)
MIME-Version: 1.0
References: <20230227175524.710880-1-pbonzini@redhat.com>
In-Reply-To: <20230227175524.710880-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Feb 2023 15:09:00 +0000
Message-ID: <CAFEAcA_uGPYYyBWdiRyPTxeQSK-3ykg_bz+Jp_ayX4CeBScJ+w@mail.gmail.com>
Subject: Re: [PULL 00/13] build, Python, target/i386 changes for 2023-02-27
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x534.google.com
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

On Mon, 27 Feb 2023 at 17:55, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The following changes since commit 1270a3f57c9221080f3205a15964814ff8359ca9:
>
>   Merge tag 'for-upstream' of https://repo.or.cz/qemu/kevin into staging (2023-02-24 15:09:39 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/bonzini/qemu.git tags/for-upstream-8.0
>
> for you to fetch changes up to 7eb061b06e97af9a8da7f31b839d78997ae737fc:
>
>   i386: Add new CPU model SapphireRapids (2023-02-27 18:53:00 +0100)
>
> ----------------------------------------------------------------
> * New Sapphire Rapids model support
> * x86 bugfixes
> * Prepare to drop support for Python 3.6
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

