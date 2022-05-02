Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6963D51712A
	for <lists+qemu-devel@lfdr.de>; Mon,  2 May 2022 16:03:25 +0200 (CEST)
Received: from localhost ([::1]:54200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlWe3-00059m-Um
	for lists+qemu-devel@lfdr.de; Mon, 02 May 2022 10:03:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1nlWcc-0003p5-Fa
 for qemu-devel@nongnu.org; Mon, 02 May 2022 10:01:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37039)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1nlWcY-0005zW-8l
 for qemu-devel@nongnu.org; Mon, 02 May 2022 10:01:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651500108;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pB9UI9muN3WqC+S7nuykIViYVhl6985BQ0y4LGd1xA8=;
 b=hbZ0AQ4axprMgtN8Yf1MGlMQHUXbu/TK0cXATWhH7ogNEX8oFuBiwHxN6qR2txxecG1Lbn
 qK/N7LiQq8QlD17bnceHUhUgk3FPGQlylE6eznGmSzWTQW2Z1MR4aAvTz/yhxC5/0GozGS
 Cpd4ApYOSsx3r4aP9tcd0d8uNv3qcWg=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-118-qteDj58ePXWrfzDz3qz3nQ-1; Mon, 02 May 2022 10:01:46 -0400
X-MC-Unique: qteDj58ePXWrfzDz3qz3nQ-1
Received: by mail-yw1-f197.google.com with SMTP id
 00721157ae682-2f902276272so28004267b3.21
 for <qemu-devel@nongnu.org>; Mon, 02 May 2022 07:01:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:references:mime-version:in-reply-to:date
 :message-id:subject:to:cc;
 bh=pB9UI9muN3WqC+S7nuykIViYVhl6985BQ0y4LGd1xA8=;
 b=1JRUvFyyytzUcVUAdiVd9ZvEculafubvnEMeCF8Qk9ouqyWPiZdSjkaenHP1naOafi
 Fg0/QjiGKT+0/jDB11k/zA2/GF6ylxPWIqvdpxoZaQcW+1PefDje0ipDM8pvZLhyNg5I
 huyhqWF5Vdk/cnN6sx4HcHALjwJObUEDc8bNw2jFZKSj5cHiAHrfj6hQGHvlSQ/Yuaxs
 O795Wy9oCKtMNESmWtwi8KG9apG/H83v5wNBRdqATUaUP5nMD+C7/ftaYgtunsUD2IVB
 xdpmDDOmP31oEolDhdX0vT7LnJmUZjcMJlZlxuXVIRzRDFVj91ip7Mijuabqb8HSxhRZ
 jlmw==
X-Gm-Message-State: AOAM53169rBh6ZCO0FJn14XzCNCGrbVwK0lWs8fT39bMJ/GCGOmLQ64y
 FTfP+FVkHR6IQiE94qO8BYX/jAYk799VUP7SAUC4Ejncc7ZUY+BiPut1GlnOD6s7xFxxhRg5Sy0
 eVs/ZJ2EhpbXaTWmL8gCZO3xGMUEGwo4=
X-Received: by 2002:a25:bb4a:0:b0:633:92a6:c35 with SMTP id
 b10-20020a25bb4a000000b0063392a60c35mr10038915ybk.121.1651500102526; 
 Mon, 02 May 2022 07:01:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzve/UXCd8MPMxvQKYQ3a2aK081l3Ze0Vg+tcDCJByDd0j36yR3B6YwRXBx+LHuYRTs2pCK7jXQc7RA2tbf4rY=
X-Received: by 2002:a25:bb4a:0:b0:633:92a6:c35 with SMTP id
 b10-20020a25bb4a000000b0063392a60c35mr10038891ybk.121.1651500102274; Mon, 02
 May 2022 07:01:42 -0700 (PDT)
Received: from 744723338238 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 2 May 2022 10:01:41 -0400
From: Andrea Bolognani <abologna@redhat.com>
References: <20220401224104.145961-1-victortoso@redhat.com>
 <CABJz62PBHFqUyBNtwd_K6pra9_zOz9Ps56JOsNZL8XHf2u35Uw@mail.gmail.com>
 <87a6c52u68.fsf@pond.sub.org>
 <CABJz62NaEgEzEkvdYbNZ5qfkx_gAYfnxt_YbQhGyD08gRH6EYg@mail.gmail.com>
 <87v8uos8lb.fsf@pond.sub.org>
 <CABJz62MTVhDHZo5+sTJKm5b+SZM_W+_o5VmMgx0NVyibYfs=hw@mail.gmail.com>
 <875ymop374.fsf@pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <875ymop374.fsf@pond.sub.org>
Date: Mon, 2 May 2022 10:01:41 -0400
Message-ID: <CABJz62OsaZo0hJB=ucereGDOHbK-5Ym4ASqhgVePJr65JRu0gQ@mail.gmail.com>
Subject: Re: [RFC PATCH v1 0/8] qapi: add generator for Golang interface
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=abologna@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, John Snow <jsnow@redhat.com>,
 Victor Toso <victortoso@redhat.com>, qemu-devel@nongnu.org,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, May 02, 2022 at 01:46:23PM +0200, Markus Armbruster wrote:
> Andrea Bolognani <abologna@redhat.com> writes:
> >> > The wire protocol would still retain the unappealing name, but at
> >> > least client libraries could hide the uglyness from users.
> >>
> >> At the price of mild inconsistency between the library interface and
> >> QMP.
> >
> > That's fine, and in fact it already happens all the time when QAPI
> > names (log-append) are translated to C identifiers (log_append).
>
> There's a difference between trivial translations like "replace '-' by
> '_'" and arbitrary replacement like the one for enumeration constants
> involving 'prefix'.

Fair enough.

I still feel that 1) users of a language SDK will ideally not need to
look at the QAPI schema or wire chatter too often and 2) even when
that ends up being necessary, figuring out that LogAppend and
logappend are the same thing is not going to be an unreasonable
hurdle, especially when the status quo would be to work with
Logappend instead.

> > The point is that, if we want to provide a language interface that
> > feels natural, we need a way to mark parts of a QAPI symbol's name in
> > a way that makes it possible for the generator to know they're
> > acronyms and treat them in an appropriate, language-specific manner.
>
> It's not just acronyms.  Consider IAmALittleTeapot.  If you can assume
> that only beginning of words are capitalized, even for acronyms, you can
> split this into words without trouble.  You can't recover correct case,
> though: "i am a little teapot" is wrong.

Is there any scenario in which we would care though? We're in the
business of translating identifiers from one machine representation
to another, so once it has been split up correctly into the words
that compose it (which in your example above it has) then we don't
really care about anything else unless acronyms are involved.

In other words, we can obtain the list of words "i am a little
teapot" programmatically both from IAmALittleTeapot and
i-am-a-little-teapot, and in both cases we can then generate
IAmALittleTeapot or I_AM_A_LITTLE_TEAPOT or i_am_a_little_teapot or
whatever is appropriate for the context and target language, but the
fact that in a proper English sentence "I" would have to be
capitalized doesn't really enter the picture.

> "Split before capital letter" falls apart when you have characters that
> cannot be capitalized: Point3d.
>
> Camel case is hopeless.

I would argue that it works quite well for most scenarios, but there
are some corner cases where it's clearly not good enough. If we can
define a way to clue in the generator about "Point3d" having to be
interpreted as "point 3d" and "VNCProps" as "vnc props", then we are
golden. That wouldn't be necessary for simple cases that are already
handled correctly.

A more radical idea would be to start using dash-notation for types
too. That'd remove the word splitting issue altogether, at the cost
of the schema being (possibly) harder to read and more distanced from
the generated code.

You'd still only be able to generate VncProps from vnc-props though.

> > The obvious way to implement this would be with an annotation along
> > the lines of the one I proposed. Other ideas?
>
> I'm afraid having the schema spell out names in multiple naming
> conventions could be onerous.  How many names will need it?

I don't have hard data on this. I could try extracting it, but that
might end up being a bigger job than I had anticipated.

My guess is that the number of cases where the naive algorithm can't
split words correctly is relatively small compared to the size of the
entire QAPI schema. Fair warning: I have made incorrect guesses in
the past ;)

> Times how many naming conventions?

Yeah, I don't think requiring all possible permutations to be spelled
out in the schema is the way to go. That's exactly why my proposal
was to offer a way to inject the semantic information that the parser
can't figure out itself.

Once you have a way to inform the generator that "VNCProps" is made
of the two words "vnc" and "props", and that "vnc" is an acronym,
then it can generate an identifier appropriate for the target
language without having to spell out anywhere that such an identifier
would be VNCProps for Go and VncProps for Rust.

By the way, while looking around I realized that we also have to take
into account things like D-Bus: the QAPI type ChardevDBus, for
example, would probably translate verbatim to Go but have to be
changed to ChardevDbus for Rust. Fun :)

Revised proposal for the annotation:

  ns:word-WORD-WoRD-123Word

Words are always separated by dashes; "regular" words are entirely
lowercase, while the presence of even a single uppercase letter in a
word denotes the fact that its case should be preserved when the
naming conventions of the target language allow that.

> Another issue: the fancier the translation from schema name to
> language-specific name gets, the harder it becomes to find one from the
> other.

That's true, but at least to me the trade-off feels reasonable.

-- 
Andrea Bolognani / Red Hat / Virtualization


