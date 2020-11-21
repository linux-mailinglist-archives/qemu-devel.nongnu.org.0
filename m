Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C4B2BBEA5
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Nov 2020 12:34:07 +0100 (CET)
Received: from localhost ([::1]:57362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgR9a-0001Ko-PS
	for lists+qemu-devel@lfdr.de; Sat, 21 Nov 2020 06:34:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kgR8X-0000mP-2R
 for qemu-devel@nongnu.org; Sat, 21 Nov 2020 06:33:01 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:34688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kgR8V-0001h7-89
 for qemu-devel@nongnu.org; Sat, 21 Nov 2020 06:33:00 -0500
Received: by mail-ej1-x62a.google.com with SMTP id o9so16585701ejg.1
 for <qemu-devel@nongnu.org>; Sat, 21 Nov 2020 03:32:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=I0iSsaRbFfdpv7h/jxd+YgqpYfYWyDfIT5YHBtsWcLw=;
 b=p62RRNG7ggVnPET8b+5SXKM+pp3nUKFup6AbwpLhIbNiAF9bxA5iWfRYd/45BndVVY
 9PqVPbZ3IN2yiSz4Stf/67jcEfubFxqX5GUoe9RJgeKLbcAu0Z67GwHCyUrNQothl/se
 p9BFNnu9ASmVE/UwN3Ohu5LFi4PPyLHVUJgDIMA2A/DGLDsZjkClB0kOiUnQVMRApSOb
 /ra275wGrTJlp/4AfCOcXEiZqXeS2JqHH2wFou1ziAGIdr8GkZFsNUMUF8aDTLSlQ8m4
 s4dnRX7wsNqakg3LRyA4xjOoQhNDkkL5kkDsCPZi+bOzGQE4ubSZId72n1sGzh32ghqE
 Cy2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=I0iSsaRbFfdpv7h/jxd+YgqpYfYWyDfIT5YHBtsWcLw=;
 b=AF/aHhpcT1BVwbsCFHZv0v3goZPiGGdEysk6dRdR2NEFiBzgNJVZvvFv3RK7HNr4yV
 UE+S5MIeA/CPnsYLJpIEv31B8+yT3AKRumHOtB+8vTRpnlZ9LarcGdC9npvOrTYjHGb5
 JBQmU2o2SXOiVx/q9uSKdLZkdtxpMCAaeR0H0OaO2HYyXOOe0plD/YQ9BjOWlMbJODg5
 vYpps/nr5wmexDMdM4GrLMnrQAD6veeZCFSAlCA194V9YM0rE1as9Hse1hfeHBMNHO5P
 aYA8WQSvOAMOfUrb9GQb23NxadyXhx4b94mnx7Rd5l7D8r1rRCegFxZt5isV6O5RqyKZ
 x07w==
X-Gm-Message-State: AOAM533QRfjuLvIr04iWq4d0zkRRzFfEVRkD3r5mdJnEfOiV2gelBch+
 Auehw+B+mgKKpE1Wznq71dD2FqC1M+VLBia8EMAviA==
X-Google-Smtp-Source: ABdhPJx0Bt/4vY4uqmgKfOK5RDXmD0FMjxvPFDLErl4a6QxQN5Te1R4c5NKtK0rLjtycC0aCXY1lOv5MJF2UZHbM4mM=
X-Received: by 2002:a17:906:6896:: with SMTP id
 n22mr38394675ejr.56.1605958377392; 
 Sat, 21 Nov 2020 03:32:57 -0800 (PST)
MIME-Version: 1.0
References: <20201120221634.2504254-1-pbonzini@redhat.com>
In-Reply-To: <20201120221634.2504254-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 21 Nov 2020 11:32:45 +0000
Message-ID: <CAFEAcA_Mn50PH7AkTrBaxXtfCTky0KNpDrspHbSccw3oF3RTBg@mail.gmail.com>
Subject: Re: [PULL 0/2] Kconfig, qboot changes for 2020-11-20
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
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

On Fri, 20 Nov 2020 at 22:18, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The following changes since commit 7fbd7e710323c8f4c5f6a38a8ae0e6726b5a4599:
>
>   Merge remote-tracking branch 'remotes/stefanha-gitlab/tags/tracing-pull-request' into staging (2020-11-19 17:08:42 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/bonzini/qemu.git tags/for-upstream
>
> for you to fetch changes up to 5983021eb6cd0fb8dfbac5211892f5231758d60b:
>
>   qboot: update to latest upstream (2020-11-20 10:48:53 -0500)
>
> ----------------------------------------------------------------
> Bug fixes
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.2
for any user-visible changes.

-- PMM

