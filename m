Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F86230F26
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jul 2020 18:24:40 +0200 (CEST)
Received: from localhost ([::1]:38058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k0SP9-0004ui-6p
	for lists+qemu-devel@lfdr.de; Tue, 28 Jul 2020 12:24:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k0SOL-0004Ar-Oy
 for qemu-devel@nongnu.org; Tue, 28 Jul 2020 12:23:49 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:43859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k0SOK-0002oH-0T
 for qemu-devel@nongnu.org; Tue, 28 Jul 2020 12:23:49 -0400
Received: by mail-ot1-x344.google.com with SMTP id r21so4781878ota.10
 for <qemu-devel@nongnu.org>; Tue, 28 Jul 2020 09:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=7cv4AUL/fnzDoJOpUl1vW/Sj05yw/1Tgv9JYL89+o8Y=;
 b=q5wcqq0Hj9J+x2ijuuNXnGwfwVpss6RK+HferqcAkUbfmMf8g2yIqke/D7K9JxYRX+
 /Po90OAYqlQd3R5AnR6EwwDbCiNPPJ3SW5X3rnUuO20MLudHwdbyFlADWigrDcG70Oeg
 w7fpPuJFSRuD4eCOKhLnh57csRucMlBqWm30W4d7NOYEppDU1E2QYRffxW3pe4de4N24
 3WY1wptzlgYRt2SiDLz50jUlhTgwJAtXLvhyMS27qJ3u/0wjYv2IffrjI17SZsZfl466
 bkSdryRYgadMidk8zFaHObtD43Gdh+Vq9BaiKSTofrP0kfA5BvbkYzDv3mxgdSx+LpzI
 c2Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7cv4AUL/fnzDoJOpUl1vW/Sj05yw/1Tgv9JYL89+o8Y=;
 b=SRN9zDdHhqhvf1hNDEHwFd2g3BtV59T7D2NqbMv5nYTuYTQRZM+G74HCecGH8JFzcg
 lKnJNCCD0TMR8qolA61x2am/jtqBjtzt/Z8fLz5UyfLEo9GqgEM/0X/Y6uryiMsGD5C5
 Rzh/hFf+Rh/KFmYBBG7cLhj8d5hHzJWwpDhSgYk8iqCr8/nC3g2Vkd6r4REN7xPRSOJl
 sonRlzofQhFRrkT47NMDs4TEC9rqkBRCoPFx9qbkok2IrJkYmqDwKHxOb3SqvgAFmN2T
 HJ25dyz47U9ixzvTeOsb7GlfnjRgKNTx/920WWzyKoLLI1UOQzckLypHCAcUg8Lxnbre
 HIlA==
X-Gm-Message-State: AOAM532rIy94diFwqHlTnBp00A+CV1fXO65uWWe0LpJI9wQlrciputOj
 ieDLh39mwBFpdgl8Fljpevo2hIV97qodOgmeDkqWzw==
X-Google-Smtp-Source: ABdhPJxpG7KR7SpnqBcjIwEsY5ZmHPyaAmFvZAiORyl19n+yV1+/2J6/lYctcZzsP4RE2kzxI1nGyUg/ie1oGw6/r48=
X-Received: by 2002:a05:6830:10ce:: with SMTP id
 z14mr25778481oto.135.1595953426552; 
 Tue, 28 Jul 2020 09:23:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200728141005.28664-1-alex.bennee@linaro.org>
 <20200728141005.28664-3-alex.bennee@linaro.org>
 <CAFEAcA_MT8U6uUYhNVDc1-AkxPPL22pBevNDSbB2ZwQQ94OPmw@mail.gmail.com>
 <87lfj339i5.fsf@linaro.org>
In-Reply-To: <87lfj339i5.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Jul 2020 17:23:35 +0100
Message-ID: <CAFEAcA-DzMVz=4MnMtOOyzi-_i1J=-8z1JBg3M6n1Tov68eV8A@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] target/arm: only set the nexttick timer if !ISTATUS
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::344;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Igor R <boost.lists@gmail.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Victor CLEMENT <victor.clement@openwide.fr>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 Pavel Dovgaluk <pavel.dovgaluk@ispras.ru>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 28 Jul 2020 at 17:11, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > On Tue, 28 Jul 2020 at 15:10, Alex Benn=C3=A9e <alex.bennee@linaro.org>=
 wrote:
> >>
> >> Otherwise we have an unfortunate interaction with -count sleep=3Doff
> >> which means we fast forward time when we don't need to. The easiest
> >> way to trigger it was to attach to the gdbstub and place a break point
> >> at the timers IRQ routine. Once the timer fired setting the next event
> >> at INT_MAX then qemu_start_warp_timer would skip to the end.
> >>
> >> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> >> ---

> >>          if (istatus) {
> >> -            /* Next transition is when count rolls back over to zero =
*/
> >> -            nexttick =3D UINT64_MAX;
> >> +            /*
> >> +             * The IRQ status of the timer will persist until:
> >> +             *   - CVAL is changed or
> >> +             *   - ENABLE is changed
> >> +             *
> >> +             * There is no point re-arming the timer for some far
> >> +             * flung future - currently it just is.
> >> +             */
> >> +            timer_del(cpu->gt_timer[timeridx]);
> >
> > Why do we delete the timer for this case of "next time we need to
> > know is massively in the future"...
>
> It's not really - it's happening now and it will continue to happen
> until the IRQ is serviced or we change the CVAL at which point we can
> calculate the next time we need it.

It is far-future: the counter can roll all the way round and back over
to zero, as the old comment states. (Other reasons for things to change
get handled via other code paths: it's only the "at some defined time
in the future a change happens" cases that we need to set a timer for).
It's the same situation as below, I think (though I don't know why we
used UINT64_MAX for one and INT64_MAX for the other).

-- PMM

