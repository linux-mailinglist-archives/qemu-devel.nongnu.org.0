Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B873322DC
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 11:21:37 +0100 (CET)
Received: from localhost ([::1]:35946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJZUf-0005vt-27
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 05:21:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJZTX-0005PV-Fw
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 05:20:27 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:37832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJZTV-00018z-KX
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 05:20:27 -0500
Received: by mail-ej1-x62e.google.com with SMTP id bm21so26295251ejb.4
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 02:20:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=mU5fOuFa0asJ8/RqiN8lVAPTh0kpPR9/MXoDY9LeyHk=;
 b=hmR0Emnukv3Qle3tac0EDMCsbPtDvOVCu3BruGWDk6FOKH51aAO1rfMs+8r4xhxXgC
 9etHA7WXjz2PGzyaIaD30qUTul0WJ+v5liU9Lhep+tlFaDMs7vcIHE01wlAHJjp1pLb0
 HjAACEWXpF76e9ZRR8UwxwSPInEMb6vZe/yDWMSiCUd8Wr0Hot0myV5YMJh7fqrEY+mX
 0J4znxigulqCGHLh5VTOUDrGcwusVx4f7TZxIEvuMxPnjiFIua5Bf9RXasRolg+tJ/h5
 7nxN4lqUHf7TOwNG0dKTFNO6JmFLcILHcN6/uIb+OW+HWZrGBvMJCSl5zwCtLFQ4U4KO
 TFmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=mU5fOuFa0asJ8/RqiN8lVAPTh0kpPR9/MXoDY9LeyHk=;
 b=CBjMQOlhEFxyfsnQaEjRzWx/pt3tYQdOVUFA8r4GRZQL0Luw0BV4u8cxtOlT3U5QyX
 3NRH6mxho+5vIIvc+sLEhFIsVQ34FsA9Ow6akk1+BXtaM+zB/7f02Kjt9vMJ4IY3uCrU
 hwReys88y96q87G5Yl9MFLxT1B6CNXwZ4Rgtv5F3DfmlNkrNKexkdALmt3djS2ou+j73
 QZUexN+QTk61qX8cZtwh1TKD4F3wjibeTkIjBYLqsJP124o8Ntu/hAdBuIPPnRu0y5YZ
 h2xe8kAWS1GAVGYCv38Dpwe//S6IIf2W8l47Vu3umgf1Expl6q6JSDtaDF2Pe3Ivjimb
 s+nA==
X-Gm-Message-State: AOAM530rrUkfcZhLjZtYgJalNVSfHq6oHJ/BYqfmyqawivskJvzb1f22
 4FxFFC9IgY7bDz8tX+ahmJP8MdRZlKGYr2cn17YUSg==
X-Google-Smtp-Source: ABdhPJxPI6/02NA2C2URvt6N/CcW5tUaanj295wfDsb175OGHpFuvt7IgBI5KqIvDDwaDlUL4KY+sOn0VnccFedaZu8=
X-Received: by 2002:a17:906:8a65:: with SMTP id
 hy5mr19918109ejc.250.1615285224048; 
 Tue, 09 Mar 2021 02:20:24 -0800 (PST)
MIME-Version: 1.0
References: <20210309032637.41778-1-j@getutm.app> <YEdBce6TWCVpSph9@redhat.com>
 <CA+E+eSBt5sq08zfxLOZKNQd=A3q=9YLEt0moipTb7j+OGWyuRg@mail.gmail.com>
In-Reply-To: <CA+E+eSBt5sq08zfxLOZKNQd=A3q=9YLEt0moipTb7j+OGWyuRg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Mar 2021 10:20:07 +0000
Message-ID: <CAFEAcA__kgr8=g1X87RAaMax9zs00mefCvqrfH4TzfU6oTaowA@mail.gmail.com>
Subject: Re: [PATCH] coroutine: add libucontext as external library
To: Joelle van Dyne <j@getutm.app>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62e.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 9 Mar 2021 at 09:59, Joelle van Dyne <j@getutm.app> wrote:
>
> On Tue, Mar 9, 2021 at 1:36 AM Daniel P. Berrang=C3=A9 <berrange@redhat.c=
om> wrote:
> > The README here:
> >
> >   https://github.com/kaniini/libucontext
> >
> > indicates that it is intentionally limiting what registers it saves
> > and restores, explicitly excluding FPU.
> >
> > Peter & Paolo expressed concern about this, indicating FPU reg support
> > was a requirement for QEMU:
> >
> >    https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg05525.html
> >
> Does it make a difference if this is provided as an option and not as
> a replacement? Would it make sense to add some warning at configure
> time? Right now none of the concurrency backends are supported on iOS
> and it's possible support will go away on macOS as well in the future.
> QEMU would not be able to run at all.

We don't currently support iOS; if we add it we definitely don't
want to add it as a "we know this has buggy coroutine support"
target, because that's a path to weird hard-to-diagnose bugs.
Right now macOS works fine without libucontext; if we ever do need
to use libucontext on macOS in future we'd want to get the FPU
support etc fixed first.

Adding FPU handling for aarch64 to libucontext should not be too
difficult (because the FPU is guaranteed to exist you don't need to
do the hardware capability detection the README talks about).

thanks
-- PMM

