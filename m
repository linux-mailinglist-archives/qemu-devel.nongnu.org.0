Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E836740C52B
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 14:25:27 +0200 (CEST)
Received: from localhost ([::1]:58258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQTyf-00039j-Ku
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 08:25:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQTwi-0001sl-Kt
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 08:23:24 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:34321)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQTwh-000720-2o
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 08:23:24 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 v20-20020a1cf714000000b002e71f4d2026so3786439wmh.1
 for <qemu-devel@nongnu.org>; Wed, 15 Sep 2021 05:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=y9ViHXe9SjCt7+7+1e28LYSliYi566e74gEbSUwtPnM=;
 b=dAQt1qGx9oU7+jKdVxABc8MIynggElG1yMCxRS+crGBIDvCzAmapzvV3aMg4dGx9/2
 jZlVpCQBNM1NMcBAh05F7ZLKEpwJlJr/lOnZpOUmJa6lNS/FuXq75GcOVBHKMv0CcKnE
 EpmCoBRR/L0o3sqCF5F/fagDQdUgBOxduRbP1sFxtKNqtmLFYN/eD6d2cGapg6CHHkMf
 zoanqlrLqjoYdha9BjUqTSTns9rApQS/7f8S/BFFpTH6TqmOkARwRVOCvAwWpHBCusv9
 zVQnGejFUoyhyWzuA7gdWsO9a0ueOqUeD5yOEWdeufykh/HeOWLzpNtvD8xFkEVHYRAm
 kgfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=y9ViHXe9SjCt7+7+1e28LYSliYi566e74gEbSUwtPnM=;
 b=7P2mK7bI0KVWa3ZW3rJprjXUuUjQBeauHx3hNOGFL91RX091uVctax9Kc70h9eVtbS
 zidn735cJcCipmADBKixzs0I7zrI0z3CGsWBLibKEbhjyXWImB6TQtMCpbHuHtZIK4Vl
 FwpCVYzBSxMttn6fxD+hSLOeV4px83O5agqrmbO8+S9asKdC1Exhky3FnrYMbrhp4j3n
 w7SrLK0RABOHC9pNBdh7SGtN0+NEOUwyxEAokWXKT25en2VLLem80pPIRKbkLh2oEnbO
 ENbMnAuvIW/wH/mM7V1O5X5AXpFdFVZk6Ge1AkeIRQdC3ysaXw8crPxksMxA0KUnIHzk
 KIJQ==
X-Gm-Message-State: AOAM532PVWD31rMR0TwnmQzy0jS5WHgYz5+uoXh8dPSmb1ZtzDiEXKPf
 xfrrhp//9eX8JLpRczRUHkhbFS6HwiKuJDY5vdO2Jg==
X-Google-Smtp-Source: ABdhPJzrjkH/RL7kHcbliC0vPEsC9A7Zg0VxjkyC7obj+/c5XJIkIv555iP/2HE84gjrb64d9Cq72ib7hlJQfGqfrP0=
X-Received: by 2002:a05:600c:2259:: with SMTP id
 a25mr4120563wmm.133.1631708601029; 
 Wed, 15 Sep 2021 05:23:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210913101948.12600-1-peter.maydell@linaro.org>
 <CAFEAcA86yjW8oeif4tY7WWzGfXYYV0VuqY+4RV9f_NqAApeeeg@mail.gmail.com>
 <YUGu1PbzB+pzZdjf@redhat.com>
 <CAFEAcA9CjgNrGJN2t40PJW6ZO-fP9R0senq4_G_h_8pmjH5n9Q@mail.gmail.com>
 <YUHkIOhcV4Z4Iv1P@redhat.com>
In-Reply-To: <YUHkIOhcV4Z4Iv1P@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 15 Sep 2021 13:22:30 +0100
Message-ID: <CAFEAcA_hB08F2rjxkk81yYpC7+BK838ib9rJ2=yF-DM68ffc_w@mail.gmail.com>
Subject: Re: [PATCH] gitlab-ci: Make more custom runner jobs manual, and don't
 allow failure
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 15 Sept 2021 at 13:16, Daniel P. Berrang=C3=A9 <berrange@redhat.com=
> wrote:
>
> On Wed, Sep 15, 2021 at 01:12:23PM +0100, Peter Maydell wrote:
> > On Wed, 15 Sept 2021 at 09:29, Daniel P. Berrang=C3=A9 <berrange@redhat=
.com> wrote:
> > > Urgh, my bad, I completely forget this behaviour when reviewing.
> > > When we only have
> > >
> > >   when: manual
> > >
> > > then the job has to be manually started, and it still contributes
> > > to pipeline status, so it /must/ triggered manually.
> > >
> > > If we want it to be manually started and not contribute to the
> > > pipeline status we need:
> > >
> > >  rules:
> > >    ...
> > >    when: manual
> > >    allow_failure: true
> >
> > So there's no way to say "if it is triggered, then it must
> > not fail, but if it is not triggered, that's OK" ?
>
> Not that I've found.
>
> > I guess it's not a big deal either way though.
> > So the fix is to add back the allow_failure tag to those jobs
> > which are manual. I'll send a patch...
>
> Note "allow_failure" is allowed both at the top level of the job
> and inside the "rules:". I find it clearer if we put it against
> the "rules:" section as shown above.

OK, I guess. That does mean that we end up with two allow_failure
lines for each of these jobs, though, beacuse they have two separate
if clauses in their rules.

-- PMM

