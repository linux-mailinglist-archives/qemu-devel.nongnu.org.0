Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF473C72A4
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 16:50:25 +0200 (CEST)
Received: from localhost ([::1]:37134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3Jjs-0005a7-D6
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 10:50:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3JiT-00042S-Da
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 10:48:57 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:40540)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3JiR-00023P-BL
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 10:48:57 -0400
Received: by mail-ej1-x635.google.com with SMTP id o5so42001968ejy.7
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 07:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aOdTLvUu/CksPpsv5K8PPdX1hhzVsx/u/WQZzZ9mkTg=;
 b=JkvBDf6+PFrFn5g6kH6kbWcfo3tvjQc5fqGkyvt9o9zSpNo4t7K+d33reQNUwpfmmC
 5ooCDt/QJ6HMj8pTLQSOvewbOVx+XBsLyHBncFLqh/yqYMrdNsqTKuZwYwuQCzjZwjBs
 boUZNf6LM65xQPYZL2goIhYPFnHHrm8aWFsivs2RfVc1bT/rbhwt3t37TaIg9VBToY0p
 pIQPPMpjn9drNWZsPXe93leyhguaubvpn9mbzef7TSo9a8KmkUUULKoEDYJWqgsJI1vL
 QWP1jHC6M/wDaIuYDTeDIqDZGwxxTlIEiDXUSVO2i0qfD24Dsa1LHRc20F/i+sI+gKB9
 FBKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aOdTLvUu/CksPpsv5K8PPdX1hhzVsx/u/WQZzZ9mkTg=;
 b=qoc4iJ7uX6B/KojX1gWGhJuweO+b7OnE1XLKQnpZx+MDMujeMhKHur+ttVKzjOqbV/
 +Aw6vdBFNU5iDxT1s3TRV0caX7Q/5beUifz37FrkSfDaW+Gy6e06jkPdZG3apJzm5bam
 KFgnuBz4A554hbjF1m+lkGhNFZ3ZduBU2qtG2cM1w05m8nE5KvalyFyTjS+JhMNrKXjb
 sIdWOhN6GYt9o3s9ykACmB1Dl6C+qJkeJ9WjSs1HaCZOtT6pgNI8GwdVcNL+C99S4mta
 RtH15n8KwyUb2mMWcqRejYeEYyK98n8XaD0OYeMFs4s7a4xZ4jFxbPTPj8DYQa6J53v/
 eKpA==
X-Gm-Message-State: AOAM533r+YtklKhJXvHJar8Ir0041SxeeT63slD6DaKCXX2Wn5L5t7/+
 nGL8oacJHPOZiyM/kcc7YH9qBnMJks6pk3VFmNozag==
X-Google-Smtp-Source: ABdhPJw2n9oHqPjDNbhD7lRXG1EkGxPBdGGiQ8jPxkwydQt6qLC7E8X2hU1Hg7VaLM/QuAAF2A3hphIwewCywOkaLbY=
X-Received: by 2002:a17:906:924a:: with SMTP id
 c10mr6171235ejx.85.1626187733832; 
 Tue, 13 Jul 2021 07:48:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210709230621.938821-1-richard.henderson@linaro.org>
In-Reply-To: <20210709230621.938821-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Jul 2021 15:48:14 +0100
Message-ID: <CAFEAcA8ozOismw-xUAe1qnWbq4DP=45qWjf1+YHwgKrRYqJ+yQ@mail.gmail.com>
Subject: Re: [PATCH 0/1] target/arm: Fix offsets for TTBCR (#187)
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 10 Jul 2021 at 00:07, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This one patch fixes boot_linux_console test_arm_virt.
>
> It does not fix all of the failures.  The next one on the
> list is test_arm_emcraft_sf2, where the cpu boots fine but
> the net device doesn't work correctly.

Applied to target-arm.next, thanks.

I'm not sure the TCR struct's precalculation of mask and base_mask
is still earning its keep as an optimization. We only use them in
get_level1_table_address() which is old-style v5/v6 page tables only,
and all it's saving us is a bitfield extract and some shifts, which
is peanuts compared to everything else we do in a page table walk.
Perhaps (not for 6.1) we could drop it entirely.

-- PMM

