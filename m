Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8353EC880
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Aug 2021 12:15:36 +0200 (CEST)
Received: from localhost ([::1]:45166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFDB0-0005Wz-Jf
	for lists+qemu-devel@lfdr.de; Sun, 15 Aug 2021 06:15:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mFD9p-0004Yi-U2
 for qemu-devel@nongnu.org; Sun, 15 Aug 2021 06:14:21 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:41824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mFD9o-0008Jx-8l
 for qemu-devel@nongnu.org; Sun, 15 Aug 2021 06:14:21 -0400
Received: by mail-ej1-x629.google.com with SMTP id d11so26469410eja.8
 for <qemu-devel@nongnu.org>; Sun, 15 Aug 2021 03:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NATHqWwAqIfDb6jd+Yj7cVy++o2OVpoJb6QrF0qjpsU=;
 b=BB0pCnL2RmfHfRW1a41sMuR/sWhvnc88+KLkmFkIVeLbGfn+5DE2X+9UP62vEJCGJY
 evCApdbj5kGHeuAGuCxuFt/Wt6bqypZtb4YdngDwbfYGHrS+fYSA7iRt840WHcOXt2OY
 +3HifAT+3r0Njwb3SU6LshgUJ31CVfyCD11XjY3JVwtDg8oRQfgeuKtgYWcUQI/PvlvC
 RdQr8d4IT6KYxwRo1E6/22yeofj4fNH9IgNIvfCUzJtxXnqhwEau5K/TK3lT2fgM5obR
 8MZk+FxuM3d798up+jaRrFkme6gZnbmyt+qOBSepR2tY5zjRObQ5bL2c70AewUBInsGE
 T/iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NATHqWwAqIfDb6jd+Yj7cVy++o2OVpoJb6QrF0qjpsU=;
 b=smjjmNuoloFHwjjQIfcrJs5ZG2pE+F5wBAnbVzFebKen2YLDSPNFuU4m5Uo5owq57F
 rcsigHEwbEosKx0uqsRyjQXli2PovbkUbqpjRGvySV+AwKByacheyoPWnKn2nfMW4BGu
 j4nDFWQoFJ6+NvHy4j9LupuvnH9qALFeorIKCdWsghmFZG5sijjCB4Hcx8Ato8sWCueX
 vhMc8NKS92arxKBxUUQvrMsHEfnTdzZafmIZhlivmEKUUqcCWmtq72H3T4g4KHEdj2MP
 tHatKiroA9YEcJSEfYqFxDLOcPcXeaqZ2+yArnmxPtPiMDpnFQy06xrpcLaqqeoBtZlo
 i50g==
X-Gm-Message-State: AOAM530yYxzhRBVUitLcPTtVcD0R2Tm5I581M66+UR7elY99TwTov3JW
 1Yw4cOuYJSS2U5XG/ZqjJsmUvjtzkBqNVEmPJt/toA==
X-Google-Smtp-Source: ABdhPJy989l9qMxrDx0DYY/PzQte5gdX6cRZa/Dp1BvUy3fv9OadZ+MfRs2SgTjIY4fJ6aI2tyjuEtsgt9DbGuWCF5g=
X-Received: by 2002:a17:906:aac7:: with SMTP id
 kt7mr11089743ejb.4.1629022457830; 
 Sun, 15 Aug 2021 03:14:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210813133716.289058-1-pbonzini@redhat.com>
In-Reply-To: <20210813133716.289058-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 15 Aug 2021 11:13:32 +0100
Message-ID: <CAFEAcA8BBiMeJf8CrpX5GNkeXhNZMbnRw_dewCN0zT2Ki5sP1g@mail.gmail.com>
Subject: Re: [PULL 0/3] i386, machine patches for QEMU 6.1-rc4
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
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

On Fri, 13 Aug 2021 at 14:40, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The following changes since commit 703e8cd6189cf699c8d5c094bc68b5f3afa6ad71:
>
>   Update version for v6.1.0-rc3 release (2021-08-10 19:08:09 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/bonzini/qemu.git tags/for-upstream
>
> for you to fetch changes up to ea0aa1752ca88f7856cbf40eef0db62f90f28dcd:
>
>   hw/core: fix error checking in smp_parse (2021-08-13 14:43:42 +0200)
>
> This is what is in my queue.  The first patch is the one that is
> most important, though all three are regressions.
>
> ----------------------------------------------------------------
> Fixes for -smp, and for x86 TCG on Windows.
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

