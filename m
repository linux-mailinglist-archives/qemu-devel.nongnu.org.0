Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE2B156486
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Feb 2020 14:23:22 +0100 (CET)
Received: from localhost ([::1]:41606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j0Q4v-0008C2-8Y
	for lists+qemu-devel@lfdr.de; Sat, 08 Feb 2020 08:23:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44671)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j0Q3z-0007Oy-L0
 for qemu-devel@nongnu.org; Sat, 08 Feb 2020 08:22:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j0Q3y-0006vF-EV
 for qemu-devel@nongnu.org; Sat, 08 Feb 2020 08:22:23 -0500
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:33665)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j0Q3y-0006uS-9P
 for qemu-devel@nongnu.org; Sat, 08 Feb 2020 08:22:22 -0500
Received: by mail-oi1-x242.google.com with SMTP id q81so4900337oig.0
 for <qemu-devel@nongnu.org>; Sat, 08 Feb 2020 05:22:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AFAOlbPksSja/vJVHbGKtGB18UZyL1WZ/O7jiR2iSqw=;
 b=nf9VkB9K8TMNhUY70zzzf4KaCCF9GkBtsgGY2E48U+4wCgbsx4S95zU/+zJrZzBElb
 vlip+wjQb281DMJ9Ut0jzd7wOMJ1/8Z9tkfk7o28uyXLWkyM3KGqcErBz0S+BNG422Wo
 yHfXmQqMbv12LGRowrpNn32LYauPFmQYLFCS3OeWP658/w1USFRoytvF24lBccIoOJbZ
 ixCVGctmWMKc1KtIFHiZ84Ye50YubdlSMrE8Bf4HGnUAliaGOLl42vQlov/+OVKabu0L
 2tTrexKh4Kl7Rk+Og2J6C3f8LAV6o1F25WtgXJvUF8yVK/Q26H36kuEw0N3U9Oklr5KP
 1oTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AFAOlbPksSja/vJVHbGKtGB18UZyL1WZ/O7jiR2iSqw=;
 b=aQ9p4ksI08gKcFvZu8w0ixsrwaQMSyj39D1UDt9wY/X6I4lUaZ97bGWXEpFw2WE+K2
 Fs5rWM3GsBq+lYzaJj0vK0z8dTPY41YImS2ZU9ZKRXo/oQT3EMfLOuLwABHaN+daqsGK
 03Eo/5cVotVf+DzmGHLLtoHElGiht8npOkAPrVCA6P2qJdaGH2ArK4bVHG2PAV8Z23L5
 mZWr2YMbdNbl/Vr+v1h3hzlstQ1mUk189iHijNp5tODgH80sV7WV15IQfT0jsipvPLT9
 EuRt7upV1s1sfleaNwz4TpWTQlNyt8CKqbYiur53C3671en1oC/wJc7OF7GEJ3eCvbA4
 UylA==
X-Gm-Message-State: APjAAAWAxsTDddx9Es1XhCt6mYgI5vLV2GLOnj/KUpjsiayTWnrAv/fW
 vsTYrY2R001PoPQj526TB/W8nDhLwcUzVXLLvvnOqw==
X-Google-Smtp-Source: APXvYqyTCdazRXEerxhiJVDVeIHZyRJlZEHtyXbldt5KpzJuz8RIHafNhuMwRWbqhGCXjN/WbniJJL5+2aHdqojlZRk=
X-Received: by 2002:a54:4f16:: with SMTP id e22mr5502732oiy.170.1581168141247; 
 Sat, 08 Feb 2020 05:22:21 -0800 (PST)
MIME-Version: 1.0
References: <20200206173040.17337-1-peter.maydell@linaro.org>
 <20200206173040.17337-9-peter.maydell@linaro.org>
 <87pnequ4og.fsf@dusky.pond.sub.org>
 <20200207102433.GC6031@linux.fritz.box>
 <CAFEAcA9a8G=RQASBxQGLMBU32w+G7un-xQwOHv4y56W1TQftPQ@mail.gmail.com>
 <87zhdupiem.fsf@dusky.pond.sub.org>
 <CAFEAcA9sxz0i2MKoaM+9RPp=4MVA8j8EEZ1yDDnCiU3Sn8ggJA@mail.gmail.com>
 <878sldldk4.fsf@dusky.pond.sub.org>
In-Reply-To: <878sldldk4.fsf@dusky.pond.sub.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 8 Feb 2020 13:22:10 +0000
Message-ID: <CAFEAcA8gctqE27mC8hW2PB-OHSRZbt+Jod0qGbSgJewMbWocOw@mail.gmail.com>
Subject: Re: [PATCH 08/29] qapi: Use ':' after @argument in doc comments
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::242
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 8 Feb 2020 at 07:54, Markus Armbruster <armbru@redhat.com> wrote:
> Peter Maydell <peter.maydell@linaro.org> writes:

> > Conveniently this patchset already supports this format :-)
> > You can write either
> >
> > # @foo: bar
> > #       baz
> > #         indented
> >
> > or
> > # @foo:
> > # bar
> > # baz
> > #   indented
> >
> > and they'll come out to the same thing (the parser.py code
> > sends the same doc strings to the rST visitor).
>
> If we enforce the second format in the QAPI schema parser, we save
> ourselves the trouble of normalizing the first format to the second one.
> We also promote more uniform style.

You also end up requiring
# @foo:
# A short one-line description.

because it's the first style that makes this valid syntax:
# @foo: A short one-line description

And you're suggesting a big upheaval in doc comment style, because
lots of the existing doc comment syntax uses the first version.
I would really strongly prefer to not have "convert to supporting rST"
also mean "and we have to touch every single JSON doc comment
to convert away from a commonly used style that nobody has
complained about in the past, which doesn't compromise the ability
to include rST markup in the doc comment, and which was easy to
support in the doc generator". This patchset is already quite large
and has a lot of updates to QAPI doc comments. The one that makes
the widest set of changes (patch 9/29) is bigger than I'd like and I think
an important thing that makes it viable is that you can check with
git show that it really is just changing whitespace, not even line breaks.
Some of the style changes you're proposing would be much harder
to verify as safe and touch much more of the JSON. If you'd like
to do those I have no objection, but I really really don't want to
tangle that up with the already large amount of work involved
in transitioning away from texi to rST.

thanks
-- PMM

