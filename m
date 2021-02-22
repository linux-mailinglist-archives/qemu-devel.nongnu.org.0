Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B5F43219C1
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 15:07:59 +0100 (CET)
Received: from localhost ([::1]:47108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEBsU-00043X-3u
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 09:07:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lEBpP-0001gY-3T
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 09:04:47 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:35140)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lEBpN-000531-Gg
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 09:04:46 -0500
Received: by mail-ej1-x62c.google.com with SMTP id g5so29593802ejt.2
 for <qemu-devel@nongnu.org>; Mon, 22 Feb 2021 06:04:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Jiwr5H/Shc9b1YiyH1t1q96G5LokFKKwyGdUyiQD/Sw=;
 b=cEe1hy22F1Dk0E//NhuNk+mthHcsrwLM62Zlnjzi3WZ+7DcTjZi9BpnCmDjqPAc36L
 IO89vPIMZvBSUV+xNhLiqMqX7uPwjX7MR00R2ataHXMXziaHC+6r9Jmkutt8WXbCoc8U
 s6vhFnKzwjSvFpYmufxUBFY9kJb+P7Maomk7elCyuSkRAunPbTK2DE373Y2bIgS/zAzn
 yjDyZ0/2H1IviD0oJwnjqtkBgEQT1Z3MMIFdU5y0/b4zY11TxUOQ+2WmRpPtBnj8/Tct
 TYtgsmt+MC5UXKTJ0YCTXiy8OZCc2k9jDEYgYyhmZLewWf+SvTw/pbTH32rLTc1Qrb6O
 HBIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Jiwr5H/Shc9b1YiyH1t1q96G5LokFKKwyGdUyiQD/Sw=;
 b=YMmn7cFvdmil/5405LsTh4krnHnvbGHjvtriPCZaAFFGxckEMxEKJKnJMMs1aRLmlS
 AtDS+bH4kRuwhaFgvBsOEW5h2NLq2KWPkOvR/AUHFtapnGqTxmkhd6loQHgiAuPnUPej
 ovM3KbY852NUZXTIZ2bN5ljxGtTAZM1dSsbc7Oj/IXSChiirDJF6lDqVvDNu/VvDBHa5
 Q1hoAMRyeuAeXoH+P4Q/WPOgLoJCN/mJvPGvARpVIEh3wwQLhz7u5gbGi901egZbTI5e
 KODIqU5w7C3pDDMWmP2MzuajTM6NSkZRU9Ww+HAUdyAkzh7LjAHb3vKmAMP8O3jDAfQN
 tgFQ==
X-Gm-Message-State: AOAM5334sBZtNnwZyRoIR6RkIfiM3YPiaUr9Yr4yQmiaqhfkhUxGRS3+
 LNwvZT/pJgx+jFVhHc1/MfEjHCLltC4ir+KSK+0F82/c90Q=
X-Google-Smtp-Source: ABdhPJyRAebfaYJGypdoIFL0F/y0lpC7j6I9F8Z1eDcFb6tX+whRkD0B4ObWM74q1zCET1dWGqF+9mSmRoc2/R0rnLk=
X-Received: by 2002:a17:906:184e:: with SMTP id
 w14mr21572905eje.56.1614002683910; 
 Mon, 22 Feb 2021 06:04:43 -0800 (PST)
MIME-Version: 1.0
References: <161241593716.24579.2543593740941156934.malonedeb@wampee.canonical.com>
 <161399570333.16798.13645120291087636267.malone@wampee.canonical.com>
In-Reply-To: <161399570333.16798.13645120291087636267.malone@wampee.canonical.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 22 Feb 2021 14:04:32 +0000
Message-ID: <CAFEAcA-UrM5_sgcaT_zJnTPmbb+GHuWTxRyUxJZKdQ5mDm_zmA@mail.gmail.com>
Subject: Re: [Bug 1914535] Re: PL110 8-bit mode is not emulated correctly
To: Bug 1914535 <1914535@bugs.launchpad.net>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
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

On Mon, 22 Feb 2021 at 12:18, Vadim Averin <1914535@bugs.launchpad.net> wrote:
>
> So how can I manage it to display grayscale?

Programme the palette with exclusively shades of grey ?

The question here really is: is QEMU behaving differently
from the real vexpress-a15 hardware here? If it is, then where
is the behaviour divergence coming from, given that it looks
from the docs at least as if the QEMU implementation is doing
what the docs say it should do. If QEMU isn't behaving
differently from real hardware, then that's just a guest
software problem.

-- PMM

