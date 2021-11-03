Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A694444170
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 13:25:21 +0100 (CET)
Received: from localhost ([::1]:36490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miFKS-000846-H8
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 08:25:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1miFF4-0004Oq-Vr
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 08:19:46 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:44849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1miFEy-00045X-Kj
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 08:19:46 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 c71-20020a1c9a4a000000b0032cdcc8cbafso1674723wme.3
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 05:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=zZw+UqrYu+T5qyr0aQNIoF3+xejjdRSQsomr9PXSHZA=;
 b=dG6dMxa2Iv3SgNmNQTV00vsxion3rQjS93Y4q6Fw4Lovs/d8me3AC1tjQYV1GYT1mO
 I4JU6veg2ZAH21XBABNMORosrgeiEc/K9yzMBdAzDjAkWhhPiaV1IuIgohXu5jqYFK8I
 EwBnbiLcfRMRysN61YtvbvgKzt010IQi7rU4eHpCEEI3gEiA21sPrQxZcb/g5x2vfhx6
 a2URQqMfu/n0j4W/9HQYsJgqzLSCpg1pE39V/csWa0kBZpCvGvPewE6cJR+PbigLQH6H
 RKEc2tsWIN025YkXSCXih1OCOuxzcki74kw3iBgfqibyd2W5bfY0Jh82Si91H2OxfYB0
 wsIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=zZw+UqrYu+T5qyr0aQNIoF3+xejjdRSQsomr9PXSHZA=;
 b=uIXUpFYrnOu/WMeIqqze/agFWFygiOlyuZl8wU3+t9SoytVS09ZSyTaGa+oQ9tt8h6
 xcuks1XBJguyVqRKTuCLhVmcHSKGGdf7KTaAAwXD9RRapDthkUMC0oMPYE21UzONv9O6
 XvWy0gqZuV2RqYWnbIhAPsdYiQTLmjSjrvPK61jotGCyy60BDfpa3F4Bx4tPYW61Th47
 nYwm8c4aVFJaUN7EiXcIvMg/QTAVKaF0Nh2eICAeFrQVsgYDnTcSBJmxZKER+dgCwgOu
 CYD08qsRlqwi5/HOFP26pjcwU+iGC8vDxCyVJB8paufrs13OZXiE79yGyUE1wXCuaS/b
 wFKw==
X-Gm-Message-State: AOAM533M/u1jkh+RbNcSHAyrbCf3TgTiYWyjXmVYGq6tlCJ0TeRJXQHg
 JWdhl4+aFvecJTn+R+D+1x402ohvwhG1IoqBE5WH0A==
X-Google-Smtp-Source: ABdhPJyNOzSed27Zu7ufok5duW8/CG9ZheVQDwJzLzfD9p+OfUtrxr2yrgGQaTWN4V9ST4bKNxIXHBAdi5rwGWnoSzk=
X-Received: by 2002:a1c:a344:: with SMTP id m65mr14306053wme.32.1635941977972; 
 Wed, 03 Nov 2021 05:19:37 -0700 (PDT)
MIME-Version: 1.0
References: <CAFEAcA9ha4G=AC3p9LKJRC87DkgHVqbrX3X8RPg7vVR_F1Kt1Q@mail.gmail.com>
 <CABgObfaXJZ1E5593HHMEyhXHVKNu85=KSOhg7VXbt93cKA8fvg@mail.gmail.com>
In-Reply-To: <CABgObfaXJZ1E5593HHMEyhXHVKNu85=KSOhg7VXbt93cKA8fvg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 3 Nov 2021 12:19:26 +0000
Message-ID: <CAFEAcA9KF1437LXv+icrizZYcDiNZPn4KRMd0r7rEZWtDKxjpA@mail.gmail.com>
Subject: Re: more bogus meson warnings
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 3 Nov 2021 at 08:01, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On Tue, Nov 2, 2021 at 2:38 PM Peter Maydell <peter.maydell@linaro.org> w=
rote:
> > I tried my static-system build config today; meson bogus
> > complaints include:
> >
> > WARNING: Static library 'pulse' not found for dependency 'libpulse',
> > may not be statically linked
> > WARNING: Static library 'pulsecommon-11.1' not found for dependency
> > 'libpulse', may not be statically linked
> > WARNING: Static library 'asound' not found for dependency 'alsa', may
> > not be statically linked
> > WARNING: Static library 'spice-server' not found for dependency
> > 'spice-server', may not be statically linked
> > WARNING: Static library 'cacard' not found for dependency 'libcacard',
> > may not be statically linked
> >
> > We asked for static linking, this should result in
> > "OK, no static library present, ignore optional feature",
> > not "decide we found the library and emit a warning message".
>
> I think I explained this already, but what happens is that:
>
> 1) Meson retrieves the flags from pkg-config. It sanity checks the -l
> flags, and cannot find the library. It prints a warning because maybe
> it's looking in the wrong places, the path to the library might be
> provided by --extra-ldflags or another place that is not in gcc
> --print-search-dirs.
>
> 2) Therefore the root cause is that a .pc file is present but not
> suitable for static linking. With the test in configure, the problem
> would still be there, except it would not be detected and would just
> break at the time of the final link.

This is not my experience. I find that:
 * test in configure: configure doesn't enable the thing
 * test in meson: meson produces a WARNING, but goes ahead anyway,
   and then the final link fails

> So, in general, you _already_ have an improvement over what was there bef=
ore.

Well, in practice what happened was that before the recent changes
configure correctly didn't put dynamic libraries into the link line,
and so my configure options resulted in a successful build.
After these recent changes to move stuff from configure to meson,
meson is putting dynamic libraries into the link line, and the
build fails until I add extra --disable-foo to the configure arguments.
This is not what I would consider an improvement.

> For the specific case of Spice, you didn't need a separate
> --disable-spice argument because Spice did have a "compile a test
> program" step in configure, unlike basically every other $pkg_config
> invocation. Marc-Andr=C3=A9 didn't bring it over to Meson, and that was
> fine with me because (IMO) this kind of slight difference between one
> dependency and all the others is just a maintenance hassle.
>
> > Has header "snappy-c.h" : YES
> > Library snappy found: YES
> > ../../meson.build:1141: WARNING: could not link libsnappy, disabling
> > Has header "lzo/lzo1x.h" : YES
> > Library lzo2 found: YES
> > ../../meson.build:1158: WARNING: could not link liblzo2, disabling
> >
> > meson should just decide it doesn't have snappy and lzo2,
> > without emitting the warning.
>
> These are two different tests:
>
> - the "header present" and "library present" tests are done with cc.find_=
library
>
> - the "does a basic program" link is done with cc.links.
>
> The warning is emitted in the case where the files are present but the
> test program fails. Of course, Meson doesn't have a crystal ball for
> the cc.links test when it says that the static lzo2 library is there
> (apparently it is).

They're two tests under the hood, but they both need to pass
for us to be able to use the feature. If they don't both pass,
then meson should just quietly say "OK, we don't have this thing"
(ie it could print a "Something or other: NO" line, but it should
not be printing a "WARNING" line).

> I have tried "../configure --without-default-features --enable-snappy
> --static" and it correctly fails with "../meson.build:1110:2: ERROR: C
> static library 'snappy' not found". Likewise, "../configure --static"
> prints dozen of warnings of the previous kind for missing static
> libraries in pkg-config files; for snappy, however, it correctly
> prints
>
> Has header "snappy-c.h" : YES
> Library snappy found: NO
>
> without any warning. If you send me your config-host.mak and
> meson-logs/meson-log.txt I can check what's going on here. If you
> would like a different wording such as "could not link liblzo2 test
> program, disabling", that can be done too, of course.

I just want meson to follow the convention that we have had for
years, which is:
 * if I say --enable-foo, then failing to find foo should be an
   error
 * if I say --disable-foo, then don't probe for foo at all
 * if I say nothing, then probe for the various things we need to
   enable the foo feature, and if they're not presentor not usable
   for some reason then just quietly don't enable the foo option

I specifically do *not* want meson to print anything saying
"WARNING" for case 3, because this should be a fairly normal
state of affairs.

thanks
-- PMM

