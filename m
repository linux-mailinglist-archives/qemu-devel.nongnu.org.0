Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E6F14B46D
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jan 2020 13:46:32 +0100 (CET)
Received: from localhost ([::1]:58430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iwQGF-0000f2-Hi
	for lists+qemu-devel@lfdr.de; Tue, 28 Jan 2020 07:46:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51853)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iwQFC-0000Ey-PC
 for qemu-devel@nongnu.org; Tue, 28 Jan 2020 07:45:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iwQFB-0001x6-KI
 for qemu-devel@nongnu.org; Tue, 28 Jan 2020 07:45:26 -0500
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:33504)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iwQFB-0001wX-EQ
 for qemu-devel@nongnu.org; Tue, 28 Jan 2020 07:45:25 -0500
Received: by mail-oi1-x243.google.com with SMTP id q81so10193915oig.0
 for <qemu-devel@nongnu.org>; Tue, 28 Jan 2020 04:45:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DkCMJnkSINviM0WUH/RwOMJrm+hbvFNdiVpQrGfwOq8=;
 b=RZfdz+HYJbXZgYQIdSzvcVL6k2tvIWzVkEHv9M0W39/43L56FeHyY5nhSy2cbaW61p
 r6FEnqrQRkHSZDCCqqEBxRpLycQFT/p4w3W5FVyoy6Q+POUNKI9uYq2+Q5hdeqfHfvaJ
 QrEkyJhk3wuZepoHwFrdAZnKFa5BQnROV+JidLPqsarxkZubWTzccMCRXFAszZ2iW2US
 tZssDXiFemWabzqtDu0pApw2Qv4lpaC7xMckK1zAh91wVr5ySOoNTxkO3GEsrgqM5qMq
 J1r52Wv83zpVCGZ6r7hH6QfCUztVP2C5R+AR7bw+yWYojbAy/PDvisa1yCOWFFI0rc8P
 rxuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DkCMJnkSINviM0WUH/RwOMJrm+hbvFNdiVpQrGfwOq8=;
 b=dvj1X8d2DX2q5Gqf+X5z/mLEt0kUVjqFSmxC1dDJ/qApWW9SDmXRx+TJNhOiRK96It
 1AyHqcQ+gk+UCdVcepXYdvKwGCuQcPp9QwXGsD8tGh09Sgk8Dzw1J0/Wu9J8cJEDZx5A
 FANjYrksCX0cytJ52EXNi937XA0/sEVtgzop3d0BHqp1Yhcy+cGBtv7Fgd49eMxkNHUp
 TCpDq6D8/TMKrdUsL8XfyEa7t65miO1kmCUVKfs80SySU/DYGtb4gd7YxabN06rPEiNX
 ejCa8vYWSQtkLLHuMcYZk3Ismg2h+mrSlY0B7xs52TVvjLy50H252KTjU7vcQPOX4ZbW
 k+tg==
X-Gm-Message-State: APjAAAXf95MhJC8Zy3Cf5HpvchQs+zY21MJEuMDmccA+tvi481o9FPGS
 XgzqzSpWQQlfazAf8VigUxmbgQ5osHluigxKRPDqlA==
X-Google-Smtp-Source: APXvYqz34TIV99pEffzacvPbcRss88kwwojxbwfBcMUQ0HDGWPuw1YjeRUt5HrlDSjd2UTqBDMRv7zD/OkoMQn4SJJ0=
X-Received: by 2002:aca:f484:: with SMTP id s126mr2593004oih.48.1580215524088; 
 Tue, 28 Jan 2020 04:45:24 -0800 (PST)
MIME-Version: 1.0
References: <20200116115700.127951-1-mkysel@tachyum.com>
 <CAFEAcA_pOAX=pCk0TfbwwUPHUX2YhLtxMonYVazMrGZBvPJkPw@mail.gmail.com>
 <BYAPR02MB4886C0D683ABE475CBC1F23BDE0A0@BYAPR02MB4886.namprd02.prod.outlook.com>
In-Reply-To: <BYAPR02MB4886C0D683ABE475CBC1F23BDE0A0@BYAPR02MB4886.namprd02.prod.outlook.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Jan 2020 12:45:13 +0000
Message-ID: <CAFEAcA_v7MSfDEfUkBa3Gd2ChAcRvKXx4Z2oL7w7aNpQYt_Jnw@mail.gmail.com>
Subject: Re: [PATCH] Handling SIGSETXID used by glibc NPTL setuid/setgid
To: Taylor Simpson <tsimpson@quicinc.com>
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
Cc: Laurent Vivier <laurent@vivier.eu>, Riku Voipio <riku.voipio@iki.fi>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Matus Kysel <mkysel@tachyum.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 28 Jan 2020 at 12:33, Taylor Simpson <tsimpson@quicinc.com> wrote:
>
> I proposed a similar patch guarded by #ifdef TARGET_HEXAGON.  I understand we don't want to break things that are working, and we don't want to open the door for a bunch of #ifdef's here.  However, more than one scenario needs this capability.
>
> Would a suitable compromise be to provide a hook in linux-user/signal.c for the target to put in the changes they need?

No; this isn't target-specific, and we don't want
per-target different behaviour.

thanks
-- PMM

