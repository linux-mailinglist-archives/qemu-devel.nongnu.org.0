Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD3991682C7
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Feb 2020 17:06:22 +0100 (CET)
Received: from localhost ([::1]:60434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j5Aon-0005k1-Sd
	for lists+qemu-devel@lfdr.de; Fri, 21 Feb 2020 11:06:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43780)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j5An5-0003qV-Qd
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 11:04:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j5An4-0004ES-04
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 11:04:35 -0500
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:41700)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j5An3-0004EM-QL
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 11:04:33 -0500
Received: by mail-oi1-x243.google.com with SMTP id i1so2037322oie.8
 for <qemu-devel@nongnu.org>; Fri, 21 Feb 2020 08:04:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LSU4FUlq+syBoMcowgvLR4s8zSj9sBbPg+bklQA1bos=;
 b=oQxi+JKV6uwfsw2ed2nZEpUXonR5ey+O/uHrfGLAxUeD3wCuttEPnCfAozPlCQAWnn
 SPGXLyU8o1cAE9l10nLBo6U6udOpNLjmlp3rawHIKv93I7dFqL09HIF0bRNqn4eLahy5
 w16XGE+wLBh6SuELRW4EgNliAESTdZpQD1x1b49NivNRj/Tc9YSqUlcv5xwKW59H5vDg
 /xvbAw93U8R7HZRTVWM0CuJLXbUfiMrrH0tXbUcyaXxGW9PvdUiiuttSS/kxWaUsazGh
 EuVJwnyt4TachKN7d6RIyFQilHEX+S6flqd289hodUy8Zcytarhyb9D0TggeFND9sFkm
 LL8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LSU4FUlq+syBoMcowgvLR4s8zSj9sBbPg+bklQA1bos=;
 b=Cp9kXN/01eL365dQpqEKoxZEuWvlDwb0kpPedzvW6YuaAWqd7H1ZJpWckAMkE9RXjg
 VccdpsCDEdC0O7ewSU87zH6tkp38u6l1n5QJ4nH1g4QOlH9v3QPJyDSF9wZ4TxBpMLpV
 sbFf/YBMvmN0s9IBjr1yEV439JunBtUVEuS9KcpfMYAamT3vJHLNPlYDqNLbtiGN/ruY
 Jt/OP8tl3eeqP9AKb7lsmJv/yYsvnjYlFn/REkBNgQRndDI+wb3RR9oCFHdZv4uVWkQ7
 y+Ev9zcEbcHFhHcXbtguw+CVBop050Sg5PQuQCAjMSHLwnI0Erj7hDdHWiVAt1ngSGmX
 1/Iw==
X-Gm-Message-State: APjAAAWdDizQF56/7dVDa7jK+c1AOrX567vogoH9rWO2wjqrDe9g9UmA
 J2462kmwibGr9p9fddF8VIPJ1Tw//L0cbSQE1SVipw==
X-Google-Smtp-Source: APXvYqxbOBHmU1WZ6XnSshmDchtKw//1RiTQPt+MmHe8jSJJF0FpGxkE08/So3+WVBKnzDcoEpl8rN5cF9TTXcbzzHc=
X-Received: by 2002:a54:4f16:: with SMTP id e22mr2638888oiy.170.1582301072958; 
 Fri, 21 Feb 2020 08:04:32 -0800 (PST)
MIME-Version: 1.0
References: <20200214181547.21408-1-richard.henderson@linaro.org>
 <20200214181547.21408-9-richard.henderson@linaro.org>
In-Reply-To: <20200214181547.21408-9-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 21 Feb 2020 16:04:22 +0000
Message-ID: <CAFEAcA9my1NeR5xZDKfoKnipAfDck0_YKSy6SW1WdV_Yv3aveg@mail.gmail.com>
Subject: Re: [PATCH 08/19] target/arm: Perform fpdp_v2 check first
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::243
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

On Fri, 14 Feb 2020 at 18:15, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Shuffle the order of the checks so that we test the ISA
> before we test anything else, such as the register arguments.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

