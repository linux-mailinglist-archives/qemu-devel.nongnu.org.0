Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6411F4A68B0
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 00:43:59 +0100 (CET)
Received: from localhost ([::1]:37274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF2oY-0002RY-8U
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 18:43:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nEyJX-0004cR-G0
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 13:55:39 -0500
Received: from [2a00:1450:4864:20::434] (port=40758
 helo=mail-wr1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nEyJK-0005cN-Li
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 13:55:31 -0500
Received: by mail-wr1-x434.google.com with SMTP id s18so33797500wrv.7
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 10:54:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ETth6k4XC87n/TqvnRWbBST7tpgimvYITI34f8qsuzQ=;
 b=vkxg0KUKXea5LTPtz293SeKuKaV2g8iexSQ+sz6enQXL4YIcEXsx0lmyMyZVBKX7Tk
 yPKywjYR57x3schjFEeGCq0aKK6emn7u9FsdD2od/Jhd3DgCmlnzAsbjA2A0r/nnovHf
 zpxd6KuVFtD9LrcRePArk+dXxpqT7HMJerGxgZqOUKchwh9ve8HuUXQ9kXbGJBRrvbta
 dJen4rMfioUeYG2PdRxXNLxu4isXBhcoHafOTVT4rihEFCnETyZnd6kAodImyvEqVeAM
 lfd9OYiS/G0zvfA63D9pc+3FrTDWhPf0G3T+ED3Yfc4RWrQDnLv7E5PuYAuoPXrmXbG8
 yFow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ETth6k4XC87n/TqvnRWbBST7tpgimvYITI34f8qsuzQ=;
 b=ihL2CXMq7/CCSu+i9Lp1piKKtftL3iDs/uUZgTO5Gj4FU1+A/ZD+o0D/tYQ1IjbBxV
 TWTpGeanZEkTH6/oaip6y9jOERYgYw7mmnKxYnElkLo2c96qwFR1ZCauMsesR+tjA4WD
 2fTxzT1dT4HSBsedv7JFnNB/B0zc9S53WZCWzQuI8TOveAb7qPXNS5NoYwozjHvDDh9E
 GlJMEFb+ojXzDRBdbspW8fgeg/4RJaRrj+ak22KJ3W91DvJ68bMr6qSXrp87vRvKmItH
 2tXKV2LKcc3GEeBLm52bLdCaS23QiK+2hby8WcL35jPjhsoFy9FpcWxCF/YTXIjH1Vx9
 JhjA==
X-Gm-Message-State: AOAM532FC13iQLVRUlTiEjV/2Tq70uI/lF/VaX7YXOxSL/ZH8ye/N/UX
 NrttGUzN4E+BiBXcz3tCmOObxptbT8gspDhSj7P7+Q==
X-Google-Smtp-Source: ABdhPJyfYgTqNhm1J4/B6tsedJMojC3XeOlAHYtplMewgA23ZNuFUhebXL9W+vxNHgJHBqIWsGczz2dmj23hz1+XzIw=
X-Received: by 2002:a05:6000:258:: with SMTP id
 m24mr23318682wrz.2.1643741696226; 
 Tue, 01 Feb 2022 10:54:56 -0800 (PST)
MIME-Version: 1.0
References: <20220131094246.772550-1-ysato@users.sourceforge.jp>
 <de031f36-963c-8828-6724-450e9fbf48d6@redhat.com>
 <s3x5ypy1t5o.wl-ysato@users.sourceforge.jp>
In-Reply-To: <s3x5ypy1t5o.wl-ysato@users.sourceforge.jp>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 1 Feb 2022 18:54:45 +0000
Message-ID: <CAFEAcA_eqh6An7u8uuBRevvFx3GOwbmzRAiGEcmRukGOzWsBhA@mail.gmail.com>
Subject: Re: [PATCH 1/2] hw/char/renesas_sci: Add fifo buffer to backend
 interface.
To: Yoshinori Sato <ysato@users.sourceforge.jp>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::434
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Thomas Huth <thuth@redhat.com>, Magnus Damm <magnus.damm@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 1 Feb 2022 at 17:47, Yoshinori Sato <ysato@users.sourceforge.jp> wrote:
>
> On Tue, 01 Feb 2022 15:48:58 +0900,
> Thomas Huth wrote:
> >
> > On 31/01/2022 10.42, Yoshinori Sato wrote:
> > If you describe it like this, it sounds like you're now emulating a
> > buffer that is not there with real hardware? Is that really what you
> > want here, i.e. wouldn't this hide problems with the real hardware
> > that are mitigated in QEMU with this buffer?
>
> There is no such buffer in the real hardware.
> It's not possible with real hardware, but the chardev backend passes
> data faster than the bitrate.
> There is no problem if the received data is supplied at the timing when
> it can be received, but since it is difficult to match the timing accurately,
> we expect that the buffer will absorb the difference in timing.

If you can't accept receiving more data from the chardev backend,
your serial device model should be returning 0 from can_receive.

I don't think we should model a FIFO that doesn't exist in
the real hardware.

thanks
-- PMM

