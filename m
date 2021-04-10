Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 451DC35AD86
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Apr 2021 15:20:09 +0200 (CEST)
Received: from localhost ([::1]:36330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVDWx-0000I3-T8
	for lists+qemu-devel@lfdr.de; Sat, 10 Apr 2021 09:20:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1lVDVW-0007tk-1s; Sat, 10 Apr 2021 09:18:38 -0400
Received: from pharaoh.lmichel.fr ([149.202.28.74]:42684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1lVDVT-0005qe-Ns; Sat, 10 Apr 2021 09:18:37 -0400
Received: from localhost (sekoia-pc.home.lmichel.fr [192.168.61.100])
 by pharaoh.lmichel.fr (Postfix) with ESMTPSA id 3EBDCC602E6;
 Sat, 10 Apr 2021 15:18:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lmichel.fr; s=pharaoh; 
 t=1618060710;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=99xOde4CmrFc+DDpSIPvlIjgKvGfhcemR5ZOTRvv2Sw=;
 b=H0CaIA1giRwgVqoJTuFFgBBP9GQ6JcyaQKX9PRtGxdTmdKaKbzO08LVK4Lx1RVMb0CikS2
 5gzYAIQCc0V3chH8EBZcU/jE2USP+KZNJNiHml5AiXKxP+/7rIL8RPmCjY66e0lKWf3VOp
 vGACWo5SetWCszHkVoZGYQnmPldwDUTjwiLtsaiY2exVn5w9ILgi3K+AbvM6FJjDG4qMSh
 xoH+iPOGkDIwRzNP+YioN9EhYU0lH9K02V18zHW8jBFGJ/GBuzv7+1FXLNtPA2p5ax7JE5
 lXgoEgs7ROPbmtt6+lSS6xBgWdc3F7IeA9ad1JZzvzenUr5lJkVJb14hyEul1Q==
Date: Sat, 10 Apr 2021 15:19:32 +0200
From: Luc Michel <luc@lmichel.fr>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [RFC PATCH-for-6.1 0/9] hw/clock: Strengthen machine (non-qdev)
 clock propagation
Message-ID: <20210410131932.i6no5tvvaldyomvp@sekoia-pc.home.lmichel.fr>
References: <20210409062401.2350436-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210409062401.2350436-1-f4bug@amsat.org>
Received-SPF: pass client-ip=149.202.28.74; envelope-from=luc@lmichel.fr;
 helo=pharaoh.lmichel.fr
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Philippe,

On 08:23 Fri 09 Apr     , Philippe Mathieu-Daudé wrote:
> Hi Damian, Luc, Peter.
> 
> I've been debugging some odd issue with the clocks:
> a clock created in the machine (IOW, not a qdev clock) isn't
> always resetted, thus propagating its value.
> "not always" is the odd part. In the MPS2 board, the machine
> clock is propagated. Apparently because the peripherals are
> created directly in the machine_init() handler. When moving
> them out in a SoC QOM container, the clock isn't... I'm still
> having hard time to understand what is going on.

I think there is a misunderstanding on how the clock API works. If I
understand correctly your issue, you expect the callback of an input
clock connected to your constant "main oscillator" clock to be called on
machine reset.

If I'm not mistaken this is not the way the API has been designed. The
callback is called only when the clock period changes. A constant clock
does not change on reset, so the callback of child clocks should not be
called.

However devices that care about this clock value (e.g. a device that
has a clock input connected to this constant clock) should see their
standard reset callback called during reset. And they can effectively read
the clock value here and do what they need to do.

Note that clock propagation during reset has always been a complicated
problem. Calling clock_propagate is forbidden during the reset's enter
phase because of the side effects it can introduce.

> 
> Alternatively I tried to strengthen the clock API by reducing
> the clock creation in 2 cases: machine/device. This way clocks
> aren't left dangling around alone. The qdev clocks are properly
> resetted, and for the machine clocks I register a generic reset
> handler. This way is safer, but I don't think we want to keep
> adding generic reset handlers, instead we'd like to remove them.

I find your API modification a bit restrictive. I think creating a
standalone clock can be useful, e.g. in complicated devices that may
want to use internal "intermediate" clocks. I would not remove this
possibility to the API users.

Thanks,

-- 
Luc

