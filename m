Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8399A4BE9C0
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 19:08:15 +0100 (CET)
Received: from localhost ([::1]:48948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMD6c-0005ht-5L
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 13:08:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nMD4w-00050f-0G
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 13:06:31 -0500
Received: from [2607:f8b0:4864:20::112b] (port=35712
 helo=mail-yw1-x112b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nMD4t-0006WA-Ne
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 13:06:29 -0500
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-2d07ae0b1c0so147143007b3.2
 for <qemu-devel@nongnu.org>; Mon, 21 Feb 2022 10:06:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1u4jol2QhctaDktmPmMeqFxLQ0MQw6GhG4sSDdjgD0o=;
 b=clrS+1P9MF08WtA358FVqzcWJW1FF/BEwJBUq8QdK14PDNUEXlT6aTSo+i358x1bVy
 qmLnM5LFDFz/B7L2OdW26gww4+wZ91MY7RmaODkv0F2trynnU3QwJdu7PFBnoaCR6uuk
 QR3sCkUYhdX3q+wrIOSBWC+Mr0bx+vFEDXFS20/f4+nu4muld5P93PRS1rhpO9wQY5p+
 xF3vdMbRPw1FwZRZ55zNITMPRLxmNbLXP67PoSsVVqh5kCU61Z8y0gQG6MW0HtpLHYHh
 JEUUBLavhQKkAU6usbIDlZLrVWbGUMI4S9XMXJevDJXF3Sy7dyTy0Wg5JHkcLeDpdCDu
 RTOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1u4jol2QhctaDktmPmMeqFxLQ0MQw6GhG4sSDdjgD0o=;
 b=wNc9dLFyJywlYo6u8wXCmGtP6N27yOMR/eem5dfeSpiccM1WmD/zs2j+vP8tcmdUph
 2pw88hJih2h+YjA3NWCAJwspMhe/zNSpC5fktr7zQP8NDWE7O9LtkD6Mff8GSQPEAoJW
 Liz5gR3unLQp4nMFwQUid/maP9D+KB94OsQaYL/yzX5c+NSKz7GYcB0EtXEx9dCXfrov
 9BJEvoeRhNpfXDm/F7PKvI6a55n4cugBZ3z+KPgn617t/DFhUsQnrBNMoP/LpL6R1eku
 zheq6LmI0rxq//psXLbDHEdyXysJhvvnjcG5UjfDK1s+XdJCJMyBPHSf8JR03dCBnKk+
 fgfA==
X-Gm-Message-State: AOAM533mrwZIu/Y5sKlC2h4EqsZx9EDngdWQLZXUkSxcTW2vjMdkg4e/
 qWCNbtwwRgZghiW4pkKSss3QOpo8oV4qS5mCAJMLWQ==
X-Google-Smtp-Source: ABdhPJyd5aFDUu6jWxAUA1v69gNkdCKKKiHDVTM/L+xpx6foihWMDXczEpw/TKOg/svSoYQXYLD/DEB9a7Md6Se0f3I=
X-Received: by 2002:a81:1006:0:b0:2d6:e14a:ca72 with SMTP id
 6-20020a811006000000b002d6e14aca72mr12909624ywq.455.1645466786048; Mon, 21
 Feb 2022 10:06:26 -0800 (PST)
MIME-Version: 1.0
References: <20210924140142.31398-1-peter.maydell@linaro.org>
 <87v92pksln.fsf@dusky.pond.sub.org>
In-Reply-To: <87v92pksln.fsf@dusky.pond.sub.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 21 Feb 2022 18:06:15 +0000
Message-ID: <CAFEAcA-zXMxzBeEPpKYNGy+SSMgkhbLC-aTuYgSXQn7D=WJa2A@mail.gmail.com>
Subject: Re: [PATCH 0/2] qapi: Move RTC_CHANGE back out of target schema
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::112b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Greg Kurz <groug@kaod.org>,
 qemu-devel@nongnu.org, Eric Auger <eric.auger@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 25 Sept 2021 at 08:44, Markus Armbruster <armbru@redhat.com> wrote:
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > This patchset moves RTC_CHANGE back to misc.json, effectively
> > reverting commit 183e4281a30962, which moved the RTC_CHANGE event to
> > the target schema.  That change was an attempt to make the event
> > target-specific to improve introspection, but the event isn't really
> > target-specific: it's machine or device specific.  Putting RTC_CHANGE
> > in the target schema with an ifdef list reduces maintainability (by
> > adding an if: list with a long list of targets that needs to be
> > manually updated as architectures are added or removed or as new
> > devices gain the RTC_CHANGE functionality) and increases compile time
> > (by preventing RTC devices which emit the event from being "compile
> > once" rather than "compile once per target", because
> > qapi-events-misc-target.h uses TARGET_* ifdefs, which are poisoned in
> > "compile once" files.)
> >
> > Patch 2 fixes a minor documentation issue that I noticed while
> > I was doing this -- we didn't document that the units used in
> > the RTC_CHANGE event are seconds.
>
> Series
> Reviewed-by: Markus Armbruster <armbru@redhat.com>

I realized that this patchset never got applied -- I think I was
expecting it to be picked up via a QAPI related tree, and then
it was a bit close to a release to be put in, or something.
Anyway, I'm going to resend it in a moment.

> An additional patch documenting that not all RTCs implement RTC_CHANGE
> would be nice.  Listing them would be even nicer.

I disagree that listing them would be nice -- the whole point of
the series is to avoid having lists that get out of date when we
add a new RTC implementation or fix the missing-feature in an
existing one. I can add a sentence to the patch 2 docs change:
"Note that it is not guaranteed that the RTC in a system implements
this event, or even that the system has an RTC at all."

> An additional patch adding @qom-path event argument would be nice.

I don't understand what this would involve, so I'll leave it to you
if you want it.

thanks
-- PMM

