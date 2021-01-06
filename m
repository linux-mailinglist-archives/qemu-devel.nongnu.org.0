Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB652EC21C
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 18:27:55 +0100 (CET)
Received: from localhost ([::1]:56488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxCbC-0003Ti-9d
	for lists+qemu-devel@lfdr.de; Wed, 06 Jan 2021 12:27:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxCZi-0002Qj-Tl
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 12:26:22 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:42856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxCZg-0001AJ-Re
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 12:26:22 -0500
Received: by mail-ej1-x62f.google.com with SMTP id d17so6029587ejy.9
 for <qemu-devel@nongnu.org>; Wed, 06 Jan 2021 09:26:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=IeKaFrmiNAUPNEzyTgmOgaNGI/aWDBhlwXWk6GW6jXI=;
 b=MurtAeiCY41i+N6b/kC5dwc+g+Bcxhr/E1Th6DsumaYy+8fbxV8jY0jyB2gv7XXEQx
 4g/cIZtYr2kmGowi6IMKIUF4u1IGb99V5WFT8jcBJYjctr/6DoMDX7XBv8i19E5PpFd/
 h9UUzLWTTqP9YLHy2pPQpgF4k7A/69EdX2k2SeKqiJiUYhsCpWoAyCb66tvAurkEIXNI
 mmQwdu787aM3IgYxqLNEaKJkFlv+3CssLSKo9JRoyeAxKGi4eKAebklo3R4i/YyJIwBw
 +5ci3XRD7h3Tt0jrzM3O+CPEM4tJH76sKtq9KGWeo0wLo9DFHHgxuwO4aANGOhJZnZbM
 w3yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=IeKaFrmiNAUPNEzyTgmOgaNGI/aWDBhlwXWk6GW6jXI=;
 b=WXed1PE9OVroF1gfW/t0JqpZ84l4F8F8+dmvAA0evdhtMM6aR2V5NEOvbPaS/8SfWC
 jM+B6iN7ujRbszmS9brZcRyy1/nFNEBWUhzLXdfIE0j7b3Zak1wgIruXAUuxzsmAiHBV
 JM3VQJIu2TDWakyAUgBf23JRiqFeaQQhCylOEzzdLgdaKCE5SIRSd9ZFvlLWjLtgIS8e
 S+Q8bQ7RbPXJ+bVFK3KV6jYEZU0E1Xv477S5RQFIz9U+kCrPa3SUqkyAw6Gn+mw2sjgo
 mksOTEDWnEd3BB08HgooIZkS4TY9a50vflOxI8+V6noHwM4QXNYY2uQalov3wCHx5buV
 MQlQ==
X-Gm-Message-State: AOAM5339iiIwE8cIOD7COe1YxtSvk/a+PdsfYxCe5TADoG9eKIcE4sIu
 94eFJF30/v/tajE/Nj4KlGeZYKKzytE+gkP6dBXmGw==
X-Google-Smtp-Source: ABdhPJx9FWcAzhfOB2ln9kInvCwdjS5lDCHadeEdTCTVRl69/V0Ubu4KC02Eeg7SNcZ5do6KB4gpXEn/vsTxZVDlgS4=
X-Received: by 2002:a17:906:e250:: with SMTP id
 gq16mr3417025ejb.382.1609953979207; 
 Wed, 06 Jan 2021 09:26:19 -0800 (PST)
MIME-Version: 1.0
References: <20210106145459.413716-1-pbonzini@redhat.com>
In-Reply-To: <20210106145459.413716-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 6 Jan 2021 17:26:07 +0000
Message-ID: <CAFEAcA-6Ce_Y2NOOKKw1RP9BP6OWcpKDUqS4zzvViJt1AFoivg@mail.gmail.com>
Subject: Re: [PULL v3 00/52] Misc patches for 2020-12-21
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
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

On Wed, 6 Jan 2021 at 14:57, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The following changes since commit 41192db338588051f21501abc13743e62b0a56=
05:
>
>   Merge remote-tracking branch 'remotes/ehabkost-gl/tags/machine-next-pul=
l-request' into staging (2021-01-01 22:57:15 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/bonzini/qemu.git tags/for-upstream
>
> for you to fetch changes up to c8b2b7fed9850356f5d88bc7da2f1cefe57289bf:
>
>   win32: drop fd registration to the main-loop on setting non-block (2021=
-01-06 10:21:20 +0100)
>
> ----------------------------------------------------------------
> From Alex's pull request:
> * improve cross-build KVM coverage
> * new --without-default-features configure flag
> * add __repr__ for ConsoleSocket for debugging
> * build tcg tests with -Werror
> * test 32 bit builds with fedora
> * remove last traces of debian9
> * hotfix for centos8 powertools repo
>
> * Move lots of feature detection code to meson (Alex, myself)
> * CFI and LTO support (Daniele)
> * test-char dangling pointer (Eduardo)
> * Build system and win32 fixes (Marc-Andr=C3=A9)
> * Initialization fixes (myself)
> * TCG include cleanup (Richard, myself)
> * x86 'int N' fix (Peter)
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

