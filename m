Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2264C23BA18
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Aug 2020 14:04:28 +0200 (CEST)
Received: from localhost ([::1]:42172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k2vg7-00088k-O8
	for lists+qemu-devel@lfdr.de; Tue, 04 Aug 2020 08:04:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k2vea-0007GP-Oc
 for qemu-devel@nongnu.org; Tue, 04 Aug 2020 08:02:48 -0400
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232]:46291)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k2veX-0003eF-I9
 for qemu-devel@nongnu.org; Tue, 04 Aug 2020 08:02:48 -0400
Received: by mail-oi1-x232.google.com with SMTP id v13so19465449oiv.13
 for <qemu-devel@nongnu.org>; Tue, 04 Aug 2020 05:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=yoKmKiR2TJ74eR2Wzmi7g0ckceS6f1XmFqfjMXSAC0E=;
 b=EJD76uf1qlnEbnbsSXcCjiR1dwF63Eymy4O3vdUuxerJGrjkx8QmybzJ3s7f0BtRaA
 AJQMd2jWYVcLD7Q9+ET5jGb/RzyjdlWE1qbNFSWwkdvB7sa1fGpxIqPF5WLWDJz+EHVI
 BgHBMoZtVg5G6iWt+KPjMJgLgdGWV7NjEcR1yc2O9fDeIGk0bC/1lo81odjohmF32WZ2
 gtQduwbXt96PWkauMBsGmvODCtFhxx4obfWoW0QUJjPsb6a9T0CzHWk/r8BGF1hw2YOs
 XudmYvMvo8I2nDzAch+QRxWvA+PuGI8kC5GuSFnlSFuYQqd0Bf39m47a9Q34hdgWvgZU
 mu2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=yoKmKiR2TJ74eR2Wzmi7g0ckceS6f1XmFqfjMXSAC0E=;
 b=itdBvqADHoS/kfpAt7pFCRIg6KKBj4QiB4vPHUMNcUDpUpEAf56F/E892Xr5qxjyJA
 4f2Wj/0OCjBZIkV6UaSN8DxNxn/oGg5a91dPoBVPUp2lMuRalLXYTBWJIItCx539CWro
 EgArJRX6wZ6ygKPbuRTw6oac8Gf7SuseNBs2sxPQvYHWbHDc7WX8QFnQC1OuIK3wIstz
 MKdcyalxodET0j/y+4aszjJFA+pdSpO9QD8CTay6pUnqfZ3FDA3X/UOgcdhngLlpwA29
 EFWFyDHwCVrgLg7MOTxA7BcqLknKU7IrRyDJ2QSQj9kFMC84HfA7y4XblpM0fSsCLfk5
 EJ1Q==
X-Gm-Message-State: AOAM530eSxGhBKCKMCyOO0pD3XL/9NdPK8U+Bw/DXpdcdyjNGHDyjjV6
 cqs9JDGOnT6T9PIA4pW2ETTSzezNGGU+jU58bddmQQ==
X-Google-Smtp-Source: ABdhPJwh89DKXqLZiAeMyV9LAFWrB/U0YIK3LfYvYk9eY4qJFGJuRx/INllEMvIAujSto2az2g/8kBZ0ao02G4dSGnE=
X-Received: by 2002:aca:50c4:: with SMTP id e187mr2897725oib.146.1596542563240; 
 Tue, 04 Aug 2020 05:02:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200804092624.1126013-1-anthony.perard@citrix.com>
In-Reply-To: <20200804092624.1126013-1-anthony.perard@citrix.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 4 Aug 2020 13:02:32 +0100
Message-ID: <CAFEAcA8c9w7iKy5UA=jS47mQrK7SZTkta8OktBNvH3crTs=rYw@mail.gmail.com>
Subject: Re: [PULL 0/1] xen queue 2020-08-04
To: Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::232;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x232.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Cc: "open list:X86" <xen-devel@lists.xenproject.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 4 Aug 2020 at 10:26, Anthony PERARD <anthony.perard@citrix.com> wro=
te:
>
> The following changes since commit 5c1c3e4f02e458cf280c677c817ae4fd1ed9bf=
10:
>
>   Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-202=
00803' into staging (2020-08-03 20:34:26 +0100)
>
> are available in the Git repository at:
>
>   https://xenbits.xen.org/git-http/people/aperard/qemu-dm.git tags/pull-x=
en-20200804
>
> for you to fetch changes up to 8e0ef068942e4152f0d23e76ca1f5e35dc4456f7:
>
>   accel/xen: Fix xen_enabled() behavior on target-agnostic objects (2020-=
08-04 10:21:35 +0100)
>
> ----------------------------------------------------------------
> xen patch
>
> Bug fix.
>
> ----------------------------------------------------------------
> Philippe Mathieu-Daud=C3=A9 (1):
>       accel/xen: Fix xen_enabled() behavior on target-agnostic objects


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.1
for any user-visible changes.

-- PMM

