Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF444F2E22
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Apr 2022 13:51:30 +0200 (CEST)
Received: from localhost ([::1]:47018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbhib-0001yF-Ck
	for lists+qemu-devel@lfdr.de; Tue, 05 Apr 2022 07:51:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nbhaY-0007My-2M
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 07:43:10 -0400
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e]:46415)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nbhaQ-0004j4-M7
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 07:43:06 -0400
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-2eb888cf7e7so44394867b3.13
 for <qemu-devel@nongnu.org>; Tue, 05 Apr 2022 04:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=060HiV7IJ+72bNkEkDvbTUxze9W1WsgkqXBMYXp4S4M=;
 b=wmETwwRm4Zz1SSONp1vK4cJ3NTmoAFQUHHHFZODFK8LaamPobb9QDh1UV8maLx07Ld
 4Mhrx/rWm0C9Z4oL6JAzRLya65/kUUDgArLO8eUSbu6OjbFZ1LiOn83PvnLE2Xm/wBHx
 qSW7GijetnKPpAuGDHCL0Z8aYoaOMei2KA3MHQmnXGWFq1oly92YDsBqiXVUzt3HGUyq
 32tqsHx/X8Yn1nzNSKPv5IGNSXrdaMDW3U6sI4ZfEGbNFlqD7bgCHFvZhZ+99p+8I7hX
 cUY6z03omseW4/SkESh1s78el0yPYx1gzhxkIC9P4W2HUz+igzhJ2Cv9EHi44GzZ1tWr
 Vw2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=060HiV7IJ+72bNkEkDvbTUxze9W1WsgkqXBMYXp4S4M=;
 b=udmwfX1uPYKo6e0A7WhzP+U3ySorvGdJUMprZckOpRg5Sd95QC3ppMxdtTT1F6dCwm
 +lbzcGjgTAqOgpHIMSyKR5YwT7HdiyOGifVhkd2uOLoHROFD9Ad/jNenWgx5uzGq/SS0
 3D5Wq/elbI6mgWz+cUlSShn1Q9f+aSaJd9JM/xm1opKWVilLrp8WSNDacKPCGLthGerz
 51Whfo6sNZATaXxCt6w4zIdMBZ/SFOONv2Uz2rKmgpAA0iFEuVcDgwjg0ta8GzSdI5vK
 /ONGEPr7Htv5mN7hWuATlDwdMln78WevqK5WHA3zcuvAD/xO0Q+cBLbNbrnzPYAo52bb
 VFqQ==
X-Gm-Message-State: AOAM530kEyEgZje0rHAIQd6dFftGb4w092eOcwFIaq/e+BJzK2pSPdiO
 squHaH+HvnjHwVd1hHry0QfQigYucKpayr9pulryrA==
X-Google-Smtp-Source: ABdhPJytiN7ZFUgDa4fHQQsfnrv2z1/aBw2xAOabiaHDyM5IC7uVHmfKGpebiclQzQd2DqjlmQXCg4yKWqEuaXgpRtg=
X-Received: by 2002:a0d:f603:0:b0:2d1:57e5:234 with SMTP id
 g3-20020a0df603000000b002d157e50234mr2277369ywf.469.1649158980948; Tue, 05
 Apr 2022 04:43:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220405092001.104507-1-pbonzini@redhat.com>
In-Reply-To: <20220405092001.104507-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 5 Apr 2022 12:42:49 +0100
Message-ID: <CAFEAcA-a_uSc8C_W=ZeB2ZK9fbqYgJ5wm24wpf43SM0CLd3z-A@mail.gmail.com>
Subject: Re: [PULL 0/3] Misc changes for 2022-04-05
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112e.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 5 Apr 2022 at 10:25, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The following changes since commit 20661b75ea6093f5e59079d00a778a972d6732c5:
>
>   Merge tag 'pull-ppc-20220404' of https://github.com/legoater/qemu into staging (2022-04-04 15:48:55 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/bonzini/qemu.git tags/for-upstream
>
> for you to fetch changes up to 776a6a32b4982a68d3b7a77cbfaae6c2b363a0b8:
>
>   docs/system/i386: Add measurement calculation details to amd-memory-encryption (2022-04-05 10:42:06 +0200)
>
> ----------------------------------------------------------------
> * fix vss-win32 compilation with clang++
>
> * update Coverity model
>
> * add measurement calculation to amd-memory-encryption docs
>
> ----------------------------------------------------------------

Hi; this tag doesn't match what your pullreq cover letter claims
it is -- it is pointing at 267b85d4e3d15, not 776a6a32b49, and
it has way more than 3 patches in it.

thanks
-- PMM

