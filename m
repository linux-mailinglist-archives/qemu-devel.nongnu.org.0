Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2860D6ADBA0
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 11:18:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZUOJ-0001jG-C2; Tue, 07 Mar 2023 05:17:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pZUNo-0001QY-22
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 05:17:25 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pZUNe-0002RF-SL
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 05:17:17 -0500
Received: by mail-pl1-x636.google.com with SMTP id y11so13550285plg.1
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 02:17:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678184233;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=0aJCYfjof5yqU5N/p/BDGQFJzggOGX4MicDt1pfCeqc=;
 b=yoVCBprk0BzBUf3mDcGobFaF3fGDZlURwiNVAH8f5/hk+2r26kMzmeUuGeIfVI8ya8
 /Eg+Ln/pbJLSHC3nYuNrpg+fmJF64U5m1KrIvvWOLVU9qd4o42b2QduwbW52DTrAQsX7
 /U3gAffc3DSKohDSelV5GY8QGkHjZ6CSAppsmWx9BFUIKGucxeAhoWT2wX+LB0n3sLHp
 HIveZxxAUQNy/9YeR+1yPsTaAlTh6Ar1TEY7v/jtlttpyW6pHw2Q/fF4naLADhKKWDPB
 yGcx6HAmiAxes1SVwAioAr+vcZpKTX/9uUgxh5YaDUu9mmYMOjkGZ9KWk6BjqgBTJxnY
 tRfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678184233;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0aJCYfjof5yqU5N/p/BDGQFJzggOGX4MicDt1pfCeqc=;
 b=YXwzvVrju2xbc0aOMGg4Fqleo6lw/qOx1KZRi7zkZwaK+98CPTmsXfVupy3LW7WH+b
 nY2lHAIMz+RDMIy2SPHxZlP1E2MZi7vIfJ8qmttpoO0Cd89M8QSKamcr488yWBKvpvKw
 8BwlkadD0PahTK8ZcpIoDN4Joyb9sWspr7IRz7KFqP3QoV/O5hbHMleiUiR4O3A3v8mo
 HeLgdxb8NH/9+3dDrsRCOvgfFWtV/z/KiTLLq0Z8JzOBZnylxFi4shbchv9uZP4fDoxk
 Tn0k36irfHcLSL3J4/DmaCpemmILJJtTJ+OhWqeRIydxpmAGANz0ysYXx60dL6dkV37H
 y/Qw==
X-Gm-Message-State: AO0yUKXY2qKDF4NgEd2KhR6RRO3REu9aNmyP56IukgfPxw6vn8dj/H1J
 X/TE2yjzc0f43VQI5xqH1R8VgsnyU72W7X/ugmTfQ/UGDwMhLHsO
X-Google-Smtp-Source: AK7set/odXeACyvjdg3adUkdkEOE7OBpEeamPKxa5alE3Q0kNWNSGsRX9UIKAhRR1QLwd8I2OEsOvA444j7iqwo/JQY=
X-Received: by 2002:a17:90a:9512:b0:237:50b6:9a09 with SMTP id
 t18-20020a17090a951200b0023750b69a09mr5247483pjo.0.1678184232345; Tue, 07 Mar
 2023 02:17:12 -0800 (PST)
MIME-Version: 1.0
References: <20230306021307.1879483-1-richard.henderson@linaro.org>
 <20230306021307.1879483-2-richard.henderson@linaro.org>
 <CAFEAcA81_bQMYK9w0LitTrBkp+ue33gUocUMZco_HG0AxgGeaw@mail.gmail.com>
 <004c0c81-958c-ba34-a743-6f2a4a4d133a@linaro.org>
 <CAFEAcA8M+1jSK4+gzA6rkoQQY579RuBpMDM9eQk=aN5gPhHNbw@mail.gmail.com>
In-Reply-To: <CAFEAcA8M+1jSK4+gzA6rkoQQY579RuBpMDM9eQk=aN5gPhHNbw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Mar 2023 10:17:01 +0000
Message-ID: <CAFEAcA_dYmf-6kF58CvrcvL+NjpXYaau+_=vRJPuOXEuNYmEeA@mail.gmail.com>
Subject: Re: [PATCH 1/9] linux-user: Diagnose incorrect -R size
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 7 Mar 2023 at 10:12, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Mon, 6 Mar 2023 at 21:24, Richard Henderson
> <richard.henderson@linaro.org> wrote:
> >
> > On 3/6/23 04:56, Peter Maydell wrote:
> > > On Mon, 6 Mar 2023 at 02:14, Richard Henderson
> > > <richard.henderson@linaro.org> wrote:
> > >>
> > >> Zero is the value for 'off', and should not be used with -R.
> > >> We have been enforcing host page alignment for the non-R
> > >> fallback of MAX_RESERVED_VA, but failing to enforce for -R.
> > >
> > > I'm pretty sure we have users who specifically use "-R 0" to
> > > ask for "definitely turn off any reserved VA".
> > > Here's a random example from an old gcc bug report:
> > > https://gcc.gnu.org/bugzilla/show_bug.cgi?id=60681
> > > and somebody using it via the environment variable:
> > > https://www.openembedded.org/pipermail/openembedded-core/2015-January/100572.html
> >
> > Odd.
> >
> > Well, it won't actually have the effect of "definitely turn off", it will merely leave
> > things as per the default, which *will* enable reserved va for 32-bit guests on 64-bit hosts.
> >
> > The only remaining question is whether we diagnose this oddness or silently accept it.  It
> > feels like someone playing with options they don't actually understand and an error is
> > warranted.
>
> I'm pretty sure I've issued the advice "turn off the reserved
> area stuff with -R 0" in the past, for working around various
> QEMU bugs where it wasn't able to allocate the whole reserved
> area it wanted to but the guest program didn't actually care.

It looks like we (inadvertently) broke "-R 0 means turn off"
in 2019 with commit dc18baaef36d95e5; prior to that the
64-on-32 default was set by the initial value of the global
variable and could be overridden on the command line. After
that we ended up doing the default-value stuff after the
command line was parsed instead.

thanks
-- PMM

