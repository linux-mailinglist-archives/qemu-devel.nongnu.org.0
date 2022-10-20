Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F25605F37
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 13:46:27 +0200 (CEST)
Received: from localhost ([::1]:47864 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olU0H-0004D9-LT
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 07:46:25 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olTei-0003zJ-4L
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 07:24:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1olT95-0006JJ-EZ
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 06:51:44 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:35521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1olT93-000618-RC
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 06:51:27 -0400
Received: by mail-pg1-x52c.google.com with SMTP id u71so18879101pgd.2
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 03:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OcIrgwXOz/ka2cH0onCOCNLah9eeHV7BAPyxJPJc7Y8=;
 b=WytC4O6kmjNgNgyxtWGuBMdlVHkkd1GaGZd1tBRg00FBnXoHyKnHyD+rTR8FVkvBXo
 J4GhwQqXYzhWn0YXaCMywQkh7prFv2niEPT6LMd/9N6AIvKx2lNaov78mdKjMX8mxXjq
 +sxGMmIAH4t/ZkptiRhRR3w0TIIxBF1yAWm+d2qZc4S9OHCx2wmGmXakMWbFYl0OWe4n
 zMtoTCzUrlF9GJmIPyQXkcsZUL06kqvpzqblGK1NmE36nT2eBl/NoG35HMpUftSldzJ+
 YjI8UXwFwtAC1b2JXA8CXsoZYEIWMe9x28e11lBZdRcENCnB9xvM928mYY2fPd9F3mLd
 YlXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OcIrgwXOz/ka2cH0onCOCNLah9eeHV7BAPyxJPJc7Y8=;
 b=0tGCb8D/1ERAUMCqXGZ2hRZgoeJrrfvZmGlRcdSpDcqZUmWHTDKrv0TrTE6ytVxlf8
 F53IR1e4Qy51YLpJE6kTZo0RunAeMQoHSHdv36Of8+HO/CckrcpPC9WS5TzcXumiY1+I
 kJhBQKOtNw9GMOfYMViwmXubtSb5jA6Vy6BRtVZxq9tD8LQQW7+PxukY3jPR4nFQhm0J
 1ECVMStSqvmbwiOKFmwEdikOw5E302o+8X8siSqRrNgfvwWbYa6TFJ5HxxqfUxep67mY
 hLccZCsOQ0Ga6AyfjJAIzhqNl311J3tsl9Av39VQ9enugczVkYvNuGSHe56FvjhL4Wtv
 f4yA==
X-Gm-Message-State: ACrzQf2fhY/feUw7bDMXliG4+qCOlyqnmrt9utOx19geksLnmLiwujK5
 ihim5hjLvDh1dMISE1mvWvAARcLvlIu/Bb6/Kf7jQw==
X-Google-Smtp-Source: AMsMyM7Y0JkMwzn+B0yPhhCwN5Ltq2+bNKyn29YCKv8YqVsixRWeg7SfeB7n+HsfGMFtz7uIJH/U2pmwGjQg5ccIi/s=
X-Received: by 2002:a05:6a00:1595:b0:563:8fb6:ae53 with SMTP id
 u21-20020a056a00159500b005638fb6ae53mr13372866pfk.51.1666263084103; Thu, 20
 Oct 2022 03:51:24 -0700 (PDT)
MIME-Version: 1.0
References: <20221012121152.1179051-1-alex.bennee@linaro.org>
 <20221012121152.1179051-2-alex.bennee@linaro.org>
 <222c561c-4771-c3ae-6749-5c0f4ea4c6ef@ilande.co.uk>
 <871qrasl7e.fsf@pond.sub.org> <874jw6o7k1.fsf@linaro.org>
In-Reply-To: <874jw6o7k1.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 20 Oct 2022 11:51:11 +0100
Message-ID: <CAFEAcA-XV3oTmjKb9prXZ4XmJT8Tis28o=hS7QEhKp5XwutKQw@mail.gmail.com>
Subject: Re: [RFC PATCH 1/4] docs/devel: add a maintainers section to
 development process
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Markus Armbruster <armbru@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
 qemu-devel@nongnu.org, pbonzini@redhat.com, stefanha@redhat.com, 
 agraf@csgraf.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52c.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 14 Oct 2022 at 14:31, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
>
> Markus Armbruster <armbru@redhat.com> writes:
>
> > Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk> writes:
> >
> >> On 12/10/2022 13:11, Alex Benn=C3=A9e wrote:
> >
> > [...]
> >
> >>> +Becoming a maintainer
> >>> +---------------------
> >>> +
> >>> +Maintainers are volunteers who put themselves forward to keep an eye
> >>> +on an area of code. They are generally accepted by the community to
> >
> > Do you mean "expected by the community"?
>
> Well I was trying to make clear how the "community" decides who should
> be a maintainer. We don't leave it to who's currently holding the merge
> keys so in practice its other contributors acknowledging that the
> proposed maintainer knows their stuff (or at least didn't step backwards
> fast enough when the call went out).

I think there are also two parts or stages to this:
 (1) is there somebody who's agreed to review patches, look at
     incoming bugs, etc for a particular bit of the code and
     is probably the 'local expert' on it?
 (2) who is accumulating these patches and eventually sending
     a pull request?

For a lot of the smaller sub-areas of QEMU (e.g. specific board
types or specific devices) these might be two different people.
And we might trust somebody to be able to do code review and
patch triage but prefer the patches to flow through the tree
of some other maintainer who's more experienced with sending
pull requests.

-- PMM

