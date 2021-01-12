Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 464942F3C21
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 23:06:55 +0100 (CET)
Received: from localhost ([::1]:42672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzRoU-0003bF-Cv
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 17:06:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1kzRnZ-00039R-DM
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 17:05:57 -0500
Received: from mail-io1-f44.google.com ([209.85.166.44]:39430)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1kzRnX-00052y-Oj
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 17:05:57 -0500
Received: by mail-io1-f44.google.com with SMTP id d9so7434515iob.6
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 14:05:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UrledCjrYL0BABfb1BqEwSb1c7JUh4+/WBvNhIsfoaU=;
 b=hVT1Wo6BFEbFR2w5Gd0pVvShccJmOvpt47uM1CfzVgIZme7ZSnWBWNPCHzRT7roLBr
 IGxztLqwqOLN/saJU+AmvPMvcwGcdNh0P+W+ztKcGZMDkRtN20hHBhLMEUvAYtuXbry5
 hinIJfFxq1JWRkgw5QF6tSY475t2wG/5iwWYmxPdhiKocelu8eHuzkNI96x53tHryAQq
 YOaEmelsq+1ysC7ITd42X84zu3NjNrdrl6aJPG+vjdVSuIxz++cKjMQsupbWVDuyUee9
 oxtadERSz68wdtpm4180Te7/P5YohDF+n2KV8I9RVXOsg6r8j44OBVY4mA6Z6ovguTuH
 1UYQ==
X-Gm-Message-State: AOAM533IYII/q6YNW9jallNNHEtWVBcQqXvqB9LUsT/f/INj2wQ7IO5X
 Y7hzO2eUPCFXR1N+fJdpi0n/h1l6puw=
X-Google-Smtp-Source: ABdhPJzWxsfo10ZRGKJGpwUHDSsdkksbE/Xa5IFSo3r7DWoTrsi70idt43fEIR6AiDmnIqx4O6fHQw==
X-Received: by 2002:a92:4089:: with SMTP id d9mr1175563ill.199.1610489154273; 
 Tue, 12 Jan 2021 14:05:54 -0800 (PST)
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com.
 [209.85.166.42])
 by smtp.gmail.com with ESMTPSA id 11sm33319ilq.88.2021.01.12.14.05.53
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Jan 2021 14:05:54 -0800 (PST)
Received: by mail-io1-f42.google.com with SMTP id q137so7430506iod.9
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 14:05:53 -0800 (PST)
X-Received: by 2002:a05:6638:39a:: with SMTP id
 y26mr1502498jap.14.1610489153637; 
 Tue, 12 Jan 2021 14:05:53 -0800 (PST)
MIME-Version: 1.0
References: <20210105022055.12113-1-j@getutm.app>
 <CAFEAcA-w5iCXJ0QwdvfZ6f3tyVRusKmCeAKRrAyaO-Dg3KK1cg@mail.gmail.com>
In-Reply-To: <CAFEAcA-w5iCXJ0QwdvfZ6f3tyVRusKmCeAKRrAyaO-Dg3KK1cg@mail.gmail.com>
From: Joelle van Dyne <j@getutm.app>
Date: Tue, 12 Jan 2021 14:05:42 -0800
X-Gmail-Original-Message-ID: <CA+E+eSAa5WJ8kuijtV33fkUeqgu02UH0S56VwgCi9P+dnoZOqw@mail.gmail.com>
Message-ID: <CA+E+eSAa5WJ8kuijtV33fkUeqgu02UH0S56VwgCi9P+dnoZOqw@mail.gmail.com>
Subject: Re: [PATCH v6 0/7] iOS and Apple Silicon host support
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=209.85.166.44; envelope-from=osy86dev@gmail.com;
 helo=mail-io1-f44.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

After decoupling the MAP_JIT and APRR patches, this should only be for
iOS support. I didn't change the title because I didn't know if
patchew would be smart enough to group it with the older patches.

-j

On Tue, Jan 12, 2021 at 3:01 AM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Tue, 5 Jan 2021 at 02:23, Joelle van Dyne <j@getutm.app> wrote:
> >
> > Based-on: 20201214140314.18544-1-richard.henderson@linaro.org
> > ([PATCH v4 00/43] Mirror map JIT memory for TCG)
> >
> > These set of changes brings QEMU TCG to iOS devices and future Apple Silicon
> > devices. They were originally developed last year and have been working in the
> > UTM app. Recently, we ported the changes to master, re-wrote a lot of the build
> > script changes for meson, and broke up the patches into more distinct units.
> >
> > A summary of the changes:
> >
> > * `CONFIG_IOS` defined when building for iOS and iOS specific changes (as well
> >   as unsupported code) are gated behind it.
> > * A new dependency, libucontext is added since iOS does not have native ucontext
> >   and broken support for sigaltstack. libucontext is available as a new option
> >   for coroutine backend.
> >
> > Since v6:
> >
> > * Dropped the Apple Silicon JIT support patch (superseded by another patchset)
> > * Changed libucontext to be a Meson subproject
> > * Cache availablity check for preadv/pwritev on macOS 11 and iOS 14
>
> So is this series now purely iOS support, or are there still
> some pieces of it that are needed for Mac systems with Apple silicon ?
>
> thanks
> -- PMM

