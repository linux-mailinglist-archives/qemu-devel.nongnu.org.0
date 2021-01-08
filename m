Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B173E2EFB0B
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 23:23:16 +0100 (CET)
Received: from localhost ([::1]:57400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ky0A7-0002G7-Oq
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 17:23:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ky080-00017B-SI
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 17:21:04 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:35228)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ky07w-0006Rb-EM
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 17:21:04 -0500
Received: by mail-ed1-x52f.google.com with SMTP id u19so12768930edx.2
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 14:20:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6Z/uC52LS7czxlv3EK8v+p95ZqX1elvCXnWLurWr7u0=;
 b=FBo8qs+N7R3I5xptJvUF2aAUt6/ycAIebyt7PWlVC4recfgjaEf8vxwBmZpVuBTucN
 xjskqVJMGh8Q9XDuDKo+5Vr8cGOJDfgo9p7ODbr5v55R0Eqv1pwGGpw+DTMHQRaOWZ8b
 gtke00Yp4sk1t4zaRVT7rYp2sPMKcc6ghuTUoNvpGelQN0sGUd7kE1sAgM3/pF33ko+b
 8JEj6cT/92XGecOS2XEzWKUSN9ivH6C3P60fBGgtbDxAGD6PsXdm34Fr2XoSqRJ6zicO
 Rzg3XoynmIUm1ulbqoze7yuYMHT2JhwJdv8ef6VqFK5t/L2WhkFhe8mFR1xZobKGoDNp
 MGWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6Z/uC52LS7czxlv3EK8v+p95ZqX1elvCXnWLurWr7u0=;
 b=p9vdZxjtL1XkC1uF5CGD8zjKE0y488+jZXviecgh/K8mSIZwZ3cVQBdcV5KrAM27FF
 3wgdgdr2p7gPT5Fcjv8zusLx7i1g8G9bUxgo5XFN4o7Np+MWcHkaPcEgaQsFGWxizJZG
 XVMa9cYal28fOSUi61l7K/8EGWLnaTLwPW9TowIASsBeiKo7msFeAfjM0ed1bR9Mq2gY
 SyGb+ADGLA84z9AKNLdzrtjRNG+eHP3kmjkD3346Cijqxr43YLqp1zvL2pysMaRhfqxZ
 AHOB2bbG31g/3rnUq/XpfGzWYnRorYGO0+OArQ0mAOPuglB8PTXTm6dQ+cXiS9MpAZZh
 yeqQ==
X-Gm-Message-State: AOAM531qO89/4DTqLzYMikXqWya4Ez6UdAHE64ncicF4159PxwiXXnO1
 eLuTUoTzAuuq9P2PCovcs8qXdvuO/DkEX6ik96MkhQ==
X-Google-Smtp-Source: ABdhPJw/lPpvXoHUTA9XkGEn4gG2qkaqFXd/3FdDCAeNMpOleQgIVtp9w5eyDEYy8WfRpFYuCByejTsRXvTr5QZFrmY=
X-Received: by 2002:aa7:d915:: with SMTP id a21mr6625109edr.251.1610144458380; 
 Fri, 08 Jan 2021 14:20:58 -0800 (PST)
MIME-Version: 1.0
References: <20210102150718.47618-1-r.bolshakov@yadro.com>
 <CAFEAcA8GMYcTrfKJ-6E3rKyytDHSL4UeWPVuFVLtzWjDtCxMVw@mail.gmail.com>
 <CAFEAcA97hh-bC7yjpHLGyvOiBGMxRtOQaf0O-y5WG0xYYA8N7A@mail.gmail.com>
 <CAFEAcA_DONsg-c_-sEA_T_P+5jYSAXtTDfcvy7_h7oGWOqJ+nA@mail.gmail.com>
 <X/jTED/ktnoFxm6e@SPB-NB-133.local>
In-Reply-To: <X/jTED/ktnoFxm6e@SPB-NB-133.local>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 8 Jan 2021 22:20:47 +0000
Message-ID: <CAFEAcA-vQqmSLZ-haRcVMG=RjPR+Uz=_semCKE0sjmkfuQaQpQ@mail.gmail.com>
Subject: Re: [PATCH v2] ui/cocoa: Fix openFile: deprecation on Big Sur
To: Roman Bolshakov <r.bolshakov@yadro.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 8 Jan 2021 at 21:47, Roman Bolshakov <r.bolshakov@yadro.com> wrote:
>
> On Fri, Jan 08, 2021 at 03:05:55PM +0000, Peter Maydell wrote:
> > This menu bar breakage appears to be caused by this patch. I have
> > no idea why, because the patch looks pretty harmless. Nonetheless,
> > I'm going to have to drop it from my queue.
> >
>
> I think the patch is valid per-se and doubt the patch would cause menu
> bar breakage. I had unresponsive menu bar on Catalina even without the
> patch.

Well, for me it seemed to be consistent that with this patch the
menu bar didn't work, and without it it did work. I'll have
another look later.

-- PMM

