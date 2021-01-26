Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF763038F9
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 10:30:16 +0100 (CET)
Received: from localhost ([::1]:36342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4Kfv-0001Ty-DI
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 04:30:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l4Kf9-00013g-77
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 04:29:27 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:34482)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l4Kf7-0004Wx-Cl
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 04:29:26 -0500
Received: by mail-ed1-x536.google.com with SMTP id d22so18922333edy.1
 for <qemu-devel@nongnu.org>; Tue, 26 Jan 2021 01:29:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2JMscVPoQ+zQhjGLJOMM7A8Ik5IREUgrkm0kXkdPLLM=;
 b=qBsM65Tom89WuNIxdRJq0xDbXQT400DhbVK9ezyCLNgfn+GB9cnHRKgS2p9EL0vdii
 D0hZgX6VAKpJrLxh7aZf8bB1/lJdRqA7ZUDy2A0HtRwUav7+qP9IxORrXURhyHOU2VVC
 ZrCf/c+AtvfKRROeCnEU871jtuGYTJqmHdv9WDb4WXPctbc/wxp2tcgfxvWJ2xcIQKT/
 Z4LdySIW8g8RSFFTnpW6oG4lXW1zVvATMUuXRhbD/P6a87fTEMbbEOeFEQCdO8llW09d
 x4jRid5FIXgrr6del/BiyHD1K2j7ao1mexY8pgAMlkujRO1rFrXXFjdDd4sE8ACNvg12
 5cpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2JMscVPoQ+zQhjGLJOMM7A8Ik5IREUgrkm0kXkdPLLM=;
 b=P6Hj78CeGOe/WgITR5/iCY2w7DmjIEGMJmQfQLYdhOL0kOF3+XWiJKMTvNRfVqfunk
 p3ME/CGBrLvrqRW7IXl9ErF0/K8NR/7JCRNfRh3NXfRxnjTDtHdGp/OYFe9JmF4IwEYi
 8bp1kigkmuXRPD2y/otGpnt1kyOYKbpPFCUlcgbuuMaF+3EEeJPhTD+26SKkSgc00ldo
 GEy/gVThXQv9aSC4loM++Rx8pNOXteB+zDgSlGkZ1Qdk8VaxENJOSo7ur+mXhGyDiz4W
 8Zqy75WI7BjkdDqBfKu7mEZ2vPJ/Tg9WJoEt/ByEQV8MN7E1rwfVG5lBN6hrnaiTIDLN
 5myA==
X-Gm-Message-State: AOAM531bmblIRdP+tmpcagIk2i41WTL1ghKxMix2st7QTttMsK32g/B5
 vLWmsdNZFzTfJTe/RKcfQLv9LlZYrJlNOFOYSh8mpQ==
X-Google-Smtp-Source: ABdhPJwbulAqf+Me44ttTkSwMzq8daJFYb3cVxBnW8NM9TjCK0uTvCW/9YM9fUDQsqDshlF1MuskTlthTP14KsnnbL4=
X-Received: by 2002:a05:6402:3514:: with SMTP id
 b20mr3205121edd.100.1611653363378; 
 Tue, 26 Jan 2021 01:29:23 -0800 (PST)
MIME-Version: 1.0
References: <20210122201113.63788-1-j@getutm.app>
 <20210122201113.63788-6-j@getutm.app>
 <CAFEAcA8V1nv1VV6t8UN25JoA7bw96xSBamaw6VnfBavOQjj44A@mail.gmail.com>
 <CAFEAcA8hA7_isLsAtyS8oSwcfL9nRjdSehL+qLj5C2MycbzLoA@mail.gmail.com>
 <CA+E+eSAhNNBxY06a5iQj9ANpgmYZk0Kf6LYQPduCLwNmr1UQvA@mail.gmail.com>
 <CAFEAcA8KZqxjDd0H7faF=YtkyY-XFB2WoP31qv_2ecFij_rLqQ@mail.gmail.com>
 <59a773e4-b277-a8a2-b496-d95b515718e2@redhat.com>
 <CA+E+eSB_ZbO4GGCJWdZsOL+e4VE7nzW0THUqBgmdeA05yjAzmg@mail.gmail.com>
In-Reply-To: <CA+E+eSB_ZbO4GGCJWdZsOL+e4VE7nzW0THUqBgmdeA05yjAzmg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 26 Jan 2021 09:29:12 +0000
Message-ID: <CAFEAcA_FMLD3YsHO_x9OFq_d=AactQMQFfXubYzQAYu=dWMCaA@mail.gmail.com>
Subject: Re: [PATCH v7 05/11] osdep: build with non-working system() function
To: Joelle van Dyne <j@getutm.app>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
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

On Tue, 26 Jan 2021 at 00:12, Joelle van Dyne <j@getutm.app> wrote:
> cc.compiles should work though. Is there a reason why it's not used
> instead of all the compile_prog checks in ./configure ?

As Paolo says, that's because our transition to Meson is
pretty recent. We put in the minimum necessary to move all
our old makefiles over to meson.build, but left the bulk
of the old configure script in place initially. Since then
we've been gradually converting tests in configure to
meson.build tests, but configure's a big script and it's
taking us a while. In the meantime we're preferring new
tests to be done in meson.

thanks
-- PMM

