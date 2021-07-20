Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C803CF73F
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 11:54:53 +0200 (CEST)
Received: from localhost ([::1]:37904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5mSi-0007QP-7w
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 05:54:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m5mRZ-0006is-NG
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 05:53:41 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:33452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m5mRX-0006hB-RA
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 05:53:41 -0400
Received: by mail-ej1-x629.google.com with SMTP id bu12so33544864ejb.0
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 02:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=mC1JwwM8n2uI0A+Ow7714IEAnfRsmwT7imV1ZAsn2jc=;
 b=LOBCV68lCZyXDpOIqyf96io9Gev2SY8k3gM5n/HYIAkz3R0lk2f4DV60tiWMLLrTIZ
 vWrY4RyMYfbkB2LIETGiWmKwJSNBfueHWYSyYn9p2jCF5XrF1IFhJCjN36QVPGDH8PeL
 gFueD2wp7I6bOEgANPbGdfVkKYrSl/WZLEi1BLFA8bcaLeKv5Pa7jajWDOR+qfjqGkAX
 aMneThjPp68nI+unGitUM/CDngsqd9pz91RaNw6zwNJ7+axNR71PC1QvpOpgA38U0QIY
 jYfQJFGXdsDgS6ToR9a0oNvXRpPHWRuHyI+xKJ03R/0Ib7Qpcgi2QFM8s/j2zwSVbDB6
 DbFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=mC1JwwM8n2uI0A+Ow7714IEAnfRsmwT7imV1ZAsn2jc=;
 b=Rs5WcEmXFpOvTxJAYKOQqLNJJCSFd2rS9fhCPNSG+7uCjHEtkvCmRNszNIoNXrvLri
 SwZE81YkmopCLAIYC1MsUXl8CuIdGrl6H2k+p6BwYR3zx6hTEAk7l95lUvE639rP2u6Q
 uFU/nns1OTfm4izYe48029/uJaGRnSvrg/neJESaupT4y/0KlhNV/XlEeI/QMZVGa+9u
 39cCY++PLk/PeuWKVCko5V+/NtUo1DkJ00pjAmt8TyU6raP6E6/DGgnO2Ak+n5n12brN
 +D8VMtUP34vHQ2LUGW9jcJrzbu+HiAARUvNROSrS0eaUJOhiiY0YE8azQy0Do9N9ntgc
 XUaw==
X-Gm-Message-State: AOAM531RO2R3Xzd/Y1WxfShH4VCFRzmDr3VaUwez3V79RoQBt+w5/Xep
 XWmFVte1I7AaXZNeXx0LXt3gWzqAOGFhWijhvBPanQ==
X-Google-Smtp-Source: ABdhPJzzGINXevgVcB/EVuCfyyphe+iK2UepepS22zGXhI0kgBVNQBzW2921MB9YjaFQKNmz5gbc02lM7iHikiaizyM=
X-Received: by 2002:a17:907:3e02:: with SMTP id
 hp2mr31466923ejc.4.1626774817908; 
 Tue, 20 Jul 2021 02:53:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210719195002.6753-1-alex.bennee@linaro.org>
 <20210719195002.6753-2-alex.bennee@linaro.org>
 <CAFEAcA8VGYTc2jrdB+ET4xFODDv0SniTjnUAYr+4dgjSZEsmiA@mail.gmail.com>
 <87zguhmi4p.fsf@linaro.org>
In-Reply-To: <87zguhmi4p.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Jul 2021 10:52:57 +0100
Message-ID: <CAFEAcA_qZEixbcQt_96oqzEzeH5+v4aBqXjYTym7Mj5Xt7VK5A@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] hw/tricore: fix inclusion of tricore_testboard
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, f4bug@armsat.org,
 QEMU Developers <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 20 Jul 2021 at 10:47, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > On Mon, 19 Jul 2021 at 20:52, Alex Benn=C3=A9e <alex.bennee@linaro.org>=
 wrote:
> >>
> >> We inadvertently added a symbol clash causing the build not to include
> >> the testboard needed for check-tcg.
> >>
> >> Fixes: f4063f9c31 ("meson: Introduce target-specific Kconfig")
> >> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> >> ---
> >>  configs/devices/tricore-softmmu/default.mak | 1 +
> >>  hw/tricore/Kconfig                          | 3 +--
> >>  hw/tricore/meson.build                      | 4 ++--
> >>  3 files changed, 4 insertions(+), 4 deletions(-)
> >
> > Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> > as far as this fix goes (though maybe CONFIG_TRICORE_TESTBOARD would be=
 better?)
> >
> > But I still don't understand and would like to know:
> > (1) why doesn't CONFIG_TRICORE get set by Kconfig anyway, as
> > f4063f9c31 claims to be doing?
>
> It does (or should) thanks to meson:
>
>   'CONFIG_' + config_target['TARGET_ARCH'].to_upper() + '=3Dy'

Yeah, but it doesn't, as you can see if you look at the meson build
log: we do pass CONFIG_TRICORE=3Dy on the minikconf command line,
but it doesn't appear in minikconf's output!

> > (2) what are the CONFIG_$ARCH flags for? Apart from this, we
> > don't seem to be using any of them, as demonstrated by the fact
> > that nothing else broke :-)
>
> They need to be declared in Kconfig otherwise minikconf complains about
> them not being defined when you pass it in. This is part of minikconf's
> sanity checking code.

No, I mean, if nothing anywhere in the build system is conditional
on these flags, why do we have them at all ? We know we don't
have anything that cares about them, because right now we have
a bug where they're never set...

-- PMM

