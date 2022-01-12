Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 150E448C833
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 17:23:50 +0100 (CET)
Received: from localhost ([::1]:35934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7gPd-0000hW-7S
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 11:23:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n7g5Q-0008JQ-Ve
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 11:02:57 -0500
Received: from [2a00:1450:4864:20::32f] (port=53787
 helo=mail-wm1-x32f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n7g5M-000187-FG
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 11:02:54 -0500
Received: by mail-wm1-x32f.google.com with SMTP id l4so1932173wmq.3
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 08:02:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JtP/OBWv3oGBCGkDc1JxKU9quAN1EqYPaTLl6hCCSDo=;
 b=H+5vOufPhIBz0z0+TumsIKIBf9nlHEuAMHerKiygG+iKzEtpHwqNTT1sG8BMao1jpr
 Bc+MEAObA5uTkHHFqyTZqbsNq+HQfgjFacUcN5F/NuuVbebYD8HkgXA1O1WfXwLY9Sen
 8b0iimnEZpKWN1iGqd99FSRmDeQn1tW83Y30nNc9SK8GY/RNs1pFgOZa03r7rGcdiWbw
 JWKrObblWL/A6toxn+UTpf93Medj3bgBzC8N6o3e8oMSpFMr+MlxHkVF32GBt0qsK0ak
 Yh6v2ZfCwX0Wd4Sw5ae/wlY2fXA4vjmitXjtUGWliLRCGGirtDLnJtY0PASrAYJ0R7Is
 LFwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JtP/OBWv3oGBCGkDc1JxKU9quAN1EqYPaTLl6hCCSDo=;
 b=RmET9pZdI/EggBA42lLinkqejDOI9QV6moLh5q5B9TvaNPWd2rnkeIuzLA7R/7Luol
 WQjSqKhSPJ+/o14GEbnUB1qm55pLOmHaAlGMd3OuNxhRMvrrOY/7Oa8xEy0qr85uTp5e
 C2wWIO2uoDqQGzwyJog6w4G4m43MjSdftM2vczjMkjwkbrEw9X/wpYTR1WmC8cT6k97l
 RYNRu8GTxMbsMd1ZnboCI2dz/xvqSco4G2u7nOWFLcmSp2tm3E6tfTZvXXft69YrX6ik
 eQfLxP8G7sVszumjzLOKW7aqGq5pDfeZYcPzZmzWmbWPFzEjYHfHPIPni/YnpamfgMEg
 tubg==
X-Gm-Message-State: AOAM530U8CL2uxKgE94SciLlUwfgiANhdvp+BP3U+WyJ+FcyUhVP8LHS
 D9q1A5vATgcaO6a0XRxV/iQv37W5Jot3NxPLhhHN3Q==
X-Google-Smtp-Source: ABdhPJwnWbbyxVUMESxMGkDUxfCTCRaqaXDI5AlS80ycOBM0Y1VYang3hOYw5W/jX74J2OCbiaZbN8XWMj3mN7j4Zso=
X-Received: by 2002:a05:600c:154c:: with SMTP id
 f12mr3285887wmg.126.1642003369141; 
 Wed, 12 Jan 2022 08:02:49 -0800 (PST)
MIME-Version: 1.0
References: <20211106105623.510868-1-f4bug@amsat.org>
 <8f417138-a3bb-7d07-bda9-db4740550f2f@amsat.org>
 <5cad7d04-1699-35d2-8d96-b236d451101d@linaro.org>
In-Reply-To: <5cad7d04-1699-35d2-8d96-b236d451101d@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 12 Jan 2022 16:02:38 +0000
Message-ID: <CAFEAcA8m=uX6ju-4CN6rac4v0Dun2d-Qn1gtReHLaKFjvEt6zg@mail.gmail.com>
Subject: Re: [PATCH] hw/timer/etraxfs_timer: Add vmstate for ETRAX timers
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 18 Dec 2021 at 02:28, Richard Henderson
<richard.henderson@linaro.org> wrote:
> What I don't understand is how these controls get applied to qemu_irq after vmload, here
> or in any other device.  It seems like we should have some post_load hook that calls
> timer_update_irq, etc.

Very late answer, but: we don't need to call qemu_set_irq() on
qemu_irqs outbound from a device after a vmload, because IRQ
lines themselves have no state. The device on the other end of
the irq line also loads its own state, and typically that includes
its internal variables which it uses to track whether its input
lines are 0 or 1.

-- PMM

