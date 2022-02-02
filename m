Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F1C74A78E0
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 20:47:04 +0100 (CET)
Received: from localhost ([::1]:57630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFLap-0000Vy-6U
	for lists+qemu-devel@lfdr.de; Wed, 02 Feb 2022 14:47:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nFKtK-0003FM-OI
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 14:02:07 -0500
Received: from [2a00:1450:4864:20::432] (port=42508
 helo=mail-wr1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nFKsu-0008Si-PS
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 14:01:43 -0500
Received: by mail-wr1-x432.google.com with SMTP id a13so375125wrh.9
 for <qemu-devel@nongnu.org>; Wed, 02 Feb 2022 11:01:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MFBLvuyL9oBl/C8IgMP05h8le8cXq0PH9kAjwXVzpMc=;
 b=CBrPQdg0wjY+hVlsyblrZs+pqfLBGwfDu55nVIuM+25N+3g+CJSykhC7ZppZ8zST54
 kTEIGU9yBCqOX225z7AWAGDC/B1EYOssBBVfZHsKzBFDn8YRfESEkatl2CsJeQZ0F+2J
 iLUkg38ccrF+yXPCUWOl1EZkwSVGOvsuPB796LXMJVuklyqoFpi5b1QIpqB6yHVcKsiu
 R4t0LO72utOxZPruRhzeOaUU6faY92JRGqYphtsWVMC46PBw/s8vkDcae4Lhqawi0SpJ
 zyvLsZKyLBVsICYVSiMV10V489WNMDrO92LVh+Qh0GKIABvyuAzMAjSdsYd00kJHOR9/
 4HIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MFBLvuyL9oBl/C8IgMP05h8le8cXq0PH9kAjwXVzpMc=;
 b=Ln7bi45hrruB69PjQbH7LxEi3U3uf+6JuTTzt823vINEtGQHoAGJFf4O7lBiO+xRIt
 z28H9mFHTNxWnLsQ9Ij2P3DH8bWraVY5kK5MhvSvANSFQOc4npMoH6zH0dplpD20Pwcg
 hYpNy1aJAGHerDuGvzpdQTWP+klpQSRVAEY/DlR7zRa6+2MdD7EFtK6OZjGdk3cX8liC
 gDQ9wm9oN6MRL8xYpXRzj6Cj3pFw3/OWyZS8vq2GFoCaQIr3E9fzQz5ib8psoaUJIXND
 M79dm3fDNbXVpmFQWaTFHT4MtXZmpbI7F6njpx3sr3hDwgOewr7w6mKfD0kU0YMr8nef
 huKQ==
X-Gm-Message-State: AOAM532tMOcL/4/P1lu2wIHkElJALviJ/ZeCkh6urR96GnNjR3HrbDll
 4au4f1QaSwyLzbMBhwlvJlvWTcLaPb8rYm+cPjZXVg==
X-Google-Smtp-Source: ABdhPJxvd1zLLbss8H2d/sKIUOVcniV+8RU7WSYgXTRbTp2BvspH53Am+8kwoxcsGm+niUlwjCmW+pfQQCjaF5eMV7Q=
X-Received: by 2002:a5d:438a:: with SMTP id i10mr25715468wrq.295.1643828494912; 
 Wed, 02 Feb 2022 11:01:34 -0800 (PST)
MIME-Version: 1.0
References: <20220201163005.989457-1-venture@google.com>
 <59040e43-2375-1f73-15bb-ce1a47165145@amsat.org>
 <CAO=notxPP8+b6S6UnUX7s4yWQsEhaAS0CZbn1my0HEN2idL6tA@mail.gmail.com>
 <CAO=notw9jYSc6xGr3_kwuAWHG2J3VJ7WxJT+tL_fbXFfTRrhpw@mail.gmail.com>
 <CAO=notzLfum_zkXhP+xQ9RTxcpG3oNxwFMPYWz+o1vYdF8ynQg@mail.gmail.com>
In-Reply-To: <CAO=notzLfum_zkXhP+xQ9RTxcpG3oNxwFMPYWz+o1vYdF8ynQg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 2 Feb 2022 19:01:23 +0000
Message-ID: <CAFEAcA-N3BwSNsXSidXK6PgmjDrGfOQabyfVRv03nnyLpsBURw@mail.gmail.com>
Subject: Re: [PATCH] hw/i2c: flatten pca954x mux device
To: Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::432
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
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
Cc: Hao Wu <wuhaotsh@google.com>, Corey Minyard <cminyard@mvista.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 2 Feb 2022 at 17:36, Patrick Venture <venture@google.com> wrote:
> Just saw your reply, and found a bunch of other non-spam in my
> spam folder.  I sent the message to the anti-spam team, hopefully
> that'll resolve this for myself and presumably others.

I dunno if you folk get a specially tuned version or just
the standard gmail spam filter, but IME it's not very good
with mailing list traffic. In particular "this is a patch"
should be a really really easy thing to detect as not-spam
but it doesn't always manage it. I have my filters set to
"Do not send to spam" for mailing list traffic...

-- PMM

