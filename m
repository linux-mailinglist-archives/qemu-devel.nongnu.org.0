Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E216E3E5A66
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 14:51:02 +0200 (CEST)
Received: from localhost ([::1]:44784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDRDh-0004lX-Vf
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 08:51:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mDRCQ-00045P-DC
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 08:49:42 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:43999)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mDRCL-00009W-T7
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 08:49:42 -0400
Received: by mail-ej1-x633.google.com with SMTP id b15so11112704ejg.10
 for <qemu-devel@nongnu.org>; Tue, 10 Aug 2021 05:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=NhajSYweEVPO7kwk3fRIP5Sb6wBRmKjshnbCknJebFs=;
 b=q6vqsqeGaxjv0giS/6nIXr84EVMG/rK43VdF1nENGbGNSYneE8wd4OAkWg/TZM+Rtb
 kBkjb5NqYI+S+UWI4FVc5+Cl6zQmqeL7PUu1fY2bkNphD+pxfiiat2xkmKW+r/vjlwjP
 j1agRh86nb6zI3Ci4OU+f0JlQSv+FmKUpM6vAJYWJagr23Q/STpaWeBrpnf/73WWCqgv
 VaukTl8okfJaiUZdmXXsB6fxwl6y4BdJKx9VsUKvyzsY8o6jT6qDoG787lzLmSHmcfNB
 OKveXBTy0Qdyxg1ez44hriOG9Q0LoB5JqK+HtoO4Y0zkw9lyfMRuwvw1RNbK5bfog5Gd
 sMUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=NhajSYweEVPO7kwk3fRIP5Sb6wBRmKjshnbCknJebFs=;
 b=k421sk/JxM3JN/yIkqBB++aVXeDmAe70b7eh1twK03pM2dGmWQYN+dJur+loWipZu4
 eIdqerJ+duHpjWJ23EO9wjihatPZQI4E6W/P2YLECKfZ/WgUFzWFI/uBGnK77ga/C3DJ
 nm746ksHX9G0/6DvMwJO6HxO0uNNm9p8ztl3YJuwl37wP2UjITNLgH2pb1LW7oWxgCuu
 LbhQ7DEmMG6EN2EqL/cWruMLjglYLbMeSQZ9Wb+OWRoS1KHloFHR15Hkm3KgiYekZlJF
 a0HyJ3tQwTQppxqPLEKYT88fAPBRsLCHLWbhsHgV+UvrN3or3horl8tRl6uYjO6qpn65
 Muqg==
X-Gm-Message-State: AOAM531gir4JYRVuJFJZPPRxhrPXqK23cbT2139tmAmmfz8uoiDfrkCj
 qJRVqGRTMgSt/QQCTHfxPy9UqVzkEgz8g93RCJ+Q6Q==
X-Google-Smtp-Source: ABdhPJzVgcd0i9BUpTtJFpqLdXmI8SWkNHdOZbkdNvbFIxFp81dYnpYQmkTiHQYh9FH14OiA6REQXnRSr3juK6lJMQ8=
X-Received: by 2002:a17:906:d93a:: with SMTP id
 rn26mr27165586ejb.382.1628599775860; 
 Tue, 10 Aug 2021 05:49:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210810110023.3923155-1-berrange@redhat.com>
 <CAFEAcA_J2T92Gr6-koxofLw5cFEad4evLkSXS9L9gef1OV1yLQ@mail.gmail.com>
 <YRJfS7yRmwO+bQBt@redhat.com>
In-Reply-To: <YRJfS7yRmwO+bQBt@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 10 Aug 2021 13:48:51 +0100
Message-ID: <CAFEAcA88NK8F9UAep2yL-aVyZX+r5gUdy6+VbdB4HvjbgW1qWw@mail.gmail.com>
Subject: Re: [PATCH] docs: make sphinx-build be quiet by default
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x633.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 10 Aug 2021 at 12:13, Daniel P. Berrang=C3=A9 <berrange@redhat.com>=
 wrote:
>
> On Tue, Aug 10, 2021 at 12:06:47PM +0100, Peter Maydell wrote:
> > Can we make meson pass '-q' only for non-verbose builds, so that
> > if you pass make 'V=3D1' you still get the verbose sphinx output ?
>
> The meson.build rules are turned into a ninja.build file at configure tim=
e.
> IOW, at the time that conversion happens the V=3D1 arg isn't present, so =
we
> can't conditionally pass '-q'.

I'd rather have "always verbose" than "never verbose" then, I think.

Also, this seems like a meson/ninja misfeature if we can't do
a perfectly sensible thing. We can do it for cc, why not sphinx?

thanks
-- PMM

