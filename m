Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E26030E5BC
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 23:09:31 +0100 (CET)
Received: from localhost ([::1]:43282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7QL3-00022c-By
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 17:09:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l7QJH-0001UJ-7U
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 17:07:39 -0500
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136]:34823)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l7QJF-0004Ce-ID
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 17:07:38 -0500
Received: by mail-lf1-x136.google.com with SMTP id u25so1501903lfc.2
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 14:07:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=scWsCyON/GrKRQxBaq7h64LE5KoXgVmiaw23bmvRVME=;
 b=rh1YlELpaWchtVzuBC++kKYoEJsEj9eZlprsb9kpRYiUfDJc7G9RjwjFaS4JBvAj2U
 dtGUNF0zg+bwSbBWOxxwugYEJi70Q6zpI6/ml7vGnFLue9x1GA9/16vChQ4JVEKIqjpp
 uLuBt5Q/fmAM/bQw7DGRnGpWpBUYJE1HHKKb/klWATyjHBtEUMx2IMuauW6SDzwFIlKG
 0Q386p8Ru1cf1T4WZPAljKj9gUMu4q3+0ndvPuqoVuu94yFR8S6+uC7FKYmlVNO5tg+S
 RR+xIbfY5LI1Kpt7FjopPUaUZYY+/UUKLxorQ+dzUOMLGZpgZzM0RSeT22ZCu38h16Pa
 BrQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=scWsCyON/GrKRQxBaq7h64LE5KoXgVmiaw23bmvRVME=;
 b=KS+9Lv+oSXTjYMxWPpxm8N9CED/h7TNl57/lsbI6/dXN52ne/m2BzvEJctCouWeSEN
 3fY3Hs2RnogffZP2OrFSRM7A8QJk2ZcqpYa0I+EFXthmxsGYpGeBF5pycp0V4h1vBJmL
 8iHBWK+tkqQddotFt+78+VlXPW3NaUQ6f7nAZqA4NBko8wP6rNukgyP8UNPHW0P0LsVS
 Cf3DGMry5SJgX1MEQqJEwU3pWLMVQByxxhYzW+SsCIsi9pSGJA2Jn+l83X+PMwGyT+T2
 +KWximBVtQ91gEBmerI+02AhGS9W9G14CLwot9ZHaF39lf7WOiyizWuIoTqAh6M46adE
 xY8A==
X-Gm-Message-State: AOAM533Wi+BTULjENJJFDJm1VqEGHxghvqr+deG8eftCga46nffPKXoh
 vaISuSdMP4zJfjd3ck2mqSEdOnWA1QZel7gNlv86YQ==
X-Google-Smtp-Source: ABdhPJzmqt2RhSzPkadgxb/5tLqkLiOisxshZzBBWL3geBuRbnZT6tPfJXFFH7PqmNi0CPklL9KTbKMip5HtgaA5Ss0=
X-Received: by 2002:a19:c3cc:: with SMTP id t195mr2896234lff.235.1612390055143; 
 Wed, 03 Feb 2021 14:07:35 -0800 (PST)
MIME-Version: 1.0
References: <20210201100903.17309-1-cfontana@suse.de>
 <87v9b9qe78.fsf@linaro.org>
 <76d623a9-90e3-31bc-5998-1e159fe25b04@suse.de>
In-Reply-To: <76d623a9-90e3-31bc-5998-1e159fe25b04@suse.de>
From: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Date: Wed, 3 Feb 2021 22:07:22 +0000
Message-ID: <CAHDbmO1yhjYt9qUU6a6Lo2-v9yXg+E=YJ8N0=mM+mbP99Vsk_Q@mail.gmail.com>
Subject: Re: [PATCH v15 00/23] i386 cleanup PART 2
To: Claudio Fontana <cfontana@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=alex.bennee@linaro.org; helo=mail-lf1-x136.google.com
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For patch 17 on onwards it was just seeing what the actual benefit of
the derived class was - I think I get it later on but you should
mention it up front.

I do think we need to address the ordering constraint in 21 - are we
introducing one or just formalising what has been created? If we are
introducing one then can we a) do it a better way with the structuring
of QOM or b) enforce it so new models don't run into unexpected bugs.

On Wed, 3 Feb 2021 at 17:10, Claudio Fontana <cfontana@suse.de> wrote:
>
> Hi Alex,
>
> thanks for your review,
>
> On 2/3/21 5:57 PM, Alex Benn=C3=A9e wrote:
> >
> > Claudio Fontana <cfontana@suse.de> writes:
> >
> > <snip>
> >
> > Final comments. I think overall this series is looking pretty good
> > although I got a bit lost at the end when we started expanding on the
> > AccelClass.
> > The main yuck was the start-up ordering constraint which
>
> To be sure, are you referring to tcg_accel_ops_init(), ie your comments t=
owards the end of PATCH 17?
>
> Ciao,
>
> Claudio
>
> > would be nice to remove or failing that catch with some asserts so weir=
d
> > bugs don't get introduced.
> >
> > Paolo, is it worth picking up some of the early patches to reduce the
> > patch delta going forward?
> >
>


--=20
Alex Benn=C3=A9e
KVM/QEMU Hacker for Linaro

