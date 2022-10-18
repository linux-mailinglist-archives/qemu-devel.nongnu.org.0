Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE11B6028E3
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 11:58:58 +0200 (CEST)
Received: from localhost ([::1]:44736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okjNA-00056H-GN
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 05:58:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1okivn-0005Yd-9l
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 05:30:43 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:35726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1okivh-0003s8-57
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 05:30:39 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 a6-20020a17090abe0600b0020d7c0c6650so16829564pjs.0
 for <qemu-devel@nongnu.org>; Tue, 18 Oct 2022 02:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RjZ8qpzcsNOY2uGQvEZckZZxK9PtlazrNzf17mHe2lw=;
 b=yCv+MTONgSbKC9JDOuQZltCdl8dUOdAAyRPT5IAsjOr/gi4FFRxGwv4yUS4AE+u6Ui
 7Q0AVOAcPLAQCGE4fKWp9CPSuchA9EvHs4OxMnyKXXFrhbJVeIBjVP9NBELQrRnunhZA
 EFcox0mYtHIbKAkZ7xXXFAooFb/pGNoDfUWhJB6EBjX3nq9G06O20g7o4h0oAsz7gs3Q
 awB3Nd93s0DiOt3g6lEXeyLSiGEmk1cpzA5q7ptcGyZp9TshY7tdE3bA1SMM0EG8AxN/
 1UCq+7Ak2uPg2ySo6m9r4BU9ljttflhOpIT7zWCw+Tjw64k1s0JmR3zWvmvOZzzjCxq4
 DcVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RjZ8qpzcsNOY2uGQvEZckZZxK9PtlazrNzf17mHe2lw=;
 b=MOo2MP/WP11lY5gDEzibJbPuZt8MF+fGyhg9WB8CF8GpO52tRMZeSJq/ijvqLkyS/n
 ySOufP5CL8kccp41QXrYY05/85PgrXx0of7RLqdHgUZC5LM3JfgUwoY1Z2/E7inxX0md
 aPkKOpMSHfJSkLNX8/vqxqB2evjWzbnpFw7+i2CJOUGV7Sa5rtjXTYkxL13C8jVdEwSy
 Lb7Sd0Ayk92JFRFv/MYR9pmFjgj5zMPPz0ARjcPH32RK3eflPj8gNzBRSsm+6tT2QsnA
 vj38YPojTsgXueh+QsxCLY6WUWSMIgWBMFRbTDyO8f7qkAqbSApSoSdL5i+ZGL8yasKr
 slhA==
X-Gm-Message-State: ACrzQf3URNrWsjYFFLsp89To41TdSvJH9bPynGGWO9fhYvLaJzSB4FOR
 +uGotqnTZH9rcvilyT1UjISrNYb9jUFOmQkugsW7Bg==
X-Google-Smtp-Source: AMsMyM4UkjxKeE5ouJdMZDLyAMtaaRI/LZMNd00Y2GKLteaJgCPIULZZascP9KndxGprZVNdvo+Kw+kxRY1jvbwvVgY=
X-Received: by 2002:a17:903:4d7:b0:178:8564:f754 with SMTP id
 jm23-20020a17090304d700b001788564f754mr2099819plb.60.1666085430198; Tue, 18
 Oct 2022 02:30:30 -0700 (PDT)
MIME-Version: 1.0
References: <20221015211025.16781-1-chrisfriedt@gmail.com>
 <20221017134425.jbqvtccg5w4yej5g@mozz.bu.edu>
 <CAFEAcA8Cc+XtwcQz3bJom2=MgYZgLHw8SO6uqQQdVN4aqpq4Hg@mail.gmail.com>
 <380c1527-e664-f7c5-6d18-bf53d99aed33@kernel.org> <87zgdtcwrv.fsf@linaro.org>
In-Reply-To: <87zgdtcwrv.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 Oct 2022 10:30:18 +0100
Message-ID: <CAFEAcA9ONenFfxz=78pMf8vXkHB+JwEORoMwhwEmbUTv_9Q7XA@mail.gmail.com>
Subject: Re: [v2] hw: misc: edu: fix 2 off-by-one errors
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Jiri Slaby <jirislaby@kernel.org>, Alexander Bulekov <alxndr@bu.edu>, 
 Chris Friedt <chrisfriedt@gmail.com>, cfriedt@meta.com, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 18 Oct 2022 at 10:21, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
>
> Jiri Slaby <jirislaby@kernel.org> writes:
>
> > On 17. 10. 22, 16:13, Peter Maydell wrote:
> >>   * for situations where the guest has misprogrammed the device,
> >>     log that with qemu_log_mask(LOG_GUEST_ERROR, ...)
> >>     and continue with whatever the real hardware would do, or
> >>     some reasonable choice if the h/w spec is vague
> >
> > As I wrote in the previous mail, can we stop the machine after the
> > print somehow, for example? So that the students have to "cont" in the
> > qemu console as an acknowledgment when this happens.
>
> You can bring the system to a halt with vm_stop(RUN_STATE_PAUSED) or
> possible RUN_STATE_DEBUG?

No, please don't do anything like that. This should not be special.
Just log a message if the guest does something bad. There are
an absolute ton of things that the guest can do wrong, and
in general QEMU does not attempt to be an "identify all the
ways the guest does something wrong in a friendly way" system.

thanks
-- PMM

