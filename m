Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E70733C4661
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 12:03:39 +0200 (CEST)
Received: from localhost ([::1]:42226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2smn-0001wl-Dt
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 06:03:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m2slp-0001DM-OF
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 06:02:37 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:46622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m2sln-00080j-Vv
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 06:02:37 -0400
Received: by mail-ej1-x62e.google.com with SMTP id c17so33399163ejk.13
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 03:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XzO8o0ZmJaByVBOZQHgjR8f0l+F7iMWTimIOUvGWVZ8=;
 b=utMReWVo0wN8+xby+dyVzIElYimrITscwOdu7DvVJTaBZt2/iS4rdiZw5TdPmt6cfx
 iSdZ0HxuT1cQ+k3i0kuVNdX/+8EUC8WY/qfGjoxCUiN7Zxpju97MMi/7R1/K33F5ncSB
 DmdTaLt0uB7l/4X5P7FkqBueYZlQBMZC4T9izwASwgJIWwAl4cT0YUsg/lf0ZpIVJAlA
 TLsYY+dRglk8T1Bj/UOXSfkhCyG9bBfYKTCS1ukMm0/TgCnCaJjQcwkfGMPNtGmzwJhe
 QZtcNN882r47I6FitH4ATvnoXiSMuGkyXlJDr9e5K1toFO1CxrcQsQn/eJo3v+zhS1bm
 7Ndg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XzO8o0ZmJaByVBOZQHgjR8f0l+F7iMWTimIOUvGWVZ8=;
 b=EZP2rzxCOfmUvdL4ERzeE4X7bw1vnPk7e1lA/VkfVgzvnNQwLvEmeeIRKbDwdqpedW
 GqfXVU3/Rju/6kDZgFzq0Qjcoz2XuHDoVpmkn+rnFcw7TlSYJ7xafor8HeYsaiGMaq/4
 H0Lf1gXDsSdbrzYxrUTjR7JgvyqJZXCynXA7PrXWifYR0EvSus6Rir+eG1Ja6QM6J/DW
 XTaAJYA1TDB3qBiKMZqb1bri/mSooA0Z+nD+3+z6LoUvpiSEH4fdh3UyDVInl0SH2Uzh
 Fvr3fFiTDjC/WjzyGAx1Ji0wytZpHQ9J2QNmG4M3RACw9pY0JVMPAJD7UOsU3nKrbkm7
 a+ug==
X-Gm-Message-State: AOAM53305VSeR6UmgDwIXdZ9YKDlYePgs5zfr4T4CNDVcvYErQbPi0+N
 B2G6vD7YGTapoTNZQs6QelcoXgclQ4KA/GkljPulfA==
X-Google-Smtp-Source: ABdhPJycTdZedkQiAS1bPevqRvfNLiLO3IKr+tn6MAQrrA6/W6AJ6HPsSAr5U3cMOk5s6fj2eq4oftKJ++hN6C6/aIU=
X-Received: by 2002:a17:907:1691:: with SMTP id
 hc17mr50745313ejc.382.1626084154121; 
 Mon, 12 Jul 2021 03:02:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210710185818.444407-1-pbonzini@redhat.com>
In-Reply-To: <20210710185818.444407-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 12 Jul 2021 11:01:55 +0100
Message-ID: <CAFEAcA-XYOkrfzxZmq0DyS2HTKmJ-0LoKzO5X5q8tyFmHF9dwg@mail.gmail.com>
Subject: Re: [PULL v2 00/48] Misc patches for QEMU 6.1 soft freeze
To: Paolo Bonzini <pbonzini@redhat.com>
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

On Sat, 10 Jul 2021 at 20:01, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The following changes since commit 05de778b5b8ab0b402996769117b88c7ea5c7c61:
>
>   Merge remote-tracking branch 'remotes/mst/tags/for_upstream' into staging (2021-07-09 14:30:01 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/bonzini/qemu.git tags/for-upstream
>
> for you to fetch changes up to 411ad8dd80077e98ed465775b044caf1a9482f6c:
>
>   meson: Use input/output for entitlements target (2021-07-09 18:21:34 +0200)
>
> v1->v2: fix docs build, add final patch for entitlements target
>
> ----------------------------------------------------------------
> * More SVM fixes (Lara)
> * Module annotation database (Gerd)
> * Memory leak fixes (myself)
> * Build fixes (myself)
> * --with-devices-* support (Alex)
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

