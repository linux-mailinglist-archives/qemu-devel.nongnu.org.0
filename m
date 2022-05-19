Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B7852CF84
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 11:37:19 +0200 (CEST)
Received: from localhost ([::1]:37770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrcas-0004s7-0X
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 05:37:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nrcXw-0003eD-DE
 for qemu-devel@nongnu.org; Thu, 19 May 2022 05:34:16 -0400
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f]:41791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nrcXu-0008Gs-IH
 for qemu-devel@nongnu.org; Thu, 19 May 2022 05:34:15 -0400
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-2ff53d86abbso31656537b3.8
 for <qemu-devel@nongnu.org>; Thu, 19 May 2022 02:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PMGgrPXDIAnHco6i1Bi3aGeA+ITZSvwwHbtGLNn8l6A=;
 b=VLrbeb7bA6mkEjEdwUz7ZVOX+KpTxh6ADPcn71AXiiuhuJ9UH0wRK3CzYsnhvkGyfh
 2r9D/ROBdbnqzHv3lCbmHsdBbEaczReopSg9s4WW7XrfN5IXKBl92Pu+EXqtNjnHOL87
 aHu9VCDtrALRL98WEbxfO+M1M83Jt3XD2cAGxLpbC3CC9UHm6/LJ/ZWOCb1UUtWnlN/Q
 pkrTLyLCPgzVrioMR+rbUbfpea1Y0sNtiBbhKRhJeFAtsPYirN3GA6Tmwdk5UnIP82xM
 n6MGmI2SdX+rG0+W7Nn7/edZXE5cNjJK9xdhoueSQY3jM/l+T4VF0CK1AAiVW0DtFslS
 8XhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PMGgrPXDIAnHco6i1Bi3aGeA+ITZSvwwHbtGLNn8l6A=;
 b=eW9gv98OqWS30IXYeTYSI94Q8ji7ABKofkxgNUxUVVWbz6QzB+30/WS6Ne2j8r5fOW
 8v/1sV3uNqcLVSxJ6mLibqcUdeyYAPTMaxERUiRj7oPtP4pFjD52aCiFGu65iMnPP7jP
 sFXqXw40kxmBStsQN/jNC+KbDwgdqsXQAYJW9UZhDeu2fvD4gLfXwjc+RyO6hXH2kmlB
 4CQyXscpcy8fR6fmjvT90wx8+OpYeN/2i4xFZ4CAZzRTPlusth8ikCPfxzWheRoHAfmy
 8IO7hSrfJ0E6/NfJ0eOHoQ58k8BKMICRn3P+1Bsi0yIgqAVwMIn9IGYN/Sfgi2lGTj3K
 C42w==
X-Gm-Message-State: AOAM533FIEpeiB+C/zs+a56xpQMmvBsQPPiZSQPG+sRp6fJ08pFKkTUe
 I+XkZ1mVLnQwqNpVS5PUDq9XYop+ygaDxcKmxbBhxw==
X-Google-Smtp-Source: ABdhPJx1CXgFyerRPkdPGlURfu04nVDBqxjL6SHHlYGDmnWtrXq9eJuh/iSW3U8wk+StECcR/PmBgQdMljgbMr9OTV4=
X-Received: by 2002:a0d:fc83:0:b0:2e5:b0f4:c125 with SMTP id
 m125-20020a0dfc83000000b002e5b0f4c125mr3734220ywf.347.1652952853135; Thu, 19
 May 2022 02:34:13 -0700 (PDT)
MIME-Version: 1.0
References: <CAFEAcA_X7d9-e+u3UpB5WvJrmJhhRKdw8EhUzCdFDNVfhFF8mg@mail.gmail.com>
 <2d9e3abd-99de-dc56-c6bd-93e54cd22b8e@redhat.com>
 <87zglee9w3.fsf@secure.mitica>
 <CAFEAcA8rxwMmWm_CnFMG7407h5pTdPeVJVG8bJC9uryUZHDd_w@mail.gmail.com>
In-Reply-To: <CAFEAcA8rxwMmWm_CnFMG7407h5pTdPeVJVG8bJC9uryUZHDd_w@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 May 2022 10:34:02 +0100
Message-ID: <CAFEAcA-q3hmbBc0nKY6bGh7S9WGBKjSWGbnPEy8pagvPyskOkw@mail.gmail.com>
Subject: Re: hang in migration-test (s390 host)
To: quintela@redhat.com
Cc: Laurent Vivier <lvivier@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 28 Apr 2022 at 16:08, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Fri, 25 Mar 2022 at 08:04, Juan Quintela <quintela@redhat.com> wrote:
> >
> > Laurent Vivier <lvivier@redhat.com> wrote:
> > > Perhaps Juan or Thomas can help too (added to cc)
> > >
> > > Is this a regression?
> > > It looks like a bug in QEMU as it doesn't move from cancelling to cancelled.
>
> I had a repeat of this hang (same machine), so here's the debug
> info I wasn't able to gather the first time round.

migration-test is still intermittently hanging on this machine.
Can we either:
 * add enough tracing and debug to this test that we can get
   logging from it to tell us what is failing
 * disable the test

please?

This is hampering the automated CI because gradually the CI
runner slots fill up with stuck jobs. (I don't know why the CI
runner is not killing the processes when the job itself times out.)

thanks
-- PMM

