Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB5E30F06B
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 11:21:32 +0100 (CET)
Received: from localhost ([::1]:41758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7blT-000356-LW
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 05:21:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l7bRk-0004QW-JS
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 05:01:09 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:36768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l7bRX-00012D-QD
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 05:01:01 -0500
Received: by mail-ed1-x531.google.com with SMTP id l12so3418155edt.3
 for <qemu-devel@nongnu.org>; Thu, 04 Feb 2021 02:00:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yTcW/eXW4WJdW3XzlWkBNbudEqakNA/chwoDbJWVV68=;
 b=zT5lcY1XwXH3VLhJiL6QLaTKRrC7s5r5p0e/kAzTpFkPMRNuslmSqTUktR4yBA4S4w
 vtB9pwc2XTpBjacNuDlWctAYKXeXEwAdnkM5OoN3+2hKcfwRaR02JntC2Rr05fYXg+KK
 qFSqzGqrJuXJlItAhcHbPT4gyx9b2/FWFmdETH7imMFoAgmpOiyb5PUFhMcqs/ZrhKmW
 K65WKADjWLhlCJ0ZFSDSFq47SgxBCR5vVjBTK4jUvFPwghG3RFVMCfsJIzF3NwDzaQuY
 LXgbz78sWuKQczXYtL2d5IQtTXPYZgwMsDzERWgjpD4ZenoMEXSgRrDcaCMjNy9aY+wz
 v+Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yTcW/eXW4WJdW3XzlWkBNbudEqakNA/chwoDbJWVV68=;
 b=g/7uhBfBQOkdg/mD6pBOt2d9J9k73wyft+GX4svqu33rQ7TbIbQfl/6N20OQXaiPFQ
 JXqbaLmA+Jr/oRqvr6CfjTcJBNT3JPD7esRIkLvKY14IKYKdY2vdOm2ckPMSI76v+BvB
 uMtTEGsG3HzGd+LoDjJdBz0jyTb704I6PoGOtgDahEqHo/vAvkp20D6E8PVM88kGOSXN
 W46Z2u6YP9MkqpRM+nmvzR2iJ5uAW+Qjiz5VjA2OwmmQ7MIx60bb/6bsFvqr2zpNDF+Q
 9jBV7HK/T6j+cQIBqbZkBrtAVJQ/fFAzvTCd4DUILrfMTCSO8FcuoAf9z8qffYZ0+TlU
 Yuwg==
X-Gm-Message-State: AOAM533dSAvSU5MjEYCWf9TubG+TjGExS7TmvSJ7Qc/yHXUWJHZ+ONDP
 QpqIFvOLhKkkM1gH3Zo3cjw4/SaTg3/HDZdYGP4YGg==
X-Google-Smtp-Source: ABdhPJzLayraX92F5ExK2PerL2QrJmLf6ZezJNrMC1/CktzzNPjfw7x0oVZIL17HC47bFBTcycOxPUjQQ0ev1TonDsY=
X-Received: by 2002:aa7:c88a:: with SMTP id p10mr7183440eds.204.1612432853289; 
 Thu, 04 Feb 2021 02:00:53 -0800 (PST)
MIME-Version: 1.0
References: <20210203021550.375058-1-richard.henderson@linaro.org>
In-Reply-To: <20210203021550.375058-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 4 Feb 2021 10:00:42 +0000
Message-ID: <CAFEAcA-M5Xk1SimwtTgy0uio5V-R+PBGmNwgy_MNBEjHuaV0tw@mail.gmail.com>
Subject: Re: [PULL 00/24] tcg patch queue
To: Richard Henderson <richard.henderson@linaro.org>
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 3 Feb 2021 at 02:15, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The following changes since commit 77f3804ab7ed94b471a14acb260e5aeacf26193f:
>
>   Merge remote-tracking branch 'remotes/kevin/tags/for-upstream' into staging (2021-02-02 16:47:51 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20210202
>
> for you to fetch changes up to 0c823e596877a30fd6c17a1ae9f98218a53055ea:
>
>   tcg: Remove TCG_TARGET_CON_SET_H (2021-02-02 12:12:43 -1000)
>
> ----------------------------------------------------------------
> TCG backend constraints cleanup
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

