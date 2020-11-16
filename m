Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2ADC2B4964
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 16:34:34 +0100 (CET)
Received: from localhost ([::1]:55396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kegWX-0008SW-Sq
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 10:34:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kegV6-0007ZF-OG
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 10:33:04 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:36593)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kegV4-0003gt-W8
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 10:33:04 -0500
Received: by mail-ed1-x535.google.com with SMTP id m16so4279192edr.3
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 07:33:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hPlKqUFWUEPaXmY7DcfN5sy/Sc5R3fRccUMs1cgCaEc=;
 b=dS3Yailj1Itb2ECOmI6nJTBdHRSNwZZmHeH1Pt+H6HMeGaECRiQI2b/RYM+orpmKXD
 ovD2ZT5UVzwBbnfZ5vqyfCyC8FMTuhD9B9Nd3E4yeOIXHxhEE+/QkKpEqQhjTXoi7KCS
 gYZA7erTMZ9weOEfMeFwsRTQd1sD27plzu+J85k+Wq99IfPN1dxXoePqeW31HbUI+9Va
 f9rX1hZctuR5Q6yH3FMwS/0Xh9oqGFWVauAvPKwW1vUbkJuSSBnW9zEaeta+2SYwHoOL
 qw31XbiRH9q+alIeqAEpe9pNbLKFP+/5yP2MzdnHD/+XEasTUaDSDkO2jZ26D2S4dcSd
 2+sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hPlKqUFWUEPaXmY7DcfN5sy/Sc5R3fRccUMs1cgCaEc=;
 b=szSwWOkrH6E4kRuetss64phTE6elTMbViE+njqSQgiaiKsqugtPFFSshV4gLPUrGon
 yoD5KekEOWN5Ym5WFLQR3/JsegaACZkHIonyu/qjOCaN3r/Z6ShS2vh+eoYi9HB/c2pJ
 jNEiJdbFmurVFLb2d8BucG79sEsCtK0lhQdfYFGic6iF2O2E+j5FWw3zfkQh4+XuddAD
 UB0OsLycJVapkcPmbxb67cLWmENR3UqpcW0ftmNmvmtE4fMy2VOWsI6ZLuev3TqfEiiY
 EQ9UbMwz2D/MIo2A3qk/fiiFF/aPlBQRPTyCtbE20KiBOG6Zruej9t4u7Pot4TGnGTt5
 dSGQ==
X-Gm-Message-State: AOAM53022XIZ753voqzm1NtTVx9by7r4KZtlc2BZoU0xsMGYuok1uQQ0
 8WOMe+ojqI6bVz1MFm7Edtw18qpGYLqMlxJNIC8Xww==
X-Google-Smtp-Source: ABdhPJyXa2EK3/W0zzBArBGS4JT+PvOi+zWD1m7cyAN0zT5rOK6wMEy4OUx+GcZNQcCZytLdt1RHdDp9sEvkOX1Fxwc=
X-Received: by 2002:a50:fa92:: with SMTP id w18mr15786510edr.44.1605540781413; 
 Mon, 16 Nov 2020 07:33:01 -0800 (PST)
MIME-Version: 1.0
References: <20201116111036.12820-1-kraxel@redhat.com>
In-Reply-To: <20201116111036.12820-1-kraxel@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Nov 2020 15:32:50 +0000
Message-ID: <CAFEAcA9NAKD=oR-_E9mHjGhQEGa2kQg7fyKpbqHkeHp_rYCkpg@mail.gmail.com>
Subject: Re: [PULL 0/6] Fixes 20201116 patches
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
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

On Mon, 16 Nov 2020 at 11:12, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> The following changes since commit b50ea0d54bbca7d440315c3d0c0f7a4d6537b180:
>
>   Merge remote-tracking branch 'remotes/alistair/tags/pull-riscv-to-apply-20201113-1' into staging (2020-11-14 11:22:07 +0000)
>
> are available in the Git repository at:
>
>   git://git.kraxel.org/qemu tags/fixes-20201116-pull-request
>
> for you to fetch changes up to c590fe3aa23acb923159c41c741dd694cba9c544:
>
>   xhci: move sanity checks (2020-11-16 09:11:21 +0100)
>
> ----------------------------------------------------------------
> usb: a bunch of fixes for guest-triggerable asserts
> (should have been in last friday's pull, sorry ...).
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.2
for any user-visible changes.

-- PMM

