Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E02338A75
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 11:45:45 +0100 (CET)
Received: from localhost ([::1]:51168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKfIe-0004HW-Ph
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 05:45:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKf9P-0007O0-T1
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 05:36:11 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:36363)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKf9M-0006Qb-6o
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 05:36:11 -0500
Received: by mail-ej1-x62b.google.com with SMTP id e19so52496054ejt.3
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 02:36:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=QIlk9LvhQp53wile749dfAuASdvHoE4JnQgGoddGVB4=;
 b=Mqcl9s7Dgn8+/gDxpUKbBCgMIOZVwudNDLam7vNLMIdVEaMTCex7C8zyfhs9qgezxa
 Xhd5+pj3McheVojDJu5wEOHLD0rZpJbOqQktqY31/09aQbqDyXZx55N9sY+LQSRF8+/K
 7OXyVreZNM4SDchw4RbuqAd4sDSR49/kRsbANb+slk+biN5vKjNAtqfMzbo3+zh1OZNc
 XK/ovrhVZZtHEZQKQW4b1x5BWUYYfAmjPtoodk3L/O4ybUcjzeLIxA0hGDE96eWpAmAh
 JGM3f0k9QH3fBoUtVAb0UomiDDXZYzLb5esHTad+afD91yC/RVfABkT51Tse8htLXnS5
 dspw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=QIlk9LvhQp53wile749dfAuASdvHoE4JnQgGoddGVB4=;
 b=baBffLmw8H2OfDiKVi3LfZ8RhRNKEK+9G3agTUBQfesvvpi3XNijjhbNOjjX/0dVUZ
 8CBcOF8+pHFUV5xlzQzZU6MOGfb1xyJrYwFrXPszYQ9uLd/7Ln1ZVA6oxIo5cqZo6hFP
 IGEoJkHrPcVkTCI0PRObLbcDhxlv83sEpwQnaJYEu3gRij9fR1xcllVxD1ZSoaJJJG5C
 QLYxD0L4+29p5gFGv+UDfZoyIodmlssGq9TSMwDiBrU3ZlJMTLco84Gfh2TGv/Mxspc0
 5e9e5EuzE8xkVmKr4u6u6zZS+Q/mLvg4vur/5Idp9Irtw2osgPXevIntLYh6JkD/PDxf
 FrSA==
X-Gm-Message-State: AOAM5315I4wiGYhzUAyVxwmi7fn7o2p9UwyxDcpxnXGr4venwBRbMP8t
 duzjCnWe0r8zeFHpxt5TmmTHObM/hgHBDS+XEYTJUw==
X-Google-Smtp-Source: ABdhPJw4USVVOR0Ybr8IytlIxpvuZYKIy+f2+7nt008f5Bo+OuGCccA0jkBRcayal0C4WaLq5B4xVgMgwBTay4ShYq4=
X-Received: by 2002:a17:906:c301:: with SMTP id
 s1mr7624608ejz.382.1615545366716; 
 Fri, 12 Mar 2021 02:36:06 -0800 (PST)
MIME-Version: 1.0
References: <20210312102029.17017-1-alex.bennee@linaro.org>
 <20210312102029.17017-6-alex.bennee@linaro.org>
In-Reply-To: <20210312102029.17017-6-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 12 Mar 2021 10:35:48 +0000
Message-ID: <CAFEAcA_7OKauefw7ehAnqF6jmaqWPvNyVba+G2wg+xxsUgpZhQ@mail.gmail.com>
Subject: Re: [PATCH v5 5/5] tests/tcg: add HeapInfo checking to semihosting
 test
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
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
Cc: Keith Packard <keithp@keithp.com>, qemu-arm <qemu-arm@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 12 Mar 2021 at 10:31, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> Query the SYS_HEAPINFO semicall and do some basic verification of the
> information via libc calls.

Are we both testing system emulation and linux-user, or just one of the two=
?
(Not that I want to hold this up if we're only testing one, but coverage
of both, including M-profile, seems like it would be useful; cf also
https://bugs.launchpad.net/qemu/+bug/1918302 which is M-profile system-emul=
ation
SYS_HEAPINFO being broken in 5.2.)

thanks
-- PMM

