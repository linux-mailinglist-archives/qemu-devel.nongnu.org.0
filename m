Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E06A3C7247
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 16:34:44 +0200 (CEST)
Received: from localhost ([::1]:53240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3JUh-0005Tv-7T
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 10:34:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3JSZ-0002nB-Ac
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 10:32:31 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:46714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3JSW-0007k4-O3
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 10:32:31 -0400
Received: by mail-ej1-x635.google.com with SMTP id c17so41781929ejk.13
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 07:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Sq8mUItzMZI1pG9Crk91y4JzypA5pj/VhcwOgtZYA1E=;
 b=AkD5KLghbd8PFPfWfr9vWA+rEQXt5LOgZYKyruemQxLVyk+dIQ91IGoG9e6CtVYchQ
 gk2EhTHmbRsyq4vbZCDf7oAur4fm2ZWRa8f5x1myI14eZOb/XrZDuvhzg0kmFY53XdD8
 UNEageGKbaEfKjdlt7hA4nUecSaxJZlx9SFUg1ZTFC5LDH4KZ4cye51nSp1tdke3lcXF
 xN8Gs1GMpQ7Xg7uYoKhwlvoItNvKn9nGW0o6dMGwWnp0SXLu2w/CNOZfNtqe9HqX7NJK
 z72Z6GnVBXT9u9stWRXm4m6Vpp606mykk9TumB3h7RDLvclT/WKSWRMdBe1ExfqZj2H0
 7y8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Sq8mUItzMZI1pG9Crk91y4JzypA5pj/VhcwOgtZYA1E=;
 b=eKAHb8W3beGqt2xnUgH/n93nFprwiq3DbNkyN4cKuqgCbHTQn6mwTk5iSZX28i7h0l
 wojcGcY20njmkf5oC4EtTPfn/McH09RyScuS91KfugRTKGKAL6OLuc/7cQBBcQS7xEdb
 JU1o/BNzS4HX1Nc/URM9DJScpeV+X6ZIloIFHbBv/Hx1zjGziZ0dR3LP1rdXA5122old
 UI7lRLaWpkgSYAe/61tKd7BfKRgZ5xmCPGtY44y7HYIwEwqWRtsaMsjs5zGMojpSVLV5
 xnMQDxIfmPz5g/ScUe0XTff99sIedhnkASgJVtTZIYR97rpXuwvqp1+bCMoXS4cjdD+2
 FT4g==
X-Gm-Message-State: AOAM532aany1nI3K/aJaVDTOypoX56aRq0Q1pHn3w5I8lj3/GgoSdvZZ
 CPBU+LQI2WQ+Opf/dYIPkTmFvApq67MJdyYS9eZMriSY/Wz4CA==
X-Google-Smtp-Source: ABdhPJylQEIgY5uUrs/KjhcegEhQ4Xch8DtzwBr+yAhngWaLfy/q0jLOgtZyopyUFu95hvv1Fum9MimTMrHzYdT0DDI=
X-Received: by 2002:a17:906:a108:: with SMTP id
 t8mr5948647ejy.407.1626186747021; 
 Tue, 13 Jul 2021 07:32:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210705095547.15790-1-peter.maydell@linaro.org>
In-Reply-To: <20210705095547.15790-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Jul 2021 15:31:47 +0100
Message-ID: <CAFEAcA95SBrdx-Oob7CRuvspb47OgTWWzauNaEVJi1d1X8ePew@mail.gmail.com>
Subject: Re: [PATCH 0/7] docs: State QEMU version and license in all HTML
 footers
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
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
Cc: Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 5 Jul 2021 at 10:55, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> This patchset is an effort to fix something up which I promised
> Markus I would do after we got the initial conversion to Sphinx
> done. The old QAPI reference documentation noted the documentation
> license in the texinfo source (but not in the generated HTML or
> in the generated manpages); Sphinx generated docs currently don't.

> I'm open to suggestions on:
>  * name of the new top-level section
>  * text wording
>  * whether we need to have the version number in the footer
>    (it's already in the sidebar under the QEMU logo, but this
>    seemed a bit too inconspicious, so I added it to the footer
>    since I was messing with it anyway)
>
> You can find a built version of the docs at:
> https://pm215.gitlab.io/-/qemu/-/jobs/1399259647/artifacts/public/index.html
>
> I had a look at getting our manpages to also state the license,
> but this is tricky due to various deficiencies in Sphinx.
> (We never have stated the license in our manpages, so this isn't
> a regression compared to the old texinfo setup.)
>
> Markus: do you feel this series is sufficient that we can remove
> the TODO lines in docs/interop/qemu-ga-ref.rst,
> docs/interop/qemu-qmp-ref.rst and docs/interop/qemu-storage-daemon-qmp-ref.rst
> as now being done?

Ping for any further review/opinions, in particular from Markus.
I'm intending to put this in for 6.1.

thanks
-- PMM

