Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D7D15BEDC7
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 21:30:09 +0200 (CEST)
Received: from localhost ([::1]:37614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaiwa-0005dB-Di
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 15:30:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oafGG-0006l7-GP
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 11:34:12 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:43630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oafGE-0000yK-1m
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 11:34:12 -0400
Received: by mail-ed1-x529.google.com with SMTP id y8so4382991edc.10
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 08:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=C8IqxTiFl3WhgM28m68hR25FJFTVyxs1L40c1301QA0=;
 b=OCDrFqkdw0RTHHYsyQUtDKFe9ABeX9v5la919X5e8QhK4gXX2Wa4Dt5dDkdDFxe0+L
 n1DFEEWrMLDixhM6qI5sm8DmRqjrYac8dmyhxKE3hFMrgVjsvIVgCSFTVSssJOXpjJTk
 dSXHUvjCCn2VGfnn9AxKKs10btvxVBIa6JzU1jH1kGj7x+deO/x93Lhuwu9OVp6jMOr0
 zQaLXgnBwr8TkSf2SuKTL6xrL5rps8be4q+NoKFahorCIk773wAYxHVXWktSspQ1uA65
 yixCKUXBOosz0ktS+y1Q7MohZWTTgzAbP2BVUVN4rgup94acOrbHIoalWDNZBr13IYwY
 78gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=C8IqxTiFl3WhgM28m68hR25FJFTVyxs1L40c1301QA0=;
 b=0mivbmojYC0ZXaEYvaBP1JWsxjktw1mJpXPHVt8j2GHi/FCOVpUd5vI2HYNvOijLGh
 JciKTVNtkhxk+C3Jg1zmRhmpmyndcvQipQsMiBFytbebFL0ttUCkAOag6UBjw5zTfdiK
 44cqZtQSNGsyeXm+1W+xFfzr6JA2ML+ZgUunkUR/kK3FB68wij0W2mSHneWn3CdXq2mx
 9BCe1lT/si7tMEH48BXOaLiA9NsidCN1k7lUU/jMTSzboQM6+7xSniocwlWDKSCiaLKD
 pcx+rvvkIAoIX7EZm9gHS+fetN5vIdYywzBfunKLAF+P2qXs+bUw19cClHuMbSGfHQf4
 s4iA==
X-Gm-Message-State: ACrzQf33SRKQNyA/ZH5c80lVrHQ7aMGy+A2LVEGl+Hdq3OC7+imGklZJ
 gCh14FKaVmIm/MrsihnoSYdq8JAM5l9/o4uEuY7sMQ==
X-Google-Smtp-Source: AMsMyM581t/LZWjCX+XgHb++1RCwcSIq7AAHKDMGIzHDVUAvU3MpH4rl8EQJWjdN97K3JISz56bjD9GUKwsLiFvKn0c=
X-Received: by 2002:a05:6402:35c5:b0:450:4b7d:9c49 with SMTP id
 z5-20020a05640235c500b004504b7d9c49mr20990478edc.149.1663688047965; Tue, 20
 Sep 2022 08:34:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
 <20220822152741.1617527-26-richard.henderson@linaro.org>
In-Reply-To: <20220822152741.1617527-26-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Sep 2022 16:33:55 +0100
Message-ID: <CAFEAcA8ZV8bcXOfDjFKXhnpAe01FFj_tPdMcPs3SLaeqRO9qhQ@mail.gmail.com>
Subject: Re: [PATCH v2 25/66] target/arm: Add is_secure parameter to
 do_ats_write
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 22 Aug 2022 at 16:54, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Use get_phys_addr_with_secure directly.  This is the one place
> where the value of is_secure may not equal arm_is_secure(env).

Is there an implicit "for A-profile" here? Various of the
m_helper.c calls to get_phys_addr() still pass in an mmu_idx
requesting an access for a different security state to that
of the current state of the core, I think.

>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Other than the commit message,

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

