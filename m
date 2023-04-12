Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E74B6DF4CC
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 14:14:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmZLk-0006Za-IV; Wed, 12 Apr 2023 08:13:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pmZLg-0006Z5-1v
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 08:13:16 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pmZLe-0000Br-03
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 08:13:15 -0400
Received: by mail-ej1-x62e.google.com with SMTP id q23so18772185ejz.3
 for <qemu-devel@nongnu.org>; Wed, 12 Apr 2023 05:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681301592; x=1683893592;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=itOq5DDCSKEiuCd7JOLCrGpAlwrtS+WKV/XpfqNMHpc=;
 b=RUSt31RI2RgVERPIQ03qL19MvTBxwYQ658d4c0AurEPeC/XXzFMC0s+qegMoQ+ZSBz
 4l+yFZmY8ha/42qfkmGrwyb0K7U4rXYeOGrCBZtM6k0dhzcaWPeoRORUBCsftEx8t/mq
 3nFnVZ8pfcpBP4CTsU+rjgyh9A2TTxSP0TvyGYznoMS0ddP2AzSa7buaSqQDiGCOSYmg
 fqXRzQ9u9eoJMOjW5MHPptjrtrZLF957R4Ce1PYcWX2hSFFZqx3z7vKuh7jEuOb86r7d
 38yHnfCXxsvBGKfckHDhUieLxCClT2St0WUH52xLI4A6TkG604U4Mxmsz/0w1etHcJbJ
 3Q0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681301592; x=1683893592;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=itOq5DDCSKEiuCd7JOLCrGpAlwrtS+WKV/XpfqNMHpc=;
 b=4xPVW+D5YGk628j/mxLK7CgzLPWDE5GKecI6IzZr5JDT7ZY6S36It0XXNQan+5xZ6A
 tTPhLKMgdHlVxlleZlhZ4qLKawZs4+TdiVDnAmfzSlRJXfSDzKshsKoJQORzCmlocfw6
 dICdaVovgwc6tSb1BrLqYmpvlP6ouMidDTaZWyf/CRBfAJrTIsTkxrP432MVxTvPzhWn
 PiVhUQ2uMSzhmsU+jwtsWciJ6y2934D5RdtnlXuDhG/Bn3+lLqbPgRrG1suQlkIDsp8L
 wp4BHDTJBOFT2ggC+M0v9StxO8WmZ9QgatWgOgaLvY4J8TCF6cSffB76z4MXVPUFn3sY
 nxvw==
X-Gm-Message-State: AAQBX9dg61kmPDewGGZcWZHp36bnEFrPKxnDk7tqkhnYqEXPalMLPPU7
 FQa3XK0WgGA6+i6EY6cDrtsVLNouECgZ4Jw7gNReHg==
X-Google-Smtp-Source: AKy350a1Oedb9yIru/yualgUj9KVaVebp1bscXiby1xAS8Hlwhj9nvyeahL+2HUNg+8zNE2YBMumUjGoMeQ25ANTkRc=
X-Received: by 2002:a17:906:a982:b0:92f:cbfe:1635 with SMTP id
 jr2-20020a170906a98200b0092fcbfe1635mr3193384ejb.6.1681301591803; Wed, 12 Apr
 2023 05:13:11 -0700 (PDT)
MIME-Version: 1.0
References: <CABLmASEcJRNWRaFum_BKgwKu7cJ8BDM3W94W-ZZwFLFuEwkh7g@mail.gmail.com>
In-Reply-To: <CABLmASEcJRNWRaFum_BKgwKu7cJ8BDM3W94W-ZZwFLFuEwkh7g@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 12 Apr 2023 13:13:01 +0100
Message-ID: <CAFEAcA_tibfd5WjRTEbkoGrZtcinnYvFWmn7AeCkp-Yd-xwsYA@mail.gmail.com>
Subject: Re: source fails to compile on msys2
To: Howard Spoelstra <hsp.cat7@gmail.com>
Cc: qemu-devel qemu-devel <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62e.google.com
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

On Wed, 12 Apr 2023 at 13:05, Howard Spoelstra <hsp.cat7@gmail.com> wrote:
>
> Hello,
>
> It seems the current source fails to compile with up to date msys2.
>
> Source is configured with:
> ./configure --target-list="ppc-softmmu" --enable-gtk --enable-sdl --enable-slirp

Are you using a not-up-to-date version of the QEMU source?

> C:/msys64/home/hsp/src/qemu-master-clean/include/qemu/osdep.h:240:8: note: in expansion of macro 'G_NORETURN'
>   240 | extern G_NORETURN
>       |        ^~~~~~~~~~

In the current source code this line reads "G_NORETURN extern"
(ie the two tokens are swapped), which should fix the compile
issue you're seeing. This was done in commit 5cb993ff131fca
from March.

thanks
-- PMM

