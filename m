Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D191509E08
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 12:52:09 +0200 (CEST)
Received: from localhost ([::1]:42940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhUPv-0001cp-N8
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 06:52:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhUJ4-0006e8-5p
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 06:45:02 -0400
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130]:36811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhUJ2-00053U-Hc
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 06:45:01 -0400
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-2f19fdba41fso47566647b3.3
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 03:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ywuzKsnHDMS07qfc2+JL2ptWzaT0lS3RiQMeN0Sv+yk=;
 b=BkvMLnCxMLokGLTz4iE0zjXi+0hZAWWtmUD9UJ6HOOA02zwUZP3yd8xEPk1rNhAvjX
 ue+8PcXrCJOWWvGraykivnuJeo4D0xRjXVQPnzujBN6MhvfBKnZEITYDAmiz+kKuAIqU
 nwGncH7+HV9l7tDyRNBjkxYy12XHsj3R4DXFMWcFKyO/Mw0sy23BShq7qkHS0p1jVKQ2
 lgBvkebRpVBl/s7n5PRKcUTMUtjxWFU140dJPStk2s7+M6pyNonIVCS24JHbvMKo4n3a
 bU/qZHyVMz7r3SF0B7ZHMyBs4r6jAJzvjzpy9vQsipP6FYpowKre8zr6cpBIUwPwdZSj
 h7og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ywuzKsnHDMS07qfc2+JL2ptWzaT0lS3RiQMeN0Sv+yk=;
 b=ZJEpDUN3BUmkZ7CJDrc1+mgq5kKjnWyluvS+yjVuPUcwOV3sj8HHkbKpPoRvk6LL+8
 rXGPE2FL2IMzOha8HR/6zJbIMQkzEE8CV+Lxjp3lz6GkAlxYmz0GPhmthrdx2rTs4OSP
 ue3coVmfYm3cA6zB4cpU5mw3SmZ+khH4FV/rpQTnW5mn7GDWjqzX+H1c8VdjBOcb6iNL
 jAdaIs9iQ6gcIPdAv4hjWvA2A7H2Mon6EDzQcA/ytb5TBnGp9s/pYtAZTJ8/YHCu6OTT
 +eaMKnn1YvDcUHVS2U4Dde0Gy4s1uzzW4hE99Uhie0dJasiteZkr2+aJSI/luXaRpYs/
 EM1Q==
X-Gm-Message-State: AOAM5337qUwkMfWTyoEpKaaJeI8LS/cHLErZQBzXT2LaAIb6goc2fCa0
 AGxiuTPtQOjsnGsL1MJdttv9PayYne1w7W94NQcZHw==
X-Google-Smtp-Source: ABdhPJzqN2vOnPJ7hN/n+WY9xak8zpoanjURkgr6nPnmRrBXbS99afDCqi7y27+AmqhN5bY2tZ0cNTooN34V5fXG5Ik=
X-Received: by 2002:a81:3450:0:b0:2f1:d8f4:cd9c with SMTP id
 b77-20020a813450000000b002f1d8f4cd9cmr11046542ywa.455.1650537899489; Thu, 21
 Apr 2022 03:44:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220405223640.2595730-1-wuhaotsh@google.com>
In-Reply-To: <20220405223640.2595730-1-wuhaotsh@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 Apr 2022 11:44:48 +0100
Message-ID: <CAFEAcA9PCoVH_1EWTPWP_rqsOEhQZSvDZcEgw01=5W-cuyeJoA@mail.gmail.com>
Subject: Re: [PATCH for-7.1 00/11] hw/arm: Add NPCM8XX support
To: Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1130.google.com
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
Cc: Uri.Trichter@nuvoton.com, titusr@google.com, venture@google.com,
 hskinnemoen@google.com, qemu-devel@nongnu.org, kfting@nuvoton.com,
 qemu-arm@nongnu.org, Avi.Fishman@nuvoton.com, Vishal.Soni@microsoft.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 5 Apr 2022 at 23:37, Hao Wu <wuhaotsh@google.com> wrote:
>
> NPCM8XX BMCs are the successors of the NPCM7XX BMCs. They feature
> quad-core ARM Cortex A35 that supports both 32 bits and 64 bits
> operations.

Here and in the documentation patch you say "Cortex-A35", but the
patch implementing the new SoC creates Cortex-A53 CPUs. Which
is correct ?

thanks
-- PMM

