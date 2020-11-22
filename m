Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECCD12BC79C
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Nov 2020 19:00:40 +0100 (CET)
Received: from localhost ([::1]:48472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgtfE-00040t-0L
	for lists+qemu-devel@lfdr.de; Sun, 22 Nov 2020 13:00:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kgtd7-0002UR-09
 for qemu-devel@nongnu.org; Sun, 22 Nov 2020 12:58:29 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:44063)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kgtd5-0007Gj-BC
 for qemu-devel@nongnu.org; Sun, 22 Nov 2020 12:58:28 -0500
Received: by mail-ed1-x530.google.com with SMTP id l5so14745885edq.11
 for <qemu-devel@nongnu.org>; Sun, 22 Nov 2020 09:58:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nx0jJw8NqG2MD9aXJJKsYPxXjilPxGbM3LarFMSRvX0=;
 b=zKbsiHNS09RxqUaEou6ESqrTbrYdeHr8XqCql97TEdk7aLxknUzGndUWmRr7taitdE
 WL53G1MKQesEQ+f/8SxMToyTx79rJohPhIpTXHiLdXVpjg/ZhfP7a6xtGu5F95z2Mx2l
 FjeUCreBIB6wEsl2KX3hS2j8LgGhC9WxBeiD06lddbtWrWm7Derppk+wxlS7ndQ3XCBf
 W7VukR3XShXxiAdldxaG+dE4aMjjZes9aUbO0KMpFADrZ29anK4CeXrHpae6kY1E45h1
 KJeJqQ/tNy/lYFDe6Z9LN6auw92hIQfrjWwXo6Z9/GQXXugzAm3NW8fRxC4MJwpqW5PJ
 si6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nx0jJw8NqG2MD9aXJJKsYPxXjilPxGbM3LarFMSRvX0=;
 b=UdH4tVE5ns4YMW34QENFdpSU3TNdPc50SlZGo8j3b8vHuLOGMkYWk4Bio10Zgpw0mZ
 BwOAlz/qiOqaFB5kAKrEkuVrRdyKihLagJidaoMRC+/XmXrEE3CnYfFyvn6bcD2N6WJ+
 VYjVB+ZkgaBN7ZQs/MI57dX63OtFBFzfkduDtlSsqqy8ZgkO97yeLv2nYT9xBBlgCK6U
 uw80kat25dNoqcuMjb+a3Gdmd75hMBIFnBmU2+qNtxrXOpddH436TwkTHj20e8lfQFe6
 AzHtn/rMUZCvJjyrkjwjuEKm0oggP7itIRJvQLeKuOhF/uYxyQuTb91d1UT01jHXUR8x
 nP3A==
X-Gm-Message-State: AOAM530Vu/SjYmppUvB/nZwdCN8/KJrKNI72zuyKjnlOblNcV4nYIYxn
 kEMZpIfmnGMcmzyCiRiox/pdxWSjPieUlP5QjlL12w==
X-Google-Smtp-Source: ABdhPJzVVof8V2ipEnY6A1+Ba0zUdoXJWTQp29Owpce2KlrbNr+23HC3UWI82XxZdumtZg4iaMNCyCPmk7DeKJA8hV8=
X-Received: by 2002:aa7:df82:: with SMTP id b2mr42338443edy.251.1606067905641; 
 Sun, 22 Nov 2020 09:58:25 -0800 (PST)
MIME-Version: 1.0
References: <20201122142736.18368-1-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20201122142736.18368-1-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 22 Nov 2020 17:58:13 +0000
Message-ID: <CAFEAcA88w0SNAhLQ1z0U_=EWqEfWnOKsmVpNYLehuhim-NfPhg@mail.gmail.com>
Subject: Re: [PULL 0/1] qemu-sparc queue 20201122
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
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

On Sun, 22 Nov 2020 at 14:27, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> The following changes since commit e3a232cccd2445e5d9e607a65a78cdbc33ff8a0f:
>
>   Merge remote-tracking branch 'remotes/bonzini-gitlab/tags/for-upstream' into staging (2020-11-20 22:30:51 +0000)
>
> are available in the Git repository at:
>
>   git://github.com/mcayland/qemu.git tags/qemu-sparc-20201122
>
> for you to fetch changes up to 48e5c7f34c557afe49396a00169629d24dc3342d:
>
>   hw/display/tcx: add missing 64-bit access for framebuffer blitter (2020-11-22 10:43:30 +0000)
>
> ----------------------------------------------------------------
> qemu-sparc queue
>
> ----------------------------------------------------------------
> Mark Cave-Ayland (1):
>       hw/display/tcx: add missing 64-bit access for framebuffer blitter


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.2
for any user-visible changes.

-- PMM

