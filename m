Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26DB62D447F
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 15:39:55 +0100 (CET)
Received: from localhost ([::1]:52854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn0dG-00053l-41
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 09:39:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kn0Q3-0005qp-UM
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 09:26:15 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:43992)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kn0Q2-0002Zq-3q
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 09:26:15 -0500
Received: by mail-ed1-x532.google.com with SMTP id q16so1740847edv.10
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 06:26:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TeonSrKFIrS7BL6SFpjAf7TUwrVOapkDWirTh+WY03A=;
 b=LDeDjZlTi3A86Yeiq8ncE/fKe0B1T4BmyVzmqxPbZFsg9WVNYL47o6DDSk/6QDR4OC
 QmnFXk4+hMy/pEQ0k+ocTH3b5ooyDvB60XqOHzb3GtXQzQgYzAXnDcaunW2qQIRrUPjz
 lIBv1uXB8ricVUiLsdTINHMi1JeHMhWKO6qj9a0iAw5Taq/SNRUUwasnNLrkcHY5Y/cJ
 p3i5nq3HVr98dvNT4Ud2SVvUB3dYLZ+q9HuzOPFfUHUfCthQx5+Y0stHx+S+JGfBp91Z
 fppRENW0D8BUiYIo5f5uzBd2JtqZf2gL9vI074R5GGJnVewA8IufbLa0aBc9CMxiL1Ij
 CZWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TeonSrKFIrS7BL6SFpjAf7TUwrVOapkDWirTh+WY03A=;
 b=Fuhp5glb70LL/eMBerDzU73TBLlzsoOOAK0wguJ6tVgXuty9E8knTnK32vtUcaM9oy
 9hEpRcJmR46xZaWLZC41opCJYcxjOTEu9Wanh/U4nyD6cod+m5niRNPVXxCKl85zsIDw
 vgCaHZM2Kom2fvuCzDRTyNpRsb8oBPRVHgq4CcSfPjqBSLX0A161j+IKh/JCOAVVIMt/
 a6hmHxeV6FX9urG+jmNUVY/QCAOpPWWhKsLEZSu1lOy6VNRjv7NhBFxyH9RXf+G7wT08
 TvQlfuJ0SvDDGa8V3JoljyH/XFQdJHlS2ouP836lglAP0o6a8qzMKSTjxRggCLlwHGZJ
 1V+Q==
X-Gm-Message-State: AOAM5316aLYb7MQxGHsGbiqpGBNI9qmWY/kcSoI6mNB7Og1mvbZQ27yd
 8urqeybHoo/+1ssMShHU95X0H5S8BynntuyuDlSLsg==
X-Google-Smtp-Source: ABdhPJzuKkuCT0kAfItXnP46EExFfI964p8PcZjwt19KdsYxmr88Jg7H+MX8Zlw2y4mRlnlcCbcTwN4TLTcoRzdCf7M=
X-Received: by 2002:a05:6402:366:: with SMTP id
 s6mr2230742edw.44.1607523972468; 
 Wed, 09 Dec 2020 06:26:12 -0800 (PST)
MIME-Version: 1.0
References: <20201208181554.435-1-peter.maydell@linaro.org>
 <20201208181554.435-2-peter.maydell@linaro.org>
 <fc447673-dada-5f00-8c52-29d90e6db641@linaro.org>
 <a446bff4-04ff-bf3f-d916-2245fdf5436a@greensocs.com>
 <b7d91508-73da-2b26-9a3f-569c7722c99c@linaro.org>
In-Reply-To: <b7d91508-73da-2b26-9a3f-569c7722c99c@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 9 Dec 2020 14:26:01 +0000
Message-ID: <CAFEAcA91QPkK-_Ew=Gx-puRtfb0wTHHVF_4BHamq-CgKttg5qw@mail.gmail.com>
Subject: Re: [PATCH 1/4] clock: Introduce clock_ticks_to_ns()
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Luc Michel <luc.michel@greensocs.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 9 Dec 2020 at 14:11, Richard Henderson
<richard.henderson@linaro.org> wrote:
> This function is truncating back to 64.0, dropping the 32 high bits and 32 low
> bits.  We lose bits at 2^64 ns ~= 584 years.  Which is still unreasonably long,
> but could still be had from a timer setting ~= never.
>
> An alternate to an assert could be saturation.  Input "infinity", return
> "infinity".  More or less.

Might be an idea. We have never really properly nailed down what
QEMU's simulation of time does when it hits INT64_MAX nanoseconds
(which is the furthest forward absolute time you can set a QEMUTimer).

In particular if you use the icount sleep=on option it is actually
possible for the simulation to get there (set a far-future timer,
no other interrupts or simulation input, do a sleep-til-next-interrupt)
and I have no idea what QEMU should do at that point (print "Welcome
to the end of the universe" and exit?).

FWIW, the reason I made this API take a 64-bit tick count and return
a 64-bit nanosecond count is because we do have timer devices where
the tick count is 64 bits (eg the Arm Generic Timers in the CPU)
and the QEMUTimer APIs all want "expiry date in nanoseconds as a
signed 64-bit value".

thanks
-- PMM

