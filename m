Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D69301820
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jan 2021 21:03:07 +0100 (CET)
Received: from localhost ([::1]:33080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3P7i-0003SO-HI
	for lists+qemu-devel@lfdr.de; Sat, 23 Jan 2021 15:03:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1l3P5E-0001zz-0L; Sat, 23 Jan 2021 15:00:33 -0500
Received: from mail-io1-f48.google.com ([209.85.166.48]:44754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1l3P5C-0006IF-59; Sat, 23 Jan 2021 15:00:31 -0500
Received: by mail-io1-f48.google.com with SMTP id h11so18424364ioh.11;
 Sat, 23 Jan 2021 12:00:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pqtUKo7W68U8krtKjRpYREBn+CFLTpY/A4+UgEckqas=;
 b=PljrCM0TDyLOVSmkxs8MO+5ipRyDpdfd3guKoC9sokJQrrp9VFR/F6wTfV818aKdWw
 MsLZ698dcg2IjoChyicdn2PuyPXx1vQMXRxcm9g2WAqghemlRMgE2sZU6WGVv3EE9aTU
 mzctRZI/0cr4aHSxpXHccj9cBbZAyfbvkSarAOAS2h5gwHMUSamEScAE4HB6HAAQudhJ
 yl66juWnzfqUUsDtRDYzIHRBOpJdmOCj3thvB6KGqsnF617y4NJSAw4T+xaGMaarcGM2
 WW/p8eMfDNWcxAfoSLDoNDYbkJDCE36L+lJAvF4cXfdYIBjib5dfnXx2Cvk4cDJEwzuM
 uMxg==
X-Gm-Message-State: AOAM532QeJCUy5Jix0arT5Mtk2sewaSaBIrewwDCwz5vGtZvHrk8QXfB
 ZkPeMlQ7HXde+NTpijS5IER4G6Jl7dc=
X-Google-Smtp-Source: ABdhPJyTyABofMeLxl60H+l9Q/Aqdoq90kFipHQoxck7CfmsEdKBV1HCE/YfQ7BFYlFR8S1sHeKaIA==
X-Received: by 2002:a92:5bc2:: with SMTP id c63mr1472889ilg.142.1611432028237; 
 Sat, 23 Jan 2021 12:00:28 -0800 (PST)
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com.
 [209.85.166.50])
 by smtp.gmail.com with ESMTPSA id c10sm9015154ils.46.2021.01.23.12.00.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Jan 2021 12:00:27 -0800 (PST)
Received: by mail-io1-f50.google.com with SMTP id u8so5382795ior.13;
 Sat, 23 Jan 2021 12:00:27 -0800 (PST)
X-Received: by 2002:a05:6e02:1c2c:: with SMTP id
 m12mr106224ilh.173.1611432027408; 
 Sat, 23 Jan 2021 12:00:27 -0800 (PST)
MIME-Version: 1.0
References: <20210123045632.18482-1-j@getutm.app>
 <20210123045632.18482-10-j@getutm.app>
 <CAFEAcA-nxjUifZ8yb85KGAFnwwa10ZAdemxyH5YnetNLhVt8cA@mail.gmail.com>
In-Reply-To: <CAFEAcA-nxjUifZ8yb85KGAFnwwa10ZAdemxyH5YnetNLhVt8cA@mail.gmail.com>
From: Joelle van Dyne <j@getutm.app>
Date: Sat, 23 Jan 2021 12:00:16 -0800
X-Gmail-Original-Message-ID: <CA+E+eSB6JrEzN94DaehKByG2WrZ7NLsDBC4FrKSwZ_YyoLrjMQ@mail.gmail.com>
Message-ID: <CA+E+eSB6JrEzN94DaehKByG2WrZ7NLsDBC4FrKSwZ_YyoLrjMQ@mail.gmail.com>
Subject: Re: [PATCH v8 09/11] block: check availablity for preadv/pwritev on
 mac
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=209.85.166.48; envelope-from=osy86dev@gmail.com;
 helo=mail-io1-f48.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Joelle van Dyne <j@getutm.app>, "open list:raw" <qemu-block@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The problem here is that we would like to compile on macOS 11 and be
able to run the built binaries on macOS 10.15 or lower. Without the
runtime checks, you'll have a crash when calling preadv/pwritev.

-j

On Sat, Jan 23, 2021 at 5:53 AM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Sat, 23 Jan 2021 at 05:03, Joelle van Dyne <j@getutm.app> wrote:
> >
> > macOS 11/iOS 14 added preadv/pwritev APIs. Due to weak linking, configure
> > will succeed with CONFIG_PREADV even when targeting a lower OS version.
> > We therefore need to check at run time if we can actually use these APIs.
>
> If you make the preadv check be a meson.build has_function()
> test, I think (but have not tested) that it ought to correctly
> fail the link in the targeting-lower-OS-version case, because
> meson.build's has_function() implementation for clang
> https://github.com/mesonbuild/meson/blob/bad0e95caec4cf49165572df3cf2edc4832280fa/mesonbuild/compilers/mixins/clang.py#L89
> adds -Wl,-no-weak-imports when it's building the test-case
> exactly to force that linker visibility obeys the minimum
> version targets for OSX.
>
> If that works I think it would be neater than delaying the
> check to runtime (and it would also mean another test moved
> out of configure and into meson.build, which is the direction
> we're heading anyway).
>
> thanks
> -- PMM

