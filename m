Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67322338600
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 07:37:29 +0100 (CET)
Received: from localhost ([::1]:41648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKbQO-0006y3-Cc
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 01:37:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1lKbMT-0004vQ-JJ; Fri, 12 Mar 2021 01:33:25 -0500
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736]:44770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1lKbMP-0007lM-Hb; Fri, 12 Mar 2021 01:33:23 -0500
Received: by mail-qk1-x736.google.com with SMTP id 130so23258404qkh.11;
 Thu, 11 Mar 2021 22:33:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=51MDElGIrd0gOlrw0iLGZfFcICmNZ9NXvYc8V3cZNZE=;
 b=GamGiyYCwWgPnNyp8jg/1x2zTAHWXJ+OpZ/rGaH5W3OQnm1nKTZViTFc9P5SQhDBHC
 SDsumfW6rXeeyAEDdG9VpgYcYIwCvKcOjhkZb5+D3/wsNCtE6MWLMm4UI0OPrBtidSFF
 djTJAyjl/Ozn13y3N+u/AT9okqqbZOAaBbi1o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=51MDElGIrd0gOlrw0iLGZfFcICmNZ9NXvYc8V3cZNZE=;
 b=mIq2fkkLRXpp835CEcVSQ9uIMfwqiMfI3BgOqSc1xeBmcY35uyavKYb4GBdE2606Dr
 kxC9HkbA4RmteGDkbeJaiPTeutCFPwb4sXokZ/j/X3MVBXDvUN8If6bqRNyvnKuFvRsA
 pNhao6q5/o4NgDm5n2U7nQ3KXxgHytEpQnvsX88KzXrmoR65w0Rqx94O66f+xxZNn1Ck
 ibbZOlzRi2U3aIU99JISKwC5xA/sWKf1N+tBuy+COOeva+zgGkdXCYhap3HhZeq8F4tj
 rzyBzEQWVmSnQDSgT8huNTRAjoP+yE7J116Z3AmIB3Ma1NpNH6u5Gtv7h2dyS4AWJcya
 DbDw==
X-Gm-Message-State: AOAM530MY8qFo5N81iGacvzU0DB+p9EJQ/udi/a6NTivGpFZAG+PyoeY
 tTM9IiwW/92ns0z5wya4CYPiVY/sntfvF1dxpYo=
X-Google-Smtp-Source: ABdhPJwVI0BZNc6Gt8kiEq9MfOTx0aQxC55+oJrxazSkD/eUvkvx0qWQSI0MUplOlYg9odf3ZGUFiCJvGKVj7um+mO8=
X-Received: by 2002:a05:620a:4055:: with SMTP id
 i21mr11237475qko.55.1615530796929; 
 Thu, 11 Mar 2021 22:33:16 -0800 (PST)
MIME-Version: 1.0
References: <20210311234726.437676-1-joel@jms.id.au>
 <20210311234726.437676-4-joel@jms.id.au>
 <ee8d96c5-fc66-79f5-7ac7-f3bb443eb724@redhat.com>
In-Reply-To: <ee8d96c5-fc66-79f5-7ac7-f3bb443eb724@redhat.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 12 Mar 2021 06:33:04 +0000
Message-ID: <CACPK8XcDmchL_UX=RoyC88+QJj3e3wi_QrLjEfh_S3jpNDbCnA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] tests/qtest: Add test for Aspeed HACE
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::736;
 envelope-from=joel.stan@gmail.com; helo=mail-qk1-x736.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 12 Mar 2021 at 05:53, Thomas Huth <thuth@redhat.com> wrote:
>
> On 12/03/2021 00.47, Joel Stanley wrote:
> > This adds a test for the Aspeed Hash and Crypto (HACE) engine. It tests
> > the currently implemented behavior of the hash functionality.
> >
> > The tests are similar, but are cut/pasted instead of broken out into a
> > common function so the assert machinery produces useful output when a
> > test fails.
> >
> > Signed-off-by: Joel Stanley <joel@jms.id.au>
> > ---
> >   tests/qtest/aspeed_hace-test.c | 215 +++++++++++++++++++++++++++++++++
> >   MAINTAINERS                    |   1 +
> >   tests/qtest/meson.build        |   3 +
> >   3 files changed, 219 insertions(+)
> >   create mode 100644 tests/qtest/aspeed_hace-test.c
> >
> > diff --git a/tests/qtest/aspeed_hace-test.c b/tests/qtest/aspeed_hace-test.c
> > new file mode 100644
> > index 000000000000..52501ee37afb
> > --- /dev/null
> > +++ b/tests/qtest/aspeed_hace-test.c
> > @@ -0,0 +1,215 @@
> > +/*
> > + * QTest testcase for the ASPEED Hash and Crypto Engine
> > + *
> > + * SPDX-License-Identifier: GPL-2.0-or-later
> > + * Copyright 2021 IBM Corp.
> > + */
> > +
> > +#include "qemu/osdep.h"
> > +
> > +#include "libqtest-single.h"
>
> Bonus points for writing the test without "libqtest-single.h" and using only
> "libqtest.h" instead. We should try to avoid libqtest-single.h in new code
> since such code can not be shared with tests that run multiple instances of
> QEMU. But if it's too cumbersome, I do not insist.

This wasn't too hard, so I went ahead and did it. I'll send a new version.

>
> > diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> > index 2688e1bfad7f..2eec06b10094 100644
> > --- a/tests/qtest/meson.build
> > +++ b/tests/qtest/meson.build
> > @@ -156,12 +156,15 @@ qtests_npcm7xx = \
> >      'npcm7xx_timer-test',
> >      'npcm7xx_watchdog_timer-test'] + \
> >      (slirp.found() ? ['npcm7xx_emc-test'] : [])
> > +qtests_aspeed = \
> > +  ['aspeed_hace-test']
>
> Do you plan to add more aspeed tests later? If not, I think you could simply
> do it without this variable and use ['aspeed_hace-test'] below.

I intend on sending more, but they are not ready yet. I will leave it
like this in readiness for those future tests if that's okay.

Thanks for the review.

Cheers,

Joel

