Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F3142DAC97
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 13:02:14 +0100 (CET)
Received: from localhost ([::1]:34736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kp91x-000578-AG
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 07:02:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kp8wp-0000iZ-Bp
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 06:56:55 -0500
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641]:41362)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kp8wn-0003o6-5O
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 06:56:54 -0500
Received: by mail-ej1-x641.google.com with SMTP id ce23so27272451ejb.8
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 03:56:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8ypuxfnE7WVz2BgsB9k7eAFy+c8XPvcmv4E+jNU2w7c=;
 b=YGJnajrp4TSDhmPhe2DENHkRVp24EXdhdZlbEg0Kg7oCQOKC8AP+/vDAjDzLR4Flow
 Lfa/h5QywGH4VKyWid+h61WqQPFPJtzkQqg2JXaE9fhue0JzfVeVXIED/btZKZbZzjwx
 2IIQ+t/vH9Nral4MWW/VAobEbSJHlzeZrhHSIIY8UP+GiIWwEYlWLrgfCxdJSxUaFuUb
 IuVW9naMBeSMIjWA/gIozPnGVWvsZ0FpdAFzkiio0wdHC9HcezCJ5Qrjta2ibb2d+7CE
 AcSZCmK+gEGeuLOqiQ4J7ARA2CjImShkEuNKhh1zijLcFuWEUiP8Duju55LYOOMalOKa
 AkIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8ypuxfnE7WVz2BgsB9k7eAFy+c8XPvcmv4E+jNU2w7c=;
 b=jzGTHFkKuu6D2iNQbyGGJw+ZWX0BpQPG9bzz6KXRRWjlkhycGbfKjjG/+6VHwOXBZD
 YyZwhBT3DWRQpNnxHTbQHuFkldwKnZmvtuzzKrffjxjfVnfvF7VY4OrwJLvbaO7xPVXA
 PDqPZ3tWbvF/8AD6lXYDPb03JhhZK8aEU+kN6SanfWTbxabqAVnu0j2KlfFAlRdtoJPr
 x4WBl+oTv4qxReXyw9ecF7m027JOM+yCyxMvuB6VCpZJpzoAl3zCet5nYmpu2MRcRFlX
 OD5guNr0KcNxYGKKeJy9cTgdcMEEx/BT/pHoZ2dsGN7/zghctnQ/v2Poz8qLxYS/DoNR
 m6ew==
X-Gm-Message-State: AOAM531ATwur2B61indKq8ryFvDFqUnDfNFf3i0orsom/YCDaSscf4Uq
 XDRHF4Vd81g9S4W3Tv0tLs3/n0DJfystUhwJocTW/Q==
X-Google-Smtp-Source: ABdhPJxDOcxjO6V9nKPKnJYEUrdDJTxQW0VRI6a1HSOb66LPSU2+URr3wx9iQ0TjSs2ksFDlgR3FAst0BP5h2EOEpN4=
X-Received: by 2002:a17:906:195a:: with SMTP id
 b26mr14469711eje.4.1608033411473; 
 Tue, 15 Dec 2020 03:56:51 -0800 (PST)
MIME-Version: 1.0
References: <20201214203050.6993-1-peter.maydell@linaro.org>
 <20201214203050.6993-2-peter.maydell@linaro.org>
 <CAFEAcA-U_S62AwsLjwOTOpJm+dxJ-k6CB2HN7nMa+npRcHMzLA@mail.gmail.com>
 <cc8ff905-0830-2ba1-1ec0-3f336625e269@redhat.com>
In-Reply-To: <cc8ff905-0830-2ba1-1ec0-3f336625e269@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Dec 2020 11:56:40 +0000
Message-ID: <CAFEAcA_z4rXSmc-aS9WGOgSmugVSZW1O58mn+Fe0pmnCp0-ezQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] util/qemu-timer: Make timer_free() imply timer_del()
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::641;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x641.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 15 Dec 2020 at 11:53, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 15/12/20 12:44, Peter Maydell wrote:
> >
> >> +static inline void timer_free(QEMUTimer *ts)
> >> +{
> >> +
> >> +    if (ts->expire_time != -1) {
> >> +        timer_del(ts);
> >> +    }
> >> +    g_free(ts);
> >> +}
> > I was thinking about this again this morning, and I'm not sure
> > this is thread-safe.
>
> It may not be thread-safe in principle, but any code that calls
> timer_mod, and isn't itself protected by a lock against timer_free, will
> be racing against the g_free immediately after.  That is, that code
> could run after g_free and have a use-after-free bug.

I was thinking about potential races between the thread doing
the timer_free() and the iothread trying to run timers. Or
can that not happen ?

> But yes, I agree it is also an unnecessary optimization.  It's better
> done in timer_del_locked, and removed from timer_mod_anticipate_ns.
> Since you are at it, you may also want to push the call to
> timer_del_locked down from timer_mod_ns and timer_mod_anticipate_ns to
> their callee, timer_mod_ns_locked.

One thing at a time :-)

thanks
-- PMM

